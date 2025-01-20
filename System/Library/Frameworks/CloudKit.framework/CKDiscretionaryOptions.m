@interface CKDiscretionaryOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)requiresNetworkAccess;
- (CKDiscretionaryOptions)initWithCoder:(id)a3;
- (NSString)applicationBundleIdentifierOverride;
- (NSString)secondarySourceApplicationBundleId;
- (double)timeoutIntervalForResource;
- (unint64_t)discretionaryNetworkBehavior;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3;
- (void)setApplicationBundleIdentifierOverride:(id)a3;
- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3;
- (void)setRequiresNetworkAccess:(BOOL)a3;
- (void)setSecondarySourceApplicationBundleId:(id)a3;
- (void)setTimeoutIntervalForResource:(double)a3;
@end

@implementation CKDiscretionaryOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDiscretionaryOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKDiscretionaryOptions;
  v5 = [(CKDiscretionaryOptions *)&v27 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"sourceApplicationBundleId");
    applicationBundleIdentifierOverride = v5->_applicationBundleIdentifierOverride;
    v5->_applicationBundleIdentifierOverride = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"secondarySourceApplicationBundleId");
    secondarySourceApplicationBundleId = v5->_secondarySourceApplicationBundleId;
    v5->_secondarySourceApplicationBundleId = (NSString *)v13;

    objc_msgSend_decodeDoubleForKey_(v4, v15, @"timeoutIntervalForResource", v16);
    v5->_timeoutIntervalForResource = v17;
    v5->_allowsCellularAccess = objc_msgSend_decodeBoolForKey_(v4, v18, @"allowsCellularAccess", v19);
    v5->_allowsExpensiveNetworkAccess = objc_msgSend_decodeBoolForKey_(v4, v20, @"allowsExpensiveNetworkAccess", v21);
    v5->_discretionaryNetworkBehavior = objc_msgSend_decodeInt64ForKey_(v4, v22, @"discretionaryNetworkBehavior", v23);
    v5->_requiresNetworkAccess = objc_msgSend_decodeBoolForKey_(v4, v24, @"requiresNetworkAccess", v25);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)self->_applicationBundleIdentifierOverride, @"sourceApplicationBundleId");
  objc_msgSend_encodeObject_forKey_(v13, v6, (uint64_t)self->_secondarySourceApplicationBundleId, @"secondarySourceApplicationBundleId");
  objc_msgSend_encodeDouble_forKey_(v13, v7, @"timeoutIntervalForResource", v8, self->_timeoutIntervalForResource);
  objc_msgSend_encodeBool_forKey_(v13, v9, self->_allowsCellularAccess, @"allowsCellularAccess");
  objc_msgSend_encodeBool_forKey_(v13, v10, self->_allowsExpensiveNetworkAccess, @"allowsExpensiveNetworkAccess");
  objc_msgSend_encodeInt64_forKey_(v13, v11, self->_discretionaryNetworkBehavior, @"discretionaryNetworkBehavior");
  objc_msgSend_encodeBool_forKey_(v13, v12, self->_requiresNetworkAccess, @"requiresNetworkAccess");
}

- (NSString)applicationBundleIdentifierOverride
{
  return self->_applicationBundleIdentifierOverride;
}

- (void)setApplicationBundleIdentifierOverride:(id)a3
{
}

- (NSString)secondarySourceApplicationBundleId
{
  return self->_secondarySourceApplicationBundleId;
}

- (void)setSecondarySourceApplicationBundleId:(id)a3
{
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (unint64_t)discretionaryNetworkBehavior
{
  return self->_discretionaryNetworkBehavior;
}

- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3
{
  self->_discretionaryNetworkBehavior = a3;
}

- (BOOL)requiresNetworkAccess
{
  return self->_requiresNetworkAccess;
}

- (void)setRequiresNetworkAccess:(BOOL)a3
{
  self->_requiresNetworkAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySourceApplicationBundleId, 0);

  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverride, 0);
}

@end