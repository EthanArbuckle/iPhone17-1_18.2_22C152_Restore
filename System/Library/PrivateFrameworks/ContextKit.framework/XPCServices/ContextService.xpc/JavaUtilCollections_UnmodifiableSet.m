@interface JavaUtilCollections_UnmodifiableSet
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_UnmodifiableSet)initWithJavaUtilSet:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
@end

@implementation JavaUtilCollections_UnmodifiableSet

- (JavaUtilCollections_UnmodifiableSet)initWithJavaUtilSet:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  c = self->super.c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollection *)c isEqual:a3];
}

- (unint64_t)hash
{
  c = self->super.c_;
  if (!c) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilCollection *)c hash];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100429978;
}

@end