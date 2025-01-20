@interface JavaUtilCollections_UnmodifiableMap
+ (const)__metadata;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_UnmodifiableMap)initWithJavaUtilMap:(id)a3;
- (NSString)description;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)size;
- (unint64_t)hash;
- (void)clear;
- (void)dealloc;
- (void)putAllWithJavaUtilMap:(id)a3;
@end

@implementation JavaUtilCollections_UnmodifiableMap

- (JavaUtilCollections_UnmodifiableMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (void)clear
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (BOOL)containsKeyWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m containsKeyWithId:a3];
}

- (BOOL)containsValueWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m containsValueWithId:a3];
}

- (id)entrySet
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  id v3 = [(JavaUtilMap *)m entrySet];
  v4 = [JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet alloc];
  JreStrongAssign((id *)&v4->super.super.c_, v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m isEqual:a3];
}

- (id)getWithId:(id)a3
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m getWithId:a3];
}

- (unint64_t)hash
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilMap *)m hash];
}

- (BOOL)isEmpty
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m isEmpty];
}

- (id)keySet
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  id v3 = [(JavaUtilMap *)m keySet];
  v4 = [JavaUtilCollections_UnmodifiableSet alloc];
  JreStrongAssign((id *)&v4->super.c_, v3);
  return v4;
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (void)putAllWithJavaUtilMap:(id)a3
{
  id v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (id)removeWithId:(id)a3
{
  id v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (int)size
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)m size];
}

- (id)values
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  id v3 = [(JavaUtilMap *)m values];
  v4 = [JavaUtilCollections_UnmodifiableCollection alloc];
  JreStrongAssign((id *)&v4->c_, v3);
  return v4;
}

- (NSString)description
{
  m = self->m_;
  if (!m) {
    JreThrowNullPointerException();
  }
  return (NSString *)[(JavaUtilMap *)m description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableMap;
  [(JavaUtilCollections_UnmodifiableMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100429840;
}

@end