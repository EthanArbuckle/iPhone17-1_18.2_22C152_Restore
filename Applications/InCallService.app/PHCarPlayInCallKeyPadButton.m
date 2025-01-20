@interface PHCarPlayInCallKeyPadButton
+ (id)colorForKeyPadButtonType:(unint64_t)a3;
+ (id)titleForKeyPadButtonType:(unint64_t)a3;
+ (int64_t)alignmentForKeyPadButtonType:(unint64_t)a3;
+ (int64_t)symbolTypeForKeyPadButtonType:(unint64_t)a3;
- (BOOL)isUsingSmallFont;
- (PHCarPlayInCallKeyPadButton)initWithKeyPadButtonType:(unint64_t)a3 usingSmallFont:(BOOL)a4;
- (unint64_t)keyPadButtonType;
- (void)setTitle:(id)a3 alignment:(int64_t)a4 symbolType:(int64_t)a5 normalStateColor:(id)a6 usingSmallFont:(BOOL)a7;
- (void)setUsingSmallFont:(BOOL)a3;
@end

@implementation PHCarPlayInCallKeyPadButton

- (PHCarPlayInCallKeyPadButton)initWithKeyPadButtonType:(unint64_t)a3 usingSmallFont:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[PHCarPlayInCallKeyPadButton buttonWithType:0];

  if (v7)
  {
    v7->_keyPadButtonType = a3;
    v7->_usingSmallFont = v4;
    v8 = [(PHCarPlayInCallKeyPadButton *)v7 layer];
    [v8 setCornerRadius:3.0];

    [(PHCarPlayInCallKeyPadButton *)v7 setClipsToBounds:1];
    [(PHCarPlayInCallKeyPadButton *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    -[PHCarPlayInCallKeyPadButton setContentEdgeInsets:](v7, "setContentEdgeInsets:", 5.0, 5.0, 5.0, 5.0);
    v9 = [(id)objc_opt_class() titleForKeyPadButtonType:a3];
    id v10 = [(id)objc_opt_class() alignmentForKeyPadButtonType:a3];
    id v11 = [(id)objc_opt_class() symbolTypeForKeyPadButtonType:a3];
    v12 = [(id)objc_opt_class() colorForKeyPadButtonType:a3];
    [(PHCarPlayInCallKeyPadButton *)v7 setTitle:v9 alignment:v10 symbolType:v11 normalStateColor:v12 usingSmallFont:v4];
  }
  return v7;
}

- (void)setUsingSmallFont:(BOOL)a3
{
  if (self->_usingSmallFont != a3)
  {
    BOOL v3 = a3;
    self->_usingSmallFont = a3;
    [objc_opt_class() titleForKeyPadButtonType:[self keyPadButtonType]];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [objc_opt_class() alignmentForKeyPadButtonType:[self keyPadButtonType]];
    id v6 = [objc_opt_class() symbolTypeForKeyPadButtonType:[self keyPadButtonType]];
    v7 = [objc_opt_class() colorForKeyPadButtonType:[self keyPadButtonType]];
    [(PHCarPlayInCallKeyPadButton *)self setTitle:v8 alignment:v5 symbolType:v6 normalStateColor:v7 usingSmallFont:v3];
  }
}

- (void)setTitle:(id)a3 alignment:(int64_t)a4 symbolType:(int64_t)a5 normalStateColor:(id)a6 usingSmallFont:(BOOL)a7
{
  id v14 = +[NSMutableAttributedString mutableAttributedStringWithString:a3 alignment:a4 symbolType:a5 foregroundColor:a6 usingSmallFont:a7];
  id v8 = [v14 copy];
  [(PHCarPlayInCallKeyPadButton *)self setAttributedTitle:v8 forState:0];

  v9 = +[UIColor blackColor];
  [v14 setForegroundColor:v9];

  id v10 = [v14 copy];
  [(PHCarPlayInCallKeyPadButton *)self setAttributedTitle:v10 forState:4];
  [(PHCarPlayInCallKeyPadButton *)self setAttributedTitle:v10 forState:8];
  id v11 = +[UIColor blackColor];
  v12 = [v11 colorWithAlphaComponent:0.699999988];
  [v14 setForegroundColor:v12];

  id v13 = [v14 copy];
  [(PHCarPlayInCallKeyPadButton *)self setAttributedTitle:v13 forState:1];
}

+ (id)titleForKeyPadButtonType:(unint64_t)a3
{
  if (a3 == 1)
  {
    BOOL v3 = +[NSBundle mainBundle];
    BOOL v4 = v3;
    CFStringRef v5 = @"CARPLAY_END_BUTTON";
    goto LABEL_5;
  }
  if (!a3)
  {
    BOOL v3 = +[NSBundle mainBundle];
    BOOL v4 = v3;
    CFStringRef v5 = @"CARPLAY_CANCEL_BUTTON";
LABEL_5:
    id v6 = [v3 localizedStringForKey:v5 value:&stru_1002D6110 table:@"PHCarPlay"];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

+ (int64_t)alignmentForKeyPadButtonType:(unint64_t)a3
{
  return 2 * (a3 == 1);
}

+ (int64_t)symbolTypeForKeyPadButtonType:(unint64_t)a3
{
  int64_t v3 = 3;
  if (a3 != 1) {
    int64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return 40;
  }
}

+ (id)colorForKeyPadButtonType:(unint64_t)a3
{
  if (a3 == 1)
  {
    int64_t v3 = +[UIColor systemRedColor];
  }
  else if (a3)
  {
    int64_t v3 = 0;
  }
  else
  {
    int64_t v3 = +[UIColor systemTealColor];
  }

  return v3;
}

- (unint64_t)keyPadButtonType
{
  return self->_keyPadButtonType;
}

- (BOOL)isUsingSmallFont
{
  return self->_usingSmallFont;
}

@end