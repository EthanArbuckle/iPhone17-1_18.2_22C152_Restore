@interface CLLocationButtonMechanism
- (BOOL)bkHidEventHitTestInfoValid:(id)a3 fromStart:(BOOL)a4;
- (BOOL)builtOnOrAfterSDKVersion:(id)a3;
- (BOOL)useSeparatedTransformGrading;
- (BOOL)validateTransformForHitTestInfo:(id)a3;
- (CLLocationButtonMechanism)initWithConnection:(id)a3;
- (CLLocationButtonTag)imagedTag;
- (UISSlotStyle)slotStyle;
- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (unsigned)slotId;
- (void)deriveAnalyticsFromTag:(id)a3;
- (void)getRemoteContentForStyle:(id)a3 layerContext:(unint64_t)a4 tag:(id)a5 sandboxExtension:(id)a6 completionHandler:(id)a7;
- (void)onPrimaryTouchDownEvent:(id)a3;
- (void)setImagedTag:(id)a3;
- (void)setSlotId:(unsigned int)a3;
- (void)setSlotStyle:(id)a3;
@end

@implementation CLLocationButtonMechanism

- (CLLocationButtonMechanism)initWithConnection:(id)a3
{
  id v4 = a3;
  v5 = (UISSlotMachine *)[objc_alloc((Class)UISSlotMachine) initWithSlotDrawer:self options:3];
  slotMachine = self->_slotMachine;
  self->_slotMachine = v5;

  if (v4)
  {
    [v4 auditToken];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  long long v7 = v23;
  *(_OWORD *)self->_auditToken.val = v22;
  *(_OWORD *)&self->_auditToken.val[4] = v7;
  v8 = (UISTransform3DGrader *)objc_alloc_init((Class)UISTransform3DGrader);
  layerGrader = self->_layerGrader;
  self->_layerGrader = v8;

  v10 = (UISTransform3DGrader *)objc_alloc_init((Class)UISTransform3DGrader);
  contentsGrader = self->_contentsGrader;
  self->_contentsGrader = v10;

  v12 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", [v4 processIdentifier]);
  id v21 = 0;
  v13 = +[RBSProcessHandle handleForIdentifier:v12 error:&v21];
  id v14 = v21;

  if (v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005490(v14);
    }
  }
  else
  {
    v16 = [v13 bundle];
    processBundle = self->_processBundle;
    self->_processBundle = v16;

    if (self->_processBundle)
    {
      v15 = self;
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000540C(v13);
    }
    v24[0] = @"ClientKey";
    v19 = [(RBSProcessBundle *)self->_processBundle identifier];
    v24[1] = @"ReasonType";
    v25[0] = v19;
    v25[1] = @"InvalidBundleID";
    v20 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    AnalyticsSendEvent();
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (void)getRemoteContentForStyle:(id)a3 layerContext:(unint64_t)a4 tag:(id)a5 sandboxExtension:(id)a6 completionHandler:(id)a7
{
  id v14 = (void (**)(id, void *))a7;
  id v11 = a5;
  id v12 = a3;
  [(CLLocationButtonMechanism *)self setImagedTag:v11];
  [(CLLocationButtonMechanism *)self setSlotStyle:v12];
  v13 = [(UISSlotMachine *)self->_slotMachine remoteContentForLayerContextWithId:a4 style:v12 tag:v11];

  [(CLLocationButtonMechanism *)self deriveAnalyticsFromTag:v11];
  if (objc_opt_respondsToSelector()) {
    -[CLLocationButtonMechanism setSlotId:](self, "setSlotId:", [v13 performSelector:"slotID"]);
  }
  v14[2](v14, v13);
}

- (void)onPrimaryTouchDownEvent:(id)a3
{
  id v4 = a3;
  v5 = [(CLLocationButtonMechanism *)self imagedTag];
  unsigned __int8 v6 = [v5 renderedSuccessfully];

  if ((v6 & 1) == 0)
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v15) {
      sub_100005A90(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    v76[0] = @"ClientKey";
    id v12 = [(RBSProcessBundle *)self->_processBundle identifier];
    v76[1] = @"ReasonType";
    v77[0] = v12;
    v77[1] = @"RenderingFailed";
    v13 = v77;
    id v14 = v76;
    goto LABEL_45;
  }
  long long v7 = +[BKSHIDEventDeliveryManager sharedInstance];
  id v8 = [v7 authenticateMessage:v4];

  if (v8 != (id)2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005A10((int)v8);
    }
    v74[0] = @"ClientKey";
    id v12 = [(RBSProcessBundle *)self->_processBundle identifier];
    v74[1] = @"ReasonType";
    v75[0] = v12;
    v75[1] = @"AuthenicationStatusInvalid";
    v13 = v75;
    id v14 = v74;
    goto LABEL_45;
  }
  long long v9 = *(_OWORD *)&self->_auditToken.val[4];
  long long v60 = *(_OWORD *)self->_auditToken.val;
  long long v61 = v9;
  id v10 = (id)BSVersionedPIDForAuditToken();
  if (objc_msgSend(v4, "versionedPID", v60, v61) != v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000598C(v4);
    }
    v72[0] = @"ClientKey";
    id v12 = [(RBSProcessBundle *)self->_processBundle identifier];
    v72[1] = @"ReasonType";
    v73[0] = v12;
    v73[1] = @"MismatchedPid";
    v13 = v73;
    id v14 = v72;
    goto LABEL_45;
  }
  if ([v4 context] != (id)0x9FB774E4B8F165C9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005918(v4);
    }
    v70[0] = @"ClientKey";
    id v12 = [(RBSProcessBundle *)self->_processBundle identifier];
    v70[1] = @"ReasonType";
    v71[0] = v12;
    v71[1] = @"AuthMessageContextInvalid";
    v13 = v71;
    id v14 = v70;
    goto LABEL_45;
  }
  uint64_t v11 = mach_continuous_time();
  if ((unint64_t)[v4 timestamp] > v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005518(v4);
    }
    v68[0] = @"ClientKey";
    id v12 = [(RBSProcessBundle *)self->_processBundle identifier];
    v68[1] = @"ReasonType";
    v69[0] = v12;
    v69[1] = @"AuthMessageFuturistic";
    v13 = v69;
    id v14 = v68;
LABEL_45:
    v59 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:2];
    AnalyticsSendEvent();

    goto LABEL_46;
  }
  double v23 = CLCommonConvertTicksToSeconds(v11 - (void)[v4 timestamp]);
  if (v23 > 3.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005598(v4, v23);
    }
    v66[0] = @"ClientKey";
    id v12 = [(RBSProcessBundle *)self->_processBundle identifier];
    v66[1] = @"ReasonType";
    v67[0] = v12;
    v67[1] = @"AuthMessageExpired";
    v13 = v67;
    id v14 = v66;
    goto LABEL_45;
  }
  unsigned int v24 = [v4 targetSlotID];
  unsigned int v25 = [(CLLocationButtonMechanism *)self slotId];
  BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v24 != v25)
  {
    if (v26) {
      sub_100005878(self, v4);
    }
    v64[0] = @"ClientKey";
    id v12 = [(RBSProcessBundle *)self->_processBundle identifier];
    v64[1] = @"ReasonType";
    v65[0] = v12;
    v65[1] = @"SlotIdInvalid";
    v13 = v65;
    id v14 = v64;
    goto LABEL_45;
  }
  if (v26) {
    sub_10000583C(v26, v27, v28, v29, v30, v31, v32, v33);
  }
  v34 = [v4 hitTestInformationFromStartEvent];
  unsigned __int8 v35 = [(CLLocationButtonMechanism *)self bkHidEventHitTestInfoValid:v34 fromStart:1];

  BOOL v36 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v35)
  {
    if (v36) {
      sub_1000057C4(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    v44 = [v4 hitTestInformationFromEndEvent];
    unsigned __int8 v45 = [(CLLocationButtonMechanism *)self bkHidEventHitTestInfoValid:v44 fromStart:0];

    BOOL v46 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v45)
    {
      if (v46) {
        sub_1000056FC((uint64_t)self);
      }
      p_auditToken = &self->_auditToken;
      v62[0] = @"ClientKey";
      v55 = [(RBSProcessBundle *)self->_processBundle identifier];
      v62[1] = @"ReasonType";
      v63[0] = v55;
      v63[1] = @"Success";
      v56 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
      AnalyticsSendEvent();

      if ((_AXFeatureSupportsNonSightedUsage() & 1) != 0
        || _AXSCommandAndControlEnabled()
        || _AXSFullKeyboardAccessEnabled()
        || _AXSAutomationEnabled())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100005638();
        }
        uint64_t v57 = 1;
      }
      else
      {
        uint64_t v57 = 0;
      }
      long long v58 = *(_OWORD *)&p_auditToken->val[4];
      long long v60 = *(_OWORD *)p_auditToken->val;
      long long v61 = v58;
      +[CLLocationManager grantTemporaryAuthorizationUsingLocationButtonToClientWithAuditToken:&v60 voiceInteractionEnabled:v57];
    }
    else if (v46)
    {
      sub_100005788(v46, v47, v48, v49, v50, v51, v52, v53);
    }
  }
  else if (v36)
  {
    sub_100005800(v36, v37, v38, v39, v40, v41, v42, v43);
  }
LABEL_46:
}

- (BOOL)bkHidEventHitTestInfoValid:(id)a3 fromStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  unsigned int v7 = [(CLLocationButtonMechanism *)self validateTransformForHitTestInfo:v6];
  id v8 = [v6 detectedOcclusion];
  long long v9 = [(CLLocationButtonMechanism *)self imagedTag];
  [v6 cumulativeOpacity];
  unsigned int v10 = objc_msgSend(v9, "contrastValidForBgColorAndFgTextWithCumulativeOpacity:");

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    unsigned int v25 = v7;
    __int16 v26 = 1024;
    unsigned int v27 = [v6 hasInsecureFilter];
    __int16 v28 = 1024;
    int v29 = (int)v8;
    __int16 v30 = 1024;
    unsigned int v31 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "#locationButton bkHidEventHitTestInfo - caTransformIsValid: %d hasInseccureFilter: %d detectedOcclusion: %d contrastValid: %d", buf, 0x1Au);
    if (!v7) {
      goto LABEL_7;
    }
  }
  else if (!v7)
  {
LABEL_7:
    id v12 = @"EndHitTestInfo";
    if (v4) {
      id v12 = @"StartHitTestInfo";
    }
    v22[0] = @"ClientKey";
    processBundle = self->_processBundle;
    id v14 = v12;
    BOOL v15 = [(RBSProcessBundle *)processBundle identifier];
    v23[0] = v15;
    v23[1] = v14;
    v22[1] = @"ReasonType";
    v22[2] = @"TransformInValid";
    uint64_t v16 = +[NSNumber numberWithInt:v7 ^ 1];
    v23[2] = v16;
    v22[3] = @"DetectedOcclusion";
    uint64_t v17 = +[NSNumber numberWithBool:v8];
    v23[3] = v17;
    v22[4] = @"ContrastInValid";
    uint64_t v18 = +[NSNumber numberWithInt:v10 ^ 1];
    v23[4] = v18;
    v22[5] = @"InsecureFilter";
    uint64_t v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 hasInsecureFilter]);
    v23[5] = v19;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];

    AnalyticsSendEvent();
    goto LABEL_10;
  }
  if ((v10 & ~([v6 hasInsecureFilter] | v8) & 1) == 0) {
    goto LABEL_7;
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)validateTransformForHitTestInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  if (v4) {
    [v4 cumulativeContentsTransform];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100005C14();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (v5) {
    [v5 cumulativeLayerTransform];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100005B40();
  }
  long long v36 = xmmword_100006A20;
  uint64_t v19 = 0x3FF0000000000000;
  [(UISTransform3DGrader *)self->_layerGrader allowRotations:&UISAllDeviceRotations count:UISAllDeviceRotationCount];
  [(UISTransform3DGrader *)self->_layerGrader allowScales:&v19 count:1 lowerMultiplier:1.0 lowerConstant:0.0 upperMultiplier:1.1 upperConstant:0.0];
  [(UISTransform3DGrader *)self->_contentsGrader allowScales:&v36 count:2 lowerMultiplier:1.0 lowerConstant:0.0 upperMultiplier:1.0 upperConstant:0.0];
  layerGrader = self->_layerGrader;
  long long v15 = v24;
  long long v16 = v25;
  long long v17 = v26;
  long long v18 = v27;
  long long v11 = v20;
  long long v12 = v21;
  long long v13 = v22;
  long long v14 = v23;
  unint64_t v7 = (unint64_t)[(UISTransform3DGrader *)layerGrader gradeTransform3D:&v11];
  contentsGrader = self->_contentsGrader;
  long long v15 = v32;
  long long v16 = v33;
  long long v17 = v34;
  long long v18 = v35;
  long long v11 = v28;
  long long v12 = v29;
  long long v13 = v30;
  long long v14 = v31;
  unint64_t v9 = (unint64_t)[(UISTransform3DGrader *)contentsGrader gradeTransform3D:&v11];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100005ACC();
  }

  return (v7 | v9) == 0;
}

- (void)deriveAnalyticsFromTag:(id)a3
{
  id v4 = a3;
  v5 = [(RBSProcessBundle *)self->_processBundle identifier];
  objc_initWeak(&location, v5);

  id v6 = v4;
  objc_copyWeak(&v7, &location);
  AnalyticsSendEventLazy();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)CLLocationButtonDrawing) initWithStyle:v8 tag:v7 remote:v5];

  return v9;
}

- (BOOL)useSeparatedTransformGrading
{
  unsigned __int8 v2 = [(CLLocationButtonMechanism *)self builtOnOrAfterSDKVersion:@"16.0"];
  char v3 = MGIsDeviceOneOfType();
  if (MGGetBoolAnswer()) {
    return 1;
  }
  else {
    return v3 & (v2 ^ 1);
  }
}

- (BOOL)builtOnOrAfterSDKVersion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)LSApplicationRecord);
  id v6 = [(RBSProcessBundle *)self->_processBundle identifier];
  id v13 = 0;
  id v7 = [v5 initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v13];
  id v8 = v13;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100005CE8(v8);
    }
    BOOL v9 = 0;
  }
  else
  {
    unsigned int v10 = [v7 compatibilityObject];
    long long v11 = [v10 sdkVersion];

    if (v11) {
      BOOL v9 = (unint64_t)[v11 compare:v4 options:64] < 2;
    }
    else {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (CLLocationButtonTag)imagedTag
{
  return self->_imagedTag;
}

- (void)setImagedTag:(id)a3
{
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (unsigned)slotId
{
  return self->_slotId;
}

- (void)setSlotId:(unsigned int)a3
{
  self->_slotId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotStyle, 0);
  objc_storeStrong((id *)&self->_imagedTag, 0);
  objc_storeStrong((id *)&self->_contentsGrader, 0);
  objc_storeStrong((id *)&self->_layerGrader, 0);
  objc_storeStrong((id *)&self->_buttonConnection, 0);
  objc_storeStrong((id *)&self->_processBundle, 0);

  objc_storeStrong((id *)&self->_slotMachine, 0);
}

@end