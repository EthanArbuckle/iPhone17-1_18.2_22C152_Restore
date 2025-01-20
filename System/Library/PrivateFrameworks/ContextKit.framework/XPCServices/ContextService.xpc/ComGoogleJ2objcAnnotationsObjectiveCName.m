@interface ComGoogleJ2objcAnnotationsObjectiveCName
+ (const)__metadata;
+ (id)__annotations;
- (ComGoogleJ2objcAnnotationsObjectiveCName)initWithValue:(id)a3;
- (NSString)description;
- (NSString)value;
- (id)annotationType;
@end

@implementation ComGoogleJ2objcAnnotationsObjectiveCName

- (ComGoogleJ2objcAnnotationsObjectiveCName)initWithValue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ComGoogleJ2objcAnnotationsObjectiveCName;
  v4 = [(ComGoogleJ2objcAnnotationsObjectiveCName *)&v6 init];
  if (v4) {
    v4->value_ = (NSString *)a3;
  }
  return v4;
}

- (id)annotationType
{
  if (qword_100560A10 != -1) {
    dispatch_once(&qword_100560A10, &stru_10040E4D8);
  }
  return (id)qword_100560A08;
}

- (NSString)description
{
  return (NSString *)@"@com.google.j2objc.annotations.ObjectiveCName()";
}

+ (id)__annotations
{
  v2 = [JavaLangAnnotationTarget alloc];
  if ((atomic_load_explicit(JavaLangAnnotationElementTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v5[0] = JavaLangAnnotationElementTypeEnum_values_;
  if ((atomic_load_explicit(JavaLangAnnotationElementTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v5[1] = qword_1005640B8;
  if ((atomic_load_explicit(JavaLangAnnotationElementTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v5[2] = qword_1005640C8;
  if ((atomic_load_explicit(JavaLangAnnotationElementTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v5[3] = qword_1005640E0;
  v6[0] = [(JavaLangAnnotationTarget *)v2 initWithValue:+[IOSObjectArray arrayWithObjects:v5 count:4 type:NSObject_class_()]];
  v3 = [JavaLangAnnotationRetention alloc];
  if ((atomic_load_explicit(JavaLangAnnotationRetentionPolicyEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v6[1] = [(JavaLangAnnotationRetention *)v3 initWithValue:qword_100563AF8];
  return +[IOSObjectArray arrayWithObjects:v6 count:2 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040E468;
}

- (NSString)value
{
  return self->value_;
}

@end