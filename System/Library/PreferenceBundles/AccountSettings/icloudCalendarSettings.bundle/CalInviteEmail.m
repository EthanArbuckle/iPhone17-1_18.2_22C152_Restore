@interface CalInviteEmail
- (BOOL)send;
- (CalInviteEmail)initWithDictionary:(id)a3;
- (NSString)address;
- (NSString)receive;
- (id)description;
- (id)toDictionary;
- (void)setAddress:(id)a3;
- (void)setReceive:(id)a3;
- (void)setSend:(BOOL)a3;
@end

@implementation CalInviteEmail

- (CalInviteEmail)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalInviteEmail;
  v5 = [(CalInviteEmail *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"send"];
    v5->_send = [v8 BOOLValue];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"receive"];
    receive = v5->_receive;
    v5->_receive = (NSString *)v9;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(CalInviteEmail *)self address];
  [v3 setValue:v4 forKey:@"address"];

  v5 = +[NSNumber numberWithBool:[(CalInviteEmail *)self send]];
  [v3 setValue:v5 forKey:@"send"];

  uint64_t v6 = [(CalInviteEmail *)self receive];
  [v3 setValue:v6 forKey:@"receive"];

  return v3;
}

- (id)description
{
  id v3 = [(CalInviteEmail *)self address];
  id v4 = +[NSNumber numberWithBool:[(CalInviteEmail *)self send]];
  v5 = [(CalInviteEmail *)self receive];
  uint64_t v6 = +[NSString stringWithFormat:@"address => %@ send => %@ receive=> %@", v3, v4, v5];

  return v6;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (BOOL)send
{
  return self->_send;
}

- (void)setSend:(BOOL)a3
{
  self->_send = a3;
}

- (NSString)receive
{
  return self->_receive;
}

- (void)setReceive:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receive, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end