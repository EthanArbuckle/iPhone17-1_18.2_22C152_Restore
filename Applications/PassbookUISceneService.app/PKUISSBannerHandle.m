@interface PKUISSBannerHandle
- (PKUISSBannerHandle)init;
- (void)configureForRequest:(id)a3 withState:(id)a4 didStartReply:(id)a5;
- (void)detachWithReply:(id)a3;
- (void)displayWithReply:(id)a3;
- (void)updateState:(id)a3 withReply:(id)a4;
@end

@implementation PKUISSBannerHandle

- (PKUISSBannerHandle)init
{
  return 0;
}

- (void)configureForRequest:(id)a3 withState:(id)a4 didStartReply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!self->_invalidated)
  {
    if (self->_phase)
    {
      v13 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        sub_1000031E8((uint64_t)self, 0);
        goto LABEL_7;
      }
      int v20 = 134217984;
      v21 = self;
      v14 = "PKUISSBannerHandle (%p): out of order - configure - invalidating.";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0xCu);
      goto LABEL_6;
    }
    self->_phase = 1;
    if (!v11)
    {
      v13 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      int v20 = 134217984;
      v21 = self;
      v14 = "PKUISSBannerHandle (%p): missing reply - invalidating.";
      goto LABEL_5;
    }
    if (!v9)
    {
      v13 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      int v20 = 134217984;
      v21 = self;
      v14 = "PKUISSBannerHandle (%p): missing request - invalidating.";
      goto LABEL_5;
    }
    if (v10)
    {
      id v15 = [v10 type];
      if (v15 != [v9 type])
      {
        v13 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        int v20 = 134217984;
        v21 = self;
        v14 = "PKUISSBannerHandle (%p): type mismatch - invalidating.";
        goto LABEL_5;
      }
    }
    objc_storeStrong((id *)&self->_request, a3);
    objc_storeStrong((id *)&self->_state, a4);
    id v16 = objc_retainBlock(v12);
    id didStartReply = self->_didStartReply;
    self->_id didStartReply = v16;

    v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(PKBannerHandleRequest *)self->_request type];
      int v20 = 134218240;
      v21 = self;
      __int16 v22 = 2048;
      id v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): configured for %ld.", (uint8_t *)&v20, 0x16u);
    }
  }
LABEL_7:
}

- (void)updateState:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void))a4;
  if (!self->_invalidated)
  {
    int phase = self->_phase;
    if (self->_phase)
    {
      if (v7)
      {
        id v10 = [v7 type];
        if (v10 != [(PKBannerHandleRequest *)self->_request type])
        {
          id v11 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 134217984;
            v17 = self;
            v12 = "PKUISSBannerHandle (%p): type mismatch - ignoring state update.";
            goto LABEL_18;
          }
LABEL_19:

          goto LABEL_20;
        }
        int phase = self->_phase;
      }
      if (phase != 4)
      {
        id v11 = self->_state;
        objc_storeStrong((id *)&self->_state, a3);
        v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 134217984;
          v17 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): state updated.", (uint8_t *)&v16, 0xCu);
        }

        v8[2](v8, 0);
        if ((self->_phase & 0xFE) == 2)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained bannerHandle:self didChangeFromState:v11];
        }
        goto LABEL_19;
      }
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        v17 = self;
        v12 = "PKUISSBannerHandle (%p): ignoring state update.";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0xCu);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): out of order - update state - invalidating.", (uint8_t *)&v16, 0xCu);
    }

    sub_1000031E8((uint64_t)self, 0);
  }
LABEL_20:
}

- (void)displayWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (self->_invalidated) {
    goto LABEL_13;
  }
  if (self->_phase != 1)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): out of order - display - invalidating.", buf, 0xCu);
    }

    goto LABEL_12;
  }
  request = self->_request;
  if (!request) {
    goto LABEL_12;
  }
  id v6 = [(PKBannerHandleRequest *)request type];
  if (v6 == (id)2)
  {
    id v7 = v13;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v8 = sub_10000447C;
    goto LABEL_17;
  }
  if (v6 == (id)1)
  {
    if (PKSystemApertureIsAvailable())
    {
      id v7 = v14;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v8 = sub_100004428;
      goto LABEL_17;
    }
LABEL_12:
    sub_1000031E8((uint64_t)self, 0);
    goto LABEL_13;
  }
  if (v6 || !PKSystemApertureIsAvailable()) {
    goto LABEL_12;
  }
  id v7 = v15;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v8 = sub_1000043D4;
LABEL_17:
  v7[2] = v8;
  v7[3] = &unk_10000C330;
  v7[4] = self;
  id v10 = objc_retainBlock(v7);
  if (!v10) {
    goto LABEL_12;
  }
  id v11 = (void (**)(void))v10;
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): started.", buf, 0xCu);
  }

  v4[2](v4, 0);
  self->_int phase = 2;
  v11[2](v11);

LABEL_13:
}

- (void)detachWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PKUISSBannerHandle (%p): received remote detach.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x2020000000;
  UIBackgroundTaskIdentifier v12 = UIBackgroundTaskInvalid;
  id v6 = +[UIApplication sharedApplication];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000046BC;
  v9[3] = &unk_10000C2E0;
  v9[4] = &buf;
  id v7 = [v6 beginBackgroundTaskWithName:@"banner.detach.receive" expirationHandler:v9];
  *(void *)(*((void *)&buf + 1) + 24) = v7;

  self->_detached = 1;
  v4[2](v4, 0);
  sub_1000031E8((uint64_t)self, 0);
  if (*(void *)(*((void *)&buf + 1) + 24) != UIBackgroundTaskInvalid)
  {
    v8 = +[UIApplication sharedApplication];
    [v8 endBackgroundTask:*(void *)(*((void *)&buf + 1) + 24)];

    *(void *)(*((void *)&buf + 1) + 24) = UIBackgroundTaskInvalid;
  }
  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong(&self->_didStartReply, 0);
}

@end