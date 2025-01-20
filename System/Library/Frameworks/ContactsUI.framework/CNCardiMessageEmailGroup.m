@interface CNCardiMessageEmailGroup
- (CNCardiMessageEmailGroup)initWithContact:(id)a3 propertyItem:(id)a4;
- (id)displayItems;
@end

@implementation CNCardiMessageEmailGroup

- (void).cxx_destruct
{
}

- (id)displayItems
{
  return self->_displayItems;
}

- (CNCardiMessageEmailGroup)initWithContact:(id)a3 propertyItem:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CNCardiMessageEmailGroup;
  v7 = [(CNCardGroup *)&v11 initWithContact:a3];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
    displayItems = v7->_displayItems;
    v7->_displayItems = (NSArray *)v8;
  }
  return v7;
}

@end