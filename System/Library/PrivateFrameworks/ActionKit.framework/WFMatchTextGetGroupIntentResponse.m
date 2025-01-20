@interface WFMatchTextGetGroupIntentResponse
+ (id)noMatchIntentResponseWithNoMatchIndex:(id)a3;
+ (id)rangeErrorIntentResponseWithRangeErrorGroupNumber:(id)a3 rangeErrorGroupCount:(id)a4;
- (WFMatchTextGetGroupIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation WFMatchTextGetGroupIntentResponse

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (int64_t)code
{
  return self->_code;
}

- (WFMatchTextGetGroupIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFMatchTextGetGroupIntentResponse;
  v7 = [(WFMatchTextGetGroupIntentResponse *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_code = a3;
    [(WFMatchTextGetGroupIntentResponse *)v7 setUserActivity:v6];
  }

  return v8;
}

+ (id)rangeErrorIntentResponseWithRangeErrorGroupNumber:(id)a3 rangeErrorGroupCount:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[WFMatchTextGetGroupIntentResponse alloc] initWithCode:101 userActivity:0];
  [(WFMatchTextGetGroupIntentResponse *)v7 setRangeErrorGroupNumber:v6];

  [(WFMatchTextGetGroupIntentResponse *)v7 setRangeErrorGroupCount:v5];
  return v7;
}

+ (id)noMatchIntentResponseWithNoMatchIndex:(id)a3
{
  id v3 = a3;
  v4 = [[WFMatchTextGetGroupIntentResponse alloc] initWithCode:100 userActivity:0];
  [(WFMatchTextGetGroupIntentResponse *)v4 setNoMatchIndex:v3];

  return v4;
}

@end