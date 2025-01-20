@interface CDPEscapeOption
+ (id)cancelOption;
+ (id)okOption;
- (NSString)progressLabel;
- (NSString)progressTitle;
- (NSString)title;
- (NSString)titleLocalizationKey;
- (NSString)titleTelemetryKey;
- (id)canShowEscapeOption;
- (id)escapeAction;
- (unint64_t)style;
- (void)setCanShowEscapeOption:(id)a3;
- (void)setEscapeAction:(id)a3;
- (void)setProgressLabel:(id)a3;
- (void)setProgressTitle:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocalizationKey:(id)a3;
- (void)setTitleTelemetryKey:(id)a3;
@end

@implementation CDPEscapeOption

+ (id)cancelOption
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setStyle:1];
  v3 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_CANCEL_BUTTON"];
  v4 = [v3 localizedString];
  [v2 setTitle:v4];

  [v2 setTitleLocalizationKey:@"GENERIC_CANCEL_BUTTON"];
  [v2 setTitleTelemetryKey:*MEMORY[0x263F34858]];

  return v2;
}

+ (id)okOption
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setStyle:0];
  v3 = [MEMORY[0x263F343B8] builderForKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  v4 = [v3 localizedString];
  [v2 setTitle:v4];

  [v2 setTitleLocalizationKey:@"GENERIC_ERROR_DEFAULT_BUTTON"];
  [v2 setTitleTelemetryKey:*MEMORY[0x263F34888]];

  return v2;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)titleLocalizationKey
{
  return self->_titleLocalizationKey;
}

- (void)setTitleLocalizationKey:(id)a3
{
}

- (NSString)titleTelemetryKey
{
  return self->_titleTelemetryKey;
}

- (void)setTitleTelemetryKey:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (id)escapeAction
{
  return self->_escapeAction;
}

- (void)setEscapeAction:(id)a3
{
}

- (id)canShowEscapeOption
{
  return self->_canShowEscapeOption;
}

- (void)setCanShowEscapeOption:(id)a3
{
}

- (NSString)progressTitle
{
  return self->_progressTitle;
}

- (void)setProgressTitle:(id)a3
{
}

- (NSString)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressTitle, 0);
  objc_storeStrong(&self->_canShowEscapeOption, 0);
  objc_storeStrong(&self->_escapeAction, 0);
  objc_storeStrong((id *)&self->_titleTelemetryKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end