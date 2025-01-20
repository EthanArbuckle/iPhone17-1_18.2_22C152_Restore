@interface IDSToolKTSelfVerificationHealableErrors
+ (BOOL)supportsSecureCoding;
- (IDSToolKTSelfVerificationHealableErrors)initWithCoder:(id)a3;
- (NSArray)accountHealableErrors;
- (NSDictionary)deviceIdToHealableErrors;
- (unint64_t)healableState;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountHealableErrors:(id)a3;
- (void)setDeviceIdToHealableErrors:(id)a3;
- (void)setHealableState:(unint64_t)a3;
@end

@implementation IDSToolKTSelfVerificationHealableErrors

- (void)encodeWithCoder:(id)a3
{
  accountHealableErrors = self->_accountHealableErrors;
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)accountHealableErrors, v6, @"account-healable-errors");
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_deviceIdToHealableErrors, v8, @"device-id-to-healable-errors");
  objc_msgSend_encodeInteger_forKey_(v11, v9, self->_healableState, v10, @"healable-state");
}

- (IDSToolKTSelfVerificationHealableErrors)initWithCoder:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IDSToolKTSelfVerificationHealableErrors;
  v5 = [(IDSToolKTSelfVerificationHealableErrors *)&v27 init];
  if (v5)
  {
    double v6 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v29, v8, 2);
    v12 = objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11);
    v5->_accountHealableErrors = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, v14, @"account-healable-errors");

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v28[3] = objc_opt_class();
    v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v28, v17, 4);
    v21 = objc_msgSend_setWithArray_(v15, v19, (uint64_t)v18, v20);
    v5->_deviceIdToHealableErrors = (NSDictionary *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, v23, @"device-id-to-healable-errors");

    v5->_healableState = objc_msgSend_decodeIntegerForKey_(v4, v24, @"healable-state", v25);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)accountHealableErrors
{
  return self->_accountHealableErrors;
}

- (void)setAccountHealableErrors:(id)a3
{
  self->_accountHealableErrors = (NSArray *)a3;
}

- (NSDictionary)deviceIdToHealableErrors
{
  return self->_deviceIdToHealableErrors;
}

- (void)setDeviceIdToHealableErrors:(id)a3
{
  self->_deviceIdToHealableErrors = (NSDictionary *)a3;
}

- (unint64_t)healableState
{
  return self->_healableState;
}

- (void)setHealableState:(unint64_t)a3
{
  self->_healableState = a3;
}

@end