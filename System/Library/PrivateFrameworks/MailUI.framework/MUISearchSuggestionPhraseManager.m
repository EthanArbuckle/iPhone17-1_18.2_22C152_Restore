@interface MUISearchSuggestionPhraseManager
+ (MUISearchSuggestionPhraseManager)phraseManagerWithPhrase:(id)a3 updatedSuggestion:(id)a4 filterQuery:(id)a5 inputLanguages:(id)a6 customFlags:(id)a7 feedbackQueryID:(int64_t)a8;
- (BOOL)hasPhraseOrSuggestions;
- (CSSuggestion)updatedSuggestion;
- (EMVIPManager)vipManager;
- (MUISearchSuggestionPhraseManager)initWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 scopeIdentifierForPeopleSuggestions:(id)a7 inputLanguages:(id)a8 implicitSuggestions:(id)a9 filterQuery:(id)a10 excludedMailboxes:(id)a11 customFlags:(id)a12 feedbackQueryID:(int64_t)a13;
- (NSArray)excludedMailboxes;
- (NSArray)implicitSuggestions;
- (NSArray)inputLanguages;
- (NSArray)selectedSuggestions;
- (NSDictionary)customFlags;
- (NSString)filterQuery;
- (NSString)phrase;
- (NSString)scopeIdentifierForPeopleSuggestions;
- (id)spotlightQueryStrings;
- (int64_t)feedbackQueryID;
- (unint64_t)signpostID;
- (unsigned)phraseKind;
@end

@implementation MUISearchSuggestionPhraseManager

+ (MUISearchSuggestionPhraseManager)phraseManagerWithPhrase:(id)a3 updatedSuggestion:(id)a4 filterQuery:(id)a5 inputLanguages:(id)a6 customFlags:(id)a7 feedbackQueryID:(int64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithPhrase:v18 selectedSuggestions:0 vipManager:0 updatedSuggestion:v17 scopeIdentifierForPeopleSuggestions:0 inputLanguages:v15 implicitSuggestions:0 filterQuery:v16 excludedMailboxes:0 customFlags:v14 feedbackQueryID:a8];

  return (MUISearchSuggestionPhraseManager *)v19;
}

- (MUISearchSuggestionPhraseManager)initWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 scopeIdentifierForPeopleSuggestions:(id)a7 inputLanguages:(id)a8 implicitSuggestions:(id)a9 filterQuery:(id)a10 excludedMailboxes:(id)a11 customFlags:(id)a12 feedbackQueryID:(int64_t)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v50 = v19;
  id v49 = a5;
  id obj = a6;
  id v48 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  v51.receiver = self;
  v51.super_class = (Class)MUISearchSuggestionPhraseManager;
  v27 = [(MUISearchSuggestionPhraseManager *)&v51 init];
  if (v27)
  {
    uint64_t v28 = [v18 copy];
    phrase = v27->_phrase;
    v27->_phrase = (NSString *)v28;

    uint64_t v30 = [v50 copy];
    selectedSuggestions = v27->_selectedSuggestions;
    v27->_selectedSuggestions = (NSArray *)v30;

    objc_storeStrong((id *)&v27->_vipManager, v20);
    objc_storeStrong((id *)&v27->_updatedSuggestion, obj);
    uint64_t v32 = [v21 copy];
    scopeIdentifierForPeopleSuggestions = v27->_scopeIdentifierForPeopleSuggestions;
    v27->_scopeIdentifierForPeopleSuggestions = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    inputLanguages = v27->_inputLanguages;
    v27->_inputLanguages = (NSArray *)v34;

    uint64_t v36 = [v23 copy];
    v37 = (void *)v36;
    v38 = (void *)MEMORY[0x1E4F1CBF0];
    if (v36) {
      v39 = (void *)v36;
    }
    else {
      v39 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v27->_implicitSuggestions, v39);

    uint64_t v40 = [v24 copy];
    filterQuery = v27->_filterQuery;
    v27->_filterQuery = (NSString *)v40;

    uint64_t v42 = [v25 copy];
    v43 = (void *)v42;
    if (v42) {
      v44 = (void *)v42;
    }
    else {
      v44 = v38;
    }
    objc_storeStrong((id *)&v27->_excludedMailboxes, v44);

    v27->_signpostID = atomic_fetch_add(makeSignpostID_nextSignpostID, 1u) | 0xE508EB2E00000000;
    objc_storeStrong((id *)&v27->_customFlags, a12);
    v27->_feedbackQueryID = a13;
  }

  return v27;
}

- (BOOL)hasPhraseOrSuggestions
{
  v3 = [(MUISearchSuggestionPhraseManager *)self phrase];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MUISearchSuggestionPhraseManager *)self updatedSuggestion];
    v6 = [v5 suggestionTokens];
    BOOL v4 = [v6 count] != 0;
  }
  return v4;
}

- (unsigned)phraseKind
{
  return ![(MUISearchSuggestionPhraseManager *)self hasPhraseOrSuggestions];
}

- (id)spotlightQueryStrings
{
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSArray)selectedSuggestions
{
  return self->_selectedSuggestions;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (CSSuggestion)updatedSuggestion
{
  return self->_updatedSuggestion;
}

- (NSString)scopeIdentifierForPeopleSuggestions
{
  return self->_scopeIdentifierForPeopleSuggestions;
}

- (NSArray)inputLanguages
{
  return self->_inputLanguages;
}

- (NSDictionary)customFlags
{
  return self->_customFlags;
}

- (NSArray)implicitSuggestions
{
  return self->_implicitSuggestions;
}

- (NSString)filterQuery
{
  return self->_filterQuery;
}

- (NSArray)excludedMailboxes
{
  return self->_excludedMailboxes;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (int64_t)feedbackQueryID
{
  return self->_feedbackQueryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedMailboxes, 0);
  objc_storeStrong((id *)&self->_filterQuery, 0);
  objc_storeStrong((id *)&self->_implicitSuggestions, 0);
  objc_storeStrong((id *)&self->_customFlags, 0);
  objc_storeStrong((id *)&self->_inputLanguages, 0);
  objc_storeStrong((id *)&self->_scopeIdentifierForPeopleSuggestions, 0);
  objc_storeStrong((id *)&self->_updatedSuggestion, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_selectedSuggestions, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
}

@end