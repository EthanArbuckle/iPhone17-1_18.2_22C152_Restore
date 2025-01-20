@interface CSProminentSubtitleDateView
+ (unint64_t)elementType;
- (BOOL)_wantsCompactForOrientation;
- (CSProminentSubtitleDateView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5;
- (CSProminentSubtitleDateView)initWithDate:(id)a3 textColor:(id)a4;
- (NSDateFormatter)alternateDateFormatter;
- (NSDateFormatter)formatter;
- (NSLocale)alternateCalendarLocale;
- (NSString)alternateCalendarIdentifier;
- (id)_alternateDateString;
- (id)_dateString;
- (id)overrideString;
- (void)_updateLabel;
- (void)setAlternateCalendarIdentifier:(id)a3;
- (void)setAlternateCalendarIdentifier:(id)a3 locale:(id)a4;
- (void)setAlternateCalendarLocale:(id)a3;
- (void)setAlternateDateFormatter:(id)a3;
- (void)setDate:(id)a3;
- (void)setFormatter:(id)a3;
@end

@implementation CSProminentSubtitleDateView

- (void)setDate:(id)a3
{
  id v4 = a3;
  v5 = [(CSProminentTextElementView *)self date];
  v7.receiver = self;
  v7.super_class = (Class)CSProminentSubtitleDateView;
  [(CSProminentTextElementView *)&v7 setDate:v4];
  char v6 = BSEqualObjects();

  if ((v6 & 1) == 0) {
    [(CSProminentSubtitleDateView *)self _updateLabel];
  }
}

- (void)_updateLabel
{
  v3 = [(CSProminentTextElementView *)self textLabel];
  id v4 = [(CSProminentSubtitleDateView *)self overrideString];
  [v3 setText:v4];

  [(CSProminentSubtitleDateView *)self setNeedsLayout];
}

- (id)overrideString
{
  v3 = [(CSProminentTextElementView *)self date];
  if (v3)
  {
    id v4 = [(CSProminentSubtitleDateView *)self _dateString];
    v5 = [(CSProminentSubtitleDateView *)self _alternateDateString];
    if (v5)
    {
      id v6 = [NSString stringWithFormat:@"%@ · %@", v4, v5];
    }
    else
    {
      id v6 = v4;
    }
    objc_super v7 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CSProminentSubtitleDateView;
    objc_super v7 = [(CSProminentTextElementView *)&v9 overrideString];
  }

  return v7;
}

- (id)_dateString
{
  v3 = [MEMORY[0x1E4F1CA20] preferredLocale];
  if (!self->_formatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatter = self->_formatter;
    self->_formatter = v4;

    [(NSDateFormatter *)self->_formatter setLocale:v3];
    [(NSDateFormatter *)self->_formatter setFormattingContext:2];
  }
  if (self->_alternateCalendarIdentifier
    || [(CSProminentSubtitleDateView *)self _wantsCompactForOrientation])
  {
    id v6 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEE MMM d" options:0 locale:v3];
    objc_super v7 = CSFrameworkBundle();
    v8 = [v7 localizedStringForKey:@"DATE_FORMAT_CHARACTERS_TO_OMIT" value:&stru_1F047CE98 table:0];

    if ([v8 length])
    {
      objc_super v9 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v8];
      v10 = [v6 componentsSeparatedByCharactersInSet:v9];
      uint64_t v11 = [v10 componentsJoinedByString:&stru_1F047CE98];

      id v6 = (void *)v11;
    }
    [(NSDateFormatter *)self->_formatter setDateFormat:v6];
  }
  else
  {
    v12 = self->_formatter;
    id v6 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEEMMMMd" options:0 locale:v3];
    [(NSDateFormatter *)v12 setDateFormat:v6];
  }

  v13 = self->_formatter;
  v14 = [(CSProminentTextElementView *)self date];
  v15 = [(NSDateFormatter *)v13 stringFromDate:v14];

  return v15;
}

- (BOOL)_wantsCompactForOrientation
{
  v3 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v4 = [v3 deviceClass];

  if (v4 == 2) {
    return 0;
  }
  id v6 = [(CSProminentSubtitleDateView *)self window];
  BOOL v5 = (unint64_t)([v6 interfaceOrientation] - 3) < 2;

  return v5;
}

- (id)_alternateDateString
{
  v3 = [(CSProminentSubtitleDateView *)self alternateCalendarIdentifier];
  if (v3)
  {
    int v4 = [(CSProminentSubtitleDateView *)self alternateCalendarLocale];
    if (v4)
    {
      BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v3];
      if (v5)
      {
        alternateDateFormatter = self->_alternateDateFormatter;
        if (!alternateDateFormatter)
        {
          objc_super v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
          v8 = self->_alternateDateFormatter;
          self->_alternateDateFormatter = v7;

          alternateDateFormatter = self->_alternateDateFormatter;
        }
        [(NSDateFormatter *)alternateDateFormatter setCalendar:v5];
        [(NSDateFormatter *)self->_alternateDateFormatter setLocale:v4];
        [(NSDateFormatter *)self->_alternateDateFormatter setDateStyle:2];
        [(NSDateFormatter *)self->_alternateDateFormatter setLocalizedDateFormatFromTemplate:@"UMMMd"];
        objc_super v9 = self->_alternateDateFormatter;
        v10 = [(CSProminentTextElementView *)self date];
        uint64_t v11 = [(NSDateFormatter *)v9 stringFromDate:v10];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSString)alternateCalendarIdentifier
{
  return self->_alternateCalendarIdentifier;
}

- (CSProminentSubtitleDateView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() elementType];
  +[CSProminentLayoutController fontSizeForElementType:v9 isLandscapeVariant:0];
  double v11 = v10;
  +[CSProminentLayoutController fontWeightForElementType:v9];
  v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v11 weight:v12];
  v26.receiver = self;
  v26.super_class = (Class)CSProminentSubtitleDateView;
  v14 = [(CSProminentTextElementView *)&v26 initWithDate:v8 font:v13 textColor:v7];

  if (v14)
  {
    v15 = [(CSProminentTextElementView *)v14 textLabel];
    uint64_t v16 = objc_opt_class();
    id v17 = v15;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
    id v19 = v18;

    [v19 setAdjustsFontForContentSizeCategory:1];
    uint64_t v20 = *MEMORY[0x1E4FB2788];
    [v19 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2788]];
    [v19 setAdjustsFontSizeToFitWidth:1];

    v21 = [(CSProminentTextElementView *)v14 textLabel];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v23 = [(CSProminentTextElementView *)v14 textLabel];
      [v23 setAdjustsFontForContentSizeCategory:1];
      [v23 setMaximumContentSizeCategory:v20];
      [v23 setAdjustsFontSizeToFitWidth:1];
    }
    v24 = [(CSProminentTextElementView *)v14 textLabel];
    [v24 setMinimumScaleFactor:15.0 / v11];

    [(CSProminentSubtitleDateView *)v14 _updateLabel];
  }

  return v14;
}

- (CSProminentSubtitleDateView)initWithDate:(id)a3 textColor:(id)a4
{
  return [(CSProminentSubtitleDateView *)self initWithDate:a3 font:0 textColor:a4];
}

+ (unint64_t)elementType
{
  return 2;
}

- (void)setAlternateCalendarIdentifier:(id)a3 locale:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if (*(_OWORD *)&self->_alternateCalendarIdentifier != __PAIR128__((unint64_t)v7, (unint64_t)v8))
  {
    objc_storeStrong((id *)&self->_alternateCalendarIdentifier, a3);
    objc_storeStrong((id *)&self->_alternateCalendarLocale, a4);
    [(CSProminentSubtitleDateView *)self _updateLabel];
  }
}

- (NSDateFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (NSDateFormatter)alternateDateFormatter
{
  return self->_alternateDateFormatter;
}

- (void)setAlternateDateFormatter:(id)a3
{
}

- (void)setAlternateCalendarIdentifier:(id)a3
{
}

- (NSLocale)alternateCalendarLocale
{
  return self->_alternateCalendarLocale;
}

- (void)setAlternateCalendarLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateCalendarLocale, 0);
  objc_storeStrong((id *)&self->_alternateCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateDateFormatter, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

@end