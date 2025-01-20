@interface IDSPhoneSubscriptionSelector
- (BOOL)disableTemporaryPhoneAlias:(id)a3 withError:(id *)a4;
- (BOOL)enableTemporaryPhoneAlias:(id)a3 withError:(id *)a4;
- (BOOL)removeTemporaryPhoneAlias:(id)a3 withError:(id *)a4;
- (IDSPhoneSubscriptionSelector)init;
- (IDSPhoneSubscriptionSelector)initWithSyncDaemonControllerBuilder:(id)a3;
- (IDSXPCDaemonController)syncDaemonController;
- (id)selectSubscription:(id)a3 withError:(id *)a4;
- (id)selectedSubscriptionsWithError:(id *)a3;
- (id)setSelectedSubscriptions:(id)a3 withError:(id *)a4;
- (id)syncDaemonControllerBuilder;
- (id)unselectSubscription:(id)a3 withError:(id *)a4;
- (id)unselectedTemporaryPhoneAliasesWithError:(id *)a3;
- (void)_performSyncAction:(id)a3;
- (void)disableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)enableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)removeTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)requestSelectedSubscriptionsWithCompletion:(id)a3;
- (void)requestUnselectedTemporaryPhoneAliasesWithError:(id)a3;
- (void)selectSubscription:(id)a3 withCompletion:(id)a4;
- (void)setSelectedSubscriptions:(id)a3 withCompletion:(id)a4;
- (void)setSyncDaemonController:(id)a3;
- (void)setSyncDaemonControllerBuilder:(id)a3;
- (void)unselectSubscription:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSPhoneSubscriptionSelector

- (IDSPhoneSubscriptionSelector)initWithSyncDaemonControllerBuilder:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IDSPhoneSubscriptionSelector;
    v5 = [(IDSPhoneSubscriptionSelector *)&v10 init];
    if (v5)
    {
      uint64_t v6 = MEMORY[0x192FE03B0](v4);
      id syncDaemonControllerBuilder = v5->_syncDaemonControllerBuilder;
      v5->_id syncDaemonControllerBuilder = (id)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IDSPhoneSubscriptionSelector)init
{
  return (IDSPhoneSubscriptionSelector *)MEMORY[0x1F4181798](self, sel_initWithSyncDaemonControllerBuilder_);
}

- (void)requestSelectedSubscriptionsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6C3B8] registration];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting selected subscriptions with completion", buf, 2u);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1919DCF88;
    v13[3] = &unk_1E572C9B0;
    v14 = v3;
    sub_1919DCEC4(v13, v14);
    v5 = v14;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_191A3E9E8(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)selectSubscription:(id)a3 withCompletion:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Selecting subscription with completion {subscription: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1919DD19C;
      v26[3] = &unk_1E572C9D8;
      v27 = v5;
      id v28 = v6;
      sub_1919DCEC4(v26, v28);

      uint64_t v9 = v27;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A3EAD8(v8, v17, v18, v19, v20, v21, v22, v23);
      }

      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32[0] = @"Subscription info is nil";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v25 = [v24 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v9];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v25);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3EA60(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)unselectSubscription:(id)a3 withCompletion:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Unselecting subscription with completion {subscription: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1919DD3B0;
      v26[3] = &unk_1E572C9D8;
      v27 = v5;
      id v28 = v6;
      sub_1919DCEC4(v26, v28);

      uint64_t v9 = v27;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A3EBC8(v8, v17, v18, v19, v20, v21, v22, v23);
      }

      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32[0] = @"Subscription info is nil";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v25 = [v24 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v9];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v25);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3EB50(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)setSelectedSubscriptions:(id)a3 withCompletion:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Setting selected subscriptions with completion {subscriptions: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1919DD5C4;
      v26[3] = &unk_1E572C9D8;
      v27 = v5;
      id v28 = v6;
      sub_1919DCEC4(v26, v28);

      uint64_t v9 = v27;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A3ECB8(v8, v17, v18, v19, v20, v21, v22, v23);
      }

      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32[0] = @"Subscription infos is nil";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v25 = [v24 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v9];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v25);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3EC40(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)removeTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Removing temporary phone alias with completion {alias: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1919DD7E0;
      v26[3] = &unk_1E572A990;
      id v28 = v6;
      id v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:v26];

      uint64_t v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A3EDA8(v8, v17, v18, v19, v20, v21, v22, v23);
      }

      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32[0] = @"Alias is nil";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v25 = [v24 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v9];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v25);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3ED30(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)disableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Disabling temporary phone alias with completion {alias: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1919DDB14;
      v26[3] = &unk_1E572A990;
      id v28 = v6;
      id v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:v26];

      uint64_t v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A3EF00(v8, v17, v18, v19, v20, v21, v22, v23);
      }

      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32[0] = @"Alias is nil";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v25 = [v24 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v9];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v25);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3EE88(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)enableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Enabling temporary phone alias with completion {alias: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1919DDE48;
      v26[3] = &unk_1E572A990;
      id v28 = v6;
      id v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:v26];

      uint64_t v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A3EFF0(v8, v17, v18, v19, v20, v21, v22, v23);
      }

      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32[0] = @"Alias is nil";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v25 = [v24 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v9];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v25);
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3EF78(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)requestUnselectedTemporaryPhoneAliasesWithError:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6C3B8] registration];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting unselected temporary phone aliases with completion", buf, 2u);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1919DE068;
    v13[3] = &unk_1E572C9B0;
    uint64_t v14 = v3;
    sub_1919DCEC4(v13, v14);
    id v5 = v14;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_191A3F068(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (id)selectedSubscriptionsWithError:(id *)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_191918770;
  id v27 = sub_1919185D8;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_191918770;
  uint64_t v21 = sub_1919185D8;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting selected subscriptions synchronously", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919DE2C0;
  v11[3] = &unk_1E572CA28;
  v11[4] = &v17;
  v11[5] = &v23;
  v11[6] = &v13;
  [(IDSPhoneSubscriptionSelector *)self _performSyncAction:v11];
  if (!*((unsigned char *)v14 + 24))
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:100 userInfo:0];
    uint64_t v7 = (void *)v24[5];
    v24[5] = v6;
  }
  if (a3)
  {
    uint64_t v8 = (void *)v24[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v9;
}

- (id)selectSubscription:(id)a3 withError:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = sub_191918770;
    v45 = sub_1919185D8;
    id v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_191918770;
    v39 = sub_1919185D8;
    id v40 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Selecting subscription synchronously", buf, 2u);
    }

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = sub_1919DE734;
    uint64_t v25 = &unk_1E572CA50;
    id v26 = v6;
    id v27 = &v35;
    id v28 = &v41;
    v29 = &v31;
    [(IDSPhoneSubscriptionSelector *)self _performSyncAction:&v22];
    if (!*((unsigned char *)v32 + 24))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IDSPhoneSubscriptionSelectorErrorDomain", 100, 0, v22, v23, v24, v25);
      id v9 = (void *)v42[5];
      v42[5] = v8;
    }
    if (a4)
    {
      uint64_t v10 = (void *)v42[5];
      if (v10) {
        *a4 = v10;
      }
    }
    a4 = (id *)(id)v36[5];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3F0E0(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a4)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28228];
      v48[0] = @"Subscription info is nil";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      *a4 = [v19 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v20];

      a4 = 0;
    }
  }

  return a4;
}

- (id)unselectSubscription:(id)a3 withError:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = sub_191918770;
    v45 = sub_1919185D8;
    id v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_191918770;
    v39 = sub_1919185D8;
    id v40 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Unselecting subscription synchronously", buf, 2u);
    }

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = sub_1919DEBAC;
    uint64_t v25 = &unk_1E572CA50;
    id v26 = v6;
    id v27 = &v35;
    id v28 = &v41;
    v29 = &v31;
    [(IDSPhoneSubscriptionSelector *)self _performSyncAction:&v22];
    if (!*((unsigned char *)v32 + 24))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IDSPhoneSubscriptionSelectorErrorDomain", 100, 0, v22, v23, v24, v25);
      id v9 = (void *)v42[5];
      v42[5] = v8;
    }
    if (a4)
    {
      uint64_t v10 = (void *)v42[5];
      if (v10) {
        *a4 = v10;
      }
    }
    a4 = (id *)(id)v36[5];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3F158(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a4)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28228];
      v48[0] = @"Subscription info is nil";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      *a4 = [v19 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v20];

      a4 = 0;
    }
  }

  return a4;
}

- (id)setSelectedSubscriptions:(id)a3 withError:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = sub_191918770;
    v45 = sub_1919185D8;
    id v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_191918770;
    v39 = sub_1919185D8;
    id v40 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Setting selected subscriptions synchronously", buf, 2u);
    }

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = sub_1919DF024;
    uint64_t v25 = &unk_1E572CA50;
    id v26 = v6;
    id v27 = &v35;
    id v28 = &v41;
    v29 = &v31;
    [(IDSPhoneSubscriptionSelector *)self _performSyncAction:&v22];
    if (!*((unsigned char *)v32 + 24))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IDSPhoneSubscriptionSelectorErrorDomain", 100, 0, v22, v23, v24, v25);
      id v9 = (void *)v42[5];
      v42[5] = v8;
    }
    if (a4)
    {
      uint64_t v10 = (void *)v42[5];
      if (v10) {
        *a4 = v10;
      }
    }
    a4 = (id *)(id)v36[5];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3F1D0(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a4)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28228];
      v48[0] = @"Subscription info is nil";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      *a4 = [v19 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v20];

      a4 = 0;
    }
  }

  return a4;
}

- (BOOL)removeTemporaryPhoneAlias:(id)a3 withError:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = sub_191918770;
    v42 = sub_1919185D8;
    id v43 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v6;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Removing temporary phone alias synchronously {alias: %@}", buf, 0xCu);
    }

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = sub_1919DF46C;
    uint64_t v25 = &unk_1E572CA50;
    id v26 = v6;
    id v27 = &v34;
    id v28 = &v38;
    v29 = &v30;
    [(IDSPhoneSubscriptionSelector *)self _performSyncAction:&v22];
    if (!*((unsigned char *)v31 + 24))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IDSPhoneSubscriptionSelectorErrorDomain", 100, 0, v22, v23, v24, v25);
      id v9 = (void *)v39[5];
      v39[5] = v8;
    }
    if (a4)
    {
      uint64_t v10 = (void *)v39[5];
      if (v10) {
        *a4 = v10;
      }
    }
    LOBYTE(a4) = *((unsigned char *)v35 + 24) != 0;

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3F248(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a4)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28228];
      v47[0] = @"Alias is nil";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      *a4 = [v19 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v20];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (BOOL)enableTemporaryPhoneAlias:(id)a3 withError:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = sub_191918770;
    v42 = sub_1919185D8;
    id v43 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v6;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Enabling temporary phone alias synchronously {alias: %@}", buf, 0xCu);
    }

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = sub_1919DF8A0;
    uint64_t v25 = &unk_1E572CA50;
    id v26 = v6;
    id v27 = &v34;
    id v28 = &v38;
    v29 = &v30;
    [(IDSPhoneSubscriptionSelector *)self _performSyncAction:&v22];
    if (!*((unsigned char *)v31 + 24))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IDSPhoneSubscriptionSelectorErrorDomain", 100, 0, v22, v23, v24, v25);
      id v9 = (void *)v39[5];
      v39[5] = v8;
    }
    if (a4)
    {
      uint64_t v10 = (void *)v39[5];
      if (v10) {
        *a4 = v10;
      }
    }
    LOBYTE(a4) = *((unsigned char *)v35 + 24) != 0;

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3F2C0(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a4)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28228];
      v47[0] = @"Alias is nil";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      *a4 = [v19 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v20];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (BOOL)disableTemporaryPhoneAlias:(id)a3 withError:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = sub_191918770;
    v42 = sub_1919185D8;
    id v43 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    uint64_t v7 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v6;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Disabling temporary phone alias synchronously {alias: %@}", buf, 0xCu);
    }

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = sub_1919DFCD4;
    uint64_t v25 = &unk_1E572CA50;
    id v26 = v6;
    id v27 = &v34;
    id v28 = &v38;
    v29 = &v30;
    [(IDSPhoneSubscriptionSelector *)self _performSyncAction:&v22];
    if (!*((unsigned char *)v31 + 24))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IDSPhoneSubscriptionSelectorErrorDomain", 100, 0, v22, v23, v24, v25);
      id v9 = (void *)v39[5];
      v39[5] = v8;
    }
    if (a4)
    {
      uint64_t v10 = (void *)v39[5];
      if (v10) {
        *a4 = v10;
      }
    }
    LOBYTE(a4) = *((unsigned char *)v35 + 24) != 0;

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3F338(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a4)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28228];
      v47[0] = @"Alias is nil";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      *a4 = [v19 errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:300 userInfo:v20];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (id)unselectedTemporaryPhoneAliasesWithError:(id *)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_191918770;
  id v27 = sub_1919185D8;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_191918770;
  uint64_t v21 = sub_1919185D8;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting unselected temporary aliases synchronously", buf, 2u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919E0040;
  v11[3] = &unk_1E572CA28;
  v11[4] = &v17;
  v11[5] = &v23;
  v11[6] = &v13;
  [(IDSPhoneSubscriptionSelector *)self _performSyncAction:v11];
  if (!*((unsigned char *)v14 + 24))
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSPhoneSubscriptionSelectorErrorDomain" code:100 userInfo:0];
    uint64_t v7 = (void *)v24[5];
    v24[5] = v6;
  }
  if (a3)
  {
    uint64_t v8 = (void *)v24[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v9;
}

- (void)_performSyncAction:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id syncDaemonController = self->_syncDaemonController;
  if (!syncDaemonController)
  {
    id syncDaemonControllerBuilder = (void (**)(id, void *))self->_syncDaemonControllerBuilder;
    uint64_t v7 = +[IDSInternalQueueController sharedInstance];
    uint64_t v8 = [v7 queue];
    id v9 = syncDaemonControllerBuilder[2](syncDaemonControllerBuilder, v8);
    id v10 = self->_syncDaemonController;
    self->_id syncDaemonController = v9;

    id syncDaemonController = self->_syncDaemonController;
  }
  uint64_t v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x3032000000;
  v23[2] = sub_191918770;
  v23[3] = sub_1919185D8;
  id v24 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1919E0350;
  v21[3] = &unk_1E572A9D8;
  v21[4] = &v22;
  uint64_t v11 = [syncDaemonController registrationCollaboratorWithErrorHandler:v21];
  if (*(void *)(v23[0] + 40))
  {
    id v12 = self->_syncDaemonController;
    self->_id syncDaemonController = 0;

    uint64_t v13 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A3F3B0((uint64_t)v23, v13, v14, v15, v16, v17, v18, v19);
    }

    uint64_t v11 = 0;
    uint64_t v20 = *(void *)(v23[0] + 40);
  }
  else
  {
    uint64_t v20 = 0;
  }
  v4[2](v4, v11, v20);

  _Block_object_dispose(&v22, 8);
}

- (IDSXPCDaemonController)syncDaemonController
{
  return (IDSXPCDaemonController *)self->_syncDaemonController;
}

- (void)setSyncDaemonController:(id)a3
{
}

- (id)syncDaemonControllerBuilder
{
  return self->_syncDaemonControllerBuilder;
}

- (void)setSyncDaemonControllerBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_syncDaemonControllerBuilder, 0);

  objc_storeStrong(&self->_syncDaemonController, 0);
}

@end