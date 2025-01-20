@interface DNDSAppSpecificSettingsTypeSystemAction
+ (Class)appSpecificSettingsClass;
+ (NSString)appSpecificSettingsEntity;
+ (id)appSpecificSettingsForManagedObject:(id)a3;
+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4;
@end

@implementation DNDSAppSpecificSettingsTypeSystemAction

+ (NSString)appSpecificSettingsEntity
{
  return (NSString *)@"SystemAction";
}

+ (Class)appSpecificSettingsClass
{
  return NSClassFromString(&cfstr_Dndsystemactio.isa);
}

+ (id)appSpecificSettingsForManagedObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 enabled];
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  v7 = [v3 encodedAction];
  id v24 = 0;
  v8 = [v5 unarchivedObjectOfClass:v6 fromData:v7 error:&v24];
  id v9 = v24;

  if (!v9)
  {
    id v14 = [v3 encodedReverseAction];

    if (v14)
    {
      v16 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v17 = objc_opt_class();
      v18 = [v3 encodedAction];
      id v22 = 0;
      v19 = [v16 unarchivedObjectOfClass:v17 fromData:v18 error:&v22];
      id v14 = v22;

      if (v14 && (v20 = DNDSLogSettings, os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)))
      {
        +[DNDSAppSpecificSettingsTypeSystemAction appSpecificSettingsForManagedObject:]((uint64_t)v14, v20);
        if (v19) {
          goto LABEL_9;
        }
      }
      else if (v19)
      {
LABEL_9:
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F5F770]) initWithAction:v8 reverseAction:v19 enabled:v4];

        goto LABEL_12;
      }
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F5F770]) initWithAction:v8 enabled:v4];
    goto LABEL_12;
  }

  [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"DNDSSystemAction"];
  v10 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v11 = objc_opt_class();
  v12 = [v3 encodedAction];
  id v23 = 0;
  v13 = [v10 unarchivedObjectOfClass:v11 fromData:v12 error:&v23];
  id v14 = v23;

  if (v14)
  {
    v15 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_FAULT)) {
      +[DNDSAppSpecificSettingsTypeSystemAction appSpecificSettingsForManagedObject:]((uint64_t)v14, v15);
    }
  }
LABEL_12:

  return v13;
}

+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4
{
  id v5 = a3;
  id v9 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a4 requiringSecureCoding:1 error:&v9];
  id v7 = v9;
  if (v7)
  {
    v8 = DNDSLogSettings;
    if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR)) {
      +[DNDSAppSpecificSettingsTypeSystemAction completeManagedObject:forAppSpecificSettings:]((uint64_t)v7, v8);
    }
  }
  [v5 setEncodedAction:v6];
}

+ (void)appSpecificSettingsForManagedObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)appSpecificSettingsForManagedObject:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3052000, a2, OS_LOG_TYPE_FAULT, "Failed to unarchive settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)completeManagedObject:(uint64_t)a1 forAppSpecificSettings:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Failed to archive settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end