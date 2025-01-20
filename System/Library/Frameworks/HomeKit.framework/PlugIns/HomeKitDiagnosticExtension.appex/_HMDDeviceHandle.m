@interface _HMDDeviceHandle
+ (BOOL)isValidDestination:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSUUID)identifierNamespace;
- (BOOL)isGlobal;
- (BOOL)isLocal;
- (HMDAccountHandle)accountHandle;
- (NSString)destination;
- (NSUUID)identifier;
- (_HMDDeviceHandle)init;
- (_HMDDeviceHandle)initWithCoder:(id)a3;
- (_HMDDeviceHandle)initWithDestination:(id)a3;
- (_HMDDeviceHandle)initWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDDeviceHandle

- (void).cxx_destruct
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_HMDDeviceHandle *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];
}

- (_HMDDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];

  v6 = [(_HMDDeviceHandle *)self initWithIdentifier:v5];
  return v6;
}

- (HMDAccountHandle)accountHandle
{
  return 0;
}

- (BOOL)isGlobal
{
  return 0;
}

- (BOOL)isLocal
{
  return 0;
}

- (_HMDDeviceHandle)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)_HMDDeviceHandle;
    id v5 = [(_HMDDeviceHandle *)&v14 init];
    if (v5)
    {
      v6 = (NSUUID *)[v4 copy];
      identifier = v5->_identifier;
      v5->_identifier = v6;
    }
    v8 = v5;
    v9 = v8;
  }
  else
  {
    v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing required parameter 'identifier'", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (_HMDDeviceHandle)initWithDestination:(id)a3
{
  id v4 = a3;
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  id v5 = (_HMDDeviceHandle *)_HMFPreconditionFailureWithFormat();
  [(_HMDDeviceHandle *)v5 destination];
}

- (NSString)destination
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (_HMDDeviceHandle)init
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSUUID)identifierNamespace
{
  if (qword_100036BD0 != -1) {
    dispatch_once(&qword_100036BD0, &stru_10002C800);
  }
  v2 = (void *)qword_100036BC8;

  return (NSUUID *)v2;
}

+ (BOOL)isValidDestination:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  SEL v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end