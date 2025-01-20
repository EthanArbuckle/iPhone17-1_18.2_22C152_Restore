@interface _CDPolicyBasedPersisting
+ (id)persistenceWithPersistenceSurvivingReboot:(id)a3 persistenceSurvivingRelaunch:(id)a4;
- (_CDContextPersisting)persistenceSurvivingReboot;
- (_CDContextPersisting)persistenceSurvivingRelaunch;
- (_CDPolicyBasedPersisting)initWithPersistenceSurvivingReboot:(id)a3 persistenceSurvivingRelaunch:(id)a4;
- (id)loadRegistrations;
- (id)loadValues;
- (void)deleteAllData;
- (void)deleteDataCreatedBefore:(id)a3;
- (void)deleteRegistration:(id)a3;
- (void)saveRegistration:(id)a3;
- (void)saveValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation _CDPolicyBasedPersisting

- (void)saveValue:(id)a3 forKeyPath:(id)a4
{
}

- (void)deleteRegistration:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47___CDPolicyBasedPersisting_deleteRegistration___block_invoke;
  v7[3] = &unk_1E56091D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 runBlockWhenDeviceIsClassCUnlocked:v7];
}

- (_CDPolicyBasedPersisting)initWithPersistenceSurvivingReboot:(id)a3 persistenceSurvivingRelaunch:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDPolicyBasedPersisting;
  v9 = [(_CDPolicyBasedPersisting *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistenceSurvivingReboot, a3);
    objc_storeStrong((id *)&v10->_persistenceSurvivingRelaunch, a4);
  }

  return v10;
}

+ (id)persistenceWithPersistenceSurvivingReboot:(id)a3 persistenceSurvivingRelaunch:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    id v8 = a3;
    id v4 = (void *)[objc_alloc((Class)a1) initWithPersistenceSurvivingReboot:v8 persistenceSurvivingRelaunch:v7];
  }
  return v4;
}

- (void)saveRegistration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F93B10] isClassCLocked])
  {
    v5 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_18EC9B000, v5, OS_LOG_TYPE_DEFAULT, "Registration persistance queued %@", buf, 0xCu);
    }
  }
  id v6 = (void *)MEMORY[0x1E4F93B10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45___CDPolicyBasedPersisting_saveRegistration___block_invoke;
  v8[3] = &unk_1E56091D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 runBlockWhenDeviceIsClassCUnlocked:v8];
}

- (void)deleteAllData
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41___CDPolicyBasedPersisting_deleteAllData__block_invoke;
  v3[3] = &unk_1E5609210;
  v3[4] = self;
  [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlocked:v3];
  [(_CDContextPersisting *)self->_persistenceSurvivingRelaunch deleteAllData];
}

- (void)deleteDataCreatedBefore:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B10];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __52___CDPolicyBasedPersisting_deleteDataCreatedBefore___block_invoke;
  v10 = &unk_1E56091D8;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  [v5 runBlockWhenDeviceIsClassCUnlocked:&v7];
  -[_CDContextPersisting deleteDataCreatedBefore:](self->_persistenceSurvivingRelaunch, "deleteDataCreatedBefore:", v6, v7, v8, v9, v10, v11);
}

- (id)loadValues
{
  return (id)[(_CDContextPersisting *)self->_persistenceSurvivingRelaunch loadValues];
}

- (id)loadRegistrations
{
  v3 = [(_CDContextPersisting *)self->_persistenceSurvivingReboot loadRegistrations];
  id v4 = [(_CDContextPersisting *)self->_persistenceSurvivingRelaunch loadRegistrations];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v3, "count"));
  if ([v3 count]) {
    [v5 addObjectsFromArray:v3];
  }
  if ([v4 count]) {
    [v5 addObjectsFromArray:v4];
  }
  id v6 = (void *)[v5 copy];

  return v6;
}

- (_CDContextPersisting)persistenceSurvivingReboot
{
  return self->_persistenceSurvivingReboot;
}

- (_CDContextPersisting)persistenceSurvivingRelaunch
{
  return self->_persistenceSurvivingRelaunch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceSurvivingRelaunch, 0);
  objc_storeStrong((id *)&self->_persistenceSurvivingReboot, 0);
}

@end