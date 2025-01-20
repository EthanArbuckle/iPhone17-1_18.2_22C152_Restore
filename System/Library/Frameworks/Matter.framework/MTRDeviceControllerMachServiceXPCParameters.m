@interface MTRDeviceControllerMachServiceXPCParameters
+ (BOOL)supportsSecureCoding;
- (MTRDeviceControllerMachServiceXPCParameters)initWithUniqueIdentifier:(id)a3;
- (NSString)machServiceName;
- (NSUUID)uniqueIdentifier;
- (unint64_t)connectionOptions;
- (void)setConnectionOptions:(unint64_t)a3;
- (void)setMachServiceName:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation MTRDeviceControllerMachServiceXPCParameters

- (MTRDeviceControllerMachServiceXPCParameters)initWithUniqueIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTRDeviceControllerMachServiceXPCParameters;
  v6 = [(MTRDeviceControllerAbstractParameters *)&v10 _initInternal];
  v7 = (MTRDeviceControllerMachServiceXPCParameters *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 2, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)machServiceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMachServiceName:(id)a3
{
}

- (unint64_t)connectionOptions
{
  return self->_connectionOptions;
}

- (void)setConnectionOptions:(unint64_t)a3
{
  self->_connectionOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end