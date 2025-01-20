@interface GDEntityResolutionResult
+ (BOOL)supportsSecureCoding;
- (GDEntityResolutionResult)initWithCoder:(id)a3;
- (GDEntityResolutionResult)initWithRankedResults:(id)a3;
- (NSArray)rankedResults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDEntityResolutionResult

- (void).cxx_destruct
{
}

- (NSArray)rankedResults
{
  return self->_rankedResults;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_rankedResults(self, a2, v2, v3, v4);
  v10 = objc_msgSend_stringWithFormat_(v5, v7, @"<GDEntityResolutionResult: %@>", v8, v9, v6);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  rankedResults = self->_rankedResults;

  return (id)objc_msgSend_initWithRankedResults_(v9, v10, (uint64_t)rankedResults, v11, v12);
}

- (GDEntityResolutionResult)initWithCoder:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v11 = objc_msgSend_setWithObjects_(v5, v8, v6, v9, v10, v7, 0);
  uint64_t v12 = NSStringFromSelector(sel_rankedResults);
  v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v11, (uint64_t)v12, v14);

  if (v15)
  {
    self = (GDEntityResolutionResult *)(id)objc_msgSend_initWithRankedResults_(self, v16, (uint64_t)v15, v18, v19);
    v20 = self;
  }
  else
  {
    v21 = objc_msgSend_error(v4, v16, v17, v18, v19);

    if (!v21)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32[0] = @"GDEntityResolutionResult rankedResults is nil";
      v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v32, (uint64_t)&v31, 1);
      v26 = objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, @"GDErrorDomain", 9, (uint64_t)v24);
      objc_msgSend_failWithError_(v4, v27, (uint64_t)v26, v28, v29);
    }
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  rankedResults = self->_rankedResults;
  id v4 = a3;
  NSStringFromSelector(sel_rankedResults);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)rankedResults, (uint64_t)v7, v6);
}

- (GDEntityResolutionResult)initWithRankedResults:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDEntityResolutionResult;
  uint64_t v9 = [(GDEntityResolutionResult *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    rankedResults = v9->_rankedResults;
    v9->_rankedResults = (NSArray *)v10;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end