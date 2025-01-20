@interface CNPropertyAddressingGrammarLabeledEditingCell
+ (BOOL)wantsChevron;
+ (BOOL)wantsHorizontalLayout;
- (BOOL)allowsCellSelection;
@end

@implementation CNPropertyAddressingGrammarLabeledEditingCell

+ (BOOL)wantsChevron
{
  return 0;
}

+ (BOOL)wantsHorizontalLayout
{
  return 1;
}

- (BOOL)allowsCellSelection
{
  return 0;
}

@end