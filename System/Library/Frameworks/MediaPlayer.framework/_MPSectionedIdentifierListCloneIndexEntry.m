@interface _MPSectionedIdentifierListCloneIndexEntry
- (MPSectionedIdentifierListItemEntry)rootEntry;
- (NSMutableSet)clonedEntries;
- (_MPSectionedIdentifierListCloneIndexEntry)init;
- (void)setClonedEntries:(id)a3;
- (void)setRootEntry:(id)a3;
@end

@implementation _MPSectionedIdentifierListCloneIndexEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clonedEntries, 0);

  objc_storeStrong((id *)&self->_rootEntry, 0);
}

- (void)setClonedEntries:(id)a3
{
}

- (NSMutableSet)clonedEntries
{
  return self->_clonedEntries;
}

- (void)setRootEntry:(id)a3
{
}

- (MPSectionedIdentifierListItemEntry)rootEntry
{
  return self->_rootEntry;
}

- (_MPSectionedIdentifierListCloneIndexEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MPSectionedIdentifierListCloneIndexEntry;
  v2 = [(_MPSectionedIdentifierListCloneIndexEntry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    clonedEntries = v2->_clonedEntries;
    v2->_clonedEntries = (NSMutableSet *)v3;
  }
  return v2;
}

@end