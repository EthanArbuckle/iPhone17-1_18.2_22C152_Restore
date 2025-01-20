@interface NSManagedObject(HomeKitDaemon)
+ (id)hmd_errorForInvalidValue:()HomeKitDaemon key:;
+ (uint64_t)hmd_validateCharacteristicValue:()HomeKitDaemon key:error:;
+ (uint64_t)hmd_validateNumber:()HomeKitDaemon key:error:;
+ (uint64_t)hmd_validateUUID:()HomeKitDaemon key:error:;
- (BOOL)mkf_synchronizeRelation:()HomeKitDaemon items:allowCreation:;
- (__CFString)mkf_findRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:;
- (id)hmd_debugIdentifier;
- (id)mkf_createRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:relationship:relation:;
- (id)mkf_materializeOrCreateRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:createdNew:;
- (uint64_t)hmd_validateCharacteristicValue:()HomeKitDaemon key:error:;
- (uint64_t)hmd_validateNumber:()HomeKitDaemon key:error:;
- (uint64_t)hmd_validateUUID:()HomeKitDaemon key:error:;
- (uint64_t)mkf_createRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:;
- (void)mkf_addToRelationship:()HomeKitDaemon object:;
- (void)mkf_removeFromRelationship:()HomeKitDaemon object:;
@end

@implementation NSManagedObject(HomeKitDaemon)

- (__CFString)mkf_findRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v11 = NSProtocolFromString(v9);
  v12 = +[HMCContext managedObjectClassFromProtocol:v11];
  v13 = [(objc_class *)v12 entity];
  v14 = __keyNameForEntity(v13);

  id v15 = [a1 valueForKey:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v15 && !v17)
  {
    v20 = (void *)_HMFPreconditionFailure();
    return __keyNameForEntity(v20);
  }
  else
  {
    v18 = __findObjectInSet(v17, v14, v10, (uint64_t)v12);

    return (__CFString *)v18;
  }
}

- (void)mkf_removeFromRelationship:()HomeKitDaemon object:
{
  id v9 = a3;
  id v6 = a4;
  v7 = [a1 valueForKey:v9];
  id v8 = (void *)[v7 mutableCopy];

  if (v8)
  {
    [v8 removeObject:v6];
    [a1 setValue:v8 forKey:v9];
  }
}

- (void)mkf_addToRelationship:()HomeKitDaemon object:
{
  id v21 = a3;
  id v6 = a4;
  v7 = [a1 valueForKey:v21];
  id v8 = (void *)[v7 mutableCopy];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x263EFF9C0] set];
  }
  v11 = v10;

  id v12 = v11;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || !v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = [a1 entity];
  id v15 = [v14 relationshipsByName];
  v16 = [v15 objectForKey:v21];

  id v17 = [v16 destinationEntity];
  v18 = [v17 managedObjectClassName];
  NSClassFromString(v18);
  char v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) == 0)
  {
LABEL_11:
    uint64_t v20 = _HMFPreconditionFailure();
    -[NSManagedObject(HomeKitDaemon) mkf_synchronizeRelation:items:allowCreation:](v20);
    return;
  }
  [v12 addObject:v6];
  [a1 setValue:v12 forKey:v21];
}

- (BOOL)mkf_synchronizeRelation:()HomeKitDaemon items:allowCreation:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 entity];
  v11 = [v10 relationshipsByName];
  id v12 = [v11 objectForKey:v8];

  if (!v12 || ([v12 isToMany] & 1) == 0)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  v13 = [a1 valueForKey:v8];
  if (!v13)
  {
    v13 = [MEMORY[0x263EFFA08] set];
  }
  id v14 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (!v16)
  {
LABEL_14:
    v26 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v37, 8);
    _Unwind_Resume(v26);
  }
  id v17 = [MEMORY[0x263EFF9C0] set];
  v18 = [MEMORY[0x263EFF9A0] dictionary];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke;
  v41[3] = &unk_264A23310;
  id v19 = v18;
  id v42 = v19;
  objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v41);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke_2;
  v30 = &unk_264A1A8E8;
  id v20 = v19;
  char v36 = a5;
  id v31 = v20;
  v32 = a1;
  id v21 = v12;
  id v33 = v21;
  v35 = &v37;
  id v22 = v17;
  id v34 = v22;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v27);
  int v23 = *((unsigned __int8 *)v38 + 24);
  if (*((unsigned char *)v38 + 24))
  {
    v24 = objc_msgSend(v20, "allValues", v27, v28, v29, v30, v31, v32, v33);
    objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &__block_literal_global_51261);

    if (([v22 isEqualToSet:v16] & 1) == 0) {
      [a1 setValue:v22 forKey:v8];
    }
  }

  _Block_object_dispose(&v37, 8);
  return v23 != 0;
}

- (id)mkf_materializeOrCreateRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:createdNew:
{
  id v10 = a3;
  v11 = a4;
  id v12 = a5;
  v13 = [a1 entity];
  id v14 = [v13 relationshipsByName];
  id v15 = [v14 objectForKey:v10];

  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_32;
  }
  if (a6) {
    *a6 = 0;
  }
  id v16 = NSProtocolFromString(v11);
  id v17 = +[HMCContext managedObjectClassFromProtocol:v16];
  id v18 = [a1 valueForKey:v10];
  if (![v15 isToMany])
  {
    if (!v12)
    {
      if (!v18)
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v32 = [(objc_class *)v17 modelIDForParentRelationshipTo:a1];
          if (v32)
          {
            id v12 = (id)v32;
            id v18 = 0;
            if (!a6) {
              goto LABEL_23;
            }
            goto LABEL_22;
          }
        }
LABEL_35:
        uint64_t v33 = _HMFPreconditionFailure();
        return (id)-[NSManagedObject(HomeKitDaemon) mkf_createRelationOnProperty:modelProtocol:keyValue:](v33);
      }
      if ([(id)objc_opt_class() isSubclassOfClass:v17])
      {
        id v18 = v18;
        v25 = v18;
        goto LABEL_24;
      }
LABEL_34:
      _HMFPreconditionFailure();
      goto LABEL_35;
    }
    if (!v18) {
      goto LABEL_21;
    }
    v26 = v16;
    uint64_t v27 = [v18 entity];
    uint64_t v28 = __keyNameForEntity(v27);

    v29 = [v18 valueForKey:v28];
    char v30 = [v29 isEqual:v12];

    if (v30)
    {
      id v18 = v18;

      v25 = v18;
      id v16 = v26;
      goto LABEL_24;
    }
LABEL_33:
    _HMFPreconditionFailure();
    goto LABEL_34;
  }
  v35 = v11;
  if (!v18)
  {
    id v18 = [MEMORY[0x263EFFA08] set];
  }
  id v18 = v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  if (!v20)
  {
LABEL_32:
    _HMFPreconditionFailure();
    goto LABEL_33;
  }
  id v34 = a6;
  id v21 = v10;
  id v22 = v16;
  int v23 = [(objc_class *)v17 entity];
  v24 = __keyNameForEntity(v23);
  v25 = __findObjectInSet(v20, v24, v12, (uint64_t)v17);

  if (!v25)
  {
    id v16 = v22;
    id v10 = v21;
    a6 = v34;
    v11 = v35;
LABEL_21:
    if (!a6)
    {
LABEL_23:
      v25 = objc_msgSend(a1, "mkf_createRelationOnProperty:modelProtocol:keyValue:relationship:relation:", v10, v11, v12, v15, v18);

      goto LABEL_24;
    }
LABEL_22:
    *a6 = 1;
    goto LABEL_23;
  }

  v11 = v35;
  id v16 = v22;
  id v10 = v21;
LABEL_24:

  return v25;
}

- (uint64_t)mkf_createRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:
{
  return objc_msgSend(a1, "mkf_createRelationOnProperty:modelProtocol:keyValue:relationship:relation:", a3, a4, a5, 0, 0);
}

- (id)mkf_createRelationOnProperty:()HomeKitDaemon modelProtocol:keyValue:relationship:relation:
{
  id v12 = a3;
  v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    id v22 = [a1 entity];
    int v23 = [v22 relationshipsByName];
    id v15 = [v23 objectForKey:v12];

    if (v17) {
      goto LABEL_3;
    }
  }
  id v17 = [a1 valueForKey:v12];
LABEL_3:
  id v18 = NSProtocolFromString(v13);
  id v19 = __createNewObject(a1, +[HMCContext managedObjectClassFromProtocol:v18], v15, v14);
  if ([v15 isToMany])
  {
    if (!v17)
    {
      id v17 = [MEMORY[0x263EFFA08] set];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v24 = _HMFPreconditionFailure();
      return (id)-[NSManagedObject(HomeKitDaemon) hmd_debugIdentifier](v24);
    }
    id v20 = (void *)[v17 mutableCopy];
    [v20 addObject:v19];
    [a1 setValue:v20 forKey:v12];
  }
  else
  {
    [a1 setValue:v19 forKey:v12];
  }

  return v19;
}

- (id)hmd_debugIdentifier
{
  v1 = [a1 objectID];
  v2 = objc_msgSend(v1, "hmd_debugIdentifier");

  return v2;
}

- (uint64_t)hmd_validateCharacteristicValue:()HomeKitDaemon key:error:
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "hmd_validateCharacteristicValue:key:error:", v8, v7, a5);

  return v9;
}

- (uint64_t)hmd_validateNumber:()HomeKitDaemon key:error:
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "hmd_validateNumber:key:error:", v8, v7, a5);

  return v9;
}

- (uint64_t)hmd_validateUUID:()HomeKitDaemon key:error:
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "hmd_validateUUID:key:error:", v8, v7, a5);

  return v9;
}

+ (uint64_t)hmd_validateCharacteristicValue:()HomeKitDaemon key:error:
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = isAllowedCharType();
  uint64_t v11 = v10;
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(a1, "hmd_errorForInvalidValue:key:", v8, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (uint64_t)hmd_validateNumber:()HomeKitDaemon key:error:
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  uint64_t v10 = objc_opt_isKindOfClass() & (v8 != 0);
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(a1, "hmd_errorForInvalidValue:key:", v8, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (uint64_t)hmd_validateUUID:()HomeKitDaemon key:error:
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  uint64_t v10 = objc_opt_isKindOfClass() & (v8 != 0);
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(a1, "hmd_errorForInvalidValue:key:", v8, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)hmd_errorForInvalidValue:()HomeKitDaemon key:
{
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = NSStringFromClass(a1);
  uint64_t v10 = [v6 stringWithFormat:@"%@.%@ is invalid: %@", v9, v7, v8];

  uint64_t v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:3 reason:v10];

  return v11;
}

@end