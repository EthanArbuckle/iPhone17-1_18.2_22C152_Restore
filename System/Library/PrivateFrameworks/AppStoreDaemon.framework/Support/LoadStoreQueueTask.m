@interface LoadStoreQueueTask
- (void)main;
@end

@implementation LoadStoreQueueTask

- (void)main
{
  v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", &off_10054D1A0, 0);
  rangesToLoad = self->_rangesToLoad;
  self->_rangesToLoad = v3;

  if ((unint64_t)[(NSMutableArray *)self->_rangesToLoad count] >= 2)
  {
    v131 = self;
    while (1)
    {
      if ([(LoadStoreQueueTask *)self isCancelled]) {
        goto LABEL_91;
      }
      v5 = [(NSMutableArray *)self->_rangesToLoad objectAtIndexedSubscript:0];
      v6 = [(NSMutableArray *)self->_rangesToLoad objectAtIndexedSubscript:1];
      id v139 = 0;
      id v7 = v6;
      id v8 = v5;
      v9 = sub_100409DB0((uint64_t)self);
      id v130 = v8;
      if (!self->_requestEncoder)
      {
        v10 = [LoadStoreQueueRequestEncoder alloc];
        v11 = sub_10030B11C();
        v12 = [(LoadStoreQueueRequestEncoder *)v10 initWithBag:v11];
        requestEncoder = self->_requestEncoder;
        self->_requestEncoder = v12;

        [(AMSURLRequestEncoder *)self->_requestEncoder setAccount:v9];
        [(AMSURLRequestEncoder *)self->_requestEncoder setAnisetteType:1];
        [(AMSURLRequestEncoder *)self->_requestEncoder setRequestEncoding:2];
        v14 = [(LogKey *)self->_logKey description];
        [(AMSURLRequestEncoder *)self->_requestEncoder setLogUUID:v14];
      }
      v15 = +[NSMutableDictionary dictionary];
      v16 = +[AMSDevice deviceGUID];
      [v15 setObject:v16 forKeyedSubscript:@"guid"];

      v17 = sub_1002F2C44((uint64_t)AMSKeybag, v9, 1);
      [v15 setObject:v17 forKeyedSubscript:@"kbsync"];

      v18 = (char *)[v8 unsignedLongLongValue];
      v19 = v8;
      v20 = v18;

      v21 = (char *)[v7 unsignedLongLongValue];
      id v128 = v7;

      if (v20 - 1 < v21)
      {
        v22 = +[NSString stringWithFormat:@"%llu", v20];
        [v15 setObject:v22 forKeyedSubscript:@"startId"];

        v23 = +[NSString stringWithFormat:@"%llu", v21];
        [v15 setObject:v23 forKeyedSubscript:@"endId"];
      }
      v24 = self->_requestEncoder;
      int64_t queueType = self->_queueType;
      v26 = sub_10030B11C();
      v27 = v26;
      v28 = queueType ? @"pendingApps" : @"automatic-downloads2/downloads-url";
      v29 = [v26 URLForKey:v28];

      v30 = [(AMSURLRequestEncoder *)v24 requestWithMethod:4 bagURL:v29 parameters:v15];
      uint64_t v31 = [v30 resultWithError:&v139];

      id v33 = v139;
      v129 = (void *)v31;
      if (!v31) {
        break;
      }
      v34 = objc_alloc_init(RequestEnvironment);
      v35 = sub_1000169A4();
      v37 = v35;
      v38 = v130;
      if (v34)
      {
        objc_setProperty_atomic_copy(v34, v36, v35, 8);

        objc_setProperty_atomic(v34, v39, self->_presenter, 32);
        objc_setProperty_atomic_copy(v34, v40, self->_logKey, 16);
      }
      else
      {
      }
      v41 = sub_10027AA90();
      v127 = v34;
      v42 = sub_10027AE28(v41, v129, v34);
      id v138 = v33;
      v43 = [v42 resultWithError:&v138];
      id v44 = v138;

      if (v43)
      {
        v125 = v43;
        v46 = [v43 object];
        if (v46)
        {
          v126 = v46;
          v47 = sub_1003DD184((uint64_t)StoreItemResponse, v46, 0);
          v46 = v126;
          if (v47)
          {
            v49 = v47;
            id v50 = objc_getProperty(v47, v48, 64, 1);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v50 length]) {
              sub_1002F2B3C((uint64_t)AMSKeybag, v50);
            }
            id v51 = v49;
            id v53 = objc_getProperty(v51, v52, 80, 1);

            if (v53)
            {
              v55 = self->_rangesToLoad;
              id v56 = objc_getProperty(v51, v54, 80, 1);
              [(NSMutableArray *)v55 addObjectsFromArray:v56];
            }
            selfa = v51;
            id v57 = objc_getProperty(v51, v54, 56, 1);

            if (v57)
            {
              [(Task *)self lock];
              if (!self->_storeItems)
              {
                v58 = (NSMutableOrderedSet *)objc_opt_new();
                storeItems = self->_storeItems;
                self->_storeItems = v58;
              }
              v132 = objc_opt_new();
              v60 = objc_opt_new();
              v61 = objc_opt_new();
              long long v144 = 0u;
              long long v145 = 0u;
              long long v146 = 0u;
              long long v147 = 0u;
              id obj = objc_getProperty(v51, v62, 56, 1);
              id v63 = [obj countByEnumeratingWithState:&v144 objects:v158 count:16];
              id v123 = v50;
              v136 = v61;
              if (v63)
              {
                id v65 = v63;
                uint64_t v66 = *(void *)v145;
                v134 = v60;
                id v135 = v44;
                uint64_t v133 = *(void *)v145;
                do
                {
                  v67 = 0;
                  do
                  {
                    if (*(void *)v145 != v66) {
                      objc_enumerationMutation(obj);
                    }
                    v68 = *(void **)(*((void *)&v144 + 1) + 8 * (void)v67);
                    if (v68) {
                      id Property = objc_getProperty(*(id *)(*((void *)&v144 + 1) + 8 * (void)v67), v64, 208, 1);
                    }
                    else {
                      id Property = 0;
                    }
                    id v70 = Property;

                    if (!v70)
                    {
                      [v60 addObject:v68];
                      goto LABEL_63;
                    }
                    if (v68) {
                      id v72 = objc_getProperty(v68, v71, 208, 1);
                    }
                    else {
                      id v72 = 0;
                    }
                    id v73 = v72;
                    v74 = [v61 objectForKeyedSubscript:v73];

                    if (v74)
                    {
                      id v77 = objc_getProperty(v74, v75, 144, 1);
                      if (v68)
                      {
                        id v78 = objc_getProperty(v68, v76, 144, 1);
                        v79 = v78;
                        if (v78 && [v78 compare:v77] == (id)1)
                        {
                          v80 = ASDLogHandleForCategory();
                          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                          {
                            id v82 = objc_getProperty(v68, v81, 208, 1);
                            id v84 = objc_getProperty(v68, v83, 96, 1);
                            *(_DWORD *)buf = 138544130;
                            id v151 = v82;
                            __int16 v152 = 2114;
                            id v153 = v84;
                            __int16 v154 = 2114;
                            id v155 = v79;
                            __int16 v156 = 2114;
                            id v157 = v77;
                            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Queue check found duplicate items in the queue for %{public}@ (%{public}@). Choosing %{public}@ over %{public}@.", buf, 0x2Au);

                            id v44 = v135;
                            v61 = v136;
                          }

                          id v86 = objc_getProperty(v68, v85, 208, 1);
                          [v61 setObject:v68 forKeyedSubscript:v86];

                          id v87 = v74;
                          goto LABEL_54;
                        }
                      }
                      else
                      {
                        v79 = 0;
                      }
                      v90 = ASDLogHandleForCategory();
                      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                      {
                        if (v68)
                        {
                          id v92 = objc_getProperty(v68, v91, 208, 1);
                          id v94 = objc_getProperty(v68, v93, 96, 1);
                          v95 = v92;
                        }
                        else
                        {
                          id v92 = 0;
                          v95 = 0;
                          id v94 = 0;
                        }
                        id v96 = v94;
                        *(_DWORD *)buf = 138544130;
                        id v151 = v92;
                        __int16 v152 = 2114;
                        id v153 = v96;
                        __int16 v154 = 2114;
                        id v155 = v77;
                        __int16 v156 = 2114;
                        id v157 = v79;
                        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Queue check found duplicate items in the queue for %{public}@ (%{public}@). Choosing %{public}@ over %{public}@.", buf, 0x2Au);

                        id v44 = v135;
                        v61 = v136;
                      }

                      id v87 = v68;
                      if (v68)
                      {
LABEL_54:
                        v97 = v87;
                        id v98 = objc_getProperty(v87, v88, 120, 1);
                        char v99 = 0;
                      }
                      else
                      {
                        v97 = 0;
                        id v98 = 0;
                        char v99 = 1;
                      }
                      id v100 = v98;

                      if (v100)
                      {
                        v101 = objc_opt_new();
                        v102 = sub_100409DB0((uint64_t)v131);
                        v103 = objc_msgSend(v102, "ams_DSID");
                        [v101 setObject:v103 forKeyedSubscript:@"account_id"];

                        if (v99)
                        {
                          [v101 setObject:0 forKeyedSubscript:@"item_id"];
                          id v107 = 0;
                        }
                        else
                        {
                          id v105 = objc_getProperty(v97, v104, 208, 1);
                          [v101 setObject:v105 forKeyedSubscript:@"item_id"];

                          id v107 = objc_getProperty(v97, v106, 120, 1);
                        }
                        id v108 = v107;
                        [v101 setObject:v108 forKeyedSubscript:@"request_url"];

                        id v44 = v135;
                        if (v99) {
                          id v110 = 0;
                        }
                        else {
                          id v110 = objc_getProperty(v97, v109, 304, 1);
                        }
                        id v111 = v110;
                        [v101 setObject:v111 forKeyedSubscript:@"transaction_id"];

                        [v132 addObject:v101];
                        v61 = v136;
                      }

                      uint64_t v66 = v133;
                      v60 = v134;
                      goto LABEL_62;
                    }
                    if (v68) {
                      id v89 = objc_getProperty(v68, v75, 208, 1);
                    }
                    else {
                      id v89 = 0;
                    }
                    id v77 = v89;
                    [v61 setObject:v68 forKeyedSubscript:v77];
LABEL_62:

LABEL_63:
                    v67 = (char *)v67 + 1;
                  }
                  while (v65 != v67);
                  id v112 = [obj countByEnumeratingWithState:&v144 objects:v158 count:16];
                  id v65 = v112;
                }
                while (v112);
              }

              long long v142 = 0u;
              long long v143 = 0u;
              long long v140 = 0u;
              long long v141 = 0u;
              v113 = [v61 allValues];
              id v114 = [v113 countByEnumeratingWithState:&v140 objects:buf count:16];
              self = v131;
              if (v114)
              {
                id v115 = v114;
                uint64_t v116 = *(void *)v141;
                do
                {
                  for (i = 0; i != v115; i = (char *)i + 1)
                  {
                    if (*(void *)v141 != v116) {
                      objc_enumerationMutation(v113);
                    }
                    [v60 addObject:*(void *)(*((void *)&v140 + 1) + 8 * i)];
                  }
                  id v115 = [v113 countByEnumeratingWithState:&v140 objects:buf count:16];
                }
                while (v115);
              }

              [(NSMutableOrderedSet *)v131->_storeItems addObjectsFromArray:v60];
              [(Task *)v131 unlock];
              id v118 = v132;
              if ([v118 count])
              {
                v119 = sub_1003E0BA4();
                v148[0] = _NSConcreteStackBlock;
                v148[1] = 3221225472;
                v148[2] = sub_100409E30;
                v148[3] = &unk_1005236D0;
                id v149 = v118;
                [v119 modifyUsingTransaction:v148];
              }
              v38 = v130;
              id v50 = v123;
            }

            v46 = v126;
          }
        }

        v43 = v125;
      }
      else
      {
        objc_setProperty_atomic_copy(self, v45, v44, 32);
      }

      v120 = self->_rangesToLoad;
      v121 = v128;
      if (!v43) {
        goto LABEL_87;
      }
      -[NSMutableArray removeObjectsInRange:](v120, "removeObjectsInRange:", 0, 2);
      self->super._success = [(NSMutableArray *)self->_rangesToLoad count] == 0;
LABEL_88:

      if ((unint64_t)[(NSMutableArray *)self->_rangesToLoad count] <= 1) {
        goto LABEL_91;
      }
    }
    objc_setProperty_atomic_copy(self, v32, v33, 32);

    v120 = self->_rangesToLoad;
    v121 = v128;
    v38 = v130;
LABEL_87:
    [(NSMutableArray *)v120 removeAllObjects];
    goto LABEL_88;
  }
LABEL_91:
  v122 = self->_rangesToLoad;
  self->_rangesToLoad = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_storeItems, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end