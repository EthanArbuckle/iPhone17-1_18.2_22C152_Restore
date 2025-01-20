@interface IMPowerAssertion
- (IMPowerAssertion)initWithIdentifier:(id)a3;
- (IMPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4;
- (IMPowerAssertion)initWithIdentifier:(id)a3 timeoutSec:(double)a4 properties:(id)a5;
- (id)description;
- (void)dealloc;
@end

@implementation IMPowerAssertion

- (IMPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMPowerAssertion;
  v7 = [(IMPowerAssertion *)&v24 init];
  if (v7)
  {
    if (a4 == 0.0)
    {
      if (qword_1E92DB990 != -1) {
        dispatch_once(&qword_1E92DB990, &unk_1EE22FE98);
      }
      if (off_1E92DB988(@"PreventUserIdleSystemSleep", 255, v6, &v7->_assertion))
      {
LABEL_6:
        v7->_assertion = 0;
        _IMWarn(@"Unable to create the power assertion for \"%@\" (%d).", (uint64_t)v8, v9, v10, v11, v12, v13, v14, (char)v6);

        v7 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      if (qword_1E92DB030 != -1) {
        dispatch_once(&qword_1E92DB030, &unk_1EE2306D8);
      }
      if (off_1E92DB028(@"PreventUserIdleSystemSleep", v6, v6, 0, 0, @"TimeoutActionTurnOff", &v7->_assertion, a4))goto LABEL_6; {
    }
      }
    uint64_t v15 = objc_msgSend_copy(v6, v8, v9, v10);
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v15;

    v17 = (void *)MEMORY[0x192FDE5A0]();
    if (_IMWillLog(@"Power")) {
      _IMAlwaysLog(0, @"Power", @"Created power assertion with identifier: %@", v18, v19, v20, v21, v22, (char)v6);
    }
    IMLogBacktrace(@"Power");
  }
LABEL_13:

  return v7;
}

- (IMPowerAssertion)initWithIdentifier:(id)a3
{
  return (IMPowerAssertion *)((uint64_t (*)(IMPowerAssertion *, char *, id))MEMORY[0x1F4181798])(self, sel_initWithIdentifier_timeout_, a3);
}

- (IMPowerAssertion)initWithIdentifier:(id)a3 timeoutSec:(double)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v58.receiver = self;
  v58.super_class = (Class)IMPowerAssertion;
  uint64_t v13 = [(IMPowerAssertion *)&v58 init];
  if (!v13) {
    goto LABEL_15;
  }
  uint64_t v14 = objc_msgSend_copy(v8, v10, v11, v12);
  identifier = v13->_identifier;
  v13->_identifier = (NSString *)v14;

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend_setValue_forKey_(v16, v17, @"PreventUserIdleSystemSleep", @"AssertType");
  objc_msgSend_setValue_forKey_(v16, v18, (uint64_t)v8, @"AssertName");
  uint64_t v22 = objc_msgSend_numberWithDouble_(NSNumber, v19, v20, v21, a4);
  objc_msgSend_setValue_forKey_(v16, v23, (uint64_t)v22, @"TimeoutSeconds");

  v26 = objc_msgSend_objectForKeyedSubscript_(v9, v24, @"IMPowerAssertionPropertyPIDKey", v25);

  if (v26)
  {
    v29 = objc_msgSend_objectForKeyedSubscript_(v9, v27, @"IMPowerAssertionPropertyPIDKey", v28);
    objc_msgSend_setValue_forKey_(v16, v30, (uint64_t)v29, @"AssertPID");
  }
  v31 = objc_msgSend_objectForKeyedSubscript_(v9, v27, @"IMPowerAssertionPropertyOnBehalfOfPIDKey", v28);

  if (v31)
  {
    v34 = objc_msgSend_objectForKeyedSubscript_(v9, v32, @"IMPowerAssertionPropertyOnBehalfOfPIDKey", v33);
    objc_msgSend_setValue_forKey_(v16, v35, (uint64_t)v34, @"AssertionOnBehalfOfPID");
  }
  v36 = objc_msgSend_objectForKeyedSubscript_(v9, v32, @"IMPowerAssertionPropertyFrameworkIDKey", v33);

  if (v36)
  {
    v39 = objc_msgSend_objectForKeyedSubscript_(v9, v37, @"IMPowerAssertionPropertyFrameworkIDKey", v38);
    objc_msgSend_setValue_forKey_(v16, v40, (uint64_t)v39, @"FrameworkBundleID");
  }
  v41 = objc_msgSend_objectForKeyedSubscript_(v9, v37, @"IMPowerAssertionPropertyOnBehalfOfPIDReasonKey", v38);

  if (v41)
  {
    v45 = objc_msgSend_objectForKeyedSubscript_(v9, v42, @"IMPowerAssertionPropertyOnBehalfOfPIDReasonKey", v44);
    objc_msgSend_setValue_forKey_(v16, v46, (uint64_t)v45, @"AssertionOnBehalfOfPIDReason");
  }
  uint64_t v47 = objc_msgSend_copy(v16, v42, v43, v44);
  properties = v13->_properties;
  v13->_properties = (NSDictionary *)v47;

  if (qword_1E92DB9A0 != -1) {
    dispatch_once(&qword_1E92DB9A0, &unk_1EE230FD8);
  }
  if (!off_1E92DB998(v13->_properties, &v13->_assertion))
  {

LABEL_15:
    v56 = v13;
    goto LABEL_16;
  }
  v13->_assertion = 0;
  _IMWarn(@"Unable to create the power assertion for \"%@\" (%d).", v49, v50, v51, v52, v53, v54, v55, (char)v8);

  v56 = 0;
LABEL_16:

  return v56;
}

- (void)dealloc
{
  if (_IMWillLog(@"Power")) {
    _IMAlwaysLog(0, @"Power", @"Releasing power assertion with identifier: %@", v3, v4, v5, v6, v7, (char)self->_identifier);
  }
  IMLogBacktrace(@"Power");
  if (self->_assertion)
  {
    if (qword_1E92DB040 != -1) {
      dispatch_once(&qword_1E92DB040, &unk_1EE231118);
    }
    if (off_1E92DB038(self->_assertion)) {
      _IMWarn(@"Unable to properly release the power assertion for \"%@\" (%d).  Dropping it instead.", v8, v9, v10, v11, v12, v13, v14, (char)self->_identifier);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)IMPowerAssertion;
  [(IMPowerAssertion *)&v15 dealloc];
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<IMPowerAssertion: %p> Identifier: %@", v2, self, self->_identifier);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end