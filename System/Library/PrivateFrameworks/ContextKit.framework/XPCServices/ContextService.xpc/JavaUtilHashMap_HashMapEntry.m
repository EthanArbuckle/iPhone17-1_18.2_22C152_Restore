@interface JavaUtilHashMap_HashMapEntry
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilHashMap_HashMapEntry)initWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashMap_HashMapEntry:(id)a6;
- (NSString)description;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilHashMap_HashMapEntry

- (JavaUtilHashMap_HashMapEntry)initWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashMap_HashMapEntry:(id)a6
{
  self->hash__ = a5;
  JreStrongAssign((id *)&self->next_, a6);
  return self;
}

- (id)getKey
{
  return self->key_;
}

- (id)getValue
{
  return self->value_;
}

- (id)setValueWithId:(id)a3
{
  id value = self->value_;
  JreStrongAssign(&self->value_, a3);
  return value;
}

- (BOOL)isEqual:(id)a3
{
  if (![(id)JavaUtilMap_Entry_class_() isInstance:a3]) {
    return 0;
  }
  v5 = (void *)JavaUtilMap_Entry_class_();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (([v5 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  if (!LibcoreUtilObjects_equalWithId_withId_((uint64_t)[a3 getKey], (uint64_t)self->key_)) {
    return 0;
  }
  id v6 = [a3 getValue];
  id value = self->value_;
  return LibcoreUtilObjects_equalWithId_withId_((uint64_t)v6, (uint64_t)value);
}

- (unint64_t)hash
{
  id key = self->key_;
  if (key) {
    unsigned int v4 = [key hash];
  }
  else {
    unsigned int v4 = 0;
  }
  id value = self->value_;
  if (value) {
    LODWORD(value) = [value hash];
  }
  return (int)(value ^ v4);
}

- (NSString)description
{
  return (NSString *)JreStrcat("@C@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, self->key_);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashMap_HashMapEntry;
  [(JavaUtilHashMap_HashMapEntry *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004327F0;
}

@end