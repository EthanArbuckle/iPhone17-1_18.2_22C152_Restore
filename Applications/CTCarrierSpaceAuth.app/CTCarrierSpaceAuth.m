void sub_100001A40(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t vars8;

  v5 = a3;
  v6 = a2;
  v7 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  v8 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v7];

  v9 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  v10 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v9];

  +[NSString stringWithFormat:@"%@=%@", v8, v10];
  v11 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v11];
}

void sub_100002680(uint64_t a1, uint64_t a2)
{
  v4 = +[NSString stringWithUTF8String:"CarrierSpaceOAuthResult"];
  v8[0] = @"status_domain";
  v5 = +[NSNumber numberWithInt:a1];
  v8[1] = @"status_code";
  v9[0] = v5;
  v6 = +[NSNumber numberWithInteger:a2];
  v9[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  AnalyticsSendEvent();
}

void sub_100002784(void *a1)
{
  id v13 = a1;
  id v1 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = +[NSNumber numberWithInt:2];
  v3 = [v13 error];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    unsigned int v6 = [v5 isEqualToString:NSCocoaErrorDomain];

    if (v6)
    {
      if ([v4 code] == (id)3840)
      {
        uint64_t v7 = +[NSNumber numberWithInt:3];
        if (v7) {
          goto LABEL_7;
        }
      }
    }
  }
  v8 = [v13 errorDescription];

  if (v8)
  {
    v9 = [v13 errorDescription];
    [v1 setObject:v9 forKeyedSubscript:@"oauth_error"];

    uint64_t v7 = +[NSNumber numberWithInt:2];
    if (v7)
    {
LABEL_7:
      v10 = (void *)v7;
LABEL_10:
      [v1 setObject:v2 forKeyedSubscript:@"status_domain"];
      [v1 setObject:v10 forKeyedSubscript:@"status_code"];
      v12 = +[NSString stringWithUTF8String:"CarrierSpaceOAuthResult"];
      AnalyticsSendEvent();

      goto LABEL_11;
    }
  }
  if ([v13 statusCode] != (id)200)
  {
    uint64_t v11 = +[NSNumber numberWithInt:3];

    v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 statusCode]);
    v2 = (void *)v11;
    if (v10) {
      goto LABEL_10;
    }
  }
LABEL_11:
}

uint64_t sub_100002AA0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10000310C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100003120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  unsigned int v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

id sub_1000031A8()
{
  if (qword_1000124E8 != -1) {
    dispatch_once(&qword_1000124E8, &stru_10000C400);
  }
  v0 = (void *)qword_1000124E0;

  return v0;
}

void sub_1000031FC(id a1)
{
  qword_1000124E0 = (uint64_t)os_log_create("com.apple.carrierspaceauth", "log");

  _objc_release_x1();
}

uint64_t sub_100003240()
{
  return _MGGetBoolAnswer(@"apple-internal-install");
}

id *sub_1000036DC(id *result, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0) {
    return (id *)[result[4] _presentAlertController:1];
  }
  return result;
}

void sub_100003864(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100003894(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[5];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000393C;
    v4[3] = &unk_10000C450;
    v5 = WeakRetained;
    [v3 userDidAcceptPlanTerms:1 completion:v4];
  }
}

id sub_10000393C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _loadAuthUrl];
  if ((result & 1) == 0)
  {
    uint64_t v3 = sub_1000031A8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to load auth URL after user accepted plan terms", v4, 2u);
    }

    return [*(id *)(a1 + 32) _deactivate];
  }
  return result;
}

void sub_1000039BC(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[5];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100003A64;
    v4[3] = &unk_10000C450;
    v5 = WeakRetained;
    [v3 userDidAcceptPlanTerms:0 completion:v4];
  }
}

id sub_100003A64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

id sub_100004140(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

void sub_1000042C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000042E4(uint64_t a1)
{
  uint64_t v2 = sub_1000031A8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Notified that we have exited auth flow, going to dismiss alert", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000043C4;
    v5[3] = &unk_10000C4E0;
    id v6 = WeakRetained;
    [v6 dismissViewControllerAnimated:1 completion:v5];
  }
}

id sub_1000043C4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 dismiss];

  uint64_t v2 = (void *)UIApp;

  return [v2 terminateWithSuccess];
}

void sub_100004610(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  id v1 = [v2 window];
  [v1 makeKeyAndVisible];
}

id sub_1000047F4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004868;
  v3[3] = &unk_10000C450;
  v3[4] = v1;
  return [v1 _sendAuthFailure:9 completion:v3];
}

id sub_100004868(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

void sub_100004870(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) visibleViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

id sub_1000049C0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 name];
  id v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

void sub_100004B2C(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _getValueFromContextForKey:@"kCTCarrierSpaceCarrierName"];
  id v2 = +[AlertControllerFactory alertControllerWithBiometryType:*(void *)(a1 + 48) forCarrier:v4 completion:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) visibleViewController];
  [v3 presentViewController:v2 animated:1 completion:0];
}

id sub_100004E44(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setShouldCache:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004ECC;
  v6[3] = &unk_10000C450;
  v6[4] = v3;
  return [v3 _sendAuthInfo:v4 completion:v6];
}

id sub_100004ECC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

void sub_1000050AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000050D4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = [[AuthTokenResponse alloc] initWithData:v11 urlResponse:v7 error:v8];
    [WeakRetained _handleTokenResponse:v10];
  }
}

id sub_100005774(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000057E8;
  v3[3] = &unk_10000C450;
  v3[4] = v1;
  return [v1 _sendAuthFailure:10 completion:v3];
}

id sub_1000057E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

id sub_1000059D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

id sub_100005B84(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivate];
}

void sub_100005C44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005C6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005C98(void *a1)
{
  id v1 = [a1 error];
  sub_100005C60();
  sub_100005C6C((void *)&_mh_execute_header, v2, v3, "Auth code exchange failed with error: %@", v4, v5, v6, v7, v8);
}

void sub_100005D1C()
{
  sub_100005C8C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "Got openURL callback with no in-flight request, ignoring", v2, v3, v4, v5, v6);
}

void sub_100005D50()
{
  sub_100005C60();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Redirect URL did not contain auth code! URL %@", v1, 0xCu);
}

void sub_100005DC4()
{
  sub_100005C8C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "Expected a 'state' query item, but wasn't found", v2, v3, v4, v5, v6);
}

void sub_100005DF8()
{
  sub_100005C8C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "Unable to decode state value!", v2, v3, v4, v5, v6);
}

void sub_100005E2C()
{
  sub_100005C8C();
  sub_100005C44((void *)&_mh_execute_header, v0, v1, "Decoded dictionary in state parameter does not match!", v2, v3, v4, v5, v6);
}

void sub_100005E60()
{
  sub_100005C60();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Received unexpected redirect URL '%@', expected '%@'", v2, 0x16u);
}

void sub_100005EE4()
{
  sub_100005C60();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Load error: %@", v1, 0xCu);
}

void sub_100005F58(void *a1)
{
  [a1 statusCode];
  sub_100005C60();
  sub_100005C6C((void *)&_mh_execute_header, v1, v2, "Server returned error in response: %ld", v3, v4, v5, v6, v7);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend__configure(void *a1, const char *a2, ...)
{
  return [a1 _configure];
}

id objc_msgSend__deactivate(void *a1, const char *a2, ...)
{
  return [a1 _deactivate];
}

id objc_msgSend__generateStateDict(void *a1, const char *a2, ...)
{
  return [a1 _generateStateDict];
}

id objc_msgSend__getNSURLSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _getNSURLSessionConfiguration];
}

id objc_msgSend__loadAuthUrl(void *a1, const char *a2, ...)
{
  return [a1 _loadAuthUrl];
}

id objc_msgSend__loadPlanTermsUrl(void *a1, const char *a2, ...)
{
  return [a1 _loadPlanTermsUrl];
}

id objc_msgSend__loadRemoteUIController(void *a1, const char *a2, ...)
{
  return [a1 _loadRemoteUIController];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_biometryType(void *a1, const char *a2, ...)
{
  return [a1 biometryType];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorDescription(void *a1, const char *a2, ...)
{
  return [a1 errorDescription];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_expiryDate(void *a1, const char *a2, ...)
{
  return [a1 expiryDate];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_launchContext(void *a1, const char *a2, ...)
{
  return [a1 launchContext];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return [a1 loadView];
}

id objc_msgSend_loader(void *a1, const char *a2, ...)
{
  return [a1 loader];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_messageLabel(void *a1, const char *a2, ...)
{
  return [a1 messageLabel];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_redirectURI(void *a1, const char *a2, ...)
{
  return [a1 redirectURI];
}

id objc_msgSend_refreshToken(void *a1, const char *a2, ...)
{
  return [a1 refreshToken];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return [a1 visibleViewController];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}