@interface IMDCNPersonAliasResolver
- (BOOL)isCNContactFavorited:(id)a3;
- (BOOL)isFavoritedContact:(id)a3;
- (CNContactStore)contactStore;
- (IMDCNPersonAliasResolver)init;
- (IMDContactStoreChangeHistoryEventsHandler)contactsEventhandler;
- (NSData)currentHistoryToken;
- (NSMutableDictionary)aliasToCNIDMap;
- (id)_batchFetchContactRecordIDForAliases:(id)a3;
- (id)_fetchAliasToCNIDMapForAliases:(id)a3;
- (id)_fetchContactFullNameAndOrganizationNameForHandleID:(id)a3;
- (id)_fetchContactGivenNameAndBirthdayForHandleID:(id)a3;
- (id)_fetchContactIdentifierForAlias:(id)a3;
- (id)_predicateForAlias:(id)a3;
- (id)_predicateForEmailAddress:(id)a3;
- (id)_predicateForPhoneNumber:(id)a3;
- (id)_updateAliasToCNIDMap:(id)a3 withHistoryToken:(id)a4;
- (void)CNRecordIDForAliases:(id)a3 completionHandler:(id)a4;
- (void)setAliasToCNIDMap:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactsEventhandler:(id)a3;
- (void)setCurrentHistoryToken:(id)a3;
@end

@implementation IMDCNPersonAliasResolver

- (IMDCNPersonAliasResolver)init
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    v7.receiver = self;
    v7.super_class = (Class)IMDCNPersonAliasResolver;
    v3 = [(IMDCNPersonAliasResolver *)&v7 init];
    if (v3) {
      sub_1AFC53FF8();
    }
    self = v3;
    v4 = self;
  }
  else
  {
    if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Error! being called in a process that is not in IMDPersistenceAgent!", buf, 2u);
      }
    }
    v4 = 0;
  }

  return v4;
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      sub_1AFC53FF8();
      id v4 = objc_alloc_init(MEMORY[0x1E4F1B990]);
      [v4 setUseInProcessMapperExclusively:1];
      v5 = (CNContactStore *)objc_msgSend(objc_alloc((Class)MEMORY[0x1B3E89B10](@"CNContactStore", @"Contacts")), "initWithConfiguration:", v4);
      v6 = self->_contactStore;
      self->_contactStore = v5;

      objc_super v7 = [MEMORY[0x1E4F1C9B8] data];
      currentHistoryToken = self->_currentHistoryToken;
      self->_currentHistoryToken = v7;

      contactsEventhandler = self->_contactsEventhandler;
      self->_contactsEventhandler = 0;
    }
    contactStore = self->_contactStore;
    if (!contactStore)
    {
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1AFC719D4(v10);
      }

      contactStore = self->_contactStore;
    }
  }
  return contactStore;
}

- (NSData)currentHistoryToken
{
  return self->_currentHistoryToken;
}

- (id)_predicateForEmailAddress:(id)a3
{
  return (id)[(id)qword_1EB5ABAE8 predicateForContactsMatchingEmailAddress:a3];
}

- (id)_predicateForPhoneNumber:(id)a3
{
  v3 = (void *)qword_1EB5ABAE8;
  id v4 = [(id)qword_1EB5ABB10 phoneNumberWithStringValue:a3];
  v5 = [v3 predicateForContactsMatchingPhoneNumber:v4];

  return v5;
}

- (id)_predicateForAlias:(id)a3
{
  id v4 = a3;
  if ([v4 _appearsToBeEmail]) {
    [(IMDCNPersonAliasResolver *)self _predicateForEmailAddress:v4];
  }
  else {
  v5 = [(IMDCNPersonAliasResolver *)self _predicateForPhoneNumber:v4];
  }

  return v5;
}

- (id)_fetchContactIdentifierForAlias:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(IMDCNPersonAliasResolver *)self _predicateForAlias:v4];
    int v6 = IMAdditionalContactsLoggingEnabled();
    if (v5)
    {
      if (v6 && IMOSLoggingEnabled())
      {
        objc_super v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v25 = v4;
          __int16 v26 = 2112;
          id v27 = v5;
          _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Requesting a CNContact from Contact Store for Alias %@ and Predicate %@", buf, 0x16u);
        }
      }
      v8 = [(IMDCNPersonAliasResolver *)self contactStore];
      v23[0] = qword_1EB5ABB30;
      v23[1] = qword_1EB5ABB40;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      id v22 = 0;
      v10 = [v8 unifiedContactsMatchingPredicate:v5 keysToFetch:v9 error:&v22];
      id v11 = v22;

      if (v11)
      {
        if (IMOSLoggingEnabled())
        {
          v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = [v11 description];
            *(_DWORD *)buf = 138412546;
            id v25 = v4;
            __int16 v26 = 2112;
            id v27 = v13;
            _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Error getting contact from Contact Store for alias %@ error %@", buf, 0x16u);
          }
        }

        v10 = 0;
      }
      if ([v10 count])
      {
        v14 = [v10 objectAtIndexedSubscript:0];
        if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
        {
          v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = [v14 identifier];
            *(_DWORD *)buf = 138412546;
            id v25 = v16;
            __int16 v26 = 2112;
            id v27 = v4;
            _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: CNContact Identifier %@ for alias %@", buf, 0x16u);
          }
        }
        v17 = [v14 identifier];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v4;
            _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: No contact for alias %@", buf, 0xCu);
          }
        }
        v17 = 0;
      }
    }
    else
    {
      if (v6 && IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v4;
          _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Could not get predicate for alias %@", buf, 0xCu);
        }
      }
      v17 = 0;
    }
  }
  else
  {
    if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Passed in nil email _fetchCNContactForEmail", buf, 2u);
      }
    }
    v17 = 0;
  }

  return v17;
}

- (id)_batchFetchContactRecordIDForAliases:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  if ([v33 count])
  {
    id v3 = objc_alloc((Class)qword_1EB5ABAF0);
    v52[0] = qword_1EB5ABB30;
    v52[1] = qword_1EB5ABB40;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    v32 = (void *)[v3 initWithKeysToFetch:v4];

    id v27 = [(id)qword_1EB5ABAE8 predicateForContactsMatchingHandleStrings:v33];
    [v32 setPredicate:v27];
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = [v33 count];
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Dispatching a contacts batch query for %lu aliases.", (uint8_t *)&buf, 0xCu);
      }
    }
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v6 startTimingForKey:@"batchFetchForAliases"];
    v29 = v6;
    objc_super v7 = [(IMDCNPersonAliasResolver *)self contactStore];
    id v43 = 0;
    v31 = [v7 executeFetchRequest:v32 error:&v43];
    id v26 = v43;

    v30 = [v31 value];
    [v29 stopTimingForKey:@"batchFetchForAliases"];
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        [v29 totalTimeForKey:@"batchFetchForAliases"];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Contacts batch fetch from Contact Store completed. Took %f seconds", (uint8_t *)&buf, 0xCu);
      }
    }
    if (v30)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v48 = 0x3032000000;
      v49 = sub_1AFC55238;
      v50 = sub_1AFC55248;
      id v51 = 0;
      id v51 = [v31 currentHistoryToken];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1AFC55250;
      block[3] = &unk_1E5F9DA18;
      id v10 = v30;
      id v40 = v10;
      id v11 = v33;
      id v41 = v11;
      p_long long buf = &buf;
      dispatch_async(MEMORY[0x1E4F14428], block);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v46 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v17 = objc_msgSend(v10, "objectForKey:", v16, v26);
            if ([v17 count])
            {
              v18 = [v17 firstObject];
              v19 = +[IMDContactCache sharedInstance];
              [v19 cacheContact:v18 forKey:v16];

              v20 = [v18 identifier];
              [v34 setObject:v20 forKey:v16];
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v44 = 138412290;
                  uint64_t v45 = v16;
                  _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: No contact for alias %@", v44, 0xCu);
                }
              }
              [v34 setObject:@"__kIMDCNPersonNotFound" forKey:v16];
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v46 count:16];
        }
        while (v13);
      }

      [(IMDCNPersonAliasResolver *)self setCurrentHistoryToken:*(void *)(*((void *)&buf + 1) + 40)];
      _Block_object_dispose(&buf, 8);
    }
    else if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v26;
        _os_log_impl(&dword_1AFB53000, v24, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: No results obtained from the Contacts batch Fetchrequest. Error: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v23 = v34;
  }
  else
  {
    if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Passed in empty set of aliases", (uint8_t *)&buf, 2u);
      }
    }
    id v23 = 0;
  }

  return v23;
}

- (id)_fetchAliasToCNIDMapForAliases:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v5 startTimingForKey:@"_fetchAliasToCNIDMapForAliases"];
  id v6 = [(IMDCNPersonAliasResolver *)self _batchFetchContactRecordIDForAliases:v4];
  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: _fetchAliasToCNIDMapForAliases returning aliasIDMap", (uint8_t *)&v11, 2u);
      }
    }
    [MEMORY[0x1E4F6E6D8] logDictionary:v6];
  }
  [v5 stopTimingForKey:@"_fetchAliasToCNIDMapForAliases"];
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      [v5 totalTimeForKey:@"_fetchAliasToCNIDMapForAliases"];
      int v11 = 134217984;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Generating aliasToIDMap completed. Took %f seconds", (uint8_t *)&v11, 0xCu);
    }
  }
  return v6;
}

- (id)_updateAliasToCNIDMap:(id)a3 withHistoryToken:(id)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)qword_1EB5ABAE0);
  [v8 setStartingToken:v7];
  v39[0] = qword_1EB5ABB30;
  v39[1] = qword_1EB5ABB40;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [v8 setAdditionalContactKeyDescriptors:v9];

  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Updating aliasToCNIDMap using Contact Change History events", buf, 2u);
    }
  }
  if (IMAdditionalContactsLoggingEnabled()) {
    [MEMORY[0x1E4F6E6D8] logDictionary:v6];
  }
  int v11 = [(IMDCNPersonAliasResolver *)self contactStore];
  id v35 = 0;
  uint64_t v12 = [v11 executeFetchRequest:v8 error:&v35];
  id v30 = v35;

  if (v12)
  {
    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F6E708]);
      uint64_t v14 = (void *)[v6 mutableCopy];
      v15 = (IMDContactStoreChangeHistoryEventsHandler *)[v13 initWithAliasToCNIDMap:v14];
      contactsEventhandler = self->_contactsEventhandler;
      self->_contactsEventhandler = v15;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v17 = [v12 value];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * i) acceptEventVisitor:self->_contactsEventhandler];
          if ([(IMDContactStoreChangeHistoryEventsHandler *)self->_contactsEventhandler receivedDropEverythingEvent])
          {
            if (IMOSLoggingEnabled())
            {
              v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Skipping Contact change history events after the Drop Everything Event", buf, 2u);
              }
            }
            goto LABEL_23;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_23:

    id v22 = [v12 currentHistoryToken];
    [(IMDCNPersonAliasResolver *)self setCurrentHistoryToken:v22];

    id v23 = [(IMDContactStoreChangeHistoryEventsHandler *)self->_contactsEventhandler getAliasToCNIDMap];
    if (v23)
    {
      if (IMAdditionalContactsLoggingEnabled())
      {
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1AFB53000, v24, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: _updateAliasToCNIDMap returning aliasIDMap", buf, 2u);
          }
        }
        [MEMORY[0x1E4F6E6D8] logDictionary:v23];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1AFB53000, v27, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Refetching CNID for ALL Aliases.", buf, 2u);
        }
      }
      uint64_t v28 = [v6 allKeys];
      id v23 = [(IMDCNPersonAliasResolver *)self _fetchAliasToCNIDMapForAliases:v28];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = [v30 description];
        *(_DWORD *)long long buf = 138412290;
        long long v38 = v26;
        _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Could not fetch Change History from CNContactStore error:%@", buf, 0xCu);
      }
    }
    id v23 = v6;
  }

  return v23;
}

- (void)CNRecordIDForAliases:(id)a3 completionHandler:(id)a4
{
  id v7 = (void (**)(id, void *, void))a4;
  id v6 = [(IMDCNPersonAliasResolver *)self _fetchAliasToCNIDMapForAliases:a3];
  if (v7) {
    v7[2](v7, v6, 0);
  }
}

- (BOOL)isFavoritedContact:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(IMDCNPersonAliasResolver *)self contactStore];
  id v6 = [v5 unifiedContactWithIdentifier:v4 keysToFetch:MEMORY[0x1E4F1CBF0] error:0];

  LOBYTE(self) = [(IMDCNPersonAliasResolver *)self isCNContactFavorited:v6];
  return (char)self;
}

- (id)_fetchContactGivenNameAndBirthdayForHandleID:(id)a3
{
  return (id)MEMORY[0x1F4181798](MEMORY[0x1E4F6E6E0], sel_getContactGivenNameAndBirthdayForHandleID_);
}

- (id)_fetchContactFullNameAndOrganizationNameForHandleID:(id)a3
{
  return (id)MEMORY[0x1F4181798](MEMORY[0x1E4F6E6E0], sel_getContactFullNameAndOrganizationNameForHandleID_);
}

- (BOOL)isCNContactFavorited:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (objc_class *)qword_1EB5ABB08;
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(IMDCNPersonAliasResolver *)self contactStore];
  id v8 = (void *)[v6 initWithContactStore:v7];

  uint64_t v9 = [v8 entriesForContact:v5];

  BOOL v10 = [v9 count] != 0;
  return v10;
}

- (void)setContactStore:(id)a3
{
}

- (void)setCurrentHistoryToken:(id)a3
{
}

- (NSMutableDictionary)aliasToCNIDMap
{
  return self->_aliasToCNIDMap;
}

- (void)setAliasToCNIDMap:(id)a3
{
}

- (IMDContactStoreChangeHistoryEventsHandler)contactsEventhandler
{
  return self->_contactsEventhandler;
}

- (void)setContactsEventhandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsEventhandler, 0);
  objc_storeStrong((id *)&self->_aliasToCNIDMap, 0);
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end