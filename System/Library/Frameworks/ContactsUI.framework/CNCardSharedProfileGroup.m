@interface CNCardSharedProfileGroup
- (BOOL)isMultiValue;
- (id)editingItems;
@end

@implementation CNCardSharedProfileGroup

- (id)editingItems
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isMultiValue
{
  return 0;
}

@end