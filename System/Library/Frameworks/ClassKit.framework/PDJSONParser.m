@interface PDJSONParser
- (id)parseData:(id)a3 expectedClass:(Class)a4 error:(id *)a5;
@end

@implementation PDJSONParser

- (id)parseData:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  id v6 = a3;
  id v12 = 0;
  v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:1 error:&v12];
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
      *(_DWORD *)buf = 138543618;
      id v14 = v6;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Error parsing JSON from data: %{public}@ error: %{public}@.", buf, 0x16u);
    }
    +[NSError cls_assignError:a5 fromError:v8];
  }

  return v7;
}

@end