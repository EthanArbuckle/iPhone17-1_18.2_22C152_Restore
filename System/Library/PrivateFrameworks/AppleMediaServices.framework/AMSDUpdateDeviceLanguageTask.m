@interface AMSDUpdateDeviceLanguageTask
- (id)_updateLanguageForAccount:(id)a3 mediaType:(id)a4;
- (id)perform;
@end

@implementation AMSDUpdateDeviceLanguageTask

- (id)perform
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005FA24;
  v4[3] = &unk_100112020;
  v4[4] = self;
  v2 = [(AMSDUpdateDeviceLanguageTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

- (id)_updateLanguageForAccount:(id)a3 mediaType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[AMSDBag bagForMediaType:v6];
  v8 = objc_msgSend(v5, "ams_storefrontForMediaType:", v6);
  id v9 = [v8 length];

  if (v9)
  {
    v10 = +[AMSProcessInfo currentProcess];
    [v10 setAccountMediaType:v6];
    id v11 = [objc_alloc((Class)AMSURLRequestEncoder) initWithBag:v7];
    [v11 setAccount:v5];
    v12 = AMSLogKey();
    [v11 setLogUUID:v12];

    [v11 setClientInfo:v10];
    v13 = [v7 URLForKey:@"change-language"];
    v14 = [v11 requestWithMethod:2 bagURL:v13 parameters:0];
    v15 = [v14 thenWithBlock:&stru_100114608];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000602E0;
    v18[3] = &unk_100114630;
    id v16 = objc_alloc_init((Class)AMSMutableBinaryPromise);
    id v19 = v16;
    [v15 addFinishBlock:v18];
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"The device is missing a storefront for the specified media type. mediaType = %@", v6];
    AMSError();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = +[AMSBinaryPromise promiseWithError:v11];
  }

  return v16;
}

@end