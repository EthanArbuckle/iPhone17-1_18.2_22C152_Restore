@interface _CNAtomTextViewBaselineLayoutStrut
- (CGSize)intrinsicContentSize;
@end

@implementation _CNAtomTextViewBaselineLayoutStrut

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x1E4F1DB30];
  v4 = [(_CNAtomTextViewBaselineLayoutStrut *)self font];
  objc_msgSend(@"X", "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v4, -[_CNAtomTextViewBaselineLayoutStrut lineBreakMode](self, "lineBreakMode"), 3.40282347e38, 0.0);
  double v6 = v5;

  double v7 = v3;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

@end