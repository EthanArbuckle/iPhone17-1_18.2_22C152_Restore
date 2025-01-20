@interface GDMention
+ (BOOL)supportsSecureCoding;
- (GDMention)initWithCoder:(id)a3;
- (GDMention)initWithSpan:(id)a3 entityClass:(id)a4 score:(id)a5;
- (GDMention)initWithSpan:(id)a3 entityClasses:(id)a4 score:(id)a5;
- (GDSpan)span;
- (NSArray)entityClasses;
- (NSNumber)score;
- (NSString)entityClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDMention

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_entityClasses, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);

  objc_storeStrong((id *)&self->_span, 0);
}

- (NSNumber)score
{
  return self->_score;
}

- (NSArray)entityClasses
{
  return self->_entityClasses;
}

- (NSString)entityClass
{
  return self->_entityClass;
}

- (GDSpan)span
{
  return self->_span;
}

- (GDMention)initWithSpan:(id)a3 entityClasses:(id)a4 score:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)GDMention;
  v15 = [(GDMention *)&v45 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    span = v15->_span;
    v15->_span = (GDSpan *)v16;

    if (objc_msgSend_count(v9, v18, v19, v20, v21))
    {
      v25 = objc_msgSend_objectAtIndexedSubscript_(v9, v22, 0, v23, v24);
      uint64_t v30 = objc_msgSend_copy(v25, v26, v27, v28, v29);
      entityClass = v15->_entityClass;
      v15->_entityClass = (NSString *)v30;
    }
    else
    {
      v25 = v15->_entityClass;
      v15->_entityClass = 0;
    }

    uint64_t v36 = objc_msgSend_copy(v9, v32, v33, v34, v35);
    entityClasses = v15->_entityClasses;
    v15->_entityClasses = (NSArray *)v36;

    uint64_t v42 = objc_msgSend_copy(v10, v38, v39, v40, v41);
    score = v15->_score;
    v15->_score = (NSNumber *)v42;
  }
  return v15;
}

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_span(self, a2, v2, v3, v4);
  uint64_t v12 = objc_msgSend_entityClasses(self, v8, v9, v10, v11);
  v17 = objc_msgSend_score(self, v13, v14, v15, v16);
  v22 = objc_msgSend_stringValue(v17, v18, v19, v20, v21);
  v26 = objc_msgSend_stringWithFormat_(v6, v23, @"<GDMention: span: %@, entityClasses: %@, score: %@>", v24, v25, v7, v12, v22);

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  span = self->_span;
  entityClass = self->_entityClass;
  score = self->_score;

  return (id)MEMORY[0x1F4181798](v9, sel_initWithSpan_entityClass_score_, span, entityClass, score);
}

- (GDMention)initWithCoder:(id)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_span);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v20 = objc_msgSend_setWithObjects_(v14, v17, v15, v18, v19, v16, 0);
    uint64_t v21 = NSStringFromSelector(sel_entityClasses);
    uint64_t v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21, v23);

    if (v24
      || (objc_msgSend_error(v4, v25, v26, v27, v28),
          v48 = objc_claimAutoreleasedReturnValue(),
          v48,
          !v48))
    {
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = NSStringFromSelector(sel_score);
      uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v29, (uint64_t)v30, v32);

      if (v33
        || (objc_msgSend_error(v4, v34, v35, v36, v37),
            v49 = objc_claimAutoreleasedReturnValue(),
            v49,
            !v49))
      {
        self = (GDMention *)(id)objc_msgSend_initWithSpan_entityClasses_score_(self, v34, (uint64_t)v9, (uint64_t)v24, (uint64_t)v33);
        v38 = self;
      }
      else
      {
        v38 = 0;
      }
    }
    else
    {
      v38 = 0;
    }
  }
  else
  {
    uint64_t v39 = objc_msgSend_error(v4, v10, v11, v12, v13);

    if (!v39)
    {
      uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52[0] = @"GDMention span is nil";
      uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v52, (uint64_t)&v51, 1);
      v44 = objc_msgSend_errorWithDomain_code_userInfo_(v41, v43, @"GDErrorDomain", 9, (uint64_t)v42);
      objc_msgSend_failWithError_(v4, v45, (uint64_t)v44, v46, v47);
    }
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

  entityClasses = self->_entityClasses;
  uint64_t v10 = NSStringFromSelector(sel_entityClasses);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)entityClasses, (uint64_t)v10, v12);

  score = self->_score;
  NSStringFromSelector(sel_score);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)score, (uint64_t)v16, v15);
}

- (GDMention)initWithSpan:(id)a3 entityClass:(id)a4 score:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)GDMention;
  uint64_t v15 = [(GDMention *)&v40 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    span = v15->_span;
    v15->_span = (GDSpan *)v16;

    uint64_t v22 = objc_msgSend_copy(v9, v18, v19, v20, v21);
    entityClass = v15->_entityClass;
    v15->_entityClass = (NSString *)v22;

    uint64_t v28 = objc_msgSend_copy(v9, v24, v25, v26, v27);
    v41[0] = v28;
    uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v29, (uint64_t)v41, 1, v30);
    entityClasses = v15->_entityClasses;
    v15->_entityClasses = (NSArray *)v31;

    uint64_t v37 = objc_msgSend_copy(v10, v33, v34, v35, v36);
    score = v15->_score;
    v15->_score = (NSNumber *)v37;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end