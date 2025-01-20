@interface FAInviteSuggestions
- (FAFamilySuggesterFeedbackContext)feedbackContext;
- (FAInviteSuggestions)init;
- (FAInviteSuggestions)initWithSuggesters:(id)a3;
- (NSArray)suggesters;
- (id)fetchFamilyMemberSuggestions:(int64_t *)a3;
- (id)fetchFamilyMemberSuggestions:(int64_t *)a3 useSuggester:(id)a4;
- (id)initForOneTapInvite;
- (id)recommendedSuggester:(id)a3;
- (int64_t)fetchSuggestedInviteTransportForContactId:(id)a3 contactHandles:(id)a4;
- (void)setFeedbackContext:(id)a3;
- (void)setSuggesters:(id)a3;
@end

@implementation FAInviteSuggestions

- (FAInviteSuggestions)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = objc_alloc_init(FAFamilyPeopleSuggesterSuggester);
  [v3 addObject:v4];
  v5 = (void *)[v3 copy];
  v6 = [(FAInviteSuggestions *)self initWithSuggesters:v5];

  return v6;
}

- (id)initForOneTapInvite
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = objc_alloc_init(FAFamilyMegadomeSuggester);
  [v3 addObject:v4];
  v5 = objc_alloc_init(FAFamilyPeopleSuggesterSuggester);
  [v3 addObject:v5];
  v6 = (void *)[v3 copy];
  v7 = [(FAInviteSuggestions *)self initWithSuggesters:v6];

  return v7;
}

- (FAInviteSuggestions)initWithSuggesters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAInviteSuggestions;
  v6 = [(FAInviteSuggestions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_suggesters, a3);
  }

  return v7;
}

- (id)recommendedSuggester:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v4;
      _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to use recommended suggester: %@", buf, 0xCu);
    }

    v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v7 = [v4 stringByTrimmingCharactersInSet:v6];
    v8 = [v7 lowercaseString];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v9 = self->_suggesters;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v8, "isEqual:", @"megadome", (void)v19)
            && [v14 proactiveModel] == 3)
          {
            v16 = _FALogSystem();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v17 = "Recommended suggester matches megadome";
              goto LABEL_21;
            }
LABEL_22:

            id v15 = v14;
            goto LABEL_23;
          }
          if ([v8 isEqual:@"proactive"]
            && [v14 proactiveModel] == 2)
          {
            v16 = _FALogSystem();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v17 = "Recommended suggester matches proactive";
LABEL_21:
              _os_log_impl(&dword_1D252C000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
            }
            goto LABEL_22;
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_23:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)fetchFamilyMemberSuggestions:(int64_t *)a3
{
  return [(FAInviteSuggestions *)self fetchFamilyMemberSuggestions:a3 useSuggester:0];
}

- (id)fetchFamilyMemberSuggestions:(int64_t *)a3 useSuggester:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D252C000, v7, OS_LOG_TYPE_DEFAULT, "Trying to get family recommendations", buf, 2u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v9 = [(FAInviteSuggestions *)self recommendedSuggester:v6];
  uint64_t v10 = [(FAInviteSuggestions *)self suggesters];
  uint64_t v11 = v10;
  if (v9)
  {
    uint64_t v12 = (void *)[v10 mutableCopy];

    [v12 insertObject:v9 atIndex:0];
    uint64_t v11 = (void *)[v12 copy];
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v36 = self;
    v37 = v9;
    v38 = v8;
    v39 = a3;
    id v40 = v6;
    uint64_t v16 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_21:
          v24 = (objc_class *)objc_opt_class();
          id v25 = NSStringFromClass(v24);
          uint64_t v26 = _FALogSystem();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v25;
            _os_log_impl(&dword_1D252C000, v26, OS_LOG_TYPE_DEFAULT, "Attempting to get Family suggestions from suggester %@", buf, 0xCu);
          }

          id v41 = 0;
          id v42 = 0;
          v27 = [v18 getFamilyRecommendationsWithContext:&v42 error:&v41];
          id v28 = v42;
          id v29 = v41;
          v30 = _FALogSystem();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v48 = v25;
            __int16 v49 = 2112;
            uint64_t v50 = (uint64_t)v29;
            __int16 v51 = 2112;
            id v52 = v27;
            _os_log_impl(&dword_1D252C000, v30, OS_LOG_TYPE_DEFAULT, "Finished getting family suggestions for suggester class %@. error: %@, recommendations: %@", buf, 0x20u);
          }

          if (v29)
          {
            v31 = _FALogSystem();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = [v27 count];
              *(_DWORD *)buf = 138412802;
              v48 = v25;
              __int16 v49 = 2048;
              uint64_t v50 = v32;
              __int16 v51 = 2112;
              id v52 = v29;
              _os_log_impl(&dword_1D252C000, v31, OS_LOG_TYPE_DEFAULT, "Suggester class %@ returned %lu suggestions and encountered an error: %@", buf, 0x20u);
            }
          }
          [(FAInviteSuggestions *)v36 setFeedbackContext:v28];
          int64_t v23 = [v18 proactiveModel];
          id v8 = v38;
          [v38 addObjectsFromArray:v27];
          v33 = _FALogSystem();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v25;
            __int16 v49 = 2112;
            uint64_t v50 = (uint64_t)v27;
            _os_log_impl(&dword_1D252C000, v33, OS_LOG_TYPE_DEFAULT, "Using family suggestions for suggester class %@: recommendations: %@", buf, 0x16u);
          }

          a3 = v39;
          id v6 = v40;
          objc_super v9 = v37;
          goto LABEL_32;
        }
        long long v19 = +[FAFamilyFeatureFlag megadomeAdoption];
        if ([v19 isEnabled])
        {
          long long v20 = +[FAServerBagFlag megadomeKillSwitch];
          int v21 = [v20 isEnabledWithForceRefresh:1];

          if (!v21) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        long long v22 = _FALogSystem();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D252C000, v22, OS_LOG_TYPE_DEFAULT, "Megadome is not enabled. Falling back to the next priorty suggestions model.", buf, 2u);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    a3 = v39;
    id v6 = v40;
    objc_super v9 = v37;
    id v8 = v38;
  }
  int64_t v23 = 1;
LABEL_32:

  if (a3) {
    *a3 = v23;
  }
  v34 = (void *)[v8 copy];

  return v34;
}

- (int64_t)fetchSuggestedInviteTransportForContactId:(id)a3 contactHandles:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F5B3E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 interactionAdvisor];
  objc_super v9 = [MEMORY[0x1E4F5B3E8] interactionAdvisorSettingsDefault];
  [v9 setResultLimit:5];
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];

  [v9 setConstrainPersonIds:v10];
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];

  [v9 setConstrainIdentifiers:v11];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F2944FA8, &unk_1F2944FC0, &unk_1F2944FD8, &unk_1F2944FF0, 0);
  [v9 setConstrainMechanisms:v12];

  id v13 = [v8 adviseInteractionsUsingSettings:v9];
  uint64_t v14 = [v13 firstObject];
  uint64_t v15 = [v14 bundleId];
  uint64_t v16 = _FALogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v20 = v15;
    _os_log_impl(&dword_1D252C000, v16, OS_LOG_TYPE_DEFAULT, "Suggested transport type for contact is %@", buf, 0xCu);
  }

  if ([v15 isEqualToString:@"com.apple.MobileSMS"])
  {
    int64_t v17 = 1;
  }
  else if ([v15 isEqualToString:@"com.apple.mobilemail"])
  {
    int64_t v17 = 2;
  }
  else
  {
    int64_t v17 = 3;
  }

  return v17;
}

- (FAFamilySuggesterFeedbackContext)feedbackContext
{
  return self->_feedbackContext;
}

- (void)setFeedbackContext:(id)a3
{
}

- (NSArray)suggesters
{
  return self->_suggesters;
}

- (void)setSuggesters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggesters, 0);
  objc_storeStrong((id *)&self->_feedbackContext, 0);
}

@end