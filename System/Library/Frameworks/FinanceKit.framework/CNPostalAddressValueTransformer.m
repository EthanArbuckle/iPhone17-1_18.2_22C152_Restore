@interface CNPostalAddressValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (_TtC10FinanceKit31CNPostalAddressValueTransformer)init;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation CNPostalAddressValueTransformer

+ (Class)transformedValueClass
{
  sub_24337C218(0, &qword_26B0C8EC8);

  return (Class)swift_getObjCClassFromMetadata();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  return sub_24344DDAC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))CNPostalAddressValueTransformer.transformedValue(_:));
}

- (id)reverseTransformedValue:(id)a3
{
  return sub_24344DDAC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, _OWORD *))CNPostalAddressValueTransformer.reverseTransformedValue(_:));
}

- (_TtC10FinanceKit31CNPostalAddressValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CNPostalAddressValueTransformer *)&v3 init];
}

@end