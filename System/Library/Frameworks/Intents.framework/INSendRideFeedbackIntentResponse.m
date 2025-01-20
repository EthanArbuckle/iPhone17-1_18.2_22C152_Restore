@interface INSendRideFeedbackIntentResponse
+ (BOOL)supportsSecureCoding;
- (INSendRideFeedbackIntentResponse)initWithBackingStore:(id)a3;
- (INSendRideFeedbackIntentResponse)initWithCode:(INSendRideFeedbackIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INSendRideFeedbackIntentResponse)initWithCoder:(id)a3;
- (INSendRideFeedbackIntentResponseCode)code;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSendRideFeedbackIntentResponse

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INSendRideFeedbackIntentResponseCode v3 = [(INSendRideFeedbackIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INSendRideFeedbackIntentResponseCodeFailure)
  {
    v5 = off_1E551A8E8[v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"userActivity";
  v11[0] = v5;
  v6 = [(INIntentResponse *)self userActivity];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 4) {

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INSendRideFeedbackIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (INSendRideFeedbackIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSendRideFeedbackIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (INSendRideFeedbackIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INSendRideFeedbackIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INSendRideFeedbackIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INSendRideFeedbackIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INSendRideFeedbackIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INSendRideFeedbackIntentResponse)initWithCode:(INSendRideFeedbackIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  v5.receiver = self;
  v5.super_class = (Class)INSendRideFeedbackIntentResponse;
  return (INSendRideFeedbackIntentResponse *)[(INIntentResponse *)&v5 _initWithCode:code userActivity:userActivity];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end