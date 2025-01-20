@interface IDSKTRegistrationStatus
+ (BOOL)supportsSecureCoding;
- (IDSKTRegistrationData)registeredKTData;
- (IDSKTRegistrationData)unregisteredKTData;
- (IDSKTRegistrationStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRegisteredKTData:(id)a3;
- (void)setUnregisteredKTData:(id)a3;
@end

@implementation IDSKTRegistrationStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unregisteredKTData = self->_unregisteredKTData;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)unregisteredKTData, v6, @"kUnregisteredKTData");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_registeredKTData, v8, @"kRegisteredKTData");
}

- (IDSKTRegistrationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSKTRegistrationStatus;
  v5 = [(IDSKTRegistrationStatus *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, @"kUnregisteredKTData");
    unregisteredKTData = v5->_unregisteredKTData;
    v5->_unregisteredKTData = (IDSKTRegistrationData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, @"kRegisteredKTData");
    registeredKTData = v5->_registeredKTData;
    v5->_registeredKTData = (IDSKTRegistrationData *)v14;
  }
  return v5;
}

- (IDSKTRegistrationData)unregisteredKTData
{
  return self->_unregisteredKTData;
}

- (void)setUnregisteredKTData:(id)a3
{
}

- (IDSKTRegistrationData)registeredKTData
{
  return self->_registeredKTData;
}

- (void)setRegisteredKTData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredKTData, 0);
  objc_storeStrong((id *)&self->_unregisteredKTData, 0);
}

@end