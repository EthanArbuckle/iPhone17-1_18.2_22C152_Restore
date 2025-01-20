@interface JavaUtilLinkedHashMap_KeyIterator
+ (const)__metadata;
- (JavaUtilLinkedHashMap_KeyIterator)initWithJavaUtilLinkedHashMap:(id)a3;
- (id)next;
@end

@implementation JavaUtilLinkedHashMap_KeyIterator

- (id)next
{
  id v2 = -[JavaUtilLinkedHashMap_EntryIterator next]_0((uint64_t)self);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return (id)*((void *)v2 + 1);
}

- (JavaUtilLinkedHashMap_KeyIterator)initWithJavaUtilLinkedHashMap:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100406448;
}

@end