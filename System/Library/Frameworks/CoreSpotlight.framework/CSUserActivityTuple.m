@interface CSUserActivityTuple
- (CSSearchableItem)item;
- (CSUserAction)action;
- (CSUserActivityTuple)initWithAction:(id)a3 item:(id)a4;
- (NSString)protectionClass;
- (id)description;
- (id)searchableItem;
- (void)setAction:(id)a3;
- (void)setItem:(id)a3;
- (void)setProtectionClass:(id)a3;
- (void)updateWithItem:(id)a3;
@end

@implementation CSUserActivityTuple

- (id)searchableItem
{
  return self->_item;
}

- (void)updateWithItem:(id)a3
{
  uint64_t v4 = [a3 action];
  if (v4) {
    [(CSUserAction *)self->_action updateWithUserAction:v4];
  }

  MEMORY[0x1F41817F8]();
}

- (CSUserAction)action
{
  return (CSUserAction *)objc_getProperty(self, a2, 8, 1);
}

- (CSUserActivityTuple)initWithAction:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSUserActivityTuple;
  v9 = [(CSUserActivityTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v10->_item, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<%@:%p; %@ %@>",
                 objc_opt_class(),
                 self,
                 self->_action,
                 self->_item);

  return v2;
}

- (void)setAction:(id)a3
{
}

- (CSSearchableItem)item
{
  return (CSSearchableItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setItem:(id)a3
{
}

- (NSString)protectionClass
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProtectionClass:(id)a3
{
}

@end