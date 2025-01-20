@interface WKPreferences
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (id)_experimentalFeatures;
+ (id)_features;
+ (id)_internalDebugFeatures;
- (BOOL)_acceleratedCompositingEnabled;
- (BOOL)_acceleratedDrawingEnabled;
- (BOOL)_accessHandleEnabled;
- (BOOL)_accessibilityIsolatedTreeEnabled;
- (BOOL)_allowFileAccessFromFileURLs;
- (BOOL)_allowPrivacySensitiveOperationsInNonPersistentDataStores;
- (BOOL)_allowsPictureInPictureMediaPlayback;
- (BOOL)_animatedImageAsyncDecodingEnabled;
- (BOOL)_appBadgeEnabled;
- (BOOL)_applePayCapabilityDisclosureAllowed;
- (BOOL)_avFoundationEnabled;
- (BOOL)_clientBadgeEnabled;
- (BOOL)_colorFilterEnabled;
- (BOOL)_compositingBordersVisible;
- (BOOL)_compositingRepaintCountersVisible;
- (BOOL)_contentChangeObserverEnabled;
- (BOOL)_developerExtrasEnabled;
- (BOOL)_deviceOrientationEventEnabled;
- (BOOL)_diagnosticLoggingEnabled;
- (BOOL)_displayListDrawingEnabled;
- (BOOL)_domPasteAllowed;
- (BOOL)_enumeratingAllNetworkInterfacesEnabled;
- (BOOL)_fileSystemAccessEnabled;
- (BOOL)_fullScreenEnabled;
- (BOOL)_getUserMediaRequiresFocus;
- (BOOL)_hiddenPageDOMTimerThrottlingAutoIncreases;
- (BOOL)_hiddenPageDOMTimerThrottlingEnabled;
- (BOOL)_iceCandidateFilteringEnabled;
- (BOOL)_interruptAudioOnPageVisibilityChangeEnabled;
- (BOOL)_isEnabledForFeature:(id)a3;
- (BOOL)_isEnabledForInternalDebugFeature:(id)a3;
- (BOOL)_isExtensibleSSOEnabled;
- (BOOL)_isSafeBrowsingEnabled;
- (BOOL)_isStandalone;
- (BOOL)_itpDebugModeEnabled;
- (BOOL)_javaScriptCanAccessClipboard;
- (BOOL)_largeImageAsyncDecodingEnabled;
- (BOOL)_legacyLineLayoutVisualCoverageEnabled;
- (BOOL)_loadsImagesAutomatically;
- (BOOL)_logsPageMessagesToSystemConsoleEnabled;
- (BOOL)_lowPowerVideoAudioBufferSizeEnabled;
- (BOOL)_managedMediaSourceEnabled;
- (BOOL)_mediaCapabilityGrantsEnabled;
- (BOOL)_mediaCaptureRequiresSecureConnection;
- (BOOL)_mediaDevicesEnabled;
- (BOOL)_mediaSessionEnabled;
- (BOOL)_mediaSourceEnabled;
- (BOOL)_mockCaptureDevicesEnabled;
- (BOOL)_mockCaptureDevicesPromptEnabled;
- (BOOL)_modelDocumentEnabled;
- (BOOL)_needsInAppBrowserPrivacyQuirks;
- (BOOL)_needsSiteSpecificQuirks;
- (BOOL)_notificationEventEnabled;
- (BOOL)_notificationsEnabled;
- (BOOL)_offlineApplicationCacheIsEnabled;
- (BOOL)_pageVisibilityBasedProcessSuppressionEnabled;
- (BOOL)_peerConnectionEnabled;
- (BOOL)_privateClickMeasurementDebugModeEnabled;
- (BOOL)_privateClickMeasurementEnabled;
- (BOOL)_punchOutWhiteBackgroundsInDarkMode;
- (BOOL)_pushAPIEnabled;
- (BOOL)_remotePlaybackEnabled;
- (BOOL)_requestAnimationFrameEnabled;
- (BOOL)_requiresFullscreenToLockScreenOrientation;
- (BOOL)_requiresPageVisibilityToPlayAudio;
- (BOOL)_resourceUsageOverlayVisible;
- (BOOL)_screenCaptureEnabled;
- (BOOL)_secureContextChecksEnabled;
- (BOOL)_serviceWorkerEntitlementDisabledForTesting;
- (BOOL)_shouldAllowDesignSystemUIFonts;
- (BOOL)_shouldAllowUserInstalledFonts;
- (BOOL)_shouldEnableTextAutosizingBoost;
- (BOOL)_shouldIgnoreMetaViewport;
- (BOOL)_shouldSuppressKeyboardInputDuringProvisionalNavigation;
- (BOOL)_spatialVideoEnabled;
- (BOOL)_speechRecognitionEnabled;
- (BOOL)_storageAPIEnabled;
- (BOOL)_subpixelAntialiasedLayerTextEnabled;
- (BOOL)_telephoneNumberDetectionIsEnabled;
- (BOOL)_textAutosizingEnabled;
- (BOOL)_textExtractionEnabled;
- (BOOL)_tiledScrollingIndicatorVisible;
- (BOOL)_verifyWindowOpenUserGestureFromUIProcess;
- (BOOL)_videoFullscreenRequiresElementFullscreen;
- (BOOL)_videoQualityIncludesDisplayCompositingEnabled;
- (BOOL)_webAudioEnabled;
- (BOOL)isElementFullscreenEnabled;
- (BOOL)isFraudulentWebsiteWarningEnabled;
- (BOOL)isSiteSpecificQuirksModeEnabled;
- (BOOL)isTextInteractionEnabled;
- (BOOL)javaScriptCanOpenWindowsAutomatically;
- (BOOL)javaScriptEnabled;
- (BOOL)shouldPrintBackgrounds;
- (CGFloat)minimumFontSize;
- (NSString)_fixedPitchFontFamily;
- (Object)_apiObject;
- (WKInactiveSchedulingPolicy)inactiveSchedulingPolicy;
- (WKPreferences)init;
- (WKPreferences)initWithCoder:(id)a3;
- (double)_inactiveMediaCaptureStreamRepromptIntervalInMinutes;
- (double)_interactionRegionInlinePadding;
- (double)_interactionRegionMinimumCornerRadius;
- (double)_managedMediaSourceHighThreshold;
- (double)_managedMediaSourceLowThreshold;
- (double)_mediaPreferredFullscreenWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_editableLinkBehavior;
- (int64_t)_pitchCorrectionAlgorithm;
- (int64_t)_storageBlockingPolicy;
- (unint64_t)_defaultFixedPitchFontSize;
- (unint64_t)_defaultFontSize;
- (unint64_t)_javaScriptRuntimeFlags;
- (unint64_t)_visibleDebugOverlayRegions;
- (void)_setAVFoundationEnabled:(BOOL)a3;
- (void)_setAcceleratedCompositingEnabled:(BOOL)a3;
- (void)_setAcceleratedDrawingEnabled:(BOOL)a3;
- (void)_setAccessHandleEnabled:(BOOL)a3;
- (void)_setAllowFileAccessFromFileURLs:(BOOL)a3;
- (void)_setAllowPrivacySensitiveOperationsInNonPersistentDataStores:(BOOL)a3;
- (void)_setAllowsPictureInPictureMediaPlayback:(BOOL)a3;
- (void)_setAnimatedImageAsyncDecodingEnabled:(BOOL)a3;
- (void)_setAppBadgeEnabled:(BOOL)a3;
- (void)_setApplePayCapabilityDisclosureAllowed:(BOOL)a3;
- (void)_setClientBadgeEnabled:(BOOL)a3;
- (void)_setColorFilterEnabled:(BOOL)a3;
- (void)_setCompositingBordersVisible:(BOOL)a3;
- (void)_setCompositingRepaintCountersVisible:(BOOL)a3;
- (void)_setContentChangeObserverEnabled:(BOOL)a3;
- (void)_setDOMPasteAllowed:(BOOL)a3;
- (void)_setDefaultFixedPitchFontSize:(unint64_t)a3;
- (void)_setDefaultFontSize:(unint64_t)a3;
- (void)_setDeveloperExtrasEnabled:(BOOL)a3;
- (void)_setDeviceOrientationEventEnabled:(BOOL)a3;
- (void)_setDiagnosticLoggingEnabled:(BOOL)a3;
- (void)_setEditableLinkBehavior:(int64_t)a3;
- (void)_setEnabled:(BOOL)a3 forFeature:(id)a4;
- (void)_setEnabled:(BOOL)a3 forInternalDebugFeature:(id)a4;
- (void)_setEnumeratingAllNetworkInterfacesEnabled:(BOOL)a3;
- (void)_setExtensibleSSOEnabled:(BOOL)a3;
- (void)_setFileSystemAccessEnabled:(BOOL)a3;
- (void)_setFixedPitchFontFamily:(id)a3;
- (void)_setFullScreenEnabled:(BOOL)a3;
- (void)_setGetUserMediaRequiresFocus:(BOOL)a3;
- (void)_setHiddenPageDOMTimerThrottlingAutoIncreases:(BOOL)a3;
- (void)_setHiddenPageDOMTimerThrottlingEnabled:(BOOL)a3;
- (void)_setICECandidateFilteringEnabled:(BOOL)a3;
- (void)_setInactiveMediaCaptureStreamRepromptIntervalInMinutes:(double)a3;
- (void)_setInteractionRegionInlinePadding:(double)a3;
- (void)_setInteractionRegionMinimumCornerRadius:(double)a3;
- (void)_setInterruptAudioOnPageVisibilityChangeEnabled:(BOOL)a3;
- (void)_setItpDebugModeEnabled:(BOOL)a3;
- (void)_setJavaScriptCanAccessClipboard:(BOOL)a3;
- (void)_setJavaScriptRuntimeFlags:(unint64_t)a3;
- (void)_setLargeImageAsyncDecodingEnabled:(BOOL)a3;
- (void)_setLegacyLineLayoutVisualCoverageEnabled:(BOOL)a3;
- (void)_setLoadsImagesAutomatically:(BOOL)a3;
- (void)_setLogsPageMessagesToSystemConsoleEnabled:(BOOL)a3;
- (void)_setLowPowerVideoAudioBufferSizeEnabled:(BOOL)a3;
- (void)_setManagedMediaSourceEnabled:(BOOL)a3;
- (void)_setManagedMediaSourceHighThreshold:(double)a3;
- (void)_setManagedMediaSourceLowThreshold:(double)a3;
- (void)_setMediaCapabilityGrantsEnabled:(BOOL)a3;
- (void)_setMediaCaptureRequiresSecureConnection:(BOOL)a3;
- (void)_setMediaDevicesEnabled:(BOOL)a3;
- (void)_setMediaPreferredFullscreenWidth:(double)a3;
- (void)_setMediaSessionEnabled:(BOOL)a3;
- (void)_setMediaSourceEnabled:(BOOL)a3;
- (void)_setMockCaptureDevicesEnabled:(BOOL)a3;
- (void)_setMockCaptureDevicesPromptEnabled:(BOOL)a3;
- (void)_setModelDocumentEnabled:(BOOL)a3;
- (void)_setNeedsInAppBrowserPrivacyQuirks:(BOOL)a3;
- (void)_setNeedsSiteSpecificQuirks:(BOOL)a3;
- (void)_setNotificationEventEnabled:(BOOL)a3;
- (void)_setNotificationsEnabled:(BOOL)a3;
- (void)_setPageVisibilityBasedProcessSuppressionEnabled:(BOOL)a3;
- (void)_setPeerConnectionEnabled:(BOOL)a3;
- (void)_setPitchCorrectionAlgorithm:(int64_t)a3;
- (void)_setPrivateClickMeasurementDebugModeEnabled:(BOOL)a3;
- (void)_setPrivateClickMeasurementEnabled:(BOOL)a3;
- (void)_setPunchOutWhiteBackgroundsInDarkMode:(BOOL)a3;
- (void)_setPushAPIEnabled:(BOOL)a3;
- (void)_setRemotePlaybackEnabled:(BOOL)a3;
- (void)_setRequiresFullscreenToLockScreenOrientation:(BOOL)a3;
- (void)_setRequiresPageVisibilityToPlayAudio:(BOOL)a3;
- (void)_setResourceUsageOverlayVisible:(BOOL)a3;
- (void)_setSafeBrowsingEnabled:(BOOL)a3;
- (void)_setScreenCaptureEnabled:(BOOL)a3;
- (void)_setSecureContextChecksEnabled:(BOOL)a3;
- (void)_setServiceWorkerEntitlementDisabledForTesting:(BOOL)a3;
- (void)_setShouldAllowUserInstalledFonts:(BOOL)a3;
- (void)_setShouldEnableTextAutosizingBoost:(BOOL)a3;
- (void)_setShouldIgnoreMetaViewport:(BOOL)a3;
- (void)_setShouldSuppressKeyboardInputDuringProvisionalNavigation:(BOOL)a3;
- (void)_setSpeechRecognitionEnabled:(BOOL)a3;
- (void)_setStandalone:(BOOL)a3;
- (void)_setStorageAPIEnabled:(BOOL)a3;
- (void)_setStorageBlockingPolicy:(int64_t)a3;
- (void)_setTelephoneNumberDetectionIsEnabled:(BOOL)a3;
- (void)_setTextAutosizingEnabled:(BOOL)a3;
- (void)_setTextExtractionEnabled:(BOOL)a3;
- (void)_setTiledScrollingIndicatorVisible:(BOOL)a3;
- (void)_setVerifyWindowOpenUserGestureFromUIProcess:(BOOL)a3;
- (void)_setVideoFullscreenRequiresElementFullscreen:(BOOL)a3;
- (void)_setVideoQualityIncludesDisplayCompositingEnabled:(BOOL)a3;
- (void)_setVisibleDebugOverlayRegions:(unint64_t)a3;
- (void)_setWebAudioEnabled:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setElementFullscreenEnabled:(BOOL)elementFullscreenEnabled;
- (void)setFraudulentWebsiteWarningEnabled:(BOOL)fraudulentWebsiteWarningEnabled;
- (void)setInactiveSchedulingPolicy:(WKInactiveSchedulingPolicy)inactiveSchedulingPolicy;
- (void)setJavaScriptCanOpenWindowsAutomatically:(BOOL)javaScriptCanOpenWindowsAutomatically;
- (void)setJavaScriptEnabled:(BOOL)javaScriptEnabled;
- (void)setMinimumFontSize:(CGFloat)minimumFontSize;
- (void)setShouldPrintBackgrounds:(BOOL)shouldPrintBackgrounds;
- (void)setSiteSpecificQuirksModeEnabled:(BOOL)siteSpecificQuirksModeEnabled;
- (void)setTextInteractionEnabled:(BOOL)textInteractionEnabled;
@end

@implementation WKPreferences

- (Object)_apiObject
{
  return (Object *)&self->_preferences;
}

- (void)_setICECandidateFilteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setICECandidateFilteringEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_modelDocumentEnabled
{
  {
    WebKit::WebPreferencesKey::modelDocumentEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::modelDocumentEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::modelDocumentEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::modelDocumentEnabledKey(void)::key, v2);
}

- (void)_setMockCaptureDevicesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setMockCaptureDevicesEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setMediaCaptureRequiresSecureConnection:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setMediaCaptureRequiresSecureConnection((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setEnumeratingAllNetworkInterfacesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setEnumeratingAllNetworkInterfacesEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_serviceWorkerEntitlementDisabledForTesting
{
  {
    WebKit::WebPreferencesKey::serviceWorkerEntitlementDisabledForTestingKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::serviceWorkerEntitlementDisabledForTestingKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::serviceWorkerEntitlementDisabledForTestingKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::serviceWorkerEntitlementDisabledForTestingKey(void)::key, v2);
}

- (void)_setShouldIgnoreMetaViewport:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setShouldIgnoreMetaViewport((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setTextExtractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setTextExtractionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setTelephoneNumberDetectionIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setTelephoneNumberParsingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setShouldSuppressKeyboardInputDuringProvisionalNavigation:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setShouldSuppressTextInputFromEditingDuringProvisionalNavigation((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setShouldAllowUserInstalledFonts:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setShouldAllowUserInstalledFonts((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setSafeBrowsingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setSafeBrowsingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setNeedsSiteSpecificQuirks:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setNeedsSiteSpecificQuirks((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setMediaSourceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setMediaSourceEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setMediaDevicesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setMediaDevicesEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setDiagnosticLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setDiagnosticLoggingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setApplePayCapabilityDisclosureAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setApplePayCapabilityDisclosureAllowed((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setJavaScriptEnabled:(BOOL)javaScriptEnabled
{
  BOOL v3 = javaScriptEnabled;
  WebKit::WebPreferences::setJavaScriptEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setShouldPrintBackgrounds:(BOOL)shouldPrintBackgrounds
{
  BOOL v3 = shouldPrintBackgrounds;
  WebKit::WebPreferences::setShouldPrintBackgrounds((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setJavaScriptCanOpenWindowsAutomatically:(BOOL)javaScriptCanOpenWindowsAutomatically
{
  BOOL v3 = javaScriptCanOpenWindowsAutomatically;
  WebKit::WebPreferences::setJavaScriptCanOpenWindowsAutomatically((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setElementFullscreenEnabled:(BOOL)elementFullscreenEnabled
{
  BOOL v3 = elementFullscreenEnabled;
  WebKit::WebPreferences::setFullScreenEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (WKPreferences)init
{
  v10.receiver = self;
  v10.super_class = (Class)WKPreferences;
  v2 = [(WKPreferences *)&v10 init];
  BOOL v3 = v2;
  if (v2)
  {
    v4 = [(WKPreferences *)v2 _apiObject];
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v5 = v13;
    v12 = v13;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v6 = v13;
    v11 = v13;
    WebKit::WebPreferences::WebPreferences((WebKit::WebPreferences *)v4, (const WTF::String *)&v9, (const WTF::String *)&v12, (const WTF::String *)&v11);
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v7);
        if (!v5)
        {
LABEL_11:
          v4->var1 = v3;
          return v3;
        }
LABEL_8:
        if (*(_DWORD *)v5 == 2) {
          WTF::StringImpl::destroy(v5, v7);
        }
        else {
          *(_DWORD *)v5 -= 2;
        }
        goto LABEL_11;
      }
      *(_DWORD *)v6 -= 2;
    }
    if (!v5) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  return v3;
}

- (void)_setStorageBlockingPolicy:(int64_t)a3
{
  p_preferences = &self->_preferences;
  unsigned int v4 = a3 == 1;
  if (a3 == 2) {
    unsigned int v4 = 2;
  }
  unsigned int v5 = v4;
  WebKit::WebPreferences::setStorageBlockingPolicy((WebKit::WebPreferences *)p_preferences, &v5);
}

+ (id)_features
{
  uint64_t v2 = WebKit::WebPreferences::features((WebKit::WebPreferences *)a1);
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v9, v2);
  API::Array::create(v9, &v8);
  uint64_t v3 = v8;
  unsigned int v4 = *(const void **)(v8 + 8);
  if (v4) {
    CFRetain(*(CFTypeRef *)(v8 + 8));
  }
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  CFRelease(*(CFTypeRef *)(v3 + 8));
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, v6);
  return (id)v5;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKPreferences accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKPreferences accessInstanceVariablesDirectly]::didLogFault = 1;
    unsigned int v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_preferences.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKPreferences;
    [(WKPreferences *)&v4 dealloc];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [(WKPreferences *)self minimumFontSize];
  objc_msgSend(a3, "encodeDouble:forKey:", @"minimumFontSize");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKPreferences javaScriptCanOpenWindowsAutomatically](self, "javaScriptCanOpenWindowsAutomatically"), @"javaScriptCanOpenWindowsAutomatically");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKPreferences javaScriptEnabled](self, "javaScriptEnabled"), @"javaScriptEnabled");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKPreferences shouldPrintBackgrounds](self, "shouldPrintBackgrounds"), @"shouldPrintBackgrounds");
  BOOL v5 = [(WKPreferences *)self isTextInteractionEnabled];

  [a3 encodeBool:v5 forKey:@"textInteractionEnabled"];
}

- (WKPreferences)initWithCoder:(id)a3
{
  objc_super v4 = [(WKPreferences *)self init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"minimumFontSize"];
    -[WKPreferences setMinimumFontSize:](v4, "setMinimumFontSize:");
    -[WKPreferences setJavaScriptCanOpenWindowsAutomatically:](v4, "setJavaScriptCanOpenWindowsAutomatically:", [a3 decodeBoolForKey:@"javaScriptCanOpenWindowsAutomatically"]);
    -[WKPreferences setJavaScriptEnabled:](v4, "setJavaScriptEnabled:", [a3 decodeBoolForKey:@"javaScriptEnabled"]);
    -[WKPreferences setShouldPrintBackgrounds:](v4, "setShouldPrintBackgrounds:", [a3 decodeBoolForKey:@"shouldPrintBackgrounds"]);
    if ([a3 containsValueForKey:@"textInteractionEnabled"]) {
      -[WKPreferences setTextInteractionEnabled:](v4, "setTextInteractionEnabled:", [a3 decodeBoolForKey:@"textInteractionEnabled"]);
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_preferences = &self->_preferences;
  objc_super v4 = (CFTypeRef *)API::Object::newObject(0x70uLL, 92);
  BOOL v5 = WebKit::WebPreferences::WebPreferences((WebKit::WebPreferences *)v4, (const WebKit::WebPreferences *)p_preferences);
  int v6 = (void *)*((void *)v5 + 1);
  if (v6) {
    CFRetain(*((CFTypeRef *)v5 + 1));
  }
  id v7 = v6;
  if (v6) {
    CFRelease(v6);
  }
  CFRelease(v4[1]);
  return v7;
}

- (CGFloat)minimumFontSize
{
  {
    WebKit::WebPreferencesKey::minimumFontSizeKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::minimumFontSizeKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::minimumFontSizeKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::minimumFontSizeKey(void)::key);
}

- (void)setMinimumFontSize:(CGFloat)minimumFontSize
{
  CGFloat v3 = minimumFontSize;
  WebKit::WebPreferences::setMinimumFontSize((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)setFraudulentWebsiteWarningEnabled:(BOOL)fraudulentWebsiteWarningEnabled
{
  BOOL v3 = fraudulentWebsiteWarningEnabled;
  WebKit::WebPreferences::setSafeBrowsingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)isFraudulentWebsiteWarningEnabled
{
  {
    WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::key, v2);
}

- (BOOL)javaScriptCanOpenWindowsAutomatically
{
  {
    WebKit::WebPreferencesKey::javaScriptCanOpenWindowsAutomaticallyKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::javaScriptCanOpenWindowsAutomaticallyKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::javaScriptCanOpenWindowsAutomaticallyKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::javaScriptCanOpenWindowsAutomaticallyKey(void)::key, v2);
}

- (BOOL)shouldPrintBackgrounds
{
  {
    WebKit::WebPreferencesKey::shouldPrintBackgroundsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldPrintBackgroundsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldPrintBackgroundsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldPrintBackgroundsKey(void)::key, v2);
}

- (BOOL)isTextInteractionEnabled
{
  {
    WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::textInteractionEnabledKey(void)::key, v2);
}

- (void)setTextInteractionEnabled:(BOOL)textInteractionEnabled
{
  BOOL v3 = textInteractionEnabled;
  WebKit::WebPreferences::setTextInteractionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)isSiteSpecificQuirksModeEnabled
{
  {
    WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::key, v2);
}

- (void)setSiteSpecificQuirksModeEnabled:(BOOL)siteSpecificQuirksModeEnabled
{
  BOOL v3 = siteSpecificQuirksModeEnabled;
  WebKit::WebPreferences::setNeedsSiteSpecificQuirks((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)isElementFullscreenEnabled
{
  {
    WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key, v2);
}

- (void)setInactiveSchedulingPolicy:(WKInactiveSchedulingPolicy)inactiveSchedulingPolicy
{
  if (inactiveSchedulingPolicy == WKInactiveSchedulingPolicyNone)
  {
    p_preferences = &self->_preferences;
    BOOL v8 = 1;
    WebKit::WebPreferences::setShouldTakeNearSuspendedAssertions((WebKit::WebPreferences *)&self->_preferences, &v8);
    BOOL v7 = 0;
    WebKit::WebPreferences::setBackgroundWebContentRunningBoardThrottlingEnabled((WebKit::WebPreferences *)p_preferences, &v7);
    char v6 = 0;
    BOOL v5 = (BOOL *)&v6;
  }
  else if (inactiveSchedulingPolicy == WKInactiveSchedulingPolicyThrottle)
  {
    p_preferences = &self->_preferences;
    BOOL v11 = 1;
    WebKit::WebPreferences::setShouldTakeNearSuspendedAssertions((WebKit::WebPreferences *)&self->_preferences, &v11);
    BOOL v10 = 1;
    WebKit::WebPreferences::setBackgroundWebContentRunningBoardThrottlingEnabled((WebKit::WebPreferences *)p_preferences, &v10);
    BOOL v9 = 0;
    BOOL v5 = &v9;
  }
  else
  {
    if (inactiveSchedulingPolicy) {
      return;
    }
    p_preferences = &self->_preferences;
    BOOL v14 = 0;
    WebKit::WebPreferences::setShouldTakeNearSuspendedAssertions((WebKit::WebPreferences *)&self->_preferences, &v14);
    BOOL v13 = 1;
    WebKit::WebPreferences::setBackgroundWebContentRunningBoardThrottlingEnabled((WebKit::WebPreferences *)p_preferences, &v13);
    {
      char v4 = WebKit::defaultShouldDropNearSuspendedAssertionAfterDelay(void)::newSDK;
    }
    else
    {
      char v4 = WTF::linkedOnOrAfterSDKWithBehavior();
      WebKit::defaultShouldDropNearSuspendedAssertionAfterDelay(void)::newSDK = v4;
    }
    char v12 = v4;
    BOOL v5 = (BOOL *)&v12;
  }
  WebKit::WebPreferences::setShouldDropNearSuspendedAssertionAfterDelay((WebKit::WebPreferences *)p_preferences, v5);
}

- (WKInactiveSchedulingPolicy)inactiveSchedulingPolicy
{
  {
    WebKit::WebPreferencesKey::backgroundWebContentRunningBoardThrottlingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::backgroundWebContentRunningBoardThrottlingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::backgroundWebContentRunningBoardThrottlingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  BOOL v3 = (WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40];
  if (!WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::backgroundWebContentRunningBoardThrottlingEnabledKey(void)::key, v2))return 2;
  {
    WebKit::WebPreferencesKey::shouldTakeNearSuspendedAssertionsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldTakeNearSuspendedAssertionsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldTakeNearSuspendedAssertionsKey(void)::$_0::operator() const(void)::impl;
  }
  return (unint64_t)WebKit::WebPreferencesStore::getBoolValueForKey(v3, (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldTakeNearSuspendedAssertionsKey(void)::key, v4);
}

- (BOOL)_telephoneNumberDetectionIsEnabled
{
  {
    WebKit::WebPreferencesKey::telephoneNumberParsingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::telephoneNumberParsingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::telephoneNumberParsingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::telephoneNumberParsingEnabledKey(void)::key, v2);
}

- (int64_t)_storageBlockingPolicy
{
  {
    WebKit::WebPreferencesKey::storageBlockingPolicyKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::storageBlockingPolicyKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::storageBlockingPolicyKey(void)::$_0::operator() const(void)::impl;
  }
  int v2 = WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::storageBlockingPolicyKey(void)::key);
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (BOOL)_fullScreenEnabled
{
  {
    WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key, v2);
}

- (void)_setFullScreenEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setFullScreenEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_allowsPictureInPictureMediaPlayback
{
  {
    WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::key, v2);
}

- (void)_setAllowsPictureInPictureMediaPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAllowsPictureInPictureMediaPlayback((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_compositingBordersVisible
{
  {
    WebKit::WebPreferencesKey::compositingBordersVisibleKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::compositingBordersVisibleKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::compositingBordersVisibleKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::compositingBordersVisibleKey(void)::key, v2);
}

- (void)_setCompositingBordersVisible:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setCompositingBordersVisible((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_compositingRepaintCountersVisible
{
  {
    WebKit::WebPreferencesKey::compositingRepaintCountersVisibleKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::compositingRepaintCountersVisibleKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::compositingRepaintCountersVisibleKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::compositingRepaintCountersVisibleKey(void)::key, v2);
}

- (void)_setCompositingRepaintCountersVisible:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setCompositingRepaintCountersVisible((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_tiledScrollingIndicatorVisible
{
  {
    WebKit::WebPreferencesKey::tiledScrollingIndicatorVisibleKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::tiledScrollingIndicatorVisibleKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::tiledScrollingIndicatorVisibleKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::tiledScrollingIndicatorVisibleKey(void)::key, v2);
}

- (void)_setTiledScrollingIndicatorVisible:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setTiledScrollingIndicatorVisible((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_resourceUsageOverlayVisible
{
  {
    WebKit::WebPreferencesKey::resourceUsageOverlayVisibleKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::resourceUsageOverlayVisibleKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::resourceUsageOverlayVisibleKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::resourceUsageOverlayVisibleKey(void)::key, v2);
}

- (void)_setResourceUsageOverlayVisible:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setResourceUsageOverlayVisible((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (unint64_t)_visibleDebugOverlayRegions
{
  {
    WebKit::WebPreferencesKey::visibleDebugOverlayRegionsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::visibleDebugOverlayRegionsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::visibleDebugOverlayRegionsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::visibleDebugOverlayRegionsKey(void)::key);
}

- (void)_setVisibleDebugOverlayRegions:(unint64_t)a3
{
  unsigned int v3 = a3;
  WebKit::WebPreferences::setVisibleDebugOverlayRegions((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_legacyLineLayoutVisualCoverageEnabled
{
  {
    WebKit::WebPreferencesKey::legacyLineLayoutVisualCoverageEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::legacyLineLayoutVisualCoverageEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::legacyLineLayoutVisualCoverageEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::legacyLineLayoutVisualCoverageEnabledKey(void)::key, v2);
}

- (void)_setLegacyLineLayoutVisualCoverageEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setLegacyLineLayoutVisualCoverageEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_contentChangeObserverEnabled
{
  {
    WebKit::WebPreferencesKey::contentChangeObserverEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::contentChangeObserverEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::contentChangeObserverEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::contentChangeObserverEnabledKey(void)::key, v2);
}

- (void)_setContentChangeObserverEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setContentChangeObserverEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_acceleratedDrawingEnabled
{
  {
    WebKit::WebPreferencesKey::acceleratedDrawingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::acceleratedDrawingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::acceleratedDrawingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::acceleratedDrawingEnabledKey(void)::key, v2);
}

- (void)_setAcceleratedDrawingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAcceleratedDrawingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_largeImageAsyncDecodingEnabled
{
  {
    WebKit::WebPreferencesKey::largeImageAsyncDecodingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::largeImageAsyncDecodingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::largeImageAsyncDecodingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::largeImageAsyncDecodingEnabledKey(void)::key, v2);
}

- (void)_setLargeImageAsyncDecodingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setLargeImageAsyncDecodingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_needsInAppBrowserPrivacyQuirks
{
  {
    WebKit::WebPreferencesKey::needsInAppBrowserPrivacyQuirksKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::needsInAppBrowserPrivacyQuirksKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::needsInAppBrowserPrivacyQuirksKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::needsInAppBrowserPrivacyQuirksKey(void)::key, v2);
}

- (void)_setNeedsInAppBrowserPrivacyQuirks:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setNeedsInAppBrowserPrivacyQuirks((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_animatedImageAsyncDecodingEnabled
{
  {
    WebKit::WebPreferencesKey::animatedImageAsyncDecodingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::animatedImageAsyncDecodingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::animatedImageAsyncDecodingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::animatedImageAsyncDecodingEnabledKey(void)::key, v2);
}

- (void)_setAnimatedImageAsyncDecodingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAnimatedImageAsyncDecodingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_textAutosizingEnabled
{
  {
    WebKit::WebPreferencesKey::textAutosizingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textAutosizingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::textAutosizingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::textAutosizingEnabledKey(void)::key, v2);
}

- (void)_setTextAutosizingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setTextAutosizingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_developerExtrasEnabled
{
  {
    WebKit::WebPreferencesKey::developerExtrasEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::developerExtrasEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::developerExtrasEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::developerExtrasEnabledKey(void)::key, v2);
}

- (void)_setDeveloperExtrasEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setDeveloperExtrasEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_logsPageMessagesToSystemConsoleEnabled
{
  {
    WebKit::WebPreferencesKey::logsPageMessagesToSystemConsoleEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::logsPageMessagesToSystemConsoleEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::logsPageMessagesToSystemConsoleEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::logsPageMessagesToSystemConsoleEnabledKey(void)::key, v2);
}

- (void)_setLogsPageMessagesToSystemConsoleEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setLogsPageMessagesToSystemConsoleEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_hiddenPageDOMTimerThrottlingEnabled
{
  {
    WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingEnabledKey(void)::key, v2);
}

- (void)_setHiddenPageDOMTimerThrottlingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setHiddenPageDOMTimerThrottlingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_hiddenPageDOMTimerThrottlingAutoIncreases
{
  {
    WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingAutoIncreasesKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingAutoIncreasesKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingAutoIncreasesKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::hiddenPageDOMTimerThrottlingAutoIncreasesKey(void)::key, v2);
}

- (void)_setHiddenPageDOMTimerThrottlingAutoIncreases:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setHiddenPageDOMTimerThrottlingAutoIncreases((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_pageVisibilityBasedProcessSuppressionEnabled
{
  {
    WebKit::WebPreferencesKey::pageVisibilityBasedProcessSuppressionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::pageVisibilityBasedProcessSuppressionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::pageVisibilityBasedProcessSuppressionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::pageVisibilityBasedProcessSuppressionEnabledKey(void)::key, v2);
}

- (void)_setPageVisibilityBasedProcessSuppressionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setPageVisibilityBasedProcessSuppressionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_allowFileAccessFromFileURLs
{
  {
    WebKit::WebPreferencesKey::allowFileAccessFromFileURLsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::allowFileAccessFromFileURLsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::allowFileAccessFromFileURLsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::allowFileAccessFromFileURLsKey(void)::key, v2);
}

- (void)_setAllowFileAccessFromFileURLs:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAllowFileAccessFromFileURLs((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (unint64_t)_javaScriptRuntimeFlags
{
  {
    WebKit::WebPreferencesKey::javaScriptRuntimeFlagsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::javaScriptRuntimeFlagsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::javaScriptRuntimeFlagsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::javaScriptRuntimeFlagsKey(void)::key);
}

- (void)_setJavaScriptRuntimeFlags:(unint64_t)a3
{
  unsigned int v3 = a3;
  WebKit::WebPreferences::setJavaScriptRuntimeFlags((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_isStandalone
{
  {
    WebKit::WebPreferencesKey::standaloneKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::standaloneKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::standaloneKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::standaloneKey(void)::key, v2);
}

- (void)_setStandalone:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setStandalone((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_diagnosticLoggingEnabled
{
  {
    WebKit::WebPreferencesKey::diagnosticLoggingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::diagnosticLoggingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::diagnosticLoggingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::diagnosticLoggingEnabledKey(void)::key, v2);
}

- (unint64_t)_defaultFontSize
{
  {
    WebKit::WebPreferencesKey::defaultFontSizeKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::defaultFontSizeKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::defaultFontSizeKey(void)::$_0::operator() const(void)::impl;
  }
  return (unint64_t)WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::defaultFontSizeKey(void)::key);
}

- (void)_setDefaultFontSize:(unint64_t)a3
{
  double v3 = (double)a3;
  WebKit::WebPreferences::setDefaultFontSize((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (unint64_t)_defaultFixedPitchFontSize
{
  {
    WebKit::WebPreferencesKey::defaultFixedFontSizeKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::defaultFixedFontSizeKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::defaultFixedFontSizeKey(void)::$_0::operator() const(void)::impl;
  }
  return (unint64_t)WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::defaultFixedFontSizeKey(void)::key);
}

- (void)_setDefaultFixedPitchFontSize:(unint64_t)a3
{
  double v3 = (double)a3;
  WebKit::WebPreferences::setDefaultFixedFontSize((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (NSString)_fixedPitchFontFamily
{
  {
    WebKit::WebPreferencesKey::fixedFontFamilyKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fixedFontFamilyKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fixedFontFamilyKey(void)::$_0::operator() const(void)::impl;
  }
  WebKit::valueForKey<WTF::String>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fixedFontFamilyKey(void)::key, &v6);
  int v2 = v6;
  if (!v6) {
    return (NSString *)&stru_1EEA10550;
  }
  char v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (void)_setFixedPitchFontFamily:(id)a3
{
  p_preferences = &self->_preferences;
  MEMORY[0x19972EAD0](&v6, a3);
  WebKit::WebPreferences::setFixedFontFamily((WebKit::WebPreferences *)p_preferences, &v6);
  BOOL v5 = v6;
  char v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

+ (id)_internalDebugFeatures
{
  int v2 = WebKit::WebPreferences::internalDebugFeatures((WebKit::WebPreferences *)a1);
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v9, (uint64_t)v2);
  API::Array::create(v9, &v8);
  uint64_t v3 = v8;
  char v4 = *(const void **)(v8 + 8);
  if (v4) {
    CFRetain(*(CFTypeRef *)(v8 + 8));
  }
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  CFRelease(*(CFTypeRef *)(v3 + 8));
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, v6);
  return (id)v5;
}

- (BOOL)_isEnabledForInternalDebugFeature:(id)a3
{
  return WebKit::WebPreferences::isFeatureEnabled((WebKit::WebPreferences *)&self->_preferences, (const API::Feature *)((char *)a3 + 8));
}

- (void)_setEnabled:(BOOL)a3 forInternalDebugFeature:(id)a4
{
}

+ (id)_experimentalFeatures
{
  int v2 = WebKit::WebPreferences::experimentalFeatures((WebKit::WebPreferences *)a1);
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v9, (uint64_t)v2);
  API::Array::create(v9, &v8);
  uint64_t v3 = v8;
  char v4 = *(const void **)(v8 + 8);
  if (v4) {
    CFRetain(*(CFTypeRef *)(v8 + 8));
  }
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  CFRelease(*(CFTypeRef *)(v3 + 8));
  WTF::Vector<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, v6);
  return (id)v5;
}

- (BOOL)_isEnabledForFeature:(id)a3
{
  return WebKit::WebPreferences::isFeatureEnabled((WebKit::WebPreferences *)&self->_preferences, (const API::Feature *)((char *)a3 + 8));
}

- (void)_setEnabled:(BOOL)a3 forFeature:(id)a4
{
}

- (BOOL)_applePayCapabilityDisclosureAllowed
{
  {
    WebKit::WebPreferencesKey::applePayCapabilityDisclosureAllowedKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::applePayCapabilityDisclosureAllowedKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::applePayCapabilityDisclosureAllowedKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::applePayCapabilityDisclosureAllowedKey(void)::key, v2);
}

- (BOOL)_shouldSuppressKeyboardInputDuringProvisionalNavigation
{
  {
    WebKit::WebPreferencesKey::shouldSuppressTextInputFromEditingDuringProvisionalNavigationKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldSuppressTextInputFromEditingDuringProvisionalNavigationKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldSuppressTextInputFromEditingDuringProvisionalNavigationKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldSuppressTextInputFromEditingDuringProvisionalNavigationKey(void)::key, v2);
}

- (BOOL)_loadsImagesAutomatically
{
  {
    WebKit::WebPreferencesKey::loadsImagesAutomaticallyKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::loadsImagesAutomaticallyKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::loadsImagesAutomaticallyKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::loadsImagesAutomaticallyKey(void)::key, v2);
}

- (void)_setLoadsImagesAutomatically:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setLoadsImagesAutomatically((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_peerConnectionEnabled
{
  {
    WebKit::WebPreferencesKey::peerConnectionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::peerConnectionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::peerConnectionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::peerConnectionEnabledKey(void)::key, v2);
}

- (void)_setPeerConnectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setPeerConnectionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_mediaDevicesEnabled
{
  {
    WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::key, v2);
}

- (BOOL)_getUserMediaRequiresFocus
{
  {
    WebKit::WebPreferencesKey::getUserMediaRequiresFocusKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::getUserMediaRequiresFocusKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::getUserMediaRequiresFocusKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::getUserMediaRequiresFocusKey(void)::key, v2);
}

- (void)_setGetUserMediaRequiresFocus:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setGetUserMediaRequiresFocus((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_screenCaptureEnabled
{
  {
    WebKit::WebPreferencesKey::screenCaptureEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::screenCaptureEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::screenCaptureEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::screenCaptureEnabledKey(void)::key, v2);
}

- (void)_setScreenCaptureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setScreenCaptureEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_mockCaptureDevicesEnabled
{
  {
    WebKit::WebPreferencesKey::mockCaptureDevicesEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mockCaptureDevicesEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mockCaptureDevicesEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mockCaptureDevicesEnabledKey(void)::key, v2);
}

- (BOOL)_mockCaptureDevicesPromptEnabled
{
  {
    WebKit::WebPreferencesKey::mockCaptureDevicesPromptEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mockCaptureDevicesPromptEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mockCaptureDevicesPromptEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mockCaptureDevicesPromptEnabledKey(void)::key, v2);
}

- (void)_setMockCaptureDevicesPromptEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setMockCaptureDevicesPromptEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_mediaCaptureRequiresSecureConnection
{
  {
    WebKit::WebPreferencesKey::mediaCaptureRequiresSecureConnectionKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaCaptureRequiresSecureConnectionKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaCaptureRequiresSecureConnectionKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaCaptureRequiresSecureConnectionKey(void)::key, v2);
}

- (double)_inactiveMediaCaptureStreamRepromptIntervalInMinutes
{
  {
    WebKit::WebPreferencesKey::inactiveMediaCaptureStreamRepromptIntervalInMinutesKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::inactiveMediaCaptureStreamRepromptIntervalInMinutesKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::inactiveMediaCaptureStreamRepromptIntervalInMinutesKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::inactiveMediaCaptureStreamRepromptIntervalInMinutesKey(void)::key);
}

- (void)_setInactiveMediaCaptureStreamRepromptIntervalInMinutes:(double)a3
{
  double v3 = a3;
  WebKit::WebPreferences::setInactiveMediaCaptureStreamRepromptIntervalInMinutes((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_interruptAudioOnPageVisibilityChangeEnabled
{
  {
    WebKit::WebPreferencesKey::interruptAudioOnPageVisibilityChangeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::interruptAudioOnPageVisibilityChangeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::interruptAudioOnPageVisibilityChangeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::interruptAudioOnPageVisibilityChangeEnabledKey(void)::key, v2);
}

- (void)_setInterruptAudioOnPageVisibilityChangeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setInterruptAudioOnPageVisibilityChangeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_enumeratingAllNetworkInterfacesEnabled
{
  {
    WebKit::WebPreferencesKey::enumeratingAllNetworkInterfacesEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::enumeratingAllNetworkInterfacesEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::enumeratingAllNetworkInterfacesEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::enumeratingAllNetworkInterfacesEnabledKey(void)::key, v2);
}

- (BOOL)_iceCandidateFilteringEnabled
{
  {
    WebKit::WebPreferencesKey::iceCandidateFilteringEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::iceCandidateFilteringEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::iceCandidateFilteringEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::iceCandidateFilteringEnabledKey(void)::key, v2);
}

- (void)_setJavaScriptCanAccessClipboard:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setJavaScriptCanAccessClipboard((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_shouldAllowUserInstalledFonts
{
  {
    WebKit::WebPreferencesKey::shouldAllowUserInstalledFontsKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldAllowUserInstalledFontsKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldAllowUserInstalledFontsKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldAllowUserInstalledFontsKey(void)::key, v2);
}

- (int64_t)_editableLinkBehavior
{
  {
    WebKit::WebPreferencesKey::editableLinkBehaviorKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::editableLinkBehaviorKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::editableLinkBehaviorKey(void)::$_0::operator() const(void)::impl;
  }
  LOBYTE(result) = WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::editableLinkBehaviorKey(void)::key);
  if (result >= 5u) {
    return 4;
  }
  else {
    return result;
  }
}

- (void)_setEditableLinkBehavior:(int64_t)a3
{
  if ((unint64_t)a3 >= 5) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = a3;
  }
  unsigned int v4 = v3;
  WebKit::WebPreferences::setEditableLinkBehavior((WebKit::WebPreferences *)&self->_preferences, &v4);
}

- (void)_setAVFoundationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAVFoundationEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_avFoundationEnabled
{
  {
    WebKit::WebPreferencesKey::isAVFoundationEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::isAVFoundationEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::isAVFoundationEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::isAVFoundationEnabledKey(void)::key, v2);
}

- (BOOL)_textExtractionEnabled
{
  {
    WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::key, v2);
}

- (void)_setColorFilterEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setColorFilterEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_colorFilterEnabled
{
  {
    WebKit::WebPreferencesKey::colorFilterEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::colorFilterEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::colorFilterEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::colorFilterEnabledKey(void)::key, v2);
}

- (void)_setPunchOutWhiteBackgroundsInDarkMode:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setPunchOutWhiteBackgroundsInDarkMode((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_punchOutWhiteBackgroundsInDarkMode
{
  {
    WebKit::WebPreferencesKey::punchOutWhiteBackgroundsInDarkModeKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::punchOutWhiteBackgroundsInDarkModeKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::punchOutWhiteBackgroundsInDarkModeKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::punchOutWhiteBackgroundsInDarkModeKey(void)::key, v2);
}

- (void)_setLowPowerVideoAudioBufferSizeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setLowPowerVideoAudioBufferSizeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_lowPowerVideoAudioBufferSizeEnabled
{
  {
    WebKit::WebPreferencesKey::lowPowerVideoAudioBufferSizeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::lowPowerVideoAudioBufferSizeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::lowPowerVideoAudioBufferSizeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::lowPowerVideoAudioBufferSizeEnabledKey(void)::key, v2);
}

- (BOOL)_shouldIgnoreMetaViewport
{
  {
    WebKit::WebPreferencesKey::shouldIgnoreMetaViewportKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldIgnoreMetaViewportKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldIgnoreMetaViewportKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldIgnoreMetaViewportKey(void)::key, v2);
}

- (BOOL)_needsSiteSpecificQuirks
{
  {
    WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::needsSiteSpecificQuirksKey(void)::key, v2);
}

- (void)_setItpDebugModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setItpDebugModeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_itpDebugModeEnabled
{
  {
    WebKit::WebPreferencesKey::itpDebugModeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::itpDebugModeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::itpDebugModeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::itpDebugModeEnabledKey(void)::key, v2);
}

- (BOOL)_mediaSourceEnabled
{
  {
    WebKit::WebPreferencesKey::mediaSourceEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaSourceEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaSourceEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaSourceEnabledKey(void)::key, v2);
}

- (void)_setManagedMediaSourceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setManagedMediaSourceEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_managedMediaSourceEnabled
{
  {
    WebKit::WebPreferencesKey::managedMediaSourceEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::managedMediaSourceEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::managedMediaSourceEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::managedMediaSourceEnabledKey(void)::key, v2);
}

- (void)_setManagedMediaSourceLowThreshold:(double)a3
{
  double v3 = a3;
  WebKit::WebPreferences::setManagedMediaSourceLowThreshold((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (double)_managedMediaSourceLowThreshold
{
  {
    WebKit::WebPreferencesKey::managedMediaSourceLowThresholdKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::managedMediaSourceLowThresholdKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::managedMediaSourceLowThresholdKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::managedMediaSourceLowThresholdKey(void)::key);
}

- (void)_setManagedMediaSourceHighThreshold:(double)a3
{
  double v3 = a3;
  WebKit::WebPreferences::setManagedMediaSourceHighThreshold((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (double)_managedMediaSourceHighThreshold
{
  {
    WebKit::WebPreferencesKey::managedMediaSourceHighThresholdKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::managedMediaSourceHighThresholdKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::managedMediaSourceHighThresholdKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::managedMediaSourceHighThresholdKey(void)::key);
}

- (BOOL)_secureContextChecksEnabled
{
  {
    WebKit::WebPreferencesKey::secureContextChecksEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::secureContextChecksEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::secureContextChecksEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::secureContextChecksEnabledKey(void)::key, v2);
}

- (void)_setSecureContextChecksEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setSecureContextChecksEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setWebAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setWebAudioEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_webAudioEnabled
{
  {
    WebKit::WebPreferencesKey::webAudioEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::webAudioEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::webAudioEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::webAudioEnabledKey(void)::key, v2);
}

- (void)_setAcceleratedCompositingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAcceleratedCompositingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_acceleratedCompositingEnabled
{
  {
    WebKit::WebPreferencesKey::acceleratedCompositingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::acceleratedCompositingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::acceleratedCompositingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::acceleratedCompositingEnabledKey(void)::key, v2);
}

- (BOOL)_remotePlaybackEnabled
{
  {
    WebKit::WebPreferencesKey::remotePlaybackEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::remotePlaybackEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::remotePlaybackEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::remotePlaybackEnabledKey(void)::key, v2);
}

- (void)_setRemotePlaybackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setRemotePlaybackEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setServiceWorkerEntitlementDisabledForTesting:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setServiceWorkerEntitlementDisabledForTesting((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_javaScriptCanAccessClipboard
{
  {
    WebKit::WebPreferencesKey::javaScriptCanAccessClipboardKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::javaScriptCanAccessClipboardKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::javaScriptCanAccessClipboardKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::javaScriptCanAccessClipboardKey(void)::key, v2);
}

- (void)_setDOMPasteAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setDOMPasteAllowed((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_domPasteAllowed
{
  {
    WebKit::WebPreferencesKey::domPasteAllowedKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::domPasteAllowedKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::domPasteAllowedKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::domPasteAllowedKey(void)::key, v2);
}

- (void)_setShouldEnableTextAutosizingBoost:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setShouldEnableTextAutosizingBoost((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_shouldEnableTextAutosizingBoost
{
  {
    WebKit::WebPreferencesKey::shouldEnableTextAutosizingBoostKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldEnableTextAutosizingBoostKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldEnableTextAutosizingBoostKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldEnableTextAutosizingBoostKey(void)::key, v2);
}

- (BOOL)_isSafeBrowsingEnabled
{
  {
    WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::safeBrowsingEnabledKey(void)::key, v2);
}

- (void)_setVideoQualityIncludesDisplayCompositingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setVideoQualityIncludesDisplayCompositingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_videoQualityIncludesDisplayCompositingEnabled
{
  {
    WebKit::WebPreferencesKey::videoQualityIncludesDisplayCompositingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::videoQualityIncludesDisplayCompositingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::videoQualityIncludesDisplayCompositingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::videoQualityIncludesDisplayCompositingEnabledKey(void)::key, v2);
}

- (void)_setDeviceOrientationEventEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setDeviceOrientationEventEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_deviceOrientationEventEnabled
{
  {
    WebKit::WebPreferencesKey::deviceOrientationEventEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::deviceOrientationEventEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::deviceOrientationEventEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::deviceOrientationEventEnabledKey(void)::key, v2);
}

- (BOOL)_accessibilityIsolatedTreeEnabled
{
  return 0;
}

- (BOOL)_speechRecognitionEnabled
{
  {
    WebKit::WebPreferencesKey::speechRecognitionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::speechRecognitionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::speechRecognitionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::speechRecognitionEnabledKey(void)::key, v2);
}

- (void)_setSpeechRecognitionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setSpeechRecognitionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_privateClickMeasurementEnabled
{
  {
    WebKit::WebPreferencesKey::privateClickMeasurementEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::privateClickMeasurementEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::privateClickMeasurementEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::privateClickMeasurementEnabledKey(void)::key, v2);
}

- (void)_setPrivateClickMeasurementEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setPrivateClickMeasurementEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_privateClickMeasurementDebugModeEnabled
{
  {
    WebKit::WebPreferencesKey::privateClickMeasurementDebugModeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::privateClickMeasurementDebugModeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::privateClickMeasurementDebugModeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::privateClickMeasurementDebugModeEnabledKey(void)::key, v2);
}

- (void)_setPrivateClickMeasurementDebugModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setPrivateClickMeasurementDebugModeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (int64_t)_pitchCorrectionAlgorithm
{
  {
    WebKit::WebPreferencesKey::pitchCorrectionAlgorithmKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::pitchCorrectionAlgorithmKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::pitchCorrectionAlgorithmKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<unsigned int>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::pitchCorrectionAlgorithmKey(void)::key);
}

- (void)_setPitchCorrectionAlgorithm:(int64_t)a3
{
  unsigned int v3 = a3;
  WebKit::WebPreferences::setPitchCorrectionAlgorithm((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_mediaSessionEnabled
{
  {
    WebKit::WebPreferencesKey::mediaSessionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaSessionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaSessionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaSessionEnabledKey(void)::key, v2);
}

- (void)_setMediaSessionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setMediaSessionEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_isExtensibleSSOEnabled
{
  {
    WebKit::WebPreferencesKey::isExtensibleSSOEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::isExtensibleSSOEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::isExtensibleSSOEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::isExtensibleSSOEnabledKey(void)::key, v2);
}

- (void)_setExtensibleSSOEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setExtensibleSSOEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_requiresPageVisibilityToPlayAudio
{
  {
    WebKit::WebPreferencesKey::requiresPageVisibilityToPlayAudioKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::requiresPageVisibilityToPlayAudioKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::requiresPageVisibilityToPlayAudioKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::requiresPageVisibilityToPlayAudioKey(void)::key, v2);
}

- (void)_setRequiresPageVisibilityToPlayAudio:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setRequiresPageVisibilityToPlayAudio((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_fileSystemAccessEnabled
{
  {
    WebKit::WebPreferencesKey::fileSystemAccessEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fileSystemAccessEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fileSystemAccessEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fileSystemAccessEnabledKey(void)::key, v2);
}

- (void)_setFileSystemAccessEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setFileSystemAccessEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_storageAPIEnabled
{
  {
    WebKit::WebPreferencesKey::storageAPIEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::storageAPIEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::storageAPIEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::storageAPIEnabledKey(void)::key, v2);
}

- (void)_setStorageAPIEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setStorageAPIEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_accessHandleEnabled
{
  {
    WebKit::WebPreferencesKey::accessHandleEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::accessHandleEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::accessHandleEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::accessHandleEnabledKey(void)::key, v2);
}

- (void)_setAccessHandleEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAccessHandleEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setNotificationsEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_notificationsEnabled
{
  {
    WebKit::WebPreferencesKey::notificationsEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::notificationsEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::notificationsEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::notificationsEnabledKey(void)::key, v2);
}

- (void)_setNotificationEventEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setNotificationEventEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_notificationEventEnabled
{
  {
    WebKit::WebPreferencesKey::notificationEventEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::notificationEventEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::notificationEventEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::notificationEventEnabledKey(void)::key, v2);
}

- (BOOL)_pushAPIEnabled
{
  {
    WebKit::WebPreferencesKey::pushAPIEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::pushAPIEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::pushAPIEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::pushAPIEnabledKey(void)::key, v2);
}

- (void)_setPushAPIEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setPushAPIEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setModelDocumentEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setModelDocumentEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setRequiresFullscreenToLockScreenOrientation:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setFullscreenRequirementForScreenOrientationLockingEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_requiresFullscreenToLockScreenOrientation
{
  {
    WebKit::WebPreferencesKey::fullscreenRequirementForScreenOrientationLockingEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::fullscreenRequirementForScreenOrientationLockingEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::fullscreenRequirementForScreenOrientationLockingEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::fullscreenRequirementForScreenOrientationLockingEnabledKey(void)::key, v2);
}

- (void)_setInteractionRegionMinimumCornerRadius:(double)a3
{
  double v3 = a3;
  WebKit::WebPreferences::setInteractionRegionMinimumCornerRadius((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (double)_interactionRegionMinimumCornerRadius
{
  {
    WebKit::WebPreferencesKey::interactionRegionMinimumCornerRadiusKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::interactionRegionMinimumCornerRadiusKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::interactionRegionMinimumCornerRadiusKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::interactionRegionMinimumCornerRadiusKey(void)::key);
}

- (void)_setInteractionRegionInlinePadding:(double)a3
{
  double v3 = a3;
  WebKit::WebPreferences::setInteractionRegionInlinePadding((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (double)_interactionRegionInlinePadding
{
  {
    WebKit::WebPreferencesKey::interactionRegionInlinePaddingKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::interactionRegionInlinePaddingKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::interactionRegionInlinePaddingKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::interactionRegionInlinePaddingKey(void)::key);
}

- (void)_setMediaPreferredFullscreenWidth:(double)a3
{
  double v3 = a3;
  WebKit::WebPreferences::setMediaPreferredFullscreenWidth((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (double)_mediaPreferredFullscreenWidth
{
  {
    WebKit::WebPreferencesKey::mediaPreferredFullscreenWidthKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaPreferredFullscreenWidthKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaPreferredFullscreenWidthKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::valueForKey<double>((uint64_t)&self->_preferences.data.__lx[40], (uint64_t)&self[1]._preferences.data.__lx[8], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaPreferredFullscreenWidthKey(void)::key);
}

- (void)_setAppBadgeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAppBadgeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_appBadgeEnabled
{
  {
    WebKit::WebPreferencesKey::appBadgeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::appBadgeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::appBadgeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::appBadgeEnabledKey(void)::key, v2);
}

- (void)_setClientBadgeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setClientBadgeEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_clientBadgeEnabled
{
  {
    WebKit::WebPreferencesKey::clientBadgeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::clientBadgeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::clientBadgeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::clientBadgeEnabledKey(void)::key, v2);
}

- (void)_setVerifyWindowOpenUserGestureFromUIProcess:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setVerifyWindowOpenUserGestureFromUIProcess((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_verifyWindowOpenUserGestureFromUIProcess
{
  {
    WebKit::WebPreferencesKey::verifyWindowOpenUserGestureFromUIProcessKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::verifyWindowOpenUserGestureFromUIProcessKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::verifyWindowOpenUserGestureFromUIProcessKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::verifyWindowOpenUserGestureFromUIProcessKey(void)::key, v2);
}

- (BOOL)_mediaCapabilityGrantsEnabled
{
  {
    WebKit::WebPreferencesKey::mediaCapabilityGrantsEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaCapabilityGrantsEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaCapabilityGrantsEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaCapabilityGrantsEnabledKey(void)::key, v2);
}

- (void)_setMediaCapabilityGrantsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setMediaCapabilityGrantsEnabled((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (void)_setAllowPrivacySensitiveOperationsInNonPersistentDataStores:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setAllowPrivacySensitiveOperationsInNonPersistentDataStores((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_allowPrivacySensitiveOperationsInNonPersistentDataStores
{
  {
    WebKit::WebPreferencesKey::allowPrivacySensitiveOperationsInNonPersistentDataStoresKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::allowPrivacySensitiveOperationsInNonPersistentDataStoresKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::allowPrivacySensitiveOperationsInNonPersistentDataStoresKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::allowPrivacySensitiveOperationsInNonPersistentDataStoresKey(void)::key, v2);
}

- (void)_setVideoFullscreenRequiresElementFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setVideoFullscreenRequiresElementFullscreen((WebKit::WebPreferences *)&self->_preferences, &v3);
}

- (BOOL)_videoFullscreenRequiresElementFullscreen
{
  {
    WebKit::WebPreferencesKey::videoFullscreenRequiresElementFullscreenKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::videoFullscreenRequiresElementFullscreenKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::videoFullscreenRequiresElementFullscreenKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::videoFullscreenRequiresElementFullscreenKey(void)::key, v2);
}

- (BOOL)_spatialVideoEnabled
{
  return 0;
}

- (BOOL)javaScriptEnabled
{
  {
    WebKit::WebPreferencesKey::javaScriptEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::javaScriptEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::javaScriptEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&self->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::javaScriptEnabledKey(void)::key, v2);
}

- (BOOL)_shouldAllowDesignSystemUIFonts
{
  return 1;
}

- (BOOL)_requestAnimationFrameEnabled
{
  return 1;
}

- (BOOL)_subpixelAntialiasedLayerTextEnabled
{
  return 0;
}

- (BOOL)_displayListDrawingEnabled
{
  return 0;
}

- (BOOL)_offlineApplicationCacheIsEnabled
{
  return 0;
}

@end