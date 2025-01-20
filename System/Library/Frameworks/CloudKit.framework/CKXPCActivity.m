@interface CKXPCActivity
- (BOOL)shouldBeDataBudgeted;
- (CKXPCActivity)initWithXPCActivity:(id)a3;
- (NSString)identifier;
- (OS_xpc_object)activity;
- (OS_xpc_object)criteria;
- (_xpc_activity_eligibility_changed_handler_s)addEligibilityChangedHandler:(id)a3;
- (int64_t)state;
- (void)removeEligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3;
@end

@implementation CKXPCActivity

- (CKXPCActivity)initWithXPCActivity:(id)a3
{
  v5 = (_xpc_activity_s *)a3;
  v17.receiver = self;
  v17.super_class = (Class)CKXPCActivity;
  v6 = [(CKXPCActivity *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activity, a3);
    v8 = (OS_xpc_object *)xpc_activity_copy_criteria(v5);
    criteria = v7->_criteria;
    v7->_criteria = v8;

    uint64_t v10 = xpc_activity_copy_identifier();
    if (v10)
    {
      v13 = (void *)v10;
      uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v11, v10, v12);
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v14;

      free(v13);
    }
    v7->_shouldBeDataBudgeted = xpc_activity_should_be_data_budgeted();
  }

  return v7;
}

- (BOOL)shouldBeDataBudgeted
{
  return self->_shouldBeDataBudgeted;
}

- (_xpc_activity_eligibility_changed_handler_s)addEligibilityChangedHandler:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_activity(self, v5, v6, v7);
  v9 = (_xpc_activity_eligibility_changed_handler_s *)xpc_activity_add_eligibility_changed_handler();

  return v9;
}

- (void)removeEligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
}

- (int64_t)state
{
  objc_msgSend_activity(self, a2, v2, v3);
  id v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  xpc_activity_state_t state = xpc_activity_get_state(v4);

  return state;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_xpc_object)criteria
{
  return self->_criteria;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_criteria, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end