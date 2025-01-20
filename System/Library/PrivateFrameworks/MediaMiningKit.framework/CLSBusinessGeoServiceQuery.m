@interface CLSBusinessGeoServiceQuery
- (BOOL)isCancelled;
- (CLSBusinessGeoServiceQuery)initWithMUIDs:(id)a3;
- (GEOMapServiceTicket)ticket;
- (NSArray)muids;
- (NSArray)resultingMapItems;
- (void)cancel;
- (void)prepareForRetry;
- (void)submitWithHandler:(id)a3;
@end

@implementation CLSBusinessGeoServiceQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingMapItems, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_muids, 0);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (NSArray)resultingMapItems
{
  return self->_resultingMapItems;
}

- (GEOMapServiceTicket)ticket
{
  return self->_ticket;
}

- (NSArray)muids
{
  return self->_muids;
}

- (void)prepareForRetry
{
  self->_isCancelled = 0;
  id v5 = [MEMORY[0x1E4F64710] sharedService];
  v3 = [v5 ticketForMUIDs:self->_muids traits:0];
  ticket = self->_ticket;
  self->_ticket = v3;
}

- (void)cancel
{
  self->_isCancelled = 1;
  [(GEOMapServiceTicket *)self->_ticket cancel];
}

- (void)submitWithHandler:(id)a3
{
  id v4 = a3;
  ticket = self->_ticket;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CLSBusinessGeoServiceQuery_submitWithHandler___block_invoke;
  v7[3] = &unk_1E690EAA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(GEOMapServiceTicket *)ticket submitWithHandler:v7 networkActivity:0];
}

void __48__CLSBusinessGeoServiceQuery_submitWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CLSBusinessGeoServiceQuery)initWithMUIDs:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSBusinessGeoServiceQuery;
  id v5 = [(CLSBusinessGeoServiceQuery *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    v5->_isCancelled = 0;
    uint64_t v7 = [v4 copy];
    muids = v6->_muids;
    v6->_muids = (NSArray *)v7;

    v9 = [MEMORY[0x1E4F64710] sharedService];
    uint64_t v10 = [v9 ticketForMUIDs:v6->_muids traits:0];
    ticket = v6->_ticket;
    v6->_ticket = (GEOMapServiceTicket *)v10;
  }
  return v6;
}

@end