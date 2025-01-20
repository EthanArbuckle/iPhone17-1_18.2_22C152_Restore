@interface AppInstallImportAndPolicyTask
- (AppInstallImportAndPolicyTask)init;
- (void)main;
@end

@implementation AppInstallImportAndPolicyTask

- (AppInstallImportAndPolicyTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppInstallImportAndPolicyTask;
  result = [(Task *)&v3 init];
  if (result)
  {
    result->_userInitiated = 0;
    result->_suppressEvaluatorDialogs = 1;
  }
  return result;
}

- (void)main
{
  if (!self)
  {
    v113 = 0;
    goto LABEL_146;
  }
  uint64_t v178 = 0;
  v179 = &v178;
  uint64_t v180 = 0x3032000000;
  v181 = sub_1000181C8;
  v182 = sub_100017CA0;
  id v183 = 0;
  install = self->_install;
  if (install) {
    install = objc_getProperty(install, a2, 40, 1);
  }
  id v4 = install;
  v5 = [v4 firstObject];
  id v170 = sub_10026E91C(v5, @"archive_type");

  if ((unint64_t)v170 > 1) {
    goto LABEL_81;
  }
  v168 = (id *)(v179 + 5);
  v169 = (_TtC9appstored24BackgroundAssetRelayTask *)v179[5];
  v6 = [(SQLiteMemoryEntity *)self->_install valueForProperty:@"client_type"];
  BOOL v7 = [v6 integerValue] == (id)1;

  if (v7)
  {
    v190[0] = 0;
    v8 = sub_100424D84(self->_install);
    v171[0] = 0;
    v9 = sub_100278674((uint64_t)IXAppInstallCoordinator, v8, 3, 0, (uint64_t)v190, (uint64_t)v171);
    v10 = (_TtC9appstored24BackgroundAssetRelayTask *)v171[0];

    if (v9)
    {
      id v11 = [v9 creatorIdentifier];
      coordinator = ASDLogHandleForCategory();
      BOOL v13 = os_log_type_enabled(coordinator, OS_LOG_TYPE_DEFAULT);
      if (v11 == (id)23)
      {
        if (v13)
        {
          logKey = self->_logKey;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = logKey;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, coordinator, OS_LOG_TYPE_DEFAULT, "[%@] Taking over vpp coordinator: %{public}@", buf, 0x16u);
        }

        v172 = v10;
        if ([v9 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithAppAssetPromise]) {
          [v9 setAppAssetPromiseResponsibleClient:1 error:&v172];
        }
        v15 = v172;

        v16 = ASDLogHandleForCategory();
        coordinator = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = self->_logKey;
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v15;
            _os_log_error_impl((void *)&_mh_execute_header, coordinator, OS_LOG_TYPE_ERROR, "[%@] Unable to take over vpp coordinator due to error: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v19 = self->_logKey;
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v19;
            _os_log_impl((void *)&_mh_execute_header, coordinator, OS_LOG_TYPE_DEFAULT, "[%@] Took over coordinator vpp coordinator", buf, 0xCu);
          }

          [(SQLiteMemoryEntity *)self->_install setValue:&off_10054C7C8 forProperty:@"coordinator_intent"];
          v20 = self->_install;
          v21 = [v9 uniqueIdentifier];
          v22 = [v21 UUIDString];
          [(SQLiteMemoryEntity *)v20 setValue:v22 forProperty:@"coordinator_id"];

          v23 = v9;
          v15 = 0;
          coordinator = self->_coordinator;
          self->_coordinator = v23;
        }
      }
      else
      {
        if (v13)
        {
          v18 = self->_logKey;
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, coordinator, OS_LOG_TYPE_DEFAULT, "[%@] Not taking over coordinator: %{public}@ ", buf, 0x16u);
        }
        v15 = v10;
      }
    }
    else
    {
      v15 = v10;
    }
  }
  else
  {
    v15 = 0;
  }
  if (!self->_coordinator)
  {
    v24 = self->_install;
    *(void *)v190 = v15;
    v25 = sub_1003C0068(v24);
    v26 = (_TtC9appstored24BackgroundAssetRelayTask *)*(id *)v190;

    if (v25)
    {
      v189 = v26;
      sub_1003BFC54(v25, &v189);
      v27 = (IXAppInstallCoordinator *)objc_claimAutoreleasedReturnValue();
      v15 = v189;

      v28 = self->_coordinator;
      self->_coordinator = v27;

      v29 = self->_coordinator;
      if (v29)
      {
        v30 = self->_install;
        v31 = [(IXAppInstallCoordinator *)v29 uniqueIdentifier];
        [(SQLiteMemoryEntity *)v30 setValue:v31 forProperty:@"coordinator_id"];
      }
    }
    else
    {
      v15 = v26;
    }
  }
  if (self->_progressPortions)
  {
    id v32 = objc_alloc_init((Class)IXProgressHint);
    progressPortions = self->_progressPortions;
    if (progressPortions) {
      double downloadPortion = progressPortions->_downloadPortion;
    }
    else {
      double downloadPortion = 0.0;
    }
    v35 = +[NSNumber numberWithDouble:downloadPortion];
    v36 = self->_progressPortions;
    if (v36) {
      double installPortion = v36->_installPortion;
    }
    else {
      double installPortion = 0.0;
    }
    v38 = +[NSNumber numberWithDouble:installPortion];
    v39 = self->_progressPortions;
    if (v39) {
      double postProcessPortion = v39->_postProcessPortion;
    }
    else {
      double postProcessPortion = 0.0;
    }
    v41 = +[NSNumber numberWithDouble:postProcessPortion];
    v198 = v15;
    unsigned __int8 v42 = [v32 setPhaseProportionsForLoadingPhase:v35 installingPhase:v38 postProcessingPhase:v41 error:&v198];
    v43 = v198;

    if ((v42 & 1) == 0)
    {
      v44 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v163 = self->_logKey;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v163;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "[%@]: Failed to create IXProgressHint: %{public}@", buf, 0x16u);
      }
    }
    v45 = self->_coordinator;
    v188 = v43;
    unsigned int v46 = [(IXAppInstallCoordinator *)v45 setProgressHint:v32 withError:&v188];
    v47 = v188;

    v48 = ASDLogHandleForCategory();
    v49 = v48;
    if (v46)
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v50 = self->_logKey;
        v51 = self->_progressPortions;
        if (v51)
        {
          double v53 = v51->_downloadPortion;
          double v52 = v51->_installPortion;
          double v54 = v51->_postProcessPortion;
        }
        else
        {
          double v52 = 0.0;
          double v53 = 0.0;
          double v54 = 0.0;
        }
        *(_DWORD *)buf = 138413058;
        *(void *)&buf[4] = v50;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2048;
        v195 = *(const char **)&v52;
        LOWORD(v196) = 2048;
        *(double *)((char *)&v196 + 2) = v54;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "[%@]: Set IXProgressHint on coordinator: %.2f : %.2f : %.2f", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v164 = self->_logKey;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v164;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v47;
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "[%@]: Failed to set IXProgressHint on the coordinator: %{public}@", buf, 0x16u);
    }

    v55 = self->_progressPortions;
    if (v55 && v55->_essentialBackgroundAssetAllowance >= 1)
    {
      v56 = self->_coordinator;
      id obj = v47;
      unsigned int v57 = sub_10027A78C(v56, 1, &obj);
      v15 = (_TtC9appstored24BackgroundAssetRelayTask *)obj;

      v58 = ASDLogHandleForCategory();
      v59 = v58;
      if (v57)
      {
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v60 = self->_logKey;
          v61 = self->_progressPortions;
          if (v61) {
            v61 = (ProgressPortions *)v61->_essentialBackgroundAssetAllowance;
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v60;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v61;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "[%@]: Coordinator has been set to need post processing: (allowance=%lld)", buf, 0x16u);
        }

        unint64_t v62 = (unint64_t)sub_10026E91C(self->_install, @"post_processing_state");
        v63 = self->_install;
        v59 = +[NSNumber numberWithInteger:v62 | 1];
        [(SQLiteMemoryEntity *)v63 setValue:v59 forProperty:@"post_processing_state"];
      }
      else if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v165 = self->_logKey;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v165;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "[%@]: Failed to set needsPostProcessing on the coordinator: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v15 = v47;
    }
  }
  v64 = self->_coordinator;
  if (v64)
  {
    if ([(IXAppInstallCoordinator *)v64 conformsToProtocol:&OBJC_PROTOCOL___IXCoordinatorWithPlaceholderPromise])
    {
      v65 = self->_coordinator;
      if (v65)
      {
        if ([(IXAppInstallCoordinator *)v65 creatorIdentifier] == (id)1
          && (sub_100279094(self->_coordinator) & 1) == 0)
        {
          v67 = self->_install;
          if (v67) {
            id Property = objc_getProperty(self->_install, v66, 40, 1);
          }
          else {
            id Property = 0;
          }
          id v69 = Property;
          v70 = [v69 firstObject];
          v186 = v15;
          v71 = sub_10032B5F0(v67, v70, &v186);
          v72 = v186;

          v185 = v72;
          v73 = sub_10032A178((uint64_t)v71, &v185);
          v74 = v185;

          if (!v73)
          {
            v75 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              v76 = self->_logKey;
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v76;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v74;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "[%@]: Failed to create placeholder: %{public}@", buf, 0x16u);
            }
          }
          v77 = self->_coordinator;
          v184 = v74;
          unsigned __int8 v78 = sub_10027A504(v77, v73, &v184);
          v15 = v184;

          if ((v78 & 1) == 0)
          {
            v79 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              v80 = self->_logKey;
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v80;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v15;
              _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "[%@]: Failed to set placeholder: %{public}@", buf, 0x16u);
            }

            [v73 cancelForReason:v15 client:1 error:0];
          }
        }
      }
    }
  }
  v81 = self->_coordinator;
  if (!v81)
  {
    v169 = v15;
    v81 = self->_coordinator;
  }
  buf[0] = v81 != 0;

  char v82 = buf[0];
  objc_storeStrong(v168, v169);
  if (v82)
  {
LABEL_81:
    v172 = 0;
    v173 = (id *)&v172;
    uint64_t v174 = 0x3032000000;
    v175 = sub_1000181C8;
    v176 = sub_100017CA0;
    id v177 = 0;
    v83 = sub_100424D84(self->_install);
    BOOL v84 = v83 == 0;

    if (!v84)
    {
      id v85 = objc_alloc((Class)LSApplicationRecord);
      v86 = sub_100424D84(self->_install);
      v189 = 0;
      id v87 = [v85 initWithBundleIdentifier:v86 allowPlaceholder:0 error:&v189];
      v88 = v189;

      if (v87)
      {
        v89 = self->_install;
        v90 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v87, "asd_galetteMode"));
        [(SQLiteMemoryEntity *)v89 setValue:v90 forProperty:@"previous_galette_mode"];
      }
    }
    v91 = self->_install;
    if (v91)
    {
      v92 = v91->_backgroundAssetMetadata;
      if (v92)
      {
        v93 = v92;
        v94 = sub_100424D84(self->_install);
        if (v94)
        {
          BOOL v95 = sub_10026E91C(self->_install, @"client_type") == (id)1;

          if (!v95)
          {
            v96 = [_TtC9appstored24BackgroundAssetRelayTask alloc];
            v97 = self->_install;
            if (v97) {
              backgroundAssetMetadata = v97->_backgroundAssetMetadata;
            }
            else {
              backgroundAssetMetadata = 0;
            }
            v99 = backgroundAssetMetadata;
            v100 = [(BackgroundAssetRelayTask *)v96 initWithAppInstall:v97 metadata:v99 requestToken:self->_requestToken];

            v101 = self->_install;
            if (v101) {
              v101 = sub_10026E91C(v101, @"source_type");
            }
            [(BackgroundAssetRelayTask *)v100 setShouldSkipTransparencySheet:v101 == (void *)2];
            v102 = +[BackgroundAssetRelayTask taskQueue];
            v198 = v100;
            v103 = +[NSArray arrayWithObjects:&v198 count:1];
            if (v102) {
              [v102[1] addOperations:v103 waitUntilFinished:1];
            }

            if (v100) {
              id v105 = objc_getProperty(v100, v104, 32, 1);
            }
            else {
              id v105 = 0;
            }
            id v106 = v105;
            int IsEqual = ASDErrorIsEqual();

            if (IsEqual)
            {
              v109 = self->_coordinator;
              externalID = self->_externalID;
              if (v100) {
                id v111 = objc_getProperty(v100, v108, 32, 1);
              }
              else {
                id v111 = 0;
              }
              id v112 = v111;
              sub_100315F68((uint64_t)AppInstallImportResult, v109, externalID, v112);
              v113 = (AppInstallImportResult *)objc_claimAutoreleasedReturnValue();

              goto LABEL_144;
            }
            v114 = self->_install;
            if (v114)
            {
              id v115 = sub_10026E91C(v114, @"source_type");
              v114 = self->_install;
            }
            else
            {
              id v115 = 0;
            }
            BOOL v116 = v115 == (id)2;
            v117 = sub_100424D84(v114);
            v118 = self->_install;
            if (v118) {
              v118 = (AppInstall *)v118->_backgroundAssetMetadata;
            }
            v119 = v118;
            v120 = +[BAAppStorePrepareDescriptor descriptorWithAppBundleIdentifier:v117 appStoreMetadata:v119 client:v116];

            [v120 setUserInitiated:self->_userInitiated];
            v121 = sub_100424C88(self->_install);
            v122 = v121;
            if (v121)
            {
              v123 = v121;
            }
            else
            {
              sub_1003D4A3C();
              v123 = (id *)objc_claimAutoreleasedReturnValue();
            }
            v124 = v123;

            if ((sub_1003D4DAC(v124) & 2) != 0) {
              [v120 setCellularPolicy:3];
            }
            id v125 = objc_alloc_init((Class)BAAppStoreClient);
            v188 = 0;
            unsigned int v126 = [v125 prepareForAppInstallWithDescriptor:v120 error:&v188];
            v127 = v188;
            if (v126)
            {
              v128 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
              {
                v129 = sub_100424C14(&self->_install->super.super.isa);
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v129;
                _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "[%@] Sent prepare descriptor to Background Assets", buf, 0xCu);
              }
              [(SQLiteMemoryEntity *)self->_install setValue:&__kCFBooleanTrue forProperty:@"has_background_assets_extension"];
            }
            else
            {
              v130 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
              {
                v166 = sub_100424C14(&self->_install->super.super.isa);
                uint64_t v167 = v179[5];
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v166;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v167;
                _os_log_error_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "[%@] Failed to send prepare descriptor to Background Assets: %{public}@", buf, 0x16u);
              }
            }
          }
        }
        else
        {
        }
      }
    }
    if (v170 == (id)2)
    {
      v131 = self->_progressPortions;
      if (v131)
      {
        if (v131->_essentialBackgroundAssetAllowance >= 1)
        {
          unint64_t v132 = (unint64_t)sub_10026E91C(self->_install, @"post_processing_state");
          v133 = self->_install;
          v134 = +[NSNumber numberWithInteger:v132 | 1];
          [(SQLiteMemoryEntity *)v133 setValue:v134 forProperty:@"post_processing_state"];
        }
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4010000000;
    v195 = "";
    long long v196 = 0u;
    long long v197 = 0u;
    v135 = sub_1003E0BA4();
    v171[0] = _NSConcreteStackBlock;
    v171[1] = (id)3221225472;
    v171[2] = sub_10031603C;
    v171[3] = &unk_100522910;
    v171[4] = self;
    v171[5] = buf;
    v171[6] = &v178;
    v171[7] = &v172;
    [v135 modifyUsingTransaction:v171];

    uint64_t v136 = *(void *)(*(void *)&buf[8] + 56);
    if (v136 == 2)
    {
      if (!self->_userInitiated) {
        goto LABEL_140;
      }
    }
    else if (!v136)
    {
      v137 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
      {
        v161 = sub_100424C14(&self->_install->super.super.isa);
        uint64_t v162 = v179[5];
        *(_DWORD *)v190 = 138412546;
        *(void *)&v190[4] = v161;
        *(_WORD *)&v190[12] = 2114;
        *(void *)&v190[14] = v162;
        _os_log_error_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "[%@] Database import failed with error: %{public}@", v190, 0x16u);
      }
      sub_100315F68((uint64_t)AppInstallImportResult, self->_coordinator, self->_externalID, (void *)v179[5]);
      v113 = (AppInstallImportResult *)objc_claimAutoreleasedReturnValue();
      goto LABEL_143;
    }
    v138 = sub_100424C88(self->_install);
    if (!v138)
    {
      v138 = sub_1003D4A3C();
    }
    policyBlock = (void (**)(id, BOOL, void *))self->_policyBlock;
    if (policyBlock)
    {
      uint64_t v140 = policyBlock[2](policyBlock, *(void *)(*(void *)&buf[8] + 56) == 2, v138);

      v138 = (void *)v140;
    }
    v141 = [ReviewNetworkPolicyTask alloc];
    v142 = sub_1003B8854((id *)&v141->super.super.super.isa, v173[5]);
    v143 = v142;
    if (v142) {
      *((unsigned char *)v142 + 49) = self->_suppressEvaluatorDialogs;
    }
    v144 = (id *)(v179 + 5);
    id obj = (id)v179[5];
    unsigned int v145 = [(Task *)self runSubTask:v142 returningError:&obj];
    objc_storeStrong(v144, obj);
    if (v145)
    {
      sub_1003B8E7C(v143, v138);
    }
    else
    {
      sub_1003D4C80((uint64_t)v138, 4);
      sub_1003D4D3C((uint64_t)v138, 4);
      sub_1003D4B04((uint64_t)v138, 60);
    }
    sub_100424D18(self->_install, (id *)v138);
    v146 = sub_1003E0BA4();
    *(void *)v190 = _NSConcreteStackBlock;
    *(void *)&v190[8] = 3221225472;
    *(void *)&v190[16] = sub_100316204;
    v191 = &unk_100522938;
    v193 = buf;
    id v147 = v138;
    id v192 = v147;
    [v146 modifyUsingTransaction:v190];

    if (*(void *)(*(void *)&buf[8] + 56) != 2)
    {
      v153 = self->_externalID;
      v154 = self->_coordinator;
      v150 = v153;
      self;
      v113 = objc_alloc_init(AppInstallImportResult);
      v113->_status = 0;
      v155 = v113->_coordinator;
      v113->_coordinator = v154;
      v152 = v154;

      goto LABEL_142;
    }
LABEL_140:
    v148 = self->_externalID;
    v149 = self->_coordinator;
    v150 = v148;
    self;
    v113 = objc_alloc_init(AppInstallImportResult);
    v113->_status = 1;
    v151 = v113->_coordinator;
    v113->_coordinator = v149;
    v152 = v149;

LABEL_142:
    v156 = v113->_externalID;
    v113->_externalID = v150;

LABEL_143:
    _Block_object_dispose(buf, 8);
LABEL_144:
    _Block_object_dispose(&v172, 8);

    goto LABEL_145;
  }
  sub_100315F68((uint64_t)AppInstallImportResult, 0, self->_externalID, (void *)v179[5]);
  v113 = (AppInstallImportResult *)objc_claimAutoreleasedReturnValue();
LABEL_145:
  _Block_object_dispose(&v178, 8);

LABEL_146:
  result = self->_result;
  self->_result = v113;

  v159 = self->_result;
  if (v159 && v159->_status == 2)
  {
    id v160 = objc_getProperty(v159, v158, 16, 1);
    [(Task *)self completeWithError:v160];
  }
  else
  {
    [(Task *)self completeWithSuccess];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_progressPortions, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong(&self->_policyBlock, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_install, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
}

@end