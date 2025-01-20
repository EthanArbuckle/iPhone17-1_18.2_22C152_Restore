@interface JavaUtilLinkedHashMap_ValueIterator
+ (const)__metadata;
- (JavaUtilLinkedHashMap_ValueIterator)initWithJavaUtilLinkedHashMap:(id)a3;
- (id)next;
@end

@implementation JavaUtilLinkedHashMap_ValueIterator

- (id)next
{
  id v2 = -[JavaUtilLinkedHashMap_EntryIterator next]_0((uint64_t)self);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return (id)*((void *)v2 + 2);
}

- (JavaUtilLinkedHashMap_ValueIterator)initWithJavaUtilLinkedHashMap:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100406518;
}

@end