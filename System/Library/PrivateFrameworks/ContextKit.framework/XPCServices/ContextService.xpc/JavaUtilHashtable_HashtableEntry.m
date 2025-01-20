@interface JavaUtilHashtable_HashtableEntry
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilHashtable_HashtableEntry)initWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashtable_HashtableEntry:(id)a6;
- (NSString)description;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilHashtable_HashtableEntry

- (JavaUtilHashtable_HashtableEntry)initWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashtable_HashtableEntry:(id)a6
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
  if (!a3)
  {
    v5 = new_JavaLangNullPointerException_initWithNSString_(@"value == null");
    objc_exception_throw(v5);
  }
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
  id key = self->key_;
  if (!key) {
LABEL_11:
  }
    JreThrowNullPointerException();
  if (!objc_msgSend(key, "isEqual:", objc_msgSend(a3, "getKey"))) {
    return 0;
  }
  id value = self->value_;
  if (!value) {
    goto LABEL_11;
  }
  id v8 = [a3 getValue];
  return [value isEqual:v8];
}

- (unint64_t)hash
{
  id key = self->key_;
  if (!key || (v4 = [key hash], (id value = self->value_) == 0)) {
    JreThrowNullPointerException();
  }
  return (int)([value hash] ^ v4);
}

- (NSString)description
{
  return (NSString *)JreStrcat("@C@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, self->key_);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashtable_HashtableEntry;
  [(JavaUtilHashtable_HashtableEntry *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100441B88;
}

@end