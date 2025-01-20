@interface BDSICloudIdentityTokenTracker
- (BDSICloudIdentityToken)currentToken;
- (BDSICloudIdentityTokenTracker)initWithContainerURL:(id)a3 trackingLiverpool:(BOOL)a4;
- (BOOL)didUnacknowledgediCloudLogoutOccur;
- (BOOL)trackLiverpool;
- (NSMutableDictionary)plistContents;
- (NSURL)plistURL;
- (OS_dispatch_queue)dispatchQueue;
- (void)acknowledgeiCloudIdentity;
- (void)fetchCurrentToken;
- (void)forceUpdateTokenWithString:(id)a3;
- (void)setCurrentToken:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPlistContents:(id)a3;
- (void)setPlistURL:(id)a3;
- (void)setTrackLiverpool:(BOOL)a3;
@end

@implementation BDSICloudIdentityTokenTracker

- (NSMutableDictionary)plistContents
{
  return self->_plistContents;
}

- (BDSICloudIdentityToken)currentToken
{
  return self->_currentToken;
}

- (void)fetchCurrentToken
{
  if ([(BDSICloudIdentityTokenTracker *)self trackLiverpool])
  {
    v3 = +[BDSICloudIdentityToken tokenForCurrentIdentityIfCloudKitEnabled];
  }
  else
  {
    v3 = [[BDSICloudIdentityToken alloc] initWithCurrentIdentity];
  }
  v4 = v3;
  [(BDSICloudIdentityTokenTracker *)self setCurrentToken:v3];
}

- (BOOL)trackLiverpool
{
  return self->_trackLiverpool;
}

- (void)setCurrentToken:(id)a3
{
}

- (BOOL)didUnacknowledgediCloudLogoutOccur
{
  v2 = self;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  v3 = [(BDSICloudIdentityTokenTracker *)v2 dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000059CC;
  v5[3] = &unk_10025FCB8;
  objc_copyWeak(&v6, &location);
  v5[4] = v2;
  v5[5] = &v8;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

- (void)acknowledgeiCloudIdentity
{
  v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "acknowledgeiCloudIdentity", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = [(BDSICloudIdentityTokenTracker *)self dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005B50;
  v5[3] = &unk_10025F9F8;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  dispatch_sync(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BDSICloudIdentityTokenTracker)initWithContainerURL:(id)a3 trackingLiverpool:(BOOL)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BDSICloudIdentityTokenTracker;
  v7 = [(BDSICloudIdentityTokenTracker *)&v21 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_trackLiverpool = a4;
    uint64_t v9 = [v6 URLByAppendingPathComponent:@"BDSICloudIdentityToken.plist"];
    plistURL = v8->_plistURL;
    v8->_plistURL = (NSURL *)v9;

    char v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.iBooks.BDSICloudStatusMonitor.dispatchQueue", v12);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v13;

    v15 = +[NSDictionary dictionaryWithContentsOfURL:v8->_plistURL];
    id v16 = [v15 mutableCopy];
    v17 = v16;
    if (v16) {
      v18 = (NSMutableDictionary *)v16;
    }
    else {
      v18 = (NSMutableDictionary *)objc_opt_new();
    }
    plistContents = v8->_plistContents;
    v8->_plistContents = v18;
  }
  return v8;
}

- (void)forceUpdateTokenWithString:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v4 = [[BDSICloudIdentityToken alloc] initWithToken:v5];
    [(BDSICloudIdentityTokenTracker *)self setCurrentToken:v4];
  }
  else
  {
    [(BDSICloudIdentityTokenTracker *)self setCurrentToken:0];
  }
}

- (void)setPlistContents:(id)a3
{
}

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (void)setPlistURL:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setTrackLiverpool:(BOOL)a3
{
  self->_trackLiverpool = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);
  objc_storeStrong((id *)&self->_plistContents, 0);
}

@end