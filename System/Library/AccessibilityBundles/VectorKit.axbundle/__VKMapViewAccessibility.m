@interface __VKMapViewAccessibility
- (id).cxx_construct;
@end

@implementation __VKMapViewAccessibility

- (void).cxx_destruct
{
  self->__geo_retain_ptr_vkcamera__._vptr$_retain_ptr = (void **)&unk_26F81E598;
}

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_26F81E598;
  *((void *)self + 2) = 0;
  return self;
}

@end