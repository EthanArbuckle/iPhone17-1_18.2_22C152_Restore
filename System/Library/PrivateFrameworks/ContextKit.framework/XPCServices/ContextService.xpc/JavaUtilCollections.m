@interface JavaUtilCollections
+ (BOOL)addAllWithJavaUtilCollection:(id)a3 withNSObjectArray:(id)a4;
+ (BOOL)disjointWithJavaUtilCollection:(id)a3 withJavaUtilCollection:(id)a4;
+ (BOOL)replaceAllWithJavaUtilList:(id)a3 withId:(id)a4 withId:(id)a5;
+ (const)__metadata;
+ (id)__annotations_addAllWithJavaUtilCollection_withNSObjectArray_;
+ (id)asLifoQueueWithJavaUtilDeque:(id)a3;
+ (id)checkTypeWithId:(id)a3 withIOSClass:(id)a4;
+ (id)checkedCollectionWithJavaUtilCollection:(id)a3 withIOSClass:(id)a4;
+ (id)checkedListWithJavaUtilList:(id)a3 withIOSClass:(id)a4;
+ (id)checkedMapWithJavaUtilMap:(id)a3 withIOSClass:(id)a4 withIOSClass:(id)a5;
+ (id)checkedSetWithJavaUtilSet:(id)a3 withIOSClass:(id)a4;
+ (id)checkedSortedMapWithJavaUtilSortedMap:(id)a3 withIOSClass:(id)a4 withIOSClass:(id)a5;
+ (id)checkedSortedSetWithJavaUtilSortedSet:(id)a3 withIOSClass:(id)a4;
+ (id)emptyList;
+ (id)emptyMap;
+ (id)emptySet;
+ (id)enumerationWithJavaUtilCollection:(id)a3;
+ (id)listWithJavaUtilEnumeration:(id)a3;
+ (id)maxWithJavaUtilCollection:(id)a3;
+ (id)maxWithJavaUtilCollection:(id)a3 withJavaUtilComparator:(id)a4;
+ (id)minWithJavaUtilCollection:(id)a3;
+ (id)minWithJavaUtilCollection:(id)a3 withJavaUtilComparator:(id)a4;
+ (id)nCopiesWithInt:(int)a3 withId:(id)a4;
+ (id)newSetFromMapWithJavaUtilMap:(id)a3;
+ (id)reverseOrderWithJavaUtilComparator:(id)a3;
+ (id)singletonListWithId:(id)a3;
+ (id)singletonMapWithId:(id)a3 withId:(id)a4;
+ (id)singletonWithId:(id)a3;
+ (id)synchronizedCollectionWithJavaUtilCollection:(id)a3;
+ (id)synchronizedListWithJavaUtilList:(id)a3;
+ (id)synchronizedMapWithJavaUtilMap:(id)a3;
+ (id)synchronizedSetWithJavaUtilSet:(id)a3;
+ (id)synchronizedSortedMapWithJavaUtilSortedMap:(id)a3;
+ (id)synchronizedSortedSetWithJavaUtilSortedSet:(id)a3;
+ (id)unmodifiableCollectionWithJavaUtilCollection:(id)a3;
+ (id)unmodifiableListWithJavaUtilList:(id)a3;
+ (id)unmodifiableMapWithJavaUtilMap:(id)a3;
+ (id)unmodifiableSetWithJavaUtilSet:(id)a3;
+ (id)unmodifiableSortedMapWithJavaUtilSortedMap:(id)a3;
+ (id)unmodifiableSortedSetWithJavaUtilSortedSet:(id)a3;
+ (int)binarySearchWithJavaUtilList:(id)a3 withId:(id)a4;
+ (int)binarySearchWithJavaUtilList:(id)a3 withId:(id)a4 withJavaUtilComparator:(id)a5;
+ (int)frequencyWithJavaUtilCollection:(id)a3 withId:(id)a4;
+ (int)indexOfSubListWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4;
+ (int)lastIndexOfSubListWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4;
+ (int)roundUpToPowerOfTwoWithInt:(int)a3;
+ (int)secondaryHashWithId:(id)a3;
+ (int)secondaryHashWithInt:(int)a3;
+ (int)secondaryIdentityHashWithId:(id)a3;
+ (void)copy__WithJavaUtilList:(id)a3 withJavaUtilList:(id)a4;
+ (void)fillWithJavaUtilList:(id)a3 withId:(id)a4;
+ (void)initialize;
+ (void)reverseWithJavaUtilList:(id)a3;
+ (void)rotateWithJavaUtilList:(id)a3 withInt:(int)a4;
+ (void)shuffleWithJavaUtilList:(id)a3;
+ (void)shuffleWithJavaUtilList:(id)a3 withJavaUtilRandom:(id)a4;
+ (void)sortWithJavaUtilList:(id)a3;
+ (void)sortWithJavaUtilList:(id)a3 withJavaUtilComparator:(id)a4;
+ (void)swapWithJavaUtilList:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaUtilCollections

+ (int)binarySearchWithJavaUtilList:(id)a3 withId:(id)a4
{
  return JavaUtilCollections_binarySearchWithJavaUtilList_withId_(a3, (uint64_t)a4);
}

+ (int)binarySearchWithJavaUtilList:(id)a3 withId:(id)a4 withJavaUtilComparator:(id)a5
{
  return JavaUtilCollections_binarySearchWithJavaUtilList_withId_withJavaUtilComparator_(a3, (uint64_t)a4, a5);
}

+ (void)copy__WithJavaUtilList:(id)a3 withJavaUtilList:(id)a4
{
}

+ (id)enumerationWithJavaUtilCollection:(id)a3
{
  return JavaUtilCollections_enumerationWithJavaUtilCollection_(a3);
}

+ (void)fillWithJavaUtilList:(id)a3 withId:(id)a4
{
}

+ (id)maxWithJavaUtilCollection:(id)a3
{
  return JavaUtilCollections_maxWithJavaUtilCollection_(a3);
}

+ (id)maxWithJavaUtilCollection:(id)a3 withJavaUtilComparator:(id)a4
{
  return JavaUtilCollections_maxWithJavaUtilCollection_withJavaUtilComparator_(a3, a4);
}

+ (id)minWithJavaUtilCollection:(id)a3
{
  return JavaUtilCollections_minWithJavaUtilCollection_(a3);
}

+ (id)minWithJavaUtilCollection:(id)a3 withJavaUtilComparator:(id)a4
{
  return JavaUtilCollections_minWithJavaUtilCollection_withJavaUtilComparator_(a3, a4);
}

+ (id)nCopiesWithInt:(int)a3 withId:(id)a4
{
  return JavaUtilCollections_nCopiesWithInt_withId_(*(uint64_t *)&a3, a4);
}

+ (void)reverseWithJavaUtilList:(id)a3
{
}

+ (id)reverseOrderWithJavaUtilComparator:(id)a3
{
  return JavaUtilCollections_reverseOrderWithJavaUtilComparator_(a3);
}

+ (void)shuffleWithJavaUtilList:(id)a3
{
}

+ (void)shuffleWithJavaUtilList:(id)a3 withJavaUtilRandom:(id)a4
{
}

+ (id)singletonWithId:(id)a3
{
  return JavaUtilCollections_singletonWithId_(a3);
}

+ (id)singletonListWithId:(id)a3
{
  return JavaUtilCollections_singletonListWithId_(a3);
}

+ (id)singletonMapWithId:(id)a3 withId:(id)a4
{
  return JavaUtilCollections_singletonMapWithId_withId_(a3, a4);
}

+ (void)sortWithJavaUtilList:(id)a3
{
}

+ (void)sortWithJavaUtilList:(id)a3 withJavaUtilComparator:(id)a4
{
}

+ (void)swapWithJavaUtilList:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (BOOL)replaceAllWithJavaUtilList:(id)a3 withId:(id)a4 withId:(id)a5
{
  return JavaUtilCollections_replaceAllWithJavaUtilList_withId_withId_(a3, (uint64_t)a4, (uint64_t)a5);
}

+ (void)rotateWithJavaUtilList:(id)a3 withInt:(int)a4
{
}

+ (int)indexOfSubListWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4
{
  return JavaUtilCollections_indexOfSubListWithJavaUtilList_withJavaUtilList_(a3, a4);
}

+ (int)lastIndexOfSubListWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4
{
  return JavaUtilCollections_lastIndexOfSubListWithJavaUtilList_withJavaUtilList_(a3, a4);
}

+ (id)listWithJavaUtilEnumeration:(id)a3
{
  return JavaUtilCollections_listWithJavaUtilEnumeration_(a3);
}

+ (id)synchronizedCollectionWithJavaUtilCollection:(id)a3
{
  return JavaUtilCollections_synchronizedCollectionWithJavaUtilCollection_(a3);
}

+ (id)synchronizedListWithJavaUtilList:(id)a3
{
  return JavaUtilCollections_synchronizedListWithJavaUtilList_(a3);
}

+ (id)synchronizedMapWithJavaUtilMap:(id)a3
{
  return JavaUtilCollections_synchronizedMapWithJavaUtilMap_(a3);
}

+ (id)synchronizedSetWithJavaUtilSet:(id)a3
{
  return JavaUtilCollections_synchronizedSetWithJavaUtilSet_(a3);
}

+ (id)synchronizedSortedMapWithJavaUtilSortedMap:(id)a3
{
  return JavaUtilCollections_synchronizedSortedMapWithJavaUtilSortedMap_(a3);
}

+ (id)synchronizedSortedSetWithJavaUtilSortedSet:(id)a3
{
  return JavaUtilCollections_synchronizedSortedSetWithJavaUtilSortedSet_(a3);
}

+ (id)unmodifiableCollectionWithJavaUtilCollection:(id)a3
{
  return JavaUtilCollections_unmodifiableCollectionWithJavaUtilCollection_(a3);
}

+ (id)unmodifiableListWithJavaUtilList:(id)a3
{
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(a3);
}

+ (id)unmodifiableMapWithJavaUtilMap:(id)a3
{
  return JavaUtilCollections_unmodifiableMapWithJavaUtilMap_(a3);
}

+ (id)unmodifiableSetWithJavaUtilSet:(id)a3
{
  return JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(a3);
}

+ (id)unmodifiableSortedMapWithJavaUtilSortedMap:(id)a3
{
  return JavaUtilCollections_unmodifiableSortedMapWithJavaUtilSortedMap_(a3);
}

+ (id)unmodifiableSortedSetWithJavaUtilSortedSet:(id)a3
{
  return JavaUtilCollections_unmodifiableSortedSetWithJavaUtilSortedSet_(a3);
}

+ (int)frequencyWithJavaUtilCollection:(id)a3 withId:(id)a4
{
  return JavaUtilCollections_frequencyWithJavaUtilCollection_withId_(a3, a4);
}

+ (id)emptyList
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_LIST_;
}

+ (id)emptySet
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_SET_;
}

+ (id)emptyMap
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_MAP_;
}

+ (id)checkedCollectionWithJavaUtilCollection:(id)a3 withIOSClass:(id)a4
{
  return JavaUtilCollections_checkedCollectionWithJavaUtilCollection_withIOSClass_(a3, a4);
}

+ (id)checkedMapWithJavaUtilMap:(id)a3 withIOSClass:(id)a4 withIOSClass:(id)a5
{
  return JavaUtilCollections_checkedMapWithJavaUtilMap_withIOSClass_withIOSClass_(a3, a4, a5);
}

+ (id)checkedListWithJavaUtilList:(id)a3 withIOSClass:(id)a4
{
  return JavaUtilCollections_checkedListWithJavaUtilList_withIOSClass_(a3, a4);
}

+ (id)checkedSetWithJavaUtilSet:(id)a3 withIOSClass:(id)a4
{
  return JavaUtilCollections_checkedSetWithJavaUtilSet_withIOSClass_(a3, a4);
}

+ (id)checkedSortedMapWithJavaUtilSortedMap:(id)a3 withIOSClass:(id)a4 withIOSClass:(id)a5
{
  return JavaUtilCollections_checkedSortedMapWithJavaUtilSortedMap_withIOSClass_withIOSClass_(a3, a4, a5);
}

+ (id)checkedSortedSetWithJavaUtilSortedSet:(id)a3 withIOSClass:(id)a4
{
  return JavaUtilCollections_checkedSortedSetWithJavaUtilSortedSet_withIOSClass_(a3, a4);
}

+ (BOOL)addAllWithJavaUtilCollection:(id)a3 withNSObjectArray:(id)a4
{
  return JavaUtilCollections_addAllWithJavaUtilCollection_withNSObjectArray_(a3, (uint64_t)a4);
}

+ (BOOL)disjointWithJavaUtilCollection:(id)a3 withJavaUtilCollection:(id)a4
{
  return JavaUtilCollections_disjointWithJavaUtilCollection_withJavaUtilCollection_(a3, a4);
}

+ (id)checkTypeWithId:(id)a3 withIOSClass:(id)a4
{
  return JavaUtilCollections_checkTypeWithId_withIOSClass_(a3, a4);
}

+ (id)newSetFromMapWithJavaUtilMap:(id)a3
{
  return JavaUtilCollections_newSetFromMapWithJavaUtilMap_(a3);
}

+ (id)asLifoQueueWithJavaUtilDeque:(id)a3
{
  return JavaUtilCollections_asLifoQueueWithJavaUtilDeque_(a3);
}

+ (int)secondaryHashWithId:(id)a3
{
  return JavaUtilCollections_secondaryHashWithId_(a3);
}

+ (int)secondaryIdentityHashWithId:(id)a3
{
  return JavaUtilCollections_secondaryIdentityHashWithId_((uint64_t)a3);
}

+ (int)secondaryHashWithInt:(int)a3
{
  return sub_1001CC9E4(a3);
}

+ (int)roundUpToPowerOfTwoWithInt:(int)a3
{
  return JavaUtilCollections_roundUpToPowerOfTwoWithInt_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100560C38, [JavaUtilCollections__1 alloc]);
    JreStrongAssignAndConsume((id *)&qword_100560C40, [JavaUtilCollections__2 alloc]);
    v2 = [JavaUtilCollections_EmptyList alloc];
    JavaUtilAbstractList_init(v2, v3);
    JreStrongAssignAndConsume((id *)&JavaUtilCollections_EMPTY_LIST_, v2);
    v4 = [JavaUtilCollections_EmptySet alloc];
    JavaUtilAbstractSet_init(v4, v5);
    JreStrongAssignAndConsume((id *)&JavaUtilCollections_EMPTY_SET_, v4);
    v6 = [JavaUtilCollections_EmptyMap alloc];
    JavaUtilAbstractMap_init(v6, v7);
    JreStrongAssignAndConsume((id *)&JavaUtilCollections_EMPTY_MAP_, v6);
    atomic_store(1u, (unsigned __int8 *)JavaUtilCollections__initialized);
  }
}

+ (id)__annotations_addAllWithJavaUtilCollection_withNSObjectArray_
{
  uint64_t v3 = objc_alloc_init(JavaLangSafeVarargs);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100425D80;
}

@end