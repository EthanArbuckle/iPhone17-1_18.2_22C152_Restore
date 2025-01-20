@interface RepairApplicationTask
- (void)main;
- (void)repair:(id)a3 needsToReleaseBlockingCallerWithReason:(id)a4;
- (void)repair:(id)a3 wantsToRelaunchApplication:(id)a4;
@end

@implementation RepairApplicationTask

- (void)main
{
  v3 = [[KeepAlive alloc] initWithName:@"com.apple.appstored.RepairRequest"];
  v4 = &_s7Network11NWInterfaceV13InterfaceTypeO8loopbackyA2EmFWC_ptr;
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  v7 = [(ASDRepairOptions *)self->_options bundleID];

  if (v7)
  {
    v8 = [(ASDRepairOptions *)self->_options bundleID];
    v9 = +[ApplicationProxy proxyForBundleID:v8];
  }
  else
  {
    v10 = [(ASDRepairOptions *)self->_options bundlePath];

    if (!v10) {
      goto LABEL_8;
    }
    v11 = [ApplicationProxy alloc];
    v8 = [(ASDRepairOptions *)self->_options bundlePath];
    v9 = [(ApplicationProxy *)v11 initWithBundlePath:v8];
  }
  v12 = v9;

  if (v12)
  {
    v66 = v3;
    v13 = [_TtC9appstored6LogKey alloc];
    v14 = [(ApplicationProxy *)v12 bundleID];
    v15 = [(LogKey *)v13 initWithCategory:v14];

    if (+[FactoryApplicationRepair shouldAttemptToRepairApplication:v12 options:self->_options logKey:v15])
    {
      v16 = [FactoryApplicationRepair alloc];
      v17 = [(XPCRequestToken *)self->_requestToken processInfo];
      v18 = sub_100291C70((id *)&v16->super.isa, v12, v17);
      applicationRepair = self->_applicationRepair;
      self->_applicationRepair = (ApplicationRepair *)v18;
    }
    if (!self->_applicationRepair)
    {
      if (+[ArcadeRepair shouldAttemptToRepairApplication:v12 options:self->_options logKey:v15])
      {
        v21 = sub_10023F4A0((id *)[ArcadeRepair alloc], v12, self->_options);
        v22 = self->_applicationRepair;
        self->_applicationRepair = (ApplicationRepair *)v21;
      }
      if (!self->_applicationRepair)
      {
        if (+[VPPRepair shouldAttemptToRepairApplication:v12 options:self->_options logKey:v15])
        {
          v23 = sub_10025C4E0((id *)[VPPRepair alloc], v12, self->_options);
          v24 = self->_applicationRepair;
          self->_applicationRepair = (ApplicationRepair *)v23;
        }
        if (!self->_applicationRepair)
        {
          if (+[FairPlayRepair shouldAttemptToRepairApplication:v12 options:self->_options logKey:v15])
          {
            v25 = sub_100209EA8((id *)[FairPlayRepair alloc], v12, self->_options);
            v26 = self->_applicationRepair;
            self->_applicationRepair = (ApplicationRepair *)v25;
          }
          if (!self->_applicationRepair
            && +[CodeSignatureVersionRepair shouldAttemptToRepairApplication:v12 options:self->_options logKey:v15])
          {
            v27 = [CodeSignatureVersionRepair alloc];
            v28 = [(ApplicationProxy *)v12 bundleID];
            v29 = sub_1004229FC((id *)&v27->super.isa, v28, self->_requestToken);
            v30 = self->_applicationRepair;
            self->_applicationRepair = (ApplicationRepair *)v29;
          }
        }
      }
    }
    if (+[ALDApplicationRepair shouldAttemptToRepairApplication:v12 options:self->_options logKey:v15])
    {
      v31 = [[_TtC9appstored20ALDApplicationRepair alloc] initWithFairPlayStatus:[(ASDRepairOptions *)self->_options fairplayStatus]];
      v32 = self->_applicationRepair;
      self->_applicationRepair = (ApplicationRepair *)v31;
    }
    v33 = self->_applicationRepair;
    v65 = v15;
    if (v33)
    {
      uint64_t v64 = [(ApplicationRepair *)v33 repairType];
      v34 = +[NSNotificationCenter defaultCenter];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_1002A7E70;
      v69[3] = &unk_1005256D0;
      v69[4] = self;
      v35 = [v34 addObserverForName:@"RequestPresenterWillPresentUINotification" object:0 queue:0 usingBlock:v69];
      [(ApplicationRepair *)self->_applicationRepair setDelegate:self];
      [(ApplicationRepair *)self->_applicationRepair setLogKey:v15];
      v36 = self->_applicationRepair;
      id v68 = 0;
      unsigned int v67 = [(ApplicationRepair *)v36 repairApplication:v12 error:&v68];
      id v37 = v68;
      id v38 = [(ApplicationRepair *)self->_applicationRepair fairPlayStatus];
      id v39 = v37;
      [(ApplicationRepair *)self->_applicationRepair setDelegate:0];
      if (objc_getProperty(self, v40, 64, 1))
      {
        id Property = objc_getProperty(self, v41, 64, 1);
        v43 = self->_applicationRepair;
        id v44 = Property;
        v45 = [(ApplicationRepair *)v43 repairedBundleIDs];
        v46 = ASDErrorWithSafeUserInfo();
        (*((void (**)(id, void, void *, void *))Property + 2))(v44, v67, v45, v46);
      }
      [v34 removeObserver:v35];

      v47 = v39;
      v4 = &_s7Network11NWInterfaceV13InterfaceTypeO8loopbackyA2EmFWC_ptr;
      v48 = (__CFString *)v64;
    }
    else
    {
      v49 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "[%@] Could not find handler to repair application", buf, 0xCu);
      }

      if (objc_getProperty(self, v50, 64, 1))
      {
        id v52 = objc_getProperty(self, v51, 64, 1);
        (*((void (**)(id, void, void, void))v52 + 2))(v52, 0, 0, 0);
      }
      ASDErrorWithTitleAndMessage();
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      id v38 = 0;
      unsigned int v67 = 0;
      v47 = 0;
      v48 = @"Unknown";
    }
    [v4[476] timeIntervalSinceReferenceDate];
    double v54 = v53 - v6;
    id v55 = v39;
    v56 = v48;
    v57 = objc_opt_new();
    [v57 setObject:v56 forKeyedSubscript:@"repairType"];

    v58 = +[NSNumber numberWithUnsignedInteger:[(ASDRepairOptions *)self->_options exitReason]];
    [v57 setObject:v58 forKeyedSubscript:@"exitReason"];

    v59 = +[NSNumber numberWithDouble:v54];
    [v57 setObject:v59 forKeyedSubscript:@"duration"];

    v60 = +[NSNumber numberWithBool:v67];
    [v57 setObject:v60 forKeyedSubscript:@"result"];

    if (v38)
    {
      v61 = +[NSNumber numberWithInt:v38];
      [v57 setObject:v61 forKeyedSubscript:@"fairPlayStatus"];
    }
    if (v55)
    {
      v62 = [v55 domain];
      v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%ld", v62, [v55 code]);

      [v57 setObject:v63 forKeyedSubscript:@"repairError"];
    }
    sub_10040E9A0((uint64_t)Analytics, v57, 1);

    v3 = v66;
    goto LABEL_38;
  }
LABEL_8:
  id completionHandler = self->_completionHandler;
  if (completionHandler) {
    (*((void (**)(id, void, void, void))completionHandler + 2))(completionHandler, 0, 0, 0);
  }
LABEL_38:
}

- (void)repair:(id)a3 wantsToRelaunchApplication:(id)a4
{
  id v5 = a4;
  double v6 = (void *)sub_10024302C([ApplicationContext alloc], v5);

  v7 = [(ASDRepairOptions *)self->_options relaunchOptions];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002A7F58;
  v8[3] = &unk_100521910;
  v8[4] = self;
  [v6 launchApplicationWithOptions:v7 completionHandler:v8];
}

- (void)repair:(id)a3 needsToReleaseBlockingCallerWithReason:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (self && objc_getProperty(self, v6, 64, 1))
  {
    id Property = objc_getProperty(self, v8, 64, 1);
    (*((void (**)(id, void, void, id))Property + 2))(Property, 0, 0, v7);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_applicationRepair, 0);
}

@end