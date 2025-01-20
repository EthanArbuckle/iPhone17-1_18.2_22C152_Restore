@interface DebugHierarchyEntryPointProtocolHelper
+ (BOOL)classImplementsRequiredEntryPointMethods:(Class)a3;
+ (id)debugHierarchyGroupingIDsOnClass:(Class)a3;
+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4 onEntryPointClass:(Class)a5;
@end

@implementation DebugHierarchyEntryPointProtocolHelper

+ (BOOL)classImplementsRequiredEntryPointMethods:(Class)a3
{
  if (DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyGroupingIDs")
    && DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyObjectsInGroupWithID:outOptions:"))
  {
    char v4 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    char v4 = objc_opt_respondsToSelector();
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

+ (id)debugHierarchyGroupingIDsOnClass:(Class)a3
{
  if (DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyGroupingIDs"))
  {
    char v4 = [(objc_class *)a3 debugHierarchyGroupingIDs];
  }
  else if (objc_opt_respondsToSelector())
  {
    char v4 = [(objc_class *)a3 fallback_debugHierarchyGroupingIDs];
  }
  else
  {
    char v4 = 0;
  }
  return v4;
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4 onEntryPointClass:(Class)a5
{
  id v7 = a3;
  if (DBHIsClassOverridingNSObjectSelector(a5, (uint64_t)"debugHierarchyObjectsInGroupWithID:outOptions:"))
  {
    uint64_t v14 = 0;
    v8 = (id *)&v14;
    uint64_t v9 = [(objc_class *)a5 debugHierarchyObjectsInGroupWithID:v7 outOptions:&v14];
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = 0;
    v8 = (id *)&v13;
    uint64_t v9 = [(objc_class *)a5 fallback_debugHierarchyObjectsInGroupWithID:v7 outOptions:&v13];
LABEL_5:
    v10 = (void *)v9;
    id v11 = *v8;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v10 = 0;
  id v11 = 0;
  if (a4) {
LABEL_6:
  }
    *a4 = v11;
LABEL_7:

  return v10;
}

@end