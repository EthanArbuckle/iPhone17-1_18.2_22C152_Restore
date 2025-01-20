@interface GDFeatureKey
+ (BOOL)supportsSecureCoding;
- (GDFeatureKey)initWithCoder:(id)a3;
- (GDFeatureKey)initWithViewName:(id)a3 featureName:(id)a4 subidentifierName:(id)a5;
- (NSString)diagnosticDataString;
- (NSString)featureName;
- (NSString)string;
- (NSString)subidentifierName;
- (NSString)viewName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDFeatureKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subidentifierName, 0);
  objc_storeStrong((id *)&self->_featureName, 0);

  objc_storeStrong((id *)&self->_viewName, 0);
}

- (NSString)subidentifierName
{
  return self->_subidentifierName;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)viewName
{
  return self->_viewName;
}

- (NSString)diagnosticDataString
{
  v6 = objc_msgSend_subidentifierName(self, a2, v2, v3, v4);

  id v11 = [NSString alloc];
  if (v6)
  {
    v12 = objc_msgSend_subidentifierName(self, v7, v8, v9, v10);
    v17 = objc_msgSend_featureName(self, v13, v14, v15, v16);
    v21 = objc_msgSend_initWithFormat_(v11, v18, @"%@%@%@", v19, v20, v12, @"|::|", v17);
  }
  else
  {
    v12 = objc_msgSend_featureName(self, v7, v8, v9, v10);
    v21 = objc_msgSend_initWithFormat_(v11, v22, @"%s%@%@", v23, v24, "<no subidentifier>", @"|::|", v12);
  }

  return (NSString *)v21;
}

- (NSString)string
{
  v6 = objc_msgSend_subidentifierName(self, a2, v2, v3, v4);

  id v7 = [NSString alloc];
  v12 = objc_msgSend_viewName(self, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_featureName(self, v13, v14, v15, v16);
  v22 = (void *)v17;
  if (v6)
  {
    uint64_t v23 = objc_msgSend_subidentifierName(self, v18, v19, v20, v21);
    v27 = objc_msgSend_initWithFormat_(v7, v24, @"%@%@%@%@%@", v25, v26, v12, @"|::|", v22, @"|::|", v23);
  }
  else
  {
    v27 = objc_msgSend_initWithFormat_(v7, v18, @"%@%@%@", v20, v21, v12, @"|::|", v17);
  }

  return (NSString *)v27;
}

- (id)description
{
  return (id)((uint64_t (*)(GDFeatureKey *, char *))MEMORY[0x1F4181798])(self, sel_string);
}

- (GDFeatureKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(sel_viewName);
  uint64_t v9 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, (uint64_t)v7, (uint64_t)v4, 1, @"GDFeatureKeyError", 9, 0);

  if (v9
    && (objc_msgSend_error(v4, v10, v11, v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_featureName);
    uint64_t v20 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v16, v19, v17, (uint64_t)v18, (uint64_t)v4, 1, @"GDFeatureKeyError", 9, 0);

    if (v20
      && (objc_msgSend_error(v4, v21, v22, v23, v24),
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          v25,
          !v25))
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v27 = objc_opt_class();
      v28 = NSStringFromSelector(sel_subidentifierName);
      v30 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v26, v29, v27, (uint64_t)v28, (uint64_t)v4, 0, @"GDFeatureKeyError", 9, 0);

      v35 = objc_msgSend_error(v4, v31, v32, v33, v34);

      if (v35)
      {
        uint64_t v15 = 0;
      }
      else
      {
        self = (GDFeatureKey *)(id)objc_msgSend_initWithViewName_featureName_subidentifierName_(self, v36, (uint64_t)v9, (uint64_t)v20, (uint64_t)v30);
        uint64_t v15 = self;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  viewName = self->_viewName;
  v5 = NSStringFromSelector(sel_viewName);
  objc_msgSend_encodeObject_forKey_(v16, v6, (uint64_t)viewName, (uint64_t)v5, v7);

  featureName = self->_featureName;
  uint64_t v9 = NSStringFromSelector(sel_featureName);
  objc_msgSend_encodeObject_forKey_(v16, v10, (uint64_t)featureName, (uint64_t)v9, v11);

  subidentifierName = self->_subidentifierName;
  if (subidentifierName)
  {
    uint64_t v13 = NSStringFromSelector(sel_subidentifierName);
    objc_msgSend_encodeObject_forKey_(v16, v14, (uint64_t)subidentifierName, (uint64_t)v13, v15);
  }
}

- (GDFeatureKey)initWithViewName:(id)a3 featureName:(id)a4 subidentifierName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GDFeatureKey;
  uint64_t v12 = [(GDFeatureKey *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewName, a3);
    objc_storeStrong((id *)&v13->_featureName, a4);
    objc_storeStrong((id *)&v13->_subidentifierName, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end