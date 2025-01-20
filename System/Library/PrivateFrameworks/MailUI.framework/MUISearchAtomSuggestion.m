@interface MUISearchAtomSuggestion
+ (id)allMailboxesSuggestionFromSpotlightSuggestion:(id)a3;
+ (id)log;
+ (id)suggestionFromSpotlightSuggestion:(id)a3 shouldShowAvaters:(BOOL)a4;
- (NSDate)lastUsedTime;
- (NSString)contactIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)focusedTintColor;
- (UIColor)tintColor;
- (UIImage)atomImage;
- (UIImage)image;
- (id)description;
- (id)ef_publicDescription;
- (id)predicateWithSelectedScope:(id)a3;
- (int64_t)option;
- (void)setLastUsedTime:(id)a3;
@end

@implementation MUISearchAtomSuggestion

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MUISearchAtomSuggestion_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_14 != -1) {
    dispatch_once(&log_onceToken_14, block);
  }
  v2 = (void *)log_log_14;
  return v2;
}

void __30__MUISearchAtomSuggestion_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_14;
  log_log_14 = (uint64_t)v1;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)MUISearchAtomSuggestion;
  id v3 = [(MUISearchSuggestion *)&v10 description];
  v4 = [(MUISearchAtomSuggestion *)self title];
  v5 = [(MUISearchAtomSuggestion *)self subtitle];
  v6 = @" - ";
  v7 = &stru_1F39CB5D8;
  if (v5) {
    v7 = v5;
  }
  else {
    v6 = &stru_1F39CB5D8;
  }
  v8 = [NSString stringWithFormat:@"%@ - %@%@%@", v3, v4, v6, v7];

  return v8;
}

- (id)ef_publicDescription
{
  v14.receiver = self;
  v14.super_class = (Class)MUISearchAtomSuggestion;
  id v3 = [(MUISearchSuggestion *)&v14 description];
  v4 = (void *)MEMORY[0x1E4F60E00];
  v5 = [(MUISearchAtomSuggestion *)self title];
  v6 = [v4 partiallyRedactedStringForString:v5];

  v7 = (void *)MEMORY[0x1E4F60E00];
  v8 = [(MUISearchAtomSuggestion *)self subtitle];
  v9 = [v7 partiallyRedactedStringForString:v8];

  objc_super v10 = @" - ";
  v11 = &stru_1F39CB5D8;
  if (v9) {
    v11 = v9;
  }
  else {
    objc_super v10 = &stru_1F39CB5D8;
  }
  v12 = [NSString stringWithFormat:@"%@ - %@%@%@", v3, v6, v10, v11];

  return v12;
}

- (NSString)title
{
}

- (NSString)subtitle
{
}

- (NSString)contactIdentifier
{
}

- (id)predicateWithSelectedScope:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MUISearchSuggestion.m", 115, @"Invalid parameter not satisfying: %@", @"scope" object file lineNumber description];
  }
  v6 = [v5 predicateForSuggestion:self];

  return v6;
}

- (UIImage)image
{
  v2 = [(MUISearchSuggestion *)self category];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (UIColor)focusedTintColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] whiteColor];
}

- (UIImage)atomImage
{
  v2 = [(MUISearchSuggestion *)self category];
  id v3 = [v2 atomImage];

  return (UIImage *)v3;
}

- (int64_t)option
{
  return 0;
}

+ (id)suggestionFromSpotlightSuggestion:(id)a3 shouldShowAvaters:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 suggestionTokens];
  v7 = [v6 lastObject];

  uint64_t v8 = [v7 tokenKind];
  if (v4 && v8 == 16)
  {
    v9 = 0;
  }
  else
  {
    objc_super v10 = [v7 displayText];
    v11 = [v10 string];

    v12 = objc_opt_new();
    v13 = NSSelectorFromString(&cfstr_Itemsummary.isa);
    objc_super v14 = NSSelectorFromString(&cfstr_Name.isa);
    v15 = NSSelectorFromString(&cfstr_Emailaddresses.isa);
    v16 = NSSelectorFromString(&cfstr_Contactidentif.isa);
    if (objc_opt_respondsToSelector())
    {
      v17 = [v7 v13];
      id v27 = v11;
      uint64_t v18 = objc_opt_class();
      __79__MUISearchAtomSuggestion_suggestionFromSpotlightSuggestion_shouldShowAvaters___block_invoke(v18, &v27, v14, v17);
      id v19 = v27;

      id v26 = v12;
      uint64_t v20 = objc_opt_class();
      __79__MUISearchAtomSuggestion_suggestionFromSpotlightSuggestion_shouldShowAvaters___block_invoke(v20, &v26, v15, v17);
      id v21 = v26;

      id v25 = 0;
      uint64_t v22 = objc_opt_class();
      __79__MUISearchAtomSuggestion_suggestionFromSpotlightSuggestion_shouldShowAvaters___block_invoke(v22, &v25, v16, v17);
      id v23 = v25;

      v11 = v19;
      v12 = v21;
    }
    v9 = +[MUIGenericSuggestion genericSuggestionWithSpotlightSuggestion:v5];
  }
  return v9;
}

uint64_t __79__MUISearchAtomSuggestion_suggestionFromSpotlightSuggestion_shouldShowAvaters___block_invoke(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v10 = a4;
  uint64_t v6 = objc_opt_respondsToSelector();
  id v7 = v10;
  if (v6)
  {
    uint64_t v8 = [v10 a3];
    if (objc_opt_isKindOfClass()) {
      *a2 = v8;
    }

    id v7 = v10;
  }
  return MEMORY[0x1F41817F8](v6, v7);
}

+ (id)allMailboxesSuggestionFromSpotlightSuggestion:(id)a3
{
  return +[MUIGenericSuggestion allMailboxesSuggestionWithSpotlightSuggestion:a3];
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSDate)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end