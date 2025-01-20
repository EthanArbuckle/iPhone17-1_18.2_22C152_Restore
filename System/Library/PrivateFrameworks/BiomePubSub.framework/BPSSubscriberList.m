@interface BPSSubscriberList
- (BPSSubscriberList)init;
- (NSMutableArray)items;
- (NSMutableArray)tickets;
- (id)claimAll;
- (int64_t)appendElement:(id)a3;
- (int64_t)nextTicket;
- (void)removeTicket:(int64_t)a3;
- (void)setItems:(id)a3;
- (void)setNextTicket:(int64_t)a3;
- (void)setTickets:(id)a3;
@end

@implementation BPSSubscriberList

- (BPSSubscriberList)init
{
  v9.receiver = self;
  v9.super_class = (Class)BPSSubscriberList;
  v2 = [(BPSSubscriberList *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v4 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    items = v2->_items;
    v2->_items = (NSMutableArray *)v4;

    uint64_t v6 = [v3 mutableCopy];
    tickets = v2->_tickets;
    v2->_tickets = (NSMutableArray *)v6;

    v2->_nextTicket = 0;
  }
  return v2;
}

- (int64_t)appendElement:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BPSSubscriberList *)self nextTicket];
  [(BPSSubscriberList *)self setNextTicket:[(BPSSubscriberList *)self nextTicket] + 1];
  uint64_t v6 = [(BPSSubscriberList *)self items];
  [v6 addObject:v4];

  v7 = [(BPSSubscriberList *)self tickets];
  v8 = [NSNumber numberWithInteger:v5];
  [v7 addObject:v8];

  return v5;
}

- (void)removeTicket:(int64_t)a3
{
  if (a3 < 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"BPSSubscriberList.m" lineNumber:35 description:@"Ticket should be greater than zero"];
  }
  if ([(BPSSubscriberList *)self nextTicket] <= a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"BPSSubscriberList.m" lineNumber:36 description:@"Ticket should be less than next ticket"];
  }
  uint64_t v6 = [(BPSSubscriberList *)self tickets];
  v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = [v6 indexOfObject:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v9 = [(BPSSubscriberList *)self items];
    [v9 removeObjectAtIndex:v8];

    id v12 = [(BPSSubscriberList *)self tickets];
    [v12 removeObjectAtIndex:v8];
  }
}

- (id)claimAll
{
  v3 = [(BPSSubscriberList *)self items];
  id v4 = (void *)[v3 copy];

  int64_t v5 = [(BPSSubscriberList *)self items];
  [v5 removeAllObjects];

  uint64_t v6 = [(BPSSubscriberList *)self tickets];
  [v6 removeAllObjects];

  return v4;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)tickets
{
  return self->_tickets;
}

- (void)setTickets:(id)a3
{
}

- (int64_t)nextTicket
{
  return self->_nextTicket;
}

- (void)setNextTicket:(int64_t)a3
{
  self->_nextTicket = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickets, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end