@interface HMDRemoteKeyedArchiver
- (NSData)encodedData;
- (NSKeyedArchiver)archiver;
- (NSString)transportType;
- (id)initForWritingWithRemoteDeviceIsOnSameAccount:(BOOL)a3 remoteGateway:(BOOL)a4 remoteUserIsAdministrator:(BOOL)a5 user:(id)a6 dataVersion:(int64_t)a7 supportedFeatures:(id)a8;
- (id)initForWritingWithRemoteDeviceIsOnSameAccount:(BOOL)a3 remoteGateway:(BOOL)a4 remoteUserIsAdministrator:(BOOL)a5 user:(id)a6 supportedFeatures:(id)a7;
- (void)dealloc;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)finishEncoding;
- (void)setArchiver:(id)a3;
- (void)setClassName:(id)a3 forClass:(Class)a4;
- (void)setTransportType:(id)a3;
@end

@implementation HMDRemoteKeyedArchiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
}

- (void)setTransportType:(id)a3
{
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setArchiver:(id)a3
{
}

- (NSKeyedArchiver)archiver
{
  return self->_archiver;
}

- (NSData)encodedData
{
  v2 = [(HMDRemoteKeyedArchiver *)self archiver];
  v3 = [v2 encodedData];

  return (NSData *)v3;
}

- (void)finishEncoding
{
  id v2 = [(HMDRemoteKeyedArchiver *)self archiver];
  [v2 finishEncoding];
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDRemoteKeyedArchiver *)self archiver];
  [v8 encodeObject:v7 forKey:v6];
}

- (void)setClassName:(id)a3 forClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(HMDRemoteKeyedArchiver *)self archiver];
  [v7 setClassName:v6 forClass:a4];
}

- (void)dealloc
{
  v3 = [(HMDRemoteKeyedArchiver *)self archiver];
  objc_removeAssociatedObjects(v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDRemoteKeyedArchiver;
  [(HMDRemoteKeyedArchiver *)&v4 dealloc];
}

- (id)initForWritingWithRemoteDeviceIsOnSameAccount:(BOOL)a3 remoteGateway:(BOOL)a4 remoteUserIsAdministrator:(BOOL)a5 user:(id)a6 supportedFeatures:(id)a7
{
  return [(HMDRemoteKeyedArchiver *)self initForWritingWithRemoteDeviceIsOnSameAccount:a3 remoteGateway:a4 remoteUserIsAdministrator:a5 user:a6 dataVersion:4 supportedFeatures:a7];
}

- (id)initForWritingWithRemoteDeviceIsOnSameAccount:(BOOL)a3 remoteGateway:(BOOL)a4 remoteUserIsAdministrator:(BOOL)a5 user:(id)a6 dataVersion:(int64_t)a7 supportedFeatures:(id)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  BOOL v12 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMDRemoteKeyedArchiver;
  v16 = [(HMDRemoteKeyedArchiver *)&v27 init];
  if (!v16) {
    goto LABEL_12;
  }
  v17 = (void *)MEMORY[0x1D9452090]();
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v19;
    __int16 v30 = 2112;
    id v31 = v14;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Encoding for user : %@", buf, 0x16u);
  }
  uint64_t v20 = [objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  archiver = v16->_archiver;
  v16->_archiver = (NSKeyedArchiver *)v20;

  objc_setAssociatedObject(v16->_archiver, @"kTransportTypeAssociationKey", MEMORY[0x1E4F1CC38], (void *)0x301);
  if (v12)
  {
    objc_setAssociatedObject(v16->_archiver, @"DeviceIsOnSameAccountKey", MEMORY[0x1E4F1CC38], (void *)0x301);
    if (!v11)
    {
LABEL_6:
      if (!v10) {
        goto LABEL_7;
      }
LABEL_15:
      objc_setAssociatedObject(v16->_archiver, @"RemoteUserIsAdministrator", MEMORY[0x1E4F1CC38], (void *)0x301);
      if (!v14) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if (!v11)
  {
    goto LABEL_6;
  }
  objc_setAssociatedObject(v16->_archiver, @"RemoteGateway", MEMORY[0x1E4F1CC38], (void *)0x301);
  if (v10) {
    goto LABEL_15;
  }
LABEL_7:
  if (v14) {
LABEL_8:
  }
    objc_setAssociatedObject(v16->_archiver, @"User", v14, (void *)0x301);
LABEL_9:
  if (v15) {
    objc_setAssociatedObject(v16->_archiver, @"SupportedFeatures", v15, (void *)0x301);
  }
  v22 = v16->_archiver;
  v23 = [NSNumber numberWithInteger:a7];
  objc_setAssociatedObject(v22, @"DataVersion", v23, (void *)0x301);

  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  [(HMDRemoteKeyedArchiver *)v16 setClassName:v25 forClass:objc_opt_class()];

LABEL_12:
  return v16;
}

@end