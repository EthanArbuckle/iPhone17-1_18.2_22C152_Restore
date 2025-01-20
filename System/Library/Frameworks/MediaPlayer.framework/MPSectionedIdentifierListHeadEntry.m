@interface MPSectionedIdentifierListHeadEntry
+ (BOOL)supportsSecureCoding;
+ (MPSectionedIdentifierListHeadEntry)headEntryWithSectionIdentifier:(id)a3;
- (BOOL)isShuffledHead;
- (MPSectionedIdentifierListDataSource)dataSource;
- (MPSectionedIdentifierListHeadEntry)initWithCoder:(id)a3;
- (MPSectionedIdentifierListHeadEntry)initWithPositionKey:(id)a3 sectionIdentifier:(id)a4;
- (MPSectionedIdentifierListItemEntry)lastItemEntry;
- (MPSectionedIdentifierListTailEntry)tailEntry;
- (NSMutableDictionary)identifiersItemEntryMap;
- (NSString)description;
- (id)nextEntries;
- (int64_t)entryType;
- (void)encodeWithCoder:(id)a3;
- (void)setBranchDepth:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setLastItemEntry:(id)a3;
- (void)setShuffledHead:(BOOL)a3;
- (void)setTailEntry:(id)a3;
@end

@implementation MPSectionedIdentifierListHeadEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLastItemEntry:(id)a3
{
}

- (NSMutableDictionary)identifiersItemEntryMap
{
  return self->_identifiersItemEntryMap;
}

- (id)nextEntries
{
  v7.receiver = self;
  v7.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  v3 = [(MPSectionedIdentifierListEntry *)&v7 nextEntries];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(MPSectionedIdentifierListHeadEntry *)self tailEntry];
  [v4 insertObject:v5 atIndex:0];

  return v4;
}

- (MPSectionedIdentifierListTailEntry)tailEntry
{
  return self->_tailEntry;
}

- (int64_t)entryType
{
  return 2;
}

- (MPSectionedIdentifierListItemEntry)lastItemEntry
{
  return self->_lastItemEntry;
}

- (void)setTailEntry:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isShuffledHead
{
  return self->_shuffledHead;
}

- (MPSectionedIdentifierListHeadEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  v5 = [(MPSectionedIdentifierListEntry *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_shuffledHead = [v4 decodeBoolForKey:@"isShuffled"];
  }

  return v5;
}

- (MPSectionedIdentifierListHeadEntry)initWithPositionKey:(id)a3 sectionIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  id v4 = [(MPSectionedIdentifierListEntry *)&v10 initWithPositionKey:a3 sectionIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    identifiersItemEntryMap = v4->_identifiersItemEntryMap;
    v4->_identifiersItemEntryMap = (NSMutableDictionary *)v5;

    uint64_t v7 = +[MPSectionedIdentifierListTailEntry tailEntryWithSectionHeadEntry:v4];
    tailEntry = v4->_tailEntry;
    v4->_tailEntry = (MPSectionedIdentifierListTailEntry *)v7;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_lastItemEntry, 0);
  objc_storeStrong((id *)&self->_tailEntry, 0);

  objc_storeStrong((id *)&self->_identifiersItemEntryMap, 0);
}

- (void)setShuffledHead:(BOOL)a3
{
  self->_shuffledHead = a3;
}

- (MPSectionedIdentifierListDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setBranchDepth:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  -[MPSectionedIdentifierListEntry setBranchDepth:](&v5, sel_setBranchDepth_);
  [(MPSectionedIdentifierListEntry *)self->_tailEntry setBranchDepth:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPSectionedIdentifierListHeadEntry;
  id v4 = a3;
  [(MPSectionedIdentifierListEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_shuffledHead, @"isShuffled", v5.receiver, v5.super_class);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(MPSectionedIdentifierListHeadEntry *)self isShuffledHead]) {
    objc_super v5 = @"🔀 ";
  }
  else {
    objc_super v5 = &stru_1EE680640;
  }
  v6 = [(MPSectionedIdentifierListEntry *)self sectionIdentifier];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p> %@%@", v4, self, v5, v6];

  return (NSString *)v7;
}

+ (MPSectionedIdentifierListHeadEntry)headEntryWithSectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = +[MPSectionedIdentifierListEntryPositionKey positionKeyWithDeviceIdentifier:&stru_1EE680640 generation:@"1"];
  uint64_t v7 = (void *)[v5 initWithPositionKey:v6 sectionIdentifier:v4];

  return (MPSectionedIdentifierListHeadEntry *)v7;
}

@end