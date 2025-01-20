@interface WFMatchTextIntentResponse
+ (id)invalidRegularExpressionIntentResponseWithErrorDescription:(id)a3;
- (WFMatchTextIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation WFMatchTextIntentResponse

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (int64_t)code
{
  return self->_code;
}

- (WFMatchTextIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFMatchTextIntentResponse;
  v7 = [(WFMatchTextIntentResponse *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    [(WFMatchTextIntentResponse *)v7 setUserActivity:v6];
  }

  return v8;
}

+ (id)invalidRegularExpressionIntentResponseWithErrorDescription:(id)a3
{
  id v3 = a3;
  v4 = [[WFMatchTextIntentResponse alloc] initWithCode:100 userActivity:0];
  [(WFMatchTextIntentResponse *)v4 setErrorDescription:v3];

  return v4;
}

@end