@interface ACHBackCompatRemoteAchievementAvailabilityKeyWriter
- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)initWithHealthStore:(id)a3 creatorDevice:(unsigned __int8)a4;
- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)initWithProfile:(id)a3 creatorDevice:(unsigned __int8)a4;
- (BOOL)markTemplateAvailable:(id)a3 error:(id *)a4;
- (HDProfile)profile;
- (HKHealthStore)healthStore;
- (id)companionAvailabilityStateKeyFromUniqueName:(id)a3;
- (unsigned)creatorDevice;
- (void)setCreatorDevice:(unsigned __int8)a3;
- (void)setHealthStore:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation ACHBackCompatRemoteAchievementAvailabilityKeyWriter

- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)initWithHealthStore:(id)a3 creatorDevice:(unsigned __int8)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHBackCompatRemoteAchievementAvailabilityKeyWriter;
  v8 = [(ACHBackCompatRemoteAchievementAvailabilityKeyWriter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_creatorDevice = a4;
  }

  return v9;
}

- (ACHBackCompatRemoteAchievementAvailabilityKeyWriter)initWithProfile:(id)a3 creatorDevice:(unsigned __int8)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACHBackCompatRemoteAchievementAvailabilityKeyWriter;
  id v7 = [(ACHBackCompatRemoteAchievementAvailabilityKeyWriter *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    v8->_creatorDevice = a4;
  }

  return v8;
}

- (BOOL)markTemplateAvailable:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(ACHBackCompatRemoteAchievementAvailabilityKeyWriter *)self creatorDevice] == 1)
  {
    char v7 = 1;
  }
  else
  {
    v8 = [v6 uniqueName];
    v9 = [(ACHBackCompatRemoteAchievementAvailabilityKeyWriter *)self companionAvailabilityStateKeyFromUniqueName:v8];

    if (v9)
    {
      objc_super v10 = [(ACHBackCompatRemoteAchievementAvailabilityKeyWriter *)self profile];

      if (v10)
      {
        objc_super v11 = (void *)MEMORY[0x263F433E8];
        uint64_t v12 = *MEMORY[0x263F43030];
        v13 = [(ACHBackCompatRemoteAchievementAvailabilityKeyWriter *)self profile];
        char v7 = [v11 setNumber:MEMORY[0x263EFFA88] forKey:v9 domain:v12 category:1 profile:v13 error:a4];
      }
      else
      {
        id v18 = objc_alloc(MEMORY[0x263F0A470]);
        v19 = [(ACHBackCompatRemoteAchievementAvailabilityKeyWriter *)self healthStore];
        v20 = (void *)[v18 initWithCategory:4 domainName:@"HDKeyValueEntityDefaultDomain" healthStore:v19];

        char v7 = [v20 setNumber:MEMORY[0x263EFFA88] forKey:v9 error:a4];
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      v23[0] = @"Unable to mark template as available because its unique name is nil.";
      v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
      v16 = [v14 errorWithDomain:@"com.apple.Achievements.BackCompatRemoteAvailability" code:101 userInfo:v15];

      id v17 = v16;
      if (v17)
      {
        if (a4) {
          *a4 = v17;
        }
        else {
          _HKLogDroppedError();
        }
      }

      char v7 = 0;
    }
  }
  return v7;
}

- (id)companionAvailabilityStateKeyFromUniqueName:(id)a3
{
  return (id)[a3 stringByAppendingString:@"-availability-companion"];
}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end