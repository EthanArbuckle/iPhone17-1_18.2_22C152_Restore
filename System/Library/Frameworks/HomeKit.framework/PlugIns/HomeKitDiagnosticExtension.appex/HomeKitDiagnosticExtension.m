void sub_100005198(uint64_t a1, void *a2, uint64_t a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v26;
  uint64_t vars8;

  v26 = a2;
  v3 = [v26 mutableCopy];
  v4 = [v26 objectForKey:MTRAttributePathKey];
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "hmf_numberForKey:", HMEndpointIDKey);
    v7 = objc_msgSend(v5, "hmf_numberForKey:", HMClusterIDKey);
    v8 = objc_msgSend(v5, "hmf_numberForKey:", HMAttributeIDKey);
    v9 = +[MTRAttributePath attributePathWithEndpointID:v6 clusterID:v7 attributeID:v8];

    [v3 setObject:v9 forKey:MTRAttributePathKey];
  }
  v10 = [v26 objectForKey:MTRCommandPathKey];
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "hmf_numberForKey:", HMEndpointIDKey);
    v13 = objc_msgSend(v11, "hmf_numberForKey:", HMClusterIDKey);
    v14 = objc_msgSend(v11, "hmf_numberForKey:", HMCommandIDKey);
    v15 = +[MTRCommandPath commandPathWithEndpointID:v12 clusterID:v13 commandID:v14];

    [v3 setObject:v15 forKey:MTRCommandPathKey];
  }
  v16 = [v26 objectForKey:MTREventPathKey];
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "hmf_numberForKey:", HMEndpointIDKey);
    v19 = objc_msgSend(v17, "hmf_numberForKey:", HMClusterIDKey);
    v20 = objc_msgSend(v17, "hmf_numberForKey:", HMEventIDKey);
    v21 = +[MTREventPath eventPathWithEndpointID:v18 clusterID:v19 eventID:v20];

    [v3 setObject:v21 forKey:MTREventPathKey];
  }
  v22 = *(void **)(a1 + 32);
  v23 = [v3 copy];
  [v22 replaceObjectAtIndex:a3 withObject:v23];
}

void sub_100005690(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = a2;
  id v4 = [v3 mutableCopy];
  v5 = [v3 objectForKeyedSubscript:MTRAttributePathKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v35[0] = HMAttributeIDKey;
    v8 = [v7 attribute];
    v36[0] = v8;
    v35[1] = HMClusterIDKey;
    v9 = [v7 cluster];
    v36[1] = v9;
    v35[2] = HMEndpointIDKey;
    v10 = [v7 endpoint];
    v36[2] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

    [v4 setObject:v11 forKey:MTRAttributePathKey];
  }
  v12 = objc_msgSend(v3, "objectForKeyedSubscript:", MTRCommandPathKey, a1);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    v33[0] = HMCommandIDKey;
    v15 = [v14 command];
    v34[0] = v15;
    v33[1] = HMClusterIDKey;
    v16 = [v14 cluster];
    v34[1] = v16;
    v33[2] = HMEndpointIDKey;
    v17 = [v14 endpoint];
    v34[2] = v17;
    v18 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];

    [v4 setObject:v18 forKey:MTRCommandPathKey];
  }
  v19 = [v3 objectForKeyedSubscript:MTREventPathKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  if (v21)
  {
    v31[0] = HMEventIDKey;
    v22 = [v21 event];
    v32[0] = v22;
    v31[1] = HMClusterIDKey;
    v23 = [v21 cluster];
    v32[1] = v23;
    v31[2] = HMEndpointIDKey;
    v24 = [v21 endpoint];
    v32[2] = v24;
    v25 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

    [v4 setObject:v25 forKey:MTREventPathKey];
  }
  v26 = *(void **)(v29 + 32);
  id v27 = [v4 copy];
  [v26 replaceObjectAtIndex:a3 withObject:v27];
}

void sub_100007118(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000748C(id a1)
{
  qword_100036BA8 = (uint64_t)[objc_alloc((Class)NSUUID) initWithUUIDString:@"8FCBC859-A091-41C8-A50D-A7652422D734"];

  _objc_release_x1();
}

void sub_100007F7C(id a1)
{
  qword_100036BB8 = (uint64_t)[objc_alloc((Class)NSUUID) initWithUUIDString:@"DCD43BD3-6928-461D-9C9B-1BC859E81BC7"];

  _objc_release_x1();
}

void sub_100008134(FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = [objc_alloc((Class)NSString) initWithFormat:v10 arguments:&a9];

  id v12 = v11;
  fputs((const char *)[v12 UTF8String], a1);
  fflush(a1);
}

void sub_1000085E4(id a1)
{
  qword_100036BC8 = (uint64_t)[objc_alloc((Class)NSUUID) initWithUUIDString:@"A08F6CA5-EC1E-4DD6-A068-377BA45247B6"];

  _objc_release_x1();
}

uint64_t sub_100008E98(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    id v12 = [v11 rangeOfString:@"/"];
    v13 = v11;
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = [v11 substringToIndex:v12];
    }
    if ([v13 containsString:@"self-token:"])
    {
      id v14 = [v13 mutableCopy];
      objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", @"self-token:", @"token:", 1, 0, objc_msgSend(v14, "length"));
      id v15 = [v14 copy];

      v13 = v15;
    }
    if (([v13 hasPrefix:@"token:"] & 1) == 0)
    {
      if (a5)
      {
        +[NSError hmErrorWithCode:19 description:@"Invalid destination." reason:@"Missing token prefix." suggestion:0];
        uint64_t v22 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

        goto LABEL_29;
      }
LABEL_27:
      uint64_t v22 = 0;
      goto LABEL_28;
    }
    if (a2)
    {
      id v16 = objc_alloc((Class)NSUUID);
      v17 = +[_HMDDeviceHandle identifierNamespace];
      v18 = [v13 dataUsingEncoding:4];
      *a2 = [v16 initWithNamespace:v17 data:v18];
    }
    v19 = [v13 substringFromIndex:objc_msgSend(@"token:", "length")];
    if ([v19 length])
    {
      id v20 = objc_alloc((Class)NSData);
      id v21 = objc_msgSend(v20, "hmf_initWithHexadecimalString:options:", v19, 0);

      if (v21)
      {
        if (a3) {
          *a3 = v21;
        }

        if (a4)
        {
          *a4 = +[HMDAccountHandle accountHandleForDestination:v11];
        }
        uint64_t v22 = 1;
        goto LABEL_28;
      }
      if (!a5) {
        goto LABEL_26;
      }
      CFStringRef v23 = @"Invalid token string.";
      uint64_t v24 = 3;
    }
    else
    {
      if (!a5)
      {
LABEL_26:

        goto LABEL_27;
      }
      CFStringRef v23 = @"Missing token string.";
      uint64_t v24 = 19;
    }
    *a5 = +[NSError hmErrorWithCode:v24 description:@"Invalid destination." reason:v23 suggestion:0];
    goto LABEL_26;
  }
  if (a5)
  {
    +[NSError hmErrorWithCode:20];
    uint64_t v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v22 = 0;
  }
LABEL_29:

  return v22;
}

id sub_1000098E8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      id v9 = +[NSError hmErrorWithCode:20];
LABEL_10:
      id v7 = 0;
      *a2 = v9;
      goto LABEL_18;
    }
LABEL_11:
    id v7 = 0;
    goto LABEL_18;
  }
  if (([v3 hasPrefix:@"device:"] & 1) == 0)
  {
    if (a2)
    {
      id v9 = +[NSError hmErrorWithCode:19 description:@"Invalid destination." reason:@"Missing local device prefix." suggestion:0];
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v5 = [v4 substringFromIndex:objc_msgSend(@"device:", "length")];
  if ([v5 length])
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else if (a2)
    {
      *a2 = +[NSError hmErrorWithCode:19 description:@"Invalid destination." reason:@"Invalid device identifier" suggestion:0];
    }
  }
  else if (a2)
  {
    +[NSError hmErrorWithCode:19 description:@"Invalid destination." reason:@"Missing device identifier." suggestion:0];
    id v7 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

LABEL_18:

  return v7;
}

id sub_10000C888()
{
  if (qword_100036BE8 != -1) {
    dispatch_once(&qword_100036BE8, &stru_10002C840);
  }
  v0 = (void *)qword_100036BF0;

  return v0;
}

void sub_10000C8DC(id a1)
{
  qword_100036BF0 = +[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890._-"];

  _objc_release_x1();
}

void sub_10000CB7C(id a1)
{
  v1 = sub_10000C888();
  id v2 = [v1 mutableCopy];

  [v2 addCharactersInString:@"%0123456789abcdefABCDEF"];
  id v3 = [v2 copy];

  id v4 = (void *)qword_100036BE0;
  qword_100036BE0 = (uint64_t)v3;
}

void sub_10000CF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000CFB0(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = &CC_SHA256_Final_ptr;
  id v4 = &selRef_unsignedLongLongValue;
  if (v2)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = v5;

    id v8 = +[NSPersistentHistoryChange fetchRequest];
    id v9 = +[NSPredicate predicateWithFormat:@"%K = %@", @"changeType", &off_10002F2D0];
    [v8 setPredicate:v9];

    id v10 = +[NSPersistentHistoryChangeRequest fetchHistoryWithFetchRequest:v8];
    [v10 setResultType:4];
    uint64_t v11 = *(void **)(v2 + 16);
    id v196 = 0;
    id v12 = [v11 executeRequest:v10 error:&v196];
    id v13 = v196;
    id v20 = v13;
    if (v12)
    {
      id v170 = v13;
      v172 = v10;
      v174 = v8;
      v176 = v7;
      long long v194 = 0u;
      long long v195 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      id v21 = [v12 result];
      id v22 = [v21 countByEnumeratingWithState:&v192 objects:v200 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v193;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v193 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v192 + 1) + 8 * i);
            id v27 = [v26 tombstone];
            if ([v27 count])
            {
              v28 = *(void **)(v2 + 24);
              uint64_t v29 = [v26 changedObjectID];
              [v28 setObject:v27 forKeyedSubscript:v29];
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v192 objects:v200 count:16];
        }
        while (v23);
      }

      id v4 = &selRef_unsignedLongLongValue;
      id v3 = &CC_SHA256_Final_ptr;
      id v8 = v174;
      id v7 = v176;
      id v20 = v170;
      id v10 = v172;
    }
    else
    {
      sub_100008134(__stderrp, @"Failed to deletion history: %@\n", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    }
  }
  id v30 = [v3[211] fetchHistoryAfterToken:0];
  [v30 setResultType:5];
  uint64_t v161 = *((int *)v4 + 197);
  v31 = *(void **)(a1[4] + v161);
  id v191 = 0;
  v32 = [v31 executeRequest:v30 error:&v191];
  id v39 = v191;
  if (v32)
  {
    v40 = [v32 result];

    id v30 = objc_alloc_init((Class)NSDateFormatter);
    [v30 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZZZ"];
    v41 = +[NSTimeZone systemTimeZone];
    [v30 setTimeZone:v41];

    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    id obj = v40;
    id v158 = [obj countByEnumeratingWithState:&v187 objects:v199 count:16];
    if (!v158) {
      goto LABEL_72;
    }
    uint64_t v156 = *(void *)v188;
    id v157 = v30;
    while (1)
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v188 != v156) {
          objc_enumerationMutation(obj);
        }
        uint64_t v160 = v42;
        v43 = *(void **)(*((void *)&v187 + 1) + 8 * v42);
        v44 = *(FILE **)(*(void *)(a1[6] + 8) + 24);
        id v45 = [v43 transactionNumber];
        v46 = [v43 processID];
        v47 = [v43 bundleID];
        v48 = [v43 author];
        v49 = [v43 timestamp];
        [v30 stringFromDate:v49];
        v154 = v153 = v48;
        v152 = v47;
        sub_100008134(v44, @"Transaction (%lld): %@:%@:%@ at %@\n", v50, v51, v52, v53, v54, v55, (uint64_t)v45);

        long long v185 = 0u;
        long long v186 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        id v162 = [v43 changes];
        CFStringRef v56 = @"modelID";
        id v164 = [v162 countByEnumeratingWithState:&v183 objects:v198 count:16];
        if (v164)
        {
          uint64_t v163 = *(void *)v184;
          do
          {
            v57 = 0;
            do
            {
              if (*(void *)v184 != v163) {
                objc_enumerationMutation(v162);
              }
              v58 = *(void **)(*((void *)&v183 + 1) + 8 * (void)v57);
              unint64_t v60 = (unint64_t)[v58 changeType];
              v177 = *(FILE **)(*(void *)(a1[6] + 8) + 24);
              id v61 = [v58 changeID];
              uint64_t v62 = a1[4];
              uint64_t v175 = (uint64_t)v61;
              unint64_t v171 = v60;
              if (v62)
              {
                if (v60 >= 3)
                {
                  v173 = +[NSString stringWithFormat:@"%zd", v60];
                  uint64_t v62 = a1[4];
                }
                else
                {
                  v173 = off_10002C888[v60];
                }
              }
              else
              {
                v173 = 0;
              }
              id v63 = [v58 changedObjectID];
              v64 = v63;
              if (v62)
              {
                v169 = v58;
                v65 = [v63 entity];
                v66 = [v65 attributesByName];

                v67 = [v66 objectForKeyedSubscript:v56];

                if (v67)
                {
                  v165 = v59;
                  uint64_t v68 = [*(id *)(v62 + 24) objectForKeyedSubscript:v64];
                  v69 = (void *)v68;
                  v167 = v57;
                  if (v68)
                  {
                    v70 = 0;
                    v71 = (void *)v68;
                  }
                  else
                  {
                    v70 = [*(id *)(v62 + v161) existingObjectWithID:v64 error:0];
                    v71 = v70;
                  }
                  uint64_t v73 = [v71 valueForKey:v56];
                  v74 = (void *)v73;
                  v75 = @"???";
                  if (v73) {
                    v75 = (__CFString *)v73;
                  }
                  v76 = v75;

                  if (*(unsigned char *)(v62 + 8))
                  {
                    v77 = [v66 objectForKeyedSubscript:@"homeModelID"];

                    if (v77)
                    {
                      uint64_t v78 = [v71 valueForKey:@"homeModelID"];
                      v79 = (void *)v78;
                      v80 = @"???";
                      if (v78) {
                        v80 = (__CFString *)v78;
                      }
                      v81 = v80;

                      uint64_t v82 = +[NSString stringWithFormat:@"%@[H:%@]", v76, v81, v152, v153, v154];

                      v76 = (__CFString *)v82;
                    }
                  }
                  v72 = sub_10000EBD4(v64, v76);

                  CFStringRef v56 = @"modelID";
                  v59 = v165;
                  v57 = v167;
                }
                else
                {
                  v72 = sub_10000EBD4(v64, 0);
                }
                v83 = v177;
                CFStringRef v84 = v56;

                v58 = v169;
              }
              else
              {
                CFStringRef v84 = v56;
                v72 = 0;
                v83 = v177;
              }

              v152 = v72;
              sub_100008134(v83, @"    Change (%lld): %@ %@", v85, v86, v87, v88, v89, v90, v175);

              if (v171 != 2)
              {
                CFStringRef v56 = v84;
                v97 = v59;
                if (v171 != 1) {
                  goto LABEL_54;
                }
                v98 = [v58 updatedProperties];
                id v99 = [v98 count];

                if (v99)
                {
                  v100 = [v58 updatedProperties];
                  v101 = [v100 allObjects];
                  v102 = [v101 valueForKey:@"name"];

                  v103 = *(FILE **)(*(void *)(a1[6] + 8) + 24);
                  v104 = [v102 sortedArrayUsingSelector:"compare:"];
                  v105 = [v104 componentsJoinedByString:@", "];
                  sub_100008134(v103, @" - %@\n", v106, v107, v108, v109, v110, v111, (uint64_t)v105);

                  goto LABEL_56;
                }
                v122 = *(FILE **)(*(void *)(a1[6] + 8) + 24);
                v123 = @" - (no property changes)\n";
                goto LABEL_55;
              }
              v112 = [v58 tombstone];
              CFStringRef v56 = v84;
              v97 = v59;
              if (![v112 count]) {
                goto LABEL_53;
              }
              v113 = [v112 allKeys];
              if ((unint64_t)[v113 count] <= 1)
              {
                v120 = [v113 firstObject];
                unsigned int v121 = [v120 isEqualToString:v56];

                if (v121)
                {

LABEL_53:
LABEL_54:
                  v122 = *(FILE **)(*(void *)(a1[6] + 8) + 24);
                  v123 = @"\n";
LABEL_55:
                  sub_100008134(v122, v123, v91, v92, v93, v94, v95, v96, v150);
                  goto LABEL_56;
                }
              }
              v178 = v113;
              v166 = v97;
              v168 = v57;
              sub_100008134(*(FILE **)(*(void *)(a1[6] + 8) + 24), @" with tombstone\n", v114, v115, v116, v117, v118, v119, v150);
              long long v181 = 0u;
              long long v182 = 0u;
              long long v179 = 0u;
              long long v180 = 0u;
              v124 = [v112 allKeys];
              v125 = [v124 sortedArrayUsingSelector:"compare:"];

              id v126 = [v125 countByEnumeratingWithState:&v179 objects:v197 count:16];
              if (v126)
              {
                id v127 = v126;
                uint64_t v128 = *(void *)v180;
                do
                {
                  for (j = 0; j != v127; j = (char *)j + 1)
                  {
                    if (*(void *)v180 != v128) {
                      objc_enumerationMutation(v125);
                    }
                    uint64_t v130 = *(void *)(*((void *)&v179 + 1) + 8 * (void)j);
                    v131 = *(FILE **)(*(void *)(a1[6] + 8) + 24);
                    v151 = [v112 objectForKeyedSubscript:v130];
                    sub_100008134(v131, @"        %@ = %@\n", v132, v133, v134, v135, v136, v137, v130);
                  }
                  id v127 = [v125 countByEnumeratingWithState:&v179 objects:v197 count:16];
                }
                while (v127);
              }

              CFStringRef v56 = @"modelID";
              v97 = v166;
              v57 = v168;
LABEL_56:
              v57 = (char *)v57 + 1;
            }
            while (v57 != v164);
            id v138 = [v162 countByEnumeratingWithState:&v183 objects:v198 count:16];
            id v164 = v138;
          }
          while (v138);
        }

        sub_100008134(*(FILE **)(*(void *)(a1[6] + 8) + 24), @"\n", v139, v140, v141, v142, v143, v144, v149);
        uint64_t v42 = v160 + 1;
        id v30 = v157;
      }
      while ((id)(v160 + 1) != v158);
      id v158 = [obj countByEnumeratingWithState:&v187 objects:v199 count:16];
      if (!v158)
      {
LABEL_72:
        id v39 = obj;

        goto LABEL_84;
      }
    }
  }
  sub_100008134(__stderrp, @"Failed to fetch persistent history: %@\n", v33, v34, v35, v36, v37, v38, (uint64_t)v39);
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 2;
  v145 = *(FILE **)(*(void *)(a1[6] + 8) + 24);
  if (v145) {
    BOOL v146 = v145 == __stdoutp;
  }
  else {
    BOOL v146 = 1;
  }
  if (!v146 && v145 != __stderrp && v145 != __stdinp)
  {
    fflush(v145);
    fclose(*(FILE **)(*(void *)(a1[6] + 8) + 24));
    *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
LABEL_84:
}

void sub_10000DD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DDB4(uint64_t a1)
{
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id obj = [*(id *)(a1 + 32) entities];
  id v109 = [obj countByEnumeratingWithState:&v133 objects:v140 count:16];
  if (v109)
  {
    uint64_t v106 = *(void *)v134;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v134 != v106)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }
        uint64_t v110 = v2;
        id v4 = *(void **)(*((void *)&v133 + 1) + 8 * v2);
        id v5 = [v4 superentity];

        if (!v5)
        {
          id v6 = objc_alloc((Class)NSFetchRequest);
          id v7 = [v4 name];
          id v107 = [v6 initWithEntityName:v7];

          [v107 setReturnsObjectsAsFaults:0];
          id v8 = *(void **)(a1 + 40);
          id v132 = 0;
          v103 = [v8 executeFetchRequest:v107 error:&v132];
          id v101 = v132;
          if (v103)
          {
            long long v130 = 0u;
            long long v131 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            id v100 = v103;
            id v105 = [v100 countByEnumeratingWithState:&v128 objects:v139 count:16];
            if (!v105) {
              goto LABEL_61;
            }
            uint64_t v102 = *(void *)v129;
            while (1)
            {
              v112 = 0;
              do
              {
                if (*(void *)v129 != v102) {
                  objc_enumerationMutation(v100);
                }
                uint64_t v115 = *(void **)(*((void *)&v128 + 1) + 8 * (void)v112);
                id v9 = *(FILE **)(a1 + 64);
                id v10 = sub_10000EAF0(*(void *)(a1 + 48), v115);
                sub_100008134(v9, @"%@ {\n", v11, v12, v13, v14, v15, v16, (uint64_t)v10);

                long long v126 = 0u;
                long long v127 = 0u;
                long long v124 = 0u;
                long long v125 = 0u;
                uint64_t v17 = *(void *)(a1 + 48);
                uint64_t v18 = [v115 entity];
                uint64_t v19 = v18;
                if (v17)
                {
                  id v20 = [v18 propertiesByName];
                  id v21 = [v20 allValues];
                  id v113 = [v21 sortedArrayUsingComparator:&stru_10002C8E8];
                }
                else
                {
                  id v113 = 0;
                }

                id v116 = [v113 countByEnumeratingWithState:&v124 objects:v138 count:16];
                if (v116)
                {
                  uint64_t v114 = *(void *)v125;
                  do
                  {
                    id v22 = 0;
                    do
                    {
                      if (*(void *)v125 != v114) {
                        objc_enumerationMutation(v113);
                      }
                      id v23 = *(void **)(*((void *)&v124 + 1) + 8 * (void)v22);
                      uint64_t v24 = [v23 name];
                      id v25 = [v115 valueForKey:v24];

                      id v26 = v23;
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        id v27 = v26;
                      }
                      else {
                        id v27 = 0;
                      }
                      id v28 = v27;

                      if (!v28)
                      {
                        CFStringRef v56 = [v26 userInfo];
                        uint64_t v117 = [v56 objectForKeyedSubscript:@"HMKTTransformerNameKey"];

                        uint64_t v57 = *(void *)(a1 + 48);
                        if (v117 && v25)
                        {
                          if (*(unsigned char *)(v57 + 8))
                          {
                            id v25 = v25;
                            goto LABEL_48;
                          }
                          v67 = +[HMDValueTransformer valueTransformerForName:v117];
                          uint64_t v68 = v67;
                          if (v67)
                          {
                            id v123 = 0;
                            v66 = [v67 reverseTransformedValue:v25 error:&v123];
                            id v69 = v123;

                            if (!v66)
                            {
                              v66 = +[NSString stringWithFormat:@"[[%@: %@]]", v117, v69];
                            }
                            id v25 = v69;
                          }
                          else
                          {
                            v66 = +[NSString stringWithFormat:@"[[%@: transformer not found]]", v117];
                          }

                          uint64_t v57 = *(void *)(a1 + 48);
                        }
                        else
                        {
                          v66 = v25;
                        }
                        id v25 = v66;
                        if (v57)
                        {
LABEL_48:
                          v70 = HMFDescribeCollection();
                        }
                        else
                        {
                          v70 = 0;
                        }

                        v71 = [v70 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n    "];

                        v72 = *(FILE **)(a1 + 64);
                        uint64_t v73 = [v26 name];
                        v80 = (void *)v73;
                        if (v117) {
                          sub_100008134(v72, @"    %@ (%@) = %@\n", v74, v75, v76, v77, v78, v79, v73);
                        }
                        else {
                          sub_100008134(v72, @"    %@ = %@\n", v74, v75, v76, v77, v78, v79, v73);
                        }

                        goto LABEL_53;
                      }
                      if ([v28 isToMany])
                      {
                        BOOL v29 = [v25 count] == 0;
                        id v30 = *(FILE **)(a1 + 64);
                        uint64_t v31 = [v26 name];
                        uint64_t v38 = (void *)v31;
                        if (v29)
                        {
                          sub_100008134(v30, @"    %@ -> []\n", v32, v33, v34, v35, v36, v37, v31);
                        }
                        else
                        {
                          sub_100008134(v30, @"    %@ -> [\n", v32, v33, v34, v35, v36, v37, v31);

                          long long v121 = 0u;
                          long long v122 = 0u;
                          long long v119 = 0u;
                          long long v120 = 0u;
                          id v25 = v25;
                          id v39 = [v25 countByEnumeratingWithState:&v119 objects:v137 count:16];
                          if (v39)
                          {
                            uint64_t v40 = *(void *)v120;
                            do
                            {
                              for (i = 0; i != v39; i = (char *)i + 1)
                              {
                                if (*(void *)v120 != v40) {
                                  objc_enumerationMutation(v25);
                                }
                                uint64_t v42 = *(FILE **)(a1 + 64);
                                v43 = sub_10000EAF0(*(void *)(a1 + 48), *(void **)(*((void *)&v119 + 1) + 8 * i));
                                sub_100008134(v42, @"        %@\n", v44, v45, v46, v47, v48, v49, (uint64_t)v43);
                              }
                              id v39 = [v25 countByEnumeratingWithState:&v119 objects:v137 count:16];
                            }
                            while (v39);
                          }

                          sub_100008134(*(FILE **)(a1 + 64), @"    ]\n", v50, v51, v52, v53, v54, v55, v98);
                        }
                      }
                      else
                      {
                        v58 = *(FILE **)(a1 + 64);
                        v59 = [v26 name];
                        id v99 = sub_10000EAF0(*(void *)(a1 + 48), v25);
                        sub_100008134(v58, @"    %@ -> %@\n", v60, v61, v62, v63, v64, v65, (uint64_t)v59);
                      }
LABEL_53:

                      id v22 = (char *)v22 + 1;
                    }
                    while (v22 != v116);
                    id v81 = [v113 countByEnumeratingWithState:&v124 objects:v138 count:16];
                    id v116 = v81;
                  }
                  while (v81);
                }

                sub_100008134(*(FILE **)(a1 + 64), @"}\n\n", v82, v83, v84, v85, v86, v87, v97);
                v112 = (char *)v112 + 1;
              }
              while (v112 != v105);
              id v88 = [v100 countByEnumeratingWithState:&v128 objects:v139 count:16];
              id v105 = v88;
              if (!v88)
              {
LABEL_61:

                goto LABEL_63;
              }
            }
          }
          uint64_t v89 = __stderrp;
          uint64_t v90 = [v4 name];
          sub_100008134(v89, @"Failed to fetch %@ objects: %@\n", v91, v92, v93, v94, v95, v96, (uint64_t)v90);

          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
LABEL_63:
        }
        uint64_t v2 = v110 + 1;
      }
      while ((id)(v110 + 1) != v109);
      id v109 = [obj countByEnumeratingWithState:&v133 objects:v140 count:16];
    }
    while (v109);
  }
}

void sub_10000E5E4(_Unwind_Exception *a1)
{
}

id sub_10000E6FC(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = +[NSURL fileURLWithPath:a2];
    uint64_t v3 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v2];
    [v3 setReadOnly:1];
    [v3 setUsesPersistentHistoryTracking:1];
    id v4 = [v3 options];
    id v45 = 0;
    id v5 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:v2 options:v4 error:&v45];
    id v6 = v45;

    if (v5)
    {
      uint64_t v37 = v2;
      uint64_t v38 = v6;
      id v39 = v5;
      uint64_t v40 = v3;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obj = [v5 entities];
      id v43 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v43)
      {
        uint64_t v42 = *(void *)v51;
        do
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(void *)v51 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            uint64_t v15 = (objc_class *)objc_opt_class();
            uint64_t v16 = NSStringFromClass(v15);
            [v14 setManagedObjectClassName:v16];

            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v17 = [v14 attributesByName];
            uint64_t v18 = [v17 allValues];

            id v19 = [v18 countByEnumeratingWithState:&v46 objects:v55 count:16];
            if (v19)
            {
              id v20 = v19;
              uint64_t v21 = *(void *)v47;
              do
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(void *)v47 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  id v23 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
                  if ([v23 attributeType] == (id)1800)
                  {
                    uint64_t v24 = [v23 userInfo];
                    id v25 = [v24 mutableCopy];

                    id v26 = [v23 valueTransformerName];
                    [v25 setObject:v26 forKeyedSubscript:@"HMKTTransformerNameKey"];

                    [v23 setUserInfo:v25];
                    [v23 setValueTransformerName:@"HMDIdentityTransformer"];
                  }
                }
                id v20 = [v18 countByEnumeratingWithState:&v46 objects:v55 count:16];
              }
              while (v20);
            }
          }
          id v43 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v43);
      }

      id v5 = v39;
      id v27 = +[NSPersistentContainer persistentContainerWithName:@"hmktool" managedObjectModel:v39];
      uint64_t v3 = v40;
      uint64_t v54 = v40;
      uint64_t v28 = +[NSArray arrayWithObjects:&v54 count:1];
      [v27 setPersistentStoreDescriptions:v28];

      id v44 = v38;
      LOBYTE(v28) = [v27 load:&v44];
      id v6 = v44;

      if (v28)
      {
        id v35 = v27;
      }
      else
      {
        sub_100008134(__stderrp, @"Failed to load CoreData container: %@\n", v29, v30, v31, v32, v33, v34, (uint64_t)v6);
        id v35 = 0;
      }
      uint64_t v2 = v37;
    }
    else
    {
      sub_100008134(__stderrp, @"Failed to read cached model: %@\n", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      id v35 = 0;
    }
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

id sub_10000EAF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    id v6 = [v3 entity];
    uint64_t v7 = [v6 attributesByName];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"modelID"];
    if (v8)
    {
      uint64_t v9 = [v4 valueForKey:@"modelID"];
    }
    else
    {
      uint64_t v9 = 0;
    }

    uint64_t v10 = [v4 objectID];
    id v5 = sub_10000EBD4(v10, v9);
  }

  return v5;
}

id sub_10000EBD4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 URIRepresentation];
  id v5 = [v4 path];
  id v6 = [v5 componentsSeparatedByString:@"/"];

  uint64_t v7 = [v6 objectAtIndexedSubscript:1];
  uint64_t v8 = [v6 objectAtIndexedSubscript:2];
  uint64_t v9 = (void *)v8;
  if (v3) {
    +[NSString stringWithFormat:@"<%@/%@/%@>", v7, v8, v3];
  }
  else {
  uint64_t v10 = +[NSString stringWithFormat:@"<%@/%@>", v7, v8, v12];
  }

  return v10;
}

int64_t sub_10000ECD4(id a1, NSPropertyDescription *a2, NSPropertyDescription *a3)
{
  id v4 = a3;
  id v5 = [(NSPropertyDescription *)a2 name];
  id v6 = [(NSPropertyDescription *)v4 name];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

uint64_t sub_10000F1F8(uint64_t a1, uint64_t a2, void *a3)
{
  char isKindOfClass = objc_opt_isKindOfClass();
  char v6 = isKindOfClass;
  if (a3 && (isKindOfClass & 1) == 0)
  {
    id v7 = +[NSString stringWithFormat:@"Expected %@", a2];
    *a3 = +[NSError hmfErrorWithCode:3 reason:v7];
  }
  return v6 & 1;
}

void sub_10000FD20()
{
  id v0 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"class methods are not supported when adapting NSValueTransformers" userInfo:0];
  objc_exception_throw(v0);
}

void sub_10000FD9C(id a1)
{
  id v1 = objc_alloc_init((Class)NSCache);
  uint64_t v2 = (void *)qword_100036BF8;
  qword_100036BF8 = (uint64_t)v1;

  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v5 stringByAppendingString:@".adaptersByName"];
  [(id)qword_100036BF8 setName:v4];
}

id sub_10000FFCC(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [self valueTransformerForName:v2];
  if (v3)
  {
    id v4 = (void *)v3;

    return v4;
  }
  else
  {
    char v6 = (void *)_HMFPreconditionFailureWithFormat();
    return +[HMDValueTransformer encodeValue:v8 withTransformerNamed:v9 error:v10];
  }
}

void sub_1000105B0(id a1)
{
  qword_100036C10 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

void sub_10001230C(id a1)
{
  qword_100036C20 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

void sub_100013614(id a1)
{
  qword_100036C28 = CFArrayGetTypeID();
  qword_100036C30 = CFDictionaryGetTypeID();
  qword_100036C38 = CFNullGetTypeID();
  qword_100036C40 = CFBooleanGetTypeID();
  qword_100036C48 = CFStringGetTypeID();
  qword_100036C50 = CFNumberGetTypeID();
  qword_100036C58 = CFDataGetTypeID();
  qword_100036C60 = CFDateGetTypeID();
}

void sub_100014604(id a1)
{
  qword_100036C80 = (uint64_t)[objc_alloc((Class)NSUUID) initWithUUIDString:@"297A1FDB-8A3E-443F-A8A8-1F3360785587"];

  _objc_release_x1();
}

void sub_100014738(id a1)
{
  qword_100036C78 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

void sub_100014D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014DB4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  if (![v11 isEqual:@"$top"])
  {
    id v9 = [(id)qword_100036CA8 objectForKeyedSubscript:v11];
    unsigned __int8 v10 = [v7 isEqual:v9];

    if (v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_6:
}

void sub_100014E9C(id a1)
{
  id v1 = +[NSKeyedArchiver archivedDataWithRootObject:0];
  if (!v1)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v6 = v1;
  qword_100036CA0 = (uint64_t)[v1 length];
  uint64_t v2 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:0];
  uint64_t v3 = (void *)qword_100036CA8;
  qword_100036CA8 = v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    id v4 = (void *)_HMFPreconditionFailure();
    +[HMDSecureUnarchiveFromDataTransformer allowedTopLevelClasses];
    return;
  }
}

void sub_100015008(id a1)
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  v3[14] = objc_opt_class();
  v3[15] = objc_opt_class();
  v3[16] = objc_opt_class();
  v3[17] = objc_opt_class();
  v3[18] = objc_opt_class();
  v3[19] = objc_opt_class();
  v3[20] = objc_opt_class();
  v3[21] = objc_opt_class();
  v3[22] = objc_opt_class();
  v3[23] = objc_opt_class();
  v3[24] = objc_opt_class();
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:25];
  uint64_t v2 = (void *)qword_100036C98;
  qword_100036C98 = v1;
}

void sub_10001554C(uint64_t a1, void *a2)
{
  [a2 point];
  double v4 = v3;
  SEL v5 = *(void **)(a1 + 32);
  *(float *)&double v6 = v6;
  id v7 = +[NSNumber numberWithFloat:v6];
  [v5 addObject:v7];

  id v8 = *(void **)(a1 + 32);
  *(float *)&double v9 = v4;
  id v10 = +[NSNumber numberWithFloat:v9];
  [v8 addObject:v10];
}

void sub_1000157FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015814(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100015824(uint64_t a1)
{
}

void sub_10001582C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = +[HMDCoreDataTransformerHMCameraActivityZone valueFromOPACK:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    [*(id *)(a1 + 32) addObject:v8];
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      double v9 = +[NSString stringWithFormat:@"Failed to create HMCameraActivityZone: %@", v6];
      uint64_t v10 = +[NSError hmfErrorWithCode:15 reason:v9];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    *a4 = 1;
  }
}

void sub_100015A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015AA8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = +[HMDCoreDataTransformerHMCameraActivityZone OPACKFromValue:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
  else
  {
    id v8 = +[NSString stringWithFormat:@"Failed to opack HMCameraActivityZone: %@", v5];
    uint64_t v9 = +[NSError hmfErrorWithCode:15 reason:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a3 = 1;
  }
}

void sub_10001622C(id a1)
{
  qword_100036CC0 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

void sub_100016668(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016C08;
  block[3] = &unk_10002CAF8;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t sub_100016724(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100016738(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = a2;
  if (!a2) {
    id v3 = *(void **)(a1 + 32);
  }
  id v6 = v3;
  id v4 = a2;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

void sub_1000167E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  if (!a2) {
    id v5 = *(void **)(a1 + 32);
  }
  v10[0] = v5;
  id v6 = a3;
  if (!a3) {
    id v6 = *(void **)(a1 + 32);
  }
  v10[1] = v6;
  id v7 = a3;
  id v8 = a2;
  id v9 = +[NSArray arrayWithObjects:v10 count:2];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
}

void sub_1000168B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  if (!a2) {
    id v6 = *(void **)(a1 + 32);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  v14[0] = v6;
  id v8 = a3;
  if (!a3) {
    id v8 = *(void **)(a1 + 32);
  }
  v14[1] = v8;
  id v9 = a4;
  if (!a4) {
    id v9 = *(void **)(a1 + 32);
  }
  v14[2] = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  uint64_t v13 = +[NSArray arrayWithObjects:v14 count:3];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v13);
}

void sub_1000169B0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a2;
  if (!a2) {
    id v8 = *(void **)(a1 + 32);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  v18[0] = v8;
  id v10 = a3;
  if (!a3) {
    id v10 = *(void **)(a1 + 32);
  }
  v18[1] = v10;
  id v11 = a4;
  if (!a4) {
    id v11 = *(void **)(a1 + 32);
  }
  v18[2] = v11;
  id v12 = a5;
  if (!a5) {
    id v12 = *(void **)(a1 + 32);
  }
  v18[3] = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = a2;
  uint64_t v17 = +[NSArray arrayWithObjects:v18 count:4];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v17);
}

void sub_100016AC8(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a2;
  if (!a2) {
    id v10 = *(void **)(a1 + 32);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  v22[0] = v10;
  id v12 = a3;
  if (!a3) {
    id v12 = *(void **)(a1 + 32);
  }
  v22[1] = v12;
  id v13 = a4;
  if (!a4) {
    id v13 = *(void **)(a1 + 32);
  }
  v22[2] = v13;
  id v14 = a5;
  if (!a5) {
    id v14 = *(void **)(a1 + 32);
  }
  v22[3] = v14;
  id v15 = a6;
  if (!a6) {
    id v15 = *(void **)(a1 + 32);
  }
  v22[4] = v15;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = a2;
  uint64_t v21 = +[NSArray arrayWithObjects:v22 count:5];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v21);
}

void sub_100016C08(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 16) isValid];
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Forwarding block from server for key %@.", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v9 _fireActualBlockWithArguments:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
  }
  else
  {
    if (v6)
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Dropping request to forward block to remote for key %@, connection is invalid.", (uint8_t *)&v12, 0x16u);
    }
  }
}

void sub_100017004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001701C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001702C(uint64_t a1)
{
}

void sub_100017034(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

void sub_10001717C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isValid])
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v7 _removeActualBlockForKey:*(void *)(a1 + 40)];
  }
  else
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@Dropping request to remove remote block for key %@, connection is invalid.", buf, 0x16u);
    }
  }
}

void sub_1000177C0(id *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 allKeys],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 containsObject:@"argument-is-block"],
        v4,
        v5))
  {
    uint64_t v6 = [v3 objectForKey:@"uniqueKey"];
    id v7 = [v3 objectForKey:@"encoding"];
    id v8 = +[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", [v7 UTF8String]);
    id v9 = objc_msgSend(*(id *)((char *)a1[4] + 65), "forwardingBlockWithArgumentCount:forKey:", (char *)objc_msgSend(v8, "numberOfArguments") - 1, v6);
    if (v9)
    {
      [*(id *)((char *)a1[4] + 65) addBlockNoCopy:v9 forKey:v6];
      id v11 = a1[4];
      int v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = id v20 = v7;
        id v14 = [*(id *)((char *)a1[4] + 65) count];
        *(_DWORD *)buf = 138543874;
        id v23 = v13;
        __int16 v24 = 2048;
        id v25 = v14;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Added block (%lu) on server for key %@.", buf, 0x20u);

        id v7 = v20;
      }

      [a1[5] addObject:v9];
      objc_setAssociatedObject(v9, &unk_100036CC8, v6, (void *)0x301);
      [a1[6] addObject:v9];
    }
    else
    {
      id v16 = a1[4];
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = id v21 = v7;
        id v19 = [*(id *)((char *)a1[4] + 65) count];
        *(_DWORD *)buf = 138543874;
        id v23 = v18;
        __int16 v24 = 2048;
        id v25 = v19;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Failed to construct dummy block (%lu) on client for key %@.", buf, 0x20u);

        id v7 = v21;
      }
    }
  }
  else
  {
    [a1[6] addObject:v3];
  }
}

void sub_100017ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100017EF0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return +[HMCAMDEmbeddedDeviceService confirmSemaphoreAndSignal:*(void *)(a1 + 32)];
}

id sub_100017F10(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return +[HMCAMDEmbeddedDeviceService confirmSemaphoreAndSignal:*(void *)(a1 + 32)];
}

void sub_1000182C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id sub_1000182EC(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void *)(a1 + 32);

  return +[HMCAMDEmbeddedDeviceService confirmSemaphoreAndSignal:v6];
}

id sub_100018344(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 copy];
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 copy];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = a1[4];

  return +[HMCAMDEmbeddedDeviceService confirmSemaphoreAndSignal:v12];
}

void sub_100018490(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@XPC communication error: %@.", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void sub_100018714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100018ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_100018B18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (char *)WeakRetained;
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@Service invalidated, it may have crashed.", buf, 0xCu);
  }
  v3[34] = 0;
  uint64_t v6 = *(void *)(v3 + 57);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * *(void *)(v3 + 25));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019154;
  block[3] = &unk_10002CD98;
  block[4] = v3;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100018CA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (char *)WeakRetained;
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    unsigned int v6 = [*(id *)(v3 + 17) processIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@Service interrupted, it may have crashed, pid %u.", buf, 0x12u);
  }
  v3[34] = 0;
  uint64_t v7 = *(void *)(v3 + 49);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  int v9 = v3;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@Will attempt to re-establish communication after 10 seconds.", buf, 0xCu);
  }
  dispatch_time_t v12 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018EB8;
  block[3] = &unk_10002CD98;
  block[4] = v9;
  dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100018EB8(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    unsigned int v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@Attempting to re-establish communication.", buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) testCommunication])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 34) = 1;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      unsigned int v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully re-established communication.", buf, 0xCu);
    }
  }
  else
  {
    id v11 = *(id *)(a1 + 32);
    dispatch_time_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      unsigned int v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Failed to re-establish communication.", buf, 0xCu);
    }
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * *(void *)(*(void *)(a1 + 32) + 25));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001914C;
    block[3] = &unk_10002CD98;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_10001914C(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetConnection];
}

id sub_100019154(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetConnection];
}

void sub_100019210(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_getAssociatedObject(v3, &unk_100036CC8);
  [*(id *)(*(void *)(a1 + 32) + 65) removeBlock:v3];
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(*(void *)(a1 + 32) + 65) count];
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2048;
    id v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Removed block (%lu) on server for key %@.", (uint8_t *)&v10, 0x20u);
  }
}

void sub_100019550(id a1)
{
  qword_100036CD8 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

void sub_100019854(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A0F0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@Preparing homed for the diagnostic extension.", (uint8_t *)&buf, 0xCu);
    }
    id v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    id v7 = (void *)v3[1];
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    unsigned int v17 = sub_10001EAD4;
    id v18 = &unk_10002CD70;
    id v19 = v3;
    uint64_t v8 = v6;
    id v20 = v8;
    [v7 prepareForDiagnosticExtensionWithCompletion:&buf];
    dispatch_time_t v9 = dispatch_time(0, 120000000000);
    if (dispatch_group_wait(v8, v9))
    {
      id v11 = v3;
      __int16 v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        int v14 = 138543362;
        uint64_t v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Timed out preparing.", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

void sub_10001A300(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = +[NSDate now];
    id v9 = a1;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@Phase Started: %@", (uint8_t *)&v19, 0x16u);
    }
    v6[2](v6);
    __int16 v12 = +[NSDate now];
    [v12 timeIntervalSinceDate:v7];
    uint64_t v14 = v13;

    id v16 = v9;
    unsigned int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = 138543874;
      id v20 = v18;
      __int16 v21 = 2112;
      id v22 = v5;
      __int16 v23 = 2048;
      uint64_t v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Phase Finished: %@, elapsed: %fs", (uint8_t *)&v19, 0x20u);
    }
  }
}

void sub_10001A500(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  unsigned int v2 = *(void **)(a1 + 40);
  if (v2)
  {
    self;
    self;
    id v3 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
    uint64_t v4 = [v3 URLByAppendingPathComponent:@"DiagnosticLogs"];

    self;
    id v5 = +[NSRegularExpression regularExpressionWithPattern:@"HomeKit.(.)*.log(.gz)?" options:1 error:0];
    id v6 = [v2 filesInDir:v4 matchingPattern:v5 excludingPattern:0];
    id v7 = [v6 mutableCopy];

    [v7 sortUsingComparator:&stru_10002CE28];
    uint64_t v8 = (char *)[v7 count];
    if ((unint64_t)v8 >= 5) {
      id v9 = v8 - 5;
    }
    else {
      id v9 = 0;
    }
    if ((unint64_t)v8 >= 5) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = (uint64_t)v8;
    }
    objc_msgSend(v7, "subarrayWithRange:", v9, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    [v1 addObjectsFromArray:v11];
  }
  else
  {
    id v11 = 0;
    [v1 addObjectsFromArray:0];
  }
}

void sub_10001A640(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v32 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v31 = +[NSString stringWithFormat:@"_(homed)_.*memgraph$"];
    uint64_t v2 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:");
    id v3 = MREExceptionTypeToString();
    v48[0] = v3;
    uint64_t v4 = MREExceptionTypeToString();
    v48[1] = v4;
    id v5 = MREExceptionTypeToString();
    v48[2] = v5;
    id v6 = MREExceptionTypeToString();
    v48[3] = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:v48 count:4];

    uint64_t v8 = (void *)v2;
    id v9 = (void *)v7;

    uint64_t v10 = +[NSMutableArray array];
    id v11 = +[NSMutableArray array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = +[RMECacheEnumerator getLogPathsSortedByTime];
    id v36 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v36)
    {
      uint64_t v12 = *(void *)v40;
      uint64_t v33 = v11;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v8, "firstMatchInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length"));

          if (v15)
          {
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_10001EA58;
            v38[3] = &unk_10002CDE8;
            v38[4] = v14;
            unsigned __int8 v16 = objc_msgSend(v9, "na_any:", v38);
            id v17 = [v10 count];
            if ((v16 & 1) != 0 || !v17)
            {
              id v20 = v1;
              __int16 v21 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                id v22 = v10;
                __int16 v23 = v9;
                uint64_t v24 = v1;
                v26 = id v25 = v8;
                *(_DWORD *)long long buf = 138543618;
                id v44 = v26;
                __int16 v45 = 2112;
                long long v46 = v14;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}@Prioritizing %@", buf, 0x16u);

                uint64_t v8 = v25;
                uint64_t v1 = v24;
                id v9 = v23;
                uint64_t v10 = v22;
                id v11 = v33;
              }

              id v18 = +[DEAttachmentItem attachmentWithPath:v14];
              [v10 addObject:v18];
              uint64_t v12 = v34;
            }
            else
            {
              id v18 = +[DEAttachmentItem attachmentWithPath:v14];
              [v11 addObject:v18];
            }
          }
        }
        id v36 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v36);
    }

    id v27 = [v10 arrayByAddingObjectsFromArray:v11];
    id v28 = [v27 count];
    if ((unint64_t)v28 >= 5) {
      uint64_t v29 = 5;
    }
    else {
      uint64_t v29 = (uint64_t)v28;
    }
    uint64_t v30 = objc_msgSend(v27, "subarrayWithRange:", 0, v29);
    id v37 = [v30 copy];

    [v32 addObjectsFromArray:v37];
  }
  else
  {
    id v37 = 0;
    [v32 addObjectsFromArray:0];
  }
}

void sub_10001AA80(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1) {
    goto LABEL_39;
  }
  id v3 = [[HMCAMDEmbeddedDeviceService alloc] initAsRoot];
  [v3 setDirectInvocations:0];
  [v3 start];
  CFStringRef v57 = @"ddt homed";
  uint64_t v4 = +[NSArray arrayWithObjects:&v57 count:1];
  id v50 = 0;
  id v5 = [v3 performCommandFromClass:@"os" method:@"executeShellCommand:" arguments:v4 error:&v50];
  id v6 = v50;

  if (v5 && v6 == 0)
  {
    id v12 = v5;
    objc_opt_class();
    int v13 = objc_opt_isKindOfClass() & 1;
    id v14 = v13 ? v12 : 0;
    id v15 = v14;

    if (v13)
    {
      id v16 = [v12 objectForKey:@"standardOutput"];
      id v17 = self;
      char v52 = 0;
      NSStringEncodingDetectionOptionsKey v58 = NSStringEncodingDetectionSuggestedEncodingsKey;
      v59 = &off_10002F320;
      id v18 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      id v51 = 0;
      NSStringEncoding v19 = +[NSString stringEncodingForData:v16 encodingOptions:v18 convertedString:&v51 usedLossyConversion:&v52];
      id v20 = v51;

      if (v19)
      {
        if (v52)
        {
          id v22 = v17;
          __int16 v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v24 = v46 = v15;
            *(_DWORD *)long long buf = 138543362;
            uint64_t v54 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Lossy conversion was required to convert task data to a string.", buf, 0xCu);

            id v15 = v46;
          }
        }
        id v25 = v20;
      }
      else
      {
        id v31 = v17;
        uint64_t v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint64_t v33 = v47 = v15;
          *(_DWORD *)long long buf = 138543362;
          uint64_t v54 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to convert task data to a string.", buf, 0xCu);

          id v15 = v47;
        }

        id v25 = 0;
      }

      if (v25)
      {
        uint64_t v34 = +[NSFileManager defaultManager];
        id v35 = [v34 temporaryDirectory];
        id v36 = [v35 URLByAppendingPathComponent:@"homed-ddt.txt"];

        id v49 = 0;
        [v25 writeToURL:v36 atomically:1 encoding:4 error:&v49];
        id v6 = v49;
        if (v6)
        {
          id v37 = v1;
          uint64_t v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            long long v39 = v48 = v15;
            *(_DWORD *)long long buf = 138543618;
            uint64_t v54 = v39;
            __int16 v55 = 2112;
            id v56 = v6;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to write ddt stdOut, error: %@", buf, 0x16u);

            id v15 = v48;
          }

          id v45 = 0;
        }
        else
        {
          id v45 = [objc_alloc((Class)DEAttachmentItem) initWithPathURL:v36];
          [v45 setShouldCompress:&__kCFBooleanTrue];
          [v45 setDeleteOnAttach:&__kCFBooleanTrue];
        }
      }
      else
      {
        id v41 = v1;
        long long v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          id v43 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          uint64_t v54 = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@no stdout for ddt", buf, 0xCu);
        }
        id v6 = 0;
        id v45 = 0;
      }
    }
    else
    {
      id v27 = v1;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v54 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@ddt shell result is not a dictionary", buf, 0xCu);
      }
      id v6 = 0;
      id v45 = 0;
    }
  }
  else
  {
    id v9 = v1;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v54 = v11;
      __int16 v55 = 2112;
      id v56 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ddt shell error: %@", buf, 0x16u);
    }
    id v45 = 0;
  }

  if (v45) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  else {
LABEL_39:
  }
    id v45 = 0;
}

void sub_10001B0D0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v150 = *(id *)(a1 + 40);
  if (!v150)
  {
    id v151 = 0;
    [v1 addObjectsFromArray:0];
    goto LABEL_68;
  }
  uint64_t v2 = +[NSFileManager defaultManager];
  if (!v2)
  {
    id v102 = v150;
    v103 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      v104 = HMFGetLogIdentifier();
      *(_DWORD *)v169 = 138543362;
      *(void *)&v169[4] = v104;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%{public}@Failed to get NSFileManager", v169, 0xCu);
    }
    id v100 = 0;
    goto LABEL_65;
  }
  uid_t v3 = getuid();
  uint64_t v4 = +[NSString stringWithUTF8String:getpwuid(v3)->pw_dir];
  id v5 = +[NSURL fileURLWithPath:v4];
  id v6 = [v5 URLByAppendingPathComponent:@"Library"];

  uint64_t v7 = [v6 URLByAppendingPathComponent:@"homed"];

  if (!v7)
  {
LABEL_63:
    id v100 = 0;
    goto LABEL_64;
  }
  char v154 = 0;
  uint64_t v8 = [v7 path];
  unsigned __int8 v9 = [v2 fileExistsAtPath:v8 isDirectory:&v154];

  if ((v9 & 1) == 0)
  {
    id v106 = v150;
    id v107 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
    {
      uint64_t v108 = HMFGetLogIdentifier();
      *(_DWORD *)v169 = 138543618;
      *(void *)&v169[4] = v108;
      __int16 v170 = 2112;
      unint64_t v171 = v7;
      id v109 = "%{public}@Database path doesn't exist: '%@'";
      uint64_t v110 = v107;
      os_log_type_t v111 = OS_LOG_TYPE_INFO;
LABEL_61:
      _os_log_impl((void *)&_mh_execute_header, v110, v111, v109, v169, 0x16u);
    }
LABEL_62:

    goto LABEL_63;
  }
  if (!v154)
  {
    id v106 = v150;
    id v107 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      uint64_t v108 = HMFGetLogIdentifier();
      *(_DWORD *)v169 = 138543618;
      *(void *)&v169[4] = v108;
      __int16 v170 = 2112;
      unint64_t v171 = v7;
      id v109 = "%{public}@Database path is not a directory: '%@'";
      uint64_t v110 = v107;
      os_log_type_t v111 = OS_LOG_TYPE_ERROR;
      goto LABEL_61;
    }
    goto LABEL_62;
  }
  id v153 = 0;
  uint64_t v10 = [v2 URLForDirectory:99 inDomain:1 appropriateForURL:v7 create:1 error:&v153];
  id v11 = v153;
  if (!v10)
  {
    id v114 = v150;
    uint64_t v115 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
    {
      id v116 = HMFGetLogIdentifier();
      *(_DWORD *)v169 = 138543874;
      *(void *)&v169[4] = v116;
      __int16 v170 = 2112;
      unint64_t v171 = v7;
      __int16 v172 = 2112;
      id v173 = v11;
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "%{public}@Failed to create temporary directory %@: %@", v169, 0x20u);
    }
    id v100 = 0;
    id v14 = v11;
    goto LABEL_83;
  }
  id v12 = [v10 URLByAppendingPathComponent:@"homed-database"];
  id v152 = v11;
  unsigned __int8 v13 = [v2 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v152];
  id v14 = v152;

  if ((v13 & 1) == 0)
  {
    id v118 = v150;
    long long v119 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      long long v120 = HMFGetLogIdentifier();
      *(_DWORD *)v169 = 138543874;
      *(void *)&v169[4] = v120;
      __int16 v170 = 2112;
      unint64_t v171 = v12;
      __int16 v172 = 2112;
      id v173 = v14;
      _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "%{public}@Failed to create target directory %@: %@", v169, 0x20u);
    }
    id v100 = 0;
    goto LABEL_82;
  }
  id v131 = v14;
  id v15 = v2;
  id v16 = v7;
  id v132 = v12;
  id v149 = v12;
  v160[0] = _NSConcreteStackBlock;
  v160[1] = 3221225472;
  v160[2] = sub_10001E938;
  v160[3] = &unk_10002CE50;
  v160[4] = v150;
  BOOL v146 = v15;
  long long v129 = objc_retainBlock(v160);
  long long v130 = v16;
  id v17 = objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v16, 0, 7);
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v156 objects:v169 count:16];
  v145 = v18;
  if (!v19)
  {

    goto LABEL_78;
  }
  id v20 = v19;
  long long v125 = v10;
  long long v126 = v7;
  long long v127 = v2;
  long long v128 = v1;
  char v21 = 0;
  uint64_t v22 = *(void *)v157;
  __int16 v23 = v18;
  uint64_t v147 = *(void *)v157;
  do
  {
    uint64_t v24 = 0;
    id v148 = v20;
    do
    {
      if (*(void *)v157 != v22) {
        objc_enumerationMutation(v23);
      }
      id v25 = *(void **)(*((void *)&v156 + 1) + 8 * (void)v24);
      id v27 = [v25 pathExtension];
      unsigned int v28 = [v27 hasPrefix:@"sqlite"];

      if (v28)
      {
        uint64_t v29 = [v25 lastPathComponent];
        if ([v29 hasPrefix:@"datastore."]) {
          goto LABEL_17;
        }
        uint64_t v30 = [v25 lastPathComponent];
        if ([v30 hasPrefix:@"core"])
        {

LABEL_17:
        }
        else
        {
          uint64_t v89 = [v25 lastPathComponent];
          unsigned __int8 v90 = [v89 hasPrefix:@"eventstore"];

          if ((v90 & 1) == 0)
          {
            uint64_t v22 = v147;
            id v20 = v148;
            goto LABEL_50;
          }
        }
        id v31 = [v25 lastPathComponent];
        uint64_t v32 = [v149 URLByAppendingPathComponent:v31];

        if (v32)
        {
          id v155 = 0;
          unsigned __int8 v33 = [v146 copyItemAtURL:v25 toURL:v32 error:&v155];
          id v34 = v155;
          if (v33)
          {
            if ((v21 & 1) == 0)
            {
              id v36 = v150;
              id v37 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                uint64_t v38 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138543618;
                id v162 = v38;
                __int16 v163 = 2112;
                id v164 = v149;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%{public}@Copying database files to '%@'", buf, 0x16u);

                __int16 v23 = v145;
              }
            }
            id v40 = v150;
            id v41 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              long long v42 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543618;
              id v162 = v42;
              __int16 v163 = 2112;
              id v164 = v25;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%{public}@Copied '%@'", buf, 0x16u);

              __int16 v23 = v145;
            }

            id v43 = v25;
            id v44 = v32;
            id v45 = [v43 pathExtension];
            unsigned __int8 v46 = [v45 isEqualToString:@"sqlite"];

            if (v46)
            {
              id v47 = [v43 absoluteString];
              id v48 = [v47 lastPathComponent];
              unsigned __int8 v49 = [v48 hasPrefix:@"core"];

              if (v49)
              {
                id v141 = v43;
                id v142 = v34;
                id v50 = v43;
                id v140 = v44;
                id v51 = v44;
                long long v134 = +[NSMutableArray array];
                char v52 = [v50 path];
                [v134 addObject:v52];

                uint64_t v143 = v51;
                long long v136 = [v51 path];
                long long v133 = [v136 stringByDeletingLastPathComponent];
                uint64_t v144 = v50;
                long long v53 = [v50 lastPathComponent];
                uint64_t v54 = [v53 pathComponents];
                __int16 v55 = [v54 firstObject];
                id v56 = [v55 stringByDeletingPathExtension];
                CFStringRef v57 = +[NSString stringWithFormat:@"%@/%@-dumpobjects.txt", v133, v56];
                [v134 addObject:v57];

                NSStringEncodingDetectionOptionsKey v58 = objc_alloc_init(HMKTDumpObjects);
                id v59 = (id)[(HMKTDumpObjects *)v58 main:v134];

                id v61 = v40;
                uint64_t v62 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  uint64_t v63 = HMFGetLogIdentifier();
                  uint64_t v64 = +[NSNumber numberWithInt:v59];
                  *(_DWORD *)long long buf = 138543874;
                  id v162 = v63;
                  __int16 v163 = 2112;
                  id v164 = v134;
                  __int16 v165 = 2112;
                  v166 = v64;
                  _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "%{public}@dumpObject for [%@] finished with %@", buf, 0x20u);
                }

                uint64_t v65 = +[NSMutableArray array];
                v66 = [v144 path];
                [v65 addObject:v66];

                long long v135 = [v143 path];
                v67 = [v135 stringByDeletingLastPathComponent];
                uint64_t v68 = [v144 lastPathComponent];
                id v69 = [v68 pathComponents];
                v70 = [v69 firstObject];
                [v70 stringByDeletingPathExtension];
                v71 = uint64_t v137 = v61;
                v72 = +[NSString stringWithFormat:@"%@/%@-dumphistory.txt", v67, v71];
                [v65 addObject:v72];

                uint64_t v73 = objc_alloc_init(HMKTDumpHistory);
                id v74 = (id)[(HMKTDumpHistory *)v73 main:v65];

                id v76 = v137;
                uint64_t v77 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                {
                  uint64_t v78 = HMFGetLogIdentifier();
                  uint64_t v79 = +[NSNumber numberWithInt:v74];
                  *(_DWORD *)long long buf = 138543874;
                  id v162 = v78;
                  __int16 v163 = 2112;
                  id v164 = v65;
                  __int16 v165 = 2112;
                  v166 = v79;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "%{public}@dumpHistory for [%@] finished with %@", buf, 0x20u);
                }

                __int16 v23 = v145;
                id v43 = v141;
                id v34 = v142;
                id v44 = v140;
              }
              else
              {
                id v96 = v40;
                uint64_t v97 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v98 = HMFGetLogIdentifier();
                  *(_DWORD *)long long buf = 138543618;
                  id v162 = v98;
                  __int16 v163 = 2112;
                  id v164 = v43;
                  _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%{public}@%@ is not core data database file. Skipping dumpobjects on it.", buf, 0x16u);
                }
                __int16 v23 = v145;
              }
            }
            else
            {
              id v92 = v40;
              uint64_t v93 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              {
                uint64_t v94 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138543618;
                id v162 = v94;
                __int16 v163 = 2112;
                id v164 = v43;
                _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%{public}@%@ is not sqlite file", buf, 0x16u);

                __int16 v23 = v145;
              }
            }

            char v21 = 1;
          }
          else
          {
            id v86 = v150;
            uint64_t v87 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              id v88 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138544130;
              id v162 = v88;
              __int16 v163 = 2112;
              id v164 = v25;
              __int16 v165 = 2112;
              v166 = v32;
              __int16 v167 = 2112;
              id v168 = v34;
              _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy '%@' to '%@': %@", buf, 0x2Au);

              __int16 v23 = v145;
            }
          }
          uint64_t v22 = v147;
          id v20 = v148;
        }
        else
        {
          id v81 = v150;
          uint64_t v82 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            uint64_t v83 = HMFGetLogIdentifier();
            uint64_t v84 = [v25 lastPathComponent];
            *(_DWORD *)long long buf = 138543874;
            id v162 = v83;
            __int16 v163 = 2112;
            id v164 = v149;
            __int16 v165 = 2112;
            v166 = v84;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%{public}@Failed to create temporary file URL: '%@' '%@'", buf, 0x20u);
          }
          uint64_t v22 = v147;
          id v20 = v148;
        }
      }
LABEL_50:
      uint64_t v24 = (char *)v24 + 1;
    }
    while (v20 != v24);
    id v20 = [v23 countByEnumeratingWithState:&v156 objects:v169 count:16];
  }
  while (v20);

  uint64_t v2 = v127;
  uint64_t v1 = v128;
  uint64_t v10 = v125;
  uint64_t v7 = v126;
  if (v21)
  {

    id v99 = [objc_alloc((Class)DEAttachmentItem) initWithPathURL:v149];
    [v99 setShouldCompress:&__kCFBooleanTrue];
    [v99 setDeleteOnAttach:&__kCFBooleanTrue];
    *(void *)v169 = v99;
    id v100 = +[NSArray arrayWithObjects:v169 count:1];

    goto LABEL_81;
  }
LABEL_78:
  id v122 = v150;
  id v123 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
  {
    long long v124 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v162 = v124;
    _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "%{public}@No files copied", buf, 0xCu);
  }

  id v100 = 0;
LABEL_81:
  id v14 = v131;
  id v12 = v132;
LABEL_82:

LABEL_83:
LABEL_64:

LABEL_65:
  v112 = &__NSArray0__struct;
  if (v100) {
    v112 = v100;
  }
  id v151 = v112;

  [v1 addObjectsFromArray:v151];
LABEL_68:
}

void sub_10001C1B8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v51 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = +[NSUUID UUID];
    objc_opt_class();
    self;
    if (qword_100036CE0 != -1) {
      dispatch_once(&qword_100036CE0, &stru_10002CE90);
    }
    id v3 = (id)qword_100036CE8;
    uint64_t v4 = +[NSDate now];
    uint64_t v5 = [v3 stringFromDate:v4];

    id v6 = +[NSFileManager defaultManager];
    uint64_t v7 = [v6 temporaryDirectory];
    id v50 = (void *)v5;
    uint64_t v8 = +[NSString stringWithFormat:@"HK_Network_Diagnostics_%@", v5];
    unsigned __int8 v9 = [v7 URLByAppendingPathComponent:v8];

    id v10 = objc_alloc((Class)HMFNetworkDiagnosticCollector);
    id v12 = objc_msgSend(v10, "initWithQueue:", objc_getProperty(v1, v11, 32, 1));
    id v14 = v1;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Starting network diagnostics session: %@", buf, 0x16u);
    }
    id v17 = objc_alloc((Class)HMFDispatchContext);
    id v19 = objc_msgSend(v17, "initWithQueue:", objc_getProperty(v14, v18, 32, 1));
    *(void *)long long buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10001D95C;
    id v69 = &unk_10002CF08;
    id v70 = v14;
    id v20 = v2;
    id v71 = v20;
    id v21 = v9;
    id v72 = v21;
    id v22 = v12;
    id v73 = v22;
    __int16 v23 = +[HMFFuture inContext:v19 perform:buf];

    id location = 0;
    id v57 = 0;
    unsigned __int8 v49 = v23;
    [v23 waitForResult:&v57 orError:&location withTimeout:150.0];
    [v22 stop];
    long long v53 = [v22 diagnosticReport];
    id v25 = v14;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v64 = 138544130;
      *(void *)&v64[4] = v27;
      *(_WORD *)&v64[12] = 2112;
      *(void *)&v64[14] = v57;
      *(_WORD *)&v64[22] = 2112;
      id v65 = location;
      LOWORD(v66) = 2112;
      *(void *)((char *)&v66 + 2) = v53;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%{public}@Completed network diagnostics with result/error: %@/%@. Report:\n%@", v64, 0x2Au);
    }
    unsigned int v28 = +[NSMutableArray arrayWithCapacity:2];
    uint64_t v29 = +[NSFileManager defaultManager];
    uint64_t v30 = [v21 path];
    unsigned __int8 v31 = [v29 fileExistsAtPath:v30 isDirectory:0];

    if ((v31 & 1) == 0)
    {
      uint64_t v32 = +[NSFileManager defaultManager];
      [v32 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:0];
    }
    unsigned __int8 v33 = [v21 URLByAppendingPathComponent:@"bonjour_records.txt"];
    id obj = location;
    [v53 writeToURL:v33 atomically:1 encoding:4 error:&obj];
    objc_storeStrong(&location, obj);
    if (location)
    {
      id v35 = v25;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = id v37 = v20;
        *(_DWORD *)uint64_t v64 = 138543618;
        *(void *)&v64[4] = v38;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = location;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to write network diagnostics report to file with error: %@", v64, 0x16u);

        id v20 = v37;
      }
    }
    id v39 = [objc_alloc((Class)DEAttachmentItem) initWithPathURL:v33];
    [v28 addObject:v39];

    id v40 = +[NSFileManager defaultManager];
    id v41 = [v21 path];
    id v54 = location;
    long long v42 = [v40 contentsOfDirectoryAtPath:v41 error:&v54];
    objc_storeStrong(&location, v54);
    *(void *)uint64_t v64 = _NSConcreteStackBlock;
    *(void *)&v64[8] = 3221225472;
    *(void *)&v64[16] = sub_10001DE58;
    id v65 = &unk_10002CF30;
    *(void *)&long long v66 = v25;
    id v43 = v21;
    *((void *)&v66 + 1) = v43;
    id v44 = v28;
    id v67 = v44;
    objc_msgSend(v42, "na_each:", v64);

    id v46 = v25;
    id v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      id v48 = HMFGetLogIdentifier();
      *(_DWORD *)NSStringEncodingDetectionOptionsKey v58 = 138543874;
      id v59 = v48;
      __int16 v60 = 2112;
      id v61 = v44;
      __int16 v62 = 2112;
      id v63 = location;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@Done with diagnostic attachments %@. Error: %@", v58, 0x20u);
    }
    id v52 = [v44 copy];

    [v51 addObjectsFromArray:v52];
  }
  else
  {
    id v52 = 0;
    [v51 addObjectsFromArray:0];
  }
}

void sub_10001C904(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    goto LABEL_41;
  }
  id v86 = +[NSFileManager defaultManager];
  uint64_t v84 = +[NSURL fileURLWithPath:@"/tmp"];
  uint64_t v87 = [v84 URLByAppendingPathComponent:@"HKSV" isDirectory:1];
  uint64_t v2 = [v87 path];
  unsigned __int8 v3 = [v86 fileExistsAtPath:v2];

  if (v3)
  {
    uint64_t v85 = +[NSMutableArray arrayWithObject:@"VideoAnalysisSessionLogs"];
    id v77 = objc_alloc_init((Class)NSDateFormatter);
    [v77 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    uint64_t v4 = +[NSDate now];
    uint64_t v5 = [v77 stringFromDate:v4];
    [v85 addObject:v5];

    id v6 = +[NSMutableCharacterSet alphanumericCharacterSet];
    uint64_t v82 = [v6 invertedSet];

    uint64_t v7 = [*(id *)(v1 + 8) currentHome];
    uint64_t v8 = [v7 name];
    unsigned __int8 v9 = [v8 componentsSeparatedByCharactersInSet:v82];
    id v76 = [v9 componentsJoinedByString:&stru_10002EE08];

    objc_msgSend(v85, "na_safeAddObject:", v76);
    id v10 = [*(id *)(v1 + 16) name];
    SEL v11 = [v10 componentsSeparatedByCharactersInSet:v82];
    uint64_t v75 = [v11 componentsJoinedByString:&stru_10002EE08];

    objc_msgSend(v85, "na_safeAddObject:", v75);
    id v81 = +[HMFSystemInfo systemInfo];
    [v81 productClass];
    id v12 = HMFProductClassToString();
    objc_msgSend(v85, "na_safeAddObject:", v12);

    unsigned __int8 v13 = [v81 softwareVersion];
    id v14 = [v13 buildVersion];
    objc_msgSend(v85, "na_safeAddObject:", v14);

    id v74 = [v85 componentsJoinedByString:@"_"];
    uint64_t v15 = [v86 temporaryDirectory];
    id v16 = [(id)v15 URLByAppendingPathComponent:v74];

    id v17 = +[NSRegularExpression regularExpressionWithPattern:@"\\.jsonl$" options:1 error:0];
    id v72 = v87;
    id v83 = v16;
    id v79 = v17;
    id v73 = self;
    v80 = +[NSFileManager defaultManager];
    [v80 removeItemAtURL:v83 error:0];
    id v107 = 0;
    LOBYTE(v15) = [v80 createDirectoryAtURL:v83 withIntermediateDirectories:1 attributes:0 error:&v107];
    id v71 = v107;
    if (v15)
    {
      uint64_t v103 = 0;
      v104 = &v103;
      uint64_t v105 = 0x2020000000;
      uint64_t v106 = 0;
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      uint64_t v97 = sub_10001D5C8;
      uint64_t v98 = &unk_10002CFC8;
      id v68 = v83;
      id v99 = v68;
      id v18 = v80;
      id v101 = &v103;
      id v102 = v73;
      id v67 = v18;
      id v100 = v18;
      id v70 = v72;
      id v89 = v79;
      id v88 = v96;
      uint64_t v91 = self;
      v116[0] = _NSConcreteStackBlock;
      v116[1] = 3221225472;
      v116[2] = sub_10001D824;
      v116[3] = &unk_10002CFA0;
      v116[4] = v91;
      id v69 = objc_retainBlock(v116);
      id v19 = +[NSFileManager defaultManager];
      v129[0] = NSURLNameKey;
      v129[1] = NSURLIsDirectoryKey;
      id v20 = +[NSArray arrayWithObjects:v129 count:2];
      id v21 = [v19 enumeratorAtURL:v70 includingPropertiesForKeys:v20 options:4 errorHandler:v69];

      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id obj = v21;
      id v22 = [obj countByEnumeratingWithState:&v112 objects:v123 count:16];
      if (v22)
      {
        uint64_t v92 = *(void *)v113;
        do
        {
          id v93 = v22;
          for (i = 0; i != v93; i = (char *)i + 1)
          {
            if (*(void *)v113 != v92) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v112 + 1) + 8 * i);
            id v110 = 0;
            id v111 = 0;
            unsigned __int8 v26 = [v24 getResourceValue:&v111 forKey:NSURLNameKey error:&v110];
            id v27 = v111;
            id v28 = v110;
            if (v26)
            {
              id v108 = 0;
              id v109 = 0;
              unsigned __int8 v29 = [v24 getResourceValue:&v109 forKey:NSURLIsDirectoryKey error:&v108];
              id v30 = v109;
              id v94 = v108;
              if (v29)
              {
                if (([v30 BOOLValue] & 1) == 0)
                {
                  if (!v89
                    || (objc_msgSend(v89, "firstMatchInString:options:range:", v27, 0, 0, objc_msgSend(v27, "length")), unsigned __int8 v31 = objc_claimAutoreleasedReturnValue(), v32 = v31 == 0, v31, !v32))
                  {
                    v97((uint64_t)v88, v24);
                  }
                }
              }
              else
              {
                id v39 = v91;
                id v40 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  id v41 = HMFGetLogIdentifier();
                  long long v42 = [v24 path];
                  *(_DWORD *)long long buf = 138543874;
                  id v118 = v41;
                  __int16 v119 = 2112;
                  long long v120 = v42;
                  __int16 v121 = 2112;
                  id v122 = v94;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@Could not get NSURLIsDirectoryKey for '%@': %@", buf, 0x20u);
                }
              }
            }
            else
            {
              id v34 = v91;
              id v35 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                id v36 = HMFGetLogIdentifier();
                id v37 = [v24 path];
                *(_DWORD *)long long buf = 138543874;
                id v118 = v36;
                __int16 v119 = 2112;
                long long v120 = v37;
                __int16 v121 = 2112;
                id v122 = v28;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not get NSURLNameKey for '%@': %@", buf, 0x20u);
              }
            }
          }
          id v22 = [obj countByEnumeratingWithState:&v112 objects:v123 count:16];
        }
        while (v22);
      }

      BOOL v43 = v104[3] == 0;
      id v45 = v73;
      if (v43)
      {
        HMFGetOSLogHandle();
        uint64_t v64 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v65 = (id)objc_claimAutoreleasedReturnValue();
          long long v66 = [v70 path];
          *(_DWORD *)id v123 = 138543618;
          id v124 = v65;
          __int16 v125 = 2112;
          long long v126 = v66;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%{public}@Did not find any files matching inclusion/exclusion regexes in '%@'", v123, 0x16u);
        }
        [v67 removeItemAtURL:v68 error:0];
        id v50 = 0;
      }
      else
      {
        HMFGetOSLogHandle();
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          id v48 = (void *)v104[3];
          unsigned __int8 v49 = [v70 path];
          *(_DWORD *)id v123 = 138543874;
          id v124 = v47;
          __int16 v125 = 2048;
          long long v126 = v48;
          __int16 v127 = 2112;
          id v128 = v49;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%{public}@Found %lu files matching inclusion/exclusion regexes in '%@'", v123, 0x20u);
        }
        id v50 = [objc_alloc((Class)DEAttachmentItem) initWithPathURL:v68];
        id v51 = +[NSNumber numberWithBool:1];
        [v50 setShouldCompress:v51];

        id v52 = +[NSNumber numberWithBool:1];
        [v50 setDeleteOnAttach:v52];
      }
      id v63 = v50;

      _Block_object_dispose(&v103, 8);
    }
    else
    {
      id v59 = v73;
      __int16 v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        id v61 = HMFGetLogIdentifier();
        __int16 v62 = [v83 path];
        *(_DWORD *)id v123 = 138543874;
        id v124 = v61;
        __int16 v125 = 2112;
        long long v126 = v62;
        __int16 v127 = 2112;
        id v128 = v71;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%{public}@Could not create directory at '%@': %@", v123, 0x20u);
      }
      id v63 = 0;
    }

    id v95 = v63;
  }
  else
  {
    id v54 = objc_opt_class();
    __int16 v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      id v56 = HMFGetLogIdentifier();
      id v57 = [v87 path];
      *(_DWORD *)id v123 = 138543618;
      id v124 = v56;
      __int16 v125 = 2112;
      long long v126 = v57;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%{public}@No HKSV directory exists at '%@'", v123, 0x16u);
    }
    id v95 = 0;
  }

  if (v95) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  else {
LABEL_41:
  }
    id v95 = 0;
}

void sub_10001D590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

void sub_10001D5C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 lastPathComponent];
  id v6 = [v4 URLByAppendingPathComponent:v5];

  uint64_t v7 = *(void **)(a1 + 40);
  id v20 = 0;
  unsigned int v8 = [v7 copyItemAtURL:v3 toURL:v6 error:&v20];
  id v9 = v20;
  id v11 = *(id *)(a1 + 56);
  id v12 = HMFGetOSLogHandle();
  unsigned __int8 v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v3 path];
      id v16 = [v6 path];
      *(_DWORD *)long long buf = 138543874;
      id v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      unsigned __int8 v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Copied '%@' to '%@'", buf, 0x20u);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      id v18 = [v3 path];
      id v19 = [v6 path];
      *(_DWORD *)long long buf = 138544130;
      id v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      unsigned __int8 v26 = v19;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to copy '%@' to '%@': %@", buf, 0x2Au);
    }
  }
}

uint64_t sub_10001D824(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v5 path];
    int v13 = 138543874;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read '%@': %@", (uint8_t *)&v13, 0x20u);
  }

  return 1;
}

uint64_t sub_10001D95C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v38 = v3;
  id v5 = &off_100024000;
  if (!v2) {
    goto LABEL_13;
  }
  id v6 = [sub_10001E204() sharedClient];
  if (v6)
  {
    uint64_t v7 = +[NSNumber numberWithInt:getpid()];
    id v8 = [v4 UUIDString];
    id v9 = [v8 substringToIndex:8];
    +[NSString stringWithFormat:@"HKExtension[%@][%@]", v7, v9];
    uint64_t v10 = v35 = v6;

    id v11 = sub_10001E4D8();
    CFStringRef v55 = @"UUID";
    id v56 = v4;
    id v37 = v4;
    id v12 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    int v13 = [v11 requestWithItemID:24 configuration:v12];
    v57[0] = v13;
    id v14 = sub_10001E4D8();
    CFStringRef v53 = @"Delay";
    __int16 v15 = +[NSNumber numberWithDouble:150000.0];
    id v54 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    __int16 v17 = [v14 requestWithItemID:69 configuration:v16];
    v57[1] = v17;
    id v18 = +[NSArray arrayWithObjects:v57 count:2];

    v51[0] = @"Reason";
    v51[1] = @"OutputDirectory";
    id v36 = (void *)v10;
    v52[0] = v10;
    id v6 = v35;
    v52[1] = v38;
    id v19 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
    *(void *)&long long v47 = _NSConcreteStackBlock;
    *((void *)&v47 + 1) = 3221225472;
    id v48 = sub_10001E5BC;
    unsigned __int8 v49 = &unk_10002CF58;
    id v50 = v2;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10001E6BC;
    v42[3] = &unk_10002CF80;
    v42[4] = v2;
    id v20 = [v35 collectLogs:v18 configuration:v19 update:&v47 reply:v42];
    id v22 = v2;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v44 = v24;
      __int16 v45 = 2112;
      id v46 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%{public}@Started W5Client with UUID: %@", buf, 0x16u);
    }
    __int16 v25 = +[HMFFuture futureWithValue:v20];

    id v4 = v37;
    id v5 = &off_100024000;
  }
  else
  {
    id v27 = v2;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v29 = HMFGetLogIdentifier();
      LODWORD(v47) = 138543362;
      *(void *)((char *)&v47 + 4) = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@No W5Client!", (uint8_t *)&v47, 0xCu);
    }
    __int16 v25 = +[HMFFuture futureWithNoValue];
  }

  while (1)
  {

    v39[0] = _NSConcreteStackBlock;
    v39[1] = *((void *)v5 + 120);
    v39[2] = sub_10001DFF8;
    v39[3] = &unk_10002CEE0;
    id v30 = *(id *)(a1 + 56);
    uint64_t v31 = *(void *)(a1 + 32);
    id v40 = v30;
    uint64_t v41 = v31;
    id v32 = [v25 then:v39];
    if (v32) {
      break;
    }
    _HMFPreconditionFailure();
LABEL_13:
    __int16 v25 = 0;
  }
  unsigned __int8 v33 = v32;

  return 3;
}

void sub_10001DE58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 pathExtension];
  unsigned int v5 = [v4 isEqualToString:@"pcap"];

  if (v5)
  {
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = [*(id *)(a1 + 40) URLByAppendingPathComponent:v3];
      id v11 = [v10 path];
      int v16 = 138543618;
      __int16 v17 = v9;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Adding pcap file: %@", (uint8_t *)&v16, 0x16u);
    }
    id v12 = *(void **)(a1 + 48);
    id v13 = objc_alloc((Class)DEAttachmentItem);
    id v14 = [*(id *)(a1 + 40) URLByAppendingPathComponent:v3];
    id v15 = [v13 initWithPathURL:v14];
    [v12 addObject:v15];
  }
}

uint64_t sub_10001DFF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) run];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001E0E0;
  v11[3] = &unk_10002CEB8;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v6;
  id v7 = [v4 finally:v11];
  if (v7)
  {
    id v8 = v7;

    return 3;
  }
  else
  {
    uint64_t v10 = _HMFPreconditionFailure();
    return sub_10001E0E0(v10);
  }
}

uint64_t sub_10001E0E0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [sub_10001E204() sharedClient];
    [v2 cancelRequestWithUUID:*(void *)(a1 + 32)];

    id v4 = *(id *)(a1 + 40);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Stopped W5Client with UUID: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return 1;
}

id sub_10001E204()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)qword_100036D00;
  uint64_t v7 = qword_100036D00;
  if (!qword_100036D00)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001E2E8;
    v3[3] = &unk_10002D010;
    v3[4] = &v4;
    sub_10001E2E8((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10001E2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001E2E8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("W5Client");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100036D00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    sub_10001E358();
  }
}

void sub_10001E358()
{
  v1[0] = 0;
  if (!qword_100036D08)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10001E464;
    v1[4] = &unk_10002D048;
    v1[5] = v1;
    long long v2 = off_10002D030;
    uint64_t v3 = 0;
    qword_100036D08 = _sl_dlopen();
    id v0 = (void *)v1[0];
    if (qword_100036D08)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      id v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t sub_10001E464()
{
  uint64_t result = _sl_dlopen();
  qword_100036D08 = result;
  return result;
}

id sub_10001E4D8()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)qword_100036D10;
  uint64_t v7 = qword_100036D10;
  if (!qword_100036D10)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001E844;
    v3[3] = &unk_10002D010;
    v3[4] = &v4;
    sub_10001E844((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10001E5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001E5BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received event update: %@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_10001E6BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    id v14 = +[NSFileManager defaultManager];
    id v15 = [v9 path];
    [v14 isReadableFileAtPath:v15];
    int v16 = HMFBooleanToString();
    int v17 = 138544130;
    __int16 v18 = v13;
    __int16 v19 = 2112;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Received URL(Readable: %@): %@ with error: %@", (uint8_t *)&v17, 0x2Au);
  }
}

void sub_10001E844(uint64_t a1)
{
  sub_10001E358();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("W5LogItemRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100036D10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (void *)abort_report_np();
    sub_10001E8B4(v2);
  }
}

void sub_10001E8B4(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  long long v2 = (void *)qword_100036CE8;
  qword_100036CE8 = (uint64_t)v1;

  [(id)qword_100036CE8 setDateFormat:@"yyyy-MM-dd_HH:mm:ss.SSSZZZ"];
  id v3 = +[NSTimeZone systemTimeZone];
  [(id)qword_100036CE8 setTimeZone:v3];
}

uint64_t sub_10001E938(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v7 = objc_opt_class();
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543874;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to read '%@': %@", (uint8_t *)&v11, 0x20u);
  }

  return 1;
}

id sub_10001EA58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsString:a2];
}

int64_t sub_10001EA64(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 modificationDate];
  uint64_t v6 = [v4 modificationDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10001EAD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare for diagnostic extension, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10001ECE4(id a1)
{
  qword_100036CF8 = HMFCreateOSLogHandle();

  _objc_release_x1();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return _CFNullGetTypeID();
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t HMFBooleanToString()
{
  return _HMFBooleanToString();
}

uint64_t HMFCreateOSLogHandle()
{
  return _HMFCreateOSLogHandle();
}

uint64_t HMFDescribeCollection()
{
  return _HMFDescribeCollection();
}

uint64_t HMFEqualObjects()
{
  return _HMFEqualObjects();
}

uint64_t HMFGetLogIdentifier()
{
  return _HMFGetLogIdentifier();
}

uint64_t HMFGetOSLogHandle()
{
  return _HMFGetOSLogHandle();
}

uint64_t HMFProductClassToString()
{
  return _HMFProductClassToString();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return _IDSCopyAddressDestinationForDestination();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return _IDSCopyIDForEmailAddress();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return _IDSCopyIDForPhoneNumber();
}

uint64_t IDSCopyIDForTokenWithID()
{
  return _IDSCopyIDForTokenWithID();
}

uint64_t MREExceptionTypeToString()
{
  return _MREExceptionTypeToString();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t OPACKDecodeData()
{
  return _OPACKDecodeData();
}

uint64_t OPACKEncoderCreateData()
{
  return _OPACKEncoderCreateData();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return __Block_signature(aBlock);
}

uint64_t _HMFPreconditionFailure()
{
  return __HMFPreconditionFailure();
}

uint64_t _HMFPreconditionFailureWithFormat()
{
  return __HMFPreconditionFailureWithFormat();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_URI(void *a1, const char *a2, ...)
{
  return [a1 URI];
}

id objc_msgSend_URIRepresentation(void *a1, const char *a2, ...)
{
  return [a1 URIRepresentation];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBeEmail];
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBePhoneNumber];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accessoryIdentifier];
}

id objc_msgSend_accountHandle(void *a1, const char *a2, ...)
{
  return [a1 accountHandle];
}

id objc_msgSend_additionalMACAddresses(void *a1, const char *a2, ...)
{
  return [a1 additionalMACAddresses];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 alphanumericCharacterSet];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attribute(void *a1, const char *a2, ...)
{
  return [a1 attribute];
}

id objc_msgSend_attributeType(void *a1, const char *a2, ...)
{
  return [a1 attributeType];
}

id objc_msgSend_attributesByName(void *a1, const char *a2, ...)
{
  return [a1 attributesByName];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return [a1 author];
}

id objc_msgSend_backingStoreUUID(void *a1, const char *a2, ...)
{
  return [a1 backingStoreUUID];
}

id objc_msgSend_bleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bleIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cString(void *a1, const char *a2, ...)
{
  return [a1 cString];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_changeID(void *a1, const char *a2, ...)
{
  return [a1 changeID];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return [a1 changeType];
}

id objc_msgSend_changedObjectID(void *a1, const char *a2, ...)
{
  return [a1 changedObjectID];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return [a1 changes];
}

id objc_msgSend_checksum(void *a1, const char *a2, ...)
{
  return [a1 checksum];
}

id objc_msgSend_cluster(void *a1, const char *a2, ...)
{
  return [a1 cluster];
}

id objc_msgSend_colorTemperatureNotifyIntervalThresholdInMilliseconds(void *a1, const char *a2, ...)
{
  return [a1 colorTemperatureNotifyIntervalThresholdInMilliseconds];
}

id objc_msgSend_colorTemperatureNotifyValueChangeThreshold(void *a1, const char *a2, ...)
{
  return [a1 colorTemperatureNotifyValueChangeThreshold];
}

id objc_msgSend_colorTemperatureUpdateIntervalInMilliseconds(void *a1, const char *a2, ...)
{
  return [a1 colorTemperatureUpdateIntervalInMilliseconds];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAccessory(void *a1, const char *a2, ...)
{
  return [a1 currentAccessory];
}

id objc_msgSend_currentHome(void *a1, const char *a2, ...)
{
  return [a1 currentHome];
}

id objc_msgSend_curve(void *a1, const char *a2, ...)
{
  return [a1 curve];
}

id objc_msgSend_custom1(void *a1, const char *a2, ...)
{
  return [a1 custom1];
}

id objc_msgSend_custom2(void *a1, const char *a2, ...)
{
  return [a1 custom2];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultFormatter(void *a1, const char *a2, ...)
{
  return [a1 defaultFormatter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_deviceIRK(void *a1, const char *a2, ...)
{
  return [a1 deviceIRK];
}

id objc_msgSend_deviceIRKData(void *a1, const char *a2, ...)
{
  return [a1 deviceIRKData];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_diagnosticReport(void *a1, const char *a2, ...)
{
  return [a1 diagnosticReport];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_entities(void *a1, const char *a2, ...)
{
  return [a1 entities];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return [a1 event];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_formattedString(void *a1, const char *a2, ...)
{
  return [a1 formattedString];
}

id objc_msgSend_futureWithNoValue(void *a1, const char *a2, ...)
{
  return [a1 futureWithNoValue];
}

id objc_msgSend_getLogPathsSortedByTime(void *a1, const char *a2, ...)
{
  return [a1 getLogPathsSortedByTime];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_homeUUID(void *a1, const char *a2, ...)
{
  return [a1 homeUUID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierNamespace(void *a1, const char *a2, ...)
{
  return [a1 identifierNamespace];
}

id objc_msgSend_identifierString(void *a1, const char *a2, ...)
{
  return [a1 identifierString];
}

id objc_msgSend_initAsRoot(void *a1, const char *a2, ...)
{
  return [a1 initAsRoot];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return [a1 internal];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_isGlobal(void *a1, const char *a2, ...)
{
  return [a1 isGlobal];
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return [a1 isLocal];
}

id objc_msgSend_isLocallyTracked(void *a1, const char *a2, ...)
{
  return [a1 isLocallyTracked];
}

id objc_msgSend_isToMany(void *a1, const char *a2, ...)
{
  return [a1 isToMany];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModel];
}

id objc_msgSend_maximumBrightness(void *a1, const char *a2, ...)
{
  return [a1 maximumBrightness];
}

id objc_msgSend_maximumColorTemperature(void *a1, const char *a2, ...)
{
  return [a1 maximumColorTemperature];
}

id objc_msgSend_minimumBrightness(void *a1, const char *a2, ...)
{
  return [a1 minimumBrightness];
}

id objc_msgSend_minimumColorTemperature(void *a1, const char *a2, ...)
{
  return [a1 minimumColorTemperature];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_namespace(void *a1, const char *a2, ...)
{
  return [a1 namespace];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfArguments(void *a1, const char *a2, ...)
{
  return [a1 numberOfArguments];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return [a1 ownerName];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return [a1 point];
}

id objc_msgSend_points(void *a1, const char *a2, ...)
{
  return [a1 points];
}

id objc_msgSend_prefixedURI(void *a1, const char *a2, ...)
{
  return [a1 prefixedURI];
}

id objc_msgSend_primaryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 primaryIdentifier];
}

id objc_msgSend_primaryMACAddress(void *a1, const char *a2, ...)
{
  return [a1 primaryMACAddress];
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return [a1 processID];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_productClass(void *a1, const char *a2, ...)
{
  return [a1 productClass];
}

id objc_msgSend_propertiesByName(void *a1, const char *a2, ...)
{
  return [a1 propertiesByName];
}

id objc_msgSend_pushToken(void *a1, const char *a2, ...)
{
  return [a1 pushToken];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return [a1 rectValue];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondaryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 secondaryIdentifier];
}

id objc_msgSend_senderCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 senderCorrelationIdentifier];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return [a1 shortDescription];
}

id objc_msgSend_softwareVersion(void *a1, const char *a2, ...)
{
  return [a1 softwareVersion];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_superentity(void *a1, const char *a2, ...)
{
  return [a1 superentity];
}

id objc_msgSend_supportsSleepConfig(void *a1, const char *a2, ...)
{
  return [a1 supportsSleepConfig];
}

id objc_msgSend_systemInfo(void *a1, const char *a2, ...)
{
  return [a1 systemInfo];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_targetCompletionDuration(void *a1, const char *a2, ...)
{
  return [a1 targetCompletionDuration];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_testCommunication(void *a1, const char *a2, ...)
{
  return [a1 testCommunication];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_tombstone(void *a1, const char *a2, ...)
{
  return [a1 tombstone];
}

id objc_msgSend_transactionNumber(void *a1, const char *a2, ...)
{
  return [a1 transactionNumber];
}

id objc_msgSend_transformedValueClass(void *a1, const char *a2, ...)
{
  return [a1 transformedValueClass];
}

id objc_msgSend_transitionPoints(void *a1, const char *a2, ...)
{
  return [a1 transitionPoints];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unprefixedURI(void *a1, const char *a2, ...)
{
  return [a1 unprefixedURI];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updatedProperties(void *a1, const char *a2, ...)
{
  return [a1 updatedProperties];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueClass(void *a1, const char *a2, ...)
{
  return [a1 valueClass];
}

id objc_msgSend_valueTransformerName(void *a1, const char *a2, ...)
{
  return [a1 valueTransformerName];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_versionString(void *a1, const char *a2, ...)
{
  return [a1 versionString];
}

id objc_msgSend_wakeAddress(void *a1, const char *a2, ...)
{
  return [a1 wakeAddress];
}

id objc_msgSend_wakeAddressString(void *a1, const char *a2, ...)
{
  return [a1 wakeAddressString];
}

id objc_msgSend_wakePacketType(void *a1, const char *a2, ...)
{
  return [a1 wakePacketType];
}

id objc_msgSend_wakePattern(void *a1, const char *a2, ...)
{
  return [a1 wakePattern];
}

id objc_msgSend_wakePort(void *a1, const char *a2, ...)
{
  return [a1 wakePort];
}

id objc_msgSend_wakeType(void *a1, const char *a2, ...)
{
  return [a1 wakeType];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}

id objc_msgSend_woBLEInfo(void *a1, const char *a2, ...)
{
  return [a1 woBLEInfo];
}

id objc_msgSend_woWLANInfo(void *a1, const char *a2, ...)
{
  return [a1 woWLANInfo];
}

id objc_msgSend_woWLANInfos(void *a1, const char *a2, ...)
{
  return [a1 woWLANInfos];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}