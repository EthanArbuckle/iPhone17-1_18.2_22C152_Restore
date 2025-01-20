@interface NMSFTP
+ (id)connectWithSession:(id)a3;
- (BOOL)appendContents:(id)a3 toFileAtPath:(id)a4;
- (BOOL)appendStream:(id)a3 toFileAtPath:(id)a4;
- (BOOL)connect;
- (BOOL)copyContentsOfPath:(id)a3 toFileAtPath:(id)a4 progress:(id)a5;
- (BOOL)createDirectoryAtPath:(id)a3;
- (BOOL)createSymbolicLinkAtPath:(id)a3 withDestinationPath:(id)a4;
- (BOOL)directoryExistsAtPath:(id)a3;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)isConnected;
- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4;
- (BOOL)removeDirectoryAtPath:(id)a3;
- (BOOL)removeFileAtPath:(id)a3;
- (BOOL)writeContents:(id)a3 toFileAtPath:(id)a4;
- (BOOL)writeContents:(id)a3 toFileAtPath:(id)a4 progress:(id)a5;
- (BOOL)writeFileAtPath:(id)a3 toFileAtPath:(id)a4;
- (BOOL)writeFileAtPath:(id)a3 toFileAtPath:(id)a4 progress:(id)a5;
- (BOOL)writeStream:(id)a3 toFileAtPath:(id)a4;
- (BOOL)writeStream:(id)a3 toFileAtPath:(id)a4 progress:(id)a5;
- (BOOL)writeStream:(id)a3 toSFTPHandle:(_LIBSSH2_SFTP_HANDLE *)a4;
- (BOOL)writeStream:(id)a3 toSFTPHandle:(_LIBSSH2_SFTP_HANDLE *)a4 progress:(id)a5;
- (NMSFTP)initWithSession:(id)a3;
- (NMSSHSession)session;
- (_LIBSSH2_SFTP)sftpSession;
- (_LIBSSH2_SFTP_HANDLE)openDirectoryAtPath:(id)a3;
- (_LIBSSH2_SFTP_HANDLE)openFileAtPath:(id)a3 flags:(unint64_t)a4 mode:(int64_t)a5;
- (id)contentsAtPath:(id)a3;
- (id)contentsAtPath:(id)a3 progress:(id)a4;
- (id)contentsOfDirectoryAtPath:(id)a3;
- (id)infoForFileAtPath:(id)a3;
- (void)disconnect;
- (void)setConnected:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setSftpSession:(_LIBSSH2_SFTP *)a3;
@end

@implementation NMSFTP

- (void).cxx_destruct
{
}

- (void)setSftpSession:(_LIBSSH2_SFTP *)a3
{
  self->_sftpSession = a3;
}

- (_LIBSSH2_SFTP)sftpSession
{
  return self->_sftpSession;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setSession:(id)a3
{
}

- (NMSSHSession)session
{
  return self->_session;
}

- (BOOL)copyContentsOfPath:(id)a3 toFileAtPath:(id)a4 progress:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (uint64_t (**)(id, void, uint64_t))a5;
  v11 = [(NMSFTP *)self openFileAtPath:v8 flags:1 mode:0];
  v12 = [(NMSFTP *)self openFileAtPath:v9 flags:11 mode:420];
  v13 = [(NMSFTP *)self infoForFileAtPath:v8];
  if (v13)
  {
    id v24 = v9;
    id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
    uint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = libssh2_sftp_read((uint64_t)v11, v25, 0x4000uLL);
      BOOL v17 = v16 < 1;
      if (v16 < 1) {
        break;
      }
      unint64_t v18 = v16;
      [v14 appendBytes:v25 length:v16];
      libssh2_sftp_write(v12, (uint64_t)v25, v18);
      v15 += v18;
      if (v10)
      {
        v19 = [v13 fileSize];
        char v20 = v10[2](v10, v15, [v19 integerValue]);

        if ((v20 & 1) == 0) {
          break;
        }
      }
    }
    libssh2_sftp_close_handle((uint64_t)v11);
    libssh2_sftp_close_handle((uint64_t)v12);

    id v9 = v24;
  }
  else
  {
    v21 = +[NMSSHLogger sharedLogger];
    v22 = [NSString stringWithFormat:@"contentsAtPath:progress: failed to get file attributes"];
    [v21 logWarn:v22];

    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)writeStream:(id)a3 toSFTPHandle:(_LIBSSH2_SFTP_HANDLE *)a4 progress:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (unsigned int (**)(id, void))a5;
  if ([v7 hasBytesAvailable])
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    do
    {
      int64_t v11 = [v7 read:v14 maxLength:0x4000];
      if (v11 >= 1)
      {
        uint64_t v9 = libssh2_sftp_write(a4, (uint64_t)v14, v11);
        v10 += v9;
        if (v8 && !v8[2](v8, v10)) {
          goto LABEL_9;
        }
        if (v9 < 0) {
          break;
        }
      }
    }
    while ([v7 hasBytesAvailable]);
    BOOL v12 = (v9 | v11) >= 0;
  }
  else
  {
LABEL_9:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)writeStream:(id)a3 toSFTPHandle:(_LIBSSH2_SFTP_HANDLE *)a4
{
  return [(NMSFTP *)self writeStream:a3 toSFTPHandle:a4 progress:0];
}

- (BOOL)appendStream:(id)a3 toFileAtPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 streamStatus]) {
    [v6 open];
  }
  if (([v6 hasBytesAvailable] & 1) == 0)
  {
    v13 = +[NMSSHLogger sharedLogger];
    id v14 = [NSString stringWithFormat:@"No bytes available in the stream"];
    [v13 logWarn:v14];
LABEL_10:

    goto LABEL_11;
  }
  id v8 = [(NMSFTP *)self openFileAtPath:v7 flags:11 mode:420];
  if (!v8)
  {
    [v6 close];
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = (uint64_t)v8;
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  if ((libssh2_sftp_fstat_ex(v8, (uint64_t *)v16, 0) & 0x80000000) != 0)
  {
    [v6 close];
    v13 = +[NMSSHLogger sharedLogger];
    id v14 = [NSString stringWithFormat:@"Unable to get attributes of file %@", v7];
    [v13 logError:v14];
    goto LABEL_10;
  }
  libssh2_sftp_seek64(v9, *((uint64_t *)&v16[0] + 1));
  uint64_t v10 = +[NMSSHLogger sharedLogger];
  int64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Seek to position %ld", *((void *)&v16[0] + 1));
  [v10 logVerbose:v11];

  BOOL v12 = [(NMSFTP *)self writeStream:v6 toSFTPHandle:v9];
  libssh2_sftp_close_handle(v9);
  [v6 close];
LABEL_12:

  return v12;
}

- (BOOL)appendContents:(id)a3 toFileAtPath:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF950];
  id v7 = a4;
  id v8 = [v6 inputStreamWithData:a3];
  LOBYTE(self) = [(NMSFTP *)self appendStream:v8 toFileAtPath:v7];

  return (char)self;
}

- (BOOL)writeStream:(id)a3 toFileAtPath:(id)a4 progress:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 streamStatus]) {
    [v8 open];
  }
  if (([v8 hasBytesAvailable] & 1) == 0)
  {
    id v14 = +[NMSSHLogger sharedLogger];
    uint64_t v15 = [NSString stringWithFormat:@"No bytes available in the stream"];
    [v14 logWarn:v15];

LABEL_8:
    BOOL v13 = 0;
    goto LABEL_9;
  }
  int64_t v11 = [(NMSFTP *)self openFileAtPath:v9 flags:26 mode:420];
  if (!v11)
  {
    [v8 close];
    goto LABEL_8;
  }
  uint64_t v12 = (uint64_t)v11;
  BOOL v13 = [(NMSFTP *)self writeStream:v8 toSFTPHandle:v11 progress:v10];
  libssh2_sftp_close_handle(v12);
  [v8 close];
LABEL_9:

  return v13;
}

- (BOOL)writeStream:(id)a3 toFileAtPath:(id)a4
{
  return [(NMSFTP *)self writeStream:a3 toFileAtPath:a4 progress:0];
}

- (BOOL)writeFileAtPath:(id)a3 toFileAtPath:(id)a4 progress:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF950];
  id v9 = a5;
  id v10 = a4;
  int64_t v11 = [v8 inputStreamWithFileAtPath:a3];
  LOBYTE(self) = [(NMSFTP *)self writeStream:v11 toFileAtPath:v10 progress:v9];

  return (char)self;
}

- (BOOL)writeFileAtPath:(id)a3 toFileAtPath:(id)a4
{
  return [(NMSFTP *)self writeFileAtPath:a3 toFileAtPath:a4 progress:0];
}

- (BOOL)writeContents:(id)a3 toFileAtPath:(id)a4 progress:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF950];
  id v9 = a5;
  id v10 = a4;
  int64_t v11 = [v8 inputStreamWithData:a3];
  LOBYTE(self) = [(NMSFTP *)self writeStream:v11 toFileAtPath:v10 progress:v9];

  return (char)self;
}

- (BOOL)writeContents:(id)a3 toFileAtPath:(id)a4
{
  return [(NMSFTP *)self writeContents:a3 toFileAtPath:a4 progress:0];
}

- (id)contentsAtPath:(id)a3 progress:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (uint64_t (**)(id, void, uint64_t))a4;
  id v8 = [(NMSFTP *)self openFileAtPath:v6 flags:1 mode:0];
  if (v8)
  {
    id v9 = [(NMSFTP *)self infoForFileAtPath:v6];
    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = libssh2_sftp_read((uint64_t)v8, v18, 0x4000uLL);
        if (v12 < 1) {
          break;
        }
        [v10 appendBytes:v18 length:v12];
        v11 += v12;
        if (v7)
        {
          BOOL v13 = [v9 fileSize];
          char v14 = v7[2](v7, v11, [v13 integerValue]);

          if ((v14 & 1) == 0)
          {
            libssh2_sftp_close_handle((uint64_t)v8);
            goto LABEL_10;
          }
        }
      }
      libssh2_sftp_close_handle((uint64_t)v8);
      if ((v12 & 0x8000000000000000) == 0)
      {
        id v8 = (_LIBSSH2_SFTP_HANDLE *)[v10 copy];
        goto LABEL_11;
      }
LABEL_10:
      id v8 = 0;
LABEL_11:
    }
    else
    {
      uint64_t v15 = +[NMSSHLogger sharedLogger];
      uint64_t v16 = [NSString stringWithFormat:@"contentsAtPath:progress: failed to get file attributes"];
      [v15 logWarn:v16];

      id v8 = 0;
    }
  }
  return v8;
}

- (id)contentsAtPath:(id)a3
{
  return [(NMSFTP *)self contentsAtPath:a3 progress:0];
}

- (BOOL)removeFileAtPath:(id)a3
{
  id v4 = a3;
  v5 = [(NMSFTP *)self sftpSession];
  id v6 = v4;
  id v7 = (const void *)[v6 UTF8String];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  unsigned int v10 = strlen(v9);
  return libssh2_sftp_unlink_ex((uint64_t)v5, v7, v10) == 0;
}

- (BOOL)createSymbolicLinkAtPath:(id)a3 withDestinationPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NMSFTP *)self sftpSession];
  id v9 = v6;
  unsigned int v10 = (const void *)[v9 UTF8String];
  id v11 = v9;
  uint64_t v12 = (const char *)[v11 UTF8String];

  LODWORD(v11) = strlen(v12);
  id v13 = v7;
  char v14 = (void *)[v13 UTF8String];
  id v15 = v13;
  uint64_t v16 = (const char *)[v15 UTF8String];

  unsigned int v17 = strlen(v16);
  return libssh2_sftp_symlink_ex((uint64_t)v8, v10, v11, v14, v17, 0) == 0;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  v3 = [(NMSFTP *)self openFileAtPath:a3 flags:1 mode:0];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    uint64_t v10 = 0;
    long long v9 = 0u;
    memset(v8, 0, sizeof(v8));
    int v5 = libssh2_sftp_fstat_ex(v3, (uint64_t *)v8, 0);
    libssh2_sftp_close_handle(v4);
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = (v9 & 0xF000) == 0x4000;
    }
    LOBYTE(v3) = !v6;
  }
  return (char)v3;
}

- (_LIBSSH2_SFTP_HANDLE)openFileAtPath:(id)a3 flags:(unint64_t)a4 mode:(int64_t)a5
{
  unsigned int v6 = a4;
  id v8 = a3;
  long long v9 = [(NMSFTP *)self sftpSession];
  id v10 = v8;
  id v11 = (const void *)[v10 UTF8String];
  id v12 = v10;
  unsigned int v13 = strlen((const char *)[v12 UTF8String]);
  char v14 = (_LIBSSH2_SFTP_HANDLE *)libssh2_sftp_open_ex(v9, v11, v13, v6, a5, 0);
  if (!v14)
  {
    id v15 = [(NMSFTP *)self session];
    uint64_t v16 = [v15 lastError];

    unsigned int v17 = +[NMSSHLogger sharedLogger];
    unint64_t v18 = NSString;
    uint64_t v19 = [v16 code];
    char v20 = [v16 localizedDescription];
    v21 = [v18 stringWithFormat:@"Could not open file at path %@ (Error %li: %@)", v12, v19, v20];
    [v17 logError:v21];

    if ([v16 code] == -31)
    {
      v22 = +[NMSSHLogger sharedLogger];
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"SFTP error %lu", libssh2_sftp_last_error((uint64_t)-[NMSFTP sftpSession](self, "sftpSession")));
      [v22 logError:v23];
    }
  }

  return v14;
}

- (id)infoForFileAtPath:(id)a3
{
  id v4 = a3;
  int v5 = [(NMSFTP *)self openFileAtPath:v4 flags:1 mode:0];
  unsigned int v6 = (NMSFTPFile *)v5;
  if (v5)
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    int v7 = libssh2_sftp_fstat_ex(v5, (uint64_t *)&v13, 0);
    libssh2_sftp_close_handle((uint64_t)v6);
    if (v7 < 0)
    {
      unsigned int v6 = 0;
    }
    else
    {
      id v8 = [NMSFTPFile alloc];
      long long v9 = [v4 lastPathComponent];
      unsigned int v6 = [(NMSFTPFile *)v8 initWithFilename:v9];

      v11[0] = v13;
      v11[1] = v14;
      v11[2] = v15;
      uint64_t v12 = v16;
      [(NMSFTPFile *)v6 populateValuesFromSFTPAttributes:v11];
    }
  }

  return v6;
}

- (id)contentsOfDirectoryAtPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(NMSFTP *)self openDirectoryAtPath:v4];
  if (v5)
  {
    unsigned int v6 = [MEMORY[0x263EFF980] array];
    while (1)
    {
      uint64_t v21 = 0;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      int v7 = libssh2_sftp_readdir_ex((uint64_t)v5, v22, 0x200uLL, 0, 0, (uint64_t)&v18);
      if (v7 < 1) {
        break;
      }
      id v8 = (void *)[[NSString alloc] initWithBytes:v22 length:v7 encoding:4];
      if (([&unk_26F0769B0 containsObject:v8] & 1) == 0)
      {
        if ((v20 & 0xF000) == 0x4000)
        {
          uint64_t v9 = [v8 stringByAppendingString:@"/"];

          id v8 = (void *)v9;
        }
        id v10 = [[NMSFTPFile alloc] initWithFilename:v8];
        v16[0] = v18;
        v16[1] = v19;
        v16[2] = v20;
        uint64_t v17 = v21;
        [(NMSFTPFile *)v10 populateValuesFromSFTPAttributes:v16];
        [v6 addObject:v10];
      }
    }
    if (v7 < 0)
    {
      id v11 = +[NMSSHLogger sharedLogger];
      uint64_t v12 = [NSString stringWithFormat:@"Unable to read directory"];
      [v11 logError:v12];
    }
    if ((libssh2_sftp_close_handle((uint64_t)v5) & 0x80000000) != 0)
    {
      long long v13 = +[NMSSHLogger sharedLogger];
      long long v14 = [NSString stringWithFormat:@"Failed to close directory"];
      [v13 logError:v14];
    }
    int v5 = [v6 sortedArrayUsingComparator:&__block_literal_global_56425];
  }
  return v5;
}

uint64_t __36__NMSFTP_contentsOfDirectoryAtPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)removeDirectoryAtPath:(id)a3
{
  id v4 = a3;
  int v5 = [(NMSFTP *)self sftpSession];
  id v6 = v4;
  int v7 = (const void *)[v6 UTF8String];
  id v8 = v6;
  uint64_t v9 = (const char *)[v8 UTF8String];

  unsigned int v10 = strlen(v9);
  return libssh2_sftp_rmdir_ex((uint64_t)v5, v7, v10) == 0;
}

- (BOOL)createDirectoryAtPath:(id)a3
{
  id v4 = a3;
  int v5 = [(NMSFTP *)self sftpSession];
  id v6 = v4;
  int v7 = (const void *)[v6 UTF8String];
  id v8 = v6;
  uint64_t v9 = (const char *)[v8 UTF8String];

  unsigned int v10 = strlen(v9);
  return libssh2_sftp_mkdir_ex((uint64_t)v5, v7, v10, 493) == 0;
}

- (BOOL)directoryExistsAtPath:(id)a3
{
  v3 = [(NMSFTP *)self openFileAtPath:a3 flags:1 mode:0];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    uint64_t v10 = 0;
    long long v9 = 0u;
    memset(v8, 0, sizeof(v8));
    int v5 = libssh2_sftp_fstat_ex(v3, (uint64_t *)v8, 0);
    libssh2_sftp_close_handle(v4);
    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = (v9 & 0xF000) == 0x4000;
    }
    LOBYTE(v3) = v6;
  }
  return (char)v3;
}

- (_LIBSSH2_SFTP_HANDLE)openDirectoryAtPath:(id)a3
{
  id v4 = a3;
  int v5 = [(NMSFTP *)self sftpSession];
  id v6 = v4;
  int v7 = (const void *)[v6 UTF8String];
  id v8 = v6;
  unsigned int v9 = strlen((const char *)[v8 UTF8String]);
  uint64_t v10 = (_LIBSSH2_SFTP_HANDLE *)libssh2_sftp_open_ex(v5, v7, v9, 0, 0, 1);
  if (!v10)
  {
    id v11 = [(NMSFTP *)self session];
    uint64_t v12 = [v11 lastError];

    long long v13 = +[NMSSHLogger sharedLogger];
    long long v14 = NSString;
    uint64_t v15 = [v12 code];
    uint64_t v16 = [v12 localizedDescription];
    uint64_t v17 = [v14 stringWithFormat:@"Could not open directory at path %@ (Error %li: %@)", v8, v15, v16];
    [v13 logError:v17];

    if ([v12 code] == -31)
    {
      long long v18 = +[NMSSHLogger sharedLogger];
      long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"SFTP error %lu", libssh2_sftp_last_error((uint64_t)-[NMSFTP sftpSession](self, "sftpSession")));
      [v18 logError:v19];
    }
  }

  return v10;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NMSFTP *)self sftpSession];
  id v9 = v7;
  uint64_t v10 = (const void *)[v9 UTF8String];
  id v11 = v9;
  uint64_t v12 = (const char *)[v11 UTF8String];

  LODWORD(v11) = strlen(v12);
  id v13 = v6;
  long long v14 = (const void *)[v13 UTF8String];
  id v15 = v13;
  uint64_t v16 = (const char *)[v15 UTF8String];

  unsigned int v17 = strlen(v16);
  return libssh2_sftp_rename_ex((uint64_t)v8, v10, v11, v14, v17, 7u) == 0;
}

- (void)disconnect
{
  libssh2_sftp_shutdown((uint64_t *)[(NMSFTP *)self sftpSession]);
  [(NMSFTP *)self setConnected:0];
}

- (BOOL)connect
{
  v3 = [(NMSFTP *)self session];
  libssh2_session_set_blocking([v3 rawSession], 1);

  id v4 = [(NMSFTP *)self session];
  -[NMSFTP setSftpSession:](self, "setSftpSession:", libssh2_sftp_init([v4 rawSession]));

  if ([(NMSFTP *)self sftpSession])
  {
    [(NMSFTP *)self setConnected:1];
    return [(NMSFTP *)self isConnected];
  }
  else
  {
    id v6 = +[NMSSHLogger sharedLogger];
    id v7 = [NSString stringWithFormat:@"Unable to init SFTP session"];
    [v6 logError:v7];

    return 0;
  }
}

- (NMSFTP)initWithSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMSFTP;
  int v5 = [(NMSFTP *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(NMSFTP *)v5 setSession:v4];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      objc_exception_throw(@"You have to provide a valid NMSSHSession!");
    }
  }

  return v6;
}

+ (id)connectWithSession:(id)a3
{
  id v3 = a3;
  id v4 = [[NMSFTP alloc] initWithSession:v3];

  [(NMSFTP *)v4 connect];
  return v4;
}

@end