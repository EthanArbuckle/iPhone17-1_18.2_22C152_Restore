@interface ACLSTypeVerifier
- (ACLSTypeVerifier)initWithTemplate:(id)a3;
- (BOOL)verify:(id)a3 name:(id)a4 tag:(unsigned int)a5;
- (BOOL)verify:(id)a3 name:(id)a4 withTemplate:(id)a5 tag:(unsigned int)a6;
- (NSDictionary)template;
- (id)sanitize:(id)a3 tag:(unsigned int)a4;
- (id)sanitize:(id)a3 withTemplate:(id)a4 tag:(unsigned int)a5;
- (void)setTemplate:(id)a3;
@end

@implementation ACLSTypeVerifier

- (ACLSTypeVerifier)initWithTemplate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACLSTypeVerifier;
  v5 = [(ACLSTypeVerifier *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ACLSTypeVerifier *)v5 setTemplate:v4];
  }

  return v6;
}

- (BOOL)verify:(id)a3 name:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(ACLSTypeVerifier *)self template];
  LOBYTE(v5) = [(ACLSTypeVerifier *)self verify:v9 name:v8 withTemplate:v10 tag:v5];

  return v5;
}

- (id)sanitize:(id)a3 tag:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(ACLSTypeVerifier *)self template];
  id v8 = [(ACLSTypeVerifier *)self sanitize:v6 withTemplate:v7 tag:v4];

  return v8;
}

- (BOOL)verify:(id)a3 name:(id)a4 withTemplate:(id)a5 tag:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = gLogHandle;
  if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEBUG)) {
    sub_100022FB4(v13, (uint64_t)v11, a6);
  }
  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    sub_100022F5C();
  }
  v14 = [v12 objectForKey:@"mandatory"];
  unsigned int v15 = [v14 BOOLValue];

  if (v10)
  {
    v16 = (objc_class *)[v12 objectForKey:@"class"];
    if (!v16) {
      sub_100022F88();
    }
    if (objc_opt_isKindOfClass())
    {
      if (v16 == (objc_class *)objc_opt_class() || v16 == (objc_class *)objc_opt_class())
      {
        *(void *)buf = 0;
        *(void *)v42 = buf;
        *(void *)&v42[8] = 0x2020000000;
        v42[16] = 1;
        v26 = [v12 objectForKey:@"template"];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100004938;
        v36[3] = &unk_1000349F8;
        v36[4] = self;
        id v37 = v11;
        id v27 = v26;
        unsigned int v40 = a6;
        id v38 = v27;
        v39 = buf;
        [v10 enumerateObjectsUsingBlock:v36];
        char v17 = *(unsigned char *)(*(void *)v42 + 24) != 0;
      }
      else
      {
        if (v16 != (objc_class *)objc_opt_class() && v16 != (objc_class *)objc_opt_class())
        {
          char v17 = 1;
          goto LABEL_22;
        }
        *(void *)buf = 0;
        *(void *)v42 = buf;
        *(void *)&v42[8] = 0x2020000000;
        v42[16] = 1;
        v28 = [v12 objectForKey:@"template"];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000049DC;
        v30[3] = &unk_100034A20;
        id v31 = v10;
        v32 = self;
        unsigned int v35 = a6;
        id v33 = v11;
        v34 = buf;
        [v28 enumerateKeysAndObjectsUsingBlock:v30];
        char v17 = *(unsigned char *)(*(void *)v42 + 24) != 0;
      }
      _Block_object_dispose(buf, 8);
      goto LABEL_22;
    }
    v20 = gLogHandle;
    char v17 = 0;
    if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = currentQueueName();
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = NSStringFromClass(v16);
      *(_DWORD *)buf = 67110403;
      *(_DWORD *)&buf[4] = a6;
      *(_WORD *)v42 = 2080;
      *(void *)&v42[2] = v22;
      *(_WORD *)&v42[10] = 2112;
      *(void *)&v42[12] = v11;
      __int16 v43 = 2112;
      v44 = v24;
      __int16 v45 = 2112;
      v46 = v25;
      __int16 v47 = 2113;
      id v48 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#%08x [%s] %@ has wrong type: %@; expected %@: %{private}@",
        buf,
        0x3Au);

      char v17 = 0;
    }
  }
  else
  {
    if (v15)
    {
      v18 = gLogHandle;
      if (os_log_type_enabled((os_log_t)gLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = a6;
        *(_WORD *)v42 = 2080;
        *(void *)&v42[2] = currentQueueName();
        *(_WORD *)&v42[10] = 2112;
        *(void *)&v42[12] = v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#%08x [%s] %@ is missing", buf, 0x1Cu);
      }
    }
    char v17 = v15 ^ 1;
  }
LABEL_22:

  return v17;
}

- (id)sanitize:(id)a3 withTemplate:(id)a4 tag:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8
    && (id v11 = [v9 objectForKey:@"class"],
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v11 == (id)objc_opt_class() || v11 == (id)objc_opt_class())
    {
      v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
      [v10 objectForKey:@"template"];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100004D24;
      v23[3] = &unk_100034A48;
      v23[4] = self;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v26 = a5;
      id v12 = v13;
      id v25 = v12;
      id v14 = v24;
      [v8 enumerateObjectsUsingBlock:v23];
    }
    else if (v11 == (id)objc_opt_class() || v11 == (id)objc_opt_class())
    {
      unsigned int v15 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
      v16 = [v10 objectForKey:@"template"];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100004D90;
      v18[3] = &unk_100034A70;
      id v19 = v8;
      v20 = self;
      unsigned int v22 = a5;
      id v12 = v15;
      id v21 = v12;
      [v16 enumerateKeysAndObjectsUsingBlock:v18];
    }
    else
    {
      id v12 = v8;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSDictionary)template
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTemplate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end