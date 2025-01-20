@interface SKUIErrorHelper
+ (id)errorWithSafeUserInfo:(id)a3;
@end

@implementation SKUIErrorHelper

+ (id)errorWithSafeUserInfo:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc((Class)NSMutableDictionary);
    v5 = [v3 userInfo];
    id v6 = [v4 initWithCapacity:[v5 count]];

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v7 = [v3 userInfo];
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100009788;
    v15 = &unk_10004CE18;
    v17 = &v18;
    id v8 = v6;
    id v16 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:&v12];

    if (*((unsigned char *)v19 + 24))
    {
      v9 = [v3 domain:v12, v13, v14, v15];
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, [v3 code], v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = v3;
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end