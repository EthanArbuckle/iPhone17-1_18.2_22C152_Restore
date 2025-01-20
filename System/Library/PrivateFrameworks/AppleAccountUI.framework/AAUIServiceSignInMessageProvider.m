@interface AAUIServiceSignInMessageProvider
+ (id)_messageStringForAMPService:(unint64_t)a3;
+ (id)_messageStringForService:(id)a3;
+ (id)_messageStringForSplitSignInWithServiceTypes:(id)a3;
+ (id)messageForConfiguration:(id)a3;
@end

@implementation AAUIServiceSignInMessageProvider

+ (id)messageForConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 splitSignIn])
  {
    v5 = [v4 serviceTypes];
    uint64_t v6 = [a1 _messageStringForSplitSignInWithServiceTypes:v5];
LABEL_5:
    v9 = (void *)v6;

    goto LABEL_7;
  }
  v7 = [v4 serviceType];
  v8 = (void *)*MEMORY[0x263F26D48];

  if (v7 != v8)
  {
    v5 = [v4 serviceType];
    uint64_t v6 = [a1 _messageStringForService:v5];
    goto LABEL_5;
  }
  v9 = objc_msgSend(a1, "_messageStringForAMPService:", objc_msgSend(v4, "ampServiceType"));
LABEL_7:

  return v9;
}

+ (id)_messageStringForSplitSignInWithServiceTypes:(id)a3
{
  int v3 = [a3 containsObject:*MEMORY[0x263F26D48]];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = v4;
  if (v3) {
    uint64_t v6 = @"SIGN_IN_SUBTITLE_SPLIT_STORE";
  }
  else {
    uint64_t v6 = @"SIGN_IN_SUBTITLE_SPLIT_ICLOUD";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_26BD39CD8 table:@"Localizable"];

  return v7;
}

+ (id)_messageStringForService:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Setting default subtitle.", v20, 2u);
    }
    goto LABEL_8;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F26D28]])
  {
    v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Setting iCloud subtitle.", buf, 2u);
    }

    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = v6;
    v8 = @"SIGN_IN_SUBTITLE_ICLOUD";
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F26D40]])
  {
    v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Setting iMessage subtitle.", v18, 2u);
    }

    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = v6;
    v8 = @"SIGN_IN_SUBTITLE_IMESSAGE";
    goto LABEL_21;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F26D30]])
  {
    v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Setting FaceTime subtitle.", v17, 2u);
    }

    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = v6;
    v8 = @"SIGN_IN_SUBTITLE_FACETIME";
    goto LABEL_21;
  }
  int v12 = [v4 isEqualToString:*MEMORY[0x263F26D38]];
  v13 = _AAUILogSystem();
  v9 = v13;
  if (!v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[AAUIServiceSignInMessageProvider _messageStringForService:]((uint64_t)v4, v9);
    }
LABEL_8:

    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = v6;
    v8 = @"SIGN_IN_SUBTITLE";
    goto LABEL_21;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Setting GameCenter subtitle.", v16, 2u);
  }

  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = v6;
  v8 = @"SIGN_IN_SUBTITLE_GAMECENTER";
LABEL_21:
  v14 = [v6 localizedStringForKey:v8 value:&stru_26BD39CD8 table:@"Localizable"];

  return v14;
}

+ (id)_messageStringForAMPService:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = _AAUILogSystem();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Setting App Store subtitle.", buf, 2u);
      }

      v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      v7 = @"SIGN_IN_SUBTITLE_STORE";
      goto LABEL_23;
    case 1uLL:
      v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Setting Apple TV subtitle.", v20, 2u);
      }

      v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      v7 = @"SIGN_IN_SUBTITLE_TV";
      goto LABEL_23;
    case 2uLL:
      v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Setting Apple Music subtitle.", v19, 2u);
      }

      v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      v7 = @"SIGN_IN_SUBTITLE_MUSIC";
      goto LABEL_23;
    case 3uLL:
      v10 = _AAUILogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Setting Apple Podcasts subtitle.", v18, 2u);
      }

      v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      v7 = @"SIGN_IN_SUBTITLE_PODCASTS";
      goto LABEL_23;
    case 4uLL:
      v11 = _AAUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Setting Apple Books subtitle.", v17, 2u);
      }

      v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      v7 = @"SIGN_IN_SUBTITLE_BOOKS";
      goto LABEL_23;
    case 5uLL:
      int v12 = _AAUILogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "Setting Apple News subtitle.", v16, 2u);
      }

      v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      v7 = @"SIGN_IN_SUBTITLE_NEWS";
      goto LABEL_23;
    case 6uLL:
      v13 = _AAUILogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Setting Apple Fitness+ subtitle.", v15, 2u);
      }

      v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      v7 = @"SIGN_IN_SUBTITLE_FITNESS";
LABEL_23:
      id v3 = [v5 localizedStringForKey:v7 value:&stru_26BD39CD8 table:@"Localizable"];

      break;
    default:
      break;
  }
  return v3;
}

+ (void)_messageStringForService:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Invalid service type (%{private}@) provided, please file a radar!", (uint8_t *)&v2, 0xCu);
}

@end