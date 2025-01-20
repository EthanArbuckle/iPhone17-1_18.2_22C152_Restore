@interface _MKSearchHomeTicket
- (GEOMapServiceTraits)traits;
- (_MKSearchHomeTicket)initWithTicket:(id)a3;
- (void)cancel;
- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _MKSearchHomeTicket

- (_MKSearchHomeTicket)initWithTicket:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKSearchHomeTicket;
  v6 = [(_MKSearchHomeTicket *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ticket, a3);
  }

  return v7;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)[(GEOMapServiceSearchHomeTicket *)self->_ticket traits];
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  ticket = self->_ticket;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71___MKSearchHomeTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v13[3] = &unk_1E54BB088;
  id v14 = v8;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  [(GEOMapServiceSearchHomeTicket *)ticket submitWithHandler:v13 networkActivity:a5];
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end