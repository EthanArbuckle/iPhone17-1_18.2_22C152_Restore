@interface TKSmartCard
- (id)recordsOfObject:(id)a3 error:(id *)a4;
- (id)sendIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 request:(id)a6 expectedTag:(unint64_t)a7 sw:(unsigned __int16 *)a8 error:(id *)a9;
@end

@implementation TKSmartCard

- (id)sendIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 request:(id)a6 expectedTag:(unint64_t)a7 sw:(unsigned __int16 *)a8 error:(id *)a9
{
  uint64_t v11 = a5;
  uint64_t v12 = a4;
  uint64_t v13 = a3;
  *a8 = 0;
  v15 = [a6 data];
  v16 = [(TKSmartCard *)self sendIns:v13 p1:v12 p2:v11 data:v15 le:&off_100008670 sw:a8 error:a9];

  if ([v16 length])
  {
    v17 = +[TKBERTLVRecord recordFromData:v16];
    if ([v17 tag] == (id)a7)
    {
      id v18 = v17;
    }
    else
    {
      v20 = sub_100003FF0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100005598(a7, (uint64_t)v17, v20);
      }

      if (a9)
      {
        +[NSError errorWithDomain:TKErrorDomain code:-3 userInfo:0];
        id v18 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v18 = 0;
      }
    }
  }
  else
  {
    id v18 = 0;
    if (a9 && v16)
    {
      int v19 = *a8;
      if (v19 == 27264 || v19 == 36864 || v19 == 27266)
      {
        +[NSError errorWithDomain:TKErrorDomain code:-6 userInfo:0];
        id v18 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v18 = 0;
      }
    }
  }

  return v18;
}

- (id)recordsOfObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = sub_100003FF0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100005658();
    }

    id v8 = [objc_alloc((Class)TKBERTLVRecord) initWithTag:92 value:v6];
    __int16 v22 = 0;
    v9 = [(TKSmartCard *)self sendIns:203 p1:63 p2:255 request:v8 expectedTag:83 sw:&v22 error:a4];
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 value];
      uint64_t v12 = +[TKBERTLVRecord sequenceOfRecordsFromData:v11];

      if (!v12)
      {
        uint64_t v13 = sub_100003FF0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100005620(v13, v14, v15, v16, v17, v18, v19, v20);
        }

        if (a4)
        {
          *a4 = +[NSError errorWithDomain:TKErrorDomain code:-3 userInfo:0];
        }
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else if (a4)
  {
    +[NSError errorWithDomain:TKErrorDomain code:-6 userInfo:0];
    uint64_t v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

@end