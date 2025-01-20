@interface IDSKTRegistrationStatusProvider
+ (BOOL)supportsSecureCoding;
- (IDSKTRegistrationStatusProvider)init;
- (IDSKTRegistrationStatusProvider)initWithCoder:(id)a3;
- (NSDictionary)ktApplicationToKTRegStatus;
- (id)statusForKTApplication:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setKtApplicationToKTRegStatus:(id)a3;
@end

@implementation IDSKTRegistrationStatusProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTRegistrationStatusProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSKTRegistrationStatusProvider;
  v2 = [(IDSKTRegistrationStatusProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    ktApplicationToKTRegStatus = v2->_ktApplicationToKTRegStatus;
    v2->_ktApplicationToKTRegStatus = 0;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_ktApplicationToKTRegStatus, v3, @"kIDSKTAppToStatusKey");
}

- (IDSKTRegistrationStatusProvider)initWithCoder:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IDSKTRegistrationStatusProvider;
  v5 = [(IDSKTRegistrationStatusProvider *)&v18 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v19, v8, 3);
    v12 = objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, v14, @"kIDSKTAppToStatusKey");
    ktApplicationToKTRegStatus = v5->_ktApplicationToKTRegStatus;
    v5->_ktApplicationToKTRegStatus = (NSDictionary *)v15;
  }
  return v5;
}

- (id)statusForKTApplication:(id)a3
{
  objc_msgSend_objectForKeyedSubscript_(self->_ktApplicationToKTRegStatus, a2, (uint64_t)a3, v3);
  id v4 = (IDSKTRegistrationStatus *)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    id v4 = objc_alloc_init(IDSKTRegistrationStatus);
  }
  v5 = v4;

  return v5;
}

- (NSDictionary)ktApplicationToKTRegStatus
{
  return self->_ktApplicationToKTRegStatus;
}

- (void)setKtApplicationToKTRegStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end