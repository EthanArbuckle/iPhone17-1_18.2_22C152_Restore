@interface AAUIAchievementFormatter
- (AAUIAchievementFormatter)initWithStyle:(int64_t)a3 achievement:(id)a4 achLocalizationProvider:(id)a5;
- (ACHAchievement)achievement;
- (ACHAchievementLocalizationProvider)achLocProvider;
- (BOOL)formatsForFriend;
- (BOOL)shouldShowEarnedShortDescription;
- (id)achBacksideAttributesWithSizeVariant:(int64_t)a3;
- (id)achLocalizedAttributedBacksideStringWithDateSizeVariant:(int64_t)a3;
- (id)backsideAttributesWithSizeVariant:(int64_t)a3;
- (id)descriptionAttributes;
- (id)localizedAttributedBacksideString;
- (id)localizedAttributedBacksideStringWithDateSizeVariant:(int64_t)a3;
- (id)localizedAttributedCombinedString;
- (id)localizedAttributedCombinedStringShowingProgress:(BOOL)a3;
- (id)localizedAttributedCombinedStringWithoutProgress;
- (id)localizedAttributedDescriptionString;
- (id)localizedAttributedShortDescriptionString;
- (id)localizedAttributedShortenedBacksideString;
- (id)localizedAttributedTitleString;
- (id)titleAttributes;
- (int64_t)style;
- (void)setAchLocProvider:(id)a3;
- (void)setAchievement:(id)a3;
- (void)setFormatsForFriend:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation AAUIAchievementFormatter

- (AAUIAchievementFormatter)initWithStyle:(int64_t)a3 achievement:(id)a4 achLocalizationProvider:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AAUIAchievementFormatter;
  v11 = [(AAUIAchievementFormatter *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_achievement, a4);
    objc_storeStrong((id *)&v12->_achLocProvider, a5);
    v12->_style = a3;
  }

  return v12;
}

- (id)titleAttributes
{
  v26[1] = *MEMORY[0x263EF8340];
  int64_t v2 = [(AAUIAchievementFormatter *)self style];
  if (v2 == 2)
  {
    v3 = [MEMORY[0x263F82760] systemFontOfSize:16.0 weight:*MEMORY[0x263F83648]];
    v4 = [MEMORY[0x263F825C8] whiteColor];
    v6 = [MEMORY[0x263F82370] defaultParagraphStyle];
    v7 = (void *)[v6 mutableCopy];

    [v7 setAlignment:1];
    v5 = (void *)[v7 copy];
  }
  else if (v2 == 1)
  {
    v8 = [MEMORY[0x263F82768] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835B8]];
    [v8 pointSize];
    double v10 = v9;
    int v11 = [v8 symbolicTraits];
    uint64_t v25 = *MEMORY[0x263F83528];
    uint64_t v23 = *MEMORY[0x263F83560];
    v12 = [NSNumber numberWithUnsignedInt:v11 | 2u];
    v24 = v12;
    v13 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v26[0] = v13;
    objc_super v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v15 = [v8 fontDescriptorByAddingAttributes:v14];

    v3 = [MEMORY[0x263F82760] fontWithDescriptor:v15 size:v10];
    v4 = [MEMORY[0x263F825C8] whiteColor];
    v16 = [MEMORY[0x263F82370] defaultParagraphStyle];
    v17 = (void *)[v16 mutableCopy];

    [v17 setAlignment:1];
    v5 = (void *)[v17 copy];
  }
  else if (v2)
  {
    v5 = 0;
    v4 = 0;
    v3 = 0;
  }
  else
  {
    v3 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    v4 = [MEMORY[0x263F825C8] whiteColor];
    v5 = [MEMORY[0x263F82370] defaultParagraphStyle];
  }
  uint64_t v18 = *MEMORY[0x263F82278];
  v21[0] = *MEMORY[0x263F82270];
  v21[1] = v18;
  v22[0] = v3;
  v22[1] = v4;
  v21[2] = *MEMORY[0x263F822A8];
  v22[2] = v5;
  v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  return v19;
}

- (id)descriptionAttributes
{
  v15[3] = *MEMORY[0x263EF8340];
  int64_t v2 = [(AAUIAchievementFormatter *)self style];
  switch(v2)
  {
    case 2:
      v3 = [MEMORY[0x263F82760] systemFontOfSize:16.0];
      uint64_t v8 = [MEMORY[0x263F825C8] whiteColor];
LABEL_7:
      v4 = (void *)v8;
      double v9 = [MEMORY[0x263F82370] defaultParagraphStyle];
      v6 = (void *)[v9 mutableCopy];

      [v6 setAlignment:1];
      goto LABEL_8;
    case 1:
      v3 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
      uint64_t v8 = objc_msgSend(MEMORY[0x263F825C8], "fu_systemTextGreyColor");
      goto LABEL_7;
    case 0:
      v3 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      v4 = [MEMORY[0x263F825C8] _vibrantLightFillBurnColor];
      v5 = [MEMORY[0x263F82370] defaultParagraphStyle];
      v6 = (void *)[v5 mutableCopy];

      LODWORD(v7) = 1057803469;
      [v6 setHyphenationFactor:v7];
LABEL_8:
      double v10 = (void *)[v6 copy];

      goto LABEL_10;
  }
  double v10 = 0;
  v4 = 0;
  v3 = 0;
LABEL_10:
  uint64_t v11 = *MEMORY[0x263F82278];
  v14[0] = *MEMORY[0x263F82270];
  v14[1] = v11;
  v15[0] = v3;
  v15[1] = v4;
  v14[2] = *MEMORY[0x263F822A8];
  v15[2] = v10;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (id)backsideAttributesWithSizeVariant:(int64_t)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F82370] defaultParagraphStyle];
  v5 = (void *)[v4 mutableCopy];

  [v5 setAlignment:1];
  [v5 setLineHeightMultiple:0.95];
  double v6 = 0.0;
  double v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
  if ((unint64_t)a3 <= 2) {
    double v6 = dbl_2292CEEC8[a3];
  }
  uint64_t v8 = [MEMORY[0x263F82760] boldSystemFontOfSize:v6];
  uint64_t v9 = *MEMORY[0x263F822A8];
  v13[0] = *MEMORY[0x263F82278];
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v5;
  uint64_t v10 = *MEMORY[0x263F82288];
  v13[2] = *MEMORY[0x263F82270];
  v13[3] = v10;
  v14[2] = v8;
  void v14[3] = &unk_26DD6F9B0;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (id)achBacksideAttributesWithSizeVariant:(int64_t)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F82370] defaultParagraphStyle];
  v5 = (void *)[v4 mutableCopy];

  [v5 setAlignment:1];
  [v5 setLineHeightMultiple:0.95];
  double v6 = 0.0;
  double v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
  if ((unint64_t)a3 <= 2) {
    double v6 = dbl_2292CEEC8[a3];
  }
  uint64_t v8 = [MEMORY[0x263F82760] boldSystemFontOfSize:v6];
  uint64_t v9 = *MEMORY[0x263F822A8];
  v13[0] = *MEMORY[0x263F82278];
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v5;
  uint64_t v10 = *MEMORY[0x263F82288];
  v13[2] = *MEMORY[0x263F82270];
  v13[3] = v10;
  v14[2] = v8;
  void v14[3] = &unk_26DD6F9B0;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (id)localizedAttributedCombinedString
{
  return [(AAUIAchievementFormatter *)self localizedAttributedCombinedStringShowingProgress:1];
}

- (id)localizedAttributedCombinedStringWithoutProgress
{
  return [(AAUIAchievementFormatter *)self localizedAttributedCombinedStringShowingProgress:0];
}

- (id)localizedAttributedCombinedStringShowingProgress:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AAUIAchievementFormatter *)self formatsForFriend])
  {
    v5 = [(AAUIAchievementFormatter *)self achLocProvider];

    if (!v5) {
      goto LABEL_18;
    }
    double v6 = [(AAUIAchievementFormatter *)self achievement];
    char v7 = [v6 unearned];
    uint64_t v8 = [(AAUIAchievementFormatter *)self achLocProvider];
    uint64_t v9 = [(AAUIAchievementFormatter *)self achievement];
    if (v7) {
      [v8 unachievedDescriptionForAchievement:v9];
    }
    else {
    v5 = [v8 friendAchievedDescriptionForAchievement:v9];
    }

    goto LABEL_16;
  }
  uint64_t v10 = [(AAUIAchievementFormatter *)self achievement];
  int v11 = [v10 unearned];

  v12 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (v11)
  {
    if (v12)
    {
      double v6 = [(AAUIAchievementFormatter *)self achLocProvider];
      uint64_t v8 = [(AAUIAchievementFormatter *)self achievement];
      uint64_t v13 = [v6 unachievedDescriptionForAchievement:v8];
LABEL_15:
      v5 = (void *)v13;
LABEL_16:

      goto LABEL_18;
    }
  }
  else if (v3)
  {
    if (v12)
    {
      double v6 = [(AAUIAchievementFormatter *)self achLocProvider];
      uint64_t v8 = [(AAUIAchievementFormatter *)self achievement];
      uint64_t v13 = [v6 achievedDescriptionForAchievement:v8];
      goto LABEL_15;
    }
  }
  else if (v12)
  {
    double v6 = [(AAUIAchievementFormatter *)self achLocProvider];
    uint64_t v8 = [(AAUIAchievementFormatter *)self achievement];
    uint64_t v13 = [v6 achievedAlertDescriptionForAchievement:v8 fitnessExperienceType:1];
    goto LABEL_15;
  }
  v5 = 0;
LABEL_18:
  BOOL v14 = [(AAUIAchievementFormatter *)self formatsForFriend];
  v15 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (v14)
  {
    if (v15)
    {
      v16 = [(AAUIAchievementFormatter *)self achLocProvider];
      v17 = [(AAUIAchievementFormatter *)self achievement];
      uint64_t v18 = [v16 friendAchievedTitleForAchievement:v17];
      goto LABEL_23;
    }
  }
  else if (v15)
  {
    v16 = [(AAUIAchievementFormatter *)self achLocProvider];
    v17 = [(AAUIAchievementFormatter *)self achievement];
    uint64_t v18 = [v16 titleForAchievement:v17];
LABEL_23:
    v19 = (__CFString *)v18;

    if (v19) {
      goto LABEL_27;
    }
  }
  v20 = ACHLogDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[AAUIAchievementFormatter localizedAttributedCombinedStringShowingProgress:](self, v20);
  }

  v19 = &stru_26DD6AF88;
LABEL_27:
  if ([(AAUIAchievementFormatter *)self style] == 1)
  {
    uint64_t v21 = [(__CFString *)v19 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    uint64_t v22 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    v19 = (__CFString *)v21;
    v5 = (void *)v22;
  }
  if (v5)
  {
    uint64_t v23 = [(__CFString *)v19 stringByAppendingString:@"\n"];

    v19 = (__CFString *)v23;
  }
  id v24 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v25 = [(AAUIAchievementFormatter *)self titleAttributes];
  v26 = (void *)[v24 initWithString:v19 attributes:v25];

  if (v5)
  {
    id v27 = objc_alloc(MEMORY[0x263F086A0]);
    v28 = [(AAUIAchievementFormatter *)self descriptionAttributes];
    v29 = (void *)[v27 initWithString:v5 attributes:v28];
    [v26 appendAttributedString:v29];
  }
  v30 = (void *)[v26 copy];

  return v30;
}

- (id)localizedAttributedTitleString
{
  BOOL v3 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (v3)
  {
    v4 = [(AAUIAchievementFormatter *)self achLocProvider];
    v5 = [(AAUIAchievementFormatter *)self achievement];
    BOOL v3 = [v4 titleForAchievement:v5];
  }
  id v6 = objc_alloc(MEMORY[0x263F086A0]);
  char v7 = [(AAUIAchievementFormatter *)self titleAttributes];
  uint64_t v8 = (void *)[v6 initWithString:v3 attributes:v7];

  return v8;
}

- (id)localizedAttributedDescriptionString
{
  BOOL v3 = [(AAUIAchievementFormatter *)self formatsForFriend];
  v4 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (!v3)
  {
    if (v4)
    {
      v5 = [(AAUIAchievementFormatter *)self achievement];
      char v10 = [v5 unearned];
      char v7 = [(AAUIAchievementFormatter *)self achLocProvider];
      uint64_t v8 = [(AAUIAchievementFormatter *)self achievement];
      if ((v10 & 1) == 0)
      {
        uint64_t v9 = [v7 achievedDescriptionForAchievement:v8];
        goto LABEL_10;
      }
      goto LABEL_7;
    }
LABEL_8:
    int v11 = 0;
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_8;
  }
  v5 = [(AAUIAchievementFormatter *)self achievement];
  char v6 = [v5 unearned];
  char v7 = [(AAUIAchievementFormatter *)self achLocProvider];
  uint64_t v8 = [(AAUIAchievementFormatter *)self achievement];
  if (v6)
  {
LABEL_7:
    uint64_t v9 = [v7 unachievedDescriptionForAchievement:v8];
    goto LABEL_10;
  }
  uint64_t v9 = [v7 friendAchievedDescriptionForAchievement:v8];
LABEL_10:
  int v11 = (void *)v9;

LABEL_11:
  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v13 = [(AAUIAchievementFormatter *)self descriptionAttributes];
  BOOL v14 = (void *)[v12 initWithString:v11 attributes:v13];

  return v14;
}

- (BOOL)shouldShowEarnedShortDescription
{
  int64_t v2 = [(AAUIAchievementFormatter *)self achievement];
  if (ACHShouldUseNewAwardsSystem())
  {
    BOOL v3 = [v2 relevantEarnedInstance];
    if (v3) {
      goto LABEL_3;
    }
LABEL_12:
    LOBYTE(v5) = 0;
    goto LABEL_13;
  }
  v16 = [v2 earnedInstances];
  BOOL v3 = [v16 lastObject];

  if (!v3) {
    goto LABEL_12;
  }
LABEL_3:
  v4 = [v2 template];
  int v5 = [v4 earnLimit];

  if (v5 != 1)
  {
    char v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    char v7 = [v3 earnedDateComponents];
    uint64_t v8 = [v6 dateFromComponents:v7];

    uint64_t v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    char v10 = [v9 isDateInToday:v8];

    int v11 = [v2 progress];

    id v12 = [v2 progress];
    uint64_t v13 = [v2 goal];
    uint64_t v14 = [v12 compare:v13];

    if (v14 != -1 || v11 == 0) {
      LOBYTE(v5) = 1;
    }
    else {
      LOBYTE(v5) = v10;
    }
  }
LABEL_13:

  return v5;
}

- (id)localizedAttributedShortDescriptionString
{
  v32[2] = *MEMORY[0x263EF8340];
  if (![(AAUIAchievementFormatter *)self style])
  {
    v15 = 0;
    goto LABEL_18;
  }
  BOOL v3 = [(AAUIAchievementFormatter *)self achievement];
  v4 = [MEMORY[0x263F825C8] whiteColor];
  int v5 = objc_msgSend(MEMORY[0x263F825C8], "fu_systemTextGreyColor");
  char v6 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (!v6) {
    goto LABEL_4;
  }
  char v7 = [(AAUIAchievementFormatter *)self achLocProvider];
  uint64_t v8 = [v7 titleForAchievement:v3];
  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  if (!v9)
  {
LABEL_4:
    char v10 = [v3 template];
    uint64_t v9 = [v10 uniqueName];
  }
  BOOL v11 = [(AAUIAchievementFormatter *)self shouldShowEarnedShortDescription];
  id v12 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (!v11)
  {
    if (v12)
    {
      uint64_t v13 = [(AAUIAchievementFormatter *)self achLocProvider];
      uint64_t v14 = [v13 unachievedShortDescriptionForAchievement:v3];
      goto LABEL_11;
    }
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  if (!v12) {
    goto LABEL_12;
  }
  uint64_t v13 = [(AAUIAchievementFormatter *)self achLocProvider];
  uint64_t v14 = [v13 achievedShortDescriptionForAchievement:v3];
LABEL_11:
  v16 = (void *)v14;

LABEL_13:
  id v27 = v3;
  if ([v16 length])
  {
    uint64_t v17 = objc_msgSend(v9, "stringByAppendingString:", @"\n", v3);

    uint64_t v9 = (void *)v17;
  }
  uint64_t v18 = objc_msgSend(MEMORY[0x263F82760], "preferredFontForTextStyle:", *MEMORY[0x263F83590], v27);
  id v19 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v20 = *MEMORY[0x263F82270];
  uint64_t v21 = *MEMORY[0x263F82278];
  v31[0] = *MEMORY[0x263F82270];
  v31[1] = v21;
  v32[0] = v18;
  v32[1] = v4;
  uint64_t v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  v15 = (void *)[v19 initWithString:v9 attributes:v22];

  if ([v16 length])
  {
    id v23 = objc_alloc(MEMORY[0x263F086A0]);
    v29[0] = v20;
    v29[1] = v21;
    v30[0] = v18;
    v30[1] = v5;
    id v24 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    uint64_t v25 = (void *)[v23 initWithString:v16 attributes:v24];
    [v15 appendAttributedString:v25];
  }
LABEL_18:
  return v15;
}

- (id)achLocalizedAttributedBacksideStringWithDateSizeVariant:(int64_t)a3
{
  int64_t v5 = [(AAUIAchievementFormatter *)self style];
  if (v5 == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2 * (v5 != 1);
  }
  char v7 = [(AAUIAchievementFormatter *)self achievement];
  int v8 = [v7 unearned];

  uint64_t v9 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (v8)
  {
    if (!v9) {
      goto LABEL_11;
    }
    char v10 = [(AAUIAchievementFormatter *)self achLocProvider];
    BOOL v11 = [(AAUIAchievementFormatter *)self achievement];
    uint64_t v12 = [v10 unachievedAlertBackDescriptionForAchievement:v11];
  }
  else
  {
    if (!v9) {
      goto LABEL_11;
    }
    char v10 = [(AAUIAchievementFormatter *)self achLocProvider];
    BOOL v11 = [(AAUIAchievementFormatter *)self achievement];
    uint64_t v12 = [v10 achievedAlertBackDescriptionForAchievement:v11 sizeVariant:v6 dateSizeVariant:a3];
  }
  uint64_t v13 = (void *)v12;

  if (v13)
  {
    uint64_t v14 = [v13 localizedUppercaseString];

    id v15 = objc_alloc(MEMORY[0x263F086A0]);
    v16 = [(AAUIAchievementFormatter *)self achBacksideAttributesWithSizeVariant:v6];
    uint64_t v17 = (void *)[v15 initWithString:v14 attributes:v16];

    goto LABEL_12;
  }
LABEL_11:
  uint64_t v17 = 0;
LABEL_12:
  return v17;
}

- (id)localizedAttributedBacksideStringWithDateSizeVariant:(int64_t)a3
{
  int64_t v5 = [(AAUIAchievementFormatter *)self style];
  if (v5 == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2 * (v5 != 1);
  }
  char v7 = [(AAUIAchievementFormatter *)self achievement];
  int v8 = [v7 unearned];

  uint64_t v9 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (v8)
  {
    if (!v9) {
      goto LABEL_11;
    }
    char v10 = [(AAUIAchievementFormatter *)self achLocProvider];
    BOOL v11 = [(AAUIAchievementFormatter *)self achievement];
    uint64_t v12 = [v10 unachievedAlertBackDescriptionForAchievement:v11];
  }
  else
  {
    if (!v9) {
      goto LABEL_11;
    }
    char v10 = [(AAUIAchievementFormatter *)self achLocProvider];
    BOOL v11 = [(AAUIAchievementFormatter *)self achievement];
    uint64_t v12 = [v10 achievedAlertBackDescriptionForAchievement:v11 sizeVariant:v6 dateSizeVariant:a3];
  }
  uint64_t v13 = (void *)v12;

  if (v13)
  {
    uint64_t v14 = [v13 localizedUppercaseString];

    id v15 = objc_alloc(MEMORY[0x263F086A0]);
    v16 = [(AAUIAchievementFormatter *)self backsideAttributesWithSizeVariant:v6];
    uint64_t v17 = (void *)[v15 initWithString:v14 attributes:v16];

    goto LABEL_12;
  }
LABEL_11:
  uint64_t v17 = 0;
LABEL_12:
  return v17;
}

- (id)localizedAttributedBacksideString
{
  BOOL v3 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (v3)
  {
    v4 = [(AAUIAchievementFormatter *)self achLocalizedAttributedBacksideStringWithDateSizeVariant:0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)localizedAttributedShortenedBacksideString
{
  BOOL v3 = [(AAUIAchievementFormatter *)self achLocProvider];

  if (v3)
  {
    v4 = [(AAUIAchievementFormatter *)self achLocalizedAttributedBacksideStringWithDateSizeVariant:2];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)formatsForFriend
{
  return self->_formatsForFriend;
}

- (void)setFormatsForFriend:(BOOL)a3
{
  self->_formatsForFriend = a3;
}

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
}

- (ACHAchievementLocalizationProvider)achLocProvider
{
  return self->_achLocProvider;
}

- (void)setAchLocProvider:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achLocProvider, 0);
  objc_storeStrong((id *)&self->_achievement, 0);
}

- (void)localizedAttributedCombinedStringShowingProgress:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 achievement];
  v4 = [v3 template];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_229290000, a2, OS_LOG_TYPE_ERROR, "Unexpectedly found nil title string; falling back to empty string for achievement:\n%@",
    (uint8_t *)&v5,
    0xCu);
}

@end