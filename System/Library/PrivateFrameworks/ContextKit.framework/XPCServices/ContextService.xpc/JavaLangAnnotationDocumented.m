@interface JavaLangAnnotationDocumented
+ (const)__metadata;
+ (id)__annotations;
- (NSString)description;
- (id)annotationType;
@end

@implementation JavaLangAnnotationDocumented

- (id)annotationType
{
  if (qword_100560868 != -1) {
    dispatch_once(&qword_100560868, &stru_1003FCFA0);
  }
  return (id)qword_100560860;
}

- (NSString)description
{
  return (NSString *)@"@java.lang.annotation.Documented()";
}

+ (id)__annotations
{
  v6[0] = objc_alloc_init(JavaLangAnnotationDocumented);
  v2 = [JavaLangAnnotationRetention alloc];
  if ((atomic_load_explicit(JavaLangAnnotationRetentionPolicyEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v6[1] = [(JavaLangAnnotationRetention *)v2 initWithValue:qword_100563AF8];
  v3 = [JavaLangAnnotationTarget alloc];
  if ((atomic_load_explicit(JavaLangAnnotationElementTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = qword_1005640D8;
  v6[2] = [(JavaLangAnnotationTarget *)v3 initWithValue:+[IOSObjectArray arrayWithObjects:&v5 count:1 type:NSObject_class_()]];
  return +[IOSObjectArray arrayWithObjects:v6 count:3 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FCF30;
}

@end