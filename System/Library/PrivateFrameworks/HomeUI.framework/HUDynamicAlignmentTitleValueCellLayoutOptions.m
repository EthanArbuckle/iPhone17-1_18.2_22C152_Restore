@interface HUDynamicAlignmentTitleValueCellLayoutOptions
- (HUDynamicAlignmentTitleValueCellLayoutOptions)initWithCellSizeSubclass:(int64_t)a3 longestPossibleValueText:(id)a4 longestPossibleTitleText:(id)a5;
- (NSString)longestPossibleTitleText;
- (NSString)longestPossibleValueText;
- (void)setLongestPossibleTitleText:(id)a3;
- (void)setLongestPossibleValueText:(id)a3;
@end

@implementation HUDynamicAlignmentTitleValueCellLayoutOptions

- (HUDynamicAlignmentTitleValueCellLayoutOptions)initWithCellSizeSubclass:(int64_t)a3 longestPossibleValueText:(id)a4 longestPossibleTitleText:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUDynamicAlignmentTitleValueCellLayoutOptions;
  v10 = [(HUGridCellLayoutOptions *)&v13 initWithCellSizeSubclass:a3];
  v11 = v10;
  if (v10)
  {
    [(HUDynamicAlignmentTitleValueCellLayoutOptions *)v10 setLongestPossibleValueText:v8];
    [(HUDynamicAlignmentTitleValueCellLayoutOptions *)v11 setLongestPossibleTitleText:v9];
  }

  return v11;
}

- (NSString)longestPossibleValueText
{
  return self->_longestPossibleValueText;
}

- (void)setLongestPossibleValueText:(id)a3
{
}

- (NSString)longestPossibleTitleText
{
  return self->_longestPossibleTitleText;
}

- (void)setLongestPossibleTitleText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longestPossibleTitleText, 0);

  objc_storeStrong((id *)&self->_longestPossibleValueText, 0);
}

@end