@interface JavaUtilCollections_CheckedSet
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_CheckedSet)initWithJavaUtilSet:(id)a3 withIOSClass:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
@end

@implementation JavaUtilCollections_CheckedSet

- (JavaUtilCollections_CheckedSet)initWithJavaUtilSet:(id)a3 withIOSClass:(id)a4
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
  return (const J2ObjcClassInfo *)&unk_10042B740;
}

@end