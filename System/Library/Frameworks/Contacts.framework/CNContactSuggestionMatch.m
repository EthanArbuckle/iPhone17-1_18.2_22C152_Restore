@interface CNContactSuggestionMatch
+ (id)os_log;
+ (id)suggestionFromContactMatch:(id)a3;
+ (void)fetchLinkedIdentifiersForContactSuggestionMatches:(id)a3 fromSuggestionService:(id)a4;
- (NSString)mainStoreLinkedIdentifier;
- (SGContact)contact;
- (SGContactMatch)contactMatch;
- (void)setContact:(id)a3;
- (void)setContactMatch:(id)a3;
- (void)setMainStoreLinkedIdentifier:(id)a3;
@end

@implementation CNContactSuggestionMatch

+ (id)os_log
{
  if (os_log_cn_once_token_0_0 != -1) {
    dispatch_once(&os_log_cn_once_token_0_0, &__block_literal_global_2);
  }
  v2 = (void *)os_log_cn_once_object_0_0;

  return v2;
}

uint64_t __34__CNContactSuggestionMatch_os_log__block_invoke()
{
  os_log_cn_once_object_0_0 = (uint64_t)os_log_create("com.apple.contacts", "suggestion-match");

  return MEMORY[0x1F41817F8]();
}

+ (id)suggestionFromContactMatch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setContactMatch:v4];

  return v5;
}

- (void)setContactMatch:(id)a3
{
  v6 = (SGContactMatch *)a3;
  if (self->_contactMatch != v6)
  {
    objc_storeStrong((id *)&self->_contactMatch, a3);
    id v5 = [(SGContactMatch *)v6 contact];
    [(CNContactSuggestionMatch *)self setContact:v5];
  }
}

+ (void)fetchLinkedIdentifiersForContactSuggestionMatches:(id)a3 fromSuggestionService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v7 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_5);
    id v15 = 0;
    v8 = [v6 cnContactMatchesForRecordIds:v7 error:&v15];
    id v9 = v15;
    if (v8)
    {
      if ([v8 count])
      {
        unint64_t v10 = 0;
        do
        {
          v11 = [v8 objectAtIndexedSubscript:v10];
          if ([v11 count] == 1)
          {
            v12 = [v5 objectAtIndexedSubscript:v10];
            v13 = [v11 objectAtIndexedSubscript:0];
            [v12 setMainStoreLinkedIdentifier:v13];
          }
          ++v10;
        }
        while (v10 < [v8 count]);
      }
    }
    else
    {
      v14 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[CNContactSuggestionMatch fetchLinkedIdentifiersForContactSuggestionMatches:fromSuggestionService:]((uint64_t)v7, (uint64_t)v9, v14);
      }
    }
  }
}

id __100__CNContactSuggestionMatch_fetchLinkedIdentifiersForContactSuggestionMatches_fromSuggestionService___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 contact];
  v3 = [v2 recordId];

  return v3;
}

- (SGContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (SGContactMatch)contactMatch
{
  return self->_contactMatch;
}

- (NSString)mainStoreLinkedIdentifier
{
  return self->_mainStoreLinkedIdentifier;
}

- (void)setMainStoreLinkedIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStoreLinkedIdentifier, 0);
  objc_storeStrong((id *)&self->_contactMatch, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

+ (void)fetchLinkedIdentifiersForContactSuggestionMatches:(os_log_t)log fromSuggestionService:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Error retrieving contact matches for suggestions record ID: %@, %@", (uint8_t *)&v3, 0x16u);
}

@end