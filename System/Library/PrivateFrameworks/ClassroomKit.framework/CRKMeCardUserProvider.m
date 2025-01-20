@interface CRKMeCardUserProvider
- (CRKCancelable)contactsSubscription;
- (CRKContactsPrimitives)contactsPrimitives;
- (CRKMeCardUserProvider)init;
- (CRKMeCardUserProvider)initWithContactsPrimitives:(id)a3;
- (CRKUser)user;
- (id)fetchCurrentUser;
- (void)beginObservingContacts;
- (void)fetchCurrentUser;
- (void)rebuildUser;
- (void)rebuildUserDebounced;
- (void)setContactsSubscription:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation CRKMeCardUserProvider

- (CRKMeCardUserProvider)init
{
  v3 = objc_opt_new();
  v4 = [(CRKMeCardUserProvider *)self initWithContactsPrimitives:v3];

  return v4;
}

- (CRKMeCardUserProvider)initWithContactsPrimitives:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKMeCardUserProvider;
  v6 = [(CRKMeCardUserProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactsPrimitives, a3);
    [(CRKMeCardUserProvider *)v7 beginObservingContacts];
    [(CRKMeCardUserProvider *)v7 rebuildUser];
  }

  return v7;
}

- (void)beginObservingContacts
{
  objc_initWeak(&location, self);
  v3 = [(CRKMeCardUserProvider *)self contactsPrimitives];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __47__CRKMeCardUserProvider_beginObservingContacts__block_invoke;
  v8 = &unk_2646F3D40;
  objc_copyWeak(&v9, &location);
  v4 = [v3 subscribeToContactsChanges:&v5];
  -[CRKMeCardUserProvider setContactsSubscription:](self, "setContactsSubscription:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__CRKMeCardUserProvider_beginObservingContacts__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rebuildUserDebounced];
}

- (void)rebuildUserDebounced
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_rebuildUser object:0];

  [(CRKMeCardUserProvider *)self performSelector:sel_rebuildUser withObject:0 afterDelay:0.200000003];
}

- (void)rebuildUser
{
  id v3 = [(CRKMeCardUserProvider *)self fetchCurrentUser];
  [(CRKMeCardUserProvider *)self setUser:v3];
}

- (id)fetchCurrentUser
{
  id v3 = _CRKLogGeneral_22();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "Rebuilding MeCard user", buf, 2u);
  }

  v4 = [(CRKMeCardUserProvider *)self contactsPrimitives];
  id v30 = 0;
  uint64_t v5 = [v4 fetchMeCardContactWithError:&v30];
  id v6 = v30;

  if (v5)
  {
    v7 = objc_opt_new();
    [v7 setUserIdentifier:@"TEMPORARY_ME_CARD_IDENTIFIER"];
    v8 = [v5 nickname];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [v5 nickname];
    }
    else
    {
      v20 = [v5 givenName];
      if ([v20 length])
      {
        v21 = [v5 familyName];
        uint64_t v22 = [v21 length];

        if (v22)
        {
          v11 = objc_opt_new();
          v23 = [v5 givenName];
          [v11 setGivenName:v23];

          v24 = [v5 familyName];
          [v11 setFamilyName:v24];

          v25 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v11 style:3 options:0];
          [v7 setDisplayName:v25];

          goto LABEL_7;
        }
      }
      else
      {
      }
      v26 = [v5 givenName];
      uint64_t v27 = [v26 length];

      if (v27)
      {
        uint64_t v10 = [v5 givenName];
      }
      else
      {
        v28 = [v5 familyName];
        uint64_t v29 = [v28 length];

        if (!v29) {
          goto LABEL_8;
        }
        uint64_t v10 = [v5 familyName];
      }
    }
    v11 = (void *)v10;
    [v7 setDisplayName:v10];
LABEL_7:

LABEL_8:
    v12 = [v5 givenName];
    [v7 setGivenName:v12];

    v13 = [v5 familyName];
    [v7 setFamilyName:v13];

    v14 = [v5 phoneticGivenName];
    [v7 setPhoneticGivenName:v14];

    v15 = [v5 phoneticFamilyName];
    [v7 setPhoneticFamilyName:v15];

    [v7 setUserSource:@"MeCard"];
    v16 = [v5 thumbnailImageData];
    [v7 setUserImageData:v16];

    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];
    [v7 setImageIdentifier:v18];

    goto LABEL_12;
  }
  v17 = _CRKLogGeneral_22();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    [(CRKMeCardUserProvider *)(uint64_t)v6 fetchCurrentUser];
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (CRKContactsPrimitives)contactsPrimitives
{
  return self->_contactsPrimitives;
}

- (CRKCancelable)contactsSubscription
{
  return self->_contactsSubscription;
}

- (void)setContactsSubscription:(id)a3
{
}

- (CRKUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_contactsSubscription, 0);

  objc_storeStrong((id *)&self->_contactsPrimitives, 0);
}

- (void)fetchCurrentUser
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "No me contact found in the contact store: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end