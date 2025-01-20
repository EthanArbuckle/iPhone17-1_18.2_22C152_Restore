@interface HAENGeoLocation
- (HAENGeoLocation)init;
- (NSDate)timestamp;
- (NSString)countryCode;
- (NSString)immutableDescription;
- (id)describeSource;
- (id)description;
- (unsigned)source;
- (unsigned)sourceDevice;
- (void)fetchGeoLocation;
@end

@implementation HAENGeoLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->immutableDescription, 0);
  objc_storeStrong((id *)&self->timestamp, 0);
  objc_storeStrong((id *)&self->countryCode, 0);
}

- (id)describeSource
{
  unsigned int v2 = self->source - 2;
  v3 = @"unknown";
  v4 = @"unknown";
  if (v2 <= 3) {
    v4 = off_264527630[v2];
  }
  if (self->sourceDevice == 256) {
    v3 = @"local";
  }
  return (id)[NSString stringWithFormat:@"%@_%@", v4, v3];
}

- (unsigned)source
{
  return self->source;
}

- (HAENGeoLocation)init
{
  v13.receiver = self;
  v13.super_class = (Class)HAENGeoLocation;
  unsigned int v2 = [(HAENGeoLocation *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F28C30]);
    uint64_t v4 = [v3 getPreferenceFor:*MEMORY[0x263F28BB8]];
    countryCode = v2->countryCode;
    v2->countryCode = (NSString *)v4;

    timestamp = v2->timestamp;
    *(int8x8_t *)&v2->source = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v2->countryCode == 0), 0x1FuLL)), (int8x8_t)0xFF00000001, (int8x8_t)0x10000000002);
    v2->timestamp = 0;

    [(HAENGeoLocation *)v2 fetchGeoLocation];
    v7 = NSString;
    v8 = v2->countryCode;
    v9 = [(HAENGeoLocation *)v2 describeSource];
    uint64_t v10 = [v7 stringWithFormat:@"HAENGeoLocation: [%@, %@, %@]", v8, v9, v2->timestamp];
    immutableDescription = v2->immutableDescription;
    v2->immutableDescription = (NSString *)v10;
  }
  return v2;
}

- (void)fetchGeoLocation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->source == 2)
  {
    id v3 = HAENotificationsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(HAENGeoLocation *)self description];
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_21FABA000, v3, OS_LOG_TYPE_DEFAULT, "Geo Location Country Code is overriden %@", buf, 0xCu);
    }
  }
  else
  {
    *(_DWORD *)buf = 1;
    v5 = [MEMORY[0x263F41770] sharedConfiguration];
    id v13 = 0;
    v6 = [v5 countryCodeWithSource:buf updatedAtTime:&v13];
    v7 = (NSDate *)v13;

    countryCode = self->countryCode;
    self->countryCode = v6;
    v9 = v6;

    timestamp = self->timestamp;
    self->timestamp = v7;
    v11 = v7;

    int8x8_t v12 = (int8x8_t)vld1_dup_f32((const float *)buf);
    *(int8x8_t *)&self->source = vand_s8(v12, (int8x8_t)0xFF00000000FFLL);
  }
}

- (id)description
{
  return self->immutableDescription;
}

- (NSString)countryCode
{
  return self->countryCode;
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (unsigned)sourceDevice
{
  return self->sourceDevice;
}

- (NSString)immutableDescription
{
  return self->immutableDescription;
}

@end