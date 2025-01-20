@interface AVAudioSessionDataSourceDescription
+ (id)privateCreateArray:(id)a3 portID:(id)a4 sessionID:(unsigned int)a5;
- (AVAudioSessionDataSourceDescription)initWithRawSourceDescription:(id)a3 andOwningPortID:(id)a4 andSessionID:(unsigned int)a5;
- (AVAudioSessionDataSourceDescription)initWithSessionID:(unsigned int)a3;
- (AVAudioSessionLocation)location;
- (AVAudioSessionOrientation)orientation;
- (AVAudioSessionPolarPattern)preferredPolarPattern;
- (AVAudioSessionPolarPattern)selectedPolarPattern;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDataSource:(id)a3;
- (BOOL)setPreferredPolarPattern:(AVAudioSessionPolarPattern)pattern error:(NSError *)outError;
- (DataSourceDescriptionImpl)privateGetImplementation;
- (NSArray)supportedPolarPatterns;
- (NSNumber)dataSourceID;
- (NSString)dataSourceName;
- (id)description;
- (id)privateGetOwningPortID;
- (unint64_t)hash;
- (void)configurePolarPatterns:(id)a3;
- (void)dealloc;
@end

@implementation AVAudioSessionDataSourceDescription

+ (id)privateCreateArray:(id)a3 portID:(id)a4 sessionID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = [v7 count];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        v12 = [v7 objectAtIndex:i];
        v13 = [[AVAudioSessionDataSourceDescription alloc] initWithRawSourceDescription:v12 andOwningPortID:v8 andSessionID:v5];
        if (v13) {
          [v10 insertObject:v13 atIndex:i];
        }
      }
    }
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }

  return v14;
}

- (AVAudioSessionDataSourceDescription)initWithRawSourceDescription:(id)a3 andOwningPortID:(id)a4 andSessionID:(unsigned int)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVAudioSessionDataSourceDescription;
  if ([(AVAudioSessionDataSourceDescription *)&v11 init]) {
    operator new();
  }
  uint64_t v9 = (AVAudioSessionDataSourceDescription *)0;

  return v9;
}

- (void)configurePolarPatterns:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AVAudioSessionDataSourceDescription *)self privateGetImplementation];
  id v6 = (id)*MEMORY[0x1E4F767B8];
  id v7 = [v4 objectForKey:v6];

  PolarPatternValueConverter = (StringUIntValueConverter *)GetPolarPatternValueConverter();
  uint64_t v9 = StringUIntValueConverter::getNSString(PolarPatternValueConverter, v7);
  id var6 = v5->var6;
  v5->id var6 = (id)v9;

  id v11 = (id)*MEMORY[0x1E4F767A0];
  uint64_t v12 = [v4 objectForKey:v11];

  v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(NSNumber **)(*((void *)&v23 + 1) + 8 * v17);
        v19 = (StringUIntValueConverter *)GetPolarPatternValueConverter();
        v20 = StringUIntValueConverter::getNSString(v19, v18);
        if (v20) {
          objc_msgSend(v13, "addObject:", v20, (void)v23);
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v13];
  id var5 = v5->var5;
  v5->id var5 = (id)v21;

  DataSourceDescriptionImpl::ValidateRequiredFields(v5);
}

- (DataSourceDescriptionImpl)privateGetImplementation
{
  return (DataSourceDescriptionImpl *)self->_impl;
}

- (NSNumber)dataSourceID
{
  return (NSNumber *)*((id *)self->_impl + 1);
}

- (void)dealloc
{
  impl = (id *)self->_impl;
  if (impl)
  {

    MEMORY[0x1A6235030](impl, 0x1080C406ECF7772);
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionDataSourceDescription;
  [(AVAudioSessionDataSourceDescription *)&v4 dealloc];
}

- (AVAudioSessionDataSourceDescription)initWithSessionID:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionDataSourceDescription;
  if ([(AVAudioSessionDataSourceDescription *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AVAudioSessionDataSourceDescription *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(AVAudioSessionDataSourceDescription *)self isEqualToDataSource:v5];

  return v6;
}

- (BOOL)isEqualToDataSource:(id)a3
{
  objc_super v4 = (AVAudioSessionDataSourceDescription *)a3;
  if (self == v4) {
    goto LABEL_13;
  }
  uint64_t v5 = [(AVAudioSessionDataSourceDescription *)self privateGetOwningPortID];
  BOOL v6 = [(AVAudioSessionDataSourceDescription *)v4 privateGetOwningPortID];
  char v7 = [v5 isEqualToNumber:v6];

  if ((v7 & 1) == 0) {
    goto LABEL_15;
  }
  id v8 = [(AVAudioSessionDataSourceDescription *)self dataSourceID];
  uint64_t v9 = [(AVAudioSessionDataSourceDescription *)v4 dataSourceID];
  char v10 = [v8 isEqualToNumber:v9];

  if ((v10 & 1) == 0) {
    goto LABEL_15;
  }
  id v11 = [(AVAudioSessionDataSourceDescription *)self dataSourceName];
  uint64_t v12 = [(AVAudioSessionDataSourceDescription *)v4 dataSourceName];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0) {
    goto LABEL_15;
  }
  id v14 = [(AVAudioSessionDataSourceDescription *)self orientation];

  if (v14)
  {
    uint64_t v15 = [(AVAudioSessionDataSourceDescription *)v4 orientation];

    if (!v15) {
      goto LABEL_15;
    }
    uint64_t v16 = [(AVAudioSessionDataSourceDescription *)self orientation];
    uint64_t v17 = [(AVAudioSessionDataSourceDescription *)v4 orientation];
    char v18 = [v16 isEqualToString:v17];

    if ((v18 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    v19 = [(AVAudioSessionDataSourceDescription *)v4 orientation];

    if (v19) {
      goto LABEL_15;
    }
  }
  v20 = [(AVAudioSessionDataSourceDescription *)self selectedPolarPattern];

  if (v20)
  {
    uint64_t v21 = [(AVAudioSessionDataSourceDescription *)v4 selectedPolarPattern];

    if (v21)
    {
      v22 = [(AVAudioSessionDataSourceDescription *)self selectedPolarPattern];
      long long v23 = [(AVAudioSessionDataSourceDescription *)v4 selectedPolarPattern];
      char v24 = [v22 isEqualToString:v23];

      if (v24) {
        goto LABEL_13;
      }
    }
LABEL_15:
    BOOL v25 = 0;
    goto LABEL_16;
  }
  long long v26 = [(AVAudioSessionDataSourceDescription *)v4 selectedPolarPattern];

  if (v26) {
    goto LABEL_15;
  }
LABEL_13:
  BOOL v25 = 1;
LABEL_16:

  return v25;
}

- (unint64_t)hash
{
  v2 = [(AVAudioSessionDataSourceDescription *)self dataSourceID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)dataSourceName
{
  return (NSString *)*((id *)self->_impl + 2);
}

- (AVAudioSessionLocation)location
{
  return (AVAudioSessionLocation)*((id *)self->_impl + 3);
}

- (AVAudioSessionOrientation)orientation
{
  return (AVAudioSessionOrientation)*((id *)self->_impl + 4);
}

- (AVAudioSessionPolarPattern)selectedPolarPattern
{
  return (AVAudioSessionPolarPattern)*((id *)self->_impl + 6);
}

- (AVAudioSessionPolarPattern)preferredPolarPattern
{
  v2 = copyPolarPatternPreference(*(unsigned int *)self->_impl, *((NSNumber **)self->_impl + 8), *((NSNumber **)self->_impl + 1));
  return (AVAudioSessionPolarPattern)v2;
}

- (NSArray)supportedPolarPatterns
{
  return (NSArray *)*((id *)self->_impl + 5);
}

- (id)description
{
  impl = self->_impl;
  objc_super v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  char v7 = [v4 stringWithFormat:@"<%@: %p, ID = %@ name = %@>", v6, self, impl[1], impl[2]];;

  return v7;
}

- (BOOL)setPreferredPolarPattern:(AVAudioSessionPolarPattern)pattern error:(NSError *)outError
{
  char v7 = pattern;
  impl = (NSString **)self->_impl;
  if (v7)
  {
    PolarPatternValueConverter = (StringUIntValueConverter *)GetPolarPatternValueConverter();
    unint64_t UInt32 = StringUIntValueConverter::getUInt32(PolarPatternValueConverter, v7);
    if ((UInt32 & 1) == 0)
    {
      if (outError)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
        char v11 = 0;
        *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v11 = 0;
      }
      goto LABEL_14;
    }
    char v13 = [NSNumber numberWithUnsignedInt:HIDWORD(UInt32)];
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v15 = [(AVAudioSessionDataSourceDescription *)self privateGetOwningPortID];
    uint64_t v16 = [(AVAudioSessionDataSourceDescription *)self dataSourceID];
    uint64_t v17 = objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v15, @"SelectedRouteDescription_RouteID", v16, @"SelectedRouteDescription_DataSourceID", v13, @"SelectedRouteDescription_MicrophonePolarPattern", 0);
    char v18 = (id *)MEMORY[0x1E4F76468];
  }
  else
  {
    uint64_t v12 = (StringUIntValueConverter *)GetPolarPatternValueConverter();
    char v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", (unint64_t)StringUIntValueConverter::getUInt32(v12, impl[7]) >> 32);
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v15 = [(AVAudioSessionDataSourceDescription *)self privateGetOwningPortID];
    uint64_t v16 = [(AVAudioSessionDataSourceDescription *)self dataSourceID];
    uint64_t v17 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, @"SelectedRouteDescription_RouteID", v16, @"SelectedRouteDescription_DataSourceID", v13, @"SelectedRouteDescription_MicrophonePolarPattern", 0);
    char v18 = (id *)MEMORY[0x1E4F760F0];
  }

  id v20 = *v18;
  objc_storeStrong((id *)impl + 7, pattern);
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
  AVAudioSessionGetXPCConnection(*(_DWORD *)impl, &v25);
  long long v23 = v25;
  char v24 = v26;
  if (v26) {
    atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  as::client::api_utils::SetPropertyXPC(&v23, *(unsigned int *)impl, v20, v21, 1);
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  char v11 = FormatNSErrorForReturn();
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }

LABEL_14:
  return v11;
}

- (id)privateGetOwningPortID
{
  return *((id *)self->_impl + 8);
}

@end