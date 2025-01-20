@interface HKListUserDomainConcept
+ (BOOL)supportsSecureCoding;
+ (id)_typeIdentifier;
- (BOOL)canRequestSyncUponInsertion;
- (BOOL)unitTesting_isIdentical:(id)a3;
- (BOOL)unitTesting_isIdentical:(id)a3 ignoreModificationTimestamp:(BOOL)a4;
- (HKListUserDomainConcept)init;
- (HKListUserDomainConcept)initWithCoder:(id)a3;
- (HKListUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5;
- (HKListUserDomainConcept)initWithListType:(unint64_t)a3;
- (HKListUserDomainConcept)initWithListType:(unint64_t)a3 listName:(id)a4;
- (NSString)listName;
- (id)_currentLinkCollection;
- (id)_dataDescription;
- (id)_deepCopy;
- (id)listByAddingUserDomainConcept:(id)a3;
- (id)listByAddingUserDomainConcepts:(id)a3;
- (id)listByExchangingConceptAtIndex:(unint64_t)a3 withIndex:(unint64_t)a4;
- (id)listByInsertingUserDomainConcept:(id)a3 atIndex:(unint64_t)a4;
- (id)listByMovingUserDomainConceptFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (id)listByRemovingAllUserDomainConcepts;
- (id)listByRemovingUserDomainConcept:(id)a3;
- (id)listByRemovingUserDomainConceptAtIndex:(unint64_t)a3;
- (id)listByReplacingConceptAtIndex:(unint64_t)a3 withUserDomainConcept:(id)a4;
- (id)listByUpdatingName:(id)a3;
- (id)semanticIdentifier;
- (unint64_t)listType;
- (void)_setListName:(id)a3;
- (void)_setListType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKListUserDomainConcept

- (HKListUserDomainConcept)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKListUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"The -%@ method is not available on %@", v8, objc_opt_class() format];

  return 0;
}

- (HKListUserDomainConcept)initWithListType:(unint64_t)a3 listName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKListUserDomainConcept;
  uint64_t v7 = [(HKUserDomainConcept *)&v12 initWithCodingCollection:0 linkCollection:0 propertyCollection:0];
  v8 = v7;
  if (v7)
  {
    v7->_listType = a3;
    uint64_t v9 = [v6 copy];
    listName = v8->_listName;
    v8->_listName = (NSString *)v9;
  }
  return v8;
}

- (HKListUserDomainConcept)initWithListType:(unint64_t)a3
{
  return [(HKListUserDomainConcept *)self initWithListType:a3 listName:0];
}

- (id)listByUpdatingName:(id)a3
{
  id v4 = a3;
  v5 = [(HKUserDomainConcept *)self modificationCopy];
  [(HKListUserDomainConcept *)self _setListName:v4];

  return v5;
}

- (id)_deepCopy
{
  v6.receiver = self;
  v6.super_class = (Class)HKListUserDomainConcept;
  v3 = [(HKUserDomainConcept *)&v6 _deepCopy];
  id v4 = [(HKListUserDomainConcept *)self listName];
  [v3 _setListName:v4];

  objc_msgSend(v3, "_setListType:", -[HKListUserDomainConcept listType](self, "listType"));

  return v3;
}

- (id)_dataDescription
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = HKStringFromListUserDomainType(self->_listType);
  v5 = [v3 stringWithFormat:@"%@", v4];

  if (self->_listName) {
    [v5 appendFormat:@" \"%@\"", self->_listName];
  }
  objc_super v6 = [(HKUserDomainConcept *)self linkCollection];
  uint64_t v7 = [v6 count];

  if (v7 < 1)
  {
    [v5 appendString:@" (empty list)"];
  }
  else
  {
    v8 = [[HKTableFormatter alloc] initWithColumnTitles:&unk_1EECE6D98];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [(HKUserDomainConcept *)self linkCollection];
    uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v15 = [NSNumber numberWithInteger:v11 + i];
          v25[0] = v15;
          v16 = [v14 targetUUID];
          v25[1] = v16;
          v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
          [(HKTableFormatter *)v8 appendHeterogenousRow:v17];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        v11 += i;
      }
      while (v10);
    }

    [v5 appendString:@"\n"];
    v18 = [(HKTableFormatter *)v8 formattedTable];
    [v5 appendString:v18];
  }

  return v5;
}

+ (id)_typeIdentifier
{
  return +[HKUserDomainConceptTypeIdentifier listUserDomainConceptIdentifier];
}

- (id)semanticIdentifier
{
  v2 = [[HKListUserDomainConceptSemanticIdentifier alloc] initWithListType:self->_listType];

  return v2;
}

- (BOOL)canRequestSyncUponInsertion
{
  return self->_listType == 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKListUserDomainConcept;
  id v4 = a3;
  [(HKUserDomainConcept *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_listName, @"listName", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_listType forKey:@"listType"];
}

- (HKListUserDomainConcept)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listName"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"listType"];
  v9.receiver = self;
  v9.super_class = (Class)HKListUserDomainConcept;
  uint64_t v7 = [(HKUserDomainConcept *)&v9 initWithCoder:v4];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_listName, v5);
    v7->_listType = v6;
  }

  return v7;
}

- (id)listByAddingUserDomainConcept:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HKListUserDomainConcept *)self _currentLinkCollection];
  uint64_t v6 = [[HKUserDomainConceptLink alloc] initWithUserConcept:v4 type:1];

  uint64_t v7 = [v5 collectionByAppendingLink:v6];
  v8 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v7];

  return v8;
}

- (id)listByAddingUserDomainConcepts:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HKListUserDomainConcept *)self _currentLinkCollection];
  uint64_t v6 = objc_msgSend(v4, "hk_map:", &__block_literal_global_131);

  uint64_t v7 = [v5 collectionByAppendingLinks:v6];
  v8 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v7];

  return v8;
}

HKUserDomainConceptLink *__58__HKListUserDomainConcept_listByAddingUserDomainConcepts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HKUserDomainConceptLink alloc] initWithUserConcept:v2 type:1];

  return v3;
}

- (id)listByInsertingUserDomainConcept:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKListUserDomainConcept *)self _currentLinkCollection];
  v8 = [[HKUserDomainConceptLink alloc] initWithUserConcept:v6 type:1];

  objc_super v9 = [v7 collectionByInsertingLink:v8 atIndex:a4];
  uint64_t v10 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v9];

  return v10;
}

- (id)listByMovingUserDomainConceptFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  if (a3 == a4)
  {
    objc_super v5 = self;
  }
  else
  {
    v8 = [(HKListUserDomainConcept *)self _currentLinkCollection];
    objc_super v9 = [v8 collectionByMovingLinkFromIndex:a3 toIndex:a4];
    objc_super v5 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v9];
  }

  return v5;
}

- (id)listByRemovingUserDomainConceptAtIndex:(unint64_t)a3
{
  objc_super v5 = [(HKListUserDomainConcept *)self _currentLinkCollection];
  id v6 = [v5 collectionByRemovingLinkAtIndex:a3];
  uint64_t v7 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v6];

  return v7;
}

- (id)listByRemovingUserDomainConcept:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HKListUserDomainConcept *)self _currentLinkCollection];
  id v6 = [v4 UUID];

  uint64_t v7 = [v5 collectionByRemovingLinksWithTargetUUID:v6];

  v8 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v7];

  return v8;
}

- (id)listByRemovingAllUserDomainConcepts
{
  v3 = [(HKListUserDomainConcept *)self _currentLinkCollection];
  id v4 = [v3 collectionByRemovingAllLinks];
  objc_super v5 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v4];

  return v5;
}

- (id)listByReplacingConceptAtIndex:(unint64_t)a3 withUserDomainConcept:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HKListUserDomainConcept *)self _currentLinkCollection];
  v8 = [[HKUserDomainConceptLink alloc] initWithUserConcept:v6 type:1];

  objc_super v9 = [v7 collectionByReplacingLinkAtIndex:a3 withLink:v8];
  uint64_t v10 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v9];

  return v10;
}

- (id)listByExchangingConceptAtIndex:(unint64_t)a3 withIndex:(unint64_t)a4
{
  uint64_t v7 = [(HKListUserDomainConcept *)self _currentLinkCollection];
  v8 = [v7 collectionBySwappingLinksAtIndex:a3 otherIndex:a4];
  objc_super v9 = [(HKUserDomainConcept *)self userDomainConceptByReplacingLinks:v8];

  return v9;
}

- (void)_setListName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  listName = self->_listName;
  self->_listName = v4;

  MEMORY[0x1F41817F8](v4, listName);
}

- (void)_setListType:(unint64_t)a3
{
  self->_listType = a3;
}

- (id)_currentLinkCollection
{
  id v2 = [(HKUserDomainConcept *)self linkCollection];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_super v5 = [HKUserDomainConceptLinkCollection alloc];
    id v4 = [(HKUserDomainConceptLinkCollection *)v5 _initWithLinks:MEMORY[0x1E4F1CBF0]];
  }
  id v6 = v4;

  return v6;
}

- (BOOL)unitTesting_isIdentical:(id)a3
{
  return [(HKListUserDomainConcept *)self unitTesting_isIdentical:a3 ignoreModificationTimestamp:0];
}

- (BOOL)unitTesting_isIdentical:(id)a3 ignoreModificationTimestamp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v9 = [(HKUserDomainConcept *)self isEqual:v6]
    && (v11.receiver = self,
        v11.super_class = (Class)HKListUserDomainConcept,
        -[HKUserDomainConcept unitTesting_isIdentical:ignoreModificationTimestamp:](&v11, sel_unitTesting_isIdentical_ignoreModificationTimestamp_, v6, v4))&& ((listName = self->_listName, v8 = (NSString *)v6[15], listName == v8)|| v8 && -[NSString isEqual:](listName, "isEqual:"))&& self->_listType == v6[14];

  return v9;
}

- (unint64_t)listType
{
  return self->_listType;
}

- (NSString)listName
{
  return self->_listName;
}

- (void).cxx_destruct
{
}

@end