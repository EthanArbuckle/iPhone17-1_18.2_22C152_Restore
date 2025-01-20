@interface UILabel
- (void)setAttributedOrPlainText:(id)a3;
@end

@implementation UILabel

- (void)setAttributedOrPlainText:(id)a3
{
  CFStringRef v7 = (const __CFString *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = self;
    CFStringRef v5 = v7;
LABEL_3:
    [(UILabel *)v4 setText:v5];
LABEL_6:
    v6 = (__CFString *)v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UILabel *)self setAttributedText:v7];
    goto LABEL_6;
  }
  v6 = (__CFString *)v7;
  if (!v7)
  {
    CFStringRef v5 = &stru_1002D6110;
    v4 = self;
    goto LABEL_3;
  }
LABEL_7:
}

@end