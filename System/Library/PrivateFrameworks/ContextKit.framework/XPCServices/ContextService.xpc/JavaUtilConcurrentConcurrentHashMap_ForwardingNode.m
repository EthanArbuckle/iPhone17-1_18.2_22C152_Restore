@interface JavaUtilConcurrentConcurrentHashMap_ForwardingNode
+ (const)__metadata;
- (JavaUtilConcurrentConcurrentHashMap_ForwardingNode)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3;
- (id)findWithInt:(int)a3 withId:(id)a4;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_ForwardingNode

- (JavaUtilConcurrentConcurrentHashMap_ForwardingNode)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3
{
  return self;
}

- (id)findWithInt:(int)a3 withId:(id)a4
{
  i = 0;
  if (a4)
  {
    nextTable = self->nextTable_;
    if (nextTable)
    {
      int size = nextTable->super.size_;
      BOOL v7 = __OFSUB__(size, 1);
      int v8 = size - 1;
      if (v8 < 0 != v7)
      {
        return 0;
      }
      else
      {
        uint64_t v10 = *(void *)&a3;
        for (i = JavaUtilConcurrentConcurrentHashMap_tabAtWithJavaUtilConcurrentConcurrentHashMap_NodeArray_withInt_((uint64_t)nextTable, v8 & a3); i; i = (void *)i[4])
        {
          int v11 = *((_DWORD *)i + 2);
          if (v11 == v10)
          {
            id v12 = (id)i[2];
            if (v12 == a4 || v12 && (objc_msgSend(a4, "isEqual:") & 1) != 0) {
              break;
            }
          }
          if (v11 < 0)
          {
            return [i findWithInt:v10 withId:a4];
          }
        }
      }
    }
  }
  return i;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_ForwardingNode;
  [(JavaUtilConcurrentConcurrentHashMap_Node *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041EDE0;
}

@end