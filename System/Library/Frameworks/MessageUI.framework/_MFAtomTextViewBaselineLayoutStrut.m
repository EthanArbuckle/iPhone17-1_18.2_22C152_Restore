@interface _MFAtomTextViewBaselineLayoutStrut
- (CGSize)intrinsicContentSize;
@end

@implementation _MFAtomTextViewBaselineLayoutStrut

- (CGSize)intrinsicContentSize
{
  v3 = [(_MFAtomTextViewBaselineLayoutStrut *)self font];
  objc_msgSend(@"X", "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v3, -[_MFAtomTextViewBaselineLayoutStrut lineBreakMode](self, "lineBreakMode"), 3.40282347e38, 0.0);
  double v5 = v4;
  double v6 = *MEMORY[0x1E4F1DB30];

  double v7 = v6;
  double v8 = v5;
  result.height = v8;
  result.width = v7;
  return result;
}

@end