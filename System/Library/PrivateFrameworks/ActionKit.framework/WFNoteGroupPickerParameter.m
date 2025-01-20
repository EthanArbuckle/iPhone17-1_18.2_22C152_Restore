@interface WFNoteGroupPickerParameter
- (Class)singleStateClass;
@end

@implementation WFNoteGroupPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end