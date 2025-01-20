@interface FMDPairingCheckHelper
+ (id)getPairingData:(id)a3;
+ (id)getUserPrivateKey:(id)a3;
+ (id)registerDevice:(id)a3;
+ (id)updatePairingData:(id)a3 pairingData:(id)a4;
+ (void)checkAndHealPairingKeys:(id)a3 completion:(id)a4;
+ (void)pairingCheckForAccessory:(id)a3 completion:(id)a4;
+ (void)pairingCheckForAccessory:(id)a3 useEraseKeyType:(id)a4 completion:(id)a5;
@end

@implementation FMDPairingCheckHelper

+ (void)pairingCheckForAccessory:(id)a3 completion:(id)a4
{
}

+ (void)pairingCheckForAccessory:(id)a3 useEraseKeyType:(id)a4 completion:(id)a5
{
  id v7 = a3;
  unint64_t v105 = (unint64_t)a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  v9 = dispatch_group_create();
  v10 = sub_100006910();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "getting pairing data", buf, 2u);
  }

  dispatch_group_enter(v9);
  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x3032000000;
  v135 = sub_1000047F8;
  v136 = sub_100004808;
  id v137 = 0;
  uint64_t v126 = 0;
  v127 = &v126;
  uint64_t v128 = 0x3032000000;
  v129 = sub_1000047F8;
  v130 = sub_100004808;
  id v131 = 0;
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_100004810;
  v122[3] = &unk_1000246F8;
  v124 = &v132;
  v125 = &v126;
  v11 = v9;
  v123 = v11;
  [v7 getPairingDataWithCompletion:v122];
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  intptr_t v13 = dispatch_group_wait(v11, v12);
  if (!v127[5] && !v13)
  {
    v14 = sub_100006910();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v77 = [(id)v133[5] data];
      [v77 fm_hexString];
      id v78 = (id)objc_claimAutoreleasedReturnValue();
      v98 = [(id)v133[5] pairingCheckToken];
      [v98 fm_hexString];
      id v102 = (id)objc_claimAutoreleasedReturnValue();
      v97 = [(id)v133[5] phoneNumber];
      [v97 fm_hexString];
      v100 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
      v79 = [(id)v133[5] keysUpdated];
      [v79 fm_hexString];
      id v80 = (id)objc_claimAutoreleasedReturnValue();
      v81 = [(id)v133[5] lostModePrivateKey];
      v82 = [v81 fm_hexString];
      *(_DWORD *)buf = 138413314;
      *(void *)&buf[4] = v78;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v102;
      *(_WORD *)&buf[22] = 2112;
      v147 = v100;
      *(_WORD *)v148 = 2112;
      *(void *)&v148[2] = v80;
      *(_WORD *)&v148[10] = 2112;
      *(void *)&v148[12] = v82;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "pairingCheckData = %@\npairingCheckToken = %@\nphoneNumber = %@\nkeysUpdated = %@\nlostModePrivateKey = %@", buf, 0x34u);
    }
    if (v105)
    {
      unsigned int v15 = [(id)v105 isEqualToString:@"2"];
    }
    else
    {
      v19 = [(id)v133[5] keysUpdated];
      if (v19) {
        unsigned int v15 = +[FMPreferencesUtil BOOLForKey:@"userKeyEraseDisabled" inDomain:kFMDNotBackedUpPrefDomain] ^ 1;
      }
      else {
        unsigned int v15 = 0;
      }
    }
    v20 = sub_100006910();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "using userPrivateKeyErase = %d", buf, 8u);
    }

    v21 = sub_100006910();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "getting auth nonce", buf, 2u);
    }

    dispatch_group_enter(v11);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v147 = sub_1000047F8;
    *(void *)v148 = sub_100004808;
    *(void *)&v148[8] = 0;
    if (v15)
    {
      v22 = v121;
      v121[0] = _NSConcreteStackBlock;
      v121[1] = 3221225472;
      v121[2] = sub_100004924;
      v121[3] = &unk_100024720;
      v121[5] = buf;
      v121[6] = &v126;
      v121[4] = v11;
      [v7 beginUserKeyEraseWithCompletion:v121];
    }
    else
    {
      v22 = v120;
      v120[0] = _NSConcreteStackBlock;
      v120[1] = 3221225472;
      v120[2] = sub_100004A38;
      v120[3] = &unk_100024720;
      v120[5] = buf;
      v120[6] = &v126;
      v120[4] = v11;
      [v7 getAuthNonceWithCompletion:v120];
    }

    dispatch_time_t v23 = dispatch_time(0, 5000000000);
    intptr_t v24 = dispatch_group_wait(v11, v23);
    if (v127[5] || v24)
    {
      v41 = sub_100006910();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_100016084();
      }

      uint64_t v42 = v127[5];
      if (v42)
      {
        v8[2](v8, v42, 0);
LABEL_91:
        _Block_object_dispose(buf, 8);

        goto LABEL_92;
      }
      id v26 = +[NSError fm_timeoutError];
      v8[2](v8, (uint64_t)v26, 0);
LABEL_90:

      goto LABEL_91;
    }
    v25 = sub_100006910();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v114 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "getting pairingCheckInfo", v114, 2u);
    }

    id v26 = objc_alloc_init((Class)FMDPairingCheckCommandRequestInfo);
    v27 = [(id)v133[5] pairingCheckToken];
    v28 = [v27 fm_hexString];
    [v26 setPairingCheckToken:v28];

    v29 = [*(id *)(*(void *)&buf[8] + 40) fm_hexString];
    [v26 setAuthNonce:v29];

    v30 = [v7 accessoryType];
    [v26 setAccessoryType:v30];

    if (v15) {
      CFStringRef v31 = @"2";
    }
    else {
      CFStringRef v31 = @"1";
    }
    [v26 setEraseKeyType:v31];
    dispatch_group_enter(v11);
    *(void *)v114 = 0;
    v115 = v114;
    uint64_t v116 = 0x3032000000;
    v117 = sub_1000047F8;
    v118 = sub_100004808;
    id v119 = 0;
    v32 = +[FMDFMIPManager sharedInstance];
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = sub_100004B4C;
    v110[3] = &unk_100024748;
    v112 = v114;
    v113 = &v126;
    v33 = v11;
    v111 = v33;
    [v32 pairingCheckWith:v26 completion:v110];

    dispatch_time_t v34 = dispatch_time(0, 5000000000);
    intptr_t v35 = dispatch_group_wait(v33, v34);
    if (v127[5] || v35)
    {
      if (v15) {
        [v7 cancelUserKeyEraseWithCompletion:0];
      }
      else {
        [v7 cancelVendorKeyEraseWithCompletion:0];
      }
      v43 = sub_100006910();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_100016084();
      }

      uint64_t v44 = v127[5];
      if (v44)
      {
        v8[2](v8, v44, 0);
LABEL_89:

        _Block_object_dispose(v114, 8);
        goto LABEL_90;
      }
      v45 = +[NSError fm_timeoutError];
      v8[2](v8, (uint64_t)v45, 0);
LABEL_88:

      goto LABEL_89;
    }
    v36 = sub_100006910();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v138 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "getting lostModeInfo", v138, 2u);
    }

    v37 = [*((id *)v115 + 5) lostModeInfo];
    v38 = +[NSData dataWithHexString:v37];
    v39 = [(id)v133[5] lostModePrivateKey];
    uint64_t v101 = +[FMDCryptoUtil decryptData:v38 privateKeyData:v39];

    if (v101)
    {
      v40 = +[NSJSONSerialization JSONObjectWithData:v101 options:0 error:0];
    }
    else
    {
      v40 = 0;
    }
    v46 = sub_100006910();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      v92 = [*((id *)v115 + 5) lostModeInfo];
      *(_DWORD *)v138 = 138412802;
      CFStringRef v139 = v92;
      __int16 v140 = 2112;
      uint64_t v141 = v101;
      __int16 v142 = 2112;
      v143 = v40;
      _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "got lostModeInfo encrypted = %@ decrypted = %@ json = %@", v138, 0x20u);
    }
    v47 = [v40 objectForKeyedSubscript:@"isLost"];
    if (objc_opt_respondsToSelector())
    {
      v48 = [v40 objectForKeyedSubscript:@"isLost"];
      unsigned __int8 v49 = [v48 BOOLValue];

      if (v49) {
        goto LABEL_61;
      }
    }
    else
    {
    }
    v50 = sub_100006910();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_100016164((uint64_t)v40, v50);
    }

    v40 = 0;
LABEL_61:
    v51 = (void *)*((void *)v115 + 5);
    if (v51)
    {
      v52 = [v51 statusCode];
      if (([v52 isEqualToString:@"409"] & 1) != 0
        || ([*((id *)v115 + 5) signature], (v53 = objc_claimAutoreleasedReturnValue()) == 0))
      {
      }
      else
      {
        v54 = [*((id *)v115 + 5) serverNonce];
        BOOL v55 = v54 == 0;

        if (!v55)
        {
          v56 = sub_100006910();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v57 = @"vendorKeyErase";
            if (v15) {
              CFStringRef v57 = @"userKeyErase";
            }
            *(_DWORD *)v138 = 138412290;
            CFStringRef v139 = v57;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "calling erase Key API %@", v138, 0xCu);
          }

          dispatch_group_enter(v33);
          v58 = [*((id *)v115 + 5) serverNonce];
          v104 = +[NSData dataWithHexString:v58];

          v59 = [*((id *)v115 + 5) signature];
          v99 = +[NSData dataWithHexString:v59];

          if (v15)
          {
            v60 = sub_100006910();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              v61 = *(void **)(*(void *)&buf[8] + 40);
              v62 = [v7 endPointUUID];
              *(_DWORD *)v138 = 138413058;
              CFStringRef v139 = v104;
              __int16 v140 = 2112;
              uint64_t v141 = (uint64_t)v99;
              __int16 v142 = 2112;
              v143 = v61;
              __int16 v144 = 2112;
              v145 = v62;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "continueUserKeyErase serverNonce = %@, signature  = %@, accessoryNonce = %@ endPointUUID = %@", v138, 0x2Au);
            }
            uint64_t v63 = *(void *)(*(void *)&buf[8] + 40);
            v64 = [v7 endPointUUID];
            v65 = v107;
            v107[0] = _NSConcreteStackBlock;
            v107[1] = 3221225472;
            v107[2] = sub_100004DA4;
            v107[3] = &unk_100024798;
            v66 = v104;
            v107[4] = v66;
            v107[6] = &v126;
            v107[5] = v33;
            [v7 continueUserKeyErase:v66 withSignature:v99 andAccessoryNonce:v63 forEndpoint:v64 completion:v107];
          }
          else
          {
            v83 = sub_100006910();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
            {
              v84 = *(void **)(*(void *)&buf[8] + 40);
              v85 = [v7 endPointUUID];
              *(_DWORD *)v138 = 138413058;
              CFStringRef v139 = v104;
              __int16 v140 = 2112;
              uint64_t v141 = (uint64_t)v99;
              __int16 v142 = 2112;
              v143 = v84;
              __int16 v144 = 2112;
              v145 = v85;
              _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "vendorKeyErase serverNonce = %@, signature  = %@, accessoryNonce = %@ endPointUUID = %@", v138, 0x2Au);
            }
            uint64_t v86 = *(void *)(*(void *)&buf[8] + 40);
            v64 = [v7 endPointUUID];
            v65 = v106;
            v106[0] = _NSConcreteStackBlock;
            v106[1] = 3221225472;
            v106[2] = sub_100004E90;
            v106[3] = &unk_100024798;
            v87 = v104;
            v106[4] = v87;
            v106[6] = &v126;
            v106[5] = v33;
            [v7 vendorKeyErase:v87 withSignature:v99 andAccessoryNonce:v86 forEndpoint:v64 completion:v106];
          }

          dispatch_time_t v88 = dispatch_time(0, 5000000000);
          intptr_t v89 = dispatch_group_wait(v33, v88);
          if (v127[5] || v89)
          {
            v90 = sub_100006910();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
              sub_100016084();
            }

            uint64_t v91 = v127[5];
            if (v91)
            {
              ((void (**)(id, uint64_t, void *))v8)[2](v8, v91, v40);
            }
            else
            {
              v96 = +[NSError fm_timeoutError];
              ((void (**)(id, uint64_t, void *))v8)[2](v8, (uint64_t)v96, v40);
            }
          }
          else
          {
            ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v40);
          }

          v95 = v104;
LABEL_108:

          goto LABEL_87;
        }
      }
    }
    v67 = sub_100006910();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v138 = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "phone is locked", v138, 2u);
    }

    dispatch_group_enter(v33);
    if (v15)
    {
      v68 = v109;
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472;
      v109[2] = sub_100004CE4;
      v109[3] = &unk_100024770;
      v109[5] = &v126;
      v109[4] = v33;
      [v7 cancelUserKeyEraseWithCompletion:v109];
    }
    else
    {
      v68 = v108;
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_100004D44;
      v108[3] = &unk_100024770;
      v108[5] = &v126;
      v108[4] = v33;
      [v7 cancelVendorKeyEraseWithCompletion:v108];
    }

    dispatch_time_t v69 = dispatch_time(0, 5000000000);
    intptr_t v70 = dispatch_group_wait(v33, v69);
    if (v70)
    {
      uint64_t v71 = v70;
      v72 = sub_100006910();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        sub_1000160EC(v71, v72);
      }
    }
    else if (!(v105 | v127[5]))
    {
      v73 = [*((id *)v115 + 5) useEraseKeyType];
      if (v73)
      {
        v74 = [*((id *)v115 + 5) useEraseKeyType];
        v75 = [v26 eraseKeyType];
        unsigned __int8 v76 = [v74 isEqualToString:v75];

        if ((v76 & 1) == 0)
        {
          v93 = sub_100006910();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            v94 = [*((id *)v115 + 5) useEraseKeyType];
            *(_DWORD *)v138 = 138412290;
            CFStringRef v139 = v94;
            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Performing pairing check again with eraseKeyType = %@", v138, 0xCu);
          }
          v95 = [*((id *)v115 + 5) useEraseKeyType];
          [a1 pairingCheckForAccessory:v7 useEraseKeyType:v95 completion:v8];
          goto LABEL_108;
        }
      }
    }
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v40);
LABEL_87:

    v45 = (void *)v101;
    goto LABEL_88;
  }
  v16 = sub_100006910();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100016084();
  }

  uint64_t v17 = v127[5];
  if (v17)
  {
    v8[2](v8, v17, 0);
  }
  else
  {
    v18 = +[NSError fm_timeoutError];
    v8[2](v8, (uint64_t)v18, 0);
  }
LABEL_92:

  _Block_object_dispose(&v126, 8);
  _Block_object_dispose(&v132, 8);
}

+ (void)checkAndHealPairingKeys:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  id v7 = [(id)objc_opt_class() getPairingData:v5];
  v8 = sub_100006910();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 data];
    v10 = [v9 fm_hexString];
    v11 = [v7 keysUpdated];
    *(_DWORD *)buf = 138412546;
    *(void *)dispatch_time_t v69 = v10;
    *(_WORD *)&v69[8] = 2112;
    *(void *)intptr_t v70 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "pairing data = %@ keys Updated = %@", buf, 0x16u);
  }
  dispatch_time_t v12 = sub_100006910();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100016338(v7, v12);
  }

  intptr_t v13 = [v7 pairingCheckToken];
  BOOL v14 = v13 == 0;

  if (v13)
  {
LABEL_8:
    v19 = +[FMDMagSafeDataStore sharedInstance];
    v20 = [v19 readLostModeAccessoriesList];

    v21 = [v5 serialNumber];
    v22 = +[FMDExtHelper deviceIDFromAddress:v21];

    unsigned int v23 = [v20 containsObject:v22];
    intptr_t v24 = sub_100006910();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "device is in lost Mode", buf, 2u);
    }

    if (v23 && ([v7 keysUpdated], (v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      id v26 = [v7 lostModePrivateKey];

      if (v26)
      {
        int v27 = 0;
        goto LABEL_20;
      }
    }
    id v66 = 0;
    id v67 = 0;
    +[FMDCryptoUtil generatePublicPrivateKeyPair:&v67 privateKey:&v66];
    id v28 = v67;
    id v29 = v66;
    v30 = sub_100006910();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_100016274(v28, v29, v30);
    }

    if (!v28 || !v29)
    {
      v40 = +[NSError errorWithMessage:@"lost mode key generation failed"];
      v6[2](v6, v40);

LABEL_49:
      goto LABEL_50;
    }
    [v7 setLostModePrivateKey:v29];

    int v27 = 1;
    BOOL v14 = 1;
LABEL_20:
    CFStringRef v31 = sub_100006910();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)dispatch_time_t v69 = v27;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v14;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "### updateServerInfo = %d, updateMulderInfo = %d", buf, 0xEu);
    }

    v61 = v22;
    if (v27)
    {
      v32 = [v7 keysUpdated];

      if (v32)
      {
        [v7 setKeysUpdated:0];
        BOOL v14 = 1;
      }
      v33 = [v5 serialNumber];
      +[FMPreferencesUtil removeKey:v33 inDomain:kFMDNotBackedUpMagSafePrefDomain];

      int v34 = 0;
      int v35 = 1;
    }
    else
    {
      v36 = [v5 serialNumber];
      unsigned int v37 = +[FMPreferencesUtil BOOLForKey:v36 inDomain:kFMDNotBackedUpMagSafePrefDomain];

      v38 = [v7 keysUpdated];

      if (v38 || !v37)
      {
        v41 = [v7 keysUpdated];

        int v34 = 0;
        if (v41) {
          int v35 = 0;
        }
        else {
          int v35 = v37 ^ 1;
        }
      }
      else
      {
        int v34 = 1;
        buf[0] = 1;
        v39 = +[NSData dataWithBytes:buf length:1];
        [v7 setKeysUpdated:v39];

        int v35 = 0;
        BOOL v14 = 1;
      }
    }
    uint64_t v42 = sub_100006910();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [v7 keysUpdated];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)dispatch_time_t v69 = v35;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v14;
      *(_WORD *)intptr_t v70 = 2112;
      *(void *)&v70[2] = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "### updateServerInfo = %d, updateMulderInfo = %d %@", buf, 0x18u);
    }
    if (!v14) {
      goto LABEL_46;
    }
    uint64_t v44 = [(id)objc_opt_class() updatePairingData:v5 pairingData:v7];
    if (v44)
    {
      v45 = sub_100006910();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_1000161DC(v5, v45);
      }
    }
    else
    {
      if (v34)
      {
        v46 = [v5 serialNumber];
        +[FMPreferencesUtil removeKey:v46 inDomain:kFMDNotBackedUpMagSafePrefDomain];
      }
      if (!v23) {
        goto LABEL_45;
      }
      v47 = +[NSDate date];
      v48 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", objc_msgSend(v47, "fm_epoch"));

      unsigned __int8 v49 = +[FMDMagSafeDataStore sharedInstance];
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_10000583C;
      v62[3] = &unk_1000247C0;
      id v63 = v61;
      id v64 = v48;
      id v65 = v20;
      v45 = v48;
      [v49 updateLostModeKeyRollTimeFor:v63 lastLostModeKeyRollTime:v45 withCompletion:v62];
    }
LABEL_45:

LABEL_46:
    if (v35)
    {
      id v50 = objc_alloc_init((Class)FMDPairingLockUpdateRequestInfo);
      v51 = [v7 pairingCheckToken];
      v52 = [v51 fm_hexString];
      [v50 setPairingCheckToken:v52];

      v53 = [v7 lostModePrivateKey];
      v54 = +[FMDCryptoUtil publicKeyFromPrivateKey:v53];

      BOOL v55 = [v54 fm_hexString];
      [v50 setLostModePubKey:v55];

      v56 = [(id)objc_opt_class() getUserPrivateKey:v5];
      [v50 setUserPrivateKey:v56];

      CFStringRef v57 = [v5 serialNumber];
      [v50 setSerialNumber:v57];

      v58 = +[NSDate date];
      v59 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", objc_msgSend(v58, "fm_epoch"));
      [v50 setTimeStamp:v59];

      v60 = +[FMDFMIPManager sharedInstance];
      [v60 updatePairingLockInfo:v50 completion:&stru_100024800];
    }
    v6[2](v6, 0);
    v22 = v61;
    goto LABEL_49;
  }
  unsigned int v15 = [(id)objc_opt_class() registerDevice:v5];
  if (v15)
  {
    v16 = v15;
    uint64_t v17 = [v15 pairingToken];
    v18 = +[NSData dataWithHexString:v17];
    [v7 setPairingCheckToken:v18];

    goto LABEL_8;
  }
  v20 = +[NSError errorWithMessage:@"Unable to register device"];
  v6[2](v6, v20);
LABEL_50:
}

+ (id)getUserPrivateKey:(id)a3
{
  id v3 = a3;
  v4 = sub_100006910();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getting user private key", buf, 2u);
  }

  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  *(void *)buf = 0;
  unsigned int v23 = buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000047F8;
  id v26 = sub_100004808;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000047F8;
  v20 = sub_100004808;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005C8C;
  v12[3] = &unk_100024720;
  BOOL v14 = buf;
  unsigned int v15 = &v16;
  v6 = v5;
  intptr_t v13 = v6;
  [v3 copyUserPrivateKeyWithCompletion:v12];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  intptr_t v8 = dispatch_group_wait(v6, v7);
  if (*((void *)v23 + 5) || v8)
  {
    v10 = sub_100006910();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001648C();
    }

    v9 = 0;
  }
  else
  {
    v9 = [v17[5] fm_hexString];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v9;
}

+ (id)updatePairingData:(id)a3 pairingData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = sub_100006910();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setting up pairing data", buf, 2u);
  }

  intptr_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  *(void *)buf = 0;
  uint64_t v24 = buf;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1000047F8;
  id v27 = sub_100004808;
  id v28 = 0;
  uint64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100005FB8;
  v20 = &unk_100024770;
  v22 = buf;
  v9 = v8;
  id v21 = v9;
  [v5 setPairingData:v6 withCompletion:&v17];
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  intptr_t v11 = dispatch_group_wait(v9, v10);
  if (*((void *)v24 + 5) || (dispatch_time_t v12 = 0, v11))
  {
    intptr_t v13 = sub_100006910();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001648C();
    }

    BOOL v14 = (void *)*((void *)v24 + 5);
    if (v14)
    {
      id v15 = v14;
    }
    else
    {
      id v15 = +[NSError fm_timeoutError];
    }
    dispatch_time_t v12 = v15;
  }

  _Block_object_dispose(buf, 8);

  return v12;
}

+ (id)registerDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)FMDPairingLockRegisterRequestInfo);
  id v5 = [v3 serialNumber];
  [v4 setSerialNumber:v5];

  id v6 = [v3 accessoryType];
  [v4 setAccessoryType:v6];

  dispatch_time_t v7 = dispatch_group_create();
  intptr_t v8 = sub_100006910();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v4 serialNumber];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Doing register to server for accessory with serial number = %@", (uint8_t *)&buf, 0xCu);
  }
  dispatch_group_enter(v7);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  unsigned int v37 = sub_1000047F8;
  v38 = sub_100004808;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  CFStringRef v31 = sub_1000047F8;
  v32 = sub_100004808;
  id v33 = 0;
  dispatch_time_t v10 = +[FMDFMIPManager sharedInstance];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100006450;
  v24[3] = &unk_100024828;
  id v26 = &v28;
  p_long long buf = &buf;
  intptr_t v11 = v7;
  uint64_t v25 = v11;
  [v10 registerDeviceForPairingLock:v4 completion:v24];

  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  intptr_t v13 = dispatch_group_wait(v11, v12);
  if (v29[5] || v13)
  {
    v19 = sub_100006910();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10001648C();
    }
  }
  else
  {
    BOOL v14 = *(void **)(*((void *)&buf + 1) + 40);
    if (v14)
    {
      id v15 = [v14 pairingToken];
      if (v15)
      {
        uint64_t v16 = [*(id *)(*((void *)&buf + 1) + 40) serialNumber];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
          id v18 = *(id *)(*((void *)&buf + 1) + 40);
          goto LABEL_16;
        }
      }
    }
    v20 = sub_100006910();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = [*(id *)(*((void *)&buf + 1) + 40) pairingToken];
      v22 = [*(id *)(*((void *)&buf + 1) + 40) serialNumber];
      sub_1000164F4(v21, v22, v34, v20);
    }
  }
  id v18 = 0;
LABEL_16:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);

  return v18;
}

+ (id)getPairingData:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_group_create();
  id v5 = sub_100006910();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getting pairing data", buf, 2u);
  }

  dispatch_group_enter(v4);
  *(void *)long long buf = 0;
  unsigned int v23 = buf;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_1000047F8;
  id v26 = sub_100004808;
  id v27 = 0;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000047F8;
  v20 = sub_100004808;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000067B4;
  v12[3] = &unk_1000246F8;
  BOOL v14 = buf;
  id v15 = &v16;
  id v6 = v4;
  intptr_t v13 = v6;
  [v3 getPairingDataWithCompletion:v12];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  intptr_t v8 = dispatch_group_wait(v6, v7);
  if (v17[5] || v8)
  {
    dispatch_time_t v10 = sub_100006910();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100016564();
    }

    id v9 = 0;
  }
  else
  {
    id v9 = *((id *)v23 + 5);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v9;
}

@end