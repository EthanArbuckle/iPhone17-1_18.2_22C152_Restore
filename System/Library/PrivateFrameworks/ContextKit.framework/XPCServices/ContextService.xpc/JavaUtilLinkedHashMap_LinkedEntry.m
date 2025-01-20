@interface JavaUtilLinkedHashMap_LinkedEntry
+ (const)__metadata;
- (JavaUtilLinkedHashMap_LinkedEntry)init;
- (JavaUtilLinkedHashMap_LinkedEntry)initWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashMap_HashMapEntry:(id)a6 withJavaUtilLinkedHashMap_LinkedEntry:(id)a7 withJavaUtilLinkedHashMap_LinkedEntry:(id)a8;
- (void)__javaClone;
@end

@implementation JavaUtilLinkedHashMap_LinkedEntry

- (JavaUtilLinkedHashMap_LinkedEntry)init
{
  return self;
}

- (JavaUtilLinkedHashMap_LinkedEntry)initWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashMap_HashMapEntry:(id)a6 withJavaUtilLinkedHashMap_LinkedEntry:(id)a7 withJavaUtilLinkedHashMap_LinkedEntry:(id)a8
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedHashMap_LinkedEntry;
  [(JavaUtilLinkedHashMap_LinkedEntry *)&v3 __javaClone];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100406168;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->prv_);
  objc_destroyWeak((id *)&self->nxt_);
}

@end