@interface DebugHierarchyObjectProtocolHelper
+ (BOOL)classImplementsRequiredAdditionalGroupMethods:(Class)a3;
+ (BOOL)classImplementsRequiredChildGroupMethods:(Class)a3;
+ (BOOL)classImplements_debugHierarchyValueForPropertyWithName:(Class)a3;
+ (BOOL)classOverrides_debugHierarchyPropertyDescriptions:(Class)a3;
+ (BOOL)objectImplements_debugHierarchyVisibility:(id)a3;
+ (BOOL)v1_objectImplementsRequiredAdditionalGroupMethods:(id)a3;
+ (BOOL)v1_objectImplementsRequiredChildGroupMethods:(id)a3;
+ (id)childObjectsForObject:(id)a3 withType:(id)a4 outGroupingID:(id *)a5 outOptions:(id *)a6;
+ (id)debugHierarchyAdditionalGroupingIDsOfClass:(Class)a3;
+ (id)debugHierarchyChildGroupingIDOfClass:(Class)a3;
+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4 vendingClass:(Class)a5 onObject:(id)a6;
+ (id)debugHierarchyPropertyDescriptionsOfClass:(Class)a3;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 vendingClass:(Class)a5 outOptions:(id *)a6 outError:(id *)a7;
+ (int64_t)debugHierarchyVisibilityOfObject:(id)a3;
+ (void)enumerateAdditionalGroupsAndObjectsOfObject:(id)a3 withType:(id)a4 withBlock:(id)a5;
+ (void)updateDebugHierarchyValueForPropertyWithDescription:(id)a3 onObject:(id)a4;
@end

@implementation DebugHierarchyObjectProtocolHelper

+ (BOOL)classImplementsRequiredChildGroupMethods:(Class)a3
{
  int isClass = object_isClass(a3);
  if (isClass)
  {
    if (DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyChildGroupingID")
      && DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyObjectsInGroupWithID:onObject:outOptions:"))
    {
      LOBYTE(isClass) = 1;
    }
    else if (objc_opt_respondsToSelector())
    {
      LOBYTE(isClass) = objc_opt_respondsToSelector();
    }
    else
    {
      LOBYTE(isClass) = 0;
    }
  }
  return isClass & 1;
}

+ (BOOL)classImplementsRequiredAdditionalGroupMethods:(Class)a3
{
  int isClass = object_isClass(a3);
  if (isClass)
  {
    if (DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyAdditionalGroupingIDs")
      && DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyObjectsInGroupWithID:onObject:outOptions:"))
    {
      LOBYTE(isClass) = 1;
    }
    else if (objc_opt_respondsToSelector())
    {
      LOBYTE(isClass) = objc_opt_respondsToSelector();
    }
    else
    {
      LOBYTE(isClass) = 0;
    }
  }
  return isClass & 1;
}

+ (BOOL)classImplements_debugHierarchyValueForPropertyWithName:(Class)a3
{
  int isClass = object_isClass(a3);
  if (isClass)
  {
    if (objc_opt_respondsToSelector()) {
      LOBYTE(isClass) = 1;
    }
    else {
      LOBYTE(isClass) = objc_opt_respondsToSelector();
    }
  }
  return isClass & 1;
}

+ (BOOL)classOverrides_debugHierarchyPropertyDescriptions:(Class)a3
{
  if (DBHIsClassOverridingSelector(a3, (uint64_t)"debugHierarchyPropertyDescriptions")) {
    return 1;
  }
  return DBHIsClassOverridingSelector(a3, (uint64_t)"fallback_debugHierarchyPropertyDescriptions");
}

+ (BOOL)objectImplements_debugHierarchyVisibility:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector();
  }

  return v4 & 1;
}

+ (int64_t)debugHierarchyVisibilityOfObject:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 debugHierarchyVisibility];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      int64_t v5 = 1;
      goto LABEL_7;
    }
    id v4 = objc_msgSend(v3, "fallback_debugHierarchyVisibility");
  }
  int64_t v5 = (int64_t)v4;
LABEL_7:

  return v5;
}

+ (id)debugHierarchyChildGroupingIDOfClass:(Class)a3
{
  if (DBHIsClassOverridingSelector(a3, (uint64_t)"debugHierarchyChildGroupingID"))
  {
    id v4 = [(objc_class *)a3 debugHierarchyChildGroupingID];
  }
  else if (DBHIsClassOverridingSelector(a3, (uint64_t)"fallback_debugHierarchyChildGroupingID"))
  {
    id v4 = [(objc_class *)a3 fallback_debugHierarchyChildGroupingID];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)debugHierarchyAdditionalGroupingIDsOfClass:(Class)a3
{
  if (DBHIsClassOverridingSelector(a3, (uint64_t)"debugHierarchyAdditionalGroupingIDs"))
  {
    id v4 = [(objc_class *)a3 debugHierarchyAdditionalGroupingIDs];
  }
  else if (DBHIsClassOverridingSelector(a3, (uint64_t)"fallback_debugHierarchyAdditionalGroupingIDs"))
  {
    id v4 = [(objc_class *)a3 fallback_debugHierarchyAdditionalGroupingIDs];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4 vendingClass:(Class)a5 onObject:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (objc_opt_respondsToSelector())
  {
    v17 = 0;
    v11 = [(objc_class *)a5 debugHierarchyObjectsInGroupWithID:v9 onObject:v10 outOptions:&v17];
    v12 = v17;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    v16 = 0;
    v11 = [(objc_class *)a5 fallback_debugHierarchyObjectsInGroupWithID:v9 onObject:v10 outOptions:&v16];
    v12 = v16;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    v15 = 0;
    v11 = [v10 debugHierarchyObjectsInGroupWithID:v9 outOptions:&v15];
    v12 = v15;
LABEL_7:
    id v13 = v12;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v13 = 0;
  v11 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v13;
LABEL_9:

  return v11;
}

+ (id)debugHierarchyPropertyDescriptionsOfClass:(Class)a3
{
  if (DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyPropertyDescriptions"))
  {
    id v4 = [(objc_class *)a3 debugHierarchyPropertyDescriptions];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v4 = [(objc_class *)a3 fallback_debugHierarchyPropertyDescriptions];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 vendingClass:(Class)a5 outOptions:(id *)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  if (objc_opt_respondsToSelector())
  {
    v21 = 0;
    id v22 = 0;
    id v13 = [(objc_class *)a5 debugHierarchyValueForPropertyWithName:v11 onObject:v12 outOptions:&v22 outError:&v21];
    id v14 = v22;
    v15 = v21;
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector())
  {
    v19 = 0;
    id v20 = 0;
    id v13 = [(objc_class *)a5 fallback_debugHierarchyValueForPropertyWithName:v11 onObject:v12 outOptions:&v20 outError:&v19];
    id v14 = v20;
    v15 = v19;
LABEL_5:
    id v16 = v15;
    if (!a7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v12 debugHierarchyValueForPropertyWithName:v11];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = 0;
  id v16 = 0;
  if (!a7) {
    goto LABEL_7;
  }
LABEL_6:
  *a7 = v16;
LABEL_7:
  if (a6) {
    *a6 = v14;
  }
  id v17 = v13;

  return v17;
}

+ (void)updateDebugHierarchyValueForPropertyWithDescription:(id)a3 onObject:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    [v6 updateDebugHierarchyValueForPropertyWithDescription:v7 onObject:v5];
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v6, "fallback_updateDebugHierarchyValueForPropertyWithDescription:onObject:", v7, v5);
  }
}

+ (id)childObjectsForObject:(id)a3 withType:(id)a4 outGroupingID:(id *)a5 outOptions:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (+[DebugHierarchyObjectProtocolHelper v1_objectImplementsRequiredChildGroupMethods:v9])
  {
    id v11 = [v9 debugHierarchyChildGroupingID];
    id v20 = 0;
    id v12 = +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:v11 outOptions:&v20 vendingClass:0 onObject:v9];
    id v13 = v20;
    id v14 = v11;
    if (v12) {
      goto LABEL_9;
    }
  }
  else
  {
    id v13 = 0;
    id v11 = 0;
  }
  if (+[DebugHierarchyObjectProtocolHelper classImplementsRequiredChildGroupMethods:objc_opt_class()])
  {
    v15 = [v10 closestTypeVendingAChildGroupingID];
    id v14 = [v15 childGroupingID];

    id v16 = [v15 name];
    id v12 = NSClassFromString(v16);

    if (v12)
    {
      id v19 = v13;
      id v12 = +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:v14 outOptions:&v19 vendingClass:v12 onObject:v9];
      id v17 = v19;

      id v13 = v17;
    }

LABEL_9:
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v12 = 0;
  id v14 = v11;
  if (a5) {
LABEL_10:
  }
    *a5 = v14;
LABEL_11:
  if (a6) {
    *a6 = v13;
  }

  return v12;
}

+ (void)enumerateAdditionalGroupsAndObjectsOfObject:(id)a3 withType:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v29 = a4;
  v8 = (void (**)(id, void, void *, id))a5;
  v32 = v7;
  if (+[DebugHierarchyObjectProtocolHelper classImplementsRequiredAdditionalGroupMethods:objc_opt_class()])
  {
    id v9 = v29;
    if (v9)
    {
      do
      {
        v31 = v9;
        id v10 = objc_msgSend(v9, "additionalGroupingIDs", v29);
        BOOL v11 = [v10 count] == 0;

        if (!v11)
        {
          id v12 = [v31 name];
          Class v13 = NSClassFromString(v12);

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v14 = [v31 additionalGroupingIDs];
          id v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v40;
            do
            {
              id v17 = 0;
              do
              {
                if (*(void *)v40 != v16) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v17);
                id v38 = 0;
                id v19 = +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:v18 outOptions:&v38 vendingClass:v13 onObject:v32];
                id v20 = v38;
                v8[2](v8, v18, v19, v20);

                id v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              id v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
            }
            while (v15);
          }
        }
        uint64_t v21 = [v31 parentType];

        id v9 = (id)v21;
      }
      while (v21);
    }
  }
  if (+[DebugHierarchyObjectProtocolHelper v1_objectImplementsRequiredAdditionalGroupMethods:](DebugHierarchyObjectProtocolHelper, "v1_objectImplementsRequiredAdditionalGroupMethods:", v32, v29))
  {
    [v32 debugHierarchyAdditionalGroupingIDs];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = [v22 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v35;
      do
      {
        v25 = 0;
        do
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v25);
          id v33 = 0;
          v27 = +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:v26 outOptions:&v33 vendingClass:0 onObject:v32];
          id v28 = v33;
          v8[2](v8, v26, v27, v28);

          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id v23 = [v22 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v23);
    }
  }
}

+ (BOOL)v1_objectImplementsRequiredChildGroupMethods:(id)a3
{
  id v3 = a3;
  BOOL v4 = DBHIsInstanceOverridingNSObjectSelector(v3, (uint64_t)"debugHierarchyChildGroupingID")
    && DBHIsInstanceOverridingNSObjectSelector(v3, (uint64_t)"debugHierarchyObjectsInGroupWithID:outOptions:");

  return v4;
}

+ (BOOL)v1_objectImplementsRequiredAdditionalGroupMethods:(id)a3
{
  id v3 = a3;
  BOOL v4 = DBHIsInstanceOverridingNSObjectSelector(v3, (uint64_t)"debugHierarchyAdditionalGroupingIDs")
    && DBHIsInstanceOverridingNSObjectSelector(v3, (uint64_t)"debugHierarchyObjectsInGroupWithID:outOptions:");

  return v4;
}

@end