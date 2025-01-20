@interface CNCardContactContainerGroup
- (NSArray)containers;
- (id)displayItems;
- (id)editingItems;
- (void)setContainers:(id)a3;
@end

@implementation CNCardContactContainerGroup

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

- (id)editingItems
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [CNCardContactContainerGroupItem alloc];
  v4 = [(CNCardContactContainerGroup *)self containers];
  v5 = [(CNCardContactContainerGroupItem *)v3 initWithContainers:v4];

  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)displayItems
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end