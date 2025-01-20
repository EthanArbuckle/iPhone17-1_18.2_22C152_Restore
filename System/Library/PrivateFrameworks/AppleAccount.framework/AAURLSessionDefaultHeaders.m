@interface AAURLSessionDefaultHeaders
@end

@implementation AAURLSessionDefaultHeaders

void ___AAURLSessionDefaultHeaders_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = +[AADeviceInfo currentInfo];
  v2 = [v1 clientInfoHeader];

  if (v2) {
    [v0 setObject:v2 forKeyedSubscript:@"X-MMe-Client-Info"];
  }
  if (+[AAPreferences isExperimentalModeEnabled])
  {
    v3 = _AALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Adding exp mode header", v6, 2u);
    }

    [v0 setObject:@"true" forKeyedSubscript:@"X-iCloud-Experiment-Mode"];
  }
  uint64_t v4 = [v0 copy];
  v5 = (void *)_AAURLSessionDefaultHeaders_defaultHeaders;
  _AAURLSessionDefaultHeaders_defaultHeaders = v4;
}

@end