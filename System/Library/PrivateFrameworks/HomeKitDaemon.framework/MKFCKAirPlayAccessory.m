@interface MKFCKAirPlayAccessory
+ (id)fetchRequest;
+ (id)fetchWithLocalModel:(id)a3 context:(id)a4;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)validateMinimumUserPrivilege:(id *)a3 error:(id *)a4;
- (id)fetchLocalModelWithContext:(id)a3;
@end

@implementation MKFCKAirPlayAccessory

+ (id)fetchWithLocalModel:(id)a3 context:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MKFCKAirPlayAccessory;
  v4 = objc_msgSendSuper2(&v6, sel_fetchWithLocalModel_context_, a3, a4);
  return v4;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MKFCKAirPlayAccessory;
  return [(MKFCKAccessory *)&v6 exportFromLocalModel:a3 updatedProperties:a4 context:a5];
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MKFCKAirPlayAccessory;
  return [(MKFCKAccessory *)&v6 importIntoLocalModel:a3 updatedProperties:a4 context:a5];
}

- (id)fetchLocalModelWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKFCKAirPlayAccessory;
  v3 = [(MKFCKModel *)&v5 fetchLocalModelWithContext:a3];
  return v3;
}

- (BOOL)validateMinimumUserPrivilege:(id *)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(MKFCKModel *)self shouldSkipValidationDuringImport]
    || -[NSManagedObject hmd_validateNumber:key:error:](self, "hmd_validateNumber:key:error:", *a3, @"minimumUserPrivilege", a4)&& (unint64_t)[*a3 integerValue] < 4)
  {
    return 1;
  }
  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = HMFGetLogIdentifier();
    id v11 = *a3;
    int v14 = 138543874;
    v15 = v10;
    __int16 v16 = 2114;
    v17 = @"minimumUserPrivilege";
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v14, 0x20u);
  }
  if (!a4) {
    return 0;
  }
  objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"minimumUserPrivilege");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a4 = v12;
  return result;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKAirPlayAccessory"];
}

@end