@interface IDSKTRegistrationDataConfig
- (IDSKTRegistrationData)registeredKTData;
- (IDSKTRegistrationData)unregisteredKTData;
- (IDSKTRegistrationDataConfig)init;
- (void)setRegisteredKTData:(id)a3;
- (void)setUnregisteredKTData:(id)a3;
@end

@implementation IDSKTRegistrationDataConfig

- (IDSKTRegistrationDataConfig)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSKTRegistrationDataConfig;
  v2 = [(IDSKTRegistrationDataConfig *)&v7 init];
  v3 = v2;
  if (v2)
  {
    unregisteredKTData = v2->_unregisteredKTData;
    v2->_unregisteredKTData = 0;

    registeredKTData = v3->_registeredKTData;
    v3->_registeredKTData = 0;
  }
  return v3;
}

- (IDSKTRegistrationData)unregisteredKTData
{
  return self->_unregisteredKTData;
}

- (void)setUnregisteredKTData:(id)a3
{
}

- (IDSKTRegistrationData)registeredKTData
{
  return self->_registeredKTData;
}

- (void)setRegisteredKTData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredKTData, 0);

  objc_storeStrong((id *)&self->_unregisteredKTData, 0);
}

@end