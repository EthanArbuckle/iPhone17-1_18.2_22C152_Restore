@interface SearchResultsVerifier
- (BOOL)_passesSkeletonVerification:(id)a3;
- (BOOL)_walkCriterion:(id)a3 mode:(int64_t)a4 withBlock:(id)a5;
- (BOOL)verifySkeletonMessage;
- (MFMessageCriterion)criterion;
- (SearchResultsVerifier)initWithCriterion:(id)a3;
- (id)description;
- (id)filterRemoteSearchResults:(id)a3;
- (void)_parseFlagsFromCriterion:(id)a3;
- (void)setCriterion:(id)a3;
- (void)setVerifySkeletonMessage:(BOOL)a3;
@end

@implementation SearchResultsVerifier

- (SearchResultsVerifier)initWithCriterion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultsVerifier;
  v6 = [(SearchResultsVerifier *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_criterion, a3);
    [(SearchResultsVerifier *)v7 _parseFlagsFromCriterion:v5];
  }

  return v7;
}

- (id)filterRemoteSearchResults:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if ([(SearchResultsVerifier *)self verifySkeletonMessage])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000BBAB8;
    v9[3] = &unk_10013E1B8;
    v9[4] = self;
    v9[5] = &v10;
    objc_msgSend(v4, "ef_filter:", v9);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v11[3];
      *(_DWORD *)buf = 138412546;
      CFStringRef v15 = @"#search-results-verifier";
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ filtered search results: skeletonFailedCount:%lu", buf, 0x16u);
    }
  }
  else
  {
    id v5 = v4;
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SearchResultsVerifier;
  v3 = [(SearchResultsVerifier *)&v7 description];
  [(SearchResultsVerifier *)self verifySkeletonMessage];
  id v4 = NSStringFromBOOL();
  id v5 = +[NSString stringWithFormat:@"%@ verifySkeletonMessage:%@", v3, v4];

  return v5;
}

- (BOOL)_passesSkeletonVerification:(id)a3
{
  id v4 = a3;
  if ([(SearchResultsVerifier *)self verifySkeletonMessage])
  {
    id v5 = [(SearchResultsVerifier *)self criterion];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000BBCB8;
    v8[3] = &unk_10013E1E0;
    id v9 = v4;
    BOOL v6 = [(SearchResultsVerifier *)self _walkCriterion:v5 mode:0 withBlock:v8];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_parseFlagsFromCriterion:(id)a3
{
  id v4 = a3;
  -[SearchResultsVerifier setVerifySkeletonMessage:](self, "setVerifySkeletonMessage:", -[SearchResultsVerifier _walkCriterion:mode:withBlock:](self, "_walkCriterion:mode:withBlock:"));
}

- (BOOL)_walkCriterion:(id)a3 mode:(int64_t)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (**)(id, id))a5;
  uint64_t v10 = [v8 criteria];
  id v11 = [v10 count];

  if (v11)
  {
    if (a4 == 1 || [v8 allCriteriaMustBeSatisfied])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v12 = [v8 criteria];
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v26;
LABEL_6:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v12);
          }
          if (![(SearchResultsVerifier *)self _walkCriterion:*(void *)(*((void *)&v25 + 1) + 8 * v15) mode:a4 withBlock:v9])goto LABEL_22; {
          if (v13 == (id)++v15)
          }
          {
            id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
            char v16 = 1;
            if (v13) {
              goto LABEL_6;
            }
            goto LABEL_24;
          }
        }
      }
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v12 = objc_msgSend(v8, "criteria", 0);
      id v17 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (!v17)
      {
LABEL_22:
        char v16 = 0;
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v18 = *(void *)v22;
LABEL_16:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v12);
        }
        if ([(SearchResultsVerifier *)self _walkCriterion:*(void *)(*((void *)&v21 + 1) + 8 * v19) mode:a4 withBlock:v9])
        {
          break;
        }
        if (v17 == (id)++v19)
        {
          id v17 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v17) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
    }
    char v16 = 1;
    goto LABEL_24;
  }
  char v16 = v9[2](v9, v8);
LABEL_25:

  return v16;
}

- (BOOL)verifySkeletonMessage
{
  return self->_verifySkeletonMessage;
}

- (void)setVerifySkeletonMessage:(BOOL)a3
{
  self->_verifySkeletonMessage = a3;
}

- (MFMessageCriterion)criterion
{
  return self->_criterion;
}

- (void)setCriterion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end