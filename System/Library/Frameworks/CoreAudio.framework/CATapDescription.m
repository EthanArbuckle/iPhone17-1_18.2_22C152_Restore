@interface CATapDescription
- (BOOL)isExclusive;
- (BOOL)isMixdown;
- (BOOL)isMono;
- (BOOL)isPrivate;
- (CATapDescription)init;
- (CATapDescription)initWithDictionary:(id)a3;
- (CATapDescription)initWithProcesses:(id)a3 andDeviceUID:(id)a4 withStream:(int64_t)a5;
- (NSArray)processes;
- (NSNumber)stream;
- (NSString)deviceUID;
- (NSString)name;
- (NSUUID)UUID;
- (id)initExcludingProcesses:(id)a3 andDeviceUID:(id)a4 withStream:(int64_t)a5;
- (id)initMonoGlobalTapButExcludeProcesses:(id)a3;
- (id)initMonoMixdownOfProcesses:(id)a3;
- (id)initStereoGlobalTapButExcludeProcesses:(id)a3;
- (id)initStereoMixdownOfProcesses:(id)a3;
- (int64_t)isMuted;
- (void)setDeviceUID:(id)a3;
- (void)setExclusive:(BOOL)a3;
- (void)setMixdown:(BOOL)a3;
- (void)setMono:(BOOL)a3;
- (void)setMuteBehavior:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setPrivate:(BOOL)a3;
- (void)setProcesses:(id)a3;
- (void)setStream:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation CATapDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setStream:(id)a3
{
}

- (NSNumber)stream
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDeviceUID:(id)a3
{
}

- (NSString)deviceUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMuteBehavior:(int64_t)a3
{
  self->_muteBehavior = a3;
}

- (int64_t)isMuted
{
  return self->_muteBehavior;
}

- (void)setPrivate:(BOOL)a3
{
  self->_privateTap = a3;
}

- (BOOL)isPrivate
{
  return self->_privateTap;
}

- (void)setMixdown:(BOOL)a3
{
  self->_mixdown = a3;
}

- (BOOL)isMixdown
{
  return self->_mixdown;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (void)setMono:(BOOL)a3
{
  self->_mono = a3;
}

- (BOOL)isMono
{
  return self->_mono;
}

- (void)setProcesses:(id)a3
{
}

- (NSArray)processes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)initExcludingProcesses:(id)a3 andDeviceUID:(id)a4 withStream:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(CATapDescription);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_processes, a3);
    objc_storeStrong((id *)&v11->_deviceUID, a4);
    uint64_t v12 = [objc_alloc(NSNumber) initWithInteger:a5];
    stream = v11->_stream;
    v11->_stream = (NSNumber *)v12;

    v11->_exclusive = 1;
  }

  return v11;
}

- (CATapDescription)initWithProcesses:(id)a3 andDeviceUID:(id)a4 withStream:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(CATapDescription);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_processes, a3);
    objc_storeStrong((id *)&v11->_deviceUID, a4);
    uint64_t v12 = [objc_alloc(NSNumber) initWithInteger:a5];
    stream = v11->_stream;
    v11->_stream = (NSNumber *)v12;
  }
  return v11;
}

- (id)initMonoGlobalTapButExcludeProcesses:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(CATapDescription);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    *(_WORD *)&v6->_mono = 257;
    v6->_mixdown = 1;
  }

  return v6;
}

- (id)initMonoMixdownOfProcesses:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(CATapDescription);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    v6->_mono = 1;
    v6->_mixdown = 1;
  }

  return v6;
}

- (id)initStereoGlobalTapButExcludeProcesses:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(CATapDescription);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    *(_WORD *)&v6->_exclusive = 257;
  }

  return v6;
}

- (id)initStereoMixdownOfProcesses:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(CATapDescription);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_processes, a3);
    v6->_mixdown = 1;
  }

  return v6;
}

- (CATapDescription)init
{
  v3 = [CATapDescription alloc];

  if (v3)
  {
    v4 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    UUID = v3->_UUID;
    v3->_UUID = v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C970]);
    processes = v3->_processes;
    v3->_processes = v6;

    *(_DWORD *)&v3->_mono = 0x1000000;
    deviceUID = v3->_deviceUID;
    v3->_muteBehavior = 0;
    v3->_deviceUID = 0;

    stream = v3->_stream;
    v3->_stream = 0;
  }
  return v3;
}

- (CATapDescription)initWithDictionary:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(CATapDescription);
  v7 = v6;

  if (v6)
  {
    v8 = [v5 objectForKey:@"TapUUID"];

    if (!v8)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:v6 file:@"CATapDescription.mm" lineNumber:138 description:@"Tap dictionary is missing UUID"];
    }
    id v9 = [v5 objectForKey:@"Processes"];

    if (!v9)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:v6 file:@"CATapDescription.mm" lineNumber:139 description:@"Tap dictionary is missing process list"];
    }
    id v10 = [v5 objectForKey:@"TapName"];
    objc_storeStrong((id *)&v6->_name, v10);
    v11 = [v5 objectForKey:@"TapUUID"];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
    objc_storeStrong((id *)&v6->_UUID, v12);
    v13 = [v5 objectForKey:@"Processes"];
    objc_storeStrong((id *)&v6->_processes, v13);
    v14 = [v5 objectForKeyedSubscript:@"IsMono"];
    v7->_mono = [v14 BOOLValue];

    v15 = [v5 objectForKeyedSubscript:@"IsExclusive"];
    v7->_exclusive = [v15 BOOLValue];

    v16 = [v5 objectForKeyedSubscript:@"IsMixdown"];
    v7->_mixdown = [v16 BOOLValue];

    v17 = [v5 objectForKeyedSubscript:@"IsPrivate"];
    v7->_privateTap = [v17 BOOLValue];

    v18 = [v5 objectForKeyedSubscript:@"MuteBehavior"];
    v7->_muteBehavior = (int)[v18 intValue];

    uint64_t v19 = [v5 objectForKey:@"DeviceUID"];
    deviceUID = v7->_deviceUID;
    v7->_deviceUID = (NSString *)v19;

    v21 = [v5 objectForKey:@"Stream"];

    if (v21)
    {
      uint64_t v22 = [v5 objectForKeyedSubscript:@"Stream"];
      stream = v7->_stream;
      v7->_stream = (NSNumber *)v22;
    }
  }

  return v7;
}

@end