@interface ICSInCallSceneDelegate
- (BOOL)hasSetupForScene;
- (BOOL)isAttachedToWindowedAccessoryWithValidFrameForCurrentScene;
- (BOOL)isDeviceAttachedToWindowedAccessory;
- (BOOL)isDeviceAttachedToWindowedAccessoryForScene:(id)a3;
- (BOOL)zombieDetectedForSession:(id)a3 scene:(id)a4 ofType:(unint64_t)a5;
- (CGRect)deviceWindowedAccessoryCutoutFrame;
- (CGRect)deviceWindowedAccessoryCutoutFrameForScene:(id)a3;
- (CGRect)windowedAccessoryCutoutFrameInScreen;
- (ICSCallAnalyticsLogger)callAnalyticsLogger;
- (ICSGreenTea3PUIHardwareEventHandler)greenTea3PUIHardwareEventHandler;
- (ICSInCallSceneDelegate)init;
- (ICSInCallScenePresentationStyleHandler)greenTea3PPresentationStyleHandler;
- (NSMapTable)windowSceneToWindowMap;
- (id)createCallDisplayStyleManagerForScene:(id)a3;
- (id)createRootViewControllerForScene:(id)a3;
- (id)inCallWindowSceneSystemApertureElementProvider:(id)a3;
- (id)remoteAlertShellViewControllerForWindowScene:(id)a3;
- (id)sceneDidDisconnectBlock;
- (int64_t)callDisplayStyleForScene:(id)a3;
- (void)_setupSceneIfNeeded:(id)a3 session:(id)a4;
- (void)configureWindow:(id)a3 windowScene:(id)a4;
- (void)configureWindowScene:(id)a3 forSceneType:(unint64_t)a4;
- (void)handleHardwareButtonEvent:(id)a3 eventHandler:(id)a4;
- (void)inCallWindowScene:(id)a3 didChangePresentationModeWithAnalyticsSource:(id)a4;
- (void)inCallWindowScene:(id)a3 didReceiveDeviceLockEvent:(id)a4 withResultHandler:(id)a5;
- (void)inCallWindowScene:(id)a3 didReceiveHardwareButtonEvents:(id)a4;
- (void)inCallWindowScene:(id)a3 didTransitionToAttachedToWindowedAccessory:(BOOL)a4 windowedAccessoryCutoutFrameInScreen:(CGRect)a5;
- (void)inCallWindowSceneHandleShowingNoticeForRevealingSystemControls:(id)a3;
- (void)inCallWindowSceneHandleSilenceRingtone:(id)a3;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)setCallAnalyticsLogger:(id)a3;
- (void)setGreenTea3PPresentationStyleHandler:(id)a3;
- (void)setGreenTea3PUIHardwareEventHandler:(id)a3;
- (void)setHasSetupForScene:(BOOL)a3;
- (void)setSceneDidDisconnectBlock:(id)a3;
- (void)updateSceneBackgroundMaterialWith:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
@end

@implementation ICSInCallSceneDelegate

- (ICSInCallSceneDelegate)init
{
  v11.receiver = self;
  v11.super_class = (Class)ICSInCallSceneDelegate;
  v2 = [(ICSInCallSceneDelegate *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[CNKFeatures sharedInstance];
    features = v2->_features;
    v2->_features = (CNKFeatures *)v3;

    id v5 = objc_alloc_init((Class)TUFeatureFlags);
    if ([v5 groupConversations] && TUDeviceHasChinaSKU())
    {
      v6 = objc_alloc_init(ICSDynamicSystemUIPresentationStyleHandler);
      greenTea3PPresentationStyleHandler = v2->_greenTea3PPresentationStyleHandler;
      v2->_greenTea3PPresentationStyleHandler = (ICSInCallScenePresentationStyleHandler *)v6;

      v8 = objc_alloc_init(ICSGreenTea3PUIHardwareEventHandler);
      greenTea3PUIHardwareEventHandler = v2->_greenTea3PUIHardwareEventHandler;
      v2->_greenTea3PUIHardwareEventHandler = v8;
    }
  }
  return v2;
}

- (BOOL)isDeviceAttachedToWindowedAccessory
{
  uint64_t v3 = +[UIApplication sharedApplication];
  v4 = [v3 delegate];
  id v5 = [v4 currentInCallScene];
  LOBYTE(self) = [(ICSInCallSceneDelegate *)self isDeviceAttachedToWindowedAccessoryForScene:v5];

  return (char)self;
}

- (BOOL)isDeviceAttachedToWindowedAccessoryForScene:(id)a3
{
  id v4 = a3;
  [(ICSInCallSceneDelegate *)self deviceWindowedAccessoryCutoutFrameForScene:v4];
  BOOL v5 = !CGRectIsEmpty(v7);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v4 performSelector:"isDeviceAttachedToWindowedAccessory"])
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CGRect)deviceWindowedAccessoryCutoutFrame
{
  uint64_t v3 = +[UIApplication sharedApplication];
  id v4 = [v3 delegate];
  BOOL v5 = [v4 currentInCallScene];
  [(ICSInCallSceneDelegate *)self deviceWindowedAccessoryCutoutFrameForScene:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)deviceWindowedAccessoryCutoutFrameForScene:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 valueForKey:@"windowedAccessoryCutoutFrameInScreen"];
    [v4 CGRectValue];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isAttachedToWindowedAccessoryWithValidFrameForCurrentScene
{
  return [(ICSInCallSceneDelegate *)self isDeviceAttachedToWindowedAccessory];
}

- (void)inCallWindowScene:(id)a3 didReceiveHardwareButtonEvents:(id)a4
{
  id v6 = a4;
  double v7 = [(ICSInCallSceneDelegate *)self remoteAlertShellViewControllerForWindowScene:a3];
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        double v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          -[ICSInCallSceneDelegate handleHardwareButtonEvent:eventHandler:](self, "handleHardwareButtonEvent:eventHandler:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v12), v7, (void)v13);
          double v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)inCallWindowScene:(id)a3 didReceiveDeviceLockEvent:(id)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100079008;
  v19[3] = &unk_1002CE840;
  id v10 = a5;
  id v20 = v10;
  uint64_t v11 = objc_retainBlock(v19);
  if (objc_msgSend(v8, "ics_sceneType") == (id)6
    && ([(ICSInCallSceneDelegate *)self greenTea3PUIHardwareEventHandler],
        double v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    long long v13 = sub_1000D52D8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Passing device lock event to GreenTea3P UI hardware event handler", v18, 2u);
    }
    long long v14 = [(ICSInCallSceneDelegate *)self greenTea3PUIHardwareEventHandler];
    long long v15 = [(ICSInCallSceneDelegate *)self callAnalyticsLogger];
    [v14 handleDeviceLockEvent:v9 resultHandler:v10 callAnalyticsLogger:v15 completionHandler:&stru_1002CF180];
  }
  else
  {
    long long v16 = sub_1000D52D8();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received user-initiated device lock event, handing it off to the root view controller to handle", v18, 2u);
    }
    long long v14 = [(ICSInCallSceneDelegate *)self remoteAlertShellViewControllerForWindowScene:v8];
    if (v14)
    {
      [v14 handleDeviceLockEventWithSourceType:[v9 sourceType] resultHandler:v11];
    }
    else
    {
      double v17 = sub_1000D52D8();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PHInCallRemoteAlertShellViewController missing for windowScene", v18, 2u);
      }
      ((void (*)(void *, void))v11[2])(v11, 0);
    }
  }
}

- (void)inCallWindowScene:(id)a3 didChangePresentationModeWithAnalyticsSource:(id)a4
{
  id v6 = a3;
  id v53 = a4;
  double v7 = [v6 session];
  [(ICSInCallSceneDelegate *)self _setupSceneIfNeeded:v6 session:v7];

  id v8 = [(ICSInCallSceneDelegate *)self remoteAlertShellViewControllerForWindowScene:v6];
  id v9 = [v6 ics_sceneType];
  id v10 = sub_1000D52D8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    [v6 presentationMode];
    double v12 = SBSInCallPresentationModeDescription();
    *(_DWORD *)buf = 138543618;
    id v55 = v9;
    __int16 v56 = 2114;
    v57 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Scene of type '%{public}@' changed presentation mode to %{public}@", buf, 0x16u);
  }
  long long v13 = [v8 callDisplayStyleManager];
  id v14 = [v13 callDisplayStyle];

  long long v15 = [v8 callDisplayStyleManager];
  [(ICSInCallSceneDelegate *)self deviceWindowedAccessoryCutoutFrameForScene:v6];
  [v15 updateMiniWindowCutoutFrame:[self isDeviceAttachedToWindowedAccessoryForScene:v6] attachedToWindowedAccessory:v16, v17, v18, v19];

  int64_t v20 = [(ICSInCallSceneDelegate *)self callDisplayStyleForScene:v6];
  v21 = [v8 callDisplayStyleManager];
  [v21 setCallDisplayStyle:v20];

  BKSDisplayBrightnessGetCurrent();
  float v23 = v22;
  v24 = +[TUCallCenter sharedInstance];
  v25 = [v24 frontmostBargeCall];

  if (v25
    && [v25 isPTT]
    && v20 == 4
    && v23 > 0.0
    && (SBUIIsSystemApertureEnabled() & 1) == 0)
  {
    v26 = +[UIApplication sharedApplication];
    v27 = [v26 delegate];
    [v27 dismissPTTSessionPresentation];
  }
  v28 = +[TUCallCenter sharedInstance];
  v29 = [v28 frontmostAudioOrVideoCall];

  v52 = v29;
  uint64_t v30 = [v29 uniqueProxyIdentifierUUID];
  if (!v14)
  {
    v31 = [(ICSInCallSceneDelegate *)self callAnalyticsLogger];

    if (v31)
    {
      v32 = sub_1000D5130();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v53;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "ICSCallAnalytics: analytcs source changed to %@", buf, 0xCu);
      }

      v33 = [(ICSInCallSceneDelegate *)self callAnalyticsLogger];
      [v33 setBannerDismissalReasonForAnalyticsSource:v53 callUUID:v30];
    }
  }
  v34 = [(ICSInCallSceneDelegate *)self callAnalyticsLogger];
  v51 = (void *)v30;
  [v34 setPresentationMode:[v6 presentationMode] callUUID:v30];

  v35 = +[UIApplication sharedApplication];
  v36 = [v35 delegate];
  v37 = [v36 sceneManager];
  [v37 didUpdatePresentationMode:[v6 presentationMode] forScene:v6];

  id v38 = [v6 presentationMode];
  v39 = +[UIApplication sharedApplication];
  v40 = [v39 delegate];
  v41 = [v40 bannerPresentationManager];
  v42 = v41;
  if (v38 == (id)2) {
    [v41 didUpdatePresentationModeToFullScreen];
  }
  else {
    [v41 didUpdatePresentationModeToDismissed];
  }

  [(ICSInCallSceneDelegate *)self updateSceneBackgroundMaterialWith:v6];
  if (![(CNKFeatures *)self->_features isIncomingCallBannerEnabled]
    && v20 == 2)
  {
    v43 = sub_1000D51C8();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v55 = v9;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Requesting dismissal of presented banner since the ICS scene %{public}@ is now full screen", buf, 0xCu);
    }
    v44 = +[UIApplication sharedApplication];
    v45 = [v44 delegate];
    v46 = [v45 bannerPresentationManager];
    [v46 dismissPresentedBannerForReason:@"InCallService is presenting full screen" animated:1];
  }
  v47 = [v8 pipController];
  if ([v47 isPipped] && v20 == 2)
  {
    v48 = sub_1000D52D8();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v55 = v9;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Returning %{public}@ PiP to full screen since the associated scene is now full screen", buf, 0xCu);
    }
    [v47 manuallyStopPIPWithCompletion:&stru_1002CF1A0];
  }
  v49 = [(ICSInCallSceneDelegate *)self greenTea3PPresentationStyleHandler];

  if (v49)
  {
    v50 = [(ICSInCallSceneDelegate *)self greenTea3PPresentationStyleHandler];
    [v50 handlePresentationModeChanged:[v6 presentationMode] scene:v6];
  }
}

- (void)inCallWindowScene:(id)a3 didTransitionToAttachedToWindowedAccessory:(BOOL)a4 windowedAccessoryCutoutFrameInScreen:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  BOOL v9 = a4;
  id v11 = a3;
  double v12 = sub_1000D52D8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = v12;
    id v14 = NSStringFromBOOL();
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    long long v15 = NSStringFromRect(v24);
    int v20 = 138543618;
    v21 = v14;
    __int16 v22 = 2114;
    float v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "In-call scene did transition to device attached to windowed accessory: %{public}@ with frame: %{public}@", (uint8_t *)&v20, 0x16u);
  }
  double v16 = [(ICSInCallSceneDelegate *)self remoteAlertShellViewControllerForWindowScene:v11];
  double v17 = [v16 callDisplayStyleManager];
  [(ICSInCallSceneDelegate *)self deviceWindowedAccessoryCutoutFrameForScene:v11];
  [v17 updateMiniWindowCutoutFrame:v9];

  int64_t v18 = [(ICSInCallSceneDelegate *)self callDisplayStyleForScene:v11];
  double v19 = [v16 callDisplayStyleManager];
  [v19 setCallDisplayStyle:v18];
}

- (void)inCallWindowSceneHandleShowingNoticeForRevealingSystemControls:(id)a3
{
  id v3 = sub_1000D51C8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Landscape app has requested presentation of home affordance, showing session reminder notice", v7, 2u);
  }
  id v4 = +[UIApplication sharedApplication];
  double v5 = [v4 delegate];
  id v6 = [v5 bannerPresentationManager];
  [v6 presentReminderNotice];
}

- (id)remoteAlertShellViewControllerForWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICSInCallSceneDelegate *)self windowSceneToWindowMap];
  id v6 = [(id)v5 objectForKey:v4];

  double v7 = [v6 rootViewController];
  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if (v5)
  {
    id v8 = [v6 rootViewController];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)inCallWindowSceneSystemApertureElementProvider:(id)a3
{
  id v4 = a3;
  if ([(CNKFeatures *)self->_features isSystemApertureEnabled])
  {
    uint64_t v5 = +[UIApplication sharedApplication];
    id v6 = [v5 delegate];
    double v7 = [v6 bannerPresentationManager];
    id v8 = [v7 makeSystemApertureElementProvider];

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v9 = sub_1000D52D8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1001EA9C4((uint64_t)v8, v9);
      }
    }
    id v10 = sub_1000D52D8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Provided system aperture element %@ corresponding to scene %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    id v11 = sub_1000D52D8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1001EAA3C(v11);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)inCallWindowSceneHandleSilenceRingtone:(id)a3
{
  id v3 = +[TUCallCenter sharedInstance];
  uint64_t v4 = [v3 incomingCall];
  if (v4)
  {
    id v7 = (id)v4;

    uint64_t v5 = v7;
  }
  else
  {
    id v6 = +[TUCallCenter sharedInstance];
    id v8 = [v6 incomingVideoCall];

    uint64_t v5 = v8;
    if (!v8) {
      goto LABEL_7;
    }
  }
  id v9 = v5;
  if (([v5 shouldSuppressRingtone] & 1) == 0) {
    [v9 suppressRingtone];
  }
  uint64_t v5 = v9;
LABEL_7:
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v7 = a3;
  id v8 = [(ICSInCallSceneDelegate *)self windowSceneToWindowMap];
  id v10 = [v8 objectForKey:v7];

  id v9 = [v7 coordinateSpace];

  [v9 bounds];
  [v10 setFrame:];
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = [v4 session];
  [(ICSInCallSceneDelegate *)self _setupSceneIfNeeded:v4 session:v5];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  id v7 = [v6 session];
  [(ICSInCallSceneDelegate *)self _setupSceneIfNeeded:v6 session:v7];
}

- (void)_setupSceneIfNeeded:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(ICSInCallSceneDelegate *)self hasSetupForScene])
  {
    id v8 = v6;
    if ([v8 activationState] != (id)-1
      || [v8 presentationMode]
      || ([v8 requestedPresentationConfigurationIdentifier],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
      [(ICSInCallSceneDelegate *)self setHasSetupForScene:1];
      id v10 = [v8 ics_sceneType];
      id v11 = sub_1000D52D8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = v11;
        int v13 = sub_100011694((uint64_t)v10);
        *(_DWORD *)buf = 138543874;
        id v74 = v13;
        __int16 v75 = 2114;
        id v76 = v8;
        __int16 v77 = 2114;
        uint64_t v78 = (uint64_t)v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Connecting new scene of type '%{public}@'; scene: %{public}@; to session: %{public}@",
          buf,
          0x20u);
      }
      if (![(ICSInCallSceneDelegate *)self zombieDetectedForSession:v7 scene:v8 ofType:v10])
      {
        id v71 = v6;
        id v14 = +[UIApplication sharedApplication];
        __int16 v15 = [v14 delegate];
        id v16 = [v15 sceneManager];
        uint64_t v17 = [v16 sceneOfType:v10];

        if (v17)
        {
          int64_t v18 = sub_1000D52D8();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v68 = v18;
            v69 = sub_100011694((uint64_t)v10);
            *(_DWORD *)buf = 138543874;
            id v74 = v69;
            __int16 v75 = 2112;
            id v76 = v8;
            __int16 v77 = 2112;
            uint64_t v78 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Attempting to connect a new scene of type '%{public}@'; scene:%@ even though we already have one active:%@"
              ", undefined behavior may ensue",
              buf,
              0x20u);
          }
        }
        v70 = (void *)v17;
        double v19 = [[ICSSecureWindow alloc] initWithWindowScene:v8];
        int v20 = [(ICSInCallSceneDelegate *)self windowSceneToWindowMap];
        [v20 setObject:v19 forKey:v8];

        v21 = objc_alloc_init(ICSCallAnalyticsLogger);
        [(ICSInCallSceneDelegate *)self setCallAnalyticsLogger:v21];

        v72 = v19;
        [(ICSInCallSceneDelegate *)self configureWindow:v19 windowScene:v8];
        [(ICSInCallSceneDelegate *)self configureWindowScene:v8 forSceneType:v10];
        __int16 v22 = +[UIApplication sharedApplication];
        float v23 = [v22 delegate];
        NSRect v24 = [v23 allInCallScenes];
        [v24 addObject:v8];

        v25 = +[UIApplication sharedApplication];
        v26 = [v25 delegate];
        v27 = [v26 connectedSceneSessionIdentifiers];
        v28 = [v7 persistentIdentifier];
        id v29 = [v28 copy];
        [v27 addObject:v29];

        uint64_t v30 = +[UIApplication sharedApplication];
        v31 = [v30 delegate];
        v32 = [v31 sceneManager];
        [v32 registerScene:v8 ofType:v10];

        v33 = sub_1000D52D8();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v33;
          v35 = +[UIApplication sharedApplication];
          v36 = [v35 delegate];
          v37 = [v36 currentInCallScene];
          id v38 = +[UIApplication sharedApplication];
          v39 = [v38 delegate];
          v40 = [v39 allInCallScenes];
          *(_DWORD *)buf = 138543618;
          id v74 = v37;
          __int16 v75 = 2114;
          id v76 = v40;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "The current in-call scene is: %{public}@; the set of all tracked scenes is now: %{public}@",
            buf,
            0x16u);
        }
        v41 = sub_1000D52D8();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = v41;
          v43 = +[UIApplication sharedApplication];
          v44 = [v43 delegate];
          v45 = [v44 allInCallScenes];
          id v46 = [v45 count];
          *(_DWORD *)buf = 134217984;
          id v74 = v46;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Number of scenes tracked is %lu", buf, 0xCu);
        }
        v47 = sub_1000D52D8();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = v47;
          v49 = +[UIApplication sharedApplication];
          v50 = [v49 delegate];
          v51 = [v50 connectedSceneSessionIdentifiers];
          *(_DWORD *)buf = 138543362;
          id v74 = v51;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "The set of all scene sessions that have ever connected is %{public}@", buf, 0xCu);
        }
        v52 = +[UIApplication sharedApplication];
        id v53 = [v52 delegate];
        v54 = [v53 sceneManager];
        [v54 didUpdatePresentationMode:[v8 presentationMode] forScene:v8];

        id v55 = v72;
        __int16 v56 = [(ICSSecureWindow *)v72 rootViewController];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v57 = v56;
          v58 = v57;
          if (v57)
          {
            v59 = [v57 pipController];
            [v59 setWindowForTransitionAnimation:v72];

            [v58 sceneSessionDidChange];
          }
        }
        else
        {
          v58 = 0;
        }
        if (([(CNKFeatures *)self->_features isIncomingCallBannerEnabled] & 1) == 0
          && [v8 presentationMode] == (id)2
          && objc_msgSend(v8, "ics_sceneType") != (id)6)
        {
          v60 = sub_1000D51C8();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = v60;
            v62 = sub_100011694([v8 ics_sceneType]);
            *(_DWORD *)buf = 138543362;
            id v74 = v62;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Requesting dismissal of presented banner since a new full screen ICS scene %{public}@ is connecting", buf, 0xCu);
          }
          v63 = +[UIApplication sharedApplication];
          v64 = [v63 delegate];
          v65 = [v64 bannerPresentationManager];
          [v65 dismissPresentedBannerForReason:@"InCallService is connecting a new full screen scene" animated:1];

          id v55 = v72;
        }
        +[CATransaction setFrameStallSkipRequest:1];
        v66 = [(ICSInCallSceneDelegate *)self greenTea3PPresentationStyleHandler];

        if (v66)
        {
          v67 = [(ICSInCallSceneDelegate *)self greenTea3PPresentationStyleHandler];
          [v67 handlePresentationModeChanged:[v8 presentationMode] scene:v8];
        }
        id v6 = v71;
      }
    }
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D52D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 ics_sceneType];
    int v39 = 138543618;
    id v40 = v7;
    __int16 v41 = 2112;
    id v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disconnected scene of type %{public}@: %@", (uint8_t *)&v39, 0x16u);
  }
  id v8 = [(ICSInCallSceneDelegate *)self remoteAlertShellViewControllerForWindowScene:v4];
  id v9 = [(ICSInCallSceneDelegate *)self windowSceneToWindowMap];
  [v9 removeObjectForKey:v4];

  id v10 = +[UIApplication sharedApplication];
  id v11 = [v10 delegate];
  double v12 = [v11 allInCallScenes];
  unsigned int v13 = [v12 containsObject:v4];

  id v14 = sub_1000D52D8();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      int v39 = 138412290;
      id v40 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing scene %@ from the set of all tracked scenes", (uint8_t *)&v39, 0xCu);
    }
    id v16 = +[UIApplication sharedApplication];
    uint64_t v17 = [v16 delegate];
    int64_t v18 = [v17 allInCallScenes];
    [v18 removeObject:v4];
  }
  else if (v15)
  {
    int v39 = 138412290;
    id v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Warning]: Not removing scene %@ from the set of all tracked scenes because it was already untracked", (uint8_t *)&v39, 0xCu);
  }
  double v19 = sub_1000D52D8();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = v19;
    v21 = +[UIApplication sharedApplication];
    __int16 v22 = [v21 delegate];
    float v23 = [v22 allInCallScenes];
    int v39 = 138412290;
    id v40 = v23;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "The set of all tracked scenes is now %@", (uint8_t *)&v39, 0xCu);
  }
  NSRect v24 = sub_1000D52D8();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = +[UIApplication sharedApplication];
    v27 = [v26 delegate];
    v28 = [v27 allInCallScenes];
    id v29 = [v28 count];
    int v39 = 134217984;
    id v40 = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Number of scenes tracked is %lu", (uint8_t *)&v39, 0xCu);
  }
  uint64_t v30 = [(ICSInCallSceneDelegate *)self sceneDidDisconnectBlock];

  if (v30)
  {
    v31 = [(ICSInCallSceneDelegate *)self sceneDidDisconnectBlock];
    v31[2]();

    [(ICSInCallSceneDelegate *)self setSceneDidDisconnectBlock:0];
  }
  if ([v4 presentationMode] == (id)1)
  {
    v32 = [(ICSInCallSceneDelegate *)self callAnalyticsLogger];
    [v32 bannerDidDisconnect];
  }
  [(ICSInCallSceneDelegate *)self setCallAnalyticsLogger:0];
  [v8 sceneSessionDidChange];
  v33 = [v4 requestedPresentationConfigurationIdentifier];

  if (v33)
  {
    v34 = +[UIApplication sharedApplication];
    v35 = [v34 delegate];
    v36 = [v35 sceneManager];
    id v37 = [v4 ics_sceneType];
    id v38 = [v4 requestedPresentationConfigurationIdentifier];
    [v36 didDisconnectSceneOfType:v37 withIdentifier:v38];
  }
  else
  {
    v34 = sub_1000D5130();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      sub_1001EAA80((uint64_t)v4, v34);
    }
  }
}

- (void)handleHardwareButtonEvent:(id)a3 eventHandler:(id)a4
{
  id v5 = a4;
  switch((unint64_t)[a3 buttonEventType])
  {
    case 1uLL:
      [v5 handleVolumeUpButtonPressed];
      break;
    case 2uLL:
      [v5 handleVolumeDownButtonPressed];
      break;
    case 3uLL:
      [v5 handleHeadsetButtonPressed];
      break;
    case 4uLL:
      [v5 handleHeadsetButtonLongPressed];
      break;
    default:
      break;
  }
}

- (BOOL)zombieDetectedForSession:(id)a3 scene:(id)a4 ofType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[UIApplication sharedApplication];
  id v10 = [v9 delegate];
  id v11 = [v10 connectedSceneSessionIdentifiers];
  double v12 = [v8 persistentIdentifier];

  unsigned int v13 = [v11 containsObject:v12];
  id v14 = +[UIApplication sharedApplication];
  BOOL v15 = [v14 delegate];
  id v16 = [v15 sceneManager];
  unsigned int v17 = [v16 hasPendingSceneOfType:a5];

  if (objc_opt_respondsToSelector())
  {
    int64_t v18 = [v7 requestedPresentationConfigurationIdentifier];
    BOOL v19 = v18 == 0;
  }
  else
  {
    BOOL v19 = 0;
  }
  char v20 = v17 ^ 1;
  int v21 = v13 | v19 | v17 ^ 1;
  if (v21 == 1)
  {
    __int16 v22 = sub_1000D52D8();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1001EAAF8(v13, v20, v22);
    }
  }

  return v21;
}

- (void)configureWindowScene:(id)a3 forSceneType:(unint64_t)a4
{
  id v6 = a3;
  [(ICSInCallSceneDelegate *)self updateSceneBackgroundMaterialWith:v6];
  id v7 = sub_1000B0B34(a4);
  [v6 setPreferredBackgroundActivitiesToSuppress:v7];

  [v6 setShouldBecomeVisibleWhenWakingDisplay:0];
  id v8 = +[UIApplication sharedApplication];
  id v9 = [v8 delegate];
  unsigned int v10 = [v9 shouldActivateSOS];

  if (v10)
  {
    id v11 = sub_1000D52D8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ICSApplicationDelegate wants SOS while connecting a new scene. Immediately transition to full-screen overlay for SOS", buf, 2u);
    }
    double v12 = +[UIApplication sharedApplication];
    unsigned int v13 = [v12 delegate];
    [v13 transitionSceneToOverlayForSOS];
  }
  else
  {
    id v14 = +[UIApplication sharedApplication];
    BOOL v15 = [v14 delegate];
    id v16 = [v15 activationContext];
    unsigned int v17 = [v16 pendingRestrictedScreenTimeRequest];

    if (!v17) {
      goto LABEL_10;
    }
    int64_t v18 = sub_1000D52D8();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ICSApplicationDelegate wants Screen Time while connecting a new scene. Immediately transition to full-screen overlay for Screen Time", v19, 2u);
    }
    double v12 = +[UIApplication sharedApplication];
    unsigned int v13 = [v12 delegate];
    [v13 transitionSceneToOverlayForScreenTime];
  }

LABEL_10:
  if ([v6 isScreenSharingPresentation])
  {
    [v6 setSupportsDeviceLockEvents:0];
    [v6 setIdleTimerDisabled:1];
    [v6 setCallConnected:0];
    [v6 setPreferredHardwareButtonEventTypes:0];
  }
  if (a4 == 6)
  {
    [v6 setSupportsDeviceLockEvents:1];
    [v6 setShouldBecomeVisibleWhenWakingDisplay:0];
    [v6 setPrefersHiddenWhenDismissed:1];
  }
}

- (void)updateSceneBackgroundMaterialWith:(id)a3
{
  id v16 = a3;
  id v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 frontmostCall];
  if ([v5 isRTT])
  {
    unsigned int v6 = 0;
  }
  else
  {
    id v7 = +[TUCallCenter sharedInstance];
    id v8 = [v7 frontmostCall];
    unsigned int v6 = [v8 isTTY] ^ 1;
  }
  if ([v16 presentationMode] != (id)1
    && [(CNKFeatures *)self->_features isHeroImageEnabled]
    && ((+[TUCallCenter sharedInstance],
         id v9 = objc_claimAutoreleasedReturnValue(),
         [v9 currentCallCount])
      ? (unsigned int v10 = v6)
      : (unsigned int v10 = 0),
        v9,
        v10 == 1))
  {
    id v11 = +[TUCallCenter sharedInstance];
    double v12 = +[TUCallCenter sharedInstance];
    unsigned int v13 = [v12 frontmostAudioOrVideoCall];
    id v14 = [v11 activeConversationForCall:v13];

    if (v14 && ![v14 avMode]) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = 1;
    }
    [v16 _setBackgroundStyle:v15];
  }
  else
  {
    [v16 _setBackgroundStyle:4];
  }
}

- (void)configureWindow:(id)a3 windowScene:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  id v7 = [v6 coordinateSpace];
  [v7 bounds];
  [v9 setFrame:];

  id v8 = [(ICSInCallSceneDelegate *)self createRootViewControllerForScene:v6];

  [v9 setRootViewController:v8];
  [v9 makeKeyAndVisible];
}

- (id)createRootViewControllerForScene:(id)a3
{
  id v3 = [(ICSInCallSceneDelegate *)self createCallDisplayStyleManagerForScene:a3];
  id v4 = [[PHInCallRemoteAlertShellViewController alloc] initWithCallDisplayStyleManager:v3];

  return v4;
}

- (id)createCallDisplayStyleManagerForScene:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ICSCallDisplayStyleManager);
  [(ICSInCallSceneDelegate *)self deviceWindowedAccessoryCutoutFrameForScene:v4];
  -[ICSCallDisplayStyleManager updateMiniWindowCutoutFrame:attachedToWindowedAccessory:](v5, "updateMiniWindowCutoutFrame:attachedToWindowedAccessory:", [(ICSInCallSceneDelegate *)self isDeviceAttachedToWindowedAccessoryForScene:v4], v6, v7, v8, v9);
  [(ICSCallDisplayStyleManager *)v5 setCallDisplayStyle:[(ICSInCallSceneDelegate *)self callDisplayStyleForScene:v4]];
  unsigned int v10 = [v4 session];
  id v11 = [v10 persistentIdentifier];
  [(ICSCallDisplayStyleManager *)v5 setSceneSessionIdentifier:v11];

  id v12 = [v4 ics_sceneType];
  [(ICSCallDisplayStyleManager *)v5 setSceneType:v12];

  return v5;
}

- (int64_t)callDisplayStyleForScene:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 presentationMode];
  if ((unint64_t)(v5 - 2) >= 2)
  {
    if (v5 == (char *)1)
    {
      double v7 = +[ICSPreferences sharedPreferences];
      if ([v7 hasBannersEnabled]) {
        int64_t v6 = 0;
      }
      else {
        int64_t v6 = 2;
      }
    }
    else
    {
      int64_t v6 = 4;
    }
  }
  else if ([(ICSInCallSceneDelegate *)self isDeviceAttachedToWindowedAccessoryForScene:v4])
  {
    int64_t v6 = 1;
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

- (NSMapTable)windowSceneToWindowMap
{
  windowSceneToWindowMap = self->_windowSceneToWindowMap;
  if (!windowSceneToWindowMap)
  {
    id v4 = +[NSMapTable weakToStrongObjectsMapTable];
    id v5 = self->_windowSceneToWindowMap;
    self->_windowSceneToWindowMap = v4;

    windowSceneToWindowMap = self->_windowSceneToWindowMap;
  }

  return windowSceneToWindowMap;
}

- (id)sceneDidDisconnectBlock
{
  return self->_sceneDidDisconnectBlock;
}

- (void)setSceneDidDisconnectBlock:(id)a3
{
}

- (ICSCallAnalyticsLogger)callAnalyticsLogger
{
  return self->_callAnalyticsLogger;
}

- (void)setCallAnalyticsLogger:(id)a3
{
}

- (BOOL)hasSetupForScene
{
  return self->_hasSetupForScene;
}

- (void)setHasSetupForScene:(BOOL)a3
{
  self->_hasSetupForScene = a3;
}

- (ICSInCallScenePresentationStyleHandler)greenTea3PPresentationStyleHandler
{
  return (ICSInCallScenePresentationStyleHandler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setGreenTea3PPresentationStyleHandler:(id)a3
{
}

- (ICSGreenTea3PUIHardwareEventHandler)greenTea3PUIHardwareEventHandler
{
  return (ICSGreenTea3PUIHardwareEventHandler *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGreenTea3PUIHardwareEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greenTea3PUIHardwareEventHandler, 0);
  objc_storeStrong((id *)&self->_greenTea3PPresentationStyleHandler, 0);
  objc_storeStrong((id *)&self->_callAnalyticsLogger, 0);
  objc_storeStrong(&self->_sceneDidDisconnectBlock, 0);
  objc_storeStrong((id *)&self->_windowSceneToWindowMap, 0);

  objc_storeStrong((id *)&self->_features, 0);
}

@end