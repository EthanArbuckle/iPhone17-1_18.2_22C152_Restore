@interface FPSearchTrashCollection
- (BOOL)isCollectionValidForItem:(id)a3;
- (FPSearchTrashCollection)init;
- (NSFileProviderSearchQuery)searchQuery;
- (id)scopedSearchQuery;
- (void)setSearchQuery:(id)a3;
@end

@implementation FPSearchTrashCollection

- (FPSearchTrashCollection)init
{
  v3 = +[FPItemManager defaultManager];
  v4 = (FPSearchCollection *)[v3 newSearchCollection];
  searchCollection = self->_searchCollection;
  self->_searchCollection = v4;

  v6 = +[FPItemManager defaultManager];
  v7 = (FPTrashUnionCollection *)[v6 newTrashCollection];
  trashCollection = self->_trashCollection;
  self->_trashCollection = v7;

  v10.receiver = self;
  v10.super_class = (Class)FPSearchTrashCollection;
  return [(FPUnionCollection *)&v10 initWithCollections:MEMORY[0x1E4F1CBF0]];
}

- (NSFileProviderSearchQuery)searchQuery
{
  return [(FPSearchCollection *)self->_searchCollection searchQuery];
}

- (void)setSearchQuery:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 trashedItemsMembership];
  p_searchCollection = (id *)&self->_searchCollection;
  v7 = [(FPSearchCollection *)self->_searchCollection searchQuery];
  if (v7) {
    BOOL v8 = self->_selectedMembership != v5;
  }
  else {
    BOOL v8 = 1;
  }

  [*p_searchCollection setSearchQuery:v4];
  self->_unint64_t selectedMembership = v5;
  id v13 = (id)objc_opt_new();
  unint64_t selectedMembership = self->_selectedMembership;
  if (selectedMembership == 2)
  {
LABEL_8:
    p_searchCollection = (id *)&self->_trashCollection;
    goto LABEL_9;
  }
  if (selectedMembership != 1)
  {
    if (selectedMembership) {
      goto LABEL_10;
    }
    [v13 addObject:*p_searchCollection];
    goto LABEL_8;
  }
LABEL_9:
  [v13 addObject:*p_searchCollection];
LABEL_10:
  if (v8) {
    [(FPUnionCollection *)self setCollections:v13];
  }
  objc_super v10 = [(FPSearchTrashCollection *)self searchQuery];
  v11 = [v10 predicate];
  searchQueryPredicate = self->_searchQueryPredicate;
  self->_searchQueryPredicate = v11;
}

- (id)scopedSearchQuery
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPSearchTrashCollection.m" lineNumber:93 description:@"UNREACHABLE: This should never be requested."];

  return 0;
}

- (BOOL)isCollectionValidForItem:(id)a3
{
  searchQueryPredicate = self->_searchQueryPredicate;
  return !searchQueryPredicate || [(NSPredicate *)searchQueryPredicate evaluateWithObject:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueryPredicate, 0);
  objc_storeStrong((id *)&self->_trashCollection, 0);

  objc_storeStrong((id *)&self->_searchCollection, 0);
}

@end