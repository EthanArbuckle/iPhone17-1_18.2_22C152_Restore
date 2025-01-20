@interface BUDescription
+ (id)descriptionWithCFType:(void *)a3 format:(id)a4;
+ (id)descriptionWithObject:(id)a3;
+ (id)descriptionWithObject:(id)a3 class:(Class)a4;
+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5;
+ (id)descriptionWithObject:(id)a3 format:(id)a4;
- (BUDescription)initWithCFType:(void *)a3 header:(id)a4;
- (BUDescription)initWithObject:(id)a3;
- (BUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5;
- (BUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6;
- (BUDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5;
- (BUDescription)initWithObject:(id)a3 format:(id)a4;
- (NSString)descriptionString;
- (id)p_header;
- (void)addField:(id)a3 format:(id)a4;
- (void)addField:(id)a3 value:(id)a4;
- (void)addFieldValue:(id)a3;
- (void)addFieldWithFormat:(id)a3;
- (void)addSuperDescription;
- (void)setFieldOptionCommaSeparated;
@end

@implementation BUDescription

- (BUDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  ++qword_267D29878;
  v17.receiver = self;
  v17.super_class = (Class)BUDescription;
  v10 = [(BUDescription *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_object, v8);
    v11->_class = a4;
    uint64_t v14 = objc_msgSend_copy(v9, v12, v13);
    header = v11->_header;
    v11->_header = (NSString *)v14;
  }
  return v11;
}

- (BUDescription)initWithCFType:(void *)a3 header:(id)a4
{
  id v6 = a4;
  ++qword_267D29878;
  v14.receiver = self;
  v14.super_class = (Class)BUDescription;
  v7 = [(BUDescription *)&v14 init];
  v10 = v7;
  if (v7)
  {
    v7->_cfType = a3;
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    header = v10->_header;
    v10->_header = (NSString *)v11;
  }
  return v10;
}

- (BUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6
{
  v10 = (objc_class *)NSString;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 alloc];
  v15 = objc_msgSend_initWithFormat_arguments_(v13, v14, (uint64_t)v11, a6);

  objc_super v17 = (BUDescription *)objc_msgSend_initWithObject_class_header_(self, v16, (uint64_t)v12, a4, v15);
  return v17;
}

- (BUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  return (BUDescription *)objc_msgSend_initWithObject_class_format_arguments_(self, a2, (uint64_t)a3, a4, a5, &v6);
}

- (BUDescription)initWithObject:(id)a3 format:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  Class Class = object_getClass(v7);
  v10 = (BUDescription *)objc_msgSend_initWithObject_class_format_arguments_(self, v9, (uint64_t)v7, Class, v6, &v12);

  return v10;
}

- (BUDescription)initWithObject:(id)a3
{
  id v4 = a3;
  Class Class = object_getClass(v4);
  id v7 = (BUDescription *)objc_msgSend_initWithObject_class_format_(self, v6, (uint64_t)v4, Class, &stru_26CF11AD8);

  return v7;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [BUDescription alloc];
  id v11 = objc_msgSend_initWithObject_class_format_arguments_(v9, v10, (uint64_t)v8, a4, v7, &v14);

  return v11;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4
{
  id v5 = a3;
  id v6 = [BUDescription alloc];
  id v8 = objc_msgSend_initWithObject_class_format_(v6, v7, (uint64_t)v5, a4, &stru_26CF11AD8);

  return v8;
}

+ (id)descriptionWithObject:(id)a3 format:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [BUDescription alloc];
  Class Class = object_getClass(v6);
  v10 = objc_msgSend_initWithObject_class_format_arguments_(v7, v9, (uint64_t)v6, Class, v5, &v13);

  return v10;
}

+ (id)descriptionWithCFType:(void *)a3 format:(id)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = [v5 alloc];
  uint64_t v9 = objc_msgSend_initWithFormat_arguments_(v7, v8, (uint64_t)v6, &v15);

  v10 = [BUDescription alloc];
  uint64_t v12 = objc_msgSend_initWithCFType_header_(v10, v11, (uint64_t)a3, v9);

  return v12;
}

+ (id)descriptionWithObject:(id)a3
{
  return (id)objc_msgSend_descriptionWithObject_format_(a1, a2, (uint64_t)a3, &stru_26CF11AD8);
}

- (id)p_header
{
  p_object = &self->_object;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  if (WeakRetained)
  {
    id v5 = NSString;
    Name = class_getName(self->_class);
    id v7 = objc_loadWeakRetained((id *)p_object);
    objc_msgSend_stringWithFormat_(v5, v8, @"(%s*)%p%@", Name, v7, self->_header);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    cfType = self->_cfType;
    if (cfType)
    {
      CFTypeID v11 = CFGetTypeID(cfType);
      CFStringRef v12 = CFCopyTypeIDDescription(v11);
      objc_msgSend_stringWithFormat_(NSString, v13, @"(%@Ref)%p%@", v12, self->_cfType, self->_header);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease(v12);
    }
    else
    {
      uint64_t v9 = @"(void*)nil";
    }
  }

  return v9;
}

- (void)addField:(id)a3 value:(id)a4
{
  id v6 = a3;
  uint64_t v9 = (__CFString *)a4;
  if (!self->_fields)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    fields = self->_fields;
    self->_fields = v10;

    CFStringRef v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    fieldOrder = self->_fieldOrder;
    self->_fieldOrder = v12;
  }
  if (!v9) {
    uint64_t v9 = @"nil";
  }
  if (v6 && objc_msgSend_length(v6, v7, v8))
  {
    objc_msgSend_stringWithFormat_(NSString, v7, @"%@: ", v6);
  }
  else
  {
    uint64_t v14 = NSString;
    uint64_t v22 = objc_msgSend_count(self->_fields, v7, v8);
    objc_msgSend_stringWithFormat_(v14, v15, @"$$$%lu", v22);
  }
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(self->_fieldOrder, v16, (uint64_t)v23);
  objc_msgSend_setObject_forKey_(self->_fields, v17, (uint64_t)v9, v23);
  if ((objc_msgSend_hasPrefix_(v23, v18, @"$$$") & 1) == 0)
  {
    unint64_t v21 = objc_msgSend_length(v23, v19, v20);
    if (v21 > self->_fieldNameWidth) {
      self->_fieldNameWidth = v21;
    }
  }
}

- (void)addField:(id)a3 format:(id)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  CFTypeID v11 = objc_msgSend_initWithFormat_arguments_(v9, v10, (uint64_t)v7, &v13);

  objc_msgSend_addField_value_(self, v12, (uint64_t)v8, v11);
}

- (void)addFieldWithFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  id v8 = objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v5, &v10);

  objc_msgSend_addField_value_(self, v9, 0, v8);
}

- (void)addFieldValue:(id)a3
{
}

- (void)addSuperDescription
{
  v5.receiver = objc_loadWeakRetained((id *)&self->_object);
  v5.super_class = class_getSuperclass(self->_class);

  v3 = [(BUDescription *)&v5 description];
  objc_msgSend_addFieldValue_(self, v4, (uint64_t)v3, v5.receiver, v5.super_class);
}

- (void)setFieldOptionCommaSeparated
{
  self->_commaSeparated = 1;
}

- (NSString)descriptionString
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = &OBJC_IVAR___BUZipEntry__name;
  if (!self->_fields) {
    goto LABEL_5;
  }
  if ((unint64_t)qword_267D29878 < 5)
  {
    CFTypeID v11 = (void *)MEMORY[0x263F089D8];
    CFStringRef v12 = objc_msgSend_p_header(self, a2, v2);
    uint64_t v10 = objc_msgSend_stringWithFormat_(v11, v13, @"%@ {", v12);

    id v53 = objc_alloc_init(MEMORY[0x263F089D8]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v14 = self->_fieldOrder;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v54, v58, 16);
    if (v16)
    {
      uint64_t v18 = v16;
      v49 = v10;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      unint64_t v21 = &stru_26CF11AD8;
      uint64_t v22 = *(void *)v55;
      uint64_t v51 = *(void *)v55;
      do
      {
        uint64_t v23 = 0;
        uint64_t v50 = v20;
        uint64_t v24 = v20 + 1;
        v25 = v21;
        uint64_t v52 = v24;
        do
        {
          if (*(void *)v55 != v22) {
            objc_enumerationMutation(v14);
          }
          if ((unint64_t)(v24 + v23) > 0x63)
          {
            ++v19;
          }
          else
          {
            v26 = v14;
            v27 = *(void **)(*((void *)&v54 + 1) + 8 * v23);
            v28 = objc_msgSend_objectForKey_(self->_fields, v17, (uint64_t)v27);
            v31 = objc_msgSend_mutableCopy(v28, v29, v30);

            v32 = v27;
            objc_msgSend_bu_indentBy_(v31, v33, self->_fieldNameWidth);
            if (objc_msgSend_hasPrefix_(v32, v34, @"$$$"))
            {

              v32 = &stru_26CF11AD8;
            }
            uint64_t v37 = objc_msgSend_length(v32, v35, v36);
            objc_msgSend_replaceCharactersInRange_withString_(v31, v38, 0, v37, v32);
            objc_msgSend_appendFormat_(v53, v39, @"%@%@", v25, v31);

            uint64_t v14 = v26;
            uint64_t v22 = v51;
            uint64_t v24 = v52;
          }
          v40 = @"\n";
          if (self->_commaSeparated) {
            v40 = @",\n";
          }
          unint64_t v21 = v40;

          ++v23;
          v25 = v21;
        }
        while (v18 != v23);
        uint64_t v20 = v50 + v18;
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v54, v58, 16);
      }
      while (v18);

      if (v19)
      {
        v42 = "";
        if (v19 != 1) {
          v42 = "s";
        }
        objc_msgSend_appendFormat_(v53, v41, @"%@...omitting %lu field%s (set to truncate after %lu field%s)", v21, v19, v42, 99, "s");
      }
      id v4 = &OBJC_IVAR___BUZipEntry__name;
      uint64_t v10 = v49;
    }
    else
    {

      unint64_t v21 = &stru_26CF11AD8;
    }
    while ((objc_msgSend_hasSuffix_(v53, v41, @"\n") & 1) != 0
         || objc_msgSend_hasSuffix_(v53, v43, @" "))
    {
      uint64_t v45 = objc_msgSend_length(v53, v43, v44);
      objc_msgSend_deleteCharactersInRange_(v53, v46, v45 - 1, 1);
    }
    id v7 = v53;
    objc_msgSend_bu_indentBy_(v53, v43, 2);
    objc_msgSend_appendFormat_(v10, v47, @"\n%@\n}", v53);

    goto LABEL_30;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
LABEL_5:
    uint64_t v10 = objc_msgSend_p_header(self, a2, v2);
    goto LABEL_31;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_object);
  uint64_t v10 = objc_msgSend_shortDescription(v7, v8, v9);
LABEL_30:

LABEL_31:
  --*((void *)v4 + 271);

  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldOrder, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_header, 0);

  objc_destroyWeak((id *)&self->_object);
}

@end