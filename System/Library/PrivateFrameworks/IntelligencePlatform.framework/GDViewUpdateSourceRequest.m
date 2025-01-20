@interface GDViewUpdateSourceRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)triggered;
- (GDSourceListenerConfigIdentifier)configIdentifier;
- (GDViewUpdateSourceRequest)initWithCoder:(id)a3;
- (GDViewUpdateSourceRequest)initWithConfigIdentifier:(id)a3 initialBookmark:(id)a4 latestBookmark:(id)a5 state:(id)a6 triggered:(BOOL)a7;
- (NSData)initialBookmark;
- (NSData)latestBookmark;
- (NSString)state;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLatestBookmark:(id)a3;
@end

@implementation GDViewUpdateSourceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_latestBookmark, 0);
  objc_storeStrong((id *)&self->_initialBookmark, 0);

  objc_storeStrong((id *)&self->_configIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  configIdentifier = self->_configIdentifier;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_configIdentifier);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)configIdentifier, (uint64_t)v6, v8);

  initialBookmark = self->_initialBookmark;
  v10 = NSStringFromSelector(sel_initialBookmark);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)initialBookmark, (uint64_t)v10, v12);

  latestBookmark = self->_latestBookmark;
  v14 = NSStringFromSelector(sel_latestBookmark);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)latestBookmark, (uint64_t)v14, v16);

  state = self->_state;
  v18 = NSStringFromSelector(sel_state);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)state, (uint64_t)v18, v20);

  BOOL triggered = self->_triggered;
  NSStringFromSelector(sel_triggered);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v22, triggered, (uint64_t)v24, v23);
}

- (id)description
{
  id v6 = [NSString alloc];
  BOOL triggered = self->_triggered;
  uint64_t v8 = @"notActionable";
  if (self->_triggered)
  {
    if (!objc_msgSend_isEqual_(self->_state, v3, @"noChanges", v4, v5)) {
      uint64_t v8 = @"actionable ";
    }
    BOOL triggered = self->_triggered;
  }
  v9 = objc_msgSend_initWithFormat_(v6, v3, @"<GDViewUpdateSourceRequest %@, configId: %@, state: %@, triggered: %d>", v4, v5, v8, self->_configIdentifier, self->_state, triggered);

  return v9;
}

- (GDViewUpdateSourceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(sel_configIdentifier);
  v9 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, (uint64_t)v7, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

  if (v9
    && (objc_msgSend_error(v4, v10, v11, v12, v13),
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_initialBookmark);
    uint64_t v20 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v16, v19, v17, (uint64_t)v18, (uint64_t)v4, 0, @"GDViewUpdateSourceKeyError", 9, 0);

    v25 = objc_msgSend_error(v4, v21, v22, v23, v24);

    if (v25)
    {
      v15 = 0;
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v27 = objc_opt_class();
      v28 = NSStringFromSelector(sel_latestBookmark);
      v30 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v26, v29, v27, (uint64_t)v28, (uint64_t)v4, 0, @"GDViewUpdateSourceKeyError", 9, 0);

      v35 = objc_msgSend_error(v4, v31, v32, v33, v34);

      if (v35)
      {
        v15 = 0;
      }
      else
      {
        v36 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v37 = objc_opt_class();
        v38 = NSStringFromSelector(sel_state);
        v40 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v36, v39, v37, (uint64_t)v38, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

        if (!v40) {
          goto LABEL_11;
        }
        v45 = objc_msgSend_error(v4, v41, v42, v43, v44);

        if (v45
          || (NSStringFromSelector(sel_triggered),
              v46 = objc_claimAutoreleasedReturnValue(),
              uint64_t v50 = objc_msgSend_decodeBoolForKey_(v4, v47, (uint64_t)v46, v48, v49),
              v46,
              objc_msgSend_error(v4, v51, v52, v53, v54),
              v55 = objc_claimAutoreleasedReturnValue(),
              v55,
              v55))
        {
LABEL_11:
          v15 = 0;
        }
        else
        {
          self = (GDViewUpdateSourceRequest *)(id)objc_msgSend_initWithConfigIdentifier_initialBookmark_latestBookmark_state_triggered_(self, v56, (uint64_t)v9, (uint64_t)v20, (uint64_t)v30, v40, v50);
          v15 = self;
        }
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (GDViewUpdateSourceRequest)initWithConfigIdentifier:(id)a3 initialBookmark:(id)a4 latestBookmark:(id)a5 state:(id)a6 triggered:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)GDViewUpdateSourceRequest;
  uint64_t v17 = [(GDViewUpdateSourceRequest *)&v26 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_configIdentifier, a3);
    objc_storeStrong((id *)&v18->_initialBookmark, a4);
    objc_storeStrong((id *)&v18->_latestBookmark, a5);
    uint64_t v23 = objc_msgSend_copy(v16, v19, v20, v21, v22);
    state = v18->_state;
    v18->_state = (NSString *)v23;

    v18->_BOOL triggered = a7;
  }

  return v18;
}

- (GDSourceListenerConfigIdentifier)configIdentifier
{
  return self->_configIdentifier;
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (NSString)state
{
  return self->_state;
}

- (NSData)latestBookmark
{
  return self->_latestBookmark;
}

- (NSData)initialBookmark
{
  return self->_initialBookmark;
}

- (void)setLatestBookmark:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end