@interface _GEOMapsHomeTicket
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEOMapsHomeTicket

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56___GEOMapsHomeTicket_submitWithHandler_networkActivity___block_invoke;
    v8[3] = &unk_1E53DEBA0;
    id v9 = v6;
    [(GEOAbstractRequestResponseTicket *)self performSubmitWithHandler:v8 auditToken:0 timeout:a4 networkActivity:0.0];
  }
}

@end