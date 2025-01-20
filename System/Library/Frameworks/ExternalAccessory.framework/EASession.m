@interface EASession
- (BOOL)isOpenCompleted;
- (EAAccessory)accessory;
- (EASession)init;
- (EASession)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocolString;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (NSString)protocolString;
- (id)EASessionUUID;
- (id)_shortDescription;
- (id)description;
- (unsigned)_sessionID;
- (void)_endStreams;
- (void)_handleIncomingEAData:(id)a3;
- (void)_streamClosed;
- (void)dealloc;
- (void)setOpenCompleted:(BOOL)a3;
@end

@implementation EASession

- (EASession)init
{
  return 0;
}

- (EASession)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocolString
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)EASession;
  v6 = [(EASession *)&v29 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v6->_sock = -1;
  v6->_useSocketInterfaceForEASession = 1;
  v6->_sessionID = 0x10000;
  int v24 = 0x10000;
  v6->_accessory = accessory;
  uint64_t v8 = [(NSString *)protocolString copy];
  v7->_protocolString = (NSString *)v8;
  v7->_eaSessionUUIDFromCoreAccessories = 0;
  id v9 = [(EAAccessory *)accessory _protocolIDForProtocolString:v8];
  if ([+[EAAccessoryManager sharedAccessoryManager] appDeclaresProtocol:protocolString])
  {
    if (v9)
    {
      if ([(EAAccessory *)v7->_accessory createdByCoreAccessories])
      {
        v10 = +[EAAccessoryManager sharedAccessoryManager];
        uint64_t v11 = [(EAAccessory *)v7->_accessory coreAccessoriesPrimaryUUID];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __43__EASession_initWithAccessory_forProtocol___block_invoke;
        v23[3] = &unk_1E6293FE8;
        v23[4] = v7;
        v23[5] = &v25;
        [(EAAccessoryManager *)v10 createEASessionForProtocol:protocolString accessoryUUID:v11 withReply:v23];
      }
      else
      {
        [(EAAccessory *)accessory _internalConnectionID];
        [v9 unsignedIntValue];
        IAPAppCreateSessionForAccessory();
        v7->_sessionID = v24;
        v7->_useSocketInterfaceForEASession = 1;
      }
      if (*((unsigned char *)v26 + 24)) {
        goto LABEL_23;
      }
      if (!v7->_useSocketInterfaceForEASession)
      {
        v7->_inputStream = (NSInputStream *)[[EAInputStream alloc] initWithAccessoryWithoutSocket:accessory forSession:v7];
        v13 = [[EAOutputStream alloc] initWithAccessoryWithoutSocket:accessory forSession:v7];
        goto LABEL_16;
      }
      if (!HIWORD(v7->_sessionID))
      {
        int v22 = 1;
        eaSessionUUIDFromCoreAccessories = v7->_eaSessionUUIDFromCoreAccessories;
        if (eaSessionUUIDFromCoreAccessories)
        {
          __snprintf_chk(v30, 0x100uLL, 0, 0x100uLL, "%s/ea.%lu", "/var/mobile/Library/ExternalAccessory", [(NSString *)eaSessionUUIDFromCoreAccessories hash]);
          NSLog(&cfstr_Externalaccess_95.isa, v30);
        }
        else
        {
          [(EAAccessory *)accessory _internalConnectionID];
          IAPAppToAppSocketPath();
        }
        int v14 = socket(1, 1, 0);
        v7->_sock = v14;
        if (v14 < 0)
        {
          uint64_t v16 = *__error();
          v17 = __error();
          v18 = strerror(*v17);
          NSLog(&cfstr_Externalaccess_96.isa, v16, v18);
          *((unsigned char *)v26 + 24) = 1;
          v7->_sock = -1;
          goto LABEL_23;
        }
        uint64_t v32 = 0;
        memset(v31.sa_data, 0, 96);
        *(_WORD *)&v31.sa_len = 362;
        __strlcpy_chk();
        if (connect(v7->_sock, &v31, 0x6Au))
        {
          v15 = __error();
          NSLog(&cfstr_Externalaccess_97.isa, *v15);
          goto LABEL_8;
        }
        if (ioctl(v7->_sock, 0x8004667EuLL, &v22))
        {
          v20 = __error();
          NSLog(&cfstr_Externalaccess_98.isa, *v20);
        }
        int v21 = 0x10000;
        setsockopt(v7->_sock, 0xFFFF, 4097, &v21, 4u);
        setsockopt(v7->_sock, 0xFFFF, 4098, &v21, 4u);
        v7->_inputStream = (NSInputStream *)[[EAInputStream alloc] initWithAccessory:accessory forSession:v7 socket:v7->_sock];
        v13 = [[EAOutputStream alloc] initWithAccessory:accessory forSession:v7 socket:v7->_sock];
LABEL_16:
        v7->_outputStream = &v13->super;
        goto LABEL_23;
      }
      NSLog(&cfstr_Externalaccess_99.isa);
    }
    else
    {
      NSLog(&cfstr_Externalaccess_100.isa, protocolString);
    }
  }
  else
  {
    NSLog(&cfstr_Externalaccess_93.isa, protocolString);
  }
LABEL_8:
  *((unsigned char *)v26 + 24) = 1;
LABEL_23:
  if (*((unsigned char *)v26 + 24))
  {

    v7 = 0;
  }
  else
  {
    [(EAAccessory *)v7->_accessory _addSession:v7];
  }
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __43__EASession_initWithAccessory_forProtocol___block_invoke(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, void *a5)
{
  int v6 = a4;
  char v7 = a3;
  NSLog(&cfstr_Externalaccess_94.isa, a2, a3, a4);
  if (a2)
  {
    [+[EAAccessoryManager sharedAccessoryManager] saveEASession:*(void *)(a1 + 32) forEASessionUUID:a5];
    *(_DWORD *)(*(void *)(a1 + 32) + 16) = v6;
    *(void *)(*(void *)(a1 + 32) + 64) = [a5 copy];
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = v7;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)dealloc
{
  uint64_t sessionID = self->_sessionID;
  accessory = self->_accessory;
  if (!accessory || sessionID == 0x10000)
  {
    NSLog(&cfstr_Externalaccess_101.isa, a2, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EASession.m", "-[EASession dealloc]", 212, accessory, sessionID);
  }
  else if (!self->_eaSessionUUIDFromCoreAccessories)
  {
    [(EAAccessory *)accessory _internalConnectionID];
    IAPAppCloseSessionToAccessory();
  }

  eaSessionUUIDFromCoreAccessories = self->_eaSessionUUIDFromCoreAccessories;
  if (eaSessionUUIDFromCoreAccessories) {

  }
  int sock = self->_sock;
  BOOL v7 = +[EAAccessoryManager isLoggingEnabled];
  if (sock == -1)
  {
    if (v7) {
      NSLog(&cfstr_Externalaccess_103.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EASession.m", "-[EASession dealloc]", 231, sessionID);
    }
  }
  else
  {
    if (v7) {
      NSLog(&cfstr_Externalaccess_102.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EASession.m", "-[EASession dealloc]", 224, self->_sock, sessionID);
    }
    close(self->_sock);
    self->_int sock = -1;
  }
  v8.receiver = self;
  v8.super_class = (Class)EASession;
  [(EASession *)&v8 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)EASession;
  return (id)[NSString stringWithFormat:@"%@ {\n  accessory:%@\n  protocolString:%@\n  inputStream:%@\n  outputStream: %@\n}", -[EASession description](&v3, sel_description), -[EAAccessory _shortDescription](self->_accessory, "_shortDescription"), self->_protocolString, self->_inputStream, self->_outputStream];
}

- (id)_shortDescription
{
  v3.receiver = self;
  v3.super_class = (Class)EASession;
  return (id)[NSString stringWithFormat:@"%@", -[EASession description](&v3, sel_description)];
}

- (unsigned)_sessionID
{
  return self->_sessionID;
}

- (void)_streamClosed
{
  if ([(NSOutputStream *)self->_outputStream streamStatus] == 6
    && [(NSInputStream *)self->_inputStream streamStatus] == 6)
  {
    NSLog(&cfstr_Externalaccess_104.isa, self->_eaSessionUUIDFromCoreAccessories);
    [+[EAAccessoryManager sharedAccessoryManager] closeEASessionForEASessionUUID:self->_eaSessionUUIDFromCoreAccessories];
    accessory = self->_accessory;
    [(EAAccessory *)accessory _removeSession:self];
  }
}

- (void)_endStreams
{
  [(NSInputStream *)self->_inputStream endStream];
  outputStream = self->_outputStream;

  [(NSOutputStream *)outputStream endStream];
}

- (BOOL)isOpenCompleted
{
  return self->_openCompleted;
}

- (void)setOpenCompleted:(BOOL)a3
{
  if (a3)
  {
    self->_openCompleted = 1;
    [(NSInputStream *)self->_inputStream openCompleted];
    [(NSOutputStream *)self->_outputStream openCompleted];
    v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"EASessionOpenCompletedNotification" object:self];
  }
}

- (id)EASessionUUID
{
  return self->_eaSessionUUIDFromCoreAccessories;
}

- (void)_handleIncomingEAData:(id)a3
{
}

- (EAAccessory)accessory
{
  return self->_accessory;
}

- (NSString)protocolString
{
  return self->_protocolString;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

@end