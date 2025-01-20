@interface ComAppleContextkitUtilObjcSpindleArray
- (ComAppleContextkitUtilObjcSpindleArray)initWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4;
- (id)newState;
@end

@implementation ComAppleContextkitUtilObjcSpindleArray

- (ComAppleContextkitUtilObjcSpindleArray)initWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4
{
  return self;
}

- (id)newState
{
  v2 = [ComAppleContextkitUtilObjcSpindleArray_NativeState alloc];
  ComAppleContextkitUtilSpindleArray_State_init((uint64_t)v2);
  sub_1000A8764((uint64_t)v2);
  return v2;
}

@end