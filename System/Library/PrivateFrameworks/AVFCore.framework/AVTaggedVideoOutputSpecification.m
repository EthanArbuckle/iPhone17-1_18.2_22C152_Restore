@interface AVTaggedVideoOutputSpecification
- (AVTaggedVideoOutputSpecification)initWithTagCollections:(id)a3;
- (NSArray)preferredTagCollections;
- (NSDictionary)defaultPixelBufferAttributes;
- (id)realSpecification;
- (void)dealloc;
- (void)setDefaultPixelBufferAttributes:(id)a3;
- (void)setOutputPixelBufferAttributes:(id)a3 forTagCollection:(OpaqueCMTagCollection *)a4;
@end

@implementation AVTaggedVideoOutputSpecification

- (AVTaggedVideoOutputSpecification)initWithTagCollections:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTaggedVideoOutputSpecification;
  v4 = [(AVTaggedVideoOutputSpecification *)&v6 init];
  if (v4) {
    v4->_realSpecification = [[AVVideoOutputSpecification alloc] initWithTagCollections:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVTaggedVideoOutputSpecification;
  [(AVTaggedVideoOutputSpecification *)&v3 dealloc];
}

- (void)setOutputPixelBufferAttributes:(id)a3 forTagCollection:(OpaqueCMTagCollection *)a4
{
}

- (NSArray)preferredTagCollections
{
  return [(AVVideoOutputSpecification *)self->_realSpecification preferredTagCollections];
}

- (NSDictionary)defaultPixelBufferAttributes
{
  return [(AVVideoOutputSpecification *)self->_realSpecification defaultPixelBufferAttributes];
}

- (void)setDefaultPixelBufferAttributes:(id)a3
{
}

- (id)realSpecification
{
  return self->_realSpecification;
}

@end