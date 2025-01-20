@interface JavaUtilTreeMap_RelationEnum
+ (const)__metadata;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaUtilTreeMap_RelationEnum)initWithNSString:(id)a3 withInt:(int)a4;
- (id)forOrderWithBoolean:(BOOL)a3;
@end

@implementation JavaUtilTreeMap_RelationEnum

- (id)forOrderWithBoolean:(BOOL)a3
{
  if (!a3)
  {
    switch([self ordinal])
    {
      case 0u:
        self = (id)qword_100563F08;
        break;
      case 1u:
        self = (id)qword_100563F00;
        break;
      case 2u:
        self = (id)qword_100563EF0;
        break;
      case 4u:
        self = (id)qword_100563EE8;
        break;
      case 5u:
        self = (id)JavaUtilTreeMap_RelationEnum_values_;
        break;
      default:
        v3 = new_JavaLangIllegalStateException_init();
        objc_exception_throw(v3);
    }
  }
  return self;
}

- (JavaUtilTreeMap_RelationEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaUtilTreeMap_RelationEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaUtilTreeMap_RelationEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"LOWER", 0);
    JavaUtilTreeMap_RelationEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaUtilTreeMap_RelationEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"FLOOR", 1);
    qword_100563EE8 = (uint64_t)v3;
    v4 = [JavaUtilTreeMap_RelationEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"EQUAL", 2);
    qword_100563EF0 = (uint64_t)v4;
    v5 = [JavaUtilTreeMap_RelationEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"CREATE", 3);
    qword_100563EF8 = (uint64_t)v5;
    v6 = [JavaUtilTreeMap_RelationEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"CEILING", 4);
    qword_100563F00 = (uint64_t)v6;
    v7 = [JavaUtilTreeMap_RelationEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v7, @"HIGHER", 5);
    qword_100563F08 = (uint64_t)v7;
    atomic_store(1u, (unsigned __int8 *)&JavaUtilTreeMap_RelationEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100435DB0;
}

@end