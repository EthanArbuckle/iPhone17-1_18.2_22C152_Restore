@interface JavaLangAnnotationElementTypeEnum
+ (const)__metadata;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaLangAnnotationElementTypeEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation JavaLangAnnotationElementTypeEnum

- (JavaLangAnnotationElementTypeEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaLangAnnotationElementTypeEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaLangAnnotationElementTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"TYPE", 0);
    JavaLangAnnotationElementTypeEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaLangAnnotationElementTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"FIELD", 1);
    qword_1005640B0 = (uint64_t)v3;
    v4 = [JavaLangAnnotationElementTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"METHOD", 2);
    qword_1005640B8 = (uint64_t)v4;
    v5 = [JavaLangAnnotationElementTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"PARAMETER", 3);
    qword_1005640C0 = (uint64_t)v5;
    v6 = [JavaLangAnnotationElementTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"CONSTRUCTOR", 4);
    qword_1005640C8 = (uint64_t)v6;
    v7 = [JavaLangAnnotationElementTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v7, @"LOCAL_VARIABLE", 5);
    qword_1005640D0 = (uint64_t)v7;
    v8 = [JavaLangAnnotationElementTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v8, @"ANNOTATION_TYPE", 6);
    qword_1005640D8 = (uint64_t)v8;
    v9 = [JavaLangAnnotationElementTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v9, @"PACKAGE", 7);
    qword_1005640E0 = (uint64_t)v9;
    atomic_store(1u, (unsigned __int8 *)JavaLangAnnotationElementTypeEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100452688;
}

@end