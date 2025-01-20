@interface MPSectionedIdentifierListEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isDataSourceRemoved;
- (MPSectionedIdentifierListEntry)initWithCoder:(id)a3;
- (MPSectionedIdentifierListEntry)initWithPositionKey:(id)a3 sectionIdentifier:(id)a4;
- (MPSectionedIdentifierListEntry)previousEntry;
- (MPSectionedIdentifierListEntryPositionKey)positionKey;
- (NSArray)nextEntries;
- (NSString)description;
- (NSString)hostedSectionIdentifier;
- (NSString)sectionIdentifier;
- (id)_stateDumpObject;
- (id)itemResult;
- (id)trackingEntryResult;
- (int64_t)branchDepth;
- (int64_t)entryType;
- (void)addBranch:(id)a3 forceBranchDepthIncrease:(BOOL)a4;
- (void)addNextEntry:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForDealloc;
- (void)setBranchDepth:(int64_t)a3;
- (void)setDataSourceRemoved;
- (void)setHostedSectionIdentifier:(id)a3;
- (void)setPreviousEntry:(id)a3;
@end

@implementation MPSectionedIdentifierListEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)hostedSectionIdentifier
{
  return self->_hostedSectionIdentifier;
}

- (BOOL)isDataSourceRemoved
{
  return self->_dataSourceRemoved;
}

- (NSArray)nextEntries
{
  return &self->_nextEntries->super;
}

- (MPSectionedIdentifierListEntry)previousEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousEntry);

  return (MPSectionedIdentifierListEntry *)WeakRetained;
}

- (void)setPreviousEntry:(id)a3
{
}

- (MPSectionedIdentifierListEntryPositionKey)positionKey
{
  return self->_positionKey;
}

- (int64_t)branchDepth
{
  return self->_branchDepth;
}

- (void)addNextEntry:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (id)itemResult
{
  if ([(MPSectionedIdentifierListEntry *)self conformsToProtocol:&unk_1EE718A90]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)trackingEntryResult
{
  if ([(MPSectionedIdentifierListEntry *)self conformsToProtocol:&unk_1EE718838]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (MPSectionedIdentifierListEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pk"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"si"];
  v7 = [(MPSectionedIdentifierListEntry *)self initWithPositionKey:v5 sectionIdentifier:v6];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hsi"];
    hostedSectionIdentifier = v7->_hostedSectionIdentifier;
    v7->_hostedSectionIdentifier = (NSString *)v8;

    v7->_branchDepth = [v4 decodeIntegerForKey:@"bd"];
    v7->_dataSourceRemoved = [v4 decodeBoolForKey:@"dsr"];
  }

  return v7;
}

- (MPSectionedIdentifierListEntry)initWithPositionKey:(id)a3 sectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MPSectionedIdentifierListEntry;
  v9 = [(MPSectionedIdentifierListEntry *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_positionKey, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    nextEntries = v10->_nextEntries;
    v10->_nextEntries = (NSMutableArray *)v11;

    uint64_t v13 = [v8 copy];
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = (NSString *)v13;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousEntry);
  objc_storeStrong((id *)&self->_hostedSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_positionKey, 0);

  objc_storeStrong((id *)&self->_nextEntries, 0);
}

- (void)setBranchDepth:(int64_t)a3
{
  self->_branchDepth = a3;
}

- (void)setHostedSectionIdentifier:(id)a3
{
}

- (void)setDataSourceRemoved
{
  self->_dataSourceRemoved = 1;
}

- (void)prepareForDealloc
{
}

- (void)addBranch:(id)a3 forceBranchDepthIncrease:(BOOL)a4
{
  BOOL v4 = a4;
  id v25 = a3;
  if (![v25 count])
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierListEntry.m" lineNumber:138 description:@"Cannot add empty branch"];
  }
  int64_t v7 = [(MPSectionedIdentifierListEntry *)self branchDepth];
  uint64_t v8 = v7 + v4 + [(NSMutableArray *)self->_nextEntries count];
  if ([v25 count] != 1)
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [v25 objectAtIndexedSubscript:v12];
      v14 = [v25 objectAtIndexedSubscript:++v12];
      [v13 setBranchDepth:v8];
      v15 = [v13 nextEntries];
      uint64_t v16 = [v15 count];

      if (v16)
      {
        v17 = [v13 nextEntries];
        uint64_t v18 = [v17 count];

        if (v18 == 1)
        {
          v19 = [v13 nextEntries];
          v20 = [v19 firstObject];

          if (v20 != v14)
          {
            v23 = [MEMORY[0x1E4F28B00] currentHandler];
            [v23 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierListEntry.m" lineNumber:152 description:@"Non-contiguous entries in MPSectionedIdentifierListEntryAddBranch [too many next]"];
          }
          v21 = [v14 previousEntry];
          if (v21 != v13)
          {
            v22 = [MEMORY[0x1E4F28B00] currentHandler];
            [v22 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierListEntry.m" lineNumber:154 description:@"Non-contiguous entries in MPSectionedIdentifierListEntryAddBranch [disconnected previous]"];
          }
        }
        else
        {
          v21 = [MEMORY[0x1E4F28B00] currentHandler];
          [v21 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierListEntry.m" lineNumber:157 description:@"Non-linear entries in MPSectionedIdentifierListEntryAddBranch"];
        }
      }
      else
      {
        [v13 addNextEntry:v14];
        [v14 setPreviousEntry:v13];
      }
    }
    while (v12 < [v25 count] - 1);
  }
  v9 = [v25 lastObject];
  [v9 setBranchDepth:v8];

  v10 = [v25 firstObject];
  [(MPSectionedIdentifierListEntry *)self addNextEntry:v10];

  uint64_t v11 = [v25 firstObject];
  [v11 setPreviousEntry:self];
}

- (int64_t)entryType
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  positionKey = self->_positionKey;
  id v5 = a3;
  [v5 encodeObject:positionKey forKey:@"pk"];
  [v5 encodeObject:self->_sectionIdentifier forKey:@"si"];
  [v5 encodeObject:self->_hostedSectionIdentifier forKey:@"hsi"];
  [v5 encodeInteger:self->_branchDepth forKey:@"bd"];
  [v5 encodeBool:self->_dataSourceRemoved forKey:@"dsr"];
}

- (id)_stateDumpObject
{
  v21[5] = *MEMORY[0x1E4F143B8];
  v20[0] = @"_obj";
  v3 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v21[0] = v3;
  v20[1] = @"_sectionID";
  uint64_t v4 = [(MPSectionedIdentifierListEntry *)self sectionIdentifier];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"@";
  }
  v21[1] = v6;
  v20[2] = @"_hostedSectionIdentifier";
  uint64_t v7 = [(MPSectionedIdentifierListEntry *)self hostedSectionIdentifier];
  uint64_t v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"@";
  }
  v21[2] = v9;
  v20[3] = @"nextEntries";
  v10 = [(MPSectionedIdentifierListEntry *)self nextEntries];
  uint64_t v11 = [v10 valueForKey:@"description"];
  unint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = @"@";
  }
  v21[3] = v13;
  v20[4] = @"previousEntry";
  v14 = [(MPSectionedIdentifierListEntry *)self previousEntry];
  uint64_t v15 = [v14 description];
  uint64_t v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = @"@";
  }
  v21[4] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];

  return v18;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MPSectionedIdentifierListEntry *)self sectionIdentifier];
  v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

@end