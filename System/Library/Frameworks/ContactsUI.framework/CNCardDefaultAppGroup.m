@interface CNCardDefaultAppGroup
- (id)displayItems;
@end

@implementation CNCardDefaultAppGroup

- (void).cxx_destruct
{
}

- (id)displayItems
{
  displayItems = self->_displayItems;
  if (!displayItems)
  {
    v4 = objc_alloc_init(CNCardDefaultAppGroupItem);
    v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
    v6 = self->_displayItems;
    self->_displayItems = v5;

    displayItems = self->_displayItems;
  }

  return displayItems;
}

@end