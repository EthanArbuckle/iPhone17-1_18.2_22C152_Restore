@interface SAIntentGroupSnippetTemplate
- (Class)templateViewControllerClass;
- (NSString)commandIdentifier;
- (NSString)detailIdentifier;
- (SAServerBoundCommand)intents_serverBoundCommand;
@end

@implementation SAIntentGroupSnippetTemplate

- (Class)templateViewControllerClass
{
  return (Class)objc_opt_class();
}

- (NSString)detailIdentifier
{
  v2 = [(SAIntentGroupSnippetTemplate *)self detailSnippet];
  v3 = [v2 aceId];

  return (NSString *)v3;
}

- (NSString)commandIdentifier
{
  return 0;
}

- (SAServerBoundCommand)intents_serverBoundCommand
{
  return 0;
}

@end