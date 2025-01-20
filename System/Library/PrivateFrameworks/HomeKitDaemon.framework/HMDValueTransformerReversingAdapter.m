@interface HMDValueTransformerReversingAdapter
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation HMDValueTransformerReversingAdapter

- (id)reverseTransformedValue:(id)a3
{
  return [(NSValueTransformer *)self->super._transformer transformedValue:a3];
}

- (id)transformedValue:(id)a3
{
  return [(NSValueTransformer *)self->super._transformer reverseTransformedValue:a3];
}

@end