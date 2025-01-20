@interface NMSSHSession
+ (id)URLForHost:(id)a3;
+ (id)connectToHost:(id)a3 port:(int64_t)a4 withUsername:(id)a5;
+ (id)connectToHost:(id)a3 withUsername:(id)a4;
- (BOOL)addKnownHostName:(id)a3 port:(int64_t)a4 toFile:(id)a5 withSalt:(id)a6;
- (BOOL)authenticateByInMemoryPublicKey:(id)a3 privateKey:(id)a4 andPassword:(id)a5;
- (BOOL)authenticateByKeyboardInteractive;
- (BOOL)authenticateByKeyboardInteractiveUsingBlock:(id)a3;
- (BOOL)authenticateByPassword:(id)a3;
- (BOOL)authenticateByPublicKey:(id)a3 privateKey:(id)a4 andPassword:(id)a5;
- (BOOL)connect;
- (BOOL)connectToAgent;
- (BOOL)connectWithTimeout:(id)a3;
- (BOOL)isAuthorized;
- (BOOL)isConnected;
- (BOOL)supportsAuthenticationMethod:(id)a3;
- (NMSFTP)sftp;
- (NMSSHChannel)channel;
- (NMSSHHostConfig)hostConfig;
- (NMSSHSession)initWithHost:(id)a3 andUsername:(id)a4;
- (NMSSHSession)initWithHost:(id)a3 configs:(id)a4 withDefaultPort:(int64_t)a5 defaultUsername:(id)a6;
- (NMSSHSession)initWithHost:(id)a3 port:(int64_t)a4 andUsername:(id)a5;
- (NMSSHSessionDelegate)delegate;
- (NSError)lastError;
- (NSNumber)port;
- (NSNumber)timeout;
- (NSString)banner;
- (NSString)host;
- (NSString)remoteBanner;
- (NSString)username;
- (_LIBSSH2_AGENT)agent;
- (_LIBSSH2_SESSION)rawSession;
- (__CFSocket)socket;
- (id)applicationSupportDirectory;
- (id)fingerprint:(int64_t)a3;
- (id)hostIPAddresses;
- (id)kbAuthenticationBlock;
- (id)keyboardInteractiveRequest:(id)a3;
- (id)supportedAuthenticationMethods;
- (id)userKnownHostsFileName;
- (int64_t)fingerprintHash;
- (int64_t)knownHostStatusInFiles:(id)a3;
- (int64_t)knownHostStatusWithFile:(id)a3;
- (void)disconnect;
- (void)setAgent:(_LIBSSH2_AGENT *)a3;
- (void)setBanner:(id)a3;
- (void)setChannel:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFingerprintHash:(int64_t)a3;
- (void)setHost:(id)a3;
- (void)setHostConfig:(id)a3;
- (void)setKbAuthenticationBlock:(id)a3;
- (void)setPort:(id)a3;
- (void)setSession:(_LIBSSH2_SESSION *)a3;
- (void)setSftp:(id)a3;
- (void)setTimeout:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation NMSSHSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_kbAuthenticationBlock, 0);
  objc_storeStrong((id *)&self->_sftp, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_hostConfig, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setKbAuthenticationBlock:(id)a3
{
}

- (id)kbAuthenticationBlock
{
  return self->_kbAuthenticationBlock;
}

- (void)setAgent:(_LIBSSH2_AGENT *)a3
{
  self->_agent = a3;
}

- (_LIBSSH2_AGENT)agent
{
  return self->_agent;
}

- (void)setSftp:(id)a3
{
}

- (void)setChannel:(id)a3
{
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (__CFSocket)socket
{
  return self->_socket;
}

- (void)setSession:(_LIBSSH2_SESSION *)a3
{
  self->_session = a3;
}

- (_LIBSSH2_SESSION)rawSession
{
  return self->_session;
}

- (void)setBanner:(id)a3
{
}

- (NSString)banner
{
  return self->_banner;
}

- (void)setFingerprintHash:(int64_t)a3
{
  self->_fingerprintHash = a3;
}

- (int64_t)fingerprintHash
{
  return self->_fingerprintHash;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setPort:(id)a3
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setHost:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHostConfig:(id)a3
{
}

- (NMSSHHostConfig)hostConfig
{
  return self->_hostConfig;
}

- (void)setDelegate:(id)a3
{
}

- (NMSSHSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NMSSHSessionDelegate *)WeakRetained;
}

- (NMSFTP)sftp
{
  sftp = self->_sftp;
  if (!sftp)
  {
    v4 = [[NMSFTP alloc] initWithSession:self];
    v5 = self->_sftp;
    self->_sftp = v4;

    sftp = self->_sftp;
  }
  return sftp;
}

- (NMSSHChannel)channel
{
  channel = self->_channel;
  if (!channel)
  {
    v4 = [[NMSSHChannel alloc] initWithSession:self];
    v5 = self->_channel;
    self->_channel = v4;

    channel = self->_channel;
  }
  return channel;
}

- (id)keyboardInteractiveRequest:(id)a3
{
  id v4 = a3;
  v5 = +[NMSSHLogger sharedLogger];
  v6 = [NSString stringWithFormat:@"Server request '%@'", v4];
  [v5 logVerbose:v6];

  v7 = [(NMSSHSession *)self kbAuthenticationBlock];

  if (v7)
  {
    v8 = [(NMSSHSession *)self kbAuthenticationBlock];
    uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v4);
LABEL_3:
    v10 = (__CFString *)v9;
    goto LABEL_8;
  }
  uint64_t v11 = [(NMSSHSession *)self delegate];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(NMSSHSession *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v8 = [(NMSSHSession *)self delegate];
      uint64_t v9 = [v8 session:self keyboardInteractiveRequest:v4];
      goto LABEL_3;
    }
  }
  v8 = +[NMSSHLogger sharedLogger];
  v15 = [NSString stringWithFormat:@"Keyboard interactive requires a delegate that responds to session:keyboardInteractiveRequest: or a block!"];
  [v8 logWarn:v15];

  v10 = &stru_26F008428;
LABEL_8:

  return v10;
}

- (BOOL)addKnownHostName:(id)a3 port:(int64_t)a4 toFile:(id)a5 withSalt:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 == 22)
  {
    id v13 = v10;
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"[%@]:%d", v10, a4];
  }
  char v14 = v13;
  if (!v11)
  {
    id v11 = [(NMSSHSession *)self userKnownHostsFileName];
  }
  *(void *)v48 = 0;
  int v47 = 0;
  v15 = (char *)libssh2_session_hostkey((uint64_t)[(NMSSHSession *)self rawSession], v48, &v47);
  if (!v15)
  {
    v23 = +[NMSSHLogger sharedLogger];
    v24 = NSString;
    v25 = @"Failed to get host key.";
LABEL_13:
    v26 = [v24 stringWithFormat:v25];
    [v23 logError:v26];

    goto LABEL_14;
  }
  v16 = v15;
  v17 = libssh2_knownhost_init((uint64_t)[(NMSSHSession *)self rawSession]);
  if (!v17)
  {
    v23 = +[NMSSHLogger sharedLogger];
    v24 = NSString;
    v25 = @"Failed to initialize knownhosts.";
    goto LABEL_13;
  }
  v18 = v17;
  id v19 = v11;
  [v19 UTF8String];
  int v20 = libssh2_knownhost_readfile((uint64_t)v18);
  if ((v20 & 0x80000000) == 0 || v20 == -16)
  {
    if (v47 == 1) {
      int v29 = 589824;
    }
    else {
      int v29 = 851968;
    }
    if (v12) {
      int v30 = 2;
    }
    else {
      int v30 = 1;
    }
    int v31 = v29 | v30;
    v32 = (char *)[v14 UTF8String];
    v33 = (char *)[v12 UTF8String];
    uint64_t v34 = libssh2_knownhost_addc((uint64_t)v18, v32, v33, v16, *(size_t *)v48, 0, 0, v31, 0);
    if (v34)
    {
      uint64_t v35 = v34;
      v36 = +[NMSSHLogger sharedLogger];
      v37 = NSString;
      v38 = [(NMSSHSession *)self lastError];
      v39 = [v37 stringWithFormat:@"Failed to add host to known hosts: error %d (%@)", v35, v38];
      [v36 logError:v39];
    }
    else
    {
      [v19 UTF8String];
      int v40 = libssh2_knownhost_writefile((uint64_t)v18);
      v41 = +[NMSSHLogger sharedLogger];
      v42 = NSString;
      if ((v40 & 0x80000000) == 0)
      {
        v43 = [NSString stringWithFormat:@"Host added to known hosts."];
        [v41 logInfo:v43];

        BOOL v27 = v40 == 0;
        goto LABEL_27;
      }
      v44 = [(NMSSHSession *)self userKnownHostsFileName];
      v45 = [(NMSSHSession *)self lastError];
      v46 = [v42 stringWithFormat:@"Couldn't write to %@: %@", v44, v45];
      [v41 logError:v46];
    }
    BOOL v27 = 0;
LABEL_27:
    libssh2_knownhost_free(v18);
    goto LABEL_15;
  }
  v21 = +[NMSSHLogger sharedLogger];
  v22 = [NSString stringWithFormat:@"Failed to read known hosts file."];
  [v21 logError:v22];

  libssh2_knownhost_free(v18);
LABEL_14:
  BOOL v27 = 0;
LABEL_15:

  return v27;
}

- (int64_t)knownHostStatusWithFile:(id)a3
{
  id v4 = a3;
  v5 = libssh2_knownhost_init((uint64_t)[(NMSSHSession *)self rawSession]);
  if (!v5) {
    goto LABEL_15;
  }
  v6 = v5;
  id v7 = v4;
  [v7 UTF8String];
  int v8 = libssh2_knownhost_readfile((uint64_t)v6);
  if (v8 < 0)
  {
    int v26 = v8;
    libssh2_knownhost_free(v6);
    BOOL v27 = +[NMSSHLogger sharedLogger];
    if (v26 == -16)
    {
      v28 = [NSString stringWithFormat:@"No known hosts file %@.", v7];
      [v27 logInfo:v28];

      int64_t v25 = 2;
      goto LABEL_20;
    }
    int v31 = [NSString stringWithFormat:@"Failed to read known hosts file %@.", v7];
    [v27 logError:v31];

LABEL_15:
    int64_t v25 = 3;
    goto LABEL_20;
  }
  int v35 = 0;
  uint64_t v34 = 0;
  uint64_t v9 = libssh2_session_hostkey((uint64_t)[(NMSSHSession *)self rawSession], &v34, &v35);
  if (!v9)
  {
    int v29 = +[NMSSHLogger sharedLogger];
    int v30 = [NSString stringWithFormat:@"Failed to get host key."];
    [v29 logError:v30];

    libssh2_knownhost_free(v6);
    goto LABEL_15;
  }
  id v10 = v9;
  int v11 = v35;
  uint64_t v33 = 0;
  id v12 = +[NMSSHLogger sharedLogger];
  id v13 = NSString;
  char v14 = [(NMSSHSession *)self host];
  v15 = [(NMSSHSession *)self port];
  v16 = [v13 stringWithFormat:@"Check for host %@, port %@ in file %@", v14, v15, v7];
  [v12 logInfo:v16];

  id v17 = [(NMSSHSession *)self host];
  uint64_t v18 = [v17 UTF8String];
  id v19 = [(NMSSHSession *)self port];
  uint64_t v20 = [v19 intValue];
  if (v11 == 1) {
    uint64_t v21 = 589825;
  }
  else {
    uint64_t v21 = 851969;
  }
  int v22 = libssh2_knownhost_checkp(v6, v18, v20, v10, v34, v21, &v33);

  libssh2_knownhost_free(v6);
  if (v22 == 2)
  {
    v23 = +[NMSSHLogger sharedLogger];
    v24 = [NSString stringWithFormat:@"Not found"];
    [v23 logInfo:v24];
    int64_t v25 = 2;
  }
  else if (v22 == 1)
  {
    v23 = +[NMSSHLogger sharedLogger];
    v24 = [NSString stringWithFormat:@"Mismatch"];
    [v23 logInfo:v24];
    int64_t v25 = 1;
  }
  else
  {
    v23 = +[NMSSHLogger sharedLogger];
    if (v22)
    {
      v24 = [NSString stringWithFormat:@"Failure"];
      [v23 logInfo:v24];
      int64_t v25 = 3;
    }
    else
    {
      v24 = [NSString stringWithFormat:@"Match"];
      [v23 logInfo:v24];
      int64_t v25 = 0;
    }
  }

LABEL_20:
  return v25;
}

- (int64_t)knownHostStatusInFiles:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    v5 = [(NMSSHSession *)self userKnownHostsFileName];
    v18[0] = v5;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      int64_t v11 = -[NMSSHSession knownHostStatusWithFile:](self, "knownHostStatusWithFile:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
      if ((unint64_t)(v11 - 4) < 0xFFFFFFFFFFFFFFFELL) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    int64_t v11 = 3;
  }

  return v11;
}

- (id)userKnownHostsFileName
{
  v2 = [(NMSSHSession *)self applicationSupportDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"known_hosts"];

  return v3;
}

- (id)applicationSupportDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v3 stringByAppendingPathComponent:@"NMSSH"];
  v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v4;
}

- (id)fingerprint:(int64_t)a3
{
  if ([(NMSSHSession *)self rawSession])
  {
    BOOL v5 = a3 == 0;
    if (a3) {
      int v6 = 0;
    }
    else {
      int v6 = 16;
    }
    BOOL v7 = a3 == 1;
    if (a3 == 1) {
      int v8 = 2;
    }
    else {
      int v8 = a3 == 0;
    }
    int v9 = v7 || v5;
    if (v7) {
      unsigned int v10 = 20;
    }
    else {
      unsigned int v10 = v6;
    }
    int64_t v11 = (unsigned __int8 *)libssh2_hostkey_hash((_DWORD *)[(NMSSHSession *)self rawSession], v8);
    if (v11)
    {
      id v12 = v11;
      long long v13 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"%02X", *v11);
      if (v9)
      {
        if (v10 <= 2) {
          uint64_t v14 = 2;
        }
        else {
          uint64_t v14 = v10;
        }
        uint64_t v15 = v14 - 1;
        long long v16 = v12 + 1;
        do
        {
          unsigned int v17 = *v16++;
          objc_msgSend(v13, "appendFormat:", @":%02X", v17);
          --v15;
        }
        while (v15);
      }
      uint64_t v18 = (void *)[v13 copy];
    }
    else
    {
      long long v13 = +[NMSSHLogger sharedLogger];
      id v19 = [NSString stringWithFormat:@"Unable to retrive host's fingerprint"];
      [v13 logWarn:v19];

      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  return v18;
}

- (BOOL)supportsAuthenticationMethod:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NMSSHSession *)self supportedAuthenticationMethods];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)supportedAuthenticationMethods
{
  v3 = [(NMSSHSession *)self rawSession];
  id v4 = [(NMSSHSession *)self username];
  BOOL v5 = (const void *)[v4 UTF8String];
  id v6 = [(NMSSHSession *)self username];
  unsigned int v7 = strlen((const char *)[v6 UTF8String]);
  uint64_t v8 = libssh2_userauth_list((uint64_t)v3, v5, v7);

  if (v8)
  {
    int v9 = [NSString stringWithCString:v8 encoding:4];
    unsigned int v10 = +[NMSSHLogger sharedLogger];
    int64_t v11 = [NSString stringWithFormat:@"User auth list: %@", v9];
    [v10 logVerbose:v11];

    id v12 = [v9 componentsSeparatedByString:@","];
  }
  else
  {
    int v9 = +[NMSSHLogger sharedLogger];
    long long v13 = NSString;
    uint64_t v14 = [(NMSSHSession *)self host];
    uint64_t v15 = [(NMSSHSession *)self port];
    long long v16 = [v13 stringWithFormat:@"Failed to get authentication method for host %@:%@", v14, v15];
    [v9 logInfo:v16];

    id v12 = 0;
  }

  return v12;
}

- (BOOL)connectToAgent
{
  BOOL v3 = [(NMSSHSession *)self supportsAuthenticationMethod:@"publickey"];
  if (v3)
  {
    [(NMSSHSession *)self setAgent:libssh2_agent_init((uint64_t)[(NMSSHSession *)self rawSession])];
    if (![(NMSSHSession *)self agent])
    {
      id v4 = +[NMSSHLogger sharedLogger];
      BOOL v5 = NSString;
      id v6 = @"Could not start a new agent";
      goto LABEL_13;
    }
    if (libssh2_agent_connect((uint64_t)[(NMSSHSession *)self agent]))
    {
      id v4 = +[NMSSHLogger sharedLogger];
      BOOL v5 = NSString;
      id v6 = @"Failed connection to agent";
LABEL_13:
      int64_t v11 = [v5 stringWithFormat:v6];
      [v4 logError:v11];

      LOBYTE(v3) = 0;
      return v3;
    }
    if (libssh2_agent_list_identities((uint64_t *)[(NMSSHSession *)self agent]))
    {
      id v4 = +[NMSSHLogger sharedLogger];
      BOOL v5 = NSString;
      id v6 = @"Failed to request agent identities";
      goto LABEL_13;
    }
    uint64_t v7 = 0;
    for (i = 0; ; uint64_t v7 = i)
    {
      if (libssh2_agent_get_identity((uint64_t)[(NMSSHSession *)self agent], &i, v7))
      {
        id v4 = +[NMSSHLogger sharedLogger];
        BOOL v5 = NSString;
        id v6 = @"Failed to find a valid identity for the agent";
        goto LABEL_13;
      }
      uint64_t v8 = [(NMSSHSession *)self agent];
      id v9 = [(NMSSHSession *)self username];
      unsigned int v10 = (const char *)[v9 UTF8String];
      LODWORD(v8) = libssh2_agent_userauth((uint64_t *)v8, v10, i);

      if (!v8) {
        break;
      }
    }
    LOBYTE(v3) = [(NMSSHSession *)self isAuthorized];
  }
  return v3;
}

- (BOOL)authenticateByKeyboardInteractiveUsingBlock:(id)a3
{
  id v4 = a3;
  if ([(NMSSHSession *)self supportsAuthenticationMethod:@"keyboard-interactive"])
  {
    [(NMSSHSession *)self setKbAuthenticationBlock:v4];
    BOOL v5 = [(NMSSHSession *)self rawSession];
    id v6 = [(NMSSHSession *)self username];
    uint64_t v7 = (const void *)[v6 UTF8String];
    id v8 = [(NMSSHSession *)self username];
    unsigned int v9 = strlen((const char *)[v8 UTF8String]);
    uint64_t v10 = libssh2_userauth_keyboard_interactive_ex((uint64_t)v5, v7, v9, (void (*)(void, void, void, void, void, void, void, uint64_t))kb_callback);

    [(NMSSHSession *)self setKbAuthenticationBlock:0];
    int64_t v11 = +[NMSSHLogger sharedLogger];
    if (!v10)
    {
      uint64_t v14 = [NSString stringWithFormat:@"Keyboard-interactive authentication succeeded."];
      [v11 logVerbose:v14];

      BOOL v13 = [(NMSSHSession *)self isAuthorized];
      goto LABEL_6;
    }
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Keyboard-interactive authentication failed with reason %i", v10);
    [v11 logError:v12];
  }
  BOOL v13 = 0;
LABEL_6:

  return v13;
}

- (BOOL)authenticateByKeyboardInteractive
{
  return [(NMSSHSession *)self authenticateByKeyboardInteractiveUsingBlock:0];
}

- (BOOL)authenticateByInMemoryPublicKey:(id)a3 privateKey:(id)a4 andPassword:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  if ([(NMSSHSession *)self supportsAuthenticationMethod:@"publickey"])
  {
    if (!v10) {
      uint64_t v10 = &stru_26F008428;
    }
    BOOL v27 = [(NMSSHSession *)self rawSession];
    id v11 = [(NMSSHSession *)self username];
    id v12 = (const void *)[v11 UTF8String];
    BOOL v13 = [(NMSSHSession *)self username];
    unint64_t v14 = [v13 length];
    id v29 = v8;
    id v15 = v8;
    long long v16 = (const void *)[v15 UTF8String];
    size_t v17 = [v15 length];
    id v28 = v9;
    id v18 = v9;
    id v19 = (void *)[v18 UTF8String];
    unint64_t v20 = [v18 length];
    uint64_t v10 = v10;
    uint64_t v21 = libssh2_userauth_publickey_frommemory((uint64_t)v27, v12, v14, v16, v17, v19, v20, (char *)[(__CFString *)v10 UTF8String]);

    int v22 = +[NMSSHLogger sharedLogger];
    if (v21)
    {
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"Public key authentication failed with reason %i", v21);
      [v22 logError:v23];

      BOOL v24 = 0;
    }
    else
    {
      int64_t v25 = [NSString stringWithFormat:@"Public key authentication succeeded."];
      [v22 logVerbose:v25];

      BOOL v24 = [(NMSSHSession *)self isAuthorized];
    }
    id v9 = v28;
    id v8 = v29;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)authenticateByPublicKey:(id)a3 privateKey:(id)a4 andPassword:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  if ([(NMSSHSession *)self supportsAuthenticationMethod:@"publickey"])
  {
    if (!v10) {
      uint64_t v10 = &stru_26F008428;
    }
    id v11 = [v8 stringByExpandingTildeInPath];
    int64_t v25 = (char *)[v11 UTF8String];

    id v12 = [v9 stringByExpandingTildeInPath];
    BOOL v13 = (char *)[v12 UTF8String];

    unint64_t v14 = [(NMSSHSession *)self rawSession];
    id v15 = [(NMSSHSession *)self username];
    long long v16 = (const void *)[v15 UTF8String];
    id v17 = [(NMSSHSession *)self username];
    unsigned int v18 = strlen((const char *)[v17 UTF8String]);
    uint64_t v10 = v10;
    uint64_t v19 = libssh2_userauth_publickey_fromfile_ex((uint64_t)v14, v16, v18, v25, v13, (char *)[(__CFString *)v10 UTF8String]);

    unint64_t v20 = +[NMSSHLogger sharedLogger];
    if (!v19)
    {
      v23 = [NSString stringWithFormat:@"Public key authentication succeeded."];
      [v20 logVerbose:v23];

      BOOL v22 = [(NMSSHSession *)self isAuthorized];
      goto LABEL_8;
    }
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Public key authentication failed with reason %i", v19);
    [v20 logError:v21];
  }
  BOOL v22 = 0;
LABEL_8:

  return v22;
}

- (BOOL)authenticateByPassword:(id)a3
{
  id v4 = a3;
  if (v4 && [(NMSSHSession *)self supportsAuthenticationMethod:@"password"])
  {
    BOOL v5 = [(NMSSHSession *)self rawSession];
    id v6 = [(NMSSHSession *)self username];
    uint64_t v7 = (const void *)[v6 UTF8String];
    id v8 = [(NMSSHSession *)self username];
    unsigned int v9 = strlen((const char *)[v8 UTF8String]);
    id v10 = v4;
    id v11 = (const void *)[v10 UTF8String];
    unsigned int v12 = strlen((const char *)[v10 UTF8String]);
    uint64_t v13 = libssh2_userauth_password_ex((uint64_t)v5, v7, v9, v11, v12, 0);

    unint64_t v14 = +[NMSSHLogger sharedLogger];
    if (!v13)
    {
      unsigned int v18 = [NSString stringWithFormat:@"Password authentication succeeded."];
      [v14 logVerbose:v18];

      BOOL v16 = [(NMSSHSession *)self isAuthorized];
      goto LABEL_6;
    }
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"Password authentication failed with reason %i", v13);
    [v14 logError:v15];
  }
  BOOL v16 = 0;
LABEL_6:

  return v16;
}

- (BOOL)isAuthorized
{
  BOOL v3 = [(NMSSHSession *)self rawSession];
  if (v3) {
    LOBYTE(v3) = libssh2_userauth_authenticated((uint64_t)[(NMSSHSession *)self rawSession]) == 1;
  }
  return (char)v3;
}

- (void)disconnect
{
  channel = self->_channel;
  if (channel)
  {
    [(NMSSHChannel *)channel closeShell];
    [(NMSSHSession *)self setChannel:0];
  }
  sftp = self->_sftp;
  if (sftp)
  {
    if ([(NMSFTP *)sftp isConnected]) {
      [(NMSFTP *)self->_sftp disconnect];
    }
    [(NMSSHSession *)self setSftp:0];
  }
  if ([(NMSSHSession *)self agent])
  {
    libssh2_agent_disconnect((uint64_t)[(NMSSHSession *)self agent]);
    libssh2_agent_free((void *)[(NMSSHSession *)self agent]);
    [(NMSSHSession *)self setAgent:0];
  }
  if ([(NMSSHSession *)self rawSession])
  {
    libssh2_session_disconnect_ex((_DWORD *)[(NMSSHSession *)self rawSession], 0xBu, "NMSSH: Disconnect", "");
    libssh2_session_free((uint64_t)[(NMSSHSession *)self rawSession]);
    [(NMSSHSession *)self setSession:0];
  }
  socket = self->_socket;
  if (socket)
  {
    CFSocketInvalidate(socket);
    CFRelease(self->_socket);
    self->_socket = 0;
  }
  libssh2_exit();
  id v6 = +[NMSSHLogger sharedLogger];
  uint64_t v7 = [NSString stringWithFormat:@"Disconnected"];
  [v6 logVerbose:v7];

  [(NMSSHSession *)self setConnected:0];
}

- (BOOL)connectWithTimeout:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v53 = a3;
  if ([(NMSSHSession *)self isConnected]) {
    [(NMSSHSession *)self disconnect];
  }
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__NMSSHSession_connectWithTimeout___block_invoke;
  block[3] = &unk_264E5EC88;
  block[4] = &v55;
  if (connectWithTimeout__onceToken != -1) {
    dispatch_once(&connectWithTimeout__onceToken, block);
  }
  if (!*((unsigned char *)v56 + 24))
  {
    BOOL v21 = 0;
    goto LABEL_32;
  }
  id v4 = [(NMSSHSession *)self port];
  uint64_t v5 = [v4 integerValue];

  id v6 = [(NMSSHSession *)self hostIPAddresses];
  if (!v6)
  {
LABEL_24:
    BOOL v22 = +[NMSSHLogger sharedLogger];
    v23 = [NSString stringWithFormat:@"Failure establishing socket connection"];
    [v22 logError:v23];

    [(NMSSHSession *)self disconnect];
    goto LABEL_25;
  }
  unint64_t v7 = 0;
  unsigned int v52 = bswap32(v5) >> 16;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFSocketError v9 = 1;
  while (v7 < [v6 count] && v9)
  {
    id v10 = [v6 objectAtIndexedSubscript:v7];
    if ([v10 length] == 16)
    {
      *(void *)bytes = 0;
      uint64_t v60 = 0;
      [v10 getBytes:bytes length:16];
      *(_WORD *)&bytes[2] = v52;
      inet_ntop(2, &bytes[4], (char *)v61, 0x10u);
      id v11 = [NSString stringWithCString:v61 encoding:4];
      CFDataRef v12 = CFDataCreate(v8, bytes, 16);
      SInt32 v13 = 2;
    }
    else
    {
      if ([v10 length] != 28)
      {
        id v11 = +[NMSSHLogger sharedLogger];
        unint64_t v20 = [NSString stringWithFormat:@"Unknown address, it's not IPv4 or IPv6!"];
        [v11 logVerbose:v20];

        goto LABEL_21;
      }
      *(void *)v61 = 0;
      v62[0] = 0;
      int v63 = 0;
      v62[1] = 0;
      [v10 getBytes:v61 length:28];
      *(_WORD *)&v61[2] = v52;
      inet_ntop(30, v62, (char *)bytes, 0x2Eu);
      id v11 = [NSString stringWithCString:bytes encoding:4];
      CFDataRef v12 = CFDataCreate(v8, v61, 28);
      SInt32 v13 = 30;
    }
    unint64_t v14 = CFSocketCreate(v8, v13, 1, 0, 0, 0, 0);
    self->_socket = v14;
    if (!v14)
    {
      BOOL v24 = +[NMSSHLogger sharedLogger];
      int64_t v25 = [NSString stringWithFormat:@"Error creating the socket"];
      [v24 logError:v25];

      CFRelease(v12);
      goto LABEL_28;
    }
    *(_DWORD *)bytes = 1;
    CFSocketNativeHandle Native = CFSocketGetNative(v14);
    if (setsockopt(Native, 0xFFFF, 4130, bytes, 4u))
    {
      int v26 = +[NMSSHLogger sharedLogger];
      BOOL v27 = [NSString stringWithFormat:@"Error setting socket option"];
      [v26 logError:v27];

      CFRelease(v12);
      [(NMSSHSession *)self disconnect];
LABEL_28:

LABEL_29:
      BOOL v21 = 0;
      goto LABEL_30;
    }
    socket = self->_socket;
    [v53 doubleValue];
    CFSocketError v9 = CFSocketConnectToAddress(socket, v12, v17);
    CFRelease(v12);
    unsigned int v18 = +[NMSSHLogger sharedLogger];
    if (v9)
    {
      uint64_t v19 = [NSString stringWithFormat:@"Socket connection to %@ on port %ld failed with reason %li, trying next address...", v11, v5, v9];
      [v18 logVerbose:v19];
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"Socket connection to %@ on port %ld succesful", v11, v5];
      [v18 logInfo:v19];
    }

LABEL_21:
    ++v7;
  }
  if (v9) {
    goto LABEL_24;
  }
  [(NMSSHSession *)self setSession:libssh2_session_init_ex(0, 0, 0, (uint64_t)self)];
  libssh2_session_callback_set((uint64_t *)[(NMSSHSession *)self rawSession], 2, (uint64_t)disconnect_callback);
  libssh2_session_set_blocking((uint64_t)[(NMSSHSession *)self rawSession], 1);
  id v29 = [(NMSSHSession *)self banner];
  if (v29)
  {
    int v30 = [(NMSSHSession *)self rawSession];
    id v31 = [(NMSSHSession *)self banner];
    LOBYTE(v30) = libssh2_session_banner_set((uint64_t)v30, (char *)[v31 UTF8String]) == 0;

    if ((v30 & 1) == 0)
    {
      v32 = +[NMSSHLogger sharedLogger];
      uint64_t v33 = [NSString stringWithFormat:@"Failure setting the banner"];
      [v32 logError:v33];
    }
  }
  uint64_t v34 = [(NMSSHSession *)self rawSession];
  CFSocketNativeHandle v35 = CFSocketGetNative(self->_socket);
  if (!libssh2_session_handshake((uint64_t)v34, v35))
  {
    v38 = +[NMSSHLogger sharedLogger];
    v39 = NSString;
    int v40 = [(NMSSHSession *)self remoteBanner];
    v41 = [v39 stringWithFormat:@"Remote host banner is %@", v40];
    [v38 logVerbose:v41];

    id v10 = [(NMSSHSession *)self fingerprint:[(NMSSHSession *)self fingerprintHash]];
    v42 = +[NMSSHLogger sharedLogger];
    v43 = [NSString stringWithFormat:@"The host's fingerprint is %@", v10];
    [v42 logInfo:v43];

    v44 = [(NMSSHSession *)self delegate];
    if (v44)
    {
      v45 = [(NMSSHSession *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        v46 = [(NMSSHSession *)self delegate];
        char v47 = [v46 session:self shouldConnectToHostWithFingerprint:v10];

        if ((v47 & 1) == 0)
        {
          v48 = +[NMSSHLogger sharedLogger];
          v49 = [NSString stringWithFormat:@"Fingerprint refused, aborting connection..."];
          [v48 logWarn:v49];

          [(NMSSHSession *)self disconnect];
          goto LABEL_29;
        }
      }
      else
      {
      }
    }
    v50 = +[NMSSHLogger sharedLogger];
    v51 = [NSString stringWithFormat:@"SSH session started"];
    [v50 logVerbose:v51];

    [(NMSSHSession *)self setConnected:1];
    BOOL v21 = [(NMSSHSession *)self isConnected];
LABEL_30:

    goto LABEL_31;
  }
  v36 = +[NMSSHLogger sharedLogger];
  v37 = [NSString stringWithFormat:@"Failure establishing SSH session"];
  [v36 logError:v37];

  [(NMSSHSession *)self disconnect];
LABEL_25:
  BOOL v21 = 0;
LABEL_31:

LABEL_32:
  _Block_object_dispose(&v55, 8);

  return v21;
}

void __35__NMSSHSession_connectWithTimeout___block_invoke(uint64_t a1)
{
  if (libssh2_init(0))
  {
    v2 = +[NMSSHLogger sharedLogger];
    BOOL v3 = [NSString stringWithFormat:@"libssh2 initialization failed"];
    [v2 logError:v3];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  id v5 = +[NMSSHLogger sharedLogger];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"libssh2 (v%s) initialized", libssh2_version(0));
  [v5 logVerbose:v4];
}

- (BOOL)connect
{
  BOOL v3 = [NSNumber numberWithLong:10];
  LOBYTE(self) = [(NMSSHSession *)self connectWithTimeout:v3];

  return (char)self;
}

- (NSString)remoteBanner
{
  v2 = (void *)libssh2_session_banner_get((uint64_t)[(NMSSHSession *)self rawSession]);
  if (v2) {
    v2 = (void *)[[NSString alloc] initWithCString:v2 encoding:4];
  }
  return (NSString *)v2;
}

- (NSError)lastError
{
  v16[1] = *MEMORY[0x263EF8340];
  if ([(NMSSHSession *)self rawSession])
  {
    CFDataRef v12 = 0;
    int v3 = libssh2_session_last_error((uint64_t)[(NMSSHSession *)self rawSession], &v12, 0, 0);
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = v3;
    uint64_t v13 = *MEMORY[0x263F08320];
    id v6 = [NSString stringWithUTF8String:v12];
    unint64_t v14 = v6;
    unint64_t v7 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    CFAllocatorRef v8 = [v4 errorWithDomain:@"libssh2" code:v5 userInfo:v7];
  }
  else
  {
    CFSocketError v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = @"Error retrieving last session error due to absence of an active session.";
    id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    CFAllocatorRef v8 = [v9 errorWithDomain:@"libssh2" code:0 userInfo:v10];
  }
  return (NSError *)v8;
}

- (void)setTimeout:(id)a3
{
  id v4 = a3;
  if ([(NMSSHSession *)self rawSession]) {
    libssh2_session_set_timeout((uint64_t)-[NMSSHSession rawSession](self, "rawSession"), 1000 * [v4 longValue]);
  }
}

- (NSNumber)timeout
{
  if ([(NMSSHSession *)self rawSession])
  {
    int v3 = objc_msgSend(NSNumber, "numberWithLong:", libssh2_session_get_timeout((uint64_t)-[NMSSHSession rawSession](self, "rawSession")) / 1000);
  }
  else
  {
    int v3 = &unk_26F075630;
  }
  return (NSNumber *)v3;
}

- (id)hostIPAddresses
{
  int v3 = [(NSString *)self->_host componentsSeparatedByString:@":"];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [v3 objectAtIndexedSubscript:0];
  if (v4 >= 4)
  {
    id v6 = [v3 objectAtIndexedSubscript:0];
    if ([v6 hasPrefix:@"["])
    {
      unint64_t v7 = [v3 objectAtIndexedSubscript:v4 - 2];
      int v8 = [v7 hasSuffix:@"]"];

      if (v8)
      {
        CFSocketError v9 = [(NSString *)self->_host substringWithRange:1, [(NSString *)self->_host rangeOfString:@"]" options:4] - 1];
LABEL_9:
        id v10 = (__CFString *)v9;

        uint64_t v5 = v10;
        goto LABEL_10;
      }
    }
    else
    {
    }
LABEL_8:
    CFSocketError v9 = self->_host;
    goto LABEL_9;
  }
  if (v4 == 3) {
    goto LABEL_8;
  }
LABEL_10:
  id v11 = CFHostCreateWithName((CFAllocatorRef)*MEMORY[0x263EFFB08], v5);
  error.domain = 0;
  *(void *)&error.CFStreamError error = 0;
  CFDataRef v12 = +[NMSSHLogger sharedLogger];
  if (v11)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Start %@ resolution", v5];
    [v12 logVerbose:v13];

    if (CFHostStartInfoResolution(v11, kCFHostAddresses, &error))
    {
      unint64_t v14 = CFHostGetAddressing(v11, 0);
    }
    else
    {
      BOOL v16 = +[NMSSHLogger sharedLogger];
      CFTimeInterval v17 = [NSString stringWithFormat:@"Unable to resolve host %@", v5];
      [v16 logError:v17];

      unint64_t v14 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    uint64_t v15 = [NSString stringWithFormat:@"Error allocating CFHost for %@", v5];
    [v12 logError:v15];

    unint64_t v14 = 0;
  }

  return v14;
}

- (NMSSHSession)initWithHost:(id)a3 andUsername:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(id)objc_opt_class() URLForHost:v7];

  CFSocketError v9 = [v8 host];
  id v10 = [v8 port];
  id v11 = v10;
  if (!v10) {
    id v10 = &unk_26F075618;
  }
  CFDataRef v12 = -[NMSSHSession initWithHost:port:andUsername:](self, "initWithHost:port:andUsername:", v9, (int)[v10 intValue], v6);

  return v12;
}

- (NMSSHSession)initWithHost:(id)a3 configs:(id)a4 withDefaultPort:(int64_t)a5 defaultUsername:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  CFDataRef v12 = objc_alloc_init(NMSSHHostConfig);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned int v18 = [*(id *)(*((void *)&v28 + 1) + 8 * v17) hostConfigForHost:v9];
        if (v18) {
          [(NMSSHHostConfig *)v12 mergeFrom:v18];
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }

  uint64_t v19 = objc_alloc_init(NMSSHHostConfig);
  [(NMSSHHostConfig *)v19 setHostname:v9];
  unint64_t v20 = [NSNumber numberWithInteger:a5];
  [(NMSSHHostConfig *)v19 setPort:v20];

  [(NMSSHHostConfig *)v19 setUser:v11];
  [(NMSSHHostConfig *)v12 mergeFrom:v19];
  BOOL v21 = [(NMSSHHostConfig *)v12 hostname];
  BOOL v22 = [(NMSSHHostConfig *)v12 port];
  uint64_t v23 = [v22 integerValue];
  BOOL v24 = [(NMSSHHostConfig *)v12 user];
  int64_t v25 = [(NMSSHSession *)self initWithHost:v21 port:v23 andUsername:v24];

  if (v25) {
    [(NMSSHSession *)v25 setHostConfig:v12];
  }

  return v25;
}

- (NMSSHSession)initWithHost:(id)a3 port:(int64_t)a4 andUsername:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NMSSHSession;
  id v10 = [(NMSSHSession *)&v14 init];
  id v11 = v10;
  if (v10)
  {
    [(NMSSHSession *)v10 setHost:v8];
    CFDataRef v12 = [NSNumber numberWithInteger:a4];
    [(NMSSHSession *)v11 setPort:v12];

    [(NMSSHSession *)v11 setUsername:v9];
    [(NMSSHSession *)v11 setConnected:0];
    [(NMSSHSession *)v11 setFingerprintHash:0];
  }

  return v11;
}

+ (id)URLForHost:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 componentsSeparatedByString:@":"];
  if ((unint64_t)[v4 count] >= 3)
  {
    char v5 = [v3 hasPrefix:@"["];

    if (v5) {
      goto LABEL_5;
    }
    [NSString stringWithFormat:@"[%@]", v3];
    uint64_t v4 = v3;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_5:
  id v6 = NSURL;
  id v7 = [@"ssh://" stringByAppendingString:v3];
  id v8 = [v6 URLWithString:v7];

  return v8;
}

+ (id)connectToHost:(id)a3 withUsername:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NMSSHSession alloc] initWithHost:v6 andUsername:v5];

  [(NMSSHSession *)v7 connect];
  return v7;
}

+ (id)connectToHost:(id)a3 port:(int64_t)a4 withUsername:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [[NMSSHSession alloc] initWithHost:v8 port:a4 andUsername:v7];

  [(NMSSHSession *)v9 connect];
  return v9;
}

@end