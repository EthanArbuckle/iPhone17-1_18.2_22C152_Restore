@interface AVTAvatarManagedRecordTransformer
- (id)identifierForManagedRecordIdentifier:(id)a3;
- (id)managedRecordIdentifierForIdentifier:(id)a3;
- (id)recordWithManagedRecord:(id)a3 error:(id *)a4;
- (void)updateManagedRecord:(id)a3 withRecord:(id)a4;
@end

@implementation AVTAvatarManagedRecordTransformer

- (id)managedRecordIdentifierForIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  return v5;
}

- (id)identifierForManagedRecordIdentifier:(id)a3
{
  return (id)[a3 UUIDString];
}

- (void)updateManagedRecord:(id)a3 withRecord:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 identifier];
  v9 = [(AVTAvatarManagedRecordTransformer *)self managedRecordIdentifierForIdentifier:v8];
  [v7 setIdentifier:v9];

  v10 = [v6 avatarData];
  [v7 setAvatarData:v10];

  id v11 = [v6 orderDate];

  [v7 setOrderDate:v11];
}

- (id)recordWithManagedRecord:(id)a3 error:(id *)a4
{
  v26[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (!a4)
    {
      v16 = 0;
      goto LABEL_14;
    }
    v25[0] = *MEMORY[0x263F08338];
    v25[1] = @"InvalidClass";
    v26[0] = @"Record identifier is not of type NSUUID";
    v17 = NSString;
    v10 = [v6 identifier];
    v18 = [(id)objc_opt_class() description];
    v19 = [v17 stringWithFormat:@"%@", v18];
    v26[1] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    *a4 = +[AVTError errorWithCode:703 userInfo:v20];

    goto LABEL_12;
  }
  v9 = [v6 identifier];
  v10 = [(AVTAvatarManagedRecordTransformer *)self identifierForManagedRecordIdentifier:v9];

  if (!v10)
  {
    if (a4)
    {
      uint64_t v23 = *MEMORY[0x263F08338];
      v24 = @"Record has a nil identifier";
      v21 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      *a4 = +[AVTError errorWithCode:701 userInfo:v21];
    }
    goto LABEL_12;
  }
  id v11 = [v6 avatarData];
  BOOL v12 = +[AVTAvatarRecord canLoadAvatarWithData:v11];

  if (!v12)
  {
    if (a4)
    {
      +[AVTError errorWithCode:702 userInfo:0];
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  v13 = [AVTAvatarRecord alloc];
  v14 = [v6 avatarData];
  v15 = [v6 orderDate];
  v16 = [(AVTAvatarRecord *)v13 initWithAvatarData:v14 identifier:v10 orderDate:v15];

LABEL_13:
LABEL_14:

  return v16;
}

@end