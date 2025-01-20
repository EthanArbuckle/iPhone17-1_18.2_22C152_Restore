@interface ACActivityPresentationDestination
- (ACActivityPresentationDestination)initWithDestination:(int64_t)a3;
- (int64_t)destination;
@end

@implementation ACActivityPresentationDestination

- (ACActivityPresentationDestination)initWithDestination:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ACActivityPresentationDestination;
  result = [(ACActivityPresentationDestination *)&v5 init];
  if (result) {
    result->_destination = a3;
  }
  return result;
}

- (int64_t)destination
{
  return self->_destination;
}

@end