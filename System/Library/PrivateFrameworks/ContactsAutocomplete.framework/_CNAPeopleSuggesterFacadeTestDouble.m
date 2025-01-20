@interface _CNAPeopleSuggesterFacadeTestDouble
+ (id)makeContactWithDisplayName:(id)a3;
+ (id)makeContactWithDisplayName:(id)a3 handle:(id)a4;
+ (id)makeRecipientWithDisplayName:(id)a3 handle:(id)a4;
+ (id)makeRecipientWithDisplayName:(id)a3 handle:(id)a4 hasContact:(BOOL)a5;
+ (id)personWithDisplayName:(id)a3 handle:(id)a4 hasContact:(BOOL)a5;
- (NSString)description;
- (_CNAPeopleSuggesterFacadeTestDouble)init;
- (_CNAPeopleSuggesterFacadeTestDouble)initWithDelegate:(id)a3;
- (_CNAPeopleSuggesterFacadeTestDoubleDelegate)delegate;
- (id)addGroupWithDisplayName:(id)a3 conversationIdentifier:(id)a4 recipients:(id)a5;
- (id)addPerson:(id)a3;
- (id)autocompleteSearchResultsWithPredictionContext:(id)a3;
- (void)addSuggestion:(id)a3;
@end

@implementation _CNAPeopleSuggesterFacadeTestDouble

- (_CNAPeopleSuggesterFacadeTestDouble)init
{
  return [(_CNAPeopleSuggesterFacadeTestDouble *)self initWithDelegate:0];
}

- (_CNAPeopleSuggesterFacadeTestDouble)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNAPeopleSuggesterFacadeTestDouble;
  v5 = [(_CNAPeopleSuggesterFacadeTestDouble *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_opt_new();
    suggestions = v6->_suggestions;
    v6->_suggestions = (NSMutableArray *)v7;

    v9 = v6;
  }

  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = (id)[v3 appendName:@"delegate" object:WeakRetained];

  id v6 = (id)[v3 appendName:@"suggestions" object:self->_suggestions];
  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (id)addPerson:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = (Class (__cdecl *)())get_PSSuggestionClass;
  id v5 = a3;
  id v6 = objc_alloc_init(v4());
  [v6 setSuggestionType:1];
  v9[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  [v6 setRecipients:v7];
  [(_CNAPeopleSuggesterFacadeTestDouble *)self addSuggestion:v6];
  return v6;
}

- (id)addGroupWithDisplayName:(id)a3 conversationIdentifier:(id)a4 recipients:(id)a5
{
  v8 = (Class (__cdecl *)())get_PSSuggestionClass;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[objc_alloc(v8()) initWithBundleID:0 conversationIdentifier:v10 groupName:v11 recipients:v9];

  [v12 setSuggestionType:2];
  [(_CNAPeopleSuggesterFacadeTestDouble *)self addSuggestion:v12];
  return v12;
}

- (void)addSuggestion:(id)a3
{
}

+ (id)personWithDisplayName:(id)a3 handle:(id)a4 hasContact:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() makeRecipientWithDisplayName:v8 handle:v7 hasContact:v5];

  return v9;
}

+ (id)makeRecipientWithDisplayName:(id)a3 handle:(id)a4
{
  return (id)[a1 makeRecipientWithDisplayName:a3 handle:a4 hasContact:0];
}

+ (id)makeRecipientWithDisplayName:(id)a3 handle:(id)a4 hasContact:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    id v10 = [a1 makeContactWithDisplayName:v8 handle:v9];
  }
  else
  {
    id v10 = 0;
  }
  id v11 = objc_alloc(get_PSRecipientClass());
  v12 = [MEMORY[0x1E4F29128] UUID];
  v13 = [v12 UUIDString];
  v14 = (void *)[v11 initWithIdentifier:v13 handle:v9 displayName:v8 contact:v10];

  return v14;
}

+ (id)makeContactWithDisplayName:(id)a3 handle:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 makeContactWithDisplayName:a3];
  if (v6 && [v6 length])
  {
    id v8 = (void *)MEMORY[0x1E4F5A410];
    v16[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v10 = [v8 classificationOfHandleStrings:v9];

    id v11 = [v10 emailAddresses];
    v12 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_22);
    [v7 setEmailAddresses:v12];

    v13 = [v10 phoneNumbers];
    v14 = objc_msgSend(v13, "_cn_map:", &__block_literal_global_17_0);
    [v7 setPhoneNumbers:v14];
  }
  return v7;
}

+ (id)makeContactWithDisplayName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  if (v3 && [v3 length])
  {
    BOOL v5 = [MEMORY[0x1E4F5A470] componentsFromString:v3];
    id v6 = [v5 givenName];
    [v4 setGivenName:v6];

    id v7 = [v5 familyName];
    [v4 setFamilyName:v7];

    id v8 = [v5 middleName];
    [v4 setMiddleName:v8];

    id v9 = [v5 namePrefix];
    [v4 setNamePrefix:v9];

    id v10 = [v5 nameSuffix];
    [v4 setNameSuffix:v10];

    id v11 = [v5 nickname];
    [v4 setNickname:v11];
  }
  return v4;
}

- (id)autocompleteSearchResultsWithPredictionContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNAPeopleSuggesterFacadeTestDouble *)self delegate];
  [v5 didQueryPeopleSuggesterWithContext:v4];

  id v6 = (void *)[(NSMutableArray *)self->_suggestions copy];
  return v6;
}

- (_CNAPeopleSuggesterFacadeTestDoubleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_CNAPeopleSuggesterFacadeTestDoubleDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end