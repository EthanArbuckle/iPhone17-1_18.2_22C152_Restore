@interface ICQRedirectResolver
+ (void)processResolvedURL:(id)a3 originalURL:(id)a4 resolutionError:(id)a5 completion:(id)a6;
+ (void)resolveWithURL:(id)a3 completion:(id)a4;
@end

@implementation ICQRedirectResolver

+ (void)resolveWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to resolve chatterbot URL %@", buf, 0xCu);
  }

  id v9 = [objc_alloc((Class)_SWCChatterboxResolver) initWithURL:v6];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003BA0;
  v12[3] = &unk_100008310;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  [v9 resolveWithCompletionHandler:v12];
}

+ (void)processResolvedURL:(id)a3 originalURL:(id)a4 resolutionError:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  if (v9)
  {
    if ([v9 isEqual:v10])
    {
      id v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100004894();
      }
LABEL_16:

      id v17 = ICQCreateError();
      v12[2](v12, 0, v17);

      goto LABEL_17;
    }
    id v15 = [v9 host];
    unsigned __int8 v16 = [v15 isEqualToString:@"icq.icloud.com"];

    if ((v16 & 1) == 0)
    {
      id v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000048FC();
      }
      goto LABEL_16;
    }
    ((void (**)(id, id, void *))v12)[2](v12, v9, 0);
  }
  else
  {
    id v13 = _ICQGetLogSystem();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!v11)
    {
      if (v14) {
        sub_1000047A8();
      }
      goto LABEL_16;
    }
    if (v14) {
      sub_100004810();
    }

    v12[2](v12, 0, v11);
  }
LABEL_17:
}

@end