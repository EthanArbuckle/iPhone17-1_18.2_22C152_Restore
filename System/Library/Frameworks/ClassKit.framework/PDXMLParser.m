@interface PDXMLParser
- (id)parseData:(id)a3 expectedClass:(Class)a4 error:(id *)a5;
@end

@implementation PDXMLParser

- (id)parseData:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  id v6 = a3;
  id v12 = 0;
  uint64_t v13 = 0;
  v7 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:&v13 error:&v12];
  id v8 = v12;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    CLSInitLog();
    v10 = CLSLogOperations;
    if (os_log_type_enabled(CLSLogOperations, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v15 = v6;
      __int16 v16 = 2048;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Error parsing XML from data: %{public}@ format:%lu error: %{public}@.", buf, 0x20u);
    }
    +[NSError cls_assignError:a5 fromError:v8];
  }

  return v7;
}

@end