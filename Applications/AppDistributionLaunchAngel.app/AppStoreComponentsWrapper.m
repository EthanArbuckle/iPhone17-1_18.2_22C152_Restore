@interface AppStoreComponentsWrapper
- (AppStoreComponentsWrapper)initWithLogKey:(id)a3;
- (id)lockupWithItemID:(id)a3 versionID:(id)a4 distributorID:(id)a5 isForAppStore:(BOOL)a6 delegate:(id)a7;
- (id)presentingViewControllerForMiniProductPageView:(id)a3;
- (void)miniProductPageView:(id)a3 didFailRequestWithError:(id)a4;
- (void)miniProductPageViewDidBeginRequest:(id)a3;
- (void)miniProductPageViewDidFinishRequest:(id)a3;
- (void)miniProductPageViewDidInvalidateIntrinsicContentSize:(id)a3;
- (void)miniProductPageViewDidPresentDescription:(id)a3;
@end

@implementation AppStoreComponentsWrapper

- (AppStoreComponentsWrapper)initWithLogKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppStoreComponentsWrapper;
  v6 = [(AppStoreComponentsWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logKey, a3);
  }

  return v7;
}

- (id)lockupWithItemID:(id)a3 versionID:(id)a4 distributorID:(id)a5 isForAppStore:(BOOL)a6 delegate:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  objc_storeWeak((id *)&self->_delegate, v15);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2050000000;
  v16 = (void *)qword_100076860;
  uint64_t v44 = qword_100076860;
  if (!qword_100076860)
  {
    v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_100006780;
    v39 = &unk_10006DCC0;
    v40 = &v41;
    sub_100006780((uint64_t)&v36);
    v16 = (void *)v42[3];
  }
  v17 = v16;
  _Block_object_dispose(&v41, 8);
  id v18 = [[v17 alloc] initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v18 setDelegate:self];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2050000000;
  v19 = (void *)qword_100076870;
  uint64_t v44 = qword_100076870;
  if (!qword_100076870)
  {
    v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_10000694C;
    v39 = &unk_10006DCC0;
    v40 = &v41;
    sub_10000694C((uint64_t)&v36);
    v19 = (void *)v42[3];
  }
  v20 = v19;
  _Block_object_dispose(&v41, 8);
  id v21 = [[v20 alloc] initWithStringValue:v12];
  v22 = (objc_class *)sub_1000061C0();
  v23 = v22;
  if (v8)
  {
    id v24 = [v22 alloc];
    v25 = sub_1000062A4();
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    v26 = (void *)qword_100076888;
    uint64_t v44 = qword_100076888;
    if (!qword_100076888)
    {
      v36 = _NSConcreteStackBlock;
      uint64_t v37 = 3221225472;
      v38 = sub_100006A4C;
      v39 = &unk_10006DCC0;
      v40 = &v41;
      v27 = (void *)sub_1000067D8();
      v28 = dlsym(v27, "ASCLockupContextAppStoreInstall");
      *(void *)(v40[1] + 24) = v28;
      qword_100076888 = *(void *)(v40[1] + 24);
      v26 = (void *)v42[3];
    }
    _Block_object_dispose(&v41, 8);
    if (v26)
    {
      id v29 = [v24 initWithID:v21 kind:v25 context:*v26];
      goto LABEL_14;
    }
    sub_1000589B0();
LABEL_18:
    v35 = (_Unwind_Exception *)sub_1000589B0();
    _Block_object_dispose(&v41, 8);
    _Unwind_Resume(v35);
  }
  v25 = sub_1000062A4();
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  v30 = (void *)qword_100076890;
  uint64_t v44 = qword_100076890;
  if (!qword_100076890)
  {
    v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_100006A9C;
    v39 = &unk_10006DCC0;
    v40 = &v41;
    v31 = (void *)sub_1000067D8();
    v32 = dlsym(v31, "ASCLockupContextAppDistributionInstall");
    *(void *)(v40[1] + 24) = v32;
    qword_100076890 = *(void *)(v40[1] + 24);
    v30 = (void *)v42[3];
  }
  _Block_object_dispose(&v41, 8);
  if (!v30) {
    goto LABEL_18;
  }
  id v29 = [(objc_class *)v23 _requestWithID:v21 kind:v25 context:*v30 appVersionId:v13 distributorId:v14];
LABEL_14:
  v33 = v29;

  [v18 setRequest:v33];

  return v18;
}

- (id)presentingViewControllerForMiniProductPageView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained miniProductPagePresentingViewController];

  v6 = sub_100005C7C(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v9 = 138543618;
    v10 = logKey;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mini product page asked for it's presenting controller, returning %@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (void)miniProductPageViewDidBeginRequest:(id)a3
{
  v4 = sub_100005C7C(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v6 = 138543362;
    v7 = logKey;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mini product page began request", (uint8_t *)&v6, 0xCu);
  }
}

- (void)miniProductPageViewDidFinishRequest:(id)a3
{
  v4 = sub_100005C7C(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v7 = 138543362;
    BOOL v8 = logKey;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mini product page finished request", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained miniProductPageRequestDidFinish];
}

- (void)miniProductPageView:(id)a3 didFailRequestWithError:(id)a4
{
  id v5 = a4;
  int v6 = sub_100005C7C(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000589D4((uint64_t)self, (uint64_t)v5, v6);
  }
}

- (void)miniProductPageViewDidInvalidateIntrinsicContentSize:(id)a3
{
  id v4 = a3;
  id v5 = sub_100005C7C(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100058A60((uint64_t)self, v5);
  }

  [v4 setNeedsLayout];
}

- (void)miniProductPageViewDidPresentDescription:(id)a3
{
  id v4 = sub_100005C7C(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100058ADC((uint64_t)self, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained moreButtonPressed];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_logKey, 0);
}

@end