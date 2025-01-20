@interface IPHPvDInfoRequestServer
- (BOOL)validFetch;
- (IPHPvDInfoRequestServer)init;
- (NSURLSession)urlSession;
- (__CFDictionary)createValidPvDAdditionalInfoDict:(id)a3 withID:(id)a4 andPrefixes:(id)a5;
- (id)xpcClientCompletionHandler;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)cancelRequest;
- (void)fetchPvDAdditionalInformationWithPvDID:(id)a3 prefixesArray:(id)a4 bindToInterface:(id)a5 andCompletionHandler:(id)a6;
- (void)scheduleParsingEventAbort;
- (void)scheduleParsingEventCompleteWithParsedJSON:(id)a3 pvdID:(id)a4 ipv6Prefixes:(id)a5;
- (void)setUrlSession:(id)a3;
- (void)setValidFetch:(BOOL)a3;
- (void)setXpcClientCompletionHandler:(id)a3;
@end

@implementation IPHPvDInfoRequestServer

- (IPHPvDInfoRequestServer)init
{
  v4.receiver = self;
  v4.super_class = (Class)IPHPvDInfoRequestServer;
  v2 = [(IPHPvDInfoRequestServer *)&v4 init];
  if (v2)
  {
    sub_100002EA4((uint64_t)"Helper");
    [(IPHPvDInfoRequestServer *)v2 setValidFetch:1];
  }
  return v2;
}

- (void)cancelRequest
{
  v3 = [(IPHPvDInfoRequestServer *)self urlSession];

  if (v3)
  {
    objc_super v4 = sub_1000098B8();
    os_log_type_t v5 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      memset(v8, 0, sizeof(v8));
      os_log_type_enabled(v4, v5);
      v6 = (_OWORD *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v6 != v8) {
        free(v6);
      }
    }

    v7 = [(IPHPvDInfoRequestServer *)self urlSession];
    [v7 invalidateAndCancel];

    [(IPHPvDInfoRequestServer *)self setUrlSession:0];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  v8 = (void (**)(id, uint64_t, void))a6;
  id v9 = a5;
  v10 = sub_1000098B8();
  os_log_type_t v11 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    os_log_type_enabled(v10, v11);
    v12 = (long long *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v12 != &v22) {
      free(v12);
    }
  }

  v13 = [v9 protectionSpace];

  v14 = [v13 authenticationMethod];
  unsigned int v15 = [v14 isEqualToString:NSURLAuthenticationMethodServerTrust];

  if (v15)
  {
    v16 = sub_1000098B8();
    os_log_type_t v17 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      os_log_type_enabled(v16, v17);
      v18 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v18 != &v22) {
        free(v18);
      }
    }

    [(IPHPvDInfoRequestServer *)self setValidFetch:0];
    [(IPHPvDInfoRequestServer *)self scheduleParsingEventAbort];
  }
  v8[2](v8, 1, 0);
  v19 = sub_1000098B8();
  os_log_type_t v20 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    os_log_type_enabled(v19, v20);
    v21 = (long long *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v21 != &v22) {
      free(v21);
    }
  }
}

- (void)fetchPvDAdditionalInformationWithPvDID:(id)a3 prefixesArray:(id)a4 bindToInterface:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(IPHPvDInfoRequestServer *)self setXpcClientCompletionHandler:a6];
  v13 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  v14 = +[NSURLSession sessionWithConfiguration:v13 delegate:self delegateQueue:0];
  [(IPHPvDInfoRequestServer *)self setUrlSession:v14];

  unsigned int v15 = [(IPHPvDInfoRequestServer *)self urlSession];

  if (v15)
  {
    v16 = +[NSString stringWithFormat:@"%s%@%s", "https://", v10, "/.well-known/pvd"];
    os_log_type_t v17 = +[NSURL URLWithString:v16];
    id v18 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v17];
    [v18 setHTTPMethod:@"GET"];
    [v18 setValue:@"application/pvd+json" forHTTPHeaderField:@"Content-Type"];
    [v18 setValue:@"application/pvd+json" forHTTPHeaderField:@"Accept"];
    [v18 setBoundInterfaceIdentifier:v12];
    v19 = [(IPHPvDInfoRequestServer *)self urlSession];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000397C;
    v27[3] = &unk_10000C3B0;
    v27[4] = self;
    os_log_type_t v20 = v16;
    long long v28 = v20;
    id v29 = v10;
    id v30 = v11;
    v21 = [v19 dataTaskWithRequest:v18 completionHandler:v27];

    long long v22 = sub_1000098B8();
    os_log_type_t v23 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
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
      os_log_type_enabled(v22, v23);
      int v31 = 138412290;
      long long v32 = v20;
      long long v24 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v24 != &v33) {
        free(v24);
      }
    }

    [v21 resume];
  }
  else
  {
    os_log_type_t v20 = sub_1000098B8();
    uint64_t v25 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
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
      os_log_type_enabled(v20, (os_log_type_t)v25);
      LOWORD(v31) = 0;
      long long v26 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v26 != &v33) {
        free(v26);
      }
    }
  }
}

- (void)scheduleParsingEventCompleteWithParsedJSON:(id)a3 pvdID:(id)a4 ipv6Prefixes:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000044E4;
  v10[3] = &unk_10000C3D8;
  v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)scheduleParsingEventAbort
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000048A8;
  block[3] = &unk_10000C400;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (__CFDictionary)createValidPvDAdditionalInfoDict:(id)a3 withID:(id)a4 andPrefixes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v117 = sub_1000098B8();
    os_log_type_t v118 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
LABEL_156:
      long long v183 = 0u;
      long long v184 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      long long v169 = 0u;
      long long v170 = 0u;
      os_log_type_enabled(v117, v118);
      LOWORD(v160) = 0;
      v119 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v119 != &v169) {
        free(v119);
      }
    }
LABEL_158:

    theDict = 0;
    goto LABEL_159;
  }
  Mutable = CFDictionaryCreateMutable(0, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    v117 = sub_1000098B8();
    os_log_type_t v118 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled()) {
      goto LABEL_156;
    }
    goto LABEL_158;
  }
  id v12 = Mutable;
  sub_100006560(Mutable, v8, v9, v10);
  id v138 = v8;
  v153 = 0;
  v148 = 0;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v13 = [&off_10000C760 countByEnumeratingWithState:&v155 objects:&v160 count:16];
  id v129 = v8;
  theDict = v12;
  id v127 = v10;
  id v128 = v9;
  v126 = self;
  if (!v13) {
    goto LABEL_84;
  }
  id v14 = v13;
  value = 0;
  unsigned int v15 = 0;
  uint64_t v16 = *(void *)v156;
  os_log_type_t v17 = v138;
  uint64_t v140 = *(void *)v156;
  do
  {
    id v18 = 0;
    id v142 = v14;
    do
    {
      if (*(void *)v156 != v16) {
        objc_enumerationMutation(&off_10000C760);
      }
      v19 = *(void **)(*((void *)&v155 + 1) + 8 * (void)v18);
      v21 = [v17 valueForKey:v19];
      if (v21)
      {
        if ([v19 isEqualToString:@"dnsZones"]) {
          BOOL v22 = v15 == 0;
        }
        else {
          BOOL v22 = 0;
        }
        if (v22)
        {
          id v35 = v19;
          id v36 = v21;
          *(void *)&long long v149 = 0;
          v146 = v20;
          if ((unint64_t)[v36 count] > 9) {
            uint64_t v37 = 10;
          }
          else {
            uint64_t v37 = (uint64_t)[v36 count];
          }
          long long v38 = sub_1000098B8();
          os_log_type_t v39 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v169 = 0u;
            long long v170 = 0u;
            os_log_type_enabled(v38, v39);
            long long v40 = v38;
            long long v41 = objc_opt_class();
            LODWORD(v166[0]) = 138412802;
            *(void *)((char *)v166 + 4) = v35;
            WORD2(v166[1]) = 2112;
            *(void *)((char *)&v166[1] + 6) = v36;
            HIWORD(v166[2]) = 2112;
            v166[3] = v41;
            id v42 = v41;
            LODWORD(v125) = 32;
            v124 = (int *)v166;
            long long v43 = (long long *)_os_log_send_and_compose_impl();

            __SC_log_send2();
            if (v43 != &v169) {
              free(v43);
            }
          }

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v44 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
            *(void *)&long long v149 = v44;
            if (v37)
            {
              uint64_t v45 = 0;
              while (1)
              {
                *(void *)v159 = 0;
                v154 = 0;
                long long v47 = [v36 objectAtIndex:v45];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v62 = sub_1000098B8();
                  os_log_type_t v63 = _SC_syslog_os_log_mapping();
                  if (!__SC_log_enabled()) {
                    goto LABEL_62;
                  }
                  long long v183 = 0u;
                  long long v184 = 0u;
                  long long v181 = 0u;
                  long long v182 = 0u;
                  long long v179 = 0u;
                  long long v180 = 0u;
                  long long v177 = 0u;
                  long long v178 = 0u;
                  long long v175 = 0u;
                  long long v176 = 0u;
                  long long v173 = 0u;
                  long long v174 = 0u;
                  long long v171 = 0u;
                  long long v172 = 0u;
                  long long v169 = 0u;
                  long long v170 = 0u;
                  os_log_type_enabled(v62, v63);
                  LOWORD(v166[0]) = 0;
                  LODWORD(v125) = 2;
                  v124 = (int *)v166;
                  goto LABEL_60;
                }
                *(void *)v159 = sub_1000095F0(v47);
                if (!*(void *)v159) {
                  break;
                }
                sub_100008C28((const void **)v159);
                CFStringRef Copy = CFStringCreateCopy(0, v47);
                v154 = (void *)Copy;
                if (!Copy) {
                  goto LABEL_63;
                }
                CFArrayAppendValue(v44, Copy);
                sub_100008C28((const void **)&v154);

                if (v37 == ++v45) {
                  goto LABEL_39;
                }
              }
              v62 = sub_1000098B8();
              os_log_type_t v64 = _SC_syslog_os_log_mapping();
              if (!__SC_log_enabled()) {
                goto LABEL_62;
              }
              long long v183 = 0u;
              long long v184 = 0u;
              long long v181 = 0u;
              long long v182 = 0u;
              long long v179 = 0u;
              long long v180 = 0u;
              long long v177 = 0u;
              long long v178 = 0u;
              long long v175 = 0u;
              long long v176 = 0u;
              long long v173 = 0u;
              long long v174 = 0u;
              long long v171 = 0u;
              long long v172 = 0u;
              long long v169 = 0u;
              long long v170 = 0u;
              os_log_type_enabled(v62, v64);
              LODWORD(v166[0]) = 138412290;
              *(void *)((char *)v166 + 4) = v47;
              LODWORD(v125) = 12;
              v124 = (int *)v166;
LABEL_60:
              v65 = (long long *)_os_log_send_and_compose_impl();
              __SC_log_send2();
              if (v65 != &v169) {
                free(v65);
              }
LABEL_62:

LABEL_63:
              unsigned int v15 = 0;
              char v52 = 0;
              os_log_type_t v20 = v146;
            }
            else
            {
LABEL_39:
              v153 = v44;
              v49 = sub_1000098B8();
              os_log_type_t v50 = _SC_syslog_os_log_mapping();
              os_log_type_t v20 = v146;
              if (__SC_log_enabled())
              {
                long long v183 = 0u;
                long long v184 = 0u;
                long long v181 = 0u;
                long long v182 = 0u;
                long long v179 = 0u;
                long long v180 = 0u;
                long long v177 = 0u;
                long long v178 = 0u;
                long long v175 = 0u;
                long long v176 = 0u;
                long long v173 = 0u;
                long long v174 = 0u;
                long long v171 = 0u;
                long long v172 = 0u;
                long long v169 = 0u;
                long long v170 = 0u;
                os_log_type_enabled(v49, v50);
                LODWORD(v166[0]) = 138412290;
                *(void *)((char *)v166 + 4) = v44;
                LODWORD(v125) = 12;
                v124 = (int *)v166;
                v51 = (long long *)_os_log_send_and_compose_impl();
                __SC_log_send2();
                if (v51 != &v169) {
                  free(v51);
                }
              }

              char v52 = 1;
              value = v44;
              unsigned int v15 = v44;
            }
          }
          else
          {
            v53 = sub_1000098B8();
            os_log_type_t v54 = _SC_syslog_os_log_mapping();
            os_log_type_t v20 = v146;
            if (__SC_log_enabled())
            {
              long long v183 = 0u;
              long long v184 = 0u;
              long long v181 = 0u;
              long long v182 = 0u;
              long long v179 = 0u;
              long long v180 = 0u;
              long long v177 = 0u;
              long long v178 = 0u;
              long long v175 = 0u;
              long long v176 = 0u;
              long long v173 = 0u;
              long long v174 = 0u;
              long long v171 = 0u;
              long long v172 = 0u;
              long long v169 = 0u;
              long long v170 = 0u;
              os_log_type_enabled(v53, v54);
              LOWORD(v166[0]) = 0;
              LODWORD(v125) = 2;
              v124 = (int *)v166;
              v55 = (long long *)_os_log_send_and_compose_impl();
              __SC_log_send2();
              if (v55 != &v169) {
                free(v55);
              }
            }

            unsigned int v15 = 0;
            long long v44 = 0;
            char v52 = 0;
          }
          v66 = sub_1000098B8();
          os_log_type_t v67 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            v136 = v44;
            v68 = v21;
            v69 = v15;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v169 = 0u;
            long long v170 = 0u;
            os_log_type_enabled(v66, v67);
            LODWORD(v166[0]) = 138412290;
            *(void *)((char *)v166 + 4) = v35;
            LODWORD(v125) = 12;
            v124 = (int *)v166;
            v70 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v70 != &v169) {
              free(v70);
            }
            os_log_type_t v20 = v146;
            unsigned int v15 = v69;
            v21 = v68;
            long long v44 = v136;
          }

          if (!v44) {
            sub_100008C28((const void **)&v149);
          }

          if (v52)
          {
            os_log_type_t v17 = v138;
            uint64_t v16 = v140;
            id v14 = v142;
            goto LABEL_80;
          }
          long long v24 = sub_1000098B8();
          os_log_type_t v71 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            v145 = v15;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v169 = 0u;
            long long v170 = 0u;
            os_log_type_enabled(v24, v71);
            LODWORD(v166[0]) = 138412546;
            *(void *)((char *)v166 + 4) = v35;
            WORD2(v166[1]) = 2112;
            *(void *)((char *)&v166[1] + 6) = v36;
            LODWORD(v125) = 22;
            v124 = (int *)v166;
            v72 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v72 != &v169) {
              free(v72);
            }
            os_log_type_t v17 = v138;
LABEL_76:
            uint64_t v16 = v140;
            id v14 = v142;
            unsigned int v15 = v145;
LABEL_79:

            goto LABEL_80;
          }
          os_log_type_t v17 = v138;
LABEL_78:
          uint64_t v16 = v140;
          id v14 = v142;
          goto LABEL_79;
        }
        if ([v19 isEqualToString:@"noInternet"]) {
          BOOL v23 = v148 == 0;
        }
        else {
          BOOL v23 = 0;
        }
        if (v23)
        {
          long long v24 = v19;
          id v25 = v21;
          long long v26 = sub_1000098B8();
          os_log_type_t v27 = _SC_syslog_os_log_mapping();
          v145 = v15;
          if (__SC_log_enabled())
          {
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v169 = 0u;
            long long v170 = 0u;
            os_log_type_enabled(v26, v27);
            long long v28 = v26;
            id v29 = objc_opt_class();
            LODWORD(v166[0]) = 138412802;
            *(void *)((char *)v166 + 4) = v24;
            WORD2(v166[1]) = 2112;
            *(void *)((char *)&v166[1] + 6) = v25;
            HIWORD(v166[2]) = 2112;
            v166[3] = v29;
            id v30 = v29;
            LODWORD(v125) = 32;
            v124 = (int *)v166;
            int v31 = (long long *)_os_log_send_and_compose_impl();

            __SC_log_send2();
            if (v31 != &v169) {
              free(v31);
            }
            os_log_type_t v17 = v138;
            unsigned int v15 = v145;
          }

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned __int8 v32 = [v25 isEqualToString:@"true"];
            long long v33 = (void **)&kCFBooleanTrue;
            if ((v32 & 1) != 0
              || (unsigned int v34 = [v25 isEqualToString:@"false"],
                  long long v33 = (void **)&kCFBooleanFalse,
                  v34))
            {
              v148 = *v33;

              goto LABEL_78;
            }
          }
          else
          {
            v56 = sub_1000098B8();
            os_log_type_t v57 = _SC_syslog_os_log_mapping();
            if (__SC_log_enabled())
            {
              long long v183 = 0u;
              long long v184 = 0u;
              long long v181 = 0u;
              long long v182 = 0u;
              long long v179 = 0u;
              long long v180 = 0u;
              long long v177 = 0u;
              long long v178 = 0u;
              long long v175 = 0u;
              long long v176 = 0u;
              long long v173 = 0u;
              long long v174 = 0u;
              long long v171 = 0u;
              long long v172 = 0u;
              long long v169 = 0u;
              long long v170 = 0u;
              os_log_type_enabled(v56, v57);
              LOWORD(v166[0]) = 0;
              LODWORD(v125) = 2;
              v124 = (int *)v166;
              v58 = (long long *)_os_log_send_and_compose_impl();
              __SC_log_send2();
              if (v58 != &v169) {
                free(v58);
              }
            }
          }
          v59 = sub_1000098B8();
          os_log_type_t v60 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v169 = 0u;
            long long v170 = 0u;
            os_log_type_enabled(v59, v60);
            LODWORD(v166[0]) = 138412546;
            *(void *)((char *)v166 + 4) = v24;
            WORD2(v166[1]) = 2112;
            *(void *)((char *)&v166[1] + 6) = v25;
            LODWORD(v125) = 22;
            v124 = (int *)v166;
            v61 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v61 != &v169) {
              free(v61);
            }
            long long v24 = v59;
            goto LABEL_76;
          }
          long long v24 = v59;
          goto LABEL_78;
        }
      }
LABEL_80:

      id v18 = (char *)v18 + 1;
    }
    while (v18 != v14);
    id v14 = [&off_10000C760 countByEnumeratingWithState:&v155 objects:&v160 count:16];
  }
  while (v14);
  id v9 = v128;
  id v8 = v129;
  self = v126;
  id v10 = v127;
  id v12 = theDict;
  if (value)
  {
    CFDictionarySetValue(theDict, @"dnsZones", value);
    sub_100008C28((const void **)&v153);
  }
LABEL_84:
  if (v148)
  {
    CFDictionarySetValue(v12, @"noInternet", v148);
    sub_100008C28((const void **)&v148);
  }

  id v73 = v138;
  v153 = 0;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id v74 = [&off_10000C778 countByEnumeratingWithState:&v149 objects:&v155 count:16];
  if (v74)
  {
    id v75 = v74;
    CFMutableArrayRef v76 = 0;
    CFMutableArrayRef v77 = 0;
    uint64_t v78 = *(void *)v150;
    valuea = v73;
    uint64_t v133 = *(void *)v150;
    while (1)
    {
      v79 = 0;
      id v134 = v75;
      do
      {
        if (*(void *)v150 != v78) {
          objc_enumerationMutation(&off_10000C778);
        }
        v80 = *(void **)(*((void *)&v149 + 1) + 8 * (void)v79);
        v82 = [v73 valueForKey:v80];
        if (!v82) {
          goto LABEL_139;
        }
        if (![v80 isEqualToString:@"proxies"] || v77 != 0) {
          goto LABEL_139;
        }
        v139 = v80;
        id v84 = v82;
        v154 = 0;
        v137 = v76;
        if ((unint64_t)[v84 count] > 9) {
          uint64_t v147 = 10;
        }
        else {
          uint64_t v147 = (uint64_t)[v84 count];
        }
        v85 = sub_1000098B8();
        os_log_type_t v86 = _SC_syslog_os_log_mapping();
        v141 = v82;
        id v143 = v84;
        if (__SC_log_enabled())
        {
          long long v183 = 0u;
          long long v184 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          long long v179 = 0u;
          long long v180 = 0u;
          long long v177 = 0u;
          long long v178 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          long long v173 = 0u;
          long long v174 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          os_log_type_enabled(v85, v86);
          v87 = v85;
          v88 = objc_opt_class();
          int v160 = 138412802;
          v161 = v139;
          __int16 v162 = 2112;
          id v163 = v84;
          __int16 v164 = 2112;
          v165 = v88;
          id v89 = v88;
          LODWORD(v125) = 32;
          v124 = &v160;
          v90 = (long long *)_os_log_send_and_compose_impl();

          __SC_log_send2();
          if (v90 != &v169) {
            free(v90);
          }
          id v73 = valuea;
          v82 = v141;
          id v84 = v143;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v106 = sub_1000098B8();
          os_log_type_t v107 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v169 = 0u;
            long long v170 = 0u;
            os_log_type_enabled(v106, v107);
            LOWORD(v160) = 0;
            LODWORD(v125) = 2;
            v124 = &v160;
            v108 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v108 != &v169) {
              free(v108);
            }
          }

          char v105 = 0;
          CFMutableArrayRef v76 = v137;
LABEL_130:
          id v84 = v143;
          if (!v76) {
            goto LABEL_131;
          }
          goto LABEL_132;
        }
        CFMutableArrayRef v91 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        v154 = v91;
        if (!v91)
        {
          char v105 = 0;
          goto LABEL_142;
        }
        CFMutableArrayRef theArray = v91;
        if (!v147)
        {
LABEL_121:
          CFMutableArrayRef v76 = theArray;
          v153 = theArray;
          v102 = sub_1000098B8();
          os_log_type_t v103 = _SC_syslog_os_log_mapping();
          id v73 = valuea;
          if (__SC_log_enabled())
          {
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v169 = 0u;
            long long v170 = 0u;
            os_log_type_enabled(v102, v103);
            *(_DWORD *)v159 = 138412290;
            *(void *)&v159[4] = theArray;
            LODWORD(v125) = 12;
            v124 = (int *)v159;
            v104 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v104 != &v169) {
              free(v104);
            }
            CFMutableArrayRef v76 = theArray;
          }

          char v105 = 1;
          goto LABEL_130;
        }
        uint64_t v92 = 0;
        v135 = v81;
        while (1)
        {
          v94 = [v84 objectAtIndex:v92];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          CFArrayAppendValue(theArray, v94);
LABEL_120:

          if (++v92 == v147) {
            goto LABEL_121;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_120;
        }
        *(void *)&long long v169 = 0;
        *(void *)&long long v169 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if ((void)v169)
        {
          long long v167 = 0u;
          long long v168 = 0u;
          memset(v166, 0, sizeof(v166));
          id v95 = v94;
          id v96 = [v95 countByEnumeratingWithState:v166 objects:&v160 count:16];
          if (v96)
          {
            id v97 = v96;
            uint64_t v98 = *(void *)v166[2];
            do
            {
              for (i = 0; i != v97; i = (char *)i + 1)
              {
                if (*(void *)v166[2] != v98) {
                  objc_enumerationMutation(v95);
                }
                v100 = *(const void **)(v166[1] + 8 * i);
                v101 = objc_msgSend(v95, "objectForKey:", v100, v124, v125);
                CFDictionaryAddValue((CFMutableDictionaryRef)v169, v100, v101);
              }
              id v97 = [v95 countByEnumeratingWithState:v166 objects:&v160 count:16];
            }
            while (v97);
          }

          CFArrayAppendValue(theArray, (const void *)v169);
          sub_100008C28((const void **)&v169);
          uint64_t v78 = v133;
          id v75 = v134;
          v81 = v135;
          v82 = v141;
          id v84 = v143;
          goto LABEL_120;
        }

        char v105 = 0;
        id v73 = valuea;
LABEL_142:
        CFMutableArrayRef v76 = v137;
        if (!v137) {
LABEL_131:
        }
          sub_100008C28((const void **)&v154);
LABEL_132:

        if ((v105 & 1) == 0)
        {
          v109 = sub_1000098B8();
          os_log_type_t v110 = _SC_syslog_os_log_mapping();
          if (__SC_log_enabled())
          {
            v111 = v76;
            long long v183 = 0u;
            long long v184 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v179 = 0u;
            long long v180 = 0u;
            long long v177 = 0u;
            long long v178 = 0u;
            long long v175 = 0u;
            long long v176 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            long long v169 = 0u;
            long long v170 = 0u;
            os_log_type_enabled(v109, v110);
            int v160 = 138412546;
            v161 = v139;
            __int16 v162 = 2112;
            id v163 = v143;
            LODWORD(v125) = 22;
            v124 = &v160;
            v112 = (long long *)_os_log_send_and_compose_impl();
            __SC_log_send2();
            if (v112 != &v169) {
              free(v112);
            }
            CFMutableArrayRef v76 = v111;
            v82 = v141;
          }
        }
        CFMutableArrayRef v77 = v76;
LABEL_139:

        v79 = (char *)v79 + 1;
      }
      while (v79 != v75);
      id v113 = [&off_10000C778 countByEnumeratingWithState:&v149 objects:&v155 count:16];
      id v75 = v113;
      if (!v113)
      {
        id v9 = v128;
        id v8 = v129;
        self = v126;
        id v10 = v127;
        id v12 = theDict;
        if (v76)
        {
          CFDictionarySetValue(theDict, @"proxies", v76);
          sub_100008C28((const void **)&v153);
        }
        break;
      }
    }
  }

  if (CFDictionaryGetCount(v12) >= 3)
  {
    v114 = sub_1000098B8();
    os_log_type_t v115 = _SC_syslog_os_log_mapping();
    if (__SC_log_enabled())
    {
      long long v183 = 0u;
      long long v184 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      long long v169 = 0u;
      long long v170 = 0u;
      os_log_type_enabled(v114, v115);
      int v160 = 138412290;
      v161 = theDict;
      v116 = (long long *)_os_log_send_and_compose_impl();
      __SC_log_send2();
      if (v116 != &v169) {
        free(v116);
      }
    }

    goto LABEL_163;
  }
LABEL_159:
  v120 = sub_1000098B8();
  os_log_type_t v121 = _SC_syslog_os_log_mapping();
  if (__SC_log_enabled())
  {
    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    os_log_type_enabled(v120, v121);
    LOWORD(v160) = 0;
    v122 = (long long *)_os_log_send_and_compose_impl();
    __SC_log_send2();
    if (v122 != &v169) {
      free(v122);
    }
  }

  [(IPHPvDInfoRequestServer *)self setValidFetch:0];
LABEL_163:

  return theDict;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (BOOL)validFetch
{
  return self->_validFetch;
}

- (void)setValidFetch:(BOOL)a3
{
  self->_validFetch = a3;
}

- (id)xpcClientCompletionHandler
{
  return self->_xpcClientCompletionHandler;
}

- (void)setXpcClientCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_xpcClientCompletionHandler, 0);

  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end