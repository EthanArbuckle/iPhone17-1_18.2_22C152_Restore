@interface MUIGenericSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)allMailboxesSuggestionWithSpotlightSuggestion:(id)a3;
+ (id)genericSuggestionWithSpotlightSuggestion:(id)a3;
- (BOOL)isAllMailboxes;
- (BOOL)isRecent;
- (MUIGenericSuggestion)initWithCoder:(id)a3;
- (MUIGenericSuggestion)initWithSpotlightSuggestion:(id)a3 isAllMailboxes:(BOOL)a4;
- (NSAttributedString)attributedTitle;
- (UIColor)imageTintColor;
- (id)_allMailboxesSuggestionTitle;
- (id)_joinRecentsTitleComponents:(id)a3;
- (id)_recentsTitle;
- (id)accessibilityDescription;
- (id)category;
- (id)contactIdentifier;
- (id)description;
- (id)ef_publicDescription;
- (id)image;
- (id)spotlightSuggestion;
- (id)subtitle;
- (id)title;
- (int64_t)resultCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MUIGenericSuggestion

+ (id)allMailboxesSuggestionWithSpotlightSuggestion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSpotlightSuggestion:v4 isAllMailboxes:1];

  return v5;
}

+ (id)genericSuggestionWithSpotlightSuggestion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSpotlightSuggestion:v4 isAllMailboxes:0];

  return v5;
}

- (MUIGenericSuggestion)initWithSpotlightSuggestion:(id)a3 isAllMailboxes:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUIGenericSuggestion;
  v8 = [(MUIGenericSuggestion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_spotlightSuggestion, a3);
    v9->_isAllMailboxes = a4;
  }

  return v9;
}

- (MUIGenericSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_spotlightSuggestion"];

  v6 = [(MUIGenericSuggestion *)self initWithSpotlightSuggestion:v5 isAllMailboxes:0];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MUIGenericSuggestion *)self spotlightSuggestion];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_spotlightSuggestion"];
}

- (id)category
{
  v3 = [(MUISearchAtomSuggestion *)self lastUsedTime];

  if (v3)
  {
    id v4 = +[MUISearchSuggestionCategory recentGenericCategory];
  }
  else
  {
    if ([(MUIGenericSuggestion *)self isAllMailboxes]) {
      +[MUISearchSuggestionCategory allMailboxesCategory];
    }
    else {
    id v4 = +[MUISearchSuggestionCategory genericCategory];
    }
  }
  return v4;
}

- (id)title
{
  v2 = [(MUIGenericSuggestion *)self attributedTitle];
  v3 = [v2 string];

  return v3;
}

- (NSAttributedString)attributedTitle
{
  if ([(MUIGenericSuggestion *)self isRecent])
  {
    uint64_t v3 = [(MUIGenericSuggestion *)self _recentsTitle];
LABEL_5:
    id v4 = (void *)v3;
    goto LABEL_7;
  }
  if ([(MUIGenericSuggestion *)self isAllMailboxes])
  {
    uint64_t v3 = [(MUIGenericSuggestion *)self _allMailboxesSuggestionTitle];
    goto LABEL_5;
  }
  id v5 = [(MUIGenericSuggestion *)self spotlightSuggestion];
  id v4 = [v5 localizedAttributedSuggestion];

LABEL_7:
  return (NSAttributedString *)v4;
}

- (id)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (id)image
{
  BOOL v3 = [(MUIGenericSuggestion *)self isRecent];
  id v4 = (void *)MEMORY[0x1E4FB1818];
  if (v3)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4FB1818], "mui_imageWithSystemSymbolName:", @"clock.arrow.circlepath");
  }
  else
  {
    v6 = [(MUIGenericSuggestion *)self spotlightSuggestion];
    id v7 = [v6 currentToken];
    id v5 = objc_msgSend(v4, "mui_imageFromSuggestionToken:", v7);
  }
  return v5;
}

- (UIColor)imageTintColor
{
  v2 = [(MUIGenericSuggestion *)self spotlightSuggestion];
  BOOL v3 = [v2 currentToken];
  uint64_t v4 = [v3 tokenKind];

  switch(v4)
  {
    case 26:
      id v5 = [MEMORY[0x1E4FB1618] systemRedColor];
      break;
    case 27:
      id v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      break;
    case 28:
      id v5 = [MEMORY[0x1E4FB1618] systemYellowColor];
      break;
    case 29:
      id v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
      break;
    case 30:
      id v5 = [MEMORY[0x1E4FB1618] systemTealColor];
      break;
    case 31:
      id v5 = [MEMORY[0x1E4FB1618] systemIndigoColor];
      break;
    case 32:
      id v5 = [MEMORY[0x1E4FB1618] systemGrayColor];
      break;
    default:
      id v5 = 0;
      break;
  }
  return (UIColor *)v5;
}

- (id)subtitle
{
  return 0;
}

- (id)contactIdentifier
{
  return 0;
}

- (int64_t)resultCount
{
  v2 = [(MUIGenericSuggestion *)self spotlightSuggestion];
  int64_t v3 = [v2 resultCount];

  return v3;
}

- (id)accessibilityDescription
{
  v2 = [(CSSuggestion *)self->_spotlightSuggestion suggestionTokens];
  int64_t v3 = [v2 lastObject];
  uint64_t v4 = [v3 tokenKindAccessibilityDescription];

  return v4;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MUIGenericSuggestion *)self attributedTitle];
  int64_t v6 = [(MUIGenericSuggestion *)self resultCount];
  id v7 = [(MUIGenericSuggestion *)self spotlightSuggestion];
  v8 = [v7 suggestionTokens];
  v9 = [v8 lastObject];
  v10 = [v3 stringWithFormat:@"<%@ %p> attributedTitle=%@ resultCount=%ld lastTokenKind=%ld", v4, self, v5, v6, objc_msgSend(v9, "tokenKind")];

  return v10;
}

- (id)ef_publicDescription
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = (void *)MEMORY[0x1E4F60E00];
  int64_t v6 = [(MUIGenericSuggestion *)self attributedTitle];
  id v7 = [v6 string];
  v8 = [v5 partiallyRedactedStringForString:v7];
  int64_t v9 = [(MUIGenericSuggestion *)self resultCount];
  v10 = [(MUIGenericSuggestion *)self spotlightSuggestion];
  objc_super v11 = [v10 suggestionTokens];
  v12 = [v11 lastObject];
  v13 = [v3 stringWithFormat:@"<%@ %p> attributedTitle=%@ resultCount=%ld lastTokenKind=%ld", v4, self, v8, v9, objc_msgSend(v12, "tokenKind")];

  return v13;
}

- (BOOL)isRecent
{
  v2 = [(MUIGenericSuggestion *)self category];
  int64_t v3 = +[MUISearchSuggestionCategory recentGenericCategory];
  BOOL v4 = v2 == v3;

  return v4;
}

- (BOOL)isAllMailboxes
{
  return self->_isAllMailboxes;
}

- (id)_allMailboxesSuggestionTitle
{
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  int64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"SuggestionsMenuItemTitle" value:&stru_1F39CB5D8 table:0];
  id v5 = (void *)[v2 initWithString:v4];

  return v5;
}

- (id)_recentsTitle
{
  v30[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(MUIGenericSuggestion *)self spotlightSuggestion];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F39CB5D8];
  id v5 = v4;
  if (v3)
  {
    uint64_t v29 = *MEMORY[0x1E4FB0700];
    uint64_t v6 = v29;
    id v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v30[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

    uint64_t v27 = v6;
    int64_t v9 = [MEMORY[0x1E4FB1618] labelColor];
    v28 = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    objc_super v11 = [v3 currentTokens];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __37__MUIGenericSuggestion__recentsTitle__block_invoke;
    v24[3] = &unk_1E6D12CE0;
    id v12 = v10;
    id v25 = v12;
    id v13 = v8;
    id v26 = v13;
    v14 = objc_msgSend(v11, "ef_compactMap:", v24);

    v15 = [v3 userQueryString];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
      v18 = [v3 userQueryString];
      v19 = (void *)[v17 initWithString:v18 attributes:v12];
      uint64_t v20 = [v14 arrayByAddingObject:v19];

      v14 = (void *)v20;
    }
    v21 = [(MUIGenericSuggestion *)self _joinRecentsTitleComponents:v14];

    id v22 = v21;
  }
  else
  {
    id v22 = v4;
  }

  return v22;
}

id __37__MUIGenericSuggestion__recentsTitle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 displayText];
  id v5 = [v4 string];

  if ([v5 length])
  {
    uint64_t v6 = [v3 scopes];
    if ([v6 count] && (unint64_t v7 = objc_msgSend(v3, "selectedScope"), v7 < objc_msgSend(v6, "count")))
    {
      id v8 = objc_alloc(MEMORY[0x1E4F28E48]);
      int64_t v9 = NSString;
      v10 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v3, "selectedScope"));
      objc_super v11 = MUILocalizedTokenAndStringSeparator();
      id v12 = [v9 stringWithFormat:@"%@%@ ", v10, v11];
      id v13 = (void *)[v8 initWithString:v12 attributes:*(void *)(a1 + 40)];

      v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:*(void *)(a1 + 32)];
      [v13 appendAttributedString:v14];
    }
    else
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_joinRecentsTitleComponents:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  id v21 = (id)0xAAAAAAAAAAAAAAAALL;
  id v21 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v5 = MUILocalizedTokenSeparator();
  uint64_t v6 = (void *)[v4 initWithString:v5];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __52__MUIGenericSuggestion__joinRecentsTitleComponents___block_invoke;
  id v13 = &unk_1E6D12D08;
  v15 = &v16;
  id v7 = v6;
  id v14 = v7;
  [v3 enumerateObjectsUsingBlock:&v10];
  id v8 = objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__MUIGenericSuggestion__joinRecentsTitleComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendAttributedString:*(void *)(a1 + 32)];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendAttributedString:v3];
}

- (void).cxx_destruct
{
}

@end