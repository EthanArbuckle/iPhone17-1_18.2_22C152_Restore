@interface NCLocationUpdateAppDelegate
- (NCLocationUpdateAppDelegate)init;
- (double)_getRangeToStart1HzLocationUpdate;
- (int64_t)expectedInterest;
- (int64_t)initialInterest;
- (void)_cancelLocationAuthRequestAssertion;
- (void)_takeLocationAuthRequestAssertion;
- (void)activateWaypointComplication;
- (void)updateLocationManagerWithCurrentAuthorizationStatus;
@end

@implementation NCLocationUpdateAppDelegate

- (NCLocationUpdateAppDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCLocationUpdateAppDelegate;
  v2 = [(NCLocationUpdateBaseDelegate *)&v6 init];
  v3 = NCLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "init NCLocationUpdateAppDelegate", v5, 2u);
  }

  return v2;
}

- (int64_t)initialInterest
{
  return 1;
}

- (int64_t)expectedInterest
{
  if (objc_msgSend_shouldForce1Hz(self, a2, v2, v3)) {
    return 1;
  }
  v8 = objc_msgSend_location(self, v5, v6, v7);

  if (!v8) {
    return 1;
  }
  if (objc_msgSend_isStationary(self, v9, v10, v11)) {
    return -1;
  }
  objc_msgSend_getNearestWaypointDistance(self, v12, v13, v14);
  double v19 = v18;
  if (v18 < 15.0) {
    return -1;
  }
  objc_msgSend__getRangeToStart1HzLocationUpdate(self, v15, v16, v17);
  if (v19 <= v21) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)updateLocationManagerWithCurrentAuthorizationStatus
{
  if (objc_msgSend_locationAuthorizationStatus(self, a2, v2, v3)) {
    objc_msgSend__cancelLocationAuthRequestAssertion(self, v5, v6, v7);
  }
  else {
    objc_msgSend__takeLocationAuthRequestAssertion(self, v5, v6, v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)NCLocationUpdateAppDelegate;
  [(NCLocationUpdateBaseDelegate *)&v8 updateLocationManagerWithCurrentAuthorizationStatus];
}

- (double)_getRangeToStart1HzLocationUpdate
{
  return dbl_2375DE170[(unint64_t)(objc_msgSend_motionType(self, a2, v2, v3) - 3) < 2];
}

- (void)activateWaypointComplication
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_now(MEMORY[0x263EFF910], a2, v2, v3);
  v5 = NCLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    v12 = "-[NCLocationUpdateAppDelegate activateWaypointComplication]";
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23759D000, v5, OS_LOG_TYPE_DEFAULT, "%s %@ is the last timestamp user tapped targeted view in the app", (uint8_t *)&v11, 0x16u);
  }

  id v6 = objc_alloc(MEMORY[0x263EFFA40]);
  v9 = objc_msgSend_initWithSuiteName_(v6, v7, @"com.apple.compass", v8);
  objc_msgSend_setObject_forKey_(v9, v10, (uint64_t)v4, @"TargetedViewUsageTimestamp");
}

- (void)_takeLocationAuthRequestAssertion
{
  v34[2] = *MEMORY[0x263EF8340];
  if (self->_locationAuthQueryAssertion)
  {
    uint64_t v2 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23759D000, v2, OS_LOG_TYPE_DEFAULT, "Runtime assertion is acquired already. Don't create a new one.", buf, 2u);
    }
  }
  else
  {
    uint64_t v2 = objc_msgSend_attributeWithDuration_warningDuration_startPolicy_endPolicy_(MEMORY[0x263F64488], a2, 1, 1, 30.0, 1.0);
    v34[0] = v2;
    v5 = objc_msgSend_attributeWithDomain_name_(MEMORY[0x263F64480], v4, @"com.apple.compass", @"Location");
    v34[1] = v5;
    uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v6, (uint64_t)v34, 2);

    id v8 = objc_alloc(MEMORY[0x263F64408]);
    v12 = objc_msgSend_currentProcess(MEMORY[0x263F64630], v9, v10, v11);
    uint64_t v14 = (RBSAssertion *)objc_msgSend_initWithExplanation_target_attributes_(v8, v13, @"One time assertion for request location authorization", (uint64_t)v12, v7);
    locationAuthQueryAssertion = self->_locationAuthQueryAssertion;
    self->_locationAuthQueryAssertion = v14;

    objc_initWeak(&location, self);
    uint64_t v16 = self->_locationAuthQueryAssertion;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_2375BB9F0;
    v27[3] = &unk_264CD5B70;
    objc_copyWeak(&v28, &location);
    objc_msgSend_setInvalidationHandler_(v16, v17, (uint64_t)v27, v18);
    double v19 = self->_locationAuthQueryAssertion;
    id v26 = 0;
    int v22 = objc_msgSend_acquireWithError_(v19, v20, (uint64_t)&v26, v21);
    id v23 = v26;
    if (v22)
    {
      v24 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[NCLocationUpdateAppDelegate _takeLocationAuthRequestAssertion]";
        __int16 v32 = 2048;
        uint64_t v33 = 0x403E000000000000;
        _os_log_impl(&dword_23759D000, v24, OS_LOG_TYPE_DEFAULT, "%s taking runtime assertion for requesting location authorization for %.0fs", buf, 0x16u);
      }
    }
    else
    {
      v25 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_2375D8D5C((uint64_t)v23, v25);
      }

      v24 = self->_locationAuthQueryAssertion;
      self->_locationAuthQueryAssertion = 0;
    }

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelLocationAuthRequestAssertion
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_locationAuthQueryAssertion)
  {
    uint64_t v3 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[NCLocationUpdateAppDelegate _cancelLocationAuthRequestAssertion]";
      _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "%s cancelling runtime assertion for requesting location authorization.", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend_invalidate(self->_locationAuthQueryAssertion, v4, v5, v6);
    locationAuthQueryAssertion = self->_locationAuthQueryAssertion;
    self->_locationAuthQueryAssertion = 0;
  }
}

- (void).cxx_destruct
{
}

@end