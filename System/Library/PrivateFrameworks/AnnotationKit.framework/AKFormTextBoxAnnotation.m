@interface AKFormTextBoxAnnotation
+ (BOOL)deleteAfterEditingIfEmpty;
+ (id)defaultPlaceholderText;
@end

@implementation AKFormTextBoxAnnotation

+ (BOOL)deleteAfterEditingIfEmpty
{
  return 1;
}

+ (id)defaultPlaceholderText
{
  return 0;
}

@end