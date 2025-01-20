@interface CNContactGeminiIconProvider
- (BOOL)_checkAvailableGeminiChannelsUpdatedForGeminiResult:(id)a3;
- (CNGeminiResult)geminiResult;
- (NSDictionary)geminiIconDictionary;
- (id)_simLabelImageWithLocalizedBadgeLabel:(id)a3;
- (id)geminiIconForGeminiChannelIdentifier:(id)a3;
- (void)setGeminiIconDictionary:(id)a3;
- (void)setGeminiResult:(id)a3;
- (void)updateGeminiIcons;
@end

@implementation CNContactGeminiIconProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiIconDictionary, 0);

  objc_storeStrong((id *)&self->_geminiResult, 0);
}

- (void)setGeminiIconDictionary:(id)a3
{
}

- (NSDictionary)geminiIconDictionary
{
  return self->_geminiIconDictionary;
}

- (CNGeminiResult)geminiResult
{
  return self->_geminiResult;
}

- (id)_simLabelImageWithLocalizedBadgeLabel:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = a3;
  v6 = [v3 preferredFontForTextStyle:v4];
  v7 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v7 scaledValueForValue:2.20000005];
  double v9 = v8;

  id v10 = objc_alloc(MEMORY[0x1E4FB1930]);
  [v6 capHeight];
  double v12 = v11;
  [v6 capHeight];
  v14 = objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, v12, v13);
  v15 = (void *)MEMORY[0x1E4FB08E0];
  [v6 capHeight];
  v17 = [v15 boldSystemFontOfSize:v16 / 1.375];
  [v14 setFont:v17];

  [v14 setText:v5];
  v18 = [MEMORY[0x1E4FB1618] labelColor];
  [v14 setTextColor:v18];

  [v14 setTextAlignment:1];
  v19 = [MEMORY[0x1E4FB1618] clearColor];
  [v14 setBackgroundColor:v19];

  id v20 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v21 = [v20 CGColor];
  v22 = [v14 layer];
  [v22 setBorderColor:v21];

  v23 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v23 scaledValueForValue:1.20000005];
  double v25 = v24;
  v26 = [v14 layer];
  [v26 setBorderWidth:v25];

  v27 = [v14 layer];
  [v27 setMasksToBounds:1];

  v28 = [v14 layer];
  [v28 setCornerRadius:v9];

  [v6 capHeight];
  double v30 = v29;
  v31 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v31 scaledValueForValue:6.0];
  double v33 = v32;

  [v14 intrinsicContentSize];
  double v35 = v33 + v34;
  if (v35 >= v30) {
    double v30 = v35;
  }
  [v6 capHeight];
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v30, v36);
  [v14 bounds];
  v43.width = v37;
  v43.height = v38;
  UIGraphicsBeginImageContextWithOptions(v43, 0, 0.0);
  v39 = [v14 layer];
  [v39 renderInContext:UIGraphicsGetCurrentContext()];

  v40 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v40;
}

- (BOOL)_checkAvailableGeminiChannelsUpdatedForGeminiResult:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v7 = [(CNContactGeminiIconProvider *)self geminiResult];
  double v8 = [v7 availableChannels];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) localizedBadgeLabel];
        [v5 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v14 = objc_msgSend(v4, "availableChannels", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v24 + 1) + 8 * v18) localizedBadgeLabel];
        [v6 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  char v22 = [v20 isEqualToSet:v21];

  return v22 ^ 1;
}

- (void)updateGeminiIcons
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactGeminiIconProvider *)self geminiResult];
  id v4 = [v3 availableChannels];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "localizedBadgeLabel", (void)v17);
        double v13 = [(CNContactGeminiIconProvider *)self _simLabelImageWithLocalizedBadgeLabel:v12];

        v14 = [v11 channelIdentifier];
        [v5 setObject:v13 forKey:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v15 = (NSDictionary *)[v5 copy];
  geminiIconDictionary = self->_geminiIconDictionary;
  self->_geminiIconDictionary = v15;
}

- (id)geminiIconForGeminiChannelIdentifier:(id)a3
{
  return [(NSDictionary *)self->_geminiIconDictionary objectForKey:a3];
}

- (void)setGeminiResult:(id)a3
{
  id v4 = (CNGeminiResult *)a3;
  BOOL v5 = [(CNContactGeminiIconProvider *)self _checkAvailableGeminiChannelsUpdatedForGeminiResult:v4];
  geminiResult = self->_geminiResult;
  self->_geminiResult = v4;

  if (v5)
  {
    [(CNContactGeminiIconProvider *)self updateGeminiIcons];
  }
}

@end