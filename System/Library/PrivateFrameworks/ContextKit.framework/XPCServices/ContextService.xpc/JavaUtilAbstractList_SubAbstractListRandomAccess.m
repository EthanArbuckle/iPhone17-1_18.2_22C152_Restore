@interface JavaUtilAbstractList_SubAbstractListRandomAccess
+ (const)__metadata;
- (JavaUtilAbstractList_SubAbstractListRandomAccess)initWithJavaUtilAbstractList:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilAbstractList_SubAbstractListRandomAccess

- (JavaUtilAbstractList_SubAbstractListRandomAccess)initWithJavaUtilAbstractList:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100475240;
}

@end