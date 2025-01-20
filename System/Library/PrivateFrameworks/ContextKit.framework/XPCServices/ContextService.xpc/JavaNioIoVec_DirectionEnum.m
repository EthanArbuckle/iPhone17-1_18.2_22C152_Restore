@interface JavaNioIoVec_DirectionEnum
+ (const)__metadata;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaNioIoVec_DirectionEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation JavaNioIoVec_DirectionEnum

- (JavaNioIoVec_DirectionEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaNioIoVec_DirectionEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaNioIoVec_DirectionEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"READV", 0);
    JavaNioIoVec_DirectionEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaNioIoVec_DirectionEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"WRITEV", 1);
    qword_100563EC0 = (uint64_t)v3;
    atomic_store(1u, (unsigned __int8 *)JavaNioIoVec_DirectionEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004309C0;
}

@end