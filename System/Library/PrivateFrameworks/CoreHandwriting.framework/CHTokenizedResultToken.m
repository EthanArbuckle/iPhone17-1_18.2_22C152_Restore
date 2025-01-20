@interface CHTokenizedResultToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenizedResultToken:(id)a3;
- (BOOL)isEquivalentToToken:(id)a3;
- (CGRect)bounds;
- (CHTokenizedResultToken)init;
- (CHTokenizedResultToken)initWithCoder:(id)a3;
- (CHTokenizedResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5;
- (NSIndexSet)strokeIndexes;
- (NSString)string;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHTokenizedResultToken

- (CHTokenizedResultToken)init
{
  v7 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], a2, v2, v3, v4, v5);
  v11 = (CHTokenizedResultToken *)objc_msgSend_initWithString_strokeIndexes_bounds_(self, v8, (uint64_t)&stru_1F20141C8, (uint64_t)v7, v9, v10, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

  return v11;
}

- (CHTokenizedResultToken)initWithString:(id)a3 strokeIndexes:(id)a4 bounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v16 = objc_msgSend_characterSetWithRange_(MEMORY[0x1E4F28B88], v13, 57440, 1024, v14, v15);
  uint64_t v21 = objc_msgSend_rangeOfCharacterFromSet_(v11, v17, (uint64_t)v16, v18, v19, v20);

  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v22 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v11;
      _os_log_impl(&dword_1C492D000, v22, OS_LOG_TYPE_FAULT, "The input string (%@) contains one or more ligature private code points", buf, 0xCu);
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)CHTokenizedResultToken;
  v28 = [(CHTokenizedResultToken *)&v39 init];
  if (v28)
  {
    uint64_t v29 = objc_msgSend_copy(v11, v23, v24, v25, v26, v27);
    string = v28->_string;
    v28->_string = (NSString *)v29;

    uint64_t v36 = objc_msgSend_copy(v12, v31, v32, v33, v34, v35);
    strokeIndexes = v28->_strokeIndexes;
    v28->_strokeIndexes = (NSIndexSet *)v36;

    v28->_bounds.origin.CGFloat x = x;
    v28->_bounds.origin.CGFloat y = y;
    v28->_bounds.size.CGFloat width = width;
    v28->_bounds.size.CGFloat height = height;
  }

  return v28;
}

- (CHTokenizedResultToken)initWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"string", v7, v8);
  uint64_t v10 = objc_opt_class();
  uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"strokeIndexes", v12, v13);
  uint64_t v15 = (void *)v14;
  if (v9) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v17 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = (id)objc_opt_class();
      id v18 = v33;
      _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_ERROR, "%@ decoding failed. Token string and stroke indexes are required to be nonnull when constructing a result token", buf, 0xCu);
    }
    uint64_t v19 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)CHTokenizedResultToken;
    uint64_t v19 = [(CHTokenizedResultToken *)&v31 init];
    objc_storeStrong((id *)v19 + 1, v9);
    objc_storeStrong((id *)v19 + 2, v15);
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v30 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v19 + 24) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v19 + 40) = v29;
    uint64_t v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"bounds", v22, v23);
    self = (CHTokenizedResultToken *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getValue_size_(self, v24, (uint64_t)(v19 + 24), 32, v25, v26);
    if (CGRectEqualToRect(*(CGRect *)(v19 + 24), *MEMORY[0x1E4F1DB28]))
    {
      *(_OWORD *)(v19 + 24) = v30;
      *(_OWORD *)(v19 + 40) = v29;
    }
  }

  return (CHTokenizedResultToken *)v19;
}

- (void)encodeWithCoder:(id)a3
{
  string = self->_string;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)string, @"string", v7, v8);
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)self->_strokeIndexes, @"strokeIndexes", v10, v11);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v12, (uint64_t)&self->_bounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v13, v14);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)v18, @"bounds", v16, v17);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)CHTokenizedResultToken;
  uint64_t v3 = [(CHTokenizedResultToken *)&v10 description];
  uint64_t v8 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" '%@', strokes: %@, bounds: [%0.4f, %0.4f, %0.4f, %0.4f]", v5, v6, v7, self->_string, self->_strokeIndexes, *(void *)&self->_bounds.origin.x, *(void *)&self->_bounds.origin.y, *(void *)&self->_bounds.size.width, *(void *)&self->_bounds.size.height);

  return v8;
}

- (BOOL)isEqualToTokenizedResultToken:(id)a3
{
  id v4 = (CHTokenizedResultToken *)a3;
  objc_super v10 = v4;
  if (self == v4)
  {
    BOOL v49 = 1;
    goto LABEL_11;
  }
  string = self->_string;
  uint64_t v12 = objc_msgSend_string(v4, v5, v6, v7, v8, v9);
  if (string == (NSString *)v12)
  {

    strokeIndexes = self->_strokeIndexes;
    uint64_t v31 = objc_msgSend_strokeIndexes(v10, v50, v51, v52, v53, v54);
    if (strokeIndexes != (NSIndexSet *)v31)
    {
LABEL_5:
      v37 = (void *)v31;
      v38 = self->_strokeIndexes;
      objc_super v39 = objc_msgSend_strokeIndexes(v10, v32, v33, v34, v35, v36);
      LODWORD(v38) = objc_msgSend_isEqualToIndexSet_(v38, v40, (uint64_t)v39, v41, v42, v43);

      if (!v38) {
        goto LABEL_6;
      }
LABEL_10:
      objc_msgSend_bounds(v10, v44, v45, v46, v47, v48);
      v60.origin.CGFloat x = v55;
      v60.origin.CGFloat y = v56;
      v60.size.CGFloat width = v57;
      v60.size.CGFloat height = v58;
      BOOL v49 = CGRectEqualToRect(self->_bounds, v60);
      goto LABEL_11;
    }
LABEL_9:

    goto LABEL_10;
  }
  id v18 = (void *)v12;
  uint64_t v19 = self->_string;
  uint64_t v20 = objc_msgSend_string(v10, v13, v14, v15, v16, v17);
  LODWORD(v19) = objc_msgSend_isEqualToString_(v19, v21, (uint64_t)v20, v22, v23, v24);

  if (v19)
  {
    strokeIndexes = self->_strokeIndexes;
    uint64_t v31 = objc_msgSend_strokeIndexes(v10, v25, v26, v27, v28, v29);
    if (strokeIndexes != (NSIndexSet *)v31) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:
  BOOL v49 = 0;
LABEL_11:

  return v49;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToTokenizedResultToken = objc_msgSend_isEqualToTokenizedResultToken_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedResultToken;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v7 = objc_msgSend_hash(self->_string, a2, v2, v3, v4, v5);
  return objc_msgSend_hash(self->_strokeIndexes, v8, v9, v10, v11, v12) ^ v7;
}

- (BOOL)isEquivalentToToken:(id)a3
{
  id v4 = a3;
  string = self->_string;
  uint64_t v11 = objc_msgSend_string(v4, v6, v7, v8, v9, v10);
  if (string == (NSString *)v11)
  {
  }
  else
  {
    uint64_t v17 = (void *)v11;
    id v18 = self->_string;
    uint64_t v19 = objc_msgSend_string(v4, v12, v13, v14, v15, v16);
    LODWORD(v18) = objc_msgSend_isEqualToString_(v18, v20, (uint64_t)v19, v21, v22, v23);

    if (!v18)
    {
      char isEqualToIndexSet = 0;
      goto LABEL_9;
    }
  }
  strokeIndexes = self->_strokeIndexes;
  objc_msgSend_strokeIndexes(v4, v24, v25, v26, v27, v28);
  uint64_t v36 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  if (strokeIndexes == v36)
  {
    char isEqualToIndexSet = 1;
  }
  else
  {
    v37 = self->_strokeIndexes;
    v38 = objc_msgSend_strokeIndexes(v4, v31, v32, v33, v34, v35);
    char isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v37, v39, (uint64_t)v38, v40, v41, v42);
  }
LABEL_9:

  return isEqualToIndexSet;
}

- (NSString)string
{
  return self->_string;
}

- (NSIndexSet)strokeIndexes
{
  return self->_strokeIndexes;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIndexes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end