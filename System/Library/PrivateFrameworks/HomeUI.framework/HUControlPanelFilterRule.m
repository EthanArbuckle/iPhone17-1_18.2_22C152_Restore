@interface HUControlPanelFilterRule
+ (id)ruleWithFilter:(id)a3;
- (BOOL)ruleMatchesItem:(id)a3;
- (HUControlPanelFilterRule)initWithFilter:(id)a3;
- (double)priority;
- (id)filter;
- (void)setFilter:(id)a3;
- (void)setPriority:(double)a3;
@end

@implementation HUControlPanelFilterRule

+ (id)ruleWithFilter:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFilter:v4];

  return v5;
}

- (HUControlPanelFilterRule)initWithFilter:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUControlPanelFilterRule;
  v5 = [(HUControlPanelFilterRule *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HUControlPanelFilterRule *)v5 setFilter:v4];
  }

  return v6;
}

- (BOOL)ruleMatchesItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUControlPanelFilterRule *)self filter];
  if (v5)
  {
    v6 = [(HUControlPanelFilterRule *)self filter];
    char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (double)priority
{
  return self->_priority;
}

- (void)setPriority:(double)a3
{
  self->_priority = a3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end