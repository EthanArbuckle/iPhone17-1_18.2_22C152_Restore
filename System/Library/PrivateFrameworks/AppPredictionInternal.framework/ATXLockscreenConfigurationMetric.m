@interface ATXLockscreenConfigurationMetric
- (BOOL)hasCustomInlineComplication;
- (BOOL)isSelected;
- (NSString)color;
- (NSString)extensionBundleId;
- (NSString)font;
- (NSString)lockscreenId;
- (NSString)numberingSystem;
- (NSString)relatedFocus;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numLandscapeWidgets;
- (unint64_t)numWidgets;
- (unint64_t)source;
- (void)setColor:(id)a3;
- (void)setExtensionBundleId:(id)a3;
- (void)setFont:(id)a3;
- (void)setHasCustomInlineComplication:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setLockscreenId:(id)a3;
- (void)setNumLandscapeWidgets:(unint64_t)a3;
- (void)setNumWidgets:(unint64_t)a3;
- (void)setNumberingSystem:(id)a3;
- (void)setRelatedFocus:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation ATXLockscreenConfigurationMetric

- (id)metricName
{
  return @"com.apple.Proactive.Lockscreen.Configuration";
}

- (id)coreAnalyticsDictionary
{
  v30[11] = *MEMORY[0x1E4F143B8];
  v29[0] = @"lockscreenId";
  uint64_t v3 = [(ATXLockscreenConfigurationMetric *)self lockscreenId];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = v4;
  v25 = (void *)v3;
  v30[0] = v3;
  v29[1] = @"extensionBundleId";
  uint64_t v5 = [(ATXLockscreenConfigurationMetric *)self extensionBundleId];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v5;
  v30[1] = v5;
  v29[2] = @"source";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenConfigurationMetric source](self, "source"));
  v30[2] = v26;
  v29[3] = @"font";
  uint64_t v7 = [(ATXLockscreenConfigurationMetric *)self font];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = v6;
  v23 = (void *)v7;
  v30[3] = v7;
  v29[4] = @"color";
  uint64_t v9 = [(ATXLockscreenConfigurationMetric *)self color];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v9;
  v30[4] = v9;
  v29[5] = @"numberingSystem";
  uint64_t v11 = [(ATXLockscreenConfigurationMetric *)self numberingSystem];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[5] = v11;
  v29[6] = @"numWidgets";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenConfigurationMetric numWidgets](self, "numWidgets", v11));
  v30[6] = v13;
  v29[7] = @"numLandscapeWidgets";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenConfigurationMetric numLandscapeWidgets](self, "numLandscapeWidgets"));
  v30[7] = v14;
  v29[8] = @"hasCustomInlineComplication";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenConfigurationMetric hasCustomInlineComplication](self, "hasCustomInlineComplication"));
  v30[8] = v15;
  v29[9] = @"relatedFocus";
  v16 = [(ATXLockscreenConfigurationMetric *)self relatedFocus];
  v17 = v16;
  if (!v16)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[9] = v17;
  v29[10] = @"isSelected";
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenConfigurationMetric isSelected](self, "isSelected"));
  v30[10] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];

  if (!v16) {
  if (!v12)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v27) {
  if (!v28)
  }

  return v19;
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (void)setLockscreenId:(id)a3
{
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (NSString)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)numberingSystem
{
  return self->_numberingSystem;
}

- (void)setNumberingSystem:(id)a3
{
}

- (unint64_t)numWidgets
{
  return self->_numWidgets;
}

- (void)setNumWidgets:(unint64_t)a3
{
  self->_numWidgets = a3;
}

- (unint64_t)numLandscapeWidgets
{
  return self->_numLandscapeWidgets;
}

- (void)setNumLandscapeWidgets:(unint64_t)a3
{
  self->_numLandscapeWidgets = a3;
}

- (BOOL)hasCustomInlineComplication
{
  return self->_hasCustomInlineComplication;
}

- (void)setHasCustomInlineComplication:(BOOL)a3
{
  self->_hasCustomInlineComplication = a3;
}

- (NSString)relatedFocus
{
  return self->_relatedFocus;
}

- (void)setRelatedFocus:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedFocus, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end