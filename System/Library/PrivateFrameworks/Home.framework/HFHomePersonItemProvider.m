@interface HFHomePersonItemProvider
- (HFHomePersonItemProvider)initWithHome:(id)a3;
- (HFHomePersonItemProvider)initWithHome:(id)a3 personManager:(id)a4;
@end

@implementation HFHomePersonItemProvider

- (HFHomePersonItemProvider)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = [v4 personManager];
  v8.receiver = self;
  v8.super_class = (Class)HFHomePersonItemProvider;
  v6 = [(HFPersonItemProvider *)&v8 initWithHome:v4 personManager:v5];

  return v6;
}

- (HFHomePersonItemProvider)initWithHome:(id)a3 personManager:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPersonItemProvider.m", 129, @"%s is unavailable; use %@ instead",
    "-[HFHomePersonItemProvider initWithHome:personManager:]",
    v7);

  return 0;
}

@end