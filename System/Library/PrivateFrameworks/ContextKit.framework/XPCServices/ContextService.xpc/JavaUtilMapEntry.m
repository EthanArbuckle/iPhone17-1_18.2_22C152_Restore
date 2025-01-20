@interface JavaUtilMapEntry
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilMapEntry)initWithId:(id)a3;
- (JavaUtilMapEntry)initWithId:(id)a3 withId:(id)a4;
- (NSString)description;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilMapEntry

- (JavaUtilMapEntry)initWithId:(id)a3
{
  return self;
}

- (JavaUtilMapEntry)initWithId:(id)a3 withId:(id)a4
{
  return self;
}

- (id)clone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilMapEntry;
  return [(JavaUtilMapEntry *)&v3 clone];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  LODWORD(v5) = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    v6 = (void *)JavaUtilMap_Entry_class_();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if (([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    id key = self->key_;
    id v8 = [a3 getKey];
    if (key)
    {
      LODWORD(v5) = [key isEqual:v8];
      if (!v5) {
        return (char)v5;
      }
    }
    else if (v8)
    {
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    id value = self->value_;
    id v5 = [a3 getValue];
    if (value)
    {
      LOBYTE(v5) = [value isEqual:v5];
    }
    else
    {
      LOBYTE(v5) = v5 == 0;
    }
  }
  return (char)v5;
}

- (id)getKey
{
  return self->key_;
}

- (id)getValue
{
  return self->value_;
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

- (id)setValueWithId:(id)a3
{
  id value = self->value_;
  JreStrongAssign(&self->value_, a3);
  return value;
}

- (NSString)description
{
  return (NSString *)JreStrcat("@C@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, self->key_);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilMapEntry;
  [(JavaUtilMapEntry *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilMapEntry *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004897B0;
}

@end