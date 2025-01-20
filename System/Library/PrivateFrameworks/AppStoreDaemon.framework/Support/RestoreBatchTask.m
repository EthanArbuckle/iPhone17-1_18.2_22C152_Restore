@interface RestoreBatchTask
- (void)main;
@end

@implementation RestoreBatchTask

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v4 = [(NSArray *)self->_restoreInstalls count];
    v5 = [(ACAccount *)self->_account ams_DSID];
    *(_DWORD *)buf = 134218242;
    NSUInteger v170 = v4;
    __int16 v171 = 2114;
    uint64_t v172 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting batch restore for %ld items with accountID: %{public}@", buf, 0x16u);
  }
  if (![(NSArray *)self->_restoreInstalls count])
  {
    v83 = ASDErrorWithTitleAndMessage();
    objc_setProperty_atomic_copy(self, v84, v83, 32);

LABEL_62:
    self->super._success = 0;
    return;
  }
  v7 = (ACAccount *)objc_getProperty(self, v6, 40, 1);
  account = self->_account;
  self->_account = v7;

  if (!self->_account)
  {
    v9 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using the active account for content restore call", buf, 2u);
    }

    v10 = +[ACAccountStore ams_sharedAccountStore];
    objc_msgSend(v10, "ams_activeiTunesAccount");
    v11 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v12 = self->_account;
    self->_account = v11;

    if (!self->_account)
    {
      v104 = +[NSString stringWithFormat:@"Unable to determine account for content restore. Requested account: %@", objc_getProperty(self, v13, 40, 1)];
      v105 = ASDErrorWithTitleAndMessage();
      objc_setProperty_atomic_copy(self, v106, v105, 32);

      goto LABEL_62;
    }
  }
  id v144 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_restoreInstalls, "count"));
  v138 = self;
  if (self->_skipLatestVersionCheck || !sub_100005CF8())
  {
    v14 = (NSArray *)objc_alloc_init((Class)ASDCoastGuard);
    sub_1003F38A8();
    selfa = (id)objc_claimAutoreleasedReturnValue();
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v23 = self->_restoreInstalls;
    id v24 = [(NSArray *)v23 countByEnumeratingWithState:&v151 objects:v165 count:16];
    if (!v24) {
      goto LABEL_45;
    }
    id v25 = v24;
    uint64_t v26 = *(void *)v152;
    while (1)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v152 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(unsigned char **)(*((void *)&v151 + 1) + 8 * i);
        v29 = sub_100424E64(v28);
        id v30 = [v29 unsignedLongLongValue];
        v31 = sub_1003B7FFC(v28);
        LODWORD(v30) = -[NSArray isUnrepairableAppWithItemID:externalVersionID:](v14, "isUnrepairableAppWithItemID:externalVersionID:", v30, [v31 unsignedLongLongValue]);

        if (!v30)
        {
          v36 = sub_100424D84(v28);
          v35 = [selfa objectForKeyedSubscript:v36];

          id v37 = [v35 longLongValue];
          v38 = sub_1003B7FFC(v28);
          id v39 = [v38 longLongValue];

          v40 = ASDLogHandleForCategory();
          BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
          if ((uint64_t)v37 >= (uint64_t)v39)
          {
            if (v41)
            {
              v42 = sub_100424D84(v28);
              *(_DWORD *)buf = 138543362;
              NSUInteger v170 = (NSUInteger)v42;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Fetching latest version of %{public}@ due to code signature error", buf, 0xCu);
            }
            if (v28) {
              v28[56] = 1;
            }
          }
          else
          {
            if (v41)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Skipping initial latest version fetch for batch", buf, 2u);
            }
          }
          goto LABEL_42;
        }
        v32 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Fetching latest version since this evid is known to have been unrepairable", buf, 2u);
        }

        if (v28) {
          v28[56] = 1;
        }
        v33 = sub_100424D84(v28);
        id v34 = [v33 length];

        if (v34)
        {
          v35 = sub_100424D84(v28);
          [v144 addObject:v35];
LABEL_42:

          continue;
        }
      }
      id v25 = [(NSArray *)v23 countByEnumeratingWithState:&v151 objects:v165 count:16];
      if (!v25)
      {
LABEL_45:

        self = v138;
        goto LABEL_46;
      }
    }
  }
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  v14 = self->_restoreInstalls;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v155 objects:v166 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v156;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v156 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(unsigned char **)(*((void *)&v155 + 1) + 8 * (void)j);
        if (v19) {
          v19[56] = 1;
        }
        v20 = sub_100424D84(v19);
        id v21 = [v20 length];

        if (v21)
        {
          v22 = sub_100424D84(v19);
          [v144 addObject:v22];
        }
      }
      id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v155 objects:v166 count:16];
    }
    while (v16);
  }
LABEL_46:

  sub_1003F3B58((uint64_t)AppDefaultsManager, v144, &off_10054BFE8);
  v43 = [RestoreBatchContext alloc];
  restoreInstalls = self->_restoreInstalls;
  id Property = objc_getProperty(self, v45, 40, 1);
  v47 = restoreInstalls;
  id v48 = Property;
  if (v43
    && (v163.receiver = v43,
        v163.super_class = (Class)RestoreBatchContext,
        (v49 = [(Task *)&v163 init]) != 0))
  {
    v50 = v49;
    v139 = v48;
    objc_storeStrong((id *)&v49->super._keepAlive, Property);
    v51 = objc_opt_new();
    v52 = objc_opt_new();
    uint64_t v53 = objc_opt_new();
    error = v50->super._error;
    v55 = v50;
    v50->super._error = (NSError *)v53;

    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    v56 = v47;
    id v57 = [(NSArray *)v56 countByEnumeratingWithState:&v159 objects:buf count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v160;
      do
      {
        for (k = 0; k != v58; k = (char *)k + 1)
        {
          if (*(void *)v160 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = *(void **)(*((void *)&v159 + 1) + 8 * (void)k);
          v62 = sub_100424E64(v61);

          if (v62)
          {
            v63 = sub_100424E64(v61);
            [v52 setObject:v61 forKeyedSubscript:v63];

            v64 = v55->super._error;
            v65 = sub_100424E64(v61);
            [(NSError *)v64 addObject:v65];

            [v51 addObject:v61];
          }
          else
          {
            v66 = [[_TtC9appstored6LogKey alloc] initWithAppInstallMemoryEntity:v61];
            v67 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v167 = 138412290;
              v168 = v66;
              _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "[%@] Skipping item due to missing itemID on metadata", v167, 0xCu);
            }

            v68 = ASDErrorWithTitleAndMessage();
            sub_1003B8168(v61, v68);
          }
        }
        id v58 = [(NSArray *)v56 countByEnumeratingWithState:&v159 objects:buf count:16];
      }
      while (v58);
    }

    uint64_t v69 = objc_opt_new();
    v70 = v55;
    lock = v55->super._lock;
    v55->super._lock = (NSLock *)v69;

    id v72 = [v52 copy];
    v73 = *(void **)&v55->super._success;
    *(void *)&v55->super._success = v72;

    uint64_t v74 = objc_opt_new();
    v75 = v55->_account;
    v55->_account = (ACAccount *)v74;

    uint64_t v76 = objc_opt_new();
    v77 = v55->_restoreInstalls;
    v55->_restoreInstalls = (NSArray *)v76;

    id v78 = [v51 copy];
    v79 = *(void **)&v55->_skipLatestVersionCheck;
    *(void *)&v55->_skipLatestVersionCheck = v78;

    id v81 = objc_getProperty(v55, v80, 56, 1);
    char v82 = 0;
    self = v138;
  }
  else
  {

    v70 = 0;
    id v81 = 0;
    char v82 = 1;
  }
  selfb = v70;
  if ([v81 count])
  {
    v86 = [ContentRestoreTask alloc];
    if (v82) {
      id v87 = 0;
    }
    else {
      id v87 = objc_getProperty(v70, v85, 56, 1);
    }
    id v88 = v87;
    id v90 = objc_getProperty(self, v89, 40, 1);
    v91 = sub_10025D64C((id *)&v86->super.super.super.isa, v88, v90);

    id v150 = 0;
    [(Task *)self runSubTask:v91 returningError:&v150];
    id v92 = v150;
    if (!v92)
    {
      v101 = sub_1002A14A4(self, v91, v70);
      id v102 = 0;
      goto LABEL_84;
    }
    v93 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      NSUInteger v170 = (NSUInteger)v92;
      _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "Error running content restore request. Error: %{public}@", buf, 0xCu);
    }

    id v94 = v92;
    self;
    v95 = [v94 domain];
    if ([v95 isEqualToString:AMSErrorDomain])
    {
      v96 = [v94 userInfo];
      v97 = [v96 objectForKeyedSubscript:@"AMSServerErrorCode"];
      if ([v97 isEqualToNumber:&off_10054BFB8])
      {

LABEL_80:
        v109 = [v94 userInfo];
        v110 = [v109 objectForKeyedSubscript:@"AMSServerErrorCode"];

        v111 = +[NSString stringWithFormat:@"Token failure (%@)", v110];
        ASDErrorWithTitleAndMessage();
        id v102 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_81;
      }
      v107 = [v94 userInfo];
      v108 = [v107 objectForKeyedSubscript:@"AMSServerErrorCode"];
      unsigned __int8 v141 = [v108 isEqualToNumber:&off_10054BFD0];

      self = v138;
      if (v141) {
        goto LABEL_80;
      }
    }
    else
    {
    }
    id v102 = v94;
LABEL_81:
    v70 = selfb;
    if (v82) {
      id v112 = 0;
    }
    else {
      id v112 = objc_getProperty(selfb, v103, 56, 1);
    }
    sub_1002A108C((uint64_t)self, v112, v102, selfb);
    v101 = 0;
LABEL_84:
    if ([v101 count])
    {
      v113 = v70;
      v114 = sub_10025D64C((id *)[ContentRestoreTask alloc], v101, self->_account);
      id v149 = v102;
      [(Task *)self runSubTask:v114 returningError:&v149];
      id v98 = v149;

      id v115 = sub_1002A14A4(self, v114, v113);
      if (v98) {
        sub_1002A108C((uint64_t)self, v101, v98, v113);
      }
      if (v101)
      {
        v116 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        {
          v135 = [v101 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543362;
          NSUInteger v170 = (NSUInteger)v135;
          _os_log_error_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "Retry complete for items: [%{public}@]", buf, 0xCu);
        }
      }

      v70 = selfb;
    }
    else
    {
      id v98 = v102;
    }

    if (v82)
    {
      v100 = 0;
      char v99 = 1;
      goto LABEL_95;
    }
    goto LABEL_94;
  }
  id v98 = 0;
  if ((v82 & 1) == 0)
  {
LABEL_94:
    char v99 = 0;
    v100 = v70->super._error;
    goto LABEL_95;
  }
  char v99 = 1;
  v100 = 0;
LABEL_95:
  if ([(NSError *)v100 count])
  {
    id v137 = v98;
    if (v99) {
      v117 = 0;
    }
    else {
      v117 = v70->super._error;
    }
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id offset = [(NSError *)v117 copy];
    id v118 = [offset countByEnumeratingWithState:&v145 objects:v164 count:16];
    if (v118)
    {
      id v120 = v118;
      uint64_t v121 = *(void *)v146;
      do
      {
        v122 = 0;
        do
        {
          if (*(void *)v146 != v121) {
            objc_enumerationMutation(offset);
          }
          v123 = *(void **)(*((void *)&v145 + 1) + 8 * (void)v122);
          if (v99) {
            id v124 = 0;
          }
          else {
            id v124 = objc_getProperty(v70, v119, 24, 1);
          }
          v125 = [v124 objectForKeyedSubscript:v123];
          if (v125)
          {
            v126 = [[_TtC9appstored6LogKey alloc] initWithAppInstallMemoryEntity:v125];
            v127 = ASDErrorWithTitleAndMessage();
            v128 = [v125 valueForProperty:@"restore_retry_count"];
            uint64_t v129 = (uint64_t)[v128 integerValue];

            v130 = ASDLogHandleForCategory();
            BOOL v131 = os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);
            if (v129 < 5)
            {
              if (v131)
              {
                *(_DWORD *)buf = 138412546;
                NSUInteger v170 = (NSUInteger)v126;
                __int16 v171 = 2048;
                uint64_t v172 = v129;
                _os_log_error_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "[%@] Soft failing item not in the server response, and not encountering an error. Soft failure retry count: %ld", buf, 0x16u);
              }

              v70 = selfb;
              sub_1002A238C((uint64_t)selfb, v125, v127);
            }
            else
            {
              if (v131)
              {
                *(_DWORD *)buf = 138412546;
                NSUInteger v170 = (NSUInteger)v126;
                __int16 v171 = 2048;
                uint64_t v172 = v129;
                _os_log_error_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "[%@] Hard failing after %ld attempts", buf, 0x16u);
              }

              v70 = selfb;
              sub_1002A22FC((uint64_t)selfb, v125, v127);
            }
          }
          else
          {
            ASDLogHandleForCategory();
            v126 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v126->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              NSUInteger v170 = (NSUInteger)v123;
              _os_log_error_impl((void *)&_mh_execute_header, &v126->super, OS_LOG_TYPE_ERROR, "itemID: %{public}@ not in restore map", buf, 0xCu);
            }
          }

          v122 = (char *)v122 + 1;
        }
        while (v120 != v122);
        id v132 = [offset countByEnumeratingWithState:&v145 objects:v164 count:16];
        id v120 = v132;
      }
      while (v132);
    }

    id v98 = v137;
    self = v138;
  }
  if (v99)
  {
    hardFailures = self->_hardFailures;
    self->_hardFailures = 0;

    objc_storeStrong((id *)&self->_softFailures, 0);
    v133 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_hardFailures, v70->super._lock);
    objc_storeStrong((id *)&self->_softFailures, v70->_account);
    v133 = v70->_restoreInstalls;
  }
  objc_storeStrong((id *)&self->_successfulItems, v133);
  objc_setProperty_atomic_copy(self, v134, v98, 32);
  self->super._success = v98 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successfulItems, 0);
  objc_storeStrong((id *)&self->_softFailures, 0);
  objc_storeStrong((id *)&self->_hardFailures, 0);
  objc_storeStrong((id *)&self->_restoreInstalls, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end