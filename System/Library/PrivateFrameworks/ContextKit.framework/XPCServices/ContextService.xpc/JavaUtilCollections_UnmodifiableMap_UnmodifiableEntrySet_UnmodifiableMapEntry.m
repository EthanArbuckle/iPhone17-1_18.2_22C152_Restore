@interface JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_UnmodifiableMapEntry
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_UnmodifiableMapEntry)initWithJavaUtilMap_Entry:(id)a3;
- (NSString)description;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_UnmodifiableMapEntry

- (JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_UnmodifiableMapEntry)initWithJavaUtilMap_Entry:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  mapEntry = self->mapEntry_;
  if (!mapEntry) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap_Entry *)mapEntry isEqual:a3];
}

- (id)getKey
{
  mapEntry = self->mapEntry_;
  if (!mapEntry) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap_Entry *)mapEntry getKey];
}

- (id)getValue
{
  mapEntry = self->mapEntry_;
  if (!mapEntry) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap_Entry *)mapEntry getValue];
}

- (unint64_t)hash
{
  mapEntry = self->mapEntry_;
  if (!mapEntry) {
    JreThrowNullPointerException();
  }
  return (int)[(JavaUtilMap_Entry *)mapEntry hash];
}

- (id)setValueWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (NSString)description
{
  mapEntry = self->mapEntry_;
  if (!mapEntry) {
    JreThrowNullPointerException();
  }
  return (NSString *)[(JavaUtilMap_Entry *)mapEntry description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_UnmodifiableMapEntry;
  [(JavaUtilCollections_UnmodifiableMap_UnmodifiableEntrySet_UnmodifiableMapEntry *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100429CD8;
}

@end