@interface AMSUIWebItsMeTraceIdAction
- (AMSUIWebItsMeTraceIdAction)initWithContext:(id)a3;
- (AMSUIWebItsMeTraceIdAction)initWithJSObject:(id)a3 context:(id)a4;
- (id)runAction;
@end

@implementation AMSUIWebItsMeTraceIdAction

- (AMSUIWebItsMeTraceIdAction)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v5 = sub_21C2BF220();
  return (AMSUIWebItsMeTraceIdAction *)sub_21C214558(v5, a4);
}

- (id)runAction
{
  v2 = self;
  id v3 = sub_21C214774();

  return v3;
}

- (AMSUIWebItsMeTraceIdAction)initWithContext:(id)a3
{
  id v3 = a3;
  sub_21C214E18();
}

- (void).cxx_destruct
{
}

@end