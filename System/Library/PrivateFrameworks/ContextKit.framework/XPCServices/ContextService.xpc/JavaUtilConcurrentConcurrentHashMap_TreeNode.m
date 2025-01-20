@interface JavaUtilConcurrentConcurrentHashMap_TreeNode
+ (const)__metadata;
- (JavaUtilConcurrentConcurrentHashMap_TreeNode)initWithInt:(int)a3 withId:(id)a4 withId:(id)a5 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a6 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a7;
- (id)findTreeNodeWithInt:(int)a3 withId:(id)a4 withIOSClass:(id)a5;
- (id)findWithInt:(int)a3 withId:(id)a4;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_TreeNode

- (JavaUtilConcurrentConcurrentHashMap_TreeNode)initWithInt:(int)a3 withId:(id)a4 withId:(id)a5 withJavaUtilConcurrentConcurrentHashMap_Node:(id)a6 withJavaUtilConcurrentConcurrentHashMap_TreeNode:(id)a7
{
  return self;
}

- (id)findWithInt:(int)a3 withId:(id)a4
{
  return (id)sub_1001BE550((uint64_t)self, *(uint64_t *)&a3, a4, 0);
}

- (id)findTreeNodeWithInt:(int)a3 withId:(id)a4 withIOSClass:(id)a5
{
  return (id)sub_1001BE550((uint64_t)self, *(uint64_t *)&a3, a4, a5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_TreeNode;
  [(JavaUtilConcurrentConcurrentHashMap_Node *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041F0C8;
}

@end