@interface SAIntentGroupTextSnippetTemplate
- (Class)templateViewControllerClass;
- (unint64_t)alignmentValue;
- (unint64_t)paddingValue;
- (void)setAlignmentValue:(unint64_t)a3;
@end

@implementation SAIntentGroupTextSnippetTemplate

- (Class)templateViewControllerClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)alignmentValue
{
  v2 = [(SAIntentGroupTextSnippetTemplate *)self alignment];
  unint64_t v3 = +[SiriIntentsTemplateModelEnumMapper templateAlignmentFromString:v2];

  return v3;
}

- (void)setAlignmentValue:(unint64_t)a3
{
  id v4 = +[SiriIntentsTemplateModelEnumMapper stringFromTemplateAlignment:a3];
  [(SAIntentGroupTextSnippetTemplate *)self setAlignment:v4];
}

- (unint64_t)paddingValue
{
  return 0;
}

@end