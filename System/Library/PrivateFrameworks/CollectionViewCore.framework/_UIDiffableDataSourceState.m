@interface _UIDiffableDataSourceState
- (BOOL)containsItemIdentifier:(id)a3;
- (BOOL)containsSectionIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)itemIdentifiers;
- (NSArray)sectionIdentifiers;
- (NSOrderedSet)guaranteedPerformanceIdentifiers;
- (NSOrderedSet)guaranteedPerformanceSections;
- (NSOrderedSet)identifiers;
- (NSOrderedSet)sections;
- (NSString)description;
- (NSUUID)generationID;
- (_UICollectionDataSourceSnapshotTranslating)dataSourceSnapshot;
- (_UIDiffableDataSourceState)init;
- (_UIDiffableDataSourceState)initWithGenerationID:(id)a3 identifiers:(id)a4 sections:(id)a5 dataSourceSnapshot:(id)a6;
- (_UIDiffableDataSourceState)initWithGenerationID:(id)a3 identifiers:(id)a4 sections:(id)a5 dataSourceSnapshot:(id)a6 identifiersHaveGuaranteedPerformance:(BOOL)a7 sectionsHaveGuaranteedPerformance:(BOOL)a8;
- (_UIDiffableDataSourceState)initWithState:(id)a3;
- (_UIDiffableDataSourceState)initWithStateAdvancingGenerationID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForItemIdentifier:(id)a3;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)sectionIdentifierForIndex:(int64_t)a3;
- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3;
- (id)sectionIndexesForItemIndexRange:(_NSRange)a3;
- (int64_t)indexOfItemIdentifier:(id)a3;
- (int64_t)indexOfSectionIdentifier:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInSection:(id)a3;
- (int64_t)numberOfSections;
- (void)ensureOrderedSetsHaveGuaranteedPerformance;
- (void)validateIdentifiers;
- (void)willBecomeWiredToDataSource;
@end

@implementation _UIDiffableDataSourceState

- (NSArray)sectionIdentifiers
{
  return [(NSOrderedSet *)self->_sections array];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guaranteedPerformanceSections, 0);
  objc_storeStrong((id *)&self->_guaranteedPerformanceIdentifiers, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
}

- (_UIDiffableDataSourceState)initWithGenerationID:(id)a3 identifiers:(id)a4 sections:(id)a5 dataSourceSnapshot:(id)a6 identifiersHaveGuaranteedPerformance:(BOOL)a7 sectionsHaveGuaranteedPerformance:(BOOL)a8
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceState.m", 142, @"Invalid parameter not satisfying: %@", @"generationID" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
LABEL_21:
      v33 = [MEMORY[0x263F08690] currentHandler];
      [v33 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceState.m", 144, @"Invalid parameter not satisfying: %@", @"sections" object file lineNumber description];

      if (v19) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }
  v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceState.m", 143, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

  if (!v18) {
    goto LABEL_21;
  }
LABEL_4:
  if (v19) {
    goto LABEL_5;
  }
LABEL_22:
  v34 = [MEMORY[0x263F08690] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceState.m", 145, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot" object file lineNumber description];

LABEL_5:
  uint64_t v20 = [v18 count];
  if (v20 != [v19 numberOfSections])
  {
    _UIDiffableDataSourceValidateIdentifiers(v18, 0);
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceState.m", 158, @"Section identifier count does not match data source count. This is most likely caused by section identifiers improperly implementing hashing: identifiers that compare as equal must return the same hash value, and the hash value of an identifier should never change once added to diffable." object file lineNumber description];
  }
  uint64_t v21 = [v17 count];
  if (v21 != [v19 numberOfItems])
  {
    _UIDiffableDataSourceValidateIdentifiers(v17, 1);
    v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceState.m", 162, @"Item identifier count does not match data source count. This is most likely caused by item identifiers improperly implementing hashing: identifiers that compare as equal must return the same hash value, and the hash value of an identifier should never change once added to diffable." object file lineNumber description];
  }
  v37.receiver = self;
  v37.super_class = (Class)_UIDiffableDataSourceState;
  v22 = [(_UIDiffableDataSourceState *)&v37 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_generationID, a3);
    uint64_t v24 = [v17 copy];
    identifiers = v23->_identifiers;
    v23->_identifiers = (NSOrderedSet *)v24;

    uint64_t v26 = [v18 copy];
    sections = v23->_sections;
    v23->_sections = (NSOrderedSet *)v26;

    uint64_t v28 = +[_UIDataSourceSnapshotter snapshotterForSnapshot:v19];
    dataSourceSnapshot = v23->_dataSourceSnapshot;
    v23->_dataSourceSnapshot = (_UICollectionDataSourceSnapshotTranslating *)v28;

    if (a7
      || [(NSOrderedSet *)v23->_identifiers count] < 0xB
      || CVCIs__NSOrderedSetI(v23->_identifiers))
    {
      objc_storeStrong((id *)&v23->_guaranteedPerformanceIdentifiers, v23->_identifiers);
    }
    if (a8
      || [(NSOrderedSet *)v23->_sections count] < 0xB
      || CVCIs__NSOrderedSetI(v23->_sections))
    {
      objc_storeStrong((id *)&v23->_guaranteedPerformanceSections, v23->_sections);
    }
  }

  return v23;
}

- (NSArray)itemIdentifiers
{
  return [(NSOrderedSet *)self->_identifiers array];
}

- (void)willBecomeWiredToDataSource
{
  self->_identifierLookupCount = -1;
  self->_sectionLookupCount = -1;
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceState.m", 297, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  int64_t v6 = [(_UIDiffableDataSourceState *)self indexOfItemIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v7 = [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot sectionForGlobalIndex:v6], v7 == 0x7FFFFFFFFFFFFFFFLL)|| (v8 = v7, v7 >= [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot numberOfSections]))
  {
    v9 = 0;
  }
  else
  {
    v9 = [(NSOrderedSet *)self->_sections objectAtIndexedSubscript:v8];
  }

  return v9;
}

- (id)indexPathForItemIdentifier:(id)a3
{
  int64_t v4 = [(_UIDiffableDataSourceState *)self indexOfItemIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot indexPathForGlobalIndex:v4];
  }
  return v5;
}

- (int64_t)indexOfItemIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t identifierLookupCount = self->_identifierLookupCount;
    if (identifierLookupCount >= 0xA)
    {
      if (!self->_guaranteedPerformanceIdentifiers)
      {
        unint64_t v7 = (NSOrderedSet *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:self->_identifiers];
        guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
        self->_guaranteedPerformanceIdentifiers = v7;
      }
    }
    else
    {
      self->_unint64_t identifierLookupCount = identifierLookupCount + 1;
    }
    identifiers = self->_guaranteedPerformanceIdentifiers;
    if (!identifiers) {
      identifiers = self->_identifiers;
    }
    int64_t v6 = [(NSOrderedSet *)identifiers indexOfObject:v4];
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)sectionIdentifierForIndex:(int64_t)a3
{
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL)
  {
    int64_t v6 = 0;
  }
  else
  {
    if ([(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot numberOfSections] <= a3)
    {
      int64_t v6 = 0;
    }
    else
    {
      int64_t v6 = [(NSOrderedSet *)self->_sections objectAtIndexedSubscript:a3];
    }
  }
  return v6;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  uint64_t v4 = [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot globalIndexForIndexPath:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSOrderedSet *)self->_identifiers objectAtIndexedSubscript:v4];
  }
  return v5;
}

- (_UIDiffableDataSourceState)initWithStateAdvancingGenerationID:(id)a3
{
  id v4 = a3;
  int HaveGuaranteedPerformanceBeforeCopyingState = _ensureOrderedSetsHaveGuaranteedPerformanceBeforeCopyingState(v4);
  int64_t v6 = [MEMORY[0x263F08C38] UUID];
  unint64_t v7 = [v4 identifiers];
  unint64_t v8 = [v4 sections];
  v9 = [v4 dataSourceSnapshot];
  v10 = [(_UIDiffableDataSourceState *)self initWithGenerationID:v6 identifiers:v7 sections:v8 dataSourceSnapshot:v9];

  if (v10 && HaveGuaranteedPerformanceBeforeCopyingState)
  {
    uint64_t v11 = [v4 guaranteedPerformanceIdentifiers];
    guaranteedPerformanceIdentifiers = v10->_guaranteedPerformanceIdentifiers;
    v10->_guaranteedPerformanceIdentifiers = (NSOrderedSet *)v11;

    uint64_t v13 = [v4 guaranteedPerformanceSections];
    guaranteedPerformanceSections = v10->_guaranteedPerformanceSections;
    v10->_guaranteedPerformanceSections = (NSOrderedSet *)v13;
  }
  return v10;
}

- (_UIDiffableDataSourceState)initWithState:(id)a3
{
  id v4 = a3;
  int HaveGuaranteedPerformanceBeforeCopyingState = _ensureOrderedSetsHaveGuaranteedPerformanceBeforeCopyingState(v4);
  int64_t v6 = [v4 generationID];
  unint64_t v7 = [v4 identifiers];
  unint64_t v8 = [v4 sections];
  v9 = [v4 dataSourceSnapshot];
  v10 = [(_UIDiffableDataSourceState *)self initWithGenerationID:v6 identifiers:v7 sections:v8 dataSourceSnapshot:v9];

  if (v10 && HaveGuaranteedPerformanceBeforeCopyingState)
  {
    uint64_t v11 = [v4 guaranteedPerformanceIdentifiers];
    guaranteedPerformanceIdentifiers = v10->_guaranteedPerformanceIdentifiers;
    v10->_guaranteedPerformanceIdentifiers = (NSOrderedSet *)v11;

    uint64_t v13 = [v4 guaranteedPerformanceSections];
    guaranteedPerformanceSections = v10->_guaranteedPerformanceSections;
    v10->_guaranteedPerformanceSections = (NSOrderedSet *)v13;
  }
  return v10;
}

- (_UICollectionDataSourceSnapshotTranslating)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (NSOrderedSet)sections
{
  if (self->_sectionLookupCount >= 0xA && !self->_guaranteedPerformanceSections)
  {
    uint64_t v3 = (NSOrderedSet *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:self->_sections];
    guaranteedPerformanceSections = self->_guaranteedPerformanceSections;
    self->_guaranteedPerformanceSections = v3;
  }
  sections = self->_guaranteedPerformanceSections;
  if (!sections) {
    sections = self->_sections;
  }
  return sections;
}

- (NSOrderedSet)identifiers
{
  if (self->_identifierLookupCount >= 0xA && !self->_guaranteedPerformanceIdentifiers)
  {
    uint64_t v3 = (NSOrderedSet *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:self->_identifiers];
    guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
    self->_guaranteedPerformanceIdentifiers = v3;
  }
  identifiers = self->_guaranteedPerformanceIdentifiers;
  if (!identifiers) {
    identifiers = self->_identifiers;
  }
  return identifiers;
}

- (NSUUID)generationID
{
  return self->_generationID;
}

- (_UIDiffableDataSourceState)initWithGenerationID:(id)a3 identifiers:(id)a4 sections:(id)a5 dataSourceSnapshot:(id)a6
{
  return [(_UIDiffableDataSourceState *)self initWithGenerationID:a3 identifiers:a4 sections:a5 dataSourceSnapshot:a6 identifiersHaveGuaranteedPerformance:0 sectionsHaveGuaranteedPerformance:0];
}

- (void)ensureOrderedSetsHaveGuaranteedPerformance
{
  if (!self->_guaranteedPerformanceIdentifiers)
  {
    uint64_t v3 = (NSOrderedSet *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:self->_identifiers];
    guaranteedPerformanceIdentifiers = self->_guaranteedPerformanceIdentifiers;
    self->_guaranteedPerformanceIdentifiers = v3;
  }
  if (!self->_guaranteedPerformanceSections)
  {
    self->_guaranteedPerformanceSections = (NSOrderedSet *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:self->_sections];
    MEMORY[0x270F9A758]();
  }
}

- (NSOrderedSet)guaranteedPerformanceSections
{
  return self->_guaranteedPerformanceSections;
}

- (NSOrderedSet)guaranteedPerformanceIdentifiers
{
  return self->_guaranteedPerformanceIdentifiers;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceState.m", 278, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];
  }
  int64_t v6 = [(_UIDiffableDataSourceState *)self indexOfSectionIdentifier:v5];
  if ((dyld_program_sdk_at_least() & 1) == 0 && v6 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_9;
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSourceState.m" lineNumber:286 description:@"Section identifier was not found. You can verify the section exists by calling the indexOfSectionIdentifier API (which has O(1) performance)"];
  }
  uint64_t v7 = [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot rangeForSection:v6];
  if (v8)
  {
    uint64_t v9 = v7;
    uint64_t v10 = v8;
    uint64_t v11 = [(NSOrderedSet *)self->_identifiers array];
    v12 = objc_msgSend(v11, "subarrayWithRange:", v9, v10);
  }
  else
  {
LABEL_9:
    v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  int64_t v5 = [(_UIDiffableDataSourceState *)self indexOfSectionIdentifier:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSourceState.m" lineNumber:273 description:@"Section identifier was not found. You can verify the section exists by calling the indexOfSectionIdentifier API (which has O(1) performance)"];
  }
  dataSourceSnapshot = self->_dataSourceSnapshot;
  return [(_UICollectionDataSourceSnapshotTranslating *)dataSourceSnapshot numberOfItemsInSection:v5];
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t sectionLookupCount = self->_sectionLookupCount;
    if (sectionLookupCount >= 0xA)
    {
      if (!self->_guaranteedPerformanceSections)
      {
        uint64_t v7 = (NSOrderedSet *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:self->_sections];
        guaranteedPerformanceSections = self->_guaranteedPerformanceSections;
        self->_guaranteedPerformanceSections = v7;
      }
    }
    else
    {
      self->_unint64_t sectionLookupCount = sectionLookupCount + 1;
    }
    sections = self->_guaranteedPerformanceSections;
    if (!sections) {
      sections = self->_sections;
    }
    int64_t v6 = [(NSOrderedSet *)sections indexOfObject:v4];
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (_UIDiffableDataSourceState)init
{
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9D8]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9D8]);
  int64_t v6 = objc_alloc_init(_UIDataSourceSnapshotter);
  uint64_t v7 = [(_UIDiffableDataSourceState *)self initWithGenerationID:v3 identifiers:v4 sections:v5 dataSourceSnapshot:v6 identifiersHaveGuaranteedPerformance:1 sectionsHaveGuaranteedPerformance:1];

  return v7;
}

- (BOOL)containsItemIdentifier:(id)a3
{
  return a3 && -[NSOrderedSet containsObject:](self->_identifiers, "containsObject:");
}

- (int64_t)numberOfSections
{
  return [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot numberOfSections];
}

- (int64_t)numberOfItems
{
  return [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot numberOfItems];
}

- (void)validateIdentifiers
{
  _UIDiffableDataSourceValidateIdentifiers(self->_sections, 0);
  identifiers = self->_identifiers;
  _UIDiffableDataSourceValidateIdentifiers(identifiers, 1);
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"[%@ - %p: dataSourceSnapshot: %@; generationID: %@",
    v5,
    self,
    self->_dataSourceSnapshot,
  int64_t v6 = self->_generationID);

  return (NSString *)v6;
}

- (id)sectionIndexesForItemIndexRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = [(_UIDiffableDataSourceState *)self numberOfItems];
  if (v6 && length && v6 > location)
  {
    if (location + length <= v6) {
      NSUInteger v7 = length;
    }
    else {
      NSUInteger v7 = v6 - location;
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", location, v7);
    uint64_t v9 = [v8 firstIndex];
    uint64_t v10 = [v8 lastIndex];
    uint64_t v11 = [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot sectionForGlobalIndex:v9];
    uint64_t v12 = [(_UICollectionDataSourceSnapshotTranslating *)self->_dataSourceSnapshot sectionForGlobalIndex:v10];
    uint64_t v13 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v11, v12 - v11 + 1);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F088D0] indexSet];
  }
  return v13;
}

- (BOOL)containsSectionIdentifier:(id)a3
{
  return a3 && -[NSOrderedSet containsObject:](self->_sections, "containsObject:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithState:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIDiffableDataSourceState *)a3;
  if (v4 == self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v14 = 0;
  }
  else
  {
    id v5 = v4;
    generationID = self->_generationID;
    NSUInteger v7 = [(_UIDiffableDataSourceState *)v5 generationID];
    LODWORD(generationID) = [(NSUUID *)generationID isEqual:v7];

    if (!generationID) {
      goto LABEL_8;
    }
    sections = self->_sections;
    uint64_t v9 = [(_UIDiffableDataSourceState *)v5 sections];
    LODWORD(sections) = [(NSOrderedSet *)sections isEqualToOrderedSet:v9];

    if (!sections) {
      goto LABEL_8;
    }
    identifiers = self->_identifiers;
    uint64_t v11 = [(_UIDiffableDataSourceState *)v5 identifiers];
    LODWORD(identifiers) = [(NSOrderedSet *)identifiers isEqualToOrderedSet:v11];

    if (identifiers)
    {
      dataSourceSnapshot = self->_dataSourceSnapshot;
      uint64_t v13 = [(_UIDiffableDataSourceState *)v5 dataSourceSnapshot];
      char v14 = [(_UICollectionDataSourceSnapshotTranslating *)dataSourceSnapshot isEqual:v13];
    }
    else
    {
LABEL_8:
      char v14 = 0;
    }
  }
  return v14;
}

@end