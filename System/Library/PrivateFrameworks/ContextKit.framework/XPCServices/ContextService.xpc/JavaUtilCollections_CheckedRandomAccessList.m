@interface JavaUtilCollections_CheckedRandomAccessList
+ (const)__metadata;
- (JavaUtilCollections_CheckedRandomAccessList)initWithJavaUtilList:(id)a3 withIOSClass:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilCollections_CheckedRandomAccessList

- (JavaUtilCollections_CheckedRandomAccessList)initWithJavaUtilList:(id)a3 withIOSClass:(id)a4
{
  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042B608;
}

@end