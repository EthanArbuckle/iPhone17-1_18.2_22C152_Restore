@interface WFAirDropAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
@end

@implementation WFAirDropAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  v9 = WFLocalizedString(@"Allow “%1$@” to send %2$@ with AirDrop?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "airdropLocation", a3);
}

@end