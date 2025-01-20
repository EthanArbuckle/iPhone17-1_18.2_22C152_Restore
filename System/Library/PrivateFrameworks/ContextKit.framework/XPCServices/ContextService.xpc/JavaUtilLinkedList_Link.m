@interface JavaUtilLinkedList_Link
+ (const)__metadata;
- (JavaUtilLinkedList_Link)initWithId:(id)a3 withJavaUtilLinkedList_Link:(id)a4 withJavaUtilLinkedList_Link:(id)a5;
- (void)__javaClone;
- (void)dealloc;
@end

@implementation JavaUtilLinkedList_Link

- (JavaUtilLinkedList_Link)initWithId:(id)a3 withJavaUtilLinkedList_Link:(id)a4 withJavaUtilLinkedList_Link:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedList_Link;
  [(JavaUtilLinkedList_Link *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedList_Link;
  [(JavaUtilLinkedList_Link *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100419150;
}

- (void).cxx_destruct
{
}

@end