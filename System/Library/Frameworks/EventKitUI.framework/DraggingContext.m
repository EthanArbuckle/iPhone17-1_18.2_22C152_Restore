@interface DraggingContext
- (BOOL)isManaged;
- (void)setIsManaged:(BOOL)a3;
@end

@implementation DraggingContext

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (void)setIsManaged:(BOOL)a3
{
  self->_isManaged = a3;
}

@end