@interface MechanismManagerACM
+ (MechanismManagerACM)sharedInstance;
- (BOOL)_deviceHasLidClosedPreventingUseOfTouchID;
- (BOOL)_deviceHasPearl;
- (BOOL)_shouldBindBiometricIdentitiesForMechanism:(id)a3 request:(id)a4;
- (BOOL)_shouldDisregardUserIdForPolicy:(int64_t)a3;
- (id)_biometricIdentitiesForRequirement:(__ACMRequirement *)a3 request:(id)a4 error:(id *)a5;
- (id)_buildUiForMechanism:(id)a3 policy:(int64_t)a4 internalInfo:(id)a5 uiDelegate:(id)a6 request:(id)a7 error:(id *)a8;
- (id)_evaluationModeForPolicy:(int64_t)a3;
- (id)_loadACMMechanism:(int64_t)a3 initParams:(id)a4 request:(id)a5 error:(id *)a6;
- (id)_loadACMMechanismFromPlugin:(int64_t)a3 acmContextRecord:(id)a4 internalInfo:(id)a5 request:(id)a6 error:(id *)a7;
- (id)_nonUiMechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 state:(unsigned int *)a8 error:(id *)a9;
- (id)_nonUiSubmechanismsForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 requiredCount:(unint64_t *)a8 error:(id *)a9;
- (id)_preferedError:(id)a3;
- (id)_prepareInitParamsUsingInternalInfo:(id)a3 acmContextRecord:(id)a4;
- (id)_restrictedNonUiMechanism:(id)a3 availabilityEvents:(id *)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 error:(id *)a8;
- (id)_sortedSubmechanisms:(id)a3;
- (unint64_t)_acmRequirementPropertyFlags:(__ACMRequirement *)a3;
- (unsigned)_acmPurposeForPolicy:(int64_t)a3;
- (unsigned)_acmRequirementState:(__ACMRequirement *)a3;
- (unsigned)_acmRequirementType:(__ACMRequirement *)a3;
- (void)_mechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10;
- (void)mechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10;
- (void)mechanismForApplicationPasswordMode:(int64_t)a3 acmContextRecord:(id)a4 options:(id)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10;
@end

@implementation MechanismManagerACM

- (id)_preferedError:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [&off_2EB18 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&off_2EB18);
        }
        uint64_t v8 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v8)
        {
          v10 = (void *)v8;
          goto LABEL_11;
        }
      }
      id v5 = [&off_2EB18 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v9 = [v3 objectEnumerator];
  v10 = [v9 nextObject];

LABEL_11:

  return v10;
}

- (id)_nonUiSubmechanismsForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 requiredCount:(unint64_t *)a8 error:(id *)a9
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_opt_new();
  v18 = objc_opt_new();
  uint64_t v50 = 0;
  v51[0] = &v50;
  v51[1] = 0x2020000000;
  v51[2] = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  unint64_t v19 = *a8;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_6B0C;
  v46[3] = &unk_2C8C0;
  id v20 = (id)objc_opt_new();
  id v47 = v20;
  ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v46);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_7E5C;
  v34[3] = &unk_2CDB0;
  v41 = &v50;
  v34[4] = self;
  id v21 = v14;
  id v35 = v21;
  int64_t v43 = a5;
  id v22 = v15;
  id v36 = v22;
  id v23 = v16;
  id v37 = v23;
  unint64_t v44 = v19;
  id v24 = v20;
  id v38 = v24;
  id v25 = v18;
  v45 = a8;
  id v39 = v25;
  v42 = v48;
  id v26 = v17;
  id v40 = v26;
  ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v34);
  if ((unint64_t)[v25 count] >= *a8)
  {
    if (*a8)
    {
      v27 = 0;
      int v29 = 1;
      goto LABEL_10;
    }
    [v25 removeAllObjects];
    v27 = +[LAErrorHelper silentInternalErrorWithMessage:@"KofN is already satisfied."];
  }
  else
  {
    v27 = [(MechanismManagerACM *)self _preferedError:v26];
    if (*a8 > *(void *)(v51[0] + 24))
    {
      v28 = [v23 log];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_2265C((uint64_t *)a8, (uint64_t)v51, v28);
      }
    }
  }
  int v29 = 0;
LABEL_10:
  if (a9)
  {
    if (v29) {
      v30 = 0;
    }
    else {
      v30 = v27;
    }
    *a9 = v30;
  }
  if (v29)
  {
    v31 = [(MechanismManagerACM *)self _sortedSubmechanisms:v25];
  }
  else
  {
    v31 = 0;
  }

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);

  return v31;
}

- (id)_nonUiMechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 state:(unsigned int *)a8 error:(id *)a9
{
  id v14 = a4;
  id v15 = a6;
  id v81 = a7;
  if (!v15
    || ([v15 objectForKeyedSubscript:@"UserId"],
        id v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        !v14)
    || !v16)
  {
    if (a9)
    {
      +[LAErrorHelper silentInternalErrorWithMessage:@"Bad parameters"];
      id v21 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v21 = 0;
    }
    goto LABEL_108;
  }
  v109[0] = v14;
  v108[0] = @"AcmContextRecord";
  v108[1] = @"UserId";
  v17 = [v15 objectForKeyedSubscript:@"UserId"];
  v109[1] = v17;
  v108[2] = @"EvaluationMode";
  v18 = [(MechanismManagerACM *)self _evaluationModeForPolicy:a5];
  v109[2] = v18;
  unint64_t v19 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:3];
  v79 = +[NSMutableDictionary dictionaryWithDictionary:v19];

  uint64_t v20 = [(MechanismManagerACM *)self _acmRequirementType:a3];
  unsigned int v78 = [(MechanismManagerACM *)self _acmRequirementState:a3];
  if ((v20 & 0xFFFFFFFD) == 1
    && (unint64_t v77 = [(MechanismManagerACM *)self _acmRequirementPropertyFlags:a3]) != 0)
  {
    objc_msgSend(v14, "setFlags:");
  }
  else
  {
    LODWORD(v77) = 0;
  }
  if ((int)v20 <= 18)
  {
    switch((int)v20)
    {
      case 1:
        v99 = 0;
        id v21 = [(MechanismManagerACM *)self loadMechanism:2 initParams:v79 request:v81 error:&v99];
        id v22 = v99;
        goto LABEL_30;
      case 2:
        objc_msgSend(v14, "setPassphrasePurpose:", -[MechanismManagerACM _acmPurposeForPolicy:](self, "_acmPurposeForPolicy:", a5));
        v98 = 0;
        id v21 = [(MechanismManagerACM *)self loadMechanism:2 initParams:v79 request:v81 className:@"MechanismPassphrase" error:&v98];
        id v22 = v98;
LABEL_30:
        v27 = v22;
        goto LABEL_88;
      case 3:
        if ([(MechanismManagerACM *)self _shouldDisregardUserIdForPolicy:a5]) {
          [v79 removeObjectForKey:@"UserId"];
        }
        if ([(MechanismManagerACM *)self _deviceHasPearl])
        {
          if ((v77 & 4) == 0)
          {
            uint64_t v97 = 0;
            id v21 = [(MechanismManagerACM *)self loadMechanism:4 initParams:v79 request:v81 error:&v97];
            v34 = (id *)&v97;
LABEL_62:
            v27 = (__CFString *)*v34;
            if (!v21) {
              goto LABEL_94;
            }
            if ((v77 & 0x10) != 0)
            {
              v56 = +[LAErrorHelper errorWithCode:-1022 message:@"Failed to match the bound identity."];

LABEL_93:
              id v21 = 0;
              v27 = v56;
              goto LABEL_95;
            }
            v92[0] = _NSConcreteStackBlock;
            v92[1] = 3221225472;
            v92[2] = sub_11470;
            v92[3] = &unk_2CD38;
            v95 = a3;
            id v57 = v81;
            id v93 = v57;
            id v21 = v21;
            v94 = v21;
            v58 = sub_11470((uint64_t)v92);
            [(__CFString *)v21 setUpdateConstraintOffset:v58];

            if ([(MechanismManagerACM *)self _shouldBindBiometricIdentitiesForMechanism:v21 request:v57])
            {
              id v91 = 0;
              v59 = [(MechanismManagerACM *)self _biometricIdentitiesForRequirement:a3 request:v57 error:&v91];
              id v60 = v91;
              v61 = v60;
              if (v60)
              {
                v62 = (__CFString *)v60;

                id v21 = 0;
                v27 = v62;
              }
              else
              {
                [(__CFString *)v21 setIdentityUUIDs:v59];
              }
            }
            goto LABEL_88;
          }
          uint64_t v63 = +[LAErrorHelper errorWithCode:-1012 message:@"Touch ID required."];
        }
        else
        {
          if ((v77 & 8) == 0)
          {
            uint64_t v96 = 0;
            id v21 = [(MechanismManagerACM *)self loadMechanism:1 initParams:v79 request:v81 error:&v96];
            v34 = (id *)&v96;
            goto LABEL_62;
          }
          uint64_t v63 = +[LAErrorHelper errorWithCode:-1015 message:@"Pearl required."];
        }
        v27 = (__CFString *)v63;
        goto LABEL_75;
      case 7:
        id v35 = +[LAACMHelper requirement:a3 uint32Property:700];
        id v36 = v35;
        if (!v35)
        {
          v27 = +[LAErrorHelper internalErrorWithMessage:@"Missing k in KofN."];
          id v21 = 0;
          goto LABEL_87;
        }
        *(void *)&long long buf = [v35 unsignedIntegerValue];
        id v83 = 0;
        id v37 = [(MechanismManagerACM *)self _nonUiSubmechanismsForACMRequirement:a3 acmContextRecord:v14 policy:a5 internalInfo:v15 request:v81 requiredCount:&buf error:&v83];
        v27 = (__CFString *)v83;
        if ([v37 count])
        {
          id v38 = (id)buf;
          BOOL v39 = v38 == [v37 count];
          id v21 = +[MechanismKofN mechanismWithK:(void)buf ofSubmechanisms:v37 serial:v39 request:v81];
          if (v21)
          {
            if ([v37 count] != (char *)&dword_0 + 2) {
              goto LABEL_86;
            }
            v76 = [v37 objectAtIndex:0];
            v75 = [v37 objectAtIndex:1];
            objc_opt_class();
            if (((objc_opt_isKindOfClass() & 1) != 0
               && (unsigned __int8 v40 = [(__CFString *)v76 acmFlags], v41 = v75, (v40 & 1) != 0)
               || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
               && (unsigned __int8 v42 = [(__CFString *)v75 acmFlags], v41 = v76, (v42 & 1) != 0))
              && (int64_t v43 = v41) != 0)
            {
              v74 = v43;
              unint64_t v44 = buf;
              if (v44 >= (unint64_t)[v37 count])
              {
                id v47 = v27;
              }
              else
              {
                v73 = +[LAPasscodeHelper sharedInstance];
                v45 = [v15 objectForKeyedSubscript:@"UserId"];
                v82 = v27;
                unsigned int v46 = objc_msgSend(v73, "isPasscodeSetForUser:error:", objc_msgSend(v45, "unsignedIntValue"), &v82);
                id v47 = v82;

                v48 = v74;
                if (!v46) {
                  v48 = 0;
                }
                char v49 = v48;

                id v21 = v49;
              }
              v65 = v74;
            }
            else
            {
              v65 = 0;
              id v47 = v27;
            }

            v27 = v76;
          }
          else
          {
            id v47 = +[LAErrorHelper internalErrorWithMessage:@"Failed to create kofn mechanism."];
            id v21 = 0;
          }

          v27 = v47;
        }
        else
        {
          id v21 = 0;
        }
LABEL_86:

LABEL_87:
        goto LABEL_88;
      case 11:
        goto LABEL_20;
      case 15:
        id v21 = (__CFString *)[objc_alloc((Class)MechanismCompanion) initWithParams:v79 request:v81];
        goto LABEL_50;
      default:
        goto LABEL_59;
    }
  }
  if ((v20 - 26) < 2)
  {
    if (a5 != 1026)
    {
      v53 = +[NSNumber numberWithInteger:a5];
      v54 = +[NSString stringWithFormat:@"Requirement: %d not handled for policy: %@", v20, v53];
      v27 = +[LAErrorHelper internalErrorWithMessage:v54];

LABEL_75:
      id v21 = 0;
      goto LABEL_94;
    }
    id v30 = objc_alloc((Class)MechanismRatchet);
    CFStringRef v100 = @"ACMRequirement";
    v31 = +[NSNumber numberWithUnsignedInt:v20];
    v101 = v31;
    v32 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    v33 = [v32 dictionaryByMergingWith:v79];
    id v21 = (__CFString *)[v30 initWithParams:v33 request:v81];

LABEL_50:
    v27 = 0;
LABEL_88:
    if (v21 && v78 == 3)
    {

      v56 = +[LAErrorHelper errorWithCode:-1 subcode:6 message:@"Unsatisfiable constraint."];

      v66 = [v81 log];
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        v67 = [v15 objectForKeyedSubscript:@"UserId"];
        v68 = +[LAACMHelper catacombUUID:v67];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v68;
        _os_log_impl(&dword_0, v66, OS_LOG_TYPE_DEFAULT, "ACM catacombUUID: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_93;
    }
LABEL_94:
    v56 = v27;
    goto LABEL_95;
  }
  if (v20 == 19)
  {
LABEL_20:
    if (v20 == 19) {
      [v79 setObject:&__kCFBooleanTrue forKey:@"Secondary"];
    }
    id v25 = +[LAACMHelper BOOLEnvironmentVariable:13];
    unsigned int v26 = [v25 BOOLValue];

    if (v26) {
      [v79 setObject:&__kCFBooleanTrue forKey:@"AXMode"];
    }
    id v90 = 0;
    id v21 = [(MechanismManagerACM *)self loadMechanism:3 initParams:v79 request:v81 error:&v90];
    v27 = (__CFString *)v90;
    uint64_t v28 = +[NSSet setWithArray:&off_2EB00];
    int v29 = (void *)v28;
    if (v20 == 11)
    {
      if (!v28) {
        goto LABEL_57;
      }
    }
    else
    {
      if (v78 == 1) {
        int v50 = 1;
      }
      else {
        int v50 = v26;
      }
      if (!v28 || !v50) {
        goto LABEL_57;
      }
    }
    id v51 = objc_alloc((Class)MechanismKofNReorganizer);
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_1157C;
    v85[3] = &unk_2CD60;
    id v86 = v29;
    BOOL v89 = v20 == 19;
    id v87 = v81;
    v88 = v21;
    v52 = v21;
    id v21 = (__CFString *)[v51 initWithMin:0 max:1 k:0 request:v87 apply:v85];

LABEL_57:
    goto LABEL_88;
  }
  if (v20 == 25)
  {
    if (v78 == 1)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      *(void *)&long long v105 = 0x3032000000;
      *((void *)&v105 + 1) = sub_117B0;
      v106 = sub_117C0;
      id v107 = 0;
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_117C8;
      v84[3] = &unk_2CD88;
      v84[4] = &buf;
      uint64_t Property = ACMRequirementGetProperty((int *)a3, 500, (uint64_t)v84);
      if (Property)
      {
        id v24 = +[NSString stringWithFormat:@"Failed to get ACM nonce. amcErr = %d", Property];
        +[LAErrorHelper internalErrorWithMessage:v24];
      }
      else
      {
        uint64_t v64 = *(void *)(*((void *)&buf + 1) + 40);
        uint64_t v102 = LAErrorNonceKey;
        uint64_t v103 = v64;
        id v24 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        +[LAErrorHelper errorWithCode:-1026 message:@"Main key signature required" moreInfo:v24];
      }
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&buf, 8);
      goto LABEL_75;
    }
    v27 = 0;
    v56 = 0;
    id v21 = 0;
  }
  else
  {
LABEL_59:
    v55 = +[NSString stringWithFormat:@"Unexpected ACM requirement: %d", v20];
    v56 = +[LAErrorHelper silentInternalErrorWithMessage:v55];

    id v21 = 0;
    v27 = @"skipping this requirement";
  }
LABEL_95:
  if (a9)
  {
    if (v21) {
      v69 = 0;
    }
    else {
      v69 = v56;
    }
    *a9 = v69;
  }
  if (a8) {
    *a8 = v78;
  }
  v70 = [v81 log];
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    if (v21) {
      v71 = v21;
    }
    else {
      v71 = v27;
    }
    LODWORD(buf) = 67109890;
    DWORD1(buf) = v20;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = v78;
    HIWORD(buf) = 1024;
    LODWORD(v105) = v77;
    WORD2(v105) = 2114;
    *(void *)((char *)&v105 + 6) = v71;
    _os_log_impl(&dword_0, v70, OS_LOG_TYPE_DEFAULT, "ACMRequirement of type:%u, state:%d, flags:%x -> %{public}@", (uint8_t *)&buf, 0x1Eu);
  }

LABEL_108:

  return v21;
}

- (id)_evaluationModeForPolicy:(int64_t)a3
{
  if (a3 == 1008) {
    return &off_2E848;
  }
  else {
    return &off_2E8D8;
  }
}

- (unsigned)_acmRequirementType:(__ACMRequirement *)a3
{
  return ACMRequirementGetType(a3, a2);
}

- (unsigned)_acmRequirementState:(__ACMRequirement *)a3
{
  return ACMRequirementGetState(a3, a2);
}

- (void)mechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10
{
}

- (BOOL)_shouldDisregardUserIdForPolicy:(int64_t)a3
{
  return a3 == 1008;
}

- (void)_mechanismForACMRequirement:(const __ACMRequirement *)a3 acmContextRecord:(id)a4 policy:(int64_t)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10
{
  id v86 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  v18 = (void (**)(id, void, id))a10;
  unint64_t v19 = [v17 payload];
  id v20 = [v19 mutableCopy];
  id v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = (id)objc_opt_new();
  }
  id v23 = v22;

  [v23 setObject:v15 forKeyedSubscript:LACEvaluationRequestPayloadKeyInternalInfo];
  v84 = v23;
  [v17 updatePayload:v23];
  int v96 = 0;
  id v95 = 0;
  id v83 = self;
  id v24 = v86;
  id v25 = [(MechanismManagerACM *)self _nonUiMechanismForACMRequirement:a3 acmContextRecord:v86 policy:a5 internalInfo:v15 request:v17 state:&v96 error:&v95];
  id v26 = v95;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [v17 log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v98 = (uint64_t)v25;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "resolving reorganizer: %@", buf, 0xCu);
    }

    id v106 = v25;
    uint64_t v28 = +[NSArray arrayWithObjects:&v106 count:1];
    uint64_t v29 = +[MechanismKofN mechanismWithK:1 ofSubmechanisms:v28 serial:0 request:v17 preserveStandaloneReorganizers:0];

    if (v29)
    {
      id v25 = (id)v29;
    }
    else
    {
      uint64_t v30 = +[LAErrorHelper internalErrorWithMessage:@"No mechanisms after top-level reorganization."];

      id v25 = 0;
      id v26 = (id)v30;
    }
  }
  v31 = [v15 objectForKeyedSubscript:@"Options"];
  v85 = v31;
  int64_t v77 = a5;
  if (+[LAUtils isLocationBasedPolicy:a5])
  {
    id v32 = v16;
    v33 = v18;
    id v34 = [v31 objectForKeyedSubscript:&off_2E818];
    if (![v34 BOOLValue])
    {
LABEL_23:

      v31 = v85;
      v18 = v33;
      id v16 = v32;
      goto LABEL_24;
    }
    id v78 = v32;
    id v81 = v33;
    id v35 = [v31 objectForKeyedSubscript:&off_2E830];

    if (v35)
    {
      id v16 = v32;
      v18 = v81;
      id v24 = v86;
      goto LABEL_24;
    }
    id v36 = [v25 findMechanismWithEventIdentifier:2];

    v104[0] = &off_2E830;
    id v37 = +[NSNumber numberWithBool:v36 != 0];
    v104[1] = &off_2E848;
    v105[0] = v37;
    uint64_t v38 = objc_msgSend(v31, "objectForKeyedSubscript:");
    BOOL v39 = (void *)v38;
    CFStringRef v40 = @"Enter Passcode";
    if (v38) {
      CFStringRef v40 = (const __CFString *)v38;
    }
    v105[1] = v40;
    v41 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];
    id v34 = [v41 mutableCopy];

    id v32 = v78;
    v33 = v81;
    if (!v36)
    {
      unsigned __int8 v42 = [v25 findMechanismWithEventIdentifier:7];

      if (v42)
      {
        CFStringRef v43 = @"AUTHENTICATE_TO_RETRY_FACE_ID";
LABEL_21:
        v45 = +[LACLocalizationUtils encodeLocalizationKey:v43];
        [v34 setObject:v45 forKeyedSubscript:&off_2E860];

        goto LABEL_22;
      }
      unint64_t v44 = [v25 findMechanismWithEventIdentifier:1];

      if (v44)
      {
        CFStringRef v43 = @"AUTHENTICATE_TO_RETRY_TOUCH_ID";
        goto LABEL_21;
      }
    }
LABEL_22:
    CFStringRef v102 = @"Options";
    id v103 = v34;
    unsigned int v46 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    uint64_t v47 = [v46 dictionaryByMergingWith:v15];

    id v15 = (id)v47;
    a5 = v77;
    id v24 = v86;
    goto LABEL_23;
  }
LABEL_24:
  if (a5 == 1026 && !v25)
  {
    if (+[LAErrorHelper error:v26 hasCode:-1 subcode:6])
    {
      id v48 = objc_alloc((Class)MechanismRatchet);
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_111CC;
      v92[3] = &unk_2CD10;
      id v93 = v15;
      id v94 = v24;
      char v49 = sub_111CC((uint64_t)v92);
      id v25 = [v48 initWithParams:v49 request:v17];

      v31 = v85;
    }
    else
    {
      id v25 = 0;
    }
  }
  int v50 = [v17 log];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v98 = (uint64_t)v25;
    _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "nonUiMechanism: %{public}@", buf, 0xCu);
  }
  if (v25)
  {
    id v51 = v16;
    v82 = v18;
    id v91 = v26;
    uint64_t v52 = [v25 bestEffortAvailableMechanismForRequest:v17 error:&v91];
    id v53 = v91;

    if ((id)v52 != v25 && os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v98 = v52;
      _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "availableNonUiMechanism: %{public}@", buf, 0xCu);
    }
    v54 = v83;
    if (v52)
    {
      id v55 = (id)v52;
      goto LABEL_37;
    }
    if (+[LAErrorHelper error:v53 hasCode:-8]
      && [v25 canRecoverFromError:v53 request:v17])
    {
      id v80 = v51;
      id v90 = v53;
      id v60 = v53;
      v61 = v24;
      id v62 = v60;
      uint64_t v63 = [(MechanismManagerACM *)v83 _loadACMMechanismFromPlugin:2 acmContextRecord:v61 internalInfo:v15 request:v17 error:&v90];
      id v53 = v90;

      if (v63)
      {
        v101[0] = v63;
        v101[1] = v25;
        uint64_t v64 = +[NSArray arrayWithObjects:v101 count:2];
        id v55 = +[MechanismKofN mechanismWithK:2 ofSubmechanisms:v64 serial:1 request:v17];

        v54 = v83;
        [v17 setRetryingForError:v62];

        id v51 = v80;
        id v24 = v86;
        if (v55)
        {
LABEL_37:
          v79 = v51;
          v56 = objc_msgSend(v55, "availabilityEventsForPurpose:", objc_msgSend(v17, "purpose"));
          id v57 = v56;
          v75 = v55;
          if (v52)
          {
            id v88 = v53;
            id v89 = v56;
            id v58 = [(MechanismManagerACM *)v54 _restrictedNonUiMechanism:v55 availabilityEvents:&v89 policy:v77 internalInfo:v15 request:v17 error:&v88];
            id v59 = v89;

            id v26 = v88;
            if (!v58)
            {
              v18 = v82;
              v82[2](v82, 0, v26);
              id v57 = v59;
LABEL_63:
              v31 = v85;
              id v24 = v86;

              id v16 = v79;
              goto LABEL_66;
            }
            if (v58 == v55)
            {
              id v57 = v59;
              id v58 = v55;
            }
            else
            {
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138543362;
                uint64_t v98 = (uint64_t)v58;
                _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "restrictedNonUiMechanism: %{public}@", buf, 0xCu);
              }
              id v57 = v59;
            }
            id v53 = v26;
          }
          else
          {
            id v58 = v55;
          }
          v65 = [v15 objectForKeyedSubscript:@"AuditToken"];
          id v76 = v15;
          v66 = [v15 objectForKeyedSubscript:@"Options"];
          v67 = [v66 objectForKeyedSubscript:&off_2E878];
          v68 = [v58 tccPreflightWithAuditTokenData:v65 auditTokenUsage:v67];

          if (v68 && ([v68 BOOLValue] & 1) == 0)
          {
            v70 = [v58 tccError:0];
            v18 = v82;
            v82[2](v82, 0, v70);
            id v15 = v76;
          }
          else
          {
            v74 = v68;
            v69 = v57;
            id v87 = v53;
            id v15 = v76;
            v70 = [(MechanismManagerACM *)v83 _buildUiForMechanism:v58 policy:v77 internalInfo:v76 uiDelegate:v79 request:v17 error:&v87];
            id v71 = v87;

            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543618;
              uint64_t v98 = (uint64_t)v70;
              __int16 v99 = 2114;
              id v100 = v58;
              _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "uiMechanism: %{public}@ nonUiMechanism: %{public}@", buf, 0x16u);
            }
            if (v70)
            {
              v72 = [v58 mechanismTreeDescription];
              v73 = [[MechanismManagerACMResult alloc] initWithMechanism:v70 availableMechanisms:v69 mechanismTree:v72 internalInfo:v76];
              v18 = v82;
              ((void (**)(id, MechanismManagerACMResult *, id))v82)[2](v82, v73, v71);

              id v15 = v76;
            }
            else
            {
              v18 = v82;
              v82[2](v82, 0, v71);
            }
            id v53 = v71;
            id v57 = v69;
            v68 = v74;
          }

          id v26 = v53;
          goto LABEL_63;
        }
      }
      else
      {

        id v51 = v80;
        id v24 = v86;
      }
    }
    v18 = v82;
    v82[2](v82, 0, v53);
    id v26 = v53;
    v31 = v85;
    id v16 = v51;
    goto LABEL_66;
  }
  v18[2](v18, 0, v26);
LABEL_66:
}

- (BOOL)_deviceHasPearl
{
  return +[DaemonUtils deviceHasPearl];
}

- (unint64_t)_acmRequirementPropertyFlags:(__ACMRequirement *)a3
{
  id v3 = +[LAACMHelper requirement:a3 uint32Property:100];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

+ (MechanismManagerACM)sharedInstance
{
  if (qword_31038 != -1) {
    dispatch_once(&qword_31038, &stru_2CCE8);
  }
  v2 = (void *)qword_31030;

  return (MechanismManagerACM *)v2;
}

- (void)mechanismForApplicationPasswordMode:(int64_t)a3 acmContextRecord:(id)a4 options:(id)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a9;
  id v17 = (void (**)(id, id, void))a10;
  v27[0] = @"PasswordMode";
  v18 = +[NSNumber numberWithInteger:a3];
  v28[0] = v18;
  v28[1] = v13;
  v27[1] = @"AcmContextRecord";
  v27[2] = @"UserId";
  unint64_t v19 = objc_msgSend(v15, "objectForKeyedSubscript:");
  v28[2] = v19;
  id v20 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];

  id v21 = +[MechanismManagerACM sharedInstance];
  id v26 = 0;
  id v22 = [v21 loadMechanism:2 initParams:v20 request:v16 className:@"MechanismPassword" error:&v26];
  id v23 = v26;

  if (v22)
  {
    id v24 = [v14 objectForKey:&off_2E890];
    id v25 = [objc_alloc((Class)MechanismUI) initWithNonUiMechanism:v22 eventProcessing:v24 policy:0 internalInfo:v15 request:v16];
    v17[2](v17, v25, 0);
  }
  else
  {
    ((void (**)(id, id, id))v17)[2](v17, 0, v23);
  }
}

- (unsigned)_acmPurposeForPolicy:(int64_t)a3
{
  return +[LAUtils isApplePayPolicy:a3];
}

- (BOOL)_shouldBindBiometricIdentitiesForMechanism:(id)a3 request:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 updateConstraintOffset];
  BOOL v5 = [v4 unsignedIntValue] == 0;

  return v5;
}

- (id)_biometricIdentitiesForRequirement:(__ACMRequirement *)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = -[MechanismManagerACM _evaluationModeForPolicy:](self, "_evaluationModeForPolicy:", [v8 policy]);
  v10 = +[LAACMHelper requirement:a3 uint32Property:304];
  if (![v10 unsignedIntValue])
  {
    id v26 = 0;
    goto LABEL_30;
  }
  v11 = +[LAACMHelper requirement:a3 dataProperty:303];
  id v12 = (id)(16 * [v10 unsignedIntValue]);
  id v13 = [v11 length];
  if (v13 != v12)
  {
    id v25 = [v8 log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)id v35 = [v11 length];
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = v12;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Unexpected data in kACMRequirementPropertyBioIdentityUUIDs with length of %u, expected: %u", buf, 0xEu);
    }
    goto LABEL_28;
  }
  unint64_t v14 = (unint64_t)v13;
  uint64_t v29 = a5;
  uint64_t v30 = v10;
  v31 = v9;
  id v32 = +[NSMutableArray array];
  if (v12)
  {
    unint64_t v15 = 0;
    do
    {
      id v16 = objc_msgSend(v11, "subdataWithRange:", v15, 16);
      if (v16)
      {
        id v17 = objc_alloc((Class)NSUUID);
        id v18 = v16;
        unint64_t v19 = objc_msgSend(v17, "initWithUUIDBytes:", objc_msgSend(v18, "bytes"));
        if (v19)
        {
          id v20 = +[BiometryHelper sharedInstance];
          id v21 = [v20 device];
          id v33 = 0;
          id v22 = [v21 identityForUUID:v19 error:&v33];
          id v23 = v33;

          if (v22)
          {
            [v32 addObject:v22];
          }
          else
          {
            id v24 = [v8 log];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543618;
              *(void *)id v35 = v19;
              *(_WORD *)&v35[8] = 2114;
              id v36 = v23;
              _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Failed to find identity with UUID %{public}@, error: %{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v23 = [v8 log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            *(void *)id v35 = v18;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Failed to init UUID with %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        unint64_t v19 = [v8 log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          *(void *)id v35 = v11;
          *(_WORD *)&v35[8] = 1024;
          LODWORD(v36) = v15;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Failed to get UUID from ACM Data %{public}@ at offset:%u", buf, 0x12u);
        }
      }

      v15 += 16;
    }
    while (v15 < v14);
  }
  id v25 = v32;
  if (![v32 count])
  {
    v27 = [v8 log];
    v9 = v31;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)id v35 = v11;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Failed to find any of bound identities %{public}@ , check previous error in the log", buf, 0xCu);
    }

    v10 = v30;
    if (v29)
    {
      +[LAErrorHelper errorWithCode:-1 message:@"No bound identity found."];
      id v26 = 0;
      *uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_28:
    id v26 = 0;
    goto LABEL_29;
  }
  id v25 = v32;
  id v26 = v25;
  v10 = v30;
  v9 = v31;
LABEL_29:

LABEL_30:

  return v26;
}

- (id)_sortedSubmechanisms:(id)a3
{
  id v3 = a3;

  return v3;
}

- (BOOL)_deviceHasLidClosedPreventingUseOfTouchID
{
  return 0;
}

- (id)_buildUiForMechanism:(id)a3 policy:(int64_t)a4 internalInfo:(id)a5 uiDelegate:(id)a6 request:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15)
  {
    id v17 = [v14 objectForKey:@"Options"];
    id v18 = [v17 objectForKey:&off_2E890];
    if (!v18)
    {
      v22[0] = &off_2E8C0;
      v22[1] = &off_2E980;
      v23[0] = &__NSDictionary0__struct;
      v23[1] = &__NSDictionary0__struct;
      v22[2] = &off_2E998;
      v22[3] = &off_2E9B0;
      v23[2] = &__NSDictionary0__struct;
      v23[3] = &__NSDictionary0__struct;
      v22[4] = &off_2E848;
      v22[5] = &off_2E8A8;
      v23[4] = &__NSDictionary0__struct;
      v23[5] = &__NSDictionary0__struct;
      v22[6] = &off_2E9C8;
      v23[6] = &__NSDictionary0__struct;
      id v18 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:7];
    }
  }
  else
  {
    id v18 = 0;
  }
  if ([v13 requiresUiWithEventProcessing:v18]) {
    id v19 = [objc_alloc((Class)MechanismUI) initWithNonUiMechanism:v13 eventProcessing:v18 policy:a4 internalInfo:v14 request:v16];
  }
  else {
    id v19 = v13;
  }
  id v20 = v19;
  if (a8) {
    *a8 = 0;
  }

  return v20;
}

- (id)_restrictedNonUiMechanism:(id)a3 availabilityEvents:(id *)a4 policy:(int64_t)a5 internalInfo:(id)a6 request:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = v12;
  if (([v14 isPurposeApplePay] & 1) == 0)
  {
    id v16 = [v13 objectForKeyedSubscript:@"Options"];
    id v17 = [v16 objectForKeyedSubscript:&off_2E9E0];
    unsigned int v18 = [v17 BOOLValue];

    if (!v18) {
      goto LABEL_4;
    }
  }
  id v19 = +[BiometryHelper sharedInstance];
  id v20 = [v13 objectForKeyedSubscript:@"UserId"];
  unsigned __int8 v21 = [v19 isBiometryOnForApplePay:v20];

  if (v21)
  {
LABEL_4:
    id v22 = 0;
    id v23 = v15;
    goto LABEL_22;
  }
  id v24 = [v15 findMechanismWithEventIdentifier:2];
  id v25 = [v15 findMechanismWithEventIdentifier:3];
  uint64_t v26 = [v15 findMechanismWithEventIdentifier:5];
  v27 = (void *)v26;
  if (v24 && v25)
  {
    v38[0] = v24;
    v38[1] = v25;
    uint64_t v28 = +[NSArray arrayWithObjects:v38 count:2];
    id v23 = +[MechanismKofN mechanismWithK:2 ofSubmechanisms:v28 serial:1 request:v14];

LABEL_18:
    id v22 = 0;
    goto LABEL_19;
  }
  if (v24 || v25 || v26)
  {
    if (v25) {
      uint64_t v29 = v25;
    }
    else {
      uint64_t v29 = (void *)v26;
    }
    if (v24) {
      uint64_t v29 = v24;
    }
    id v23 = v29;

    goto LABEL_18;
  }

  id v22 = +[LAErrorHelper errorWithCode:-4 message:@"Biometry is disabled for ApplePay."];
  id v23 = 0;
LABEL_19:

  if (a4 && v23 != v15)
  {
    uint64_t v30 = objc_opt_new();
    v31 = objc_msgSend(v15, "availabilityEventsForPurpose:", objc_msgSend(v14, "purpose"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_12210;
    v35[3] = &unk_2CDD8;
    id v23 = v23;
    id v36 = v23;
    id v37 = v30;
    id v32 = v30;
    [v31 enumerateKeysAndObjectsUsingBlock:v35];

    id v33 = v32;
    *a4 = v33;
  }
LABEL_22:
  if (a8) {
    *a8 = v22;
  }

  return v23;
}

- (id)_loadACMMechanismFromPlugin:(int64_t)a3 acmContextRecord:(id)a4 internalInfo:(id)a5 request:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = [(MechanismManagerACM *)self _prepareInitParamsUsingInternalInfo:a5 acmContextRecord:a4];
  id v14 = [(MechanismManagerACM *)self _loadACMMechanism:a3 initParams:v13 request:v12 error:a7];

  return v14;
}

- (id)_loadACMMechanism:(int64_t)a3 initParams:(id)a4 request:(id)a5 error:(id *)a6
{
  v7 = [(MechanismManagerACM *)self loadMechanism:a3 initParams:a4 request:a5 className:0 error:a6];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a6)
      {
        id v8 = +[NSString stringWithFormat:@"Unexpected mechanism class: %@", v7];
        *a6 = +[LAErrorHelper internalErrorWithMessage:v8];
      }
      v7 = 0;
    }
  }

  return v7;
}

- (id)_prepareInitParamsUsingInternalInfo:(id)a3 acmContextRecord:(id)a4
{
  v10[0] = @"AcmContextRecord";
  v10[1] = @"UserId";
  v11[0] = a4;
  id v5 = a4;
  uint64_t v6 = [a3 objectForKeyedSubscript:@"UserId"];
  v11[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v8 = [v7 mutableCopy];

  return v8;
}

@end