@interface ACTUserAction
- (id)shortDescription;
- (id)twoKeyTapShortDescription;
- (unint64_t)inputSegment;
- (void)setInputSegment:(unint64_t)a3;
@end

@implementation ACTUserAction

- (id)shortDescription
{
  v3 = [(ACTUserAction *)self description];
  v4 = [(ACTUserAction *)self description];
  v5 = (char *)[v4 length] - 1;

  if ((unint64_t)v5 >= 0x20) {
    uint64_t v6 = 32;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  v7 = [v3 substringToIndex:v6];

  return v7;
}

- (unint64_t)inputSegment
{
  return self->_inputSegment;
}

- (void)setInputSegment:(unint64_t)a3
{
  self->_inputSegment = a3;
}

- (id)twoKeyTapShortDescription
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v3 = [(ACTUserAction *)self performSelector:"firstTap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 abbreviatedDescription];
    }
    else {
    v5 = [v3 shortDescription];
    }
    uint64_t v6 = [(ACTUserAction *)self performSelector:"secondTap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 abbreviatedDescription];
    }
    else {
    v7 = [v6 shortDescription];
    }
    v8 = [v5 stringByPaddingToLength:7 withString:@" " startingAtIndex:0];
    v9 = [v7 stringByPaddingToLength:7 withString:@" " startingAtIndex:0];
    v4 = +[NSString stringWithFormat:@"%@ %@", v8, v9];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end