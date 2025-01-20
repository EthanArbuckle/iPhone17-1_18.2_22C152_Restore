@interface SAIntentGroupActivityIndicatorSnippetTemplate
- (Class)templateViewControllerClass;
- (unint64_t)paddingValue;
@end

@implementation SAIntentGroupActivityIndicatorSnippetTemplate

- (Class)templateViewControllerClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)paddingValue
{
  return 0;
}

@end