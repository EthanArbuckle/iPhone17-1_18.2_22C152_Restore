@interface BCSURLNormalizer
+ (id)normalizedURLForURL:(id)a3;
@end

@implementation BCSURLNormalizer

+ (id)normalizedURLForURL:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = ABSLogCommon();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v79 = 0;
    v18 = "Normalizing URL - Step 1 - input URL is nil";
    v19 = (uint8_t *)&v79;
LABEL_13:
    _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    goto LABEL_14;
  }
  v5 = [v3 scheme];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    v9 = ABSLogCommon();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v78 = 0;
    v18 = "Normalizing URL - Step 2 - URL has nil scheme";
    v19 = (uint8_t *)&v78;
    goto LABEL_13;
  }
  v7 = [v4 host];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    v9 = ABSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Normalizing URL - Step 2 - URL has nil host";
      v19 = buf;
      goto LABEL_13;
    }
LABEL_14:
    v20 = 0;
    goto LABEL_25;
  }
  v9 = [v4 standardizedURL];
  if (v9)
  {
    v10 = [MEMORY[0x263F08BA0] componentsWithURL:v9 resolvingAgainstBaseURL:0];
    v11 = [v10 percentEncodedFragment];
    v12 = [v10 encodedHost];
    v13 = [v12 lowercaseString];

    v14 = [v10 percentEncodedPassword];
    v15 = [v10 percentEncodedPath];
    v68 = [v10 port];
    v16 = [v10 percentEncodedQuery];
    if ([v16 length])
    {
      v17 = [v10 query];
    }
    else
    {
      v17 = 0;
    }
    v62 = v17;

    v22 = [v10 scheme];
    v51 = [v22 lowercaseString];

    v56 = v10;
    v67 = [v10 percentEncodedUser];
    v74 = [v11 stringByRemovingPercentEncoding];
    v73 = [v13 stringByRemovingPercentEncoding];
    [v14 stringByRemovingPercentEncoding];
    v23 = v64 = v14;
    v72 = [v15 stringByRemovingPercentEncoding];
    v71 = [v17 stringByRemovingPercentEncoding];
    v70 = [v67 stringByRemovingPercentEncoding];
    uint64_t v24 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
    uint64_t v25 = [MEMORY[0x263F08708] URLHostAllowedCharacterSet];
    [MEMORY[0x263F08708] URLPasswordAllowedCharacterSet];
    uint64_t v26 = v63 = v15;
    [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    uint64_t v27 = v66 = v11;
    uint64_t v28 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
    uint64_t v29 = [MEMORY[0x263F08708] URLUserAllowedCharacterSet];
    v60 = (void *)v24;
    [v74 stringByAddingPercentEncodingWithAllowedCharacters:v24];
    v30 = v65 = v13;
    v59 = (void *)v25;
    v50 = [v73 stringByAddingPercentEncodingWithAllowedCharacters:v25];
    v61 = v23;
    v57 = (void *)v26;
    v49 = [v23 stringByAddingPercentEncodingWithAllowedCharacters:v26];
    v53 = (void *)v27;
    v31 = [v72 stringByAddingPercentEncodingWithAllowedCharacters:v27];
    v32 = [v31 stringByRemovingOccurancesOfCharacter:@"/" fromPosition:1];

    v55 = (void *)v28;
    v33 = [v71 stringByAddingPercentEncodingWithAllowedCharacters:v28];
    v54 = (void *)v29;
    v34 = [v70 stringByAddingPercentEncodingWithAllowedCharacters:v29];
    v52 = v32;
    v35 = [v32 stringByRemovingOccurancesOfCharacter:@"/" fromPosition:1];
    v36 = [v35 stringByRemovingOccurancesOfCharacter:@"?" fromPosition:1];

    id v37 = v30;
    id v38 = v34;
    id v69 = v68;
    id v39 = v33;
    id v40 = v36;
    id v41 = v49;
    id v42 = v50;
    id v43 = v51;
    self;
    id v44 = objc_alloc_init(MEMORY[0x263F08BA0]);
    [v44 setPercentEncodedFragment:v37];

    [v44 setEncodedHost:v42];
    [v44 setPercentEncodedPassword:v41];

    [v44 setPercentEncodedPath:v40];
    [v44 setPercentEncodedQuery:v39];

    [v44 setPercentEncodedUser:v38];
    [v44 setScheme:v43];
    v58 = v43;

    v45 = v37;
    [v44 setPort:v69];

    v20 = [v44 URL];

    v46 = v67;
    if (!v20)
    {
      v47 = ABSLogCommon();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v75 = 0;
        _os_log_impl(&dword_2154F4000, v47, OS_LOG_TYPE_DEFAULT, "Normalizing URL - Step 5 - normalizedURL is nil", v75, 2u);
      }

      v46 = v67;
    }

    v21 = v56;
  }
  else
  {
    v21 = ABSLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v76 = 0;
      _os_log_impl(&dword_2154F4000, v21, OS_LOG_TYPE_DEFAULT, "Normalizing URL - Step 2 - standardizedURLString is nil", v76, 2u);
    }
    v20 = 0;
  }

LABEL_25:

  return v20;
}

@end