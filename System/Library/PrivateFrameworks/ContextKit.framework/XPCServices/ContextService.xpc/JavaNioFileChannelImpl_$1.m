@interface JavaNioFileChannelImpl_$1
+ (const)__metadata;
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation JavaNioFileChannelImpl_$1

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3 || (id v5 = [a3 position], !a4)) {
    JreThrowNullPointerException();
  }
  id v6 = v5;
  id v7 = [a4 position];
  if ((uint64_t)v6 >= (uint64_t)v7) {
    int v8 = 0;
  }
  else {
    int v8 = -1;
  }
  if ((uint64_t)v6 > (uint64_t)v7) {
    return 1;
  }
  else {
    return v8;
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100457870;
}

@end