@interface CMDataContainer
+ (BOOL)supportsSecureCoding;
+ (id)classes;
+ (id)versionS;
- (CMDataContainer)init;
- (CMDataContainer)initWithCoder:(id)a3;
- (NSMutableArray)cmDataRecv;
- (NSMutableArray)cmDataSent;
- (NSMutableArray)cmEvents;
- (NSMutableArray)cmMsgRecv;
- (NSMutableArray)cmMsgSent;
- (NSNumber)sessionID;
- (NSString)cv3dVersion;
- (NSString)cvPlayerVersion;
- (NSString)deviceString;
- (NSString)iOSVersion;
- (NSString)macOSVersion;
- (NSString)version;
- (id)grabNextDataRecv;
- (id)grabNextDataSent;
- (id)grabNextEvent;
- (id)grabNextMessageRecv;
- (id)grabNextMessageSent;
- (void)appendCMData:(id)a3 sending:(BOOL)a4;
- (void)appendCMEvent:(id)a3;
- (void)appendCMMessage:(id)a3 sending:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)resetReader;
- (void)setCmDataRecv:(id)a3;
- (void)setCmDataSent:(id)a3;
- (void)setCmEvents:(id)a3;
- (void)setCmMsgRecv:(id)a3;
- (void)setCmMsgSent:(id)a3;
- (void)setCv3dVersion:(id)a3;
- (void)setCvPlayerVersion:(id)a3;
- (void)setDeviceString:(id)a3;
- (void)setIOSVersion:(id)a3;
- (void)setMacOSVersion:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation CMDataContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)versionS
{
  return @"1.1.0";
}

+ (id)classes
{
  v6[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)resetReader
{
  self->nextEvent = 0;
  *(_OWORD *)&self->nextMsgSent = 0u;
  *(_OWORD *)&self->nextDataSent = 0u;
}

- (CMDataContainer)init
{
  v16.receiver = self;
  v16.super_class = (Class)CMDataContainer;
  v2 = [(CMDataContainer *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[CMDataContainer versionS];
    version = v2->_version;
    v2->_version = (NSString *)v3;

    uint64_t v5 = objc_opt_new();
    cmDataSent = v2->_cmDataSent;
    v2->_cmDataSent = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    cmDataRecv = v2->_cmDataRecv;
    v2->_cmDataRecv = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    cmMsgSent = v2->_cmMsgSent;
    v2->_cmMsgSent = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    cmMsgRecv = v2->_cmMsgRecv;
    v2->_cmMsgRecv = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    cmEvents = v2->_cmEvents;
    v2->_cmEvents = (NSMutableArray *)v13;
  }
  return v2;
}

- (CMDataContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CMDataContainer;
  uint64_t v5 = [(CMDataContainer *)&v32 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x21D490BF0]();
    uint64_t v7 = [v4 decodeObjectForKey:@"v"];
    version = v5->_version;
    v5->_version = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"cv"];
    cvPlayerVersion = v5->_cvPlayerVersion;
    v5->_cvPlayerVersion = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectForKey:@"cv3d"];
    cv3dVersion = v5->_cv3dVersion;
    v5->_cv3dVersion = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectForKey:@"iOS"];
    iOSVersion = v5->_iOSVersion;
    v5->_iOSVersion = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectForKey:@"macOS"];
    macOSVersion = v5->_macOSVersion;
    v5->_macOSVersion = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectForKey:@"hw"];
    deviceString = v5->_deviceString;
    v5->_deviceString = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectForKey:@"sid"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectForKey:@"dsd"];
    cmDataSent = v5->_cmDataSent;
    v5->_cmDataSent = (NSMutableArray *)v21;

    uint64_t v23 = [v4 decodeObjectForKey:@"drv"];
    cmDataRecv = v5->_cmDataRecv;
    v5->_cmDataRecv = (NSMutableArray *)v23;

    uint64_t v25 = [v4 decodeObjectForKey:@"ds"];
    cmMsgSent = v5->_cmMsgSent;
    v5->_cmMsgSent = (NSMutableArray *)v25;

    uint64_t v27 = [v4 decodeObjectForKey:@"dr"];
    cmMsgRecv = v5->_cmMsgRecv;
    v5->_cmMsgRecv = (NSMutableArray *)v27;

    uint64_t v29 = [v4 decodeObjectForKey:@"e"];
    cmEvents = v5->_cmEvents;
    v5->_cmEvents = (NSMutableArray *)v29;

    [(CMDataContainer *)v5 resetReader];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeObject:self->_version forKey:@"v"];
  [v5 encodeObject:self->_cvPlayerVersion forKey:@"cv"];
  [v5 encodeObject:self->_cv3dVersion forKey:@"cv3d"];
  [v5 encodeObject:self->_iOSVersion forKey:@"ios"];
  [v5 encodeObject:self->_macOSVersion forKey:@"macOS"];
  [v5 encodeObject:self->_deviceString forKey:@"hw"];
  [v5 encodeObject:self->_sessionID forKey:@"sid"];
  [v5 encodeObject:self->_cmDataSent forKey:@"dsd"];
  [v5 encodeObject:self->_cmDataRecv forKey:@"drv"];
  [v5 encodeObject:self->_cmMsgSent forKey:@"ds"];
  [v5 encodeObject:self->_cmMsgRecv forKey:@"dr"];
  [v5 encodeObject:self->_cmEvents forKey:@"e"];
}

- (void)appendCMData:(id)a3 sending:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = 112;
  if (v4) {
    uint64_t v7 = 104;
  }
  [*(id *)((char *)&v6->super.isa + v7) addObject:v8];
  objc_sync_exit(v6);
}

- (void)appendCMMessage:(id)a3 sending:(BOOL)a4
{
  uint64_t v4 = 128;
  if (a4) {
    uint64_t v4 = 120;
  }
  [*(id *)((char *)&self->super.isa + v4) addObject:a3];
}

- (void)appendCMEvent:(id)a3
{
}

- (id)grabNextDataRecv
{
  unint64_t nextDataRecv = self->nextDataRecv;
  if (nextDataRecv >= [(NSMutableArray *)self->_cmDataRecv count])
  {
    v6 = 0;
  }
  else
  {
    cmDataRecv = self->_cmDataRecv;
    ++self->nextDataRecv;
    id v5 = -[NSMutableArray objectAtIndexedSubscript:](cmDataRecv, "objectAtIndexedSubscript:");
    [v5 setIsSent:0];
    v6 = v5;
  }
  return v6;
}

- (id)grabNextDataSent
{
  unint64_t nextDataSent = self->nextDataSent;
  if (nextDataSent >= [(NSMutableArray *)self->_cmDataSent count])
  {
    v6 = 0;
  }
  else
  {
    cmDataSent = self->_cmDataSent;
    ++self->nextDataSent;
    id v5 = -[NSMutableArray objectAtIndexedSubscript:](cmDataSent, "objectAtIndexedSubscript:");
    [v5 setIsSent:1];
    v6 = v5;
  }
  return v6;
}

- (id)grabNextMessageRecv
{
  unint64_t nextMsgRecv = self->nextMsgRecv;
  if (nextMsgRecv >= [(NSMutableArray *)self->_cmMsgRecv count])
  {
    v6 = 0;
  }
  else
  {
    cmMsgRecv = self->_cmMsgRecv;
    ++self->nextMsgRecv;
    id v5 = -[NSMutableArray objectAtIndexedSubscript:](cmMsgRecv, "objectAtIndexedSubscript:");
    [v5 setIsSent:0];
    v6 = v5;
  }
  return v6;
}

- (id)grabNextMessageSent
{
  unint64_t nextMsgSent = self->nextMsgSent;
  if (nextMsgSent >= [(NSMutableArray *)self->_cmMsgSent count])
  {
    v6 = 0;
  }
  else
  {
    cmMsgSent = self->_cmMsgSent;
    ++self->nextMsgSent;
    id v5 = -[NSMutableArray objectAtIndexedSubscript:](cmMsgSent, "objectAtIndexedSubscript:");
    [v5 setIsSent:1];
    v6 = v5;
  }
  return v6;
}

- (id)grabNextEvent
{
  unint64_t nextEvent = self->nextEvent;
  if (nextEvent >= [(NSMutableArray *)self->_cmEvents count])
  {
    id v5 = 0;
  }
  else
  {
    cmEvents = self->_cmEvents;
    ++self->nextEvent;
    id v5 = -[NSMutableArray objectAtIndexedSubscript:](cmEvents, "objectAtIndexedSubscript:");
  }
  return v5;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)cv3dVersion
{
  return self->_cv3dVersion;
}

- (void)setCv3dVersion:(id)a3
{
}

- (NSString)iOSVersion
{
  return self->_iOSVersion;
}

- (void)setIOSVersion:(id)a3
{
}

- (NSString)macOSVersion
{
  return self->_macOSVersion;
}

- (void)setMacOSVersion:(id)a3
{
}

- (NSString)cvPlayerVersion
{
  return self->_cvPlayerVersion;
}

- (void)setCvPlayerVersion:(id)a3
{
}

- (NSString)deviceString
{
  return self->_deviceString;
}

- (void)setDeviceString:(id)a3
{
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSMutableArray)cmDataSent
{
  return self->_cmDataSent;
}

- (void)setCmDataSent:(id)a3
{
}

- (NSMutableArray)cmDataRecv
{
  return self->_cmDataRecv;
}

- (void)setCmDataRecv:(id)a3
{
}

- (NSMutableArray)cmMsgSent
{
  return self->_cmMsgSent;
}

- (void)setCmMsgSent:(id)a3
{
}

- (NSMutableArray)cmMsgRecv
{
  return self->_cmMsgRecv;
}

- (void)setCmMsgRecv:(id)a3
{
}

- (NSMutableArray)cmEvents
{
  return self->_cmEvents;
}

- (void)setCmEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmEvents, 0);
  objc_storeStrong((id *)&self->_cmMsgRecv, 0);
  objc_storeStrong((id *)&self->_cmMsgSent, 0);
  objc_storeStrong((id *)&self->_cmDataRecv, 0);
  objc_storeStrong((id *)&self->_cmDataSent, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_deviceString, 0);
  objc_storeStrong((id *)&self->_cvPlayerVersion, 0);
  objc_storeStrong((id *)&self->_macOSVersion, 0);
  objc_storeStrong((id *)&self->_iOSVersion, 0);
  objc_storeStrong((id *)&self->_cv3dVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end