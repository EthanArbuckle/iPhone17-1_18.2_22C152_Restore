@interface IMAVLocalPreviewClient
+ (CGSize)localPortraitAspectRatio;
+ (id)sharedInstance;
- (AVConferencePreview)conferencePreview;
- (BOOL)_shouldPreviewBeRunning;
- (BOOL)isPreviewRunning;
- (IMAVLocalPreviewClient)init;
- (id)localScreenAttributesForVideoAttributes:(id)a3;
- (unsigned)cameraOrientation;
- (unsigned)cameraType;
- (void)_avDaemonConnected;
- (void)_updatePreviewState;
- (void)avChat:(id)a3 setLocalPortraitRatio:(CGSize)a4 localLandscapeRatio:(CGSize)a5;
- (void)beginAnimationToPIP;
- (void)beginAnimationToPreview;
- (void)cameraDidBecomeAvailableForUniqueID:(id)a3;
- (void)dealloc;
- (void)didChangeLocalScreenAttributes:(id)a3;
- (void)didChangeLocalVideoAttributes:(id)a3;
- (void)didPausePreview;
- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4;
- (void)didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a3;
- (void)didStartPreview;
- (void)didStopPreview;
- (void)endAnimationToPIP;
- (void)endAnimationToPreview;
- (void)localVideoBackLayer;
- (void)localVideoLayer;
- (void)pausePreview;
- (void)setCameraOrientation:(unsigned int)a3;
- (void)setCameraType:(unsigned int)a3;
- (void)setConferencePreview:(id)a3;
- (void)setLocalScreenAttributes:(id)a3;
- (void)setLocalVideoBackLayer:(void *)a3;
- (void)setLocalVideoLayer:(void *)a3;
- (void)startPreview;
- (void)stopPreview;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationWillEnterForeground;
- (void)systemScreenDidPowerDown;
- (void)systemScreenDidPowerUp;
- (void)unpausePreview;
- (void)updateLocalScreenAtrributes;
@end

@implementation IMAVLocalPreviewClient

+ (id)sharedInstance
{
  if (qword_26AB796B0 != -1) {
    dispatch_once(&qword_26AB796B0, &unk_26D85A690);
  }
  v2 = (void *)qword_26AB796E0;
  return v2;
}

- (IMAVLocalPreviewClient)init
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v42.receiver = self;
  v42.super_class = (Class)IMAVLocalPreviewClient;
  v2 = [(IMAVLocalPreviewClient *)&v42 init];
  if (v2)
  {
    v3 = (AVConferencePreview *)objc_alloc_init((Class)MEMORY[0x22A628610](@"AVConferencePreview", @"AVConference"));
    conferencePreview = v2->_conferencePreview;
    v2->_conferencePreview = v3;

    objc_msgSend_setDelegate_(v2->_conferencePreview, v5, (uint64_t)v2, v6, v7);
    v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v2->_conferencePreview;
      *(_DWORD *)buf = 138412546;
      v44 = v2;
      __int16 v45 = 2112;
      v46 = v9;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Setting %@ as delegate of local preview %@", buf, 0x16u);
    }

    v14 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v10, v11, v12, v13);
    objc_msgSend_addObserver_selector_name_object_(v14, v15, (uint64_t)v2, (uint64_t)sel__avDaemonConnected, @"__kIMAVDaemonDidConnectNotification", 0);

    v20 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v16, v17, v18, v19);
    objc_msgSend_addListener_(v20, v21, (uint64_t)v2, v22, v23);

    v28 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v24, v25, v26, v27);
    objc_msgSend_setActive_(v28, v29, 1, v30, v31);

    v36 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v32, v33, v34, v35);
    objc_msgSend_setWatchesScreenLightState_(v36, v37, 1, v38, v39);

    v40 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v6 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3, v4);
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, 0, 0);

  uint64_t v12 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v8, v9, v10, v11);
  objc_msgSend_removeListener_(v12, v13, (uint64_t)self, v14, v15);

  v20 = objc_msgSend_conferencePreview(self, v16, v17, v18, v19);
  objc_msgSend_setDelegate_(v20, v21, 0, v22, v23);

  v24.receiver = self;
  v24.super_class = (Class)IMAVLocalPreviewClient;
  [(IMAVLocalPreviewClient *)&v24 dealloc];
}

- (unsigned)cameraType
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    int v35 = 138412290;
    v36 = v8;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Querying camera type from AVConferencePreview: %@", (uint8_t *)&v35, 0xCu);
  }
  uint64_t v13 = objc_msgSend_sharedInstance(IMAVInterface, v9, v10, v11, v12);
  int v18 = objc_msgSend_systemSupportsBackFacingCamera(v13, v14, v15, v16, v17);

  if (!v18) {
    return 0;
  }
  uint64_t v23 = objc_msgSend_conferencePreview(self, v19, v20, v21, v22);
  v28 = objc_msgSend_localVideoAttributes(v23, v24, v25, v26, v27);

  sub_224FC1DC0(v28);
  unsigned int v33 = objc_msgSend_camera(v28, v29, v30, v31, v32);

  return v33;
}

- (void)setCameraType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = 67109120;
    v27[1] = v3;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Setting camera type to %d", (uint8_t *)v27, 8u);
  }

  uint64_t v10 = objc_msgSend_conferencePreview(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_localVideoAttributes(v10, v11, v12, v13, v14);

  objc_msgSend_setCamera_(v15, v16, v3, v17, v18);
  sub_224FC1DC0(v15);
  uint64_t v23 = objc_msgSend_conferencePreview(self, v19, v20, v21, v22);
  objc_msgSend_setLocalVideoAttributes_(v23, v24, (uint64_t)v15, v25, v26);
}

- (unsigned)cameraOrientation
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    int v24 = 138412290;
    uint64_t v25 = v8;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Querying camera orientation from AVConferencePreview: %@", (uint8_t *)&v24, 0xCu);
  }
  uint64_t v13 = objc_msgSend_conferencePreview(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_localVideoAttributes(v13, v14, v15, v16, v17);

  sub_224FC1DC0(v18);
  LODWORD(v13) = objc_msgSend_orientation(v18, v19, v20, v21, v22);

  return v13;
}

- (void)setCameraOrientation:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = 67109120;
    v27[1] = v3;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Setting camera orientation to %d", (uint8_t *)v27, 8u);
  }

  uint64_t v10 = objc_msgSend_conferencePreview(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_localVideoAttributes(v10, v11, v12, v13, v14);

  objc_msgSend_setOrientation_(v15, v16, v3, v17, v18);
  sub_224FC1DC0(v15);
  uint64_t v23 = objc_msgSend_conferencePreview(self, v19, v20, v21, v22);
  objc_msgSend_setLocalVideoAttributes_(v23, v24, (uint64_t)v15, v25, v26);
}

- (void)localVideoLayer
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    int v19 = 138412290;
    uint64_t v20 = v8;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Querying local video layer from AVConferencePreview: %@", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v13 = objc_msgSend_conferencePreview(self, v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_localVideoLayer_(v13, v14, 1, v15, v16);

  return v17;
}

- (void)setLocalVideoLayer:(void *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_conferencePreview(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setLocalVideoLayer_front_(v7, v8, (uint64_t)a3, 1, v9);

  uint64_t v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_conferencePreview(self, v11, v12, v13, v14);
    int v16 = 134218242;
    uint64_t v17 = a3;
    __int16 v18 = 2112;
    int v19 = v15;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Setting local video layer: %p on preview: %@", (uint8_t *)&v16, 0x16u);
  }
}

- (void)localVideoBackLayer
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    int v19 = 138412290;
    uint64_t v20 = v8;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Querying local video back layer from AVConferencePreview: %@", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v13 = objc_msgSend_conferencePreview(self, v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_localVideoLayer_(v13, v14, 0, v15, v16);

  return v17;
}

- (void)setLocalVideoBackLayer:(void *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_conferencePreview(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setLocalVideoLayer_front_(v7, v8, (uint64_t)a3, 0, v9);

  uint64_t v10 = sub_224FB12A0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_conferencePreview(self, v11, v12, v13, v14);
    int v16 = 134218242;
    uint64_t v17 = a3;
    __int16 v18 = 2112;
    int v19 = v15;
    _os_log_impl(&dword_224F93000, v10, OS_LOG_TYPE_DEFAULT, "Setting local video back-layer: %p on preview: %@", (uint8_t *)&v16, 0x16u);
  }
}

- (id)localScreenAttributesForVideoAttributes:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend_conferencePreview(self, v6, v7, v8, v9);
    int v21 = 138412290;
    uint64_t v22 = v10;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Querying local screen attributes from AVConferencePreview: %@", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v15 = objc_msgSend_conferencePreview(self, v11, v12, v13, v14);
  int v19 = objc_msgSend_localScreenAttributesForVideoAttributes_(v15, v16, (uint64_t)v4, v17, v18);

  return v19;
}

- (void)setLocalScreenAttributes:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_conferencePreview(self, v5, v6, v7, v8);
  objc_msgSend_setLocalScreenAttributes_(v9, v10, (uint64_t)v4, v11, v12);

  uint64_t v13 = sub_224FB12A0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_msgSend_conferencePreview(self, v14, v15, v16, v17);
    int v19 = 138412546;
    id v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v18;
    _os_log_impl(&dword_224F93000, v13, OS_LOG_TYPE_DEFAULT, "Setting local screen attributes: %@ on preview: %@", (uint8_t *)&v19, 0x16u);
  }
}

- (void)avChat:(id)a3 setLocalPortraitRatio:(CGSize)a4 localLandscapeRatio:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (objc_class *)MEMORY[0x22A628610](@"VideoAttributes", @"AVConference");
  uint64_t v12 = sub_224FB12A0();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v81.double width = v8;
      v81.double height = v7;
      uint64_t v14 = NSStringFromSize(v81);
      int v78 = 138412290;
      v79 = v14;
      _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "Got portrait aspect ratio: %@", (uint8_t *)&v78, 0xCu);
    }
    uint64_t v15 = sub_224FB12A0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v82.double width = width;
      v82.double height = height;
      uint64_t v16 = NSStringFromSize(v82);
      int v78 = 138412290;
      v79 = v16;
      _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "Got landscape aspect ratio: %@", (uint8_t *)&v78, 0xCu);
    }
    uint64_t v12 = objc_alloc_init(v11);
    id v17 = objc_alloc_init(v11);
    objc_msgSend_setOrientation_(v12, v18, 0, v19, v20);
    objc_msgSend_setOrientation_(v17, v21, 3, v22, v23);
    uint64_t v27 = objc_msgSend_localScreenAttributesForVideoAttributes_(self, v24, (uint64_t)v12, v25, v26);
    objc_msgSend_setRatio_(v27, v28, v29, v30, v31, v8, v7);
    v36 = objc_msgSend__timings(v10, v32, v33, v34, v35);
    objc_msgSend_startTimingForKey_(v36, v37, @"setting-local-screen-attributes", v38, v39);

    objc_msgSend_setLocalScreenAttributes_(self, v40, (uint64_t)v27, v41, v42);
    uint64_t v47 = objc_msgSend__timings(v10, v43, v44, v45, v46);
    objc_msgSend_stopTimingForKey_(v47, v48, @"setting-local-screen-attributes", v49, v50);

    v54 = objc_msgSend_localScreenAttributesForVideoAttributes_(self, v51, (uint64_t)v17, v52, v53);

    objc_msgSend_setRatio_(v54, v55, v56, v57, v58, width, height);
    v63 = objc_msgSend__timings(v10, v59, v60, v61, v62);
    objc_msgSend_startTimingForKey_(v63, v64, @"setting-local-screen-attributes", v65, v66);

    objc_msgSend_setLocalScreenAttributes_(self, v67, (uint64_t)v54, v68, v69);
    v74 = objc_msgSend__timings(v10, v70, v71, v72, v73);
    objc_msgSend_stopTimingForKey_(v74, v75, @"setting-local-screen-attributes", v76, v77);
  }
  else if (v13)
  {
    LOWORD(v78) = 0;
    _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find VideoAttributes class, possibly failed to weak link AVConference.", (uint8_t *)&v78, 2u);
  }
}

+ (CGSize)localPortraitAspectRatio
{
  uint64_t v2 = (void *)MEMORY[0x22A628610](@"CADisplay", @"QuartzCore");
  if (v2)
  {
    double v7 = objc_msgSend_mainDisplay(v2, v3, v4, v5, v6);
    objc_msgSend_bounds(v7, v8, v9, v10, v11);
    double v13 = v12;
    double v15 = v14;

    if (v13 <= v15) {
      double v16 = v13;
    }
    else {
      double v16 = v15;
    }
    if (v13 <= v15) {
      double v13 = v15;
    }
    unsigned int v17 = sub_224FAAB90((int)v16, (int)v13);
    double v18 = v16 / (double)v17;
    double v19 = v13 / (double)v17;
  }
  else
  {
    uint64_t v20 = sub_224FB12A0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v21 = 0;
      _os_log_impl(&dword_224F93000, v20, OS_LOG_TYPE_DEFAULT, "Unable to find CADisplay class, possibly failed to weak link QuartzCore or CADisplay doesn't exist on this device.", v21, 2u);
    }

    double v18 = *MEMORY[0x263F08678];
    double v19 = *(double *)(MEMORY[0x263F08678] + 8);
  }
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)updateLocalScreenAtrributes
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v14 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "updateLocalScreenAtrributes was called", v14, 2u);
  }

  uint64_t v4 = objc_opt_class();
  objc_msgSend_localPortraitAspectRatio(v4, v5, v6, v7, v8);
  objc_msgSend_avChat_setLocalPortraitRatio_localLandscapeRatio_(self, v9, 0, v10, v11, v12, v13, v13, v12);
}

- (BOOL)_shouldPreviewBeRunning
{
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], a2, v2, v3, v4);
  if (objc_msgSend_isInBackground(v6, v7, v8, v9, v10))
  {
    BOOL wantsPreview = 0;
  }
  else
  {
    double v16 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v11, v12, v13, v14);
    if (objc_msgSend_isScreenLit(v16, v17, v18, v19, v20)) {
      BOOL wantsPreview = self->_wantsPreview;
    }
    else {
      BOOL wantsPreview = 0;
    }
  }
  return wantsPreview;
}

- (void)_updatePreviewState
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v111) = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, (uint8_t *)&v111, 2u);
  }

  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMAVDaemonController, v5, v6, v7, v8);
    if (objc_msgSend_isConnected(v9, v10, v11, v12, v13)) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    int v111 = 138412290;
    v112 = v14;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "         Connected to daemon: %@", (uint8_t *)&v111, 0xCu);
  }
  double v15 = sub_224FB12A0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v16, v17, v18, v19);
    if (objc_msgSend_isInBackground(v20, v21, v22, v23, v24)) {
      uint64_t v25 = @"YES";
    }
    else {
      uint64_t v25 = @"NO";
    }
    int v111 = 138412290;
    v112 = v25;
    _os_log_impl(&dword_224F93000, v15, OS_LOG_TYPE_DEFAULT, "    App is in the background: %@", (uint8_t *)&v111, 0xCu);
  }
  uint64_t v26 = sub_224FB12A0();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = objc_msgSend_sharedInstance(MEMORY[0x263F4A620], v27, v28, v29, v30);
    if (objc_msgSend_isScreenLit(v31, v32, v33, v34, v35)) {
      v36 = @"YES";
    }
    else {
      v36 = @"NO";
    }
    int v111 = 138412290;
    v112 = v36;
    _os_log_impl(&dword_224F93000, v26, OS_LOG_TYPE_DEFAULT, "               Screen is lit: %@", (uint8_t *)&v111, 0xCu);
  }
  uint64_t v37 = sub_224FB12A0();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldAlterPreviewState) {
      uint64_t v38 = @"YES";
    }
    else {
      uint64_t v38 = @"NO";
    }
    int v111 = 138412290;
    v112 = v38;
    _os_log_impl(&dword_224F93000, v37, OS_LOG_TYPE_DEFAULT, "Should we alter preview state ?: %@", (uint8_t *)&v111, 0xCu);
  }

  uint64_t v39 = sub_224FB12A0();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_wantsPreview) {
      v40 = @"YES";
    }
    else {
      v40 = @"NO";
    }
    int v111 = 138412290;
    v112 = v40;
    _os_log_impl(&dword_224F93000, v39, OS_LOG_TYPE_DEFAULT, "           Do we want preview ?: %@", (uint8_t *)&v111, 0xCu);
  }

  uint64_t v41 = sub_224FB12A0();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend__shouldPreviewBeRunning(self, v42, v43, v44, v45)) {
      uint64_t v46 = @"YES";
    }
    else {
      uint64_t v46 = @"NO";
    }
    int v111 = 138412290;
    v112 = v46;
    _os_log_impl(&dword_224F93000, v41, OS_LOG_TYPE_DEFAULT, "    Should preview be running ?: %@", (uint8_t *)&v111, 0xCu);
  }

  uint64_t v47 = sub_224FB12A0();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_wantsPausedPreview) {
      v48 = @"YES";
    }
    else {
      v48 = @"NO";
    }
    int v111 = 138412290;
    v112 = v48;
    _os_log_impl(&dword_224F93000, v47, OS_LOG_TYPE_DEFAULT, "     Should preview be paused ?: %@", (uint8_t *)&v111, 0xCu);
  }

  uint64_t v49 = sub_224FB12A0();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_wantsUnpausedPreview) {
      uint64_t v50 = @"YES";
    }
    else {
      uint64_t v50 = @"NO";
    }
    int v111 = 138412290;
    v112 = v50;
    _os_log_impl(&dword_224F93000, v49, OS_LOG_TYPE_DEFAULT, "   Should preview be unpaused ?: %@", (uint8_t *)&v111, 0xCu);
  }

  if (self->_shouldAlterPreviewState)
  {
    int shouldPreviewBeRunning = objc_msgSend__shouldPreviewBeRunning(self, v51, v52, v53, v54);
    uint64_t v56 = sub_224FB12A0();
    BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    if (shouldPreviewBeRunning)
    {
      if (v57)
      {
        LOWORD(v111) = 0;
        _os_log_impl(&dword_224F93000, v56, OS_LOG_TYPE_DEFAULT, "Asking daemon to start preview", (uint8_t *)&v111, 2u);
      }

      uint64_t v62 = objc_msgSend_sharedInstance(IMAVDaemonController, v58, v59, v60, v61);
      objc_msgSend_addListenerID_(v62, v63, @"IMAVLocalPreview", v64, v65);

      v70 = objc_msgSend_sharedInstance(IMAVDaemonController, v66, v67, v68, v69);
      int isConnected = objc_msgSend_isConnected(v70, v71, v72, v73, v74);

      if (isConnected)
      {
        uint64_t v80 = objc_msgSend_sharedInstance(IMAVDaemonController, v76, v77, v78, v79);
        objc_msgSend_startPreview(v80, v81, v82, v83, v84);
      }
      else
      {
        uint64_t v80 = sub_224FB12A0();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v111) = 0;
          _os_log_impl(&dword_224F93000, v80, OS_LOG_TYPE_DEFAULT, "*** Not connected to daemon, can't startPreview just yet ***", (uint8_t *)&v111, 2u);
        }
      }
    }
    else
    {
      if (v57)
      {
        LOWORD(v111) = 0;
        _os_log_impl(&dword_224F93000, v56, OS_LOG_TYPE_DEFAULT, "Asking daemon to stop preview", (uint8_t *)&v111, 2u);
      }

      v89 = objc_msgSend_sharedInstance(IMAVDaemonController, v85, v86, v87, v88);
      int v94 = objc_msgSend_isConnected(v89, v90, v91, v92, v93);

      if (v94)
      {
        v99 = objc_msgSend_sharedInstance(IMAVDaemonController, v95, v96, v97, v98);
        objc_msgSend_stopPreview(v99, v100, v101, v102, v103);
      }
      else
      {
        v99 = sub_224FB12A0();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v111) = 0;
          _os_log_impl(&dword_224F93000, v99, OS_LOG_TYPE_DEFAULT, "*** Not connected to daemon, don't need to stopPreview ***", (uint8_t *)&v111, 2u);
        }
      }

      uint64_t v80 = objc_msgSend_sharedInstance(IMAVDaemonController, v104, v105, v106, v107);
      objc_msgSend_removeListenerID_(v80, v108, @"IMAVLocalPreview", v109, v110);
    }
  }
}

- (void)_avDaemonConnected
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "*** Connected to daemon ! ***", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)startPreview
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_DWORD *)&self->_shouldAlterPreviewState = 257;
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "** Requesting START preview", (uint8_t *)&v14, 2u);
  }

  if (_IMWillLog())
  {
    uint64_t v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend_callStackSymbols(MEMORY[0x263F08B88], v9, v10, v11, v12);
      int v14 = 138412290;
      double v15 = v13;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)stopPreview
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_DWORD *)&self->_shouldAlterPreviewState = 1;
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "** Requesting STOP preview", (uint8_t *)&v14, 2u);
  }

  if (_IMWillLog())
  {
    uint64_t v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend_callStackSymbols(MEMORY[0x263F08B88], v9, v10, v11, v12);
      int v14 = 138412290;
      double v15 = v13;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)pausePreview
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_DWORD *)&self->_shouldAlterPreviewState = 65537;
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "** Requesting PAUSE preview", (uint8_t *)&v14, 2u);
  }

  if (_IMWillLog())
  {
    uint64_t v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend_callStackSymbols(MEMORY[0x263F08B88], v9, v10, v11, v12);
      int v14 = 138412290;
      double v15 = v13;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)unpausePreview
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_DWORD *)&self->_shouldAlterPreviewState = 16777473;
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "** Requesting UN-PAUSE preview", (uint8_t *)&v14, 2u);
  }

  if (_IMWillLog())
  {
    uint64_t v8 = sub_224FB12A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_msgSend_callStackSymbols(MEMORY[0x263F08B88], v9, v10, v11, v12);
      int v14 = 138412290;
      double v15 = v13;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (BOOL)isPreviewRunning
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    int v20 = 138412290;
    __int16 v21 = v8;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Querying is preview running from AVConferencePreview: %@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v13 = objc_msgSend_conferencePreview(self, v9, v10, v11, v12);
  char isPreviewRunning = objc_msgSend_isPreviewRunning(v13, v14, v15, v16, v17);

  return isPreviewRunning;
}

- (void)beginAnimationToPIP
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Begin animation to PIP", v19, 2u);
  }

  uint64_t v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v14 = objc_msgSend_conferencePreview(self, v10, v11, v12, v13);
    objc_msgSend_beginPreviewToPIPAnimation(v14, v15, v16, v17, v18);
  }
}

- (void)endAnimationToPIP
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "End animation to PIP", v19, 2u);
  }

  uint64_t v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v14 = objc_msgSend_conferencePreview(self, v10, v11, v12, v13);
    objc_msgSend_endPreviewToPIPAnimation(v14, v15, v16, v17, v18);
  }
}

- (void)beginAnimationToPreview
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Begin animation to preview", v19, 2u);
  }

  uint64_t v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v14 = objc_msgSend_conferencePreview(self, v10, v11, v12, v13);
    objc_msgSend_beginPIPToPreviewAnimation(v14, v15, v16, v17, v18);
  }
}

- (void)endAnimationToPreview
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "End animation to preview", v19, 2u);
  }

  uint64_t v8 = objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v14 = objc_msgSend_conferencePreview(self, v10, v11, v12, v13);
    objc_msgSend_endPIPToPreviewAnimation(v14, v15, v16, v17, v18);
  }
}

- (void)systemApplicationDidEnterBackground
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "App is in the background, refresh preview state", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)systemApplicationWillEnterForeground
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "App will enter the foreground, refresh preview state", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)systemScreenDidPowerUp
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Screen turned on, refreshing preview state", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)systemScreenDidPowerDown
{
  uint64_t v3 = sub_224FB12A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_224F93000, v3, OS_LOG_TYPE_DEFAULT, "Screen shut off, refreshing preview state", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)didStartPreview
{
  uint64_t v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, v3, 2u);
  }
}

- (void)didStopPreview
{
  uint64_t v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, buf, 2u);
  }

  im_dispatch_after();
}

- (void)didPausePreview
{
  uint64_t v2 = sub_224FB12A0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_224F93000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_224FD6BA7, v3, 2u);
  }
}

- (void)didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "cameraUID: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)didChangeLocalVideoAttributes:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "videoAttributes: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)didChangeLocalScreenAttributes:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "videoAttributes: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "cameraUID: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)cameraDidBecomeAvailableForUniqueID:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "cameraUID: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend__updatePreviewState(self, v6, v7, v8, v9);
}

- (AVConferencePreview)conferencePreview
{
  return self->_conferencePreview;
}

- (void)setConferencePreview:(id)a3
{
}

- (void).cxx_destruct
{
}

@end