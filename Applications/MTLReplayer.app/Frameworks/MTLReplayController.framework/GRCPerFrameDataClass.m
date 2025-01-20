@interface GRCPerFrameDataClass
- (GRCPerFrameDataClass)init;
- (id).cxx_construct;
@end

@implementation GRCPerFrameDataClass

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (GRCPerFrameDataClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)GRCPerFrameDataClass;
  return [(GRCPerFrameDataClass *)&v3 init];
}

@end