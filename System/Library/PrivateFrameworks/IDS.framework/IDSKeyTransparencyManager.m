@interface IDSKeyTransparencyManager
- (IDSKeyTransparencyManager)init;
- (NSDictionary)applicationToVerificationInfoProviders;
- (id)verificationInfoProviderForApplication:(id)a3;
- (id)verificationInfoProviderIdForApplication:(id)a3;
- (void)cacheClearRequest:(id)a3;
- (void)fetchKTRegistrationStatusWithCompletion:(id)a3;
- (void)getCurrentRegistrationStateWithCompletion:(id)a3;
- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4;
- (void)peerVerificationFinishedWithResults:(id)a3;
- (void)registrationDataNeedsUpdate;
- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4;
- (void)sendOptInUpdateForApplicationsOptInState:(id)a3 withCompletion:(id)a4;
- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4;
- (void)setApplicationToVerificationInfoProviders:(id)a3;
@end

@implementation IDSKeyTransparencyManager

- (IDSKeyTransparencyManager)init
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)IDSKeyTransparencyManager;
  v2 = [(IDSKeyTransparencyManager *)&v18 init];
  if (v2)
  {
    v3 = sub_191994FB0();
    v19[0] = v3;
    v4 = [IDSKTVerificationInfoProvider alloc];
    v5 = sub_191994FB0();
    v6 = [(IDSKTVerificationInfoProvider *)v4 initWithApplicationIdentifier:v5];
    v20[0] = v6;
    v7 = sub_1919950BC();
    v19[1] = v7;
    v8 = [IDSKTVerificationInfoProvider alloc];
    v9 = sub_1919950BC();
    v10 = [(IDSKTVerificationInfoProvider *)v8 initWithApplicationIdentifier:v9];
    v20[1] = v10;
    v11 = sub_1919951C8();
    v19[2] = v11;
    v12 = [IDSKTVerificationInfoProvider alloc];
    v13 = sub_1919951C8();
    v14 = [(IDSKTVerificationInfoProvider *)v12 initWithApplicationIdentifier:v13];
    v20[2] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    applicationToVerificationInfoProviders = v2->_applicationToVerificationInfoProviders;
    v2->_applicationToVerificationInfoProviders = (NSDictionary *)v15;
  }
  return v2;
}

- (id)verificationInfoProviderForApplication:(id)a3
{
  return [(NSDictionary *)self->_applicationToVerificationInfoProviders objectForKeyedSubscript:a3];
}

- (id)verificationInfoProviderIdForApplication:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_verificationInfoProviderForApplication_);
}

- (void)getKeyTransparencyOptInEligiblityForApplication:(id)a3 withCompletion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] KeyTransparency];
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Fetching KT eligibility with completion {application: %@}", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = sub_191995568;
      v31 = &unk_1E572B9C8;
      id v32 = v5;
      id v9 = v6;
      id v33 = v9;
      v10 = &v28;
      id v11 = v9;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v35 = sub_191996B44;
      v36 = &unk_1E572A398;
      id v37 = v11;
      v38 = v10;
      +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", &buf, v28, v29, v30, v31);

      v12 = v32;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A363DC(v8, v21, v22, v23, v24, v25, v26, v27);
      }

      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSKeyTransparencyManagerErrorDomain" code:200 userInfo:0];
      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v12);
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F6B460] KeyTransparency];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A36364(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSKeyTransparencyManagerErrorDomain" code:200 userInfo:0];
    MEMORY[0x10](0, 0, 0, v12);
  }
}

- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] KeyTransparency];
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Updating IDS Server with KT Opt in Info {optInInfo: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_19199578C;
      v26[3] = &unk_1E572A990;
      id v28 = v6;
      id v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:v26];

      id v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A364CC(v8, v19, v20, v21, v22, v23, v24, v25);
      }

      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSKeyTransparencyManagerErrorDomain" code:200 userInfo:0];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F6B460] KeyTransparency];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A36454(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSKeyTransparencyManagerErrorDomain" code:200 userInfo:0];
    MEMORY[0x10](0, 0, v9, v18);
  }
}

- (void)sendOptInUpdateForApplicationsOptInState:(id)a3 withCompletion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] KeyTransparency];
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Updating IDS Server with KT Opt in Info {optInInfo: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_191995B90;
      v26[3] = &unk_1E572A990;
      id v28 = v6;
      id v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:v26];

      id v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A365BC(v8, v17, v18, v19, v20, v21, v22, v23);
      }

      id v24 = objc_alloc(MEMORY[0x1E4F6B4C8]);
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSKeyTransparencyManagerErrorDomain" code:200 userInfo:0];
      uint64_t v25 = (void *)[v24 initWithSuccess:0 serverProvidedSMT:0 error:v9];
      (*((void (**)(id, void *))v6 + 2))(v6, v25);
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F6B460] KeyTransparency];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A36544(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] KeyTransparency];
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v5;
        _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Updating IDS Server with KT Opt In/Out Request {optInOutRequest: %@}", buf, 0xCu);
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_191995ED4;
      v26[3] = &unk_1E572A990;
      id v28 = v6;
      id v27 = v5;
      +[IDSXPCDaemonController performDaemonControllerTask:v26];

      id v9 = v28;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A366AC(v8, v17, v18, v19, v20, v21, v22, v23);
      }

      id v24 = objc_alloc(MEMORY[0x1E4F6B4C8]);
      id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IDSKeyTransparencyManagerErrorDomain" code:200 userInfo:0];
      uint64_t v25 = (void *)[v24 initWithSuccess:0 optedInOutURIs:0 serverSMTByURI:0 error:v9];
      (*((void (**)(id, void *))v6 + 2))(v6, v25);
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F6B460] KeyTransparency];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A36634(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)fetchKTRegistrationStatusWithCompletion:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1919960E8;
  v5[3] = &unk_1E572A940;
  id v6 = v3;
  id v4 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:v5];
}

- (void)registrationDataNeedsUpdate
{
}

- (void)peerVerificationFinishedWithResults:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6B460] KeyTransparency];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Received peerVerificationFinishedWithResults notification from Transparency", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919963C0;
  v6[3] = &unk_1E572A060;
  id v7 = v3;
  id v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:v6];
}

- (void)cacheClearRequest:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6B460] KeyTransparency];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Transparency requested to clear IDS query cache. { Request: %@ }", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191996598;
  v6[3] = &unk_1E572A060;
  id v7 = v3;
  id v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:v6];
}

- (void)getCurrentRegistrationStateWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6B460] KeyTransparency];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Transparency requested our current KT registration state.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191996738;
  v6[3] = &unk_1E572A940;
  id v7 = v3;
  id v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:v6];
}

- (NSDictionary)applicationToVerificationInfoProviders
{
  return self->_applicationToVerificationInfoProviders;
}

- (void)setApplicationToVerificationInfoProviders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end