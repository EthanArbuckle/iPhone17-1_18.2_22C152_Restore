@interface EKParticipantForSorting
+ (id)_cache;
+ (id)participantForSortingWithEKParticipant:(id)a3;
+ (id)participantsForSortingWithEKParticipants:(id)a3;
- (BOOL)isEmail;
- (BOOL)isPhone;
- (BOOL)participantIsOptional:(id)a3;
- (NSString)cachedDisplayName;
- (NSString)firstName;
- (NSString)lastName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayName;
- (id)participant;
- (int64_t)compare:(id)a3;
- (int64_t)compareByContactNames:(id)a3;
- (int64_t)compareByEmailThenByContactName:(id)a3;
- (void)setCachedDisplayName:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setIsEmail:(BOOL)a3;
- (void)setIsPhone:(BOOL)a3;
- (void)setLastName:(id)a3;
@end

@implementation EKParticipantForSorting

+ (id)_cache
{
  if (_cache_onceToken != -1) {
    dispatch_once(&_cache_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)_cache_s_participantCache;

  return v2;
}

void __33__EKParticipantForSorting__cache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_cache_s_participantCache;
  _cache_s_participantCache = v0;

  [(id)_cache_s_participantCache setCountLimit:1000];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = (id)[v3 addObserverForName:*MEMORY[0x1E4F1AF80] object:0 queue:0 usingBlock:&__block_literal_global_5];
}

uint64_t __33__EKParticipantForSorting__cache__block_invoke_2()
{
  return [(id)_cache_s_participantCache removeAllObjects];
}

+ (id)participantForSortingWithEKParticipant:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v10 = a3;
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = [v4 arrayWithObjects:&v10 count:1];

    v7 = objc_msgSend(a1, "participantsForSortingWithEKParticipants:", v6, v10, v11);
    v8 = [v7 firstObject];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)participantsForSortingWithEKParticipants:(id)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __68__EKParticipantForSorting_participantsForSortingWithEKParticipants___block_invoke;
  v63[3] = &unk_1E5B973F8;
  id v55 = a1;
  id v67 = a1;
  id v57 = v7;
  id v64 = v57;
  id v9 = v8;
  id v65 = v9;
  id v10 = v6;
  id v66 = v10;
  [v5 enumerateObjectsUsingBlock:v63];
  uint64_t v11 = (void *)[v5 mutableCopy];

  v53 = v9;
  [v11 removeObjectsAtIndexes:v9];
  v52 = v11;
  v12 = (void *)[v11 copy];
  v13 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v69[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];

  v15 = [MEMORY[0x1E4F576B0] defaultProvider];
  v58 = v10;
  v16 = [v10 allValues];
  v51 = (void *)v14;
  v56 = [v15 unifiedContactsDictionaryForHandleStrings:v16 keysToFetch:v14];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v12;
  uint64_t v17 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v60 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v22 = [v58 objectForKeyedSubscript:v21];
        if (v22)
        {
          v23 = [v56 objectForKeyedSubscript:v22];
          v24 = [v23 firstObject];
        }
        else
        {
          v24 = 0;
        }
        v25 = [v21 name];
        char v26 = objc_msgSend(v25, "cal_isPhoneNumber");

        if (!v24 && (v26 & 1) == 0)
        {
          v24 = objc_opt_new();
          v27 = (void *)MEMORY[0x1E4F57778];
          v28 = [v21 name];
          v29 = [v27 personNameComponentsFromString:v28];

          v30 = [v29 nickname];
          if (v30) {
            [v24 setNickname:v30];
          }
          v31 = [v29 familyName];

          if (v31) {
            [v24 setFamilyName:v31];
          }
          v32 = [v29 givenName];

          if (v32) {
            [v24 setGivenName:v32];
          }
          v33 = [v29 namePrefix];

          if (v33) {
            [v24 setNamePrefix:v33];
          }
          v34 = [v29 nameSuffix];

          if (v34) {
            [v24 setNameSuffix:v34];
          }
          v35 = [v29 middleName];

          if (v35) {
            [v24 setMiddleName:v35];
          }
        }
        if (v24) {
          [MEMORY[0x1E4F1B910] stringFromContact:v24 style:0];
        }
        else {
        v36 = [v21 name];
        }
        v37 = objc_alloc_init(EKParticipantForSorting);
        p_isa = (id *)&v37->super.isa;
        if (v36)
        {
          [(EKParticipantForSorting *)v37 setCachedDisplayName:v36];
          if (v26) {
            goto LABEL_41;
          }
        }
        else
        {
          v39 = [v21 name];

          if (v39)
          {
            v40 = [v21 name];
            [p_isa setCachedDisplayName:v40];

            if (v26) {
              goto LABEL_41;
            }
          }
          else
          {
            v41 = [v21 emailAddress];

            if (v41)
            {
              v42 = [v21 emailAddress];
              [p_isa setCachedDisplayName:v42];

              [p_isa setIsEmail:1];
              if (v26) {
                goto LABEL_41;
              }
            }
            else
            {
              v43 = [v21 phoneNumber];
              [p_isa setCachedDisplayName:v43];

              [p_isa setIsPhone:1];
              if (v26) {
                goto LABEL_41;
              }
            }
          }
        }
        v44 = [v24 givenName];

        if (v44)
        {
          v45 = [v24 givenName];
          [p_isa setFirstName:v45];
        }
        v46 = [v24 familyName];

        if (v46)
        {
          v47 = [v24 familyName];
          [p_isa setLastName:v47];
        }
LABEL_41:
        objc_storeWeak(p_isa + 1, v21);
        [v57 addObject:p_isa];
        if (v22)
        {
          v48 = [v55 _cache];
          [v48 setObject:p_isa forKey:v22];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v18);
  }

  id v49 = v57;
  return v49;
}

void __68__EKParticipantForSorting_participantsForSortingWithEKParticipants___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id obj = a2;
  id v5 = [obj emailAddress];

  if (v5)
  {
    uint64_t v6 = [obj emailAddress];
  }
  else
  {
    v7 = [obj phoneNumber];

    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v6 = [obj phoneNumber];
  }
  id v8 = (void *)v6;
  if (v6)
  {
    id v9 = [a1[7] _cache];
    objc_sync_enter(v9);
    id v10 = [a1[7] _cache];
    uint64_t v11 = [v10 objectForKey:v8];

    if (v11)
    {
      objc_storeWeak(v11 + 1, obj);
      objc_sync_exit(v9);

      [a1[4] addObject:v11];
      [a1[5] addIndex:a3];
    }
    else
    {
      objc_sync_exit(v9);

      [a1[6] setObject:v8 forKeyedSubscript:obj];
    }
  }
LABEL_10:
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)EKParticipantForSorting;
  v4 = [(EKParticipantForSorting *)&v9 description];
  cachedDisplayName = self->_cachedDisplayName;
  uint64_t v6 = CalBooleanAsString();
  v7 = [v3 stringWithFormat:@"[%@] Display name: [%@], isEmail: [%@]", v4, cachedDisplayName, v6];

  return v7;
}

- (id)participant
{
  id v3 = [(id)objc_opt_class() _cache];
  objc_sync_enter(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  objc_sync_exit(v3);

  return WeakRetained;
}

- (BOOL)isEmail
{
  return self->_isEmail;
}

- (id)displayName
{
  return self->_cachedDisplayName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  BOOL v6 = [(EKParticipantForSorting *)self participantIsOptional:WeakRetained];

  v7 = [v4 participant];
  BOOL v8 = [(EKParticipantForSorting *)self participantIsOptional:v7];

  if (!v6 || v8)
  {
    if (v6 || !v8) {
      int64_t v9 = [(EKParticipantForSorting *)self compareByEmailThenByContactName:v4];
    }
    else {
      int64_t v9 = -1;
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (BOOL)participantIsOptional:(id)a3
{
  return [a3 participantRole] == 2;
}

- (int64_t)compareByEmailThenByContactName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_isEmail)
  {
    if (![v4 isEmail])
    {
      int64_t v6 = 1;
      goto LABEL_11;
    }
    if (self->_isEmail)
    {
LABEL_8:
      if ([v5 isEmail])
      {
        v7 = [(EKParticipantForSorting *)self displayName];
        BOOL v8 = [v5 displayName];
        int64_t v6 = [v7 compare:v8 options:1];

        goto LABEL_11;
      }
LABEL_10:
      int64_t v6 = [(EKParticipantForSorting *)self compareByContactNames:v5];
      goto LABEL_11;
    }
  }
  if (([v5 isEmail] & 1) == 0)
  {
    if (!self->_isEmail) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  int64_t v6 = -1;
LABEL_11:

  return v6;
}

- (int64_t)compareByContactNames:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1B9A8];
  id v5 = a3;
  int64_t v6 = [v4 sharedDefaults];
  uint64_t v7 = [v6 sortOrder];

  if (v7 == 2)
  {
    BOOL v8 = self->_firstName;
    int64_t v9 = self->_lastName;
    id v10 = [v5 firstName];
    [v5 lastName];
  }
  else
  {
    BOOL v8 = self->_lastName;
    int64_t v9 = self->_firstName;
    id v10 = [v5 lastName];
    [v5 firstName];
  uint64_t v11 = };

  if (!v8 && v10) {
    goto LABEL_6;
  }
  if (v8 && !v10) {
    goto LABEL_9;
  }
  if (!v8 || !v10 || (int64_t v12 = [(NSString *)v8 compare:v10 options:1]) == NSOrderedSame)
  {
    if (!v9 && v11)
    {
LABEL_6:
      int64_t v12 = 1;
      goto LABEL_20;
    }
    if (v9 && !v11)
    {
LABEL_9:
      int64_t v12 = -1;
      goto LABEL_20;
    }
    int64_t v12 = 0;
    if (v9 && v11) {
      int64_t v12 = [(NSString *)v9 compare:v11 options:1];
    }
  }
LABEL_20:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[EKParticipantForSorting allocWithZone:a3] init];
  [(EKParticipantForSorting *)v4 setFirstName:self->_firstName];
  [(EKParticipantForSorting *)v4 setLastName:self->_lastName];
  [(EKParticipantForSorting *)v4 setCachedDisplayName:self->_cachedDisplayName];
  [(EKParticipantForSorting *)v4 setIsEmail:self->_isEmail];
  [(EKParticipantForSorting *)v4 setIsPhone:self->_isPhone];
  return v4;
}

- (void)setFirstName:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (NSString)cachedDisplayName
{
  return self->_cachedDisplayName;
}

- (void)setCachedDisplayName:(id)a3
{
}

- (void)setIsEmail:(BOOL)a3
{
  self->_isEmail = a3;
}

- (BOOL)isPhone
{
  return self->_isPhone;
}

- (void)setIsPhone:(BOOL)a3
{
  self->_isPhone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDisplayName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);

  objc_destroyWeak((id *)&self->_participant);
}

@end