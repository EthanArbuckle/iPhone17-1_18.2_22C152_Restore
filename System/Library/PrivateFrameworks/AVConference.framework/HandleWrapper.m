@interface HandleWrapper
- (tagHANDLE)handle;
- (void)setHandle:(tagHANDLE *)a3;
@end

@implementation HandleWrapper

- (tagHANDLE)handle
{
  return self->handle;
}

- (void)setHandle:(tagHANDLE *)a3
{
  self->handle = a3;
}

@end