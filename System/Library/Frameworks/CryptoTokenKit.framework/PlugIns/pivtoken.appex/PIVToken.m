@interface PIVToken
- (BOOL)populateIdentityFromSmartCard:(id)a3 into:(id)a4 certificateTag:(unint64_t)a5 name:(id)a6 keyTag:(unint64_t)a7 name:(id)a8 sign:(BOOL)a9 suitableForLogin:(BOOL)a10 keyManagement:(BOOL)a11 constraint:(id)a12 error:(id *)a13;
- (PIVToken)initWithSmartCard:(id)a3 AID:(id)a4 PIVDriver:(id)a5 error:(id *)p_isa;
- (PIVTokenDriver)driver;
- (id)dataOfCertificate:(id)a3 smartCard:(id)a4 error:(id *)a5;
- (id)token:(id)a3 createSessionWithError:(id *)a4;
@end

@implementation PIVToken

- (id)dataOfCertificate:(id)a3 smartCard:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 recordsOfObject:v7 error:a5];
  v10 = v9;
  if (v9)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_1000043F4;
    v24 = sub_100004404;
    id v25 = 0;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000440C;
    v15[3] = &unk_100008310;
    v15[4] = &v20;
    v15[5] = &v16;
    [v9 enumerateObjectsUsingBlock:v15];
    v11 = (void *)v21[5];
    if (v11)
    {
      if (*((unsigned char *)v17 + 24))
      {
        id v12 = [v11 inflate];
      }
      else
      {
        id v12 = v11;
      }
      v13 = v12;
    }
    else if (a5)
    {
      +[NSError errorWithDomain:TKErrorDomain code:-6 userInfo:0];
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)populateIdentityFromSmartCard:(id)a3 into:(id)a4 certificateTag:(unint64_t)a5 name:(id)a6 keyTag:(unint64_t)a7 name:(id)a8 sign:(BOOL)a9 suitableForLogin:(BOOL)a10 keyManagement:(BOOL)a11 constraint:(id)a12 error:(id *)a13
{
  char v19 = (char)a13;
  id v20 = a4;
  id v21 = a6;
  id v45 = a8;
  id v22 = a12;
  id v23 = a3;
  v24 = +[TKBERTLVRecord dataForTag:a5];
  CFDataRef v25 = [(PIVToken *)self dataOfCertificate:v24 smartCard:v23 error:a13];

  if (v25)
  {
    SecCertificateRef v26 = SecCertificateCreateWithData(kCFAllocatorDefault, v25);
    if (!v26)
    {
      if (a13)
      {
        NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
        v37 = +[NSBundle mainBundle];
        v38 = [v37 localizedStringForKey:@"CORRUPTED_CERT" value:&stru_1000083D8 table:0];
        v47 = v38;
        v39 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        *a13 = +[NSError errorWithDomain:TKErrorDomain code:-3 userInfo:v39];

        char v19 = 0;
      }
      goto LABEL_25;
    }
    id v27 = [objc_alloc((Class)TKTokenKeychainCertificate) initWithCertificate:v26 objectID:v24];
    v28 = v27;
    if (!v27)
    {
      char v19 = 0;
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    id v44 = v22;
    [v27 setName:v21];
    v29 = [PIVTokenKeychainKey alloc];
    v30 = +[NSNumber numberWithUnsignedLongLong:a7];
    v31 = [v28 objectID];
    v32 = [(PIVTokenKeychainKey *)v29 initWithCertificate:v26 objectID:v30 certificateID:v31];

    char v19 = v32 != 0;
    if (!v32)
    {
LABEL_23:

      id v22 = v44;
      goto LABEL_24;
    }
    [(PIVTokenKeychainKey *)v32 setName:v45];
    v43 = +[NSMutableDictionary dictionary];
    [(PIVTokenKeychainKey *)v32 setCanSign:a9];
    [(PIVTokenKeychainKey *)v32 setSuitableForLogin:a10];
    if (a9) {
      [v43 setObject:v44 forKeyedSubscript:&off_100008688];
    }
    v33 = [(PIVTokenKeychainKey *)v32 keyType];
    unsigned int v34 = [v33 isEqual:kSecAttrKeyTypeRSA];

    if (v34)
    {
      [(PIVTokenKeychainKey *)v32 setCanDecrypt:a11];
      if (!a11)
      {
LABEL_22:
        [(PIVTokenKeychainKey *)v32 setConstraints:v43];
        [v20 addObject:v28];
        [v20 addObject:v32];

        goto LABEL_23;
      }
      v35 = &off_1000086A0;
    }
    else
    {
      v40 = [(PIVTokenKeychainKey *)v32 keyType];
      unsigned int v41 = [v40 isEqual:kSecAttrKeyTypeECSECPrimeRandom];

      if (!v41) {
        goto LABEL_22;
      }
      [(PIVTokenKeychainKey *)v32 setCanPerformKeyExchange:a11];
      if (!a11) {
        goto LABEL_22;
      }
      v35 = &off_1000086B8;
    }
    [v43 setObject:v44 forKeyedSubscript:v35];
    goto LABEL_22;
  }
  if (a13)
  {
    v36 = [*a13 domain];
    if ([v36 isEqual:TKErrorDomain]) {
      char v19 = [*a13 code] == (id)-6;
    }
    else {
      char v19 = 0;
    }
  }
LABEL_26:

  return v19;
}

- (PIVToken)initWithSmartCard:(id)a3 AID:(id)a4 PIVDriver:(id)a5 error:(id *)p_isa
{
  id v91 = a3;
  id v86 = a4;
  id v87 = a5;
  v10 = +[TKBERTLVRecord dataForTag:6275330];
  v88 = [v91 recordsOfObject:v10 error:p_isa];

  if (v88)
  {
    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x3032000000;
    v108 = sub_1000043F4;
    v109 = sub_100004404;
    id v110 = 0;
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_1000052EC;
    v104[3] = &unk_100008338;
    v104[4] = &v105;
    [v88 enumerateObjectsUsingBlock:v104];
    v11 = (void *)v106[5];
    if (v11 && [v11 length])
    {
      uint64_t v12 = v106[5];
      v103.receiver = self;
      v103.super_class = (Class)PIVToken;
      v13 = [(PIVToken *)&v103 initWithSmartCard:v91 AID:v86 instanceID:v12 tokenDriver:v87];
      if (v13)
      {
        v89 = v13;
        uint64_t v99 = 0;
        v100 = &v99;
        uint64_t v101 = 0x2020000000;
        uint64_t v102 = 0;
        v14 = +[TKBERTLVRecord dataForTag:6275340];
        id v98 = 0;
        v85 = [v91 recordsOfObject:v14 error:&v98];
        id v15 = v98;

        if (v85)
        {
          v97[0] = _NSConcreteStackBlock;
          v97[1] = 3221225472;
          v97[2] = sub_100005380;
          v97[3] = &unk_100008338;
          v97[4] = &v99;
          [v85 enumerateObjectsUsingBlock:v97];
        }
        else
        {
          v31 = sub_100003FF0();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_100005958();
          }

          id v15 = 0;
        }
        v90 = +[NSMutableArray arrayWithCapacity:v100[3] + 4];
        v32 = +[NSBundle mainBundle];
        v33 = [v32 localizedStringForKey:@"PIV_AUTH_CERT" value:&stru_1000083D8 table:0];
        unsigned int v34 = +[NSBundle mainBundle];
        v35 = [v34 localizedStringForKey:@"PIV_AUTH_KEY" value:&stru_1000083D8 table:0];
        id v96 = v15;
        BYTE2(v80) = 0;
        LOWORD(v80) = 257;
        unsigned __int8 v36 = -[PIVToken populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:](v89, "populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:", v91, v90, 6275333, v33, 154, v35, v80, @"PIN", &v96);
        id v37 = v96;

        if ((v36 & 1) == 0)
        {
          v38 = sub_100003FF0();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_1000058F0();
          }

          id v37 = 0;
        }
        v39 = +[NSBundle mainBundle];
        v40 = [v39 localizedStringForKey:@"CARD_AUTH_CERT" value:&stru_1000083D8 table:0];
        unsigned int v41 = +[NSBundle mainBundle];
        v42 = [v41 localizedStringForKey:@"CARD_AUTH_KEY" value:&stru_1000083D8 table:0];
        id v95 = v37;
        BYTE2(v81) = 0;
        LOWORD(v81) = 1;
        unsigned __int8 v43 = -[PIVToken populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:](v89, "populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:", v91, v90, 6275329, v40, 158, v42, v81, &__kCFBooleanTrue, &v95);
        id v44 = v95;

        if ((v43 & 1) == 0)
        {
          id v45 = sub_100003FF0();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_100005888();
          }

          id v44 = 0;
        }
        NSErrorUserInfoKey v46 = +[NSBundle mainBundle];
        v47 = [v46 localizedStringForKey:@"DIG_SIG_CERT" value:&stru_1000083D8 table:0];
        v48 = +[NSBundle mainBundle];
        v49 = [v48 localizedStringForKey:@"DIG_SIG_KEY" value:&stru_1000083D8 table:0];
        id v94 = v44;
        BYTE2(v82) = 0;
        LOWORD(v82) = 1;
        unsigned __int8 v50 = -[PIVToken populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:](v89, "populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:", v91, v90, 6275338, v47, 156, v49, v82, @"PINAlways", &v94);
        id v51 = v94;

        if ((v50 & 1) == 0)
        {
          v52 = sub_100003FF0();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_100005820();
          }

          id v51 = 0;
        }
        v53 = +[NSBundle mainBundle];
        v54 = [v53 localizedStringForKey:@"KEY_MGMT_CERT" value:&stru_1000083D8 table:0];
        v55 = +[NSBundle mainBundle];
        v56 = [v55 localizedStringForKey:@"KEY_MGMT_KEY" value:&stru_1000083D8 table:0];
        id v93 = v51;
        BYTE2(v83) = 1;
        LOWORD(v83) = 0;
        unsigned __int8 v57 = -[PIVToken populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:](v89, "populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:", v91, v90, 6275339, v54, 157, v56, v83, @"PIN", &v93);
        id v58 = v93;

        if ((v57 & 1) == 0)
        {
          v59 = sub_100003FF0();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            sub_1000057B8();
          }

          id v58 = 0;
        }
        if (v100[3] >= 1)
        {
          uint64_t v60 = 0;
          do
          {
            v61 = +[NSBundle mainBundle];
            v62 = [v61 localizedStringForKey:@"RET_KEY_MGMT_CERT" value:&stru_1000083D8 table:0];
            uint64_t v63 = v60 + 1;
            v64 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v62, v60 + 1);

            v65 = +[NSBundle mainBundle];
            uint64_t v66 = [v65 localizedStringForKey:@"RET_KEY_MGMT_KEY" value:&stru_1000083D8 table:0];
            v67 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v66, v60 + 1);

            id v92 = v58;
            BYTE2(v84) = 1;
            LOWORD(v84) = 0;
            LOBYTE(v66) = -[PIVToken populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:](v89, "populateIdentityFromSmartCard:into:certificateTag:name:keyTag:name:sign:suitableForLogin:keyManagement:constraint:error:", v91, v90, v60 + 6275341, v64, v60 + 130, v67, v84, @"PIN", &v92);
            id v68 = v92;

            if (v66)
            {
              id v58 = v68;
            }
            else
            {
              v69 = sub_100003FF0();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218242;
                uint64_t v112 = v60;
                __int16 v113 = 2114;
                id v114 = v68;
                _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "failed to read retired key management (%ld) identity (%{public}@)", buf, 0x16u);
              }

              id v58 = 0;
            }

            ++v60;
          }
          while (v63 < v100[3]);
        }
        if (![v90 count])
        {
          v70 = sub_100003FF0();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            sub_100005780(v70, v71, v72, v73, v74, v75, v76, v77);
          }
        }
        v78 = [(PIVToken *)v89 keychainContents];
        [v78 fillWithItems:v90];

        _Block_object_dispose(&v99, 8);
        v13 = v89;
      }
      self = v13;
      p_isa = (id *)&self->super.super.super.isa;
    }
    else if (p_isa)
    {
      *p_isa = +[NSError errorWithDomain:TKErrorDomain code:-6 userInfo:0];
      uint64_t v16 = sub_100003FF0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100005748(v16, v17, v18, v19, v20, v21, v22, v23);
      }

      p_isa = 0;
    }
    _Block_object_dispose(&v105, 8);
  }
  else
  {
    v24 = sub_100003FF0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000056CC((uint64_t)p_isa, v24, v25, v26, v27, v28, v29, v30);
    }

    p_isa = 0;
  }

  return (PIVToken *)p_isa;
}

- (id)token:(id)a3 createSessionWithError:(id *)a4
{
  v4 = [[PIVTokenSession alloc] initWithToken:self];

  return v4;
}

- (PIVTokenDriver)driver
{
  return (PIVTokenDriver *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end