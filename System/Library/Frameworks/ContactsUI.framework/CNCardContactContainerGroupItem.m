@interface CNCardContactContainerGroupItem
- (CNCardContactContainerGroupItem)initWithContainers:(id)a3;
- (NSArray)containers;
- (void)setContainers:(id)a3;
@end

@implementation CNCardContactContainerGroupItem

- (void).cxx_destruct
{
}

- (void)setContainers:(id)a3
{
}

- (NSArray)containers
{
  return self->_containers;
}

- (CNCardContactContainerGroupItem)initWithContainers:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCardContactContainerGroupItem;
  v6 = [(CNCardContactContainerGroupItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containers, a3);
    v8 = v7;
  }

  return v7;
}

@end