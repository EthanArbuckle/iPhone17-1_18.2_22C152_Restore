@interface WKWebViewConfiguration
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowMediaContentTypesRequiringHardwareSupportAsFallback;
- (BOOL)_allowTestOnlyIPC;
- (BOOL)_allowTopNavigationToDataURLs;
- (BOOL)_allowUniversalAccessFromFileURLs;
- (BOOL)_allowsInlineMediaPlaybackAfterFullscreen;
- (BOOL)_allowsJavaScriptMarkup;
- (BOOL)_allowsMetaRefresh;
- (BOOL)_alwaysRunsAtForegroundPriority;
- (BOOL)_appHighlightsEnabled;
- (BOOL)_applePayEnabled;
- (BOOL)_attachmentElementEnabled;
- (BOOL)_attachmentWideLayoutEnabled;
- (BOOL)_canShowWhileLocked;
- (BOOL)_clientNavigationsRunAtForegroundPriority;
- (BOOL)_colorFilterEnabled;
- (BOOL)_convertsPositionStyleOnCopy;
- (BOOL)_crossOriginAccessControlCheckEnabled;
- (BOOL)_deferrableUserScriptsShouldWaitUntilNotification;
- (BOOL)_delaysWebProcessLaunchUntilFirstLoad;
- (BOOL)_drawsBackground;
- (BOOL)_ignoresAppBoundDomains;
- (BOOL)_incompleteImageBorderEnabled;
- (BOOL)_initialCapitalizationEnabled;
- (BOOL)_inlineMediaPlaybackRequiresPlaysInlineAttribute;
- (BOOL)_invisibleAutoplayNotPermitted;
- (BOOL)_isControlledByAutomation;
- (BOOL)_legacyEncryptedMediaAPIEnabled;
- (BOOL)_loadsFromNetwork;
- (BOOL)_loadsSubresources;
- (BOOL)_longPressActionsEnabled;
- (BOOL)_mainContentUserGestureOverrideEnabled;
- (BOOL)_markedTextInputEnabled;
- (BOOL)_mediaCaptureEnabled;
- (BOOL)_mediaDataLoadsAutomatically;
- (BOOL)_multiRepresentationHEICInsertionEnabled;
- (BOOL)_needsStorageAccessFromFileURLsQuirk;
- (BOOL)_printsBackgrounds;
- (BOOL)_requiresUserActionForAudioPlayback;
- (BOOL)_requiresUserActionForVideoPlayback;
- (BOOL)_respectsImageOrientation;
- (BOOL)_scrollToTextFragmentIndicatorEnabled;
- (BOOL)_scrollToTextFragmentMarkingEnabled;
- (BOOL)_shouldDecidePolicyBeforeLoadingQuickLookPreview;
- (BOOL)_shouldDeferAsynchronousScriptsUntilAfterDocumentLoad;
- (BOOL)_shouldRelaxThirdPartyCookieBlocking;
- (BOOL)_systemPreviewEnabled;
- (BOOL)_textInteractionGesturesEnabled;
- (BOOL)_undoManagerAPIEnabled;
- (BOOL)_waitsForPaintAfterViewDidMoveToWindow;
- (BOOL)allowsAirPlayForMediaPlayback;
- (BOOL)allowsInlineMediaPlayback;
- (BOOL)allowsInlinePredictions;
- (BOOL)allowsPictureInPictureMediaPlayback;
- (BOOL)ignoresViewportScaleLimits;
- (BOOL)limitsNavigationsToAppBoundDomains;
- (BOOL)requiresUserActionForMediaPlayback;
- (BOOL)suppressesIncrementalRendering;
- (BOOL)upgradeKnownHostsToHTTPS;
- (Class)_attachmentFileWrapperClass;
- (NSArray)_additionalSupportedImageTypes;
- (NSArray)_corsDisablingPatterns;
- (NSArray)_portsForUpgradingInsecureSchemeForTesting;
- (NSSet)_allowedNetworkHosts;
- (NSSet)_maskedURLSchemes;
- (NSString)_applicationNameForDesktopUserAgent;
- (NSString)_attributedBundleIdentifier;
- (NSString)_groupIdentifier;
- (NSString)_mediaContentTypesRequiringHardwareSupport;
- (NSString)_overrideContentSecurityPolicy;
- (NSString)_processDisplayName;
- (NSString)applicationNameForUserAgent;
- (NSString)description;
- (NSURL)_requiredWebExtensionBaseURL;
- (Object)_apiObject;
- (WKAudiovisualMediaTypes)mediaTypesRequiringUserActionForPlayback;
- (WKDataDetectorTypes)dataDetectorTypes;
- (WKPreferences)preferences;
- (WKProcessPool)processPool;
- (WKSelectionGranularity)selectionGranularity;
- (WKUserContentController)userContentController;
- (WKWebExtensionController)_strongWebExtensionController;
- (WKWebExtensionController)_weakWebExtensionController;
- (WKWebExtensionController)webExtensionController;
- (WKWebView)_alternateWebViewForNavigationGestures;
- (WKWebView)_relatedWebView;
- (WKWebView)_webViewToCloneSessionStorageFrom;
- (WKWebViewConfiguration)init;
- (WKWebViewConfiguration)initWithCoder:(id)a3;
- (WKWebpagePreferences)defaultWebpagePreferences;
- (WKWebsiteDataStore)_websiteDataStoreIfExists;
- (WKWebsiteDataStore)websiteDataStore;
- (_UIClickInteractionDriving)_clickInteractionDriverForTesting;
- (_WKApplicationManifest)_applicationManifest;
- (_WKVisitedLinkStore)_visitedLinkStore;
- (double)_incrementalRenderingSuppressionTimeout;
- (double)_sampledPageTopColorMaxDifference;
- (double)_sampledPageTopColorMinHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)urlSchemeHandlerForURLScheme:(NSString *)urlScheme;
- (id)valueForKey:(id)a3;
- (int64_t)writingToolsBehavior;
- (unint64_t)_appInitiatedOverrideValueForTesting;
- (unint64_t)_contentSecurityPolicyModeForExtension;
- (unint64_t)_dragLiftDelay;
- (void)_setAdditionalSupportedImageTypes:(id)a3;
- (void)_setAllowMediaContentTypesRequiringHardwareSupportAsFallback:(BOOL)a3;
- (void)_setAllowTestOnlyIPC:(BOOL)a3;
- (void)_setAllowTopNavigationToDataURLs:(BOOL)a3;
- (void)_setAllowUniversalAccessFromFileURLs:(BOOL)a3;
- (void)_setAllowedNetworkHosts:(id)a3;
- (void)_setAllowsInlineMediaPlaybackAfterFullscreen:(BOOL)a3;
- (void)_setAllowsJavaScriptMarkup:(BOOL)a3;
- (void)_setAllowsMetaRefresh:(BOOL)a3;
- (void)_setAlternateWebViewForNavigationGestures:(id)a3;
- (void)_setAlwaysRunsAtForegroundPriority:(BOOL)a3;
- (void)_setAppHighlightsEnabled:(BOOL)a3;
- (void)_setAppInitiatedOverrideValueForTesting:(unint64_t)a3;
- (void)_setApplePayEnabled:(BOOL)a3;
- (void)_setApplicationManifest:(id)a3;
- (void)_setAttachmentElementEnabled:(BOOL)a3;
- (void)_setAttachmentFileWrapperClass:(Class)a3;
- (void)_setAttachmentWideLayoutEnabled:(BOOL)a3;
- (void)_setAttributedBundleIdentifier:(id)a3;
- (void)_setCORSDisablingPatterns:(id)a3;
- (void)_setCanShowWhileLocked:(BOOL)a3;
- (void)_setClickInteractionDriverForTesting:(id)a3;
- (void)_setClientNavigationsRunAtForegroundPriority:(BOOL)a3;
- (void)_setColorFilterEnabled:(BOOL)a3;
- (void)_setContentSecurityPolicyModeForExtension:(unint64_t)a3;
- (void)_setControlledByAutomation:(BOOL)a3;
- (void)_setConvertsPositionStyleOnCopy:(BOOL)a3;
- (void)_setCrossOriginAccessControlCheckEnabled:(BOOL)a3;
- (void)_setDeferrableUserScriptsShouldWaitUntilNotification:(BOOL)a3;
- (void)_setDelaysWebProcessLaunchUntilFirstLoad:(BOOL)a3;
- (void)_setDragLiftDelay:(unint64_t)a3;
- (void)_setDrawsBackground:(BOOL)a3;
- (void)_setGroupIdentifier:(id)a3;
- (void)_setIgnoresAppBoundDomains:(BOOL)a3;
- (void)_setIncompleteImageBorderEnabled:(BOOL)a3;
- (void)_setIncrementalRenderingSuppressionTimeout:(double)a3;
- (void)_setInitialCapitalizationEnabled:(BOOL)a3;
- (void)_setInlineMediaPlaybackRequiresPlaysInlineAttribute:(BOOL)a3;
- (void)_setInvisibleAutoplayNotPermitted:(BOOL)a3;
- (void)_setLegacyEncryptedMediaAPIEnabled:(BOOL)a3;
- (void)_setLoadsFromNetwork:(BOOL)a3;
- (void)_setLoadsSubresources:(BOOL)a3;
- (void)_setLongPressActionsEnabled:(BOOL)a3;
- (void)_setMainContentUserGestureOverrideEnabled:(BOOL)a3;
- (void)_setMarkedTextInputEnabled:(BOOL)a3;
- (void)_setMaskedURLSchemes:(id)a3;
- (void)_setMediaCaptureEnabled:(BOOL)a3;
- (void)_setMediaContentTypesRequiringHardwareSupport:(id)a3;
- (void)_setMediaDataLoadsAutomatically:(BOOL)a3;
- (void)_setMultiRepresentationHEICInsertionEnabled:(BOOL)a3;
- (void)_setNeedsStorageAccessFromFileURLsQuirk:(BOOL)a3;
- (void)_setOverrideContentSecurityPolicy:(id)a3;
- (void)_setPortsForUpgradingInsecureSchemeForTesting:(id)a3;
- (void)_setPrintsBackgrounds:(BOOL)a3;
- (void)_setProcessDisplayName:(id)a3;
- (void)_setRelatedWebView:(id)a3;
- (void)_setRequiredWebExtensionBaseURL:(id)a3;
- (void)_setRequiresUserActionForAudioPlayback:(BOOL)a3;
- (void)_setRequiresUserActionForVideoPlayback:(BOOL)a3;
- (void)_setRespectsImageOrientation:(BOOL)a3;
- (void)_setSampledPageTopColorMaxDifference:(double)a3;
- (void)_setSampledPageTopColorMinHeight:(double)a3;
- (void)_setScrollToTextFragmentIndicatorEnabled:(BOOL)a3;
- (void)_setScrollToTextFragmentMarkingEnabled:(BOOL)a3;
- (void)_setShouldDecidePolicyBeforeLoadingQuickLookPreview:(BOOL)a3;
- (void)_setShouldDeferAsynchronousScriptsUntilAfterDocumentLoad:(BOOL)a3;
- (void)_setShouldRelaxThirdPartyCookieBlocking:(BOOL)a3;
- (void)_setSystemPreviewEnabled:(BOOL)a3;
- (void)_setTextInteractionGesturesEnabled:(BOOL)a3;
- (void)_setUndoManagerAPIEnabled:(BOOL)a3;
- (void)_setVisitedLinkStore:(id)a3;
- (void)_setWaitsForPaintAfterViewDidMoveToWindow:(BOOL)a3;
- (void)_setWeakWebExtensionController:(id)a3;
- (void)_setWebViewToCloneSessionStorageFrom:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsAirPlayForMediaPlayback:(BOOL)allowsAirPlayForMediaPlayback;
- (void)setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback;
- (void)setAllowsInlinePredictions:(BOOL)allowsInlinePredictions;
- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)allowsPictureInPictureMediaPlayback;
- (void)setApplicationNameForUserAgent:(NSString *)applicationNameForUserAgent;
- (void)setDataDetectorTypes:(WKDataDetectorTypes)dataDetectorTypes;
- (void)setDefaultWebpagePreferences:(WKWebpagePreferences *)defaultWebpagePreferences;
- (void)setIgnoresViewportScaleLimits:(BOOL)ignoresViewportScaleLimits;
- (void)setLimitsNavigationsToAppBoundDomains:(BOOL)limitsNavigationsToAppBoundDomains;
- (void)setMediaTypesRequiringUserActionForPlayback:(WKAudiovisualMediaTypes)mediaTypesRequiringUserActionForPlayback;
- (void)setPreferences:(WKPreferences *)preferences;
- (void)setProcessPool:(WKProcessPool *)processPool;
- (void)setRequiresUserActionForMediaPlayback:(BOOL)requiresUserActionForMediaPlayback;
- (void)setSelectionGranularity:(WKSelectionGranularity)selectionGranularity;
- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering;
- (void)setURLSchemeHandler:(id)urlSchemeHandler forURLScheme:(NSString *)urlScheme;
- (void)setUpgradeKnownHostsToHTTPS:(BOOL)upgradeKnownHostsToHTTPS;
- (void)setUserContentController:(WKUserContentController *)userContentController;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setWebExtensionController:(id)a3;
- (void)setWebsiteDataStore:(WKWebsiteDataStore *)websiteDataStore;
- (void)setWritingToolsBehavior:(int64_t)a3;
@end

@implementation WKWebViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  API::PageConfiguration::Data::operator=((uint64_t)v4 + 24, (uint64_t)&self->_pageConfiguration.data.__lx[16]);
  return v4;
}

- (WKWebpagePreferences)defaultWebpagePreferences
{
  return (WKWebpagePreferences *)*((void *)API::PageConfiguration::Data::LazyInitializedRef<API::WebsitePolicies,&API::PageConfiguration::Data::createWebsitePolicies>::get((API::WebsitePolicies **)&self[1]._pageConfiguration)
                                 + 1);
}

- (WKWebViewConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)WKWebViewConfiguration;
  v2 = [(WKWebViewConfiguration *)&v5 init];
  v3 = v2;
  if (v2) {
    *((void *)API::PageConfiguration::PageConfiguration((API::PageConfiguration *)[(WKWebViewConfiguration *)v2 _apiObject])+ 1) = v2;
  }
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_pageConfiguration;
}

- (void)_setSystemPreviewEnabled:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[10] = a3;
}

- (void)_setSampledPageTopColorMinHeight:(double)a3
{
  *(double *)&self[8]._pageConfiguration.data.__lx[32] = a3;
}

- (void)_setSampledPageTopColorMaxDifference:(double)a3
{
  *(double *)&self[8]._pageConfiguration.data.__lx[24] = a3;
}

- (void)_setNeedsStorageAccessFromFileURLsQuirk:(BOOL)a3
{
  BYTE5(self[9].super.isa) = a3;
}

- (void)_setMediaDataLoadsAutomatically:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[3] = a3;
}

- (void)_setMainContentUserGestureOverrideEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[4] = a3;
}

- (void)_setLegacyEncryptedMediaAPIEnabled:(BOOL)a3
{
  BYTE6(self[9].super.isa) = a3;
}

- (void)_setInvisibleAutoplayNotPermitted:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[5] = a3;
}

- (void)_setInlineMediaPlaybackRequiresPlaysInlineAttribute:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[1] = a3;
}

- (void)_setDrawsBackground:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[14] = a3;
}

- (void)_setCrossOriginAccessControlCheckEnabled:(BOOL)a3
{
  self[6]._pageConfiguration.data.__lx[34] = a3;
}

- (void)_setControlledByAutomation:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[15] = a3;
}

- (void)_setApplePayEnabled:(BOOL)a3
{
  self[7]._pageConfiguration.data.__lx[39] = a3;
}

- (void)_setAppHighlightsEnabled:(BOOL)a3
{
  self[7]._pageConfiguration.data.__lx[40] = a3;
}

- (void)setMediaTypesRequiringUserActionForPlayback:(WKAudiovisualMediaTypes)mediaTypesRequiringUserActionForPlayback
{
  *(void *)&self[5]._pageConfiguration.data.__lx[40] = mediaTypesRequiringUserActionForPlayback;
}

- (void)setIgnoresViewportScaleLimits:(BOOL)ignoresViewportScaleLimits
{
  self[7]._pageConfiguration.data.__lx[37] = ignoresViewportScaleLimits;
}

- (void)setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback
{
  self[4]._pageConfiguration.data.__lx[0] = allowsInlineMediaPlayback;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    *(void *)self->_pageConfiguration.data.__lx = &unk_1EE9E0628;
    API::PageConfiguration::Data::~Data((API::PageConfiguration::Data *)&self->_pageConfiguration.data.__lx[16], v4);
    v5.receiver = self;
    v5.super_class = (Class)WKWebViewConfiguration;
    [(WKWebViewConfiguration *)&v5 dealloc];
  }
}

- (void)setApplicationNameForUserAgent:(NSString *)applicationNameForUserAgent
{
  MEMORY[0x19972EAD0](&v6, applicationNameForUserAgent);
  char v7 = 1;
  std::__optional_storage_base<WTF::String,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::String,false>>((uint64_t)&self[8]._pageConfiguration.data.__lx[8], (uint64_t)&v6);
  if (v7)
  {
    objc_super v5 = v6;
    v6 = 0;
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
}

- (BOOL)_systemPreviewEnabled
{
  return self[4]._pageConfiguration.data.__lx[10];
}

- (_UIClickInteractionDriving)_clickInteractionDriverForTesting
{
  return self[4].super.isa;
}

- (BOOL)_textInteractionGesturesEnabled
{
  return self[4]._pageConfiguration.data.__lx[8];
}

- (BOOL)allowsInlinePredictions
{
  return self[9]._pageConfiguration.data.__lx[8];
}

- (void)_setDragLiftDelay:(unint64_t)a3
{
  unsigned __int8 v3 = 2 * (a3 == 2);
  if (a3 == 1) {
    unsigned __int8 v3 = 1;
  }
  self[4]._pageConfiguration.data.__lx[4] = v3;
}

- (WKPreferences)preferences
{
  return (WKPreferences *)*((void *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)&self->_pageConfiguration.data.__lx[40])
                          + 1);
}

- (WKWebView)_relatedWebView
{
  uint64_t v2 = *(void *)&self[2]._pageConfiguration.data.__lx[24];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(v3 - 8));
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (id)CFMakeCollectable(cf);
  CFRelease(*(CFTypeRef *)(v3 - 8));
  return v4;
}

- (WKWebsiteDataStore)websiteDataStore
{
  return (WKWebsiteDataStore *)*((void *)API::PageConfiguration::websiteDataStore((API::PageConfiguration *)&self->_pageConfiguration)
                               + 1);
}

- (WKWebView)_webViewToCloneSessionStorageFrom
{
  uint64_t v2 = *(void *)&self[3]._pageConfiguration.data.__lx[24];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(v3 - 8));
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (id)CFMakeCollectable(cf);
  CFRelease(*(CFTypeRef *)(v3 - 8));
  return v4;
}

- (BOOL)_waitsForPaintAfterViewDidMoveToWindow
{
  return self[4]._pageConfiguration.data.__lx[13];
}

- (BOOL)_undoManagerAPIEnabled
{
  return self[9]._pageConfiguration.data.__lx[3];
}

- (BOOL)_shouldDeferAsynchronousScriptsUntilAfterDocumentLoad
{
  return self[9]._pageConfiguration.data.__lx[2];
}

- (BOOL)_shouldDecidePolicyBeforeLoadingQuickLookPreview
{
  return self[4]._pageConfiguration.data.__lx[11];
}

- (BOOL)_scrollToTextFragmentMarkingEnabled
{
  return self[9]._pageConfiguration.data.__lx[10];
}

- (BOOL)_scrollToTextFragmentIndicatorEnabled
{
  return self[9]._pageConfiguration.data.__lx[9];
}

- (double)_sampledPageTopColorMinHeight
{
  return *(double *)&self[8]._pageConfiguration.data.__lx[32];
}

- (double)_sampledPageTopColorMaxDifference
{
  return *(double *)&self[8]._pageConfiguration.data.__lx[24];
}

- (BOOL)_needsStorageAccessFromFileURLsQuirk
{
  return BYTE5(self[9].super.isa);
}

- (BOOL)_mediaDataLoadsAutomatically
{
  return self[4]._pageConfiguration.data.__lx[3];
}

- (NSString)_mediaContentTypesRequiringHardwareSupport
{
  if (*(void *)self[8]._pageConfiguration.data.__lx) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (BOOL)_mainContentUserGestureOverrideEnabled
{
  return self[9]._pageConfiguration.data.__lx[4];
}

- (BOOL)_legacyEncryptedMediaAPIEnabled
{
  return BYTE6(self[9].super.isa);
}

- (BOOL)_isControlledByAutomation
{
  return self[4]._pageConfiguration.data.__lx[15];
}

- (BOOL)_invisibleAutoplayNotPermitted
{
  return self[9]._pageConfiguration.data.__lx[5];
}

- (BOOL)_inlineMediaPlaybackRequiresPlaysInlineAttribute
{
  return self[4]._pageConfiguration.data.__lx[1];
}

- (double)_incrementalRenderingSuppressionTimeout
{
  return *(double *)&self[8]._pageConfiguration.data.__lx[40];
}

- (BOOL)_incompleteImageBorderEnabled
{
  return self[9]._pageConfiguration.data.__lx[1];
}

- (NSString)_groupIdentifier
{
  result = (NSString *)self[8].super.isa;
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (BOOL)_drawsBackground
{
  return self[4]._pageConfiguration.data.__lx[14];
}

- (BOOL)_convertsPositionStyleOnCopy
{
  return BYTE1(self[9].super.isa);
}

- (BOOL)_colorFilterEnabled
{
  return self[9]._pageConfiguration.data.__lx[0];
}

- (BOOL)_attachmentWideLayoutEnabled
{
  return self[9]._pageConfiguration.data.__lx[7];
}

- (BOOL)_attachmentElementEnabled
{
  return self[9]._pageConfiguration.data.__lx[6];
}

- (BOOL)_applePayEnabled
{
  return self[7]._pageConfiguration.data.__lx[39];
}

- (BOOL)_appHighlightsEnabled
{
  return self[7]._pageConfiguration.data.__lx[40];
}

- (BOOL)_allowsMetaRefresh
{
  return BYTE2(self[9].super.isa);
}

- (BOOL)_allowsJavaScriptMarkup
{
  return (BOOL)self[9].super.isa;
}

- (BOOL)_allowsInlineMediaPlaybackAfterFullscreen
{
  return self[4]._pageConfiguration.data.__lx[2];
}

- (BOOL)_allowUniversalAccessFromFileURLs
{
  return BYTE3(self[9].super.isa);
}

- (BOOL)_allowTopNavigationToDataURLs
{
  return BYTE4(self[9].super.isa);
}

- (BOOL)_allowTestOnlyIPC
{
  return self[4]._pageConfiguration.data.__lx[16];
}

- (BOOL)_allowMediaContentTypesRequiringHardwareSupportAsFallback
{
  return HIBYTE(self[9].super.isa);
}

- (NSArray)_additionalSupportedImageTypes
{
  if (!self[5]._pageConfiguration.data.__lx[24]) {
    return 0;
  }
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self[5]._pageConfiguration.data.__lx[8], (uint64_t *)&cf);
  CFTypeRef v2 = cf;
  CFTypeRef cf = 0;
  uint64_t v3 = (id)CFMakeCollectable(v2);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  return v3;
}

- (WKUserContentController)userContentController
{
  return (WKUserContentController *)*((void *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebUserContentControllerProxy,&API::PageConfiguration::Data::createWebUserContentControllerProxy>::get((WebKit::WebUserContentControllerProxy **)&self->_pageConfiguration.data.__lx[32])
                                    + 1);
}

- (BOOL)suppressesIncrementalRendering
{
  return self[7]._pageConfiguration.data.__lx[36];
}

- (WKAudiovisualMediaTypes)mediaTypesRequiringUserActionForPlayback
{
  return *(void *)&self[5]._pageConfiguration.data.__lx[40];
}

- (WKDataDetectorTypes)dataDetectorTypes
{
  return self[4]._pageConfiguration.data.__lx[5] & 0x7F;
}

- (BOOL)allowsPictureInPictureMediaPlayback
{
  return self[4]._pageConfiguration.data.__lx[7];
}

- (BOOL)allowsInlineMediaPlayback
{
  return self[4]._pageConfiguration.data.__lx[0];
}

- (BOOL)allowsAirPlayForMediaPlayback
{
  return self[7]._pageConfiguration.data.__lx[38];
}

- (WKWebExtensionController)_weakWebExtensionController
{
  uint64_t v2 = *(void *)&self[2]._pageConfiguration.data.__lx[8];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0) {
    return *(WKWebExtensionController **)(v3 - 8);
  }
  else {
    return 0;
  }
}

- (_WKVisitedLinkStore)_visitedLinkStore
{
  return (_WKVisitedLinkStore *)*((void *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::VisitedLinkStore,&API::PageConfiguration::Data::createVisitedLinkStore>::get(&self[1].super.isa)
                                + 1);
}

- (WKWebExtensionController)_strongWebExtensionController
{
  uint64_t v2 = *(void *)self[2]._pageConfiguration.data.__lx;
  if (v2) {
    return *(WKWebExtensionController **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (void)_setMaskedURLSchemes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(a3);
        }
        MEMORY[0x19972EAD0](&v16, *(void *)(*((void *)&v17 + 1) + 8 * i));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v21, &v16, v9, (uint64_t)&v15);
        v11 = v16;
        v16 = 0;
        if (v11)
        {
          if (*(_DWORD *)v11 == 2) {
            WTF::StringImpl::destroy(v11, v10);
          }
          else {
            *(_DWORD *)v11 -= 2;
          }
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
    v12 = v21;
  }
  else
  {
    v12 = 0;
  }
  self[6]._pageConfiguration.data.__lx[32] = 1;
  v21 = 0;
  v13 = *(WTF::StringImpl ***)&self[6]._pageConfiguration.data.__lx[24];
  *(void *)&self[6]._pageConfiguration.data.__lx[24] = v12;
  if (v13)
  {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v13, v5);
    if (v21) {
      WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v21, v14);
    }
  }
}

- (void)setWebsiteDataStore:(WKWebsiteDataStore *)websiteDataStore
{
  if (websiteDataStore)
  {
    p_websiteDataStore = &websiteDataStore->_websiteDataStore;
    CFRetain(*(CFTypeRef *)&websiteDataStore->_websiteDataStore.data.__lx[8]);
  }
  else
  {
    p_websiteDataStore = 0;
  }
  uint64_t v5 = *(void *)&self[1]._pageConfiguration.data.__lx[8];
  *(void *)&self[1]._pageConfiguration.data.__lx[8] = p_websiteDataStore;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (void)setUserContentController:(WKUserContentController *)userContentController
{
  if (userContentController)
  {
    p_userContentControllerProxy = &userContentController->_userContentControllerProxy;
    CFRetain(*(CFTypeRef *)&userContentController->_userContentControllerProxy.data.__lx[8]);
  }
  else
  {
    p_userContentControllerProxy = 0;
  }
  uint64_t v5 = *(void *)&self->_pageConfiguration.data.__lx[32];
  *(void *)&self->_pageConfiguration.data.__lx[32] = p_userContentControllerProxy;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (void)setProcessPool:(WKProcessPool *)processPool
{
  if (processPool)
  {
    p_processPool = &processPool->_processPool;
    CFRetain(*(CFTypeRef *)&processPool->_processPool.data.__lx[8]);
  }
  else
  {
    p_processPool = 0;
  }
  uint64_t v5 = *(void *)&self->_pageConfiguration.data.__lx[24];
  *(void *)&self->_pageConfiguration.data.__lx[24] = p_processPool;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (void)setPreferences:(WKPreferences *)preferences
{
  if (preferences)
  {
    p_preferences = &preferences->_preferences;
    CFRetain(*(CFTypeRef *)&preferences->_preferences.data.__lx[8]);
  }
  else
  {
    p_preferences = 0;
  }
  uint64_t v5 = *(void *)&self->_pageConfiguration.data.__lx[40];
  *(void *)&self->_pageConfiguration.data.__lx[40] = p_preferences;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (void)_setVisitedLinkStore:(id)a3
{
  if (a3)
  {
    CFTypeRef v4 = (objc_class *)((char *)a3 + 8);
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  Class isa = self[1].super.isa;
  self[1].super.Class isa = v4;
  if (isa)
  {
    uint64_t v6 = (const void *)*((void *)isa + 1);
    CFRelease(v6);
  }
}

- (WKWebView)_alternateWebViewForNavigationGestures
{
  uint64_t v2 = *(void *)&self[3]._pageConfiguration.data.__lx[32];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  CFRetain(*(CFTypeRef *)(v3 - 8));
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  CFTypeRef v4 = (id)CFMakeCollectable(cf);
  CFRelease(*(CFTypeRef *)(v3 - 8));
  return v4;
}

- (void)setWebExtensionController:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 _webExtensionController];
    CFRetain(*(CFTypeRef *)(v4 + 8));
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)self[2]._pageConfiguration.data.__lx;
  *(void *)self[2]._pageConfiguration.data.__lx = v4;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (WKProcessPool)processPool
{
  return *(WKProcessPool **)(API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)&self->_pageConfiguration.data.__lx[24])
                           + 8);
}

- (BOOL)ignoresViewportScaleLimits
{
  return self[7]._pageConfiguration.data.__lx[37];
}

- (NSString)applicationNameForUserAgent
{
  if (self[8]._pageConfiguration.data.__lx[16])
  {
    uint64_t v2 = *(WTF::StringImpl **)&self[8]._pageConfiguration.data.__lx[8];
    if (v2) {
      *(_DWORD *)v2 += 2;
    }
    uint64_t v7 = v2;
    if (v2) {
      goto LABEL_5;
    }
    return 0;
  }
  MEMORY[0x19972EAD0](&v7, @"Mobile/15E148");
  if (!v7) {
    return 0;
  }
LABEL_5:
  uint64_t v4 = (NSString *)WTF::StringImpl::operator NSString *();
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  return v4;
}

- (NSString)_applicationNameForDesktopUserAgent
{
  if (!self[8]._pageConfiguration.data.__lx[16]) {
    return 0;
  }
  uint64_t v2 = *(WTF::StringImpl **)&self[8]._pageConfiguration.data.__lx[8];
  if (!v2) {
    return 0;
  }
  *(_DWORD *)v2 += 2;
  uint64_t v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (void)_setGroupIdentifier:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  uint64_t v5 = v9;
  v9 = 0;
  Class isa = self[8].super.isa;
  self[8].super.Class isa = v5;
  if (isa)
  {
    int v7 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v4);
      Class isa = v9;
      v9 = 0;
      if (!isa) {
        return;
      }
      int v7 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v8);
        return;
      }
    }
    *(_DWORD *)Class isa = v7;
  }
}

- (void)_setShouldRelaxThirdPartyCookieBlocking:(BOOL)a3
{
  WebCore::applicationBundleIdentifier((uint64_t *)&v10, (WebCore *)self);
  int v6 = MEMORY[0x19972E990](v10, "com.apple.WebKit.TestWebKitAPI", 30);
  int v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      int v7 = (WTF::StringImpl *)WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  isMobileSafaruint64_t i = (WebCore::IOSApplication *)WebCore::IOSApplication::isMobileSafari(v7);
  if (isMobileSafari) {
    int isSafariViewService = 1;
  }
  else {
    int isSafariViewService = WebCore::IOSApplication::isSafariViewService(isMobileSafari);
  }
  if (!(isSafariViewService | v6 | *(_DWORD *)&self[1]._pageConfiguration.data.__lx[24] & 1)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28790] format:@"_shouldRelaxThirdPartyCookieBlocking may only be used by Safari."];
  }
  self[9]._pageConfiguration.data.__lx[12] = a3;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWebViewConfiguration accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebViewConfiguration accessInstanceVariablesDirectly]::didLogFault = 1;
    uint64_t v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)setAllowsInlinePredictions:(BOOL)allowsInlinePredictions
{
  self[9]._pageConfiguration.data.__lx[8] = allowsInlinePredictions;
}

- (WKSelectionGranularity)selectionGranularity
{
  return (unint64_t)self[4]._pageConfiguration.data.__lx[6];
}

- (void)setSelectionGranularity:(WKSelectionGranularity)selectionGranularity
{
  self[4]._pageConfiguration.data.__lx[6] = selectionGranularity == WKSelectionGranularityCharacter;
}

- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)allowsPictureInPictureMediaPlayback
{
  self[4]._pageConfiguration.data.__lx[7] = allowsPictureInPictureMediaPlayback;
}

- (void)setDataDetectorTypes:(WKDataDetectorTypes)dataDetectorTypes
{
  self[4]._pageConfiguration.data.__lx[5] = dataDetectorTypes & 0x7F;
}

- (NSString)description
{
  char v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; processPool = %@; preferences = %@>",
                       NSStringFromClass(v4),
                       self,
                       [(WKWebViewConfiguration *)self processPool],
                       [(WKWebViewConfiguration *)self preferences]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebViewConfiguration processPool](self, "processPool"), @"processPool");
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebViewConfiguration preferences](self, "preferences"), @"preferences");
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebViewConfiguration userContentController](self, "userContentController"), @"userContentController");
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebViewConfiguration websiteDataStore](self, "websiteDataStore"), @"websiteDataStore");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration suppressesIncrementalRendering](self, "suppressesIncrementalRendering"), @"suppressesIncrementalRendering");
  if (self[8]._pageConfiguration.data.__lx[16])
  {
    if (*(void *)&self[8]._pageConfiguration.data.__lx[8]) {
      uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v5 = &stru_1EEA10550;
    }
    [a3 encodeObject:v5 forKey:@"applicationNameForUserAgent"];
  }
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration allowsAirPlayForMediaPlayback](self, "allowsAirPlayForMediaPlayback"), @"allowsAirPlayForMediaPlayback");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _drawsBackground](self, "_drawsBackground"), @"drawsBackground");
  objc_msgSend(a3, "encodeInteger:forKey:", -[WKWebViewConfiguration dataDetectorTypes](self, "dataDetectorTypes"), @"dataDetectorTypes");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration allowsInlineMediaPlayback](self, "allowsInlineMediaPlayback"), @"allowsInlineMediaPlayback");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _allowsInlineMediaPlaybackAfterFullscreen](self, "_allowsInlineMediaPlaybackAfterFullscreen"), @"allowsInlineMediaPlaybackAfterFullscreen");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration mediaTypesRequiringUserActionForPlayback](self, "mediaTypesRequiringUserActionForPlayback") != 0, @"mediaTypesRequiringUserActionForPlayback");
  objc_msgSend(a3, "encodeInteger:forKey:", -[WKWebViewConfiguration selectionGranularity](self, "selectionGranularity"), @"selectionGranularity");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration allowsPictureInPictureMediaPlayback](self, "allowsPictureInPictureMediaPlayback"), @"allowsPictureInPictureMediaPlayback");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration ignoresViewportScaleLimits](self, "ignoresViewportScaleLimits"), @"ignoresViewportScaleLimits");
  objc_msgSend(a3, "encodeInteger:forKey:", -[WKWebViewConfiguration _dragLiftDelay](self, "_dragLiftDelay"), @"dragLiftDelay");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _textInteractionGesturesEnabled](self, "_textInteractionGesturesEnabled"), @"textInteractionGesturesEnabled");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _longPressActionsEnabled](self, "_longPressActionsEnabled"), @"longPressActionsEnabled");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _systemPreviewEnabled](self, "_systemPreviewEnabled"), @"systemPreviewEnabled");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _shouldDecidePolicyBeforeLoadingQuickLookPreview](self, "_shouldDecidePolicyBeforeLoadingQuickLookPreview"), @"shouldDecidePolicyBeforeLoadingQuickLookPreview");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _scrollToTextFragmentIndicatorEnabled](self, "_scrollToTextFragmentIndicatorEnabled"), @"scrollToTextFragmentIndicatorEnabled");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _scrollToTextFragmentMarkingEnabled](self, "_scrollToTextFragmentMarkingEnabled"), @"scrollToTextFragmentMarkingEnabled");
  BOOL v6 = [(WKWebViewConfiguration *)self _multiRepresentationHEICInsertionEnabled];

  [a3 encodeBool:v6 forKey:@"multiRepresentationHEICInsertionEnabled"];
}

- (WKWebViewConfiguration)initWithCoder:(id)a3
{
  uint64_t v4 = [(WKWebViewConfiguration *)self init];
  if (v4)
  {
    -[WKWebViewConfiguration setProcessPool:](v4, "setProcessPool:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"processPool"]);
    -[WKWebViewConfiguration setPreferences:](v4, "setPreferences:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"preferences"]);
    -[WKWebViewConfiguration setUserContentController:](v4, "setUserContentController:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"userContentController"]);
    -[WKWebViewConfiguration setWebsiteDataStore:](v4, "setWebsiteDataStore:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"websiteDataStore"]);
    -[WKWebViewConfiguration setSuppressesIncrementalRendering:](v4, "setSuppressesIncrementalRendering:", [a3 decodeBoolForKey:@"suppressesIncrementalRendering"]);
    if ([a3 containsValueForKey:@"applicationNameForUserAgent"]) {
      -[WKWebViewConfiguration setApplicationNameForUserAgent:](v4, "setApplicationNameForUserAgent:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"applicationNameForUserAgent"]);
    }
    -[WKWebViewConfiguration setAllowsAirPlayForMediaPlayback:](v4, "setAllowsAirPlayForMediaPlayback:", [a3 decodeBoolForKey:@"allowsAirPlayForMediaPlayback"]);
    if ([a3 containsValueForKey:@"drawsBackground"]) {
      -[WKWebViewConfiguration _setDrawsBackground:](v4, "_setDrawsBackground:", [a3 decodeBoolForKey:@"drawsBackground"]);
    }
    -[WKWebViewConfiguration setDataDetectorTypes:](v4, "setDataDetectorTypes:", [a3 decodeIntegerForKey:@"dataDetectorTypes"]);
    -[WKWebViewConfiguration setAllowsInlineMediaPlayback:](v4, "setAllowsInlineMediaPlayback:", [a3 decodeBoolForKey:@"allowsInlineMediaPlayback"]);
    -[WKWebViewConfiguration _setAllowsInlineMediaPlaybackAfterFullscreen:](v4, "_setAllowsInlineMediaPlaybackAfterFullscreen:", [a3 decodeBoolForKey:@"allowsInlineMediaPlaybackAfterFullscreen"]);
    -[WKWebViewConfiguration setMediaTypesRequiringUserActionForPlayback:](v4, "setMediaTypesRequiringUserActionForPlayback:", [a3 decodeBoolForKey:@"mediaTypesRequiringUserActionForPlayback"]);
    unint64_t v5 = [a3 decodeIntegerForKey:@"selectionGranularity"];
    if (v5 <= 1) {
      [(WKWebViewConfiguration *)v4 setSelectionGranularity:v5];
    }
    -[WKWebViewConfiguration setAllowsPictureInPictureMediaPlayback:](v4, "setAllowsPictureInPictureMediaPlayback:", [a3 decodeBoolForKey:@"allowsPictureInPictureMediaPlayback"]);
    -[WKWebViewConfiguration setIgnoresViewportScaleLimits:](v4, "setIgnoresViewportScaleLimits:", [a3 decodeBoolForKey:@"ignoresViewportScaleLimits"]);
    uint64_t v6 = [a3 decodeIntegerForKey:@"dragLiftDelay"];
    if (v6 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2 * (v6 == 2);
    }
    [(WKWebViewConfiguration *)v4 _setDragLiftDelay:v7];
    -[WKWebViewConfiguration _setTextInteractionGesturesEnabled:](v4, "_setTextInteractionGesturesEnabled:", [a3 decodeBoolForKey:@"textInteractionGesturesEnabled"]);
    -[WKWebViewConfiguration _setLongPressActionsEnabled:](v4, "_setLongPressActionsEnabled:", [a3 decodeBoolForKey:@"longPressActionsEnabled"]);
    -[WKWebViewConfiguration _setSystemPreviewEnabled:](v4, "_setSystemPreviewEnabled:", [a3 decodeBoolForKey:@"systemPreviewEnabled"]);
    -[WKWebViewConfiguration _setShouldDecidePolicyBeforeLoadingQuickLookPreview:](v4, "_setShouldDecidePolicyBeforeLoadingQuickLookPreview:", [a3 decodeBoolForKey:@"shouldDecidePolicyBeforeLoadingQuickLookPreview"]);
    -[WKWebViewConfiguration _setScrollToTextFragmentIndicatorEnabled:](v4, "_setScrollToTextFragmentIndicatorEnabled:", [a3 decodeBoolForKey:@"scrollToTextFragmentIndicatorEnabled"]);
    -[WKWebViewConfiguration _setScrollToTextFragmentMarkingEnabled:](v4, "_setScrollToTextFragmentMarkingEnabled:", [a3 decodeBoolForKey:@"scrollToTextFragmentMarkingEnabled"]);
    -[WKWebViewConfiguration _setMultiRepresentationHEICInsertionEnabled:](v4, "_setMultiRepresentationHEICInsertionEnabled:", [a3 decodeBoolForKey:@"multiRepresentationHEICInsertionEnabled"]);
  }
  return v4;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((([a4 isEqualToString:@"allowUniversalAccessFromFileURLs"] & 1) != 0
     || [a4 isEqualToString:@"_allowUniversalAccessFromFileURLs"])
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    uint64_t v7 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = a4;
    }
    -[WKWebViewConfiguration _setAllowUniversalAccessFromFileURLs:](self, "_setAllowUniversalAccessFromFileURLs:", [a3 BOOLValue]);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WKWebViewConfiguration;
    [(WKWebViewConfiguration *)&v8 setValue:a3 forKey:a4];
  }
}

- (id)valueForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((([a3 isEqualToString:@"allowUniversalAccessFromFileURLs"] & 1) != 0
     || [a3 isEqualToString:@"_allowUniversalAccessFromFileURLs"])
    && (WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    uint64_t v6 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = a3;
    }
    return (id)objc_msgSend(NSNumber, "numberWithBool:", -[WKWebViewConfiguration _allowUniversalAccessFromFileURLs](self, "_allowUniversalAccessFromFileURLs"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebViewConfiguration;
    return [(WKWebViewConfiguration *)&v7 valueForKey:a3];
  }
}

- (NSURL)_requiredWebExtensionBaseURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)_setRequiredWebExtensionBaseURL:(id)a3
{
  MEMORY[0x19972E8A0](v6, a3);
  WTF::URL::operator=((uint64_t)&self[1]._pageConfiguration.data.__lx[16], (uint64_t)v6);
  unint64_t v5 = v6[0];
  v6[0] = 0;
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

- (void)_setWeakWebExtensionController:(id)a3
{
  if (a3) {
    uint64_t v4 = (WebKit::WebExtensionController *)[a3 _webExtensionController];
  }
  else {
    uint64_t v4 = 0;
  }

  API::PageConfiguration::setWeakWebExtensionController((API::PageConfiguration *)&self->_pageConfiguration, v4);
}

- (WKWebExtensionController)webExtensionController
{
  result = [(WKWebViewConfiguration *)self _weakWebExtensionController];
  if (!result)
  {
    return [(WKWebViewConfiguration *)self _strongWebExtensionController];
  }
  return result;
}

- (BOOL)upgradeKnownHostsToHTTPS
{
  return self[7]._pageConfiguration.data.__lx[35];
}

- (void)setUpgradeKnownHostsToHTTPS:(BOOL)upgradeKnownHostsToHTTPS
{
  self[7]._pageConfiguration.data.__lx[35] = upgradeKnownHostsToHTTPS;
}

- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering
{
  self[7]._pageConfiguration.data.__lx[36] = suppressesIncrementalRendering;
}

- (void)setAllowsAirPlayForMediaPlayback:(BOOL)allowsAirPlayForMediaPlayback
{
  self[7]._pageConfiguration.data.__lx[38] = allowsAirPlayForMediaPlayback;
}

- (void)setDefaultWebpagePreferences:(WKWebpagePreferences *)defaultWebpagePreferences
{
  if (defaultWebpagePreferences)
  {
    p_websitePolicies = &defaultWebpagePreferences->_websitePolicies;
    CFRetain(*(CFTypeRef *)&defaultWebpagePreferences->_websitePolicies.data.__lx[8]);
  }
  else
  {
    p_websitePolicies = 0;
  }
  uint64_t v5 = *(void *)self[1]._pageConfiguration.data.__lx;
  *(void *)self[1]._pageConfiguration.data.__lx = p_websitePolicies;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (void)setURLSchemeHandler:(id)urlSchemeHandler forURLScheme:(NSString *)urlScheme
{
  BOOL v7 = +[WKWebView handlesURLScheme:urlScheme];
  objc_super v8 = (void *)MEMORY[0x1E4F1C3C8];
  if (v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"'%@' is a URL scheme that WKWebView handles natively", urlScheme format];
  }
  MEMORY[0x19972EAD0](v22, urlScheme);
  WTF::URLParser::maybeCanonicalizeScheme();
  uint64_t v11 = v22[0];
  v22[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v9);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  if (!v21)
  {
    [MEMORY[0x1E4F1CA00] raise:*v8, @"'%@' is not a valid URL scheme", urlScheme format];
LABEL_25:
    __break(1u);
    return;
  }
  p_pageConfiguration = (uint64_t *)&self[6]._pageConfiguration;
  v13 = WTF::HashMap<WTF::String,WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(p_pageConfiguration, &v20, v10);
  if (v13)
  {
    int v14 = *((_DWORD *)v13 + 2);
    *((_DWORD *)v13 + 2) = v14 + 1;
    if (v14) {
      *((_DWORD *)v13 + 2) = v14;
    }
    else {
      (*(void (**)(WTF *))(*(void *)v13 + 8))(v13);
    }
    [MEMORY[0x1E4F1CA00] raise:*v8, @"URL scheme '%@' already has a registered URL scheme handler", urlScheme format];
  }
  WebKit::WebURLSchemeHandlerCocoa::create(urlSchemeHandler, &v18);
  uint64_t v19 = v18;
  if (!v21) {
    goto LABEL_25;
  }
  WTF::HashMap<WTF::String,WTF::Ref<WebKit::WebURLSchemeHandler,WTF::RawPtrTraits<WebKit::WebURLSchemeHandler>,WTF::DefaultRefDerefTraits<WebKit::WebURLSchemeHandler>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WebKit::WebURLSchemeHandler,WTF::RawPtrTraits<WebKit::WebURLSchemeHandler>,WTF::DefaultRefDerefTraits<WebKit::WebURLSchemeHandler>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WebKit::WebURLSchemeHandler,WTF::RawPtrTraits<WebKit::WebURLSchemeHandler>,WTF::DefaultRefDerefTraits<WebKit::WebURLSchemeHandler>>>(p_pageConfiguration, &v20, (const WTF::StringImpl *)&v19, (uint64_t)v22);
  v16 = (_DWORD *)v19;
  uint64_t v19 = 0;
  if (v16)
  {
    if (v16[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v16 + 8))(v16);
    }
    else {
      --v16[2];
    }
  }
  if (v21)
  {
    long long v17 = v20;
    long long v20 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v15);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
  }
}

- (id)urlSchemeHandlerForURLScheme:(NSString *)urlScheme
{
  MEMORY[0x19972EAD0](&v13, urlScheme);
  WTF::URLParser::maybeCanonicalizeScheme();
  uint64_t v6 = v13;
  v13 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  if (!v15) {
    return 0;
  }
  BOOL v7 = WTF::HashMap<WTF::String,WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)1>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>((uint64_t *)&self[6]._pageConfiguration, &v14, v5);
  if (v7)
  {
    id v9 = v7;
    ++*((_DWORD *)v7 + 2);
    if ((*(uint64_t (**)(WTF *))(*(void *)v7 + 16))(v7)) {
      uint64_t v10 = (void *)*((void *)v9 + 6);
    }
    else {
      uint64_t v10 = 0;
    }
    if (*((_DWORD *)v9 + 2) == 1) {
      (*(void (**)(WTF *))(*(void *)v9 + 8))(v9);
    }
    else {
      --*((_DWORD *)v9 + 2);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v15)
  {
    uint64_t v11 = v14;
    int v14 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v8);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
  }
  return v10;
}

- (BOOL)limitsNavigationsToAppBoundDomains
{
  return self[7]._pageConfiguration.data.__lx[33];
}

- (void)setLimitsNavigationsToAppBoundDomains:(BOOL)limitsNavigationsToAppBoundDomains
{
  self[7]._pageConfiguration.data.__lx[33] = limitsNavigationsToAppBoundDomains;
}

- (void)setWritingToolsBehavior:(int64_t)a3
{
  unsigned int v3 = 0x20301u >> (8 * a3);
  if ((unint64_t)a3 >= 3) {
    LOBYTE(v3) = 0;
  }
  self[9]._pageConfiguration.data.__lx[11] = v3;
}

- (int64_t)writingToolsBehavior
{
  unsigned int v2 = self[9]._pageConfiguration.data.__lx[11] - 1;
  if (v2 > 2) {
    return -1;
  }
  else {
    return qword_1994F6370[(char)v2];
  }
}

- (void)_setRelatedWebView:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = *(unsigned int **)&self[2]._pageConfiguration.data.__lx[24];
    *(void *)&self[2]._pageConfiguration.data.__lx[24] = 0;
    if (!v6) {
      return;
    }
    goto LABEL_9;
  }
  uint64_t v4 = *((void *)a3 + 52);
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v4 + 24), v4 + 16);
    uint64_t v5 = *(atomic_uint **)(v4 + 24);
    if (v5) {
      atomic_fetch_add(v5, 1u);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(unsigned int **)&self[2]._pageConfiguration.data.__lx[24];
  *(void *)&self[2]._pageConfiguration.data.__lx[24] = v5;
  if (v6)
  {
LABEL_9:
    if (atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, (void *)a2);
    }
  }
}

- (void)_setWebViewToCloneSessionStorageFrom:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = *(unsigned int **)&self[3]._pageConfiguration.data.__lx[24];
    *(void *)&self[3]._pageConfiguration.data.__lx[24] = 0;
    if (!v6) {
      return;
    }
    goto LABEL_9;
  }
  uint64_t v4 = *((void *)a3 + 52);
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v4 + 24), v4 + 16);
    uint64_t v5 = *(atomic_uint **)(v4 + 24);
    if (v5) {
      atomic_fetch_add(v5, 1u);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(unsigned int **)&self[3]._pageConfiguration.data.__lx[24];
  *(void *)&self[3]._pageConfiguration.data.__lx[24] = v5;
  if (v6)
  {
LABEL_9:
    if (atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, (void *)a2);
    }
  }
}

- (void)_setAlternateWebViewForNavigationGestures:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = *(unsigned int **)&self[3]._pageConfiguration.data.__lx[32];
    *(void *)&self[3]._pageConfiguration.data.__lx[32] = 0;
    if (!v6) {
      return;
    }
    goto LABEL_9;
  }
  uint64_t v4 = *((void *)a3 + 52);
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v4 + 24), v4 + 16);
    uint64_t v5 = *(atomic_uint **)(v4 + 24);
    if (v5) {
      atomic_fetch_add(v5, 1u);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(unsigned int **)&self[3]._pageConfiguration.data.__lx[32];
  *(void *)&self[3]._pageConfiguration.data.__lx[32] = v5;
  if (v6)
  {
LABEL_9:
    if (atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, (void *)a2);
    }
  }
}

- (BOOL)_respectsImageOrientation
{
  unsigned int v2 = [(WKWebViewConfiguration *)self preferences];
  {
    WebKit::WebPreferencesKey::shouldRespectImageOrientationKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldRespectImageOrientationKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldRespectImageOrientationKey(void)::$_0::operator() const(void)::impl;
  }
  uint64_t v4 = (WebKit::WebPreferencesStore *)&v2->_preferences.data.__lx[40];

  return WebKit::WebPreferencesStore::getBoolValueForKey(v4, (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldRespectImageOrientationKey(void)::key, v3);
}

- (void)_setRespectsImageOrientation:(BOOL)a3
{
  BOOL v3 = a3;
  WebKit::WebPreferences::setShouldRespectImageOrientation((WebKit::WebPreferences *)([(WKWebViewConfiguration *)self preferences] + 8), &v3);
}

- (BOOL)_printsBackgrounds
{
  unsigned int v2 = [(WKWebViewConfiguration *)self preferences];

  return [(WKPreferences *)v2 shouldPrintBackgrounds];
}

- (void)_setPrintsBackgrounds:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(WKWebViewConfiguration *)self preferences];

  [(WKPreferences *)v4 setShouldPrintBackgrounds:v3];
}

- (void)_setIncrementalRenderingSuppressionTimeout:(double)a3
{
  *(double *)&self[8]._pageConfiguration.data.__lx[40] = a3;
}

- (void)_setAllowsJavaScriptMarkup:(BOOL)a3
{
  LOBYTE(self[9].super.isa) = a3;
}

- (void)_setAllowUniversalAccessFromFileURLs:(BOOL)a3
{
  BYTE3(self[9].super.isa) = a3;
}

- (void)_setAllowTopNavigationToDataURLs:(BOOL)a3
{
  BYTE4(self[9].super.isa) = a3;
}

- (void)_setConvertsPositionStyleOnCopy:(BOOL)a3
{
  BYTE1(self[9].super.isa) = a3;
}

- (void)_setAllowsMetaRefresh:(BOOL)a3
{
  BYTE2(self[9].super.isa) = a3;
}

- (BOOL)_clientNavigationsRunAtForegroundPriority
{
  return self[5]._pageConfiguration.data.__lx[32];
}

- (void)_setClientNavigationsRunAtForegroundPriority:(BOOL)a3
{
  self[5]._pageConfiguration.data.__lx[32] = a3;
}

- (NSArray)_portsForUpgradingInsecureSchemeForTesting
{
  v4[2] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(unsigned int *)&self[4]._pageConfiguration.data.__lx[40] | ((unint64_t)*(unsigned __int16 *)&self[4]._pageConfiguration.data.__lx[44] << 32);
  if ((v2 & 0xFF00000000) == 0) {
    return 0;
  }
  v4[0] = [NSNumber numberWithUnsignedShort:(unsigned __int16)*(_DWORD *)&self[4]._pageConfiguration.data.__lx[40]];
  v4[1] = [NSNumber numberWithUnsignedShort:WORD1(v2)];
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
}

- (void)_setPortsForUpgradingInsecureSchemeForTesting:(id)a3
{
  if ([a3 count] == 2
    && !((unint64_t)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue") >> 16)
    && !((unint64_t)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntegerValue") >> 16))
  {
    unsigned __int16 v5 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue");
    unsigned __int16 v6 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntegerValue");
    if (self[4]._pageConfiguration.data.__lx[44])
    {
      *(_WORD *)&self[4]._pageConfiguration.data.__lx[40] = v5;
      *(_WORD *)&self[4]._pageConfiguration.data.__lx[42] = v6;
    }
    else
    {
      *(_DWORD *)&self[4]._pageConfiguration.data.__lx[40] = v5 | (v6 << 16);
      self[4]._pageConfiguration.data.__lx[44] = 1;
    }
  }
}

- (BOOL)_alwaysRunsAtForegroundPriority
{
  return self[5]._pageConfiguration.data.__lx[32];
}

- (void)_setAlwaysRunsAtForegroundPriority:(BOOL)a3
{
  self[5]._pageConfiguration.data.__lx[32] = a3;
}

- (void)_setAllowsInlineMediaPlaybackAfterFullscreen:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[2] = a3;
}

- (unint64_t)_dragLiftDelay
{
  int v2 = self[4]._pageConfiguration.data.__lx[4];
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

- (BOOL)_longPressActionsEnabled
{
  return self[4]._pageConfiguration.data.__lx[9];
}

- (void)_setLongPressActionsEnabled:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[9] = a3;
}

- (void)_setShouldDecidePolicyBeforeLoadingQuickLookPreview:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[11] = a3;
}

- (void)_setCanShowWhileLocked:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[40] = a3;
}

- (BOOL)_canShowWhileLocked
{
  return self[3]._pageConfiguration.data.__lx[40];
}

- (void)_setClickInteractionDriverForTesting:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  Class isa = self[4].super.isa;
  self[4].super.Class isa = (Class)a3;
  if (isa)
  {
    CFRelease(isa);
  }
}

- (void)_setAppInitiatedOverrideValueForTesting:(unint64_t)a3
{
  unsigned __int8 v3 = a3 == 2;
  if (a3 == 1) {
    unsigned __int8 v3 = 2;
  }
  self[3]._pageConfiguration.data.__lx[41] = v3;
}

- (unint64_t)_appInitiatedOverrideValueForTesting
{
  int v2 = self[3]._pageConfiguration.data.__lx[41];
  if (v2 == 2) {
    return 1;
  }
  else {
    return 2 * (v2 == 1);
  }
}

- (BOOL)_ignoresAppBoundDomains
{
  return self[7]._pageConfiguration.data.__lx[32];
}

- (void)_setIgnoresAppBoundDomains:(BOOL)a3
{
  self[7]._pageConfiguration.data.__lx[32] = a3;
}

- (void)_setAttachmentElementEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[6] = a3;
}

- (void)_setAttachmentWideLayoutEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[7] = a3;
}

- (Class)_attachmentFileWrapperClass
{
  return *(Class *)self[5]._pageConfiguration.data.__lx;
}

- (void)_setAttachmentFileWrapperClass:(Class)a3
{
  if (a3)
  {
    if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Class %@ does not inherit from NSFileWrapper", a3 format];
    }
    CFRetain(a3);
  }
  unsigned __int16 v5 = *(const void **)self[5]._pageConfiguration.data.__lx;
  *(void *)self[5]._pageConfiguration.data.__lx = a3;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (void)_setColorFilterEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[0] = a3;
}

- (void)_setIncompleteImageBorderEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[1] = a3;
}

- (void)_setShouldDeferAsynchronousScriptsUntilAfterDocumentLoad:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[2] = a3;
}

- (WKWebsiteDataStore)_websiteDataStoreIfExists
{
  uint64_t v2 = *(void *)&self[1]._pageConfiguration.data.__lx[8];
  if (v2) {
    return *(WKWebsiteDataStore **)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (NSArray)_corsDisablingPatterns
{
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self[6]._pageConfiguration.data.__lx[8], (uint64_t *)&cf);
  CFTypeRef v2 = cf;
  CFTypeRef cf = 0;
  unsigned __int8 v3 = (id)CFMakeCollectable(v2);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  return v3;
}

- (void)_setCORSDisablingPatterns:(id)a3
{
  WTF::makeVector<WTF::String>(a3, (uint64_t)&v8);
  uint64_t v5 = *(unsigned int *)&self[6]._pageConfiguration.data.__lx[20];
  if (v5) {
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)&self[6]._pageConfiguration.data.__lx[8], (WTF::StringImpl *)(*(void *)&self[6]._pageConfiguration.data.__lx[8] + 8 * v5));
  }
  unsigned __int16 v6 = *(WTF **)&self[6]._pageConfiguration.data.__lx[8];
  if (v6)
  {
    *(void *)&self[6]._pageConfiguration.data.__lx[8] = 0;
    *(_DWORD *)&self[6]._pageConfiguration.data.__lx[16] = 0;
    WTF::fastFree(v6, v4);
  }
  *(void *)&self[6]._pageConfiguration.data.__lx[8] = v8;
  uint64_t v7 = v9;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  *(void *)&self[6]._pageConfiguration.data.__lx[16] = v7;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (NSSet)_maskedURLSchemes
{
  API::PageConfiguration::maskedURLSchemes((uint64_t *)&self->_pageConfiguration, (uint64_t *)&v11);
  if (v11) {
    uint64_t v2 = *((unsigned int *)v11 - 3);
  }
  else {
    uint64_t v2 = 0;
  }
  unsigned __int8 v3 = (NSSet *)[MEMORY[0x1E4F1CA80] setWithCapacity:v2];
  uint64_t v5 = (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin(&v11);
  unsigned __int16 v6 = v4;
  uint64_t v7 = v11;
  if (v11) {
    uint64_t v8 = &v11[*((unsigned int *)v11 - 1)];
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8 != v5)
  {
    do
    {
      if (*v5) {
        uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        uint64_t v9 = &stru_1EEA10550;
      }
      [(NSSet *)v3 addObject:v9];
      while (++v5 != (WTF::StringImpl **)v6)
      {
        if ((unint64_t)*v5 + 1 > 1) {
          goto LABEL_14;
        }
      }
      uint64_t v5 = (WTF::StringImpl **)v6;
LABEL_14:
      ;
    }
    while (v5 != v8);
    uint64_t v7 = v11;
  }
  if (v7) {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v7, v4);
  }
  return v3;
}

- (void)_setLoadsFromNetwork:(BOOL)a3
{
  if (a3)
  {
    char v3 = 0;
    LOBYTE(v4) = 0;
  }
  else
  {
    CFTypeRef v4 = 0;
    *(void *)uint64_t v5 = 0;
    char v3 = 1;
    *(void *)((char *)&v5[1] + 1) = 0;
  }
  char v6 = v3;
  std::__optional_storage_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>>((uint64_t)&self[7]._pageConfiguration, (uint64_t *)&v4);
  if (v6)
  {
    if (v4) {
      WTF::RobinHoodHashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableSizePolicy>::deallocateTable((WTF::StringImpl **)v4, (WTF::StringImpl *)v5[0]);
    }
  }
}

- (BOOL)_loadsFromNetwork
{
  return self[7]._pageConfiguration.data.__lx[24] == 0;
}

- (void)_setAllowedNetworkHosts:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v19 = 0;
    memset(v20, 0, 13);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(a3);
          }
          MEMORY[0x19972EAD0](&v14, *(void *)(*((void *)&v15 + 1) + 8 * i));
          WTF::RobinHoodHashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableSizePolicy>::add((uint64_t)&v19, &v14, v8, (uint64_t)&v21);
          uint64_t v10 = v14;
          int v14 = 0;
          if (v10)
          {
            if (*(_DWORD *)v10 == 2) {
              WTF::StringImpl::destroy(v10, v9);
            }
            else {
              *(_DWORD *)v10 -= 2;
            }
          }
        }
        uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v26 count:16];
      }
      while (v5);
    }
    char v21 = v19;
    uint64_t v11 = v20[0];
    uint64_t v19 = 0;
    memset(v20, 0, 13);
    uint64_t v22 = v11;
    int v23 = v20[1];
    char v24 = BYTE4(v20[1]);
    char v25 = 1;
    std::__optional_storage_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>>((uint64_t)&self[7]._pageConfiguration, (uint64_t *)&v21);
    if (v25)
    {
      if (v21) {
        WTF::RobinHoodHashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableSizePolicy>::deallocateTable((WTF::StringImpl **)v21, (WTF::StringImpl *)v22);
      }
    }
    v12 = (WTF::StringImpl **)v19;
    if (v19)
    {
      unint64_t v13 = LODWORD(v20[0]);
LABEL_16:
      WTF::RobinHoodHashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableSizePolicy>::deallocateTable(v12, (WTF::StringImpl *)v13);
    }
  }
  else
  {
    LOBYTE(v21) = 0;
    char v25 = 0;
    std::__optional_storage_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>>((uint64_t)&self[7]._pageConfiguration, (uint64_t *)&v21);
    if (v25)
    {
      v12 = (WTF::StringImpl **)v21;
      if (v21)
      {
        unint64_t v13 = v22;
        goto LABEL_16;
      }
    }
  }
}

- (NSSet)_allowedNetworkHosts
{
  if (!self[7]._pageConfiguration.data.__lx[24]) {
    return 0;
  }
  result = (NSSet *)[MEMORY[0x1E4F1CA80] setWithCapacity:*(unsigned int *)&self[7]._pageConfiguration.data.__lx[12]];
  if (self[7]._pageConfiguration.data.__lx[24])
  {
    CFTypeRef v4 = result;
    if (*(_DWORD *)&self[7]._pageConfiguration.data.__lx[12])
    {
      uint64_t v5 = *(void *)self[7]._pageConfiguration.data.__lx;
      uint64_t v6 = *(unsigned int *)&self[7]._pageConfiguration.data.__lx[8];
      if (v6)
      {
        uint64_t v7 = 8 * v6;
        for (uint64_t i = *(uint64_t **)self[7]._pageConfiguration.data.__lx; !*i; ++i)
        {
          v7 -= 8;
          if (!v7) {
            return v4;
          }
        }
      }
      else
      {
        uint64_t i = *(uint64_t **)self[7]._pageConfiguration.data.__lx;
      }
      uint64_t v9 = (uint64_t *)(v5 + 8 * v6);
      if (i != v9)
      {
        uint64_t v10 = *i;
LABEL_13:
        if (v10) {
          uint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
        }
        else {
          uint64_t v11 = &stru_1EEA10550;
        }
        [(NSSet *)v4 addObject:v11];
        while (++i != v9)
        {
          uint64_t v10 = *i;
          if (*i)
          {
            if (i != v9) {
              goto LABEL_13;
            }
            return v4;
          }
        }
      }
    }
    return v4;
  }
  __break(1u);
  return result;
}

- (void)_setLoadsSubresources:(BOOL)a3
{
  LOBYTE(self[7].super.isa) = a3;
}

- (BOOL)_loadsSubresources
{
  return (BOOL)self[7].super.isa;
}

- (BOOL)_deferrableUserScriptsShouldWaitUntilNotification
{
  return self[6]._pageConfiguration.data.__lx[33];
}

- (void)_setDeferrableUserScriptsShouldWaitUntilNotification:(BOOL)a3
{
  self[6]._pageConfiguration.data.__lx[33] = a3;
}

- (BOOL)_crossOriginAccessControlCheckEnabled
{
  return self[6]._pageConfiguration.data.__lx[34];
}

- (BOOL)_requiresUserActionForVideoPlayback
{
  return ([(WKWebViewConfiguration *)self mediaTypesRequiringUserActionForPlayback] >> 1) & 1;
}

- (void)_setRequiresUserActionForVideoPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  WKAudiovisualMediaTypes v5 = [(WKWebViewConfiguration *)self mediaTypesRequiringUserActionForPlayback] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(WKWebViewConfiguration *)self setMediaTypesRequiringUserActionForPlayback:v5 | v6];
}

- (BOOL)_requiresUserActionForAudioPlayback
{
  return [(WKWebViewConfiguration *)self mediaTypesRequiringUserActionForPlayback] & 1;
}

- (void)_setRequiresUserActionForAudioPlayback:(BOOL)a3
{
  WKAudiovisualMediaTypes v4 = [(WKWebViewConfiguration *)self mediaTypesRequiringUserActionForPlayback] & 0xFFFFFFFFFFFFFFFELL | a3;

  [(WKWebViewConfiguration *)self setMediaTypesRequiringUserActionForPlayback:v4];
}

- (BOOL)_initialCapitalizationEnabled
{
  return self[4]._pageConfiguration.data.__lx[12];
}

- (void)_setInitialCapitalizationEnabled:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[12] = a3;
}

- (void)_setWaitsForPaintAfterViewDidMoveToWindow:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[13] = a3;
}

- (_WKApplicationManifest)_applicationManifest
{
  Class isa = self[6].super.isa;
  if (isa) {
    return (_WKApplicationManifest *)*((void *)isa + 1);
  }
  else {
    return 0;
  }
}

- (void)_setApplicationManifest:(id)a3
{
  if (a3)
  {
    WKAudiovisualMediaTypes v4 = (objc_class *)((char *)a3 + 8);
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  else
  {
    WKAudiovisualMediaTypes v4 = 0;
  }
  Class isa = self[6].super.isa;
  self[6].super.Class isa = v4;
  if (isa)
  {
    uint64_t v6 = (const void *)*((void *)isa + 1);
    CFRelease(v6);
  }
}

- (void)_setScrollToTextFragmentIndicatorEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[9] = a3;
}

- (void)_setScrollToTextFragmentMarkingEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[10] = a3;
}

- (NSString)_overrideContentSecurityPolicy
{
  if (self[5].super.isa) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)_setOverrideContentSecurityPolicy:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self[5], &v6);
  WKAudiovisualMediaTypes v5 = v6;
  uint64_t v6 = 0;
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

- (void)_setMediaContentTypesRequiringHardwareSupport:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  WKAudiovisualMediaTypes v5 = v9;
  uint64_t v9 = 0;
  uint64_t v6 = *(WTF::StringImpl **)self[8]._pageConfiguration.data.__lx;
  *(void *)self[8]._pageConfiguration.data.__lx = v5;
  if (v6)
  {
    int v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      uint64_t v6 = v9;
      uint64_t v9 = 0;
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)uint64_t v6 = v7;
  }
}

- (void)_setAdditionalSupportedImageTypes:(id)a3
{
  if (a3)
  {
    WTF::makeVector<WTF::String>(a3, (uint64_t)&v7);
    v9[0] = v7;
    uint64_t v4 = v8;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    v9[1] = v4;
    char v10 = 1;
    std::__optional_storage_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>>((WTF *)&self[5]._pageConfiguration.data.__lx[8], v9);
    if (v10) {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, v5);
    }
    uint64_t v6 = &v7;
  }
  else
  {
    LOBYTE(v9[0]) = 0;
    char v10 = 0;
    std::__optional_storage_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>>((WTF *)&self[5]._pageConfiguration.data.__lx[8], v9);
    if (!v10) {
      return;
    }
    uint64_t v6 = v9;
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v6, v5);
}

- (void)_setAllowMediaContentTypesRequiringHardwareSupportAsFallback:(BOOL)a3
{
  HIBYTE(self[9].super.isa) = a3;
}

- (BOOL)_mediaCaptureEnabled
{
  return self[7]._pageConfiguration.data.__lx[34];
}

- (void)_setMediaCaptureEnabled:(BOOL)a3
{
  self[7]._pageConfiguration.data.__lx[34] = a3;
}

- (void)_setUndoManagerAPIEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[3] = a3;
}

- (void)_setAllowTestOnlyIPC:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[16] = a3;
}

- (BOOL)_delaysWebProcessLaunchUntilFirstLoad
{
  return API::PageConfiguration::delaysWebProcessLaunchUntilFirstLoad((WebKit::WebPreferences **)&self->_pageConfiguration);
}

- (void)_setDelaysWebProcessLaunchUntilFirstLoad:(BOOL)a3
{
}

- (BOOL)_shouldRelaxThirdPartyCookieBlocking
{
  return self[9]._pageConfiguration.data.__lx[12];
}

- (NSString)_processDisplayName
{
  if (*(void *)&self[6]._pageConfiguration.data.__lx[40]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)_setProcessDisplayName:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self[6]._pageConfiguration.data.__lx[40], &v6);
  WKAudiovisualMediaTypes v5 = v6;
  uint64_t v6 = 0;
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

- (void)_setAttributedBundleIdentifier:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  WKAudiovisualMediaTypes v5 = v9;
  uint64_t v9 = 0;
  uint64_t v6 = *(WTF::StringImpl **)&self[9]._pageConfiguration.data.__lx[16];
  *(void *)&self[9]._pageConfiguration.data.__lx[16] = v5;
  if (v6)
  {
    int v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      uint64_t v6 = v9;
      uint64_t v9 = 0;
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)uint64_t v6 = v7;
  }
}

- (NSString)_attributedBundleIdentifier
{
  result = *(NSString **)&self[9]._pageConfiguration.data.__lx[16];
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (void)_setContentSecurityPolicyModeForExtension:(unint64_t)a3
{
  unsigned __int8 v3 = a3 == 1;
  if (a3 == 2) {
    unsigned __int8 v3 = 2;
  }
  self[9]._pageConfiguration.data.__lx[24] = v3;
}

- (unint64_t)_contentSecurityPolicyModeForExtension
{
  int v2 = self[9]._pageConfiguration.data.__lx[24];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (void)_setMarkedTextInputEnabled:(BOOL)a3
{
  self[9]._pageConfiguration.data.__lx[8] = a3;
}

- (BOOL)_markedTextInputEnabled
{
  return self[9]._pageConfiguration.data.__lx[8];
}

- (void)_setMultiRepresentationHEICInsertionEnabled:(BOOL)a3
{
  self[7]._pageConfiguration.data.__lx[41] = a3;
}

- (BOOL)_multiRepresentationHEICInsertionEnabled
{
  return self[7]._pageConfiguration.data.__lx[41];
}

- (BOOL)requiresUserActionForMediaPlayback
{
  return [(WKWebViewConfiguration *)self mediaTypesRequiringUserActionForPlayback] == -1;
}

- (void)setRequiresUserActionForMediaPlayback:(BOOL)requiresUserActionForMediaPlayback
{
}

- (void)_setTextInteractionGesturesEnabled:(BOOL)a3
{
  self[4]._pageConfiguration.data.__lx[8] = a3;
}

@end