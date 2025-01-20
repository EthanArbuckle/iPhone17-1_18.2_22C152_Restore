@interface CSSuggestion
+ (BOOL)supportsSecureCoding;
+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 completion:(id)a5 attributes:(id)a6 scores:(id)a7 options:(id)a8;
+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 parseResult:(id)a5;
+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionText:(id)a5 queryString:(id)a6;
+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionToken:(id)a5;
+ (CSSuggestion)suggestionWithUserString:(id)a3;
+ (CSSuggestion)suggestionWithUserString:(id)a3 currentSuggestion:(id)a4;
+ (CSSuggestion)suggestionWithUserString:(id)a3 currentSuggestion:(id)a4 updatedSuggestionTokens:(id)a5;
+ (id)advancedSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4 parseResult:(id)a5;
+ (id)attachmentNameSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4;
+ (id)emptySuggestion;
+ (id)instantAnswerWithUserString:(id)a3 currentSuggestion:(id)a4 itemResult:(id)a5 answerAttributes:(id)a6;
+ (id)messageWithAttachmentsSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4;
+ (id)noreplyTemplates;
+ (id)senderContainsSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4;
+ (id)subjectSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4;
+ (id)suggestionsWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 completionData:(id)a5 options:(id)a6;
+ (id)suggestionsWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionData:(id)a5 options:(id)a6;
+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 highlightedText:(id)a4;
+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 highlightedText:(id)a4 highlightedRange:(_NSRange)a5;
+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 interaction:(int)a4;
+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 mailboxKind:(int64_t)a4;
+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 token:(id)a4 scopeSelection:(unint64_t)a5;
+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 token:(id)a4 tokenText:(id)a5;
+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 userString:(id)a4 tokens:(id)a5;
- (BOOL)enableFragments;
- (BOOL)hasAttachmentsRelatedSearchString;
- (BOOL)hasSuggestionTokenWithType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSuggestion:(id)a3;
- (CSInstantAnswers)instantAnswer;
- (CSSuggestion)initWithCoder:(id)a3;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 currentSuggestionToken:(id)a5;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 currentToken:(id)a5 tokens:(id)a6;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 displayString:(id)a5 attributeValues:(id)a6 attributeStrings:(id)a7 options:(id)a8;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 displayString:(id)a5 score:(id)a6;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 internalType:(int64_t)a5;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 itemResult:(id)a5;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionResult:(id)a5;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionText:(id)a5 queryString:(id)a6;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionToken:(id)a5;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionTokenResult:(id)a5;
- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 updatedSuggestionTokens:(id)a5;
- (CSSuggestion)initWithUserString:(id)a3 previousSuggestionTokens:(id)a4 displayString:(id)a5 attributeValues:(id)a6 attributeStrings:(id)a7 enableFragements:(BOOL)a8 options:(id)a9;
- (CSSuggestionKind)suggestionKind;
- (NSArray)suggestionDataSources;
- (NSAttributedString)localizedAttributedSuggestion;
- (NSComparisonResult)compare:(CSSuggestion *)other;
- (NSComparisonResult)compareByRank:(CSSuggestion *)other;
- (NSData)features;
- (NSDictionary)rankCategories;
- (NSNumber)score;
- (id)addSuggestionHighlight:(id)a3 withDisplayText:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentSuggestionToken;
- (id)currentToken;
- (id)currentTokens;
- (id)debugDescription;
- (id)description;
- (id)displayString;
- (id)displayTextForPeopleSuggestion:(id)a3;
- (id)personSuggestionByReplacingCurrentTokenEmailAddresses:(id)a3;
- (id)previousSuggestionTokens;
- (id)queryString;
- (id)searchString;
- (id)searchStringByRemovingPrefixForScopeKey:(id)a3;
- (id)suggestionTokens;
- (id)uniqueIdentifier;
- (id)userQueryString;
- (int64_t)numberOfMessageWithAttachmentTokens;
- (int64_t)rank;
- (int64_t)resultCount;
- (int64_t)version;
- (unint64_t)hash;
- (void)commonInitWithUserString:(id)a3 currentSuggestion:(id)a4 currentSuggestionToken:(id)a5 updatedSuggestionTokens:(id)a6;
- (void)commonInitWithUserString:(id)a3 currentSuggestionToken:(id)a4 previousSuggestionTokens:(id)a5 updatedSuggestionTokens:(id)a6 enableFragments:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
- (void)mergeSuggestionAndUpdateLocalizedAttributedString:(id)a3 queryContextScopeIsToPerson:(BOOL)a4;
- (void)setEnableFragments:(BOOL)a3;
- (void)setInstantAnswer:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setResultCount:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
- (void)update;
- (void)updateCurrentSuggestionToken:(id)a3;
- (void)updateDisplayString:(id)a3;
- (void)updateLocalizedAttributedString:(id)a3;
- (void)updateLocalizedAttributedStringForPersonSuggestion;
- (void)updatePreviousSuggestionTokens:(id)a3;
- (void)updateResultCount:(int64_t)a3;
- (void)updateSearchString:(id)a3;
- (void)updateSuggestFragments:(BOOL)a3;
- (void)updateSuggestionTokens:(id)a3;
- (void)updateUpdatedFlag:(BOOL)a3;
- (void)updateUpdatedSuggestionTokens:(id)a3;
- (void)updateUserQueryString:(id)a3;
- (void)updateVersion:(int64_t)a3;
@end

@implementation CSSuggestion

+ (id)emptySuggestion
{
  v2 = [CSSuggestion alloc];
  v3 = [(CSSuggestion *)v2 initWithUserString:0 currentSuggestion:0 updatedSuggestionTokens:MEMORY[0x1E4F1CBF0]];
  [(CSSuggestion *)v3 setEnableFragments:1];

  return v3;
}

+ (CSSuggestion)suggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CSSuggestion alloc] initWithUserString:v6 currentSuggestion:v5];

  return v7;
}

+ (CSSuggestion)suggestionWithUserString:(id)a3 currentSuggestion:(id)a4 updatedSuggestionTokens:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[CSSuggestion alloc] initWithUserString:v9 currentSuggestion:v8 updatedSuggestionTokens:v7];

  return v10;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 userString:(id)a4 tokens:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[CSSuggestion alloc] initWithUserString:v8 currentSuggestion:v9 updatedSuggestionTokens:v7];

  return v10;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 token:(id)a4 scopeSelection:(unint64_t)a5
{
  id v7 = a3;
  if (v7 && a4) {
    [a4 updateScopeSelection:a5];
  }

  return v7;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 token:(id)a4 tokenText:(id)a5
{
  id v7 = a3;
  if (v7 && a4) {
    [a4 updateTokenText:a5];
  }

  return v7;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 highlightedText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(a1, "updatedSuggestionWithCurrentSuggestion:highlightedText:highlightedRange:", v7, v6, 0, objc_msgSend(v6, "length"));

  return v8;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 highlightedText:(id)a4 highlightedRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a3;
  id v9 = objc_msgSend(a4, "substringWithRange:", location, length);
  v10 = [v8 userQueryString];
  v11 = objc_alloc_init(CSTokenScopeParser);
  v12 = [(CSTokenScopeParser *)v11 suggestionTokenForString:v9];
  if (v12)
  {
    v13 = [[CSSuggestion alloc] initWithUserString:v10 currentSuggestion:v8 currentSuggestionToken:v12];
    [(CSSuggestion *)v13 setEnableFragments:1];
  }
  else
  {
    v13 = (CSSuggestion *)v8;
  }

  return v13;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 interaction:(int)a4
{
  id v5 = a3;
  id v6 = [v5 searchString];
  if ((a4 - 10) > 0xFFFFFFFD)
  {
    id v8 = objc_alloc_init(CSTokenScopeParser);
    uint64_t v9 = [(CSTokenScopeParser *)v8 suggestionTokenForString:v6];
    v10 = (void *)v9;
    if (a4 == 9 && !v9)
    {
      v10 = [(CSTokenScopeParser *)v8 messageSuggestionTokenForString:v6];
    }
    if (v10)
    {
      v11 = [CSSuggestion alloc];
      v12 = [v5 userQueryString];
      id v7 = [(CSSuggestion *)v11 initWithUserString:v12 currentSuggestion:v5 currentSuggestionToken:v10];

      [(CSSuggestion *)v7 setEnableFragments:1];
    }
    else
    {
      id v7 = (CSSuggestion *)v5;
    }
  }
  else
  {
    id v7 = (CSSuggestion *)v5;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)noreplyTemplates
{
  if (noreplyTemplates_onceToken != -1) {
    dispatch_once(&noreplyTemplates_onceToken, &__block_literal_global_1125);
  }
  v2 = (void *)noreplyTemplates_noreplyTemplates;

  return v2;
}

void __32__CSSuggestion_noreplyTemplates__block_invoke()
{
  v0 = (void *)noreplyTemplates_noreplyTemplates;
  noreplyTemplates_noreplyTemplates = (uint64_t)&unk_1EDBD6148;
}

- (void)commonInitWithUserString:(id)a3 currentSuggestion:(id)a4 currentSuggestionToken:(id)a5 updatedSuggestionTokens:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 suggestionTokens];
  if (v10) {
    uint64_t v14 = [v10 enableFragments];
  }
  else {
    uint64_t v14 = 0;
  }
  [(CSSuggestion *)self commonInitWithUserString:v15 currentSuggestionToken:v11 previousSuggestionTokens:v13 updatedSuggestionTokens:v12 enableFragments:v14];
}

- (void)commonInitWithUserString:(id)a3 currentSuggestionToken:(id)a4 previousSuggestionTokens:(id)a5 updatedSuggestionTokens:(id)a6 enableFragments:(BOOL)a7
{
  id v12 = (_CSSuggestionToken *)a4;
  v13 = (NSArray *)a5;
  uint64_t v14 = (NSArray *)a6;
  if (a3) {
    id v15 = (__CFString *)a3;
  }
  else {
    id v15 = &stru_1EDBB3A50;
  }
  objc_storeStrong((id *)&self->_searchString, v15);
  id v16 = a3;
  displayString = self->_displayString;
  self->_displayString = 0;

  userQueryString = self->_userQueryString;
  self->_userQueryString = 0;

  previousSuggestionTokens = self->_previousSuggestionTokens;
  self->_previousSuggestionTokens = v13;
  v20 = v13;

  updatedSuggestionTokens = self->_updatedSuggestionTokens;
  self->_updatedSuggestionTokens = v14;
  v22 = v14;

  localizedAttributedString = self->_localizedAttributedString;
  self->_localizedAttributedString = 0;

  suggestionTokens = self->_suggestionTokens;
  self->_suggestionTokens = 0;

  currentSuggestionToken = self->_currentSuggestionToken;
  self->_currentSuggestionToken = v12;

  *(_OWORD *)&self->_rank = xmmword_18D1B9EC0;
  self->_resultCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_enableFragments = a7;
  self->_updated = 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(CSSuggestion *)self update];
  [v4 encodeObject:self->_searchString forKey:@"searchString"];
  [v4 encodeObject:self->_displayString forKey:@"displayString"];
  [v4 encodeObject:self->_userQueryString forKey:@"userQueryString"];
  [v4 encodeObject:self->_previousSuggestionTokens forKey:@"previousSuggestionTokens"];
  [v4 encodeObject:self->_updatedSuggestionTokens forKey:@"updatedSuggestionTokens"];
  [v4 encodeObject:self->_localizedAttributedString forKey:@"localizedAttributedString"];
  [v4 encodeObject:self->_suggestionTokens forKey:@"suggestionTokens"];
  [v4 encodeObject:self->_currentSuggestionToken forKey:@"currentSuggestionToken"];
  [v4 encodeInteger:self->_version forKey:@"version"];
  [v4 encodeInteger:self->_resultCount forKey:@"resultCount"];
  [v4 encodeBool:self->_enableFragments forKey:@"suggestFragments"];
  [v4 encodeBool:self->_updated forKey:@"updated"];
}

- (CSSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CSSuggestion;
  id v5 = [(CSSuggestion *)&v33 init];
  id v6 = v5;
  if (v5)
  {
    [(CSSuggestion *)v5 commonInitWithUserString:0 currentSuggestion:0 currentSuggestionToken:0 updatedSuggestionTokens:0];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    searchString = v6->_searchString;
    v6->_searchString = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayString"];
    displayString = v6->_displayString;
    v6->_displayString = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userQueryString"];
    userQueryString = v6->_userQueryString;
    v6->_userQueryString = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"previousSuggestionTokens"];
    previousSuggestionTokens = v6->_previousSuggestionTokens;
    v6->_previousSuggestionTokens = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"updatedSuggestionTokens"];
    updatedSuggestionTokens = v6->_updatedSuggestionTokens;
    v6->_updatedSuggestionTokens = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAttributedString"];
    localizedAttributedString = v6->_localizedAttributedString;
    v6->_localizedAttributedString = (NSAttributedString *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"suggestionTokens"];
    suggestionTokens = v6->_suggestionTokens;
    v6->_suggestionTokens = (NSArray *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentSuggestionToken"];
    currentSuggestionToken = v6->_currentSuggestionToken;
    v6->_currentSuggestionToken = (_CSSuggestionToken *)v30;

    v6->_version = [v4 decodeIntegerForKey:@"version"];
    v6->_resultCount = [v4 decodeIntegerForKey:@"resultCount"];
    v6->_enableFragments = [v4 decodeBoolForKey:@"suggestFragments"];
    v6->_updated = [v4 decodeBoolForKey:@"updated"];
    v6->_rank = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSSuggestion;
  id v8 = [(CSSuggestion *)&v11 init];
  if (v8)
  {
    uint64_t v9 = [v7 suggestionTokens];
    [(CSSuggestion *)v8 commonInitWithUserString:v6 currentSuggestion:v7 currentSuggestionToken:0 updatedSuggestionTokens:v9];

    v8->_updated = 1;
  }

  return v8;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 currentSuggestionToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSSuggestion;
  objc_super v11 = [(CSSuggestion *)&v14 init];
  if (v11)
  {
    id v12 = [v9 suggestionTokens];
    [(CSSuggestion *)v11 commonInitWithUserString:v8 currentSuggestion:v9 currentSuggestionToken:v10 updatedSuggestionTokens:v12];
  }
  return v11;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 updatedSuggestionTokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSSuggestion;
  objc_super v11 = [(CSSuggestion *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(CSSuggestion *)v11 commonInitWithUserString:v8 currentSuggestion:v9 currentSuggestionToken:0 updatedSuggestionTokens:v10];
    v12->_updated = 1;
  }

  return v12;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 displayString:(id)a5 score:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSSuggestion;
  objc_super v14 = [(CSSuggestion *)&v18 init];
  if (v14)
  {
    id v15 = [[_CSSuggestionToken alloc] initWithUserString:v10 displayString:v12 score:v13];
    uint64_t v16 = [v11 suggestionTokens];
    [(CSSuggestion *)v14 commonInitWithUserString:v10 currentSuggestion:v11 currentSuggestionToken:v15 updatedSuggestionTokens:v16];
  }
  return v14;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 internalType:(int64_t)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = [v9 searchString];
  id v11 = 0;
  switch(a5)
  {
    case 5:
      id v11 = [[_CSSuggestionToken alloc] initWithUserString:v8 displayString:v8];
      goto LABEL_12;
    case 7:
      id v12 = [v9 searchStringByRemovingPrefixForScopeKey:@"SUBJECT_TOKEN"];

      id v13 = +[_CSTokenScope tokenScopesForSubjectContains];
      id v11 = [[_CSSuggestionToken alloc] initWithUserString:v12 tokenScopes:v13 selectedIndex:0 displayString:v12 internalType:7];
      objc_super v14 = localizedDisplayText(@"SUBJECT_CONTAINS_PREFIX", v12);
      [(_CSSuggestionToken *)v11 setSuggestionDisplayText:v14];

      id v10 = v12;
      goto LABEL_12;
    case 8:
      id v15 = +[_CSTokenScope tokenScopesForAttachmentNameContains];
      id v11 = [[_CSSuggestionToken alloc] initWithUserString:v10 tokenScopes:v15 selectedIndex:0 displayString:v10 internalType:8];
      uint64_t v16 = @"ATTACHMENT_NAME_CONTAINS_PREFIX";
      v17 = v10;
      goto LABEL_6;
    case 9:
      id v15 = +[_CSTokenScope tokenScopesForMessageWithAttachments];
      objc_super v18 = [_CSSuggestionToken alloc];
      uint64_t v19 = CSGetLocalizedString(@"TOKEN_TEXT_ANY");
      id v11 = [(_CSSuggestionToken *)v18 initWithUserString:&stru_1EDBB3A50 tokenScopes:v15 selectedIndex:0 displayString:v19 internalType:9];

      uint64_t v16 = @"MESSAGE_WITH_ATTACHMENTS_PREFIX";
      v17 = &stru_1EDBB3A50;
LABEL_6:
      v20 = localizedDisplayText(v16, v17);
      [(_CSSuggestionToken *)v11 setSuggestionDisplayText:v20];

      goto LABEL_11;
    case 10:
      id v15 = +[_CSTokenScope tokenScopesForSenderContains];
      if ([(__CFString *)v8 length]) {
        uint64_t v21 = v8;
      }
      else {
        uint64_t v21 = v10;
      }
      v22 = v21;
      id v11 = [[_CSSuggestionToken alloc] initWithUserString:v22 tokenScopes:v15 selectedIndex:0 displayString:v22 internalType:10];
      uint64_t v23 = localizedDisplayText(@"SENDER_CONTAINS_PREFIX", v22);

      [(_CSSuggestionToken *)v11 setSuggestionDisplayText:v23];
LABEL_11:

LABEL_12:
      if (v11)
      {
        v27.receiver = self;
        v27.super_class = (Class)CSSuggestion;
        v24 = [(CSSuggestion *)&v27 init];
        if (v24)
        {
          v25 = [v9 suggestionTokens];
          [(CSSuggestion *)v24 commonInitWithUserString:v8 currentSuggestion:v9 currentSuggestionToken:v11 updatedSuggestionTokens:v25];
        }
        self = v24;

        id v11 = (_CSSuggestionToken *)self;
      }
      break;
    default:
      break;
  }

  return (CSSuggestion *)v11;
}

- (id)searchStringByRemovingPrefixForScopeKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSuggestion *)self searchString];
  id v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];
  id v8 = [v7 componentsSeparatedByString:@":"];

  if ((unint64_t)[v8 count] >= 2)
  {
    id v9 = CSGetLocalizedString(v4);
    id v10 = [v9 localizedLowercaseString];

    id v11 = [v8 objectAtIndexedSubscript:0];
    id v12 = [v11 localizedLowercaseString];
    int v13 = [v12 isEqualToString:v10];

    if (v13)
    {
      objc_super v14 = objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
      id v15 = [v14 componentsJoinedByString:@":"];
      uint64_t v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v17 = [v15 stringByTrimmingCharactersInSet:v16];

      if ([v17 length])
      {
        id v18 = v17;

        id v5 = v18;
      }
    }
  }

  return v5;
}

- (id)addSuggestionHighlight:(id)a3 withDisplayText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6];
  if ([v5 length] && objc_msgSend(v7, "length"))
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    int v38 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__3;
    v33[4] = __Block_byref_object_dispose__3;
    v34 = &stru_1EDBB3A50;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3010000000;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v30 = "";
    uint64_t v8 = [v7 length];
    uint64_t v31 = 0;
    uint64_t v32 = v8;
    uint64_t v9 = [v5 length];
    uint64_t v10 = *MEMORY[0x1E4F28540];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke;
    v20[3] = &unk_1E5549488;
    id v21 = v5;
    id v11 = v6;
    id v22 = v11;
    v24 = &v27;
    id v12 = v7;
    id v23 = v12;
    v25 = &v35;
    uint64_t v26 = v33;
    objc_msgSend(v21, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v9, v10, 6, 0, v20);
    if (*((_DWORD *)v36 + 6) == 1)
    {
      int v13 = v28;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke_3;
      v15[3] = &unk_1E55494B0;
      id v16 = v11;
      id v18 = v33;
      id v17 = v12;
      uint64_t v19 = &v27;
      objc_msgSend(v16, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", v13[4], v13[5], v10, 6, 0, v15);
    }
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v33, 8);

    _Block_object_dispose(&v35, 8);
  }

  return v7;
}

void __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v3 = [v2 localizedLowercaseString];

  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *MEMORY[0x1E4F28540];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke_2;
  v10[3] = &unk_1E5549460;
  id v11 = v4;
  id v12 = v3;
  id v13 = *(id *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(v5 + 32);
  uint64_t v8 = *(void *)(v5 + 40);
  id v9 = v3;
  objc_msgSend(v11, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", v7, v8, v6, 6, 0, v10);
}

void __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", *(void *)(a1 + 40), 393, a3, a4);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v9;
    uint64_t v12 = v10;
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", @"CSSuggestionHighlightAttribute", *(void *)(a1 + 40), v9, v10);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v11 + v12;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 48) length]
                                                                - *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 32);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 40));
    *a7 = 1;
  }
}

uint64_t __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 393, a3, a4);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = result;
    uint64_t v8 = v6;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", @"CSSuggestionHighlightAttribute", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), result, v6);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v7 + v8;
    uint64_t result = [*(id *)(a1 + 40) length];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result
                                                                - *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 32);
  }
  return result;
}

- (id)displayTextForPeopleSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 displayString];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = &stru_1EDBB3A50;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  if ([v4 shouldDisplayNameAndEmail])
  {
    uint64_t v9 = NSString;
    uint64_t v10 = [v4 itemSummary];
    uint64_t v11 = [v10 emailAddresses];
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];
    uint64_t v13 = [v9 stringWithFormat:@"%@ — %@", v8, v12];

    uint64_t v8 = (__CFString *)v13;
  }
  long long v14 = [v4 searchString];
  uint64_t v15 = [(CSSuggestion *)self addSuggestionHighlight:v14 withDisplayText:v8];

  return v15;
}

- (void)update
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  if (self->_suggestionTokens) {
    return;
  }
  p_suggestionTokens = (id *)&self->_suggestionTokens;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  previousSuggestionTokens = self->_previousSuggestionTokens;
  if (previousSuggestionTokens) {
    id v6 = (id)[(NSArray *)previousSuggestionTokens mutableCopy];
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v7 = v6;
  NSUInteger location = &self->_searchString;
  uint64_t v8 = self->_searchString;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v100 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(NSString *)v8 length]) {
    objc_msgSend(v9, "appendString:", v8, location, p_suggestionTokens);
  }
  v94 = v8;
  v106 = v9;
  if ([(NSArray *)self->_previousSuggestionTokens count])
  {
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    uint64_t v11 = self->_previousSuggestionTokens;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v115 objects:v121 count:16];
    if (!v12) {
      goto LABEL_23;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v116;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v116 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v115 + 1) + 8 * v15);
        if (![v16 tokenKind] || !-[CSSuggestion enableFragments](self, "enableFragments"))
        {
          id v17 = v4;
          goto LABEL_18;
        }
        if ([(NSArray *)self->_updatedSuggestionTokens containsObject:v16])
        {
          id v17 = v3;
LABEL_18:
          [v17 addObject:v16];
          goto LABEL_19;
        }
        [v7 removeObject:v16];
LABEL_19:
        ++v15;
      }
      while (v13 != v15);
      uint64_t v18 = [(NSArray *)v11 countByEnumeratingWithState:&v115 objects:v121 count:16];
      uint64_t v13 = v18;
      if (!v18)
      {
LABEL_23:

        break;
      }
    }
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v19 = self->_updatedSuggestionTokens;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v111 objects:v120 count:16];
  if (!v20) {
    goto LABEL_38;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v112;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v112 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v111 + 1) + 8 * i);
      if ([v24 isValid])
      {
        if (![v24 tokenKind] || !-[CSSuggestion enableFragments](self, "enableFragments"))
        {
          char v27 = [v4 containsObject:v24];
          uint64_t v26 = v4;
          if (v27) {
            continue;
          }
LABEL_35:
          [v26 addObject:v24];
          continue;
        }
        char v25 = [v3 containsObject:v24];
        uint64_t v26 = v3;
        if ((v25 & 1) == 0) {
          goto LABEL_35;
        }
      }
    }
    uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v111 objects:v120 count:16];
  }
  while (v21);
LABEL_38:

  v97 = v3;
  v98 = self;
  id v99 = v10;
  v95 = v7;
  v96 = v4;
  if ([v4 count])
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id obj = v4;
    uint64_t v28 = [obj countByEnumeratingWithState:&v107 objects:v119 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v104 = 0;
      uint64_t v30 = *(void *)v108;
      uint64_t v31 = v106;
      do
      {
        uint64_t v32 = 0;
        uint64_t v102 = v29;
        do
        {
          if (*(void *)v108 != v30) {
            objc_enumerationMutation(obj);
          }
          objc_super v33 = *(void **)(*((void *)&v107 + 1) + 8 * v32);
          v34 = [v33 displayText];
          uint64_t v35 = [v34 string];
          v36 = [v35 localizedLowercaseString];

          uint64_t v37 = objc_msgSend(v31, "rangeOfString:options:range:", v36, 1, 0, objc_msgSend(v31, "length"));
          if (v37 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v39 = v37;
            uint64_t v40 = v38;
            v41 = objc_msgSend(v31, "substringWithRange:", v37, v38);
            [v10 appendString:v41];
            if ([v33 internalType] != 1) {
              [v100 appendString:v41];
            }
            uint64_t v42 = [v41 length];
            objc_msgSend(v31, "replaceCharactersInRange:withString:", v39, v40, &stru_1EDBB3A50);
            if ([v31 length])
            {
              v43 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              uint64_t v44 = objc_msgSend(v106, "rangeOfCharacterFromSet:options:range:", v43, 8, 0, objc_msgSend(v106, "length"));
              uint64_t v46 = v45;

              uint64_t v31 = v106;
              if (v44 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v47 = objc_msgSend(v106, "substringWithRange:", v44, v46);
                v48 = v10;
                v49 = (void *)v47;
                [v48 appendString:v47];
                if ([v33 internalType] != 1) {
                  [v100 appendString:v49];
                }
                v42 += v46;
                uint64_t v31 = v106;
                objc_msgSend(v106, "replaceCharactersInRange:withString:", v44, v46, &stru_1EDBB3A50);

                id v10 = v99;
              }
            }
            objc_msgSend(v33, "updateReplacementRange:", v104, v42);
            [v101 addObject:v33];
            v104 += v42;

            uint64_t v29 = v102;
          }

          ++v32;
        }
        while (v29 != v32);
        uint64_t v29 = [obj countByEnumeratingWithState:&v107 objects:v119 count:16];
      }
      while (v29);
    }
    else
    {
      uint64_t v104 = 0;
      uint64_t v31 = v106;
    }
  }
  else
  {
    uint64_t v104 = 0;
    uint64_t v31 = v106;
  }
  v50 = [(CSSuggestion *)v98 currentSuggestionToken];

  v51 = (__CFString *)v94;
  if (v50)
  {
    v52 = [(CSSuggestion *)v98 currentSuggestionToken];
    [v52 updateSearchString:v31];

    uint64_t v53 = [v31 length];
    v54 = [(CSSuggestion *)v98 currentSuggestionToken];
    uint64_t v55 = [v54 internalType];

    if (v55 == 9)
    {
      v56 = [(CSSuggestion *)v98 currentSuggestionToken];
      [v56 updateSearchString:&stru_1EDBB3A50];
    }
    objc_msgSend(v31, "replaceCharactersInRange:withString:", 0, v53, &stru_1EDBB3A50);
    if ([(CSSuggestion *)v98 enableFragments]
      && ([(CSSuggestion *)v98 currentSuggestionToken],
          v57 = objc_claimAutoreleasedReturnValue(),
          uint64_t v58 = [v57 tokenKind],
          v57,
          v58))
    {
      v59 = [(CSSuggestion *)v98 currentSuggestionToken];
      objc_msgSend(v59, "updateReplacementRange:", 0, 0);

      v60 = [(CSSuggestion *)v98 currentSuggestionToken];
      [v97 addObject:v60];
    }
    else
    {
      v61 = [(CSSuggestion *)v98 currentSuggestionToken];
      objc_msgSend(v61, "updateReplacementRange:", v104, v53);

      v62 = [(CSSuggestion *)v98 currentSuggestionToken];
      v63 = [v62 displayString];
      v60 = [v63 lowercaseString];

      if (v60)
      {
        [v10 appendString:v60];
        [v100 appendString:v60];
      }
      v64 = [(CSSuggestion *)v98 currentSuggestionToken];
      [v101 addObject:v64];
    }
    if (v98->_updated)
    {
      currentSuggestionToken = v98->_currentSuggestionToken;
      v98->_currentSuggestionToken = 0;
    }
  }
  if ([v31 length])
  {
    [v10 appendString:v31];
    [v100 appendString:v31];
  }
  id v66 = v101;
  v67 = v66;
  if ([v97 count])
  {
    v67 = [v97 arrayByAddingObjectsFromArray:v66];
  }
  objc_storeStrong(locationa, v31);
  p_displayString = (__CFString **)&v98->_displayString;
  objc_storeStrong((id *)&v98->_displayString, v100);
  objc_storeStrong((id *)&v98->_userQueryString, v99);
  objc_storeStrong(p_suggestionTokens, v67);
  v98->_updated = 0;
  v69 = v98->_currentSuggestionToken;
  v70 = v69;
  if (!v69) {
    goto LABEL_84;
  }
  if ([(_CSSuggestionToken *)v69 internalType] != 10
    && [(_CSSuggestionToken *)v70 internalType] != 7
    && [(_CSSuggestionToken *)v70 internalType] != 8
    && [(_CSSuggestionToken *)v70 internalType] != 9)
  {
    if ([(CSSuggestion *)v98 enableFragments]
      && [(_CSSuggestionToken *)v70 tokenKind] == 16)
    {
      uint64_t v72 = [(CSSuggestion *)v98 displayTextForPeopleSuggestion:v70];
LABEL_81:
      v73 = (NSAttributedString *)v72;
    }
    else
    {
      if (![(CSSuggestion *)v98 enableFragments]
        || ![(_CSSuggestionToken *)v70 tokenKind])
      {
        v80 = *p_displayString;
        if (!*p_displayString) {
          v80 = &stru_1EDBB3A50;
        }
        v81 = v80;
        uint64_t v82 = [(_CSSuggestionToken *)v70 searchString];
        v83 = (void *)v82;
        if (v82) {
          v84 = (__CFString *)v82;
        }
        else {
          v84 = &stru_1EDBB3A50;
        }
        v74 = v84;

        v85 = [(_CSSuggestionToken *)v70 displayString];
        v86 = [v85 lowercaseString];

        v87 = (void *)[(__CFString *)v81 mutableCopy];
        if ([v86 length]) {
          objc_msgSend(v87, "replaceOccurrencesOfString:withString:options:range:", v86, v74, 13, 0, objc_msgSend(v87, "length"));
        }
        if ([v87 length] && -[__CFString length](v81, "length"))
        {
          v88 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"´ʹʼˈ‘’‛′"];
          v89 = [v87 componentsSeparatedByCharactersInSet:v88];
          v90 = [v89 componentsJoinedByString:@"'"];
          uint64_t v105 = [v90 mutableCopy];

          v87 = (void *)v105;
        }
        v73 = [(CSSuggestion *)v98 addSuggestionHighlight:v87 withDisplayText:v81];

LABEL_83:
        v51 = v74;
        if (!v73) {
          goto LABEL_84;
        }
        goto LABEL_85;
      }
      v77 = [(_CSSuggestionToken *)v70 suggestionDisplayText];
      if ([v77 length])
      {
        v78 = [(_CSSuggestionToken *)v70 suggestionDisplayText];
        v79 = [v78 string];
      }
      else
      {
        v79 = [(_CSSuggestionToken *)v70 displayString];
      }

      v73 = [(CSSuggestion *)v98 addSuggestionHighlight:v94 withDisplayText:v79];
    }
    v74 = (__CFString *)v94;
    goto LABEL_83;
  }
  v71 = [(_CSSuggestionToken *)v70 suggestionDisplayText];

  if (v71)
  {
    uint64_t v72 = [(_CSSuggestionToken *)v70 suggestionDisplayText];
    goto LABEL_81;
  }
LABEL_84:
  v73 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E4F28B18]);
  v74 = v51;
LABEL_85:
  localizedAttributedString = v98->_localizedAttributedString;
  v98->_localizedAttributedString = v73;
  v76 = v73;
}

- (id)copyWithZone:(_NSZone *)a3
{
  [(CSSuggestion *)self update];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 commonInitWithUserString:0 currentSuggestion:0 currentSuggestionToken:0 updatedSuggestionTokens:0];
  [v4 updateSearchString:self->_searchString];
  [v4 updateDisplayString:self->_displayString];
  [v4 updateUserQueryString:self->_userQueryString];
  [v4 updatePreviousSuggestionTokens:self->_previousSuggestionTokens];
  [v4 updateUpdatedSuggestionTokens:self->_updatedSuggestionTokens];
  [v4 updateLocalizedAttributedString:self->_localizedAttributedString];
  [v4 updateSuggestionTokens:self->_suggestionTokens];
  [v4 updateCurrentSuggestionToken:self->_currentSuggestionToken];
  [v4 updateVersion:self->_version];
  [v4 updateResultCount:self->_resultCount];
  [v4 updateSuggestFragments:self->_enableFragments];
  [v4 updateUpdatedFlag:self->_updated];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CSSuggestion *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CSSuggestion *)self isEqualToSuggestion:v4];
  }

  return v5;
}

- (BOOL)isEqualToSuggestion:(id)a3
{
  id v4 = a3;
  CSSuggestionKind v5 = [(CSSuggestion *)self suggestionKind];
  if (v5 != [v4 suggestionKind]) {
    goto LABEL_5;
  }
  int64_t v6 = [(CSSuggestion *)self version];
  if (v6 != [v4 version]) {
    goto LABEL_5;
  }
  int64_t v7 = [(CSSuggestion *)self resultCount];
  if (v7 != [v4 resultCount]) {
    goto LABEL_5;
  }
  int v8 = [(CSSuggestion *)self enableFragments];
  if (v8 != [v4 enableFragments]) {
    goto LABEL_5;
  }
  uint64_t v11 = [(CSSuggestion *)self searchString];
  if (!v11)
  {
    uint64_t v14 = [v4 searchString];
    if (v14) {
      goto LABEL_89;
    }
  }
  uint64_t v12 = [(CSSuggestion *)self searchString];
  if (v12)
  {
    uint64_t v13 = [v4 searchString];

    if (v11) {
    if (!v13)
    }
      goto LABEL_5;
  }
  else
  {

    if (v11) {
  }
    }
  uint64_t v15 = [(CSSuggestion *)self searchString];
  if (v15)
  {
    id v16 = (void *)v15;
    uint64_t v17 = [v4 searchString];
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      uint64_t v19 = [(CSSuggestion *)self searchString];
      uint64_t v20 = [v4 searchString];
      int v21 = [v19 isEqualToString:v20];

      if (!v21) {
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  uint64_t v22 = [(CSSuggestion *)self userQueryString];
  if (!v22)
  {
    uint64_t v14 = [v4 userQueryString];
    if (v14) {
      goto LABEL_89;
    }
  }
  id v23 = [(CSSuggestion *)self userQueryString];
  if (v23)
  {
    v24 = [v4 userQueryString];

    if (v22) {
    if (!v24)
    }
      goto LABEL_5;
  }
  else
  {

    if (v22) {
  }
    }
  uint64_t v25 = [(CSSuggestion *)self userQueryString];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [v4 userQueryString];
    if (v27)
    {
      uint64_t v28 = (void *)v27;
      uint64_t v29 = [(CSSuggestion *)self userQueryString];
      uint64_t v30 = [v4 userQueryString];
      int v31 = [v29 isEqualToString:v30];

      if (!v31) {
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  uint64_t v32 = [(CSSuggestion *)self queryString];
  if (!v32)
  {
    uint64_t v14 = [v4 queryString];
    if (v14) {
      goto LABEL_89;
    }
  }
  objc_super v33 = [(CSSuggestion *)self queryString];
  if (v33)
  {
    v34 = [v4 queryString];

    if (v32) {
    if (!v34)
    }
      goto LABEL_5;
  }
  else
  {

    if (v32) {
  }
    }
  uint64_t v35 = [(CSSuggestion *)self queryString];
  if (v35)
  {
    v36 = (void *)v35;
    uint64_t v37 = [v4 queryString];
    if (v37)
    {
      uint64_t v38 = (void *)v37;
      uint64_t v39 = [(CSSuggestion *)self queryString];
      uint64_t v40 = [v4 queryString];
      int v41 = [v39 isEqualToString:v40];

      if (!v41) {
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  uint64_t v42 = [(CSSuggestion *)self localizedAttributedSuggestion];
  if (!v42)
  {
    uint64_t v14 = [v4 localizedAttributedSuggestion];
    if (v14) {
      goto LABEL_89;
    }
  }
  v43 = [(CSSuggestion *)self localizedAttributedSuggestion];
  if (v43)
  {
    uint64_t v44 = [v4 localizedAttributedSuggestion];

    if (v42) {
    if (!v44)
    }
      goto LABEL_5;
  }
  else
  {

    if (v42) {
  }
    }
  uint64_t v45 = [(CSSuggestion *)self localizedAttributedSuggestion];
  if (v45)
  {
    uint64_t v46 = (void *)v45;
    uint64_t v47 = [v4 localizedAttributedSuggestion];
    if (v47)
    {
      v48 = (void *)v47;
      v49 = [(CSSuggestion *)self localizedAttributedSuggestion];
      v50 = [v4 localizedAttributedSuggestion];
      int v51 = [v49 isEqualToAttributedString:v50];

      if (!v51) {
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  v52 = [(CSSuggestion *)self currentToken];
  if (!v52)
  {
    uint64_t v14 = [v4 currentToken];
    if (v14) {
      goto LABEL_89;
    }
  }
  uint64_t v53 = [(CSSuggestion *)self currentToken];
  if (v53)
  {
    v54 = [v4 currentToken];

    if (v52) {
    if (!v54)
    }
      goto LABEL_5;
  }
  else
  {

    if (v52) {
  }
    }
  uint64_t v55 = [(CSSuggestion *)self currentToken];
  if (!v55)
  {
LABEL_82:
    v62 = [(CSSuggestion *)self suggestionTokens];
    if (v62 || ([v4 suggestionTokens], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v63 = [(CSSuggestion *)self suggestionTokens];
      if (v63)
      {
        v64 = [v4 suggestionTokens];

        if (v62) {
        if (!v64)
        }
          goto LABEL_5;
      }
      else
      {

        if (v62) {
      }
        }
      uint64_t v66 = [(CSSuggestion *)self suggestionTokens];
      if (!v66)
      {
        char v9 = 1;
        goto LABEL_6;
      }
      v65 = (void *)v66;
      uint64_t v67 = [v4 suggestionTokens];
      if (v67)
      {
        v68 = (void *)v67;
        v69 = [(CSSuggestion *)self suggestionTokens];
        v70 = [v4 suggestionTokens];
        char v9 = [v69 isEqualToArray:v70];
      }
      else
      {
        char v9 = 1;
      }
LABEL_90:

      goto LABEL_6;
    }
LABEL_89:
    v65 = (void *)v14;
    char v9 = 0;
    goto LABEL_90;
  }
  v56 = (void *)v55;
  uint64_t v57 = [v4 currentToken];
  if (!v57)
  {

    goto LABEL_82;
  }
  uint64_t v58 = (void *)v57;
  v59 = [(CSSuggestion *)self currentToken];
  v60 = [v4 currentToken];
  int v61 = [v59 isEqualToToken:v60];

  if (v61) {
    goto LABEL_82;
  }
LABEL_5:
  char v9 = 0;
LABEL_6:

  return v9;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (int64_t)rank
{
  return self->_rank;
}

- (unint64_t)hash
{
  v2 = [(CSSuggestion *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)uniqueIdentifier
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  CSSuggestionKind v5 = [(CSSuggestion *)self searchString];
  int64_t v6 = [v4 stringWithFormat:@"%@:%ld", v5, -[CSSuggestion suggestionKind](self, "suggestionKind")];
  [v3 addObject:v6];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(CSSuggestion *)self suggestionTokens];
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = NSString;
        uint64_t v13 = [v11 displayText];
        uint64_t v14 = [v13 string];
        uint64_t v15 = [v14 lowercaseString];
        id v16 = [v12 stringWithFormat:@"%@:%ld", v15, objc_msgSend(v11, "tokenKind")];
        [v3 addObject:v16];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  uint64_t v17 = [v3 componentsJoinedByString:@"-"];

  return v17;
}

- (id)description
{
  id v3 = [(CSSuggestion *)self userQueryString];
  unint64_t v4 = [v3 length];
  CSSuggestionKind v5 = NSString;
  int64_t v6 = [(CSSuggestion *)self userQueryString];
  uint64_t v7 = v6;
  if (v4 < 2)
  {
    uint64_t v12 = [v5 stringWithFormat:@"\"%@\"", v6];
  }
  else
  {
    uint64_t v8 = [v6 substringToIndex:2];
    uint64_t v9 = [(CSSuggestion *)self userQueryString];
    uint64_t v10 = [v9 length];
    uint64_t v11 = [(CSSuggestion *)self userQueryString];
    uint64_t v12 = [v5 stringWithFormat:@"\"%@...\"<%lu chars>, hash=%04lX", v8, v10, (unsigned __int16)objc_msgSend(v11, "hash")];
  }
  id v13 = [NSString alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = [(CSSuggestion *)self localizedAttributedSuggestion];
  id v16 = [(CSSuggestion *)self score];
  uint64_t v17 = (void *)[v13 initWithFormat:@"<%@:%p; %@; %@; %@>", v14, self, v15, v12, v16];

  return v17;
}

- (id)debugDescription
{
  id v3 = [(CSSuggestion *)self userQueryString];
  unint64_t v4 = [v3 length];
  CSSuggestionKind v5 = NSString;
  int64_t v6 = [(CSSuggestion *)self userQueryString];
  uint64_t v7 = v6;
  if (v4 < 2)
  {
    uint64_t v12 = [v5 stringWithFormat:@"\"%@\"", v6];
  }
  else
  {
    uint64_t v8 = [v6 substringToIndex:2];
    uint64_t v9 = [(CSSuggestion *)self userQueryString];
    uint64_t v10 = [v9 length];
    uint64_t v11 = [(CSSuggestion *)self userQueryString];
    uint64_t v12 = [v5 stringWithFormat:@"\"%@...\"<%lu chars>, hash=%04lX", v8, v10, (unsigned __int16)objc_msgSend(v11, "hash")];
  }
  id v13 = [NSString alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = [(CSSuggestion *)self localizedAttributedSuggestion];
  id v16 = [(CSSuggestion *)self score];
  uint64_t v17 = [(CSSuggestion *)self currentToken];
  uint64_t v18 = [v17 debugDescription];
  uint64_t v19 = (void *)[v13 initWithFormat:@"<%@:%p; %@; %@; %@; %@>", v14, self, v15, v12, v16, v18];

  return v19;
}

- (NSAttributedString)localizedAttributedSuggestion
{
  [(CSSuggestion *)self update];
  localizedAttributedString = self->_localizedAttributedString;

  return localizedAttributedString;
}

- (CSSuggestionKind)suggestionKind
{
  v2 = [(CSSuggestion *)self currentSuggestionToken];
  BOOL v3 = v2 != 0;

  return 2 * v3;
}

- (NSComparisonResult)compareByRank:(CSSuggestion *)other
{
  unint64_t v4 = other;
  if ([(CSSuggestion *)self rank] != 0x7FFFFFFFFFFFFFFFLL
    && [(CSSuggestion *)v4 rank] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CSSuggestion rank](self, "rank"));
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[CSSuggestion rank](v4, "rank"));
LABEL_8:
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [v6 compare:v7];
LABEL_9:
    NSComparisonResult v5 = v9;

    goto LABEL_17;
  }
  if ([(CSSuggestion *)self rank] != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  if ([(CSSuggestion *)v4 rank] != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_16;
  }
  if ([(CSSuggestion *)self isEqualToSuggestion:v4])
  {
    NSComparisonResult v5 = NSOrderedSame;
    goto LABEL_17;
  }
  uint64_t v10 = [(CSSuggestion *)self currentToken];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [(CSSuggestion *)v4 currentToken];

    if (v12)
    {
      int64_t v6 = [(CSSuggestion *)self currentSuggestionToken];
      uint64_t v8 = [(CSSuggestion *)v4 currentSuggestionToken];
      uint64_t v9 = [v6 compareByRank:v8];
      goto LABEL_9;
    }
  }
  id v13 = [(CSSuggestion *)self currentToken];

  if (v13)
  {
LABEL_14:
    NSComparisonResult v5 = NSOrderedAscending;
    goto LABEL_17;
  }
  uint64_t v14 = [(CSSuggestion *)v4 currentToken];

  if (v14)
  {
LABEL_16:
    NSComparisonResult v5 = NSOrderedDescending;
    goto LABEL_17;
  }
  CSSuggestionKind v16 = [(CSSuggestion *)self suggestionKind];
  if (v16 == [(CSSuggestion *)v4 suggestionKind])
  {
    int64_t v6 = [(CSSuggestion *)self score];
    uint64_t v7 = [(CSSuggestion *)v4 score];
    goto LABEL_8;
  }
  CSSuggestionKind v17 = [(CSSuggestion *)self suggestionKind];
  if (v17 > [(CSSuggestion *)v4 suggestionKind]) {
    NSComparisonResult v5 = NSOrderedAscending;
  }
  else {
    NSComparisonResult v5 = NSOrderedDescending;
  }
LABEL_17:

  return v5;
}

- (NSComparisonResult)compare:(CSSuggestion *)other
{
  return (unint64_t)[(CSSuggestion *)self isEqualToSuggestion:other];
}

- (id)suggestionTokens
{
  [(CSSuggestion *)self update];
  suggestionTokens = self->_suggestionTokens;

  return suggestionTokens;
}

- (id)currentToken
{
  [(CSSuggestion *)self update];
  currentSuggestionToken = self->_currentSuggestionToken;

  return currentSuggestionToken;
}

- (id)currentTokens
{
  [(CSSuggestion *)self update];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_suggestionTokens, "count"));
  suggestionTokens = self->_suggestionTokens;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__CSSuggestion_currentTokens__block_invoke;
  v8[3] = &unk_1E55494D8;
  id v9 = v3;
  id v5 = v3;
  [(NSArray *)suggestionTokens enumerateObjectsUsingBlock:v8];
  int64_t v6 = (void *)[v5 copy];

  return v6;
}

void __29__CSSuggestion_currentTokens__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 tokenKind]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)userQueryString
{
  [(CSSuggestion *)self update];
  userQueryString = self->_userQueryString;

  return userQueryString;
}

- (NSNumber)score
{
  id v3 = [(CSSuggestion *)self currentSuggestionToken];
  if (v3)
  {
    unint64_t v4 = [(CSSuggestion *)self currentSuggestionToken];
    id v5 = [v4 score];
  }
  else
  {
    id v5 = &unk_1EDBD6C18;
  }

  return (NSNumber *)v5;
}

- (id)queryString
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(CSSuggestion *)self update];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = [(CSSuggestion *)self suggestionTokens];
  if ([v4 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (-[CSSuggestion enableFragments](self, "enableFragments") && [v10 tokenKind])
          {
            uint64_t v11 = [v10 tokenQueryString];
          }
          else
          {
            uint64_t v11 = [v10 queryString];
          }
          uint64_t v12 = (void *)v11;
          if (v11) {
            [v3 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
  }
  id v13 = [(CSSuggestion *)self currentToken];
  if (v13 && ![(NSArray *)self->_suggestionTokens containsObject:v13])
  {
    if (-[CSSuggestion enableFragments](self, "enableFragments") && [v13 tokenKind])
    {
      uint64_t v14 = [v13 tokenQueryString];
    }
    else
    {
      uint64_t v14 = [v13 queryString];
    }
    uint64_t v15 = (void *)v14;
    if (v14) {
      [v3 addObject:v14];
    }
  }
  CSSuggestionKind v16 = [v3 componentsJoinedByString:@" && "];
  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v17 = [NSString stringWithFormat:@"(%@)", v16];

    CSSuggestionKind v16 = (void *)v17;
  }

  return v16;
}

- (id)searchString
{
  [(CSSuggestion *)self update];
  searchString = self->_searchString;

  return searchString;
}

- (void)setEnableFragments:(BOOL)a3
{
  self->_enableFragments = a3;
}

- (BOOL)enableFragments
{
  return self->_enableFragments;
}

- (int64_t)resultCount
{
  return self->_resultCount;
}

- (void)setResultCount:(int64_t)a3
{
  self->_resultCount = a3;
}

- (id)displayString
{
  [(CSSuggestion *)self update];
  displayString = self->_displayString;

  return displayString;
}

- (id)currentSuggestionToken
{
  return self->_currentSuggestionToken;
}

- (id)previousSuggestionTokens
{
  return self->_previousSuggestionTokens;
}

- (void)updateDisplayString:(id)a3
{
}

- (void)updateUserQueryString:(id)a3
{
}

- (void)updateSearchString:(id)a3
{
}

- (void)updatePreviousSuggestionTokens:(id)a3
{
}

- (void)updateUpdatedSuggestionTokens:(id)a3
{
}

- (void)updateLocalizedAttributedString:(id)a3
{
}

- (void)updateSuggestionTokens:(id)a3
{
}

- (void)updateCurrentSuggestionToken:(id)a3
{
}

- (void)updateVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)updateResultCount:(int64_t)a3
{
  self->_resultCount = a3;
}

- (void)updateSuggestFragments:(BOOL)a3
{
  self->_enableFragments = a3;
}

- (void)updateUpdatedFlag:(BOOL)a3
{
  self->_updated = a3;
}

- (NSArray)suggestionDataSources
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = [(CSSuggestion *)self currentToken];
  if ([v4 suggestionTokenDataSources]
    && [v4 suggestionTokenDataSources])
  {
    char v5 = [v4 suggestionTokenDataSources];
    BOOL v6 = [v4 suggestionTokenDataSources] & 1;
    unsigned int v7 = ([v4 suggestionTokenDataSources] >> 2) & 1;
    if ((v5 & 2) != 0) {
      goto LABEL_4;
    }
  }
  else
  {
    if ([v4 internalType] == 4 && objc_msgSend(v4, "bundleType") == 1) {
      int v9 = [v4 isMegadomeToken] ^ 1;
    }
    else {
      int v9 = 0;
    }
    BOOL v6 = [v4 internalType] == 6 && objc_msgSend(v4, "tokenKind") == 16;
    unsigned int v7 = [v4 isMegadomeToken];
    if (v9)
    {
LABEL_4:
      [v3 addObject:&unk_1EDBD6988];
      if (!v6) {
        goto LABEL_5;
      }
      goto LABEL_19;
    }
  }
  if (!v6)
  {
LABEL_5:
    if (!v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  [v3 addObject:&unk_1EDBD66D0];
  if (v7) {
LABEL_6:
  }
    [v3 addObject:&unk_1EDBD69A0];
LABEL_7:

  return (NSArray *)v3;
}

- (BOOL)hasSuggestionTokenWithType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v4 = [(CSSuggestion *)self suggestionTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) internalType] == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (int64_t)numberOfMessageWithAttachmentTokens
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CSSuggestion *)self suggestionTokens];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isMessageWithAttachmentsToken];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasAttachmentsRelatedSearchString
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSGetLocalizedString(@"ATTACHMENT_VARIANTS");
  uint64_t v16 = [v3 stringByFoldingWithOptions:385 locale:0];

  uint64_t v4 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  int64_t v5 = [v16 componentsSeparatedByCharactersInSet:v4];

  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
      long long v11 = [(CSSuggestion *)self searchString];
      long long v12 = [(CSSuggestion *)self searchString];
      uint64_t v13 = [v12 length];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __49__CSSuggestion_hasAttachmentsRelatedSearchString__block_invoke;
      v17[3] = &unk_1E5549500;
      v17[4] = v10;
      v17[5] = &v22;
      objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 1027, v17);

      if (*((unsigned char *)v23 + 24)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v14 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v14;
}

uint64_t __49__CSSuggestion_hasAttachmentsRelatedSearchString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = objc_msgSend(a2, "cs_fuzzyPrefixMatchString:locale:", *(void *)(a1 + 32), 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a7 = 1;
  }
  return result;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instantAnswer, 0);
  objc_storeStrong((id *)&self->_currentSuggestionToken, 0);
  objc_storeStrong((id *)&self->_suggestionTokens, 0);
  objc_storeStrong((id *)&self->_localizedAttributedString, 0);
  objc_storeStrong((id *)&self->_updatedSuggestionTokens, 0);
  objc_storeStrong((id *)&self->_previousSuggestionTokens, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionText:(id)a5 queryString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  BOOL v14 = [[_CSSuggestionToken alloc] initWithUserString:v10 displayString:v13 queryString:v12];

  if (v14)
  {
    v19.receiver = self;
    v19.super_class = (Class)CSSuggestion;
    uint64_t v15 = [(CSSuggestion *)&v19 init];
    if (v15)
    {
      uint64_t v16 = [v11 suggestionTokens];
      [(CSSuggestion *)v15 commonInitWithUserString:v10 currentSuggestion:v11 currentSuggestionToken:v14 updatedSuggestionTokens:v16];
    }
    self = v15;
    uint64_t v17 = self;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSSuggestion;
  id v11 = [(CSSuggestion *)&v14 init];
  if (v11)
  {
    id v12 = [v9 suggestionTokens];
    [(CSSuggestion *)v11 commonInitWithUserString:v8 currentSuggestion:v9 currentSuggestionToken:v10 updatedSuggestionTokens:v12];
  }
  return v11;
}

+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionText:(id)a5 queryString:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[CSSuggestion alloc] initWithUserString:v11 currentSuggestion:v12 suggestionText:v10 queryString:v9];

  return v13;
}

+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[CSSuggestion alloc] initWithUserString:v8 currentSuggestion:v9 suggestionToken:v7];

  return v10;
}

- (NSData)features
{
  uint64_t v3 = [(CSSuggestion *)self currentToken];
  if (v3)
  {
    uint64_t v4 = [(CSSuggestion *)self currentToken];
    int64_t v5 = [v4 features];
  }
  else
  {
    int64_t v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  id v9 = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v9];
  id v7 = v9;

  return (NSData *)v6;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 itemResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[_CSSuggestionToken alloc] initWithUserString:v8 itemResult:v10];

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)CSSuggestion;
    id v12 = [(CSSuggestion *)&v16 init];
    if (v12)
    {
      id v13 = [v9 suggestionTokens];
      [(CSSuggestion *)v12 commonInitWithUserString:v8 currentSuggestion:v9 currentSuggestionToken:v11 updatedSuggestionTokens:v13];
    }
    self = v12;
    objc_super v14 = self;
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

- (void)mergeSuggestionAndUpdateLocalizedAttributedString:(id)a3 queryContextScopeIsToPerson:(BOOL)a4
{
  BOOL v4 = a4;
  id v24 = a3;
  id v6 = [(CSSuggestion *)self currentToken];
  uint64_t v7 = [v6 selectedScope];

  if (_os_feature_enabled_impl())
  {
    uint64_t v8 = [(CSSuggestion *)self currentToken];
    if (!v8)
    {
LABEL_9:
      id v13 = [(CSSuggestion *)self currentToken];
      objc_super v14 = [v24 currentToken];
      [v13 mergeTokenAttributes:v14];

      goto LABEL_10;
    }
    id v9 = (void *)v8;
    id v10 = [(CSSuggestion *)self currentToken];
    if ([v10 isMegadomeToken])
    {
      id v11 = [(CSSuggestion *)self currentToken];
      if ([v11 isMailingList])
      {
        id v12 = [v24 currentToken];
        if (([v12 isMegadomeToken] & 1) == 0)
        {
          long long v20 = [v24 currentToken];
          char v21 = [v20 isMailingList];

          if (v21) {
            goto LABEL_9;
          }
          uint64_t v22 = [(CSSuggestion *)self currentToken];
          [v22 setIsMailingList:0];

          id v9 = [v24 currentToken];
          uint64_t v23 = [v9 selectedScope];
          id v10 = [(CSSuggestion *)self currentToken];
          [v10 setSelectedScope:v23];
          goto LABEL_8;
        }
      }
    }
LABEL_8:

    goto LABEL_9;
  }
LABEL_10:
  uint64_t v15 = [(CSSuggestion *)self currentToken];
  objc_super v16 = [v24 currentToken];
  [v15 mergeTokenScopesAndSpotlightQueryString:v16];

  if (v4)
  {
    uint64_t v17 = [(CSSuggestion *)self currentToken];
    uint64_t v18 = [v17 selectedScope];

    if (!v18 && v7 == 1)
    {
      objc_super v19 = [(CSSuggestion *)self currentToken];
      [v19 setSelectedScope:1];
    }
  }
  [(CSSuggestion *)self updateLocalizedAttributedStringForPersonSuggestion];
}

- (void)updateLocalizedAttributedStringForPersonSuggestion
{
  if ([(CSSuggestion *)self enableFragments])
  {
    uint64_t v3 = [(CSSuggestion *)self currentToken];
    uint64_t v4 = [v3 tokenKind];

    if (v4 == 16)
    {
      int64_t v5 = [(CSSuggestion *)self currentToken];
      id v6 = [(CSSuggestion *)self displayTextForPeopleSuggestion:v5];

      if (v6
        && (localizedAttributedString = self->_localizedAttributedString,
            p_localizedAttributedString = &self->_localizedAttributedString,
            ([v6 isEqualToAttributedString:localizedAttributedString] & 1) == 0))
      {
        objc_storeStrong((id *)p_localizedAttributedString, v6);
      }
      else
      {
        id v9 = logForCSLogCategoryQuery();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          [(CSSuggestion(Person) *)(uint64_t)v6 updateLocalizedAttributedStringForPersonSuggestion];
        }
      }
    }
  }
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionTokenResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[_CSSuggestionToken alloc] initWithUserString:v8 suggestionTokenResult:v10];

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)CSSuggestion;
    id v12 = [(CSSuggestion *)&v16 init];
    if (v12)
    {
      id v13 = [v9 suggestionTokens];
      [(CSSuggestion *)v12 commonInitWithUserString:v8 currentSuggestion:v9 currentSuggestionToken:v11 updatedSuggestionTokens:v13];
    }
    self = v12;
    objc_super v14 = self;
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[_CSSuggestionToken alloc] initWithUserString:v8 suggestionResult:v10];

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)CSSuggestion;
    id v12 = [(CSSuggestion *)&v16 init];
    if (v12)
    {
      id v13 = [v9 suggestionTokens];
      [(CSSuggestion *)v12 commonInitWithUserString:v8 currentSuggestion:v9 currentSuggestionToken:v11 updatedSuggestionTokens:v13];
    }
    self = v12;
    objc_super v14 = self;
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

- (NSDictionary)rankCategories
{
  v2 = [(CSSuggestion *)self currentSuggestionToken];
  uint64_t v3 = [v2 nlpCompletionCategories];

  return (NSDictionary *)v3;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 displayString:(id)a5 attributeValues:(id)a6 attributeStrings:(id)a7 options:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  long long v20 = [v18 suggestionTokens];
  uint64_t v21 = [v18 enableFragments];

  uint64_t v22 = [(CSSuggestion *)self initWithUserString:v19 previousSuggestionTokens:v20 displayString:v17 attributeValues:v16 attributeStrings:v15 enableFragements:v21 options:v14];
  return v22;
}

- (CSSuggestion)initWithUserString:(id)a3 previousSuggestionTokens:(id)a4 displayString:(id)a5 attributeValues:(id)a6 attributeStrings:(id)a7 enableFragements:(BOOL)a8 options:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  uint64_t v21 = [[_CSSuggestionToken alloc] initWithUserString:v15 displayString:v20 attributeValues:v19 attributeStrings:v18 options:v17];

  if (v21)
  {
    v26.receiver = self;
    v26.super_class = (Class)CSSuggestion;
    uint64_t v22 = [(CSSuggestion *)&v26 init];
    uint64_t v23 = v22;
    if (v22) {
      [(CSSuggestion *)v22 commonInitWithUserString:v15 currentSuggestionToken:v21 previousSuggestionTokens:v16 updatedSuggestionTokens:v16 enableFragments:v9];
    }
    self = v23;
    id v24 = self;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)personSuggestionByReplacingCurrentTokenEmailAddresses:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CSSuggestion *)self currentToken];
  id v6 = v5;
  if (v5
    && ([v5 internalType] == 6 || objc_msgSend(v6, "internalType") == 4)
    && [v6 tokenKind] == 16)
  {
    uint64_t v7 = [v6 localCompletionAttributes];
    id v8 = (void *)[v7 mutableCopy];

    if ((unint64_t)[v8 count] >= 0x15)
    {
      id v10 = NSNumber;
      id v11 = [v8 objectAtIndexedSubscript:20];
      id v12 = objc_msgSend(v10, "numberWithUnsignedLongLong:", objc_msgSend(v11, "unsignedLongLongValue") | 2);
      [v8 setObject:v12 atIndexedSubscript:20];

      id v13 = [CSSuggestion alloc];
      id v14 = [v6 searchString];
      previousSuggestionTokens = self->_previousSuggestionTokens;
      id v16 = [v6 displayString];
      BOOL v9 = [(CSSuggestion *)v13 initWithUserString:v14 previousSuggestionTokens:previousSuggestionTokens displayString:v16 attributeValues:v8 attributeStrings:v4 enableFragements:self->_enableFragments options:MEMORY[0x1E4F1CC08]];

      uint64_t v17 = [v6 internalType];
      id v18 = [(CSSuggestion *)v9 currentToken];
      [v18 setInternalType:v17];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (CSSuggestion)suggestionWithUserString:(id)a3
{
  id v3 = a3;
  id v4 = [[CSSuggestion alloc] initWithUserString:v3 currentSuggestion:0 internalType:5];

  return v4;
}

+ (id)subjectSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [v6 userQueryString];
  }
  BOOL v9 = v8;
  id v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v11 = [v9 stringByTrimmingCharactersInSet:v10];
  id v12 = [v11 componentsSeparatedByString:@":"];

  if ((unint64_t)[v12 count] >= 2)
  {
    id v13 = CSGetLocalizedString(@"SUBJECT_TOKEN");
    id v14 = [v12 objectAtIndexedSubscript:0];
    id v15 = [v14 localizedLowercaseString];
    int v16 = [v15 isEqualToString:v13];

    if (v16)
    {
      uint64_t v17 = [v12 objectAtIndexedSubscript:1];
      id v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v19 = [v17 stringByTrimmingCharactersInSet:v18];

      BOOL v9 = (void *)v19;
    }
  }
  id v20 = [[CSSuggestion alloc] initWithUserString:v9 currentSuggestion:v7 internalType:7];

  return v20;
}

+ (id)senderContainsSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [v6 userQueryString];
  }
  BOOL v9 = v8;
  id v10 = [[CSSuggestion alloc] initWithUserString:v8 currentSuggestion:v7 internalType:10];

  return v10;
}

+ (id)attachmentNameSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [v6 userQueryString];
  }
  BOOL v9 = v8;
  id v10 = [[CSSuggestion alloc] initWithUserString:v8 currentSuggestion:v7 internalType:8];

  return v10;
}

+ (id)messageWithAttachmentsSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 numberOfMessageWithAttachmentTokens]
    || ![v6 hasAttachmentsRelatedSearchString])
  {
    id v8 = 0;
  }
  else
  {
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v6 userQueryString];
    }
    id v10 = v7;
    id v8 = [[CSSuggestion alloc] initWithUserString:v7 currentSuggestion:v6 internalType:9];
  }

  return v8;
}

+ (id)advancedSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4 parseResult:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v27 = a4;
  id v8 = a5;
  BOOL v9 = [v8 objectForKeyedSubscript:@"suggestions"];
  if (v9 && [v7 length])
  {
    id v10 = [v8 objectForKeyedSubscript:@"suggestionTokenKind"];
    if (v10)
    {
      id v11 = [v8 objectForKeyedSubscript:@"suggestionTokenKind"];
      uint64_t v25 = (int)[v11 intValue];
    }
    else
    {
      uint64_t v25 = 0;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v9;
    uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v23 = v9;
      id v24 = v8;
      uint64_t v15 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v18 = [v17 objectForKeyedSubscript:@"suggestionTypeKey"];
          if (([v18 isEqualToString:@"kQPTokenMe"] & 1) == 0)
          {
            id v19 = v7;
            id v12 = [[CSSuggestion alloc] initWithUserString:v7 currentSuggestion:v27 suggestionTokenResult:v17];
            id v20 = [(CSSuggestion *)v12 currentToken];
            uint64_t v21 = [v20 tokenKind];

            if (v21 == v25)
            {

              id v7 = v19;
              goto LABEL_19;
            }

            id v7 = v19;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      id v12 = 0;
LABEL_19:
      BOOL v9 = v23;
      id v8 = v24;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 currentToken:(id)a5 tokens:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CSSuggestion;
  uint64_t v14 = [(CSSuggestion *)&v17 init];
  uint64_t v15 = v14;
  if (v14) {
    [(CSSuggestion *)v14 commonInitWithUserString:v10 currentSuggestion:v11 currentSuggestionToken:v12 updatedSuggestionTokens:v13];
  }

  return v15;
}

+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 completion:(id)a5 attributes:(id)a6 scores:(id)a7 options:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [[CSSuggestion alloc] initWithUserString:v17 currentSuggestion:v18 displayString:v16 attributeValues:v14 attributeStrings:v15 options:v13];

  return v19;
}

+ (id)suggestionsWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 completionData:(id)a5 options:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v10
    && (id v12 = v10,
        [v12 bytes],
        [v12 length],
        (uint64_t Trusted = _MDPlistBytesCreateTrusted()) != 0))
  {
    CFTypeRef cf = (CFTypeRef)Trusted;
    id v31 = v10;
    id v14 = (void *)_MDPlistBytesCopyPlistAtIndex();
    id v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
LABEL_5:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
        if ((unint64_t)objc_msgSend(v20, "count", cf) < 0x17) {
          break;
        }
        uint64_t v21 = [v20 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          break;
        }
        uint64_t v23 = [v20 objectAtIndexedSubscript:22];
        objc_opt_class();
        char v24 = objc_opt_isKindOfClass();

        if ((v24 & 1) == 0) {
          break;
        }
        uint64_t v25 = [v20 objectAtIndexedSubscript:0];
        objc_super v26 = [v20 objectAtIndexedSubscript:22];
        id v27 = objc_msgSend(v20, "subarrayWithRange:", 1, objc_msgSend(v20, "count") - 2);
        long long v28 = +[CSSuggestion suggestionWithCurrentSuggestion:v33 userQueryString:v9 completion:v25 attributes:v26 scores:v27 options:v11];
        if (v28) {
          [v32 addObject:v28];
        }

        if (v17 == ++v19)
        {
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v17) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    CFRelease(cf);
    id v10 = v31;
  }
  else
  {
    id v32 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v32;
}

+ (id)suggestionsWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionData:(id)a5 options:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v18 = [CSSuggestion alloc];
          uint64_t v19 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionResult:](v18, "initWithUserString:currentSuggestion:suggestionResult:", v9, v8, v17, (void)v21);
          if (v19) {
            [v11 addObject:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 parseResult:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    id v10 = [[CSSuggestion alloc] initWithUserString:v8 currentSuggestion:v9 suggestionResult:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 mailboxKind:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 suggestionTokens];

    if (v7)
    {
      id v8 = objc_alloc_init(CSTokenScopeParser);
      uint64_t v9 = [(CSTokenScopeParser *)v8 indexForScopeKey:@"FROM_SCOPE_KEY"];
      uint64_t v10 = [(CSTokenScopeParser *)v8 indexForScopeKey:@"TO_SCOPE_KEY"];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = objc_msgSend(v6, "suggestionTokens", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        if (a4) {
          uint64_t v15 = v10;
        }
        else {
          uint64_t v15 = v9;
        }
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v17 tokenKind] == 16
              && ([v17 selectedScope] == v9 || objc_msgSend(v17, "selectedScope") == v10))
            {
              [v17 updateScopeSelection:v15];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
    }
  }

  return v6;
}

+ (id)instantAnswerWithUserString:(id)a3 currentSuggestion:(id)a4 itemResult:(id)a5 answerAttributes:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v11) {
    goto LABEL_11;
  }
  uint64_t v13 = [v11 attributeSet];

  if (!v13) {
    goto LABEL_12;
  }
  uint64_t v14 = [v11 attributeSet];
  uint64_t v15 = [v14 eventType];
  int v16 = [v15 isEqualToString:@"flight"];

  if (v16)
  {
    id v17 = [[CSInstantAnswers alloc] initFlightAnswerWithItem:v11 answerAttributes:v12];
  }
  else
  {
    uint64_t v18 = [v11 attributeSet];
    long long v19 = [v18 eventType];
    int v20 = [v19 isEqualToString:@"hotel"];

    if (v20)
    {
      id v17 = [[CSInstantAnswers alloc] initHotelAnswerWithItem:v11 answerAttributes:v12];
    }
    else
    {
      long long v21 = [v11 attributeSet];
      long long v22 = [v21 eventType];
      int v23 = [v22 isEqualToString:@"restaurant"];

      if (!v23) {
        goto LABEL_11;
      }
      id v17 = [[CSInstantAnswers alloc] initRestaurantAnswerWithItem:v11 answerAttributes:v12];
    }
  }
  uint64_t v24 = v17;
  if (v17)
  {
    uint64_t v13 = [[CSSuggestion alloc] initWithUserString:v9 currentSuggestion:v10];
    [(CSSuggestion *)v13 setInstantAnswer:v24];

    goto LABEL_12;
  }
LABEL_11:
  uint64_t v13 = 0;
LABEL_12:

  return v13;
}

- (void)setInstantAnswer:(id)a3
{
}

- (CSInstantAnswers)instantAnswer
{
  return self->_instantAnswer;
}

@end