@interface JreStringCategoryDummy
+ (void)initialize;
@end

@implementation JreStringCategoryDummy

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&NSString_CASE_INSENSITIVE_ORDER_, objc_alloc_init(JavaLangString_CaseInsensitiveComparator));
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&NSString_serialPersistentFields_, v2);
    atomic_store(1u, (unsigned __int8 *)&NSString__initialized);
  }
}

@end