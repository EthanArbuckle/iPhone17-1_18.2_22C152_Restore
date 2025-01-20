@interface PearlPairerController
- (BOOL)isRetest:(id)a3;
- (BOOL)parseSeaCookieServerError:(id)a3 errorCode:(id *)a4;
- (NSNumber)PearlPairingErrorCode;
- (NSString)PearlPairingErrorDescription;
- (NSString)savageSN;
- (NSString)savageUID;
- (PearlPairerInputs)inputs;
- (id)_createFDROptions;
- (id)getPatchDataWithDigest:(id)a3;
- (int64_t)detectCamera;
- (int64_t)verifyPSD2;
- (void)cancel;
- (void)setInputs:(id)a3;
- (void)setPearlPairingErrorCode:(id)a3;
- (void)setPearlPairingErrorDescription:(id)a3;
- (void)setSavageSN:(id)a3;
- (void)setSavageUID:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation PearlPairerController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[PearlPairerController setupWithInputs:responder:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v11, 0x20u);
  }

  [(PearlPairerController *)self setInputs:v6];
  v9 = [(PearlPairerController *)self inputs];

  if (!v9)
  {
    v10 = [(PearlPairerController *)self result];
    [v10 setStatusCode:&off_1000156B0];

    [(PearlPairerController *)self setFinished:1];
  }
}

- (void)start
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PearlPairerController start]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  CFErrorRef v122 = 0;
  CFTypeRef cf = 0;
  CFDataRef theData = 0;
  v119[0] = 0;
  v119[1] = v119;
  v119[2] = 0x2020000000;
  v119[3] = 0;
  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x2020000000;
  v118[3] = 0;
  CStringPtr = CFStringGetCStringPtr(@"Savage", 0x8000100u);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v128 = 0x3032000000;
  v129 = sub_1000062C0;
  v130 = sub_1000062D0;
  id v131 = 0;
  v117[0] = 0;
  v117[1] = v117;
  v117[2] = 0x2020000000;
  v117[3] = 0;
  v116[0] = 0;
  v116[1] = v116;
  v116[2] = 0x2020000000;
  v116[3] = 0;
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x2020000000;
  v115[3] = 0;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2020000000;
  v114[3] = 0;
  v112[0] = 0;
  v112[1] = v112;
  v112[2] = 0x2020000000;
  char v113 = 0;
  v110[0] = 0;
  v110[1] = v110;
  v110[2] = 0x3032000000;
  v110[3] = sub_1000062C0;
  v110[4] = sub_1000062D0;
  id v111 = 0;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3032000000;
  v108[3] = sub_1000062C0;
  v108[4] = sub_1000062D0;
  id v109 = (id)objc_opt_new();
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x3032000000;
  v106[3] = sub_1000062C0;
  v106[4] = sub_1000062D0;
  id v107 = 0;
  AMSupportLogSetHandler();
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_1000062D8;
  v105[3] = &unk_100014590;
  v105[6] = v118;
  v105[7] = v117;
  v105[8] = v116;
  v105[9] = &buf;
  v105[16] = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v105[17] = CStringPtr;
  v105[10] = v106;
  v105[11] = v115;
  v105[12] = v114;
  v105[13] = v112;
  v105[14] = v110;
  v105[15] = v108;
  v105[4] = self;
  v105[5] = v119;
  v96 = objc_retainBlock(v105);
  v4 = (void *)MGCopyAnswer();
  v5 = v4;
  if (!v4)
  {
    v78 = [(PearlPairerController *)self result];
    [v78 setStatusCode:&off_1000156C8];

    v79 = handleForCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      sub_10000EF30();
    }
    goto LABEL_97;
  }
  id v6 = [v4 convertToHexString];
  savageSN = self->_savageSN;
  self->_savageSN = v6;

  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_savageSN;
    *(_DWORD *)v125 = 138412290;
    v126 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Savage Serial Number: %@", v125, 0xCu);
  }

  v97 = (void *)MGCopyAnswer();
  if (!v97)
  {
    v80 = [(PearlPairerController *)self result];
    [v80 setStatusCode:&off_1000156C8];

    v79 = handleForCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      sub_10000EF64();
    }
LABEL_97:

    uint64_t v94 = 0;
    v97 = 0;
    v98 = 0;
    CFErrorRef v99 = 0;
    goto LABEL_68;
  }
  v10 = [v97 convertToHexString];
  savageUID = self->_savageUID;
  self->_savageUID = v10;

  v12 = handleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = self->_savageUID;
    *(_DWORD *)v125 = 138412290;
    v126 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Savage UID: %@", v125, 0xCu);
  }

  id v14 = [(PearlPairerController *)self inputs];
  __int16 v15 = [v14 SCPairURL];
  CFURLRef v16 = CFURLCreateWithString(kCFAllocatorDefault, v15, 0);

  v17 = handleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v125 = 138412290;
    v126 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Seacookie Pairing URL: %@", v125, 0xCu);
  }

  v18 = [(PearlPairerController *)self inputs];
  v19 = [v18 rikKeyBlob];

  if (v19)
  {
    id v20 = objc_alloc((Class)NSData);
    v21 = [(PearlPairerController *)self inputs];
    v22 = [v21 rikKeyBlob];
    id v23 = [v20 initWithBase64EncodedString:v22 options:0];

    if (!v23)
    {
      v81 = [(PearlPairerController *)self result];
      [v81 setStatusCode:&off_1000156E0];

      v56 = handleForCategory();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10000F2B8();
      }
      uint64_t v94 = 0;
      goto LABEL_103;
    }
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_100006CD0;
    v102[3] = &unk_1000145B8;
    id v103 = v23;
    v104 = v114;
    id v24 = v23;
    v93 = objc_retainBlock(v102);
  }
  else
  {
    v93 = 0;
  }
  v25 = [(PearlPairerController *)self inputs];
  unsigned __int8 v26 = [v25 skipScPairingTicket];

  if (v26)
  {
    id v27 = 0;
    goto LABEL_33;
  }
  id v27 = +[CRPersonalizationManager getDefaultAMAuthInstallRef];
  if (!v27)
  {
    v82 = [(PearlPairerController *)self result];
    [v82 setStatusCode:&off_1000156F8];

    v56 = handleForCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_10000F0A8();
    }
LABEL_103:
    v98 = 0;
    CFErrorRef v99 = 0;
    id v27 = 0;
    goto LABEL_64;
  }
  v28 = [(PearlPairerController *)self inputs];
  v29 = [v28 tatsuURL];

  if (v29)
  {
    v30 = [(PearlPairerController *)self inputs];
    v31 = [v30 tatsuURL];
    +[NSURL URLWithString:v31];
    int v32 = AMAuthInstallSetSigningServerURL();

    v33 = handleForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [(PearlPairerController *)self inputs];
      v35 = [v34 tatsuURL];
      *(_DWORD *)v125 = 138412290;
      v126 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Setting custom TATSU server URL: %@", v125, 0xCu);
    }
    if (v32)
    {
      v92 = [(PearlPairerController *)self result];
      [v92 setStatusCode:&off_1000156F8];

      v56 = handleForCategory();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10000F250();
      }
      goto LABEL_116;
    }
  }
  v36 = [(PearlPairerController *)self inputs];
  if ([v36 useAppleConnect])
  {
  }
  else
  {
    unsigned __int8 v37 = +[CRPersonalizationManager shouldPersonalizeWithSSOByDefault];

    if ((v37 & 1) == 0) {
      goto LABEL_26;
    }
  }
  if (+[CRPersonalizationManager enableSSO:v27])
  {
    v91 = [(PearlPairerController *)self result];
    [v91 setStatusCode:&off_100015710];

    v56 = handleForCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_10000F21C();
    }
    goto LABEL_116;
  }
LABEL_26:
  if (HSCGetPearlNonce() != 1 || !cf)
  {
    v83 = [(PearlPairerController *)self result];
    [v83 setStatusCode:&off_100015728];

    CFErrorRef v99 = v122;
    v56 = handleForCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_10000F0DC((uint64_t)v99, v56, v84, v85, v86, v87, v88, v89);
    }
    goto LABEL_63;
  }
  if (AMAuthInstallApImg4SetSepNonce())
  {
    v90 = [(PearlPairerController *)self result];
    [v90 setStatusCode:&off_100015728];

    v56 = handleForCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_10000F1B4();
    }
LABEL_116:
    v98 = 0;
    CFErrorRef v99 = 0;
    goto LABEL_64;
  }
  v38 = +[CRPersonalizationManager initWithAuthInstallObj:v27];
  id v101 = 0;
  unsigned __int8 v39 = [v38 getApTicketForSeaCookiePairingWithOptions:0 pairingTicket:&theData error:&v101];
  CFErrorRef v99 = (CFErrorRef)v101;

  if (v99) {
    unsigned __int8 v40 = 0;
  }
  else {
    unsigned __int8 v40 = v39;
  }
  if ((v40 & 1) == 0)
  {
    v42 = handleForCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10000F148((uint64_t)v99, v42, v43, v44, v45, v46, v47, v48);
    }

    v49 = [(PearlPairerController *)self inputs];
    v50 = [v49 rikKeyBlob];

    if (!v50)
    {
      v56 = [(PearlPairerController *)self result];
      [v56 setStatusCode:&off_1000156F8];
      goto LABEL_63;
    }
    if (v99) {
      goto LABEL_41;
    }
LABEL_45:
    CFErrorRef v99 = 0;
    goto LABEL_46;
  }
LABEL_33:
  int v41 = HSCSecurePairPearl(v16, theData, &v122, (uint64_t)v96, v94);
  CFErrorRef v99 = v122;
  if (!v122) {
    goto LABEL_45;
  }
  unsigned __int8 v39 = v41;
  if (!v41)
  {
    if ([(__CFError *)v122 code] != (id)6)
    {
      v62 = +[NSNumber numberWithInteger:[(__CFError *)v99 code]];
      PearlPairingErrorCode = self->_PearlPairingErrorCode;
      self->_PearlPairingErrorCode = v62;

      v64 = [(__CFError *)v99 description];
      PearlPairingErrorDescription = self->_PearlPairingErrorDescription;
      self->_PearlPairingErrorDescription = v64;

      v66 = handleForCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        sub_10000F024((uint64_t)v99, v66);
      }

      if ([(__CFError *)v99 code] == (id)8
        || [(__CFError *)v99 code] == (id)4
        || [(__CFError *)v99 code] == (id)5
        || [(__CFError *)v99 code] == (id)9
        || [(__CFError *)v99 code] == (id)16
        || [(__CFError *)v99 code] == (id)15)
      {
        v56 = [(PearlPairerController *)self result];
        [v56 setStatusCode:&off_100015740];
      }
      else if ([(__CFError *)v99 code] == (id)12 {
             || [(__CFError *)v99 code] == (id)13
      }
             || [(__CFError *)v99 code] == (id)14)
      {
        v56 = [(PearlPairerController *)self result];
        [v56 setStatusCode:&off_100015758];
      }
      else if ([(__CFError *)v99 code] == (id)3 {
             || [(__CFError *)v99 code] == (id)7
      }
             || [(__CFError *)v99 code] == (id)10)
      {
        v56 = [(PearlPairerController *)self result];
        [v56 setStatusCode:&off_100015770];
      }
      else
      {
        v56 = [(PearlPairerController *)self result];
        [v56 setStatusCode:&off_100015788];
      }
      goto LABEL_63;
    }
    unsigned __int8 v39 = 0;
  }
LABEL_41:
  v51 = +[NSNumber numberWithInteger:[(__CFError *)v99 code]];
  v52 = self->_PearlPairingErrorCode;
  self->_PearlPairingErrorCode = v51;

  v53 = [(__CFError *)v99 description];
  v54 = self->_PearlPairingErrorDescription;
  self->_PearlPairingErrorDescription = v53;

  v55 = handleForCategory();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
    sub_10000EF98(v39, (uint64_t)v99, v55);
  }

  if (![(PearlPairerController *)self isRetest:v99])
  {
    v56 = [(PearlPairerController *)self result];
    [v56 setStatusCode:&off_1000157A0];
LABEL_63:
    v98 = 0;
    goto LABEL_64;
  }
LABEL_46:
  v98 = +[NSNumber numberWithInteger:[(PearlPairerController *)self verifyPSD2]];
  if ([v98 isEqual:&off_1000157B8])
  {
    v57 = [(PearlPairerController *)self result];
    [v57 setStatusCode:&off_1000157B8];

    v58 = self;
    v56 = self->_PearlPairingErrorDescription;
    CFStringRef v59 = @"Unprovisioned sensor";
  }
  else if ([v98 isEqual:&off_1000157D0])
  {
    v60 = [(PearlPairerController *)self result];
    [v60 setStatusCode:&off_1000157D0];

    v58 = self;
    v56 = self->_PearlPairingErrorDescription;
    CFStringRef v59 = @"Failed to request FDR permission";
  }
  else
  {
    if (![v98 isEqual:&off_1000157E8])
    {
      v56 = [(PearlPairerController *)self result];
      [v56 setStatusCode:&off_100015800];
      goto LABEL_64;
    }
    v61 = [(PearlPairerController *)self result];
    [v61 setStatusCode:&off_1000157E8];

    v58 = self;
    v56 = self->_PearlPairingErrorDescription;
    CFStringRef v59 = @"Failed to create FDR permission string";
  }
  v58->_PearlPairingErrorDescription = &v59->isa;
LABEL_64:

  if (v16) {
    CFRelease(v16);
  }
  if (v27) {
    CFRelease(v27);
  }
LABEL_68:
  if (cf) {
    CFRelease(cf);
  }
  v123[0] = @"pearlPairingErrorCode";
  v67 = self;
  v68 = self->_PearlPairingErrorCode;
  v69 = v68;
  if (!v68)
  {
    v69 = +[NSNull null];
    v67 = self;
  }
  v124[0] = v69;
  v123[1] = @"pearlPairingErrorDescription";
  v70 = v67->_PearlPairingErrorDescription;
  v71 = v70;
  if (!v70)
  {
    v71 = +[NSNull null];
    v67 = self;
  }
  v124[1] = v71;
  v123[2] = @"pearlSavageSerialNumber";
  v72 = v67->_savageSN;
  v73 = v72;
  if (!v72)
  {
    v73 = +[NSNull null];
    v67 = self;
  }
  v124[2] = v73;
  v123[3] = @"pearlSavageUID";
  v74 = v67->_savageUID;
  if (v74)
  {
    v75 = v67->_savageUID;
  }
  else
  {
    v75 = +[NSNull null];
  }
  v124[3] = v75;
  v76 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v124, v123, 4, v94);
  v77 = [(PearlPairerController *)self result];
  [v77 setData:v76];

  if (!v74) {
  if (!v72)
  }

  if (!v70) {
  if (!v68)
  }

  [(PearlPairerController *)self setFinished:1];
  _Block_object_dispose(v106, 8);

  _Block_object_dispose(v108, 8);
  _Block_object_dispose(v110, 8);

  _Block_object_dispose(v112, 8);
  _Block_object_dispose(v114, 8);
  _Block_object_dispose(v115, 8);
  _Block_object_dispose(v116, 8);
  _Block_object_dispose(v117, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v118, 8);
  _Block_object_dispose(v119, 8);
}

- (void)cancel
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[PearlPairerController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)teardown
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[PearlPairerController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)parseSeaCookieServerError:(id)a3 errorCode:(id *)a4
{
  id v5 = a3;
  id v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315138;
    v25 = "-[PearlPairerController parseSeaCookieServerError:errorCode:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v24, 0xCu);
  }

  BOOL v7 = 0;
  if (v5 && a4)
  {
    if ([v5 code] == (id)6
      && ([v5 localizedDescription],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      v9 = [v5 localizedDescription];
      id v10 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"errorCode: (-?\\d+)" options:0 error:0];
      int v11 = [v10 firstMatchInString:v9 options:0 range:[v9 length]];
      BOOL v7 = v11 != 0;
      if (v11)
      {
        v12 = v11;
        id v13 = [v11 rangeAtIndex:1];
        [v9 substringWithRange:v13, v14];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v15 = handleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          CFURLRef v16 = (const char *)*a4;
          int v24 = 138412290;
          v25 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "serverErrorCode: %@", (uint8_t *)&v24, 0xCu);
        }
      }
      else
      {
        v12 = handleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10000F678((uint64_t)v9, v12, v17, v18, v19, v20, v21, v22);
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isRetest:(id)a3
{
  id v4 = a3;
  id v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v21 = "-[PearlPairerController isRetest:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(PearlPairerController *)self inputs];
  BOOL v7 = [v6 rikKeyBlob];
  v8 = v7;
  if (!v4 || !v7)
  {

LABEL_10:
    id v19 = 0;
    BOOL v11 = [(PearlPairerController *)self parseSeaCookieServerError:v4 errorCode:&v19];
    id v10 = v19;
    if (!v11)
    {
      CFURLRef v16 = handleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000F6E4();
      }
      goto LABEL_22;
    }
    v12 = [(PearlPairerController *)self inputs];
    uint64_t v13 = [v12 rikKeyBlob];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      unsigned int v15 = [v10 isEqual:@"5010"];

      if (v15)
      {
        CFURLRef v16 = handleForCategory();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
LABEL_22:

          goto LABEL_23;
        }
        *(_WORD *)long long buf = 0;
        uint64_t v17 = "Server error is 5010.";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
        goto LABEL_22;
      }
    }
    else
    {
    }
    if (![v10 isEqual:@"6006"])
    {
      BOOL v11 = 0;
      goto LABEL_23;
    }
    CFURLRef v16 = handleForCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v17 = "Server error is 6006 (PSDT not found).";
    goto LABEL_21;
  }
  id v9 = [v4 code];

  if (v9 != (id)3194) {
    goto LABEL_10;
  }
  id v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AuthInstall error is 3194.", buf, 2u);
  }
  BOOL v11 = 1;
LABEL_23:

  return v11;
}

- (id)_createFDROptions
{
  int v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[PearlPairerController _createFDROptions]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v19, 0xCu);
  }

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"VerifyData"];
  id v5 = [(PearlPairerController *)self inputs];
  id v6 = [v5 FDRCAURL];

  if (v6)
  {
    BOOL v7 = [(PearlPairerController *)self inputs];
    v8 = [v7 FDRCAURL];
    [v4 setObject:v8 forKeyedSubscript:@"CAURL"];
  }
  id v9 = [(PearlPairerController *)self inputs];
  id v10 = [v9 FDRDSURL];

  if (v10)
  {
    BOOL v11 = [(PearlPairerController *)self inputs];
    v12 = [v11 FDRDSURL];
    [v4 setObject:v12 forKeyedSubscript:@"DSURL"];
  }
  uint64_t v13 = [(PearlPairerController *)self inputs];
  uint64_t v14 = [v13 trustObjectURL];

  if (v14)
  {
    unsigned int v15 = [(PearlPairerController *)self inputs];
    CFURLRef v16 = [v15 trustObjectURL];
    [v4 setObject:v16 forKeyedSubscript:@"TrustObjectURL"];
  }
  uint64_t v17 = handleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    uint64_t v20 = (const char *)v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AMFDR options: %@", (uint8_t *)&v19, 0xCu);
  }

  return v4;
}

- (int64_t)verifyPSD2
{
  int v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[PearlPairerController verifyPSD2]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v49 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)long long buf = 0u;
  id v4 = [(PearlPairerController *)self _createFDROptions];
  uint64_t v5 = AMFDRSealingMapCopyInstanceForClass();
  if (!v5)
  {
    uint64_t v18 = handleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000F718();
    }
    goto LABEL_34;
  }
  if (!AMFDRCreateTypeWithOptions())
  {
    uint64_t v18 = handleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000F780();
    }
LABEL_34:

    id v11 = 0;
    uint64_t PermissionsString = 0;
    int64_t v13 = 12;
    goto LABEL_25;
  }
  uint64_t v6 = AMFDRCreateTypeWithOptions();
  AMFDRDataCopyTrustObject();
  AMFDRSetOption();
  uint64_t PermissionsString = AMFDRDataCreatePermissionsString();
  v8 = handleForCategory();
  id v9 = v8;
  if (!PermissionsString)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000F7B4();
    }
    id v11 = 0;
    int64_t v13 = -84;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v19 = 138412290;
    uint64_t v20 = PermissionsString;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request FDR permissionStr: %@", v19, 0xCu);
  }

  AMFDRSetOption();
  if (!AMFDRPermissionsRequest())
  {
    id v9 = handleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000F920();
    }
    id v11 = 0;
    int64_t v13 = -83;
    goto LABEL_22;
  }
  id v10 = (void *)AMFDRDataCopy();
  id v11 = v10;
  if (v10)
  {
    id v11 = v10;
    [v11 bytes];
    [v11 length];
    if (AMFDRDecodeFDR2Data())
    {
      id v12 = v11;
      [v12 bytes];
      [v12 length];
      if (Img4DecodeInit())
      {
        id v9 = handleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10000F8B8();
        }
        int64_t v13 = 12;
        id v11 = v12;
        goto LABEL_22;
      }
      goto LABEL_18;
    }
    uint64_t v14 = handleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Decoded FDR2 format", v19, 2u);
    }

    if (!Img4DecodeInit())
    {
LABEL_18:
      int v15 = verifyFDRData(*((const char **)&v29 + 1), v30);
      CFURLRef v16 = handleForCategory();
      id v9 = v16;
      if (!v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Verify PSD2 successfully", v19, 2u);
        }
        int64_t v13 = 0;
        goto LABEL_22;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000F850();
      }
      goto LABEL_47;
    }
    id v9 = handleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000F8B8();
    }
  }
  else
  {
    id v9 = handleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000F7E8();
    }
  }
LABEL_47:
  int64_t v13 = 12;
LABEL_22:

  if (v6) {
    AMSupportSafeRelease();
  }
  AMSupportSafeRelease();
LABEL_25:
  if (v5) {
    AMSupportSafeRelease();
  }
  if (PermissionsString) {
    AMSupportSafeRelease();
  }

  return v13;
}

- (int64_t)detectCamera
{
  CFDictionaryRef v2 = IOServiceMatching("AppleH10CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    IOObjectRelease(MatchingService);
    id v4 = handleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "h10 device", buf, 2u);
    }
    int64_t v5 = 1;
  }
  else
  {
    CFDictionaryRef v7 = IOServiceMatching("AppleH13CamIn");
    io_service_t v8 = IOServiceGetMatchingService(kIOMainPortDefault, v7);
    if (v8)
    {
      IOObjectRelease(v8);
      id v4 = handleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        int64_t v5 = 2;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "h13 device", v12, 2u);
      }
      else
      {
        int64_t v5 = 2;
      }
    }
    else
    {
      CFDictionaryRef v9 = IOServiceMatching("AppleH16CamIn");
      io_service_t v10 = IOServiceGetMatchingService(kIOMainPortDefault, v9);
      if (!v10) {
        return 0;
      }
      IOObjectRelease(v10);
      id v4 = handleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "h16 device", v11, 2u);
      }
      int64_t v5 = 3;
    }
  }

  return v5;
}

- (id)getPatchDataWithDigest:(id)a3
{
  id v31 = a3;
  int v3 = (void *)MGCopyAnswer();
  unsigned int v4 = [v3 intValue];

  int64_t v5 = objc_opt_new();
  uint64_t v6 = v5;
  if (v4 == 3)
  {
    uint64_t v38 = 0;
    CFDictionaryRef v7 = (id *)&v38;
    uint64_t v8 = [v5 getPathForBorsFirmwareWithError:&v38];
  }
  else
  {
    uint64_t v37 = 0;
    CFDictionaryRef v7 = (id *)&v37;
    uint64_t v8 = [v5 getPathForSavageFirmwareWithError:&v37];
  }
  CFDictionaryRef v9 = (void *)v8;
  id v10 = *v7;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    id v12 = handleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000F988();
    }
LABEL_36:
    long long v23 = 0;
    goto LABEL_41;
  }
  int64_t v13 = +[NSFileManager defaultManager];
  id v36 = 0;
  id v10 = [v13 contentsOfDirectoryAtPath:v9 error:&v36];
  id v12 = v36;

  if (!v10 || v12)
  {
    long long v27 = handleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10000F9BC();
    }

    goto LABEL_36;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v10;
  id v14 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v14)
  {
    id v16 = v14;
    uint64_t v17 = *(void *)v33;
    *(void *)&long long v15 = 138412290;
    long long v30 = v15;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v12);
        }
        int v19 = *(NSObject **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v20 = [v9 stringByAppendingPathComponent:v19, v30];
        if (v20)
        {
          uint64_t v21 = v20;
          long long v22 = +[NSData dataWithContentsOfFile:v20];
          if (v22)
          {
            long long v23 = v22;
            long long v24 = [v22 SHA256DigestData];
            if (!v24)
            {
              long long v25 = handleForCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = v30;
                long long v40 = v19;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to get digest for file: %@", buf, 0xCu);
              }
            }
            if ([v24 isEqualToData:v31])
            {
              long long v28 = handleForCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = v30;
                long long v40 = v19;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Expected patch data found: %@", buf, 0xCu);
              }

              goto LABEL_40;
            }
          }
          else
          {
            long long v26 = handleForCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = v30;
              long long v40 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to get content in path: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v21 = handleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v30;
            long long v40 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to get path for file: %@", buf, 0xCu);
          }
        }
      }
      id v16 = [v12 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  long long v23 = 0;
LABEL_40:
  id v10 = v12;
LABEL_41:

  return v23;
}

- (PearlPairerInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (NSNumber)PearlPairingErrorCode
{
  return self->_PearlPairingErrorCode;
}

- (void)setPearlPairingErrorCode:(id)a3
{
}

- (NSString)PearlPairingErrorDescription
{
  return self->_PearlPairingErrorDescription;
}

- (void)setPearlPairingErrorDescription:(id)a3
{
}

- (NSString)savageSN
{
  return self->_savageSN;
}

- (void)setSavageSN:(id)a3
{
}

- (NSString)savageUID
{
  return self->_savageUID;
}

- (void)setSavageUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savageUID, 0);
  objc_storeStrong((id *)&self->_savageSN, 0);
  objc_storeStrong((id *)&self->_PearlPairingErrorDescription, 0);
  objc_storeStrong((id *)&self->_PearlPairingErrorCode, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

@end