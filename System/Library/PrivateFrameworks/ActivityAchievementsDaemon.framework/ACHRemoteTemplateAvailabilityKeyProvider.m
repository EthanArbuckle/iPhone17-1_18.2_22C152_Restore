@interface ACHRemoteTemplateAvailabilityKeyProvider
- (ACHRemoteTemplateAvailabilityKeyProvider)initWithHealthStore:(id)a3 creatorDevice:(unsigned __int8)a4;
- (ACHRemoteTemplateAvailabilityKeyProvider)initWithProfile:(id)a3 creatorDevice:(unsigned __int8)a4;
- (BOOL)markTemplateAvailable:(id)a3 error:(id *)a4;
- (BOOL)templateAvailableOnPairedDevice:(id)a3 error:(id *)a4;
- (HDProfile)profile;
- (HKHealthStore)healthStore;
- (id)availabilityStateKeyFromUniqueName:(id)a3 creatorDevice:(unsigned __int8)a4;
- (unsigned)creatorDevice;
- (void)setCreatorDevice:(unsigned __int8)a3;
- (void)setHealthStore:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation ACHRemoteTemplateAvailabilityKeyProvider

- (ACHRemoteTemplateAvailabilityKeyProvider)initWithHealthStore:(id)a3 creatorDevice:(unsigned __int8)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHRemoteTemplateAvailabilityKeyProvider;
  v8 = [(ACHRemoteTemplateAvailabilityKeyProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v9->_creatorDevice = a4;
  }

  return v9;
}

- (ACHRemoteTemplateAvailabilityKeyProvider)initWithProfile:(id)a3 creatorDevice:(unsigned __int8)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACHRemoteTemplateAvailabilityKeyProvider;
  id v7 = [(ACHRemoteTemplateAvailabilityKeyProvider *)&v10 init];
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
  id v6 = [a3 uniqueName];
  id v7 = [(ACHRemoteTemplateAvailabilityKeyProvider *)self availabilityStateKeyFromUniqueName:v6 creatorDevice:[(ACHRemoteTemplateAvailabilityKeyProvider *)self creatorDevice]];

  if (v7)
  {
    v8 = [(ACHRemoteTemplateAvailabilityKeyProvider *)self profile];

    if (v8)
    {
      v9 = (void *)MEMORY[0x263F433E8];
      uint64_t v10 = *MEMORY[0x263F23470];
      objc_super v11 = [(ACHRemoteTemplateAvailabilityKeyProvider *)self profile];
      char v12 = [v9 setNumber:MEMORY[0x263EFFA88] forKey:v7 domain:v10 category:1 profile:v11 error:a4];
    }
    else
    {
      id v17 = objc_alloc(MEMORY[0x263F0A470]);
      uint64_t v18 = *MEMORY[0x263F23470];
      v19 = [(ACHRemoteTemplateAvailabilityKeyProvider *)self healthStore];
      v20 = (void *)[v17 initWithCategory:4 domainName:v18 healthStore:v19];

      char v12 = [v20 setNumber:MEMORY[0x263EFFA88] forKey:v7 error:a4];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"Unable to mark template as available because its unique name is nil.";
    v14 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v15 = [v13 errorWithDomain:@"com.apple.Achievements.availability" code:101 userInfo:v14];

    id v16 = v15;
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    char v12 = 0;
  }

  return v12;
}

- (BOOL)templateAvailableOnPairedDevice:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = [a3 uniqueName];
  id v7 = [(ACHRemoteTemplateAvailabilityKeyProvider *)self availabilityStateKeyFromUniqueName:v6 creatorDevice:[(ACHRemoteTemplateAvailabilityKeyProvider *)self creatorDevice]];

  if (v7)
  {
    v8 = [(ACHRemoteTemplateAvailabilityKeyProvider *)self profile];

    if (v8)
    {
      v9 = (void *)MEMORY[0x263F433E8];
      uint64_t v10 = *MEMORY[0x263F23470];
      objc_super v11 = [(ACHRemoteTemplateAvailabilityKeyProvider *)self profile];
      char v12 = [v9 numberForKey:v7 domain:v10 category:1 profile:v11 entity:0 error:a4];

      if (v12) {
        char v13 = [v12 BOOLValue];
      }
      else {
        char v13 = 0;
      }
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x263F0A470]);
      uint64_t v19 = *MEMORY[0x263F23470];
      v20 = [(ACHRemoteTemplateAvailabilityKeyProvider *)self healthStore];
      char v12 = (void *)[v18 initWithCategory:4 domainName:v19 healthStore:v20];

      v21 = [v12 numberForKey:v7 error:a4];
      uint64_t v22 = v21;
      if (v21) {
        char v13 = [v21 BOOLValue];
      }
      else {
        char v13 = 0;
      }
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25[0] = @"Unable to read template availability on paired device because its unique name is nil.";
    v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v16 = [v14 errorWithDomain:@"com.apple.Achievements.availability" code:101 userInfo:v15];

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

    char v13 = 0;
  }

  return v13;
}

- (id)availabilityStateKeyFromUniqueName:(id)a3 creatorDevice:(unsigned __int8)a4
{
  v4 = (void *)MEMORY[0x263F23480];
  if (a4 != 1) {
    v4 = (void *)MEMORY[0x263F23478];
  }
  v5 = [a3 stringByAppendingString:*v4];
  return v5;
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