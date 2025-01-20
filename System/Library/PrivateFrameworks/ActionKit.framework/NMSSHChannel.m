@interface NMSSHChannel
- (BOOL)downloadFile:(id)a3 to:(id)a4;
- (BOOL)downloadFile:(id)a3 to:(id)a4 progress:(id)a5;
- (BOOL)openChannel:(id *)a3;
- (BOOL)requestPty;
- (BOOL)requestSizeWidth:(unint64_t)a3 height:(unint64_t)a4;
- (BOOL)sendEOF;
- (BOOL)startShell:(id *)a3;
- (BOOL)uploadFile:(id)a3 to:(id)a4;
- (BOOL)uploadFile:(id)a3 to:(id)a4 progress:(id)a5;
- (BOOL)write:(id)a3 error:(id *)a4;
- (BOOL)write:(id)a3 error:(id *)a4 timeout:(id)a5;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 error:(id *)a4 timeout:(id)a5;
- (NMSSHChannel)initWithSession:(id)a3;
- (NMSSHChannelDelegate)delegate;
- (NMSSHSession)session;
- (NSData)lastResponse;
- (NSDictionary)environmentVariables;
- (OS_dispatch_source)source;
- (_LIBSSH2_CHANNEL)channel;
- (const)ptyTerminalName;
- (id)execute:(id)a3 error:(id *)a4;
- (id)execute:(id)a3 error:(id *)a4 timeout:(id)a5;
- (id)readResponseWithError:(id *)a3 timeout:(id)a4 userInfo:(id)a5;
- (int64_t)ptyTerminalType;
- (int64_t)type;
- (unint64_t)bufferSize;
- (void)closeChannel;
- (void)closeShell;
- (void)executeCommandAsynchronously:(id)a3;
- (void)setBufferSize:(unint64_t)a3;
- (void)setChannel:(_LIBSSH2_CHANNEL *)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvironmentVariables:(id)a3;
- (void)setLastResponse:(id)a3;
- (void)setPtyTerminalName:(const char *)a3;
- (void)setPtyTerminalType:(int64_t)a3;
- (void)setRequestPty:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setSource:(id)a3;
- (void)setType:(int64_t)a3;
- (void)waitEOF;
@end

@implementation NMSSHChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_lastResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setSource:(id)a3
{
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setPtyTerminalName:(const char *)a3
{
  self->_ptyTerminalName = a3;
}

- (void)setChannel:(_LIBSSH2_CHANNEL *)a3
{
  self->_channel = a3;
}

- (_LIBSSH2_CHANNEL)channel
{
  return self->_channel;
}

- (void)setEnvironmentVariables:(id)a3
{
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setPtyTerminalType:(int64_t)a3
{
  self->_ptyTerminalType = a3;
}

- (int64_t)ptyTerminalType
{
  return self->_ptyTerminalType;
}

- (void)setRequestPty:(BOOL)a3
{
  self->_requestPty = a3;
}

- (BOOL)requestPty
{
  return self->_requestPty;
}

- (void)setLastResponse:(id)a3
{
}

- (NSData)lastResponse
{
  return self->_lastResponse;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setDelegate:(id)a3
{
}

- (NMSSHChannelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NMSSHChannelDelegate *)WeakRetained;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setSession:(id)a3
{
}

- (NMSSHSession)session
{
  return self->_session;
}

- (BOOL)downloadFile:(id)a3 to:(id)a4 progress:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (uint64_t (**)(id, uint64_t, void))a5;
  if ([(NMSSHChannel *)self channel])
  {
    v11 = +[NMSSHLogger sharedLogger];
    v12 = [NSString stringWithFormat:@"The channel will be closed before continue"];
    [v11 logWarn:v12];

    if ([(NMSSHChannel *)self type] == 2) {
      [(NMSSHChannel *)self closeShell];
    }
    else {
      [(NMSSHChannel *)self closeChannel];
    }
  }
  v13 = [v9 stringByExpandingTildeInPath];

  if ([v13 hasSuffix:@"/"])
  {
    v14 = [v8 componentsSeparatedByString:@"/"];
    v15 = [v14 lastObject];
    uint64_t v16 = [v13 stringByAppendingString:v15];

    v13 = (void *)v16;
  }
  v17 = [(NMSSHChannel *)self session];
  libssh2_session_set_blocking([v17 rawSession], 1);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  memset(v46, 0, sizeof(v46));
  v18 = [(NMSSHChannel *)self session];
  uint64_t v19 = [v18 rawSession];
  id v20 = v8;
  libssh2_scp_recv(v19, (char *)[v20 UTF8String], (uint64_t)v46);
  uint64_t v22 = v21;

  if (!v22)
  {
    v37 = +[NMSSHLogger sharedLogger];
    v38 = [NSString stringWithFormat:@"Unable to open SCP session"];
    [v37 logError:v38];

    BOOL v36 = 0;
    goto LABEL_29;
  }
  id v45 = v20;
  [(NMSSHChannel *)self setChannel:v22];
  [(NMSSHChannel *)self setType:3];
  v23 = [MEMORY[0x263F08850] defaultManager];
  int v24 = [v23 fileExistsAtPath:v13];

  if (v24)
  {
    v25 = +[NMSSHLogger sharedLogger];
    v26 = [NSString stringWithFormat:@"A file already exists at %@, it will be overwritten", v13];
    [v25 logInfo:v26];

    v27 = [MEMORY[0x263F08850] defaultManager];
    [v27 removeItemAtPath:v13 error:0];
  }
  int v28 = open((const char *)[v13 UTF8String], 513, 420);
  if ((uint64_t)v47 < 1)
  {
LABEL_22:
    close(v28);
    [(NMSSHChannel *)self closeChannel];
    BOOL v36 = 1;
    goto LABEL_28;
  }
  uint64_t v29 = 0;
  while (1)
  {
    unint64_t v30 = [(NMSSHChannel *)self bufferSize];
    size_t v31 = v30;
    v32 = (char *)&v44 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v33 = (uint64_t)v47 - v29 >= v30 ? v30 : v47 - v29;
    int64_t v34 = libssh2_channel_read_ex((uint64_t)[(NMSSHChannel *)self channel], 0, (uint64_t)v32, v33);
    int64_t v35 = v34;
    if (v34 < 1) {
      break;
    }
    if (write(v28, v32, v34) < (unint64_t)v34)
    {
      v39 = +[NMSSHLogger sharedLogger];
      v40 = NSString;
      v41 = @"Failed to write to local file";
      goto LABEL_26;
    }
    v29 += v35;
    if (v10 && (v10[2](v10, v29, v47) & 1) == 0) {
      goto LABEL_27;
    }
LABEL_21:
    bzero(v32, v31);
    if (v29 >= (uint64_t)v47) {
      goto LABEL_22;
    }
  }
  if ((v34 & 0x8000000000000000) == 0) {
    goto LABEL_21;
  }
  v39 = +[NMSSHLogger sharedLogger];
  v40 = NSString;
  v41 = @"Failed to read SCP data";
LABEL_26:
  v42 = [v40 stringWithFormat:v41];
  [v39 logError:v42];

LABEL_27:
  close(v28);
  [(NMSSHChannel *)self closeChannel];
  BOOL v36 = 0;
LABEL_28:
  id v20 = v45;
LABEL_29:

  return v36;
}

- (BOOL)downloadFile:(id)a3 to:(id)a4
{
  return [(NMSSHChannel *)self downloadFile:a3 to:a4 progress:0];
}

- (BOOL)uploadFile:(id)a3 to:(id)a4 progress:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (unsigned int (**)(id, void))a5;
  if ([(NMSSHChannel *)self channel])
  {
    v11 = +[NMSSHLogger sharedLogger];
    v12 = [NSString stringWithFormat:@"The channel will be closed before continue"];
    [v11 logWarn:v12];

    if ([(NMSSHChannel *)self type] == 2) {
      [(NMSSHChannel *)self closeShell];
    }
    else {
      [(NMSSHChannel *)self closeChannel];
    }
  }
  v13 = [v8 stringByExpandingTildeInPath];

  if ([v9 hasSuffix:@"/"])
  {
    v14 = [v13 componentsSeparatedByString:@"/"];
    v15 = [v14 lastObject];
    uint64_t v16 = [v9 stringByAppendingString:v15];

    id v9 = (id)v16;
  }
  id v17 = v13;
  v18 = fopen((const char *)[v17 UTF8String], "rb");
  if (v18)
  {
    uint64_t v19 = [(NMSSHChannel *)self session];
    libssh2_session_set_blocking([v19 rawSession], 1);

    memset(&v43, 0, sizeof(v43));
    stat((const char *)[v17 UTF8String], &v43);
    id v20 = [(NMSSHChannel *)self session];
    uint64_t v21 = [v20 rawSession];
    uint64_t v22 = (char *)[v9 UTF8String];
    uint64_t v23 = libssh2_scp_send64(v21, v22, v43.st_mode & 0x1A4, v43.st_size, 0, 0);

    if (v23)
    {
      v42 = v18;
      id v40 = v17;
      id v41 = v9;
      [(NMSSHChannel *)self setChannel:v23];
      [(NMSSHChannel *)self setType:3];
      size_t v24 = [(NMSSHChannel *)self bufferSize];
      uint64_t v39 = (uint64_t)&v39;
      uint64_t v25 = 0;
LABEL_10:
      size_t v26 = fread((char *)&v39 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), 1uLL, v24, v42);
      LOBYTE(v18) = v26 == 0;
      if (v26)
      {
        unint64_t v27 = v26;
        int v28 = (char *)&v39 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
        while (1)
        {
          uint64_t v29 = libssh2_channel_write_ex((uint64_t)[(NMSSHChannel *)self channel], 0, v28, v27);
          if (v29 < 0) {
            break;
          }
          uint64_t v30 = v29;
          v25 += v29;
          if (v10 && !v10[2](v10, v25)) {
            goto LABEL_20;
          }
          v28 += v30;
          v27 -= v30;
          if (!v27) {
            goto LABEL_10;
          }
        }
        int64_t v35 = +[NMSSHLogger sharedLogger];
        BOOL v36 = [NSString stringWithFormat:@"Failed writing file"];
        [v35 logError:v36];

        LOBYTE(v18) = 0;
        id v9 = v41;
        id v17 = v40;
      }
      else
      {
LABEL_20:
        fclose(v42);
        BOOL v37 = [(NMSSHChannel *)self sendEOF];
        id v9 = v41;
        id v17 = v40;
        if (v37) {
          [(NMSSHChannel *)self waitEOF];
        }
      }
      [(NMSSHChannel *)self closeChannel];
    }
    else
    {
      unint64_t v33 = +[NMSSHLogger sharedLogger];
      int64_t v34 = [NSString stringWithFormat:@"Unable to open SCP session"];
      [v33 logError:v34];

      fclose(v18);
      LOBYTE(v18) = 0;
    }
  }
  else
  {
    size_t v31 = +[NMSSHLogger sharedLogger];
    v32 = [NSString stringWithFormat:@"Can't read local file"];
    [v31 logError:v32];
  }
  return (char)v18;
}

- (BOOL)uploadFile:(id)a3 to:(id)a4
{
  return [(NMSSHChannel *)self uploadFile:a3 to:a4 progress:0];
}

- (BOOL)requestSizeWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint64_t v4 = libssh2_channel_request_pty_size_ex((uint64_t)[(NMSSHChannel *)self channel], a3, a4, 0, 0);
  if (v4)
  {
    v5 = +[NMSSHLogger sharedLogger];
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"Request size failed with error %i", v4);
    [v5 logError:v6];
  }
  return v4 == 0;
}

- (BOOL)writeData:(id)a3 error:(id *)a4 timeout:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(NMSSHChannel *)self openChannel:a4])
  {
    v10 = +[NMSSHLogger sharedLogger];
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"Writing %lu bytes", objc_msgSend(v8, "length"));
    [v10 logVerbose:v11];

    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    size_t v24 = __Block_byref_object_copy__16402;
    uint64_t v25 = __Block_byref_object_dispose__16403;
    id v26 = 0;
    double Current = CFAbsoluteTimeGetCurrent();
    [v9 doubleValue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __40__NMSSHChannel_writeData_error_timeout___block_invoke;
    v17[3] = &unk_264E58138;
    v17[4] = self;
    double v20 = Current + v13;
    id v18 = v9;
    uint64_t v19 = &v21;
    [v8 enumerateByteRangesUsingBlock:v17];
    v14 = (void *)v22[5];
    BOOL v15 = v14 == 0;
    if (a4 && v14) {
      *a4 = v14;
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __40__NMSSHChannel_writeData_error_timeout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unsigned char *a5)
{
  v33[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    unint64_t v6 = a4;
    uint64_t v9 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v10 = libssh2_channel_write_ex([*(id *)(a1 + 32) channel], 0, (const void *)(a2 + v9), v6);
        if (v10 != -37) {
          break;
        }
        if ([*(id *)(a1 + 40) longValue] >= 1)
        {
          double v11 = *(double *)(a1 + 56);
          if (v11 < CFAbsoluteTimeGetCurrent())
          {
            BOOL v15 = (void *)MEMORY[0x263F087E8];
            uint64_t v32 = *MEMORY[0x263F08320];
            v33[0] = @"Connection timed out";
            uint64_t v16 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
            uint64_t v17 = [v15 errorWithDomain:@"NMSSH" code:3 userInfo:v16];
            uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v19 = *(void **)(v18 + 40);
            *(void *)(v18 + 40) = v17;

            if (!a5) {
              return;
            }
            goto LABEL_11;
          }
        }
        v12 = [*(id *)(a1 + 32) session];
        CFSocketNativeHandle Native = CFSocketGetNative((CFSocketRef)[v12 socket]);
        v14 = [*(id *)(a1 + 32) session];
        waitsocket(Native, [v14 rawSession]);
      }
      if (v10 < 0) {
        break;
      }
      v9 += v10;
      v6 -= v10;
      if (!v6) {
        return;
      }
    }
    double v20 = +[NMSSHLogger sharedLogger];
    uint64_t v21 = [NSString stringWithFormat:@"Error writing"];
    [v20 logError:v21];

    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v23 = [*(id *)(a1 + 32) session];
    size_t v24 = [v23 lastError];
    uint64_t v25 = [v24 localizedDescription];
    size_t v31 = v25;
    id v26 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v27 = [v22 errorWithDomain:@"NMSSH" code:6 userInfo:v26];
    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    if (a5) {
LABEL_11:
    }
      *a5 = 1;
  }
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  return [(NMSSHChannel *)self writeData:a3 error:a4 timeout:&unk_26F0754F8];
}

- (BOOL)write:(id)a3 error:(id *)a4 timeout:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a3 dataUsingEncoding:4];
  LOBYTE(a4) = [(NMSSHChannel *)self writeData:v9 error:a4 timeout:v8];

  return (char)a4;
}

- (BOOL)write:(id)a3 error:(id *)a4
{
  return [(NMSSHChannel *)self write:a3 error:a4 timeout:&unk_26F0754F8];
}

- (void)closeShell
{
  v3 = [(NMSSHChannel *)self source];

  if (v3)
  {
    uint64_t v4 = [(NMSSHChannel *)self source];
    dispatch_source_cancel(v4);
  }
  if ([(NMSSHChannel *)self type] == 2)
  {
    v5 = [(NMSSHChannel *)self session];
    libssh2_session_set_blocking([v5 rawSession], 1);

    [(NMSSHChannel *)self sendEOF];
  }
  [(NMSSHChannel *)self closeChannel];
}

- (BOOL)startShell:(id *)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  v5 = +[NMSSHLogger sharedLogger];
  unint64_t v6 = [NSString stringWithFormat:@"Starting shell"];
  [v5 logInfo:v6];

  if (![(NMSSHChannel *)self openChannel:a3]) {
    return 0;
  }
  v7 = [(NMSSHChannel *)self session];
  libssh2_session_set_blocking([v7 rawSession], 0);

  [(NMSSHChannel *)self setLastResponse:0];
  id v8 = [(NMSSHChannel *)self session];
  uintptr_t Native = CFSocketGetNative((CFSocketRef)[v8 socket]);
  uint64_t v10 = dispatch_get_global_queue(2, 0);
  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x263EF83E8], Native, 0, v10);
  [(NMSSHChannel *)self setSource:v11];

  v12 = [(NMSSHChannel *)self source];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __27__NMSSHChannel_startShell___block_invoke;
  handler[3] = &unk_264E5EE70;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);

  double v13 = [(NMSSHChannel *)self source];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __27__NMSSHChannel_startShell___block_invoke_2;
  v29[3] = &unk_264E5EE70;
  v29[4] = self;
  dispatch_source_set_cancel_handler(v13, v29);

  v14 = [(NMSSHChannel *)self source];
  dispatch_resume(v14);
  while (1)
  {

    int v15 = libssh2_channel_process_startup((uint64_t)[(NMSSHChannel *)self channel], "shell", 5u, 0, 0);
    if (v15 != -37) {
      break;
    }
    v14 = [(NMSSHChannel *)self session];
    CFSocketNativeHandle v16 = CFSocketGetNative((CFSocketRef)[v14 socket]);
    uint64_t v17 = [(NMSSHChannel *)self session];
    waitsocket(v16, [v17 rawSession]);
  }
  int v19 = v15;
  BOOL v18 = v15 == 0;
  double v20 = +[NMSSHLogger sharedLogger];
  if (v19)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Shell request error"];
    [v20 logError:v21];

    if (a3)
    {
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      uint64_t v23 = [(NMSSHChannel *)self session];
      size_t v24 = [v23 lastError];
      uint64_t v25 = [v24 localizedDescription];
      v32[0] = v25;
      id v26 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      *a3 = [v22 errorWithDomain:@"NMSSH" code:5 userInfo:v26];
    }
    [(NMSSHChannel *)self closeShell];
  }
  else
  {
    uint64_t v27 = [NSString stringWithFormat:@"Shell allocated"];
    [v20 logVerbose:v27];

    [(NMSSHChannel *)self setType:2];
  }
  return v18;
}

void __27__NMSSHChannel_startShell___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v2 = +[NMSSHLogger sharedLogger];
  v3 = [NSString stringWithFormat:@"Data available on the socket!"];
  [v2 logVerbose:v3];

  unint64_t v4 = [*(id *)(a1 + 32) bufferSize];
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (![*(id *)(a1 + 32) channel]) {
    return;
  }
  id v40 = sel_channel_didReadError_;
  id v41 = sel_channel_didReadRawError_;
  v42 = sel_channel_didReadData_;
  while (1)
  {
    int64_t v6 = libssh2_channel_read_ex(objc_msgSend(*(id *)(a1 + 32), "channel", v40, v41, v42), 0, (uint64_t)v5, v4);
    int64_t v7 = libssh2_channel_read_ex([*(id *)(a1 + 32) channel], 1, (uint64_t)v5, v4);
    int64_t v8 = v7;
    if (v6 < 0 && v7 < 0) {
      break;
    }
    if (v6 >= 1)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v5 length:v6];
      uint64_t v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
      dispatch_source_t v11 = *(void **)(a1 + 32);
      v12 = (void *)[v10 copy];
      [v11 setLastResponse:v12];

      if (v10)
      {
        uint64_t v13 = [*(id *)(a1 + 32) delegate];
        if (v13)
        {
          v14 = (void *)v13;
          int v15 = [*(id *)(a1 + 32) delegate];
          char v16 = objc_opt_respondsToSelector();

          if (v16)
          {
            uint64_t v17 = [*(id *)(a1 + 32) delegate];
            BOOL v18 = *(void **)(a1 + 32);
            int v19 = [v18 lastResponse];
            [v17 channel:v18 didReadData:v19];
          }
        }
      }
      uint64_t v20 = [*(id *)(a1 + 32) delegate];
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        uint64_t v22 = [*(id *)(a1 + 32) delegate];
        char v23 = objc_opt_respondsToSelector();

        if (v23)
        {
          size_t v24 = [*(id *)(a1 + 32) delegate];
          [v24 channel:*(void *)(a1 + 32) didReadRawData:v9];
          goto LABEL_21;
        }
      }
      goto LABEL_22;
    }
    if (v7 >= 1)
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v5 length:v7];
      uint64_t v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
      if (v10)
      {
        uint64_t v25 = [*(id *)(a1 + 32) delegate];
        if (v25)
        {
          id v26 = (void *)v25;
          uint64_t v27 = [*(id *)(a1 + 32) delegate];
          char v28 = objc_opt_respondsToSelector();

          if (v28)
          {
            uint64_t v29 = [*(id *)(a1 + 32) delegate];
            [v29 channel:*(void *)(a1 + 32) didReadError:v10];
          }
        }
      }
      uint64_t v30 = [*(id *)(a1 + 32) delegate];
      if (v30)
      {
        uint64_t v31 = (void *)v30;
        uint64_t v32 = [*(id *)(a1 + 32) delegate];
        char v33 = objc_opt_respondsToSelector();

        if (v33)
        {
          size_t v24 = [*(id *)(a1 + 32) delegate];
          [v24 channel:*(void *)(a1 + 32) didReadRawError:v9];
LABEL_21:
        }
      }
LABEL_22:

      goto LABEL_23;
    }
    if (libssh2_channel_eof([*(id *)(a1 + 32) channel]) == 1)
    {
      int64_t v34 = +[NMSSHLogger sharedLogger];
      int64_t v35 = NSString;
      BOOL v36 = @"Host EOF received, closing channel...";
LABEL_30:
      uint64_t v39 = [v35 stringWithFormat:v36];
      [v34 logVerbose:v39];

      [*(id *)(a1 + 32) closeShell];
      return;
    }
LABEL_23:
    if (![*(id *)(a1 + 32) channel]) {
      return;
    }
  }
  BOOL v37 = +[NMSSHLogger sharedLogger];
  v38 = [NSString stringWithFormat:@"Return code of response %ld, error %ld", v6, v8];
  [v37 logVerbose:v38];

  if (v6 == -43 || v8 == -43)
  {
    int64_t v34 = +[NMSSHLogger sharedLogger];
    int64_t v35 = NSString;
    BOOL v36 = @"Error received, closing channel...";
    goto LABEL_30;
  }
}

void __27__NMSSHChannel_startShell___block_invoke_2(uint64_t a1)
{
  v2 = +[NMSSHLogger sharedLogger];
  v3 = [NSString stringWithFormat:@"Shell source cancelled"];
  [v2 logVerbose:v3];

  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  if (v4)
  {
    v5 = (void *)v4;
    int64_t v6 = [*(id *)(a1 + 32) delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) delegate];
      [v8 channelShellDidClose:*(void *)(a1 + 32)];
    }
  }
}

- (void)executeCommandAsynchronously:(id)a3
{
  id v10 = a3;
  uint64_t v4 = +[NMSSHLogger sharedLogger];
  v5 = [NSString stringWithFormat:@"Exec command %@", v10];
  [v4 logInfo:v5];

  if ([(NMSSHChannel *)self openChannel:0])
  {
    libssh2_channel_set_blocking((uint64_t)[(NMSSHChannel *)self channel], 0);
    int64_t v6 = [(NMSSHChannel *)self channel];
    id v7 = v10;
    id v8 = (const void *)[v7 UTF8String];
    unsigned int v9 = strlen((const char *)[v7 UTF8String]);
    libssh2_channel_process_startup((uint64_t)v6, "exec", 4u, v8, v9);
    libssh2_channel_set_blocking((uint64_t)[(NMSSHChannel *)self channel], 1);
  }
}

- (id)readResponseWithError:(id *)a3 timeout:(id)a4 userInfo:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v51 = a5;
  unsigned int v9 = (void *)[v51 mutableCopy];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v58 = v11;

  v12 = [(NMSSHChannel *)self session];
  libssh2_session_set_blocking([v12 rawSession], 0);

  double Current = CFAbsoluteTimeGetCurrent();
  [v8 doubleValue];
  double v15 = Current + v14;
  id v16 = objc_alloc_init(MEMORY[0x263EFF990]);
  uint64_t v55 = *MEMORY[0x263F08320];
  uint64_t v53 = *MEMORY[0x263F08338];
  id v54 = v16;
  while (2)
  {
    unint64_t v17 = [(NMSSHChannel *)self bufferSize];
    v52 = &v50;
    BOOL v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v19 = [(NMSSHChannel *)self bufferSize];
    uint64_t v56 = (uint64_t)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v57 = v19;
    do
    {
      int64_t v20 = libssh2_channel_read_ex((uint64_t)[(NMSSHChannel *)self channel], 0, (uint64_t)v18, v17);
      if (v20 >= 1) {
        [v16 appendBytes:v18 length:v20];
      }
      int exit_status = libssh2_channel_get_exit_status((uint64_t)[(NMSSHChannel *)self channel]);
      if (a3 && exit_status)
      {
        uint64_t v22 = [(NMSSHChannel *)self channel];
        uint64_t v23 = v56;
        id v24 = v8;
        unint64_t v25 = libssh2_channel_read_ex((uint64_t)v22, 1, v56, v57);
        uint64_t v26 = [[NSString alloc] initWithBytes:v23 length:v25 encoding:4];
        if (v26) {
          uint64_t v27 = (__CFString *)v26;
        }
        else {
          uint64_t v27 = @"An unspecified error occurred";
        }
        char v28 = a3;
        id v29 = v58;
        [v58 setObject:v27 forKey:v55];
        uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%zi", v25);
        [v29 setObject:v30 forKey:v53];

        id v8 = v24;
        id v31 = v29;
        a3 = v28;
        id v16 = v54;
        *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"NMSSH" code:0 userInfo:v31];
      }
      int v32 = libssh2_channel_eof((uint64_t)[(NMSSHChannel *)self channel]);
      if (!v20 || v32 == 1)
      {
        id v36 = v51;
        while (1)
        {
          int64_t v37 = libssh2_channel_read_ex((uint64_t)[(NMSSHChannel *)self channel], 0, (uint64_t)v18, v17);
          if (v37 < 1) {
            break;
          }
          [v16 appendBytes:v18 length:v37];
        }
LABEL_29:
        id v40 = (void *)[v16 copy];
        [(NMSSHChannel *)self setLastResponse:v40];

        [(NMSSHChannel *)self closeChannel];
        id v41 = [(NMSSHChannel *)self lastResponse];
        goto LABEL_30;
      }
      if ([v8 longValue] >= 1 && v15 < CFAbsoluteTimeGetCurrent())
      {
        if (a3)
        {
          id v38 = v58;
          [v58 setObject:@"Connection timed out" forKey:v55];
          *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"NMSSH" code:3 userInfo:v38];
        }
        id v36 = v51;
        while (1)
        {
          int64_t v39 = libssh2_channel_read_ex((uint64_t)[(NMSSHChannel *)self channel], 0, (uint64_t)v18, v17);
          if (v39 < 1) {
            break;
          }
          [v16 appendBytes:v18 length:v39];
        }
        goto LABEL_29;
      }
    }
    while (v20 > 0);
    if (v20 == -37)
    {
      char v33 = [(NMSSHChannel *)self session];
      CFSocketNativeHandle Native = CFSocketGetNative((CFSocketRef)[v33 socket]);
      int64_t v35 = [(NMSSHChannel *)self session];
      waitsocket(Native, [v35 rawSession]);

      continue;
    }
    break;
  }
  if (a3)
  {
    uint64_t v43 = [(NMSSHChannel *)self session];
    uint64_t v44 = [v43 lastError];
    id v45 = [v44 localizedDescription];
    v46 = a3;
    id v47 = v58;
    [v58 setObject:v45 forKey:v55];

    id *v46 = [MEMORY[0x263F087E8] errorWithDomain:@"NMSSH" code:1 userInfo:v47];
    id v16 = v54;
  }
  long long v48 = +[NMSSHLogger sharedLogger];
  long long v49 = [NSString stringWithFormat:@"Error fetching response from command"];
  [v48 logError:v49];

  [(NMSSHChannel *)self closeChannel];
  id v41 = 0;
  id v36 = v51;
LABEL_30:

  return v41;
}

- (id)execute:(id)a3 error:(id *)a4 timeout:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[NMSSHLogger sharedLogger];
  id v11 = [NSString stringWithFormat:@"Exec command %@", v8];
  [v10 logInfo:v11];

  v12 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v8 forKey:@"command"];
  if ([(NMSSHChannel *)self openChannel:a4])
  {
    [(NMSSHChannel *)self setLastResponse:0];
    [(NMSSHChannel *)self setType:1];
    uint64_t v13 = [(NMSSHChannel *)self channel];
    id v14 = v8;
    double v15 = (const void *)[v14 UTF8String];
    unsigned int v16 = strlen((const char *)[v14 UTF8String]);
    uint64_t v17 = libssh2_channel_process_startup((uint64_t)v13, "exec", 4u, v15, v16);
    if (!v17)
    {
      uint64_t v27 = [(NMSSHChannel *)self readResponseWithError:a4 timeout:v9 userInfo:v12];
      if (v27) {
        unint64_t v25 = (void *)[[NSString alloc] initWithData:v27 encoding:4];
      }
      else {
        unint64_t v25 = 0;
      }

      goto LABEL_7;
    }
    if (a4)
    {
      uint64_t v18 = v17;
      unint64_t v19 = [(NMSSHChannel *)self session];
      int64_t v20 = [v19 lastError];
      uint64_t v21 = [v20 localizedDescription];
      [v12 setObject:v21 forKey:*MEMORY[0x263F08320]];

      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v18);
      [v12 setObject:v22 forKey:*MEMORY[0x263F08338]];

      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"NMSSH" code:0 userInfo:v12];
    }
    uint64_t v23 = +[NMSSHLogger sharedLogger];
    id v24 = [NSString stringWithFormat:@"Error executing command"];
    [v23 logError:v24];

    [(NMSSHChannel *)self closeChannel];
  }
  unint64_t v25 = 0;
LABEL_7:

  return v25;
}

- (id)execute:(id)a3 error:(id *)a4
{
  return [(NMSSHChannel *)self execute:a3 error:a4 timeout:&unk_26F0754F8];
}

- (const)ptyTerminalName
{
  int64_t v2 = [(NMSSHChannel *)self ptyTerminalType];
  if ((unint64_t)(v2 - 1) > 4) {
    return "vanilla";
  }
  else {
    return off_264E58158[v2 - 1];
  }
}

- (void)waitEOF
{
  if (!libssh2_channel_eof((uint64_t)[(NMSSHChannel *)self channel]))
  {
    uint64_t v3 = libssh2_channel_wait_eof((uint64_t)[(NMSSHChannel *)self channel]);
    id v5 = +[NMSSHLogger sharedLogger];
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Received host acknowledge for EOF (return code = %i)", v3);
    [v5 logVerbose:v4];
  }
}

- (BOOL)sendEOF
{
  uint64_t v2 = libssh2_channel_send_eof((uint64_t)[(NMSSHChannel *)self channel]);
  uint64_t v3 = +[NMSSHLogger sharedLogger];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Sent EOF to host (return code = %i)", v2);
  [v3 logVerbose:v4];

  return v2 == 0;
}

- (void)closeChannel
{
  uint64_t v3 = [(NMSSHChannel *)self session];
  libssh2_session_set_blocking([v3 rawSession], 1);

  if ([(NMSSHChannel *)self channel])
  {
    if (!libssh2_channel_close((uint64_t)[(NMSSHChannel *)self channel])) {
      libssh2_channel_wait_closed((uint64_t)[(NMSSHChannel *)self channel]);
    }
    libssh2_channel_free((uint64_t)[(NMSSHChannel *)self channel]);
    [(NMSSHChannel *)self setType:0];
    [(NMSSHChannel *)self setChannel:0];
  }
}

- (BOOL)openChannel:(id *)a3
{
  uint64_t v4 = self;
  v60[1] = *MEMORY[0x263EF8340];
  if ([(NMSSHChannel *)self channel]) {
    return 1;
  }
  int64_t v6 = [(NMSSHChannel *)v4 session];
  libssh2_session_set_blocking([v6 rawSession], 1);

  id v7 = [(NMSSHChannel *)v4 session];
  uint64_t v8 = libssh2_channel_open_ex([v7 rawSession], "session", 7u, 0x200000u, 0x8000u, 0, 0);

  if (v8)
  {
    [(NMSSHChannel *)v4 setChannel:v8];
    id v9 = [(NMSSHChannel *)v4 environmentVariables];

    if (v9)
    {
      long long v48 = a3;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obj = [(NMSSHChannel *)v4 environmentVariables];
      uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      id v11 = v4;
      if (v10)
      {
        uint64_t v12 = v10;
        uint64_t v13 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v53 != v13) {
              objc_enumerationMutation(obj);
            }
            double v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned int v16 = [(NMSSHChannel *)v11 environmentVariables];
              uint64_t v17 = [v16 objectForKey:v15];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                uint64_t v50 = [(NMSSHChannel *)v11 channel];
                id v19 = v15;
                long long v49 = (const void *)[v19 UTF8String];
                id v20 = v19;
                int v21 = strlen((const char *)[v20 UTF8String]);
                uint64_t v22 = [(NMSSHChannel *)v11 environmentVariables];
                id v23 = [v22 objectForKey:v20];
                uint64_t v24 = v13;
                uint64_t v25 = [v23 UTF8String];
                [(NMSSHChannel *)v11 environmentVariables];
                v27 = uint64_t v26 = v11;
                id v28 = [v27 objectForKey:v20];
                int v29 = strlen((const char *)[v28 UTF8String]);
                uint64_t v30 = (const void *)v25;
                uint64_t v13 = v24;
                libssh2_channel_setenv_ex(v50, v49, v21, v30, v29);

                id v11 = v26;
              }
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v12);
      }

      a3 = v48;
      uint64_t v4 = v11;
    }
    if (![(NMSSHChannel *)v4 requestPty]) {
      return 1;
    }
    id v31 = v4;
    uint64_t v32 = [(NMSSHChannel *)v4 channel];
    char v33 = [(NMSSHChannel *)v31 ptyTerminalName];
    unsigned int v34 = strlen([(NMSSHChannel *)v31 ptyTerminalName]);
    if (!libssh2_channel_request_pty_ex(v32, v33, v34, 0, 0, 80, 24, 0, 0)) {
      return 1;
    }
    if (a3)
    {
      uint64_t v56 = *MEMORY[0x263F08320];
      int64_t v35 = NSString;
      uint64_t v36 = [(NMSSHChannel *)v31 ptyTerminalName];
      int64_t v37 = [(NMSSHChannel *)v31 session];
      id v38 = [v37 lastError];
      int64_t v39 = [v38 localizedDescription];
      id v40 = [v35 stringWithFormat:@"Error requesting %s pty: %@", v36, v39];
      unint64_t v57 = v40;
      id v41 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];

      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"NMSSH" code:2 userInfo:v41];
    }
    v42 = +[NMSSHLogger sharedLogger];
    uint64_t v43 = [NSString stringWithFormat:@"Error requesting pseudo terminal"];
    [v42 logError:v43];

    [(NMSSHChannel *)v31 closeChannel];
  }
  else
  {
    uint64_t v44 = +[NMSSHLogger sharedLogger];
    id v45 = [NSString stringWithFormat:@"Unable to open a session"];
    [v44 logError:v45];

    if (a3)
    {
      v46 = (void *)MEMORY[0x263F087E8];
      uint64_t v59 = *MEMORY[0x263F08320];
      v60[0] = @"Channel allocation error";
      id v47 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];
      *a3 = [v46 errorWithDomain:@"NMSSH" code:4 userInfo:v47];
    }
  }
  return 0;
}

- (NMSSHChannel)initWithSession:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMSSHChannel;
  id v5 = [(NMSSHChannel *)&v10 init];
  int64_t v6 = v5;
  if (v5)
  {
    [(NMSSHChannel *)v5 setSession:v4];
    [(NMSSHChannel *)v6 setBufferSize:0x4000];
    [(NMSSHChannel *)v6 setRequestPty:0];
    [(NMSSHChannel *)v6 setPtyTerminalType:0];
    [(NMSSHChannel *)v6 setType:0];
    id v7 = [(NMSSHChannel *)v6 session];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      objc_exception_throw(@"You have to provide a valid NMSSHSession!");
    }
  }

  return v6;
}

@end