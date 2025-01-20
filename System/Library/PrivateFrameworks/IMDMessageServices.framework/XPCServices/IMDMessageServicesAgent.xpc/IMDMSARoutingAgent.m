@interface IMDMSARoutingAgent
- (BOOL)canSendMessage:(id)a3;
- (BOOL)shouldSendMessage:(id)a3;
- (void)getRoutableMessages:(id)a3;
@end

@implementation IMDMSARoutingAgent

- (BOOL)shouldSendMessage:(id)a3
{
  return 0;
}

- (BOOL)canSendMessage:(id)a3
{
  return 0;
}

- (void)getRoutableMessages:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, double))a3 + 2))(a3, 0, 0.0);
  }
}

@end