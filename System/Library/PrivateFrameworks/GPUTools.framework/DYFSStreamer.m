@interface DYFSStreamer
+ (id)streamItem:(id)a3 withTransport:(id)a4;
+ (id)streamItem:(id)a3 withTransport:(id)a4 destinationName:(id)a5;
+ (void)denyTransfer:(id)a3 transport:(id)a4;
- (BOOL)_createDirectoryWithAttributes:(id)a3 error:(id *)a4;
- (BOOL)_createOrUpdateFileWithData:(id)a3 attributes:(id)a4 error:(id *)a5;
- (BOOL)_createSymlinkWithAttributes:(id)a3 error:(id *)a4;
- (BOOL)_sendCreateDirectoryMessage:(id)a3 error:(id *)a4;
- (BOOL)_sendCreateSymlinkMessage:(id)a3 destination:(id)a4 error:(id *)a5;
- (BOOL)_sendFileAtURL:(id)a3 relativePath:(id)a4 error:(id *)a5;
- (BOOL)streamLocally;
- (DYFSStreamer)initWithURL:(id)a3 transport:(id)a4 asSender:(BOOL)a5;
- (NSArray)urls;
- (NSPredicate)filenameFilter;
- (NSString)destinationName;
- (NSString)owner;
- (NSString)path;
- (NSURL)url;
- (id)_resolveRelativePath:(id)a3 error:(id *)a4;
- (id)description;
- (id)initiateTransfer;
- (id)receiveTransfer:(id)a3;
- (unint64_t)bytes;
- (unint64_t)files;
- (unint64_t)messages;
- (void)_invalidate;
- (void)_sendAbortMessageInReplyTo:(id)a3 becauseOfError:(id)a4;
- (void)dealloc;
- (void)denyTransfer:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setFilenameFilter:(id)a3;
- (void)setOwner:(id)a3;
- (void)setStreamLocally:(BOOL)a3;
@end

@implementation DYFSStreamer

+ (id)streamItem:(id)a3 withTransport:(id)a4
{
  return (id)[a1 streamItem:a3 withTransport:a4 destinationName:0];
}

+ (id)streamItem:(id)a3 withTransport:(id)a4 destinationName:(id)a5
{
  v6 = [[DYFSStreamer alloc] initWithURL:a3 transport:a4 asSender:1];
  v7 = v6;
  if (a5) {
    [(DYFSStreamer *)v6 setDestinationName:a5];
  }
  id v8 = [(DYFSStreamer *)v7 initiateTransfer];

  return v8;
}

+ (void)denyTransfer:(id)a3 transport:(id)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263F3F9E8], "messageWithKind:objectPayload:", 2305, objc_msgSend(NSNumber, "numberWithBool:", 0));
  [a4 send:v6 inReplyTo:a3 error:0];
}

- (DYFSStreamer)initWithURL:(id)a3 transport:(id)a4 asSender:(BOOL)a5
{
  v13.receiver = self;
  v13.super_class = (Class)DYFSStreamer;
  id v8 = [(DYFSStreamer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v10 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v8)), v8), "UTF8String"];
    v9->_queue = (OS_dispatch_queue *)dispatch_queue_create(v10, 0);
    v11 = (NSURL *)(id)[a3 filePathURL];
    v9->_url = v11;
    if (v11)
    {
      v9->_path = [(NSURL *)v11 path];
      v9->_isSender = a5;
      v9->_transport = (DYTransport *)a4;
      v9->_fileManager = (NSFileManager *)objc_opt_new();
      if (!v9->_isSender) {
        v9->_fileHandles = (NSMutableDictionary *)objc_opt_new();
      }
      v9->_destinationName = [(NSURL *)v9->_url lastPathComponent];
      v9->_urls = (NSMutableArray *)objc_opt_new();
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DYFSStreamer;
  [(DYFSStreamer *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)DYFSStreamer;
  id v4 = [(DYFSStreamer *)&v7 description];
  if (self->_isSender) {
    v5 = @"sender";
  }
  else {
    v5 = @"receiver";
  }
  return (id)[v3 stringWithFormat:@"%@: mode=%@ path=%@", v4, v5, -[DYFSStreamer path](self, "path")];
}

- (void)_sendAbortMessageInReplyTo:(id)a3 becauseOfError:(id)a4
{
  uint64_t v6 = [a4 description];
  if (!v6 || (objc_super v7 = (void *)[MEMORY[0x263F3F9E8] messageWithKind:2309 stringPayload:v6]) == 0) {
    objc_super v7 = (void *)[MEMORY[0x263F3F9E8] messageWithKind:2309];
  }
  [(DYTransport *)self->_transport send:v7 inReplyTo:a3 error:0];
  ++self->_messages;
  self->_bytes += [v7 transportSize];
}

- (void)_invalidate
{
  if (!self->_invalid)
  {
    objc_msgSend((id)-[NSMutableDictionary allValues](self->_fileHandles, "allValues"), "makeObjectsPerformSelector:", sel_closeFile);
    [(NSMutableDictionary *)self->_fileHandles removeAllObjects];
    self->_invalid = 1;
  }
}

- (BOOL)_sendFileAtURL:(id)a3 relativePath:(id)a4 error:(id *)a5
{
  id v8 = (void *)[MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:a5];
  if (v8)
  {
    v9 = v8;
    [v8 seekToFileOffset:0];
    id v24 = 0;
    LODWORD(v8) = [a3 getResourceValue:&v24 forKey:*MEMORY[0x263EFF688] error:a5];
    if (v8)
    {
      id v21 = a3;
      unint64_t v10 = [v24 unsignedIntegerValue];
      unint64_t v11 = 0;
      uint64_t v22 = *MEMORY[0x263F3FB68];
      uint64_t v12 = *MEMORY[0x263F3FB60];
      uint64_t v13 = *MEMORY[0x263F3FB70];
      while (1)
      {
        uint64_t v14 = v10 - v11 >= 0x80000 ? 0x80000 : v10 - v11;
        uint64_t v15 = [v9 readDataOfLength:v14];
        v16 = NSDictionary;
        uint64_t v17 = [NSNumber numberWithUnsignedLong:v11];
        uint64_t v18 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", a4, v22, v17, v12, v24, v13, @"file", @"kind", 0);
        v19 = (void *)[MEMORY[0x263F3F9E8] messageWithKind:2306 attributes:v18 payload:v15];
        LODWORD(v16) = [(DYTransport *)self->_transport send:v19 inReplyTo:self->_initTransferAckMessage error:a5];
        ++self->_messages;
        self->_bytes += [v19 transportSize];
        if (!v16) {
          break;
        }
        v11 += v14;
        if (v11 >= v10)
        {
          ++self->_files;
          [(NSMutableArray *)self->_urls addObject:v21];
          LOBYTE(v8) = 1;
          return (char)v8;
        }
      }
      LOBYTE(v8) = 0;
    }
  }
  return (char)v8;
}

- (BOOL)_sendCreateDirectoryMessage:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x263F3FB68], @"directory", @"kind", 0);
  objc_super v7 = (void *)[MEMORY[0x263F3F9E8] messageWithKind:2306 attributes:v6 payload:0];
  LOBYTE(a4) = [(DYTransport *)self->_transport send:v7 inReplyTo:self->_initTransferAckMessage error:a4];
  ++self->_messages;
  self->_bytes += [v7 transportSize];
  return (char)a4;
}

- (BOOL)_sendCreateSymlinkMessage:(id)a3 destination:(id)a4 error:(id *)a5
{
  uint64_t v7 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x263F3FB68], a4, @"destination", @"symlink", @"kind", 0);
  id v8 = (void *)[MEMORY[0x263F3F9E8] messageWithKind:2306 attributes:v7 payload:0];
  LOBYTE(a5) = [(DYTransport *)self->_transport send:v8 inReplyTo:self->_initTransferAckMessage error:a5];
  ++self->_messages;
  self->_bytes += [v8 transportSize];
  return (char)a5;
}

- (id)initiateTransfer
{
  self->_didInitiate = 1;
  v3 = (void *)[MEMORY[0x263F3F9D0] future];
  if (![(NSFileManager *)self->_fileManager fileExistsAtPath:self->_path isDirectory:&self->_itemIsDirectory])
  {
    objc_msgSend(v3, "setError:", objc_msgSend(MEMORY[0x263F3F9C8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F3F9C0], 1, 0));
    unint64_t v10 = v3;
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  id v4 = (void *)[MEMORY[0x263F3F9E8] messageWithKind:2304 stringPayload:self->_destinationName];
  uint64_t v14 = 0;
  transport = self->_transport;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __32__DYFSStreamer_initiateTransfer__block_invoke;
  v13[3] = &unk_2653339F0;
  v13[4] = self;
  v13[5] = v3;
  char v7 = [(DYTransport *)transport send:v4 error:&v14 replyQueue:queue timeout:0 handler:v13];
  ++self->_messages;
  self->_bytes += [v4 transportSize];
  if ((v7 & 1) == 0)
  {
    id v8 = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __32__DYFSStreamer_initiateTransfer__block_invoke_4;
    v12[3] = &unk_265333698;
    v12[4] = self;
    dispatch_sync(v8, v12);
    [v3 setError:v14];
    uint64_t v9 = [NSNumber numberWithBool:0];
    unint64_t v10 = v3;
LABEL_5:
    [v10 setResult:v9];
  }
  return v3;
}

uint64_t __32__DYFSStreamer_initiateTransfer__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 83)) {
    return 0;
  }
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setError:");
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    _DYOLog();
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", a3);
    return 0;
  }
  ++*(void *)(v3 + 144);
  *(void *)(*(void *)(a1 + 32) + 136) += [a2 transportSize];
  if ([a2 kind] != 2305)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = (void *)MEMORY[0x263F3F9C8];
    uint64_t v10 = *MEMORY[0x263F3F9C0];
    uint64_t v11 = 43;
    goto LABEL_12;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "objectPayload"), "BOOLValue") & 1) == 0)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = (void *)MEMORY[0x263F3F9C8];
    uint64_t v10 = *MEMORY[0x263F3F9C0];
    uint64_t v11 = 42;
LABEL_12:
    objc_msgSend(v8, "setError:", objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, 0));
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", v37);
    return 0;
  }
  *(void *)(*(void *)(a1 + 32) + 32) = a2;
  uint64_t v53 = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 81))
  {
    uint64_t v13 = [*(id *)(v6 + 88) lastPathComponent];
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(void *)(v14 + 112))
    {
      if (![*(id *)(v14 + 112) evaluateWithObject:v13]) {
        goto LABEL_19;
      }
      uint64_t v14 = *(void *)(a1 + 32);
    }
    if ([(id)v14 _sendFileAtURL:*(void *)(v14 + 88) relativePath:v13 error:&v53])
    {
LABEL_19:
      uint64_t v15 = (void *)[MEMORY[0x263F3F9E8] messageWithKind:2307];
      v41[0] = MEMORY[0x263EF8330];
      long long v16 = *(_OWORD *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void **)(v17 + 24);
      uint64_t v19 = *(void *)(v17 + 8);
      v41[1] = 3221225472;
      v41[2] = __32__DYFSStreamer_initiateTransfer__block_invoke_3;
      v41[3] = &unk_2653339F0;
      long long v42 = v16;
      [v18 send:v15 inReplyTo:a2 error:0 replyQueue:v19 timeout:0 handler:v41];
      ++*(void *)(*(void *)(a1 + 32) + 144);
      *(void *)(*(void *)(a1 + 32) + 136) += [v15 transportSize];
      return 0;
    }
    goto LABEL_40;
  }
  if (*(unsigned char *)(v6 + 84))
  {
    if (objc_msgSend((id)v6, "_sendCreateSymlinkMessage:destination:error:", objc_msgSend(*(id *)(v6 + 88), "lastPathComponent"), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "path"), &v53))goto LABEL_19; {
    goto LABEL_40;
    }
  }
  if (([*(id *)(a1 + 32) _sendCreateDirectoryMessage:*(void *)(v6 + 104) error:&v53] & 1) == 0)
  {
LABEL_40:
    [*(id *)(a1 + 32) _sendAbortMessageInReplyTo:*(void *)(*(void *)(a1 + 32) + 32) becauseOfError:v53];
    [*(id *)(a1 + 32) _invalidate];
    [*(id *)(a1 + 40) setError:v53];
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    return 0;
  }
  uint64_t v20 = *MEMORY[0x263EFF750];
  uint64_t v38 = *MEMORY[0x263EFF700];
  uint64_t v39 = *MEMORY[0x263EFF6A8];
  uint64_t v40 = *MEMORY[0x263EFF6F0];
  uint64_t v21 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263EFF750], *MEMORY[0x263EFF6F0], *MEMORY[0x263EFF6A8], *MEMORY[0x263EFF700], *MEMORY[0x263EFF688], 0);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  long long v22 = *(_OWORD *)(a1 + 32);
  uint64_t v23 = *(void *)(a1 + 32);
  id v24 = *(void **)(v23 + 16);
  uint64_t v25 = *(void *)(v23 + 88);
  v51[2] = __32__DYFSStreamer_initiateTransfer__block_invoke_2;
  v51[3] = &unk_2653339C8;
  long long v52 = v22;
  v26 = (void *)[v24 enumeratorAtURL:v25 includingPropertiesForKeys:v21 options:0 errorHandler:v51];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (!v27) {
    goto LABEL_38;
  }
  uint64_t v28 = v27;
  uint64_t v29 = *(void *)v48;
  while (2)
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v48 != v29) {
        objc_enumerationMutation(v26);
      }
      v31 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      uint64_t v46 = 0;
      [v31 getResourceValue:&v46 forKey:v20 error:&v53];
      v32 = *(void **)(*(void *)(a1 + 32) + 112);
      if (!v32 || ([v32 evaluateWithObject:v46] & 1) != 0)
      {
        id v44 = 0;
        id v45 = 0;
        id v43 = 0;
        [v31 getResourceValue:&v45 forKey:v40 error:&v53];
        [v31 getResourceValue:&v44 forKey:v39 error:&v53];
        [v31 getResourceValue:&v43 forKey:v38 error:&v53];
        v33 = (void *)[v31 pathComponents];
        uint64_t v34 = [v26 level];
        uint64_t v35 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(v33, "subarrayWithRange:", objc_msgSend(v33, "count") - v34, v34), "componentsJoinedByString:", @"/"));
        if ([v45 BOOLValue])
        {
          if (([*(id *)(a1 + 32) _sendFileAtURL:v31 relativePath:v35 error:&v53] & 1) == 0) {
            goto LABEL_41;
          }
        }
        else
        {
          if (![v43 BOOLValue])
          {
            if ([v44 BOOLValue])
            {
              if ([*(id *)(a1 + 32) _sendCreateDirectoryMessage:v35 error:&v53]) {
                continue;
              }
LABEL_41:
              uint64_t v36 = v53;
            }
            else
            {
              uint64_t v36 = [MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:46 userInfo:0];
              uint64_t v53 = v36;
            }
            [*(id *)(a1 + 32) _sendAbortMessageInReplyTo:*(void *)(*(void *)(a1 + 32) + 32) becauseOfError:v36];
            [*(id *)(a1 + 32) _invalidate];
            [*(id *)(a1 + 40) setError:v53];
            objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
            [v26 setValue:0 forKey:@"errorHandler"];
            return 0;
          }
          if ((objc_msgSend(*(id *)(a1 + 32), "_sendCreateSymlinkMessage:destination:error:", v35, objc_msgSend(v31, "lastPathComponent"), &v53) & 1) == 0)goto LABEL_41; {
        }
          }
      }
    }
    uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_38:
  [v26 setValue:0 forKey:@"errorHandler"];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 83)) {
    goto LABEL_19;
  }
  return 0;
}

uint64_t __32__DYFSStreamer_initiateTransfer__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 0;
}

uint64_t __32__DYFSStreamer_initiateTransfer__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(unsigned char **)(a1 + 32);
  if (!v4[83])
  {
    [v4 _invalidate];
    if (a2)
    {
      ++*(void *)(*(void *)(a1 + 32) + 144);
      *(void *)(*(void *)(a1 + 32) + 136) += [a2 transportSize];
      if ([a2 kind] == 2309)
      {
        char v7 = *(void **)(a1 + 40);
        id v8 = (void *)MEMORY[0x263F3F9C8];
        uint64_t v9 = *MEMORY[0x263F3F9C0];
        uint64_t v10 = NSDictionary;
        uint64_t v11 = [a2 stringPayload];
        uint64_t v12 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 45, objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x263F08320], 0));
        uint64_t v13 = v7;
      }
      else
      {
        int v14 = [a2 kind];
        uint64_t v15 = *(void **)(a1 + 40);
        if (v14 == 2308)
        {
          uint64_t v16 = [NSNumber numberWithBool:1];
          uint64_t v17 = v15;
LABEL_10:
          [v17 setResult:v16];
          return 0;
        }
        uint64_t v12 = [MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:43 userInfo:0];
        uint64_t v13 = v15;
      }
      [v13 setError:v12];
      uint64_t v18 = *(void **)(a1 + 40);
      uint64_t v16 = [NSNumber numberWithBool:0];
      uint64_t v17 = v18;
      goto LABEL_10;
    }
    [*(id *)(a1 + 40) setError:a3];
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    _DYOLog();
  }
  return 0;
}

uint64_t __32__DYFSStreamer_initiateTransfer__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)setFilenameFilter:(id)a3
{
  if (!self->_isSender) {
    -[DYFSStreamer setFilenameFilter:]();
  }
  if (self->_didInitiate) {
    -[DYFSStreamer setFilenameFilter:]();
  }
  filenameFilter = self->_filenameFilter;
  if (filenameFilter != a3)
  {

    self->_filenameFilter = (NSPredicate *)a3;
  }
}

- (id)_resolveRelativePath:(id)a3 error:(id *)a4
{
  if (!a3)
  {
    if (a4)
    {
      uint64_t v7 = 1;
      goto LABEL_7;
    }
    return 0;
  }
  uint64_t v6 = -[NSURL standardizedURL](-[NSURL URLByAppendingPathComponent:](self->_url, "URLByAppendingPathComponent:"), "standardizedURL");
  if (![(NSString *)[(NSURL *)v6 path] hasPrefix:[(NSURL *)self->_url path]])
  {
    if (a4)
    {
      uint64_t v7 = 44;
LABEL_7:
      uint64_t v6 = 0;
      *a4 = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:v7 userInfo:0];
      return v6;
    }
    return 0;
  }
  return v6;
}

- (BOOL)_createOrUpdateFileWithData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v9 = -[DYFSStreamer _resolveRelativePath:error:](self, "_resolveRelativePath:error:", [a4 objectForKey:*MEMORY[0x263F3FB68]], a5);
  if (!v9) {
    return (char)v9;
  }
  uint64_t v10 = v9;
  off_t v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x263F3FB70]), "unsignedIntegerValue");
  uint64_t v12 = (void *)[(NSMutableDictionary *)self->_fileHandles objectForKey:v10];
  if (!v12)
  {
    [(NSFileManager *)self->_fileManager removeItemAtURL:v10 error:a5];
    uint64_t v21 = open((const char *)objc_msgSend((id)objc_msgSend(v10, "path"), "fileSystemRepresentation"), 2561, 384);
    if (v21 == -1)
    {
      if (!a5) {
        goto LABEL_29;
      }
      uint64_t v23 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      LOBYTE(v9) = 0;
      *a5 = v23;
      return (char)v9;
    }
    uint64_t v14 = v21;
    if (ftruncate(v21, v11) == -1)
    {
      if (a5) {
        *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      }
    }
    else
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v14 closeOnDealloc:1];
      if (v22)
      {
        uint64_t v13 = (void *)v22;
        if (fchown(v14, self->_ownerUID, 0xFFFFFFFF) == -1)
        {

          id v24 = NSString;
          uint64_t v25 = __error();
          [v24 stringWithUTF8String:strerror(*v25)];
          _DYOLog();
          goto LABEL_29;
        }
        [(NSMutableDictionary *)self->_fileHandles setObject:v13 forKey:v10];

        ++self->_files;
        [(NSMutableArray *)self->_urls addObject:v10];
        goto LABEL_4;
      }
    }
    close(v14);
    goto LABEL_29;
  }
  uint64_t v13 = v12;
  LODWORD(v14) = [v12 fileDescriptor];
LABEL_4:
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x263F3FB60]), "unsignedLongValue");
  if (v15 != lseek(v14, 0, 1))
  {
    v26 = (DYFSStreamer *)dy_abort();
    LOBYTE(v9) = [(DYFSStreamer *)v26 _createDirectoryWithAttributes:v28 error:v29];
    return (char)v9;
  }
  uint64_t v16 = [a3 bytes];
  uint64_t v17 = [a3 length];
  if (v17 < 1)
  {
    uint64_t v19 = 0;
LABEL_18:
    if (v19 + v15 == v11)
    {
      [v13 closeFile];
      [(NSMutableDictionary *)self->_fileHandles removeObjectForKey:v10];
    }
    self;
    LOBYTE(v9) = 1;
    return (char)v9;
  }
  uint64_t v18 = v17;
  uint64_t v19 = 0;
  while (1)
  {
    ssize_t v20 = write(v14, (const void *)(v19 + v16), v18 - v19);
    if (v20 == -1) {
      break;
    }
    v19 += v20;
LABEL_10:
    if (v19 >= v18) {
      goto LABEL_18;
    }
  }
  if (*__error() == 4) {
    goto LABEL_10;
  }
  if (a5) {
    *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  [v13 closeFile];
  [(NSMutableDictionary *)self->_fileHandles removeObjectForKey:v10];
LABEL_29:
  LOBYTE(v9) = 0;
  return (char)v9;
}

- (BOOL)_createDirectoryWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = -[DYFSStreamer _resolveRelativePath:error:](self, "_resolveRelativePath:error:", [a3 objectForKey:*MEMORY[0x263F3FB68]], a4);
  if (v6)
  {
    uint64_t v7 = v6;
    [(NSFileManager *)self->_fileManager removeItemAtURL:v6 error:0];
    uint64_t v8 = [v7 path];
    fileManager = self->_fileManager;
    directoryAttributes = self->_directoryAttributes;
    LOBYTE(v6) = [(NSFileManager *)fileManager createDirectoryAtPath:v8 withIntermediateDirectories:0 attributes:directoryAttributes error:a4];
  }
  return (char)v6;
}

- (BOOL)_createSymlinkWithAttributes:(id)a3 error:(id *)a4
{
  id v7 = -[DYFSStreamer _resolveRelativePath:error:](self, "_resolveRelativePath:error:", [a3 objectForKey:*MEMORY[0x263F3FB68]], a4);
  if (v7)
  {
    id v8 = v7;
    id v9 = (void *)[a3 objectForKey:@"destination"];
    uint64_t v10 = objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x263F08708], "URLQueryAllowedCharacterSet"));
    uint64_t v11 = [NSURL URLWithString:v10];
    [(NSFileManager *)self->_fileManager removeItemAtURL:v8 error:a4];
    LOBYTE(v7) = [(NSFileManager *)self->_fileManager createSymbolicLinkAtURL:v8 withDestinationURL:v11 error:a4];
    ++self->_files;
  }
  return (char)v7;
}

- (void)setOwner:(id)a3
{
  if (self->_isSender) {
    -[DYFSStreamer setOwner:]();
  }
  if (self->_didInitiate) {
    -[DYFSStreamer setOwner:]();
  }
  owner = self->_owner;
  if (owner != a3)
  {

    self->_owner = (NSString *)[a3 copy];
  }
}

- (void)setDestinationName:(id)a3
{
  if (!self->_isSender) {
    -[DYFSStreamer setDestinationName:]();
  }
  if (self->_didInitiate) {
    -[DYFSStreamer setDestinationName:]();
  }
  if (!a3) {
    -[DYFSStreamer setDestinationName:]();
  }
  destinationName = self->_destinationName;
  if (destinationName != a3)
  {

    self->_destinationName = (NSString *)[a3 copy];
  }
}

- (id)receiveTransfer:(id)a3
{
  v5 = (void *)[MEMORY[0x263F3F9D0] future];
  if (self->_owner)
  {
    *__error() = 0;
    id v6 = getpwnam([(NSString *)self->_owner UTF8String]);
    if (!v6)
    {
      uint64_t v18 = __error();
      uint64_t v19 = *v18;
      if (v19) {
        owner = (NSString *)[NSString stringWithUTF8String:strerror(*v18)];
      }
      else {
        owner = self->_owner;
      }
      _DYOLog();
      -[DYFSStreamer denyTransfer:](self, "denyTransfer:", a3, owner);
      objc_msgSend(v5, "setError:", objc_msgSend(MEMORY[0x263F3F9C8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08438], v19, 0));
      ssize_t v20 = NSNumber;
      goto LABEL_15;
    }
    unsigned int pw_uid = v6->pw_uid;
  }
  else
  {
    unsigned int pw_uid = -1;
  }
  self->_ownerUID = pw_uid;
  id v8 = objc_alloc(NSDictionary);
  uint64_t v9 = [NSNumber numberWithInt:self->_ownerUID];
  uint64_t v10 = *MEMORY[0x263F08050];
  uint64_t v11 = [NSNumber numberWithInt:448];
  uint64_t v12 = (NSDictionary *)objc_msgSend(v8, "initWithObjectsAndKeys:", v9, v10, v11, *MEMORY[0x263F08078], 0);
  self->_directoryAttributes = v12;
  uint64_t v26 = 0;
  if (![(NSFileManager *)self->_fileManager createDirectoryAtPath:self->_path withIntermediateDirectories:0 attributes:v12 error:&v26]&& (DYFSDirectoryExists() & 1) == 0)
  {
    uint64_t v23 = v26;
    _DYOLog();
    -[DYFSStreamer denyTransfer:](self, "denyTransfer:", a3, v23);
    goto LABEL_12;
  }
  self->_didInitiate = 1;
  uint64_t v13 = objc_msgSend(MEMORY[0x263F3F9E8], "messageWithKind:objectPayload:", 2305, objc_msgSend(NSNumber, "numberWithBool:", 1));
  transport = self->_transport;
  queue = self->_queue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __32__DYFSStreamer_receiveTransfer___block_invoke;
  v25[3] = &unk_2653339F0;
  v25[4] = self;
  v25[5] = v5;
  char v16 = [(DYTransport *)transport send:v13 inReplyTo:a3 error:&v26 replyQueue:queue timeout:10000000000 handler:v25];
  ++self->_messages;
  self->_bytes += [v13 transportSize];
  if ((v16 & 1) == 0)
  {
    _DYOLog();
    uint64_t v17 = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__DYFSStreamer_receiveTransfer___block_invoke_2;
    block[3] = &unk_265333698;
    block[4] = self;
    dispatch_sync(v17, block);
LABEL_12:
    [v5 setError:v26];
    ssize_t v20 = NSNumber;
LABEL_15:
    objc_msgSend(v5, "setResult:", objc_msgSend(v20, "numberWithBool:", 0));
  }
  return v5;
}

uint64_t __32__DYFSStreamer_receiveTransfer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (!a2)
  {
    _DYOLog();
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", a3);
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = a3;
    goto LABEL_8;
  }
  ++*(void *)(v4 + 144);
  *(void *)(*(void *)(a1 + 32) + 136) += [a2 transportSize];
  if ([a2 kind] != 2306)
  {
    if ([a2 kind] == 2307)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v10 + 83))
      {
        [(id)v10 _sendAbortMessageInReplyTo:a2 becauseOfError:*(void *)(v10 + 48)];
      }
      else
      {
        uint64_t v11 = (void *)[MEMORY[0x263F3F9E8] messageWithKind:2308];
        [*(id *)(*(void *)(a1 + 32) + 24) send:v11 inReplyTo:a2 error:0];
        ++*(void *)(*(void *)(a1 + 32) + 144);
        *(void *)(*(void *)(a1 + 32) + 136) += [v11 transportSize];

        *(void *)(*(void *)(a1 + 32) + 48) = 0;
      }
      [*(id *)(a1 + 40) setError:*(void *)(*(void *)(a1 + 32) + 48)];
      objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned char *)(*(void *)(a1 + 32) + 83) == 0));
      [*(id *)(a1 + 32) _invalidate];
      return 0;
    }
    if ([a2 kind] != 2309)
    {
      [*(id *)(a1 + 32) _invalidate];
      *(void *)(*(void *)(a1 + 32) + 48) = (id)[MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:43 userInfo:0];
      goto LABEL_25;
    }
    uint64_t v15 = [a2 stringPayload];
    _DYOLog();
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", v15);
    uint64_t v9 = [MEMORY[0x263F3F9C8] errorWithDomain:*MEMORY[0x263F3F9C0] code:45 userInfo:0];
    id v8 = *(void **)(a1 + 40);
LABEL_8:
    [v8 setError:v9];
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
    return 0;
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 83))
  {
    id v6 = (void *)[a2 attributeForKey:@"kind"];
    if ([v6 isEqualToString:@"file"])
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_createOrUpdateFileWithData:attributes:error:", objc_msgSend(a2, "payload"), objc_msgSend(a2, "attributes"), *(void *)(a1 + 32) + 48))goto LABEL_23; {
    }
      }
    else if ([v6 isEqualToString:@"directory"])
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_createDirectoryWithAttributes:error:", objc_msgSend(a2, "attributes"), *(void *)(a1 + 32) + 48))
      {
LABEL_23:
        *(void *)(*(void *)(a1 + 32) + 48) = 0;
        return 1;
      }
    }
    else if ([v6 isEqualToString:@"symlink"] {
           && (objc_msgSend(*(id *)(a1 + 32), "_createSymlinkWithAttributes:error:", objc_msgSend(a2, "attributes"), *(void *)(a1 + 32) + 48) & 1) != 0)
    }
    {
      goto LABEL_23;
    }
    uint64_t v16 = [a2 attributes];
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 48);
    _DYOLog();
    id v13 = *(id *)(*(void *)(a1 + 32) + 48);
    objc_msgSend(*(id *)(a1 + 32), "_invalidate", v16, v17);
LABEL_25:
    [*(id *)(a1 + 40) setError:*(void *)(*(void *)(a1 + 32) + 48)];
    objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", 0));
  }
  return 1;
}

uint64_t __32__DYFSStreamer_receiveTransfer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)denyTransfer:(id)a3
{
  self->_didInitiate = 1;
  v5 = objc_msgSend(MEMORY[0x263F3F9E8], "messageWithKind:objectPayload:", 2305, objc_msgSend(NSNumber, "numberWithBool:", 0));
  [(DYTransport *)self->_transport send:v5 inReplyTo:a3 error:0];
  ++self->_messages;
  self->_bytes += [v5 transportSize];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__DYFSStreamer_denyTransfer___block_invoke;
  block[3] = &unk_265333698;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __29__DYFSStreamer_denyTransfer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (NSArray)urls
{
  return &self->_urls->super;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (BOOL)streamLocally
{
  return self->_streamLocally;
}

- (void)setStreamLocally:(BOOL)a3
{
  self->_streamLocally = a3;
}

- (NSPredicate)filenameFilter
{
  return self->_filenameFilter;
}

- (NSString)owner
{
  return self->_owner;
}

- (unint64_t)files
{
  return self->_files;
}

- (unint64_t)bytes
{
  return self->_bytes;
}

- (unint64_t)messages
{
  return self->_messages;
}

- (void)setFilenameFilter:.cold.1()
{
  __assert_rtn("-[DYFSStreamer setFilenameFilter:]", ", 0, "_isSender == YES"");
}

- (void)setFilenameFilter:.cold.2()
{
  __assert_rtn("-[DYFSStreamer setFilenameFilter:]", ", 0, "_didInitiate == NO"");
}

- (void)setOwner:.cold.1()
{
  __assert_rtn("-[DYFSStreamer setOwner:]", ", 0, "_didInitiate == NO"");
}

- (void)setOwner:.cold.2()
{
  __assert_rtn("-[DYFSStreamer setOwner:]", ", 0, "_isSender == NO"");
}

- (void)setDestinationName:.cold.1()
{
  __assert_rtn("-[DYFSStreamer setDestinationName:]", ", 0, "_isSender == YES"");
}

- (void)setDestinationName:.cold.2()
{
  __assert_rtn("-[DYFSStreamer setDestinationName:]", ", 0, "name != nil"");
}

- (void)setDestinationName:.cold.3()
{
  __assert_rtn("-[DYFSStreamer setDestinationName:]", ", 0, "_didInitiate == NO"");
}

@end