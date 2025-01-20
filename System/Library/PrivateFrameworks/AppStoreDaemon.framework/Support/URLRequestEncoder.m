@interface URLRequestEncoder
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
@end

@implementation URLRequestEncoder

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 mutableCopy];

    id v9 = v8;
    id v7 = v9;
    if (self)
    {
      if (sub_100364E90((uint64_t)self->_requestProperties))
      {
        v10 = +[AMSDevice deviceGUID];
        [v7 setObject:v10 forKeyedSubscript:@"guid"];
      }
      id v11 = v7;
      if ((unint64_t)(sub_100364720((uint64_t)self->_requestProperties) - 3) >= 0xFFFFFFFFFFFFFFFELL)
      {
        v12 = +[AMSKeybag sharedInstance];
        v13 = sub_1003640C4((uint64_t)self->_requestProperties);
        v14 = objc_msgSend(v13, "ams_DSID");
        id v32 = 0;
        v15 = [v12 keybagSyncDataWithAccountID:v14 transactionType:1 error:&v32];
        id v16 = v32;

        if (v16)
        {
          v17 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v26 = sub_1003640C4((uint64_t)self->_requestProperties);
            v27 = objc_msgSend(v26, "ams_DSID");
            *(_DWORD *)buf = 138543362;
            v34 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error generating keybag for account: %{public}@", buf, 0xCu);
          }
        }
        if ([v15 length])
        {
          v18 = [v15 base64EncodedStringWithOptions:0];
          if (v18) {
            [v11 setObject:v18 forKeyedSubscript:@"kbsync"];
          }
        }
      }
    }
    else
    {

      id v28 = v7;
    }
  }
  id v19 = [v6 mutableCopy];
  [v19 setCachePolicy:sub_1003649B0((uint64_t)self->_requestProperties)];
  requestProperties = self->_requestProperties;
  if (requestProperties) {
    requestProperties = objc_getProperty(requestProperties, v20, 104, 1);
  }
  id v22 = requestProperties;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100267204;
  v30[3] = &unk_1005241E8;
  id v31 = v19;
  id v23 = v19;
  [v22 enumerateKeysAndObjectsUsingBlock:v30];

  v29.receiver = self;
  v29.super_class = (Class)URLRequestEncoder;
  v24 = [(URLRequestEncoder *)&v29 requestByEncodingRequest:v23 parameters:v7];

  return v24;
}

- (void).cxx_destruct
{
}

@end