@interface FBKSCustomBehavior
- (BOOL)isCaptive;
- (BOOL)launchNewDraft;
- (BOOL)makeVisible;
- (BOOL)notifyOnUpload;
- (FBKSCustomBehavior)initWithDictionary:(id)a3;
- (NSDictionary)answers;
- (NSNumber)formId;
- (NSString)description;
- (void)setAnswers:(id)a3;
- (void)setFormId:(id)a3;
- (void)setIsCaptive:(BOOL)a3;
- (void)setLaunchNewDraft:(BOOL)a3;
- (void)setMakeVisible:(BOOL)a3;
- (void)setNotifyOnUpload:(BOOL)a3;
@end

@implementation FBKSCustomBehavior

- (FBKSCustomBehavior)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FBKSCustomBehavior;
  v5 = [(FBKSCustomBehavior *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"make_visible"];
    v5->_makeVisible = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"notify_on_upload"];
    v5->_notifyOnUpload = [v7 BOOLValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"answers"];
    answers = v5->_answers;
    v5->_answers = (NSDictionary *)v8;

    v10 = [v4 objectForKeyedSubscript:@"launch_new_draft"];
    v5->_launchNewDraft = [v10 BOOLValue];

    v11 = [v4 objectForKeyedSubscript:@"is_captive"];
    v5->_isCaptive = [v11 BOOLValue];

    v12 = [v4 objectForKeyedSubscript:@"form_id"];
    if (v12) {
      objc_storeStrong((id *)&v5->_formId, v12);
    }
  }
  return v5;
}

- (NSString)description
{
  v13 = NSString;
  if ([(FBKSCustomBehavior *)self isCaptive]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if ([(FBKSCustomBehavior *)self makeVisible]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if ([(FBKSCustomBehavior *)self notifyOnUpload]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(FBKSCustomBehavior *)self formId];
  if (v7)
  {
    v2 = [(FBKSCustomBehavior *)self formId];
    uint64_t v8 = [v2 stringValue];
  }
  else
  {
    uint64_t v8 = @"(null)";
  }
  if ([(FBKSCustomBehavior *)self launchNewDraft]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(FBKSCustomBehavior *)self isCaptive]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = [v13 stringWithFormat:@"FBKSCustomBehavior – isCaptive:%@, makeVisible:%@, notifyOnUpload:%@, formID:%@, launchDraft:%@, answers:%@", v4, v5, v6, v8, v9, v10];
  if (v7)
  {
  }
  return (NSString *)v11;
}

- (BOOL)makeVisible
{
  return self->_makeVisible;
}

- (void)setMakeVisible:(BOOL)a3
{
  self->_makeVisible = a3;
}

- (BOOL)notifyOnUpload
{
  return self->_notifyOnUpload;
}

- (void)setNotifyOnUpload:(BOOL)a3
{
  self->_notifyOnUpload = a3;
}

- (NSNumber)formId
{
  return self->_formId;
}

- (void)setFormId:(id)a3
{
}

- (NSDictionary)answers
{
  return self->_answers;
}

- (void)setAnswers:(id)a3
{
}

- (BOOL)launchNewDraft
{
  return self->_launchNewDraft;
}

- (void)setLaunchNewDraft:(BOOL)a3
{
  self->_launchNewDraft = a3;
}

- (BOOL)isCaptive
{
  return self->_isCaptive;
}

- (void)setIsCaptive:(BOOL)a3
{
  self->_isCaptive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_formId, 0);
}

@end