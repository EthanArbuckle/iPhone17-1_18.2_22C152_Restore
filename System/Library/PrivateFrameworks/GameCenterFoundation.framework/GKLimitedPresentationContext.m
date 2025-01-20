@interface GKLimitedPresentationContext
- (GKLimitedPresentationContext)initWithScope:(int64_t)a3 elementType:(int64_t)a4;
- (int64_t)elementType;
- (int64_t)scope;
- (void)setElementType:(int64_t)a3;
- (void)setScope:(int64_t)a3;
@end

@implementation GKLimitedPresentationContext

- (GKLimitedPresentationContext)initWithScope:(int64_t)a3 elementType:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GKLimitedPresentationContext;
  result = [(GKLimitedPresentationContext *)&v7 init];
  if (result)
  {
    result->_scope = a3;
    result->_elementType = a4;
  }
  return result;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (int64_t)elementType
{
  return self->_elementType;
}

- (void)setElementType:(int64_t)a3
{
  self->_elementType = a3;
}

@end