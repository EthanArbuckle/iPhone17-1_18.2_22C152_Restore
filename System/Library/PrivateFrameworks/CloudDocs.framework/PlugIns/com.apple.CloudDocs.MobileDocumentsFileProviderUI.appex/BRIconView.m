@interface BRIconView
- (int)iconVariant;
- (void)setIconVariant:(int)a3;
@end

@implementation BRIconView

- (void)setIconVariant:(int)a3
{
  if (self->_iconVariant != a3)
  {
    CFStringRef v4 = @"HeaderIcon-large";
    if (a3 != 63) {
      CFStringRef v4 = 0;
    }
    if (((1 << a3) & 0x1000002) != 0) {
      CFStringRef v4 = @"HeaderIcon-regular";
    }
    if (((1 << a3) & 0x100008001) != 0) {
      CFStringRef v4 = @"HeaderIcon-compact";
    }
    if (a3 <= 0x3F) {
      CFStringRef v5 = v4;
    }
    else {
      CFStringRef v5 = 0;
    }
    v6 = +[UIImage imageNamed:v5];
    [(BRIconView *)self setImage:v6];

    LIIconContinuousCornerRadiusForVariant();
    -[BRIconView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  }
}

- (int)iconVariant
{
  return self->_iconVariant;
}

@end