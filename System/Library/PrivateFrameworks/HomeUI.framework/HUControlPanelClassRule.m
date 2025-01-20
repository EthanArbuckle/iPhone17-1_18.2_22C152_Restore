@interface HUControlPanelClassRule
+ (id)ruleWithControlItemClass:(Class)a3;
+ (id)ruleWithControlItemProtocol:(id)a3;
- (BOOL)ruleMatchesItem:(id)a3;
- (Class)class;
- (HUControlPanelClassRule)initWithControlItemClass:(Class)a3 protocol:(id)a4;
- (Protocol)protocol;
- (double)priority;
- (void)setClass:(Class)a3;
- (void)setPriority:(double)a3;
- (void)setProtocol:(id)a3;
@end

@implementation HUControlPanelClassRule

+ (id)ruleWithControlItemClass:(Class)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithControlItemClass:a3 protocol:&unk_1F19B7580];

  return v3;
}

+ (id)ruleWithControlItemProtocol:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithControlItemClass:objc_opt_class() protocol:v4];

  return v5;
}

- (HUControlPanelClassRule)initWithControlItemClass:(Class)a3 protocol:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUControlPanelClassRule;
  v7 = [(HUControlPanelClassRule *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(HUControlPanelClassRule *)v7 setClass:a3];
    [(HUControlPanelClassRule *)v8 setProtocol:v6];
  }

  return v8;
}

- (BOOL)ruleMatchesItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 controlItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__HUControlPanelClassRule_ruleMatchesItem___block_invoke;
  v10[3] = &unk_1E6384EB8;
  v10[4] = self;
  char v6 = objc_msgSend(v5, "na_all:", v10);

  v7 = [v4 controlItems];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__HUControlPanelClassRule_ruleMatchesItem___block_invoke_2;
  v9[3] = &unk_1E6384EB8;
  v9[4] = self;
  LOBYTE(self) = objc_msgSend(v7, "na_all:", v9);

  return v6 & self;
}

uint64_t __43__HUControlPanelClassRule_ruleMatchesItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 protocol];
  uint64_t v5 = [v3 conformsToProtocol:v4];

  return v5;
}

uint64_t __43__HUControlPanelClassRule_ruleMatchesItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)priority
{
  return self->_priority;
}

- (void)setPriority:(double)a3
{
  self->_priority = a3;
}

- (Class)class
{
  return self->_class;
}

- (void)setClass:(Class)a3
{
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_storeStrong((id *)&self->_class, 0);
}

@end