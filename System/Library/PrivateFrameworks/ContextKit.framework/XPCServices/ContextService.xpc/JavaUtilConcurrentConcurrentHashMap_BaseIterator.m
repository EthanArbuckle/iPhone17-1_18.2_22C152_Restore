@interface JavaUtilConcurrentConcurrentHashMap_BaseIterator
+ (const)__metadata;
- (BOOL)hasMoreElements;
- (BOOL)hasNext;
- (JavaUtilConcurrentConcurrentHashMap_BaseIterator)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilConcurrentConcurrentHashMap:(id)a7;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_BaseIterator

- (JavaUtilConcurrentConcurrentHashMap_BaseIterator)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilConcurrentConcurrentHashMap:(id)a7
{
  return self;
}

- (BOOL)hasNext
{
  return self->super.next_ != 0;
}

- (BOOL)hasMoreElements
{
  return self->super.next_ != 0;
}

- (void)remove
{
  p_lastReturned = (id *)&self->lastReturned_;
  v4 = *p_lastReturned;
  if (!*p_lastReturned)
  {
    v7 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v7);
  }
  JreStrongAssign(p_lastReturned, 0);
  map = self->map_;
  if (!map) {
    JreThrowNullPointerException();
  }
  v6 = (void *)v4[2];
  sub_1001BAB8C((uint64_t)map, v6, 0, 0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentConcurrentHashMap_BaseIterator;
  [(JavaUtilConcurrentConcurrentHashMap_Traverser *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041FBD0;
}

@end