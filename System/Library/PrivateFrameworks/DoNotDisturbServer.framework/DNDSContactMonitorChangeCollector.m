@interface DNDSContactMonitorChangeCollector
- (DNDSContactMonitorChangeCollector)initWithMonitoredContactIdentifiers:(id)a3;
- (NSArray)deletedContactIdentifiers;
- (NSArray)updatedContacts;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation DNDSContactMonitorChangeCollector

- (DNDSContactMonitorChangeCollector)initWithMonitoredContactIdentifiers:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DNDSContactMonitorChangeCollector;
  v5 = [(DNDSContactMonitorChangeCollector *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    updatedContacts = v5->_updatedContacts;
    v5->_updatedContacts = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    deletedContactIdentifiers = v5->_deletedContactIdentifiers;
    v5->_deletedContactIdentifiers = (NSMutableArray *)v8;

    uint64_t v10 = [v4 copy];
    monitoredContactIdentifiers = v5->_monitoredContactIdentifiers;
    v5->_monitoredContactIdentifiers = (NSSet *)v10;
  }
  return v5;
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  monitoredContactIdentifiers = self->_monitoredContactIdentifiers;
  id v10 = v4;
  uint64_t v6 = [v4 contact];
  v7 = [v6 identifier];
  LODWORD(monitoredContactIdentifiers) = [(NSSet *)monitoredContactIdentifiers containsObject:v7];

  if (monitoredContactIdentifiers)
  {
    updatedContacts = self->_updatedContacts;
    v9 = [v10 contact];
    [(NSMutableArray *)updatedContacts addObject:v9];
  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = a3;
  monitoredContactIdentifiers = self->_monitoredContactIdentifiers;
  id v9 = v4;
  uint64_t v6 = [v4 contactIdentifier];
  LODWORD(monitoredContactIdentifiers) = [(NSSet *)monitoredContactIdentifiers containsObject:v6];

  if (monitoredContactIdentifiers)
  {
    deletedContactIdentifiers = self->_deletedContactIdentifiers;
    uint64_t v8 = [v9 contactIdentifier];
    [(NSMutableArray *)deletedContactIdentifiers addObject:v8];
  }
}

- (NSArray)updatedContacts
{
  return &self->_updatedContacts->super;
}

- (NSArray)deletedContactIdentifiers
{
  return &self->_deletedContactIdentifiers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_deletedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedContacts, 0);
}

@end