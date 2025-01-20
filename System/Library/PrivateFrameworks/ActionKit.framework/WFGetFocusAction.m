@interface WFGetFocusAction
- (id)contentDestinationWithError:(id *)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetFocusAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  objc_msgSend(MEMORY[0x263F86B68], "activeMode", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ([v8 isPlaceholder])
  {
    [(WFGetFocusAction *)self finishRunningWithError:0];
  }
  else
  {
    v4 = [v8 activityIdentifier];
    if ([v4 length])
    {
      v5 = [[WFFocusMode alloc] initWithFCActivityDescribing:v8];
      v6 = +[WFContentItem itemWithObject:v5];
      if (v6)
      {
        v7 = [(WFGetFocusAction *)self output];
        [v7 addItem:v6];
      }
      [(WFGetFocusAction *)self finishRunningWithError:0];
    }
    else
    {
      [(WFGetFocusAction *)self finishRunningWithError:0];
    }
  }
}

@end