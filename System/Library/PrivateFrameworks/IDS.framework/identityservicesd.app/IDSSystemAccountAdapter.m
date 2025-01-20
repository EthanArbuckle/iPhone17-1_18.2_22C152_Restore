@interface IDSSystemAccountAdapter
- (IDSSystemAccountAdapter)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_ACAccountWithTypeIdentifier:(id)a3 matchingCriteria:(id)a4 error:(id *)a5;
- (id)_firstAccountInStore:(id)a3 withType:(id)a4 matchingCriteria:(id)a5;
- (id)_systemAccountRepresentationOfACAccount:(id)a3 DSIDKey:(id)a4;
- (id)_systemAccountWithIdentifier:(id)a3 DSIDKey:(id)a4 criteria:(id)a5 error:(id *)a6;
- (id)iCloudSystemAccountWithError:(id *)a3;
- (id)iTunesSystemAccountWithError:(id *)a3;
- (void)_ACAccountWithTypeIdentifier:(id)a3 matchingCriteria:(id)a4 completion:(id)a5;
- (void)_systemAccountWithIdentifier:(id)a3 DSIDKey:(id)a4 criteria:(id)a5 completion:(id)a6;
- (void)iCloudSystemAccountWithCompletion:(id)a3;
- (void)iTunesSystemAccountWithCompletion:(id)a3;
@end

@implementation IDSSystemAccountAdapter

- (IDSSystemAccountAdapter)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSSystemAccountAdapter;
  v6 = [(IDSSystemAccountAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)iCloudSystemAccountWithCompletion:(id)a3
{
  uint64_t v4 = qword_100A4A4F8;
  id v5 = a3;
  id v7 = v5;
  if (v4 == -1)
  {
    id v6 = v5;
  }
  else
  {
    dispatch_once(&qword_100A4A4F8, &stru_100980050);
    id v6 = v7;
  }
  [(IDSSystemAccountAdapter *)self _systemAccountWithIdentifier:qword_100A4A500 DSIDKey:@"personID" criteria:&stru_10097FF58 completion:v6];
}

- (void)iTunesSystemAccountWithCompletion:(id)a3
{
  uint64_t v4 = qword_100A4A508;
  id v5 = a3;
  id v7 = v5;
  if (v4 == -1)
  {
    id v6 = v5;
  }
  else
  {
    dispatch_once(&qword_100A4A508, &stru_100980070);
    id v6 = v7;
  }
  [(IDSSystemAccountAdapter *)self _systemAccountWithIdentifier:qword_100A4A510 DSIDKey:@"dsid" criteria:&stru_10097FF78 completion:v6];
}

- (id)iCloudSystemAccountWithError:(id *)a3
{
  if (qword_100A4A4F8 != -1) {
    dispatch_once(&qword_100A4A4F8, &stru_100980050);
  }
  uint64_t v5 = qword_100A4A500;

  return [(IDSSystemAccountAdapter *)self _systemAccountWithIdentifier:v5 DSIDKey:@"personID" criteria:&stru_10097FF98 error:a3];
}

- (id)iTunesSystemAccountWithError:(id *)a3
{
  if (qword_100A4A508 != -1) {
    dispatch_once(&qword_100A4A508, &stru_100980070);
  }
  uint64_t v5 = qword_100A4A510;

  return [(IDSSystemAccountAdapter *)self _systemAccountWithIdentifier:v5 DSIDKey:@"dsid" criteria:&stru_10097FFB8 error:a3];
}

- (void)_systemAccountWithIdentifier:(id)a3 DSIDKey:(id)a4 criteria:(id)a5 completion:(id)a6
{
  id v10 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100057D84;
  v14[3] = &unk_10097FFE0;
  v14[4] = self;
  id v15 = a4;
  id v16 = v10;
  id v17 = a6;
  id v11 = v17;
  id v12 = v10;
  id v13 = v15;
  [(IDSSystemAccountAdapter *)self _ACAccountWithTypeIdentifier:v12 matchingCriteria:a5 completion:v14];
}

- (void)_ACAccountWithTypeIdentifier:(id)a3 matchingCriteria:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100058044;
  v15[3] = &unk_100980030;
  v15[4] = self;
  id v16 = objc_alloc_init((Class)IMWeakLinkClass());
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v16;
  [v14 accountTypeWithIdentifier:v12 completion:v15];
}

- (id)_systemAccountWithIdentifier:(id)a3 DSIDKey:(id)a4 criteria:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v20 = 0;
  id v14 = [(IDSSystemAccountAdapter *)self _ACAccountWithTypeIdentifier:v10 matchingCriteria:v12 error:&v20];
  id v15 = v20;
  if (v15)
  {

    if (a6)
    {
      id v16 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
      id v22 = v15;
      id v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a6 = [v16 initWithDomain:@"IDSSystemAccountAdapterErrorDomain" code:-1000 userInfo:v17];

      a6 = 0;
    }
  }
  else
  {
    a6 = [(IDSSystemAccountAdapter *)self _systemAccountRepresentationOfACAccount:v14 DSIDKey:v11];
    id v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      v26 = a6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Done checking for system signed in account { identifier: %@, systemAccount: %@ }", buf, 0x16u);
    }
  }

  return a6;
}

- (id)_ACAccountWithTypeIdentifier:(id)a3 matchingCriteria:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = objc_alloc_init((Class)IMWeakLinkClass());
  id v18 = 0;
  id v12 = [v11 accountTypeWithAccountTypeIdentifier:v8 error:&v18];
  id v13 = v18;
  id v14 = v13;
  if (!v12 || v13)
  {
    id v16 = +[IMRGLog registration];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Did not find account type { identifier: %@, accountsError: %@ }", buf, 0x16u);
    }

    id v15 = 0;
  }
  else
  {
    id v15 = [(IDSSystemAccountAdapter *)self _firstAccountInStore:v11 withType:v12 matchingCriteria:v9];
  }

  if (a5 && v14) {
    *a5 = v14;
  }

  return v15;
}

- (id)_firstAccountInStore:(id)a3 withType:(id)a4 matchingCriteria:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (unsigned int (**)(id, void *))a5;
  [v7 accountsWithAccountType:v8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        if (v9)
        {
          id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v9[2](v9, v15))
          {
            id v12 = v15;
            goto LABEL_12;
          }
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v12;
}

- (id)_systemAccountRepresentationOfACAccount:(id)a3 DSIDKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v8 = [v5 username];
    if (v6)
    {
      id v9 = [v5 accountProperties];
      id v10 = [v9 objectForKey:v6];

      if (v10)
      {
        id v11 = +[NSString stringWithFormat:@"D:%@", v10];
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = [[IDSSystemAccount alloc] initWithUsername:v8 DSID:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end