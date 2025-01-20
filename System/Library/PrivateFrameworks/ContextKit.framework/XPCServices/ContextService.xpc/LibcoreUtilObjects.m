@interface LibcoreUtilObjects
+ (BOOL)equalWithId:(id)a3 withId:(id)a4;
+ (const)__metadata;
+ (id)toStringWithId:(id)a3;
+ (int)hashCodeWithId:(id)a3;
@end

@implementation LibcoreUtilObjects

+ (BOOL)equalWithId:(id)a3 withId:(id)a4
{
  if (a3 == a4) {
    return 1;
  }
  if (a3) {
    return [a3 isEqual:a4];
  }
  return 0;
}

+ (int)hashCodeWithId:(id)a3
{
  if (a3) {
    return [a3 hash];
  }
  else {
    return 0;
  }
}

+ (id)toStringWithId:(id)a3
{
  return LibcoreUtilObjects_toStringWithId_(a3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100446E40;
}

@end