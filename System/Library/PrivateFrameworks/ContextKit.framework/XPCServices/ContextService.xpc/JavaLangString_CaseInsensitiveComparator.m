@interface JavaLangString_CaseInsensitiveComparator
+ (J2ObjcClassInfo)__metadata;
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation JavaLangString_CaseInsensitiveComparator

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3)
  {
    v6 = (objc_class *)objc_opt_class();
    id Exception = makeException(v6);
    objc_exception_throw(Exception);
  }
  return [a3 compareToIgnoreCase:a4];
}

+ (J2ObjcClassInfo)__metadata
{
  return (J2ObjcClassInfo *)&unk_10055F258;
}

@end