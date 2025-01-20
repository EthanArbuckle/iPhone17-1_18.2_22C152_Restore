@interface BWNodeMessage
- (int)category;
- (int)type;
@end

@implementation BWNodeMessage

- (int)category
{
  return self->_category;
}

- (int)type
{
  return self->_type;
}

@end