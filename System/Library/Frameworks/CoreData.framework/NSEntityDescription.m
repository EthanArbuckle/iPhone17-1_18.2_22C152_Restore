@interface NSEntityDescription
+ (BOOL)supportsSecureCoding;
+ (NSEntityDescription)entityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSManagedObject)insertNewObjectForEntityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context;
+ (id)_MOClassName;
+ (void)initialize;
- (BOOL)_hasUniqueProperties;
- (BOOL)_isEditable;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)_skipValidation;
- (BOOL)_subentitiesIncludes:(id)a3;
- (BOOL)isAbstract;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfEntity:(NSEntityDescription *)entity;
- (BOOL)performPostDecodeValidationInModel:(id)a3 error:(id *)a4;
- (NSArray)compoundIndexes;
- (NSArray)indexes;
- (NSArray)properties;
- (NSArray)relationshipsWithDestinationEntity:(NSEntityDescription *)entity;
- (NSArray)subentities;
- (NSArray)uniquenessConstraints;
- (NSData)versionHash;
- (NSDictionary)attributesByName;
- (NSDictionary)propertiesByName;
- (NSDictionary)relationshipsByName;
- (NSDictionary)subentitiesByName;
- (NSDictionary)userInfo;
- (NSEntityDescription)init;
- (NSEntityDescription)initWithCoder:(id)a3;
- (NSEntityDescription)superentity;
- (NSExpression)coreSpotlightDisplayNameExpression;
- (NSManagedObjectModel)managedObjectModel;
- (NSString)managedObjectClassName;
- (NSString)name;
- (NSString)renamingIdentifier;
- (NSString)versionHashModifier;
- (_NSRange)_propertyRangesByType;
- (__CFSet)_collectSubentities;
- (id)_attributeNamed:(uint64_t)a1;
- (id)_initWithName:(id)a3;
- (id)_localRelationshipNamed:(id)a3;
- (id)_newMappingForPropertiesOfRange:(unsigned int)a3;
- (id)_new_implicitlyObservedKeys;
- (id)_propertiesOnlySubsetFromIndexes:(uint64_t)a1;
- (id)_propertySearchMapping;
- (id)_propertyWithRenamingIdentifier:(id)a3;
- (id)_relationshipNamed:(void *)a1;
- (id)_uniquenessConstraintsAsFetchIndexes;
- (id)attributeKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)inverseForRelationshipKey:(id)a3;
- (id)toManyRelationshipKeys;
- (id)toOneRelationshipKeys;
- (uint64_t)_constraintIsExtension:(uint64_t)result;
- (uint64_t)_dropIndexes;
- (uint64_t)_finalizeIndexes;
- (uint64_t)_hasAttributesWithExternalDataReferences;
- (uint64_t)_hasAttributesWithFileBackedFutures;
- (uint64_t)_hasDerivedAttributes;
- (uint64_t)_hasIndexForProperty:(uint64_t)result;
- (uint64_t)_hasPotentialHashSkew;
- (uint64_t)_hasPropertiesIndexedBySpotlight;
- (uint64_t)_hasUniquedProperty:(uint64_t)result;
- (uint64_t)_isPathologicalForConstraintMerging:(uint64_t)result;
- (uint64_t)_keypathsForDeletions;
- (uint64_t)_keypathsToPrefetchForDeletePropagationPrefixedWith:(uint64_t)a3 toDepth:(void *)a4 processedEntities:;
- (uint64_t)_newVersionHashInStyle:(uint64_t)result;
- (uint64_t)_propertyKeys:(uint64_t)a3 matchingBlock:;
- (uint64_t)_relationshipNamesByType:(uint64_t)a1;
- (uint64_t)_removeIndexForProperty:(uint64_t)result;
- (uint64_t)_removeProperty:(uint64_t)result;
- (uint64_t)_removeSubentity:(uint64_t)result;
- (uint64_t)_setSuperentity:(uint64_t)result;
- (uint64_t)_validateIndexNameChangeFrom:(uint64_t)a3 to:;
- (unint64_t)_entityClass;
- (unint64_t)_keypathsToPrefetchForDeletePropagation;
- (unint64_t)_offsetRelationshipIndex:(unint64_t)a3 fromSuperEntity:(id)a4 andIsToMany:(BOOL)a5;
- (unint64_t)_versionHashInStyle:(unint64_t *)result;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_addFactoryToRetainList:(id)a3;
- (void)_addIndexForProperty:(uint64_t)a1;
- (void)_addProperty:(id)a3;
- (void)_addSubentity:(id)a3;
- (void)_addSupplementalIndexes:(uint64_t)a1;
- (void)_checkAttributeMembership:(void *)a1 hashes:(void *)a2;
- (void)_checkForNonCascadeNoInverses;
- (void)_checkSelfForNonCascadeNoInverses;
- (void)_commonCachesAndOptimizedState;
- (void)_createCachesAndOptimizeState;
- (void)_extensionsOfParentConstraint:(void *)result;
- (void)_flattenProperties;
- (void)_initializeExtraIVars;
- (void)_leopardStyleAttributesByName;
- (void)_leopardStyleRelationshipsByName;
- (void)_newSnowLeopardStyleDictionaryContainingPropertiesOfType:(unint64_t)a3;
- (void)_propertiesMatchingBlock:(uint64_t)a1;
- (void)_restoreValidation;
- (void)_setIndexes:(uint64_t)a1;
- (void)_setIndexesFromJSONObject:(int)a3 supplemental:;
- (void)_setIsEditable:(BOOL)a3;
- (void)_setManagedObjectModel:(void *)result;
- (void)_setProperties:(char)a3 preserveIndices:;
- (void)_setSubentities:(char)a3 preserveIndices:;
- (void)_setUniquenessConstraints:(uint64_t)a1;
- (void)_sortedSubentities;
- (void)_stripForMigration;
- (void)_throwIfNotEditable;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)knownKeysMappingStrategy;
- (void)setAbstract:(BOOL)abstract;
- (void)setCompoundIndexes:(NSArray *)compoundIndexes;
- (void)setCoreSpotlightDisplayNameExpression:(NSExpression *)coreSpotlightDisplayNameExpression;
- (void)setIndexes:(NSArray *)indexes;
- (void)setManagedObjectClassName:(NSString *)managedObjectClassName;
- (void)setName:(NSString *)name;
- (void)setProperties:(NSArray *)properties;
- (void)setRenamingIdentifier:(NSString *)renamingIdentifier;
- (void)setSubentities:(NSArray *)subentities;
- (void)setUniquenessConstraints:(NSArray *)uniquenessConstraints;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setVersionHashModifier:(NSString *)versionHashModifier;
@end

@implementation NSEntityDescription

- (NSManagedObjectModel)managedObjectModel
{
  return self->_model;
}

+ (NSEntityDescription)entityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context
{
  if (!context)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = [NSString stringWithFormat:@"+entityForName: nil is not a legal NSManagedObjectContext parameter searching for entity name '%@'", entityName];
    goto LABEL_13;
  }
  v5 = [(NSManagedObjectContext *)context persistentStoreCoordinator];
  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = [NSString stringWithFormat:@"+entityForName: nil is not a legal NSPersistentStoreCoordinator for searching for entity name '%@'", entityName];
    goto LABEL_13;
  }
  v6 = v5;
  if (![(NSPersistentStoreCoordinator *)v5 managedObjectModel])
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    uint64_t v12 = [NSString stringWithFormat:@"+entityForName: could not locate an NSManagedObjectModel for entity name '%@'", entityName];
LABEL_13:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:0]);
  }
  modelMap = v6->_modelMap;
  if (modelMap)
  {
    result = [(NSDictionary *)modelMap->_entitiesByPath objectForKey:entityName];
    if (result) {
      return result;
    }
    v9 = v6->_modelMap;
  }
  else
  {
    v9 = 0;
  }

  return (NSEntityDescription *)-[_PFModelMap ancillaryEntityWithName:](v9, (uint64_t)entityName);
}

- (uint64_t)_constraintIsExtension:(uint64_t)result
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 128);
    if (v4)
    {
      v5 = *(void **)(v4 + 24);
      if (v5)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v16;
          uint64_t v14 = v3;
          while (2)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              unint64_t v11 = [v10 count];
              if ([a2 count] > v11)
              {
                if (v11)
                {
                  uint64_t v12 = 0;
                  uint64_t v13 = 0;
                  do
                  {
                    v13 += objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v12), "isEqual:", objc_msgSend(a2, "objectAtIndex:", v12));
                    ++v12;
                  }
                  while (v11 != v12);
                }
                else
                {
                  uint64_t v13 = 0;
                }
                if (v13 == v11) {
                  return 1;
                }
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
            uint64_t v3 = v14;
            if (v7) {
              continue;
            }
            break;
          }
        }
      }
    }
    result = *(void *)(v3 + 80);
    if (result) {
      return -[NSEntityDescription _constraintIsExtension:](result, a2);
    }
  }
  return result;
}

- (BOOL)_hasUniqueProperties
{
  if (result)
  {
    if ((*(_DWORD *)(result + 120) & 4) == 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Entity wasn't finalized properly before use" userInfo:0]);
    }
    return (*(_DWORD *)(result + 120) & 0x1800) != 0;
  }
  return result;
}

- (BOOL)_subentitiesIncludes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 == self)
  {
LABEL_14:
    LOBYTE(v5) = 1;
    return v5;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_subentities count];
  if (v5)
  {
    if ([(NSEntityDescription *)self _isEditable])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      subentities = self->_subentities;
      uint64_t v5 = [(NSMutableDictionary *)subentities countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v7 = v5;
        uint64_t v8 = *(void *)v14;
LABEL_6:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(subentities);
          }
          id v10 = (id)[(NSMutableDictionary *)self->_subentities objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
          if (v10 == a3 || ([v10 _subentitiesIncludes:a3] & 1) != 0) {
            goto LABEL_14;
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [(NSMutableDictionary *)subentities countByEnumeratingWithState:&v13 objects:v17 count:16];
            LOBYTE(v5) = 0;
            if (v7) {
              goto LABEL_6;
            }
            return v5;
          }
        }
      }
    }
    else
    {
      flattenedSubentities = self->_flattenedSubentities;
      if (!flattenedSubentities)
      {
        flattenedSubentities = -[NSEntityDescription _collectSubentities](self);
        self->_flattenedSubentities = flattenedSubentities;
      }
      LOBYTE(v5) = CFSetContainsValue((CFSetRef)flattenedSubentities, a3) != 0;
    }
  }
  return v5;
}

- (BOOL)isKindOfEntity:(NSEntityDescription *)entity
{
  return [(NSEntityDescription *)entity _subentitiesIncludes:self];
}

- (void)_leopardStyleRelationshipsByName
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _PF_Leopard_CFDictionaryCreate();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  properties = self->_properties;
  uint64_t v5 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(properties);
        }
        uint64_t v9 = *(__CFString **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:v9];
        if ([v10 _propertyType] == 4) {
          _PF_Leopard_CFDictionarySetValue(v3, v9, v10);
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)_createCachesAndOptimizeState
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_entityDescriptionFlags & 4) == 0)
  {
    id v147 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    self->_rootentity = self;
    superentity = self->_superentity;
    if (superentity)
    {
      if (![(NSMutableDictionary *)superentity->_subentities objectForKey:self->_name])
      {
        v138 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v139 = [NSString stringWithFormat:@"Bad model.  For entity '%@' superentity '%@' does not think I am a subentity", self->_name, self->_superentity->_name];
        objc_exception_throw((id)[v138 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v139 userInfo:0]);
      }
      [(NSEntityDescription *)self->_superentity _createCachesAndOptimizeState];
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88
        && ![(NSString *)self->_classNameForEntity isEqualToString:@"NSManagedObject"])
      {
        NSClassFromString(self->_classNameForEntity);
        self;
      }
      for (uint64_t i = self->_rootentity; ; self->_rootentity = i)
      {
        uint64_t i = [(NSEntityDescription *)i superentity];
        if (!i) {
          break;
        }
      }
    }
    if ([(NSMutableDictionary *)self->_subentities count])
    {
      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      uint64_t v5 = (void *)[(NSMutableDictionary *)self->_subentities allValues];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v160 objects:v172 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v161;
        do
        {
          for (uint64_t j = 0; j != v6; ++j)
          {
            if (*(void *)v161 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void *)(*((void *)&v160 + 1) + 8 * j);
            if (*(NSEntityDescription **)(v9 + 80) != self)
            {
              v132 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v133 = [NSString stringWithFormat:@"Bad model.  For entity '%@' subentity '%@' does not think I am its superentity", self->_name, *(void *)(v9 + 64)];
              objc_exception_throw((id)[v132 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v133 userInfo:0]);
            }
            model = self->_model;
            uint64_t v11 = [*(id *)(*((void *)&v160 + 1) + 8 * j) name];
            if (model) {
              model = (NSManagedObjectModel *)[(NSMutableDictionary *)model->_entities objectForKey:v11];
            }
            if (model != (NSManagedObjectModel *)v9)
            {
              v130 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v131 = [NSString stringWithFormat:@"Bad model.  For entity '%@' subentity '%@ (%p)' is not registered in NSManagedModelModel.  Model has a reference to %@ (%p)", self->_name, *(void *)(v9 + 64), v9, -[NSManagedObjectModel name](model, "name"), model];
              objc_exception_throw((id)[v130 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v131 userInfo:0]);
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v160 objects:v172 count:16];
        }
        while (v6);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[NSMutableDictionary allValues](self->_properties, "allValues"));
      [v12 sortUsingFunction:_comparePropertiesByName context:0];
      id v150 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      id v151 = v12;
      long long v13 = (void *)[MEMORY[0x1E4F1CA80] set];
      long long v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v158 = 0u;
      long long v159 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      uint64_t v15 = [v12 countByEnumeratingWithState:&v156 objects:v171 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v157;
        do
        {
          for (uint64_t k = 0; k != v15; ++k)
          {
            if (*(void *)v157 != v16) {
              objc_enumerationMutation(v151);
            }
            uint64_t v18 = *(void **)(*((void *)&v156 + 1) + 8 * k);
            v19 = (void *)MEMORY[0x18C127630]();
            [v18 _createCachesAndOptimizeState];
            __entityDescriptionFlags entityDescriptionFlags = self->_entityDescriptionFlags;
            if ((*(unsigned char *)&entityDescriptionFlags & 0x20) != 0)
            {
              int v21 = *(_DWORD *)&self->_entityDescriptionFlags & 0x20;
            }
            else
            {
              if (-[NSEntityDescription _hasPropertiesIndexedBySpotlight]((uint64_t)self)) {
                int v21 = 32;
              }
              else {
                int v21 = 0;
              }
              __entityDescriptionFlags entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&self->_entityDescriptionFlags & 0xFFFFFFDF | v21);
              self->___entityDescriptionFlags entityDescriptionFlags = entityDescriptionFlags;
            }
            if (HIBYTE(dword_1EB270AB8)) {
              BOOL v22 = v21 == 0;
            }
            else {
              BOOL v22 = 1;
            }
            if (!v22)
            {
              if (![v18 _isSpotlightIndexedAndTransient])
              {
                v136 = (void *)MEMORY[0x1E4F1CA00];
                v169 = @"attribute";
                uint64_t v170 = [v18 name];
                uint64_t v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v169 count:1];
                objc_exception_throw((id)[v136 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Transient attributes cannot be indexed in Spotlight" userInfo:v137]);
              }
              __entityDescriptionFlags entityDescriptionFlags = self->_entityDescriptionFlags;
            }
            if ((*(unsigned char *)&entityDescriptionFlags & 0x40) == 0)
            {
              if ([v18 isStoredInExternalRecord]) {
                int v23 = 64;
              }
              else {
                int v23 = 0;
              }
              self->___entityDescriptionFlags entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&self->_entityDescriptionFlags & 0xFFFFFFBF | v23);
            }
            uint64_t v24 = [v18 _propertyType];
            if (v24 == 6)
            {
              if (objc_msgSend((id)objc_msgSend(v18, "derivationExpression"), "expressionType") == 3) {
                objc_msgSend(v14, "setObject:forKey:", v18, objc_msgSend((id)objc_msgSend(v18, "derivationExpression"), "keyPath"));
              }
            }
            else if (v24 == 2)
            {
              if ([v18 storesBinaryDataExternally]
                && ([v18 isFileBackedFuture] & 1) == 0)
              {
                *(_DWORD *)&self->_entityDescriptionFlags |= 0x100u;
              }
              if (([v18 isFileBackedFuture] & 1) != 0
                || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "userInfo"), "valueForKey:", @"NSIsFileBackedFuture"), "BOOLValue"))
              {
                *(_DWORD *)&self->_entityDescriptionFlags |= 0x8100u;
              }
              if ([v18 usesMergeableStorage]) {
                [v13 addObject:v18];
              }
            }
          }
          uint64_t v15 = [v151 countByEnumeratingWithState:&v156 objects:v171 count:16];
        }
        while (v15);
      }
      if ([v13 count])
      {
        long long v154 = 0u;
        long long v155 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        uint64_t v25 = [v13 countByEnumeratingWithState:&v152 objects:v168 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v153;
          do
          {
            for (uint64_t m = 0; m != v25; ++m)
            {
              if (*(void *)v153 != v26) {
                objc_enumerationMutation(v13);
              }
              v28 = *(void **)(*((void *)&v152 + 1) + 8 * m);
              if (!objc_msgSend(v14, "valueForKey:", objc_msgSend(v28, "name")))
              {
                v134 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v135 = [NSString stringWithFormat:@"Mergeable attribute %@ requires a paired derived attribute with a derivation expression in the form \"%@\", objc_msgSend(v28, "name"), objc_msgSend(v28, "name"")];
                objc_exception_throw((id)[v134 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v135 userInfo:0]);
              }
            }
            uint64_t v25 = [v13 countByEnumeratingWithState:&v152 objects:v168 count:16];
          }
          while (v25);
        }
      }
      [v150 drain];
      id v141 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      v29 = self->_superentity;
      if (v29)
      {
        propertyRanges = v29->_propertyRanges;
        uint64_t v31 = objc_msgSend((id)-[NSMutableDictionary mapping](v29->_properties, "mapping"), "keys");
        if (propertyRanges[15].length) {
          uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[15].location);
        }
        else {
          uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
        }
        v33 = (void *)v32;
        if (propertyRanges[16].length) {
          id v142 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[16].location);
        }
        else {
          id v142 = (id)[MEMORY[0x1E4F1CA48] array];
        }
        if (propertyRanges[5].length) {
          uint64_t v45 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[5].location);
        }
        else {
          uint64_t v45 = [MEMORY[0x1E4F1CA48] array];
        }
        v34 = (void *)v45;
        if (propertyRanges[6].length) {
          id v149 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[6].location);
        }
        else {
          id v149 = (id)[MEMORY[0x1E4F1CA48] array];
        }
        if (propertyRanges[10].length) {
          id v148 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[10].location);
        }
        else {
          id v148 = (id)[MEMORY[0x1E4F1CA48] array];
        }
        if (propertyRanges[7].length) {
          id v146 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[7].location);
        }
        else {
          id v146 = (id)[MEMORY[0x1E4F1CA48] array];
        }
        if (propertyRanges[8].length) {
          id v145 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[8].location);
        }
        else {
          id v145 = (id)[MEMORY[0x1E4F1CA48] array];
        }
        if (propertyRanges[11].length) {
          id v144 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[11].location);
        }
        else {
          id v144 = (id)[MEMORY[0x1E4F1CA48] array];
        }
        if (propertyRanges[12].length) {
          id v143 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[12].location);
        }
        else {
          id v143 = (id)[MEMORY[0x1E4F1CA48] array];
        }
        if (propertyRanges[14].length) {
          uint64_t v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[14].location);
        }
        else {
          uint64_t v46 = [MEMORY[0x1E4F1CA48] array];
        }
        v35 = (void *)v46;
        if (propertyRanges[17].length) {
          id v150 = (id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:count:", v31 + 8 * propertyRanges[17].location);
        }
        else {
          id v150 = (id)[MEMORY[0x1E4F1CA48] array];
        }
        uint64_t v47 = [v151 count];
        if (v47)
        {
          uint64_t v48 = 0;
          while (1)
          {
            v49 = (void *)[v151 objectAtIndex:v48];
            uint64_t v50 = [v49 name];
            v51 = self->_superentity;
            if (!v51) {
              break;
            }
            if ((*(unsigned char *)&v51->_entityDescriptionFlags & 4) != 0)
            {
              if ([v51->_propertyMapping indexForKey:v50] == 0x7FFFFFFFFFFFFFFFLL) {
                break;
              }
            }
            else if (![(NSDictionary *)[(NSEntityDescription *)v51 propertiesByName] objectForKey:v50])
            {
              break;
            }
LABEL_144:
            if (v47 == ++v48) {
              goto LABEL_145;
            }
          }
          uint64_t v52 = [v49 _propertyType] - 2;
          id v53 = v35;
          switch(v52)
          {
            case 0:
            case 4:
            case 5:
              if ([v49 isTransient]) {
                id v53 = v34;
              }
              else {
                id v53 = v33;
              }
              break;
            case 1:
              break;
            case 2:
              if ([v49 isToMany])
              {
                if ([v49 isTransient])
                {
                  BOOL v54 = [v49 isOrdered] == 0;
                  id v56 = v143;
                  id v55 = v144;
                }
                else
                {
                  BOOL v54 = [v49 isOrdered] == 0;
                  id v56 = v145;
                  id v55 = v146;
                }
                if (v54) {
                  id v53 = v55;
                }
                else {
                  id v53 = v56;
                }
              }
              else if ([v49 isTransient])
              {
                id v53 = v148;
              }
              else
              {
                id v53 = v149;
              }
              break;
            default:
              id v53 = v150;
              break;
          }
          [v53 addObject:v50];
          goto LABEL_144;
        }
      }
      else
      {
        v33 = (void *)[MEMORY[0x1E4F1CA48] array];
        id v142 = (id)[MEMORY[0x1E4F1CA48] array];
        v34 = (void *)[MEMORY[0x1E4F1CA48] array];
        id v149 = (id)[MEMORY[0x1E4F1CA48] array];
        id v148 = (id)[MEMORY[0x1E4F1CA48] array];
        id v145 = (id)[MEMORY[0x1E4F1CA48] array];
        id v146 = (id)[MEMORY[0x1E4F1CA48] array];
        id v143 = (id)[MEMORY[0x1E4F1CA48] array];
        id v144 = (id)[MEMORY[0x1E4F1CA48] array];
        v35 = (void *)[MEMORY[0x1E4F1CA48] array];
        id v150 = (id)[MEMORY[0x1E4F1CA48] array];
        uint64_t v36 = [v151 count];
        if (v36)
        {
          for (uint64_t n = 0; n != v36; ++n)
          {
            v38 = (void *)[v151 objectAtIndex:n];
            uint64_t v39 = [v38 name];
            uint64_t v40 = [v38 _propertyType] - 2;
            id v41 = v35;
            switch(v40)
            {
              case 0:
              case 4:
              case 5:
                if ([v38 isTransient]) {
                  id v41 = v34;
                }
                else {
                  id v41 = v33;
                }
                break;
              case 1:
                break;
              case 2:
                if ([v38 isToMany])
                {
                  if ([v38 isTransient])
                  {
                    BOOL v42 = [v38 isOrdered] == 0;
                    id v44 = v143;
                    id v43 = v144;
                  }
                  else
                  {
                    BOOL v42 = [v38 isOrdered] == 0;
                    id v44 = v145;
                    id v43 = v146;
                  }
                  if (v42) {
                    id v41 = v43;
                  }
                  else {
                    id v41 = v44;
                  }
                }
                else if ([v38 isTransient])
                {
                  id v41 = v148;
                }
                else
                {
                  id v41 = v149;
                }
                break;
              default:
                id v41 = v150;
                break;
            }
            [v41 addObject:v39];
          }
        }
      }
LABEL_145:
      self->_propertyRanges = (_NSRange *)PF_CALLOC_UNSCANNED_BYTES(0x120uLL);
      v57 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_properties, "count"));
      uint64_t v58 = [v33 count];
      [v57 addObjectsFromArray:v33];
      v59 = self->_propertyRanges;
      v59[15].locatiouint64_t n = 0;
      v59[15].length = v58;
      uint64_t v60 = [v142 count];
      [v57 addObjectsFromArray:v142];
      v61 = self->_propertyRanges;
      v61[16].locatiouint64_t n = v58;
      v61[16].length = v60;
      uint64_t v62 = [v57 count];
      v61[3].locatiouint64_t n = 0;
      v61[3].length = v62;
      uint64_t v63 = [v34 count];
      [v57 addObjectsFromArray:v34];
      NSUInteger v64 = v60 + v58;
      v65 = self->_propertyRanges;
      v65[5].locatiouint64_t n = v64;
      v65[5].length = v63;
      uint64_t v66 = [v57 count];
      v65[1].locatiouint64_t n = 0;
      v65[1].length = v66;
      uint64_t v67 = [v149 count];
      [v57 addObjectsFromArray:v149];
      NSUInteger v68 = v63 + v64;
      v69 = self->_propertyRanges;
      v69[6].locatiouint64_t n = v68;
      v69[6].length = v67;
      uint64_t v70 = [v146 count];
      [v57 addObjectsFromArray:v146];
      NSUInteger v71 = v67 + v68;
      v72 = self->_propertyRanges;
      v72[7].locatiouint64_t n = v71;
      v72[7].length = v70;
      uint64_t v73 = [v145 count];
      [v57 addObjectsFromArray:v145];
      NSUInteger v74 = v70 + v71;
      v75 = self->_propertyRanges;
      v75[8].locatiouint64_t n = v74;
      v75[8].length = v73;
      NSUInteger v76 = v75[7].length + v73;
      v75[9].locatiouint64_t n = v75[7].location;
      v75[9].length = v76;
      NSUInteger v77 = v75[6].length + v76;
      v75[4].locatiouint64_t n = v75[6].location;
      v75[4].length = v77;
      uint64_t v78 = [v148 count];
      [v57 addObjectsFromArray:v148];
      NSUInteger v79 = v73 + v74;
      v80 = self->_propertyRanges;
      v80[10].locatiouint64_t n = v79;
      v80[10].length = v78;
      uint64_t v81 = [v144 count];
      [v57 addObjectsFromArray:v144];
      NSUInteger v82 = v78 + v79;
      v83 = self->_propertyRanges;
      v83[11].locatiouint64_t n = v82;
      v83[11].length = v81;
      uint64_t v84 = [v143 count];
      [v57 addObjectsFromArray:v143];
      NSUInteger v85 = v81 + v82;
      v86 = self->_propertyRanges;
      v86[12].locatiouint64_t n = v85;
      v86[12].length = v84;
      NSUInteger v87 = v86[11].length + v84;
      v86[13].locatiouint64_t n = v86[11].location;
      v86[13].length = v87;
      locatiouint64_t n = v86[6].location;
      NSUInteger v89 = [v57 count] - self->_propertyRanges[1].length;
      v86[2].locatiouint64_t n = location;
      v86[2].length = v89;
      uint64_t v90 = [v35 count];
      [v57 addObjectsFromArray:v35];
      NSUInteger v91 = v84 + v85;
      v92 = self->_propertyRanges;
      v92[14].locatiouint64_t n = v84 + v85;
      v92[14].length = v90;
      uint64_t v93 = [v150 count];
      [v57 addObjectsFromArray:v150];
      v94 = self->_propertyRanges;
      v94[17].locatiouint64_t n = v91 + 2 * v90;
      v94[17].length = v93;
      unint64_t v95 = [v57 count];
      v96 = self->_propertyRanges;
      v96->locatiouint64_t n = 0;
      v96->length = v95;
      unint64_t v97 = MEMORY[0x1F4188790](v95);
      v100 = (char *)&v140 - v99;
      size_t v101 = 8 * v98;
      if (v97 >= 0x201)
      {
        v100 = (char *)NSAllocateScannedUncollectable();
        v103 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v140 - v99, 8 * v98);
        MEMORY[0x1F4188790](v102);
        v103 = (char *)&v140 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v103, v101);
      }
      objc_msgSend(v57, "getObjects:range:", v103, 0, v95);
      if (v95)
      {
        for (iuint64_t i = 0; ii != v95; ++ii)
        {
          v105 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:*(void *)&v103[8 * ii]];
          *(void *)&v100[8 * ii] = v105;
          [v105 _setEntitysReferenceID:ii];
        }
      }
      v106 = [[NSKnownKeysDictionary alloc] initWithObjects:v100 forKeys:v103 count:v95];
      if (v95 >= 0x201)
      {
        NSZoneFree(0, v100);
        NSZoneFree(0, v103);
      }
      [v141 drain];

      self->_properties = &v106->super;
      self->_id propertyMapping = [(NSKnownKeysDictionary *)v106 mapping];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v107 = objc_msgSend((id)-[NSMutableDictionary allValues](self->_subentities, "allValues"), "sortedArrayUsingFunction:context:", _compareEntitiesByName, 0);
      unint64_t v108 = [v107 count];
      unint64_t v109 = MEMORY[0x1F4188790](v108);
      v112 = (char *)&v140 - v111;
      size_t v113 = 8 * v110;
      if (v109 >= 0x201)
      {
        v112 = (char *)NSAllocateScannedUncollectable();
        v115 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v140 - v111, 8 * v110);
        MEMORY[0x1F4188790](v114);
        v115 = (char *)&v140 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v115, v113);
      }
      objc_msgSend(v107, "getObjects:range:", v112, 0, v108);
      if (v108)
      {
        v116 = (id *)v112;
        v117 = v115;
        unint64_t v118 = v108;
        do
        {
          *(void *)v117 = [*v116 name];
          v117 += 8;
          ++v116;
          --v118;
        }
        while (v118);
      }
      v119 = [[NSKnownKeysDictionary alloc] initWithObjects:v112 forKeys:v115 count:v108];
      if (v108 >= 0x201)
      {
        NSZoneFree(0, v112);
        NSZoneFree(0, v115);
      }

      self->_subentities = &v119->super;
    }
    if (!self->_flattenedSubentities) {
      self->_flattenedSubentities = -[NSEntityDescription _collectSubentities](self);
    }
    id propertyMapping = self->_propertyMapping;
    uint64_t v121 = [propertyMapping keys];
    size_t v122 = [propertyMapping length];
    self->_kvcPropertyAccessors = (id **)PF_CALLOC_SCANNED_BYTES(0x50uLL);
    *((void *)self->_kvcPropertyAccessors + 6) = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v121 count:v122];
    *((void *)self->_kvcPropertyAccessors + 7) = [(NSEntityDescription *)self _newMappingForPropertiesOfRange:1];
    *((void *)self->_kvcPropertyAccessors + 8) = [(NSEntityDescription *)self _newMappingForPropertiesOfRange:2];
    *((void *)self->_kvcPropertyAccessors + 9) = PF_CALLOC_UNSCANNED_BYTES(v122);
    -[NSEntityDescription _commonCachesAndOptimizedState](self);
    *(_DWORD *)&self->_entityDescriptionFlags |= 4u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    properties = self->_properties;
    uint64_t v124 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v164 objects:v173 count:16];
    if (v124)
    {
      v125 = 0;
      uint64_t v126 = *(void *)v165;
      do
      {
        for (juint64_t j = 0; jj != v124; ++jj)
        {
          if (*(void *)v165 != v126) {
            objc_enumerationMutation(properties);
          }
          v128 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:*(void *)(*((void *)&v164 + 1) + 8 * jj)];
          if ([v128 _isAttribute] && objc_msgSend(v128, "_namespace"))
          {
            if (!v125) {
              v125 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            }
            -[NSEntityDescription _checkAttributeMembership:hashes:](v128, v125);
          }
        }
        uint64_t v124 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v164 objects:v173 count:16];
      }
      while (v124);
    }

    [v147 drain];
    id v129 = 0;
    if (self)
    {
      if (!self->_extraIvars) {
        -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      }
    }
  }
}

- (uint64_t)_hasUniquedProperty:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    result = [a2 _qualifiedName];
    if (result)
    {
      uint64_t v3 = *(void *)(v2 + 128);
      if (v3)
      {
        uint64_t v4 = result;
        long long v12 = 0u;
        long long v13 = 0u;
        long long v10 = 0u;
        long long v11 = 0u;
        uint64_t v5 = *(void **)(v3 + 24);
        result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (result)
        {
          uint64_t v6 = result;
          uint64_t v7 = *(void *)v11;
          while (2)
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v11 != v7) {
                objc_enumerationMutation(v5);
              }
              uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
              if ([v9 count] == 1 && (objc_msgSend(v9, "containsObject:", v4) & 1) != 0) {
                return 1;
              }
            }
            uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
            result = 0;
            if (v6) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)_hasPropertiesIndexedBySpotlight
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (unsigned __int8 *)result;
    if ([(id)result _isEditable])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v2 = (void *)[v1 properties];
      result = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v3; ++i)
          {
            if (*(void *)v17 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if ([v6 _propertyType] == 7)
            {
              uint64_t v7 = (void *)[v6 _flattenedElements];
              long long v12 = 0u;
              long long v13 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
              if (v8)
              {
                uint64_t v9 = v8;
                uint64_t v10 = *(void *)v13;
LABEL_11:
                uint64_t v11 = 0;
                while (1)
                {
                  if (*(void *)v13 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  if ([*(id *)(*((void *)&v12 + 1) + 8 * v11) isIndexedBySpotlight]) {
                    return 1;
                  }
                  if (v9 == ++v11)
                  {
                    uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
                    if (v9) {
                      goto LABEL_11;
                    }
                    break;
                  }
                }
              }
            }
            else if ([v6 isIndexedBySpotlight])
            {
              return 1;
            }
          }
          uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
          result = 0;
          if (v3) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      return (v1[120] >> 5) & 1;
    }
  }
  return result;
}

- (NSArray)properties
{
  uint64_t v2 = [(NSEntityDescription *)self propertiesByName];

  return [(NSDictionary *)v2 allValues];
}

- (unint64_t)_versionHashInStyle:(unint64_t *)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (a2 == 1)
  {
    uint64_t v4 = (void *)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)result, 1);
LABEL_8:
    return (unint64_t *)v4;
  }
  unint64_t v5 = atomic_load(result + 4);
  if (v5 && ![result _isEditable]) {
    return (unint64_t *)atomic_load(v3 + 4);
  }
  uint64_t v6 = (void *)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)v3, a2);
  if ([v3 _isEditable])
  {
    uint64_t v4 = v6;
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  uint64_t v8 = (atomic_ullong *)(v3 + 4);
  atomic_compare_exchange_strong(v8, (unint64_t *)&v7, (unint64_t)v6);
  if (v7) {

  }
  return (unint64_t *)atomic_load((unint64_t *)v8);
}

- (BOOL)_isEditable
{
  return (*(unsigned char *)&self->_entityDescriptionFlags & 4) == 0;
}

- (id)_newMappingForPropertiesOfRange:(unsigned int)a3
{
  uint64_t v5 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
  uint64_t v6 = [(NSDictionary *)[(NSEntityDescription *)self propertiesByName] values];
  uint64_t v7 = &self->_propertyRanges[a3];
  NSUInteger length = v7->length;
  NSUInteger v9 = v5 + 8 * v7->location;
  NSUInteger v10 = v6 + 8 * v7->location;
  uint64_t v11 = [NSKnownKeysDictionary alloc];

  return [(NSKnownKeysDictionary *)v11 initWithObjects:v10 forKeys:v9 count:length];
}

- (id)_relationshipNamed:(void *)a1
{
  if (!a1) {
    return 0;
  }
  if (a1[14])
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_propertySearchMapping"), "indexForKey:", a2);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v5 = v4;
      uint64_t v6 = a1[14];
      unint64_t v7 = *(void *)(v6 + 32);
      unint64_t v8 = *(void *)(v6 + 40);
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a1, "propertiesByName"), "values");
      if (v5 >= v7 && v5 - v7 < v8) {
        return *(id *)(v9 + 8 * v5);
      }
    }
    return 0;
  }
  id v14 = (id)[a1 _localRelationshipNamed:a2];
  if (!v14)
  {
    for (uint64_t i = a1; ; uint64_t i = v14)
    {
      long long v12 = (void *)[i superentity];
      id v14 = v12;
      if (!v12) {
        break;
      }
      long long v13 = (void *)[v12 _localRelationshipNamed:a2];
      if (v13)
      {
        id v14 = (id)[v13 copy];
        [v14 _setEntity:a1];
        return v14;
      }
    }
  }
  return v14;
}

- (id)_attributeNamed:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (*(void *)(a1 + 112))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)a1, "_propertySearchMapping"), "indexForKey:", a2);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v5 = v4;
      uint64_t v6 = *(void *)(a1 + 112);
      unint64_t v7 = *(void *)(v6 + 16);
      unint64_t v8 = *(void *)(v6 + 24);
      uint64_t v9 = objc_msgSend((id)objc_msgSend((id)a1, "propertiesByName"), "values");
      if (v5 >= v7 && v5 - v7 < v8) {
        return *(id *)(v9 + 8 * v5);
      }
    }
    return 0;
  }
  id v11 = (id)[*(id *)(a1 + 96) objectForKey:a2];
  char v12 = [v11 _isAttribute];
  if (!v11 || (v12 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 120) & 8) == 0)
    {
      uint64_t v15 = 0;
      long long v16 = &v15;
      uint64_t v17 = 0x3052000000;
      long long v18 = __Block_byref_object_copy__10;
      long long v19 = __Block_byref_object_dispose__10;
      uint64_t v20 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__NSEntityDescription__NSInternalMethods___attributeNamed___block_invoke;
      v14[3] = &unk_1E544BF70;
      v14[4] = a2;
      v14[5] = &v15;
      -[NSEntityDescription _propertyKeys:matchingBlock:](a1, 0, (uint64_t)v14);
      id v11 = (id)[(id)v16[5] copy];
      [v11 _setEntity:a1];
      _Block_object_dispose(&v15, 8);
      return v11;
    }
    return 0;
  }
  return v11;
}

- (NSDictionary)propertiesByName
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSEntityDescription *)self superentity];
  uint64_t v4 = v3;
  if (self && ((*(unsigned char *)&self->_entityDescriptionFlags >> 3) & 1) != 0 || !v3) {
    return &self->_properties->super;
  }
  unint64_t v5 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [(NSEntityDescription *)v4 propertiesByName];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v12 = objc_msgSend(-[NSDictionary objectForKey:](v6, "objectForKey:", v11), "copy");
        [v12 _setEntity:self];
        [(NSDictionary *)v5 setObject:v12 forKey:v11];
      }
      uint64_t v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [(NSDictionary *)v5 addEntriesFromDictionary:self->_properties];
  return v5;
}

- (NSEntityDescription)superentity
{
  return self->_superentity;
}

- (id)_propertySearchMapping
{
  return self->_propertyMapping;
}

- (id)_localRelationshipNamed:(id)a3
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:a3];
  if ([v3 _propertyType] == 4) {
    return v3;
  }
  else {
    return 0;
  }
}

- (uint64_t)_finalizeIndexes
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 128);
    if (v2)
    {
      uint64_t v3 = *(void **)(v2 + 40);
      if (v3)
      {
        long long v9 = 0u;
        long long v10 = 0u;
        long long v7 = 0u;
        long long v8 = 0u;
        result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (result)
        {
          uint64_t v4 = result;
          uint64_t v5 = *(void *)v8;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v8 != v5) {
                objc_enumerationMutation(v3);
              }
              [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _setEntity:v1];
            }
            while (v4 != v6);
            result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
            uint64_t v4 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)userInfo
{
  if (self->_userInfo) {
    return &self->_userInfo->super;
  }
  else {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
}

- (void)setIndexes:(NSArray *)indexes
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [(NSEntityDescription *)self _throwIfNotEditable];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = indexes;
  uint64_t v37 = [(NSArray *)indexes countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        if (self)
        {
          uint64_t v6 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ((*(unsigned char *)&self->_entityDescriptionFlags & 4) != 0)
          {
            rootentity = self->_rootentity;
          }
          else
          {
            long long v7 = self;
            do
            {
              rootentity = v7;
              long long v7 = [(NSEntityDescription *)v7 superentity];
            }
            while (v7);
          }
          -[NSEntityDescription _validateIndexNameChangeFrom:to:]((uint64_t)rootentity, 0, [v6 name]);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          v38 = v6;
          long long v9 = (void *)[v6 elements];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v48 != v12) {
                  objc_enumerationMutation(v9);
                }
                long long v14 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                long long v15 = (__CFString *)[v14 property];
                uint64_t v16 = [(__CFString *)v15 _propertyType];
                long long v17 = (__CFString *)[(__CFString *)v15 name];
                if ([(__CFString *)v15 _isAttribute])
                {
                  if (v15 && [(__CFString *)v15 superCompositeAttribute]) {
                    long long v17 = -[NSPropertyDescription _rootName](v15);
                  }
                  if (!-[NSEntityDescription _attributeNamed:]((uint64_t)self, (uint64_t)v17))
                  {
                    uint64_t v25 = (void *)MEMORY[0x1E4F1CA00];
                    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
                    uint64_t v27 = [NSString stringWithFormat:@"can't find attribute named %@", v17];
                    goto LABEL_47;
                  }
                }
                else if ([(__CFString *)v15 _isRelationship])
                {
                  if (!-[NSEntityDescription _relationshipNamed:](self, (uint64_t)v17))
                  {
                    uint64_t v25 = (void *)MEMORY[0x1E4F1CA00];
                    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
                    uint64_t v27 = [NSString stringWithFormat:@"can't find relationship named %@", v17];
LABEL_47:
                    uint64_t v34 = v27;
                    uint64_t v32 = v25;
                    uint64_t v33 = v26;
                    uint64_t v31 = 0;
                    goto LABEL_48;
                  }
                }
                else if (v16 != 5)
                {
                  v28 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v29 = *MEMORY[0x1E4F1C3C8];
                  uint64_t v30 = [NSString stringWithFormat:@"can't create index %@, unsupported index element property type", objc_msgSend(v38, "name")];
                  id v53 = @"element";
                  BOOL v54 = v14;
                  goto LABEL_46;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v55 count:16];
            }
            while (v11);
          }
          if (!objc_msgSend((id)objc_msgSend(v38, "elements"), "count"))
          {
            v28 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v29 = *MEMORY[0x1E4F1C3C8];
            uint64_t v30 = [NSString stringWithFormat:@"Indexes must be declared at the highest applicable level. All properties are declared on superentity."];
            id v53 = @"index";
            BOOL v54 = v38;
LABEL_46:
            uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            uint64_t v32 = v28;
            uint64_t v33 = v29;
            uint64_t v34 = v30;
LABEL_48:
            objc_exception_throw((id)[v32 exceptionWithName:v33 reason:v34 userInfo:v31]);
          }
        }
      }
      uint64_t v37 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v37);
  }
  long long v18 = (void *)[(NSArray *)obj mutableCopy];
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }
  else
  {
    extraIvars = 0;
  }
  id var5 = extraIvars->var5;
  if (var5)
  {

    extraIvars->id var5 = 0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v21 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * k) _setEntity:self];
      }
      uint64_t v22 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v22);
  }
  extraIvars->id var5 = v18;
}

- (NSArray)indexes
{
  extraIvars = self->_extraIvars;
  if (!extraIvars) {
    return (NSArray *)NSArray_EmptyArray;
  }
  result = (NSArray *)extraIvars->var5;
  if (!result) {
    return (NSArray *)NSArray_EmptyArray;
  }
  return result;
}

- (uint64_t)_hasAttributesWithExternalDataReferences
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (unsigned char *)result;
    if ([(id)result _isEditable])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v2 = (void *)[v1 properties];
      result = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v3; ++i)
          {
            if (*(void *)v18 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ([v6 _propertyType] == 7)
            {
              long long v7 = (void *)[v6 _flattenedElements];
              long long v13 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              long long v16 = 0u;
              uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
              if (v8)
              {
                uint64_t v9 = v8;
                uint64_t v10 = *(void *)v14;
LABEL_11:
                uint64_t v11 = 0;
                while (1)
                {
                  if (*(void *)v14 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
                  if ([v12 storesBinaryDataExternally])
                  {
                    if (![v12 isFileBackedFuture]) {
                      return 1;
                    }
                  }
                  if (v9 == ++v11)
                  {
                    uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
                    if (v9) {
                      goto LABEL_11;
                    }
                    break;
                  }
                }
              }
            }
            else if ([v6 _propertyType] == 2 {
                   && [v6 storesBinaryDataExternally]
            }
                   && ![v6 isFileBackedFuture])
            {
              return 1;
            }
          }
          uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
          result = 0;
          if (v3) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      return v1[121] & 1;
    }
  }
  return result;
}

- (uint64_t)_hasAttributesWithFileBackedFutures
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (unsigned __int8 *)result;
    if ([(id)result _isEditable])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v2 = (void *)[v1 properties];
      result = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v3; ++i)
          {
            if (*(void *)v17 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if ([v6 _propertyType] == 7)
            {
              long long v7 = (void *)[v6 _flattenedElements];
              long long v12 = 0u;
              long long v13 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
              if (v8)
              {
                uint64_t v9 = v8;
                uint64_t v10 = *(void *)v13;
LABEL_11:
                uint64_t v11 = 0;
                while (1)
                {
                  if (*(void *)v13 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  if ([*(id *)(*((void *)&v12 + 1) + 8 * v11) isFileBackedFuture]) {
                    return 1;
                  }
                  if (v9 == ++v11)
                  {
                    uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
                    if (v9) {
                      goto LABEL_11;
                    }
                    break;
                  }
                }
              }
            }
            else if ([v6 _propertyType] == 2 && (objc_msgSend(v6, "isFileBackedFuture") & 1) != 0)
            {
              return 1;
            }
          }
          uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
          result = 0;
          if (v3) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      return v1[121] >> 7;
    }
  }
  return result;
}

- (uint64_t)_validateIndexNameChangeFrom:(uint64_t)a3 to:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (*(void *)(result + 128))
    {
      result = objc_msgSend(a2, "isEqual:");
      if ((result & 1) == 0)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v6 = *(void **)(v3[16] + 40);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v30 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) name];
              if (([v11 isEqual:a2] & 1) == 0 && objc_msgSend(v11, "isEqual:", a3))
              {
                long long v16 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v17 = *MEMORY[0x1E4F1C3C8];
                uint64_t v18 = [NSString stringWithFormat:@"Entity %@ already has an index with name %@", objc_msgSend(v3, "name"), a3];
                v28 = @"Entity";
                uint64_t v29 = v3;
                objc_exception_throw((id)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1)));
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v30 count:16];
          }
          while (v8);
        }
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v12 = (void *)[v3 subentities];
        result = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (result)
        {
          uint64_t v13 = result;
          uint64_t v14 = *(void *)v20;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v12);
              }
              -[NSEntityDescription _validateIndexNameChangeFrom:to:](*(void *)(*((void *)&v19 + 1) + 8 * v15++), a2, a3);
            }
            while (v13 != v15);
            result = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            uint64_t v13 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_keypathsForDeletions
{
  if (!a1) {
    return 0;
  }
  if (a1[14])
  {
    uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "propertiesByName"), "values");
    uint64_t v4 = v3;
    uint64_t v5 = (void *)a1[14];
    unint64_t v6 = v5[12];
    uint64_t v7 = v5[13];
    if (v6 < v7 + v6)
    {
      uint64_t v8 = (id *)(v3 + 8 * v6);
      do
      {
        id v9 = *v8;
        if ([*v8 inverseRelationship]) {
          objc_msgSend(v2, "addObject:", objc_msgSend(v9, "name"));
        }
        ++v8;
        --v7;
      }
      while (v7);
      uint64_t v5 = (void *)a1[14];
    }
    unint64_t v10 = v5[18];
    uint64_t v11 = v5[19];
    if (v10 < v11 + v10)
    {
      long long v12 = (id *)(v4 + 8 * v10);
      do
      {
        id v13 = *v12;
        if ([*v12 inverseRelationship]) {
          objc_msgSend(v2, "addObject:", objc_msgSend(v13, "name"));
        }
        ++v12;
        --v11;
      }
      while (v11);
    }
    return (uint64_t)v2;
  }
  uint64_t v15 = (void *)[a1 relationshipsByName];

  return [v15 allKeys];
}

- (_NSRange)_propertyRangesByType
{
  return self->_propertyRanges;
}

- (uint64_t)_newVersionHashInStyle:(uint64_t)result
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  memset(&c, 0, sizeof(c));
  uint64_t v4 = *(__CFString **)(result + 64);
  if (!v4) {
    goto LABEL_5;
  }
  CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
  if (!CStringPtr)
  {
    uint64_t v4 = *(__CFString **)(v3 + 64);
LABEL_5:
    CStringPtr = (const char *)[(__CFString *)v4 UTF8String];
  }
  char data = [(id)v3 isAbstract];
  CC_SHA256_Init(&c);
  if (CStringPtr)
  {
    CC_LONG v6 = strlen(CStringPtr);
    CC_SHA256_Update(&c, CStringPtr, v6);
  }
  CC_SHA256_Update(&c, &data, 1u);
  if ([(id)v3 superentity])
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v3, "superentity"), "versionHash"), "getBytes:length:", v47, 32);
    CC_SHA256_Update(&c, v47, 0x20u);
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)v3, "properties"), "sortedArrayUsingFunction:context:", _comparePropertiesByName, 0);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        if (([v12 isTransient] & 1) == 0)
        {
          [v12 _versionHash:v47 inStyle:a2];
          CC_SHA256_Update(&c, v47, 0x20u);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v9);
  }
  CFStringRef v13 = *(const __CFString **)(v3 + 24);
  if (v13)
  {
    uint64_t v14 = CFStringGetCStringPtr(v13, 0x8000100u);
    if (!v14) {
      uint64_t v14 = (const char *)[*(id *)(v3 + 24) UTF8String];
    }
    CC_LONG v15 = strlen(v14);
    CC_SHA256_Update(&c, v14, v15);
  }
  uint64_t v16 = *(void *)(v3 + 128);
  if (v16 && *(void *)(v16 + 24))
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v18 = *(void **)(*(void *)(v3 + 128) + 24);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "componentsJoinedByString:", @"."));
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v20);
    }
    objc_msgSend(v17, "sortUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"self", 1)));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v23 = [v17 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v17);
          }
          uint64_t v27 = *(__CFString **)(*((void *)&v30 + 1) + 8 * k);
          if ([(__CFString *)v27 length])
          {
            v28 = CFStringGetCStringPtr(v27, 0x8000100u);
            if (!v28) {
              v28 = (const char *)[(__CFString *)v27 UTF8String];
            }
            CC_LONG v29 = strlen(v28);
            CC_SHA256_Update(&c, v28, v29);
          }
        }
        uint64_t v24 = [v17 countByEnumeratingWithState:&v30 objects:v44 count:16];
      }
      while (v24);
    }
  }
  CC_SHA256_Final(md, &c);
  return [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
}

- (void)_leopardStyleAttributesByName
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _PF_Leopard_CFDictionaryCreate();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  properties = self->_properties;
  uint64_t v5 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(properties);
        }
        uint64_t v9 = *(__CFString **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:v9];
        if ([v10 _isAttribute]) {
          _PF_Leopard_CFDictionarySetValue(v3, v9, v10);
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

- (BOOL)isAbstract
{
  return *(_DWORD *)&self->_entityDescriptionFlags & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSEntityDescription)initWithCoder:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  objc_opt_class();
  v94.receiver = self;
  v94.super_class = (Class)NSEntityDescription;
  uint64_t v5 = [(NSEntityDescription *)&v94 init];
  if (v5)
  {
    uint64_t v6 = +[PFModelDecoderContext retainedContext];
    uint64_t v8 = v6;
    if (v6)
    {
      uint64_t v9 = v6[2];
      objc_setProperty_nonatomic(v6, v7, v5, 16);
    }
    else
    {
      uint64_t v9 = 0;
    }
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    uint64_t v90 = __37__NSEntityDescription_initWithCoder___block_invoke;
    NSUInteger v91 = &unk_1E544B778;
    v92 = v8;
    uint64_t v93 = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    long long v12 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), @"NSVersionHashModifier");
    v5->_versionHashModifier = v12;
    if (v12 && ([(NSString *)v12 isNSString] & 1) == 0)
    {
      long long v15 = &unk_1ED7E18A8;
    }
    else
    {
      uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSManagedObjectModel"];
      v5->_model = (NSManagedObjectModel *)v13;
      if (v8) {
        uint64_t v14 = v8[1];
      }
      else {
        uint64_t v14 = 0;
      }
      if (v13 == v14)
      {
        uint64_t v16 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSClassNameForEntity"];
        v5->_classNameForEntity = v16;
        if (v16 && ![(NSString *)v16 isNSString])
        {
          long long v15 = &unk_1ED7E18F8;
        }
        else
        {
          v5->_name = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntityName"];
          uint64_t v17 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSSuperentity"];
          v5->_superentity = (NSEntityDescription *)v17;
          if (!v17) {
            goto LABEL_24;
          }
          if (v8) {
            uint64_t v18 = (void *)v8[3];
          }
          else {
            uint64_t v18 = 0;
          }
          [v18 addObject:v17];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass) {
            uint64_t v20 = 4866;
          }
          else {
            uint64_t v20 = 4864;
          }
          if (isKindOfClass) {
            long long v15 = &unk_1ED7E1948;
          }
          else {
            long long v15 = &unk_1ED7E1920;
          }
          if (v8 == 0 || (isKindOfClass & 1) == 0) {
            goto LABEL_76;
          }
          if (v8[1])
          {
LABEL_24:
            uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v22 = objc_opt_class();
            uint64_t v23 = objc_opt_class();
            uint64_t v24 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0), @"NSSubentities");
            uint64_t v25 = v24;
            if (v24 && ([v24 isNSDictionary] & 1) == 0)
            {
              objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4864, &unk_1ED7E1970));
            }
            else
            {
              v5->_subentities = (NSMutableDictionary *)v25;
              long long v26 = (void *)MEMORY[0x1E4F1CAD0];
              uint64_t v27 = objc_opt_class();
              uint64_t v28 = objc_opt_class();
              uint64_t v29 = objc_opt_class();
              long long v30 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v26, "setWithObjects:", v27, v28, v29, objc_opt_class(), 0), @"NSProperties");
              if ([v30 isNSDictionary])
              {
                long long v31 = v30;
                v5->_properties = v31;
                long long v85 = 0u;
                long long v86 = 0u;
                long long v87 = 0u;
                long long v88 = 0u;
                long long v32 = (void *)[(NSMutableDictionary *)v31 allKeys];
                uint64_t v33 = [v32 countByEnumeratingWithState:&v85 objects:v97 count:16];
                if (v33)
                {
                  uint64_t v34 = *(void *)v86;
                  v75 = &unk_1ED7E19C0;
                  obuint64_t j = v32;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v33; ++i)
                    {
                      if (*(void *)v86 != v34) {
                        objc_enumerationMutation(obj);
                      }
                      long long v36 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                      long long v37 = (void *)[(NSMutableDictionary *)v5->_properties objectForKeyedSubscript:v36];
                      if (![v36 isNSString]) {
                        goto LABEL_81;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_81;
                      }
                      if ((NSEntityDescription *)[v37 entity] != v5)
                      {
                        v75 = &unk_1ED7E19E8;
LABEL_81:
                        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, v75));

                        goto LABEL_77;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        long long v38 = v37;
                      }
                      else {
                        long long v38 = 0;
                      }
                      long long v39 = (void *)[v38 inverseRelationship];
                      if (v39 && (NSEntityDescription *)[v39 entity] != v5 && (!v8 || !v8[1]))
                      {
                        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1A10));

                        goto LABEL_77;
                      }
                    }
                    uint64_t v33 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
                    if (v33) {
                      continue;
                    }
                    break;
                  }
                }
                v5->___entityDescriptionFlags entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&v5->_entityDescriptionFlags & 0xFFFF788A | [a3 decodeBoolForKey:@"NSIsAbstract"]);
                v5->_userInfo = (NSMutableDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines plistClassesForSecureCoding]() forKey:@"NSUserInfo"];
                long long v40 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v41 = objc_opt_class();
                long long v42 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0), @"NSRenamingIdentifier");
                long long v43 = v42;
                if (!v42 || ([v42 isNSString] & 1) != 0)
                {
                  [(NSEntityDescription *)v5 setRenamingIdentifier:v43];
                  long long v44 = (void *)MEMORY[0x1E4F1CAD0];
                  uint64_t v45 = objc_opt_class();
                  uint64_t v46 = objc_opt_class();
                  -[NSEntityDescription setCompoundIndexes:](v5, "setCompoundIndexes:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0), @"NSCompoundIndexes"));
                  long long v47 = (void *)MEMORY[0x1E4F1CAD0];
                  uint64_t v48 = objc_opt_class();
                  uint64_t v49 = objc_opt_class();
                  long long v50 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v47, "setWithObjects:", v48, v49, objc_opt_class(), 0), @"NSUniqueTuples");
                  v51 = v50;
                  if (v50)
                  {
                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v81 = 0u;
                    long long v82 = 0u;
                    uint64_t v52 = [v50 countByEnumeratingWithState:&v81 objects:v96 count:16];
                    if (v52)
                    {
                      int v53 = 0;
                      uint64_t v54 = *(void *)v82;
                      do
                      {
                        for (uint64_t j = 0; j != v52; ++j)
                        {
                          if (*(void *)v82 != v54) {
                            objc_enumerationMutation(v51);
                          }
                          v53 += [*(id *)(*((void *)&v81 + 1) + 8 * j) count];
                        }
                        uint64_t v52 = [v51 countByEnumeratingWithState:&v81 objects:v96 count:16];
                      }
                      while (v52);
                      if (v53) {
                        -[NSEntityDescription _setUniquenessConstraints:]((uint64_t)v5, v51);
                      }
                    }
                  }
                  uint64_t v56 = (void *)MEMORY[0x1E4F1CAD0];
                  uint64_t v57 = objc_opt_class();
                  uint64_t v58 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0), @"NSCoreSpotlightDisplayName");
                  if (v58)
                  {
                    id v59 = v58;
                    extraIvars = v5->_extraIvars;
                    if (!extraIvars)
                    {
                      -[NSEntityDescription _initializeExtraIVars]((uint64_t)v5);
                      extraIvars = v5->_extraIvars;
                    }
                    extraIvars->var4 = v59;
                  }
                  v61 = (void *)MEMORY[0x1E4F1CAD0];
                  uint64_t v62 = objc_opt_class();
                  uint64_t v63 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0), @"NSFetchIndexDescriptions");
                  NSUInteger v64 = v63;
                  if (v63)
                  {
                    if (([v63 isNSArray] & 1) == 0)
                    {
                      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1A60));

                      goto LABEL_77;
                    }
                    long long v79 = 0u;
                    long long v80 = 0u;
                    long long v77 = 0u;
                    long long v78 = 0u;
                    uint64_t v65 = [v64 countByEnumeratingWithState:&v77 objects:v95 count:16];
                    if (v65)
                    {
                      uint64_t v66 = *(void *)v78;
                      while (2)
                      {
                        for (uint64_t k = 0; k != v65; ++k)
                        {
                          if (*(void *)v78 != v66) {
                            objc_enumerationMutation(v64);
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1A88));

                            goto LABEL_77;
                          }
                        }
                        uint64_t v65 = [v64 countByEnumeratingWithState:&v77 objects:v95 count:16];
                        if (v65) {
                          continue;
                        }
                        break;
                      }
                    }
                    -[NSEntityDescription _setIndexes:]((uint64_t)v5, v64);
                  }
                  else
                  {
                    v69 = (void *)[(NSMutableDictionary *)v5->_userInfo objectForKey:@"NSFetchIndexDescriptions"];
                    if (v69)
                    {
                      uint64_t v70 = (const char *)[v69 UTF8String];
                      NSUInteger v71 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v70, strlen(v70)), 0, 0);
                      if (v71) {
                        -[NSEntityDescription _setIndexesFromJSONObject:supplemental:]((uint64_t)v5, v71, 0);
                      }
                    }
                  }
                  v72 = (void *)[(NSMutableDictionary *)v5->_userInfo objectForKey:@"NSSupplementalIndexes"];
                  if (v72)
                  {
                    uint64_t v73 = (const char *)[v72 UTF8String];
                    NSUInteger v74 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v73, strlen(v73)), 0, 0);
                    if (v74) {
                      -[NSEntityDescription _setIndexesFromJSONObject:supplemental:]((uint64_t)v5, v74, 1);
                    }
                  }
                  v5->_id propertyMapping = 0;
                  v5->_propertyRanges = 0;
                  v5->_flattenedSubentities = 0;
                  v5->_kvcPropertyAccessors = 0;
                  v5->_modelsReferenceIDForEntity = -1;
                  goto LABEL_78;
                }
                objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1A38));
              }
              else
              {
                objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4864, &unk_1ED7E1998));
              }
            }
LABEL_77:
            uint64_t v5 = 0;
LABEL_78:
            ((void (*)(void *))v90)(v89);
            return v5;
          }
          long long v15 = &unk_1ED7E1948;
        }
      }
      else
      {
        long long v15 = &unk_1ED7E18D0;
      }
    }
    uint64_t v20 = 4866;
LABEL_76:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], v20, v15));

    goto LABEL_77;
  }
  return v5;
}

- (uint64_t)_removeProperty:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (id *)result;
    if ([a2 entity] != result) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Can't remove property '%@' - doesn't belong to this entity.", objc_msgSend(a2, "name")), 0 reason userInfo]);
    }
    result = [a2 name];
    if (result)
    {
      uint64_t v4 = result;
      result = [v3[12] objectForKey:result];
      if (result)
      {
        uint64_t v5 = (void *)result;
        [v3 _throwIfNotEditable];
        id v6 = v5;
        [v3[12] removeObjectForKey:v4];
        return [v5 _setEntityAndMaintainIndices:0];
      }
    }
  }
  return result;
}

- (void)setRenamingIdentifier:(NSString *)renamingIdentifier
{
  if (!renamingIdentifier
    || [(NSString *)renamingIdentifier isNSString]
    && [(NSString *)[(NSEntityDescription *)self name] isEqualToString:renamingIdentifier])
  {
    extraIvars = self->_extraIvars;
    if (extraIvars)
    {

      self->_extraIvars->var0 = 0;
    }
  }
  else
  {
    uint64_t v6 = [(NSString *)renamingIdentifier copy];
    uint64_t v7 = self->_extraIvars;
    if (!v7)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      uint64_t v7 = self->_extraIvars;
    }
    v7->var0 = (id)v6;
  }
}

void __37__NSEntityDescription_initWithCoder___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic(v3, a2, *(id *)(a1 + 40), 16);
    uint64_t v3 = *(void **)(a1 + 32);
  }
}

+ (NSManagedObject)insertNewObjectForEntityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context
{
  unint64_t v6 = objc_msgSend(a1, "entityForName:inManagedObjectContext:");
  if (!v6) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"+entityForName: could not locate an entity named '%@' in this model.", entityName), 0 reason userInfo]);
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)_PFFastEntityClass(v6), "allocWithEntity:", v6), "initWithEntity:insertIntoManagedObjectContext:", v6, context);

  return (NSManagedObject *)v7;
}

- (void)_flattenProperties
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!self || (*(unsigned char *)&self->_entityDescriptionFlags & 8) == 0)
  {
    uint64_t v3 = [(NSEntityDescription *)self superentity];
    if (!v3) {
      goto LABEL_23;
    }
    uint64_t v4 = v3;
    [(NSEntityDescription *)v3 _flattenProperties];
    uint64_t v5 = [(NSEntityDescription *)v4 propertiesByName];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v24 = v4;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v11 = [(NSDictionary *)v5 objectForKey:v10];
          long long v12 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:v10];
          if (v12)
          {
            uint64_t v13 = v12;
            if (([v12 isEqual:v11] & 1) == 0)
            {
              if (([v13 _isEqualWithoutIndex:v11] & 1) == 0) {
                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Property named '%@' in entity '%@' conflicts with property inherited from parent entity '%@'", objc_msgSend(v13, "name"), -[NSEntityDescription name](self, "name"), -[NSEntityDescription name](v24, "name")), 0 reason userInfo]);
              }
              _NSCoreDataLog(2, @"Subentity has an index on parent property: %@", v14, v15, v16, v17, v18, v19, v10);
            }
          }
          else
          {
            model = self->_model;
            if (model && (*(unsigned char *)&model->_managedObjectModelFlags & 4) != 0)
            {
              Class Class = object_getClass(v11);
              if (Class == (Class)objc_opt_class()) {
                id v11 = (id)[v11 _underlyingProperty];
              }
              uint64_t v21 = [[_NSPropertyDescriptionProxy alloc] initWithPropertyDescription:v11];
            }
            else
            {
              uint64_t v21 = (_NSPropertyDescriptionProxy *)[v11 copyWithZone:0];
            }
            uint64_t v23 = v21;
            [(NSEntityDescription *)self _addProperty:v21];
          }
        }
        uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }
    else
    {
LABEL_23:
      if (!self) {
        return;
      }
    }
    [(NSEntityDescription *)self _throwIfNotEditable];
    *(_DWORD *)&self->_entityDescriptionFlags |= 8u;
  }
}

- (void)_setProperties:(char)a3 preserveIndices:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 _throwIfNotEditable];
    if ((a3 & 1) == 0)
    {
      if ((*(unsigned char *)(a1 + 120) & 4) != 0)
      {
        uint64_t v7 = *(void *)(a1 + 72);
      }
      else
      {
        uint64_t v6 = (void *)a1;
        do
        {
          uint64_t v7 = (uint64_t)v6;
          uint64_t v6 = (void *)[v6 superentity];
        }
        while (v6);
      }
      -[NSEntityDescription _dropIndexes](v7);
    }
    if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)_PFRoutines, a2) & 1) == 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid property passed to setProperties: property has nil name or is an NSExpressionDescription." userInfo:0]);
    }
    unint64_t v8 = [*(id *)(a1 + 96) count];
    unint64_t v9 = v8;
    if (v8 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v8;
    }
    if (v8 >= 0x201) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    long long v12 = (char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8 > 0x200) {
      long long v12 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
    }
    [*(id *)(a1 + 96) getObjects:v12 andKeys:0 count:v9];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v12 count:v9];
    uint64_t v14 = [v13 count];
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t i = 0; i != v15; ++i)
      {
        uint64_t v17 = (void *)[v13 objectAtIndex:i];
        if ([a2 indexOfObjectIdenticalTo:v17] == 0x7FFFFFFFFFFFFFFFLL) {
          -[NSEntityDescription _removeProperty:](a1, v17);
        }
      }
    }
    uint64_t v18 = [a2 count];
    if (v18)
    {
      uint64_t v19 = v18;
      for (uint64_t j = 0; j != v19; ++j)
      {
        uint64_t v21 = [a2 objectAtIndex:j];
        if ([v13 indexOfObjectIdenticalTo:v21] == 0x7FFFFFFFFFFFFFFFLL) {
          [(id)a1 _addProperty:v21];
        }
      }
    }
    if (v9 >= 0x201) {
      NSZoneFree(0, v12);
    }
  }
}

- (void)_addProperty:(id)a3
{
  [(NSEntityDescription *)self _throwIfNotEditable];
  if (!a3) {
    return;
  }
  uint64_t v5 = [a3 name];
  if (!v5)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v18 = @"Can't add unnamed property to entity.";
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  if ([(NSMutableDictionary *)self->_properties objectForKey:v5])
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3B8];
    uint64_t v18 = (__CFString *)[NSString stringWithFormat:@"Entity already contains a property named %@.", v6];
    uint64_t v16 = v19;
    uint64_t v17 = v20;
    goto LABEL_15;
  }
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v18 = @"Can't add NSExpressionDescriptions to NSEntityDescriptions";
LABEL_15:
    objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v18 userInfo:0]);
  }
  unint64_t v8 = (NSEntityDescription *)[a3 entity];
  if (v8)
  {
    unint64_t v9 = v8;
    if (v8 != self)
    {
      [a3 name];
      [(NSEntityDescription *)self name];
      [(NSEntityDescription *)v9 name];
      _NSCoreDataLog(1, @"tried to add property %p '%@' to entity %p '%@' but it already belongs to entity %p '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)a3);
      a3 = (id)[a3 copy];
    }
  }
  [(NSMutableDictionary *)self->_properties setObject:a3 forKey:v6];

  [a3 _setEntityAndMaintainIndices:self];
}

- (void)_throwIfNotEditable
{
  if ((*(unsigned char *)&self->_entityDescriptionFlags & 4) != 0)
  {
    uint64_t v2 = [(NSEntityDescription *)self managedObjectModel];
    [(NSManagedObjectModel *)v2 _throwIfNotEditable];
  }
}

- (void)_sortedSubentities
{
  if (result)
  {
    uint64_t v1 = (void *)[result subentities];
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"name" ascending:1 selector:sel_caseInsensitiveCompare_];
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v2, 0);
    uint64_t v4 = [v1 sortedArrayUsingDescriptors:v3];

    return (void *)v4;
  }
  return result;
}

- (uint64_t)_dropIndexes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result && byte_1EB270AB4)
  {
    uint64_t v1 = (void *)result;
    uint64_t v2 = *(void *)(result + 128);
    if (v2)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v3 = *(void **)(v2 + 40);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v17 != v6) {
              objc_enumerationMutation(v3);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * i) _setEntity:0];
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v5);
      }

      *(void *)(v1[16] + 40) = 0;
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v8 = objc_msgSend(v1, "subentities", 0);
    result = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (result)
    {
      uint64_t v9 = result;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          -[NSEntityDescription _dropIndexes](*(void *)(*((void *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        result = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
        uint64_t v9 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSArray)subentities
{
  subentities = self->_subentities;
  if (subentities) {
    return (NSArray *)[(NSMutableDictionary *)subentities allValues];
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (void)_commonCachesAndOptimizedState
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (void *)[a1 managedObjectClassName];
    if (v2)
    {
      uint64_t v3 = v2;
      if (([v2 isEqualToString:@"NSManagedObject"] & 1) == 0)
      {
        Class Class = objc_getClass((const char *)[v3 UTF8String]);
        if (Class)
        {
          Class v5 = Class;
          id AssociatedObject = objc_getAssociatedObject(Class, PFEntityDescriptionAssociationKey);
          if (AssociatedObject)
          {
            uint64_t v7 = AssociatedObject;
            unint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v21;
              do
              {
                uint64_t v12 = 0;
                do
                {
                  if (*(void *)v21 != v11) {
                    objc_enumerationMutation(v7);
                  }
                  uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
                  if (v13)
                  {
                    id WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
                    if (WeakRetained)
                    {
                      long long v15 = WeakRetained;
                      if (WeakRetained != a1) {
                        [v8 addObject:v13];
                      }
                    }
                  }
                  ++v12;
                }
                while (v10 != v12);
                uint64_t v10 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
              }
              while (v10);
            }
            objc_msgSend(v8, "addObject:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)a1));
          }
          else
          {
            id v24 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)a1);
            unint64_t v8 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
          }
          objc_setAssociatedObject(v5, PFEntityDescriptionAssociationKey, v8, (void *)0x303);
          id v16 = objc_getAssociatedObject(v5, &PFEntityNameAssociationKey);
          long long v17 = objc_msgSend([NSString alloc], "initWithString:", objc_msgSend(a1, "name"));
          if (v16)
          {
            long long v18 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:v16];
            [v18 addObject:v17];
            long long v19 = (void *)[v18 allObjects];
          }
          else
          {
            long long v19 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v17];
          }
          objc_setAssociatedObject(v5, &PFEntityNameAssociationKey, v19, (void *)0x303);
        }
      }
    }
  }
}

- (NSString)managedObjectClassName
{
  if (self->_classNameForEntity) {
    return self->_classNameForEntity;
  }
  else {
    return (NSString *)@"NSManagedObject";
  }
}

- (void)_extensionsOfParentConstraint:(void *)result
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = result[16];
    if (v3 && *(void *)(v3 + 24))
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      obuint64_t j = *(id *)(v2[16] + 24);
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            unint64_t v10 = [v9 count];
            unint64_t v11 = [a2 count];
            BOOL v12 = v10 > v11;
            unint64_t v13 = v10 - v11;
            if (v12)
            {
              unint64_t v14 = v11;
              if (v11)
              {
                uint64_t v15 = 0;
                uint64_t v16 = 0;
                do
                {
                  v16 += objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v15), "isEqual:", objc_msgSend(a2, "objectAtIndex:", v15));
                  ++v15;
                }
                while (v14 != v15);
              }
              else
              {
                uint64_t v16 = 0;
              }
              if (v16 == v14)
              {
                v23[0] = v9;
                v23[1] = objc_msgSend(v9, "subarrayWithRange:", 0, v14);
                v23[2] = objc_msgSend(v9, "subarrayWithRange:", v14, v13);
                objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 3));
              }
            }
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v6);
      }
      return v17;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_checkSelfForNonCascadeNoInverses
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = *(void **)(a1 + 96);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_4:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(v2);
    }
    uint64_t v7 = (void *)[*(id *)(a1 + 96) objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v6)];
    if ([v7 _isRelationship])
    {
      if ([v7 deleteRule] != 2)
      {
        unint64_t v8 = (void *)[v7 inverseRelationship];
        if (v8)
        {
          uint64_t v9 = v8;
          if (([v8 isToMany] & 1) == 0 && !objc_msgSend(v9, "isOptional")) {
            return v7;
          }
        }
      }
    }
    if (v4 == ++v6)
    {
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        goto LABEL_4;
      }
      return 0;
    }
  }
}

- (NSData)versionHash
{
  return (NSData *)-[NSEntityDescription _versionHashInStyle:]((unint64_t *)self, 0);
}

- (void)setProperties:(NSArray *)properties
{
}

- (id)_initWithName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSEntityDescription;
  id v4 = [(NSEntityDescription *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((void *)v4 + 5) = 0;
    *((void *)v4 + 6) = 0;
    atomic_store(0, (unint64_t *)v4 + 7);
    uint64_t v6 = [a3 copy];
    v5[9] = 0;
    v5[10] = 0;
    v5[8] = v6;
    v5[11] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5[13] = 0;
    v5[14] = 0;
    v5[12] = v7;
    *((_DWORD *)v5 + 30) &= 0xFFFFF988;
    v5[17] = 0;
    v5[18] = 0;
    v5[19] = 0;
    v5[20] = -1;
    atomic_store(0, v5 + 4);
    v5[3] = 0;
    atomic_store(0, v5 + 2);
  }
  return v5;
}

- (NSEntityDescription)init
{
  objc_opt_class();
  objc_opt_class();

  return (NSEntityDescription *)[(NSEntityDescription *)self _initWithName:0];
}

- (void)setName:(NSString *)name
{
  [(NSEntityDescription *)self _throwIfNotEditable];
  if (self->_name != name)
  {
    uint64_t v5 = [(NSEntityDescription *)self managedObjectModel];
    uint64_t v6 = [(NSEntityDescription *)self superentity];
    if (v5 && [(NSMutableDictionary *)v5->_entities objectForKey:name]
      || v6
      && [(NSDictionary *)[(NSEntityDescription *)v6 subentitiesByName] objectForKey:name])
    {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Can't change name of entity from %@ to %@", self->_name, name), 0 reason userInfo]);
    }
    -[NSEntityDescription _removeSubentity:]((uint64_t)v6, self);
    -[NSManagedObjectModel _removeEntity:]((uint64_t)v5, self);

    self->_name = (NSString *)[(NSString *)name copy];
    [(NSManagedObjectModel *)v5 _addEntity:self];
    [(NSEntityDescription *)v6 _addSubentity:self];
  }
}

- (uint64_t)_removeSubentity:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = (id *)result;
    result = [a2 name];
    if (result)
    {
      uint64_t v3 = result;
      result = [v2[11] objectForKey:result];
      if (result)
      {
        id v4 = (void *)result;
        [v2 _throwIfNotEditable];
        id v5 = v4;
        [v2[11] removeObjectForKey:v3];
        return -[NSEntityDescription _setSuperentity:]((uint64_t)v4, 0);
      }
    }
  }
  return result;
}

- (void)_setManagedObjectModel:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = (void *)[result _throwIfNotEditable];
    uint64_t v4 = v3[5];
    if (v4 != a2)
    {
      if (a2)
      {
        if (v4) {
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't use an entity in two models." userInfo:0]);
        }
      }
      v3[5] = a2;
    }
  }
  return result;
}

- (id)attributeKeys
{
  if (self->_propertyRanges)
  {
    uint64_t v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
    propertyRanges = self->_propertyRanges;
    NSUInteger length = propertyRanges[1].length;
    NSUInteger v6 = v3 + 8 * propertyRanges[1].location;
    id v7 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v7 arrayWithObjects:v6 count:length];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    -[NSEntityDescription _propertyKeys:matchingBlock:]((uint64_t)self, v9, (uint64_t)&__block_literal_global_446);
    unint64_t v10 = (void *)[v9 allObjects];

    return v10;
  }
}

- (unint64_t)hash
{
  uint64_t v2 = [(NSEntityDescription *)self name];

  return [(NSString *)v2 hash];
}

- (void)dealloc
{
  extraIvars = self->_extraIvars;
  if (extraIvars)
  {

    uint64_t v4 = self->_extraIvars;
    v4->var0 = 0;
    id v5 = (void *)atomic_load((unint64_t *)&v4->var2);

    NSUInteger v6 = self->_extraIvars;
    atomic_store(0, (unint64_t *)&v6->var2);

    id v7 = self->_extraIvars;
    v7->var3 = 0;

    unint64_t v8 = self->_extraIvars;
    v8->var4 = 0;

    id v9 = self->_extraIvars;
    v9->id var5 = 0;
    if (v9->var1)
    {
      os_unfair_lock_lock_with_options();

      unint64_t v10 = self->_extraIvars;
      v10->var1 = 0;
      os_unfair_lock_unlock(&v10->var6);
    }
    if ((*(unsigned char *)&self->_entityDescriptionFlags & 0x80) == 0)
    {
      long long v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        long long v11 = malloc_default_zone();
      }
      malloc_zone_free(v11, self->_extraIvars);
    }
    self->_extraIvars = 0;
  }
  p_instanceClass Class = (unint64_t *)&self->_instanceClass;
  if (atomic_load((unint64_t *)&self->_instanceClass))
  {
    long long v14 = (void *)atomic_load(p_instanceClass);
    [v14 _entityDeallocated];
    uint64_t v15 = (void *)atomic_load(p_instanceClass);

    atomic_store(0, p_instanceClass);
  }
  p_snapshotClass Class = (unint64_t *)&self->_snapshotClass;
  if (atomic_load((unint64_t *)&self->_snapshotClass))
  {
    long long v18 = (void *)atomic_load(p_snapshotClass);
    [v18 _entityDeallocated];
    long long v19 = (void *)atomic_load(p_snapshotClass);

    atomic_store(0, p_snapshotClass);
  }
  id propertyMapping = self->_propertyMapping;
  if (propertyMapping) {
    uint64_t v21 = [propertyMapping length];
  }
  else {
    uint64_t v21 = objc_msgSend((id)-[NSMutableDictionary allKeys](self->_properties, "allKeys"), "count");
  }
  unint64_t v22 = v21;
  propertyRanges = self->_propertyRanges;
  if (propertyRanges && (*(unsigned char *)&self->_entityDescriptionFlags & 0x80) == 0)
  {
    id v24 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      id v24 = malloc_default_zone();
      propertyRanges = self->_propertyRanges;
    }
    malloc_zone_free(v24, propertyRanges);
  }

  self->_model = 0;
  self->_classNameForEntity = 0;

  self->_properties = 0;
  self->_id propertyMapping = 0;

  self->_name = 0;
  self->_superentity = 0;

  self->_subentities = 0;
  self->_userInfo = 0;

  self->_flattenedSubentities = 0;
  if (self->_kvcPropertyAccessors)
  {
    for (uint64_t i = 0; i != 6; ++i)
    {
      uint64_t v26 = self->_kvcPropertyAccessors[i];
      if (v26)
      {
        if (i != 4 && v22)
        {
          uint64_t v27 = 0;
          unsigned int v28 = 1;
          do
          {
            id v29 = v26[v27];
            if (v29) {

            }
            uint64_t v27 = v28;
          }
          while (v22 > v28++);
        }
        long long v31 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
        if (!_PF_Private_Malloc_Zone) {
          long long v31 = malloc_default_zone();
        }
        malloc_zone_free(v31, v26);
      }
    }

    PF_FREE_OBJECT_ARRAY(*((void **)self->_kvcPropertyAccessors + 9));
    long long v32 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      long long v32 = malloc_default_zone();
    }
    malloc_zone_free(v32, self->_kvcPropertyAccessors);
  }
  uint64_t v33 = (void *)atomic_load((unint64_t *)&self->_versionHash);

  atomic_store(0, (unint64_t *)&self->_versionHash);
  self->_versionHashModifier = 0;
  v34.receiver = self;
  v34.super_class = (Class)NSEntityDescription;
  [(NSEntityDescription *)&v34 dealloc];
}

- (void)_addFactoryToRetainList:(id)a3
{
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }
  else
  {
    extraIvars = 0;
  }
  os_unfair_lock_lock_with_options();
  id var1 = extraIvars->var1;
  if (!var1)
  {
    id var1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    extraIvars->id var1 = var1;
  }
  [var1 addObject:a3];

  os_unfair_lock_unlock(&extraIvars->var6);
}

- (void)knownKeysMappingStrategy
{
  if (result)
  {
    uint64_t v1 = result;
    if (objc_msgSend((id)objc_msgSend(result, "managedObjectModel"), "isEditable")) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Model must be immutable before mapping strategy can be created" userInfo:0]);
    }
    return (void *)v1[13];
  }
  return result;
}

- (NSDictionary)relationshipsByName
{
  if (self->_propertyRanges) {
    return (NSDictionary *)*((void *)self->_kvcPropertyAccessors + 8);
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__NSEntityDescription__NSInternalMethods___propertiesOfType___block_invoke;
  v3[3] = &__block_descriptor_40_e31_B16__0__NSPropertyDescription_8l;
  v3[4] = 4;
  return (NSDictionary *)-[NSEntityDescription _propertiesMatchingBlock:]((uint64_t)self, (uint64_t)v3);
}

- (void)_propertiesMatchingBlock:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 120) & 8) == 0)
  {
    id v5 = (void *)[(id)a1 superentity];
    if (v5)
    {
      NSUInteger v6 = (void *)[v5 propertiesByName];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            long long v12 = (void *)[v6 objectForKey:v11];
            if ((*(unsigned int (**)(uint64_t, void *))(a2 + 16))(a2, v12))
            {
              long long v13 = (void *)[v12 copy];
              [v13 _setEntity:a1];
              [v4 setObject:v13 forKey:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v8);
      }
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v14 = *(void **)(a1 + 96);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v20 = [*(id *)(a1 + 96) objectForKey:v19];
        if ((*(unsigned int (**)(uint64_t, uint64_t))(a2 + 16))(a2, v20)) {
          [v4 setObject:v20 forKey:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }
  return v4;
}

BOOL __61__NSEntityDescription__NSInternalMethods___propertiesOfType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return v2 == [a2 _propertyType];
}

uint64_t __39__NSEntityDescription_attributesByName__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isAttribute];
}

- (__CFSet)_collectSubentities
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  uint64_t v4 = CFSetCreateMutable(v2, 0, 0);
  CFSetAddValue(v4, a1);
  if (CFSetGetCount(v4) >= 1)
  {
    do
    {
      id v5 = (void *)[(__CFSet *)v4 anyObject];
      if (v5)
      {
        NSUInteger v6 = v5;
        CFSetAddValue(Mutable, v5);
        CFSetRemoveValue(v4, v6);
        uint64_t v7 = (void *)[v6 subentitiesByName];
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = (const void *)[v7 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
              if (v12) {
                CFSetAddValue(v4, v12);
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v9);
        }
      }
    }
    while (CFSetGetCount(v4) > 0);
  }
  CFRelease(v4);
  return Mutable;
}

- (NSDictionary)subentitiesByName
{
  if (self->_subentities) {
    return &self->_subentities->super;
  }
  else {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
}

- (id)_new_implicitlyObservedKeys
{
  id v1 = a1;
  if (a1)
  {
    CFAllocatorRef v2 = (void *)[a1 _propertySearchMapping];
    uint64_t v3 = (void *)[v1 propertiesByName];
    uint64_t v4 = [v1 _propertyRangesByType];
    uint64_t v5 = [v2 keys];
    uint64_t v6 = [v3 values];
    id v1 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unint64_t v7 = *(void *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 40);
    if (v7 < v8 + v7)
    {
      uint64_t v9 = (void *)(v5 + 8 * v7);
      uint64_t v10 = (void **)(v6 + 8 * v7);
      do
      {
        uint64_t v11 = *v10;
        long long v12 = (void *)[[NSString alloc] initWithString:*v9];
        if ([v11 inverseRelationship] || (objc_msgSend(v11, "isOrdered") & 1) == 0) {
          [v1 addObject:*v9];
        }

        ++v9;
        ++v10;
        --v8;
      }
      while (v8);
    }
  }
  return v1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_32;
  }
  if (!a3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v5 = [(NSEntityDescription *)self name];
  uint64_t v6 = [a3 name];
  if (v5 == (NSString *)v6
    || (uint64_t v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:"), v6))
  {
    int v8 = [(NSEntityDescription *)self isAbstract];
    if (v8 != [a3 isAbstract])
    {
LABEL_9:
      LOBYTE(v6) = 0;
      return v6;
    }
    uint64_t v9 = [(NSEntityDescription *)self managedObjectClassName];
    uint64_t v6 = [a3 managedObjectClassName];
    if (v9 == (NSString *)v6
      || (uint64_t v10 = v6, LOBYTE(v6) = 0, v9) && v10 && (LODWORD(v6) = -[NSString isEqual:](v9, "isEqual:"), v6))
    {
      uint64_t v11 = [(NSEntityDescription *)self versionHash];
      uint64_t v6 = [a3 versionHash];
      if (v11 == (NSData *)v6
        || (uint64_t v12 = v6, LOBYTE(v6) = 0, v11) && v12 && (LODWORD(v6) = -[NSData isEqual:](v11, "isEqual:"), v6))
      {
        long long v13 = [(NSEntityDescription *)self userInfo];
        uint64_t v6 = [a3 userInfo];
        if (v13 == (NSDictionary *)v6
          || (uint64_t v14 = v6, LOBYTE(v6) = 0, v13)
          && v14
          && (LODWORD(v6) = -[NSDictionary isEqual:](v13, "isEqual:"), v6))
        {
          long long v15 = [(NSEntityDescription *)self coreSpotlightDisplayNameExpression];
          uint64_t v6 = [a3 coreSpotlightDisplayNameExpression];
          if (v15 == (NSExpression *)v6
            || (uint64_t v16 = v6, LOBYTE(v6) = 0, v15)
            && v16
            && (LODWORD(v6) = -[NSExpression isEqual:](v15, "isEqual:"), v6))
          {
            long long v17 = [(NSEntityDescription *)self indexes];
            uint64_t v6 = [a3 indexes];
            if (v17 != (NSArray *)v6)
            {
              uint64_t v18 = v6;
              LOBYTE(v6) = 0;
              if (v17 && v18)
              {
                LOBYTE(v6) = -[NSArray isEqual:](v17, "isEqual:");
              }
              return v6;
            }
LABEL_32:
            LOBYTE(v6) = 1;
          }
        }
      }
    }
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(void *)(v4 + 64) = [(NSString *)self->_name copy];
    *(void *)(v4 + 48) = [(NSString *)self->_classNameForEntity copy];
    unsigned int v5 = *(_DWORD *)(v4 + 120) & 0xFFFFF9FA | *(_DWORD *)&self->_entityDescriptionFlags & 1;
    *(_DWORD *)(v4 + 120) = v5;
    *(_DWORD *)(v4 + 120) = v5 & 0xFFFFFF8F | *(_DWORD *)&self->_entityDescriptionFlags & 0x10;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    subentities = self->_subentities;
    uint64_t v8 = [(NSMutableDictionary *)subentities countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(subentities);
          }
          uint64_t v12 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_subentities, "objectForKey:", *(void *)(*((void *)&v47 + 1) + 8 * i)), "copy");
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableDictionary *)subentities countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v9);
    }
    -[NSEntityDescription _setSubentities:preserveIndices:](v4, v6, 1);

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    properties = self->_properties;
    uint64_t v15 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(properties);
          }
          uint64_t v19 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", *(void *)(*((void *)&v43 + 1) + 8 * j)), "copy");
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v16);
    }
    -[NSEntityDescription _setProperties:preserveIndices:](v4, v13, 1);

    *(void *)(v4 + 136) = [(NSMutableDictionary *)self->_userInfo copy];
    *(void *)(v4 + 24) = [(NSString *)self->_versionHashModifier copy];
    atomic_store(0, (unint64_t *)(v4 + 32));
    *(void *)(v4 + 160) = -1;
    objc_msgSend((id)v4, "setRenamingIdentifier:", -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier"));
    uint64_t v20 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v21 = [(NSEntityDescription *)self indexes];
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * k) copy];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v23);
      -[NSEntityDescription _setIndexes:](v4, v20);
      if (!self) {
        goto LABEL_38;
      }
    }
    else
    {
      -[NSEntityDescription _setIndexes:](v4, v20);
    }
    extraIvars = self->_extraIvars;
    if (extraIvars && (id var3 = extraIvars->var3) != 0 || (id var3 = (id)NSArray_EmptyArray) != 0)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v29 = [var3 countByEnumeratingWithState:&v35 objects:v51 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        int v31 = 0;
        uint64_t v32 = *(void *)v36;
        do
        {
          for (uint64_t m = 0; m != v30; ++m)
          {
            if (*(void *)v36 != v32) {
              objc_enumerationMutation(var3);
            }
            v31 += [*(id *)(*((void *)&v35 + 1) + 8 * m) count];
          }
          uint64_t v30 = [var3 countByEnumeratingWithState:&v35 objects:v51 count:16];
        }
        while (v30);
        if (v31) {
          [(id)v4 setUniquenessConstraints:var3];
        }
      }
    }
LABEL_38:
    objc_msgSend((id)v4, "setCoreSpotlightDisplayNameExpression:", -[NSEntityDescription coreSpotlightDisplayNameExpression](self, "coreSpotlightDisplayNameExpression"));
  }
  return (id)v4;
}

- (void)_addIndexForProperty:(uint64_t)a1
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 128);
    if (!v4)
    {
      -[NSEntityDescription _initializeExtraIVars](a1);
      uint64_t v4 = *(void *)(a1 + 128);
    }
    if (!*(void *)(v4 + 40)) {
      *(void *)(v4 + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    unsigned int v5 = [[NSFetchIndexElementDescription alloc] initWithProperty:a2 collationType:0];
    id v6 = [NSFetchIndexDescription alloc];
    uint64_t v7 = [a2 name];
    v9[0] = v5;
    uint64_t v8 = -[NSFetchIndexDescription initWithName:elements:](v6, "initWithName:elements:", v7, [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);

    [*(id *)(v4 + 40) addObject:v8];
  }
}

- (void)_setIndexes:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 128);
  if (!v4)
  {
    -[NSEntityDescription _initializeExtraIVars](a1);
    uint64_t v4 = *(void *)(a1 + 128);
  }
  unsigned int v5 = *(void **)(v4 + 40);
  if (v5)
  {
    id v6 = -[NSEntityDescription _propertiesOnlySubsetFromIndexes:](a1, v5);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(a2);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v11 _setEntity:a1];
          [v6 addObject:v11];
        }
        uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(a2);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * j) _setEntity:a1];
        }
        uint64_t v13 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }
    id v6 = (id)[a2 mutableCopy];
  }
  *(void *)(v4 + 40) = v6;
}

- (void)setCompoundIndexes:(NSArray *)compoundIndexes
{
  uint64_t v3 = self;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = v3->_extraIvars;
    }
  }
  else
  {
    extraIvars = 0;
  }
  objc_super v34 = extraIvars;
  id v42 = -[NSEntityDescription _propertiesOnlySubsetFromIndexes:]((uint64_t)v3, extraIvars->var5);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v38 = [(NSArray *)compoundIndexes countByEnumeratingWithState:&v59 objects:v73 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v60;
    uint64_t v40 = (uint64_t)v3;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v60 != v37) {
          objc_enumerationMutation(compoundIndexes);
        }
        id v6 = *(void **)(*((void *)&v59 + 1) + 8 * v5);
        long long v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
        uint64_t v7 = (void *)[MEMORY[0x1E4F28E78] string];
        uint64_t v39 = v5;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v8 = [v6 countByEnumeratingWithState:&v55 objects:v72 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v56;
          char v10 = 1;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v56 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              if ((v10 & 1) == 0) {
                [v7 appendString:@"_"];
              }
              if (!objc_msgSend(v12, "isNSString", v34))
              {
                if ((unint64_t)[v6 count] <= 1
                  && (-[NSEntityDescription _hasIndexForProperty:](v40, v12) & 1) != 0)
                {
                  goto LABEL_44;
                }
                if ([v12 _propertyType] == 7 || objc_msgSend(v12, "superCompositeAttribute"))
                {
                  long long v28 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v65 = @"Property";
                  uint64_t v66 = v12;
                  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
                  objc_exception_throw((id)[v28 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Composite property type is unsupported." userInfo:v29]);
                }
                uint64_t v14 = (NSFetchIndexElementDescription *)-[NSFetchIndexElementDescription initWithPropertyName:property:collationType:ascending:]([NSFetchIndexElementDescription alloc], (void *)[v12 name], v12, 0, 1);
                objc_msgSend(v7, "appendString:", -[NSFetchIndexElementDescription propertyName](v14, "propertyName"));
                goto LABEL_42;
              }
              if (objc_msgSend(@"self", "isEqualToString:", objc_msgSend(v12, "lowercaseString")))
              {
                [v7 appendString:@"self"];
                uint64_t v13 = objc_alloc_init(NSExpressionDescription);
                [(NSPropertyDescription *)v13 setName:@"self"];
                -[NSExpressionDescription setExpression:](v13, "setExpression:", [MEMORY[0x1E4F28C68] expressionForEvaluatedObject]);
                [(NSExpressionDescription *)v13 setExpressionResultType:2000];
                uint64_t v14 = [[NSFetchIndexElementDescription alloc] initWithProperty:v13 collationType:0];

                goto LABEL_42;
              }
              if (objc_msgSend(@"entity", "isEqualToString:", objc_msgSend(v12, "lowercaseString")))
              {
                [v7 appendString:@"entity"];
                uint64_t v15 = objc_alloc_init(NSExpressionDescription);
                [(NSPropertyDescription *)v15 setName:@"entity"];
                -[NSExpressionDescription setExpression:](v15, "setExpression:", [MEMORY[0x1E4F28C68] expressionForKeyPath:@"entity"]);
                [(NSExpressionDescription *)v15 setExpressionResultType:0];
                uint64_t v14 = [[NSFetchIndexElementDescription alloc] initWithProperty:v15 collationType:0];

                goto LABEL_42;
              }
              if ([v12 containsString:@"."])
              {
                if (objc_msgSend((id)objc_msgSend(*(id *)(v40 + 96), "objectForKey:", objc_msgSend((id)objc_msgSend(v12, "componentsSeparatedByString:", @"."), "firstObject")), "_propertyType") == 7)
                {
                  uint64_t v30 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v70 = @"Property";
                  NSUInteger v71 = v12;
                  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
                  objc_exception_throw((id)[v30 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Composite property type is unsupported." userInfo:v31]);
                }
              }
              else
              {
                if ([v6 count] != 1) {
                  goto LABEL_41;
                }
                if (objc_msgSend((id)objc_msgSend(*(id *)(v40 + 96), "objectForKey:", v12), "_propertyType") == 7)
                {
                  uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
                  NSUInteger v68 = @"Property";
                  v69 = v12;
                  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
                  objc_exception_throw((id)[v32 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Composite property type is unsupported." userInfo:v33]);
                }
                long long v53 = 0u;
                long long v54 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                uint64_t v16 = [v42 countByEnumeratingWithState:&v51 objects:v67 count:16];
                if (!v16)
                {
LABEL_41:
                  uint64_t v14 = (NSFetchIndexElementDescription *)-[NSFetchIndexElementDescription initWithPropertyName:property:collationType:ascending:]([NSFetchIndexElementDescription alloc], v12, 0, 0, 1);
                  [v7 appendString:v12];
LABEL_42:
                  if (v14)
                  {
                    [v41 addObject:v14];
                  }
                  goto LABEL_44;
                }
                uint64_t v17 = *(void *)v52;
LABEL_33:
                uint64_t v18 = 0;
                while (1)
                {
                  if (*(void *)v52 != v17) {
                    objc_enumerationMutation(v42);
                  }
                  long long v19 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v18), "elements"), "firstObject");
                  if (objc_msgSend(v12, "isEqual:", objc_msgSend(v19, "propertyName")))
                  {
                    if (![v19 collationType] && (objc_msgSend(v19, "isAscending") & 1) != 0) {
                      break;
                    }
                  }
                  if (v16 == ++v18)
                  {
                    uint64_t v16 = [v42 countByEnumeratingWithState:&v51 objects:v67 count:16];
                    if (v16) {
                      goto LABEL_33;
                    }
                    goto LABEL_41;
                  }
                }
              }
LABEL_44:
              char v10 = 0;
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v55 objects:v72 count:16];
            char v10 = 0;
          }
          while (v8);
        }
        uint64_t v3 = (NSEntityDescription *)v40;
        if (objc_msgSend(v41, "count", v34))
        {
          long long v20 = [[NSFetchIndexDescription alloc] initWithName:v7 elements:v41];
          [v42 addObject:v20];
        }
        uint64_t v5 = v39 + 1;
      }
      while (v39 + 1 != v38);
      uint64_t v38 = [(NSArray *)compoundIndexes countByEnumeratingWithState:&v59 objects:v73 count:16];
    }
    while (v38);
  }
  if (objc_msgSend(v42, "count", v34))
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v21 = *(void **)(v35 + 40);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v64 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v47 + 1) + 8 * j) _setEntity:0];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v64 count:16];
      }
      while (v22);
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v25 = [v42 countByEnumeratingWithState:&v43 objects:v63 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * k) _setEntity:v3];
        }
        uint64_t v25 = [v42 countByEnumeratingWithState:&v43 objects:v63 count:16];
      }
      while (v25);
    }

    *(void *)(v35 + 40) = v42;
  }
  else
  {

    *(void *)(v35 + 40) = 0;
  }
}

- (id)_propertiesOnlySubsetFromIndexes:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (-[NSFetchIndexDescription _isMappedSinglePropertyIndex](v8)) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

- (void)setUniquenessConstraints:(NSArray *)uniquenessConstraints
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(NSEntityDescription *)self _throwIfNotEditable];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSArray *)uniquenessConstraints countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(uniquenessConstraints);
        }
        v7 += [*(id *)(*((void *)&v18 + 1) + 8 * i) count];
      }
      uint64_t v6 = [(NSArray *)uniquenessConstraints countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
    if (v7)
    {
      long long v10 = -[NSEntityDescription _checkForNonCascadeNoInverses](self);
      if (v10)
      {
        long long v11 = v10;
        [(NSEntityDescription *)self name];
        [v11 name];
        objc_msgSend((id)objc_msgSend(v11, "inverseRelationship"), "name");
        [v11 name];
        _NSCoreDataLog(1, @"Cannot merge uniqueness constraints { %@ } on entity '%@' due to relationship '%@' having a mandatory to-one inverse relationship '%@' and not using a cascade delete rule on '%@'", v12, v13, v14, v15, v16, v17, (uint64_t)uniquenessConstraints);
      }
    }
  }
  -[NSEntityDescription _setUniquenessConstraints:]((uint64_t)self, uniquenessConstraints);
}

- (void)_setUniquenessConstraints:(uint64_t)a1
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFAllocatorRef v2 = (void *)a1;
    uint64_t v3 = *(void *)(a1 + 128);
    if (!v3)
    {
      uint64_t v4 = a2;
      -[NSEntityDescription _initializeExtraIVars](a1);
      a2 = v4;
      uint64_t v3 = v2[16];
    }
    if (*(void **)(v3 + 24) != a2)
    {
      uint64_t v54 = v3;
      obuint64_t j = a2;
      long long v56 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count"));
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      uint64_t v58 = [obj countByEnumeratingWithState:&v78 objects:v95 count:16];
      if (!v58) {
        goto LABEL_71;
      }
      uint64_t v57 = *(void *)v79;
      long long v61 = v2;
      while (1)
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v79 != v57) {
            objc_enumerationMutation(obj);
          }
          id v64 = *(id *)(*((void *)&v78 + 1) + 8 * i);
          if (![v64 count]) {
            continue;
          }
          uint64_t v59 = i;
          uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v64, "count"));
          [v56 addObject:v6];
          id v65 = v6;

          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          uint64_t v7 = [v64 countByEnumeratingWithState:&v74 objects:v94 count:16];
          if (!v7) {
            goto LABEL_56;
          }
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v75;
          uint64_t v62 = *(void *)v75;
          do
          {
            uint64_t v10 = 0;
            uint64_t v63 = v8;
            do
            {
              if (*(void *)v75 != v9) {
                objc_enumerationMutation(v64);
              }
              long long v11 = *(__CFString **)(*((void *)&v74 + 1) + 8 * v10);
              if ([(__CFString *)v11 isNSString])
              {
                uint64_t v12 = (void *)[(__CFString *)v11 componentsSeparatedByString:@"."];
                long long v60 = v11;
                if ((unint64_t)[v12 count] < 2)
                {
                  uint64_t v13 = (__CFString *)objc_msgSend((id)objc_msgSend(v2, "propertiesByName"), "objectForKey:", v11);
                }
                else
                {
                  uint64_t v13 = (__CFString *)objc_msgSend((id)objc_msgSend(v2, "propertiesByName"), "objectForKey:", objc_msgSend(v12, "objectAtIndex:", 0));
                  if ((unint64_t)[v12 count] >= 2)
                  {
                    unint64_t v14 = 1;
                    do
                    {
                      uint64_t v15 = (void *)[v12 objectAtIndex:v14];
                      long long v70 = 0u;
                      long long v71 = 0u;
                      long long v72 = 0u;
                      long long v73 = 0u;
                      uint64_t v16 = (void *)[(__CFString *)v13 elements];
                      uint64_t v17 = [v16 countByEnumeratingWithState:&v70 objects:v93 count:16];
                      if (v17)
                      {
                        uint64_t v18 = v17;
                        uint64_t v19 = *(void *)v71;
                        while (2)
                        {
                          for (uint64_t j = 0; j != v18; ++j)
                          {
                            if (*(void *)v71 != v19) {
                              objc_enumerationMutation(v16);
                            }
                            long long v21 = *(__CFString **)(*((void *)&v70 + 1) + 8 * j);
                            if (objc_msgSend(v15, "isEqualToString:", -[__CFString name](v21, "name")))
                            {
                              uint64_t v13 = v21;
                              goto LABEL_30;
                            }
                          }
                          uint64_t v18 = [v16 countByEnumeratingWithState:&v70 objects:v93 count:16];
                          if (v18) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_30:
                      ++v14;
                    }
                    while ([v12 count] > v14);
                  }
                }
                CFAllocatorRef v2 = v61;
                uint64_t v9 = v62;
                uint64_t v8 = v63;
                if (!v13)
                {
                  long long v45 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v46 = *MEMORY[0x1E4F1C3C8];
                  uint64_t v47 = [NSString stringWithFormat:@"Can't find property named %@", v60];
                  NSUInteger v91 = @"Property name";
                  v92 = v60;
                  long long v48 = (void *)MEMORY[0x1E4F1C9E8];
                  long long v49 = &v92;
                  long long v50 = &v91;
LABEL_75:
                  uint64_t v41 = [v48 dictionaryWithObjects:v49 forKeys:v50 count:1];
                  long long v43 = v45;
                  uint64_t v44 = v46;
                  id v42 = (__CFString *)v47;
LABEL_76:
                  objc_exception_throw((id)[v43 exceptionWithName:v44 reason:v42 userInfo:v41]);
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!objc_msgSend((id)objc_msgSend(v2, "propertiesByName"), "objectForKey:", -[__CFString name](v11, "name")))
                  {
                    uint64_t v23 = [(__CFString *)v11 name];
                    [v2 name];
                    _NSCoreDataLog(1, @"Can't find property description '%@' %@ while setting unique constraints on entity '%@'", v24, v25, v26, v27, v28, v29, v23);
                  }
LABEL_42:
                  uint64_t v13 = v11;
                  goto LABEL_43;
                }
                if (v11)
                {
                  if ([(__CFString *)v11 superCompositeAttribute])
                  {
                    uint64_t v22 = -[NSPropertyDescription _rootName](v11);
                    if (!-[NSEntityDescription _attributeNamed:]((uint64_t)v2, (uint64_t)v22))
                    {
                      long long v45 = (void *)MEMORY[0x1E4F1CA00];
                      uint64_t v46 = *MEMORY[0x1E4F1C3C8];
                      uint64_t v47 = [NSString stringWithFormat:@"Can't find property named %@", v11];
                      NSUInteger v89 = @"Property name";
                      uint64_t v90 = v11;
                      long long v48 = (void *)MEMORY[0x1E4F1C9E8];
                      long long v49 = &v90;
                      long long v50 = &v89;
                      goto LABEL_75;
                    }
                  }
                  goto LABEL_42;
                }
                uint64_t v13 = 0;
              }
LABEL_43:
              if ([(__CFString *)v13 _propertyType] == 4)
              {
                if ([(__CFString *)v13 isToMany])
                {
                  uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v40 = *MEMORY[0x1E4F1C3C8];
                  long long v87 = @"Property name";
                  uint64_t v88 = [(__CFString *)v13 name];
                  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
                  id v42 = @"Cannot create unique constraints for to-many relationships.";
LABEL_74:
                  long long v43 = v39;
                  uint64_t v44 = v40;
                  goto LABEL_76;
                }
              }
              else if ([(__CFString *)v13 _propertyType] != 2)
              {
                uint64_t v39 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v40 = *MEMORY[0x1E4F1C3C8];
                long long v85 = @"Property name";
                uint64_t v86 = [(__CFString *)v13 name];
                uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
                id v42 = @"Property type is not valid for unique constraints.";
                goto LABEL_74;
              }
              if ([(__CFString *)v13 _propertyType] == 2
                && v13
                && [(__CFString *)v13 superCompositeAttribute])
              {
                uint64_t v30 = [(__CFString *)v13 _qualifiedName];
              }
              else
              {
                uint64_t v30 = [(__CFString *)v13 name];
              }
              [v65 addObject:v30];
              ++v10;
            }
            while (v10 != v8);
            uint64_t v31 = [v64 countByEnumeratingWithState:&v74 objects:v94 count:16];
            uint64_t v8 = v31;
          }
          while (v31);
LABEL_56:
          uint64_t v32 = (void *)v2[10];
          uint64_t i = v59;
          if (v32)
          {
            uint64_t v33 = (void *)[v32 propertiesByName];
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            uint64_t v34 = [v65 countByEnumeratingWithState:&v66 objects:v84 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = 0;
              uint64_t v37 = *(void *)v67;
              do
              {
                for (uint64_t k = 0; k != v35; ++k)
                {
                  if (*(void *)v67 != v37) {
                    objc_enumerationMutation(v65);
                  }
                  if ([v33 valueForKey:*(void *)(*((void *)&v66 + 1) + 8 * k)]) {
                    ++v36;
                  }
                }
                uint64_t v35 = [v65 countByEnumeratingWithState:&v66 objects:v84 count:16];
              }
              while (v35);
            }
            else
            {
              uint64_t v36 = 0;
            }
            if (v36 == [v65 count])
            {
              long long v51 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v52 = *MEMORY[0x1E4F1C3C8];
              uint64_t v53 = [NSString stringWithFormat:@"Uniqueness constraints must be defined at the highest level possible. All properties in constraint %@ are defined on parent entity.", v65];
              long long v82 = @"Problem constraint";
              id v83 = v64;
              uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
              long long v43 = v51;
              uint64_t v44 = v52;
              id v42 = (__CFString *)v53;
              goto LABEL_76;
            }
          }
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v78 objects:v95 count:16];
        if (!v58)
        {
LABEL_71:

          *(void *)(v54 + 24) = v56;
          return;
        }
      }
    }
  }
}

- (void)_initializeExtraIVars
{
  CFAllocatorRef v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    CFAllocatorRef v2 = malloc_default_zone();
  }
  uint64_t v3 = malloc_type_zone_calloc(v2, 1uLL, 0x40uLL, 0x108004080E465BEuLL);
  uint64_t v4 = 0;
  atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 128), (unint64_t *)&v4, (unint64_t)v3);
  if (v4)
  {
    uint64_t v5 = v3;
    uint64_t v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v6 = malloc_default_zone();
    }
    malloc_zone_free(v6, v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 128) + 48) = 0;
  }
}

- (void)_checkForNonCascadeNoInverses
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v1 = -[NSEntityDescription _collectSubentities](a1);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = [(__CFSet *)v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
LABEL_4:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v8 != v3) {
        objc_enumerationMutation(v1);
      }
      uint64_t v5 = -[NSEntityDescription _checkSelfForNonCascadeNoInverses](*(void *)(*((void *)&v7 + 1) + 8 * v4));
      if (v5) {
        break;
      }
      if (v2 == ++v4)
      {
        uint64_t v2 = [(__CFSet *)v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v2) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSExpression)coreSpotlightDisplayNameExpression
{
  extraIvars = self->_extraIvars;
  if (extraIvars && (extraIvars = (_ExtraEntityIVars *)extraIvars->var4) == 0) {
    return [(NSEntityDescription *)self->_superentity coreSpotlightDisplayNameExpression];
  }
  else {
    return (NSExpression *)extraIvars;
  }
}

- (void)setCoreSpotlightDisplayNameExpression:(NSExpression *)coreSpotlightDisplayNameExpression
{
  [(NSEntityDescription *)self _throwIfNotEditable];
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }
  else
  {
    extraIvars = 0;
  }
  if (extraIvars->var4 != coreSpotlightDisplayNameExpression)
  {
    uint64_t v6 = coreSpotlightDisplayNameExpression;

    extraIvars->var4 = coreSpotlightDisplayNameExpression;
  }
}

- (NSString)renamingIdentifier
{
  extraIvars = self->_extraIvars;
  if (extraIvars && (var0 = (NSString *)extraIvars->var0) != 0) {
    return var0;
  }
  else {
    return [(NSEntityDescription *)self name];
  }
}

- (void)_setSubentities:(char)a3 preserveIndices:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 _throwIfNotEditable];
    if ((a3 & 1) == 0)
    {
      if ((*(unsigned char *)(a1 + 120) & 4) != 0)
      {
        uint64_t v7 = *(void *)(a1 + 72);
      }
      else
      {
        uint64_t v6 = (void *)a1;
        do
        {
          uint64_t v7 = (uint64_t)v6;
          uint64_t v6 = (void *)[v6 superentity];
        }
        while (v6);
      }
      -[NSEntityDescription _dropIndexes](v7);
    }
    if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)_PFRoutines, a2) & 1) == 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't add a subentity to an entity (missing name or bad properties)." userInfo:0]);
    }
    unint64_t v8 = [*(id *)(a1 + 88) count];
    unint64_t v9 = v8;
    if (v8 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v8;
    }
    if (v8 >= 0x201) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = (char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v8 > 0x200) {
      uint64_t v12 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
    }
    [*(id *)(a1 + 88) getObjects:v12 andKeys:0 count:v9];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v12 count:v9];
    uint64_t v14 = [v13 count];
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t i = 0; i != v15; ++i)
      {
        uint64_t v17 = (void *)[v13 objectAtIndex:i];
        if ([a2 indexOfObjectIdenticalTo:v17] == 0x7FFFFFFFFFFFFFFFLL) {
          -[NSEntityDescription _removeSubentity:](a1, v17);
        }
      }
    }
    uint64_t v18 = [a2 count];
    if (v18)
    {
      uint64_t v19 = v18;
      for (uint64_t j = 0; j != v19; ++j)
      {
        uint64_t v21 = [a2 objectAtIndex:j];
        if ([v13 indexOfObjectIdenticalTo:v21] == 0x7FFFFFFFFFFFFFFFLL) {
          [(id)a1 _addSubentity:v21];
        }
      }
    }
    if (v9 >= 0x201) {
      NSZoneFree(0, v12);
    }
  }
}

- (BOOL)_skipValidation
{
  return (*(unsigned char *)&self->_entityDescriptionFlags >> 4) & 1;
}

- (NSDictionary)attributesByName
{
  if (self->_propertyRanges) {
    return (NSDictionary *)*((void *)self->_kvcPropertyAccessors + 7);
  }
  else {
    return (NSDictionary *)-[NSEntityDescription _propertiesMatchingBlock:]((uint64_t)self, (uint64_t)&__block_literal_global_7);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var1)
  {
    unint64_t v9 = [(NSEntityDescription *)self propertiesByName];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = [(NSDictionary *)v9 allValues];
      a3->var3[3] = 0;
      a3->var3[4] = v10;
    }
  }
  uint64_t v11 = (NSArray *)a3->var3[4];
  if (v11)
  {
    if (!a3->var3[3]) {
      uint64_t v11 = [(NSDictionary *)[(NSEntityDescription *)self propertiesByName] allValues];
    }
    return [(NSArray *)v11 countByEnumeratingWithState:a3 objects:a4 count:a5];
  }
  else
  {
    properties = self->_properties;
    return [(NSMutableDictionary *)properties _valueCountByEnumeratingWithState:a3 objects:a4 count:a5];
  }
}

+ (void)initialize
{
  if (!_MergedGlobals_71)
  {
    _MergedGlobals_71 = (uint64_t)objc_getClass("NSKeyValueUndefinedSetter");
    qword_1EB270630 = (uint64_t)objc_getClass("NSKeyValueUndefinedGetter");
  }
}

- (BOOL)performPostDecodeValidationInModel:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  properties = self->_properties;
  uint64_t v7 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    CFIndex v30 = *MEMORY[0x1E4F1D548];
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 8);
    uint64_t v28 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E4F1D548] + 24);
    uint64_t v26 = a4;
    CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v25 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(properties);
        }
        uint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x18C127630]();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = (void *)[v11 destinationEntity];
          uint64_t v14 = [v13 name];
          if (v13
            && (!v14
             || objc_msgSend((id)objc_msgSend(a3, "entitiesByName"), "objectForKeyedSubscript:", v14) != v13))
          {
            uint64_t v21 = v26;
            if (v26)
            {
              uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v23 = *MEMORY[0x1E4F281F8];
              uint64_t v24 = &unk_1ED7E1AB0;
LABEL_28:
              *uint64_t v21 = (id)[v22 errorWithDomain:v23 code:4866 userInfo:v24];
            }
LABEL_29:
            return 0;
          }
          callBacks.versiouint64_t n = v30;
          *(_OWORD *)&callBacks.retaiuint64_t n = v29;
          callBacks.copyDescriptiouint64_t n = v28;
          callBacks.equal = 0;
          callBacks.hash = 0;
          uint64_t v15 = CFSetCreateMutable(v27, 0, &callBacks);
          uint64_t v16 = [v11 inverseRelationship];
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            while (([(__CFSet *)v15 containsObject:v17] & 1) == 0)
            {
              uint64_t v18 = [v17 entity];
              if (!v18
                || (uint64_t v19 = (id *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                || ![v17 name]
                || objc_msgSend(v19[12], "objectForKeyedSubscript:", objc_msgSend(v17, "name")) != v17
                || ![v19 name]
                || (id *)objc_msgSend((id)objc_msgSend(a3, "entitiesByName"), "objectForKeyedSubscript:", objc_msgSend(v19, "name")) != v19)
              {
                uint64_t v21 = v26;
                if (!v26) {
                  goto LABEL_29;
                }
                uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v23 = *MEMORY[0x1E4F281F8];
                uint64_t v24 = &unk_1ED7E1AD8;
                goto LABEL_28;
              }
              [(__CFSet *)v15 addObject:v17];
              uint64_t v17 = (void *)[v17 inverseRelationship];
              if (!v17) {
                break;
              }
            }
          }
          uint64_t v9 = v25;
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v32 objects:v36 count:16];
      a4 = v26;
      if (v8) {
        continue;
      }
      break;
    }
  }
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (unint64_t)_keypathsToPrefetchForDeletePropagation
{
  do
  {
    if (!a1) {
      return 0;
    }
    id v1 = (void *)a1;
    uint64_t v2 = *(void *)(a1 + 128);
    if (!v2)
    {
      -[NSEntityDescription _initializeExtraIVars](a1);
      uint64_t v2 = v1[16];
    }
    a1 = [v1 superentity];
  }
  while (a1);
  unint64_t v3 = atomic_load((unint64_t *)(v2 + 16));
  __dmb(0xBu);
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    uint64_t v5 = objc_msgSend((id)objc_msgSend((id)-[NSEntityDescription _keypathsToPrefetchForDeletePropagationPrefixedWith:toDepth:processedEntities:](v1, 0, 1, objc_msgSend(MEMORY[0x1E4F1CA80], "set")), "allObjects"), "copy");
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v2 + 16), (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {

    }
    unint64_t v3 = atomic_load((unint64_t *)(v2 + 16));
    [v4 drain];
    id v7 = 0;
  }
  return v3;
}

- (uint64_t)_keypathsToPrefetchForDeletePropagationPrefixedWith:(uint64_t)a3 toDepth:(void *)a4 processedEntities:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = a4;
  id v7 = a1;
  int v8 = objc_msgSend(a4, "containsObject:", objc_msgSend(a1, "name"));
  if (a3 < 0 || v8) {
    return NSSet_EmptySet;
  }
  uint64_t v39 = a2;
  uint64_t v37 = a3;
  uint64_t v38 = (void *)[MEMORY[0x1E4F1CA80] set];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v9 addObject:v7];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (1)
  {
    objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(v7, "subentities"));
    if (![v10 count]) {
      break;
    }
    id v7 = (void *)[v10 lastObject];
    [v10 removeLastObject];
    [v9 addObject:v7];
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v41 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = v4;
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v17 = (void *)[v16 relationshipsByName];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v47 != v20) {
                objc_enumerationMutation(v17);
              }
              objc_msgSend(v11, "setObject:forKey:", objc_msgSend(v17, "objectForKey:", *(void *)(*((void *)&v46 + 1) + 8 * j)), *(void *)(*((void *)&v46 + 1) + 8 * j));
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v19);
        }
        id v4 = v15;
        objc_msgSend(v15, "addObject:", objc_msgSend(v16, "name"));
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v13);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v22 = [v11 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v43;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v11);
        }
        uint64_t v26 = (void *)[v11 objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * v25)];
        uint64_t v27 = [v26 deleteRule];
        uint64_t v28 = [v26 inverseRelationship];
        if (v27) {
          BOOL v29 = v27 == 3;
        }
        else {
          BOOL v29 = 1;
        }
        if (!v29)
        {
          uint64_t v30 = v28;
          if (v27 != 1 || v28 != 0)
          {
            if (v39) {
              id v32 = (id)[[NSString alloc] initWithFormat:@"%@.%@", v39, objc_msgSend(v26, "name")];
            }
            else {
              id v32 = (id)[v26 name];
            }
            long long v33 = v32;
            if (v27 != 1 || v30 == 0)
            {
              if (v27 == 2)
              {
                [v38 addObject:v32];
                if (v37 >= 1) {
                  objc_msgSend(v38, "unionSet:", -[NSEntityDescription _keypathsToPrefetchForDeletePropagationPrefixedWith:toDepth:processedEntities:](objc_msgSend(v26, "destinationEntity"), v33, v37 - 1, v4));
                }
              }
            }
            else
            {
              [v38 addObject:v32];
            }
          }
        }
        ++v25;
      }
      while (v23 != v25);
      uint64_t v35 = [v11 countByEnumeratingWithState:&v42 objects:v54 count:16];
      uint64_t v23 = v35;
    }
    while (v35);
  }

  return (uint64_t)v38;
}

- (unint64_t)_entityClass
{
  if (result) {
    return _PFFastEntityClass(result);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x18C127630](self, a2);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription name](self, "name"), @"NSEntityName");
  [a3 encodeObject:self->_classNameForEntity forKey:@"NSClassNameForEntity"];
  if ([(NSEntityDescription *)self isAbstract]) {
    [a3 encodeBool:1 forKey:@"NSIsAbstract"];
  }
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSEntityDescription managedObjectModel](self, "managedObjectModel"), @"NSManagedObjectModel");
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSEntityDescription superentity](self, "superentity"), @"NSSuperentity");
  if (self->_subentities) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_subentities];
  }
  else {
    uint64_t v6 = 0;
  }
  [a3 encodeObject:v6 forKey:@"NSSubentities"];

  if (self->_properties) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_properties];
  }
  else {
    id v7 = 0;
  }
  [a3 encodeObject:v7 forKey:@"NSProperties"];

  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription userInfo](self, "userInfo"), @"NSUserInfo");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription versionHashModifier](self, "versionHashModifier"), @"NSVersionHashModifier");
  int v8 = [(NSEntityDescription *)self renamingIdentifier];
  if (v8) {
    [a3 encodeObject:v8 forKey:@"NSRenamingIdentifier"];
  }
  extraIvars = self->_extraIvars;
  if (extraIvars)
  {
    id var3 = extraIvars->var3;
    if (!var3
      || ([a3 encodeObject:var3 forKey:@"NSUniqueTuples"],
          (extraIvars = self->_extraIvars) != 0))
    {
      id var4 = extraIvars->var4;
      if (!var4
        || ([a3 encodeObject:var4 forKey:@"NSCoreSpotlightDisplayName"],
            (extraIvars = self->_extraIvars) != 0))
      {
        id var5 = extraIvars->var5;
        if (var5)
        {
          [a3 encodeObject:var5 forKey:@"NSFetchIndexDescriptions"];
          uint64_t v13 = self->_extraIvars;
          if (v13 && v13->var5)
          {
            uint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            id v15 = self->_extraIvars->var5;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v22;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v22 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v21 + 1) + 8 * i);
                  if (-[NSFetchIndexDescription _compoundIndexRepresentation](v20)) {
                    [v14 addObject:-[NSFetchIndexDescription _compoundIndexRepresentation](v20)];
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
              }
              while (v17);
            }
          }
          else
          {
            uint64_t v14 = 0;
          }
          [a3 encodeObject:v14 forKey:@"NSCompoundIndexes"];
        }
      }
    }
  }
}

- (void)_setIndexesFromJSONObject:(int)a3 supplemental:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (![a2 isNSArray]) {
    return;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v20 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v20) {
    return;
  }
  unint64_t v3 = 0;
  uint64_t v22 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      long long v23 = v3;
      if (*(void *)v27 != v22) {
        objc_enumerationMutation(a2);
      }
      uint64_t v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if (!objc_msgSend(v5, "isNSArray", v20)) {
        return;
      }
      unint64_t v6 = [v5 count];
      if ((unint64_t)[v5 count] < 2) {
        return;
      }
      id v7 = (void *)[v5 objectAtIndexedSubscript:0];
      if (![v7 isNSString]) {
        return;
      }
      if (v6 >= 2)
      {
        int v8 = 0;
        uint64_t v9 = 1;
        while (1)
        {
          id v10 = (void *)[v5 objectAtIndexedSubscript:v9];
          if (![v10 isNSArray]) {
            return;
          }
          uint64_t v11 = [v10 count];
          int v12 = 1;
          if (v11 == 1) {
            goto LABEL_26;
          }
          if (v11 == 2) {
            goto LABEL_22;
          }
          uint64_t v13 = 0;
          uint64_t v14 = 0;
          if (v11 == 3) {
            break;
          }
LABEL_28:
          uint64_t v17 = -[NSFetchIndexElementDescription initWithPropertyName:collationType:]([NSFetchIndexElementDescription alloc], v14, v13);
          if (!v17) {
            return;
          }
          uint64_t v18 = v17;
          v17[10] = v17[10] & 0xFFFFFFFE | v12;
          if (!v8) {
            int v8 = (void *)[MEMORY[0x1E4F1CA48] array];
          }
          [v8 addObject:v18];

          if (v6 == ++v9) {
            goto LABEL_34;
          }
        }
        id v15 = (void *)[v10 objectAtIndexedSubscript:2];
        if (![v15 isNSString]) {
          return;
        }
        if ([@"asc" caseInsensitiveCompare:v15]
          && [@"ascending" caseInsensitiveCompare:v15])
        {
          if ([@"desc" caseInsensitiveCompare:v15]
            && [@"descending" caseInsensitiveCompare:v15])
          {
            return;
          }
          int v12 = 0;
        }
LABEL_22:
        uint64_t v16 = (void *)[v10 objectAtIndexedSubscript:1];
        if (![v16 isNSString]) {
          return;
        }
        if ([@"binary" caseInsensitiveCompare:v16])
        {
          if ([@"rtree" caseInsensitiveCompare:v16]) {
            return;
          }
          uint64_t v13 = 1;
        }
        else
        {
LABEL_26:
          uint64_t v13 = 0;
        }
        uint64_t v14 = (void *)[v10 objectAtIndexedSubscript:0];
        if (![v14 isNSString]) {
          return;
        }
        goto LABEL_28;
      }
      int v8 = 0;
LABEL_34:
      uint64_t v19 = [[NSFetchIndexDescription alloc] initWithName:v7 elements:v8];
      [(NSFetchIndexDescription *)v19 _setEntity:a1];
      if (!v19) {
        return;
      }
      unint64_t v3 = v23;
      if (!v23) {
        unint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
      }
      [v3 addObject:v19];
    }
    uint64_t v20 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v20);
  if (v3 && objc_msgSend(v3, "count", 0))
  {
    if (a3) {
      -[NSEntityDescription _addSupplementalIndexes:](a1, v3);
    }
    else {
      -[NSEntityDescription _setIndexes:](a1, v3);
    }
  }
}

- (void)_addSupplementalIndexes:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 128);
  if (!v4)
  {
    -[NSEntityDescription _initializeExtraIVars](a1);
    uint64_t v4 = *(void *)(a1 + 128);
  }
  uint64_t v5 = *(void **)(v4 + 40);
  if (v5)
  {
    unint64_t v6 = (void *)[v5 mutableCopy];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(a2);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v11 _setEntity:a1];
          [v6 addObject:v11];
        }
        uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(a2);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * j) _setEntity:a1];
        }
        uint64_t v13 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }
    unint64_t v6 = (void *)[a2 mutableCopy];
  }
  *(void *)(v4 + 40) = v6;
}

- (id)description
{
  long long v16 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)NSEntityDescription;
  id v3 = [(NSEntityDescription *)&v17 description];
  uint64_t v4 = [(NSEntityDescription *)self name];
  uint64_t v5 = [(NSEntityDescription *)self managedObjectClassName];
  unint64_t v6 = [(NSEntityDescription *)self renamingIdentifier];
  BOOL v7 = [(NSEntityDescription *)self isAbstract];
  uint64_t v8 = [[(NSEntityDescription *)self superentity] name];
  uint64_t v9 = [(NSEntityDescription *)self propertiesByName];
  id v10 = [(NSEntityDescription *)self subentitiesByName];
  uint64_t v11 = [(NSEntityDescription *)self userInfo];
  uint64_t v12 = [(NSEntityDescription *)self versionHashModifier];
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars || (uint64_t var3 = (uint64_t)extraIvars->var3) == 0) {
      uint64_t var3 = NSArray_EmptyArray;
    }
  }
  else
  {
    uint64_t var3 = 0;
  }
  return (id)[v16 stringWithFormat:@"(%@) name %@, managedObjectClassName %@, renamingIdentifier %@, isAbstract %u, superentity name %@, properties %@, subentities %@, userInfo %@, versionHashModifier %@, uniquenessConstraints %@", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, var3];
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  objc_sync_enter(self);
  uint64_t v5 = self->_userInfo;
  if (v5 != (NSMutableDictionary *)userInfo)
  {

    self->_userInfo = (NSMutableDictionary *)[(NSDictionary *)userInfo copy];
  }

  objc_sync_exit(self);
}

- (void)setSubentities:(NSArray *)subentities
{
}

- (NSArray)relationshipsWithDestinationEntity:(NSEntityDescription *)entity
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  if (self->_propertyRanges)
  {
    uint64_t v6 = [(NSDictionary *)[(NSEntityDescription *)self propertiesByName] values];
    propertyRanges = self->_propertyRanges;
    locatiouint64_t n = propertyRanges[2].location;
    NSUInteger length = propertyRanges[2].length;
    if (location < length + location)
    {
      id v10 = (id *)(v6 + 8 * location);
      do
      {
        id v11 = *v10;
        if ((NSEntityDescription *)[*v10 destinationEntity] == entity) {
          [(NSArray *)v5 addObject:v11];
        }
        ++v10;
        --length;
      }
      while (length);
    }
  }
  else
  {
    uint64_t v12 = [(NSEntityDescription *)self relationshipsByName];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = [(NSDictionary *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [(NSDictionary *)v12 objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v16)];
          if ((NSEntityDescription *)[v17 destinationEntity] == entity) {
            [(NSArray *)v5 addObject:v17];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSDictionary *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
  return v5;
}

- (void)setManagedObjectClassName:(NSString *)managedObjectClassName
{
  [(NSEntityDescription *)self _throwIfNotEditable];
  if ([(NSString *)managedObjectClassName isEqualToString:+[NSEntityDescription _MOClassName]])
  {
    managedObjectClassName = 0;
  }
  classNameForEntity = self->_classNameForEntity;
  if (classNameForEntity != managedObjectClassName)
  {

    self->_classNameForEntity = (NSString *)[(NSString *)managedObjectClassName copy];
  }
  atomic_store(0, (unint64_t *)&self->_instanceClass);
}

- (void)setAbstract:(BOOL)abstract
{
  BOOL v3 = abstract;
  [(NSEntityDescription *)self _throwIfNotEditable];
  self->___entityDescriptionFlags entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&self->_entityDescriptionFlags & 0xFFFFFFFE | v3);
}

- (NSString)versionHashModifier
{
  return self->_versionHashModifier;
}

- (void)setVersionHashModifier:(NSString *)versionHashModifier
{
  [(NSEntityDescription *)self _throwIfNotEditable];
  uint64_t v5 = self->_versionHashModifier;
  if (v5 != versionHashModifier)
  {

    self->_versionHashModifier = (NSString *)[(NSString *)versionHashModifier copy];
  }
}

- (NSArray)compoundIndexes
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_extraIvars) {
    return (NSArray *)NSArray_EmptyArray;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id var5 = self->_extraIvars->var5;
  uint64_t v5 = [var5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(var5);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((-[NSFetchIndexDescription _isMappedSinglePropertyIndex]((uint64_t)v9) & 1) == 0)
        {
          id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v9, "elements"), "count"));
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = objc_msgSend(v9, "elements", 0);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "property"));
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v13);
          }
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [var5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (uint64_t)_hasIndexForProperty:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 128);
    if (v4)
    {
      uint64_t v5 = *(void **)(v4 + 40);
      if (v5)
      {
        long long v12 = 0u;
        long long v13 = 0u;
        long long v10 = 0u;
        long long v11 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v11;
          while (2)
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v11 != v8) {
                objc_enumerationMutation(v5);
              }
              if (-[NSFetchIndexDescription _isIndexForProperty:](*(void *)(*((void *)&v10 + 1) + 8 * v9), a2)) {
                return 1;
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
      }
    }
    return -[NSEntityDescription _hasIndexForProperty:](*(void *)(v3 + 80), a2);
  }
  return result;
}

- (NSArray)uniquenessConstraints
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  superentity = self->_superentity;
  if (superentity)
  {
    uint64_t v5 = [(NSEntityDescription *)superentity uniquenessConstraints];
    if (v5) {
      [v3 addObjectsFromArray:v5];
    }
  }
  extraIvars = self->_extraIvars;
  if (extraIvars && extraIvars->var3) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }

  return (NSArray *)v3;
}

- (void)_addSubentity:(id)a3
{
  [(NSEntityDescription *)self _throwIfNotEditable];
  uint64_t v5 = (NSEntityDescription *)[a3 superentity];
  if (v5 == self) {
    return;
  }
  if (v5)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    long long v11 = @"Can't add an entity to multiple superentities.";
    goto LABEL_13;
  }
  uint64_t v6 = [a3 name];
  if (!v6)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    long long v11 = @"Can't add unnamed subentity.";
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  id v8 = (id)[(NSMutableDictionary *)self->_subentities objectForKey:v6];
  if (v8 && v8 != a3)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3B8];
    long long v11 = @"Can't add multiple entities with duplicate names.";
LABEL_13:
    objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v11 userInfo:0]);
  }
  [(NSMutableDictionary *)self->_subentities setObject:a3 forKey:v7];

  -[NSEntityDescription _setSuperentity:]((uint64_t)a3, (uint64_t)self);
}

- (uint64_t)_setSuperentity:(uint64_t)result
{
  if (result && *(void *)(result + 80) != a2)
  {
    if (result == a2) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't set superentity of self to self." userInfo:0]);
    }
    *(void *)(result + 80) = a2;
  }
  return result;
}

- (id)_uniquenessConstraintsAsFetchIndexes
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v32 = self;
  extraIvars = self->_extraIvars;
  if (extraIvars)
  {
    id var3 = extraIvars->var3;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = var3;
    uint64_t v28 = [var3 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v28)
    {
      uint64_t v26 = *(void *)v38;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v5;
          uint64_t v6 = *(void **)(*((void *)&v37 + 1) + 8 * v5);
          id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v34 = (void *)[@"UNIQUE" mutableCopy];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v30 = v6;
          uint64_t v36 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v36)
          {
            uint64_t v33 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if (*(void *)v46 != v33) {
                  objc_enumerationMutation(v30);
                }
                id v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                uint64_t v9 = (void *)[v8 componentsSeparatedByString:@"."];
                uint64_t v31 = v8;
                if ((unint64_t)[v9 count] < 2)
                {
                  id v10 = [(NSDictionary *)[(NSEntityDescription *)v32 propertiesByName] objectForKey:v8];
                }
                else
                {
                  id v10 = -[NSDictionary objectForKey:](-[NSEntityDescription propertiesByName](v32, "propertiesByName"), "objectForKey:", [v9 objectAtIndex:0]);
                  if ((unint64_t)[v9 count] >= 2)
                  {
                    unint64_t v11 = 1;
                    do
                    {
                      long long v12 = (void *)[v9 objectAtIndex:v11];
                      long long v41 = 0u;
                      long long v42 = 0u;
                      long long v43 = 0u;
                      long long v44 = 0u;
                      long long v13 = (void *)[v10 elements];
                      uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
                      if (v14)
                      {
                        uint64_t v15 = v14;
                        uint64_t v16 = *(void *)v42;
                        while (2)
                        {
                          for (uint64_t j = 0; j != v15; ++j)
                          {
                            if (*(void *)v42 != v16) {
                              objc_enumerationMutation(v13);
                            }
                            long long v18 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                            if (objc_msgSend(v12, "isEqualToString:", objc_msgSend(v18, "name")))
                            {
                              id v10 = v18;
                              goto LABEL_25;
                            }
                          }
                          uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
                          if (v15) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_25:
                      ++v11;
                    }
                    while ([v9 count] > v11);
                  }
                }
                if (!v10)
                {
                  long long v22 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v23 = *MEMORY[0x1E4F1C3C8];
                  uint64_t v24 = [NSString stringWithFormat:@"Can't find property named %@", v31];
                  long long v50 = @"Property name";
                  long long v51 = v31;
                  objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v24, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1)));
                }
                long long v19 = [[NSFetchIndexElementDescription alloc] initWithProperty:v10 collationType:0];
                [v34 appendFormat:@"_%@", objc_msgSend(v10, "name")];
                [v35 addObject:v19];
              }
              uint64_t v36 = [v30 countByEnumeratingWithState:&v45 objects:v53 count:16];
            }
            while (v36);
          }
          long long v20 = [[NSFetchIndexDescription alloc] initWithName:v34 elements:v35];
          -[NSFetchIndexDescription _setIsUnique:]((uint64_t)v20, 1);

          [v27 addObject:v20];
          uint64_t v5 = v29 + 1;
        }
        while (v29 + 1 != v28);
        uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v28);
    }
  }
  return v27;
}

- (id)_propertyWithRenamingIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NSEntityDescription *)self propertiesByName];
  id v5 = [(NSDictionary *)v4 objectForKey:a3];
  if ((objc_msgSend((id)objc_msgSend(v5, "renamingIdentifier"), "isEqualToString:", a3) & 1) == 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        id v5 = [(NSDictionary *)v4 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        if (objc_msgSend((id)objc_msgSend(v5, "renamingIdentifier"), "isEqualToString:", a3)) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSDictionary *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
          id v5 = 0;
          if (v7) {
            goto LABEL_4;
          }
          return v5;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

+ (id)_MOClassName
{
  id result = (id)_MOClassName__NSManagedObjectClassName;
  if (!_MOClassName__NSManagedObjectClassName)
  {
    id v3 = (objc_class *)objc_opt_class();
    id result = (id)[NSStringFromClass(v3) copy];
    _MOClassName__NSManagedObjectClassName = (uint64_t)result;
  }
  return result;
}

- (uint64_t)_propertyKeys:(uint64_t)a3 matchingBlock:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    char v16 = 0;
    if ((*(unsigned char *)(result + 120) & 8) == 0)
    {
      uint64_t v6 = [(id)result superentity];
      if (v6)
      {
        char v16 = -[NSEntityDescription _propertyKeys:matchingBlock:](v6, a2, a3);
        if (v16) {
          return 1;
        }
      }
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = *(void **)(v5 + 96);
    id result = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (result)
    {
      uint64_t v8 = result;
      uint64_t v9 = *(void *)v13;
LABEL_8:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
        if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(a3 + 16))(a3, [*(id *)(v5 + 96) objectForKey:v11], &v16))
        {
          [a2 addObject:v11];
        }
        if (v16) {
          return 1;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v8) {
            goto LABEL_8;
          }
          return v16 != 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_relationshipNamesByType:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__NSEntityDescription__NSInternalMethods___relationshipNamesByType___block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSPropertyDescription_8_B16l;
    char v7 = a2;
    -[NSEntityDescription _propertyKeys:matchingBlock:](v2, v4, (uint64_t)v6);
    uint64_t v2 = [v4 allObjects];
  }
  return v2;
}

uint64_t __68__NSEntityDescription__NSInternalMethods___relationshipNamesByType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _isRelationship];
  if (result)
  {
    uint64_t v5 = [a2 maxCount];
    if (*(unsigned char *)(a1 + 32))
    {
      if (v5 == 1) {
        return 1;
      }
    }
    else if (v5 != 1)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t __56__NSEntityDescription__NSInternalMethods__attributeKeys__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isAttribute];
}

- (id)toManyRelationshipKeys
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_propertyRanges)
  {
    uint64_t v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
    propertyRanges = self->_propertyRanges;
    locatiouint64_t n = propertyRanges[9].location;
    NSUInteger length = propertyRanges[9].length;
    NSUInteger v8 = propertyRanges[13].location;
    NSUInteger v7 = propertyRanges[13].length;
    unint64_t v9 = v7 + length;
    if (v7 + length <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v7 + length;
    }
    if (v9 >= 0x201) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    long long v12 = (char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v9 > 0x200)
    {
      long long v12 = (char *)NSAllocateScannedUncollectable();
      if (!length)
      {
LABEL_16:
        if (v7) {
          memcpy(&v12[8 * length], (const void *)(v3 + 8 * v8), 8 * v7);
        }
        long long v14 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:v7 + length];
        if (v9 >= 0x201) {
          NSZoneFree(0, v12);
        }
        return v14;
      }
    }
    else
    {
      bzero((char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
      if (!length) {
        goto LABEL_16;
      }
    }
    memcpy(v12, (const void *)(v3 + 8 * location), 8 * length);
    goto LABEL_16;
  }

  return (id)-[NSEntityDescription _relationshipNamesByType:]((uint64_t)self, 0);
}

- (id)toOneRelationshipKeys
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_propertyRanges)
  {
    uint64_t v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
    propertyRanges = self->_propertyRanges;
    locatiouint64_t n = propertyRanges[6].location;
    NSUInteger length = propertyRanges[6].length;
    NSUInteger v8 = propertyRanges[10].location;
    NSUInteger v7 = propertyRanges[10].length;
    unint64_t v9 = v7 + length;
    if (v7 + length <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v7 + length;
    }
    if (v9 >= 0x201) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    long long v12 = (char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v9 > 0x200)
    {
      long long v12 = (char *)NSAllocateScannedUncollectable();
      if (!length)
      {
LABEL_16:
        if (v7) {
          memcpy(&v12[8 * length], (const void *)(v3 + 8 * v8), 8 * v7);
        }
        long long v14 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:v7 + length];
        if (v9 >= 0x201) {
          NSZoneFree(0, v12);
        }
        return v14;
      }
    }
    else
    {
      bzero((char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v10);
      if (!length) {
        goto LABEL_16;
      }
    }
    memcpy(v12, (const void *)(v3 + 8 * location), 8 * length);
    goto LABEL_16;
  }

  return (id)-[NSEntityDescription _relationshipNamesByType:]((uint64_t)self, 1);
}

- (id)inverseForRelationshipKey:(id)a3
{
  if (self->_propertyRanges)
  {
    id v5 = [(NSEntityDescription *)self _propertySearchMapping];
    uint64_t v6 = [(NSDictionary *)[(NSEntityDescription *)self propertiesByName] values];
    uint64_t v7 = [v5 indexForKey:a3];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v8 = 0;
    }
    else {
      NSUInteger v8 = (void *)[*(id *)(v6 + 8 * v7) inverseRelationship];
    }
    return (id)[v8 name];
  }
  else
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3052000000;
    char v16 = __Block_byref_object_copy__10;
    long long v17 = __Block_byref_object_dispose__10;
    uint64_t v18 = 0;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__NSEntityDescription__NSInternalMethods__inverseForRelationshipKey___block_invoke;
    v12[3] = &unk_1E544BF70;
    v12[4] = a3;
    v12[5] = &v13;
    -[NSEntityDescription _propertyKeys:matchingBlock:]((uint64_t)self, v9, (uint64_t)v12);

    uint64_t v10 = (void *)v14[5];
    _Block_object_dispose(&v13, 8);
    return v10;
  }
}

uint64_t __69__NSEntityDescription__NSInternalMethods__inverseForRelationshipKey___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 _isRelationship]
    && objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", *(void *)(a1 + 32)))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "inverseRelationship"), "name");
    *a3 = 1;
  }
  return 0;
}

uint64_t __59__NSEntityDescription__NSInternalMethods___attributeNamed___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 _isAttribute];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", *(void *)(a1 + 32));
    if (result)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
      *a3 = 0;
      return 1;
    }
  }
  return result;
}

- (void)_setIsEditable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_sync_enter(self);
  uint64_t v6 = (void *)MEMORY[0x18C127630](v5);
  __entityDescriptionFlags entityDescriptionFlags = self->_entityDescriptionFlags;
  if (v3)
  {
    if ((*(unsigned char *)&entityDescriptionFlags & 4) != 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Cannot make an immutable entity editable again." userInfo:0]);
    }
  }
  else if ((*(unsigned char *)&entityDescriptionFlags & 4) == 0)
  {
    model = self->_model;
    if (model)
    {
      [(NSManagedObjectModel *)model _setIsEditable:0];
    }
    else
    {
      self->_modelsReferenceIDForEntity = 0;
      [(NSEntityDescription *)self _flattenProperties];
      [(NSEntityDescription *)self _createCachesAndOptimizeState];
      [(NSEntityDescription *)self versionHash];
      __dmb(0xBu);
    }
  }

  objc_sync_exit(self);
}

- (uint64_t)_hasPotentialHashSkew
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 88) count];
    if (result)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      uint64_t v2 = *(void **)(v1 + 96);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v10;
        while (2)
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v10 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = (void *)[*(id *)(v1 + 96) objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v5)];
            if ([v6 _propertyType] == 4)
            {
              uint64_t v7 = [v6 inverseRelationship];
              if (v7 && v6 == (void *)v7) {
                return 1;
              }
            }
            ++v5;
          }
          while (v3 != v5);
          uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v3 = result;
          if (result) {
            continue;
          }
          break;
        }
      }
    }
  }
  return result;
}

- (unint64_t)_offsetRelationshipIndex:(unint64_t)a3 fromSuperEntity:(id)a4 andIsToMany:(BOOL)a5
{
  uint64_t v5 = (void *)*((void *)a4 + 14);
  unint64_t v6 = v5[8];
  BOOL v8 = a3 >= v6;
  unint64_t v7 = a3 - v6;
  BOOL v8 = !v8 || v7 >= v5[9];
  if (v8)
  {
    unint64_t v9 = v5[4];
    BOOL v8 = a3 >= v9;
    unint64_t v10 = a3 - v9;
    if (!v8 || v10 >= v5[5]) {
      return a3;
    }
    unint64_t v12 = v5[24];
    unint64_t v13 = v5[25];
    unint64_t v14 = a3 - v12;
    BOOL v15 = !a5;
    uint64_t v16 = 10;
    uint64_t v17 = 13;
  }
  else
  {
    unint64_t v12 = v5[16];
    unint64_t v13 = v5[17];
    unint64_t v14 = a3 - v12;
    BOOL v15 = !a5;
    uint64_t v16 = 6;
    uint64_t v17 = 9;
  }
  if (!v15) {
    uint64_t v16 = v17;
  }
  BOOL v18 = v14 < v13 && a3 >= v12;
  uint64_t v19 = 8;
  if (!v18) {
    uint64_t v19 = v16;
  }
  return self->_propertyRanges[v19].location + a3 - v5[2 * v19];
}

- (void)_checkAttributeMembership:(void *)a1 hashes:(void *)a2
{
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x18C127630]();
  uint64_t v5 = [a1 _qualifiedName];
  if ([a2 objectForKey:v5])
  {
    long long v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v18[0] = @"attributeName";
    v18[1] = @"compositeName";
    v19[0] = [a1 name];
    v19[1] = objc_msgSend((id)objc_msgSend(a1, "superCompositeAttribute"), "name");
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, @"An attribute cannot be part of multiple composite attributes.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, v18, 2)));
  }
  [a2 setObject:a1 forKey:v5];
  if ([a1 attributeType] == 2100)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v6 = objc_msgSend(a1, "elements", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSEntityDescription _checkAttributeMembership:hashes:](*(void *)(*((void *)&v13 + 1) + 8 * v10++), a2);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_newSnowLeopardStyleDictionaryContainingPropertiesOfType:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
  uint64_t v6 = [(NSDictionary *)[(NSEntityDescription *)self propertiesByName] values];
  uint64_t v7 = &self->_propertyRanges[a3];
  unint64_t length = v7->length;
  uint64_t v9 = (__CFString **)(v5 + 8 * v7->location);
  uint64_t v10 = (uint64_t *)(v6 + 8 * v7->location);

  return (void *)_PF_SnowLeopard_CFDictionaryCreateWithObjectsAndKeys(v10, v9, length);
}

- (void)_stripForMigration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSEntityDescription *)self setManagedObjectClassName:0];
  *(_DWORD *)&self->_entityDescriptionFlags |= 0x10u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSEntityDescription *)self properties];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _stripForMigration];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_restoreValidation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)&self->_entityDescriptionFlags &= ~0x10u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(NSEntityDescription *)self properties];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _restoreValidation];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (uint64_t)_hasDerivedAttributes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (void *)result;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v2 = (void *)[(id)result attributesByName];
    uint64_t result = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v17 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = objc_msgSend((id)objc_msgSend(v1, "attributesByName"), "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i));
          if ([v6 _propertyType] == 7)
          {
            long long v7 = (void *)[v6 _flattenedElements];
            long long v12 = 0u;
            long long v13 = 0u;
            long long v14 = 0u;
            long long v15 = 0u;
            uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v13;
LABEL_10:
              uint64_t v11 = 0;
              while (1)
              {
                if (*(void *)v13 != v10) {
                  objc_enumerationMutation(v7);
                }
                if ([*(id *)(*((void *)&v12 + 1) + 8 * v11) _propertyType] == 6) {
                  return 1;
                }
                if (v9 == ++v11)
                {
                  uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
                  if (v9) {
                    goto LABEL_10;
                  }
                  break;
                }
              }
            }
          }
          else if ([v6 _propertyType] == 6)
          {
            return 1;
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
        uint64_t result = 0;
        if (v3) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_removeIndexForProperty:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 128);
    if (v3)
    {
      uint64_t v4 = *(void **)(v3 + 40);
      if (v4)
      {
        long long v12 = 0u;
        long long v13 = 0u;
        long long v10 = 0u;
        long long v11 = 0u;
        uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (result)
        {
          uint64_t v6 = result;
          uint64_t v7 = *(void *)v11;
          while (2)
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v11 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
              uint64_t result = -[NSFetchIndexDescription _isIndexForProperty:](v9, a2);
              if (result)
              {
                if (v9) {
                  return [*(id *)(*(void *)(v2 + 128) + 40) removeObject:v9];
                }
                return result;
              }
              ++v8;
            }
            while (v6 != v8);
            uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
            uint64_t v6 = result;
            if (result) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_isPathologicalForConstraintMerging:(uint64_t)result
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = (void *)result;
    if ((*(unsigned char *)(result + 121) & 0x20) != 0)
    {
      if (a2)
      {
        uint64_t v4 = -[NSEntityDescription _checkForNonCascadeNoInverses]((const void *)result);
        uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v6 = *MEMORY[0x1E4F281F8];
        if (v4)
        {
          uint64_t v7 = v4;
          v14[0] = @"Reason";
          v15[0] = [NSString stringWithFormat:@"Entity '%@' has unique constraints { %@ } with relationship '%@' and mandatory to-one inverse '%@' but is not using a cascade delete rule .", objc_msgSend(v2, "name"), objc_msgSend(v2, "uniquenessConstraints"), objc_msgSend(v7, "name"), objc_msgSend((id)objc_msgSend(v7, "inverseRelationship"), "name")];
          v15[1] = v7;
          v14[1] = @"relationship";
          v14[2] = @"inverse";
          void v15[2] = [v7 inverseRelationship];
          uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v15;
          long long v10 = (__CFString **)v14;
          uint64_t v11 = 3;
        }
        else
        {
          long long v12 = @"Reason";
          uint64_t v13 = [NSString stringWithFormat:@"Entity '%@' has unique constraints { %@ } with a relationship and mandatory to-one inverse but is not using a cascade delete rule .", objc_msgSend(v2, "name"), objc_msgSend(v2, "uniquenessConstraints")];
          uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = &v13;
          long long v10 = &v12;
          uint64_t v11 = 1;
        }
        *a2 = objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 134111, objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11));
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)_isSchemaEqual:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  uint64_t v5 = [(NSEntityDescription *)self name];
  uint64_t v6 = [a3 name];
  if (v5 != (NSString *)v6)
  {
    uint64_t v7 = v6;
    LOBYTE(v6) = 0;
    if (!v5) {
      return v6;
    }
    if (!v7) {
      return v6;
    }
    LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  uint64_t v8 = [(NSEntityDescription *)self superentity];
  uint64_t v6 = [a3 superentity];
  if (v8 != (NSEntityDescription *)v6)
  {
    uint64_t v9 = v6;
    LOBYTE(v6) = 0;
    if (!v8) {
      return v6;
    }
    if (!v9) {
      return v6;
    }
    LODWORD(v6) = -[NSEntityDescription _isSchemaEqual:](v8, sel__isSchemaEqual_);
    if (!v6) {
      return v6;
    }
  }
  long long v10 = [(NSEntityDescription *)self propertiesByName];
  uint64_t v11 = (void *)[a3 propertiesByName];
  uint64_t v12 = [(NSDictionary *)v10 count];
  if (v12 != [v11 count])
  {
LABEL_26:
    LOBYTE(v6) = 0;
    return v6;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [(NSDictionary *)v10 allKeys];
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v19 = [(NSDictionary *)v10 objectForKey:v18];
        uint64_t v20 = [v11 objectForKey:v18];
        if (v19 != (id)v20)
        {
          if (v19) {
            BOOL v21 = v20 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21) {
            goto LABEL_26;
          }
          LODWORD(v6) = objc_msgSend(v19, sel__isSchemaEqual_, v20);
          if (!v6) {
            return v6;
          }
        }
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      LOBYTE(v6) = 1;
    }
    while (v15);
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass) {
    _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass Class = objc_opt_class();
  }
  uint64_t v16 = (void *)[a9 mapping];
  _writeInt32IntoData(a3, 0xDAEDFEEB);
  unsigned int v60 = [a3 length];
  _writeInt32IntoData(a3, 0);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a6, "objectForKey:", self->_versionHashModifier), "unsignedIntegerValue"));
  unint64_t v17 = atomic_load((unint64_t *)&self->_versionHash);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a7, "objectForKey:", v17), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_classNameForEntity), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_name), "unsignedIntegerValue"));
  if (self->_superentity)
  {
    LOBYTE(v63) = 1;
    [a3 appendBytes:&v63 length:1];
    _writeInt32IntoData(a3, objc_msgSend(v16, "indexForKey:", -[NSEntityDescription name](self->_superentity, "name")));
  }
  else
  {
    LOBYTE(v63) = 0;
    [a3 appendBytes:&v63 length:1];
  }
  id v62 = a7;
  _writeInt32IntoData(a3, objc_msgSend(v16, "indexForKey:", -[NSEntityDescription name](self->_rootentity, "name")));
  subentities = self->_subentities;
  if (subentities && [(NSMutableDictionary *)subentities count])
  {
    LOBYTE(v63) = 1;
    [a3 appendBytes:&v63 length:1];
    id v19 = (void *)[(NSMutableDictionary *)self->_subentities mapping];
    _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a8, "objectForKey:", v19), "unsignedIntegerValue"));
    LODWORD(v21) = [v19 length];
    _writeInt32IntoData(a3, v21);
    uint64_t v20 = [v19 keys];
    uint64_t v21 = v21;
    if (v21)
    {
      uint64_t v22 = (uint64_t *)v20;
      do
      {
        uint64_t v23 = *v22++;
        _writeInt64IntoData(a3, [v16 indexForKey:v23]);
        --v21;
      }
      while (v21);
    }
  }
  else
  {
    LOBYTE(v63) = 0;
    [a3 appendBytes:&v63 length:1];
  }
  uint64_t v59 = v16;
  id v61 = a8;
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a8, "objectForKey:", self->_propertyMapping), "unsignedIntegerValue"));
  uint64_t v24 = [(NSMutableDictionary *)self->_properties count];
  if (v24)
  {
    uint64_t v25 = v24;
    long long v26 = (void *)[self->_propertyMapping keys];
    uint64_t v27 = v25;
    do
    {
      _writeInt64IntoData(a3, 0);
      --v27;
    }
    while (v27);
    do
    {
      uint64_t v28 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:*v26];
      uint64_t v29 = (objc_class *)_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass;
      if (v29 == object_getClass(v28))
      {
        _writeInt32IntoData(a3, 1u);
        _writeNSPropertyProxyIntoData(a3, v28, a4);
      }
      else
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v28), "unsignedIntegerValue"));
      }
      ++v26;
      --v25;
    }
    while (v25);
  }
  for (uint64_t i = 0; i != 18; ++i)
  {
    _writeInt64IntoData(a3, LODWORD(self->_propertyRanges[i].location));
    _writeInt64IntoData(a3, LODWORD(self->_propertyRanges[i].length));
  }
  _writeInt32IntoData(a3, *(_DWORD *)&self->_entityDescriptionFlags);
  int v31 = 8;
  do
  {
    _writeInt64IntoData(a3, 0);
    --v31;
  }
  while (v31);
  if ([(NSEntityDescription *)self renamingIdentifier]) {
    unint64_t v32 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier")), "unsignedIntegerValue");
  }
  else {
    unint64_t v32 = 0;
  }
  _writeInt64IntoData(a3, v32);
  if ([(NSEntityDescription *)self coreSpotlightDisplayNameExpression]) {
    unint64_t v33 = objc_msgSend((id)objc_msgSend(v62, "objectForKey:", -[NSEntityDescription coreSpotlightDisplayNameExpression](self, "coreSpotlightDisplayNameExpression")), "unsignedIntegerValue");
  }
  else {
    unint64_t v33 = 0;
  }
  _writeInt64IntoData(a3, v33);
  long long v34 = [(NSEntityDescription *)self indexes];
  unint64_t v35 = [(NSArray *)v34 count];
  if (v34 && v35)
  {
    _writeInt64IntoData(a3, v35);
    if ([(NSArray *)v34 count])
    {
      uint64_t v36 = 0;
      while (1)
      {
        id v37 = [(NSArray *)v34 objectAtIndex:v36];
        _writeInt64IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", objc_msgSend(v37, "name")), "unsignedIntegerValue"));
        uint64_t v38 = [v37 partialIndexPredicate];
        if (v38)
        {
          uint64_t v39 = v38;
          _writeInt64IntoData(a3, 1uLL);
          unint64_t v40 = objc_msgSend((id)objc_msgSend(v62, "objectForKey:", v39), "unsignedIntegerValue");
        }
        else
        {
          unint64_t v40 = 0;
        }
        _writeInt64IntoData(a3, v40);
        long long v41 = (void *)[v37 elements];
        unint64_t v42 = [v41 count];
        unint64_t v43 = v42;
        if (v41)
        {
          if (v42) {
            break;
          }
        }
        _writeInt64IntoData(a3, 0);
        if (v43) {
          goto LABEL_41;
        }
LABEL_46:
        if (++v36 >= [(NSArray *)v34 count]) {
          goto LABEL_49;
        }
      }
      _writeInt64IntoData(a3, v42);
LABEL_41:
      uint64_t v44 = 0;
      do
      {
        long long v45 = (void *)[v41 objectAtIndex:v44];
        _writeInt64IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", objc_msgSend(v45, "propertyName")), "unsignedIntegerValue"));
        _writeInt64IntoData(a3, [v45 collationType]);
        _writeInt64IntoData(a3, [v45 isAscending]);
        long long v46 = (void *)[v45 property];
        if ([v46 _propertyType] == 5)
        {
          _writeInt64IntoData(a3, 1uLL);
          unint64_t v47 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v46), "unsignedIntegerValue");
        }
        else
        {
          unint64_t v47 = 0;
        }
        _writeInt64IntoData(a3, v47);
        ++v44;
      }
      while (v43 != v44);
      goto LABEL_46;
    }
  }
  else
  {
    _writeInt64IntoData(a3, 0);
  }
LABEL_49:
  if (self
    && ((extraIvars = self->_extraIvars) != 0 && (id var3 = extraIvars->var3) != 0
     || (id var3 = (id)NSArray_EmptyArray) != 0)
    && [var3 count])
  {
    _writeInt64IntoData(a3, [var3 count]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v50 = [var3 countByEnumeratingWithState:&v64 objects:v68 count:16];
    unsigned int v52 = v60;
    long long v51 = v61;
    long long v53 = v59;
    if (v50)
    {
      uint64_t v54 = v50;
      uint64_t v55 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v65 != v55) {
            objc_enumerationMutation(var3);
          }
          _writePFEncodedArrayShapeIntoData(a3, *(void **)(*((void *)&v64 + 1) + 8 * j), a5, 0);
        }
        uint64_t v54 = [var3 countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v54);
    }
  }
  else
  {
    _writeInt64IntoData(a3, 0);
    unsigned int v52 = v60;
    long long v51 = v61;
    long long v53 = v59;
  }
  if (self->_userInfo) {
    unsigned int v57 = objc_msgSend((id)objc_msgSend(v62, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v57 = 0;
  }
  _writeInt32IntoData(a3, v57);
  unsigned int v58 = [self->_flattenedSubentities count];
  _writeInt32IntoData(a3, v58);
  if (v58) {
    _writePFEncodedArrayShapeIntoData(a3, self->_flattenedSubentities, v53, 0);
  }
  _writeInt32IntoData(a3, self->_modelsReferenceIDForEntity);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v51, "objectForKey:", -[NSDictionary mapping](-[NSEntityDescription attributesByName](self, "attributesByName"), "mapping")), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v51, "objectForKey:", -[NSDictionary mapping](-[NSEntityDescription relationshipsByName](self, "relationshipsByName"), "mapping")), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, 0xDAEDFEEB);
  unsigned int v63 = bswap32([a3 length] - v52);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v52, 4, &v63);
}

@end