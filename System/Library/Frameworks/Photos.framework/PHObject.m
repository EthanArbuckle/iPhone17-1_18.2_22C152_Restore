@interface PHObject
+ (BOOL)isValidCloudIdentifierStringValue:(id)a3;
+ (BOOL)managedObjectSupportsAdjustments;
+ (BOOL)managedObjectSupportsAllowedForAnalysis;
+ (BOOL)managedObjectSupportsAssetStacks;
+ (BOOL)managedObjectSupportsBodyDetection;
+ (BOOL)managedObjectSupportsBursts;
+ (BOOL)managedObjectSupportsContributor;
+ (BOOL)managedObjectSupportsCreationType;
+ (BOOL)managedObjectSupportsCustomUUIDKey;
+ (BOOL)managedObjectSupportsDetectionType;
+ (BOOL)managedObjectSupportsDuplicateVisibilityState;
+ (BOOL)managedObjectSupportsFaceState;
+ (BOOL)managedObjectSupportsHiddenState;
+ (BOOL)managedObjectSupportsKeyFaces;
+ (BOOL)managedObjectSupportsMontage;
+ (BOOL)managedObjectSupportsPendingState;
+ (BOOL)managedObjectSupportsPersonFilters;
+ (BOOL)managedObjectSupportsRejectedState;
+ (BOOL)managedObjectSupportsSavedAssetType;
+ (BOOL)managedObjectSupportsScreenshot;
+ (BOOL)managedObjectSupportsShareExitingState;
+ (BOOL)managedObjectSupportsShareExpiredState;
+ (BOOL)managedObjectSupportsShareTrashedState;
+ (BOOL)managedObjectSupportsSharingComposition;
+ (BOOL)managedObjectSupportsTorsoOnly;
+ (BOOL)managedObjectSupportsTrashedState;
+ (BOOL)managedObjectSupportsVisibilityState;
+ (Class)propertySetClassForPropertySet:(id)a3;
+ (PHEntityKeyMap)entityKeyMap;
+ (id)authorizationAwareFetchResultWithOptions:(id)a3 fetchBlock:(id)a4;
+ (id)entityKeyForPropertyKey:(id)a3;
+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3;
+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)identifierCodeFromLocalIdentifier:(id)a3;
+ (id)identifierPropertiesToFetch;
+ (id)internalSortDescriptorForPropertyKey:(id)a3 ascending:(BOOL)a4;
+ (id)localIdentifierExpressionForFetchRequests;
+ (id)localIdentifierWithUUID:(id)a3;
+ (id)localIdentifiersWithUUIDs:(id)a3;
+ (id)managedEntityName;
+ (id)objectIDsMatchingEntityFromObjectIDs:(id)a3 context:(id)a4;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)propertyKeyForEntityKey:(id)a3;
+ (id)propertySetAccessorsByPropertySet;
+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (id)uuidFromLocalIdentifier:(id)a3;
+ (id)uuidsFromLocalIdentifiers:(id)a3;
+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3;
+ (void)assertAllObjects:(id)a3 forSelector:(SEL)a4 areOfType:(Class)a5;
+ (void)extendPropertiesToFetch:(id)a3 withProperties:(id)a4;
+ (void)extendPropertiesToFetch:(id)a3 withPropertySetClass:(Class)a4;
- (BOOL)hasLoadedPropertySet:(id)a3;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransient;
- (Class)changeRequestClass;
- (NSManagedObjectID)objectID;
- (NSString)description;
- (NSString)localIdentifier;
- (NSString)uuid;
- (PHObject)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (PHObjectReference)objectReference;
- (PHPhotoLibrary)photoLibrary;
- (id)_shortObjectIDURI;
- (id)identifier;
- (unint64_t)hash;
- (unint64_t)propertyHint;
- (void)addFetchPropertyHint:(unint64_t)a3;
- (void)assertRequiredFetchPropertyHints:(unint64_t)a3;
- (void)dealloc;
- (void)fetchPropertySetsIfNeeded;
@end

@implementation PHObject

- (PHObject)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PHObject;
  v10 = [(PHObject *)&v18 init];
  if (v10)
  {
    v11 = [v8 objectForKeyedSubscript:@"objectID"];
    uint64_t v12 = +[PHPhotoLibrary uniquedOID:v11];
    objectID = v10->_objectID;
    v10->_objectID = (NSManagedObjectID *)v12;

    v14 = [v8 objectForKeyedSubscript:@"deleted"];
    v10->_deleted = [v14 BOOLValue];

    uint64_t v15 = [v8 objectForKeyedSubscript:@"uuid"];
    uuid = v10->_uuid;
    v10->_uuid = (NSString *)v15;

    objc_storeStrong((id *)&v10->_photoLibrary, a5);
    v10->_propertyHintLock_propertyHint = a4;
    v10->_propertyHintLock._os_unfair_lock_opaque = 0;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PHObject *)a3;
  if (self == v4)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PHObject *)self identifier];
      v7 = [(PHObject *)v5 identifier];

      char IsEqual = PLObjectIsEqual();
    }
    else
    {
      char IsEqual = 0;
    }
  }

  return IsEqual;
}

- (unint64_t)hash
{
  v2 = [(PHObject *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)identifier
{
  objectID = self->_objectID;
  if (objectID)
  {
    unint64_t v3 = objectID;
  }
  else
  {
    unint64_t v3 = [(PHObject *)self uuid];
    if (!v3)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PHObject.m" lineNumber:434 description:@"Must have a uuid if no _objectID"];

      unint64_t v3 = 0;
    }
  }

  return v3;
}

- (NSManagedObjectID)objectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 40, 1);
}

+ (BOOL)managedObjectSupportsFaceState
{
  return 0;
}

+ (BOOL)managedObjectSupportsPendingState
{
  return 0;
}

+ (BOOL)managedObjectSupportsRejectedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsPersonFilters
{
  return 0;
}

+ (BOOL)managedObjectSupportsKeyFaces
{
  return 0;
}

+ (BOOL)managedObjectSupportsCreationType
{
  return 0;
}

+ (BOOL)managedObjectSupportsTorsoOnly
{
  return 0;
}

+ (BOOL)managedObjectSupportsBodyDetection
{
  return 0;
}

+ (BOOL)managedObjectSupportsDetectionType
{
  return 0;
}

+ (BOOL)managedObjectSupportsShareTrashedState
{
  return 0;
}

+ (BOOL)managedObjectSupportsShareExpiredState
{
  return 0;
}

+ (BOOL)managedObjectSupportsShareExitingState
{
  return 0;
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 0;
}

+ (BOOL)managedObjectSupportsSavedAssetType
{
  return 0;
}

+ (BOOL)managedObjectSupportsDuplicateVisibilityState
{
  return 0;
}

+ (BOOL)managedObjectSupportsVisibilityState
{
  return 0;
}

+ (BOOL)managedObjectSupportsScreenshot
{
  return 0;
}

+ (BOOL)managedObjectSupportsMontage
{
  return 0;
}

+ (BOOL)managedObjectSupportsHiddenState
{
  return 0;
}

+ (BOOL)managedObjectSupportsContributor
{
  return 0;
}

+ (BOOL)managedObjectSupportsBursts
{
  return 0;
}

+ (BOOL)managedObjectSupportsAssetStacks
{
  return 0;
}

+ (BOOL)managedObjectSupportsAllowedForAnalysis
{
  return 0;
}

+ (BOOL)managedObjectSupportsAdjustments
{
  return 0;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)localIdentifier
{
  unint64_t v3 = objc_opt_class();
  v4 = [(PHObject *)self uuid];
  v5 = [v3 localIdentifierWithUUID:v4];

  return (NSString *)v5;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

+ (id)localIdentifierWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [a1 identifierCode];
  v6 = [NSString stringWithFormat:@"%@%@%@", v4, @"/L0/", v5];

  return v6;
}

+ (id)authorizationAwareFetchResultWithOptions:(id)a3 fetchBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  if (+[PHPhotoLibrary checkAuthorizationStatusForAPIAccessLevel:2])
  {
    v6[2](v6, v5);
    v7 = (PHUnauthorizedFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];

    if (v8)
    {
      id v9 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_FAULT, "Attempted fetch within change block can trigger deadlock, returning unauthorized fetch result", v12, 2u);
      }
    }
    +[PHPhotoLibrary requestAuthorizationForAccessLevel:2 handler:&__block_literal_global_89];
    v7 = [[PHUnauthorizedFetchResult alloc] initWithOptions:v5 status:+[PHPhotoLibrary authorizationStatusForAccessLevel:2] fetchBlock:v6];
  }
  v10 = v7;

  return v10;
}

- (BOOL)isTransient
{
  return self->_objectID == 0;
}

+ (id)uuidFromLocalIdentifier:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 >= 0x25)
  {
    id v5 = [v3 substringToIndex:36];
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  if (v4 == 36)
  {
    id v5 = v3;
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_objectID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)dealloc
{
  ph_objc_removeAssociatedObjects(self);
  v3.receiver = self;
  v3.super_class = (Class)PHObject;
  [(PHObject *)&v3 dealloc];
}

+ (void)extendPropertiesToFetch:(id)a3 withProperties:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([v5 indexOfObject:v11] == 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

+ (id)identifierPropertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)identifierPropertiesToFetch_array_32892;

  return v2;
}

+ (void)extendPropertiesToFetch:(id)a3 withPropertySetClass:(Class)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([(objc_class *)a4 isToMany] & 1) == 0)
  {
    uint64_t v7 = [(objc_class *)a4 propertiesToFetch];
    uint64_t v8 = [(objc_class *)a4 keyPathFromPrimaryObject];
    v25 = v8;
    id v24 = a1;
    if (v8)
    {
      uint64_t v9 = [v8 stringByAppendingString:@"."];
    }
    else
    {
      uint64_t v9 = 0;
    }
    v10 = [@"." stringByAppendingString:@"objectID"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(id *)(*((void *)&v31 + 1) + 8 * i);
          if (v9)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [NSString stringWithFormat:@"Trying to create a property path '%@' on '%@' with an unexpected property type: %@", v15, v24, objc_opt_class()];
              id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
              objc_exception_throw(v23);
            }
            v16 = [v9 stringByAppendingString:v15];

            if ([v16 hasSuffix:v10])
            {
              id v15 = v25;
            }
            else
            {
              id v15 = v16;
            }
          }
          if ([v6 indexOfObject:v15] == 0x7FFFFFFFFFFFFFFFLL) {
            [v6 addObject:v15];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v12);
    }

    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = [(objc_class *)a4 additionalPropertiesToFetchOnPrimaryObject];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(id *)(*((void *)&v27 + 1) + 8 * j);
            if ([v6 indexOfObject:v22] == 0x7FFFFFFFFFFFFFFFLL) {
              [v6 addObject:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v19);
      }
    }
  }
}

+ (id)internalSortDescriptorForPropertyKey:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() entityKeyForPropertyKey:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:v6 ascending:v4];

  return v7;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 leftExpression];
  uint64_t v9 = [v6 rightExpression];
  char v57 = 0;
  if ([v8 expressionType] == 1 && !objc_msgSend(v9, "expressionType")
    || [v9 expressionType] == 1 && !objc_msgSend(v8, "expressionType"))
  {
    uint64_t v25 = [v8 expressionType];
    if (v25 == 1) {
      v26 = v9;
    }
    else {
      v26 = v8;
    }
    uint64_t v12 = [v26 constantValue];
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __58__PHObject_fetchPredicateFromComparisonPredicate_options___block_invoke;
    v52[3] = &unk_1E5846A90;
    v52[4] = &v53;
    long long v27 = PHQueryTransformExpressionConstantValue(v12, v52);
    if (*((unsigned char *)v54 + 24))
    {
      id v28 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v27];
    }
    else
    {
      id v28 = v26;
    }
    long long v29 = v28;
    if (v25 == 1)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28B98]);
      uint64_t v31 = [v6 comparisonPredicateModifier];
      uint64_t v32 = [v6 predicateOperatorType];
      uint64_t v33 = [v6 options];
      long long v34 = v8;
      v35 = v29;
    }
    else
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28B98]);
      uint64_t v31 = [v6 comparisonPredicateModifier];
      uint64_t v32 = [v6 predicateOperatorType];
      uint64_t v33 = [v6 options];
      long long v34 = v29;
      v35 = v9;
    }
    id v24 = (id)[v30 initWithLeftExpression:v34 rightExpression:v35 modifier:v31 type:v32 options:v33];

    _Block_object_dispose(&v53, 8);
    goto LABEL_52;
  }
  if (([v8 expressionType] != 3 || !PHIsExpressionMatchingTypeOrAggregateMatchingType(v9, &v57))
    && ([v9 expressionType] != 3 || !PHIsExpressionMatchingTypeOrAggregateMatchingType(v8, &v57)))
  {
    id v24 = 0;
    goto LABEL_53;
  }
  uint64_t v10 = [v8 expressionType];
  if (v10 == 3) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = v9;
  }
  uint64_t v12 = [v11 keyPath];
  if ([v12 isEqualToString:@"localIdentifier"] && !v57)
  {
    id v50 = v7;
    if (v10 == 3) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = v8;
    }
    long long v14 = [v13 constantValue];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __58__PHObject_fetchPredicateFromComparisonPredicate_options___block_invoke_2;
    v51[3] = &__block_descriptor_40_e8__16__0_8l;
    v51[4] = a1;
    v48 = v14;
    uint64_t v15 = PHQueryTransformExpressionConstantValue(v14, v51);
    v16 = [a1 localIdentifierExpressionForFetchRequests];
    v46 = (void *)v15;
    uint64_t v17 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v15];
    id v18 = objc_alloc(MEMORY[0x1E4F28B98]);
    uint64_t v19 = [v6 comparisonPredicateModifier];
    uint64_t v20 = [v6 predicateOperatorType];
    uint64_t v21 = [v6 options];
    if (v10 == 3)
    {
      id v22 = v16;
      id v23 = v17;
    }
    else
    {
      id v22 = v17;
      id v23 = v16;
    }
    id v24 = (id)[v18 initWithLeftExpression:v22 rightExpression:v23 modifier:v19 type:v20 options:v21];

LABEL_51:
    id v7 = v50;
    goto LABEL_52;
  }
  if (([a1 managedObjectSupportsCustomUUIDKey] & 1) != 0
    || ![v12 isEqualToString:@"uuid"]
    || v57)
  {
    if (v12)
    {
      id v50 = v7;
      if (v10 == 3) {
        v36 = v9;
      }
      else {
        v36 = v8;
      }
      id v37 = v36;
      v38 = [a1 entityKeyForPropertyKey:v12];
      if (v38)
      {
        v39 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v38];
        v40 = [a1 transformValueExpression:v37 forKeyPath:v12];
        if (v40)
        {
          id v49 = objc_alloc(MEMORY[0x1E4F28B98]);
          uint64_t v47 = [v6 comparisonPredicateModifier];
          uint64_t v41 = [v6 predicateOperatorType];
          uint64_t v42 = [v6 options];
          if (v10 == 3)
          {
            v43 = v39;
            v44 = v40;
          }
          else
          {
            v43 = v40;
            v44 = v39;
          }
          id v24 = (id)[v49 initWithLeftExpression:v43 rightExpression:v44 modifier:v47 type:v41 options:v42];
        }
        else
        {
          id v24 = 0;
        }
      }
      else
      {
        id v24 = 0;
      }

      goto LABEL_51;
    }
    id v24 = 0;
  }
  else
  {
    id v24 = v6;
  }
LABEL_52:

LABEL_53:

  return v24;
}

+ (id)entityKeyForPropertyKey:(id)a3
{
  id v4 = a3;
  id v5 = [a1 entityKeyMap];
  id v6 = [v5 entityKeyForPropertyKey:v4];

  return v6;
}

+ (BOOL)managedObjectSupportsCustomUUIDKey
{
  return 0;
}

void __39__PHObject_identifierPropertiesToFetch__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"uuid";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)identifierPropertiesToFetch_array_32892;
  identifierPropertiesToFetch_array_32892 = v1;
}

- (unint64_t)propertyHint
{
  p_propertyHintLock = &self->_propertyHintLock;
  os_unfair_lock_lock(&self->_propertyHintLock);
  unint64_t propertyHintLock_propertyHint = self->_propertyHintLock_propertyHint;
  os_unfair_lock_unlock(p_propertyHintLock);
  return propertyHintLock_propertyHint;
}

- (void)fetchPropertySetsIfNeeded
{
}

- (void)assertRequiredFetchPropertyHints:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(PHObject *)self propertyHint];
  if ((a3 & ~v5) != 0)
  {
    unint64_t v6 = v5;
    id v7 = [(id)objc_opt_class() propertySetsForPropertyFetchHints:a3];
    uint64_t v8 = [v7 description];
    if ([v7 count] == 1)
    {
      uint64_t v9 = [v7 anyObject];

      uint64_t v8 = (void *)v9;
    }
    uint64_t v10 = [NSString stringWithFormat:@"%@ not available unless prefetched (%lx)", v8, v6];
    if (MEMORY[0x19F388B10]())
    {
      id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v10 userInfo:0];
      objc_exception_throw(v12);
    }
    uint64_t v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      long long v14 = v10;
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_FAULT, "Missing required fetch property hint: %{public}@ (%@)", buf, 0x16u);
    }
  }
}

- (void)addFetchPropertyHint:(unint64_t)a3
{
  p_propertyHintLock = &self->_propertyHintLock;
  os_unfair_lock_lock(&self->_propertyHintLock);
  self->_propertyHintLock_propertyHint |= a3;

  os_unfair_lock_unlock(p_propertyHintLock);
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)PHObject;
  objc_super v3 = [(PHObject *)&v7 description];
  id v4 = [(PHObject *)self localIdentifier];
  unint64_t v5 = [v3 stringByAppendingFormat:@" %@", v4];

  return (NSString *)v5;
}

- (Class)changeRequestClass
{
  return 0;
}

- (id)_shortObjectIDURI
{
  v2 = [(NSManagedObjectID *)self->_objectID URIRepresentation];
  objc_super v3 = [v2 pathComponents];
  unint64_t v4 = [v3 count];
  unint64_t v5 = v4 - 2;
  if (v4 < 2)
  {
    uint64_t v8 = objc_msgSend(v2, "path", v5);
  }
  else
  {
    unint64_t v6 = NSString;
    objc_super v7 = objc_msgSend(v3, "subarrayWithRange:", v5, 2);
    uint64_t v8 = [v6 pathWithComponents:v7];
  }

  return v8;
}

- (BOOL)hasLoadedPropertySet:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[(id)objc_opt_class() propertySetClassForPropertySet:v4];

  BOOL result = 0;
  if (v5)
  {
    unint64_t v6 = ph_objc_getAssociatedObject(self, v5);

    if (v6) {
      return 1;
    }
  }
  return result;
}

id __58__PHObject_fetchPredicateFromComparisonPredicate_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    id v4 = [v3 objectID];
  }
  unint64_t v5 = v4;

  return v5;
}

id __58__PHObject_fetchPredicateFromComparisonPredicate_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() uuidFromLocalIdentifier:v2];

  return v3;
}

+ (id)fetchPredicateForSharingFilter:(unsigned __int16)a3
{
  return 0;
}

+ (id)localIdentifierExpressionForFetchRequests
{
  return (id)[MEMORY[0x1E4F28C68] expressionForKeyPath:@"uuid"];
}

+ (void)assertAllObjects:(id)a3 forSelector:(SEL)a4 areOfType:(Class)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v14 = *MEMORY[0x1E4F1C3C8];
          __int16 v15 = NSString;
          v16 = NSStringFromSelector(a4);
          uint64_t v17 = NSStringFromClass(a5);
          id v18 = [v15 stringWithFormat:@"Invalid object %@ passed to %@, objects must be of type %@", v12, v16, v17];
          id v19 = [v13 exceptionWithName:v14 reason:v18 userInfo:0];

          objc_exception_throw(v19);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

+ (id)identifierCodeFromLocalIdentifier:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x29)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 substringFromIndex:40];
  }

  return v4;
}

+ (id)uuidsFromLocalIdentifiers:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PHObject_uuidsFromLocalIdentifiers___block_invoke;
  v5[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v5[4] = a1;
  id v3 = objc_msgSend(a3, "_pl_map:", v5);

  return v3;
}

uint64_t __38__PHObject_uuidsFromLocalIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) uuidFromLocalIdentifier:a2];
}

+ (id)localIdentifiersWithUUIDs:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PHObject_localIdentifiersWithUUIDs___block_invoke;
  v5[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v5[4] = a1;
  id v3 = objc_msgSend(a3, "_pl_map:", v5);

  return v3;
}

uint64_t __38__PHObject_localIdentifiersWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) localIdentifierWithUUID:a2];
}

+ (BOOL)isValidCloudIdentifierStringValue:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@":"];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

+ (id)objectIDsMatchingEntityFromObjectIDs:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [a1 managedEntityName];
    uint64_t v9 = PLSafeEntityForNameInManagedObjectContext();
    uint64_t v10 = v9;
    if (v9)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__PHObject_objectIDsMatchingEntityFromObjectIDs_context___block_invoke;
      aBlock[3] = &unk_1E5846A40;
      id v15 = v9;
      uint64_t v11 = _Block_copy(aBlock);
      uint64_t v12 = objc_msgSend(v6, "_pl_filter:", v11);
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v12;
}

uint64_t __57__PHObject_objectIDsMatchingEntityFromObjectIDs_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 entity];
  uint64_t v4 = [v3 isKindOfEntity:*(void *)(a1 + 32)];

  return v4;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  return 0;
}

+ (id)propertyKeyForEntityKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 entityKeyMap];
  id v6 = [v5 propertyKeyForEntityKey:v4];

  return v6;
}

+ (PHEntityKeyMap)entityKeyMap
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unint64_t v5 = NSStringFromClass((Class)a1);
  id v6 = [v4 stringWithFormat:@"%@ has no entityKeyMap", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)identifierCode
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unint64_t v5 = NSStringFromClass((Class)a1);
  id v6 = [v4 stringWithFormat:@"%@ has no identifier", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)fetchType
{
  return 0;
}

+ (id)managedEntityName
{
  return 0;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  return 0;
}

+ (Class)propertySetClassForPropertySet:(id)a3
{
  return 0;
}

+ (id)propertySetAccessorsByPropertySet
{
  return 0;
}

+ (id)propertySetsForPropertyFetchHints:(unint64_t)a3
{
  return 0;
}

+ (unint64_t)propertyFetchHintsForPropertySets:(id)a3
{
  return 2;
}

- (PHObjectReference)objectReference
{
  return (PHObjectReference *)+[PHObjectReference referenceForObject:self];
}

@end