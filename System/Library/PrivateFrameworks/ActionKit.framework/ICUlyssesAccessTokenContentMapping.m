@interface ICUlyssesAccessTokenContentMapping
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICUlyssesAccessTokenContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  v6 = (void *)MEMORY[0x263EFFA40];
  id v7 = a3;
  id v9 = [v6 workflowUserDefaults];
  v8 = [v9 stringForKey:@"WFUlyssesAccessToken"];
  (*((void (**)(id, void *, void))a3 + 2))(v7, v8, 0);
}

@end