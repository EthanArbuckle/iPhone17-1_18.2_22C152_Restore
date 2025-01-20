@interface GDEntitySimilarityResult
+ (BOOL)supportsSecureCoding;
- (GDEntitySimilarityRequest)request;
- (GDEntitySimilarityResult)initWithCoder:(id)a3;
- (GDEntitySimilarityResult)initWithRequest:(id)a3 similarityScore:(double)a4;
- (double)similarityScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDEntitySimilarityResult

- (void).cxx_destruct
{
}

- (double)similarityScore
{
  return self->_similarityScore;
}

- (GDEntitySimilarityRequest)request
{
  return self->_request;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7 = objc_msgSend_initWithFormat_(v3, v4, @"GDEntitySimilarityResult<similarityScore: %f, request: %@>", v5, v6, *(void *)&self->_similarityScore, self->_request);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  request = self->_request;
  double similarityScore = self->_similarityScore;

  return (id)objc_msgSend_initWithRequest_similarityScore_(v9, v10, (uint64_t)request, v11, v12, similarityScore);
}

- (GDEntitySimilarityResult)initWithCoder:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_request);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_similarityScore);
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);
    objc_msgSend_doubleValue(v18, v19, v20, v21, v22);
    double v24 = v23;

    self = (GDEntitySimilarityResult *)(id)objc_msgSend_initWithRequest_similarityScore_(self, v25, (uint64_t)v9, v26, v27, v24);
    v28 = self;
  }
  else
  {
    v29 = objc_msgSend_error(v4, v10, v11, v12, v13);

    if (!v29)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v40[0] = @"GDEntitySimilarityRequest is nil";
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v40, (uint64_t)&v39, 1);
      v34 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v33, @"GDErrorDomain", 9, (uint64_t)v32);
      objc_msgSend_failWithError_(v4, v35, (uint64_t)v34, v36, v37);
    }
    v28 = 0;
  }

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  double similarityScore = self->_similarityScore;
  id v6 = a3;
  uint64_t v11 = objc_msgSend_numberWithDouble_(v4, v7, v8, v9, v10, similarityScore);
  uint64_t v12 = NSStringFromSelector(sel_similarityScore);
  objc_msgSend_encodeObject_forKey_(v6, v13, (uint64_t)v11, (uint64_t)v12, v14);

  request = self->_request;
  NSStringFromSelector(sel_request);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v16, (uint64_t)request, (uint64_t)v18, v17);
}

- (GDEntitySimilarityResult)initWithRequest:(id)a3 similarityScore:(double)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GDEntitySimilarityResult;
  uint64_t v11 = [(GDEntitySimilarityResult *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
    request = v11->_request;
    v11->_request = (GDEntitySimilarityRequest *)v12;

    v11->_double similarityScore = a4;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end