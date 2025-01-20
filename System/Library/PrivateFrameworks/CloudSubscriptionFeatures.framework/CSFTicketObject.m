@interface CSFTicketObject
- (CSFTicketObject)initWithTicket:(id)a3 withStatus:(unint64_t)a4;
- (NSString)ticket;
- (unint64_t)status;
- (void)setStatus:(unint64_t)a3;
- (void)setTicket:(id)a3;
@end

@implementation CSFTicketObject

- (CSFTicketObject)initWithTicket:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSFTicketObject;
  v7 = [(CSFTicketObject *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CSFTicketObject *)v7 setTicket:v6];
    [(CSFTicketObject *)v8 setStatus:a4];
  }

  return v8;
}

- (NSString)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end