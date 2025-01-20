@interface CUIKSemiConstantCache
+ (id)sharedInstance;
- (CUIKSemiConstantCache)init;
- (UIFont)dayOccurrenceUncompressedSecondaryTextFont;
- (double)_cachedLineHeight:(double *)a3 style:(id)a4 size:(double)a5 regularSize:(double)a6;
- (double)dayOccurrenceMinimumCachedLineHeightCompact;
- (double)dayOccurrenceMinimumCachedLineHeightRegular;
- (double)dayOccurrenceMinimumCachedLineHeightSmallCompact;
- (double)dayOccurrenceMinimumCachedLineHeightSmallRegular;
- (double)dayReminderIntegrationCachedLineHeightCompact;
- (double)dayReminderIntegrationCachedLineHeightRegular;
- (double)dayReminderIntegrationCachedLineHeightSmallCompact;
- (double)dayReminderIntegrationCachedLineHeightSmallRegular;
- (id)_dayOccurrenceFontWithStyle:(id)a3 size:(double)a4 regularSize:(double)a5;
- (id)birthdayImageForFont:(id)a3;
- (id)commentIconStringForFont:(id)a3;
- (id)symbolImage:(id)a3 forFont:(id)a4;
- (void)updateMetrics;
@end

@implementation CUIKSemiConstantCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

- (double)dayOccurrenceMinimumCachedLineHeightCompact
{
  [(CUIKSemiConstantCache *)self _cachedLineHeight:&self->_dayOccurrenceMinimumCachedLineHeightCompact style:*MEMORY[0x1E4FB28F0] size:13.0 regularSize:7.5];
  return result;
}

- (double)_cachedLineHeight:(double *)a3 style:(id)a4 size:(double)a5 regularSize:(double)a6
{
  double v6 = *a3;
  if (*a3 < 0.0)
  {
    v8 = -[CUIKSemiConstantCache _dayOccurrenceFontWithStyle:size:regularSize:](self, "_dayOccurrenceFontWithStyle:size:regularSize:", a4, a5, a6, v6);
    *a3 = [(UIFont *)v8 cuik_lineHeight];

    return *a3;
  }
  return v6;
}

- (UIFont)dayOccurrenceUncompressedSecondaryTextFont
{
  dayOccurrenceUncompressedSecondaryTextFont = self->_dayOccurrenceUncompressedSecondaryTextFont;
  if (!dayOccurrenceUncompressedSecondaryTextFont)
  {
    v4 = [(CUIKSemiConstantCache *)self _dayOccurrenceFontWithStyle:*MEMORY[0x1E4FB28E0] size:11.0 regularSize:11.0];
    v5 = self->_dayOccurrenceUncompressedSecondaryTextFont;
    self->_dayOccurrenceUncompressedSecondaryTextFont = v4;

    dayOccurrenceUncompressedSecondaryTextFont = self->_dayOccurrenceUncompressedSecondaryTextFont;
  }

  return dayOccurrenceUncompressedSecondaryTextFont;
}

- (id)_dayOccurrenceFontWithStyle:(id)a3 size:(double)a4 regularSize:(double)a5
{
  double v5 = a5 / a4;
  double v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_preferredTightLeadingBoldFontForTextStyle:", a3);
  v7 = [v6 fontDescriptor];
  [v7 pointSize];
  double v9 = v8;

  CUIKRoundToScreenScale(v5 * v9);
  v10 = objc_msgSend(v6, "fontWithSize:");

  return v10;
}

void __39__CUIKSemiConstantCache_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;
}

- (CUIKSemiConstantCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIKSemiConstantCache;
  v2 = [(CUIKSemiConstantCache *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__contentCategorySizeChanged_ name:*MEMORY[0x1E4FB27A8] object:0];

    [(CUIKSemiConstantCache *)v2 updateMetrics];
  }
  return v2;
}

- (void)updateMetrics
{
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_dayOccurrenceMinimumCachedLineHeightCompact = _Q0;
  *(_OWORD *)&self->_dayOccurrenceMinimumCachedLineHeightSmallCompact = _Q0;
  *(_OWORD *)&self->_dayReminderIntegrationCachedLineHeightCompact = _Q0;
  *(_OWORD *)&self->_dayReminderIntegrationCachedLineHeightSmallCompact = _Q0;
  dayOccurrenceUncompressedSecondaryTextFont = self->_dayOccurrenceUncompressedSecondaryTextFont;
  self->_dayOccurrenceUncompressedSecondaryTextFont = 0;
}

- (double)dayOccurrenceMinimumCachedLineHeightRegular
{
  [(CUIKSemiConstantCache *)self _cachedLineHeight:&self->_dayOccurrenceMinimumCachedLineHeightRegular style:*MEMORY[0x1E4FB28F0] size:13.0 regularSize:11.0];
  return result;
}

- (double)dayOccurrenceMinimumCachedLineHeightSmallCompact
{
  [(CUIKSemiConstantCache *)self _cachedLineHeight:&self->_dayOccurrenceMinimumCachedLineHeightSmallCompact style:*MEMORY[0x1E4FB28E0] size:11.0 regularSize:6.5];
  return result;
}

- (double)dayOccurrenceMinimumCachedLineHeightSmallRegular
{
  [(CUIKSemiConstantCache *)self _cachedLineHeight:&self->_dayOccurrenceMinimumCachedLineHeightSmallRegular style:*MEMORY[0x1E4FB28E0] size:11.0 regularSize:11.0];
  return result;
}

- (double)dayReminderIntegrationCachedLineHeightCompact
{
  [(CUIKSemiConstantCache *)self _cachedLineHeight:&self->_dayReminderIntegrationCachedLineHeightCompact style:*MEMORY[0x1E4FB28F0] size:13.0 regularSize:13.0];
  return result;
}

- (double)dayReminderIntegrationCachedLineHeightRegular
{
  [(CUIKSemiConstantCache *)self _cachedLineHeight:&self->_dayReminderIntegrationCachedLineHeightRegular style:*MEMORY[0x1E4FB28F0] size:13.0 regularSize:13.0];
  return result;
}

- (double)dayReminderIntegrationCachedLineHeightSmallCompact
{
  [(CUIKSemiConstantCache *)self _cachedLineHeight:&self->_dayReminderIntegrationCachedLineHeightSmallCompact style:*MEMORY[0x1E4FB28E0] size:11.0 regularSize:11.0];
  return result;
}

- (double)dayReminderIntegrationCachedLineHeightSmallRegular
{
  [(CUIKSemiConstantCache *)self _cachedLineHeight:&self->_dayReminderIntegrationCachedLineHeightSmallRegular style:*MEMORY[0x1E4FB28F0] size:13.0 regularSize:13.0];
  return result;
}

- (id)commentIconStringForFont:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  objc_super v5 = [v3 tertiaryLabelColor];
  double v6 = objc_msgSend(MEMORY[0x1E4FB1830], "cuik_configurationWithFont:", v4);

  v7 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_systemImageNamed:withConfiguration:", @"message.fill", v6);
  double v8 = objc_msgSend(v7, "cuik_imageWithTintColor:asTemplate:", v5, 0);

  double v9 = objc_msgSend(MEMORY[0x1E4FB0870], "cuik_textAttachmentWithImage:", v8);
  v10 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];

  return v10;
}

- (id)birthdayImageForFont:(id)a3
{
  return [(CUIKSemiConstantCache *)self symbolImage:@"gift" forFont:a3];
}

- (id)symbolImage:(id)a3 forFont:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    double v6 = objc_msgSend(MEMORY[0x1E4FB1830], "cuik_configurationWithFont:scale:", a4, 1);
    v7 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_systemImageNamed:withConfiguration:", v5, v6);
  }
  else
  {
    double v8 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CUIKSemiConstantCache symbolImage:forFont:](v8);
    }

    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)symbolImage:(os_log_t)log forFont:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "-symbolImage:forFont: received a nil font, returning nil", v1, 2u);
}

@end