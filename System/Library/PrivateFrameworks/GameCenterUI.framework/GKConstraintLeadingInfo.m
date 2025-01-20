@interface GKConstraintLeadingInfo
- (NSString)fontTextStyle;
- (double)leading;
- (void)setFontTextStyle:(id)a3;
- (void)setLeading:(double)a3;
@end

@implementation GKConstraintLeadingInfo

- (NSString)fontTextStyle
{
  return self->_fontTextStyle;
}

- (void)setFontTextStyle:(id)a3
{
}

- (double)leading
{
  return self->_leading;
}

- (void)setLeading:(double)a3
{
  self->_leading = a3;
}

- (void).cxx_destruct
{
}

@end