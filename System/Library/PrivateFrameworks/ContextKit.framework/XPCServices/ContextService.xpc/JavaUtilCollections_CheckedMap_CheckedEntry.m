@interface JavaUtilCollections_CheckedMap_CheckedEntry
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_CheckedMap_CheckedEntry)initWithJavaUtilMap_Entry:(id)a3 withIOSClass:(id)a4;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilCollections_CheckedMap_CheckedEntry

- (JavaUtilCollections_CheckedMap_CheckedEntry)initWithJavaUtilMap_Entry:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (id)getKey
{
  e = self->e_;
  if (!e) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap_Entry *)e getKey];
}

- (id)getValue
{
  e = self->e_;
  if (!e) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap_Entry *)e getValue];
}

- (id)setValueWithId:(id)a3
{
  e = self->e_;
  if (!e) {
    JreThrowNullPointerException();
  }
  JavaUtilCollections_checkTypeWithId_withIOSClass_(a3, self->valueType_);
  return [(JavaUtilMap_Entry *)e setValueWithId:a3];
}

- (BOOL)isEqual:(id)a3
{
  e = self->e_;
  if (!e) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap_Entry *)e isEqual:a3];
}

- (unint64_t)hash
{
  e = self->e_;
  if (!e) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilMap_Entry *)e hash];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_CheckedMap_CheckedEntry;
  [(JavaUtilCollections_CheckedMap_CheckedEntry *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042BD90;
}

@end