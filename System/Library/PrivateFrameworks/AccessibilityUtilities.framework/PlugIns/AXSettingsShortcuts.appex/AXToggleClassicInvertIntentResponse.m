@interface AXToggleClassicInvertIntentResponse
+ (id)continueInAppIntentResponseWithState:(int64_t)a3;
+ (id)failureRequiringAppLaunchIntentResponseWithState:(int64_t)a3;
+ (id)inProgressIntentResponseWithState:(int64_t)a3;
+ (id)readyIntentResponseWithState:(int64_t)a3;
+ (id)successIntentResponseWithState:(int64_t)a3;
+ (id)unspecifiedIntentResponseWithState:(int64_t)a3;
- (AXToggleClassicInvertIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation AXToggleClassicInvertIntentResponse

- (AXToggleClassicInvertIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AXToggleClassicInvertIntentResponse;
  v7 = [(AXToggleClassicInvertIntentResponse *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    [(AXToggleClassicInvertIntentResponse *)v7 setUserActivity:v6];
  }

  return v8;
}

+ (id)unspecifiedIntentResponseWithState:(int64_t)a3
{
  v4 = [[AXToggleClassicInvertIntentResponse alloc] initWithCode:0 userActivity:0];
  [(AXToggleClassicInvertIntentResponse *)v4 setState:a3];

  return v4;
}

+ (id)readyIntentResponseWithState:(int64_t)a3
{
  v4 = [[AXToggleClassicInvertIntentResponse alloc] initWithCode:1 userActivity:0];
  [(AXToggleClassicInvertIntentResponse *)v4 setState:a3];

  return v4;
}

+ (id)continueInAppIntentResponseWithState:(int64_t)a3
{
  v4 = [[AXToggleClassicInvertIntentResponse alloc] initWithCode:2 userActivity:0];
  [(AXToggleClassicInvertIntentResponse *)v4 setState:a3];

  return v4;
}

+ (id)inProgressIntentResponseWithState:(int64_t)a3
{
  v4 = [[AXToggleClassicInvertIntentResponse alloc] initWithCode:3 userActivity:0];
  [(AXToggleClassicInvertIntentResponse *)v4 setState:a3];

  return v4;
}

+ (id)successIntentResponseWithState:(int64_t)a3
{
  v4 = [[AXToggleClassicInvertIntentResponse alloc] initWithCode:4 userActivity:0];
  [(AXToggleClassicInvertIntentResponse *)v4 setState:a3];

  return v4;
}

+ (id)failureRequiringAppLaunchIntentResponseWithState:(int64_t)a3
{
  v4 = [[AXToggleClassicInvertIntentResponse alloc] initWithCode:6 userActivity:0];
  [(AXToggleClassicInvertIntentResponse *)v4 setState:a3];

  return v4;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

@end