@interface GDRankerResult
+ (BOOL)supportsSecureCoding;
- (GDRankerResult)initWithCoder:(id)a3;
- (GDRankerResult)initWithRankedEntities:(id)a3;
- (GDRankerResult)initWithSpan:(id)a3 rankedEntities:(id)a4 entityClass:(id)a5;
- (GDSpan)span;
- (NSArray)rankedItems;
- (NSString)entityClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDRankerResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedItems, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);

  objc_storeStrong((id *)&self->_span, 0);
}

- (NSArray)rankedItems
{
  return self->_rankedItems;
}

- (NSString)entityClass
{
  return self->_entityClass;
}

- (GDSpan)span
{
  return self->_span;
}

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_span(self, a2, v2, v3, v4);
  v12 = objc_msgSend_rankedItems(self, v8, v9, v10, v11);
  v16 = objc_msgSend_stringWithFormat_(v6, v13, @"<GDRankerResult: span: %@, entities: %@>", v14, v15, v7, v12);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  entityClass = self->_entityClass;
  rankedItems = self->_rankedItems;
  span = self->_span;

  return (id)objc_msgSend_initWithSpan_rankedEntities_entityClass_(v9, v10, (uint64_t)span, (uint64_t)rankedItems, (uint64_t)entityClass);
}

- (GDRankerResult)initWithCoder:(id)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_span);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9
    || (objc_msgSend_error(v4, v10, v11, v12, v13),
        v39 = objc_claimAutoreleasedReturnValue(),
        v39,
        !v39))
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v20 = objc_msgSend_setWithObjects_(v14, v17, v15, v18, v19, v16, 0);
    v21 = NSStringFromSelector(sel_rankedItems);
    v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21, v23);

    if (v24)
    {
      uint64_t v29 = objc_opt_class();
      v30 = NSStringFromSelector(sel_entityClass);
      v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v29, (uint64_t)v30, v32);

      if (v33
        || (objc_msgSend_error(v4, v34, v35, v36, v37),
            v49 = objc_claimAutoreleasedReturnValue(),
            v49,
            !v49))
      {
        self = (GDRankerResult *)(id)objc_msgSend_initWithSpan_rankedEntities_entityClass_(self, v34, (uint64_t)v9, (uint64_t)v24, (uint64_t)v33);
        v38 = self;
      }
      else
      {
        v38 = 0;
      }
    }
    else
    {
      v40 = objc_msgSend_error(v4, v25, v26, v27, v28);

      if (!v40)
      {
        v42 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v51 = *MEMORY[0x1E4F28568];
        v52[0] = @"GDRankerResult rankedEntities is nil";
        v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)v52, (uint64_t)&v51, 1);
        v45 = objc_msgSend_errorWithDomain_code_userInfo_(v42, v44, @"GDErrorDomain", 9, (uint64_t)v43);
        objc_msgSend_failWithError_(v4, v46, (uint64_t)v45, v47, v48);
      }
      v38 = 0;
    }
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (void)encodeWithCoder:(id)a3
{
  span = self->_span;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_span);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)span, (uint64_t)v6, v8);

  rankedItems = self->_rankedItems;
  uint64_t v10 = NSStringFromSelector(sel_rankedItems);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)rankedItems, (uint64_t)v10, v12);

  entityClass = self->_entityClass;
  NSStringFromSelector(sel_entityClass);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)entityClass, (uint64_t)v16, v15);
}

- (GDRankerResult)initWithRankedEntities:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDRankerResult;
  uint64_t v9 = [(GDRankerResult *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    rankedItems = v9->_rankedItems;
    v9->_rankedItems = (NSArray *)v10;
  }
  return v9;
}

- (GDRankerResult)initWithSpan:(id)a3 rankedEntities:(id)a4 entityClass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)GDRankerResult;
  uint64_t v15 = [(GDRankerResult *)&v31 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    span = v15->_span;
    v15->_span = (GDSpan *)v16;

    uint64_t v22 = objc_msgSend_copy(v9, v18, v19, v20, v21);
    rankedItems = v15->_rankedItems;
    v15->_rankedItems = (NSArray *)v22;

    uint64_t v28 = objc_msgSend_copy(v10, v24, v25, v26, v27);
    entityClass = v15->_entityClass;
    v15->_entityClass = (NSString *)v28;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end