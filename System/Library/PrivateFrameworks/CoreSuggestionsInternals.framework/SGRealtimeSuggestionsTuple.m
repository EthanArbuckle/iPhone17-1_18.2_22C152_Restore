@interface SGRealtimeSuggestionsTuple
- (NSArray)contacts;
- (NSArray)deliveries;
- (NSArray)events;
- (NSArray)invalidatedIdentifiers;
- (NSArray)reminders;
- (NSArray)walletOrders;
- (NSArray)walletPasses;
- (id)combinedSuggestions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)suggestionsCount;
- (void)setContacts:(id)a3;
- (void)setDeliveries:(id)a3;
- (void)setEvents:(id)a3;
- (void)setInvalidatedIdentifiers:(id)a3;
- (void)setReminders:(id)a3;
- (void)setWalletOrders:(id)a3;
- (void)setWalletPasses:(id)a3;
@end

@implementation SGRealtimeSuggestionsTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletPasses, 0);
  objc_storeStrong((id *)&self->_walletOrders, 0);
  objc_storeStrong((id *)&self->_invalidatedIdentifiers, 0);
  objc_storeStrong((id *)&self->_deliveries, 0);
  objc_storeStrong((id *)&self->_reminders, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setWalletPasses:(id)a3
{
}

- (NSArray)walletPasses
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWalletOrders:(id)a3
{
}

- (NSArray)walletOrders
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInvalidatedIdentifiers:(id)a3
{
}

- (NSArray)invalidatedIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeliveries:(id)a3
{
}

- (NSArray)deliveries
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReminders:(id)a3
{
}

- (NSArray)reminders
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvents:(id)a3
{
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<SGRealtimeSuggestionsTuple c:%tu e:%tu r:%tu d:%tu i:%tu o:%tu p:%tu>", -[NSArray count](self->_contacts, "count"), -[NSArray count](self->_events, "count"), -[NSArray count](self->_reminders, "count"), -[NSArray count](self->_deliveries, "count"), -[NSArray count](self->_invalidatedIdentifiers, "count"), -[NSArray count](self->_walletOrders, "count"), -[NSArray count](self->_walletPasses, "count"));
  return v2;
}

- (id)combinedSuggestions
{
  v3 = objc_opt_new();
  v4 = v3;
  if (self->_contacts) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  if (self->_events) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  if (self->_reminders) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  if (self->_deliveries) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  if (self->_walletOrders) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  if (self->_walletPasses) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  [v4 setContacts:self->_contacts];
  [v4 setEvents:self->_events];
  [v4 setReminders:self->_reminders];
  [v4 setDeliveries:self->_deliveries];
  [v4 setInvalidatedIdentifiers:self->_invalidatedIdentifiers];
  [v4 setWalletOrders:self->_walletOrders];
  [v4 setWalletPasses:self->_walletPasses];
  return v4;
}

- (unint64_t)suggestionsCount
{
  v3 = [(SGRealtimeSuggestionsTuple *)self contacts];
  uint64_t v4 = [v3 count];
  v5 = [(SGRealtimeSuggestionsTuple *)self events];
  uint64_t v6 = [v5 count] + v4;
  v7 = [(SGRealtimeSuggestionsTuple *)self reminders];
  uint64_t v8 = [v7 count];
  v9 = [(SGRealtimeSuggestionsTuple *)self deliveries];
  uint64_t v10 = v6 + v8 + [v9 count];
  v11 = [(SGRealtimeSuggestionsTuple *)self walletOrders];
  uint64_t v12 = [v11 count];
  v13 = [(SGRealtimeSuggestionsTuple *)self walletPasses];
  unint64_t v14 = v10 + v12 + [v13 count];

  return v14;
}

@end