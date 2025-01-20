@interface _CSSuggestionToken
+ (BOOL)supportsSecureCoding;
+ (id)suggestionTokenWithUserString:(id)a3 displayText:(id)a4 queryString:(id)a5;
- (BOOL)hasRecentActivity;
- (BOOL)hasUsedDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToToken:(id)a3;
- (BOOL)isImportant;
- (BOOL)isMailingList;
- (BOOL)isMegadomeToken;
- (BOOL)isMessageWithAttachmentsToken;
- (BOOL)isUser;
- (BOOL)isValid;
- (BOOL)nameAndEmailRenderableWithName:(id)a3 emails:(id)a4;
- (BOOL)shouldDisplayNameAndEmail;
- (CSItemSummary)itemSummary;
- (NSArray)filterQueries;
- (NSArray)scopes;
- (NSArray)tokenScopes;
- (NSAttributedString)displayText;
- (NSDictionary)features;
- (NSNumber)score;
- (_CSSuggestionToken)initWithCoder:(id)a3;
- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4;
- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 attributeValues:(id)a5 attributeStrings:(id)a6 options:(id)a7;
- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 queryString:(id)a5;
- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 score:(id)a5;
- (_CSSuggestionToken)initWithUserString:(id)a3 itemResult:(id)a4;
- (_CSSuggestionToken)initWithUserString:(id)a3 queryString:(id)a4;
- (_CSSuggestionToken)initWithUserString:(id)a3 scopes:(id)a4 selectedIndex:(int64_t)a5 displayString:(id)a6;
- (_CSSuggestionToken)initWithUserString:(id)a3 suggestionResult:(id)a4;
- (_CSSuggestionToken)initWithUserString:(id)a3 suggestionTokenResult:(id)a4;
- (_CSSuggestionToken)initWithUserString:(id)a3 tokenScopes:(id)a4 selectedIndex:(int64_t)a5 displayString:(id)a6 internalType:(int64_t)a7;
- (_NSRange)replacementRange;
- (double)age;
- (double)lastUsedDate;
- (double)megadomeCompositeScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)displayString;
- (id)localCompletionAttributeStrings;
- (id)localCompletionAttributes;
- (id)localCompletionFeatures;
- (id)nlpCompletionAttributes;
- (id)nlpCompletionCategories;
- (id)nlpCompletionType;
- (id)personItem;
- (id)queryString;
- (id)searchString;
- (id)spotlightQueryString;
- (id)suggestionDisplayText;
- (id)tokenDisplayString;
- (id)tokenQueryString;
- (id)tokenText;
- (int)suggestionTokenDataSources;
- (int64_t)bundleType;
- (int64_t)compareByRank:(id)a3;
- (int64_t)internalType;
- (int64_t)localCompare:(id)a3;
- (int64_t)localCompletionType;
- (int64_t)nlpCompare:(id)a3;
- (int64_t)peopleCompare:(id)a3;
- (int64_t)tokenKind;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)selectedScope;
- (void)addTokenScope:(id)a3 tokenText:(id)a4 queryString:(id)a5;
- (void)commonInitWithUserString:(id)a3 displayString:(id)a4 score:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)mergeTokenAttributes:(id)a3;
- (void)mergeTokenScopesAndSpotlightQueryString:(id)a3;
- (void)setAge:(double)a3;
- (void)setBundleType:(int64_t)a3;
- (void)setFeatures:(id)a3;
- (void)setFilterQueries:(id)a3;
- (void)setHasRecentActivity:(BOOL)a3;
- (void)setHasUsedDate:(BOOL)a3;
- (void)setInternalType:(int64_t)a3;
- (void)setIsMailingList:(BOOL)a3;
- (void)setIsMegadomeToken:(BOOL)a3;
- (void)setItemSummary:(id)a3;
- (void)setMegadomeCompositeScore:(double)a3;
- (void)setScore:(id)a3;
- (void)setSelectedScope:(unint64_t)a3;
- (void)setSuggestionDisplayText:(id)a3;
- (void)setSuggestionTokenDataSources:(int)a3;
- (void)setTokenScopes:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateItemSummary;
- (void)updateNameAndEmailDisplayState;
- (void)updateReplacementRange:(_NSRange)a3;
- (void)updateScopeSelection:(unint64_t)a3;
- (void)updateScopes:(id)a3;
- (void)updateSearchString:(id)a3;
@end

@implementation _CSSuggestionToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)commonInitWithUserString:(id)a3 displayString:(id)a4 score:(id)a5
{
  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = (NSNumber *)a5;
  displayText = self->_displayText;
  self->_displayText = 0;

  self->_replacementRange = (_NSRange)xmmword_18D1B9EB0;
  score = self->_score;
  self->_score = v10;
  v13 = v10;

  scopes = self->_scopes;
  v15 = (NSArray *)MEMORY[0x1E4F1CBF0];
  self->_scopes = (NSArray *)MEMORY[0x1E4F1CBF0];

  displayString = self->_displayString;
  self->_selectedScope = -1;
  self->_displayString = v9;
  v17 = v9;

  searchString = self->_searchString;
  self->_searchString = v8;
  v19 = v8;

  spotlightQueryString = self->_spotlightQueryString;
  self->_spotlightQueryString = 0;

  filterQueries = self->_filterQueries;
  self->_filterQueries = 0;

  *(void *)&self->_personIsUser = 0;
  self->_age = 0.0;
  personIdentifier = self->_personIdentifier;
  self->_personIdentifier = 0;

  personItem = self->_personItem;
  self->_personItem = 0;

  self->_megadomeCompositeScore = 0.0;
  self->_isMegadomeToken = 0;
  self->_suggestionTokenDataSources = 0;
  nlpCompletionType = self->_nlpCompletionType;
  self->_nlpCompletionType = 0;

  nlpCompletionAttributes = self->_nlpCompletionAttributes;
  self->_nlpCompletionAttributes = (NSDictionary *)MEMORY[0x1E4F1CC08];

  self->_nlpKind = 0;
  localCompletionAttributes = self->_localCompletionAttributes;
  self->_localCompletionType = 0x7FFFFFFFFFFFFFFFLL;
  self->_localCompletionAttributes = v15;

  localCompletionAttributesStrings = self->_localCompletionAttributesStrings;
  self->_localCompletionAttributesStrings = v15;

  v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  features = self->_features;
  self->_features = v28;

  [(_CSSuggestionToken *)self setInternalType:0];
}

- (void)encodeWithCoder:(id)a3
{
  score = self->_score;
  id v5 = a3;
  [v5 encodeObject:score forKey:@"score"];
  uint64_t length_low = LODWORD(self->_replacementRange.length);
  [v5 encodeInt32:LODWORD(self->_replacementRange.location) forKey:@"replacementRangeLocation"];
  [v5 encodeInt32:length_low forKey:@"replacementRangeLength"];
  [v5 encodeObject:self->_scopes forKey:@"scopes"];
  [v5 encodeInt32:LODWORD(self->_selectedScope) forKey:@"selectedScope"];
  [v5 encodeObject:self->_tokenScopes forKey:@"tokenScopes"];
  [v5 encodeObject:self->_displayString forKey:@"displayString"];
  [v5 encodeObject:self->_searchString forKey:@"searchString"];
  [v5 encodeObject:self->_spotlightQueryString forKey:@"spotlightQueryString"];
  [v5 encodeObject:self->_filterQueries forKey:@"filterQueries"];
  [v5 encodeObject:self->_personItem forKey:@"personItem"];
  [v5 encodeObject:self->_nlpCompletionType forKey:@"nlpCompletionType"];
  [v5 encodeObject:self->_nlpCompletionAttributes forKey:@"nlpCompletionAttributes"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[_CSSuggestionToken localCompletionType](self, "localCompletionType"), @"localCompletionType");
  [v5 encodeObject:self->_localCompletionAttributes forKey:@"localCompletionAttributes"];
  [v5 encodeObject:self->_localCompletionAttributesStrings forKey:@"localCompletionBundleIdentifiers"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[_CSSuggestionToken internalType](self, "internalType"), @"type");
  v7 = [(_CSSuggestionToken *)self suggestionDisplayText];
  [v5 encodeObject:v7 forKey:@"suggestionDisplayText"];

  id v8 = [(_CSSuggestionToken *)self itemSummary];
  [v5 encodeObject:v8 forKey:@"itemSummary"];
}

- (_CSSuggestionToken)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v58 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
  uint64_t v57 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayString"];
  uint64_t v56 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"spotlightQueryString"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  id obj = [v3 decodeObjectOfClasses:v6 forKey:@"filterQueries"];

  int v54 = [v3 decodeInt32ForKey:@"replacementRangeLocation"];
  int v53 = [v3 decodeInt32ForKey:@"replacementRangeLength"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v62 = [v3 decodeObjectOfClasses:v11 forKey:@"scopes"];

  unint64_t v61 = (int)[v3 decodeInt32ForKey:@"selectedScope"];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v16 = [v3 decodeObjectOfClasses:v15 forKey:@"tokenScopes"];

  uint64_t v60 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"itemSummary"];
  uint64_t v17 = [v3 decodeIntegerForKey:@"type"];
  switch(v17)
  {
    case 1:
      v22 = (void *)v56;
      v19 = (void *)v57;
      v23 = [(_CSSuggestionToken *)self initWithUserString:v57 queryString:v56];
      goto LABEL_23;
    case 2:
      v19 = (void *)v57;
      v18 = (void *)v58;
      v24 = v62;
      v20 = [(_CSSuggestionToken *)self initWithUserString:v58 scopes:v62 selectedIndex:v61 displayString:v57];
      [(_CSSuggestionToken *)v20 setInternalType:2];
      v22 = (void *)v56;
      v25 = obj;
      if (!v20) {
        goto LABEL_32;
      }
      goto LABEL_31;
    case 3:
      v26 = v16;
      v27 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = objc_opt_class();
      v31 = objc_msgSend(v27, "setWithObjects:", v28, v29, v30, objc_opt_class(), 0);
      v32 = [v3 decodeObjectOfClasses:v31 forKey:@"nlpCompletionAttributes"];

      if (![v32 count]) {
        goto LABEL_15;
      }
      v18 = (void *)v58;
      v33 = [(_CSSuggestionToken *)self initWithUserString:v58 suggestionTokenResult:v32];
      goto LABEL_12;
    case 4:
      v26 = v16;
      v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"personItem"];
      if (!v32) {
        goto LABEL_15;
      }
      v18 = (void *)v58;
      v33 = [(_CSSuggestionToken *)self initWithUserString:v58 itemResult:v32];
LABEL_12:
      v20 = v33;
      v19 = (void *)v57;
      goto LABEL_17;
    case 5:
      v26 = v16;
      v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
      if (v32)
      {
        v19 = (void *)v57;
        v18 = (void *)v58;
        v34 = [(_CSSuggestionToken *)self initWithUserString:v58 displayString:v57 score:v32];
      }
      else
      {
LABEL_15:
        v19 = (void *)v57;
        v18 = (void *)v58;
        v34 = [(_CSSuggestionToken *)self initWithUserString:v58 displayString:v57];
      }
      v20 = v34;
LABEL_17:

      v22 = (void *)v56;
      v25 = obj;
      v24 = v62;
      goto LABEL_30;
    case 6:
      v35 = v16;
      v36 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v37 = objc_opt_class();
      v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
      v39 = [v3 decodeObjectOfClasses:v38 forKey:@"localCompletionAttributes"];

      v40 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v41 = objc_opt_class();
      v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
      v43 = [v3 decodeObjectOfClasses:v42 forKey:@"localCompletionBundleIdentifiers"];

      v19 = (void *)v57;
      v18 = (void *)v58;
      if ([v39 count]) {
        v44 = [(_CSSuggestionToken *)self initWithUserString:v58 displayString:v57 attributeValues:v39 attributeStrings:v43 options:MEMORY[0x1E4F1CC08]];
      }
      else {
        v44 = [(_CSSuggestionToken *)self initWithUserString:v58 displayString:v57];
      }
      v20 = v44;
      v44->_localCompletionType = [v3 decodeIntegerForKey:@"localCompletionType"];

      v22 = (void *)v56;
      v25 = obj;
      v16 = v35;
      goto LABEL_31;
    case 7:
    case 8:
    case 9:
    case 10:
      v19 = (void *)v57;
      v18 = (void *)v58;
      v20 = [(_CSSuggestionToken *)self initWithUserString:v58 tokenScopes:v16 selectedIndex:v61 displayString:v57 internalType:v17];
      v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionDisplayText"];
      [(_CSSuggestionToken *)v20 setSuggestionDisplayText:v21];

      goto LABEL_3;
    case 11:
      v26 = v16;
      v45 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v46 = objc_opt_class();
      uint64_t v47 = objc_opt_class();
      uint64_t v48 = objc_opt_class();
      v49 = objc_msgSend(v45, "setWithObjects:", v46, v47, v48, objc_opt_class(), 0);
      v50 = [v3 decodeObjectOfClasses:v49 forKey:@"nlpCompletionAttributes"];

      if ([v50 count])
      {
        v18 = (void *)v58;
        v20 = [(_CSSuggestionToken *)self initWithUserString:v58 suggestionResult:v50];
        v19 = (void *)v57;
      }
      else
      {
        v19 = (void *)v57;
        v18 = (void *)v58;
        v20 = [(_CSSuggestionToken *)self initWithUserString:v58 displayString:v57];
      }
      v22 = (void *)v56;
      v24 = v62;

      v25 = obj;
LABEL_30:
      v16 = v26;
      if (v20) {
        goto LABEL_31;
      }
      goto LABEL_32;
    case 12:
      v22 = (void *)v56;
      v19 = (void *)v57;
      v23 = [(_CSSuggestionToken *)self initWithUserString:v57 displayString:v57 queryString:v56];
LABEL_23:
      v20 = v23;
      v18 = (void *)v58;
      goto LABEL_24;
    default:
      v19 = (void *)v57;
      v18 = (void *)v58;
      v20 = [(_CSSuggestionToken *)self initWithUserString:v58 displayString:v57];
LABEL_3:
      v22 = (void *)v56;
LABEL_24:
      v25 = obj;
      v24 = v62;
      if (v20)
      {
LABEL_31:
        objc_storeStrong((id *)&v20->_filterQueries, v25);
        objc_storeStrong((id *)&v20->_scopes, v62);
        v20->_selectedScope = v61;
        objc_storeStrong((id *)&v20->_tokenScopes, v16);
        v24 = v62;
        -[_CSSuggestionToken updateReplacementRange:](v20, "updateReplacementRange:", v54, v53);
        [(_CSSuggestionToken *)v20 setInternalType:v17];
        v51 = (void *)v60;
        [(_CSSuggestionToken *)v20 setItemSummary:v60];
      }
      else
      {
LABEL_32:
        v51 = (void *)v60;
      }

      return v20;
  }
}

- (_CSSuggestionToken)initWithUserString:(id)a3 queryString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_CSSuggestionToken;
  uint64_t v8 = [(_CSSuggestionToken *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(_CSSuggestionToken *)v8 commonInitWithUserString:v6 displayString:v6 score:&unk_1EDBD6C18];
    objc_storeStrong((id *)&v9->_spotlightQueryString, a4);
    [(_CSSuggestionToken *)v9 setInternalType:1];
  }

  return v9;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 queryString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CSSuggestionToken;
  objc_super v11 = [(_CSSuggestionToken *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(_CSSuggestionToken *)v11 commonInitWithUserString:v8 displayString:v9 score:&unk_1EDBD6C18];
    objc_storeStrong((id *)&v12->_spotlightQueryString, a5);
    [(_CSSuggestionToken *)v12 setInternalType:12];
  }

  return v12;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 score:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CSSuggestionToken;
  objc_super v11 = [(_CSSuggestionToken *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(_CSSuggestionToken *)v11 commonInitWithUserString:v8 displayString:v9 score:v10];
    [(_CSSuggestionToken *)v12 setInternalType:5];
  }

  return v12;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_CSSuggestionToken;
  id v8 = [(_CSSuggestionToken *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(_CSSuggestionToken *)v8 commonInitWithUserString:v6 displayString:v7 score:&unk_1EDBD6C28];
    v9->_localCompletionType = 9;
    v9->_internalType = 6;
  }

  return v9;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 attributeValues:(id)a5 attributeStrings:(id)a6 options:(id)a7
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = 0;
  if (v13 && v14)
  {
    if ((unint64_t)[v14 count] < 0x15)
    {
      uint64_t v17 = 0;
      goto LABEL_79;
    }
    v162 = v16;
    v175.receiver = self;
    v175.super_class = (Class)_CSSuggestionToken;
    v18 = [(_CSSuggestionToken *)&v175 init];
    v19 = v18;
    if (!v18) {
      goto LABEL_77;
    }
    v158 = v15;
    v159 = v18;
    v161 = v13;
    [(_CSSuggestionToken *)v18 commonInitWithUserString:v12 displayString:v13 score:&unk_1EDBD6C28];
    v20 = [v14 objectAtIndexedSubscript:14];
    uint64_t v21 = [v20 integerValue];

    v22 = [v14 objectAtIndexedSubscript:12];
    [v22 doubleValue];
    double v24 = v23;

    v157 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25 = [v14 objectAtIndexedSubscript:20];
    v160 = v14;
    id v156 = v12;
    if (([v25 unsignedLongLongValue] & 4) != 0)
    {
      LODWORD(v27) = 1;
    }
    else
    {
      v26 = [v14 objectAtIndexedSubscript:20];
      unint64_t v27 = ((unint64_t)[v26 unsignedLongLongValue] >> 3) & 1;

      id v14 = v160;
    }

    uint64_t v28 = [v14 objectAtIndexedSubscript:20];
    unsigned int v29 = [v28 unsignedLongLongValue];

    int v30 = (v29 >> 3) & 1;
    id v14 = v160;
    uint64_t v31 = [NSNumber numberWithDouble:v24];
    v19 = v159;
    score = v159->_score;
    v159->_score = (NSNumber *)v31;

    v159->_megadomeCompositeScore = 0.0;
    v159->_isMegadomeToken = 0;
    v159->_suggestionTokenDataSources = 0;
    v159->_localCompletionType = v21;
    objc_storeStrong((id *)&v159->_localCompletionAttributes, a5);
    objc_storeStrong((id *)&v159->_localCompletionAttributesStrings, a6);
    v33 = [v160 objectAtIndexedSubscript:20];
    v159->_isMailIntent = ([v33 unsignedLongLongValue] & 2) != 0;

    v159->_hasRecentActivity = v30;
    v34 = [v160 objectAtIndexedSubscript:20];
    v159->_BOOL personNameIsMissing = [v34 unsignedLongLongValue] & 1;

    v35 = [v160 objectAtIndexedSubscript:4];
    [v35 doubleValue];
    v159->_age = v36;

    uint64_t v37 = [v160 objectAtIndexedSubscript:17];
    v159->_hasUsedDate = [v37 integerValue] == 1;

    if ([(_CSSuggestionToken *)v159 localCompletionType] == 10
      || [(_CSSuggestionToken *)v159 localCompletionType] == 15)
    {
      v38 = [v160 objectAtIndexedSubscript:15];
      uint64_t v39 = [v38 unsignedIntValue];
    }
    else
    {
      uint64_t v39 = 0;
    }
    v40 = v157;
    [(_CSSuggestionToken *)v159 setInternalType:6];
    switch([(_CSSuggestionToken *)v159 localCompletionType])
    {
      case 6:
        uint64_t v153 = v39;
        if (initWithUserString_displayString_attributeValues_attributeStrings_options__onceScopesToken != -1) {
          dispatch_once(&initWithUserString_displayString_attributeValues_attributeStrings_options__onceScopesToken, &__block_literal_global_6);
        }
        uint64_t v47 = (CSItemSummary *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v167 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        long long v170 = 0u;
        uint64_t v48 = [&unk_1EDBD60A0 countByEnumeratingWithState:&v167 objects:v195 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v168;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v168 != v50) {
                objc_enumerationMutation(&unk_1EDBD60A0);
              }
              v52 = [NSString stringWithFormat:@"%@=\"%@\"cwd", *(void *)(*((void *)&v167 + 1) + 8 * i), v161];
              [(CSItemSummary *)v47 addObject:v52];
            }
            uint64_t v49 = [&unk_1EDBD60A0 countByEnumeratingWithState:&v167 objects:v195 count:16];
          }
          while (v49);
        }
        v154 = v47;
        long long v165 = 0u;
        long long v166 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        int v53 = [v162 objectForKeyedSubscript:@"photosBundleIDs"];
        uint64_t v54 = [v53 countByEnumeratingWithState:&v163 objects:v194 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          id v56 = 0;
          uint64_t v57 = *(void *)v164;
          v40 = v157;
          while (1)
          {
            for (uint64_t j = 0; j != v55; ++j)
            {
              if (*(void *)v164 != v57) {
                objc_enumerationMutation(v53);
              }
              uint64_t v59 = *(void *)(*((void *)&v163 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                id v56 = 0;
LABEL_64:

                v131 = [(CSItemSummary *)v154 componentsJoinedByString:@" || "];
                if ([v56 count])
                {
                  v132 = [v56 componentsJoinedByString:@" || "];
                }
                else
                {
                  v132 = @"true";
                }
                v19 = v159;
                id v14 = v160;
                uint64_t v134 = [NSString stringWithFormat:@"((%@) && (%@) && %@)", v131, v132, @"(kMDItemContentTypeTree=\"public.image\" || kMDItemContentTypeTree=\"public.movie\""];
                spotlightQueryString = v159->_spotlightQueryString;
                v159->_spotlightQueryString = (NSString *)v134;

                v192[0] = @"TOKEN";
                v192[1] = @"TEXT";
                v193[0] = initWithUserString_displayString_attributeValues_attributeStrings_options__gPhoto;
                v193[1] = v161;
                v136 = v159->_spotlightQueryString;
                v192[2] = @"QUERY";
                v192[3] = @"TYPE";
                v193[2] = v136;
                v193[3] = &unk_1EDBD6628;
                v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:4];
                [(NSArray *)v40 addObject:v137];

                uint64_t v138 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v161];
                suggestionDisplayText = v159->_suggestionDisplayText;
                v159->_suggestionDisplayText = (NSAttributedString *)v138;

                uint64_t v39 = v153;
                v44 = v154;
                goto LABEL_74;
              }
              if (!v56) {
                id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              uint64_t v60 = [NSString stringWithFormat:@"_kMDItemBundleID=\"%@\"", v59];
              [v56 addObject:v60];
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v163 objects:v194 count:16];
            if (!v55) {
              goto LABEL_64;
            }
          }
        }
        id v56 = 0;
        v40 = v157;
        goto LABEL_64;
      case 7:
        unint64_t v61 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
        id v13 = v161;
        v62 = objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        int v63 = tokenScopesWithPersonKey(v62, 0, 0, 0, v61, &unk_1EDBD6088, v157, 0, 0);

        if (v63)
        {
          v19 = v159;
          v64 = v159->_spotlightQueryString;
          v159->_spotlightQueryString = v61;
          v65 = v61;

          v66 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF CONTAINS %@", @"@"];
          v44 = [v158 filteredArrayUsingPredicate:v66];

          v67 = [CSItemSummary alloc];
          v68 = [(CSItemSummary *)v67 initWithName:v161 contactIdentifier:0 alternateNames:0 phoneNumbers:0 emailAddresses:v44 contactScope:0];
          [(_CSSuggestionToken *)v159 setItemSummary:v68];

          goto LABEL_47;
        }
        v155 = (CSItemSummary *)v61;
        goto LABEL_82;
      case 10:
        v69 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF CONTAINS %@", @"@"];
        v70 = [v158 filteredArrayUsingPredicate:v69];

        v155 = v70;
        if ((v27 & 1) != 0
          || [(_CSSuggestionToken *)v159 nameAndEmailRenderableWithName:v161 emails:v70])
        {
          v71 = v161;
          v72 = [[CSItemSummary alloc] initWithName:v161 contactIdentifier:0 alternateNames:0 phoneNumbers:0 emailAddresses:v70 contactScope:0];
        }
        else
        {
          v71 = v161;
          v72 = [[CSItemSummary alloc] initWithName:v161 contactIdentifier:0 alternateNames:0 phoneNumbers:0 emailAddresses:0 allEmailAddresses:v70 contactScope:0];
        }
        v140 = v72;
        [(_CSSuggestionToken *)v159 setItemSummary:v72];

        v141 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
        BOOL personNameIsMissing = v159->_personNameIsMissing;
        v143 = objc_msgSend(v71, "cs_escapedStringForSearchQuery");
        if (personNameIsMissing)
        {
          v144 = objc_msgSend(v71, "cs_escapedStringForSearchQuery");
          v191 = v144;
          v145 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];
          int v146 = tokenScopesForPeopleSuggestions(v143, v145, v141, v157, 1, v27, [(_CSSuggestionToken *)v159 shouldDisplayNameAndEmail]);

          if (v146)
          {
LABEL_73:
            v147 = v159->_spotlightQueryString;
            v159->_spotlightQueryString = v141;

            id v14 = v160;
            v44 = v155;
            goto LABEL_74;
          }
        }
        else
        {
          int v152 = tokenScopesForPeopleSuggestions(v143, v70, v141, v157, v159->_isMailIntent, v27, [(_CSSuggestionToken *)v159 shouldDisplayNameAndEmail]);

          if (v152) {
            goto LABEL_73;
          }
        }

        id v13 = v161;
LABEL_82:
        id v15 = v158;

        uint64_t v17 = 0;
        id v12 = v156;
        self = v159;
        id v14 = v160;
        goto LABEL_78;
      case 11:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        uint64_t v73 = [NSString stringWithFormat:@"(kMDItemPhotosSeasons=\"%@\"cwd || kMDItemTitle=\"%@\"cwd)", v44, v44];
        v74 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v73;

        v182[0] = @"TOKEN";
        v182[1] = @"TEXT";
        v183[0] = &stru_1EDBB3A50;
        v183[1] = v44;
        v75 = v159->_spotlightQueryString;
        v182[2] = @"QUERY";
        v182[3] = @"TYPE";
        v183[2] = v75;
        v183[3] = &unk_1EDBD6688;
        v76 = (void *)MEMORY[0x1E4F1C9E8];
        v77 = v183;
        v78 = v182;
        goto LABEL_49;
      case 12:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        uint64_t v79 = [NSString stringWithFormat:@"(kMDItemPhotosHolidays=\"%@\"cwd || kMDItemTitle=\"%@\"cwd)", v44, v44];
        v80 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v79;

        v180[0] = @"TOKEN";
        v180[1] = @"TEXT";
        v181[0] = &stru_1EDBB3A50;
        v181[1] = v44;
        v81 = v159->_spotlightQueryString;
        v180[2] = @"QUERY";
        v180[3] = @"TYPE";
        v181[2] = v81;
        v181[3] = &unk_1EDBD66A0;
        v76 = (void *)MEMORY[0x1E4F1C9E8];
        v77 = v181;
        v78 = v180;
        goto LABEL_49;
      case 13:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        uint64_t v82 = [NSString stringWithFormat:@"(kMDItemAcquisitionModel=\"%@\"cwd)", v44];
        v83 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v82;

        v186[0] = @"TOKEN";
        v186[1] = @"TEXT";
        v187[0] = &stru_1EDBB3A50;
        v187[1] = v44;
        v84 = v159->_spotlightQueryString;
        v186[2] = @"QUERY";
        v186[3] = @"TYPE";
        v187[2] = v84;
        v187[3] = &unk_1EDBD6658;
        v76 = (void *)MEMORY[0x1E4F1C9E8];
        v77 = v187;
        v78 = v186;
        goto LABEL_49;
      case 14:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        uint64_t v85 = [NSString stringWithFormat:@"(kMDItemPhotosMediaTypes=\"%@\"cwd || kMDItemTitle=\"%@\"cwd)", v44, v44];
        v86 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v85;

        v188[0] = @"TOKEN";
        v188[1] = @"TEXT";
        v189[0] = &stru_1EDBB3A50;
        v189[1] = v44;
        v87 = v159->_spotlightQueryString;
        v188[2] = @"QUERY";
        v188[3] = @"TYPE";
        v189[2] = v87;
        v189[3] = &unk_1EDBD6640;
        v76 = (void *)MEMORY[0x1E4F1C9E8];
        v77 = v189;
        v78 = v188;
        goto LABEL_49;
      case 15:
        v88 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
        BOOL v89 = v159->_personNameIsMissing;
        id v13 = v161;
        v90 = objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v91 = v90;
        if (v89)
        {
          v92 = objc_msgSend(v161, "cs_escapedStringForSearchQuery");
          v190 = v92;
          v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v190 count:1];
          int v94 = tokenScopesWithPersonKey(v91, 0, v93, 0, v88, &unk_1EDBD60D0, v157, v159->_isMailIntent, 0);

          if (v94)
          {
LABEL_46:
            v95 = v159->_spotlightQueryString;
            v159->_spotlightQueryString = v88;
            v96 = v88;

            v97 = [CSItemSummary alloc];
            v44 = [(CSItemSummary *)v97 initWithName:v161 contactIdentifier:0 alternateNames:0 phoneNumbers:0 emailAddresses:0 contactScope:0];
            [(_CSSuggestionToken *)v159 setItemSummary:v44];
LABEL_47:
            id v14 = v160;
LABEL_74:

LABEL_75:
            scopes = v19->_scopes;
            v19->_scopes = v40;
            v149 = v40;

            uint64_t v150 = [(NSArray *)v149 count];
            id v12 = v156;
            id v13 = v161;
            id v15 = v158;
            if (v150) {
              [(_CSSuggestionToken *)v19 updateScopeSelection:v39];
            }
LABEL_77:
            self = v19;
            uint64_t v17 = self;
LABEL_78:
            id v16 = v162;
            break;
          }
        }
        else
        {
          int v133 = tokenScopesWithPersonKey(v90, 0, 0, 0, v88, &unk_1EDBD60D0, v157, v159->_isMailIntent, 0);

          if (v133) {
            goto LABEL_46;
          }
        }
        v155 = (CSItemSummary *)v88;
        goto LABEL_82;
      case 16:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        uint64_t v98 = [NSString stringWithFormat:@"(kMDItemPhotosKeywords=\"%@\"cwd || kMDItemTitle=\"%@\"cwd || kMDItemKeywords=\"%@\"cwd)", v44, v44, v44];
        v99 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v98;

        v184[0] = @"TOKEN";
        v184[1] = @"TEXT";
        v185[0] = &stru_1EDBB3A50;
        v185[1] = v44;
        v100 = v159->_spotlightQueryString;
        v184[2] = @"QUERY";
        v184[3] = @"TYPE";
        v185[2] = v100;
        v185[3] = &unk_1EDBD6670;
        v76 = (void *)MEMORY[0x1E4F1C9E8];
        v77 = v185;
        v78 = v184;
LABEL_49:
        v101 = [v76 dictionaryWithObjects:v77 forKeys:v78 count:4];
        [(NSArray *)v157 addObject:v101];

        goto LABEL_74;
      case 19:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        id v102 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        v103 = [v102 standaloneMonthSymbols];
        uint64_t v104 = [v103 indexOfObject:v161];

        uint64_t v105 = objc_msgSend(NSString, "stringWithFormat:", @"(InRange(_kMDItemContentCreationDateMonth,%lu,%lu))", v104 + 1, v104 + 1);
        v106 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v105;

        v178[0] = @"TOKEN";
        v178[1] = @"TEXT";
        v179[0] = &stru_1EDBB3A50;
        v179[1] = v44;
        v107 = v159->_spotlightQueryString;
        v178[2] = @"QUERY";
        v178[3] = @"TYPE";
        v179[2] = v107;
        v179[3] = &unk_1EDBD65E0;
        v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:4];
        [(NSArray *)v157 addObject:v108];

        goto LABEL_52;
      case 20:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        id v102 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v102 setDateStyle:4];
        [v102 setTimeStyle:0];
        [v102 setDateFormat:@"y"];
        [v102 dateFromString:v44];
        v110 = uint64_t v109 = v39;
        v111 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v112 = [v111 components:4 fromDate:v110];

        uint64_t v113 = objc_msgSend(NSString, "stringWithFormat:", @"(InRange(_kMDItemContentCreationDateYear,%ld,%ld))", objc_msgSend(v112, "year"), objc_msgSend(v112, "year"));
        v114 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v113;

        v176[0] = @"TOKEN";
        v176[1] = @"TEXT";
        v177[0] = &stru_1EDBB3A50;
        v177[1] = v44;
        v115 = v159->_spotlightQueryString;
        v176[2] = @"QUERY";
        v176[3] = @"TYPE";
        v177[2] = v115;
        v177[3] = &unk_1EDBD65E0;
        v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:4];
        [(NSArray *)v157 addObject:v116];

        uint64_t v39 = v109;
LABEL_52:

        goto LABEL_74;
      case 21:
      case 22:
        uint64_t v41 = [NSString stringWithFormat:@"(**=\"%@\"cwd)", v161];
        v42 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v41;

        id v43 = objc_alloc(MEMORY[0x1E4F28B18]);
        v44 = [v161 lowercaseString];
        uint64_t v45 = [v43 initWithString:v44];
        uint64_t v46 = v159->_suggestionDisplayText;
        v159->_suggestionDisplayText = (NSAttributedString *)v45;

        goto LABEL_74;
      case 23:
        v117 = (CSItemSummary *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v118 = [NSString stringWithFormat:@"**=\"%@\"cwd", v161];
        v44 = v117;
        [(CSItemSummary *)v117 addObject:v118];

        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        id v119 = v158;
        uint64_t v120 = [v119 countByEnumeratingWithState:&v171 objects:v196 count:16];
        if (v120)
        {
          uint64_t v121 = v120;
          uint64_t v122 = *(void *)v172;
          do
          {
            for (uint64_t k = 0; k != v121; ++k)
            {
              if (*(void *)v172 != v122) {
                objc_enumerationMutation(v119);
              }
              v124 = NSString;
              v125 = [*(id *)(*((void *)&v171 + 1) + 8 * k) stringByReplacingOccurrencesOfString:@" " withString:@"*"];
              v126 = [v124 stringWithFormat:@"**=\"%@\"cwd", v125];
              [(CSItemSummary *)v44 addObject:v126];
            }
            uint64_t v121 = [v119 countByEnumeratingWithState:&v171 objects:v196 count:16];
          }
          while (v121);
        }

        v127 = NSString;
        v128 = [(CSItemSummary *)v44 componentsJoinedByString:@" || "];
        uint64_t v129 = [v127 stringWithFormat:@"(%@)", v128];
        v19 = v159;
        v130 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v129;

        id v14 = v160;
        v40 = v157;
        goto LABEL_74;
      default:
        goto LABEL_75;
    }
  }
LABEL_79:

  return v17;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 itemResult:(id)a4
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v129 = a3;
  id v5 = a4;
  v132 = v5;
  if (v5
    && (id v123 = a4,
        [v5 attributeSet],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v132 attributeSet];
    v125 = [v7 displayName];

    id v8 = [v132 attributeSet];
    id v9 = [v8 attributeDictionary];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"_kMDItemPersonScore"];
    objc_super v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = &unk_1EDBD66B8;
    }
    id v126 = v12;

    id v13 = [v132 attributeSet];
    id v14 = [v13 attributeDictionary];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"com_apple_spotlight_contacts_type"];
    id v16 = (void *)v15;
    uint64_t v17 = @"un";
    if (v15) {
      uint64_t v17 = (__CFString *)v15;
    }
    v124 = v17;

    v18 = [v132 attributeSet];
    v19 = [v18 attributeDictionary];
    v20 = [v19 objectForKeyedSubscript:@"_kMDItemBundleID"];
    int v21 = [v20 isEqualToString:@"com.apple.spotlight.contacts"];

    uint64_t v158 = 0;
    v159 = &v158;
    uint64_t v160 = 0x2020000000;
    char v161 = 0;
    double v22 = 0.0;
    if (v21)
    {
      int v117 = v21;
      double v23 = [v132 attributeSet];
      double v24 = [v23 attributeDictionary];
      uint64_t v25 = [v24 objectForKeyedSubscript:@"_kMDItemPersonInCount"];
      v26 = (void *)v25;
      if (v25) {
        unint64_t v27 = (void *)v25;
      }
      else {
        unint64_t v27 = &unk_1EDBD66B8;
      }
      id v121 = v27;

      uint64_t v28 = [v132 attributeSet];
      unsigned int v29 = [v28 attributeDictionary];
      uint64_t v30 = [v29 objectForKeyedSubscript:@"_kMDItemPersonOutCount"];
      uint64_t v31 = (void *)v30;
      if (v30) {
        v32 = (void *)v30;
      }
      else {
        v32 = &unk_1EDBD66B8;
      }
      id v130 = v32;

      v33 = [v132 attributeSet];
      v34 = [v33 attributeDictionary];
      uint64_t v35 = [v34 objectForKeyedSubscript:@"_kMDItemPersonCount"];
      double v36 = (void *)v35;
      if (v35) {
        uint64_t v37 = (void *)v35;
      }
      else {
        uint64_t v37 = &unk_1EDBD66B8;
      }
      id v119 = v37;

      [v126 doubleValue];
      double v39 = v38;
      [v121 doubleValue];
      double v41 = v40;
      [v130 doubleValue];
      double v43 = v42;
      [v119 doubleValue];
      double v45 = log2(v41 * 0.1 + v39 * 0.5 + v43 * 5.0 + v44 * 0.15);
      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      uint64_t v46 = [v132 attributeSet];
      uint64_t v47 = [v46 emailAddresses];

      uint64_t v48 = [v47 countByEnumeratingWithState:&v154 objects:v166 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v155;
LABEL_20:
        uint64_t v50 = 0;
        while (1)
        {
          if (*(void *)v155 != v49) {
            objc_enumerationMutation(v47);
          }
          if (*((unsigned char *)v159 + 24)) {
            break;
          }
          uint64_t v51 = *(void *)(*((void *)&v154 + 1) + 8 * v50);
          v52 = +[CSSuggestion noreplyTemplates];
          v150[0] = MEMORY[0x1E4F143A8];
          v150[1] = 3221225472;
          v150[2] = __52___CSSuggestionToken_initWithUserString_itemResult___block_invoke;
          v150[3] = &unk_1E5549438;
          id v151 = v130;
          uint64_t v152 = v51;
          uint64_t v153 = &v158;
          [v52 enumerateObjectsUsingBlock:v150];

          if (v48 == ++v50)
          {
            uint64_t v48 = [v47 countByEnumeratingWithState:&v154 objects:v166 count:16];
            if (v48) {
              goto LABEL_20;
            }
            break;
          }
        }
      }

      double v22 = fmax(fmin(v45, 10.0) * 0.1, 0.0);
      int v21 = v117;
    }
    char v53 = [v126 isEqualToNumber:&unk_1EDBD66D0];
    char v54 = [(__CFString *)v124 isEqualToString:@"im"];
    if (*((unsigned char *)v159 + 24)) {
      int v55 = 1;
    }
    else {
      int v55 = [(__CFString *)v124 isEqualToString:@"ml"];
    }
    if (v125
      && (([v126 doubleValue], v57 != 0.0) || objc_msgSend(v129, "length"))
      && (((v21 | v55 ^ 1) & 1) != 0 || v129 && (unint64_t)[v129 length] >= 5))
    {
      id obj = [v132 uniqueIdentifier];
      uint64_t v58 = [v132 domainIdentifier];
      uint64_t v59 = v58;
      v110 = v58;
      if (v58)
      {
        int v109 = [v58 isEqualToString:@"com.apple.mobileslideshow"];
        int v60 = [v59 isEqualToString:@"com.apple.mobilemail"];
        int v114 = [v59 isEqualToString:@"com.apple.mobilephone"];
        int v61 = [v59 isEqualToString:@"pseudoContacts"];
        uint64_t v62 = 1;
        if (v61) {
          uint64_t v62 = 2;
        }
      }
      else
      {
        int v114 = 0;
        int v109 = 0;
        int v60 = 0;
        uint64_t v62 = 1;
      }
      uint64_t v105 = v62;
      char v106 = v55;
      BOOL v107 = v54;
      BOOL v108 = v53;
      int v118 = v21;
      int v63 = [v132 attributeSet];
      uint64_t v120 = [v63 contactKeywords];

      v64 = [v132 attributeSet];
      v131 = [v64 emailAddresses];

      v65 = [v132 attributeSet];
      v115 = [v65 phoneNumbers];

      v66 = [v132 attributeSet];
      v67 = [v66 attributeDictionary];
      v116 = [v67 objectForKeyedSubscript:@"kMDItemAlternateNames"];

      v68 = [v132 attributeSet];
      v69 = [v68 attributeDictionary];
      uint64_t v70 = [v69 objectForKeyedSubscript:@"_kMDItemContactIdentifier"];
      v71 = (void *)v70;
      v72 = (void *)MEMORY[0x1E4F1CBF0];
      if (v70) {
        v72 = (void *)v70;
      }
      id v111 = v72;

      if (v60 && ![v131 count])
      {
        id v56 = 0;
      }
      else
      {
        uint64_t v113 = objc_msgSend(v125, "cs_escapedStringForSearchQuery");
        id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v148 = 0u;
        long long v149 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        id v74 = v120;
        uint64_t v75 = [v74 countByEnumeratingWithState:&v146 objects:v165 count:16];
        if (v75)
        {
          uint64_t v76 = *(void *)v147;
          do
          {
            for (uint64_t i = 0; i != v75; ++i)
            {
              if (*(void *)v147 != v76) {
                objc_enumerationMutation(v74);
              }
              v78 = objc_msgSend(*(id *)(*((void *)&v146 + 1) + 8 * i), "cs_escapedStringForSearchQuery");
              [v73 addObject:v78];
            }
            uint64_t v75 = [v74 countByEnumeratingWithState:&v146 objects:v165 count:16];
          }
          while (v75);
        }

        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v79 = v116;
        uint64_t v80 = [v79 countByEnumeratingWithState:&v142 objects:v164 count:16];
        if (v80)
        {
          uint64_t v81 = *(void *)v143;
          do
          {
            for (uint64_t j = 0; j != v80; ++j)
            {
              if (*(void *)v143 != v81) {
                objc_enumerationMutation(v79);
              }
              v83 = objc_msgSend(*(id *)(*((void *)&v142 + 1) + 8 * j), "cs_escapedStringForSearchQuery");
              [v73 addObject:v83];
            }
            uint64_t v80 = [v79 countByEnumeratingWithState:&v142 objects:v164 count:16];
          }
          while (v80);
        }

        id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v85 = v131;
        uint64_t v86 = [v85 countByEnumeratingWithState:&v138 objects:v163 count:16];
        if (v86)
        {
          uint64_t v87 = *(void *)v139;
          do
          {
            for (uint64_t k = 0; k != v86; ++k)
            {
              if (*(void *)v139 != v87) {
                objc_enumerationMutation(v85);
              }
              BOOL v89 = objc_msgSend(*(id *)(*((void *)&v138 + 1) + 8 * k), "cs_escapedStringForSearchQuery");
              [v84 addObject:v89];
            }
            uint64_t v86 = [v85 countByEnumeratingWithState:&v138 objects:v163 count:16];
          }
          while (v86);
        }

        id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        id v91 = v115;
        uint64_t v92 = [v91 countByEnumeratingWithState:&v134 objects:v162 count:16];
        if (v92)
        {
          uint64_t v93 = *(void *)v135;
          do
          {
            for (uint64_t m = 0; m != v92; ++m)
            {
              if (*(void *)v135 != v93) {
                objc_enumerationMutation(v91);
              }
              v95 = objc_msgSend(*(id *)(*((void *)&v134 + 1) + 8 * m), "cs_escapedStringForSearchQuery");
              [v90 addObject:v95];
            }
            uint64_t v92 = [v91 countByEnumeratingWithState:&v134 objects:v162 count:16];
          }
          while (v92);
        }

        id v96 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        id v122 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v97 = &unk_1EDBD6100;
        if (v109) {
          v97 = &unk_1EDBD60E8;
        }
        id v98 = v97;
        v99 = v98;
        if (v114)
        {

          v99 = &unk_1EDBD6118;
        }
        if (tokenScopesWithPersonKey(v113, v73, v84, v90, v96, v99, v122, 0, v114))
        {
          v133.receiver = self;
          v133.super_class = (Class)_CSSuggestionToken;
          v100 = [(_CSSuggestionToken *)&v133 init];
          v101 = v100;
          if (v100)
          {
            [(_CSSuggestionToken *)v100 commonInitWithUserString:v129 displayString:v125 score:v126];
            [(_CSSuggestionToken *)v101 setInternalType:4];
            objc_storeStrong((id *)&v101->_spotlightQueryString, v96);
            v101->_personIsUser = v108;
            v101->_personIsImportant = v107;
            v101->_personIsMailingList = v106;
            objc_storeStrong((id *)&v101->_personIdentifier, obj);
            objc_storeStrong((id *)&v101->_personItem, v123);
            objc_storeStrong((id *)&v101->_scopes, v122);
            if (v118)
            {
              v101->_megadomeCompositeScore = v22;
              v101->_isMegadomeToken = 1;
            }
            id v102 = [CSItemSummary alloc];
            v128 = [v111 firstObject];
            v103 = [(CSItemSummary *)v102 initWithName:v125 contactIdentifier:v128 alternateNames:v79 phoneNumbers:v91 emailAddresses:v85 contactScope:0];
            [(_CSSuggestionToken *)v101 setItemSummary:v103];

            [(_CSSuggestionToken *)v101 setBundleType:v105];
            if ([v122 count]) {
              [(_CSSuggestionToken *)v101 updateScopeSelection:0];
            }
          }
          id v56 = v101;
          self = v56;
        }
        else
        {
          id v56 = 0;
        }
      }
    }
    else
    {
      id v56 = 0;
    }
    _Block_object_dispose(&v158, 8);
  }
  else
  {
    id v56 = 0;
  }

  return v56;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 scopes:(id)a4 selectedIndex:(int64_t)a5 displayString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_CSSuggestionToken;
  id v13 = [(_CSSuggestionToken *)&v16 init];
  id v14 = v13;
  if (v13)
  {
    [(_CSSuggestionToken *)v13 commonInitWithUserString:v10 displayString:v12 score:&unk_1EDBD66D0];
    [(_CSSuggestionToken *)v14 setInternalType:2];
    objc_storeStrong((id *)&v14->_scopes, a4);
    v14->_selectedScope = a5;
    [(_CSSuggestionToken *)v14 updateScopeSelection:a5];
  }

  return v14;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 tokenScopes:(id)a4 selectedIndex:(int64_t)a5 displayString:(id)a6 internalType:(int64_t)a7
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_CSSuggestionToken;
  uint64_t v15 = [(_CSSuggestionToken *)&v22 init];
  objc_super v16 = v15;
  if (v15)
  {
    [(_CSSuggestionToken *)v15 commonInitWithUserString:v12 displayString:v14 score:&unk_1EDBD66D0];
    [(_CSSuggestionToken *)v16 setInternalType:a7];
    [(_CSSuggestionToken *)v16 setTokenScopes:v13];
    if ([v12 length])
    {
      v23[0] = v12;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    }
    else
    {
      uint64_t v17 = &unk_1EDBD6130;
    }
    v18 = [(_CSSuggestionToken *)v16 tokenScopes];
    uint64_t v19 = +[_CSTokenScope scopesFromCSTokenScopes:v18 displayString:v14 handles:v17];
    scopes = v16->_scopes;
    v16->_scopes = (NSArray *)v19;

    [(_CSSuggestionToken *)v16 updateScopeSelection:a5];
  }

  return v16;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 suggestionTokenResult:(id)a4
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"suggestionTypeKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v7 objectForKeyedSubscript:@"suggestionTypeKey"];
    }
    else
    {
      uint64_t v9 = 0;
    }

    id v11 = [v7 objectForKeyedSubscript:@"suggestionTokensKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v7 objectForKeyedSubscript:@"suggestionTokensKey"];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = 0;
  }
  uint64_t v102 = [v10 count];
  if (v102)
  {
    id v12 = [v10 objectAtIndexedSubscript:0];
    uint64_t v112 = [v12 objectForKeyedSubscript:@"STATUS"];

    uint64_t v103 = 0;
  }
  else
  {
    uint64_t v112 = 0;
    uint64_t v103 = -1;
  }
  id obj = a4;
  if (initWithUserString_suggestionTokenResult__onceToken != -1) {
    dispatch_once(&initWithUserString_suggestionTokenResult__onceToken, &__block_literal_global_634);
  }
  id v13 = [(id)initWithUserString_suggestionTokenResult__gSuggestionTypes objectForKeyedSubscript:v9];

  if (v13)
  {
    id v14 = [(id)initWithUserString_suggestionTokenResult__gSuggestionTypes objectForKeyedSubscript:v9];
    int v15 = [v14 intValue];
    uint64_t v16 = v15;

    if (v15 == 25 && v112)
    {
      uint64_t v17 = [(id)initWithUserString_suggestionTokenResult__gSuggestionFlagColorTypes objectForKeyedSubscript:v112];
      uint64_t v16 = (int)[v17 intValue];
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  int v109 = v7;
  id v110 = v10;
  id v111 = (id)v9;
  if (!v10 || ![v10 count])
  {
LABEL_51:
    if (v7)
    {
      double v41 = [v7 objectForKeyedSubscript:@"suggestionTextKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v42 = [v7 objectForKeyedSubscript:@"suggestionTextKey"];
      }
      else
      {
        double v42 = 0;
      }
    }
    else
    {
      double v42 = 0;
    }
    if (v16 == 16)
    {
      double v43 = [v10 firstObject];
      uint64_t v44 = [v43 objectForKeyedSubscript:@"TEXT"];

      double v42 = (void *)v44;
    }
    uint64_t v113 = v42;
    if (v7)
    {
      double v45 = [v7 objectForKeyedSubscript:@"suggestionDescriptionKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = [v7 objectForKeyedSubscript:@"suggestionDescriptionKey"];
      }
      else
      {
        id v25 = 0;
      }

      uint64_t v47 = [v7 objectForKeyedSubscript:@"suggestionFilterQueries"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v5;
        [v7 objectForKeyedSubscript:@"suggestionFilterQueries"];
        v50 = uint64_t v49 = v7;
        uint64_t v51 = [v50 firstObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v52 = v16;
          char v53 = [v49 objectForKeyedSubscript:@"suggestionFilterQueries"];
          char v54 = [v53 lastObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v31 = [v49 objectForKeyedSubscript:@"suggestionFilterQueries"];
          }
          else
          {
            uint64_t v31 = 0;
          }

          uint64_t v16 = v52;
        }
        else
        {
          uint64_t v31 = 0;
        }

        id v5 = v48;
        id v7 = v109;
      }
      else
      {
        uint64_t v31 = 0;
      }

      uint64_t v58 = [v7 objectForKeyedSubscript:@"suggestionIncludeBundles"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v106 = v5;
        uint64_t v59 = v16;
        [v7 objectForKeyedSubscript:@"suggestionIncludeBundles"];
        v61 = int v60 = v7;
        uint64_t v62 = [v61 firstObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v63 = [v60 objectForKeyedSubscript:@"suggestionIncludeBundles"];
          v64 = [v63 lastObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v65 = [v60 objectForKeyedSubscript:@"suggestionIncludeBundles"];
          }
          else
          {
            uint64_t v65 = 0;
          }

          uint64_t v46 = v65;
        }
        else
        {
          uint64_t v46 = 0;
        }

        id v7 = v109;
        uint64_t v16 = v59;
        id v5 = v106;
      }
      else
      {
        uint64_t v46 = 0;
      }
    }
    else
    {
      id v25 = 0;
      uint64_t v31 = 0;
      uint64_t v46 = 0;
    }
    if (!(v46 | v31))
    {
      uint64_t v81 = 0;
      id v56 = (void *)v112;
      double v57 = self;
LABEL_105:
      if (v16 == 44 && v56 && v25)
      {
        if ([v25 containsString:@"flagColor"])
        {
          [(id)initWithUserString_suggestionTokenResult__gSuggestionFlagColorTypes objectForKeyedSubscript:v56];
          id v84 = v83 = v46;
          uint64_t v16 = (int)[v84 intValue];

          uint64_t v46 = v83;
        }
        else
        {
          uint64_t v16 = 44;
        }
      }
      unint64_t v85 = v16;
      int v55 = 0;
      if (!v113 || !v25 || !v111)
      {
LABEL_117:

LABEL_118:
LABEL_119:

        uint64_t v86 = v110;
        id v18 = v113;
        goto LABEL_120;
      }
      if (v85 <= 0x23 && ((1 << v85) & 0x800104A00) != 0)
      {
        int v55 = 0;
        goto LABEL_117;
      }
      v114.receiver = v57;
      v114.super_class = (Class)_CSSuggestionToken;
      v88 = [(_CSSuggestionToken *)&v114 init];
      BOOL v89 = v88;
      if (!v88)
      {
LABEL_139:
        double v57 = v89;
        int v55 = v57;
        goto LABEL_117;
      }
      [(_CSSuggestionToken *)v88 commonInitWithUserString:v5 displayString:v113 score:&unk_1EDBD6C28];
      objc_storeStrong((id *)&v89->_spotlightQueryString, v25);
      if (v81)
      {
        v127 = v81;
        uint64_t v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:1];
        filterQueries = v89->_filterQueries;
        v89->_filterQueries = (NSArray *)v90;
      }
      uint64_t v92 = v103;
      if (v85)
      {
        uint64_t v101 = v46;
        if ([v110 count])
        {
          if (!v102 || v85 != 16) {
            goto LABEL_138;
          }
          uint64_t v93 = [v110 objectAtIndexedSubscript:0];
          int v94 = [v93 objectForKey:@"EMAILS"];

          if ([v94 count])
          {
            v95 = [[CSItemSummary alloc] initWithName:v113 contactIdentifier:0 alternateNames:0 phoneNumbers:0 emailAddresses:v94 contactScope:0];
            [(_CSSuggestionToken *)v89 setItemSummary:v95];
          }
        }
        else
        {
          int v94 = v110;
          uint64_t v92 = -1;
          id v110 = (id)MEMORY[0x1E4F1CBF0];
        }
        uint64_t v46 = v101;
      }
      else
      {
        int v94 = v110;
        uint64_t v92 = -1;
        id v110 = (id)MEMORY[0x1E4F1CBF0];
      }

      id v7 = v109;
LABEL_138:
      objc_storeStrong((id *)&v89->_nlpCompletionAttributes, obj);
      objc_storeStrong((id *)&v89->_nlpCompletionType, v111);
      v89->_nlpKind = v85;
      objc_storeStrong((id *)&v89->_scopes, v110);
      [(_CSSuggestionToken *)v89 setInternalType:3];
      [(_CSSuggestionToken *)v89 updateScopeSelection:v92];
      goto LABEL_139;
    }
    uint64_t v98 = v16;
    id v107 = v5;
    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    uint64_t v100 = v46;
    id v67 = (id)v46;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v115 objects:v128 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v116;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v116 != v70) {
            objc_enumerationMutation(v67);
          }
          v72 = [NSString stringWithFormat:@"_kMDItemBundleID=\"%@\"", *(void *)(*((void *)&v115 + 1) + 8 * i)];
          [v66 addObject:v72];
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v115 objects:v128 count:16];
      }
      while (v69);
    }

    id v73 = NSString;
    id v74 = [v66 componentsJoinedByString:@" || "];
    uint64_t v75 = [v73 stringWithFormat:@"(%@)", v74];

    if (v31)
    {
      uint64_t v76 = NSString;
      v77 = [(id)v31 componentsJoinedByString:@" || "];
      v78 = [v76 stringWithFormat:@"(%@)", v77];

      BOOL v79 = v75 != 0;
      if (v75)
      {
        id v5 = v107;
        if (v78)
        {
          id v80 = [NSString stringWithFormat:@"(%@ && %@)", v75, v78];
LABEL_104:
          uint64_t v81 = v80;
          id v56 = (void *)v112;
          double v57 = self;

          id v7 = v109;
          uint64_t v16 = v98;
          uint64_t v46 = v100;
          goto LABEL_105;
        }
LABEL_100:
        if (v79) {
          uint64_t v82 = v75;
        }
        else {
          uint64_t v82 = v78;
        }
        id v80 = v82;
        goto LABEL_104;
      }
    }
    else
    {
      v78 = 0;
      BOOL v79 = v75 != 0;
    }
    id v5 = v107;
    goto LABEL_100;
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v18 = v10;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v123 objects:v130 count:16];
  if (!v19) {
    goto LABEL_50;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v124;
  id v105 = v5;
  uint64_t v113 = v18;
  uint64_t v97 = *(void *)v124;
  while (2)
  {
    uint64_t v22 = 0;
    uint64_t v99 = v20;
LABEL_25:
    if (*(void *)v124 != v21) {
      objc_enumerationMutation(v18);
    }
    double v23 = *(void **)(*((void *)&v123 + 1) + 8 * v22);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v55 = 0;
      goto LABEL_133;
    }
    uint64_t v24 = v16;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v25 = v23;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v119 objects:v129 count:16];
    if (!v26) {
      goto LABEL_42;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v120;
    uint64_t v96 = v22;
    while (2)
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v120 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v119 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_69:
          int v55 = 0;
          id v56 = (void *)v112;
          id v110 = v113;
          id v5 = v105;
          double v57 = self;
          id v7 = v109;
          goto LABEL_119;
        }
        uint64_t v31 = [v25 objectForKeyedSubscript:v30];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_38;
        }
        if (v24 != 16)
        {
          int v55 = 0;
          id v56 = (void *)v112;
          id v110 = v113;
          id v5 = v105;
          double v57 = self;
          id v7 = v109;
          goto LABEL_118;
        }
        v32 = [v25 objectForKeyedSubscript:v30];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

LABEL_38:
          continue;
        }
        v33 = [v25 objectForKeyedSubscript:v30];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_69;
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v119 objects:v129 count:16];
      id v7 = v109;
      uint64_t v22 = v96;
      if (v27) {
        continue;
      }
      break;
    }
LABEL_42:

    uint64_t v35 = [v25 objectForKey:@"TOKEN"];

    if (v35)
    {
      double v36 = [v25 objectForKey:@"TEXT"];

      id v5 = v105;
      if (!v36) {
        goto LABEL_131;
      }
      uint64_t v37 = [v25 objectForKey:@"QUERY"];

      if (!v37) {
        goto LABEL_131;
      }
      uint64_t v16 = v24;
      if (v24 == 16)
      {
        uint64_t v38 = [v25 objectForKey:@"TYPE"];
        if (!v38
          || (double v39 = (void *)v38,
              [v25 objectForKey:@"EMAILS"],
              double v40 = objc_claimAutoreleasedReturnValue(),
              v40,
              v39,
              !v40))
        {
LABEL_131:
          int v55 = 0;
          id v18 = v113;
LABEL_133:
          uint64_t v86 = v18;
          goto LABEL_134;
        }
      }
      ++v22;
      uint64_t v21 = v97;
      id v10 = v110;
      id v18 = v113;
      if (v22 == v99)
      {
        uint64_t v20 = [v113 countByEnumeratingWithState:&v123 objects:v130 count:16];
        if (!v20)
        {
LABEL_50:

          goto LABEL_51;
        }
        continue;
      }
      goto LABEL_25;
    }
    break;
  }
  int v55 = 0;
  id v18 = v113;
  uint64_t v86 = v113;
  id v5 = v105;
LABEL_134:
  id v56 = (void *)v112;
  double v57 = self;
LABEL_120:

  return v55;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 suggestionResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    id v11 = 0;
    id v10 = 0;
LABEL_13:
    id v13 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = [v7 objectForKeyedSubscript:@"suggestion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v8 objectForKeyedSubscript:@"suggestion"];
  }
  else
  {
    id v10 = 0;
  }

  id v12 = [v8 objectForKeyedSubscript:@"query"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v11 = 0;
    goto LABEL_13;
  }
  id v11 = [v8 objectForKeyedSubscript:@"query"];

  id v13 = 0;
  if (v10 && v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)_CSSuggestionToken;
    id v14 = [(_CSSuggestionToken *)&v18 init];
    int v15 = v14;
    if (v14)
    {
      [(_CSSuggestionToken *)v14 commonInitWithUserString:v6 displayString:v10 score:&unk_1EDBD6C28];
      objc_storeStrong((id *)&v15->_spotlightQueryString, v11);
      objc_storeStrong((id *)&v15->_nlpCompletionAttributes, a4);
      nlpCompletionType = v15->_nlpCompletionType;
      v15->_nlpCompletionType = (NSString *)@"kQPSuggestion";

      v15->_nlpKind = 0;
      [(_CSSuggestionToken *)v15 setInternalType:11];
    }
    self = v15;
    id v13 = self;
  }
LABEL_14:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  switch(self->_internalType)
  {
    case 1:
      id v7 = [[_CSSuggestionToken alloc] initWithUserString:self->_displayString queryString:self->_spotlightQueryString];
      goto LABEL_12;
    case 2:
      id v5 = [[_CSSuggestionToken alloc] initWithUserString:self->_searchString scopes:self->_scopes selectedIndex:self->_selectedScope displayString:self->_displayString];
      [(_CSSuggestionToken *)v5 setInternalType:v3->_internalType];
      suggestionDisplayText = v3->_suggestionDisplayText;
      v4 = v5;
      goto LABEL_3;
    case 3:
      id v7 = [[_CSSuggestionToken alloc] initWithUserString:self->_searchString suggestionTokenResult:self->_nlpCompletionAttributes];
      goto LABEL_12;
    case 4:
      id v7 = [[_CSSuggestionToken alloc] initWithUserString:self->_searchString itemResult:self->_personItem];
      goto LABEL_12;
    case 6:
      id v8 = [_CSSuggestionToken alloc];
      id v7 = [(_CSSuggestionToken *)v8 initWithUserString:v3->_searchString displayString:v3->_displayString attributeValues:v3->_localCompletionAttributes attributeStrings:v3->_localCompletionAttributesStrings options:MEMORY[0x1E4F1CC08]];
      goto LABEL_12;
    case 7:
    case 8:
    case 9:
    case 0xALL:
      v4 = [[_CSSuggestionToken alloc] initWithUserString:self->_searchString tokenScopes:self->_tokenScopes selectedIndex:self->_selectedScope displayString:self->_displayString internalType:self->_internalType];
      id v5 = v4;
      suggestionDisplayText = v3->_suggestionDisplayText;
LABEL_3:
      [(_CSSuggestionToken *)v4 setSuggestionDisplayText:suggestionDisplayText];
      if (!v5) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 0xBLL:
      id v7 = [[_CSSuggestionToken alloc] initWithUserString:self->_searchString suggestionResult:self->_nlpCompletionAttributes];
      goto LABEL_12;
    case 0xCLL:
      id v13 = [[_CSSuggestionToken alloc] initWithUserString:self->_displayString displayString:self->_displayString queryString:self->_spotlightQueryString];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v24 = v3;
      id obj = v3->_scopes;
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(obj);
            }
            objc_super v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend(v18, "objectForKeyedSubscript:", @"TOKEN", v24);
            uint64_t v20 = [v18 objectForKeyedSubscript:@"TEXT"];
            uint64_t v21 = [v18 objectForKeyedSubscript:@"QUERY"];
            [(_CSSuggestionToken *)v13 addTokenScope:v19 tokenText:v20 queryString:v21];
          }
          uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v15);
      }

      id v5 = v13;
      uint64_t v22 = [(_CSSuggestionToken *)v13 scopes];
      uint64_t v23 = [v22 count];

      id v3 = v24;
      if (!v23) {
        goto LABEL_15;
      }
      goto LABEL_14;
    default:
      id v7 = [[_CSSuggestionToken alloc] initWithUserString:self->_searchString displayString:self->_displayString score:self->_score];
LABEL_12:
      id v5 = v7;
      if (v7)
      {
LABEL_13:
        v3->_selectedScope = [(_CSSuggestionToken *)v5 selectedScope];
        [(_CSSuggestionToken *)v5 updateScopes:v3->_scopes];
        uint64_t v9 = [(_CSSuggestionToken *)v5 scopes];
        uint64_t v10 = [v9 count];

        if (v10) {
LABEL_14:
        }
          -[_CSSuggestionToken updateScopeSelection:](v5, "updateScopeSelection:", v3->_selectedScope, v24);
LABEL_15:
        -[_CSSuggestionToken updateReplacementRange:](v5, "updateReplacementRange:", v3->_replacementRange.location, v3->_replacementRange.length, v24);
      }
LABEL_16:
      id v11 = v5;

      return v11;
  }
}

- (BOOL)nameAndEmailRenderableWithName:(id)a3 emails:(id)a4
{
  return 0;
}

- (void)updateNameAndEmailDisplayState
{
  id v6 = [(_CSSuggestionToken *)self itemSummary];
  id v3 = [v6 name];
  v4 = [(_CSSuggestionToken *)self itemSummary];
  id v5 = [v4 allEmailAddresses];
  self->_shouldDisplayNameAndEmail = [(_CSSuggestionToken *)self nameAndEmailRenderableWithName:v3 emails:v5];
}

- (void)mergeTokenAttributes:(id)a3
{
  id v21 = a3;
  [(_CSSuggestionToken *)self age];
  if (v4 <= 0.0 || ([v21 age], v5 <= 0.0))
  {
    [(_CSSuggestionToken *)self age];
    if (v9 > 0.0) {
      goto LABEL_10;
    }
    [v21 age];
    if (v10 <= 0.0) {
      goto LABEL_10;
    }
    [v21 age];
  }
  else
  {
    [(_CSSuggestionToken *)self age];
    double v7 = v6;
    [v21 age];
    if (v7 < v8) {
      double v8 = v7;
    }
  }
  [(_CSSuggestionToken *)self setAge:v8];
LABEL_10:
  if ([(_CSSuggestionToken *)self hasUsedDate]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = [v21 hasUsedDate];
  }
  [(_CSSuggestionToken *)self setHasUsedDate:v11];
  if ([(_CSSuggestionToken *)self hasRecentActivity]) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = [v21 hasRecentActivity];
  }
  [(_CSSuggestionToken *)self setHasRecentActivity:v12];
  if ([(_CSSuggestionToken *)self isMegadomeToken]
    || [v21 isMegadomeToken])
  {
    [(_CSSuggestionToken *)self megadomeCompositeScore];
    double v14 = v13;
    [v21 megadomeCompositeScore];
    if (v14 >= v15) {
      double v15 = v14;
    }
    [(_CSSuggestionToken *)self setMegadomeCompositeScore:v15];
    unsigned int v16 = 4;
  }
  else
  {
    unsigned int v16 = 0;
  }
  if (!-[_CSSuggestionToken selectedScope](self, "selectedScope") || ![v21 selectedScope])
  {
    unint64_t v17 = 0;
    goto LABEL_28;
  }
  if (-[_CSSuggestionToken selectedScope](self, "selectedScope") == 1 || [v21 selectedScope] == 1)
  {
    unint64_t v17 = 1;
LABEL_28:
    self->_selectedScope = v17;
  }
  if ([(_CSSuggestionToken *)self internalType] == 4
    && [(_CSSuggestionToken *)self bundleType] == 1
    && ![(_CSSuggestionToken *)self isMegadomeToken])
  {
    int v18 = 1;
  }
  else if ([v21 internalType] == 4 && objc_msgSend(v21, "bundleType") == 1)
  {
    int v18 = [v21 isMegadomeToken] ^ 1;
  }
  else
  {
    int v18 = 0;
  }
  if ([(_CSSuggestionToken *)self internalType] == 6
    && [(_CSSuggestionToken *)self tokenKind] == 16)
  {
    if (v18) {
      LODWORD(v19) = v16 | 2;
    }
    else {
      LODWORD(v19) = v16;
    }
LABEL_46:
    uint64_t v19 = v19 | 1;
    goto LABEL_50;
  }
  if ([v21 internalType] == 6)
  {
    uint64_t v20 = [v21 tokenKind];
    if (v18) {
      uint64_t v19 = v16 | 2;
    }
    else {
      uint64_t v19 = v16;
    }
    if (v20 != 16) {
      goto LABEL_50;
    }
    goto LABEL_46;
  }
  if (v18) {
    uint64_t v19 = v16 | 2;
  }
  else {
    uint64_t v19 = v16;
  }
LABEL_50:
  [(_CSSuggestionToken *)self setSuggestionTokenDataSources:v19];
}

- (void)mergeTokenScopesAndSpotlightQueryString:(id)a3
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v122 = v3;
  id v5 = v3[6];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v136 objects:v141 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v137;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v137 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"TOKEN"];

        if (v11)
        {
          uint64_t v12 = [v10 objectForKeyedSubscript:@"TOKEN"];
          [v4 setObject:v10 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v136 objects:v141 count:16];
    }
    while (v7);
  }

  id v131 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  double v13 = self->_scopes;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v132 objects:v140 count:16];
  id v130 = v4;
  if (!v14)
  {
    uint64_t v30 = v122;
    uint64_t v31 = self;
    goto LABEL_26;
  }
  uint64_t v15 = v14;
  char v124 = 0;
  uint64_t v16 = *(void *)v133;
  id obj = v13;
  do
  {
    uint64_t v17 = 0;
    uint64_t v126 = v15;
    do
    {
      if (*(void *)v133 != v16) {
        objc_enumerationMutation(obj);
      }
      int v18 = *(void **)(*((void *)&v132 + 1) + 8 * v17);
      uint64_t v19 = [v18 objectForKeyedSubscript:@"TOKEN"];

      if (v19)
      {
        uint64_t v20 = [v18 objectForKeyedSubscript:@"TOKEN"];
        id v21 = [v4 objectForKeyedSubscript:v20];
        if (!v21) {
          goto LABEL_18;
        }
        uint64_t v22 = [v18 objectForKeyedSubscript:@"QUERY"];
        uint64_t v23 = [v21 objectForKeyedSubscript:@"QUERY"];
        char v24 = [v22 isEqual:v23];

        id v4 = v130;
        if ((v24 & 1) == 0)
        {
          id v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v18];
          long long v26 = NSString;
          long long v27 = [v18 objectForKeyedSubscript:@"QUERY"];
          long long v28 = [v21 objectForKeyedSubscript:@"QUERY"];
          long long v29 = [v26 stringWithFormat:@"(%@ || %@)", v27, v28];
          uint64_t v15 = v126;
          [v25 setObject:v29 forKeyedSubscript:@"QUERY"];

          id v4 = v130;
          [v131 addObject:v25];

          char v124 = 1;
        }
        else
        {
LABEL_18:
          [v131 addObject:v18];
        }
      }
      ++v17;
    }
    while (v15 != v17);
    uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v132 objects:v140 count:16];
  }
  while (v15);

  uint64_t v30 = v122;
  uint64_t v31 = self;
  if (v124)
  {
    double v13 = (NSArray *)[v131 copy];
    [(_CSSuggestionToken *)self updateScopes:v13];
LABEL_26:
  }
  uint64_t v32 = (uint64_t)v30[10];
  if (v32)
  {
    uint64_t v33 = [NSString stringWithFormat:@"(%@ || %@)", v31->_spotlightQueryString, v32];
    spotlightQueryString = v31->_spotlightQueryString;
    v31->_spotlightQueryString = (NSString *)v33;
  }
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  double v36 = [(_CSSuggestionToken *)v31 itemSummary];
  uint64_t v37 = [v36 emailAddresses];
  [v35 addObjectsFromArray:v37];

  uint64_t v38 = [v30 itemSummary];
  double v39 = [v38 emailAddresses];
  id obja = v35;
  [v35 addObjectsFromArray:v39];

  id v40 = objc_alloc(MEMORY[0x1E4F1CA80]);
  double v41 = [(_CSSuggestionToken *)v31 itemSummary];
  double v42 = [v41 allEmailAddresses];
  double v43 = (void *)[v40 initWithArray:v42];

  uint64_t v44 = [v30 itemSummary];
  double v45 = [v44 allEmailAddresses];
  v127 = v43;
  [v43 addObjectsFromArray:v45];

  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v47 = [(_CSSuggestionToken *)v31 itemSummary];
  id v48 = [v47 alternateNames];
  [v46 addObjectsFromArray:v48];

  uint64_t v49 = [v30 itemSummary];
  uint64_t v50 = [v49 alternateNames];
  [v46 addObjectsFromArray:v50];

  uint64_t v51 = [v30 itemSummary];
  uint64_t v52 = [v51 name];
  if ([v52 length])
  {
    char v53 = [v30 itemSummary];
    char v54 = [v53 name];
    int v55 = [(_CSSuggestionToken *)v31 itemSummary];
    id v56 = [v55 name];
    char v57 = [v54 isEqualToString:v56];

    uint64_t v30 = v122;
    if (v57) {
      goto LABEL_33;
    }
    uint64_t v51 = [v122 itemSummary];
    uint64_t v52 = [v51 name];
    [v46 addObject:v52];
  }

LABEL_33:
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v59 = [(_CSSuggestionToken *)v31 itemSummary];
  int v60 = [v59 phoneNumbers];
  [v58 addObjectsFromArray:v60];

  int v61 = [v30 itemSummary];
  uint64_t v62 = [v61 phoneNumbers];
  [v58 addObjectsFromArray:v62];

  int v63 = [(_CSSuggestionToken *)v31 itemSummary];
  uint64_t v64 = [v63 contactScope];

  if ([v30 selectedScope])
  {
    uint64_t v121 = v64;
  }
  else
  {
    v31->_selectedScope = 0;
    uint64_t v121 = 1;
  }
  uint64_t v65 = [(_CSSuggestionToken *)v31 itemSummary];
  long long v125 = v46;
  if (!v65
    || (id v66 = (void *)v65,
        [v30 itemSummary],
        id v67 = objc_claimAutoreleasedReturnValue(),
        v67,
        v66,
        !v67))
  {
    uint64_t v83 = [v30 itemSummary];

    if (v83)
    {
      id v84 = [v30 itemSummary];
      [(_CSSuggestionToken *)v31 setItemSummary:v84];
LABEL_60:

      goto LABEL_61;
    }
    goto LABEL_61;
  }
  id v68 = v58;
  uint64_t v69 = [(_CSSuggestionToken *)v31 itemSummary];
  uint64_t v70 = [v69 nameComponents];
  if (!v70)
  {

LABEL_46:
    unint64_t v85 = [v30 itemSummary];
    uint64_t v86 = [v85 nameComponents];

    id v58 = v68;
    if (!v86) {
      goto LABEL_61;
    }
    goto LABEL_59;
  }
  v71 = (void *)v70;
  v72 = [v30 itemSummary];
  id v73 = [v72 nameComponents];

  if (!v73) {
    goto LABEL_46;
  }
  id v74 = [v30 itemSummary];
  uint64_t v75 = [v74 nameComponents];
  uint64_t v76 = [v75 givenName];
  if (v76)
  {
    v77 = [v30 itemSummary];
    v78 = [v77 nameComponents];
    uint64_t v79 = [v78 middleName];
    id v80 = v30;
    uint64_t v81 = (void *)v79;
    if (v79)
    {
      int v82 = 1;
    }
    else
    {
      uint64_t v87 = [v80 itemSummary];
      v88 = [v87 nameComponents];
      BOOL v89 = [v88 familyName];
      long long v118 = v74;
      BOOL v90 = v89 != 0;

      int v82 = v90;
      id v74 = v118;
    }

    uint64_t v30 = v122;
  }
  else
  {
    int v82 = 0;
  }
  id v58 = v68;

  id v91 = [(_CSSuggestionToken *)v31 itemSummary];
  uint64_t v92 = [v91 nameComponents];
  uint64_t v93 = [v92 givenName];
  if (v93)
  {
    long long v119 = v91;
    int v94 = [(_CSSuggestionToken *)v31 itemSummary];
    v95 = [v94 nameComponents];
    uint64_t v96 = [v95 middleName];
    if (v96)
    {
      BOOL v97 = 1;
    }
    else
    {
      [(_CSSuggestionToken *)v31 itemSummary];
      uint64_t v98 = v115 = v82;
      uint64_t v99 = [v98 nameComponents];
      uint64_t v100 = [v99 familyName];
      BOOL v97 = v100 != 0;

      id v58 = v68;
      int v82 = v115;
    }

    uint64_t v30 = v122;
    id v91 = v119;
  }
  else
  {
    BOOL v97 = 0;
  }

  id v46 = v125;
  if (!v97 && ((v82 ^ 1) & 1) == 0)
  {
LABEL_59:
    id v84 = [v30 itemSummary];
    uint64_t v101 = [v84 nameComponents];
    uint64_t v102 = [(_CSSuggestionToken *)v31 itemSummary];
    [v102 setNameComponents:v101];

    goto LABEL_60;
  }
LABEL_61:
  long long v117 = v58;
  long long v116 = [CSItemSummary alloc];
  long long v120 = [(_CSSuggestionToken *)v31 itemSummary];
  uint64_t v103 = [v120 name];
  [(_CSSuggestionToken *)v31 itemSummary];
  v105 = uint64_t v104 = v31;
  id v106 = [v105 contactIdentifier];
  id v107 = [v46 allObjects];
  BOOL v108 = [v58 allObjects];
  int v109 = [obja allObjects];
  id v110 = [v127 allObjects];
  id v111 = [(_CSSuggestionToken *)v104 itemSummary];
  uint64_t v112 = [v111 nameComponents];
  uint64_t v113 = (void *)v103;
  objc_super v114 = [(CSItemSummary *)v116 initWithName:v103 contactIdentifier:v106 alternateNames:v107 phoneNumbers:v108 emailAddresses:v109 allEmailAddresses:v110 nameComponents:v112 contactScope:v121];

  [(_CSSuggestionToken *)self setItemSummary:v114];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CSSuggestionToken *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(_CSSuggestionToken *)self isEqualToToken:v4];
  }

  return v5;
}

- (BOOL)isEqualToToken:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_75;
  }
  int64_t v5 = [(_CSSuggestionToken *)self internalType];
  if (v5 != [v4 internalType]) {
    goto LABEL_75;
  }
  int64_t v6 = [(_CSSuggestionToken *)self bundleType];
  if (v6 != [v4 bundleType]) {
    goto LABEL_75;
  }
  uint64_t v7 = [(_CSSuggestionToken *)self replacementRange];
  if (v7 != [v4 replacementRange]) {
    goto LABEL_75;
  }
  [(_CSSuggestionToken *)self replacementRange];
  uint64_t v9 = v8;
  [v4 replacementRange];
  if (v9 != v10) {
    goto LABEL_75;
  }
  uint64_t v11 = [(_CSSuggestionToken *)self score];
  uint64_t v12 = [v4 score];
  int v13 = [v11 isEqualToNumber:v12];

  if (!v13) {
    goto LABEL_75;
  }
  uint64_t v14 = [(_CSSuggestionToken *)self scopes];
  uint64_t v15 = [v4 scopes];
  int v16 = [v14 isEqualToArray:v15];

  if (!v16) {
    goto LABEL_75;
  }
  unint64_t v17 = [(_CSSuggestionToken *)self selectedScope];
  if (v17 != [v4 selectedScope]) {
    goto LABEL_75;
  }
  int v18 = [(_CSSuggestionToken *)self displayText];
  if (!v18)
  {
    id v21 = [v4 displayText];
    if (v21) {
      goto LABEL_78;
    }
  }
  uint64_t v19 = [(_CSSuggestionToken *)self displayText];
  if (v19)
  {
    uint64_t v20 = [v4 displayText];

    if (v18) {
    if (!v20)
    }
      goto LABEL_75;
  }
  else
  {

    if (v18) {
  }
    }
  uint64_t v22 = [(_CSSuggestionToken *)self displayText];
  if (v22)
  {
  }
  else
  {
    uint64_t v23 = [(_CSSuggestionToken *)self displayText];
    char v24 = [v23 string];
    id v25 = [v4 displayText];
    long long v26 = [v25 string];
    int v27 = [v24 isEqualToString:v26];

    if (!v27) {
      goto LABEL_75;
    }
  }
  long long v28 = [(_CSSuggestionToken *)self queryString];
  if (!v28)
  {
    id v21 = [v4 queryString];
    if (v21) {
      goto LABEL_78;
    }
  }
  long long v29 = [(_CSSuggestionToken *)self queryString];
  if (v29)
  {
    uint64_t v30 = [v4 queryString];

    if (v28) {
    if (!v30)
    }
      goto LABEL_75;
  }
  else
  {

    if (v28) {
  }
    }
  uint64_t v31 = [(_CSSuggestionToken *)self queryString];
  if (!v31) {
    goto LABEL_87;
  }
  uint64_t v32 = (void *)v31;
  uint64_t v33 = [(_CSSuggestionToken *)self queryString];
  v34 = [v4 queryString];
  int v35 = [v33 isEqualToString:v34];

  if (v35)
  {
LABEL_87:
    double v36 = [(_CSSuggestionToken *)self personItem];
    if (!v36)
    {
      id v21 = [v4 personItem];
      if (v21) {
        goto LABEL_78;
      }
    }
    uint64_t v37 = [(_CSSuggestionToken *)self personItem];
    if (v37)
    {
      uint64_t v38 = [v4 personItem];

      if (v36) {
      if (!v38)
      }
        goto LABEL_75;
    }
    else
    {

      if (v36) {
    }
      }
    uint64_t v39 = [(_CSSuggestionToken *)self personItem];
    if (!v39) {
      goto LABEL_46;
    }
    id v40 = (void *)v39;
    double v41 = [(_CSSuggestionToken *)self personItem];
    double v42 = [v4 personItem];
    int v43 = [v41 isEqual:v42];

    if (v43)
    {
LABEL_46:
      uint64_t v44 = [(_CSSuggestionToken *)self nlpCompletionAttributes];
      if (!v44)
      {
        id v21 = [v4 nlpCompletionAttributes];
        if (v21) {
          goto LABEL_78;
        }
      }
      double v45 = [(_CSSuggestionToken *)self nlpCompletionAttributes];
      if (v45)
      {
        id v46 = [v4 nlpCompletionAttributes];

        if (v44) {
        if (!v46)
        }
          goto LABEL_75;
      }
      else
      {

        if (v44) {
      }
        }
      uint64_t v47 = [(_CSSuggestionToken *)self nlpCompletionAttributes];
      if (!v47) {
        goto LABEL_58;
      }
      id v48 = (void *)v47;
      uint64_t v49 = [(_CSSuggestionToken *)self nlpCompletionAttributes];
      uint64_t v50 = [v4 nlpCompletionAttributes];
      int v51 = [v49 isEqualToDictionary:v50];

      if (v51)
      {
LABEL_58:
        uint64_t v52 = [(_CSSuggestionToken *)self localCompletionAttributes];
        if (!v52)
        {
          id v21 = [v4 localCompletionAttributes];
          if (v21) {
            goto LABEL_78;
          }
        }
        char v53 = [(_CSSuggestionToken *)self localCompletionAttributes];
        if (v53)
        {
          char v54 = [v4 localCompletionAttributes];

          if (v52) {
          if (!v54)
          }
            goto LABEL_75;
        }
        else
        {

          if (v52) {
        }
          }
        uint64_t v55 = [(_CSSuggestionToken *)self localCompletionAttributes];
        if (!v55) {
          goto LABEL_70;
        }
        id v56 = (void *)v55;
        char v57 = [(_CSSuggestionToken *)self localCompletionAttributes];
        id v58 = [v4 localCompletionAttributes];
        int v59 = [v57 isEqualToArray:v58];

        if (v59)
        {
LABEL_70:
          int v60 = [(_CSSuggestionToken *)self tokenScopes];
          if (!v60)
          {
            id v21 = [v4 tokenScopes];
            if (v21)
            {
LABEL_78:
              char v63 = 0;
LABEL_79:

              goto LABEL_76;
            }
          }
          int v61 = [(_CSSuggestionToken *)self tokenScopes];
          if (v61)
          {
            uint64_t v62 = [v4 tokenScopes];

            if (v60) {
            if (!v62)
            }
              goto LABEL_75;
          }
          else
          {

            if (v60) {
          }
            }
          uint64_t v65 = [(_CSSuggestionToken *)self tokenScopes];
          if (!v65)
          {
            char v63 = 1;
            goto LABEL_76;
          }
          id v66 = (void *)v65;
          id v67 = [(_CSSuggestionToken *)self tokenScopes];
          id v68 = [v4 tokenScopes];
          char v63 = [v67 isEqualToArray:v68];

          id v21 = v66;
          goto LABEL_79;
        }
      }
    }
  }
LABEL_75:
  char v63 = 0;
LABEL_76:

  return v63;
}

- (BOOL)isValid
{
  v2 = self;
  if (self)
  {
    if ([(_CSSuggestionToken *)self tokenKind]
      && ([(_CSSuggestionToken *)v2 scopes],
          id v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v3 count],
          v3,
          !v4))
    {
      LOBYTE(v2) = 0;
    }
    else
    {
      int64_t v5 = [(_CSSuggestionToken *)v2 displayText];
      int64_t v6 = v5;
      if (v5 && [v5 length])
      {
        uint64_t v7 = [(_CSSuggestionToken *)v2 queryString];
        uint64_t v8 = v7;
        if (v7) {
          LOBYTE(v2) = [v7 length] != 0;
        }
        else {
          LOBYTE(v2) = 0;
        }
      }
      else
      {
        LOBYTE(v2) = 0;
      }
    }
  }
  return (char)v2;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(_CSSuggestionToken *)self displayText];

  if (v4)
  {
    int64_t v5 = [(_CSSuggestionToken *)self displayText];
    int64_t v6 = [v5 string];
    [v3 addObject:v6];
  }
  uint64_t v7 = [(_CSSuggestionToken *)self queryString];

  if (v7)
  {
    uint64_t v8 = [(_CSSuggestionToken *)self queryString];
    [v3 addObject:v8];
  }
  uint64_t v9 = [(_CSSuggestionToken *)self tokenScopes];
  [v3 addObjectsFromArray:v9];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%ld:%ld:%ld", -[_CSSuggestionToken selectedScope](self, "selectedScope"), -[_CSSuggestionToken tokenKind](self, "tokenKind"), -[_CSSuggestionToken internalType](self, "internalType"));
  [v3 addObject:v10];

  uint64_t v11 = [v3 componentsJoinedByString:&stru_1EDBB3A50];
  unint64_t v12 = [v11 hash];

  return v12;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p %lu>", objc_opt_class(), self, -[_CSSuggestionToken internalType](self, "internalType")];

  return v2;
}

- (int64_t)compareByRank:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CSSuggestionToken *)self internalType] == 4
    || [(_CSSuggestionToken *)self localCompletionType] == 10
    || [(_CSSuggestionToken *)self localCompletionType] == 7;
  BOOL v6 = [v4 internalType] == 4
    || [v4 localCompletionType] == 10
    || [v4 localCompletionType] == 7;
  int v7 = v5 && v6;
  int64_t v8 = [(_CSSuggestionToken *)self internalType];
  int64_t v9 = v8;
  if (v7 == 1)
  {
    if (v8 != 6 || [v4 internalType] != 6)
    {
      if (!_os_feature_enabled_impl()
        || [(_CSSuggestionToken *)self localCompletionType] == 7
        && [(_CSSuggestionToken *)self localCompletionType] == 7)
      {
LABEL_34:
        int64_t v15 = [(_CSSuggestionToken *)self internalType];
        uint64_t v16 = [v4 internalType];
LABEL_35:
        BOOL v13 = v15 < v16;
LABEL_36:
        if (v13) {
          int64_t v14 = -1;
        }
        else {
          int64_t v14 = 1;
        }
        goto LABEL_39;
      }
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  uint64_t v10 = [v4 internalType];
  uint64_t v11 = [(_CSSuggestionToken *)self internalType];
  if (v9 != v10)
  {
    BOOL v13 = v11 < [v4 internalType];
    goto LABEL_36;
  }
  if (v11 == 6 && [v4 internalType] == 6)
  {
LABEL_19:
    int64_t v12 = [(_CSSuggestionToken *)self localCompare:v4];
LABEL_29:
    int64_t v14 = v12;
    goto LABEL_39;
  }
  if (([(_CSSuggestionToken *)self internalType] == 3
     || [(_CSSuggestionToken *)self internalType] == 11)
    && ([v4 internalType] == 3 || objc_msgSend(v4, "internalType") == 11))
  {
    int64_t v12 = [(_CSSuggestionToken *)self nlpCompare:v4];
    goto LABEL_29;
  }
  if (-[_CSSuggestionToken internalType](self, "internalType") == 4 && [v4 internalType] == 4)
  {
LABEL_28:
    int64_t v12 = [(_CSSuggestionToken *)self peopleCompare:v4];
    goto LABEL_29;
  }
  if ([(_CSSuggestionToken *)self internalType] == 7
    || [(_CSSuggestionToken *)self internalType] == 8
    || [(_CSSuggestionToken *)self internalType] == 9
    || [(_CSSuggestionToken *)self internalType] == 10)
  {
    goto LABEL_34;
  }
  int64_t v18 = [(_CSSuggestionToken *)self tokenKind];
  if (v18 != [v4 tokenKind])
  {
    int64_t v15 = [(_CSSuggestionToken *)self tokenKind];
    uint64_t v16 = [v4 tokenKind];
    goto LABEL_35;
  }
  if ([(_CSSuggestionToken *)self isEqualToToken:v4])
  {
    int64_t v14 = 0;
  }
  else
  {
    uint64_t v19 = [(_CSSuggestionToken *)self score];
    [v19 doubleValue];
    double v21 = v20;
    uint64_t v22 = [v4 score];
    [v22 doubleValue];
    if (v21 <= v23) {
      int64_t v14 = 1;
    }
    else {
      int64_t v14 = -1;
    }
  }
LABEL_39:

  return v14;
}

- (NSAttributedString)displayText
{
  uint64_t v3 = [(_CSSuggestionToken *)self displayString];
  id v4 = (void *)v3;
  BOOL v5 = &stru_1EDBB3A50;
  if (v3) {
    BOOL v5 = (__CFString *)v3;
  }
  BOOL v6 = v5;

  int v7 = [(_CSSuggestionToken *)self searchString];
  if ([(__CFString *)v6 length])
  {
    unint64_t internalType = self->_internalType;
    if (internalType <= 0xA)
    {
      if (((1 << internalType) & 0x78C) == 0)
      {
        if (internalType != 6
          || ([(_CSSuggestionToken *)self localCompletionType] & 0xFFFFFFFFFFFFFFFELL) != 2)
        {
          goto LABEL_11;
        }
        unint64_t v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        id v10 = [(__CFString *)v6 stringByTrimmingCharactersInSet:v17];

        int64_t v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        uint64_t v19 = [(__CFString *)v7 stringByTrimmingCharactersInSet:v18];

        uint64_t v11 = [NSString stringWithFormat:@"%@ %@", v19, v10];

        BOOL v6 = (__CFString *)v19;
        goto LABEL_9;
      }
      if ([(_CSSuggestionToken *)self tokenKind])
      {
        int64_t v9 = [(_CSSuggestionToken *)self tokenDisplayString];
        id v10 = v9;
        if (!v9)
        {
LABEL_10:

          goto LABEL_11;
        }
        id v10 = v9;
        uint64_t v11 = (uint64_t)v10;
LABEL_9:

        BOOL v6 = (__CFString *)v11;
        goto LABEL_10;
      }
    }
LABEL_11:
    id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
    BOOL v13 = v6;
LABEL_14:
    id v14 = (id)[v12 initWithString:v13];
    goto LABEL_15;
  }
  if ([(__CFString *)v7 length])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
    BOOL v13 = v7;
    goto LABEL_14;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E48]);
LABEL_15:
  int64_t v15 = v14;

  return (NSAttributedString *)v15;
}

- (_NSRange)replacementRange
{
  NSUInteger length = self->_replacementRange.length;
  if (self->_replacementRange.location == -1) {
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    NSUInteger location = self->_replacementRange.location;
  }
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSArray)scopes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_scopes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "objectForKeyedSubscript:", @"TOKEN", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)selectedScope
{
  if ([(_CSSuggestionToken *)self tokenKind]) {
    return self->_selectedScope;
  }
  else {
    return -1;
  }
}

- (void)updateReplacementRange:(_NSRange)a3
{
  self->_replacementRange = a3;
}

- (void)updateScopes:(id)a3
{
}

- (BOOL)isMessageWithAttachmentsToken
{
  if ([(_CSSuggestionToken *)self internalType] == 2)
  {
    id v3 = [(_CSSuggestionToken *)self tokenScopes];
    id v4 = [v3 firstObject];

    BOOL v5 = [v4 scopeType] == 6;
  }
  else
  {
    id v4 = [(_CSSuggestionToken *)self nlpCompletionType];
    if ([v4 isEqualToString:@"kQPTokenAttachmentAny"])
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
    BOOL v5 = [(_CSSuggestionToken *)self internalType] == 9;
  }
  BOOL v6 = v5;
LABEL_9:

  return v6;
}

- (void)updateItemSummary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = [*a2 count];
  int v6 = 134218240;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_18D0E3000, a3, OS_LOG_TYPE_ERROR, "CSUserQuery: Selected scope %ld is out of bounds to scopes array of size %ld", (uint8_t *)&v6, 0x16u);
}

- (void)updateScopeSelection:(unint64_t)a3
{
  self->_selectedScope = a3;
  [(_CSSuggestionToken *)self updateItemSummary];
}

- (void)updateSearchString:(id)a3
{
  self->_searchString = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)tokenText
{
  unint64_t v3 = [(_CSSuggestionToken *)self selectedScope];
  if ([(NSArray *)self->_scopes count] && v3 < [(NSArray *)self->_scopes count])
  {
    uint64_t v4 = [(NSArray *)self->_scopes objectAtIndex:v3];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"TOKEN"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)tokenDisplayString
{
  unint64_t v3 = [(_CSSuggestionToken *)self selectedScope];
  if ([(NSArray *)self->_scopes count] && v3 < [(NSArray *)self->_scopes count])
  {
    uint64_t v4 = [(NSArray *)self->_scopes objectAtIndex:v3];
    if ([(_CSSuggestionToken *)self isMessageWithAttachmentsToken]) {
      CSGetLocalizedString(@"ATTACHMENT_TITLE");
    }
    else {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"TEXT"];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)tokenQueryString
{
  unint64_t v3 = [(_CSSuggestionToken *)self selectedScope];
  if ([(NSArray *)self->_scopes count] && v3 < [(NSArray *)self->_scopes count])
  {
    uint64_t v4 = [(NSArray *)self->_scopes objectAtIndex:v3];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"QUERY"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)searchString
{
  return self->_searchString;
}

- (id)displayString
{
  return self->_displayString;
}

- (id)queryString
{
  unint64_t v3 = [(_CSSuggestionToken *)self displayString];
  uint64_t v4 = [(_CSSuggestionToken *)self searchString];
  uint64_t v5 = [(_CSSuggestionToken *)self spotlightQueryString];
  int v6 = [(_CSSuggestionToken *)self filterQueries];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  __int16 v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v9 = [v4 stringByTrimmingCharactersInSet:v8];

  uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  long long v11 = [v3 stringByTrimmingCharactersInSet:v10];

  switch(self->_internalType)
  {
    case 0:
      goto LABEL_9;
    case 1:
      if (v5) {
        goto LABEL_8;
      }
      [NSString stringWithFormat:@"(**=\"%@\"cwdt)", v11, v21];
      break;
    case 3:
    case 7:
    case 8:
    case 9:
    case 0xALL:
      if ([(_CSSuggestionToken *)self tokenKind])
      {
        uint64_t v12 = [(_CSSuggestionToken *)self tokenQueryString];
        long long v13 = (void *)v12;
        if (v12) {
          long long v14 = (void *)v12;
        }
        else {
          long long v14 = v5;
        }
        id v15 = v14;

        uint64_t v5 = v15;
      }
      goto LABEL_7;
    case 6:
      switch([(_CSSuggestionToken *)self localCompletionType])
      {
        case 2:
        case 3:
          [NSString stringWithFormat:@"(**=\"%@\"cwd && **=\"%@\"cwd)", v11, v9];
          goto LABEL_25;
        case 7:
        case 10:
          goto LABEL_7;
        case 9:
          [NSString stringWithFormat:@"(**=\"%@\"cwdt)", v11, v21];
          goto LABEL_25;
        default:
          if ([v5 length]) {
            goto LABEL_7;
          }
          [NSString stringWithFormat:@"(**=\"%@\"cwd || _kMDItemLaunchString=\"%@*\"cwdt)", v11, v11];
          uint64_t v20 = LABEL_25:;

          uint64_t v5 = (void *)v20;
          break;
      }
      goto LABEL_7;
    default:
      if (v5) {
        goto LABEL_8;
      }
      [NSString stringWithFormat:@"(**=\"%@\"cwd || _kMDItemLaunchString=\"%@*\"cwdt)", v11, v11];
      break;
  uint64_t v5 = };
LABEL_7:
  if (v5)
  {
LABEL_8:
    [v7 addObject:v5];
LABEL_9:
  }
  if (v6) {
    [v7 addObjectsFromArray:v6];
  }
  uint64_t v16 = NSString;
  unint64_t v17 = [v7 componentsJoinedByString:@" && "];
  int64_t v18 = [v16 stringWithFormat:@"%@", v17];

  return v18;
}

- (id)spotlightQueryString
{
  return self->_spotlightQueryString;
}

- (void)setScore:(id)a3
{
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setMegadomeCompositeScore:(double)a3
{
  self->_megadomeCompositeScore = a3;
}

- (double)megadomeCompositeScore
{
  return self->_megadomeCompositeScore;
}

- (void)setIsMegadomeToken:(BOOL)a3
{
  self->_isMegadomeToken = a3;
}

- (BOOL)isMegadomeToken
{
  return self->_isMegadomeToken;
}

- (void)setInternalType:(int64_t)a3
{
  self->_unint64_t internalType = a3;
}

- (int64_t)internalType
{
  return self->_internalType;
}

- (void)setBundleType:(int64_t)a3
{
  self->_bundleType = a3;
}

- (int64_t)bundleType
{
  return self->_bundleType;
}

- (id)suggestionDisplayText
{
  return self->_suggestionDisplayText;
}

- (void)setSuggestionDisplayText:(id)a3
{
}

- (int64_t)tokenKind
{
  int64_t result = 0;
  switch(self->_internalType)
  {
    case 2:
    case 7:
      int64_t result = 14;
      break;
    case 3:
    case 0xBLL:
      int64_t result = self->_nlpKind;
      break;
    case 4:
      int64_t result = 16;
      break;
    case 6:
      int64_t v4 = [(_CSSuggestionToken *)self localCompletionType];
      if ((unint64_t)(v4 - 6) >= 0xF) {
        int64_t result = 0;
      }
      else {
        int64_t result = qword_18D1B9ED0[v4 - 6];
      }
      break;
    case 8:
    case 9:
      int64_t result = 2;
      break;
    case 0xALL:
      int64_t result = 46;
      break;
    case 0xCLL:
      if ([(NSArray *)self->_scopes count]) {
        int64_t result = 47;
      }
      else {
        int64_t result = 0;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (NSDictionary)features
{
  features = self->_features;
  int64_t v4 = [(_CSSuggestionToken *)self localCompletionFeatures];
  [(NSMutableDictionary *)features addEntriesFromDictionary:v4];

  uint64_t v5 = self->_features;
  int v6 = NSNumber;
  id v7 = [(_CSSuggestionToken *)self score];
  [v7 doubleValue];
  __int16 v8 = objc_msgSend(v6, "numberWithDouble:");
  [(NSMutableDictionary *)v5 setObject:v8 forKey:@"score"];

  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_features copy];

  return (NSDictionary *)v9;
}

- (id)nlpCompletionType
{
  return self->_nlpCompletionType;
}

- (id)nlpCompletionAttributes
{
  return self->_nlpCompletionAttributes;
}

- (id)nlpCompletionCategories
{
  return [(NSDictionary *)self->_nlpCompletionAttributes objectForKeyedSubscript:@"rankCategoriesKey"];
}

- (int64_t)nlpCompare:(id)a3
{
  return 0;
}

- (int64_t)localCompletionType
{
  return self->_localCompletionType;
}

- (id)localCompletionAttributes
{
  return self->_localCompletionAttributes;
}

- (id)localCompletionAttributeStrings
{
  return self->_localCompletionAttributesStrings;
}

- (id)localCompletionFeatures
{
  if ([(NSArray *)self->_localCompletionAttributes count] == 21)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int64_t v4 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 integerValue];

    int v6 = [NSNumber numberWithInteger:v5];
    [v3 setObject:v6 forKey:@"queryLen"];

    id v7 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:1];
    uint64_t v8 = [v7 integerValue];

    uint64_t v9 = [NSNumber numberWithInteger:v8];
    [v3 setObject:v9 forKey:@"queryFragmentCount"];

    uint64_t v10 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:2];
    uint64_t v11 = [v10 longLongValue];

    uint64_t v12 = [NSNumber numberWithLongLong:v11];
    [v3 setObject:v12 forKey:@"queryCompletionCounnt"];

    long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSString length](self->_displayString, "length"));
    [v3 setObject:v13 forKey:@"len"];

    long long v14 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:3];
    uint64_t v15 = [v14 integerValue];

    uint64_t v16 = [NSNumber numberWithInteger:v15];
    [v3 setObject:v16 forKey:@"fragments"];

    unint64_t v17 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:4];
    [v17 doubleValue];
    double v19 = v18;

    uint64_t v20 = [NSNumber numberWithDouble:v19];
    [v3 setObject:v20 forKey:@"age"];

    uint64_t v21 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:5];
    [v21 doubleValue];
    double v23 = v22;

    char v24 = [NSNumber numberWithDouble:v23];
    [v3 setObject:v24 forKey:@"prob"];

    id v25 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:6];
    uint64_t v26 = [v25 longLongValue];

    int v27 = [NSNumber numberWithLongLong:v26];
    [v3 setObject:v27 forKey:@"maxscore"];

    long long v28 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:7];
    uint64_t v29 = (int)[v28 intValue];

    uint64_t v30 = [NSNumber numberWithUnsignedInteger:v29];
    [v3 setObject:v30 forKey:@"weight"];

    uint64_t v31 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:8];
    uint64_t v32 = (int)[v31 intValue];

    uint64_t v33 = [NSNumber numberWithUnsignedInteger:v32];
    [v3 setObject:v33 forKey:@"parentWeight"];

    v34 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:9];
    uint64_t v35 = [v34 integerValue];

    double v36 = [NSNumber numberWithInteger:v35];
    [v3 setObject:v36 forKey:@"rootWeight"];

    uint64_t v37 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:10];
    [v37 doubleValue];
    double v39 = v38;

    id v40 = [NSNumber numberWithDouble:v39];
    [v3 setObject:v40 forKey:@"phraseScore"];

    double v41 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:11];
    [v41 doubleValue];
    double v43 = v42;

    uint64_t v44 = [NSNumber numberWithDouble:v43];
    [v3 setObject:v44 forKey:@"punishment"];

    double v45 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:12];
    [v45 doubleValue];
    double v47 = v46;

    double v48 = 0.0;
    if (v47 != 1.79769313e308) {
      double v48 = v47;
    }
    uint64_t v49 = [NSNumber numberWithDouble:v48];
    [v3 setObject:v49 forKey:@"compositeScore"];

    uint64_t v50 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:14];
    uint64_t v51 = [v50 integerValue];

    uint64_t v52 = [NSNumber numberWithInteger:v51];
    [v3 setObject:v52 forKey:@"completionType"];

    char v53 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:15];
    uint64_t v54 = [v53 integerValue];

    uint64_t v55 = [NSNumber numberWithInteger:v54];
    [v3 setObject:v55 forKey:@"prefixLen"];

    id v56 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:13];
    [v56 floatValue];
    int v58 = v57;

    LODWORD(v59) = v58;
    int v60 = [NSNumber numberWithFloat:v59];
    [v3 setObject:v60 forKey:@"fieldWeight"];

    int v61 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:16];
    uint64_t v62 = [v61 integerValue];

    char v63 = [NSNumber numberWithInteger:v62];
    [v3 setObject:v63 forKey:@"isSingleThread"];

    uint64_t v64 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:17];
    uint64_t v65 = [v64 integerValue];

    id v66 = [NSNumber numberWithInteger:v65];
    [v3 setObject:v66 forKey:@"hasUsedDate"];

    id v67 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:18];
    uint64_t v68 = [v67 integerValue];

    uint64_t v69 = [NSNumber numberWithInteger:v68];
    [v3 setObject:v69 forKey:@"isShortcut"];

    uint64_t v70 = [(NSArray *)self->_localCompletionAttributes objectAtIndexedSubscript:19];
    uint64_t v71 = [v70 integerValue];

    v72 = [NSNumber numberWithInteger:v71];
    [v3 setObject:v72 forKey:@"hasMultipleResults"];
  }
  else
  {
    id v3 = (id)MEMORY[0x1E4F1CC08];
  }

  return v3;
}

- (int64_t)localCompare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_CSSuggestionToken *)self localCompletionType];
  unint64_t v6 = [v4 localCompletionType];
  unsigned int v7 = (v5 < 0x10) & (0x8480u >> v5);
  int v9 = v5 < 5 || v5 == 9;
  int v11 = v6 < 5 || v6 == 9;
  unint64_t v12 = v5 - 21;
  BOOL v14 = v6 == 21 || v5 == 22;
  if ((v5 < 0x10) & (0x8480u >> v5)) != 0 || v5 < 0xE && ((0x3A1Fu >> v5))
  {
    int v15 = 1;
    if (((v6 < 0x10) & (0x8480u >> v6)) != 0)
    {
LABEL_30:
      int v16 = 1;
      goto LABEL_31;
    }
  }
  else
  {
    int v15 = v12 < 3;
    if (((v6 < 0x10) & (0x8480u >> v6)) != 0) {
      goto LABEL_30;
    }
  }
  if (v6 < 0xE && ((0x3A1Fu >> v6) & 1) != 0) {
    goto LABEL_30;
  }
  int v16 = v6 == 23 || v14;
LABEL_31:
  if (v15 & v16)
  {
    if (v7) {
      int64_t v17 = -1;
    }
    else {
      int64_t v17 = 1;
    }
    if (v7 == ((v6 < 0x10) & (0x8480u >> v6)))
    {
      if ((v5 < 5 || v5 == 9 || v6 < 5 || v6 == 9) && v9 != v11)
      {
        if (v5 < 0xA && ((0x21Fu >> v5) & 1) != 0)
        {
          int64_t v17 = -1;
          goto LABEL_99;
        }
        if (v6 < 0xA && ((0x21Fu >> v6) & 1) != 0)
        {
          int64_t v17 = 1;
          goto LABEL_99;
        }
      }
      BOOL v18 = v6 == 21;
      int v19 = v12 < 2 || v14;
      if (v12 < 2) {
        int64_t v17 = -1;
      }
      else {
        int64_t v17 = 1;
      }
      if (v12 < 2) {
        BOOL v18 = 1;
      }
      if (v19 != 1 || v12 < 2 == v14 || !v18)
      {
        unint64_t v20 = v6 - 11;
        int64_t v17 = v5 - 11 < 3 ? -1 : 1;
        BOOL v21 = v20 < 3;
        BOOL v22 = v20 < 3 || v5 - 11 < 3;
        if (!v22 || (((v5 - 11 < 3) ^ v21) & 1) == 0)
        {
          int64_t v17 = v5 == 23 ? -1 : 1;
          BOOL v23 = v6 == 23 || v5 == 23;
          if (!v23 || (v5 == 23) == (v6 == 23))
          {
LABEL_74:
            char v24 = [(_CSSuggestionToken *)self localCompletionAttributes];
            id v25 = [v24 objectAtIndexedSubscript:18];
            uint64_t v58 = [v25 integerValue];

            uint64_t v26 = [v24 objectAtIndexedSubscript:17];
            uint64_t v57 = [v26 integerValue];

            int v27 = [v24 objectAtIndexedSubscript:3];
            unsigned int v28 = [v27 intValue];

            uint64_t v29 = [v24 objectAtIndexedSubscript:4];
            [v29 doubleValue];
            double v31 = v30;

            uint64_t v32 = [(_CSSuggestionToken *)self score];
            [v32 doubleValue];
            double v34 = v33;

            uint64_t v35 = [v4 localCompletionAttributes];
            double v36 = [v35 objectAtIndexedSubscript:18];
            uint64_t v37 = [v36 integerValue];

            double v38 = [v35 objectAtIndexedSubscript:17];
            uint64_t v39 = [v38 integerValue];

            id v40 = [v35 objectAtIndexedSubscript:3];
            unsigned int v41 = [v40 intValue];

            double v42 = [v35 objectAtIndexedSubscript:4];
            [v42 doubleValue];
            double v44 = v43;

            double v45 = [v4 score];
            [v45 doubleValue];
            double v47 = v46;

            if (v5 == 23 && v28 != v41)
            {
              if (v28 == 1)
              {
                int64_t v17 = 1;
LABEL_98:

                goto LABEL_99;
              }
              if (v41 == 1)
              {
                int64_t v17 = -1;
                goto LABEL_98;
              }
            }
            if (v34 == v47)
            {
              uint64_t v48 = v58;
              if (v58 == v37 && (uint64_t v48 = v57, v57 == v39))
              {
                if (!v57 || v31 == v44)
                {
                  if (v28 == v41)
                  {
                    uint64_t v50 = [(_CSSuggestionToken *)self displayText];
                    uint64_t v51 = [v50 length];
                    uint64_t v52 = [v4 displayText];
                    uint64_t v53 = [v52 length];

                    if (v51 == v53)
                    {
                      int64_t v17 = 0;
                    }
                    else
                    {
                      uint64_t v54 = [(_CSSuggestionToken *)self displayText];
                      unint64_t v55 = [v54 length];
                      id v56 = [v4 displayText];
                      if (v55 > [v56 length]) {
                        int64_t v17 = -1;
                      }
                      else {
                        int64_t v17 = 1;
                      }
                    }
                  }
                  else if (v28 > v41)
                  {
                    int64_t v17 = -1;
                  }
                  else
                  {
                    int64_t v17 = 1;
                  }
                }
                else if (v31 >= v44)
                {
                  int64_t v17 = 1;
                }
                else
                {
                  int64_t v17 = -1;
                }
              }
              else if (v48)
              {
                int64_t v17 = -1;
              }
              else
              {
                int64_t v17 = 1;
              }
            }
            else if (v34 <= v47)
            {
              int64_t v17 = 1;
            }
            else
            {
              int64_t v17 = -1;
            }
            goto LABEL_98;
          }
        }
      }
    }
  }
  else
  {
    if (v15 == v16) {
      goto LABEL_74;
    }
    if (v15) {
      int64_t v17 = 1;
    }
    else {
      int64_t v17 = -1;
    }
  }
LABEL_99:

  return v17;
}

- (BOOL)shouldDisplayNameAndEmail
{
  return self->_shouldDisplayNameAndEmail;
}

- (int)suggestionTokenDataSources
{
  return self->_suggestionTokenDataSources;
}

- (BOOL)hasRecentActivity
{
  return self->_hasRecentActivity;
}

- (BOOL)hasUsedDate
{
  return self->_hasUsedDate;
}

- (double)age
{
  return self->_age;
}

- (BOOL)isUser
{
  return self->_personIsUser;
}

- (BOOL)isMailingList
{
  return self->_personIsMailingList;
}

- (BOOL)isImportant
{
  return self->_personIsImportant;
}

- (double)lastUsedDate
{
  personIteuint64_t m = self->_personItem;
  if (!personItem) {
    return 0.0;
  }
  id v3 = [(CSSearchableItem *)personItem attributeSet];
  id v4 = [v3 lastUsedDate];

  if (!v4) {
    return 0.0;
  }
  double v5 = MEMORY[0x192F98B80](v4);

  return v5;
}

- (void)setSuggestionTokenDataSources:(int)a3
{
  self->_suggestionTokenDataSources = a3;
}

- (void)setHasRecentActivity:(BOOL)a3
{
  self->_hasRecentActivity = a3;
}

- (void)setHasUsedDate:(BOOL)a3
{
  self->_hasUsedDate = a3;
}

- (void)setAge:(double)a3
{
  self->_age = a3;
}

- (void)setIsMailingList:(BOOL)a3
{
  self->_personIsMailingList = a3;
}

- (id)personItem
{
  return self->_personItem;
}

- (int64_t)peopleCompare:(id)a3
{
  id v4 = a3;
  if (!-[_CSSuggestionToken isMailingList](self, "isMailingList") && ([v4 isMailingList] & 1) != 0) {
    goto LABEL_7;
  }
  if (-[_CSSuggestionToken isMailingList](self, "isMailingList") && ![v4 isMailingList])
  {
LABEL_11:
    int64_t v5 = 1;
    goto LABEL_12;
  }
  if (-[_CSSuggestionToken isUser](self, "isUser") || ([v4 isUser] & 1) == 0)
  {
    if (!-[_CSSuggestionToken isUser](self, "isUser") || [v4 isUser])
    {
      unint64_t v6 = [v4 score];
      unsigned int v7 = [(_CSSuggestionToken *)self score];
      int64_t v5 = [v6 compare:v7];

      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_7:
  int64_t v5 = -1;
LABEL_12:

  return v5;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(_CSSuggestionToken *)self bundleType];
  BOOL v6 = [(_CSSuggestionToken *)self isMailingList];
  BOOL v7 = [(_CSSuggestionToken *)self isImportant];
  uint64_t v8 = [(_CSSuggestionToken *)self score];
  int v9 = (void *)[v3 initWithFormat:@"<%@:%p; %d; %d; %d, %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (void)setSelectedScope:(unint64_t)a3
{
  self->_selectedScope = a3;
}

- (CSItemSummary)itemSummary
{
  return self->_itemSummary;
}

- (void)setItemSummary:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)tokenScopes
{
  return self->_tokenScopes;
}

- (void)setTokenScopes:(id)a3
{
}

- (NSArray)filterQueries
{
  return self->_filterQueries;
}

- (void)setFilterQueries:(id)a3
{
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenScopes, 0);
  objc_storeStrong((id *)&self->_itemSummary, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_localCompletionAttributesStrings, 0);
  objc_storeStrong((id *)&self->_localCompletionAttributes, 0);
  objc_storeStrong((id *)&self->_nlpCompletionAttributes, 0);
  objc_storeStrong((id *)&self->_nlpCompletionType, 0);
  objc_storeStrong((id *)&self->_personItem, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_filterQueries, 0);
  objc_storeStrong((id *)&self->_suggestionDisplayText, 0);
  objc_storeStrong((id *)&self->_spotlightQueryString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_scopes, 0);

  objc_storeStrong((id *)&self->_score, 0);
}

+ (id)suggestionTokenWithUserString:(id)a3 displayText:(id)a4 queryString:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[_CSSuggestionToken alloc] initWithUserString:v9 displayString:v8 queryString:v7];

  return v10;
}

- (void)addTokenScope:(id)a3 tokenText:(id)a4 queryString:(id)a5
{
  v16[4] = *MEMORY[0x1E4F143B8];
  if (self->_internalType == 12)
  {
    scopes = self->_scopes;
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    unint64_t v12 = (NSArray *)[(NSArray *)scopes mutableCopy];
    v15[0] = @"TOKEN";
    v15[1] = @"TEXT";
    v16[0] = v11;
    v16[1] = v10;
    v15[2] = @"QUERY";
    v15[3] = @"TYPE";
    v16[2] = v9;
    v16[3] = &unk_1EDBD6970;
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    [(NSArray *)v12 addObject:v13];

    BOOL v14 = self->_scopes;
    self->_scopes = v12;

    [(_CSSuggestionToken *)self setSelectedScope:0];
  }
}

@end