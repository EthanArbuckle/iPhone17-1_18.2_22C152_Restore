@interface AKMinimalUserInterfaceItem
- (AKMinimalUserInterfaceItem)initWithTag:(int64_t)a3;
- (int64_t)tag;
@end

@implementation AKMinimalUserInterfaceItem

- (AKMinimalUserInterfaceItem)initWithTag:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKMinimalUserInterfaceItem;
  result = [(AKMinimalUserInterfaceItem *)&v5 init];
  if (result) {
    result->_tag = a3;
  }
  return result;
}

- (int64_t)tag
{
  return self->_tag;
}

@end