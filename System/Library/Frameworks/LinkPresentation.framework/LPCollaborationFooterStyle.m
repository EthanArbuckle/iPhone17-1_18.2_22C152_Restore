@interface LPCollaborationFooterStyle
- (BOOL)ignoreSafeAreaInset;
- (BOOL)showSeparator;
- (BOOL)useFullWidth;
- (BOOL)useFullWidthDuringSizing;
- (BOOL)useInlineIndicator;
- (BOOL)useSafeAreaInsetWithPadding;
- (LPCollaborationFooterStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5;
- (LPPadding)margin;
- (LPPadding)padding;
- (LPPadding)separatorMargin;
- (LPPointUnit)cornerRadius;
- (LPPointUnit)indicatorSpacing;
- (LPTextViewStyle)handle;
- (LPTextViewStyle)options;
- (UIColor)backgroundColor;
- (void)setBackgroundColor:(id)a3;
- (void)setCornerRadius:(id)a3;
- (void)setIgnoreSafeAreaInset:(BOOL)a3;
- (void)setIndicatorSpacing:(id)a3;
- (void)setShowSeparator:(BOOL)a3;
- (void)setUseFullWidth:(BOOL)a3;
- (void)setUseFullWidthDuringSizing:(BOOL)a3;
- (void)setUseInlineIndicator:(BOOL)a3;
- (void)setUseSafeAreaInsetWithPadding:(BOOL)a3;
@end

@implementation LPCollaborationFooterStyle

- (LPCollaborationFooterStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  v33.receiver = self;
  v33.super_class = (Class)LPCollaborationFooterStyle;
  v8 = [(LPCollaborationFooterStyle *)&v33 init];
  if (v8)
  {
    v9 = objc_alloc_init(LPPadding);
    margin = v8->_margin;
    v8->_margin = v9;

    v11 = [[LPPointUnit alloc] initWithValue:16.0];
    [(LPPadding *)v8->_margin setBottom:v11];

    v12 = objc_alloc_init(LPPadding);
    separatorMargin = v8->_separatorMargin;
    v8->_separatorMargin = v12;

    v14 = [(LPPadding *)v8->_margin bottom];
    [(LPPadding *)v8->_separatorMargin setBottom:v14];

    v15 = objc_alloc_init(LPPadding);
    padding = v8->_padding;
    v8->_padding = v15;

    *(_DWORD *)&v8->_showSeparator = 16777473;
    v8->_ignoreSafeAreaInset = 0;
    v17 = [[LPPointUnit alloc] initWithValue:8.0];
    indicatorSpacing = v8->_indicatorSpacing;
    v8->_indicatorSpacing = v17;

    v19 = [[LPTextViewStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    options = v8->_options;
    v8->_options = v19;

    if (+[LPTestingOverrides forceMonospaceFonts])
    {
      uint64_t v21 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB29C0]];
    }
    else
    {
      if (a4 == 12 || a4 == 2)
      {
        v22 = (void **)MEMORY[0x1E4FB2950];
        if (a3 == 5) {
          v22 = (void **)MEMORY[0x1E4FB28C8];
        }
      }
      else
      {
        v22 = (void **)MEMORY[0x1E4FB28F0];
      }
      uint64_t v21 = fontWithTraits(*v22, 0x8000, a4);
    }
    v23 = (void *)v21;
    [(LPTextViewStyle *)v8->_options setFont:v21];

    if (a3 == 5) {
      [MEMORY[0x1E4FB1618] labelColor];
    }
    else {
    v24 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    [(LPTextViewStyle *)v8->_options setColor:v24];

    v25 = [[LPTextViewStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    handle = v8->_handle;
    v8->_handle = v25;

    if (+[LPTestingOverrides forceMonospaceFonts])
    {
      uint64_t v27 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29C0]];
    }
    else
    {
      v28 = (void **)MEMORY[0x1E4FB28F0];
      if (a3 != 5) {
        v28 = (void **)MEMORY[0x1E4FB28E0];
      }
      uint64_t v27 = fontWithTraits(*v28, 0, a4);
    }
    v29 = (void *)v27;
    [(LPTextViewStyle *)v8->_handle setFont:v27];

    v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(LPTextViewStyle *)v8->_handle setColor:v30];

    v31 = v8;
  }

  return v8;
}

- (LPPadding)margin
{
  return self->_margin;
}

- (LPPadding)separatorMargin
{
  return self->_separatorMargin;
}

- (LPPadding)padding
{
  return self->_padding;
}

- (LPPointUnit)indicatorSpacing
{
  return self->_indicatorSpacing;
}

- (void)setIndicatorSpacing:(id)a3
{
}

- (LPPointUnit)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
}

- (LPTextViewStyle)options
{
  return self->_options;
}

- (LPTextViewStyle)handle
{
  return self->_handle;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (void)setShowSeparator:(BOOL)a3
{
  self->_showSeparator = a3;
}

- (BOOL)useFullWidth
{
  return self->_useFullWidth;
}

- (void)setUseFullWidth:(BOOL)a3
{
  self->_useFullWidth = a3;
}

- (BOOL)useInlineIndicator
{
  return self->_useInlineIndicator;
}

- (void)setUseInlineIndicator:(BOOL)a3
{
  self->_useInlineIndicator = a3;
}

- (BOOL)useFullWidthDuringSizing
{
  return self->_useFullWidthDuringSizing;
}

- (void)setUseFullWidthDuringSizing:(BOOL)a3
{
  self->_useFullWidthDuringSizing = a3;
}

- (BOOL)ignoreSafeAreaInset
{
  return self->_ignoreSafeAreaInset;
}

- (void)setIgnoreSafeAreaInset:(BOOL)a3
{
  self->_ignoreSafeAreaInset = a3;
}

- (BOOL)useSafeAreaInsetWithPadding
{
  return self->_useSafeAreaInsetWithPadding;
}

- (void)setUseSafeAreaInsetWithPadding:(BOOL)a3
{
  self->_useSafeAreaInsetWithPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_indicatorSpacing, 0);
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_separatorMargin, 0);

  objc_storeStrong((id *)&self->_margin, 0);
}

@end