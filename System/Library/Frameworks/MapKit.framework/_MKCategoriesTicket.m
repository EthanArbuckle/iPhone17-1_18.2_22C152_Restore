@interface _MKCategoriesTicket
- (GEOMapServiceTraits)traits;
- (_MKCategoriesTicket)initWithTicket:(id)a3;
- (void)cancel;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _MKCategoriesTicket

- (_MKCategoriesTicket)initWithTicket:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKCategoriesTicket;
  v6 = [(_MKCategoriesTicket *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ticket, a3);
    v8 = v7;
  }

  return v7;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    ticket = self->_ticket;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57___MKCategoriesTicket_submitWithHandler_networkActivity___block_invoke;
    v11[3] = &unk_1E54B83D0;
    id v12 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57___MKCategoriesTicket_submitWithHandler_networkActivity___block_invoke_3;
    v9[3] = &unk_1E54B89C0;
    id v10 = v7;
    [(GEOMapServiceCategoriesTicket *)ticket submitWithHandler:v11 networkActivity:v9];
  }
}

- (void)cancel
{
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)[(GEOMapServiceCategoriesTicket *)self->_ticket traits];
}

- (void).cxx_destruct
{
}

@end