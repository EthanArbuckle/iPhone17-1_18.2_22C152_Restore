@interface APTargetingCriteria
+ (BOOL)supportsSecureCoding;
- (APTargetingCriteria)initWithCoder:(id)a3;
- (NSArray)values;
- (NSString)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation APTargetingCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APTargetingCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)APTargetingCriteria;
  v9 = [(APTargetingCriteria *)&v35 init];
  if (v9)
  {
    uint64_t v12 = objc_msgSend_classForCoder(NSString, v5, v6, v7, v8, v10, v11);
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"identifier", v14, v15, v16);
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v17;

    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v27 = objc_msgSend_setWithObjects_(v19, v22, v20, v23, v24, v25, v26, v21, 0);
    uint64_t v32 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v28, (uint64_t)v27, @"values", v29, v30, v31);
    values = v9->_values;
    v9->_values = (NSArray *)v32;
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)identifier, @"identifier", v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_values, @"values", v10, v11, v12);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end