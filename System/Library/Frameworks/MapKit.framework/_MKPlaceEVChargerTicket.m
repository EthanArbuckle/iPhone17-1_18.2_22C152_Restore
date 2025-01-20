@interface _MKPlaceEVChargerTicket
- (GEOMapServiceTraits)traits;
- (_MKPlaceEVChargerTicket)initWithTicket:(id)a3;
- (void)cancel;
- (void)submitRefreshRequestWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _MKPlaceEVChargerTicket

- (_MKPlaceEVChargerTicket)initWithTicket:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKPlaceEVChargerTicket;
  v6 = [(_MKPlaceEVChargerTicket *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ticket, a3);
  }

  return v7;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)[(GEOMapServiceRefreshEVChargerTicket *)self->_ticket traits];
}

- (void)cancel
{
}

- (void)submitRefreshRequestWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6 = a3;
  ticket = self->_ticket;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke;
  v9[3] = &unk_1E54B83D0;
  id v10 = v6;
  id v8 = v6;
  [(GEOMapServiceRefreshEVChargerTicket *)ticket submitRefreshRequestWithHandler:v9 networkActivity:a4];
}

- (void).cxx_destruct
{
}

@end