@interface CKTranscriptScrollIntentUpdateRequest
- (BOOL)wantsDeferredScrollIntentEnforcement;
- (CKScrollViewAnimationProperties)animationProperties;
- (CKTranscriptScrollIntentUpdateRequest)initWithAnimatedIntent:(int64_t)a3 animationProperties:(id)a4;
- (id)description;
- (id)initDeferredScrollIntentEnforcementWithIntent:(int64_t)a3;
- (int64_t)intent;
@end

@implementation CKTranscriptScrollIntentUpdateRequest

- (id)initDeferredScrollIntentEnforcementWithIntent:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptScrollIntentUpdateRequest;
  v4 = [(CKTranscriptScrollIntentUpdateRequest *)&v8 init];
  v5 = v4;
  if (v4)
  {
    animationProperties = v4->_animationProperties;
    v4->_intent = a3;
    v4->_animationProperties = 0;

    v5->_wantsDeferredScrollIntentEnforcement = 1;
  }
  return v5;
}

- (CKTranscriptScrollIntentUpdateRequest)initWithAnimatedIntent:(int64_t)a3 animationProperties:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptScrollIntentUpdateRequest;
  objc_super v8 = [(CKTranscriptScrollIntentUpdateRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_intent = a3;
    objc_storeStrong((id *)&v8->_animationProperties, a4);
    v9->_wantsDeferredScrollIntentEnforcement = 0;
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = CKDebugNameForCKTranscriptScrollIntent([(CKTranscriptScrollIntentUpdateRequest *)self intent]);
  [v3 appendFormat:@" intent=%@", v4];

  v5 = [(CKTranscriptScrollIntentUpdateRequest *)self animationProperties];
  [v3 appendFormat:@" animationProperties=%@", v5];

  BOOL v6 = [(CKTranscriptScrollIntentUpdateRequest *)self wantsDeferredScrollIntentEnforcement];
  id v7 = @"NO";
  if (v6) {
    id v7 = @"YES";
  }
  [v3 appendFormat:@" wantsDeferredScrollIntentEnforcement=%@", v7];
  [v3 appendString:@">"];
  objc_super v8 = (void *)[v3 copy];

  return v8;
}

- (int64_t)intent
{
  return self->_intent;
}

- (CKScrollViewAnimationProperties)animationProperties
{
  return self->_animationProperties;
}

- (BOOL)wantsDeferredScrollIntentEnforcement
{
  return self->_wantsDeferredScrollIntentEnforcement;
}

- (void).cxx_destruct
{
}

@end