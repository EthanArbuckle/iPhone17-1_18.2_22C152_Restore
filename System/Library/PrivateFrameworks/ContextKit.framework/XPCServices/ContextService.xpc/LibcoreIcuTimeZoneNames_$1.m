@interface LibcoreIcuTimeZoneNames_$1
+ (const)__metadata;
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation LibcoreIcuTimeZoneNames_$1

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3) {
    goto LABEL_9;
  }
  uint64_t v4 = *((unsigned int *)a3 + 2);
  if ((int)v4 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v4, 0);
  }
  v5 = (void *)*((void *)a3 + 3);
  if (!v5 || !a4) {
LABEL_9:
  }
    JreThrowNullPointerException();
  uint64_t v6 = *((unsigned int *)a4 + 2);
  if ((int)v6 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 0);
  }
  uint64_t v7 = *((void *)a4 + 3);
  return [v5 compareToWithId:v7];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041CE58;
}

@end