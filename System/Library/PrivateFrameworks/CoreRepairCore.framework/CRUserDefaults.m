@interface CRUserDefaults
- (BOOL)BOOLForKey:(id)a3;
- (CRUserDefaults)initWithSuiteName:(id)a3;
- (NSDictionary)defaultValues;
- (NSString)suiteName;
- (id)dictionaryForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)setDefaultValues:(id)a3;
- (void)setSuiteName:(id)a3;
@end

@implementation CRUserDefaults

- (CRUserDefaults)initWithSuiteName:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CRUserDefaults;
  v6 = [(CRUserDefaults *)&v42 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suiteName, a3);
    if (os_variant_has_internal_content())
    {
      v8 = NSString;
      uint64_t v9 = getuid();
      v12 = objc_msgSend_stringWithFormat_(v8, v10, @"%d", v11, v9);
      v15 = objc_msgSend_stringWithFormat_(NSString, v13, @"%@.plist", v14, v5);
      v18 = objc_msgSend_stringByAppendingPathComponent_(@"/var/MobileSoftwareUpdate/Controller/RepairServices", v16, @"defaults", v17);
      v21 = objc_msgSend_stringByAppendingPathComponent_(v18, v19, (uint64_t)v12, v20);
      v24 = objc_msgSend_stringByAppendingPathComponent_(v21, v22, (uint64_t)v15, v23);

      v28 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v25, v26, v27);
      LODWORD(v21) = objc_msgSend_fileExistsAtPath_(v28, v29, (uint64_t)v24, v30);

      if (v21)
      {
        v33 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v31, (uint64_t)v24, v32);
        id v41 = 0;
        uint64_t v35 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v34, (uint64_t)v33, 0, 0, &v41);
        id v36 = v41;
        defaultValues = v7->_defaultValues;
        v7->_defaultValues = (NSDictionary *)v35;

        v38 = handleForCategory(0);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v24;
          _os_log_impl(&dword_21FBF2000, v38, OS_LOG_TYPE_DEFAULT, "Read defaults from: %@", buf, 0xCu);
        }

        if (v36)
        {
          v39 = handleForCategory(0);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_21FC5C96C((uint64_t)v36, v39);
          }
        }
      }
    }
  }

  return v7;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  v8 = objc_msgSend_initWithSuiteName_(v5, v6, (uint64_t)self->_suiteName, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  if (v11)
  {
    id v14 = v11;
LABEL_5:
    v16 = v14;
    goto LABEL_6;
  }
  defaultValues = self->_defaultValues;
  if (defaultValues)
  {
    objc_msgSend_objectForKey_(defaultValues, v12, (uint64_t)v4, v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v16 = 0;
LABEL_6:

  return v16;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = objc_msgSend_stringValue(v4, v5, v6, v7);
    }
    else
    {
      uint64_t v8 = 0;
    }

    id v4 = (void *)v8;
  }
  return v4;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_msgSend_isEqualToString_(v4, v5, @"YES", v6))
    {
      char v10 = 1;
    }
    else
    {
      uint64_t v14 = objc_msgSend_length(v4, v7, v8, v9);
      char v10 = 1;
      if (objc_msgSend_compare_options_range_(v4, v15, @"YES", 1, 0, v14))
      {
        uint64_t v17 = objc_msgSend_compare_options_range_(v4, v16, @"Y", 1, 0, v14);
        char v10 = v17 == 0;
        if (v17) {
          char v10 = objc_msgSend_integerValue(v4, v18, v19, v20) != 0;
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v10 = objc_msgSend_BOOLValue(v4, v11, v12, v13);
    }
    else {
      char v10 = 0;
    }
  }

  return v10;
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void)setDefaultValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
}

@end