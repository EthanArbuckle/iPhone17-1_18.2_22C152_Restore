@interface NSString(_INIntentsImpl)
+ (id)intents_makeFromWidgetPlistableRepresentation:()_INIntentsImpl;
- (id)intents_encodeForPlistRepresentationWithParameters:()_INIntentsImpl;
@end

@implementation NSString(_INIntentsImpl)

- (id)intents_encodeForPlistRepresentationWithParameters:()_INIntentsImpl
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 widgetPlistableRepresentationWithParameters:v4 error:0];
  }
  else
  {
    id v5 = a1;
  }
  v6 = v5;

  return v6;
}

+ (id)intents_makeFromWidgetPlistableRepresentation:()_INIntentsImpl
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 copy];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = +[INDeferredLocalizedString makeFromWidgetPlistableRepresentation:v3 error:0];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

@end