@interface WFSetBrightnessIntentResponse
- (WFSetBrightnessIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation WFSetBrightnessIntentResponse

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (int64_t)code
{
  return self->_code;
}

- (WFSetBrightnessIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFSetBrightnessIntentResponse;
  v7 = [(WFSetBrightnessIntentResponse *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    [(WFSetBrightnessIntentResponse *)v7 setUserActivity:v6];
  }

  return v8;
}

@end