@interface MKFCKPhotosPerson
+ (id)fetchRequest;
+ (id)rootKeyPath;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)validateUser:(id *)a3 error:(id *)a4;
- (id)home;
@end

@implementation MKFCKPhotosPerson

- (BOOL)validateUser:(id *)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(MKFCKModel *)self shouldSkipValidationDuringImport]) {
    return 1;
  }
  id v7 = *a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (v7) {
      return 1;
    }
  }
  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = HMFGetLogIdentifier();
    id v14 = *a3;
    int v16 = 138543874;
    v17 = v13;
    __int16 v18 = 2114;
    v19 = @"user";
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid value for %{public}@: %@", (uint8_t *)&v16, 0x20u);
  }
  objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"user");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a4 = v15;
  return result;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 user];
  if ([v11 isOwner])
  {
    v21.receiver = self;
    v21.super_class = (Class)MKFCKPhotosPerson;
    if (![(MKFCKPerson *)&v21 exportFromLocalModel:v8 updatedProperties:v9 context:v10])
    {
      BOOL v19 = 0;
      goto LABEL_16;
    }
    v12 = +[MKFCKModel fetchWithLocalModel:v11 context:v10];
    if (v12)
    {
      v13 = [(MKFCKPhotosPerson *)self user];
      char v14 = [v13 isEqual:v12];

      if ((v14 & 1) == 0) {
        [(MKFCKPhotosPerson *)self setUser:v12];
      }
      id v15 = [v8 linkedHomePerson];
      if (v15)
      {
        int v16 = +[MKFCKModel fetchWithLocalModel:v15 context:v10];
        if (v16)
        {
          v17 = [(MKFCKPhotosPerson *)self linkedHomePerson];
          char v18 = HMFEqualObjects();

          if ((v18 & 1) == 0) {
            [(MKFCKPhotosPerson *)self setLinkedHomePerson:v16];
          }
        }
      }
    }
  }
  else
  {
    [v10 deleteObject:self];
  }
  BOOL v19 = 1;
LABEL_16:

  return v19;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MKFCKPhotosPerson;
  BOOL v10 = [(MKFCKPerson *)&v20 importIntoLocalModel:v8 updatedProperties:a4 context:v9];
  if (v10)
  {
    v11 = [(MKFCKPhotosPerson *)self user];
    v12 = [v11 fetchLocalModelWithContext:v9];

    if (v12)
    {
      v13 = [v8 user];
      char v14 = HMFEqualObjects();

      if ((v14 & 1) == 0) {
        [v8 setUser:v12];
      }
      id v15 = [(MKFCKPhotosPerson *)self linkedHomePerson];
      int v16 = [v15 fetchLocalModelWithContext:v9];
      v17 = [v8 linkedHomePerson];
      char v18 = HMFEqualObjects();

      if ((v18 & 1) == 0) {
        [v8 setLinkedHomePerson:v16];
      }
    }
  }

  return v10;
}

- (id)home
{
  v2 = [(MKFCKPhotosPerson *)self user];
  v3 = [v2 home];

  return v3;
}

+ (id)rootKeyPath
{
  return @"user.home";
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKPhotosPerson"];
}

@end