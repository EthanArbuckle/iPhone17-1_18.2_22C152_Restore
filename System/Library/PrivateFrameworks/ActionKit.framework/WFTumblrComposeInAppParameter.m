@interface WFTumblrComposeInAppParameter
- (BOOL)isHidden;
- (BOOL)parameterStateIsValid:(id)a3;
- (id)defaultSerializedRepresentation;
- (void)appRegistry:(id)a3 installStatusChangedForApp:(id)a4;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFTumblrComposeInAppParameter

- (void)appRegistry:(id)a3 installStatusChangedForApp:(id)a4
{
  [(WFTumblrComposeInAppParameter *)self attributesDidChange];
  [(WFTumblrComposeInAppParameter *)self stateValidityCriteriaDidChange];
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFTumblrComposeInAppParameter;
  if (![(WFTumblrComposeInAppParameter *)&v9 parameterStateIsValid:v4]) {
    goto LABEL_4;
  }
  v5 = [v4 number];
  if (![v5 BOOLValue])
  {

    goto LABEL_6;
  }
  BOOL v6 = [(WFTumblrComposeInAppParameter *)self isHidden];

  if (!v6)
  {
LABEL_6:
    BOOL v7 = 1;
    goto LABEL_7;
  }
LABEL_4:
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)isHidden
{
  v2 = [MEMORY[0x263F86828] sharedRegistry];
  v3 = [v2 appWithIdentifier:@"com.tumblr.tumblr"];
  char v4 = [v3 isInstalled] ^ 1;

  return v4;
}

- (void)wasRemovedFromWorkflow
{
  v6[1] = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)WFTumblrComposeInAppParameter;
  [(WFTumblrComposeInAppParameter *)&v5 wasRemovedFromWorkflow];
  v3 = [MEMORY[0x263F86828] sharedRegistry];
  v6[0] = @"com.tumblr.tumblr";
  char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 removeInstallStatusObserver:self forAppIdentifiers:v4];
}

- (void)wasAddedToWorkflow
{
  v6[1] = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)WFTumblrComposeInAppParameter;
  [(WFTumblrComposeInAppParameter *)&v5 wasAddedToWorkflow];
  v3 = [MEMORY[0x263F86828] sharedRegistry];
  v6[0] = @"com.tumblr.tumblr";
  char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 addInstallStatusObserver:self forAppIdentifiers:v4];
}

- (id)defaultSerializedRepresentation
{
  return (id)[MEMORY[0x263F86948] serializedRepresentationFromNumber:MEMORY[0x263EFFA80]];
}

@end