@interface PKUISSBannerPresentableProvider
- (BOOL)shouldRevokeCurrentRequestForManager:(id)a3;
- (PKUISSBannerPresentableProvider)init;
- (id)nextRequestForManager:(id)a3;
@end

@implementation PKUISSBannerPresentableProvider

- (PKUISSBannerPresentableProvider)init
{
  return 0;
}

- (BOOL)shouldRevokeCurrentRequestForManager:(id)a3
{
  id v4 = [a3 _currentRequest];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 context];
    if (v6)
    {
      unint64_t v7 = v6[6];
      if (self->_requestedExpressHandle)
      {
        BOOL v8 = v7 != 0;
      }
      else
      {
        if (self->_requestedFaceIDContext) {
          BOOL v9 = v7 > 1;
        }
        else {
          BOOL v9 = 0;
        }
        BOOL v8 = v9;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)nextRequestForManager:(id)a3
{
  id v5 = a3;
  while (1)
  {
    requestedExpressHandle = self->_requestedExpressHandle;
    if (requestedExpressHandle)
    {
      unint64_t v7 = requestedExpressHandle;
      BOOL v8 = self->_requestedExpressHandle;
      self->_requestedExpressHandle = 0;

      BOOL v9 = sub_1000059D0([PKUISSPresentableContext alloc], v7);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000067F8;
      v33[3] = &unk_10000C478;
      v34 = v7;
      v10 = v9;
      v35 = v10;
      v11 = v7;
      v12 = objc_retainBlock(v33);

      v13 = (id *)&v34;
LABEL_8:

      goto LABEL_9;
    }
    requestedFaceIDContext = self->_requestedFaceIDContext;
    if (requestedFaceIDContext)
    {
      v15 = requestedFaceIDContext->_effectiveHandle;
      v16 = self->_requestedFaceIDContext;
      v17 = self->_requestedFaceIDContext;
      self->_requestedFaceIDContext = 0;

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10000684C;
      v30[3] = &unk_10000C478;
      v31 = v15;
      v10 = v16;
      v32 = v10;
      v11 = v15;
      v12 = objc_retainBlock(v30);

      v13 = (id *)&v31;
      goto LABEL_8;
    }
    v11 = [(NSMutableArray *)self->_standaloneTransactonHandles firstObject];
    if (v11)
    {
      [(NSMutableArray *)self->_standaloneTransactonHandles removeObjectAtIndex:0];
      v10 = sub_1000059D0([PKUISSPresentableContext alloc], v11);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000068A0;
      v28[3] = &unk_10000C4A0;
      v11 = v11;
      v29 = v11;
      v12 = objc_retainBlock(v28);
      v13 = (id *)&v29;
      goto LABEL_8;
    }
    v12 = 0;
    v10 = 0;
LABEL_9:

    if (!v10) {
      break;
    }
    id v18 = objc_alloc_init((Class)PKBannerPresentableConfiguration);
    [v18 setFactory:v12];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000068DC;
    v26[3] = &unk_10000C4C8;
    v19 = v10;
    v27 = v19;
    [v18 setDidStartHandler:v26];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000068E4;
    v24[3] = &unk_10000C4F0;
    v20 = v19;
    v25 = v20;
    [v18 setDidFinishHandler:v24];
    id v21 = [v5 _createPresentableWithConfiguration:v18];
    if (v21)
    {
      v22 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v37 = v21;
        __int16 v38 = 2048;
        v39 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "PKUISSBannerPresentableProvider: created presentable %p for context %p.", buf, 0x16u);
      }

      v3 = +[PKBannerPresentableRequest createWithPresentable:v21 context:v20];
    }
    else
    {
      sub_100005C58((uint64_t)v20);
    }

    if (v21) {
      goto LABEL_19;
    }
  }

  v3 = 0;
LABEL_19:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedFaceIDContext, 0);
  objc_storeStrong((id *)&self->_standaloneTransactonHandles, 0);

  objc_storeStrong((id *)&self->_requestedExpressHandle, 0);
}

@end