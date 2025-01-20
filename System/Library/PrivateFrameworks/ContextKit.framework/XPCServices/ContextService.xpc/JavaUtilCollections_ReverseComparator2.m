@interface JavaUtilCollections_ReverseComparator2
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_ReverseComparator2)initWithJavaUtilComparator:(id)a3;
- (int)compareWithId:(id)a3 withId:(id)a4;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilCollections_ReverseComparator2

- (JavaUtilCollections_ReverseComparator2)initWithJavaUtilComparator:(id)a3
{
  return self;
}

- (int)compareWithId:(id)a3 withId:(id)a4
{
  cmp = self->cmp_;
  if (!cmp) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilComparator *)cmp compareWithId:a4 withId:a3];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v5 = (void *)*((void *)a3 + 1);
  if (!v5) {
LABEL_10:
  }
    JreThrowNullPointerException();
  cmp = self->cmp_;
  return [v5 isEqual:cmp];
}

- (unint64_t)hash
{
  cmp = self->cmp_;
  if (!cmp) {
    JreThrowNullPointerException();
  }
  return (int)~(unint64_t)[(JavaUtilComparator *)cmp hash];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_ReverseComparator2;
  [(JavaUtilCollections_ReverseComparator2 *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004267C0;
}

@end