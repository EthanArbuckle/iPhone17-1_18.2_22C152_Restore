@interface JavaUtilLinkedHashSet
+ (const)__metadata;
- (JavaUtilLinkedHashSet)init;
- (JavaUtilLinkedHashSet)initWithInt:(int)a3;
- (JavaUtilLinkedHashSet)initWithInt:(int)a3 withFloat:(float)a4;
- (JavaUtilLinkedHashSet)initWithJavaUtilCollection:(id)a3;
- (id)createBackingMapWithInt:(int)a3 withFloat:(float)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilLinkedHashSet

- (JavaUtilLinkedHashSet)init
{
  v3 = new_JavaUtilLinkedHashMap_init();
  JavaUtilHashSet_initWithJavaUtilHashMap_((uint64_t)self, v3);
  return self;
}

- (JavaUtilLinkedHashSet)initWithInt:(int)a3
{
  v4 = new_JavaUtilLinkedHashMap_initWithInt_(*(uint64_t *)&a3);
  JavaUtilHashSet_initWithJavaUtilHashMap_((uint64_t)self, v4);
  return self;
}

- (JavaUtilLinkedHashSet)initWithInt:(int)a3 withFloat:(float)a4
{
  v5 = new_JavaUtilLinkedHashMap_initWithInt_withFloat_(*(uint64_t *)&a3, a4);
  JavaUtilHashSet_initWithJavaUtilHashMap_((uint64_t)self, v5);
  return self;
}

- (JavaUtilLinkedHashSet)initWithJavaUtilCollection:(id)a3
{
  return self;
}

- (id)createBackingMapWithInt:(int)a3 withFloat:(float)a4
{
  v4 = new_JavaUtilLinkedHashMap_initWithInt_withFloat_(*(uint64_t *)&a3, a4);
  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilLinkedHashSet;
  return [(JavaUtilHashSet *)&v6 countByEnumeratingWithState:a3 objects:a4 count:a5];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004034E0;
}

@end