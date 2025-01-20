@interface CalChangeHistoryCollector
- (BOOL)didReset;
- (BOOL)hasChanges;
- (CalChangeHistoryCollector)init;
- (NSMutableArray)deletedContactIdentifiers;
- (NSMutableArray)insertedContacts;
- (NSMutableArray)updatedContacts;
- (void)setDeletedContactIdentifiers:(id)a3;
- (void)setDidReset:(BOOL)a3;
- (void)setHasChanges:(BOOL)a3;
- (void)setInsertedContacts:(id)a3;
- (void)setUpdatedContacts:(id)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation CalChangeHistoryCollector

- (CalChangeHistoryCollector)init
{
  v10.receiver = self;
  v10.super_class = (Class)CalChangeHistoryCollector;
  v2 = [(CalChangeHistoryCollector *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    insertedContacts = v2->_insertedContacts;
    v2->_insertedContacts = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updatedContacts = v2->_updatedContacts;
    v2->_updatedContacts = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedContactIdentifiers = v2->_deletedContactIdentifiers;
    v2->_deletedContactIdentifiers = v7;
  }
  return v2;
}

- (void)visitDropEverythingEvent:(id)a3
{
  self->_didReset = 1;
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = a3;
  v5 = [(CalChangeHistoryCollector *)self insertedContacts];
  v6 = [v4 contact];

  [v5 addObject:v6];
  self->_hasChanges = 1;
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  v5 = [(CalChangeHistoryCollector *)self updatedContacts];
  v6 = [v4 contact];

  [v5 addObject:v6];
  self->_hasChanges = 1;
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = a3;
  v5 = [(CalChangeHistoryCollector *)self deletedContactIdentifiers];
  v6 = [v4 contactIdentifier];

  [v5 addObject:v6];
  self->_hasChanges = 1;
}

- (BOOL)didReset
{
  return self->_didReset;
}

- (void)setDidReset:(BOOL)a3
{
  self->_didReset = a3;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)setHasChanges:(BOOL)a3
{
  self->_hasChanges = a3;
}

- (NSMutableArray)insertedContacts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInsertedContacts:(id)a3
{
}

- (NSMutableArray)updatedContacts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedContacts:(id)a3
{
}

- (NSMutableArray)deletedContactIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeletedContactIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedContacts, 0);

  objc_storeStrong((id *)&self->_insertedContacts, 0);
}

@end