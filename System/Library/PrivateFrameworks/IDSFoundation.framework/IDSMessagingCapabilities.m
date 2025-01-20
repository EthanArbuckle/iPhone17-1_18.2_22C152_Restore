@interface IDSMessagingCapabilities
+ (BOOL)supportsSecureCoding;
- (IDSMessagingCapabilities)initWithCoder:(id)a3;
- (IDSMessagingCapabilities)initWithRequiredCapabilities:(id)a3 requiredMissingCapabilities:(id)a4;
- (NSSet)requiredCapabilities;
- (NSSet)requiredMissingCapabilities;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setRequiredMissingCapabilities:(id)a3;
@end

@implementation IDSMessagingCapabilities

- (IDSMessagingCapabilities)initWithRequiredCapabilities:(id)a3 requiredMissingCapabilities:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSMessagingCapabilities;
  v9 = [(IDSMessagingCapabilities *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requiredCapabilities, a3);
    objc_storeStrong((id *)&v10->_requiredMissingCapabilities, a4);
  }

  return v10;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_requiredCapabilities(self, a2, v2, v3);
  v10 = objc_msgSend_requiredMissingCapabilities(self, v7, v8, v9);
  v13 = objc_msgSend_stringWithFormat_(v5, v11, @"%p: Required capabilities: %@, Required missing capabilities: %@", v12, self, v6, v10);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSMessagingCapabilities)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v10 = objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  v13 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v11, (uint64_t)v10, v12, @"requiredCaps");

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v19 = objc_msgSend_setWithObjects_(v14, v17, v15, v18, v16, 0);
  v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v20, (uint64_t)v19, v21, @"requiredMissingCaps");

  v25 = (IDSMessagingCapabilities *)objc_msgSend_initWithRequiredCapabilities_requiredMissingCapabilities_(self, v23, (uint64_t)v13, v24, v22);
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_requiredCapabilities(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"requiredCaps");

  objc_msgSend_requiredMissingCapabilities(self, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, @"requiredMissingCaps");
}

- (NSSet)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (NSSet)requiredMissingCapabilities
{
  return self->_requiredMissingCapabilities;
}

- (void)setRequiredMissingCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredMissingCapabilities, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
}

@end