@interface JavaLangSafeVarargs
+ (const)__metadata;
+ (id)__annotations;
- (NSString)description;
- (id)annotationType;
@end

@implementation JavaLangSafeVarargs

- (id)annotationType
{
  if (qword_100562790 != -1) {
    dispatch_once(&qword_100562790, &stru_10047B4A8);
  }
  return (id)qword_100562788;
}

- (NSString)description
{
  return (NSString *)@"@java.lang.SafeVarargs()";
}

+ (id)__annotations
{
  v8 = objc_alloc_init(JavaLangAnnotationDocumented);
  v2 = [JavaLangAnnotationRetention alloc];
  if ((atomic_load_explicit(JavaLangAnnotationRetentionPolicyEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v9 = [(JavaLangAnnotationRetention *)v2 initWithValue:qword_100563AF8];
  v3 = [JavaLangAnnotationTarget alloc];
  if ((atomic_load_explicit(JavaLangAnnotationElementTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v6 = qword_1005640C8;
  if ((atomic_load_explicit(JavaLangAnnotationElementTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v7 = qword_1005640B8;
  v4 = +[IOSObjectArray arrayWithObjects:&v6 count:2 type:NSObject_class_()];
  v10 = -[JavaLangAnnotationTarget initWithValue:](v3, "initWithValue:", v4, v6, v7, v8, v9);
  return +[IOSObjectArray arrayWithObjects:&v8 count:3 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047B438;
}

@end