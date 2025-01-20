@interface CPLCloudKitErrors
+ (BOOL)_isCKErrorForRejectedRecord:(id)a3;
+ (BOOL)getCloudKitErrorCode:(int64_t *)a3 internalCode:(int64_t *)a4 fromError:(id)a5;
+ (BOOL)isCloudKitOperationCancelledError:(id)a3;
+ (BOOL)isContainerHasBeenWipedError:(id)a3;
+ (BOOL)isFeatureDisabledError:(id)a3;
+ (BOOL)isOperationCancelledOrDeferredError:(id)a3;
+ (BOOL)isOperationThrottledError:(id)a3;
+ (BOOL)isPartialFailureError:(id)a3;
+ (BOOL)isRecordNotFoundError:(id)a3;
+ (id)CPLErrorForCloudKitError:(id)a3 scopeProvider:(id)a4 withRequestUUIDs:(id)a5 description:(id)a6;
+ (id)CPLErrorForCloudKitError:(id)a3 scopeProvider:(id)a4 withRequestUUIDs:(id)a5 description:(id)a6 arguments:(char *)a7;
+ (id)CPLErrorForCloudKitError:(id)a3 withRequestUUIDs:(id)a4 description:(id)a5;
+ (id)CPLErrorForCloudKitError:(id)a3 withRequestUUIDs:(id)a4 description:(id)a5 arguments:(char *)a6;
+ (id)CPLErrorForCloudKitUploadError:(id)a3 getDestinationRecordIDs:(id)a4 scopeProvider:(id)a5 withRequestUUIDs:(id)a6 uploadAction:(id)a7;
+ (id)_bestErrorForUnderlyingError:(id)a3 scopeProvider:(id)a4;
+ (id)_betterErrorForRecordId:(id)a3 recordError:(id)a4;
+ (id)_errorForCancelledError:(id)a3;
+ (id)_filteredPartialFailureError:(id)a3 itemClass:(Class)a4;
+ (id)_rejectionReasonFromPartialError:(id)a3 identifier:(id)a4;
+ (id)bestErrorForUnderlyingError:(id)a3;
+ (id)errorsPerRecordIDForPartialFailureError:(id)a3;
+ (id)errorsPerZoneIDForPartialFailureError:(id)a3;
+ (id)realErrorForError:(id)a3;
@end

@implementation CPLCloudKitErrors

+ (BOOL)_isCKErrorForRejectedRecord:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 code] - 1;
  if (v4 >= 0x1F || ((0x4405EE01u >> v4) & 1) == 0)
  {
    v5 = [v3 userInfo];
    v6 = [v5 objectForKey:NSUnderlyingErrorKey];

    v7 = [v6 domain];
    unsigned __int8 v8 = [v7 isEqualToString:CKUnderlyingErrorDomain];

    if ((v8 & 1) == 0)
    {

LABEL_11:
      BOOL v11 = 0;
      goto LABEL_12;
    }
    id v9 = [v6 code];

    if (v9 != (id)2038 && v9 != (id)3006) {
      goto LABEL_11;
    }
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

+ (id)_betterErrorForRecordId:(id)a3 recordError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || (id v9 = v8) == 0) {
    sub_1001CE874((uint64_t)a2, (uint64_t)a1);
  }
  v10 = [v8 localizedDescription];
  if (v10)
  {
    BOOL v11 = +[NSString stringWithFormat:@"%@ (for record %@)", v10, v7];
  }
  else
  {
    BOOL v11 = +[NSString stringWithFormat:@"record %@", v7];
  }
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = [v9 userInfo];

  if (v13)
  {
    v14 = [v9 userInfo];
    [v12 setDictionary:v14];

    [v12 setObject:v11 forKey:NSLocalizedDescriptionKey];
  }
  v15 = [v9 domain];
  v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, [v9 code], v12);

  return v16;
}

+ (id)_rejectionReasonFromPartialError:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 userInfo];
  id v8 = [v7 objectForKey:NSUnderlyingErrorKey];
  uint64_t v9 = CKErrorServerDescriptionKey;
  v10 = [v7 objectForKeyedSubscript:CKErrorServerDescriptionKey];
  if (!v10)
  {
    BOOL v11 = [v8 userInfo];
    v10 = [v11 objectForKeyedSubscript:v9];

    if (!v10) {
      goto LABEL_25;
    }
  }
  if ([v10 hasPrefix:@"{"])
  {
    id v12 = [v10 dataUsingEncoding:4];
    if (v12)
    {
      v13 = +[NSJSONSerialization JSONObjectWithData:v12 options:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [v13 objectForKeyedSubscript:@"title"];
        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;

            v10 = v15;
          }
        }
      }
    }
  }
  if ([v10 rangeOfString:v6] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = v10;
    v17 = v16;
    goto LABEL_20;
  }
  v18 = [v10 stringByReplacingOccurrencesOfString:v6 withString:@"<redacted>"];

  id v16 = v18;
  v17 = v16;
  if (!v16)
  {
LABEL_25:
    if (v8
      && ([v8 domain],
          v19 = objc_claimAutoreleasedReturnValue(),
          unsigned int v20 = [v19 isEqualToString:CKUnderlyingErrorDomain],
          v19,
          v20))
    {
      id v21 = objc_alloc((Class)NSString);
      v22 = [v5 domain];
      id v23 = [v21 initWithFormat:@"%@ %ld/%ld", v22, objc_msgSend(v5, "code"), objc_msgSend(v8, "code")];
    }
    else
    {
      id v24 = objc_alloc((Class)NSString);
      v22 = [v5 domain];
      id v23 = [v24 initWithFormat:@"%@ %ld", v22, objc_msgSend(v5, "code"), v26];
    }
    v17 = v23;

    id v16 = 0;
  }
LABEL_20:

  return v17;
}

+ (id)_bestErrorForUnderlyingError:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 domain];
  if ([v8 isEqual:CKErrorDomain])
  {
    id v9 = [v6 code];

    if (v9 == (id)2)
    {
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      char v50 = 0;
      uint64_t v43 = 0;
      v44 = &v43;
      uint64_t v45 = 0x3032000000;
      v46 = sub_1000B39B8;
      v47 = sub_1000B39C8;
      id v48 = 0;
      v10 = [v6 userInfo];
      BOOL v11 = [v10 objectForKey:CKPartialErrorsByItemIDKey];
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = sub_1000B39B8;
      v41 = sub_1000B39C8;
      id v42 = 0;
      v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      v29 = sub_1000B39D0;
      v30 = &unk_10027A5E0;
      uint64_t v35 = objc_opt_class();
      id v36 = a1;
      id v31 = v7;
      v32 = v49;
      v33 = &v43;
      v34 = &v37;
      [v11 enumerateKeysAndObjectsUsingBlock:&v27];
      id v12 = (void *)v38[5];
      if (v12)
      {
        id v13 = v12;
      }
      else
      {
        if (![(id)v44[5] count])
        {
          id v13 = v6;
LABEL_19:

          _Block_object_dispose(&v37, 8);
          _Block_object_dispose(&v43, 8);

          _Block_object_dispose(v49, 8);
          goto LABEL_20;
        }
        id v19 = [(id)v44[5] count];
        unsigned int v20 = (void *)v44[5];
        if ((unint64_t)v19 < 4)
        {
          id v21 = [v20 allKeys];
          uint64_t v23 = [v21 componentsJoinedByString:@", "];
        }
        else
        {
          id v21 = [v20 allKeys];
          v22 = objc_msgSend(v21, "subarrayWithRange:", 0, 3);
          uint64_t v23 = [v22 componentsJoinedByString:@", "];
        }
        uint64_t v24 = v44[5];
        uint64_t v51 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
        uint64_t v52 = v24;
        v25 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        id v13 = +[CPLErrors cplErrorWithCode:18, v6, v25, @"%@ were rejected by server", v23, v27, v28, v29, v30 underlyingError userInfo description];

        id v6 = (id)v23;
      }

      goto LABEL_19;
    }
  }
  else
  {
  }
  if ([v6 code] == (id)20)
  {
    v14 = [v6 domain];
    unsigned int v15 = [v14 isEqualToString:CKErrorDomain];

    if (v15)
    {
      id v16 = [v6 userInfo];
      v17 = [v16 objectForKey:NSUnderlyingErrorKey];

      if (v17)
      {
        id v18 = v17;

        id v6 = v18;
      }
    }
  }
  id v13 = v6;
LABEL_20:

  return v13;
}

+ (id)bestErrorForUnderlyingError:(id)a3
{
  return [a1 _bestErrorForUnderlyingError:a3 scopeProvider:0];
}

+ (id)CPLErrorForCloudKitError:(id)a3 withRequestUUIDs:(id)a4 description:(id)a5
{
  id v5 = [a1 CPLErrorForCloudKitError:a3 scopeProvider:0 withRequestUUIDs:a4 description:a5 arguments:&v8];
  return v5;
}

+ (id)CPLErrorForCloudKitError:(id)a3 withRequestUUIDs:(id)a4 description:(id)a5 arguments:(char *)a6
{
  return [a1 CPLErrorForCloudKitError:a3 scopeProvider:0 withRequestUUIDs:a4 description:a5 arguments:a6];
}

+ (id)CPLErrorForCloudKitError:(id)a3 scopeProvider:(id)a4 withRequestUUIDs:(id)a5 description:(id)a6
{
  id v6 = [a1 CPLErrorForCloudKitError:a3 scopeProvider:a4 withRequestUUIDs:a5 description:a6 arguments:&v9];
  return v6;
}

+ (id)_errorForCancelledError:(id)a3
{
  v7[0] = NSLocalizedDescriptionKey;
  v7[1] = NSUnderlyingErrorKey;
  v8[0] = @"CloudKit operation has been cancelled by user";
  v8[1] = a3;
  id v3 = a3;
  unint64_t v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  id v5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:v4];

  return v5;
}

+ (id)CPLErrorForCloudKitError:(id)a3 scopeProvider:(id)a4 withRequestUUIDs:(id)a5 description:(id)a6 arguments:(char *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (![v12 isCPLError])
  {
    uint64_t v24 = [v12 domain];
    unsigned int v25 = [v24 isEqualToString:CKErrorDomain];

    if (!v25)
    {
      if ([v12 isCPLOperationCancelledError])
      {
        id v35 = v12;
        id v12 = v35;
      }
      else
      {
        v38 = [v12 cplUnderlyingError];
        id v39 = [objc_alloc((Class)NSString) initWithFormat:v15 arguments:a7];
        v40 = [v38 localizedDescription];
        id v35 = +[CPLErrors cplErrorWithCode:80, v12, @"%@ (%@)", v39, v40 underlyingError description];
      }
      goto LABEL_119;
    }
    id v89 = v13;
    uint64_t v26 = [v12 userInfo];
    v88 = [v26 objectForKey:CKErrorRetryAfterKey];

    id v27 = [v12 code];
    if (v27 == (id)2)
    {
      id v28 = [a1 _bestErrorForUnderlyingError:v12 scopeProvider:v13];
      v29 = v28;
      if (v28 == v12)
      {
        uint64_t v33 = 2;
      }
      else
      {
        id v30 = v28;

        id v31 = [v30 domain];
        unsigned int v32 = [v31 isEqualToString:CKErrorDomain];

        if (!v32)
        {
          if ([v30 isCPLError])
          {
            id v42 = v30;
            v49 = v88;
            if (([v30 isCPLOperationCancelledError] & 1) == 0)
            {
              id v35 = v30;
LABEL_118:

              id v12 = v30;
              goto LABEL_119;
            }
          }
          else
          {

            v49 = v88;
            if (![v30 isCPLOperationCancelledError])
            {
              v90 = v30;
              CFStringRef v47 = 0;
              uint64_t v46 = 0;
              uint64_t v48 = 80;
              goto LABEL_108;
            }
            id v42 = 0;
          }
          id v30 = v30;
          id v35 = v30;
LABEL_117:

          goto LABEL_118;
        }
        uint64_t v33 = (uint64_t)[v30 code];
        if (!v88)
        {
          v34 = [v30 userInfo];
          v88 = [v34 objectForKey:CKErrorRetryAfterKey];
        }
        id v12 = v30;
      }
    }
    else
    {
      uint64_t v33 = (uint64_t)v27;
    }
    v90 = v12;
    v41 = [v12 userInfo];
    id v42 = [v41 objectForKey:NSUnderlyingErrorKey];

    if (v42)
    {
      uint64_t v43 = [v42 domain];
      unsigned int v44 = [v43 isEqualToString:CKUnderlyingErrorDomain];

      if (v44)
      {
        uint64_t v45 = (uint64_t)[v42 code];
        if (v45 <= 2023)
        {
          if (v45 > 2010)
          {
            if ((unint64_t)(v45 - 2011) < 2)
            {
LABEL_82:
              CFStringRef v47 = 0;
              uint64_t v46 = 0;
              uint64_t v48 = 1006;
              goto LABEL_107;
            }
          }
          else
          {
            switch(v45)
            {
              case 1002:
                CFStringRef v47 = 0;
                uint64_t v46 = 0;
                uint64_t v48 = 28;
                goto LABEL_107;
              case 1020:
LABEL_96:
                CFStringRef v47 = 0;
                uint64_t v46 = 0;
                uint64_t v48 = 1012;
                goto LABEL_107;
              case 2006:
LABEL_83:
                CFStringRef v47 = 0;
                uint64_t v46 = 0;
                uint64_t v48 = 1000;
                goto LABEL_107;
            }
          }
        }
        else
        {
          switch(v45)
          {
            case 2024:
            case 2030:
            case 2031:
              goto LABEL_83;
            case 2025:
            case 2027:
            case 2028:
            case 2032:
            case 2033:
            case 2034:
            case 2037:
            case 2038:
            case 2040:
            case 2041:
            case 2042:
            case 2043:
            case 2044:
            case 2046:
              break;
            case 2026:
              if (v33 == 26) {
                goto LABEL_92;
              }
              uint64_t v46 = 0;
              CFStringRef v47 = @"Container reset by server";
              uint64_t v48 = 21;
              goto LABEL_107;
            case 2029:
              v55 = [v42 localizedDescription];
              id v56 = [v55 rangeOfString:@"Snapshot in progress"];

              CFStringRef v47 = 0;
              if (v56 == (id)0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v46 = 1;
              }
              else {
                uint64_t v46 = 2;
              }
              uint64_t v48 = 35;
              goto LABEL_107;
            case 2035:
LABEL_91:
              CFStringRef v47 = 0;
              uint64_t v46 = 0;
              uint64_t v48 = 30;
              goto LABEL_107;
            case 2036:
              if (v33 == 26)
              {
LABEL_92:
                CFStringRef v47 = 0;
                uint64_t v46 = 0;
                if ([a1 isContainerHasBeenWipedError:v90]) {
                  uint64_t v48 = 1011;
                }
                else {
                  uint64_t v48 = 23;
                }
              }
              else
              {
LABEL_97:
                CFStringRef v47 = 0;
                uint64_t v46 = 0;
                uint64_t v48 = 23;
              }
              goto LABEL_107;
            case 2039:
LABEL_88:

              id v42 = objc_alloc_init((Class)NSMutableDictionary);
              v49 = v88;
              if (v88)
              {
                [v88 doubleValue];
                uint64_t v48 = 1001;
                if (v63 >= 86400.0) {
                  goto LABEL_136;
                }
                v64 = &off_100294408;
              }
              else
              {
                v64 = &off_100294408;
                uint64_t v48 = 1001;
              }
              goto LABEL_139;
            case 2045:
LABEL_95:
              CFStringRef v47 = 0;
              uint64_t v46 = 0;
              uint64_t v48 = 37;
              goto LABEL_107;
            case 2047:
              CFStringRef v47 = 0;
              uint64_t v46 = 0;
              uint64_t v48 = 2009;
              goto LABEL_107;
            case 2048:
              CFStringRef v47 = 0;
              uint64_t v46 = 0;
              uint64_t v48 = 2008;
              goto LABEL_107;
            case 2049:
              CFStringRef v47 = 0;
              uint64_t v46 = 0;
              uint64_t v48 = 2011;
              goto LABEL_107;
            default:
              if (v45 == 2057)
              {
                CFStringRef v47 = 0;
                uint64_t v46 = 0;
                uint64_t v48 = 2010;
                goto LABEL_107;
              }
              if (v45 != 6000) {
                break;
              }
              char v50 = [v42 userInfo];
              uint64_t v51 = [v50 objectForKey:NSUnderlyingErrorKey];

              if (!v51) {
                goto LABEL_74;
              }
              uint64_t v52 = [v51 domain];
              unsigned int v53 = [v52 isEqualToString:@"CPL"];

              if (v53)
              {
                id v54 = [v51 code];
                if (v54 == (id)11) {
                  uint64_t v48 = 1002;
                }
                else {
                  uint64_t v48 = 80;
                }
                if (v54 == (id)1)
                {
                  uint64_t v48 = 33;
LABEL_72:

LABEL_73:
                  CFStringRef v47 = 0;
                  uint64_t v46 = 0;
                  goto LABEL_107;
                }
                goto LABEL_67;
              }
              v57 = [v51 domain];
              unsigned int v58 = [v57 isEqualToString:@"completeMyMoment"];

              if (v58)
              {
                id v59 = [v51 code];
                if (v59 == (id)11) {
                  uint64_t v48 = 1002;
                }
                else {
                  uint64_t v48 = 80;
                }
                if (v59 == (id)12)
                {
                  uint64_t v48 = 36;
                  goto LABEL_72;
                }
LABEL_67:

                if (v48 == 80) {
                  break;
                }
                goto LABEL_73;
              }
              v60 = [v51 domain];
              unsigned int v61 = [v60 isEqualToString:@"sharedLibrary"];

              if (v61)
              {
                v62 = (char *)[v51 code];
                if ((unint64_t)(v62 - 14) <= 3)
                {
                  uint64_t v48 = qword_10024A110[(void)(v62 - 14)];
                  goto LABEL_72;
                }
              }
LABEL_74:

              break;
          }
        }
      }
    }
    CFStringRef v47 = 0;
    uint64_t v48 = 80;
    if (v33 <= 110)
    {
      uint64_t v46 = 0;
      switch(v33)
      {
        case 2:
        case 4:
        case 22:
        case 23:
          CFStringRef v47 = 0;
          uint64_t v46 = 0;
          uint64_t v48 = 81;
          goto LABEL_107;
        case 3:
          CFStringRef v47 = 0;
          uint64_t v46 = 0;
          uint64_t v48 = 82;
          goto LABEL_107;
        case 6:
        case 7:
          goto LABEL_83;
        case 9:
          goto LABEL_82;
        case 11:
          CFStringRef v47 = 0;
          uint64_t v46 = 0;
          uint64_t v48 = 25;
          goto LABEL_107;
        case 16:
          CFStringRef v47 = 0;
          uint64_t v46 = 0;
          uint64_t v48 = 26;
          goto LABEL_107;
        case 18:
          goto LABEL_88;
        case 20:
          id v30 = v90;
          id v35 = [a1 _errorForCancelledError:v90];
          v49 = v88;
          id v13 = v89;
          break;
        case 21:
          CFStringRef v47 = 0;
          uint64_t v46 = 0;
          uint64_t v48 = 22;
          goto LABEL_107;
        case 25:
          goto LABEL_91;
        case 26:
          goto LABEL_92;
        case 27:
          goto LABEL_96;
        case 28:
          goto LABEL_97;
        case 29:
          goto LABEL_95;
        default:
          goto LABEL_107;
      }
      goto LABEL_117;
    }
    if (v33 <= 114)
    {
      if (v33 == 111)
      {

        id v42 = objc_alloc_init((Class)NSMutableDictionary);
        v49 = v88;
        if (v88)
        {
          [v88 doubleValue];
          uint64_t v48 = 1010;
          if (v87 >= 3600.0)
          {
LABEL_136:
            uint64_t v46 = 0;
            CFStringRef v47 = 0;
            goto LABEL_109;
          }
          v64 = &off_100294418;
        }
        else
        {
          v64 = &off_100294418;
          uint64_t v48 = 1010;
        }
LABEL_139:

        uint64_t v46 = 0;
        CFStringRef v47 = 0;
        v49 = v64;
        goto LABEL_109;
      }
      CFStringRef v47 = 0;
      uint64_t v46 = 0;
      if (v33 == 112) {
        uint64_t v48 = 1009;
      }
      goto LABEL_107;
    }
    if (v33 == 2008)
    {
      CFStringRef v47 = 0;
      uint64_t v46 = 0;
      if (v88) {
        uint64_t v48 = 1000;
      }
      else {
        uint64_t v48 = 81;
      }
      goto LABEL_107;
    }
    if (v33 == 132)
    {
      CFStringRef v47 = 0;
      uint64_t v46 = 0;
      uint64_t v48 = 257;
      goto LABEL_107;
    }
    uint64_t v46 = 0;
    if (v33 == 115) {
      goto LABEL_82;
    }
LABEL_107:

    v49 = v88;
LABEL_108:
    id v42 = objc_alloc_init((Class)NSMutableDictionary);
    if (!v49)
    {
LABEL_110:
      if (v46)
      {
        v66 = +[NSNumber numberWithInteger:v46];
        [v42 setObject:v66 forKeyedSubscript:CPLErrorScopeBusyKey];
      }
      if (v47) {
        [v42 setObject:v47 forKeyedSubscript:CPLErrorResetReason];
      }
      v67 = [v90 cplUnderlyingError];
      id v68 = [objc_alloc((Class)NSString) initWithFormat:v15 arguments:a7];
      if (![v42 count])
      {

        id v42 = 0;
      }
      id v69 = [v42 copy];
      v70 = [v67 localizedDescription];
      uint64_t v71 = v48;
      id v30 = v90;
      id v35 = +[CPLErrors cplErrorWithCode:v71, v90, v69, @"%@ (%@)", v68, v70 underlyingError userInfo description];

      id v13 = v89;
      goto LABEL_117;
    }
LABEL_109:
    [v49 doubleValue];
    v65 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
    [v42 setObject:v65 forKeyedSubscript:CPLErrorRetryAfterDateKey];

    goto LABEL_110;
  }
  id v16 = [objc_alloc((Class)NSString) initWithFormat:v15 arguments:a7];
  v17 = [v12 userInfo];
  id v18 = [v17 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  id v19 = v13;
  if (v18)
  {
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%@ (%@)", v16, v18];

    id v16 = v20;
  }
  id v21 = [v17 mutableCopy];
  v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v36 = v23;

  [v36 setObject:v16 forKey:NSLocalizedDescriptionKey];
  uint64_t v37 = [v12 domain];
  +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v37, [v12 code], v36);
  id v35 = (id)objc_claimAutoreleasedReturnValue();

  id v13 = v19;
LABEL_119:
  v72 = (char *)[v14 count];
  if (v72 && v35)
  {
    v73 = v72;
    if ((unint64_t)v72 < 6)
    {
      id v77 = [v14 componentsJoinedByString:@", "];
    }
    else
    {
      id v74 = objc_alloc((Class)NSString);
      v75 = objc_msgSend(v14, "subarrayWithRange:", v73 - 5, 5);
      v76 = [v75 componentsJoinedByString:@", "];
      id v77 = [v74 initWithFormat:@"..., %@", v76];
    }
    v78 = [v35 userInfo];
    id v79 = [v78 mutableCopy];
    v80 = v79;
    if (v79) {
      id v81 = v79;
    }
    else {
      id v81 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v82 = v81;

    [v82 setObject:v77 forKey:CPLErrorRequestUUIDs];
    id v83 = objc_alloc((Class)NSError);
    v84 = [v35 domain];
    id v85 = objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, objc_msgSend(v35, "code"), v82);

    id v35 = v85;
  }
  if (!v35)
  {
    id v35 = +[CPLErrors unknownError];
  }

  return v35;
}

+ (id)CPLErrorForCloudKitUploadError:(id)a3 getDestinationRecordIDs:(id)a4 scopeProvider:(id)a5 withRequestUUIDs:(id)a6 uploadAction:(id)a7
{
  id v12 = a3;
  id v13 = (void (**)(void))a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [v12 domain];
  if ([v17 isEqualToString:CKErrorDomain])
  {
    id v18 = [v12 code];

    if (v18 == (id)12)
    {
      id v19 = v13[2](v13);
      if ((unint64_t)[v19 count] >= 2)
      {
        id v45 = a1;
        id v20 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", objc_msgSend(v19, "count"));
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        unsigned int v44 = v19;
        id v21 = v19;
        id v22 = [v21 countByEnumeratingWithState:&v50 objects:v57 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v51;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v51 != v24) {
                objc_enumerationMutation(v21);
              }
              [v20 addObject:*(void *)(*((void *)&v50 + 1) + 8 * i)];
            }
            id v23 = [v21 countByEnumeratingWithState:&v50 objects:v57 count:16];
          }
          while (v23);
        }

        id v26 = [v20 count];
        if (v26 != [v21 count])
        {
          id v41 = v15;
          id v42 = v13;
          id v43 = v12;
          id v27 = v16;
          id v28 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v21, "count"));
          v40 = v27;
          id v29 = [objc_alloc((Class)NSString) initWithFormat:@"Tried to %@ the same record twice in the same batch", v27];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v30 = v20;
          id v31 = [v30 countByEnumeratingWithState:&v46 objects:v56 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v47;
            do
            {
              for (j = 0; j != v32; j = (char *)j + 1)
              {
                if (*(void *)v47 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
                if ((unint64_t)[v30 countForObject:v35] >= 2)
                {
                  id v36 = [v14 rejectedScopedIdentifierForRejectedCKRecordID:v35];
                  [v28 setObject:v29 forKeyedSubscript:v36];
                }
              }
              id v32 = [v30 countByEnumeratingWithState:&v46 objects:v56 count:16];
            }
            while (v32);
          }

          if ([v28 count])
          {
            uint64_t v54 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
            id v55 = v28;
            uint64_t v37 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
            v38 = +[CPLErrors cplErrorWithCode:18, v43, v37, @"Tried to %@ the same record twice in the same batch", v40 underlyingError userInfo description];

            id v16 = v40;
            id v12 = v43;

            id v15 = v41;
            id v13 = v42;
            goto LABEL_28;
          }

          id v13 = v42;
          id v12 = v43;
          id v16 = v40;
          id v15 = v41;
        }

        id v19 = v44;
        a1 = v45;
      }
    }
  }
  else
  {
  }
  v38 = [a1 CPLErrorForCloudKitError:v12, v14, v15, @"Failed to %@ some records", v16 scopeProvider withRequestUUIDs description];
LABEL_28:

  return v38;
}

+ (BOOL)getCloudKitErrorCode:(int64_t *)a3 internalCode:(int64_t *)a4 fromError:(id)a5
{
  id v8 = a5;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v34 = 0;
  id v34 = [v8 code];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v9 = [v8 domain];
  unsigned int v10 = [v9 isEqualToString:CKErrorDomain];

  if (v10)
  {
    id v11 = [v8 code];
    v32[3] = (uint64_t)v11;
    if (v11 == (id)2)
    {
      id v12 = [v8 userInfo];
      id v13 = [v12 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000B50D0;
      v22[3] = &unk_10027A608;
      v22[4] = &v31;
      v22[5] = &v27;
      v22[6] = &v23;
      v22[7] = a1;
      [v13 enumerateKeysAndObjectsUsingBlock:v22];
    }
    if (!*((unsigned char *)v24 + 24))
    {
      *((unsigned char *)v24 + 24) = 1;
      id v14 = [v8 userInfo];
      id v15 = [v14 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (v15
        && ([v15 domain],
            id v16 = objc_claimAutoreleasedReturnValue(),
            unsigned int v17 = [v16 isEqualToString:CKUnderlyingErrorDomain],
            v16,
            v17))
      {
        id v18 = [v15 code];
      }
      else
      {
        id v18 = 0;
      }
      v28[3] = (uint64_t)v18;
    }
  }
  int v19 = *((unsigned __int8 *)v24 + 24);
  if (*((unsigned char *)v24 + 24))
  {
    *a3 = v32[3];
    *a4 = v28[3];
  }
  BOOL v20 = v19 != 0;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v20;
}

+ (BOOL)isPartialFailureError:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:CKErrorDomain]) {
    BOOL v5 = [v3 code] == (id)2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_filteredPartialFailureError:(id)a3 itemClass:(Class)a4
{
  id v7 = a3;
  if (([a1 isPartialFailureError:v7] & 1) == 0) {
    sub_1001CE944((uint64_t)v7, (uint64_t)a2, (uint64_t)a1);
  }
  id v8 = [v7 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B5304;
  v15[3] = &unk_10027A630;
  Class v18 = a4;
  SEL v19 = a2;
  id v16 = v7;
  id v20 = a1;
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v9, "count"));
  id v17 = v10;
  id v11 = v7;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  id v12 = v17;
  id v13 = v10;

  return v13;
}

+ (id)errorsPerRecordIDForPartialFailureError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _filteredPartialFailureError:v4 itemClass:objc_opt_class()];

  return v5;
}

+ (id)errorsPerZoneIDForPartialFailureError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _filteredPartialFailureError:v4 itemClass:objc_opt_class()];

  return v5;
}

+ (id)realErrorForError:(id)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000B39B8;
  id v16 = sub_1000B39C8;
  id v4 = a3;
  id v17 = v4;
  if ([a1 isPartialFailureError:v4])
  {
    BOOL v5 = [v4 userInfo];
    id v6 = [v5 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B562C;
    v9[3] = &unk_10027A658;
    id v10 = v4;
    id v11 = &v12;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (BOOL)isRecordNotFoundError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:CKErrorDomain]) {
    BOOL v5 = [v3 code] == (id)11;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isFeatureDisabledError:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKey:NSUnderlyingErrorKey];

  if (v4)
  {
    BOOL v5 = [v4 domain];
    unsigned int v6 = [v5 isEqualToString:CKUnderlyingErrorDomain];

    if (v6)
    {
      id v7 = [v4 userInfo];
      id v8 = [v7 objectForKey:NSUnderlyingErrorKey];

      if (v8)
      {
        uint64_t v9 = [v8 domain];
        LOBYTE(v6) = (([v9 isEqualToString:@"CPL"] & 1) != 0
                   || [v9 isEqualToString:@"completeMyMoment"])
                  && [v8 code] == (id)11;
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isCloudKitOperationCancelledError:(id)a3
{
  return _CKErrorIsCode(a3, 20);
}

+ (BOOL)isOperationCancelledOrDeferredError:(id)a3
{
  id v3 = a3;
  if (([v3 isCPLOperationCancelledError] & 1) != 0
    || ([v3 isCPLOperationDeferredError] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    unsigned int v6 = [v3 domain];
    unsigned int v7 = [v6 isEqualToString:CKErrorDomain];

    if (v7)
    {
      id v8 = [v3 code];
      BOOL v4 = v8 == (id)20 || v8 == (id)132;
    }
    else
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

+ (BOOL)isOperationThrottledError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 domain];
  if (![v4 isEqualToString:CKErrorDomain])
  {

    goto LABEL_7;
  }
  if ([v3 code] != (id)7)
  {
    id v5 = [v3 code];

    if (v5 == (id)6) {
      goto LABEL_6;
    }
LABEL_7:
    unsigned __int8 v6 = [v3 isCPLThrottlingError];
    goto LABEL_8;
  }

LABEL_6:
  unsigned __int8 v6 = 1;
LABEL_8:

  return v6;
}

+ (BOOL)isContainerHasBeenWipedError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)26)
  {
    BOOL v4 = [v3 userInfo];
    id v5 = [v4 objectForKeyedSubscript:CKErrorUserDidResetEncryptedDataKey];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end