@interface MUPlaceHoursFormatter
+ (id)_AMPMFont;
+ (id)_hoursMonospacedFont;
+ (id)hoursFormatterFromHoursStringComponents:(id)a3 AMPMSymbols:(id)a4;
- (MUPlaceHoursFormatter)initWithHoursString:(id)a3 AMPMSymbols:(id)a4;
- (NSArray)AMPMSymbols;
- (NSString)hoursString;
- (id)buildAttributedHourStringWithHourFont:(id)a3 AMPMFont:(id)a4 hourColor:(id)a5;
- (id)buildDefaultPlacecardHoursString;
@end

@implementation MUPlaceHoursFormatter

- (MUPlaceHoursFormatter)initWithHoursString:(id)a3 AMPMSymbols:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "count"))
  {
    v17.receiver = self;
    v17.super_class = (Class)MUPlaceHoursFormatter;
    v8 = [(MUPlaceHoursFormatter *)&v17 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      hoursString = v8->_hoursString;
      v8->_hoursString = (NSString *)v9;

      uint64_t v11 = [v7 copy];
      AMPMSymbols = v8->_AMPMSymbols;
      v8->_AMPMSymbols = (NSArray *)v11;

      v13 = [MEMORY[0x1E4F1CA20] currentLocale];
      v14 = [v13 languageCode];
      v8->_formatAMPM = [v14 isEqualToString:@"ar"] ^ 1;
    }
    self = v8;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)buildAttributedHourStringWithHourFont:(id)a3 AMPMFont:(id)a4 hourColor:(id)a5
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = *MEMORY[0x1E4FB0700];
  v41[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v11 = v41[0];
  v41[1] = v12;
  v42[0] = v8;
  v42[1] = v10;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  v39[0] = v11;
  v39[1] = v12;
  v40[0] = v9;
  v40[1] = v10;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:self->_hoursString attributes:v13];
  if (self->_formatAMPM)
  {
    v27 = v13;
    id v28 = v10;
    id v29 = v8;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obj = self->_AMPMSymbols;
    uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = (void *)MEMORY[0x1E4F28FD8];
          v21 = [NSString stringWithFormat:@"%@", *(void *)(*((void *)&v34 + 1) + 8 * i)];
          v22 = [v20 regularExpressionWithPattern:v21 options:0 error:0];

          hoursString = self->_hoursString;
          uint64_t v24 = [(NSString *)hoursString length];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __82__MUPlaceHoursFormatter_buildAttributedHourStringWithHourFont_AMPMFont_hourColor___block_invoke;
          v31[3] = &unk_1E57503C8;
          id v32 = v15;
          id v33 = v14;
          objc_msgSend(v22, "enumerateMatchesInString:options:range:usingBlock:", hoursString, 0, 0, v24, v31);
        }
        uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v17);
    }

    id v8 = v29;
    v13 = v27;
    id v10 = v28;
  }
  v25 = (void *)[v15 copy];

  return v25;
}

uint64_t __82__MUPlaceHoursFormatter_buildAttributedHourStringWithHourFont_AMPMFont_hourColor___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = [a2 range];
  return objc_msgSend(v2, "setAttributes:range:", v3, v5, v4);
}

+ (id)hoursFormatterFromHoursStringComponents:(id)a3 AMPMSymbols:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v13 length] > v10) {
          unint64_t v10 = [v13 length];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__MUPlaceHoursFormatter_hoursFormatterFromHoursStringComponents_AMPMSymbols___block_invoke;
  v18[3] = &__block_descriptor_40_e21__24__0__NSString_8Q16l;
  v18[4] = v10;
  v14 = MUMap(v6, v18);
  v15 = [v14 componentsJoinedByString:@"\n"];
  uint64_t v16 = (void *)[objc_alloc((Class)a1) initWithHoursString:v15 AMPMSymbols:v7];

  return v16;
}

id __77__MUPlaceHoursFormatter_hoursFormatterFromHoursStringComponents_AMPMSymbols___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 == [v3 length])
  {
    uint64_t v5 = &stru_1EE3BF360;
  }
  else
  {
    unint64_t v6 = 0;
    id v7 = &stru_1EE3BF360;
    do
    {
      uint64_t v5 = [NSString stringWithFormat:@" %@", v7];

      ++v6;
      uint64_t v8 = *(void *)(a1 + 32);
      unint64_t v9 = v8 - [v3 length];
      id v7 = v5;
    }
    while (v6 < v9);
  }
  if ([(__CFString *)v5 length])
  {
    id v10 = [NSString stringWithFormat:@"%@%@", v5, v3];
  }
  else
  {
    id v10 = v3;
  }
  uint64_t v11 = v10;

  return v11;
}

+ (id)_hoursMonospacedFont
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB0960];
  v10[0] = *MEMORY[0x1E4FB0968];
  v10[1] = v2;
  v11[0] = &unk_1EE404BB0;
  v11[1] = &unk_1EE404BC8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v5 = [v4 fontDescriptor];
  unint64_t v6 = [v5 fontDescriptorByAddingAttributes:v3];

  id v7 = (void *)MEMORY[0x1E4FB08E0];
  [v6 pointSize];
  uint64_t v8 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);

  return v8;
}

+ (id)_AMPMFont
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v15 = *MEMORY[0x1E4FB0910];
  uint64_t v3 = *MEMORY[0x1E4FB0960];
  v12[0] = *MEMORY[0x1E4FB0968];
  v12[1] = v3;
  v13[0] = &unk_1EE404BE0;
  v13[1] = &unk_1EE404BF8;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v16[0] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  id v7 = [v2 fontDescriptor];
  uint64_t v8 = [v7 fontDescriptorByAddingAttributes:v6];

  unint64_t v9 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  id v10 = objc_msgSend(v9, "fontWithDescriptor:size:", v8);

  return v10;
}

- (id)buildDefaultPlacecardHoursString
{
  uint64_t v3 = [(id)objc_opt_class() _hoursMonospacedFont];
  uint64_t v4 = [(id)objc_opt_class() _AMPMFont];
  uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
  unint64_t v6 = [(MUPlaceHoursFormatter *)self buildAttributedHourStringWithHourFont:v3 AMPMFont:v4 hourColor:v5];

  return v6;
}

- (NSString)hoursString
{
  return self->_hoursString;
}

- (NSArray)AMPMSymbols
{
  return self->_AMPMSymbols;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AMPMSymbols, 0);
  objc_storeStrong((id *)&self->_hoursString, 0);
}

@end