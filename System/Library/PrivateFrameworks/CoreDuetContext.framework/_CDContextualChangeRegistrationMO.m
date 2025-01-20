@interface _CDContextualChangeRegistrationMO
+ (id)materializedRegistrationFrom:(id)a3;
+ (id)predicateForActiveRegistrationsInBootSession:(id)a3;
+ (void)hydrateMO:(id)a3 fromRegistration:(id)a4;
@end

@implementation _CDContextualChangeRegistrationMO

+ (void)hydrateMO:(id)a3 fromRegistration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 identifier];
  [v6 setIdentifier:v8];

  id v12 = 0;
  v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v12];
  id v10 = v12;
  if (v9)
  {
    [v6 setProperties:v9];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[_CDContextualChangeRegistrationMO hydrateMO:fromRegistration:]((objc_class *)a1, (uint64_t)v10);
  }
  v11 = [MEMORY[0x1E4F1C9C8] date];
  [v6 setCreationDate:v11];

  objc_msgSend(v6, "setIsMultiDeviceRegistration:", objc_msgSend(v7, "isMultiDeviceRegistration"));
  [v6 setIsActive:1];
}

+ (id)materializedRegistrationFrom:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v5 = objc_opt_class();
  id v6 = [v3 properties];
  id v10 = 0;
  id v7 = [v4 unarchivedObjectOfClass:v5 fromData:v6 error:&v10];
  id v8 = v10;

  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    +[_CDContextualChangeRegistrationMO materializedRegistrationFrom:](v3);
  }

  return v7;
}

+ (id)predicateForActiveRegistrationsInBootSession:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = [v3 arrayWithCapacity:2];
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isActive = %@", MEMORY[0x1E4F1CC38]];
  [v5 addObject:v7];

  id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isMultiDeviceRegistration = %@", v6];
  [v8 addObject:v9];

  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate >= %@", v4];

  [v8 addObject:v10];
  v11 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v8];
  [v5 addObject:v11];

  id v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];

  return v12;
}

+ (void)hydrateMO:(objc_class *)a1 fromRegistration:(uint64_t)a2 .cold.1(objc_class *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromClass(a1);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@: Error setting mo.properties: %@", (uint8_t *)&v4, 0x16u);
}

+ (void)materializedRegistrationFrom:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 identifier];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_fault_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to materialize registration with identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end