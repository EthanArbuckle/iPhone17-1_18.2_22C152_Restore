@interface MKFCKAppleMediaAccessory
+ (id)fetchRequest;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
@end

@implementation MKFCKAppleMediaAccessory

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MKFCKAppleMediaAccessory;
  if ([(MKFCKAccessory *)&v24 exportFromLocalModel:v8 updatedProperties:a4 context:v9])
  {
    id v10 = v8;
    id v11 = v9;
    BOOL v12 = self != 0;
    if (self)
    {
      v13 = [v10 resident];
      if (v13)
      {
        uint64_t v14 = +[MKFCKModel fetchWithLocalModel:v13 context:v11];
        if (v14)
        {
          v15 = (void *)v14;
          v16 = [(MKFCKAppleMediaAccessory *)self resident];

          if (v16 != v15) {
            [(MKFCKAppleMediaAccessory *)self setResident:v15];
          }
        }
        else
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          v18 = self;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = HMFGetLogIdentifier();
            [v10 objectID];
            v21 = v23 = v17;
            *(_DWORD *)buf = 138543874;
            v26 = v20;
            __int16 v27 = 2112;
            v28 = v21;
            __int16 v29 = 2112;
            v30 = v13;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.resident = %@", buf, 0x20u);

            v17 = v23;
          }
        }
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MKFCKAppleMediaAccessory;
  if ([(MKFCKAccessory *)&v26 importIntoLocalModel:v8 updatedProperties:a4 context:v9])
  {
    id v10 = v8;
    id v11 = v9;
    BOOL v12 = self != 0;
    if (self)
    {
      v13 = [(MKFCKAppleMediaAccessory *)self resident];
      uint64_t v14 = v13;
      if (v13)
      {
        v15 = [v13 fetchLocalModelWithContext:v11];
        if (v15)
        {
          v16 = [v10 resident];

          if (v16 != v15)
          {
            [v10 setResident:v15];
            v17 = [v10 device];
            if (v17)
            {
              v18 = [v15 device];

              if (v18 != v17) {
                [v15 setDevice:v17];
              }
            }
          }
        }
        else
        {
          v19 = (void *)MEMORY[0x230FBD990]();
          v20 = self;
          v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v25 = HMFGetLogIdentifier();
            [(MKFCKAppleMediaAccessory *)v20 objectID];
            v22 = objc_super v24 = v19;
            *(_DWORD *)buf = 138543874;
            v28 = v25;
            __int16 v29 = 2112;
            v30 = v22;
            __int16 v31 = 2112;
            v32 = v14;
            _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.resident = %@", buf, 0x20u);

            v19 = v24;
          }
        }
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKAppleMediaAccessory"];
}

@end