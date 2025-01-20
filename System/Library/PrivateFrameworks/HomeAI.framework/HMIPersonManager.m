@interface HMIPersonManager
- (BOOL)isPersonDataAvailableViaHomeKit;
- (BOOL)supportsFaceClassification;
- (HMIPersonManager)initWithUUID:(id)a3;
- (HMIPersonManager)initWithUUID:(id)a3 homeUUID:(id)a4;
- (HMIPersonManagerDataSource)dataSource;
- (NSUUID)UUID;
- (NSUUID)homeUUID;
- (void)handleRemovedFaceCropWithUUID:(id)a3;
- (void)handleRemovedFaceprintWithUUID:(id)a3;
- (void)handleRemovedPersonWithUUID:(id)a3;
- (void)handleUpdatedFaceprint:(id)a3;
- (void)handleUpdatedPerson:(id)a3;
- (void)handleUpdatedPersonFaceCrop:(id)a3;
- (void)handleUpdatedUnassociatedFaceCrop:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPersonDataAvailableViaHomeKit:(BOOL)a3;
- (void)setSupportsFaceClassification:(BOOL)a3;
@end

@implementation HMIPersonManager

- (HMIPersonManager)initWithUUID:(id)a3 homeUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIPersonManager;
  v8 = [(HMIPersonManager *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    UUID = v8->_UUID;
    v8->_UUID = (NSUUID *)v9;

    uint64_t v11 = [v7 copy];
    homeUUID = v8->_homeUUID;
    v8->_homeUUID = (NSUUID *)v11;
  }
  return v8;
}

- (HMIPersonManager)initWithUUID:(id)a3
{
  v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "hmf_zeroUUID");
  id v7 = [(HMIPersonManager *)self initWithUUID:v5 homeUUID:v6];

  return v7;
}

- (void)handleUpdatedPerson:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)handleUpdatedUnassociatedFaceCrop:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)handleUpdatedPersonFaceCrop:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)handleUpdatedFaceprint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)handleRemovedPersonWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)handleRemovedFaceCropWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)handleRemovedFaceprintWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMIPersonManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMIPersonManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)supportsFaceClassification
{
  return self->_supportsFaceClassification;
}

- (void)setSupportsFaceClassification:(BOOL)a3
{
  self->_supportsFaceClassification = a3;
}

- (BOOL)isPersonDataAvailableViaHomeKit
{
  return self->_personDataAvailableViaHomeKit;
}

- (void)setPersonDataAvailableViaHomeKit:(BOOL)a3
{
  self->_personDataAvailableViaHomeKit = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end