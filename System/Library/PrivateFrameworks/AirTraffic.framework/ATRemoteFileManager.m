@interface ATRemoteFileManager
- (ATMessageLink)messageLink;
- (ATRemoteFileManager)initWithMessageLink:(id)a3;
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4;
- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)uploadData:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)usageOfDirectoryAtPath:(id)a3 count:(unint64_t *)a4 size:(unint64_t *)a5 options:(id)a6 error:(id *)a7;
- (id)_readStreamData:(id)a3 error:(id *)a4;
- (id)_sendRequest:(id)a3 error:(id *)a4;
- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (id)dataAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (void)progressUpdatedWithPercentage:(double)a3 size:(unint64_t)a4;
- (void)setMessageLink:(id)a3;
@end

@implementation ATRemoteFileManager

- (void).cxx_destruct
{
}

- (void)setMessageLink:(id)a3
{
}

- (ATMessageLink)messageLink
{
  return self->_messageLink;
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  v7 = [[ATRequest alloc] initWithCommand:@"freeSpace" dataClass:@"Drive" parameters:0];
  v8 = [(ATRemoteFileManager *)self _sendRequest:v7 error:a4];
  v9 = [v8 parameters];
  v10 = v9;
  if (a3 && v9)
  {
    v11 = [v9 objectForKeyedSubscript:@"size"];
    *a3 = [v11 unsignedIntegerValue];
  }
  if (v8)
  {
    v12 = [v8 error];
    BOOL v13 = v12 == 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  v22[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a3;
  v11 = [ATRequest alloc];
  v20[1] = v9;
  v21 = @"paths";
  v20[0] = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v22[0] = v12;
  BOOL v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];

  v14 = [(ATRequest *)v11 initWithCommand:@"moveItem" dataClass:@"Drive" parameters:v13];
  v15 = [(ATRemoteFileManager *)self _sendRequest:v14 error:a6];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 error];
    BOOL v18 = v17 == 0;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  v35[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = [ATRequest alloc];
  v34 = @"paths";
  v35[0] = v9;
  v11 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
  v12 = [(ATRequest *)v10 initWithCommand:@"removeItem" dataClass:@"Drive" parameters:v11];

  id v32 = 0;
  BOOL v13 = [(ATRemoteFileManager *)self _sendRequest:v12 error:&v32];
  id v14 = v32;
  v15 = [MEMORY[0x263EFF9A0] dictionary];
  v16 = [v13 parameters];
  v17 = v16;
  if (v16)
  {
    v26 = a6;
    id v27 = v9;
    BOOL v18 = [v16 objectForKeyedSubscript:@"results"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          [v15 setObject:v14 forKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v20);
    }

    a6 = v26;
    id v9 = v27;
  }
  if (a5 && [v15 count]) {
    *a5 = v15;
  }
  if (a6 && [v15 count])
  {
    *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"ATError" code:22 userInfo:0];
  }
  if (v13)
  {
    v23 = [v13 error];
    BOOL v24 = v23 == 0;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v14[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = 0;
  BOOL v9 = [(ATRemoteFileManager *)self removeItemsAtPaths:v8 options:0 results:&v13 error:a5];
  id v10 = v13;

  if (a5 && !v9)
  {
    v11 = [v10 allValues];
    *a5 = [v11 lastObject];
  }
  return v9;
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = [ATRequest alloc];
  id v32 = @"paths";
  v33[0] = v8;
  id v10 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  v11 = [(ATRequest *)v9 initWithCommand:@"moveItem" dataClass:@"Drive" parameters:v10];

  id v30 = 0;
  v12 = [(ATRemoteFileManager *)self _sendRequest:v11 error:&v30];
  id v13 = v30;
  id v14 = [MEMORY[0x263EFF9A0] dictionary];
  v15 = [v12 parameters];
  v16 = v15;
  if (v15)
  {
    v25 = a5;
    v17 = [v15 objectForKeyedSubscript:@"results"];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          [v14 setObject:v13 forKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }

    a5 = v25;
  }
  if (a5 && [v14 count]) {
    *a5 = v14;
  }
  if (v12)
  {
    v22 = [v12 error];
    BOOL v23 = v22 == 0;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = NSDictionary;
  id v11 = a5;
  v12 = [v10 dictionaryWithObject:a4 forKey:a3];
  id v18 = 0;
  BOOL v13 = [(ATRemoteFileManager *)self moveItemsAtPaths:v12 options:v11 results:&v18 error:a6];

  id v14 = v18;
  v15 = v14;
  if (a6 && !v13)
  {
    v16 = [v14 allValues];
    *a6 = [v16 lastObject];
  }
  return v13;
}

- (id)dataAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [ATRequest alloc];
  id v17 = v7;
  id v18 = @"paths";
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v19[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  id v11 = [(ATRequest *)v8 initWithCommand:@"downloadFile" dataClass:@"Drive" parameters:v10];
  v12 = [(ATRemoteFileManager *)self _sendRequest:v11 error:a5];
  BOOL v13 = [v12 dataStream];

  if (v13)
  {
    id v14 = [v12 dataStream];
    v15 = [(ATRemoteFileManager *)self _readStreamData:v14 error:a5];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)uploadData:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a3;
  id v11 = [ATRequest alloc];
  id v21 = v9;
  v22 = @"paths";
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  v23[0] = v12;
  BOOL v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v14 = [(ATRequest *)v11 initWithCommand:@"uploadFile" dataClass:@"Drive" parameters:v13];

  v15 = [MEMORY[0x263EFF950] inputStreamWithData:v10];

  [(ATMessage *)v14 setDataStream:v15];
  v16 = [(ATRemoteFileManager *)self _sendRequest:v14 error:a6];
  id v17 = v16;
  if (v16)
  {
    id v18 = [v16 error];
    BOOL v19 = v18 == 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v26 = a4;
  v25 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    BOOL v23 = a5;
    BOOL v24 = a6;
    id v14 = 0;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v18 = [v11 objectForKey:v17];
        id v27 = v14;
        BOOL v19 = [(ATRemoteFileManager *)self downloadFileAtPath:v17 toPath:v18 options:v26 error:&v27];
        id v20 = v27;

        if (v19)
        {
          id v14 = v20;
        }
        else
        {
          [v25 setObject:v20 forKeyedSubscript:v17];

          if (v23) {
            id *v23 = v25;
          }
          if (v24)
          {
            [MEMORY[0x263F087E8] errorWithDomain:@"ATError" code:22 userInfo:0];
            id v14 = 0;
            *BOOL v24 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v14 = 0;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }

  BOOL v21 = [v25 count] == 0;
  return v21;
}

- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a3;
  id v11 = [ATRequest alloc];
  id v22 = v10;
  BOOL v23 = @"paths";
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  v24[0] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];

  id v14 = [(ATRequest *)v11 initWithCommand:@"downloadFile" dataClass:@"Drive" parameters:v13];
  uint64_t v15 = [(ATRemoteFileManager *)self _sendRequest:v14 error:a6];
  v16 = [v15 dataStream];

  if (v16)
  {
    uint64_t v17 = [v15 dataStream];
    id v18 = [(ATRemoteFileManager *)self _readStreamData:v17 error:a6];

    [v18 writeToFile:v9 atomically:1];
  }
  if (v15)
  {
    BOOL v19 = [v15 error];
    BOOL v20 = v19 == 0;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v23 = a4;
  id v10 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v17 = [v11 objectForKey:v16];
        id v24 = 0;
        [(ATRemoteFileManager *)self uploadFileAtPath:v16 toPath:v17 options:v23 error:&v24];
        id v18 = v24;
        if (v18)
        {
          BOOL v19 = v18;
          [v10 setObject:v18 forKey:v16];
          if (a5) {
            *a5 = v10;
          }
          if (a6)
          {
            *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"ATError" code:22 userInfo:0];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  BOOL v20 = [v10 count] == 0;
  return v20;
}

- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  v49[1] = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v10 = a4;
  id v27 = a5;
  NSUInteger v11 = NSPageSize();
  uint64_t v12 = [ATRequest alloc];
  id v47 = v10;
  v48 = @"paths";
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
  v49[0] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
  uint64_t v15 = [(ATRequest *)v12 initWithCommand:@"uploadFile" dataClass:@"Drive" parameters:v14];

  id v45 = 0;
  id v46 = 0;
  [MEMORY[0x263EFFA10] getBoundStreamsWithBufferSize:v11 inputStream:&v46 outputStream:&v45];
  id v16 = v46;
  id v17 = v45;
  id v18 = [MEMORY[0x263EFF950] inputStreamWithFileAtPath:v28];
  [(ATMessage *)v15 setDataStream:v18];

  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__1186;
  v43 = __Block_byref_object_dispose__1187;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1186;
  v37 = __Block_byref_object_dispose__1187;
  id v38 = 0;
  BOOL v20 = [(ATRemoteFileManager *)self messageLink];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __61__ATRemoteFileManager_uploadFileAtPath_toPath_options_error___block_invoke;
  v29[3] = &unk_264281130;
  long long v31 = &v39;
  id v32 = &v33;
  BOOL v21 = v19;
  uint64_t v30 = v21;
  [v20 sendRequest:v15 withCompletion:v29];

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
  {
    id v22 = (void *)v34[5];
    if (v22) {
      *a6 = v22;
    }
  }
  id v23 = (void *)v40[5];
  if (v23)
  {
    id v24 = objc_msgSend(v23, "error", v27);
    BOOL v25 = v24 == 0;
  }
  else
  {
    BOOL v25 = 0;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v25;
}

void __61__ATRemoteFileManager_uploadFileAtPath_toPath_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)usageOfDirectoryAtPath:(id)a3 count:(unint64_t *)a4 size:(unint64_t *)a5 options:(id)a6 error:(id *)a7
{
  v26[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = [ATRequest alloc];
  id v24 = v11;
  BOOL v25 = @"paths";
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v26[0] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];

  uint64_t v15 = [(ATRequest *)v12 initWithCommand:@"usage" dataClass:@"Drive" parameters:v14];
  id v16 = [(ATRemoteFileManager *)self _sendRequest:v15 error:a7];
  id v17 = [v16 parameters];
  id v18 = v17;
  if (v17)
  {
    if (a4)
    {
      dispatch_semaphore_t v19 = [v17 objectForKeyedSubscript:@"count"];
      *a4 = [v19 unsignedIntegerValue];
    }
    if (a5)
    {
      BOOL v20 = [v18 objectForKeyedSubscript:@"size"];
      *a5 = [v20 unsignedIntegerValue];
    }
  }
  if (v16)
  {
    BOOL v21 = [v16 error];
    BOOL v22 = v21 == 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [ATRequest alloc];
  id v16 = v7;
  id v17 = @"paths";
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  v18[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  id v11 = [(ATRequest *)v8 initWithCommand:@"directoryContents" dataClass:@"Drive" parameters:v10];
  id v12 = [(ATRemoteFileManager *)self _sendRequest:v11 error:a5];
  uint64_t v13 = [v12 parameters];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"results"];

  return v14;
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [ATRequest alloc];
  id v17 = v7;
  id v18 = @"paths";
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v19[0] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  id v11 = [(ATRequest *)v8 initWithCommand:@"createDirectory" dataClass:@"Drive" parameters:v10];
  id v12 = [(ATRemoteFileManager *)self _sendRequest:v11 error:a5];
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 error];
    BOOL v15 = v14 == 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)progressUpdatedWithPercentage:(double)a3 size:(unint64_t)a4
{
  void v14[2] = *MEMORY[0x263EF8340];
  id v7 = [ATRequest alloc];
  v13[0] = @"percentage";
  id v8 = [NSNumber numberWithDouble:a3];
  v13[1] = @"size";
  v14[0] = v8;
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:a4];
  v14[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v11 = [(ATRequest *)v7 initWithCommand:@"progress" dataClass:@"Drive" parameters:v10];

  id v12 = [(ATRemoteFileManager *)self _sendRequest:v11 error:0];
}

- (id)_readStreamData:(id)a3 error:(id *)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 open];
  id v5 = objc_alloc_init(MEMORY[0x263EFF990]);
  uint64_t v6 = [v4 read:v9 maxLength:1024];
  if (v6 >= 1)
  {
    for (uint64_t i = v6; i > 0; uint64_t i = [v4 read:v9 maxLength:1024])
      [v5 appendBytes:v9 length:i];
  }

  return v5;
}

- (id)_sendRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__1186;
  uint64_t v30 = __Block_byref_object_dispose__1187;
  id v31 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__1186;
  id v24 = __Block_byref_object_dispose__1187;
  id v25 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(ATRemoteFileManager *)self messageLink];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __42__ATRemoteFileManager__sendRequest_error___block_invoke;
  v16[3] = &unk_264281130;
  id v18 = &v20;
  dispatch_semaphore_t v19 = &v26;
  uint64_t v9 = v7;
  id v17 = v9;
  [v8 sendRequest:v6 withCompletion:v16];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v10 = [(id)v21[5] error];

  if (v10)
  {
    uint64_t v11 = [(id)v21[5] error];
    id v12 = (void *)v27[5];
    v27[5] = v11;
  }
  if (a4)
  {
    uint64_t v13 = (void *)v27[5];
    if (v13) {
      *a4 = v13;
    }
  }
  id v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __42__ATRemoteFileManager__sendRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (ATRemoteFileManager)initWithMessageLink:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATRemoteFileManager;
  id v6 = [(ATRemoteFileManager *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageLink, a3);
  }

  return v7;
}

@end