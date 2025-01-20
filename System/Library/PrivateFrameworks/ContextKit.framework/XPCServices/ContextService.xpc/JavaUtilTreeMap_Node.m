@interface JavaUtilTreeMap_Node
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (JavaUtilTreeMap_Node)initWithJavaUtilTreeMap_Node:(id)a3 withId:(id)a4;
- (NSString)description;
- (id)copy__WithJavaUtilTreeMap_Node:(id)a3;
- (id)first;
- (id)getKey;
- (id)getValue;
- (id)last;
- (id)next;
- (id)prev;
- (id)setValueWithId:(id)a3;
- (unint64_t)hash;
- (void)__javaClone;
- (void)dealloc;
@end

@implementation JavaUtilTreeMap_Node

- (JavaUtilTreeMap_Node)initWithJavaUtilTreeMap_Node:(id)a3 withId:(id)a4
{
  self->height_ = 1;
  return self;
}

- (id)copy__WithJavaUtilTreeMap_Node:(id)a3
{
  v4 = new_JavaUtilTreeMap_Node_initWithJavaUtilTreeMap_Node_withId_(a3, self->key_);
  left = self->left_;
  if (left) {
    JreStrongAssign((id *)&v4->left_, [(JavaUtilTreeMap_Node *)left copy__WithJavaUtilTreeMap_Node:v4]);
  }
  right = self->right_;
  if (right) {
    JreStrongAssign((id *)&v4->right_, [(JavaUtilTreeMap_Node *)right copy__WithJavaUtilTreeMap_Node:v4]);
  }
  JreStrongAssign(&v4->value_, self->value_);
  v4->height_ = self->height_;
  return v4;
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

- (id)next
{
  uint64_t v2 = self;
  right = self->right_;
  if (right)
  {
    return [(JavaUtilTreeMap_Node *)right first];
  }
  else
  {
    while (1)
    {
      Weak = (JavaUtilTreeMap_Node *)objc_loadWeak((id *)&v2->parent_);
      if (!Weak) {
        break;
      }
      uint64_t v5 = v2;
      uint64_t v2 = Weak;
      if (Weak->left_ == v5) {
        return v2;
      }
    }
    return 0;
  }
}

- (id)prev
{
  uint64_t v2 = self;
  left = self->left_;
  if (left)
  {
    return [(JavaUtilTreeMap_Node *)left last];
  }
  else
  {
    while (1)
    {
      Weak = (JavaUtilTreeMap_Node *)objc_loadWeak((id *)&v2->parent_);
      if (!Weak) {
        break;
      }
      uint64_t v5 = v2;
      uint64_t v2 = Weak;
      if (Weak->right_ == v5) {
        return v2;
      }
    }
    return 0;
  }
}

- (id)first
{
  do
  {
    uint64_t v2 = self;
    self = self->left_;
  }
  while (self);
  return v2;
}

- (id)last
{
  do
  {
    uint64_t v2 = self;
    self = self->right_;
  }
  while (self);
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_Node;
  [(JavaUtilTreeMap_Node *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_Node;
  [(JavaUtilTreeMap_Node *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004361D0;
}

- (void).cxx_destruct
{
}

@end