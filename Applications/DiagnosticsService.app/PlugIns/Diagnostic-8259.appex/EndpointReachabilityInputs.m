@interface EndpointReachabilityInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)endpointURLs;
- (NSNumber)timeout;
@end

@implementation EndpointReachabilityInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  v4 = (char *)a3;
  unsigned __int8 v17 = 0;
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[EndpointReachabilityInputs validateAndInitializeParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Parameters: %@", buf, 0xCu);
  }

  v7 = +[NSArray arrayWithObjects:@"https://idiagnostics.apple.com", @"https://gs.apple.com", @"https://skl.apple.com", @"https://gg.apple.com", @"https://ig.apple.com", 0];
  v8 = +[NSSet setWithObject:objc_opt_class()];
  [v4 dk_arrayFromKey:@"endpointURLs" types:v8 maxLength:0xFFFFFFFFLL defaultValue:v7 failed:&v17 validator:&stru_100008268];
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  endpointURLs = self->_endpointURLs;
  self->_endpointURLs = v9;

  v11 = self->_endpointURLs;
  if (!v11 || ![(NSArray *)v11 count]) {
    unsigned __int8 v17 = 1;
  }

  int v12 = v17;
  if (!v17)
  {
    [v4 dk_numberFromKey:@"timeout" lowerBound:&off_100008650 upperBound:&off_100008668 defaultValue:&off_100008680 failed:&v17];
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    timeout = self->_timeout;
    self->_timeout = v13;

    int v12 = v17;
  }
  BOOL v15 = v12 == 0;

  return v15;
}

- (NSArray)endpointURLs
{
  return self->_endpointURLs;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);

  objc_storeStrong((id *)&self->_endpointURLs, 0);
}

@end