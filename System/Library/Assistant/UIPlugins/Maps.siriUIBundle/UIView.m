@interface UIView
- (void)_ma_updateSemanticContentAttribute;
@end

@implementation UIView

- (void)_ma_updateSemanticContentAttribute
{
  v3 = +[NSBundle afui_assistantUIFrameworkBundle];
  unsigned int v4 = [v3 assistantLanguageIsRTL];

  if (v4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 3;
  }

  [(UIView *)self setSemanticContentAttribute:v5];
}

@end