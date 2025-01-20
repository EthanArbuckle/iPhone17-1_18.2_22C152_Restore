@interface BLTSendQueueSerializer
- (BLTSendQueueSerializer)initWithUsesMessageIdentifiers:(BOOL)a3;
- (BOOL)handleFileURL:(id)a3 protobufHandler:(id)a4;
- (BOOL)usesMessageIdentifiers;
- (NSURL)sendFileURL;
- (void)add:(id)a3 type:(unsigned __int16)a4;
- (void)add:(id)a3 type:(unsigned __int16)a4 messageIdentifier:(id *)a5;
- (void)cleanup;
- (void)sendWithSender:(id)a3 timeout:(id)a4 responseHandlers:(id)a5 didSend:(id)a6 didQueue:(id)a7;
- (void)setSendFileURL:(id)a3;
@end

@implementation BLTSendQueueSerializer

- (BLTSendQueueSerializer)initWithUsesMessageIdentifiers:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BLTSendQueueSerializer;
  result = [(BLTSendQueueSerializer *)&v5 init];
  if (result) {
    result->_usesMessageIdentifiers = a3;
  }
  return result;
}

- (void)setSendFileURL:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_super v5 = blt_send_queue_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BLTSendQueueSerializer setSendFileURL:]((uint64_t)self, v5);
    }
  }
  v6 = (NSURL *)[v4 copy];
  sendFileURL = self->_sendFileURL;
  self->_sendFileURL = v6;

  [(BLTSendQueueSerializer *)self cleanup];
}

- (void)cleanup
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = blt_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    sendFileURL = self->_sendFileURL;
    *(_DWORD *)buf = 138412290;
    v33 = sendFileURL;
    _os_log_impl(&dword_222F4C000, v3, OS_LOG_TYPE_DEFAULT, "Removing queue file %@", buf, 0xCu);
  }

  objc_super v5 = self->_sendFileURL;
  if (v5)
  {
    v6 = [(NSURL *)v5 lastPathComponent];
    v7 = [(NSURL *)self->_sendFileURL URLByDeletingLastPathComponent];
    uint64_t v8 = [v7 path];

    v9 = [MEMORY[0x263F08850] defaultManager];
    id v31 = 0;
    v24 = (void *)v8;
    v10 = [v9 contentsOfDirectoryAtPath:v8 error:&v31];
    id v11 = v31;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = *(void *)v28;
      *(void *)&long long v13 = 138412546;
      long long v23 = v13;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(NSURL **)(*((void *)&v27 + 1) + 8 * i);
          if (-[NSURL containsString:](v17, "containsString:", v6, v23))
          {
            v18 = [MEMORY[0x263F08850] defaultManager];
            v19 = [v24 stringByAppendingPathComponent:v17];
            id v26 = v11;
            char v20 = [v18 removeItemAtPath:v19 error:&v26];
            id v21 = v26;

            if ((v20 & 1) == 0)
            {
              v22 = blt_general_log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v23;
                v33 = v17;
                __int16 v34 = 2112;
                id v35 = v21;
                _os_log_error_impl(&dword_222F4C000, v22, OS_LOG_TYPE_ERROR, "Error removing %@ error: %@", buf, 0x16u);
              }
            }
            id v11 = v21;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v14);
    }
  }
}

- (void)add:(id)a3 type:(unsigned __int16)a4
{
}

- (void)add:(id)a3 type:(unsigned __int16)a4 messageIdentifier:(id *)a5
{
  v34[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned __int16 v30 = a4;
  v9 = [(BLTSendQueueSerializer *)self sendFileURL];
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = [v10 fileSystemRepresentation];
    if (v11)
    {
      uint64_t v12 = [NSString stringWithUTF8String:v11];
      long long v13 = [MEMORY[0x263F08850] defaultManager];
      char v14 = [v13 fileExistsAtPath:v12];

      if (v14) {
        goto LABEL_5;
      }
      uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v33 = *MEMORY[0x263F080A8];
      v34[0] = *MEMORY[0x263F080B0];
      v16 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
      char v17 = [v15 createFileAtPath:v12 contents:0 attributes:v16];

      if (v17)
      {
LABEL_5:
        id v29 = 0;
        v18 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v10 error:&v29];
        v19 = v29;
        if (v18)
        {
          [v18 seekToEndOfFile];
          char v20 = [MEMORY[0x263EFF8F8] dataWithBytes:&v30 length:2];
          _writeDataToFile(v20, v18);

          id v21 = [v8 data];
          v22 = blt_ids_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [v21 length];
            *(_DWORD *)buf = 134217984;
            uint64_t v32 = v23;
            _os_log_impl(&dword_222F4C000, v22, OS_LOG_TYPE_DEFAULT, "Serializing protobuf bytes: %lu", buf, 0xCu);
          }

          _writeDataToFile(v21, v18);
          if ([(BLTSendQueueSerializer *)self usesMessageIdentifiers])
          {
            v24 = [MEMORY[0x263F08C38] UUID];
            v25 = [v24 UUIDString];
            id v26 = [@"blt-" stringByAppendingString:v25];

            long long v27 = [v26 dataUsingEncoding:4];
            _writeDataToFile(v27, v18);

            if (a5) {
              *a5 = v26;
            }
          }
        }
        else
        {
          id v21 = blt_send_queue_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[BLTSendQueueSerializer add:type:messageIdentifier:]((uint64_t)v19, v21);
          }
        }
      }
      else
      {
        v18 = blt_send_queue_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[BLTSendQueueSerializer add:type:messageIdentifier:].cold.4((uint64_t)v12, v18);
        }
        v19 = 0;
      }

      v10 = v19;
    }
    else
    {
      long long v28 = blt_send_queue_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[BLTSendQueueSerializer add:type:messageIdentifier:]();
      }
    }
  }
  else
  {
    v10 = blt_send_queue_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BLTSendQueueSerializer add:type:messageIdentifier:]((uint64_t)self, v10);
    }
  }
}

- (void)sendWithSender:(id)a3 timeout:(id)a4 responseHandlers:(id)a5 didSend:(id)a6 didQueue:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  char v17 = [(BLTSendQueueSerializer *)self sendFileURL];
  v18 = [MEMORY[0x263F08C38] UUID];
  v19 = [v18 UUIDString];
  char v20 = [v17 URLByAppendingPathExtension:v19];

  if (v20)
  {
    id v21 = v14;
    id v31 = v13;
    id v22 = v12;
    uint64_t v23 = [MEMORY[0x263F08850] defaultManager];
    id v37 = 0;
    char v24 = [v23 linkItemAtURL:v17 toURL:v20 error:&v37];
    id v25 = v37;

    if (v24)
    {
      id v26 = [MEMORY[0x263F08850] defaultManager];
      id v36 = v25;
      char v27 = [v26 removeItemAtURL:v17 error:&v36];
      id v28 = v36;

      id v12 = v22;
      id v14 = v21;
      if ((v27 & 1) == 0)
      {
        id v29 = blt_send_queue_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[BLTSendQueueSerializer sendWithSender:timeout:responseHandlers:didSend:didQueue:]();
        }
      }
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __83__BLTSendQueueSerializer_sendWithSender_timeout_responseHandlers_didSend_didQueue___block_invoke;
      v32[3] = &unk_2646844B8;
      uint64_t v33 = v20;
      id v34 = v17;
      id v35 = v15;
      id v13 = v31;
      [v12 sendFileURL:v33 withTimeout:v31 extraMetadata:0 responseHandlers:v21 didSend:v32 didQueue:v16];

      unsigned __int16 v30 = v33;
      goto LABEL_12;
    }
    id v28 = v25;
    id v12 = v22;
    id v14 = v21;
  }
  else
  {
    id v28 = 0;
  }
  unsigned __int16 v30 = blt_send_queue_log();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v39 = v17;
    __int16 v40 = 2112;
    v41 = v20;
    __int16 v42 = 2112;
    id v43 = v28;
    _os_log_error_impl(&dword_222F4C000, v30, OS_LOG_TYPE_ERROR, "Error creating link for sending URL: %@ at %@ error: %@", buf, 0x20u);
  }
LABEL_12:
}

void __83__BLTSendQueueSerializer_sendWithSender_timeout_responseHandlers_didSend_didQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = 0;
  char v8 = [v6 removeItemAtURL:v7 error:&v12];
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    v10 = blt_send_queue_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __83__BLTSendQueueSerializer_sendWithSender_timeout_responseHandlers_didSend_didQueue___block_invoke_cold_1(a1, (uint64_t)v9, v10);
    }
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

- (BOOL)handleFileURL:(id)a3 protobufHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = blt_send_queue_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_INFO, "Received new queue", buf, 2u);
  }

  id v34 = 0;
  id v9 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v6 error:&v34];
  id v10 = v34;
  uint64_t v11 = v10;
  if (v9)
  {
    id v33 = v10;
    id v12 = _readDataFromFile(v9);
    id v13 = _readDataFromFile(v9);
    id v14 = blt_ids_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 length];
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = v15;
      _os_log_impl(&dword_222F4C000, v14, OS_LOG_TYPE_DEFAULT, "Deserializing protobuf bytes: %lu", buf, 0xCu);
    }

    if ([(BLTSendQueueSerializer *)self usesMessageIdentifiers])
    {
      id v16 = _readDataFromFile(v9);
    }
    else
    {
      id v16 = 0;
    }
    if ([v13 length]) {
      BOOL v32 = [v12 length] != 0;
    }
    else {
      BOOL v32 = 0;
    }
    if ([v13 length])
    {
      while ([v12 length])
      {
        id v19 = v12;
        uint64_t v20 = *(unsigned __int16 *)[v19 bytes];
        id v21 = (void *)[objc_alloc(MEMORY[0x263F4A098]) initWithProtobufData:v13 type:v20 isResponse:0];
        if (v16)
        {
          id v22 = (void *)[[NSString alloc] initWithData:v16 encoding:4];
          uint64_t v23 = [v21 context];

          if (!v23)
          {
            id v24 = objc_alloc(MEMORY[0x263F4A068]);
            id v25 = (void *)[v24 initWithDictionary:MEMORY[0x263EFFA78] boostContext:0];
            [v21 setContext:v25];
          }
          id v26 = [v21 context];
          [v26 setOutgoingResponseIdentifier:v22];
        }
        [v7 handleIDSProtobuf:v21];
        id v12 = _readDataFromFile(v9);

        char v27 = _readDataFromFile(v9);

        id v28 = blt_ids_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [v27 length];
          *(_DWORD *)buf = 134217984;
          uint64_t v36 = v29;
          _os_log_impl(&dword_222F4C000, v28, OS_LOG_TYPE_DEFAULT, "Deserializing protobuf bytes: %lu", buf, 0xCu);
        }

        if ([(BLTSendQueueSerializer *)self usesMessageIdentifiers])
        {
          uint64_t v30 = _readDataFromFile(v9);

          id v16 = (void *)v30;
        }

        id v13 = v27;
        if (![v27 length]) {
          goto LABEL_28;
        }
      }
    }
    char v27 = v13;
LABEL_28:

    uint64_t v11 = v33;
    BOOL v18 = v32;
  }
  else
  {
    char v17 = blt_send_queue_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = (uint64_t)v6;
      __int16 v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_ERROR, "Encountered error opening file %@: %@", buf, 0x16u);
    }

    _BLTCaptureBug(@"IDSFileOpenError");
    BOOL v18 = 0;
  }

  return v18;
}

- (NSURL)sendFileURL
{
  return self->_sendFileURL;
}

- (BOOL)usesMessageIdentifiers
{
  return self->_usesMessageIdentifiers;
}

- (void).cxx_destruct
{
}

- (void)setSendFileURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "%@ setSendFileURL: %@", (uint8_t *)&v2, 0x16u);
}

- (void)add:(uint64_t)a1 type:(NSObject *)a2 messageIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_222F4C000, a2, OS_LOG_TYPE_FAULT, "%@ add:type:messageIdentifier: sendURL is nil", (uint8_t *)&v2, 0xCu);
}

- (void)add:type:messageIdentifier:.cold.2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  __int16 v2 = 2080;
  uint64_t v3 = 0;
  _os_log_fault_impl(&dword_222F4C000, v0, OS_LOG_TYPE_FAULT, "%@ add:type:messageIdentifier: sendURL: %@ fileSystemRepresentation: %s", v1, 0x20u);
}

- (void)add:(uint64_t)a1 type:(NSObject *)a2 messageIdentifier:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Encountered error opening file: %@", (uint8_t *)&v2, 0xCu);
}

- (void)add:(uint64_t)a1 type:(NSObject *)a2 messageIdentifier:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Error creating file %@", (uint8_t *)&v2, 0xCu);
}

- (void)sendWithSender:timeout:responseHandlers:didSend:didQueue:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "Error removing %@ error: %@");
}

void __83__BLTSendQueueSerializer_sendWithSender_timeout_responseHandlers_didSend_didQueue___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_222F4C000, a2, a3, "Error removing %@ error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end