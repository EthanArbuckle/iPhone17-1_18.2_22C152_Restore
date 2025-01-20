@interface GCVirtualControllerConfiguration
- (BOOL)isHidden;
- (NSSet)elements;
- (void)setElements:(NSSet *)elements;
- (void)setHidden:(BOOL)hidden;
@end

@implementation GCVirtualControllerConfiguration

- (NSSet)elements
{
  return self->_elements;
}

- (void)setElements:(NSSet *)elements
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (void).cxx_destruct
{
}

@end