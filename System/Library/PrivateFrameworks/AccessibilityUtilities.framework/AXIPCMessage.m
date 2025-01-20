@interface AXIPCMessage
+ (BOOL)supportsSecureCoding;
+ (id)archivedMessageFromData:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (AXIPCMessage)initWithCoder:(id)a3;
- (AXIPCMessage)initWithKey:(int)a3;
- (AXIPCMessage)initWithKey:(int)a3 payload:(id)a4;
- (BOOL)processedMessage;
- (NSDictionary)payload;
- (NSString)senderBundleId;
- (id)description;
- (int)key;
- (unint64_t)uniqueID;
- (unsigned)clientPort;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setClientPort:(unsigned int)a3;
- (void)setKey:(int)a3;
- (void)setPayload:(id)a3;
- (void)setProcessedMessage:(BOOL)a3;
- (void)setUniqueID:(unint64_t)a3;
@end

@implementation AXIPCMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  mach_port_name_t clientPort = self->_clientPort;
  if (clientPort)
  {
    uint64_t v4 = mach_port_deallocate(*MEMORY[0x1E4F14960], clientPort);
    if (v4)
    {
      uint64_t v6 = self->_clientPort;
      uint64_t v7 = v4;
      v5 = "-[AXIPCMessage dealloc]";
      _AXAssert();
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)AXIPCMessage;
  [(AXIPCMessage *)&v8 dealloc];
}

- (int)key
{
  return self->_key;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(AXIPCMessage *)self payload];
  if (v4 && ![(id)objc_opt_class() supportsSecureCoding])
  {
    _AXLogWithFacility();
  }
  else
  {
    [v5 encodeObject:v4 forKey:@"payload"];
    objc_msgSend(v5, "encodeInt32:forKey:", -[AXIPCMessage key](self, "key"), @"key");
  }
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setProcessedMessage:(BOOL)a3
{
  self->_processedMessage = a3;
}

- (void)setClientPort:(unsigned int)a3
{
  BOOL v5 = AXIncrefSendRight(a3);
  mach_port_name_t clientPort = self->_clientPort;
  if (clientPort) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], clientPort);
  }
  if (v5) {
    self->_mach_port_name_t clientPort = a3;
  }
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- (BOOL)processedMessage
{
  return self->_processedMessage;
}

+ (id)archivedMessageFromData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v18 = 0;
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v18];
    id v5 = v18;
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F48398] sharedInstance];
      char v7 = [v6 ignoreLogging];

      if ((v7 & 1) == 0)
      {
        objc_super v8 = [MEMORY[0x1E4F48398] identifier];
        v9 = AXLoggerForFacility();

        os_log_type_t v10 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v9, v10))
        {
          v11 = AXColorizeFormatLog();
          v12 = _AXStringForArgs();
          if (os_log_type_enabled(v9, v10))
          {
            *(_DWORD *)buf = 138543362;
            v20 = v12;
            _os_log_impl(&dword_18D308000, v9, v10, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v16 = [v4 decodeObjectOfClasses:v15 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (AXIPCMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AXIPCMessage;
  id v5 = [(AXIPCMessage *)&v22 init];
  if (v5)
  {
    -[AXIPCMessage setKey:](v5, "setKey:", [v4 decodeInt32ForKey:@"key"]);
    if (!AllowedClasses)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v20 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_msgSend(v21, "setWithObjects:", v20, v19, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
      uint64_t v14 = (void *)AllowedClasses;
      AllowedClasses = v13;
    }
    Class v15 = NSClassFromString(&cfstr_Axhearingaidmo.isa);
    if (v15) {
      [(id)AllowedClasses addObject:v15];
    }
    uint64_t v16 = [v4 decodeObjectOfClasses:AllowedClasses forKey:@"payload"];
    if (v16) {
      v17 = (void *)v16;
    }
    else {
      v17 = (void *)MEMORY[0x1E4F1CC08];
    }
    [(AXIPCMessage *)v5 setPayload:v17];
    ++AXIPCMessageUniqueID;
    -[AXIPCMessage setUniqueID:](v5, "setUniqueID:");
  }
  return v5;
}

- (AXIPCMessage)initWithKey:(int)a3 payload:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXIPCMessage;
  uint64_t v7 = [(AXIPCMessage *)&v11 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(AXIPCMessage *)v7 setKey:v4];
    if (v6)
    {
      uint64_t v9 = (void *)[v6 copy];
      [(AXIPCMessage *)v8 setPayload:v9];
    }
    else
    {
      [(AXIPCMessage *)v8 setPayload:MEMORY[0x1E4F1CC08]];
    }
    v8->_mach_port_name_t clientPort = 0;
    ++AXIPCMessageUniqueID;
    -[AXIPCMessage setUniqueID:](v8, "setUniqueID:");
  }

  return v8;
}

- (void)setUniqueID:(unint64_t)a3
{
  self->_uniqueID = a3;
}

- (void)setPayload:(id)a3
{
}

- (void)setKey:(int)a3
{
  self->_key = a3;
}

- (AXIPCMessage)initWithKey:(int)a3
{
  return [(AXIPCMessage *)self initWithKey:*(void *)&a3 payload:0];
}

- (NSString)senderBundleId
{
  v2 = (void *)MEMORY[0x1F4188790](self, a2);
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend(v2, "auditToken", 0, 0, 0, 0);
  id v3 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", buffer, proc_pidpath(pid_4, buffer, 0x1000u), 4);
  uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  if (v4)
  {
    id v5 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28B50]);
      uint64_t v7 = [v5 path];
      uint64_t v8 = (void *)[v6 initWithPath:v7];

      if (v8)
      {
        uint64_t v9 = [v8 bundleIdentifier];
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (NSString *)v9;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)AXIPCMessage;
  uint64_t v4 = [(AXIPCMessage *)&v11 description];
  uint64_t v5 = [(AXIPCMessage *)self clientPort];
  uint64_t v6 = [(AXIPCMessage *)self key];
  uint64_t v7 = [(AXIPCMessage *)self payload];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[AXIPCMessage uniqueID](self, "uniqueID"));
  uint64_t v9 = [v3 stringWithFormat:@"%@. Client port: %ld. Key: %d. Payload: %@ (%@)", v4, v5, v6, v7, v8];

  return v9;
}

- (unsigned)clientPort
{
  return self->_clientPort;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

@end