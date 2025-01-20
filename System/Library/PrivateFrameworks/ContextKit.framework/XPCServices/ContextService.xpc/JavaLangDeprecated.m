@interface JavaLangDeprecated
+ (const)__metadata;
+ (id)__annotations;
- (NSString)description;
- (id)annotationType;
@end

@implementation JavaLangDeprecated

- (id)annotationType
{
  if (qword_100560EB0 != -1) {
    dispatch_once(&qword_100560EB0, &stru_100446880);
  }
  return (id)qword_100560EA8;
}

- (NSString)description
{
  return (NSString *)@"@java.lang.Deprecated()";
}

+ (id)__annotations
{
  v4[0] = objc_alloc_init(JavaLangAnnotationDocumented);
  v2 = [JavaLangAnnotationRetention alloc];
  if ((atomic_load_explicit(JavaLangAnnotationRetentionPolicyEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v4[1] = [(JavaLangAnnotationRetention *)v2 initWithValue:qword_100563AF8];
  return +[IOSObjectArray arrayWithObjects:v4 count:2 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100446810;
}

@end