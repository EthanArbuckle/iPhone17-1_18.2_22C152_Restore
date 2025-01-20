@interface JavaUtilTreeMap_BoundedMap_BoundedValuesCollection_$1
+ (const)__metadata;
- (JavaUtilTreeMap_BoundedMap_BoundedValuesCollection_$1)initWithJavaUtilTreeMap_BoundedMap_BoundedValuesCollection:(id)a3 withJavaUtilTreeMap_Node:(id)a4;
- (id)next;
- (void)dealloc;
@end

@implementation JavaUtilTreeMap_BoundedMap_BoundedValuesCollection_$1

- (id)next
{
  if (*((unsigned char *)objc_loadWeak((id *)&self->this$2_->this$0_) + 32)) {
    v3 = [(JavaUtilTreeMap_BoundedMap_BoundedIterator *)self stepForward];
  }
  else {
    v3 = [(JavaUtilTreeMap_BoundedMap_BoundedIterator *)self stepBackward];
  }
  return v3[5];
}

- (JavaUtilTreeMap_BoundedMap_BoundedValuesCollection_$1)initWithJavaUtilTreeMap_BoundedMap_BoundedValuesCollection:(id)a3 withJavaUtilTreeMap_Node:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_BoundedMap_BoundedValuesCollection__1;
  [(JavaUtilTreeMap_BoundedMap_BoundedIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100438B98;
}

@end