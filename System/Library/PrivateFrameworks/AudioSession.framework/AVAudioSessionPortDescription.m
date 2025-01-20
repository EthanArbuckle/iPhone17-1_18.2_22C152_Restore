@interface AVAudioSessionPortDescription
+ (id)privateCreateArray:(id)a3 owningSession:(id)a4;
- (AVAudioSessionDataSourceDescription)preferredDataSource;
- (AVAudioSessionDataSourceDescription)selectedDataSource;
- (AVAudioSessionPort)portType;
- (AVAudioSessionPortDescription)initWithRawPortDescriptionXPC:(id)a3 owningSession:(id)a4;
- (BOOL)hasHardwareVoiceCallProcessing;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPort:(id)a3 compareStrict:(BOOL)a4;
- (BOOL)isHeadphones;
- (BOOL)isLiveListenSupported;
- (BOOL)isLowLatencyAirPlay;
- (BOOL)isSpatialAudioEnabled;
- (BOOL)setPreferredDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError;
- (NSArray)channels;
- (NSArray)dataSources;
- (NSString)UID;
- (NSString)portName;
- (PortDescriptionImpl)privateGetImplementation;
- (id)description;
- (id)privateGetID;
- (int64_t)portSubType;
- (unint64_t)endpointType;
- (unint64_t)hash;
- (void)configureChannelsAndDataSources:(id)a3;
- (void)dealloc;
- (void)setSupportsSpatialAudio:(BOOL)a3;
@end

@implementation AVAudioSessionPortDescription

+ (id)privateCreateArray:(id)a3 owningSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = [v5 count];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        v10 = [v5 objectAtIndex:i];
        v11 = [[AVAudioSessionPortDescription alloc] initWithRawPortDescriptionXPC:v10 owningSession:v6];
        if (v11) {
          [v8 insertObject:v11 atIndex:i];
        }
      }
    }
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v8];
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }

  return v12;
}

- (AVAudioSessionPortDescription)initWithRawPortDescriptionXPC:(id)a3 owningSession:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AVAudioSessionPortDescription;
  if ([(AVAudioSessionPortDescription *)&v10 init]) {
    operator new();
  }
  v8 = (AVAudioSessionPortDescription *)0;

  return v8;
}

- (void)configureChannelsAndDataSources:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  v4 = [(AVAudioSessionPortDescription *)self privateGetImplementation];
  id v24 = (id)*MEMORY[0x1E4F76890];
  id v5 = objc_msgSend(v30, "objectForKey:");
  id v27 = (id)*MEMORY[0x1E4F76828];
  uint64_t v6 = objc_msgSend(v30, "objectForKey:");
  id v7 = self;
  objc_sync_enter(v7);
  v25 = (void *)v6;
  id v8 = +[AVAudioSessionChannelDescription privateCreateArray:v6 portUID:v4->var4];
  id var12 = v4->var12;
  v4->id var12 = v8;

  objc_sync_exit(v7);
  id v10 = (id)*MEMORY[0x1E4F76840];
  id v29 = (id)*MEMORY[0x1E4F76850];
  v26 = v10;
  v31 = [v30 objectForKey:v10];
  id WeakRetained = objc_loadWeakRetained(&v4->var0);
  if ([WeakRetained allowAllBuiltInDataSources])
  {
    v32 = [v30 objectForKey:v29];
  }
  else
  {
    v32 = 0;
  }

  v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count") + objc_msgSend(v31, "count"));
  [v33 addObjectsFromArray:v31];
  if (v32) {
    [v33 addObjectsFromArray:v32];
  }
  if ([v33 count] == 1)
  {

    v33 = 0;
  }
  obj = v7;
  objc_sync_enter(obj);
  id var1 = v4->var1;
  id v13 = objc_loadWeakRetained(&v4->var0);
  uint64_t v14 = +[AVAudioSessionDataSourceDescription privateCreateArray:portID:sessionID:](AVAudioSessionDataSourceDescription, "privateCreateArray:portID:sessionID:", v33, var1, [v13 opaqueSessionID]);
  id var13 = v4->var13;
  v4->id var13 = (id)v14;

  id var14 = v4->var14;
  v4->id var14 = 0;

  if (v5)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = v4->var13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v22 = [v21 dataSourceID];
          int v23 = [v22 isEqualToNumber:v5];

          if (v23)
          {
            objc_storeStrong(&v4->var14, v21);
            goto LABEL_19;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  objc_sync_exit(obj);

  PortDescriptionImpl::ValidateRequiredFields(v4);
}

- (PortDescriptionImpl)privateGetImplementation
{
  return (PortDescriptionImpl *)self->_impl;
}

- (void)setSupportsSpatialAudio:(BOOL)a3
{
  *(unsigned char *)([(AVAudioSessionPortDescription *)self privateGetImplementation] + 42) = a3;
}

- (void)dealloc
{
  impl = (PortDescriptionImpl *)self->_impl;
  if (impl)
  {
    PortDescriptionImpl::~PortDescriptionImpl(impl);
    MEMORY[0x1A6235030]();
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionPortDescription;
  [(AVAudioSessionPortDescription *)&v4 dealloc];
}

- (NSString)portName
{
  return (NSString *)*((id *)self->_impl + 3);
}

- (AVAudioSessionPort)portType
{
  return (AVAudioSessionPort)*((id *)self->_impl + 2);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AVAudioSessionPortDescription *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(AVAudioSessionPortDescription *)self isEqualToPort:v5 compareStrict:1];

  return v6;
}

- (BOOL)isEqualToPort:(id)a3 compareStrict:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (AVAudioSessionPortDescription *)a3;
  if (self == v6) {
    goto LABEL_19;
  }
  id v7 = [(AVAudioSessionPortDescription *)self UID];
  id v8 = [(AVAudioSessionPortDescription *)v6 UID];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0) {
    goto LABEL_20;
  }
  id v10 = [(AVAudioSessionPortDescription *)self portType];
  uint64_t v11 = [(AVAudioSessionPortDescription *)v6 portType];
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0) {
    goto LABEL_20;
  }
  id v13 = [(AVAudioSessionPortDescription *)self portName];
  uint64_t v14 = [(AVAudioSessionPortDescription *)v6 portName];
  char v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0) {
    goto LABEL_20;
  }
  if (v4)
  {
    v16 = [(AVAudioSessionPortDescription *)self channels];
    id v17 = [(AVAudioSessionPortDescription *)v6 channels];
    char v18 = (v16 != 0) ^ (v17 == 0);

    if ((v18 & 1) == 0) {
      goto LABEL_20;
    }
    uint64_t v19 = [(AVAudioSessionPortDescription *)self channels];
    if (v19)
    {
      v20 = [(AVAudioSessionPortDescription *)self channels];
      v21 = [(AVAudioSessionPortDescription *)v6 channels];
      char v22 = [v20 isEqualToArray:v21];

      if ((v22 & 1) == 0) {
        goto LABEL_20;
      }
    }
    int v23 = [(AVAudioSessionPortDescription *)self dataSources];
    if (v23)
    {
    }
    else
    {
      id v24 = [(AVAudioSessionPortDescription *)v6 dataSources];

      if (!v24) {
        goto LABEL_19;
      }
    }
    v25 = [(AVAudioSessionPortDescription *)self dataSources];
    if (v25)
    {
      v26 = [(AVAudioSessionPortDescription *)v6 dataSources];

      if (!v26) {
        goto LABEL_20;
      }
    }
    id v27 = [(AVAudioSessionPortDescription *)self dataSources];
    v28 = [(AVAudioSessionPortDescription *)v6 dataSources];
    char v29 = [v27 isEqualToArray:v28];

    if ((v29 & 1) == 0) {
      goto LABEL_20;
    }
    id v30 = [(AVAudioSessionPortDescription *)self selectedDataSource];
    if (v30)
    {

      goto LABEL_18;
    }
    v31 = [(AVAudioSessionPortDescription *)v6 selectedDataSource];

    if (v31)
    {
LABEL_18:
      v32 = [(AVAudioSessionPortDescription *)self selectedDataSource];
      v33 = [(AVAudioSessionPortDescription *)v6 selectedDataSource];
      char v34 = [v32 isEqual:v33];

      if (v34) {
        goto LABEL_19;
      }
LABEL_20:
      BOOL v35 = 0;
      goto LABEL_21;
    }
  }
LABEL_19:
  BOOL v35 = 1;
LABEL_21:

  return v35;
}

- (unint64_t)hash
{
  v2 = [(AVAudioSessionPortDescription *)self UID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)channels
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = *((id *)v2->_impl + 8);
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)dataSources
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = *((id *)v2->_impl + 9);
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)hasHardwareVoiceCallProcessing
{
  return *((unsigned char *)self->_impl + 41);
}

- (BOOL)isSpatialAudioEnabled
{
  return *((unsigned char *)self->_impl + 42);
}

- (BOOL)isLiveListenSupported
{
  return *((unsigned char *)self->_impl + 43);
}

- (BOOL)isHeadphones
{
  return *((unsigned char *)self->_impl + 40);
}

- (BOOL)isLowLatencyAirPlay
{
  return *((unsigned char *)self->_impl + 44);
}

- (int64_t)portSubType
{
  return *((void *)self->_impl + 6);
}

- (unint64_t)endpointType
{
  return *((void *)self->_impl + 7);
}

- (AVAudioSessionDataSourceDescription)selectedDataSource
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = *((id *)v2->_impl + 10);
  objc_sync_exit(v2);

  return (AVAudioSessionDataSourceDescription *)v3;
}

- (AVAudioSessionDataSourceDescription)preferredDataSource
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  id WeakRetained = objc_loadWeakRetained((id *)impl);
  id v5 = copyDataSourcePreference([WeakRetained opaqueSessionID], *((NSNumber **)impl + 1));

  if (v5)
  {
    BOOL v6 = self;
    objc_sync_enter(v6);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = *((id *)impl + 9);
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          char v12 = objc_msgSend(v11, "dataSourceID", (void)v15);
          int v13 = [v5 isEqualToNumber:v12];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v6);
  }
  else
  {
    id v8 = 0;
  }

  return (AVAudioSessionDataSourceDescription *)v8;
}

- (NSString)UID
{
  return (NSString *)*((id *)self->_impl + 4);
}

- (id)description
{
  impl = self->_impl;
  BOOL v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  uint64_t v7 = *((void *)impl + 2);
  uint64_t v8 = *((void *)impl + 3);
  uint64_t v9 = *((void *)impl + 4);
  id v10 = [*((id *)impl + 10) dataSourceName];
  objc_msgSend(v4, "stringWithFormat:", @"<%@: %p, type = %@; name = %@; UID = %@; selectedDataSource = %@>",
    v6,
    self,
    v7,
    v8,
    v9,
  uint64_t v11 = v10);

  return v11;
}

- (BOOL)setPreferredDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError
{
  v28[2] = *MEMORY[0x1E4F143B8];
  BOOL v6 = dataSource;
  uint64_t v7 = [(AVAudioSessionPortDescription *)self privateGetImplementation];
  p_var0 = &v7->var0;
  if (v6)
  {
    id v9 = (id)*MEMORY[0x1E4F768D8];
    v27[0] = v9;
    id v10 = [(AVAudioSessionPortDescription *)self privateGetID];
    v28[0] = v10;
    id v11 = (id)*MEMORY[0x1E4F768C8];
    v27[1] = v11;
    char v12 = [(AVAudioSessionDataSourceDescription *)v6 dataSourceID];
    v28[1] = v12;
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    uint64_t v14 = (id *)MEMORY[0x1E4F76468];
  }
  else
  {
    if (!v7->var15)
    {
      char v19 = 1;
      goto LABEL_12;
    }
    id v9 = (id)*MEMORY[0x1E4F768D8];
    v25[0] = v9;
    id v10 = [(AVAudioSessionPortDescription *)self privateGetID];
    v26[0] = v10;
    id v11 = (id)*MEMORY[0x1E4F768C8];
    v25[1] = v11;
    char v12 = [p_var0[11] dataSourceID];
    v26[1] = v12;
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    uint64_t v14 = (id *)MEMORY[0x1E4F760F0];
  }

  id v15 = *v14;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObject:v13];
  objc_storeStrong(p_var0 + 11, dataSource);
  id WeakRetained = objc_loadWeakRetained(p_var0);
  AVAudioSessionGetXPCConnection([WeakRetained opaqueSessionID], &v23);

  v21 = v23;
  char v22 = v24;
  if (v24) {
    atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v18 = objc_loadWeakRetained(p_var0);
  as::client::api_utils::SetPropertyXPC(&v21, [v18 opaqueSessionID], v15, v16, 1);

  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  char v19 = FormatNSErrorForReturn();
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }

LABEL_12:
  return v19;
}

- (id)privateGetID
{
  return *((id *)self->_impl + 1);
}

@end