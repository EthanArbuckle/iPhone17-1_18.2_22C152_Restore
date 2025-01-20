@interface SetValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (SetValueTransformer)init;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation SetValueTransformer

+ (Class)transformedValueClass
{
  sub_1000047D8(0, &qword_1002991C8);

  return (Class)swift_getObjCClassFromMetadata();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  return sub_100005750(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_1000050E8);
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_100005750(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))sub_100005400);
}

- (SetValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetValueTransformer();
  return [(SetValueTransformer *)&v3 init];
}

@end