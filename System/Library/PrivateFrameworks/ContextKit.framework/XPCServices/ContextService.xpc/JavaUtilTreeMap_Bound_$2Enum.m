@interface JavaUtilTreeMap_Bound_$2Enum
+ (const)__metadata;
- (JavaUtilTreeMap_Bound_$2Enum)initWithNSString:(id)a3 withInt:(int)a4;
- (id)leftCapWithId:(id)a3;
- (id)rightCapWithId:(id)a3;
@end

@implementation JavaUtilTreeMap_Bound_$2Enum

- (id)leftCapWithId:(id)a3
{
  return (id)JreStrcat("C@", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, (id)0x28);
}

- (id)rightCapWithId:(id)a3
{
  return (id)JreStrcat("@C", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
}

- (JavaUtilTreeMap_Bound_$2Enum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004372C0;
}

@end