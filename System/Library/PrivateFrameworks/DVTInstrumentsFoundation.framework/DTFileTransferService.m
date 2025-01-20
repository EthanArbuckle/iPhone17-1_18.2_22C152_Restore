@interface DTFileTransferService
+ (void)registerCapabilities:(id)a3;
- (BOOL)_fileTransfer:(id)a3 isValidForApplication:(id)a4;
- (BOOL)_unarchivePackageIfNecessary:(id)a3;
- (DTFileTransferService)initWithChannel:(id)a3;
- (id)_beginTransferOfFileNamed:(id)a3 outError:(id *)a4;
- (id)_moveFileTransfer:(id)a3 inDataContainerOfApplicationBundleIdentifier:(id)a4 withError:(id *)a5;
- (id)_moveFileTransfer:(id)a3 toDebugInboxOfApplicationWithBundleIdentifier:(id)a4 outError:(id *)a5;
- (id)openFileInDocumentDebugInbox:(id)a3 forApplicationWithBundleIdentifier:(id)a4 withAnnotation:(id)a5;
- (id)transferData:(id)a3 intoAppContainerForBundleIdentifier:(id)a4 filename:(id)a5;
- (id)transferFile:(id)a3 toDebugInboxOfApplicationWithBundleIdentifier:(id)a4 destinationFilename:(id)a5;
@end

@implementation DTFileTransferService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.instruments.server.services.filetransfer" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.instruments.server.services.filetransfer.debuginbox" withVersion:1 forClass:a1];
}

- (DTFileTransferService)initWithChannel:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DTFileTransferService;
  v3 = [(DTXService *)&v12 initWithChannel:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("File transfer service coordination queue", 0);
    coordinationQueue = v3->_coordinationQueue;
    v3->_coordinationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    activeFileTransfers = v3->_activeFileTransfers;
    v3->_activeFileTransfers = (NSMutableArray *)v6;

    v8 = [(DTXService *)v3 channel];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_2308EF708;
    v10[3] = &unk_264B8D590;
    v11 = v3;
    [v8 registerDisconnectHandler:v10];
  }
  return v3;
}

- (id)transferFile:(id)a3 toDebugInboxOfApplicationWithBundleIdentifier:(id)a4 destinationFilename:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  if (v9 && (uint64_t v12 = [v9 length], v10) && v8 && v12 && [v10 length])
  {
    id v27 = 0;
    v13 = [(DTFileTransferService *)self _beginTransferOfFileNamed:v10 outError:&v27];
    id v14 = v27;
    if (v13)
    {
      v15 = [v13 writeHandle];
      [v15 writeData:v8];

      [v13 closeFileTransfer];
      coordinationQueue = self->_coordinationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2308EFEC0;
      block[3] = &unk_264B8EF28;
      block[4] = self;
      id v24 = v13;
      id v17 = v11;
      id v25 = v17;
      id v26 = v9;
      dispatch_async(coordinationQueue, block);
      id v18 = v17;
    }
    else
    {
      [v11 invokeCompletionWithReturnValue:v14 error:v14];
      id v22 = v11;
    }
  }
  else
  {
    v19 = sub_2308EFA98(1);
    [v11 invokeCompletionWithReturnValue:0 error:v19];
    id v20 = v11;
  }
  return v11;
}

- (id)openFileInDocumentDebugInbox:(id)a3 forApplicationWithBundleIdentifier:(id)a4 withAnnotation:(id)a5
{
  v49[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  if (!v7 || (uint64_t v11 = [v7 length], !v8) || !v11 || ![v8 length])
  {
    v23 = sub_2308EFA98(1);
    [v10 invokeCompletionWithReturnValue:v23 error:v23];
    id v24 = v10;

    goto LABEL_14;
  }
  if (([v8 isEqualToString:@"com.apple.Playgrounds"] & 1) == 0)
  {
    [v10 invokeCompletionWithReturnValue:0 error:0];
    id v26 = v10;
    goto LABEL_14;
  }
  id v47 = 0;
  uint64_t v12 = [MEMORY[0x263F01878] bundleRecordWithBundleIdentifier:v8 allowPlaceholder:1 error:&v47];
  id v13 = v47;
  if (v12)
  {
    id v14 = sub_2308F03BC(v12);
    BOOL v15 = sub_2308F0420(v14);
    v16 = [v14 URLByAppendingPathComponent:@"Debug" isDirectory:1];

    BOOL v17 = sub_2308F0420(v16);
    if (!v16 || !v15 || !v17)
    {
      uint64_t v28 = sub_2308EFA98(5);

      [v10 invokeCompletionWithReturnValue:v28 error:v28];
      id v29 = v10;
      id v13 = (id)v28;
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v18 = sub_2308F049C(v7);

    v19 = [v16 URLByAppendingPathComponent:v18 isDirectory:0];
    memset(&v46, 0, sizeof(v46));
    id v20 = [v19 path];
    if (lstat((const char *)[v20 fileSystemRepresentation], &v46))
    {
    }
    else
    {
      int v30 = v46.st_mode & 0xF000;

      if (v30 == 0x4000 || v30 == 0x8000)
      {
        uint64_t v41 = v18;
        if (v9)
        {
          v31 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v9];
        }
        else
        {
          v31 = objc_opt_new();
        }
        uint64_t v32 = MEMORY[0x263EFFA88];
        v33 = v31;
        v43 = v31;
        [v31 setObject:MEMORY[0x263EFFA88] forKey:@"DTFileTransferServiceOriginatedKey"];
        uint64_t v34 = *MEMORY[0x263F3F5E0];
        v48[0] = *MEMORY[0x263F3F5E8];
        v48[1] = v34;
        v49[0] = v32;
        v49[1] = v19;
        v48[2] = *MEMORY[0x263F3F5C8];
        v49[2] = v33;
        v42 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
        v35 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
        [v12 bundleIdentifier];
        v36 = v40 = v19;
        v37 = [MEMORY[0x263F3F778] optionsWithDictionary:v42];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = sub_2308F0530;
        v44[3] = &unk_264B8FCA0;
        id v38 = v10;
        id v45 = v38;
        [v35 openApplication:v36 withOptions:v37 completion:v44];

        v19 = v40;
        id v39 = v38;

        uint64_t v18 = v41;
        goto LABEL_26;
      }
    }
    uint64_t v21 = sub_2308EFA98(7);

    [v10 invokeCompletionWithReturnValue:v21 error:v21];
    id v22 = v10;
    id v13 = (id)v21;
LABEL_26:

    id v7 = (id)v18;
    goto LABEL_27;
  }
  [v10 invokeCompletionWithReturnValue:v13 error:v13];
  id v27 = v10;
LABEL_28:

LABEL_14:
  return v10;
}

- (id)transferData:(id)a3 intoAppContainerForBundleIdentifier:(id)a4 filename:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = sub_2308F0974();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = [v9 UTF8String];
    *(_WORD *)&buf[22] = 2080;
    uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t))[v10 UTF8String];
    _os_log_impl(&dword_23087D000, v12, OS_LOG_TYPE_INFO, "transferData:%p intoAppContainerForBundleIdentifier:%s withFileName: %s", buf, 0x20u);
  }

  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v13 = [v9 length];
  if (!v10 || !v8 || !v13 || ![v10 length]) {
    goto LABEL_16;
  }
  if ([v10 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v30 = sub_2308F0974();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_23093E444(v10);
    }

LABEL_16:
    sub_2308EFA98(1);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    [v11 invokeCompletionWithReturnValue:0 error:v19];
    id v31 = v11;
    goto LABEL_17;
  }
  id v14 = NSString;
  BOOL v15 = [MEMORY[0x263F08C38] UUID];
  v16 = [v15 UUIDString];
  uint64_t v17 = [v14 stringWithFormat:@"%@-%@", v16, v10];

  id v39 = 0;
  uint64_t v18 = [(DTFileTransferService *)self _beginTransferOfFileNamed:v17 outError:&v39];
  id v19 = v39;
  if (v18)
  {
    id v20 = [v18 writeHandle];
    [v20 writeData:v8];

    [v18 closeFileTransfer];
    uint64_t v21 = sub_2308F0974();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v18 destinationDirectoryURLToRemoveOnDealloc];
      id v23 = [v22 absoluteString];
      uint64_t v24 = [v23 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v24;
      _os_log_impl(&dword_23087D000, v21, OS_LOG_TYPE_INFO, "File transfer successfully staged. %s", buf, 0xCu);
    }
    id v25 = [v18 destinationURL];
    id v26 = [v25 path];
    sub_2308F09C8((const char *)[v26 fileSystemRepresentation]);

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v41 = sub_2308F0A0C;
    v42 = sub_2308F0A1C;
    id v43 = 0;
    coordinationQueue = self->_coordinationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2308F0A24;
    block[3] = &unk_264B8FCC8;
    id v38 = buf;
    block[4] = self;
    id v35 = v18;
    id v36 = v9;
    id v28 = v11;
    id v37 = v28;
    dispatch_sync(coordinationQueue, block);
    id v29 = v28;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [v11 invokeCompletionWithReturnValue:0 error:v19];
    id v33 = v11;
  }

  id v10 = (id)v17;
LABEL_17:

  return v11;
}

- (BOOL)_fileTransfer:(id)a3 isValidForApplication:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x263F018A8];
  id v7 = [a3 destinationURL];
  id v8 = [v6 documentProxyForURL:v7];

  if (!v8) {
    [MEMORY[0x263EFF940] raise:@"DTFileTransferServiceNoDefaultApplicationException" format:@"Unable to resolve default application for file in DTFileTransferService"];
  }
  [v8 availableClaimBindingsReturningError:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) bundleRecord:v16];
        char v14 = [v13 isEqual:v5];

        if (v14)
        {
          LOBYTE(v10) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v10;
}

- (id)_beginTransferOfFileNamed:(id)a3 outError:(id *)a4
{
  id v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  id v7 = [v5 defaultManager];
  id v8 = [MEMORY[0x263F08C38] UUID];
  id v9 = [v8 UUIDString];

  uint64_t v10 = [NSURL fileURLWithPath:@"/var/mobile/tmp"];
  uint64_t v11 = sub_2308F0FAC(v10, @"DTFileTransferService", 1);
  uint64_t v12 = sub_2308F0FAC(v11, (uint64_t)v9, 0);

  id v13 = v12;
  char v14 = sub_2308F049C(v6);

  BOOL v15 = [v13 URLByAppendingPathComponent:v14 isDirectory:0];

  [v15 path];
  id v16 = objc_claimAutoreleasedReturnValue();
  int v17 = lstat((const char *)[v16 fileSystemRepresentation], &v24);

  if (v17) {
    id v18 = v15;
  }
  else {
    id v18 = 0;
  }

  if (v13
    && v18
    && ([v7 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:0] & 1) != 0
    && ([v18 path],
        long long v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v7 createFileAtPath:v19 contents:0 attributes:0],
        v19,
        (v20 & 1) != 0))
  {
    uint64_t v21 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v18 error:0];
    if (v21)
    {
      id v22 = objc_opt_new();
      [v22 setDestinationURL:v18];
      [v22 setDestinationDirectoryURLToRemoveOnDealloc:v13];
      [v22 setWriteHandle:v21];
    }
    else if (a4)
    {
      sub_2308EFA98(2);
      id v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = 0;
    }
  }
  else if (a4)
  {
    sub_2308EFA98(2);
    id v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)_moveFileTransfer:(id)a3 toDebugInboxOfApplicationWithBundleIdentifier:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:@"com.apple.Playgrounds"])
  {
    id v24 = 0;
    uint64_t v10 = [MEMORY[0x263F01878] bundleRecordWithBundleIdentifier:v9 allowPlaceholder:1 error:&v24];
    id v11 = v24;
    uint64_t v12 = v11;
    if (v10)
    {
      if ([(DTFileTransferService *)self _fileTransfer:v8 isValidForApplication:v10])
      {
        id v13 = sub_2308F03BC(v10);
        if (v13)
        {
          char v14 = v13;
          if (!sub_2308F1300(v13, 1))
          {
            if (a5)
            {
              sub_2308EFA98(6);
              id v20 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v20 = 0;
            }
            BOOL v15 = v14;
            goto LABEL_33;
          }
          BOOL v15 = [v14 URLByAppendingPathComponent:@"Debug" isDirectory:1];

          if (sub_2308F1300(v15, 1))
          {
            id v16 = [v8 destinationURL];
            int v17 = [v16 lastPathComponent];
            id v18 = [v15 URLByAppendingPathComponent:v17 isDirectory:0];

            long long v19 = sub_2308F13B8(v8, v18, 1);

            if (v19)
            {
              id v20 = v18;
            }
            else if (a5)
            {
              sub_2308EFA98(6);
              id v20 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v20 = 0;
            }

            goto LABEL_33;
          }
          if (a5)
          {
            sub_2308EFA98(6);
            id v22 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_24;
          }
        }
        else
        {
          if (a5)
          {
            sub_2308EFA98(6);
            id v22 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v15 = 0;
LABEL_24:
            id v20 = 0;
            *a5 = v22;
LABEL_33:

            goto LABEL_34;
          }
          BOOL v15 = 0;
        }
        id v20 = 0;
        goto LABEL_33;
      }
      if (a5)
      {
        sub_2308EFA98(5);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else if (a5)
    {
      id v21 = v11;
LABEL_16:
      id v20 = 0;
      *a5 = v21;
LABEL_34:

      goto LABEL_35;
    }
    id v20 = 0;
    goto LABEL_34;
  }
  if (a5)
  {
    sub_2308EFA98(5);
    id v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = 0;
  }
LABEL_35:

  return v20;
}

- (id)_moveFileTransfer:(id)a3 inDataContainerOfApplicationBundleIdentifier:(id)a4 withError:(id *)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v37 = 0;
  id v9 = [MEMORY[0x263F01878] bundleRecordWithBundleIdentifier:v8 allowPlaceholder:1 error:&v37];
  id v10 = v37;
  id v11 = v10;
  if (v9)
  {
    id v12 = v10;
  }
  else
  {
    id v36 = v10;
    id v9 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v8 error:&v36];
    id v12 = v36;

    if (!v9)
    {
      id v33 = sub_2308F0974();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_23093E54C(v8);
      }

      if (a5)
      {
        id v32 = v12;
        id v12 = v32;
        id v9 = 0;
        goto LABEL_27;
      }
      id v9 = 0;
LABEL_34:
      id v23 = 0;
      goto LABEL_35;
    }
  }
  id v13 = [v9 dataContainerURL];
  char v14 = sub_2308F0974();
  BOOL v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_23093E5C8(v8);
    }

    if (a5)
    {
      sub_2308EFA98(6);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
      id v23 = 0;
LABEL_30:
      id v31 = 0;
      *a5 = v32;
      goto LABEL_42;
    }
    goto LABEL_34;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v16 = [v13 path];
    uint64_t v17 = [v16 UTF8String];
    *(_DWORD *)buf = 136315138;
    uint64_t v39 = v17;
    _os_log_impl(&dword_23087D000, v15, OS_LOG_TYPE_INFO, "Checking for container at: %s", buf, 0xCu);
  }
  BOOL v18 = sub_2308F1300(v13, 0);
  long long v19 = sub_2308F0974();
  id v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v21 = [v13 path];
      uint64_t v22 = [v21 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v39 = v22;
      _os_log_impl(&dword_23087D000, v20, OS_LOG_TYPE_INFO, "Data container exists at: %s", buf, 0xCu);
    }
    id v23 = [v13 URLByAppendingPathComponent:@"/tmp"];

    if (sub_2308F1300(v23, 0))
    {
      id v24 = sub_2308F0974();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v23 path];
        uint64_t v26 = [v25 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v39 = v26;
        _os_log_impl(&dword_23087D000, v24, OS_LOG_TYPE_INFO, "Temp directory exists: %s", buf, 0xCu);
      }
      id v27 = [v7 destinationURL];
      id v28 = [v27 lastPathComponent];
      id v29 = [v23 URLByAppendingPathComponent:v28 isDirectory:0];

      int v30 = sub_2308F13B8(v7, v29, 0);

      if (v30)
      {
        id v31 = v29;
      }
      else
      {
        uint64_t v34 = sub_2308F0974();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_23093E644(v34);
        }

        if (a5)
        {
          sub_2308EFA98(6);
          id v31 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v31 = 0;
        }
      }

      goto LABEL_42;
    }
    if (a5)
    {
      sub_2308EFA98(6);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
LABEL_35:
    id v31 = 0;
    goto LABEL_42;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_23093E688(v20);
  }

  if (a5)
  {
    sub_2308EFA98(6);
    id v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v31 = 0;
  }
  id v23 = v13;
LABEL_42:

  return v31;
}

- (BOOL)_unarchivePackageIfNecessary:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a3;
  dispatch_queue_t v4 = [v3 destinationURL];
  id v5 = [v4 lastPathComponent];

  id v6 = [v5 pathExtension];
  id v7 = [v6 lowercaseString];
  int v8 = [v7 isEqualToString:@"zip"];

  if (!v8)
  {
    LOBYTE(v21) = 1;
    goto LABEL_28;
  }
  id v9 = [v5 stringByDeletingPathExtension];
  id v10 = [v9 pathExtension];
  if (!v10)
  {

    goto LABEL_10;
  }
  id v11 = v10;
  uint64_t v12 = [v10 length];

  if (!v12)
  {
LABEL_10:
    LOBYTE(v21) = 0;
    goto LABEL_28;
  }
  id v13 = [MEMORY[0x263F08C38] UUID];
  char v14 = [v13 UUIDString];

  BOOL v15 = [v3 destinationDirectoryURLToRemoveOnDealloc];
  id v16 = [v15 URLByAppendingPathComponent:v14 isDirectory:1];

  uint64_t v17 = [MEMORY[0x263F08850] defaultManager];
  id v49 = 0;
  int v18 = [v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v49];
  id v19 = v49;
  id v20 = v19;
  LOBYTE(v21) = 0;
  if (v18 && !v19)
  {
    uint64_t v22 = (void *)MEMORY[0x263F38CF0];
    id v23 = [v3 destinationURL];
    id v48 = 0;
    id v24 = (id)[v22 flatUnarchiveFileAtURL:v23 toURL:v16 error:&v48];
    id v25 = v48;

    if (v25)
    {
      id v20 = 0;
      LOBYTE(v21) = 0;
    }
    else
    {
      uint64_t v26 = [v5 stringByDeletingPathExtension];
      v42 = [v26 pathExtension];

      id v27 = [v16 path];
      id v47 = 0;
      id v28 = [v17 subpathsOfDirectoryAtPath:v27 error:&v47];
      id v20 = v47;

      LOBYTE(v21) = 0;
      if (v28 && !v20)
      {
        id v29 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (SELF beginswith[c] '__MACOSX' OR SELF contains '/.' OR SELF beginswith '.')"];
        int v30 = [v28 filteredArrayUsingPredicate:v29];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v28 = v30;
        uint64_t v21 = [v28 countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (v21)
        {
          uint64_t v40 = v14;
          uint64_t v41 = v16;
          uint64_t v39 = v17;
          uint64_t v31 = *(void *)v44;
          while (2)
          {
            id v32 = v28;
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v44 != v31) {
                objc_enumerationMutation(v32);
              }
              uint64_t v34 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              id v35 = [v34 pathExtension];
              uint64_t v36 = [v35 caseInsensitiveCompare:v42];

              if (!v36)
              {
                id v37 = [v41 URLByAppendingPathComponent:v34];
                [v3 setDestinationURL:v37];

                LOBYTE(v21) = 1;
                uint64_t v17 = v39;
                char v14 = v40;
                id v25 = 0;
                id v28 = v32;
                goto LABEL_23;
              }
            }
            id v28 = v32;
            uint64_t v21 = [v32 countByEnumeratingWithState:&v43 objects:v50 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          uint64_t v17 = v39;
          char v14 = v40;
          id v25 = 0;
LABEL_23:
          id v16 = v41;
        }
      }
    }
  }
LABEL_28:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFileTransfers, 0);
  objc_storeStrong((id *)&self->_coordinationQueue, 0);
}

@end