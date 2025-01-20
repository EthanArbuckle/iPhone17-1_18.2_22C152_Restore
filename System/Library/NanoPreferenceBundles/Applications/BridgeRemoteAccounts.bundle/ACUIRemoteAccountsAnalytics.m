@interface ACUIRemoteAccountsAnalytics
+ (id)_descriptionForAction:(int64_t)a3;
+ (void)reportAccountActionErrorForAccount:(id)a3 action:(int64_t)a4 error:(id)a5;
+ (void)reportAccountActionForAccount:(id)a3 action:(int64_t)a4 numberOfAccounts:(int64_t)a5;
@end

@implementation ACUIRemoteAccountsAnalytics

+ (void)reportAccountActionForAccount:(id)a3 action:(int64_t)a4 numberOfAccounts:(int64_t)a5
{
  id v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (void *)a4;
  v12 = (void *)a5;
  id v8 = [location[0] accountType];
  id v9 = [v8 identifier];
  if (v9) {
    v5 = (__CFString *)v9;
  }
  else {
    v5 = &stru_187E8;
  }
  v11 = v5;

  v10[0] = v11;
  v10[1] = v15;
  v10[2] = v13;
  v10[3] = v12;
  AnalyticsSendEventLazy();
  objc_storeStrong(v10, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

+ (void)reportAccountActionErrorForAccount:(id)a3 action:(int64_t)a4 error:(id)a5
{
  id v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = (void *)a4;
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v8 = [location[0] accountType];
  id v9 = [v8 identifier];
  if (v9) {
    v5 = (__CFString *)v9;
  }
  else {
    v5 = &stru_187E8;
  }
  v17 = v5;

  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_10BA0;
  v14 = &unk_18710;
  id v15 = v17;
  v16[1] = v21;
  v16[2] = v19;
  v16[0] = v18;
  AnalyticsSendEventLazy();
  objc_storeStrong(v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

+ (id)_descriptionForAction:(int64_t)a3
{
  if (a3)
  {
    int64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    int64_t v4 = 0;
    char v3 = 0;
  }
  if (v3)
  {
    v6 = @"unknown";
  }
  else
  {
    switch(v4)
    {
      case 0:
        v6 = @"add";
        break;
      case 1:
        v6 = @"delete";
        break;
      case 2:
        v6 = @"fetch";
        break;
      case 3:
        v6 = @"update";
        break;
      default:
        JUMPOUT(0);
    }
  }

  return v6;
}

@end