@interface HMDAttributeCodingDescription
- (BOOL)shouldInline;
- (HMDValueTransformer)transformer;
- (NSAttributeDescription)attribute;
@end

@implementation HMDAttributeCodingDescription

- (void).cxx_destruct
{
}

- (BOOL)shouldInline
{
  return self->_shouldInline;
}

- (HMDValueTransformer)transformer
{
  return self->_transformer;
}

- (NSAttributeDescription)attribute
{
  if (self)
  {
    self = [(HMDPropertyCodingDescription *)self property];
    uint64_t v2 = vars8;
  }
  return (NSAttributeDescription *)self;
}

@end