@interface VOTCustomActionCategory
- (NSMutableArray)actions;
- (NSString)categoryName;
- (VOTCustomActionCategory)init;
- (void)setCategoryName:(id)a3;
@end

@implementation VOTCustomActionCategory

- (VOTCustomActionCategory)init
{
  v6.receiver = self;
  v6.super_class = (Class)VOTCustomActionCategory;
  v2 = [(VOTCustomActionCategory *)&v6 init];
  uint64_t v3 = +[NSMutableArray array];
  actions = v2->_actions;
  v2->_actions = (NSMutableArray *)v3;

  return v2;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end