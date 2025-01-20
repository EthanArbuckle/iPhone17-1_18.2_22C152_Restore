@interface CNUIUserActionItemList
- (CNUIUserActionItemList)initWithItems:(id)a3 type:(id)a4 icon:(id)a5;
- (NSArray)items;
- (NSString)type;
- (UIImage)icon;
@end

@implementation CNUIUserActionItemList

- (CNUIUserActionItemList)initWithItems:(id)a3 type:(id)a4 icon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNUIUserActionItemList;
  v11 = [(CNUIUserActionItemList *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    items = v11->_items;
    v11->_items = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    type = v11->_type;
    v11->_type = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    icon = v11->_icon;
    v11->_icon = (UIImage *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSString)type
{
  return self->_type;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end