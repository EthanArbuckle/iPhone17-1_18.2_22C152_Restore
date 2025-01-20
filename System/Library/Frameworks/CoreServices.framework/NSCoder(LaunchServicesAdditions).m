@interface NSCoder(LaunchServicesAdditions)
- (id)ls_decodeArrayWithValuesOfClass:()LaunchServicesAdditions forKey:;
- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClass:forKey:;
- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClasses:forKey:;
- (id)ls_decodeObjectOfClass:()LaunchServicesAdditions forKey:;
- (id)ls_decodeObjectOfClasses:()LaunchServicesAdditions forKey:;
- (id)ls_decodeSetWithValuesOfClass:()LaunchServicesAdditions forKey:;
@end

@implementation NSCoder(LaunchServicesAdditions)

- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClasses:forKey:
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v17[0] = objc_opt_class();
  v17[1] = a3;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v11 = [v8 setByAddingObjectsFromArray:v10];

  v12 = objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v11, v9);

  if (v12)
  {
    if (a3)
    {
      v13 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
      char v14 = _LSIsDictionaryWithKeysAndValuesOfClasses(v12, v13, v8);

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if ((_LSIsDictionaryWithKeysAndValuesOfClasses(v12, 0, v8) & 1) == 0)
    {
LABEL_4:

      v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4864, (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:]", 241, 0);
      [a1 failWithError:v15];

      v12 = 0;
    }
  }
LABEL_5:

  return v12;
}

- (id)ls_decodeObjectOfClass:()LaunchServicesAdditions forKey:
{
  uint64_t v10 = a3;
  v5 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithObjects:&v10 count:1];
  id v8 = objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v7, v6);

  return v8;
}

- (id)ls_decodeObjectOfClasses:()LaunchServicesAdditions forKey:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x18530F680]();
  if (_LSClassListContainsBundleRecord(v6))
  {
    id v9 = _LSDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[NSCoder(LaunchServicesAdditions) ls_decodeObjectOfClasses:forKey:](v9);
    }

    uint64_t v10 = [v6 setByAddingObject:objc_opt_class()];

    id v6 = (id)v10;
  }
  v11 = [a1 decodeObjectOfClasses:v6 forKey:v7];
  if (v11 && (_LSIsKindOfClasses(v11, v6) & 1) == 0)
  {

    v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4864, (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeObjectOfClasses:forKey:]", 197, 0);
    [a1 failWithError:v12];

    v11 = 0;
  }

  return v11;
}

- (id)ls_decodeSetWithValuesOfClass:()LaunchServicesAdditions forKey:
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = objc_msgSend(v6, "setWithObjects:", objc_opt_class(), a3, 0);
  id v9 = objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v8, v7);

  if (v9 && (_LSIsSetWithValuesOfClass(v9, a3) & 1) == 0)
  {

    uint64_t v10 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4864, (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeSetWithValuesOfClass:forKey:]", 222, 0);
    [a1 failWithError:v10];

    id v9 = 0;
  }

  return v9;
}

- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClass:forKey:
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  uint64_t v10 = [v8 setWithObject:a4];
  v11 = objc_msgSend(a1, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", a3, v10, v9);

  return v11;
}

- (id)ls_decodeArrayWithValuesOfClass:()LaunchServicesAdditions forKey:
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = objc_msgSend(v6, "setWithObjects:", objc_opt_class(), a3, 0);
  id v9 = objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v8, v7);

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
    char v11 = _LSIsArrayWithValuesOfClasses(v9, v10);

    if ((v11 & 1) == 0)
    {

      v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4864, (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeArrayWithValuesOfClass:forKey:]", 210, 0);
      [a1 failWithError:v12];

      id v9 = 0;
    }
  }

  return v9;
}

- (void)ls_decodeObjectOfClasses:()LaunchServicesAdditions forKey:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "Caller wants to code a (maybe bundle) record object, so allowing coding the Core Types proxy too.", v1, 2u);
}

@end