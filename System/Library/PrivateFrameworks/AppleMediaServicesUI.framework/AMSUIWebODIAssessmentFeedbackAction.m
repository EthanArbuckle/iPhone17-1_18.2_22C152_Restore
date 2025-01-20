@interface AMSUIWebODIAssessmentFeedbackAction
- (AMSUIWebODIAssessmentFeedbackAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)cacheIdentifier;
- (id)runAction;
- (unint64_t)outcome;
- (void)setCacheIdentifier:(id)a3;
- (void)setOutcome:(unint64_t)a3;
@end

@implementation AMSUIWebODIAssessmentFeedbackAction

- (AMSUIWebODIAssessmentFeedbackAction)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSUIWebODIAssessmentFeedbackAction;
  v7 = [(AMSUIWebAction *)&v19 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"cacheIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    cacheIdentifier = v7->_cacheIdentifier;
    v7->_cacheIdentifier = v9;

    v11 = [v6 objectForKeyedSubscript:@"outcome"];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 integerValue];
    }
    else
    {
      v14 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v14)
      {
        v14 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = objc_opt_class();
        v17 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = v16;
        __int16 v22 = 2114;
        v23 = v17;
        _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to parse outcome. Falling back to discarded outcome.", buf, 0x16u);
      }
      uint64_t v13 = 1;
    }
    v7->_outcome = v13;
  }
  return v7;
}

- (id)runAction
{
  v17[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebODIAssessmentFeedbackAction;
  id v3 = [(AMSUIWebAction *)&v15 runAction];
  v4 = (void *)MEMORY[0x263F27DC0];
  unint64_t v5 = [(AMSUIWebODIAssessmentFeedbackAction *)self outcome];
  id v6 = [(AMSUIWebODIAssessmentFeedbackAction *)self cacheIdentifier];
  v7 = [(AMSUIWebAction *)self context];
  v8 = [v7 bag];
  uint64_t v9 = [v4 provideFeedbackOnPayloadOutcome:v5 cacheIdentifier:v6 bag:v8];

  v10 = (void *)MEMORY[0x263F27E10];
  uint64_t v16 = @"status";
  v11 = [NSNumber numberWithBool:v9];
  v17[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v13 = [v10 promiseWithResult:v12];

  return v13;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
}

- (unint64_t)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(unint64_t)a3
{
  self->_outcome = a3;
}

- (void).cxx_destruct
{
}

@end