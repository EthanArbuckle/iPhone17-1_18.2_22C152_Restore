@interface HFStaticItemProvider
- (BOOL)hasProvidedItems;
- (HFStaticItemProvider)init;
- (HFStaticItemProvider)initWithHome:(id)a3 items:(id)a4;
- (HFStaticItemProvider)initWithItems:(id)a3;
- (NSSet)staticItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)items;
- (id)reloadItems;
- (void)setHasProvidedItems:(BOOL)a3;
- (void)setStaticItems:(id)a3;
@end

@implementation HFStaticItemProvider

- (id)items
{
  if ([(HFStaticItemProvider *)self hasProvidedItems]) {
    [(HFStaticItemProvider *)self staticItems];
  }
  else {
  v3 = [MEMORY[0x263EFFA08] set];
  }
  return v3;
}

- (BOOL)hasProvidedItems
{
  return self->_hasProvidedItems;
}

- (NSSet)staticItems
{
  return self->_staticItems;
}

- (HFStaticItemProvider)initWithItems:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFStaticItemProvider;
  v5 = [(HFItemProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HFStaticItemProvider *)v5 setStaticItems:v4];
  }

  return v6;
}

- (void)setStaticItems:(id)a3
{
}

- (id)reloadItems
{
  if ([(HFStaticItemProvider *)self hasProvidedItems])
  {
    v3 = 0;
  }
  else
  {
    v3 = [(HFStaticItemProvider *)self staticItems];
  }
  if ([(HFStaticItemProvider *)self hasProvidedItems])
  {
    id v4 = [(HFStaticItemProvider *)self staticItems];
  }
  else
  {
    id v4 = 0;
  }
  [(HFStaticItemProvider *)self setHasProvidedItems:1];
  v5 = [[HFItemProviderReloadResults alloc] initWithAddedItems:v3 removedItems:0 existingItems:v4];
  v6 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v6;
}

- (void)setHasProvidedItems:(BOOL)a3
{
  self->_hasProvidedItems = a3;
}

- (HFStaticItemProvider)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithItems_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFStaticItemProvider.m", 23, @"%s is unavailable; use %@ instead",
    "-[HFStaticItemProvider init]",
    v5);

  return 0;
}

- (HFStaticItemProvider)initWithHome:(id)a3 items:(id)a4
{
  return [(HFStaticItemProvider *)self initWithItems:a4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFStaticItemProvider *)self items];
  v6 = (void *)[v4 initWithItems:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end