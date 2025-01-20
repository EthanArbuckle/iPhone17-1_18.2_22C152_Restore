@interface JavaUtilTreeMap_BoundedMap_BoundedKeySet_$2
+ (const)__metadata;
- (JavaUtilTreeMap_BoundedMap_BoundedKeySet_$2)initWithJavaUtilTreeMap_BoundedMap_BoundedKeySet:(id)a3 withJavaUtilTreeMap_Node:(id)a4;
- (id)next;
- (void)dealloc;
@end

@implementation JavaUtilTreeMap_BoundedMap_BoundedKeySet_$2

- (id)next
{
  if (*((unsigned char *)objc_loadWeak((id *)&self->this$2_->this$0_) + 32)) {
    v3 = [(JavaUtilTreeMap_BoundedMap_BoundedIterator *)self stepBackward];
  }
  else {
    v3 = [(JavaUtilTreeMap_BoundedMap_BoundedIterator *)self stepForward];
  }
  return v3[4];
}

- (JavaUtilTreeMap_BoundedMap_BoundedKeySet_$2)initWithJavaUtilTreeMap_BoundedMap_BoundedKeySet:(id)a3 withJavaUtilTreeMap_Node:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_BoundedMap_BoundedKeySet__2;
  [(JavaUtilTreeMap_BoundedMap_BoundedIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100438918;
}

@end