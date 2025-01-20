@interface ICSTelephonyUnsuportedAlert
- (ICSTelephonyUnsuportedAlert)init;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)title;
- (void)alternateResponse;
- (void)defaultResponse;
- (void)show;
@end

@implementation ICSTelephonyUnsuportedAlert

- (NSString)title
{
  return (NSString *)sub_10018BB50(self, (uint64_t)a2, (void (*)(void))sub_10018B9B4);
}

- (NSString)message
{
  return (NSString *)sub_10018BB50(self, (uint64_t)a2, (void (*)(void))sub_10018BA48);
}

- (NSString)defaultButtonTitle
{
  return (NSString *)sub_10018BB50(self, (uint64_t)a2, (void (*)(void))sub_10018BAD4);
}

- (NSString)alternateButtonTitle
{
  return (NSString *)sub_10018BB50(self, (uint64_t)a2, (void (*)(void))sub_10018BBCC);
}

- (void)defaultResponse
{
}

- (void)alternateResponse
{
  v2 = self;
  sub_10018BC64();
}

- (void)show
{
  v2 = self;
  sub_10018BE58();
}

- (ICSTelephonyUnsuportedAlert)init
{
  return (ICSTelephonyUnsuportedAlert *)sub_1001831FC();
}

@end