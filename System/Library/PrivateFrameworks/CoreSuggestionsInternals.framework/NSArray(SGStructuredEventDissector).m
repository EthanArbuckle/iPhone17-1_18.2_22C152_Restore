@interface NSArray(SGStructuredEventDissector)
- (BOOL)sg_isEmptySchemaObject;
- (uint64_t)sg_deepCopyWithoutEmptySchemaObjects;
@end

@implementation NSArray(SGStructuredEventDissector)

- (BOOL)sg_isEmptySchemaObject
{
  v1 = objc_msgSend(a1, "sg_deepCopyWithoutEmptySchemaObjects");
  BOOL v2 = [v1 count] == 0;

  return v2;
}

- (uint64_t)sg_deepCopyWithoutEmptySchemaObjects
{
  return objc_msgSend(a1, "_pas_mappedArrayWithTransform:", &__block_literal_global_16378);
}

@end