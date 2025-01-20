@interface DTKTraceTapMemoHandlerDelegate
- (id)peekAtMemo:(id)a3;
- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4;
- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4;
- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4;
@end

@implementation DTKTraceTapMemoHandlerDelegate

- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isSession])
  {
    v7 = objc_opt_new();
    char v8 = [v5 isRawKtraceFile];
    v9 = [v5 datastream];
    v10 = v9;
    if (v8)
    {
      v11 = [v9 fileURL];
      if (!v11) {
        sub_23093D348();
      }

      if ([v10 hasData])
      {
        do
        {
          v12 = (void *)MEMORY[0x230FC2180]();
          v13 = [v10 read:0x100000 error:0];
          [v6 handleBulkData:v13];
        }
        while (([v10 hasData] & 1) != 0);
      }
      v14 = [MEMORY[0x263F08850] defaultManager];
      v15 = [v10 fileURL];
      [v14 removeItemAtURL:v15 error:0];
    }
    else
    {
      int v20 = [v9 hasData];

      if (v20)
      {
        do
        {
          v21 = [v5 datastream];
          uint64_t v22 = [v21 read:1024 error:0];
          [v6 handleBulkData:v22];

          v23 = [v5 datastream];
          LOBYTE(v22) = [v23 hasData];
        }
        while ((v22 & 1) != 0);
      }
    }
    if ([v5 isRawKtraceFile]) {
      uint64_t v24 = 1025;
    }
    else {
      uint64_t v24 = 6;
    }
    [v7 setKind:v24];
    [v6 sendFrameMessage:v7];
  }
  else
  {
    v16 = [v5 stackshot];

    if (v16)
    {
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x3032000000;
      v29 = sub_2308A2C04;
      v30 = sub_2308A2C14;
      id v31 = [v5 stackshot];
      bytes_ptr = xpc_data_get_bytes_ptr((xpc_object_t)v27[5]);
      size_t length = xpc_data_get_length((xpc_object_t)v27[5]);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = sub_2308A2C1C;
      v25[3] = &unk_264B8E278;
      v25[4] = &v26;
      [v6 handleBulkData:bytes_ptr size:length destructor:v25];
      v19 = objc_opt_new();
      [v19 setKind:1024];
      [v6 sendFrameMessage:v19];

      _Block_object_dispose(&v26, 8);
    }
  }
}

- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 datastream];
  if ([v5 isSession])
  {
    char v8 = [v6 sessionHandler];

    if (v8)
    {
      v9 = (void (**)(void, void))objc_opt_new();
      [v9 setMemo:v5];
      if (([v5 isRawKtraceFile] & 1) == 0)
      {
        v10 = objc_opt_new();
        if ([v7 hasData])
        {
          do
          {
            v11 = [v7 read:1024 error:0];
            [v10 addObject:v11];
          }
          while (([v7 hasData] & 1) != 0);
        }
        [v9 setDataBlocks:v10];
      }
      v12 = [v6 sessionHandler];
      v12[2](v12, v9);
      goto LABEL_11;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      sub_23093D374();
    }
  }
  else
  {
    v13 = [v5 stackshot];

    if (v13)
    {
      v14 = [v6 stackshotHandler];

      if (v14)
      {
        v9 = [v6 stackshotHandler];
        v12 = [v5 stackshot];
        v9[2](v9, v12);
LABEL_11:
      }
    }
  }
}

- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v5 sessionHandler];

  if (v6)
  {
    v7 = objc_opt_new();
    [v7 setMemo:v9];
    char v8 = [v5 sessionHandler];
    ((void (**)(void, void *))v8)[2](v8, v7);
  }
}

- (id)peekAtMemo:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if ([v3 isSession])
  {
    int v5 = [v3 isRawKtraceFile];
    id v6 = [v3 datastream];
    v7 = v6;
    if (v5)
    {
      char v8 = [v6 file];
      dup([v8 fileDescriptor]);
      ktrace_file_open_fd();

      ktrace_file_earliest_timestamp();
      id v9 = [NSNumber numberWithUnsignedLongLong:-1];
      [v4 setObject:v9 forKeyedSubscript:@"DTTapRecordingInfo_Timestamp"];

      ktrace_file_close();
    }
    else if (v6)
    {
      uint64_t v12 = kpdecode_cursor_create();
      if ([v7 hasData])
      {
        id v13 = [v7 peek:1024 error:0];
        [v13 bytes];
        [v13 length];
        if (kpdecode_cursor_setchunk())
        {
          uint64_t v14 = -1;
        }
        else
        {
          while (!kpdecode_cursor_next_record())
          {
            if ((MEMORY[0] & 0x8001) == 1)
            {
              uint64_t v14 = MEMORY[8];
              kpdecode_record_free();
              if (v14) {
                goto LABEL_18;
              }
            }
            else
            {
              kpdecode_record_free();
            }
          }
          uint64_t v14 = -1;
LABEL_18:
          kpdecode_cursor_clearchunk();
        }
        MEMORY[0x230FC18A0](v12);
      }
      else
      {
        uint64_t v14 = -1;
      }
      v15 = [NSNumber numberWithUnsignedLongLong:v14];
      [v4 setObject:v15 forKeyedSubscript:@"DTTapRecordingInfo_Timestamp"];
    }
    id v11 = v4;
  }
  else
  {
    v10 = [v3 stackshot];

    if (!v10) {
      sub_23093D3BC();
    }
    id v11 = 0;
  }

  return v11;
}

@end