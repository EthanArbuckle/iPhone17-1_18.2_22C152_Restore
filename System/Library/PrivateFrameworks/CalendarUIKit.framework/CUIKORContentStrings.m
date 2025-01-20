@interface CUIKORContentStrings
- (NSArray)nonNilComponents;
- (NSAttributedString)combinedString;
- (NSAttributedString)locationString;
- (NSAttributedString)timeString;
- (NSAttributedString)titleString;
- (NSAttributedString)trailingString;
- (void)setCombinedString:(id)a3;
- (void)setLocationString:(id)a3;
- (void)setTimeString:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setTrailingString:(id)a3;
@end

@implementation CUIKORContentStrings

- (void)setTrailingString:(id)a3
{
}

- (void)setTitleString:(id)a3
{
}

- (void)setTimeString:(id)a3
{
}

- (void)setLocationString:(id)a3
{
}

- (void)setCombinedString:(id)a3
{
}

- (NSAttributedString)combinedString
{
  return self->_combinedString;
}

- (NSArray)nonNilComponents
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  v4 = [(CUIKORContentStrings *)self titleString];

  if (v4)
  {
    v5 = [(CUIKORContentStrings *)self titleString];
    [v3 addObject:v5];
  }
  v6 = [(CUIKORContentStrings *)self locationString];

  if (v6)
  {
    v7 = [(CUIKORContentStrings *)self locationString];
    [v3 addObject:v7];
  }
  v8 = [(CUIKORContentStrings *)self timeString];

  if (v8)
  {
    v9 = [(CUIKORContentStrings *)self timeString];
    [v3 addObject:v9];
  }
  v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (NSAttributedString)titleString
{
  return self->_titleString;
}

- (NSAttributedString)timeString
{
  return self->_timeString;
}

- (NSAttributedString)locationString
{
  return self->_locationString;
}

- (NSAttributedString)trailingString
{
  return self->_trailingString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingString, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);

  objc_storeStrong((id *)&self->_combinedString, 0);
}

@end