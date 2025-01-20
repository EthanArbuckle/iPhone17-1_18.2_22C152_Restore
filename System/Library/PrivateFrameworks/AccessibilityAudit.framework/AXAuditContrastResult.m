@interface AXAuditContrastResult
- (AXAuditContrastResult)init;
- (NSArray)compareColors;
- (NSString)primaryColor;
- (NSString)secondaryColor;
- (NSString)summary;
- (NSString)textColor;
- (double)fontSize;
- (double)ratio;
- (id)description;
- (int64_t)classification;
- (void)setClassification:(int64_t)a3;
- (void)setFontSize:(double)a3;
- (void)setPrimaryColor:(id)a3;
- (void)setRatio:(double)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation AXAuditContrastResult

- (AXAuditContrastResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXAuditContrastResult;
  v2 = [(AXAuditContrastResult *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXAuditContrastResult *)v2 setClassification:0];
  }
  return v3;
}

- (NSArray)compareColors
{
  v3 = [(AXAuditContrastResult *)self textColor];
  v4 = [(AXAuditContrastResult *)self primaryColor];
  objc_super v5 = [(AXAuditContrastResult *)self secondaryColor];
  if (v3)
  {
    if (!v4)
    {
      id v7 = 0;
      v10 = 0;
      v11 = 0;
      goto LABEL_11;
    }
    unsigned __int8 v6 = [v3 isEqualToString:v4];
    id v7 = v3;
    if ((v6 & (v5 != 0)) != 0) {
      v8 = v5;
    }
    else {
      v8 = v4;
    }
  }
  else
  {
    id v7 = v4;
    v8 = v5;
  }
  id v9 = v8;
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    v11 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, v9, 0);
  }
LABEL_11:

  return (NSArray *)v11;
}

- (NSString)summary
{
  int64_t v3 = [(AXAuditContrastResult *)self classification];
  if (v3 == 15 || (double v4 = 0.0, v3 == 12))
  {
    [(AXAuditContrastResult *)self fontSize];
    double v4 = v5;
  }
  unsigned __int8 v6 = [(AXAuditContrastResult *)self textColor];

  if (v6)
  {
    id v7 = [(AXAuditContrastResult *)self primaryColor];

    if (!v7)
    {
LABEL_16:
      v13 = 0;
      goto LABEL_19;
    }
    v8 = @"textBackgroundComparisonFormatter";
  }
  else
  {
    v8 = @"colorsComparisonFormatter";
  }
  id v7 = AXAuditLocString(v8, 0);
  if (!v7) {
    goto LABEL_16;
  }
  id v9 = AXAuditLocString(@"textContrastRatioFormatter", 0);
  v10 = 0;
  if (v4 > 0.0)
  {
    v10 = AXAuditLocString(@"fontSizeFormatter", 0);
  }
  id v11 = objc_alloc(MEMORY[0x263F089D8]);
  [(AXAuditContrastResult *)self ratio];
  v13 = objc_msgSend(v11, "initWithFormat:", v9, v12);
  v14 = [(AXAuditContrastResult *)self compareColors];
  if ([v14 count] == 2)
  {
    v15 = NSString;
    v16 = [v14 objectAtIndexedSubscript:0];
    v17 = [v14 objectAtIndexedSubscript:1];
    uint64_t v18 = objc_msgSend(v15, "stringWithFormat:", v7, v16, v17);

    id v7 = (void *)v18;
  }
  if (v10)
  {
    v19 = objc_msgSend(NSString, "stringWithFormat:", v10, *(void *)&v4);

    [v13 appendString:v7];
    if (v19)
    {
      [v13 appendString:v19];
    }
  }
  else
  {
    [v13 appendString:v7];
  }

LABEL_19:

  return (NSString *)v13;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  int64_t v4 = [(AXAuditContrastResult *)self classification];
  v16.receiver = self;
  v16.super_class = (Class)AXAuditContrastResult;
  double v5 = [(AXAuditContrastResult *)&v16 description];
  [v3 appendFormat:@"[%ld] %@, ", v4, v5];

  [(AXAuditContrastResult *)self ratio];
  [v3 appendFormat:@"Ratio:%.2f ", v6];
  id v7 = [(AXAuditContrastResult *)self textColor];

  if (v7)
  {
    v8 = [(AXAuditContrastResult *)self textColor];
    [v3 appendFormat:@"Text:%@ ", v8];
  }
  id v9 = [(AXAuditContrastResult *)self primaryColor];

  if (v9)
  {
    v10 = [(AXAuditContrastResult *)self primaryColor];
    [v3 appendFormat:@"PrimaryColor:%@ ", v10];
  }
  id v11 = [(AXAuditContrastResult *)self secondaryColor];

  if (v11)
  {
    uint64_t v12 = [(AXAuditContrastResult *)self secondaryColor];
    [v3 appendFormat:@"SecondaryColor:%@ ", v12];
  }
  [(AXAuditContrastResult *)self fontSize];
  if (v13 > 0.0)
  {
    [(AXAuditContrastResult *)self fontSize];
    objc_msgSend(v3, "appendFormat:", @"FontSize:%.0f", v14);
  }

  return v3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSString)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (NSString)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
}

- (NSString)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
}

- (double)ratio
{
  return self->_ratio;
}

- (void)setRatio:(double)a3
{
  self->_ratio = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);

  objc_storeStrong((id *)&self->_textColor, 0);
}

@end