@interface _MKTransitLineTicket
- (GEOMapServiceTraits)traits;
- (_MKTransitLineTicket)initWithTicket:(id)a3;
- (void)cancel;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _MKTransitLineTicket

- (_MKTransitLineTicket)initWithTicket:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKTransitLineTicket;
  v6 = [(_MKTransitLineTicket *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ticket, a3);
  }

  return v7;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)[(GEOMapServiceTransitLineTicket *)self->_ticket traits];
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6 = a3;
  ticket = self->_ticket;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58___MKTransitLineTicket_submitWithHandler_networkActivity___block_invoke;
  v9[3] = &unk_1E54B83D0;
  id v10 = v6;
  id v8 = v6;
  [(GEOMapServiceTransitLineTicket *)ticket submitWithHandler:v9 networkActivity:a4];
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end