@interface CWFLocalNetworkFilteredName
+ (id)filteredName:(id)a3 reason:(unint64_t)a4;
- (NSString)name;
- (id)description;
- (unint64_t)reason;
- (void)setName:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation CWFLocalNetworkFilteredName

+ (id)filteredName:(id)a3 reason:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(CWFLocalNetworkFilteredName);
  objc_msgSend_setName_(v6, v7, (uint64_t)v5, v8, v9);

  objc_msgSend_setReason_(v6, v10, a4, v11, v12);
  return v6;
}

- (id)description
{
  v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  objc_msgSend_appendFormat_(v6, v9, @"<%@ : %p", v10, v11, v8, self);

  v16 = objc_msgSend_name(self, v12, v13, v14, v15);

  if (v16)
  {
    v21 = objc_msgSend_name(self, v17, v18, v19, v20);
    objc_msgSend_appendFormat_(v6, v22, @" name='%@'", v23, v24, v21);
  }
  if (objc_msgSend_reason(self, v17, v18, v19, v20))
  {
    uint64_t v29 = objc_msgSend_reason(self, v25, v26, v27, v28);
    objc_msgSend_appendFormat_(v6, v30, @" reason=%lu", v31, v32, v29);
  }
  objc_msgSend_appendString_(v6, v25, @">", v27, v28);
  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (void).cxx_destruct
{
}

@end