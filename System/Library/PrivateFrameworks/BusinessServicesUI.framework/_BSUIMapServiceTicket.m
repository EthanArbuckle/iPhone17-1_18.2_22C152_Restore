@interface _BSUIMapServiceTicket
- (void)submitWithHandler:(id)a3;
@end

@implementation _BSUIMapServiceTicket

- (void)submitWithHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    self = (_BSUIMapServiceTicket *)self->_serviceTicket;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43___BSUIMapServiceTicket_submitWithHandler___block_invoke;
  v6[3] = &unk_265075B90;
  id v7 = v4;
  id v5 = v4;
  [(_BSUIMapServiceTicket *)self submitWithHandler:v6 networkActivity:0];
}

- (void).cxx_destruct
{
}

@end