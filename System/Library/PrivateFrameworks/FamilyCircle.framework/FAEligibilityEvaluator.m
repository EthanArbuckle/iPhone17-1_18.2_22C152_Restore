@interface FAEligibilityEvaluator
- (BOOL)_isCapableOfRecomendingMembers;
- (FAEligibilityEvaluator)initWithQueue:(id)a3 requirements:(id)a4;
- (id)_mediaAltDSID;
- (id)_recommendedMembers;
- (void)_unsafeFetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)fetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5;
@end

@implementation FAEligibilityEvaluator

- (FAEligibilityEvaluator)initWithQueue:(id)a3 requirements:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAEligibilityEvaluator;
  v9 = [(FAEligibilityEvaluator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_requirements, a4);
  }

  return v10;
}

- (void)fetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002073C;
  v15[3] = &unk_10004DC88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_unsafeFetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  v11 = [(FAEligibilityRequirements *)self->_requirements requirementsForPropertyName:v8];
  id v12 = v11;
  if (v11)
  {
    unsigned int v13 = [v11 serverEligibility];
    id v14 = _FALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [v12 serverEligibility];
      CFStringRef v16 = @"NO";
      *(_DWORD *)v36 = 138412802;
      if (v15) {
        CFStringRef v16 = @"YES";
      }
      *(void *)&v36[4] = v16;
      __int16 v37 = 2112;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "serverEligibility: %@, propertyName: %@, bundleID: %@", v36, 0x20u);
    }

    id v17 = [v12 activeBundleIDs];

    if (v17)
    {
      id v18 = [v12 activeBundleIDs];
      unsigned int v19 = [v18 containsObject:v9];

      v13 &= v19;
      v20 = _FALogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (v19) {
          CFStringRef v21 = @"YES";
        }
        else {
          CFStringRef v21 = @"NO";
        }
        v22 = objc_msgSend(v12, "activeBundleIDs", *(void *)v36);
        *(_DWORD *)v36 = 138413058;
        *(void *)&v36[4] = v21;
        __int16 v37 = 2112;
        id v38 = v8;
        __int16 v39 = 2112;
        id v40 = v9;
        __int16 v41 = 2112;
        v42 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "bundleID found: %@, propertyName: %@, bundleID: %@, eligibleApps: %@", v36, 0x2Au);
      }
    }
    v23 = objc_msgSend(v12, "expectedMediaAltDSID", *(void *)v36);

    if (v23)
    {
      v24 = [(FAEligibilityEvaluator *)self _mediaAltDSID];
      if (v13)
      {
        v25 = [v12 expectedMediaAltDSID];
        LOBYTE(v13) = [v25 isEqualToString:v24];
      }
      v26 = _FALogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [v12 expectedMediaAltDSID];
        *(_DWORD *)v36 = 138413058;
        *(void *)&v36[4] = v24;
        __int16 v37 = 2112;
        id v38 = v8;
        __int16 v39 = 2112;
        id v40 = v9;
        __int16 v41 = 2112;
        v42 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "found mediaAltDSID: %@, propertyName: %@, bundleID: %@, expectedMediaAltDSID: %@", v36, 0x2Au);
      }
    }
    if ([v12 hasRecommendedMembers])
    {
      if (![(FAEligibilityEvaluator *)self _isCapableOfRecomendingMembers])
      {
        v35 = _FALogSystem();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v36 = 138412546;
          *(void *)&v36[4] = v8;
          __int16 v37 = 2112;
          id v38 = v9;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "wantsFamilyMemberRecommendations: YES, recommendationCapable: NO, propertyName: %@, bundleID: %@", v36, 0x16u);
        }

        goto LABEL_38;
      }
      v28 = [(FAEligibilityEvaluator *)self _recommendedMembers];
      id v29 = [v28 count];

      if ((uint64_t)v29 > 0) {
        char v30 = v13;
      }
      else {
        char v30 = 0;
      }
      v31 = _FALogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v36 = 134218498;
        *(void *)&v36[4] = v29;
        __int16 v37 = 2112;
        id v38 = v8;
        __int16 v39 = 2112;
        id v40 = v9;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "wantsFamilyMemberRecommendations: YES, recommendationCapable: YES, recommendedMemberCount: %ld, propertyName: %@, bundleID: %@", v36, 0x20u);
      }

      if ((v30 & 1) == 0)
      {
LABEL_38:
        uint64_t v33 = 1;
        goto LABEL_39;
      }
    }
    else
    {
      v34 = _FALogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v36 = 138412546;
        *(void *)&v36[4] = v8;
        __int16 v37 = 2112;
        id v38 = v9;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "wantsFamilyMemberRecommendations: NO, propertyName: %@, bundleID: %@", v36, 0x16u);
      }

      if ((v13 & 1) == 0) {
        goto LABEL_38;
      }
    }
    uint64_t v33 = 2;
  }
  else
  {
    v32 = _FALogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v36 = 138412546;
      *(void *)&v36[4] = v8;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "no eligibility information for propertyName: %@, bundleID: %@", v36, 0x16u);
    }

    uint64_t v33 = 0;
  }
LABEL_39:
  v10[2](v10, v33, 0);
}

- (id)_mediaAltDSID
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  v4 = objc_msgSend(v3, "ams_altDSID");

  return v4;
}

- (id)_recommendedMembers
{
  id v2 = objc_alloc_init((Class)FAInviteSuggestions);
  uint64_t v6 = 0;
  v3 = [v2 fetchFamilyMemberSuggestions:&v6];
  v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[FAEligibilityEvaluator _recommendedMembers]";
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: used proactive model %lu for invite suggestions", buf, 0x16u);
  }

  return v3;
}

- (BOOL)_isCapableOfRecomendingMembers
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end