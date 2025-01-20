@interface CNUIDraftSupport
+ (id)loadDraft:(id)a3;
+ (id)loadNewContactDraft;
+ (void)deleteDrafts;
+ (void)saveNewContactDraft:(id)a3;
@end

@implementation CNUIDraftSupport

+ (id)loadNewContactDraft
{
  return +[CNUIDraftSupport loadDraft:@"/var/mobile/Library/AddressBook/NewContactDraft.cncontact"];
}

+ (id)loadDraft:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3];
  if (v4)
  {
    id v17 = 0;
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:&v17];
    id v6 = v17;
    v7 = v6;
    if (v5)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *MEMORY[0x1E4F284E8];
      id v16 = v7;
      v10 = [v5 decodeTopLevelObjectOfClass:v8 forKey:v9 error:&v16];
      id v11 = v16;

      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        v13 = CNUILogContactCard();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v11;
          _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Error unarchiving draft contact: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v10 = 0;
      id v11 = v6;
    }
    [a1 deleteDrafts];
  }
  else
  {
    id v11 = 0;
    v10 = 0;
  }
  id v14 = v10;

  return v14;
}

+ (void)deleteDrafts
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  [v2 removeItemAtPath:@"/var/mobile/Library/AddressBook/NewContactDraft.cncontact" error:&v7];
  id v3 = v7;

  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = v3;
  [v4 removeItemAtPath:@"/var/mobile/Library/AddressBook/EditedContactDraft.cncontact" error:&v6];
  id v5 = v6;
}

+ (void)saveNewContactDraft:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  id v4 = v6;
  if (v3)
  {
    [v3 writeToFile:@"/var/mobile/Library/AddressBook/NewContactDraft.cncontact" atomically:0];
  }
  else
  {
    id v5 = CNUILogContactCard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_error_impl(&dword_18B625000, v5, OS_LOG_TYPE_ERROR, "Error archiving edited contact: %@", buf, 0xCu);
    }
  }
}

@end