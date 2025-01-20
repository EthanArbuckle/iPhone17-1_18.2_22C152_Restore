@interface NSURL
- (BOOL)writePlist:(id)a3;
- (id)readPlist;
@end

@implementation NSURL

- (id)readPlist
{
  id v12 = 0;
  v3 = +[NSData dataWithContentsOfURL:self options:0 error:&v12];
  id v4 = v12;
  v5 = v4;
  if (v3)
  {
    id v10 = 0;
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    v6 = +[NSPropertyListSerialization propertyListWithData:v3 options:2 format:&v11 error:&v10];
    id v7 = v10;

    if (!v6)
    {
      v8 = sub_10000E250("SecError");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = self;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "could not deserialize PersistentState from %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v6 = 0;
    id v7 = v4;
  }

  return v6;
}

- (BOOL)writePlist:(id)a3
{
  id v4 = a3;
  if (+[NSPropertyListSerialization propertyList:v4 isValidForFormat:100])
  {
    id v14 = 0;
    v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:100 options:0 error:&v14];
    v6 = v14;
    id v7 = v6;
    if (v5)
    {
      v13 = v6;
      BOOL v8 = 1;
      unsigned __int8 v9 = [v5 writeToURL:self options:1 error:&v13];
      id v10 = v13;

      if (v9)
      {
LABEL_13:

        goto LABEL_14;
      }
      unint64_t v11 = sub_10000E250("SecError");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "error writing PersistentState to file: %@", buf, 0xCu);
      }
      id v7 = v10;
    }
    else
    {
      unint64_t v11 = sub_10000E250("SecError");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "error serializing PersistentState to xml: %@", buf, 0xCu);
      }
    }

    BOOL v8 = 0;
    id v10 = v7;
    goto LABEL_13;
  }
  id v10 = sub_10000E250("SecError");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "can't save PersistentState as XML", buf, 2u);
  }
  BOOL v8 = 0;
LABEL_14:

  return v8;
}

@end