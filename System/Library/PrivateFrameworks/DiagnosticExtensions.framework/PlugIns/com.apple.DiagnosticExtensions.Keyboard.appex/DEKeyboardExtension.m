@interface DEKeyboardExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEKeyboardExtension

- (id)attachmentsForParameters:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"];
  if ([v4 BOOLValue])
  {
    v5 = +[NSRegularExpression regularExpressionWithPattern:@".*" options:1 error:0];
    v6 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Keyboard"];
    v7 = [(DEKeyboardExtension *)self filesInDir:v6 matchingPattern:v5 excludingPattern:0];

    v8 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Keyboard/Typology"];
    v9 = [(DEKeyboardExtension *)self filesInDir:v8 matchingPattern:v5 excludingPattern:0];

    if ([v9 count])
    {
      uint64_t v10 = [v7 arrayByAddingObjectsFromArray:v9];

      v7 = (void *)v10;
    }
  }
  else
  {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

@end