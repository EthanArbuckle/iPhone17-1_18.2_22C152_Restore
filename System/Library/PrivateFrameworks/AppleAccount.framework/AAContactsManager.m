@interface AAContactsManager
- (AAContactsIDSStatusDelegate)delegate;
- (id)_predicateForHandle:(id)a3;
- (id)contactForHandle:(id)a3;
- (id)contactForIdentifiers:(id)a3;
- (id)contactForMe;
- (id)contactIDForHandle:(id)a3;
- (void)contactForMe;
- (void)fetchIDSStatusForHandle:(id)a3;
- (void)idsStatusForHandle:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAContactsManager

- (id)contactIDForHandle:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  getCNContactStoreClass();
  v5 = objc_opt_new();
  v6 = [(AAContactsManager *)self _predicateForHandle:v4];

  v7 = getCNContactIdentifierKey();
  v15[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  id v14 = 0;
  v9 = [v5 unifiedContactsMatchingPredicate:v6 keysToFetch:v8 error:&v14];
  id v10 = v14;
  if (v10)
  {
    v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AAContactsManager contactIDForHandle:]();
    }
    v12 = 0;
    goto LABEL_7;
  }
  if ([v9 count])
  {
    v11 = [v9 firstObject];
    v12 = [v11 identifier];
LABEL_7:

    goto LABEL_8;
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (id)contactForHandle:(id)a3
{
  v20[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  getCNContactStoreClass();
  v5 = objc_opt_new();
  v6 = [(AAContactsManager *)self _predicateForHandle:v4];

  v7 = getCNContactIdentifierKey();
  v20[0] = v7;
  v8 = getCNContactGivenNameKey();
  v20[1] = v8;
  v9 = getCNContactFamilyNameKey();
  v20[2] = v9;
  id v10 = getCNContactThumbnailImageDataKey();
  v20[3] = v10;
  v11 = getCNContactPhoneNumbersKey();
  v20[4] = v11;
  v12 = getCNContactEmailAddressesKey();
  v20[5] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:6];

  id v19 = 0;
  id v14 = [v5 unifiedContactsMatchingPredicate:v6 keysToFetch:v13 error:&v19];
  id v15 = v19;
  if (v15)
  {
    v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AAContactsManager contactForHandle:]();
    }
  }
  v17 = [v14 firstObject];

  return v17;
}

- (id)contactForIdentifiers:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 firstObject];
  if (v3)
  {
    getCNContactStoreClass();
    id v4 = objc_opt_new();
    id CNContactClass = getCNContactClass();
    v22[0] = v3;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v7 = [CNContactClass predicateForContactsWithIdentifiers:v6];

    v8 = getCNContactIdentifierKey();
    v21[0] = v8;
    v9 = getCNContactGivenNameKey();
    v21[1] = v9;
    id v10 = getCNContactFamilyNameKey();
    v21[2] = v10;
    v11 = getCNContactThumbnailImageDataKey();
    v21[3] = v11;
    v12 = getCNContactPhoneNumbersKey();
    v21[4] = v12;
    v13 = getCNContactEmailAddressesKey();
    v21[5] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];

    id v20 = 0;
    id v15 = [v4 unifiedContactsMatchingPredicate:v7 keysToFetch:v14 error:&v20];
    v16 = v20;
    if (v16)
    {
      v17 = _AALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[AAContactsManager contactForHandle:]();
      }
    }
    v18 = [v15 firstObject];
  }
  else
  {
    v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AAContactsManager contactForIdentifiers:](v16);
    }
    v18 = 0;
  }

  return v18;
}

- (id)contactForMe
{
  v22[13] = *MEMORY[0x1E4F143B8];
  getCNContactStoreClass();
  v16 = objc_opt_new();
  id v20 = getCNContactIdentifierKey();
  v22[0] = v20;
  id v19 = getCNContactGivenNameKey();
  v22[1] = v19;
  v18 = getCNContactFamilyNameKey();
  void v22[2] = v18;
  v17 = getCNContactThumbnailImageDataKey();
  v22[3] = v17;
  v2 = getCNContactPhoneNumbersKey();
  v22[4] = v2;
  v3 = getCNContactEmailAddressesKey();
  v22[5] = v3;
  id v4 = getCNContactNamePrefixKey();
  v22[6] = v4;
  v5 = getCNContactMiddleNameKey();
  v22[7] = v5;
  v6 = getCNContactNicknameKey();
  v22[8] = v6;
  v7 = getCNContactTypeKey();
  v22[9] = v7;
  v8 = getCNContactImageDataKey();
  v22[10] = v8;
  v9 = getCNContactCropRectKey();
  v22[11] = v9;
  id v10 = getCNContactMemojiMetadataKey();
  v22[12] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:13];

  id v21 = 0;
  v12 = [v16 _crossPlatformUnifiedMeContactWithKeysToFetch:v11 error:&v21];
  id v13 = v21;
  if (v13)
  {
    id v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AAContactsManager contactForMe]();
    }
  }

  return v12;
}

- (id)_predicateForHandle:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "aa_appearsToBeEmail"))
  {
    uint64_t v4 = [getCNContactClass() predicateForContactsMatchingEmailAddress:v3];
  }
  else
  {
    if (objc_msgSend(v3, "aa_appearsToBePhoneNumber"))
    {
      v5 = [getCNPhoneNumberClass() phoneNumberWithStringValue:v3];
      v6 = [getCNContactClass() predicateForContactsMatchingPhoneNumber:v5];

      goto LABEL_7;
    }
    uint64_t v4 = [getCNContactClass() predicateForContactsMatchingName:v3];
  }
  v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (void)fetchIDSStatusForHandle:(id)a3
{
  id v4 = a3;
  v5 = [[AAMessagingDestination alloc] initWithHandle:v4];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__AAContactsManager_fetchIDSStatusForHandle___block_invoke;
  v7[3] = &unk_1E5A48C38;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(AAMessagingDestination *)v5 isRegisteredToiMessageWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__AAContactsManager_fetchIDSStatusForHandle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 reachabilityForHandle:*(void *)(a1 + 32) isReachable:a2];
}

- (void)idsStatusForHandle:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[AAMessagingDestination alloc] initWithHandle:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__AAContactsManager_idsStatusForHandle_completion___block_invoke;
  v9[3] = &unk_1E5A48C60;
  id v10 = v5;
  id v8 = v5;
  [(AAMessagingDestination *)v7 isRegisteredToiMessageWithCompletion:v9];
}

uint64_t __51__AAContactsManager_idsStatusForHandle_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AAContactsIDSStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAContactsIDSStatusDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)contactIDForHandle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching contact ID: %@", v2, v3, v4, v5, v6);
}

- (void)contactForHandle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching contact: %@", v2, v3, v4, v5, v6);
}

- (void)contactForIdentifiers:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "Identifier for contact was nil. Bailing on getting contact from recommendation.", v1, 2u);
}

- (void)contactForMe
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Error fetching me card: %@", v2, v3, v4, v5, v6);
}

@end