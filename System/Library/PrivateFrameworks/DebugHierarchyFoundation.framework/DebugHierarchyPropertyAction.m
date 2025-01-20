@interface DebugHierarchyPropertyAction
- (BOOL)_isTargetingProperty:(id)a3;
- (BOOL)exactTypesAreExclusive;
- (BOOL)isTargetingObject:(id)a3;
- (BOOL)objectIdentifiersAreExclusive;
- (BOOL)propertyNamesAreExclusive;
- (BOOL)targetsObjectIdentifiers:(id *)a3;
- (BOOL)typesAreExclusive;
- (DebugHierarchyPropertyAction)init;
- (NSArray)exactTypes;
- (NSArray)objectIdentifiers;
- (NSArray)propertyNames;
- (NSArray)types;
- (NSString)debugDescription;
- (id)keysToArchiveViaKVC;
- (int64_t)options;
- (int64_t)optionsComparisonStyle;
- (int64_t)visibility;
- (void)_fetchValuesForPropertiesWithNames:(id)a3 onObject:(id)a4 inContext:(id)a5;
- (void)addPropertyNames:(id)a3;
- (void)performInContext:(id)a3 withObject:(id)a4;
- (void)setExactTypes:(id)a3;
- (void)setExactTypes:(id)a3 exlusive:(BOOL)a4;
- (void)setExactTypesAreExclusive:(BOOL)a3;
- (void)setObjectIdentifiers:(id)a3;
- (void)setObjectIdentifiers:(id)a3 exlusive:(BOOL)a4;
- (void)setObjectIdentifiersAreExclusive:(BOOL)a3;
- (void)setOptions:(int64_t)a3;
- (void)setOptions:(int64_t)a3 comparisonStyle:(int64_t)a4;
- (void)setOptionsComparisonStyle:(int64_t)a3;
- (void)setPropertyNames:(id)a3;
- (void)setPropertyNames:(id)a3 exlusive:(BOOL)a4;
- (void)setPropertyNamesAreExclusive:(BOOL)a3;
- (void)setTypes:(id)a3;
- (void)setTypes:(id)a3 exlusive:(BOOL)a4;
- (void)setTypesAreExclusive:(BOOL)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation DebugHierarchyPropertyAction

- (DebugHierarchyPropertyAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)DebugHierarchyPropertyAction;
  result = [(DebugHierarchyPropertyAction *)&v3 init];
  if (result)
  {
    result->_visibility = 15;
    result->_optionsComparisonStyle = 0;
  }
  return result;
}

- (void)setObjectIdentifiers:(id)a3 exlusive:(BOOL)a4
{
  BOOL v4 = a4;
  [(DebugHierarchyPropertyAction *)self setObjectIdentifiers:a3];
  [(DebugHierarchyPropertyAction *)self setObjectIdentifiersAreExclusive:v4];
}

- (void)setTypes:(id)a3 exlusive:(BOOL)a4
{
  BOOL v4 = a4;
  [(DebugHierarchyPropertyAction *)self setTypes:a3];
  [(DebugHierarchyPropertyAction *)self setTypesAreExclusive:v4];
}

- (void)setExactTypes:(id)a3 exlusive:(BOOL)a4
{
  BOOL v4 = a4;
  [(DebugHierarchyPropertyAction *)self setExactTypes:a3];
  [(DebugHierarchyPropertyAction *)self setExactTypesAreExclusive:v4];
}

- (void)setPropertyNames:(id)a3 exlusive:(BOOL)a4
{
  BOOL v4 = a4;
  [(DebugHierarchyPropertyAction *)self setPropertyNames:a3];
  [(DebugHierarchyPropertyAction *)self setPropertyNamesAreExclusive:v4];
}

- (void)addPropertyNames:(id)a3
{
  id v4 = a3;
  id v6 = [(DebugHierarchyPropertyAction *)self propertyNames];
  v5 = [v6 arrayByAddingObjectsFromArray:v4];

  [(DebugHierarchyPropertyAction *)self setPropertyNames:v5];
}

- (void)setOptions:(int64_t)a3 comparisonStyle:(int64_t)a4
{
  [(DebugHierarchyPropertyAction *)self setOptions:a3];
  [(DebugHierarchyPropertyAction *)self setOptionsComparisonStyle:a4];
}

- (id)keysToArchiveViaKVC
{
  v4[0] = @"objectIdentifiers";
  v4[1] = @"objectIdentifiersAreExclusive";
  v4[2] = @"propertyNames";
  v4[3] = @"propertyNamesAreExclusive";
  v4[4] = @"types";
  v4[5] = @"typesAreExclusive";
  v4[6] = @"exactTypes";
  v4[7] = @"exactTypesAreExclusive";
  v4[8] = @"visibility";
  v4[9] = @"options";
  v4[10] = @"optionsComparisonStyle";
  v2 = +[NSArray arrayWithObjects:v4 count:11];
  return v2;
}

- (void)performInContext:(id)a3 withObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(DebugHierarchyPropertyAction *)self isTargetingObject:v7])
  {
    unsigned __int8 v8 = [(DebugHierarchyPropertyAction *)self visibility];
    int64_t v9 = [(DebugHierarchyPropertyAction *)self optionsComparisonStyle];
    v10 = [(DebugHierarchyPropertyAction *)self propertyNames];
    if (v10)
    {
      v11 = [(DebugHierarchyPropertyAction *)self propertyNames];
      if (v11)
      {
        v12 = [(DebugHierarchyPropertyAction *)self propertyNames];
        if ([v12 count]) {
          unsigned __int8 v13 = 0;
        }
        else {
          unsigned __int8 v13 = [(DebugHierarchyPropertyAction *)self propertyNamesAreExclusive];
        }
      }
      else
      {
        unsigned __int8 v13 = 0;
      }
    }
    else
    {
      unsigned __int8 v13 = 1;
    }
    uint64_t v14 = v8 & 0xF;

    v15 = [(DebugHierarchyPropertyAction *)self propertyNames];
    if ([v15 count]) {
      unsigned int v16 = [(DebugHierarchyPropertyAction *)self propertyNamesAreExclusive];
    }
    else {
      unsigned int v16 = 0;
    }

    if (v14 == 15 && v9 == 0) {
      char v18 = v13;
    }
    else {
      char v18 = 1;
    }
    if ((v18 & 1) != 0 || v16)
    {
      v20 = (objc_class *)objc_opt_class();
      if (v20 && (v21 = v20, object_isClass(v20)))
      {
        uint64_t v22 = NSStringFromClass(v21);
      }
      else
      {
        uint64_t v22 = 0;
      }
      v23 = objc_msgSend(v6, "runtimeTypeWithName:", v22, v22);
      v24 = +[NSMutableArray array];
      id v36 = v23;
      if (v36)
      {
        v25 = v36;
        do
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v26 = [v25 instanceProperties];
          v27 = [v26 objectEnumerator];

          id v28 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v38;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v38 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                if ([(DebugHierarchyPropertyAction *)self _isTargetingProperty:v32])
                {
                  v33 = [v32 name];
                  [v24 addObject:v33];
                }
              }
              id v29 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
            }
            while (v29);
          }

          uint64_t v34 = [v25 parentType];

          v25 = (void *)v34;
        }
        while (v34);
      }
      if ([v24 count]) {
        id v19 = [v24 copy];
      }
      else {
        id v19 = 0;
      }
    }
    else
    {
      id v19 = [(DebugHierarchyPropertyAction *)self propertyNames];
    }
    [(DebugHierarchyPropertyAction *)self _fetchValuesForPropertiesWithNames:v19 onObject:v7 inContext:v6];
  }
}

- (BOOL)targetsObjectIdentifiers:(id *)a3
{
  v5 = [(DebugHierarchyPropertyAction *)self objectIdentifiers];
  if ([v5 count])
  {
    unsigned __int8 v6 = [(DebugHierarchyPropertyAction *)self objectIdentifiersAreExclusive];

    if ((v6 & 1) == 0)
    {
      *a3 = [(DebugHierarchyPropertyAction *)self objectIdentifiers];
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)isTargetingObject:(id)a3
{
  id v4 = a3;
  v5 = [(DebugHierarchyPropertyAction *)self objectIdentifiers];
  id v6 = [v5 count];

  if (v6
    && (!v4 ? (id v7 = 0) : (id v7 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", v4)),
        [(DebugHierarchyPropertyAction *)self objectIdentifiers],
        unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 containsObject:v7],
        v8,
        LODWORD(v8) = [(DebugHierarchyPropertyAction *)self objectIdentifiersAreExclusive], v7, v9 == v8))
  {
    LOBYTE(v24) = 0;
  }
  else
  {
    v10 = [(DebugHierarchyPropertyAction *)self types];
    id v11 = [v10 count];

    if (v11)
    {
      if ([(DebugHierarchyPropertyAction *)self typesAreExclusive])
      {
        long long v47 = 0uLL;
        long long v48 = 0uLL;
        long long v45 = 0uLL;
        long long v46 = 0uLL;
        v12 = [(DebugHierarchyPropertyAction *)self types];
        id v13 = [v12 countByEnumeratingWithState:&v45 objects:v52 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v46;
LABEL_10:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(v12);
            }
            if (NSClassFromString(*(NSString **)(*((void *)&v45 + 1) + 8 * v16))
              && (objc_opt_isKindOfClass() & 1) != 0)
            {
              goto LABEL_29;
            }
            if (v14 == (id)++v16)
            {
              id v14 = [v12 countByEnumeratingWithState:&v45 objects:v52 count:16];
              if (v14) {
                goto LABEL_10;
              }
              break;
            }
          }
        }
      }
      else
      {
        long long v43 = 0uLL;
        long long v44 = 0uLL;
        long long v41 = 0uLL;
        long long v42 = 0uLL;
        v12 = [(DebugHierarchyPropertyAction *)self types];
        id v24 = [v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (!v24) {
          goto LABEL_53;
        }
        uint64_t v25 = *(void *)v42;
LABEL_33:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v12);
          }
          if (NSClassFromString(*(NSString **)(*((void *)&v41 + 1) + 8 * v26)) && (objc_opt_isKindOfClass() & 1) != 0) {
            break;
          }
          if (v24 == (id)++v26)
          {
            id v24 = [v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
            if (v24) {
              goto LABEL_33;
            }
            goto LABEL_53;
          }
        }
      }
    }
    v17 = [(DebugHierarchyPropertyAction *)self exactTypes];
    id v18 = [v17 count];

    if (v18)
    {
      if ([(DebugHierarchyPropertyAction *)self exactTypesAreExclusive])
      {
        long long v39 = 0uLL;
        long long v40 = 0uLL;
        long long v37 = 0uLL;
        long long v38 = 0uLL;
        v12 = [(DebugHierarchyPropertyAction *)self exactTypes];
        id v19 = [v12 countByEnumeratingWithState:&v37 objects:v50 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v38;
LABEL_22:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v38 != v21) {
              objc_enumerationMutation(v12);
            }
            Class v23 = NSClassFromString(*(NSString **)(*((void *)&v37 + 1) + 8 * v22));
            if (v23)
            {
              if ([v4 isMemberOfClass:v23]) {
                goto LABEL_52;
              }
            }
            if (v20 == (id)++v22)
            {
              id v20 = [v12 countByEnumeratingWithState:&v37 objects:v50 count:16];
              if (v20) {
                goto LABEL_22;
              }
              break;
            }
          }
        }
      }
      else
      {
        long long v35 = 0uLL;
        long long v36 = 0uLL;
        long long v33 = 0uLL;
        long long v34 = 0uLL;
        v12 = [(DebugHierarchyPropertyAction *)self exactTypes];
        id v27 = [v12 countByEnumeratingWithState:&v33 objects:v49 count:16];
        if (!v27)
        {
LABEL_52:
          LOBYTE(v24) = 1;
          goto LABEL_53;
        }
        id v28 = v27;
        uint64_t v29 = *(void *)v34;
LABEL_44:
        uint64_t v30 = 0;
        while (1)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v12);
          }
          Class v31 = NSClassFromString(*(NSString **)(*((void *)&v33 + 1) + 8 * v30));
          if (v31)
          {
            if ([v4 isMemberOfClass:v31]) {
              break;
            }
          }
          if (v28 == (id)++v30)
          {
            id v28 = [v12 countByEnumeratingWithState:&v33 objects:v49 count:16];
            LOBYTE(v24) = 1;
            if (v28) {
              goto LABEL_44;
            }
            goto LABEL_53;
          }
        }
      }
LABEL_29:
      LOBYTE(v24) = 0;
LABEL_53:

      goto LABEL_54;
    }
    LOBYTE(v24) = 1;
  }
LABEL_54:

  return (char)v24;
}

- (BOOL)_isTargetingProperty:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 visibility];
  if (([(DebugHierarchyPropertyAction *)self visibility] & v5) != 0)
  {
    unint64_t v6 = (unint64_t)[v4 options];
    int64_t v7 = [(DebugHierarchyPropertyAction *)self options];
    switch([(DebugHierarchyPropertyAction *)self optionsComparisonStyle])
    {
      case 0:
        break;
      case 1:
        if ((v7 & ~v6) != 0) {
          goto LABEL_10;
        }
        break;
      case 2:
        if ((v7 & v6) == 0) {
          goto LABEL_10;
        }
        break;
      case 3:
        if ((v7 & v6) != 0) {
          goto LABEL_10;
        }
        break;
      case 4:
        if (v7 != v6) {
          goto LABEL_10;
        }
        break;
      default:
        goto LABEL_10;
    }
    unsigned __int8 v8 = [(DebugHierarchyPropertyAction *)self propertyNames];
    id v9 = [v8 count];

    if (v9)
    {
      v10 = [(DebugHierarchyPropertyAction *)self propertyNames];
      id v11 = [v4 name];
      unsigned int v12 = [v10 containsObject:v11];

      unsigned int v13 = v12 ^ [(DebugHierarchyPropertyAction *)self propertyNamesAreExclusive];
    }
    else
    {
      LOBYTE(v13) = 1;
    }
  }
  else
  {
LABEL_10:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (void)_fetchValuesForPropertiesWithNames:(id)a3 onObject:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    id v11 = (objc_class *)objc_opt_class();
    if (v11 && (unsigned int v12 = v11, object_isClass(v11)))
    {
      unsigned int v13 = NSStringFromClass(v12);
    }
    else
    {
      unsigned int v13 = 0;
    }
    id v14 = [v9 runtimeTypeWithName:v13];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v25 = v7;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        id v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [v14 propertyWithName:*(void *)(*((void *)&v26 + 1) + 8 * (void)v19)];
          if (v20)
          {
            +[DebugHierarchyObjectInterface valueAndOptionsForProperty:v20 onObject:v8 inContext:v9];
            id v21 = v9;
            v23 = id v22 = v8;
            [v10 addObject:v23];

            id v8 = v22;
            id v9 = v21;
          }

          id v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }

    id v24 = [v10 copy];
    [v9 addProperties:v24 toObject:v8];

    id v7 = v25;
  }
}

- (NSString)debugDescription
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = [(DebugHierarchyPropertyAction *)self objectIdentifiers];
  id v6 = [v5 count];
  id v7 = [(DebugHierarchyPropertyAction *)self propertyNames];
  id v8 = [v7 componentsJoinedByString:@", "];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p identifiers: %lu; properties: %@>",
    v4,
    self,
    v6,
  id v9 = v8);

  return (NSString *)v9;
}

- (NSArray)objectIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObjectIdentifiers:(id)a3
{
}

- (BOOL)objectIdentifiersAreExclusive
{
  return self->_objectIdentifiersAreExclusive;
}

- (void)setObjectIdentifiersAreExclusive:(BOOL)a3
{
  self->_objectIdentifiersAreExclusive = a3;
}

- (NSArray)propertyNames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPropertyNames:(id)a3
{
}

- (BOOL)propertyNamesAreExclusive
{
  return self->_propertyNamesAreExclusive;
}

- (void)setPropertyNamesAreExclusive:(BOOL)a3
{
  self->_propertyNamesAreExclusive = a3;
}

- (NSArray)types
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTypes:(id)a3
{
}

- (BOOL)typesAreExclusive
{
  return self->_typesAreExclusive;
}

- (void)setTypesAreExclusive:(BOOL)a3
{
  self->_typesAreExclusive = a3;
}

- (NSArray)exactTypes
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExactTypes:(id)a3
{
}

- (BOOL)exactTypesAreExclusive
{
  return self->_exactTypesAreExclusive;
}

- (void)setExactTypesAreExclusive:(BOOL)a3
{
  self->_exactTypesAreExclusive = a3;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (int64_t)optionsComparisonStyle
{
  return self->_optionsComparisonStyle;
}

- (void)setOptionsComparisonStyle:(int64_t)a3
{
  self->_optionsComparisonStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exactTypes, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_propertyNames, 0);
  objc_storeStrong((id *)&self->_objectIdentifiers, 0);
}

@end