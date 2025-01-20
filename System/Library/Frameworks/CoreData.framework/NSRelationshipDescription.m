@interface NSRelationshipDescription
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_isRelationship;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndexed;
- (BOOL)isToMany;
- (NSData)versionHash;
- (NSDeleteRule)deleteRule;
- (NSEntityDescription)destinationEntity;
- (NSRelationshipDescription)init;
- (NSRelationshipDescription)initWithCoder:(id)a3;
- (NSRelationshipDescription)inverseRelationship;
- (NSUInteger)maxCount;
- (NSUInteger)minCount;
- (id)_initWithName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_propertyType;
- (void)_createCachesAndOptimizeState;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4 proxyContext:(id)a5;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDeleteRule:(NSDeleteRule)deleteRule;
- (void)setDestinationEntity:(NSEntityDescription *)destinationEntity;
- (void)setInverseRelationship:(NSRelationshipDescription *)inverseRelationship;
- (void)setMaxCount:(NSUInteger)maxCount;
- (void)setMinCount:(NSUInteger)minCount;
@end

@implementation NSRelationshipDescription

- (NSUInteger)maxCount
{
  return self->_maxCount;
}

- (unint64_t)_propertyType
{
  return 4;
}

- (void)_createCachesAndOptimizeState
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NSRelationshipDescription;
  [(NSPropertyDescription *)&v14 _createCachesAndOptimizeState];
  if (!self->_destinationEntity) {
    [(NSRelationshipDescription *)self setDestinationEntity:[(NSRelationshipDescription *)self destinationEntity]];
  }
  if (!self->_inverseRelationship) {
    [(NSRelationshipDescription *)self setInverseRelationship:[(NSRelationshipDescription *)self inverseRelationship]];
  }
  if (objc_msgSend(-[NSDictionary objectForKey:](-[NSPropertyDescription userInfo](self, "userInfo"), "objectForKey:", @"NSRelationshipDescriptionOrderKeyIndexOption"), "BOOLValue"))
  {
    if ([(NSRelationshipDescription *)self isToMany])
    {
      if ([(NSRelationshipDescription *)self isOrdered]) {
        return;
      }
      uint64_t v11 = *MEMORY[0x1E4F281F8];
      uint64_t v17 = *MEMORY[0x1E4F28588];
      v18 = @"Relationship is not ordered";
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v11, 1591, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v15[0] = @"unsupported relationship";
      v15[1] = v13;
      v16[0] = self;
      v16[1] = v12;
      v8 = (void *)MEMORY[0x1E4F1C9E8];
      v9 = v16;
      v10 = v15;
    }
    else
    {
      uint64_t v3 = *MEMORY[0x1E4F281F8];
      uint64_t v21 = *MEMORY[0x1E4F28588];
      v22[0] = @"Relationship is not a toMany";
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v3, 1591, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      uint64_t v7 = *MEMORY[0x1E4F28A50];
      v19[0] = @"unsupported relationship";
      v19[1] = v7;
      v20[0] = self;
      v20[1] = v4;
      v8 = (void *)MEMORY[0x1E4F1C9E8];
      v9 = v20;
      v10 = v19;
    }
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, @"Unsupported relationship type for ordered index", objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 2)));
  }
}

- (BOOL)isToMany
{
  return self->_maxCount != 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4 proxyContext:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v9 = [(NSRelationshipDescription *)self destinationEntity];
  v29.receiver = self;
  v29.super_class = (Class)NSRelationshipDescription;
  [(NSPropertyDescription *)&v29 _versionHash:data inStyle:a4];
  CC_SHA256_Update(&c, data, 0x20u);
  if (v9)
  {
    CFStringRef v10 = [(NSEntityDescription *)v9 name];
    if (v10)
    {
      uint64_t v11 = (__CFString *)v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (!CStringPtr) {
        CStringPtr = (const char *)[(__CFString *)v11 UTF8String];
      }
      CC_LONG v13 = strlen(CStringPtr);
      CC_SHA256_Update(&c, CStringPtr, v13);
    }
  }
  objc_super v14 = [(NSRelationshipDescription *)self inverseRelationship];
  if (v14)
  {
    v15 = v14;
    if (v14 != self || a4 == 1 && a5)
    {
      v16 = [(NSEntityDescription *)[(NSPropertyDescription *)self entity] superentity];
      uint64_t v17 = [(NSPropertyDescription *)self name];
      if (!v16) {
        goto LABEL_19;
      }
      uint64_t v18 = (uint64_t)v17;
      v19 = 0;
      do
      {
        id v20 = -[NSEntityDescription _relationshipNamed:](v16, v18);
        if (v20) {
          v19 = v20;
        }
        v16 = [(NSEntityDescription *)v16 superentity];
      }
      while (v16);
      if (a5 || !v19 || (uint64_t v21 = [v19 inverseRelationship], a4) || v19 != (void *)v21)
      {
LABEL_19:
        CFStringRef v22 = [(NSPropertyDescription *)v15 name];
        v23 = (__CFString *)v22;
        if (v22 && (v24 = CFStringGetCStringPtr(v22, 0x8000100u)) != 0
          || (v24 = (const char *)[(__CFString *)v23 UTF8String]) != 0)
        {
          CC_LONG v25 = strlen(v24);
          CC_SHA256_Update(&c, v24, v25);
        }
      }
    }
  }
  int maxCount = self->_maxCount;
  CC_SHA256_Update(&c, &maxCount, 4u);
  int maxCount = self->_minCount;
  CC_SHA256_Update(&c, &maxCount, 4u);
  BOOL v26 = [(NSRelationshipDescription *)self isOrdered];
  __int16 v27 = v26;
  if (v26) {
    CC_SHA256_Update(&c, &v27, 2u);
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
}

- (NSRelationshipDescription)inverseRelationship
{
  result = self->_inverseRelationship;
  if (!result)
  {
    if (self->_lazyInverseRelationshipName)
    {
      uint64_t v4 = [(NSRelationshipDescription *)self destinationEntity];
      lazyInverseRelationshipName = self->_lazyInverseRelationshipName;
      return (NSRelationshipDescription *)-[NSEntityDescription _relationshipNamed:](v4, (uint64_t)lazyInverseRelationshipName);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSRelationshipDescription)init
{
  return (NSRelationshipDescription *)[(NSRelationshipDescription *)self _initWithName:0];
}

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  v89.receiver = self;
  v89.super_class = (Class)NSRelationshipDescription;
  BOOL v11 = -[NSPropertyDescription _nonPredicateValidateValue:forKey:inObject:error:](&v89, sel__nonPredicateValidateValue_forKey_inObject_error_);
  if (v11)
  {
    if (!*a3) {
      goto LABEL_78;
    }
    v87 = a6;
    int v12 = [a5 isInserted];
    int v13 = [*a3 isFault];
    objc_super v14 = (void *)[a5 managedObjectContext];
    int v85 = [v14 _isSwiftBound];
    if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
    {
      if (![(NSRelationshipDescription *)self isToMany])
      {
        v15 = *a3;
        if (*a3)
        {
          if ((v15[16] & 0x24) != 0)
          {
            [a5 objectID];
            [v15 objectID];
            _NSCoreDataLog(4, @"repairing missing delete propagation for to-one relationship %@ on object %p (%@) with bad fault %p (%@)", v16, v17, v18, v19, v20, v21, (uint64_t)a4);
            if ([[(NSRelationshipDescription *)self inverseRelationship] deleteRule] == NSCascadeDeleteRule)
            {
              if (![a5 managedObjectContext]) {
                -[NSManagedObjectContext _forceRegisterLostFault:]([a5 managedObjectContext], a5);
              }
              objc_msgSend((id)objc_msgSend(a5, "managedObjectContext"), "deleteObject:", a5);
            }
            [a5 setValue:0 forKey:a4];
          }
          else
          {
            if (v85 && ![*a3 managedObjectContext]) {
              [v14 insertObject:v15];
            }
            if ((-[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v15) & 1) == 0)
            {
              v38 = v87;
              if (v87)
              {
                id v70 = *a3;
                v71 = (void *)MEMORY[0x1E4F1C9E8];
                uint64_t v72 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
                uint64_t v73 = [MEMORY[0x1E4F1CA98] null];
                uint64_t v43 = objc_msgSend(v71, "dictionaryWithObjectsAndKeys:", v72, @"NSAffectedObjectsErrorKey", v73, @"Dangling reference to an invalid object.", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSValidationErrorShouldAttemptRecoveryKey", 0);
                id v40 = a5;
                int v41 = 1550;
                id v42 = a4;
                id v39 = v70;
                goto LABEL_49;
              }
              goto LABEL_89;
            }
          }
        }
      }
    }
    if (![(NSRelationshipDescription *)self isToMany])
    {
      id v36 = *a3;
      v37 = [(NSRelationshipDescription *)self destinationEntity];
      if (!v36
        || !v37
        || ![(NSEntityDescription *)v37 _subentitiesIncludes:_PFEntityForManagedObject(v36)])
      {
        goto LABEL_46;
      }
LABEL_78:
      LOBYTE(v11) = 1;
      return v11;
    }
    if (!-[NSRelationshipDescription isOrdered](self, "isOrdered") && ([*a3 isNSSet] & 1) == 0
      || (id v82 = v14, [(NSRelationshipDescription *)self isOrdered])
      && ([*a3 isNSOrderedSet] & 1) == 0)
    {
      v74 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v75 = *MEMORY[0x1E4F1C3B8];
      uint64_t v76 = objc_msgSend(NSString, "stringWithFormat:", @"Illegal container for relationship: value = %@; relationship = \"%@\".",
              *a3,
              a4);
      objc_exception_throw((id)objc_msgSend(v74, "exceptionWithName:reason:userInfo:", v75, v76, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", *a3, a4)));
    }
    BOOL v83 = [(NSPropertyDescription *)self isOptional];
    if (!self) {
      goto LABEL_46;
    }
    id v22 = *a3;
    v23 = [(NSRelationshipDescription *)self destinationEntity];
    if (([v22 isFault] & 1) == 0)
    {
      if ([v22 count])
      {
        long long v92 = 0u;
        long long v93 = 0u;
        long long v91 = 0u;
        long long v90 = 0u;
        uint64_t v24 = [v22 countByEnumeratingWithState:&v90 objects:v94 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          BOOL v26 = *(char **)v91;
          v88 = *(char **)v91;
LABEL_26:
          uint64_t v27 = 0;
          while (1)
          {
            if (*(char **)v91 != v26) {
              objc_enumerationMutation(v22);
            }
            if (!v23) {
              break;
            }
            v28 = *(void **)(*((void *)&v90 + 1) + 8 * v27);
            if (!v28
              || ![(NSEntityDescription *)v23 _subentitiesIncludes:_PFEntityForManagedObject(v28)])
            {
              break;
            }
            ++v27;
            BOOL v26 = v88;
            if (v25 == v27)
            {
              uint64_t v25 = [v22 countByEnumeratingWithState:&v90 objects:v94 count:16];
              BOOL v26 = v88;
              if (v25) {
                goto LABEL_26;
              }
              goto LABEL_34;
            }
          }
LABEL_46:
          v38 = v87;
          if (v87)
          {
            id v39 = *a3;
            id v40 = a5;
            int v41 = 1550;
LABEL_48:
            id v42 = a4;
            uint64_t v43 = 0;
LABEL_49:
            uint64_t v44 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)v40, v41, 0, (uint64_t)v42, (uint64_t)v39, v43);
            LOBYTE(v11) = 0;
            void *v38 = v44;
            return v11;
          }
          goto LABEL_89;
        }
      }
    }
LABEL_34:
    BOOL v29 = v83;
    LOBYTE(v11) = 1;
    if ((v83 & v13) != 1 && v12 | v13 ^ 1)
    {
      if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      {
        id v30 = *a3;
        uint64_t v31 = [*a3 count];
        if (v31)
        {
          unint64_t v32 = v31;
          NSDeleteRule v84 = [[(NSRelationshipDescription *)self inverseRelationship] deleteRule];
          BOOL v81 = [(NSRelationshipDescription *)self isOrdered];
          uint64_t v79 = (uint64_t)&v79;
          uint64_t v33 = v32 >= 0x201 ? 1 : v32;
          unint64_t v34 = (8 * v33 + 15) & 0xFFFFFFFFFFFFFFF0;
          v35 = (char *)&v79 - v34;
          if (v32 > 0x200) {
            v35 = (char *)NSAllocateScannedUncollectable();
          }
          else {
            bzero((char *)&v79 - v34, 8 * v32);
          }
          v88 = v35;
          objc_msgSend(v30, "getObjects:", v35, v79);
          uint64_t v45 = 0;
          v46 = 0;
          char v47 = 1;
          v80 = @"NSAffectedObjectsErrorKey";
          v48 = v87;
          unint64_t v86 = v32;
          do
          {
            v49 = *(unsigned char **)&v88[8 * v45];
            if (v49 && (v49[16] & 0x24) != 0)
            {
              [a5 objectID];
              [v49 objectID];
              _NSCoreDataLog(4, @"repairing missing delete propagation for to-many relationship %@ on object %p (%@) with bad fault %p (%@)", v50, v51, v52, v53, v54, v55, (uint64_t)a4);
              if (v84 == NSCascadeDeleteRule)
              {
                if (![a5 managedObjectContext]) {
                  -[NSManagedObjectContext _forceRegisterLostFault:]([a5 managedObjectContext], a5);
                }
                objc_msgSend((id)objc_msgSend(a5, "managedObjectContext"), "deleteObject:", a5);
              }
              unint64_t v32 = v86;
              if (!v46)
              {
                if (v81) {
                  uint64_t v56 = [a5 mutableOrderedSetValueForKey:a4];
                }
                else {
                  uint64_t v56 = [a5 mutableSetValueForKey:a4];
                }
                v46 = (void *)v56;
              }
              [v46 removeObject:v49];
            }
            else
            {
              if (v85 && ![v49 managedObjectContext]) {
                [v82 insertObject:v49];
              }
              char isValidRelationshipDestination = -[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v49);
              v47 &= isValidRelationshipDestination;
              if (v48 && (isValidRelationshipDestination & 1) == 0)
              {
                id v58 = *a3;
                v59 = (void *)MEMORY[0x1E4F1C9E8];
                uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObject:v49];
                uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
                uint64_t v62 = [NSNumber numberWithBool:1];
                uint64_t v78 = v61;
                v48 = v87;
                uint64_t v63 = objc_msgSend(v59, "dictionaryWithObjectsAndKeys:", v60, v80, v78, @"Dangling reference to an invalid object.", v62, @"NSValidationErrorShouldAttemptRecoveryKey", 0);
                uint64_t v64 = (uint64_t)v58;
                unint64_t v32 = v86;
                char v47 = 0;
                void *v48 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]((uint64_t)a5, 1550, 0, (uint64_t)a4, v64, v63);
              }
            }
            ++v45;
          }
          while (v32 != v45);
          if (v32 >= 0x201) {
            NSZoneFree(0, v88);
          }
          BOOL v29 = v83;
          if ((v47 & 1) == 0) {
            goto LABEL_89;
          }
        }
      }
      NSUInteger v65 = [(NSRelationshipDescription *)self minCount];
      NSUInteger v66 = [(NSRelationshipDescription *)self maxCount];
      unint64_t v67 = [*a3 count];
      if (v67) {
        BOOL v68 = 0;
      }
      else {
        BOOL v68 = v29;
      }
      if (v68) {
        goto LABEL_78;
      }
      NSUInteger v69 = v67;
      if (v65 && v67 < v65)
      {
        v38 = v87;
        if (v87)
        {
          id v39 = *a3;
          id v40 = a5;
          int v41 = 1580;
          goto LABEL_48;
        }
LABEL_89:
        LOBYTE(v11) = 0;
        return v11;
      }
      LOBYTE(v11) = 1;
      if (v66 && v69 > v66)
      {
        v38 = v87;
        if (v87)
        {
          id v39 = *a3;
          id v40 = a5;
          int v41 = 1590;
          goto LABEL_48;
        }
        goto LABEL_89;
      }
    }
  }
  return v11;
}

- (NSEntityDescription)destinationEntity
{
  result = self->_destinationEntity;
  if (!result)
  {
    if (self->_lazyDestinationEntityName)
    {
      result = [(NSEntityDescription *)[(NSPropertyDescription *)self entity] managedObjectModel];
      if (result)
      {
        lazyDestinationEntityName = self->_lazyDestinationEntityName;
        id versionHash = result->_versionHash;
        return (NSEntityDescription *)[versionHash objectForKey:lazyDestinationEntityName];
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSUInteger)minCount
{
  return self->_minCount;
}

- (NSDeleteRule)deleteRule
{
  return self->_deleteRule;
}

- (BOOL)_isRelationship
{
  return 1;
}

- (id)_initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NSRelationshipDescription;
  id result = [(NSPropertyDescription *)&v4 _initWithName:a3];
  if (result)
  {
    *((void *)result + 17) = 0;
    *((void *)result + 16) = 0;
    *((void *)result + 18) = 1;
  }
  return result;
}

- (void)setDestinationEntity:(NSEntityDescription *)destinationEntity
{
  self->_destinationEntity = destinationEntity;

  self->_lazyDestinationEntityName = 0;
}

- (void)setInverseRelationship:(NSRelationshipDescription *)inverseRelationship
{
  self->_inverseRelationship = inverseRelationship;

  self->_lazyInverseRelationshipName = 0;
}

- (void)setMaxCount:(NSUInteger)maxCount
{
  unsigned int v3 = maxCount;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  self->_int maxCount = v3;
}

- (void)setMinCount:(NSUInteger)minCount
{
  unsigned int v3 = minCount;
  [(NSPropertyDescription *)self _throwIfNotEditable];
  self->_minCount = v3;
}

- (void)setDeleteRule:(NSDeleteRule)deleteRule
{
  self->_deleteRule = deleteRule;
}

- (void)dealloc
{
  self->_destinationEntity = 0;

  self->_lazyDestinationEntityName = 0;
  self->_inverseRelationship = 0;

  self->_lazyInverseRelationshipName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSRelationshipDescription;
  [(NSPropertyDescription *)&v3 dealloc];
}

+ (void)initialize
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NSRelationshipDescription;
  objc_super v4 = [(NSPropertyDescription *)&v11 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    v4[16] = self->_maxCount;
    v4[17] = self->_minCount;
    v4[18] = self->_deleteRule;
    destinationEntity = self->_destinationEntity;
    if (destinationEntity) {
      uint64_t v7 = [(NSString *)[(NSEntityDescription *)destinationEntity name] copy];
    }
    else {
      uint64_t v7 = [(NSString *)self->_lazyDestinationEntityName copy];
    }
    v5[13] = v7;
    inverseRelationship = self->_inverseRelationship;
    if (inverseRelationship) {
      uint64_t v9 = [(NSString *)[(NSPropertyDescription *)inverseRelationship name] copy];
    }
    else {
      uint64_t v9 = [(NSString *)self->_lazyInverseRelationshipName copy];
    }
    v5[15] = v9;
  }
  return v5;
}

- (NSRelationshipDescription)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)NSRelationshipDescription;
  objc_super v4 = -[NSPropertyDescription initWithCoder:](&v19, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    uint64_t v16 = __43__NSRelationshipDescription_initWithCoder___block_invoke;
    uint64_t v17 = &unk_1E544B868;
    uint64_t v18 = v5;
    v4->_int maxCount = (int)[a3 decodeIntForKey:@"NSMaxCount"];
    v4->_minCount = (int)[a3 decodeIntForKey:@"NSMinCount"];
    v4->_deleteRule = (int)[a3 decodeIntForKey:@"NSDeleteRule"];
    v4->_destinationEntity = (NSEntityDescription *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSDestinationEntity"];
    uint64_t v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_NSDestinationEntityName"];
    if (!v4->_destinationEntity)
    {
      CFStringRef v10 = v6;
      if (v6 && ([v6 isNSString] & 1) == 0)
      {
        uint64_t v9 = &unk_1ED7E2208;
        goto LABEL_30;
      }
      v4->_lazyDestinationEntityName = (NSString *)[v10 copy];
      goto LABEL_14;
    }
    if (v5) {
      uint64_t v7 = (void *)v5[3];
    }
    else {
      uint64_t v7 = 0;
    }
    objc_msgSend(v7, "addObject:");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = &unk_1ED7E2230;
      goto LABEL_30;
    }
    if (v5)
    {
      if (v5[1]) {
        goto LABEL_14;
      }
      v8 = (NSEntityDescription *)v5[2];
    }
    else
    {
      v8 = 0;
    }
    if (v4->_destinationEntity != v8)
    {
      uint64_t v9 = &unk_1ED7E2258;
      goto LABEL_30;
    }
LABEL_14:
    v4->_inverseRelationship = (NSRelationshipDescription *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSInverseRelationship"];
    objc_super v11 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_NSInverseRelationshipName"];
    if (v4->_inverseRelationship)
    {
      if (v5) {
        int v12 = (void *)v5[3];
      }
      else {
        int v12 = 0;
      }
      objc_msgSend(v12, "addObject:");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v5 && (v5[1] || v5[2]) || v4->_inverseRelationship == v4) {
          goto LABEL_31;
        }
        uint64_t v9 = &unk_1ED7E22D0;
      }
      else
      {
        uint64_t v9 = &unk_1ED7E22A8;
      }
    }
    else
    {
      int v13 = v11;
      if (!v11 || ([v11 isNSString] & 1) != 0)
      {
        v4->_lazyInverseRelationshipName = (NSString *)[v13 copy];
LABEL_31:
        v16((uint64_t)v15);
        return v4;
      }
      uint64_t v9 = &unk_1ED7E2280;
    }
LABEL_30:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, v9));

    objc_super v4 = 0;
    goto LABEL_31;
  }
  return v4;
}

void __43__NSRelationshipDescription_initWithCoder___block_invoke(uint64_t a1)
{
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSRelationshipDescription;
  id v5 = -[NSPropertyDescription encodeWithCoder:](&v9, sel_encodeWithCoder_);
  uint64_t v6 = (void *)MEMORY[0x18C127630](v5);
  objc_msgSend(a3, "encodeInt:forKey:", -[NSRelationshipDescription maxCount](self, "maxCount"), @"NSMaxCount");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSRelationshipDescription minCount](self, "minCount"), @"NSMinCount");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSRelationshipDescription deleteRule](self, "deleteRule"), @"NSDeleteRule");
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSRelationshipDescription destinationEntity](self, "destinationEntity"), @"NSDestinationEntity");
  if ([(NSRelationshipDescription *)self destinationEntity]) {
    lazyDestinationEntityName = [(NSEntityDescription *)[(NSRelationshipDescription *)self destinationEntity] name];
  }
  else {
    lazyDestinationEntityName = self->_lazyDestinationEntityName;
  }
  [a3 encodeObject:lazyDestinationEntityName forKey:@"_NSDestinationEntityName"];
  objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"), @"NSInverseRelationship");
  if ([(NSRelationshipDescription *)self inverseRelationship]) {
    lazyInverseRelationshipName = [(NSPropertyDescription *)[(NSRelationshipDescription *)self inverseRelationship] name];
  }
  else {
    lazyInverseRelationshipName = self->_lazyInverseRelationshipName;
  }
  [a3 encodeObject:lazyInverseRelationshipName forKey:@"_NSInverseRelationshipName"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v20 = v3;
    uint64_t v21 = v4;
    v19.receiver = self;
    v19.super_class = (Class)NSRelationshipDescription;
    LODWORD(v7) = -[NSPropertyDescription isEqual:](&v19, sel_isEqual_);
    if (v7)
    {
      NSUInteger v8 = [(NSRelationshipDescription *)self maxCount];
      if (v8 == [a3 maxCount]
        && (NSUInteger v9 = -[NSRelationshipDescription minCount](self, "minCount"), v9 == [a3 minCount])
        && (NSDeleteRule v10 = -[NSRelationshipDescription deleteRule](self, "deleteRule"), v10 == [a3 deleteRule])
        && (int v11 = [(NSRelationshipDescription *)self isOrdered],
            v11 == [a3 isOrdered]))
      {
        int v12 = (NSString *)objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name");
        uint64_t v7 = [(NSEntityDescription *)[(NSRelationshipDescription *)self destinationEntity] name];
        if (v12 == v7
          || (int v13 = v7, LOBYTE(v7) = 0, v12) && v13 && (LODWORD(v7) = -[NSString isEqual:](v12, "isEqual:"), v7))
        {
          objc_super v14 = [(NSRelationshipDescription *)self inverseRelationship];
          v15 = (void *)[a3 inverseRelationship];
          uint64_t v16 = [(NSPropertyDescription *)v14 name];
          uint64_t v7 = (NSString *)[v15 name];
          if (v16 == v7)
          {
            LOBYTE(v7) = 1;
          }
          else
          {
            uint64_t v17 = v7;
            LOBYTE(v7) = 0;
            if (v16 && v17) {
              LOBYTE(v7) = -[NSString isEqual:](v16, "isEqual:");
            }
          }
        }
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
  }
  return (char)v7;
}

- (BOOL)_isSchemaEqual:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NSRelationshipDescription;
  LODWORD(v5) = -[NSPropertyDescription isEqual:](&v13, sel_isEqual_);
  if (v5)
  {
    NSUInteger v6 = [(NSRelationshipDescription *)self maxCount];
    if (v6 == [a3 maxCount]
      && (NSUInteger v7 = -[NSRelationshipDescription minCount](self, "minCount"), v7 == [a3 minCount])
      && (NSDeleteRule v8 = -[NSRelationshipDescription deleteRule](self, "deleteRule"), v8 == [a3 deleteRule])
      && (int v9 = [(NSRelationshipDescription *)self isOrdered],
          v9 == [a3 isOrdered]))
    {
      NSDeleteRule v10 = (NSString *)objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name");
      id v5 = [(NSEntityDescription *)[(NSRelationshipDescription *)self destinationEntity] name];
      if (v10 == v5)
      {
        LOBYTE(v5) = 1;
      }
      else
      {
        int v11 = v5;
        LOBYTE(v5) = 0;
        if (v10 && v11) {
          LOBYTE(v5) = -[NSString isEqual:](v10, "isEqual:");
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSRelationshipDescription;
  return (id)[NSString stringWithFormat:@"%@, destination entity %@, inverseRelationship %@, minCount %lu, maxCount %lu, isOrdered %d, deleteRule %lu", -[NSPropertyDescription description](&v3, sel_description), -[NSEntityDescription name](-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name"), -[NSPropertyDescription name](-[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"), "name"), -[NSRelationshipDescription minCount](self, "minCount"), -[NSRelationshipDescription maxCount](self, "maxCount"), -[NSRelationshipDescription isOrdered](self, "isOrdered"), -[NSRelationshipDescription deleteRule](self, "deleteRule")];
}

- (BOOL)isIndexed
{
  return 1;
}

- (NSData)versionHash
{
  v3.receiver = self;
  v3.super_class = (Class)NSRelationshipDescription;
  return [(NSPropertyDescription *)&v3 versionHash];
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  _writeInt32IntoData(a3, 0);
  uint64_t v16 = [a3 length];
  v22.receiver = self;
  v22.super_class = (Class)NSRelationshipDescription;
  [(NSPropertyDescription *)&v22 _appendPropertyFieldsToData:a3 propertiesDict:a4 uniquedPropertyNames:a5 uniquedStrings:a6 uniquedData:a7 entitiesSlots:a8];
  _writeInt32IntoData(a3, objc_msgSend(a8, "indexForKey:", -[NSEntityDescription name](-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name")));
  uint64_t v17 = [(NSRelationshipDescription *)self inverseRelationship];
  if (v17)
  {
    uint64_t v18 = v17;
    _writeInt32IntoData(a3, 1u);
    unsigned int v19 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v18), "unsignedIntegerValue");
  }
  else
  {
    unsigned int v19 = 0;
  }
  _writeInt32IntoData(a3, v19);
  uint64_t v20 = v16 - 4;
  _writeInt32IntoData(a3, self->_maxCount);
  _writeInt32IntoData(a3, self->_minCount);
  _writeInt32IntoData(a3, self->_deleteRule);
  unsigned int v21 = bswap32([a3 length] - v20);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v20, 4, &v21);
}

@end