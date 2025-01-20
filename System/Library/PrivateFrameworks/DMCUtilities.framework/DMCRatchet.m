@interface DMCRatchet
+ (BOOL)isEnabled;
+ (id)_ratchetCalloutForOperation:(unint64_t)a3;
+ (id)_ratchetCountdownForOperation:(unint64_t)a3;
+ (id)_ratchetReasonForOperation:(unint64_t)a3;
+ (id)_ratchetStrictTextForOperation:(unint64_t)a3;
+ (id)_ratchetTextForOperation:(unint64_t)a3;
+ (id)_ratchetTitleForOperation:(unint64_t)a3;
+ (unint64_t)_responseFromRatchetResult:(id)a3 error:(id)a4;
+ (void)isAuthorizedForOperation:(unint64_t)a3 completion:(id)a4;
@end

@implementation DMCRatchet

+ (BOOL)isEnabled
{
  if (getLARatchetManagerClass())
  {
    v2 = [getLARatchetManagerClass() sharedInstance];
    char v3 = [v2 isFeatureEnabled];

    return v3;
  }
  else
  {
    v5 = *DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_ERROR, "LARatchetManager is unavailable", v6, 2u);
    }
    return 0;
  }
}

+ (void)isAuthorizedForOperation:(unint64_t)a3 completion:(id)a4
{
  v29[9] = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void))a4;
  if (([a1 isEnabled] & 1) == 0)
  {
    v17 = *DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "DMCRatchet is authorized because LARatchet is disabled";
      v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl(&dword_1A7863000, v19, v20, v18, buf, 2u);
    }
LABEL_11:
    v6[2](v6, 0);
    goto LABEL_15;
  }
  if (!getLARatchetClass())
  {
    v21 = *DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "DMCRatchet is authorized because LARatchet is unavailable";
      v19 = v21;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v24 = (void *)[objc_alloc((Class)getLARatchetClass()) initWithIdentifier:@"com.apple.devicemanagementclient.DMCRatchet"];
  v7 = (void *)MEMORY[0x1E4F1CA60];
  v28[0] = &unk_1EFD88790;
  v23 = [a1 _ratchetTitleForOperation:a3];
  v29[0] = v23;
  v28[1] = &unk_1EFD887A8;
  v8 = [a1 _ratchetTextForOperation:a3];
  v29[1] = v8;
  v28[2] = &unk_1EFD887C0;
  v9 = [a1 _ratchetStrictTextForOperation:a3];
  v29[2] = v9;
  v28[3] = &unk_1EFD887D8;
  v10 = [a1 _ratchetCountdownForOperation:a3];
  v29[3] = v10;
  v28[4] = &unk_1EFD887F0;
  v11 = [a1 _ratchetReasonForOperation:a3];
  v29[4] = v11;
  v28[5] = &unk_1EFD88808;
  v12 = [a1 _ratchetCalloutForOperation:a3];
  v29[5] = v12;
  v28[6] = &unk_1EFD88820;
  v13 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=ManagedConfigurationList"];
  v29[6] = v13;
  v29[7] = MEMORY[0x1E4F1CC38];
  v28[7] = &unk_1EFD88838;
  v28[8] = &unk_1EFD88850;
  v29[8] = MEMORY[0x1E4F1CC28];
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:9];
  v15 = [v7 dictionaryWithDictionary:v14];

  if (a3 == 1)
  {
    if (getLARatchetMaxEnablementGracePeriod())
    {
      v16 = [NSNumber numberWithInteger:getLARatchetMaxEnablementGracePeriod()];
      [v15 setObject:v16 forKeyedSubscript:&unk_1EFD88868];
    }
    else
    {
      v22 = *DMCLogObjects();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7863000, v22, OS_LOG_TYPE_ERROR, "DMCRatchet failed to softlink LARatchetMaxEnablementGracePeriod", buf, 2u);
      }
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50__DMCRatchet_isAuthorizedForOperation_completion___block_invoke;
  v25[3] = &unk_1E5CFE0E8;
  v26 = v6;
  [v24 armWithOptions:v15 completion:v25];

LABEL_15:
}

uint64_t __50__DMCRatchet_isAuthorizedForOperation_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = +[DMCRatchet _responseFromRatchetResult:a2 error:a3];
  v5 = *(uint64_t (**)(uint64_t, unint64_t))(v3 + 16);
  return v5(v3, v4);
}

+ (unint64_t)_responseFromRatchetResult:(id)a3 error:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:&unk_1EFD88808];

  if (!v7)
  {
    if (!v6)
    {
      v13 = *DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = (uint64_t)v5;
        _os_log_impl(&dword_1A7863000, v13, OS_LOG_TYPE_DEFAULT, "DMCRatchet is unauthorized with result: %{public}@", buf, 0xCu);
      }
      goto LABEL_31;
    }
    if ([v6 code] == 4)
    {
      v12 = *DMCLogObjects();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      v9 = "DMCRatchet is authorized because passcode is not set";
LABEL_13:
      v10 = v12;
      uint32_t v11 = 2;
      goto LABEL_14;
    }
    if ([v6 code] == 5)
    {
      v12 = *DMCLogObjects();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      v9 = "DMCRatchet is authorized because biometry is not enrolled";
      goto LABEL_13;
    }
    if ([v6 code] == 1)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v16 = objc_msgSend(v6, "underlyingErrors", 0);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            if ([*(id *)(*((void *)&v28 + 1) + 8 * i) code] == -2)
            {
              v27 = *DMCLogObjects();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A7863000, v27, OS_LOG_TYPE_DEFAULT, "DMCRatchet canceled by user", buf, 2u);
              }

              unint64_t v14 = 2;
              goto LABEL_16;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      v21 = *DMCLogObjects();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      v22 = v21;
      v23 = [v6 userInfo];
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = (uint64_t)v23;
      _os_log_impl(&dword_1A7863000, v22, OS_LOG_TYPE_DEFAULT, "DMCRatchet is unauthorized with generic error user info: %{public}@", buf, 0xCu);
    }
    else
    {
      v24 = *DMCLogObjects();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:
        unint64_t v14 = 1;
        goto LABEL_16;
      }
      v22 = v24;
      uint64_t v25 = [v6 code];
      v26 = [v6 userInfo];
      *(_DWORD *)buf = 134349314;
      uint64_t v33 = v25;
      __int16 v34 = 2114;
      v35 = v26;
      _os_log_impl(&dword_1A7863000, v22, OS_LOG_TYPE_DEFAULT, "DMCRatchet is unauthorized with error code %{public}ld and user info: %{public}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  v8 = *DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = (uint64_t)v5;
    v9 = "DMCRatchet is authorized with result: %{public}@";
    v10 = v8;
    uint32_t v11 = 12;
LABEL_14:
    _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
  }
LABEL_15:
  unint64_t v14 = 0;
LABEL_16:

  return v14;
}

+ (id)_ratchetTitleForOperation:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unint64_t v4 = @"DMC_SDP_RATCHET_TITLE_MDM_ENROLL";
  }
  else
  {
    unint64_t v4 = @"DMC_SDP_RATCHET_TITLE_INSTALL_PROFILE";
  }
  DMCLocalizedString(v4);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return a1;
}

+ (id)_ratchetTextForOperation:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unint64_t v4 = @"DMC_SDP_RATCHET_TEXT_MDM_ENROLL";
  }
  else
  {
    unint64_t v4 = @"DMC_SDP_RATCHET_TEXT_INSTALL_PROFILE";
  }
  DMCLocalizedString(v4);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return a1;
}

+ (id)_ratchetStrictTextForOperation:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unint64_t v4 = @"DMC_SDP_RATCHET_STRICT_TEXT_MDM_ENROLL";
  }
  else
  {
    unint64_t v4 = @"DMC_SDP_RATCHET_STRICT_TEXT_INSTALL_PROFILE";
  }
  DMCLocalizedString(v4);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return a1;
}

+ (id)_ratchetCountdownForOperation:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unint64_t v4 = @"DMC_SDP_RATCHET_COUNTDOWN_MDM_ENROLL";
  }
  else
  {
    unint64_t v4 = @"DMC_SDP_RATCHET_COUNTDOWN_INSTALL_PROFILE";
  }
  DMCLocalizedString(v4);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return a1;
}

+ (id)_ratchetReasonForOperation:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unint64_t v4 = @"DMC_SDP_RATCHET_REASON_MDM_ENROLL";
  }
  else
  {
    unint64_t v4 = @"DMC_SDP_RATCHET_REASON_INSTALL_PROFILE";
  }
  DMCLocalizedString(v4);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return a1;
}

+ (id)_ratchetCalloutForOperation:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unint64_t v4 = @"DMC_SDP_RATCHET_CALLOUT_MDM_ENROLL";
  }
  else
  {
    unint64_t v4 = @"DMC_SDP_RATCHET_CALLOUT_INSTALL_PROFILE";
  }
  DMCLocalizedString(v4);
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return a1;
}

@end