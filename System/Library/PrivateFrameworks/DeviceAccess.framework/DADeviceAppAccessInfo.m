@interface DADeviceAppAccessInfo
+ (BOOL)supportsSecureCoding;
- (DADeviceAppAccessInfo)initWithBundleIdentifier:(id)a3 deviceIdentifier:(id)a4 accessoryOptions:(unint64_t)a5 state:(int64_t)a6;
- (DADeviceAppAccessInfo)initWithBundleIdentifier:(id)a3 deviceIdentifier:(id)a4 state:(int64_t)a5;
- (DADeviceAppAccessInfo)initWithCoder:(id)a3;
- (DADeviceAppAccessInfo)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4;
- (DADeviceAppAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (DADiscoveryConfiguration)appDiscoveryConfiguration;
- (NSString)associationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)deviceIdentifier;
- (double)approveTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)persistentDictionaryRepresentation;
- (int64_t)state;
- (unint64_t)accessoryOptions;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAccessoryOptions:(unint64_t)a3;
- (void)setAppDiscoveryConfiguration:(id)a3;
- (void)setApproveTime:(double)a3;
- (void)setState:(int64_t)a3;
@end

@implementation DADeviceAppAccessInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DADeviceAppAccessInfo)initWithBundleIdentifier:(id)a3 deviceIdentifier:(id)a4 accessoryOptions:(unint64_t)a5 state:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DADeviceAppAccessInfo;
  v12 = [(DADeviceAppAccessInfo *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v13->_deviceIdentifier, a4);
    v13->_state = a6;
    v14 = v13;
  }

  return v13;
}

- (DADeviceAppAccessInfo)initWithBundleIdentifier:(id)a3 deviceIdentifier:(id)a4 state:(int64_t)a5
{
  return [(DADeviceAppAccessInfo *)self initWithBundleIdentifier:a3 deviceIdentifier:a4 accessoryOptions:0 state:a5];
}

- (DADeviceAppAccessInfo)initWithPersistentDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DADeviceAppAccessInfo;
  v7 = [(DADeviceAppAccessInfo *)&v27 init];
  if (v7)
  {
    v8 = NSDictionaryGetNSNumber();
    v7->_accessoryOptions = [v8 unsignedIntegerValue];

    CFDictionaryGetDouble();
    v7->_approveTime = v9;
    CFStringGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue();
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v10;

    CFStringGetTypeID();
    uint64_t v12 = CFDictionaryGetTypedValue();
    deviceIdentifier = v7->_deviceIdentifier;
    v7->_deviceIdentifier = (NSString *)v12;

    CFDataGetTypeID();
    v14 = CFDictionaryGetTypedValue();
    uint64_t v15 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:0];
    appDiscoveryConfiguration = v7->_appDiscoveryConfiguration;
    v7->_appDiscoveryConfiguration = (DADiscoveryConfiguration *)v15;

    v17 = NSDictionaryGetNSNumber();
    v7->_state = [v17 integerValue];

    v18 = v7;
  }
  else if (a4)
  {
    uint64_t v20 = objc_opt_class();
    DAErrorF(350001, (uint64_t)"%@ super init failed", v21, v22, v23, v24, v25, v26, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)persistentDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [NSNumber numberWithUnsignedInteger:self->_accessoryOptions];
  [v3 setObject:v4 forKeyedSubscript:@"accessoryOptions"];

  v5 = [NSNumber numberWithDouble:self->_approveTime];
  [v3 setObject:v5 forKeyedSubscript:@"approveTime"];

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v3 setObject:bundleIdentifier forKeyedSubscript:@"deviceAppBundleID"];
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier) {
    [v3 setObject:deviceIdentifier forKeyedSubscript:@"identifier"];
  }
  v8 = self->_appDiscoveryConfiguration;
  if (v8)
  {
    double v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    if (v9) {
      [v3 setObject:v9 forKeyedSubscript:@"configuration"];
    }
  }
  uint64_t v10 = [NSNumber numberWithInteger:self->_state];
  [v3 setObject:v10 forKeyedSubscript:@"deviceState"];

  id v11 = (void *)[v3 copy];

  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  xpc_dictionary_set_uint64(v4, "dvAo", self->_accessoryOptions);
  double approveTime = self->_approveTime;
  if (approveTime != 0.0) {
    xpc_dictionary_set_double(v4, "apT", approveTime);
  }
  bundleIdentifier = self->_bundleIdentifier;
  id v7 = v4;
  v8 = [(NSString *)bundleIdentifier UTF8String];
  if (v8) {
    xpc_dictionary_set_string(v7, "bndI", v8);
  }

  deviceIdentifier = self->_deviceIdentifier;
  xpc_object_t xdict = v7;
  uint64_t v10 = [(NSString *)deviceIdentifier UTF8String];
  if (v10) {
    xpc_dictionary_set_string(xdict, "id", v10);
  }

  CUXPCEncodeObject();
  xpc_dictionary_set_int64(xdict, "dvSt", self->_state);
}

- (DADeviceAppAccessInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DADeviceAppAccessInfo;
  id v7 = [(DADeviceAppAccessInfo *)&v19 init];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v12 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ super init failed", v13, v14, v15, v16, v17, v18, v12);
      uint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  unint64_t v20 = 0;
  int v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_accessoryOptions = v20;
  }
  else if (v8 == 5)
  {
    goto LABEL_15;
  }
  if (!CUXPCDecodeDouble()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_15;
  }
  objc_opt_class();
  CUXPCDecodeObject();
  unint64_t v20 = 0;
  int v9 = CUXPCDecodeSInt64RangedEx();
  if (v9 != 6)
  {
    if (v9 != 5) {
      goto LABEL_11;
    }
LABEL_15:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  v7->_state = v20;
LABEL_11:
  uint64_t v10 = v7;
LABEL_12:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_approveTime != 0.0)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"apT");
    id v4 = v10;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    [v10 encodeObject:bundleIdentifier forKey:@"bndI"];
    id v4 = v10;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    [v10 encodeObject:deviceIdentifier forKey:@"id"];
    id v4 = v10;
  }
  appDiscoveryConfiguration = self->_appDiscoveryConfiguration;
  if (appDiscoveryConfiguration)
  {
    [v10 encodeObject:appDiscoveryConfiguration forKey:@"dsCf"];
    id v4 = v10;
  }
  int64_t state = self->_state;
  if (state)
  {
    [v10 encodeInteger:state forKey:@"dvSt"];
    id v4 = v10;
  }
  unint64_t accessoryOptions = self->_accessoryOptions;
  if (accessoryOptions)
  {
    [v10 encodeInteger:accessoryOptions forKey:@"dvFl"];
    id v4 = v10;
  }
}

- (DADeviceAppAccessInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DADeviceAppAccessInfo;
  v5 = [(DADeviceAppAccessInfo *)&v22 init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v6 = v4;
    if ([v6 containsValueForKey:@"apT"])
    {
      [v6 decodeDoubleForKey:@"apT"];
      v5->_double approveTime = v7;
    }

    id v8 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v10 = v9;
    if ([v10 containsValueForKey:@"dvFl"]) {
      v5->_unint64_t accessoryOptions = [v10 decodeIntegerForKey:@"dvFl"];
    }

    id v11 = v10;
    if ([v11 containsValueForKey:@"dvSt"]) {
      v5->_int64_t state = [v11 decodeIntegerForKey:@"dvSt"];
    }

    uint64_t v12 = v5;
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v21 = DAErrorF(350001, (uint64_t)"%@ init failed", v15, v16, v17, v18, v19, v20, v14);
    [v4 failWithError:v21];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 40) = self->_accessoryOptions;
  uint64_t v5 = [(DADiscoveryConfiguration *)self->_appDiscoveryConfiguration copy];
  id v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  *(double *)(v4 + 16) = self->_approveTime;
  uint64_t v7 = [(NSString *)self->_bundleIdentifier copy];
  id v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_deviceIdentifier copy];
  id v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  *(void *)(v4 + 48) = self->_state;
  return (id)v4;
}

- (id)description
{
  return [(DADeviceAppAccessInfo *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    id v4 = 0;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    uint64_t v18 = bundleIdentifier;
    CUAppendF();
    id v6 = v4;

    id v4 = v6;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    uint64_t v19 = deviceIdentifier;
    CUAppendF();
    id v8 = v4;

    id v4 = v8;
  }
  uint64_t v9 = DADeviceStateToString(self->_state);
  CUAppendF();
  id v10 = v4;

  uint64_t v20 = DADeviceAccessorySetupOptionsToString(self->_accessoryOptions);
  CUAppendF();
  id v11 = (__CFString *)v10;

  if (self->_approveTime != 0.0)
  {
    uint64_t v21 = CUPrintDateCF();
    CUAppendF();
    uint64_t v12 = v11;

    id v11 = v12;
  }
  appDiscoveryConfiguration = self->_appDiscoveryConfiguration;
  if (appDiscoveryConfiguration)
  {
    objc_super v22 = appDiscoveryConfiguration;
    CUAppendF();
    uint64_t v14 = v11;

    id v11 = v14;
  }
  uint64_t v15 = &stru_26D120818;
  if (v11) {
    uint64_t v15 = v11;
  }
  uint64_t v16 = v15;

  return v16;
}

- (NSString)associationIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(DADeviceAppAccessInfo *)v2 appDiscoveryConfiguration];
  id v4 = [v3 associationIdentifier];

  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (DADiscoveryConfiguration)appDiscoveryConfiguration
{
  return self->_appDiscoveryConfiguration;
}

- (void)setAppDiscoveryConfiguration:(id)a3
{
}

- (double)approveTime
{
  return self->_approveTime;
}

- (void)setApproveTime:(double)a3
{
  self->_double approveTime = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (unint64_t)accessoryOptions
{
  return self->_accessoryOptions;
}

- (void)setAccessoryOptions:(unint64_t)a3
{
  self->_unint64_t accessoryOptions = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_appDiscoveryConfiguration, 0);
}

@end