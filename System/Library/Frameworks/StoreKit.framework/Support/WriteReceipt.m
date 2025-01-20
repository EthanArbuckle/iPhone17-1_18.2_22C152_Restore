@interface WriteReceipt
+ (BOOL)writeReceiptData:(id)a3 forBundleURL:(id)a4 logKey:(id)a5 error:(id *)a6;
+ (BOOL)writeReceiptData:(id)a3 toURL:(id)a4 logKey:(id)a5 error:(id *)a6;
@end

@implementation WriteReceipt

+ (BOOL)writeReceiptData:(id)a3 forBundleURL:(id)a4 logKey:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v44 = 0;
  id v13 = [objc_alloc((Class)LSApplicationRecord) initWithURL:v11 allowPlaceholder:0 error:&v44];
  id v14 = v44;
  uint64_t v15 = objc_msgSend(v13, "lib_receiptURL");
  v16 = (void *)v15;
  if (v13) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    v18 = +[NSString stringWithFormat:@"Invalid container for application: %@", v11];
    ASDErrorWithDescription();
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v19 = 0;
  }
  else
  {
    id v35 = v11;
    v36 = a6;
    id v43 = v14;
    id v20 = a1;
    v33 = (void *)v15;
    id v37 = v12;
    unsigned __int8 v21 = [a1 writeReceiptData:v10 toURL:v15 logKey:v12 error:&v43];
    id v22 = v43;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v34 = v13;
    v23 = [v13 applicationExtensionRecords];
    v24 = [v23 allObjects];

    id v25 = [v24 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v40;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "lib_receiptURL");
          if (v29)
          {
            if (v21)
            {
              id v38 = v22;
              unsigned __int8 v21 = [v20 writeReceiptData:v10 toURL:v29 logKey:v37 error:&v38];
              id v30 = v10;
              id v31 = v38;

              id v22 = v31;
              id v10 = v30;
            }
            else
            {
              unsigned __int8 v21 = 0;
            }
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v26);
    }

    BOOL v19 = v21 & 1;
    id v11 = v35;
    a6 = v36;
    id v12 = v37;
    v16 = v33;
    id v13 = v34;
  }

  if (a6 && !v19) {
    *a6 = v22;
  }

  return v19;
}

+ (BOOL)writeReceiptData:(id)a3 toURL:(id)a4 logKey:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  id v10 = +[NSFileManager defaultManager];
  v41[0] = NSFileOwnerAccountName;
  v41[1] = NSFileGroupOwnerAccountName;
  v42[0] = @"mobile";
  v42[1] = @"mobile";
  id v11 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  if (qword_1003A0650 != -1) {
    dispatch_once(&qword_1003A0650, &stru_10035A688);
  }
  id v12 = (void *)qword_1003A0630;
  if (os_log_type_enabled((os_log_t)qword_1003A0630, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    *(_DWORD *)buf = 138543874;
    id v34 = v30;
    __int16 v35 = 2048;
    id v36 = [v8 length];
    __int16 v37 = 2114;
    id v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Writing receipt (%ld bytes) to %{public}@", buf, 0x20u);
  }
  id v14 = [v9 URLByDeletingLastPathComponent];
  if (!v14)
  {
    unsigned __int8 v21 = 0;
LABEL_11:
    id v22 = +[NSString stringWithFormat:@"Invalid container: %@", v14];
    uint64_t v23 = ASDErrorWithDescription();

    id v19 = (id)v23;
    goto LABEL_12;
  }
  id v32 = 0;
  unsigned int v15 = [v10 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:v11 error:&v32];
  id v16 = v32;
  BOOL v17 = v16;
  if (!v15)
  {
    unsigned __int8 v21 = v16;
    goto LABEL_11;
  }
  id v31 = v16;
  unsigned __int8 v18 = [v8 writeToURL:v9 options:1 error:&v31];
  id v19 = v31;

  if (v18)
  {
    BOOL v20 = 1;
    goto LABEL_19;
  }
LABEL_12:
  if (qword_1003A0650 != -1) {
    dispatch_once(&qword_1003A0650, &stru_10035A688);
  }
  v24 = (void *)qword_1003A0630;
  if (os_log_type_enabled((os_log_t)qword_1003A0630, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = v24;
    id v28 = [v8 length];
    *(_DWORD *)buf = 138544130;
    id v34 = v30;
    __int16 v35 = 2048;
    id v36 = v28;
    __int16 v37 = 2114;
    id v38 = v9;
    __int16 v39 = 2114;
    id v40 = v19;
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Error writing receipt (%ld bytes) to %{public}@: %{public}@", buf, 0x2Au);
  }
  if (a6)
  {
    id v25 = +[NSString stringWithFormat:@"Failed to write receipt to URL: %@", v9];
    ASDErrorWithUnderlyingErrorAndDescription();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

@end