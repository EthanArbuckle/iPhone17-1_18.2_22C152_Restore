@interface ICSDynamicSystemUIPresentationStyleHandler
- (ICSDynamicSystemUIPresentationStyleHandler)init;
- (void)handlePresentationModeChanged:(int64_t)a3 scene:(id)a4;
@end

@implementation ICSDynamicSystemUIPresentationStyleHandler

- (void)handlePresentationModeChanged:(int64_t)a3 scene:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_1001B4028(a3, v6);
}

- (ICSDynamicSystemUIPresentationStyleHandler)init
{
  return (ICSDynamicSystemUIPresentationStyleHandler *)sub_1001B4180();
}

@end