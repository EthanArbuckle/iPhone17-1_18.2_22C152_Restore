@interface DKTrackingConfig
- (BOOL)customInferenceEnabled;
- (DKTrackingConfig)initWithClientApplicationID:(id)a3 customInferenceEnabled:(id)a4;
- (NSString)clientApplicationID;
- (void)setClientApplicationID:(id)a3;
- (void)setCustomInferenceEnabled:(BOOL)a3;
@end

@implementation DKTrackingConfig

- (DKTrackingConfig)initWithClientApplicationID:(id)a3 customInferenceEnabled:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKTrackingConfig;
  v9 = [(DKTrackingConfig *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientApplicationID, a3);
    v10->_customInferenceEnabled = v8 != 0;
  }

  return v10;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

- (BOOL)customInferenceEnabled
{
  return self->_customInferenceEnabled;
}

- (void)setCustomInferenceEnabled:(BOOL)a3
{
  self->_customInferenceEnabled = a3;
}

- (void).cxx_destruct
{
}

@end