@interface HMDDeviceHandle
+ (BOOL)supportsSecureCoding;
+ (id)deviceHandleForDestination:(id)a3;
+ (id)deviceHandleForDeviceIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGlobal;
- (BOOL)isLocal;
- (BOOL)matchesPushToken:(id)a3;
- (HMDAccountHandle)accountHandle;
- (HMDDeviceHandle)init;
- (HMDDeviceHandle)initWithCoder:(id)a3;
- (HMDDeviceHandle)initWithInternal:(id)a3;
- (NSData)pushToken;
- (NSString)destination;
- (NSUUID)identifier;
- (_HMDDeviceHandle)internal;
- (id)attributeDescriptions;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDDeviceHandle

- (void).cxx_destruct
{
}

- (_HMDDeviceHandle)internal
{
  return self->_internal;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDDeviceHandle *)self internal];
  [v4 encodeObject:v5 forKey:@"HM.internal"];
}

- (HMDDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.internal"];

  v6 = [(HMDDeviceHandle *)self initWithInternal:v5];
  return v6;
}

- (BOOL)matchesPushToken:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDDeviceHandle *)self internal];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [v7 pushToken];
    unsigned __int8 v9 = [v8 isEqualToData:v4];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSData)pushToken
{
  v2 = [(HMDDeviceHandle *)self internal];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = [v4 pushToken];
  }
  else
  {
    id v5 = 0;
  }

  return (NSData *)v5;
}

- (NSString)destination
{
  v2 = [(HMDDeviceHandle *)self internal];
  v3 = [v2 destination];

  return (NSString *)v3;
}

- (HMDAccountHandle)accountHandle
{
  v2 = [(HMDDeviceHandle *)self internal];
  v3 = [v2 accountHandle];

  return (HMDAccountHandle *)v3;
}

- (BOOL)isGlobal
{
  v2 = [(HMDDeviceHandle *)self internal];
  unsigned __int8 v3 = [v2 isGlobal];

  return v3;
}

- (BOOL)isLocal
{
  v2 = [(HMDDeviceHandle *)self internal];
  unsigned __int8 v3 = [v2 isLocal];

  return v3;
}

- (NSUUID)identifier
{
  v2 = [(HMDDeviceHandle *)self internal];
  unsigned __int8 v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  id v4 = [(HMDDeviceHandle *)self identifier];
  id v5 = [v4 UUIDString];
  id v6 = [v3 initWithName:@"Identifier" value:v5];
  v18[0] = v6;
  id v7 = objc_alloc((Class)HMFAttributeDescription);
  if ([(HMDDeviceHandle *)self isGlobal]) {
    CFStringRef v8 = @"Global";
  }
  else {
    CFStringRef v8 = @"Local";
  }
  id v9 = [v7 initWithName:@"Type" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc((Class)HMFAttributeDescription);
  v11 = [(HMDDeviceHandle *)self internal];
  id v12 = [v10 initWithName:@"Value" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc((Class)HMFAttributeDescription);
  v14 = [(HMDDeviceHandle *)self accountHandle];
  id v15 = [v13 initWithName:@"Account Handle" value:v14 options:1 formatter:0];
  v18[3] = v15;
  v16 = +[NSArray arrayWithObjects:v18 count:4];

  return v16;
}

- (id)shortDescription
{
  id v3 = [(id)objc_opt_class() shortDescription];
  id v4 = [(HMDDeviceHandle *)self identifier];
  id v5 = [v4 UUIDString];
  id v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDDeviceHandle *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMDDeviceHandle *)self internal];
      CFStringRef v8 = [(HMDDeviceHandle *)v6 internal];
      unsigned __int8 v9 = [v7 isEqual:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDDeviceHandle *)self internal];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (HMDDeviceHandle)initWithInternal:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDDeviceHandle;
    id v5 = [(HMDDeviceHandle *)&v14 init];
    if (v5)
    {
      id v6 = (_HMDDeviceHandle *)[v4 copy];
      internal = v5->_internal;
      v5->_internal = v6;
    }
    CFStringRef v8 = v5;
    unsigned __int8 v9 = v8;
  }
  else
  {
    CFStringRef v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing internal parameter", buf, 0xCu);
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (HMDDeviceHandle)init
{
  v2 = NSStringFromSelector(a2);
  id v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)deviceHandleForDeviceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[_HMDLocalDeviceHandle alloc] initWithDeviceIdentifier:v3];

  if (v4) {
    id v5 = [[HMDDeviceHandle alloc] initWithInternal:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)deviceHandleForDestination:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v11 = a1;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v13;
      objc_super v14 = "%{public}@Invalid destination, nil";
      id v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v19, v17);
    }
LABEL_12:

    goto LABEL_13;
  }
  id v5 = (void *)IDSCopyAddressDestinationForDestination();

  if (!v5)
  {
    id v11 = a1;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      objc_super v14 = "%{public}@Invalid device destination: %@";
      id v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      uint32_t v17 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v6 = &off_10002C748;
  if (+[_HMDLocalDeviceHandle isValidDestination:v4]
    || (id v6 = off_10002C740,
        +[_HMDGlobalDeviceHandle isValidDestination:v4]))
  {
    id v7 = [objc_alloc(*v6) initWithDestination:v4];
    if (v7)
    {
      CFStringRef v8 = v7;
      unsigned __int8 v9 = [[HMDDeviceHandle alloc] initWithInternal:v7];

      goto LABEL_14;
    }
  }
LABEL_13:
  unsigned __int8 v9 = 0;
LABEL_14:

  return v9;
}

@end