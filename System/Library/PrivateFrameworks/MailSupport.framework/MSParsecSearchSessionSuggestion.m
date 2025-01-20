@interface MSParsecSearchSessionSuggestion
+ (id)suggestionWithIdentifier:(id)a3 category:(id)a4 option:(int64_t)a5 resultDetails:(id)a6;
- (MSParsecSearchSessionSuggestion)initWithIdentifier:(id)a3 category:(id)a4 option:(int64_t)a5 resultDetails:(id)a6;
- (NSString)category;
- (NSString)resultID;
- (SFMailResultDetails)resultDetails;
- (id)_suggestionBundleID;
- (id)feedbackResult;
- (int64_t)option;
@end

@implementation MSParsecSearchSessionSuggestion

+ (id)suggestionWithIdentifier:(id)a3 category:(id)a4 option:(int64_t)a5 resultDetails:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 category:v11 option:a5 resultDetails:v12];

  return v13;
}

- (MSParsecSearchSessionSuggestion)initWithIdentifier:(id)a3 category:(id)a4 option:(int64_t)a5 resultDetails:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MSParsecSearchSessionSuggestion;
  v14 = [(MSParsecSearchSessionSuggestion *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_resultID, a3);
    objc_storeStrong((id *)&v15->_category, a4);
    v15->_option = a5;
    objc_storeStrong((id *)&v15->_resultDetails, a6);
  }

  return v15;
}

- (id)feedbackResult
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
  [v3 setIdentifier:self->_resultID];
  [v3 setSectionBundleIdentifier:self->_category];
  v4 = [(MSParsecSearchSessionSuggestion *)self _suggestionBundleID];
  [v3 setResultBundleId:v4];

  [v3 setType:2];
  [v3 setMailResultDetails:self->_resultDetails];
  return v3;
}

- (id)_suggestionBundleID
{
  int64_t v2 = [(MSParsecSearchSessionSuggestion *)self option];
  id v3 = @"com.apple.mail.search.suggestion";
  if (v2 == 1) {
    id v3 = @"com.apple.mail.search.suggestion.vip";
  }
  if (v2 == 2) {
    return @"com.apple.mail.search.suggestion.usertyped";
  }
  else {
    return v3;
  }
}

- (NSString)resultID
{
  return self->_resultID;
}

- (int64_t)option
{
  return self->_option;
}

- (SFMailResultDetails)resultDetails
{
  return self->_resultDetails;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_resultDetails, 0);
  objc_storeStrong((id *)&self->_resultID, 0);
}

@end