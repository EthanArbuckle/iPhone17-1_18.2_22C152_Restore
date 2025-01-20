@interface MSDViewServiceModel
+ (id)sharedInstance;
- (BOOL)showCancelButton;
- (MSDViewServiceModel)init;
- (NSError)errorToReport;
- (NSMutableArray)errors;
- (NSNumber)progress;
- (NSString)errorMessage;
- (id)errorMessageFromErrors;
- (void)didReceiveAllowCancel:(BOOL)a3;
- (void)didReceiveError:(id)a3;
- (void)didReceiveProgress:(int64_t)a3;
- (void)operationCompleted;
- (void)operationFailed:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setErrorToReport:(id)a3;
- (void)setErrors:(id)a3;
- (void)setProgress:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
@end

@implementation MSDViewServiceModel

+ (id)sharedInstance
{
  if (qword_100012C88 != -1) {
    dispatch_once(&qword_100012C88, &stru_10000C4B0);
  }
  v2 = (void *)qword_100012C80;

  return v2;
}

- (MSDViewServiceModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDViewServiceModel;
  v2 = [(MSDViewServiceModel *)&v8 init];
  if (v2)
  {
    v3 = +[MSDKManagedDevice sharedInstance];
    [v3 setDelegate:v2];

    v4 = +[NSMutableArray array];
    [(MSDViewServiceModel *)v2 setErrors:v4];

    v5 = +[NSNumber numberWithFloat:0.0];
    [(MSDViewServiceModel *)v2 setProgress:v5];

    [(MSDViewServiceModel *)v2 setShowCancelButton:0];
    v6 = v2;
  }

  return v2;
}

- (id)errorMessageFromErrors
{
  v3 = [(MSDViewServiceModel *)self errors];
  id v4 = [v3 count];

  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [(MSDViewServiceModel *)self errors];
    id v5 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v5)
    {
      id v6 = v5;
      v7 = 0;
      objc_super v8 = &stru_10000C610;
      uint64_t v9 = *(void *)v25;
      do
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v10);
          v13 = [v12 localizedFailureReason];

          v14 = [v12 localizedDescription];
          id v15 = [v12 code];
          id v16 = v15;
          if (v13)
          {
            v17 = [v12 localizedFailureReason];
            uint64_t v18 = +[NSString stringWithFormat:@"%@(0x%lx) - %@\n", v14, v16, v17];

            v7 = (void *)v18;
          }
          else
          {
            +[NSString stringWithFormat:@"%@(0x%lx)\n", v14, v15];
            v7 = v17 = v7;
          }

          objc_super v8 = [(__CFString *)v11 stringByAppendingString:v7];

          v10 = (char *)v10 + 1;
          v11 = v8;
        }
        while (v6 != v10);
        id v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v6);
    }
    else
    {
      objc_super v8 = &stru_10000C610;
    }

    v21 = sub_100002050();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Full message is now: %{public}@", buf, 0xCu);
    }

    v20 = v8;
    v19 = v20;
  }
  else
  {
    v19 = 0;
    v20 = &stru_10000C610;
  }

  return v19;
}

- (void)didReceiveError:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDViewServiceModel *)self errors];
  [v5 addObject:v4];

  id v6 = [(MSDViewServiceModel *)self errorMessageFromErrors];
  [(MSDViewServiceModel *)self setErrorMessage:v6];
}

- (void)didReceiveProgress:(int64_t)a3
{
  id v5 = sub_100002050();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received progress: %ld", (uint8_t *)&v8, 0xCu);
  }

  if (a3 >= 1)
  {
    *(float *)&double v6 = (float)a3 / 100.0;
    v7 = +[NSNumber numberWithFloat:v6];
    [(MSDViewServiceModel *)self setProgress:v7];
  }
}

- (void)operationCompleted
{
  v3 = sub_100002050();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Operation completed, informing the view controller.", v4, 2u);
  }

  [(MSDViewServiceModel *)self setErrorToReport:0];
}

- (void)operationFailed:(id)a3
{
  id v4 = a3;
  id v5 = sub_100002050();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Operation failed, informing the view controller.", v6, 2u);
  }

  [(MSDViewServiceModel *)self setErrorToReport:v4];
}

- (void)didReceiveAllowCancel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100002050();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received allow cancel status: %d", (uint8_t *)v6, 8u);
  }

  [(MSDViewServiceModel *)self setShowCancelButton:v3];
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setErrorMessage:(id)a3
{
}

- (NSError)errorToReport
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setErrorToReport:(id)a3
{
}

- (NSNumber)progress
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProgress:(id)a3
{
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_errorToReport, 0);

  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end