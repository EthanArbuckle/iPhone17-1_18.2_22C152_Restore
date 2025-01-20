@interface GDSpan
+ (BOOL)supportsSecureCoding;
- (GDSpan)initWithCoder:(id)a3;
- (GDSpan)initWithText:(id)a3 range:(_NSRange)a4;
- (GDSpan)initWithText:(id)a3 start:(int64_t)a4 end:(int64_t)a5;
- (NSString)text;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDSpan

- (void).cxx_destruct
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (id)description
{
  uint64_t v6 = objc_msgSend_range(self, a2, v2, v3, v4);
  objc_msgSend_range(self, v7, v8, v9, v10);
  v12 = &v11[v6];
  v13 = NSString;
  v17 = objc_msgSend_text(self, v11, v14, v15, v16);
  v22 = objc_msgSend_text(self, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_range(self, v23, v24, v25, v26);
  v30 = objc_msgSend_substringWithRange_(v22, v28, v27, (uint64_t)v28, v29);
  uint64_t v35 = objc_msgSend_range(self, v31, v32, v33, v34);
  v39 = objc_msgSend_stringWithFormat_(v13, v36, @"<GDSpan: text: %@, range: %@ [%tu, %tu>"), v37, v38, v17, v30, v35, v12);

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  text = self->_text;
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;

  return (id)objc_msgSend_initWithText_range_(v9, v10, (uint64_t)text, location, length);
}

- (GDSpan)initWithCoder:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_text);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = NSStringFromSelector(sel_range);
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);

    if (v18)
    {
      uint64_t v23 = objc_msgSend_rangeValue(v18, v19, v20, v21, v22);
      self = (GDSpan *)(id)objc_msgSend_initWithText_range_(self, v24, (uint64_t)v9, v23, (uint64_t)v24);
      uint64_t v25 = self;
LABEL_11:

      goto LABEL_12;
    }
    v28 = objc_msgSend_error(v4, v19, v20, v21, v22);

    if (!v28)
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45 = @"GDSpan range is nil";
      v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v29, (uint64_t)&v45, (uint64_t)&v44, 1);
      uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, @"GDErrorDomain", 9, (uint64_t)v31);
      objc_msgSend_failWithError_(v4, v34, (uint64_t)v33, v35, v36);
    }
    v18 = 0;
LABEL_10:
    uint64_t v25 = 0;
    goto LABEL_11;
  }
  uint64_t v26 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v26)
  {
    uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    v47[0] = @"GDSpan text is nil";
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)v47, (uint64_t)&v46, 1);
    v39 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v38, @"GDErrorDomain", 9, (uint64_t)v18);
    objc_msgSend_failWithError_(v4, v40, (uint64_t)v39, v41, v42);

    goto LABEL_10;
  }
  uint64_t v25 = 0;
LABEL_12:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_text);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)text, (uint64_t)v6, v8);

  objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v9, self->_range.location, self->_range.length, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = NSStringFromSelector(sel_range);
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)v14, (uint64_t)v11, v13);
}

- (GDSpan)initWithText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GDSpan;
  uint64_t v12 = [(GDSpan *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v7, v8, v9, v10, v11);
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_range.NSUInteger location = location;
    v12->_range.NSUInteger length = length;
  }

  return v12;
}

- (GDSpan)initWithText:(id)a3 start:(int64_t)a4 end:(int64_t)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GDSpan;
  uint64_t v13 = [(GDSpan *)&v17 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v9, v10, v11, v12);
    text = v13->_text;
    v13->_text = (NSString *)v14;

    v13->_range.NSUInteger location = a4;
    v13->_range.NSUInteger length = a5 - a4;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end