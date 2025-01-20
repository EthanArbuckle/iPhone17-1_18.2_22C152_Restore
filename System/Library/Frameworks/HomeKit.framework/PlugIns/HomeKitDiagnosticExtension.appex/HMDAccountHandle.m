@interface HMDAccountHandle
+ (BOOL)supportsSecureCoding;
+ (id)accountHandleForDestination:(id)a3;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)isLocallyTracked;
- (CKUserIdentityLookupInfo)cloudKitLookupInfo;
- (CNContact)contact;
- (HMDAccountHandle)init;
- (HMDAccountHandle)initWithCoder:(id)a3;
- (HMDAccountHandle)initWithURI:(id)a3;
- (HMDAccountHandle)initWithURI:(id)a3 local:(BOOL)a4;
- (IDSURI)URI;
- (NSString)value;
- (NSUUID)identifier;
- (NSUUID)modelParentIdentifier;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)remoteDestinationString;
- (id)shortDescription;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocallyTracked:(BOOL)a3;
- (void)setModelParentIdentifier:(id)a3;
@end

@implementation HMDAccountHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelParentIdentifier, 0);
  objc_storeStrong((id *)&self->_URI, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setLocallyTracked:(BOOL)a3
{
  self->_locallyTracked = a3;
}

- (BOOL)isLocallyTracked
{
  return self->_locallyTracked;
}

- (void)setModelParentIdentifier:(id)a3
{
}

- (NSUUID)modelParentIdentifier
{
  return self->_modelParentIdentifier;
}

- (IDSURI)URI
{
  return (IDSURI *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isLocal
{
  return self->_local;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDAccountHandle *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)remoteDestinationString
{
  v2 = [(HMDAccountHandle *)self URI];
  v3 = [v2 prefixedURI];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(HMDAccountHandle *)self URI];
  [v5 encodeObject:v4 forKey:@"HMD.URI"];

  objc_msgSend(v5, "encodeBool:forKey:", -[HMDAccountHandle isLocal](self, "isLocal"), @"HMD.local");
  if (objc_msgSend(v5, "hmd_isForLocalStore")) {
    objc_msgSend(v5, "encodeBool:forKey:", -[HMDAccountHandle isLocallyTracked](self, "isLocallyTracked"), @"HMD.locallyTracked");
  }
}

- (HMDAccountHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.URI"];
  v6 = -[HMDAccountHandle initWithURI:local:](self, "initWithURI:local:", v5, [v4 decodeBoolForKey:@"HMD.local"]);
  if (v6)
  {
    v6->_locallyTracked = [v4 decodeBoolForKey:@"HMD.locallyTracked"];
    if ([v4 containsValueForKey:@"HMD.modelParentIdentifier"])
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.modelParentIdentifier"];
      modelParentIdentifier = v6->_modelParentIdentifier;
      v6->_modelParentIdentifier = (NSUUID *)v7;
    }
  }

  return v6;
}

- (CKUserIdentityLookupInfo)cloudKitLookupInfo
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (CNContact)contact
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (int64_t)type
{
  v3 = [(HMDAccountHandle *)self URI];
  id v4 = [v3 unprefixedURI];
  unsigned __int8 v5 = [v4 _appearsToBeEmail];

  if (v5) {
    return 1;
  }
  uint64_t v7 = [(HMDAccountHandle *)self URI];
  v8 = [v7 unprefixedURI];
  unsigned int v9 = [v8 _appearsToBePhoneNumber];

  if (v9) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)attributeDescriptions
{
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  id v4 = [(HMDAccountHandle *)self identifier];
  unsigned __int8 v5 = [v4 UUIDString];
  id v6 = [v3 initWithName:@"ID" value:v5];
  v21[0] = v6;
  id v7 = objc_alloc((Class)HMFAttributeDescription);
  int64_t v8 = [(HMDAccountHandle *)self type];
  CFStringRef v9 = @"Unknown";
  if (v8 == 2) {
    CFStringRef v9 = @"Phone";
  }
  if (v8 == 1) {
    CFStringRef v10 = @"Email";
  }
  else {
    CFStringRef v10 = v9;
  }
  id v11 = [v7 initWithName:@"TP" value:v10];
  v21[1] = v11;
  id v12 = objc_alloc((Class)HMFAttributeDescription);
  [(HMDAccountHandle *)self isLocal];
  v13 = HMFBooleanToString();
  id v14 = [v12 initWithName:@"LC" value:v13];
  v21[2] = v14;
  id v15 = objc_alloc((Class)HMFAttributeDescription);
  v16 = [(HMDAccountHandle *)self value];
  v17 = +[HMDAccountHandleFormatter defaultFormatter];
  id v18 = [v15 initWithName:@"VA" value:v16 options:0 formatter:v17];
  v21[3] = v18;
  v19 = +[NSArray arrayWithObjects:v21 count:4];

  return v19;
}

- (id)shortDescription
{
  id v3 = [(id)objc_opt_class() shortDescription];
  id v4 = [(HMDAccountHandle *)self identifier];
  unsigned __int8 v5 = [v4 UUIDString];
  id v6 = +[NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccountHandle *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v5 = v4;
    }
    else {
      unsigned __int8 v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      id v7 = [(HMDAccountHandle *)self URI];
      int64_t v8 = [(HMDAccountHandle *)v6 URI];
      unsigned __int8 v9 = [v7 isEqualToURI:v8];
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
  v2 = [(HMDAccountHandle *)self URI];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)value
{
  v2 = [(HMDAccountHandle *)self URI];
  id v3 = [v2 unprefixedURI];

  return (NSString *)v3;
}

- (HMDAccountHandle)initWithURI:(id)a3 local:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    v20.receiver = self;
    v20.super_class = (Class)HMDAccountHandle;
    id v7 = [(HMDAccountHandle *)&v20 init];
    if (v7)
    {
      uint64_t v8 = qword_100036C88;
      id v9 = v6;
      if (v8 != -1) {
        dispatch_once(&qword_100036C88, &stru_10002C9A8);
      }
      id v10 = objc_alloc((Class)NSUUID);
      uint64_t v11 = qword_100036C80;
      id v12 = [v9 prefixedURI];

      v13 = [v12 dataUsingEncoding:4];
      id v14 = (NSUUID *)[v10 initWithNamespace:v11 data:v13];

      identifier = v7->_identifier;
      v7->_identifier = v14;

      v16 = (IDSURI *)[v9 copy];
      URI = v7->_URI;
      v7->_URI = v16;

      v7->_local = a4;
    }
    self = v7;
    id v18 = self;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (HMDAccountHandle)initWithURI:(id)a3
{
  return [(HMDAccountHandle *)self initWithURI:a3 local:0];
}

- (HMDAccountHandle)init
{
  v2 = NSStringFromSelector(a2);
  id v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)logCategory
{
  if (qword_100036C70 != -1) {
    dispatch_once(&qword_100036C70, &stru_10002C988);
  }
  v2 = (void *)qword_100036C78;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)accountHandleForDestination:(id)a3
{
  id v3 = (void *)IDSCopyAddressDestinationForDestination();
  if (v3)
  {
    id v4 = +[HMDAccountHandleFormatter defaultFormatter];
    unsigned __int8 v5 = [v4 accountHandleFromString:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end