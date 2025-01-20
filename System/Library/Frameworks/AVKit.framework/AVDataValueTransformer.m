@interface AVDataValueTransformer
+ (id)messageTransformerWithClass:(Class)a3;
- (id)dataForMessage:(id)a3;
- (id)reverseTransformerForMessageData:(id)a3;
@end

@implementation AVDataValueTransformer

- (id)reverseTransformerForMessageData:(id)a3
{
  return 0;
}

- (id)dataForMessage:(id)a3
{
  return 0;
}

+ (id)messageTransformerWithClass:(Class)a3
{
  v3 = [[AVAirMessageTransformer alloc] initWithMessageClass:a3];

  return v3;
}

@end