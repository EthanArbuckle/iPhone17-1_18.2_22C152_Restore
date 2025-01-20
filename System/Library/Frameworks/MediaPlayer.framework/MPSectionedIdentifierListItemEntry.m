@interface MPSectionedIdentifierListItemEntry
+ (BOOL)supportsSecureCoding;
+ (MPSectionedIdentifierListItemEntry)itemEntryWithSectionIdentifier:(id)a3 itemIdentifier:(id)a4;
+ (MPSectionedIdentifierListItemEntry)itemEntryWithSectionIdentifier:(id)a3 itemIdentifier:(id)a4 generationPrefix:(id)a5;
- ($8BEA2F14B5BFFCEA171CA5B3383F4BB6)state;
- (BOOL)hasClones;
- (BOOL)isDataSourceCloned;
- (BOOL)isDataSourceMoved;
- (BOOL)isDataSourceRemoved;
- (BOOL)isRemoved;
- (BOOL)isUserCloned;
- (BOOL)isUserMoved;
- (BOOL)isUserRemoved;
- (MPSectionedIdentifierListItemEntry)initWithCoder:(id)a3;
- (MPSectionedIdentifierListItemEntry)latestDataSourceClone;
- (MPSectionedIdentifierListItemEntry)latestUserClone;
- (MPSectionedIdentifierListItemEntry)rootEntry;
- (NSMutableArray)clonedEntries;
- (NSString)description;
- (NSString)itemIdentifier;
- (id)_stateDumpObject;
- (id)newClonedEntry;
- (id)stringRepresentation;
- (int64_t)_generationNumber;
- (int64_t)entryType;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForDealloc;
- (void)setClonedEntries:(id)a3;
- (void)setDataSourceCloned;
- (void)setDataSourceMoved;
- (void)setDataSourceRemoved;
- (void)setRootEntry:(id)a3;
- (void)setUserCloned;
- (void)setUserMoved;
- (void)setUserRemoved;
@end

@implementation MPSectionedIdentifierListItemEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isUserCloned
{
  return self->_userCloned;
}

- (MPSectionedIdentifierListItemEntry)latestUserClone
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPSectionedIdentifierListItemEntry *)self rootEntry];
  v4 = (void *)v3;
  if (v3) {
    v5 = (MPSectionedIdentifierListItemEntry *)v3;
  }
  else {
    v5 = self;
  }
  v6 = v5;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(MPSectionedIdentifierListItemEntry *)v6 clonedEntries];
  v8 = [v7 reverseObjectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (![v13 isRemoved])
        {
          v14 = v13;

          goto LABEL_14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v14 = self;
LABEL_14:

  return v14;
}

- (NSMutableArray)clonedEntries
{
  return self->_clonedEntries;
}

- (BOOL)isDataSourceRemoved
{
  uint64_t v3 = [(MPSectionedIdentifierListItemEntry *)self rootEntry];
  v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 isDataSourceRemoved];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPSectionedIdentifierListItemEntry;
    unsigned __int8 v5 = [(MPSectionedIdentifierListEntry *)&v8 isDataSourceRemoved];
  }
  BOOL v6 = v5;

  return v6;
}

- (MPSectionedIdentifierListItemEntry)rootEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootEntry);

  return (MPSectionedIdentifierListItemEntry *)WeakRetained;
}

- (BOOL)isRemoved
{
  if ([(MPSectionedIdentifierListItemEntry *)self isUserMoved]
    || [(MPSectionedIdentifierListItemEntry *)self isUserRemoved]
    || [(MPSectionedIdentifierListItemEntry *)self isDataSourceMoved])
  {
    return 1;
  }

  return [(MPSectionedIdentifierListItemEntry *)self isDataSourceRemoved];
}

- (BOOL)isUserRemoved
{
  return self->_userRemoved;
}

- (BOOL)isUserMoved
{
  return self->_userMoved;
}

- (BOOL)isDataSourceMoved
{
  return self->_dataSourceMoved;
}

- (int64_t)entryType
{
  return 3;
}

- (BOOL)hasClones
{
  return self->_hasClones;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (MPSectionedIdentifierListItemEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPSectionedIdentifierListItemEntry;
  unsigned __int8 v5 = [(MPSectionedIdentifierListEntry *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iid"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    char v8 = [v4 decodeIntegerForKey:@"f"];
    v5->_dataSourceMoved = v8 & 1;
    v5->_dataSourceCloned = (v8 & 2) != 0;
    v5->_userRemoved = (v8 & 4) != 0;
    v5->_userMoved = (v8 & 8) != 0;
    v5->_userCloned = (v8 & 0x10) != 0;
    v5->_hasClones = (v8 & 0x20) != 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clonedEntries, 0);
  objc_destroyWeak((id *)&self->_rootEntry);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (BOOL)isDataSourceCloned
{
  return self->_dataSourceCloned;
}

- (void)setClonedEntries:(id)a3
{
}

- (void)setRootEntry:(id)a3
{
}

- (int64_t)_generationNumber
{
  uint64_t v3 = [(MPSectionedIdentifierListItemEntry *)self rootEntry];
  id v4 = v3;
  if (v3
    && ([v3 clonedEntries],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 indexOfObjectIdenticalTo:self],
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    int64_t v7 = v6 + 1;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)prepareForDealloc
{
  v4.receiver = self;
  v4.super_class = (Class)MPSectionedIdentifierListItemEntry;
  [(MPSectionedIdentifierListEntry *)&v4 prepareForDealloc];
  uint64_t v3 = [(MPSectionedIdentifierListItemEntry *)self clonedEntries];
  [v3 removeAllObjects];
}

- (id)newClonedEntry
{
  uint64_t v3 = [(MPSectionedIdentifierListItemEntry *)self rootEntry];
  objc_super v4 = (void *)v3;
  if (v3) {
    unsigned __int8 v5 = (MPSectionedIdentifierListItemEntry *)v3;
  }
  else {
    unsigned __int8 v5 = self;
  }
  uint64_t v6 = v5;

  int64_t v7 = [(MPSectionedIdentifierListEntry *)self sectionIdentifier];
  char v8 = [(MPSectionedIdentifierListItemEntry *)self itemIdentifier];
  uint64_t v9 = [(MPSectionedIdentifierListEntry *)self positionKey];
  objc_super v10 = [v9 generation];
  uint64_t v11 = +[MPSectionedIdentifierListItemEntry itemEntryWithSectionIdentifier:v7 itemIdentifier:v8 generationPrefix:v10];

  [v11 setRootEntry:v6];
  v12 = [(MPSectionedIdentifierListEntry *)self hostedSectionIdentifier];
  [v11 setHostedSectionIdentifier:v12];

  v11[67] = self->_userRemoved;
  v11[68] = self->_userMoved;
  v11[66] = self->_dataSourceMoved;
  v13 = [(MPSectionedIdentifierListItemEntry *)v6 clonedEntries];

  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    [(MPSectionedIdentifierListItemEntry *)v6 setClonedEntries:v14];
  }
  v15 = [(MPSectionedIdentifierListItemEntry *)v6 clonedEntries];
  [v15 addObject:v11];

  v6->_hasClones = 1;
  return v11;
}

- (MPSectionedIdentifierListItemEntry)latestDataSourceClone
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPSectionedIdentifierListItemEntry *)self rootEntry];
  objc_super v4 = (void *)v3;
  if (v3) {
    unsigned __int8 v5 = (MPSectionedIdentifierListItemEntry *)v3;
  }
  else {
    unsigned __int8 v5 = self;
  }
  uint64_t v6 = v5;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int64_t v7 = [(MPSectionedIdentifierListItemEntry *)v6 clonedEntries];
  char v8 = [v7 reverseObjectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 isDataSourceCloned])
        {
          v14 = v13;

          goto LABEL_14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v14 = v6;
LABEL_14:

  return v14;
}

- ($8BEA2F14B5BFFCEA171CA5B3383F4BB6)state
{
  uint64_t v3 = [(MPSectionedIdentifierListItemEntry *)self rootEntry];
  BOOL v4 = [(MPSectionedIdentifierListItemEntry *)self isUserMoved];
  BOOL v5 = [(MPSectionedIdentifierListItemEntry *)self isUserRemoved];
  BOOL v6 = [(MPSectionedIdentifierListItemEntry *)self isDataSourceMoved];
  BOOL v7 = [(MPSectionedIdentifierListItemEntry *)self isDataSourceRemoved];
  BOOL v8 = [(MPSectionedIdentifierListItemEntry *)self hasClones];
  if (v3)
  {
    uint64_t v9 = [(MPSectionedIdentifierListItemEntry *)self latestUserClone];
    BOOL v26 = v8;
    unint64_t v10 = (unint64_t)(v9 == self) << 48;
    [(MPSectionedIdentifierListItemEntry *)self latestDataSourceClone];
    BOOL v11 = v7;
    BOOL v12 = v6;
    BOOL v13 = v5;
    BOOL v14 = v4;
    v15 = (MPSectionedIdentifierListItemEntry *)objc_claimAutoreleasedReturnValue();
    unint64_t v16 = (unint64_t)(v15 == self) << 56;
    int64_t v17 = [(MPSectionedIdentifierListItemEntry *)self _generationNumber];

    BOOL v4 = v14;
    BOOL v5 = v13;
    BOOL v6 = v12;
    BOOL v7 = v11;
    unint64_t v18 = v10;
    BOOL v8 = v26;

    uint64_t v19 = 0x10000000000;
  }
  else
  {
    int64_t v17 = [(MPSectionedIdentifierListItemEntry *)self _generationNumber];
    unint64_t v16 = 0;
    unint64_t v18 = 0;
    uint64_t v19 = 0;
  }

  uint64_t v20 = 0x100000000;
  if (!v8) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = 0x1000000;
  if (!v7) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = 0x10000;
  if (!v6) {
    uint64_t v22 = 0;
  }
  uint64_t v23 = 256;
  if (!v5) {
    uint64_t v23 = 0;
  }
  unint64_t v24 = v23 | v4 | v22 | v21 | v20 | v16 | v18 | v19;
  int64_t v25 = v17;
  result.var8 = v25;
  result.var0 = v24;
  result.var1 = BYTE1(v24);
  result.var2 = BYTE2(v24);
  result.var3 = BYTE3(v24);
  result.var4 = BYTE4(v24);
  result.var5 = BYTE5(v24);
  result.var6 = BYTE6(v24);
  result.var7 = HIBYTE(v24);
  return result;
}

- (void)setUserCloned
{
  self->_userCloned = 1;
}

- (void)setUserMoved
{
  self->_userMoved = 1;
}

- (void)setUserRemoved
{
  self->_userRemoved = 1;
}

- (void)setDataSourceMoved
{
  self->_dataSourceMoved = 1;
}

- (void)setDataSourceCloned
{
  self->_dataSourceCloned = 1;
}

- (void)setDataSourceRemoved
{
  uint64_t v3 = [(MPSectionedIdentifierListItemEntry *)self rootEntry];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 setDataSourceRemoved];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MPSectionedIdentifierListItemEntry;
    [(MPSectionedIdentifierListEntry *)&v5 setDataSourceRemoved];
  }
}

- (id)stringRepresentation
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPSectionedIdentifierListEntry *)self sectionIdentifier];
  BOOL v4 = [(MPSectionedIdentifierListEntry *)self positionKey];
  objc_super v5 = [v4 generation];
  v9[2] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  BOOL v7 = [v6 componentsJoinedByString:@"∆"];

  return v7;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(MPSectionedIdentifierListEntry *)self sectionIdentifier];
  BOOL v6 = [(MPSectionedIdentifierListItemEntry *)self itemIdentifier];
  BOOL v7 = [v3 stringWithFormat:@"<%@: %p> %@ - %@", v4, self, v5, v6];

  return (NSString *)v7;
}

- (id)_stateDumpObject
{
  v22[9] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)MPSectionedIdentifierListItemEntry;
  uint64_t v3 = [(MPSectionedIdentifierListEntry *)&v20 _stateDumpObject];
  uint64_t v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = [(MPSectionedIdentifierListItemEntry *)self state];
  uint64_t v7 = v6;
  BOOL v8 = [(MPSectionedIdentifierListItemEntry *)self itemIdentifier];
  [v4 setObject:v8 forKeyedSubscript:@"_itemID"];

  v21[0] = @"userMoved";
  uint64_t v19 = [NSNumber numberWithBool:v5 & 1];
  v22[0] = v19;
  v21[1] = @"userRemoved";
  uint64_t v9 = [NSNumber numberWithBool:(v5 >> 8) & 1];
  v22[1] = v9;
  v21[2] = @"dataSourceMoved";
  unint64_t v10 = [NSNumber numberWithBool:(v5 >> 16) & 1];
  v22[2] = v10;
  v21[3] = @"dataSourceRemoved";
  BOOL v11 = [NSNumber numberWithBool:(v5 >> 24) & 1];
  v22[3] = v11;
  v21[4] = @"hasClones";
  BOOL v12 = [NSNumber numberWithBool:HIDWORD(v5) & 1];
  v22[4] = v12;
  v21[5] = @"isClone";
  BOOL v13 = [NSNumber numberWithBool:(v5 >> 40) & 1];
  v22[5] = v13;
  v21[6] = @"isActiveClone";
  BOOL v14 = [NSNumber numberWithBool:HIWORD(v5) & 1];
  v22[6] = v14;
  v21[7] = @"isActiveDataSourceClone";
  v15 = [NSNumber numberWithBool:HIBYTE(v5) & 1];
  v22[7] = v15;
  v21[8] = @"generationNumber";
  unint64_t v16 = [NSNumber numberWithInteger:v7];
  v22[8] = v16;
  int64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:9];
  [v4 setObject:v17 forKeyedSubscript:@"state"];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPSectionedIdentifierListItemEntry;
  id v4 = a3;
  [(MPSectionedIdentifierListEntry *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemIdentifier, @"iid", v7.receiver, v7.super_class);
  uint64_t dataSourceMoved = self->_dataSourceMoved;
  if (self->_dataSourceCloned) {
    dataSourceMoved |= 2uLL;
  }
  if (self->_userRemoved) {
    dataSourceMoved |= 4uLL;
  }
  if (self->_userMoved) {
    dataSourceMoved |= 8uLL;
  }
  if (self->_userCloned) {
    dataSourceMoved |= 0x10uLL;
  }
  if (self->_hasClones) {
    uint64_t v6 = dataSourceMoved | 0x20;
  }
  else {
    uint64_t v6 = dataSourceMoved;
  }
  [v4 encodeInteger:v6 forKey:@"f"];
}

+ (MPSectionedIdentifierListItemEntry)itemEntryWithSectionIdentifier:(id)a3 itemIdentifier:(id)a4
{
  return (MPSectionedIdentifierListItemEntry *)[a1 itemEntryWithSectionIdentifier:a3 itemIdentifier:a4 generationPrefix:0];
}

+ (MPSectionedIdentifierListItemEntry)itemEntryWithSectionIdentifier:(id)a3 itemIdentifier:(id)a4 generationPrefix:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v8 length])
  {
    BOOL v11 = [v8 stringByAppendingString:@"1"];
  }
  else
  {
    BOOL v11 = @"1";
  }
  id v12 = objc_alloc((Class)a1);
  BOOL v13 = +[MPSectionedIdentifierListEntryPositionKey positionKeyWithDeviceIdentifier:&stru_1EE680640 generation:v11];
  BOOL v14 = (void *)[v12 initWithPositionKey:v13 sectionIdentifier:v10];

  uint64_t v15 = [v9 copy];
  unint64_t v16 = (void *)v14[9];
  v14[9] = v15;

  return (MPSectionedIdentifierListItemEntry *)v14;
}

@end