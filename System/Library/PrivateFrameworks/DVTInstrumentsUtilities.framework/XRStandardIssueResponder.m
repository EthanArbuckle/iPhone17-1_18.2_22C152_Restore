@interface XRStandardIssueResponder
+ (id)defaultResponder;
+ (void)initialize;
+ (void)setDefaultResponder:(id)a3;
- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5;
@end

@implementation XRStandardIssueResponder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_2687AA098 = objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

+ (id)defaultResponder
{
  return (id)qword_2687AA098;
}

+ (void)setDefaultResponder:(id)a3
{
}

- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5
{
  unsigned int v6 = a4;
  id v10 = a3;
  id v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  if (v6 >= 4) {
    __assert_rtn("-[XRStandardIssueResponder handleIssue:type:from:]", "XRStandardIssueResponder.m", 45, "0");
  }
  NSLog(&off_264BF0D68[v6]->isa, v10, v8);
  objc_sync_exit(v9);
}

@end