@interface _MKPlaceHikingIntroTipTicket
- (GEOMapServiceTraits)traits;
- (_MKPlaceHikingIntroTipTicket)initWithTicket:(id)a3;
- (void)cancel;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _MKPlaceHikingIntroTipTicket

- (_MKPlaceHikingIntroTipTicket)initWithTicket:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKPlaceHikingIntroTipTicket;
  v6 = [(_MKPlaceHikingIntroTipTicket *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ticket, a3);
  }

  return v7;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)[(GEOMapServiceHikingIntroTipTicket *)self->_ticket traits];
}

- (void)cancel
{
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6 = a3;
  ticket = self->_ticket;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke;
  v9[3] = &unk_1E54BB1A0;
  id v10 = v6;
  id v8 = v6;
  [(GEOMapServiceHikingIntroTipTicket *)ticket submitWithHandler:v9 networkActivity:a4];
}

- (void).cxx_destruct
{
}

@end