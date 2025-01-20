@interface AXEventRepresentation
+ (AXEventRepresentation)representationWithData:(id)a3;
+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4;
+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4 clientID:(id)a5 taskPort:(unsigned int)a6;
+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5;
+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5 clientID:(id)a6 taskPort:(unsigned int)a7;
+ (AXEventRepresentation)representationWithLocation:(CGPoint)a3 windowLocation:(CGPoint)a4 handInfo:(id)a5;
+ (AXEventRepresentation)representationWithType:(unsigned int)a3 subtype:(int)a4 time:(unint64_t)a5 location:(CGPoint)a6 windowLocation:(CGPoint)a7 handInfo:(id)a8;
+ (BOOL)_HIDEventIsAccessibilityEvent:(__IOHIDEvent *)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_digitizerRepresentation:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4;
+ (id)_gameControllerEvent:(__IOHIDEvent *)a3;
+ (id)_gameKeyboardControllerEvent:(__IOHIDEvent *)a3;
+ (id)_keyboardButtonEvent:(__IOHIDEvent *)a3;
+ (id)_motionGestureTapEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5 clientID:(id)a6 taskPort:(unsigned int)a7;
+ (id)_pointerControllerEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4 serviceClient:(__IOHIDServiceClient *)a5;
+ (id)_vendorDefinedAccessibilityEvent:(__IOHIDEvent *)a3;
+ (id)_wheelEvent:(__IOHIDEvent *)a3;
+ (id)accelerometerRepresentation:(id)a3;
+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5;
+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6;
+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6 eventValue1:(float)a7 eventValue2:(float)a8;
+ (id)buttonRepresentationWithType:(unsigned int)a3;
+ (id)cancelEventForPathIndexMask:(unsigned int)a3;
+ (id)gestureRepresentationWithHandType:(unsigned int)a3 locations:(id)a4;
+ (id)iosmacPointerRepresentationWithTypeWithPointerInfo:(id)a3;
+ (id)keyRepresentationWithType:(unsigned int)a3;
+ (id)touchRepresentationWithHandType:(unsigned int)a3 location:(CGPoint)a4;
+ (unsigned)touchCounter;
+ (void)_appendKeyInfoToMediaKey:(id)a3 usage:(int64_t)a4 downEvent:(BOOL)a5;
+ (void)incrementTouchCounter;
+ (void)setTouchCounter:(unsigned int)a3;
- (AXEventAccelerometerInfoRepresentation)accelerometerInfo;
- (AXEventData)accessibilityData;
- (AXEventGameControllerInfoRepresentation)gameControllerInfo;
- (AXEventHandInfoRepresentation)handInfo;
- (AXEventIOSMACPointerInfoRepresentation)iosmacPointerInfo;
- (AXEventKeyInfoRepresentation)keyInfo;
- (AXEventPointerInfoRepresentation)pointerControllerInfo;
- (AXEventRepresentation)initWithCoder:(id)a3;
- (BOOL)_HIDEventIsAccessibilityEvent:(__IOHIDEvent *)a3;
- (BOOL)isBuiltIn;
- (BOOL)isCancel;
- (BOOL)isChordChange;
- (BOOL)isDisplayIntegrated;
- (BOOL)isDownEvent;
- (BOOL)isGeneratedEvent;
- (BOOL)isInRange;
- (BOOL)isInRangeLift;
- (BOOL)isLift;
- (BOOL)isMove;
- (BOOL)isRedirectEvent;
- (BOOL)isSystemDrag;
- (BOOL)isTouchDown;
- (BOOL)isUpdate;
- (BOOL)useOriginalHIDTime;
- (BOOL)willBeUpdated;
- (CGPoint)location;
- (CGPoint)windowLocation;
- (NSData)HIDAttributeData;
- (NSData)data;
- (NSDictionary)auxiliaryData;
- (NSString)clientId;
- (NSString)description;
- (__IOHIDEvent)_accessibilityEventFromRealEvent:(__IOHIDEvent *)a3;
- (__IOHIDEvent)_newAccelerometerHIDEventRef;
- (__IOHIDEvent)_newAccessibilityHIDEventRef;
- (__IOHIDEvent)_newButtonHIDEventRefWithType:(unsigned int)a3;
- (__IOHIDEvent)_newHandHIDEventRef;
- (__IOHIDEvent)_newIOSMACPointerRef;
- (__IOHIDEvent)_newKeyboardHIDEventRef;
- (__IOHIDEvent)_newScrollHIDEventRef;
- (__IOHIDEvent)_newTostadaButtonHIDEventRefWithType:(unsigned int)a3;
- (__IOHIDEvent)creatorHIDEvent;
- (__IOHIDEvent)newHIDEventRef;
- (__IOHIDServiceClient)creatorHIDServiceClient;
- (id)_accessibilityDataFromRealEvent:(__IOHIDEvent *)a3;
- (id)_senderNameForID;
- (id)accessibilityEventRepresentationTabularDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)denormalizedEventRepresentation:(BOOL)a3 descale:(BOOL)a4;
- (id)fakeTouchScaleEventRepresentation:(BOOL)a3;
- (id)normalizedEventRepresentation:(BOOL)a3 scale:(BOOL)a4;
- (int)flags;
- (int)pid;
- (int)subtype;
- (int64_t)generationCount;
- (int64_t)scrollAccelAmount;
- (int64_t)scrollAmount;
- (unint64_t)HIDTime;
- (unint64_t)_machTimeForHIDEventRef;
- (unint64_t)additionalFlags;
- (unint64_t)fingerCount;
- (unint64_t)senderID;
- (unint64_t)time;
- (unsigned)contextId;
- (unsigned)didUpdateMask;
- (unsigned)displayId;
- (unsigned)firstPathContextId;
- (unsigned)originalType;
- (unsigned)pathIndexMask;
- (unsigned)screenEdgeForPoint:(CGPoint)a3;
- (unsigned)secureName;
- (unsigned)taskPort;
- (unsigned)type;
- (unsigned)willUpdateMask;
- (void)_applyAccessibilityDataToRealEvent:(__IOHIDEvent *)a3;
- (void)applyAccessibilityDataToCreatorHIDEvent;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)modifyPoints:(id)a3;
- (void)neuterUpdates;
- (void)resetInitialTouchCountValueForHidStreamIdentifier:(id)a3;
- (void)setAccelerometerInfo:(id)a3;
- (void)setAccessibilityData:(id)a3;
- (void)setAdditionalFlags:(unint64_t)a3;
- (void)setAuxiliaryData:(id)a3;
- (void)setClientId:(id)a3;
- (void)setContextId:(unsigned int)a3;
- (void)setCreatorHIDEvent:(__IOHIDEvent *)a3;
- (void)setCreatorHIDServiceClient:(__IOHIDServiceClient *)a3;
- (void)setData:(id)a3;
- (void)setDidUpdateMask:(unsigned int)a3;
- (void)setDisplayId:(unsigned int)a3;
- (void)setFlags:(int)a3;
- (void)setGameControllerInfo:(id)a3;
- (void)setGenerationCount:(int64_t)a3;
- (void)setHIDAttributeData:(id)a3;
- (void)setHIDTime:(unint64_t)a3;
- (void)setHandInfo:(id)a3;
- (void)setIosmacPointerInfo:(id)a3;
- (void)setIsBuiltIn:(BOOL)a3;
- (void)setIsDisplayIntegrated:(BOOL)a3;
- (void)setIsGeneratedEvent:(BOOL)a3;
- (void)setKeyInfo:(id)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setOriginalType:(unsigned int)a3;
- (void)setPid:(int)a3;
- (void)setPointerControllerInfo:(id)a3;
- (void)setRedirectEvent:(BOOL)a3;
- (void)setScrollAccelAmount:(int64_t)a3;
- (void)setScrollAmount:(int64_t)a3;
- (void)setSecureName:(unsigned int)a3;
- (void)setSenderID:(unint64_t)a3;
- (void)setSubtype:(int)a3;
- (void)setSystemDrag:(BOOL)a3;
- (void)setTaskPort:(unsigned int)a3;
- (void)setTime:(unint64_t)a3;
- (void)setType:(unsigned int)a3;
- (void)setUseOriginalHIDTime:(BOOL)a3;
- (void)setWillUpdateMask:(unsigned int)a3;
- (void)setWindow:(void *)a3;
- (void)setWindowLocation:(CGPoint)a3;
- (void)window;
@end

@implementation AXEventRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (AXEventRepresentation)representationWithData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  v5 = [v3 secureUnarchiveData:v4 withExpectedClass:objc_opt_class() otherAllowedClasses:0];

  return (AXEventRepresentation *)v5;
}

+ (AXEventRepresentation)representationWithType:(unsigned int)a3 subtype:(int)a4 time:(unint64_t)a5 location:(CGPoint)a6 windowLocation:(CGPoint)a7 handInfo:(id)a8
{
  double y = a7.y;
  double x = a7.x;
  double v10 = a6.y;
  double v11 = a6.x;
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  id v15 = a8;
  v16 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v16 setType:v14];
  [(AXEventRepresentation *)v16 setSubtype:v13];
  if (_AXGSEventConvertFromMachTime_onceToken != -1) {
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_851);
  }
  [(AXEventRepresentation *)v16 setTime:(unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)a5)];
  -[AXEventRepresentation setLocation:](v16, "setLocation:", v11, v10);
  -[AXEventRepresentation setWindowLocation:](v16, "setWindowLocation:", x, y);
  [(AXEventRepresentation *)v16 setHandInfo:v15];

  [(AXEventRepresentation *)v16 setIsGeneratedEvent:1];

  return v16;
}

- (unsigned)pathIndexMask
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(AXEventRepresentation *)self type] != 3001
    || ([(AXEventRepresentation *)self handInfo],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    _AXAssert();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AXEventRepresentation *)self handInfo];
  v5 = [v4 paths];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= 1 << [*(id *)(*((void *)&v12 + 1) + 8 * i) pathIndex];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

+ (id)cancelEventForPathIndexMask:(unsigned int)a3
{
  id v4 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v4 setType:3001];
  v5 = objc_alloc_init(AXEventHandInfoRepresentation);
  [(AXEventRepresentation *)v4 setHandInfo:v5];

  uint64_t v6 = [(AXEventRepresentation *)v4 handInfo];
  [v6 setHandEventMask:128];

  uint64_t v7 = [(AXEventRepresentation *)v4 handInfo];
  [v7 setEventType:8];

  [(AXEventRepresentation *)v4 setIsDisplayIntegrated:1];
  unsigned int v8 = [MEMORY[0x1E4F1CA48] array];
  for (int i = 0; i != 32; ++i)
  {
    if ((a3 >> i))
    {
      double v10 = objc_alloc_init(AXEventPathInfoRepresentation);
      [(AXEventPathInfoRepresentation *)v10 setPathIndex:i];
      [(AXEventPathInfoRepresentation *)v10 setPathEventMask:128];
      [v8 addObject:v10];
    }
  }
  double v11 = [(AXEventRepresentation *)v4 handInfo];
  [v11 setPaths:v8];

  return v4;
}

+ (id)_digitizerRepresentation:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v113 = a4;
  v5 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v5 setSenderID:IOHIDEventGetSenderID()];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v7 = IOHIDEventGetIntegerValue();
  uint64_t v8 = IOHIDEventGetIntegerValue();
  if (IOHIDEventGetIntegerValue())
  {
    CFIndex v9 = IOHIDEventGetIntegerValue();
    uint64_t Children = IOHIDEventGetChildren();
    BOOL v11 = (Children | v9) != 0;
    if (Children && !v9)
    {
      CFArrayRef v12 = (const __CFArray *)Children;
      do
      {
        CFIndex Count = CFArrayGetCount(v12);
        BOOL v11 = v9 < Count;
        if (v9 >= Count) {
          break;
        }
        CFArrayGetValueAtIndex(v12, v9++);
      }
      while (!IOHIDEventGetIntegerValue());
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  if (IOHIDEventGetPhase() == 1)
  {
    [(id)HIDStreamLock lock];
    [(id)HIDStreamIdentifierPhasesForTouches removeAllObjects];
    [(id)HIDStreamLock unlock];
  }
  CFArrayRef v14 = (const __CFArray *)IOHIDEventGetChildren();
  CFArrayRef v15 = v14;
  if (v14) {
    CFIndex v116 = CFArrayGetCount(v14);
  }
  else {
    CFIndex v116 = 0;
  }
  v16 = objc_alloc_init(AXEventHandInfoRepresentation);
  [(AXEventRepresentation *)v5 setHandInfo:v16];

  uint64_t v17 = [(AXEventRepresentation *)v5 handInfo];
  [v17 setSystemGesturePossible:1];

  v18 = [(AXEventRepresentation *)v5 handInfo];
  [v18 setHandIdentity:v7];

  v19 = [(AXEventRepresentation *)v5 handInfo];
  [v19 setHandIndex:v8];

  v20 = [(AXEventRepresentation *)v5 handInfo];
  [v20 setHandEventMask:IntegerValue];

  IOHIDEventGetFloatValue();
  double v22 = v21;
  IOHIDEventGetFloatValue();
  double v24 = v23;
  v25 = [(AXEventRepresentation *)v5 handInfo];
  objc_msgSend(v25, "setHandPosition:", v22, v24);

  if (IOHIDEventGetAttributeDataLength() >= 1)
  {
    v26 = BKSHIDEventGetDigitizerAttributes();
    v27 = v26;
    if (v26)
    {
      uint64_t v28 = [v26 systemGesturesPossible];
      v29 = [(AXEventRepresentation *)v5 handInfo];
      [v29 setSystemGesturePossible:v28];

      [(AXEventRepresentation *)v5 setContextId:_ContextIDFromEvent((uint64_t)a3)];
    }
  }
  BOOL v108 = v11;
  v109 = a3;
  v30 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v116];
  v112 = v5;
  v114 = v30;
  char v107 = IntegerValue;
  if (v116 < 1)
  {
    uint64_t v32 = 0;
    int v110 = 0;
    int v118 = 0;
    int v115 = 0;
  }
  else
  {
    CFIndex v31 = 0;
    int v115 = 0;
    int v118 = 0;
    uint64_t v32 = 0;
    int v33 = 0;
    int v110 = 0;
    CFArrayRef v111 = v15;
    do
    {
      CFArrayGetValueAtIndex(v15, v31);
      if (IOHIDEventGetType() == 11 || IOHIDEventGetType() == 32)
      {
        v34 = objc_alloc_init(AXEventPathInfoRepresentation);
        IOHIDEventGetFloatValue();
        double v36 = v35;
        IOHIDEventGetFloatValue();
        -[AXEventPathInfoRepresentation setPathLocation:](v34, "setPathLocation:", v36, v37);
        IOHIDEventGetFloatValue();
        -[AXEventPathInfoRepresentation setPathZValue:](v34, "setPathZValue:");
        [v30 addObject:v34];
        [(AXEventPathInfoRepresentation *)v34 setPathIndex:IOHIDEventGetIntegerValue()];
        if (IOHIDEventGetIntegerValue())
        {
          [(AXEventPathInfoRepresentation *)v34 setPathProximity:[(AXEventPathInfoRepresentation *)v34 pathProximity] | 1];
          int v110 = 1;
        }
        uint64_t v38 = IOHIDEventGetIntegerValue();
        if (v38)
        {
          [(AXEventPathInfoRepresentation *)v34 setPathProximity:[(AXEventPathInfoRepresentation *)v34 pathProximity] | 2];
          ++v32;
        }
        BOOL v39 = v38 != 0;
        uint64_t v40 = IOHIDEventGetIntegerValue();
        uint64_t v41 = v40;
        if (v32) {
          v115 |= (v40 & 0x41C04) != 0;
        }
        uint64_t v117 = v32;
        if ((v40 & 0x80) != 0) {
          unsigned __int8 Phase = 8;
        }
        else {
          unsigned __int8 Phase = IOHIDEventGetPhase();
        }
        uint64_t v43 = [(AXEventPathInfoRepresentation *)v34 pathIndex];
        id v44 = v113;
        if (_initializeHIDStreamCountsIfNeeded_onceToken != -1) {
          dispatch_once(&_initializeHIDStreamCountsIfNeeded_onceToken, &__block_literal_global_854);
        }
        v118 |= v39;
        [(id)HIDStreamLock lock];
        v45 = [(id)HIDStreamIdentifierPhasesForTouches objectForKey:v44];
        v46 = (void *)[v45 mutableCopy];
        v47 = v46;
        if (v46)
        {
          id v48 = v46;
        }
        else
        {
          id v48 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        v49 = v48;

        v50 = [NSNumber numberWithUnsignedChar:Phase];
        v51 = [NSNumber numberWithUnsignedInt:v43];
        [v49 setObject:v50 forKey:v51];

        [(id)HIDStreamIdentifierPhasesForTouches setObject:v49 forKey:v44];
        [(id)HIDStreamLock unlock];

        IOHIDEventGetFloatValue();
        [(AXEventPathInfoRepresentation *)v34 setPathIdentity:(int)v52];
        IOHIDEventGetFloatValue();
        *(float *)&double v53 = v53;
        [(AXEventPathInfoRepresentation *)v34 setPathPressure:v53];
        IOHIDEventGetFloatValue();
        *(float *)&double v54 = v54;
        [(AXEventPathInfoRepresentation *)v34 setPathMajorRadius:v54];
        IOHIDEventGetFloatValue();
        *(float *)&double v55 = v55;
        [(AXEventPathInfoRepresentation *)v34 setPathMinorRadius:v55];
        IOHIDEventGetFloatValue();
        *(float *)&double v56 = v56;
        [(AXEventPathInfoRepresentation *)v34 setPathMajorRadiusTolerance:v56];
        IOHIDEventGetFloatValue();
        *(float *)&double v57 = v57;
        [(AXEventPathInfoRepresentation *)v34 setPathTwist:v57];
        IOHIDEventGetFloatValue();
        *(float *)&double v58 = v58;
        [(AXEventPathInfoRepresentation *)v34 setPathQuality:v58];
        IOHIDEventGetFloatValue();
        *(float *)&double v59 = v59;
        [(AXEventPathInfoRepresentation *)v34 setPathDensity:v59];
        [(AXEventPathInfoRepresentation *)v34 setPathEventMask:v41];
        v5 = v112;
        [(AXEventPathInfoRepresentation *)v34 setPathWindowContextID:[(AXEventRepresentation *)v112 contextId]];
        IOHIDEventGetFloatValue();
        *(float *)&double v60 = v60;
        [(AXEventPathInfoRepresentation *)v34 setOrbValue:v60];
        [(AXEventPathInfoRepresentation *)v34 setTransducerType:IOHIDEventGetIntegerValue()];
        IOHIDEventGetFloatValue();
        *(float *)&double v61 = v61;
        [(AXEventPathInfoRepresentation *)v34 setAltitude:v61];
        IOHIDEventGetFloatValue();
        *(float *)&double v62 = v62;
        [(AXEventPathInfoRepresentation *)v34 setAzimuth:v62];
        IOHIDEventGetFloatValue();
        *(float *)&double v63 = v63;
        [(AXEventPathInfoRepresentation *)v34 setBarrelPressure:v63];
        IOHIDEventGetFloatValue();
        *(float *)&double v64 = v64;
        [(AXEventPathInfoRepresentation *)v34 setRoll:v64];
        [(AXEventPathInfoRepresentation *)v34 setWillUpdateMask:IOHIDEventGetIntegerValue()];
        [(AXEventPathInfoRepresentation *)v34 setDidUpdateMask:IOHIDEventGetIntegerValue()];
        [(AXEventPathInfoRepresentation *)v34 setPhaseBits:IOHIDEventGetPhase()];

        CFArrayRef v15 = v111;
        v30 = v114;
        uint64_t v32 = v117;
      }
      CFIndex v31 = ++v33;
    }
    while (v116 > v33);
  }
  v65 = [(AXEventRepresentation *)v5 handInfo];
  [v65 setPathsIncludingMayBeginEvents:v30];

  IOHIDEventGetFloatValue();
  double v67 = v66;
  IOHIDEventGetFloatValue();
  double v69 = v68;
  double v70 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (*MEMORY[0x1E4F1DAD8] == v67 && v70 == v68)
  {
    p_opt_class_meths = &OBJC_PROTOCOL___WFWorkflowRunnerClientDelegate.opt_class_meths;
    if (objc_msgSend(v30, "count", *MEMORY[0x1E4F1DAD8], v70))
    {
      v73 = [v30 objectAtIndex:0];
      [v73 pathLocation];
      double v67 = v74;
      double v69 = v75;
    }
  }
  else
  {
    p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___WFWorkflowRunnerClientDelegate + 48);
  }
  -[AXEventRepresentation setWindowLocation:](v5, "setWindowLocation:", v67, v69);
  -[AXEventRepresentation setLocation:](v5, "setLocation:", v67, v69);
  [(AXEventRepresentation *)v5 setType:3001];
  v76 = p_opt_class_meths[381];
  id v77 = v113;
  [(__objc2_meth_list *)v76 lock];
  v78 = [(id)HIDStreamIdentifierTouchCounts objectForKey:v77];

  uint64_t v79 = [v78 integerValue];
  [(__objc2_meth_list *)p_opt_class_meths[381] unlock];
  v80 = [(AXEventRepresentation *)v5 handInfo];
  [v80 setCurrentFingerCount:(unsigned __int16)v32];

  v81 = [(AXEventRepresentation *)v5 handInfo];
  v82 = v81;
  if (v79 <= 0) {
    unsigned __int16 v83 = v116;
  }
  else {
    unsigned __int16 v83 = v79;
  }
  [v81 setInitialFingerCount:v83];

  id v84 = v77;
  [(__objc2_meth_list *)p_opt_class_meths[381] lock];
  v85 = [(id)HIDStreamIdentifierPhasesForTouches objectForKey:v84];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v86 = [v85 allValues];
  uint64_t v87 = [v86 countByEnumeratingWithState:&v119 objects:v123 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = v32;
    unsigned __int16 v90 = 0;
    uint64_t v91 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v88; ++i)
      {
        if (*(void *)v120 != v91) {
          objc_enumerationMutation(v86);
        }
        if ([*(id *)(*((void *)&v119 + 1) + 8 * i) unsignedIntValue] != 8) {
          ++v90;
        }
      }
      uint64_t v88 = [v86 countByEnumeratingWithState:&v119 objects:v123 count:16];
    }
    while (v88);
    v5 = v112;
    uint64_t v32 = v89;
    p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___WFWorkflowRunnerClientDelegate + 48);
  }
  else
  {
    unsigned __int16 v90 = 0;
  }

  [(__objc2_meth_list *)p_opt_class_meths[381] unlock];
  v93 = [(AXEventRepresentation *)v5 handInfo];
  [v93 setLifetimeFingerCount:v90];

  if (v107 < 0)
  {
    v99 = [(AXEventRepresentation *)v5 handInfo];
    [v99 setEventType:8];

    _setInitialTouchCount(0, v84);
    [(__objc2_meth_list *)p_opt_class_meths[381] lock];
    [(id)HIDStreamIdentifierPhasesForTouches removeAllObjects];
    [(__objc2_meth_list *)p_opt_class_meths[381] unlock];
    char v94 = v108;
  }
  else
  {
    char v94 = v108;
    if (v108)
    {
      v95 = [(AXEventRepresentation *)v5 handInfo];
      v96 = v95;
      uint64_t v97 = 11;
LABEL_64:
      [v95 setEventType:v97];

      v98 = v114;
      goto LABEL_91;
    }
    if (!v32 || v79 < 1 || v79 == v32 || ((v118 ^ 1) & 1) != 0)
    {
      if (!v32 || v79)
      {
        if (!v15)
        {
          v95 = [(AXEventRepresentation *)v5 handInfo];
          v96 = v95;
          uint64_t v97 = 12;
          goto LABEL_64;
        }
        if (v32) {
          BOOL v103 = 1;
        }
        else {
          BOOL v103 = v79 == 0;
        }
        int v104 = v103;
        if ((v104 | v110))
        {
          if (((v32 == 0) & (v115 ^ 1)) != 0)
          {
            if (v110)
            {
              v100 = [(AXEventRepresentation *)v5 handInfo];
              v101 = v100;
              uint64_t v102 = 9;
            }
            else if (v79)
            {
              _AXAssert();
              v100 = [(AXEventRepresentation *)v5 handInfo];
              v101 = v100;
              uint64_t v102 = 0;
            }
            else
            {
              v100 = [(AXEventRepresentation *)v5 handInfo];
              v101 = v100;
              uint64_t v102 = 10;
            }
          }
          else
          {
            v100 = [(AXEventRepresentation *)v5 handInfo];
            v101 = v100;
            uint64_t v102 = 2;
          }
        }
        else
        {
          v100 = [(AXEventRepresentation *)v5 handInfo];
          v101 = v100;
          uint64_t v102 = 6;
        }
      }
      else
      {
        v100 = [(AXEventRepresentation *)v5 handInfo];
        v101 = v100;
        uint64_t v102 = 1;
      }
    }
    else
    {
      v100 = [(AXEventRepresentation *)v5 handInfo];
      v101 = v100;
      uint64_t v102 = 5;
    }
    [v100 setEventType:v102];
  }
  if (v15) {
    char v105 = v94;
  }
  else {
    char v105 = 1;
  }
  v98 = v114;
  if (v105)
  {
LABEL_91:
    if ((IOHIDEventGetIntegerValue() & 0x200) == 0) {
      goto LABEL_93;
    }
  }
  _setInitialTouchCount(v32, v84);
LABEL_93:

  return v5;
}

- (void)resetInitialTouchCountValueForHidStreamIdentifier:(id)a3
{
}

- (BOOL)isUpdate
{
  if (![(AXEventRepresentation *)self generationCount]) {
    return 0;
  }
  unsigned int v3 = [(AXEventRepresentation *)self didUpdateMask];
  id v4 = [(AXEventRepresentation *)self handInfo];
  v5 = [v4 paths];

  if (v3)
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = [v5 count];
      BOOL v6 = v7 < v8;
      if (v7 >= v8) {
        break;
      }
      CFIndex v9 = [v5 objectAtIndex:v7];
      int v10 = [v9 didUpdateMask];

      ++v7;
    }
    while (!v10);
  }

  return v6;
}

- (BOOL)willBeUpdated
{
  if (![(AXEventRepresentation *)self generationCount]) {
    return 0;
  }
  unsigned int v3 = [(AXEventRepresentation *)self willUpdateMask];
  id v4 = [(AXEventRepresentation *)self handInfo];
  v5 = [v4 paths];

  if (v3)
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v7 = 0;
    do
    {
      unint64_t v8 = [v5 count];
      BOOL v6 = v7 < v8;
      if (v7 >= v8) {
        break;
      }
      CFIndex v9 = [v5 objectAtIndex:v7];
      int v10 = [v9 willUpdateMask];

      ++v7;
    }
    while (!v10);
  }

  return v6;
}

+ (void)_appendKeyInfoToMediaKey:(id)a3 usage:(int64_t)a4 downEvent:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  unint64_t v7 = objc_alloc_init(AXEventKeyInfoRepresentation);
  if (a4 <= 225)
  {
    if (a4 > 183)
    {
      unint64_t v8 = v10;
      if (a4 == 184) {
        goto LABEL_18;
      }
      if (a4 == 205)
      {
        a4 = 65;
        goto LABEL_18;
      }
    }
    else
    {
      unint64_t v8 = v10;
      if (a4 == 179)
      {
        a4 = 66;
        goto LABEL_18;
      }
      if (a4 == 180)
      {
        a4 = 64;
LABEL_18:
        objc_msgSend(v10, "setOriginalType:", objc_msgSend(v8, "type"));
        if (v5) {
          uint64_t v9 = 10;
        }
        else {
          uint64_t v9 = 11;
        }
        [v10 setType:v9];
        goto LABEL_22;
      }
    }
LABEL_15:
    a4 = 0;
    goto LABEL_18;
  }
  if (a4 > 233)
  {
    unint64_t v8 = v10;
    if (a4 == 234)
    {
      a4 = 68;
    }
    else if (a4 != 669)
    {
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v8 = v10;
    if (a4 == 226)
    {
      a4 = 67;
      goto LABEL_18;
    }
    if (a4 != 233) {
      goto LABEL_15;
    }
    a4 = 69;
  }
LABEL_22:
  [(AXEventKeyInfoRepresentation *)v7 setUsagePage:7];
  [(AXEventKeyInfoRepresentation *)v7 setKeyCode:a4];
  [(AXEventKeyInfoRepresentation *)v7 setKeyDown:v5];
  [v10 setKeyInfo:v7];
}

+ (id)_keyboardButtonEvent:(__IOHIDEvent *)a3
{
  BOOL v5 = objc_alloc_init(AXEventRepresentation);
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v7 = IOHIDEventGetIntegerValue();
  uint64_t v8 = IOHIDEventGetIntegerValue();
  uint64_t v9 = v8;
  if (IntegerValue > 143)
  {
    if (IntegerValue == 144)
    {
      if (v7 != 33) {
        goto LABEL_134;
      }
      BOOL v10 = v8 == 0;
      unsigned int v11 = 1044;
      goto LABEL_130;
    }
    if (IntegerValue != 255 && IntegerValue != 65281) {
      goto LABEL_134;
    }
LABEL_9:
    CFArrayRef v12 = objc_alloc_init(AXEventKeyInfoRepresentation);
    if (v9) {
      uint64_t v13 = 10;
    }
    else {
      uint64_t v13 = 11;
    }
    [(AXEventRepresentation *)v5 setType:v13];
    if (IntegerValue == 65281)
    {
      if (v7 > 31)
      {
        switch(v7)
        {
          case 32:
            CFArrayRef v14 = v12;
            uint64_t v15 = 59;
            goto LABEL_69;
          case 33:
            CFArrayRef v14 = v12;
            uint64_t v15 = 58;
            goto LABEL_69;
          case 512:
            if (v9) {
              uint64_t v18 = 1105;
            }
            else {
              uint64_t v18 = 1106;
            }
            [(AXEventRepresentation *)v5 setType:v18];
            goto LABEL_70;
        }
      }
      else if (v7 == 2 || v7 == 4)
      {
        [(AXEventKeyInfoRepresentation *)v12 setAlternativeKeyCode:61];
      }
      else if (v7 == 16)
      {
        CFArrayRef v14 = v12;
        uint64_t v15 = 60;
LABEL_69:
        [(AXEventKeyInfoRepresentation *)v14 setAlternativeKeyCode:v15];
LABEL_70:
        [(AXEventKeyInfoRepresentation *)v12 setKeyCode:(unsigned __int16)v7];
        [(AXEventKeyInfoRepresentation *)v12 setUsagePage:IntegerValue];
        [(AXEventKeyInfoRepresentation *)v12 setKeyDown:v9 != 0];
        [(AXEventRepresentation *)v5 setKeyInfo:v12];
        [(AXEventRepresentation *)v5 setFlags:IOHIDEventGetEventFlags()];

        goto LABEL_134;
      }
    }
    BOOL v19 = IntegerValue == 65281 || IntegerValue == 255;
    if (v19 && v7 == 3)
    {
      _AXEventKeyInfoSetSimulatedFNKeyDown(v9 != 0);
      [a1 _appendKeyInfoToMediaKey:v5 usage:3 downEvent:v9 != 0];
    }
    goto LABEL_70;
  }
  switch(IntegerValue)
  {
    case 1:
      if (v7 > 133)
      {
        switch(v7)
        {
          case 134:
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1216;
            goto LABEL_130;
          case 138:
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1214;
            goto LABEL_130;
          case 139:
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1212;
            goto LABEL_130;
          case 140:
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1208;
            goto LABEL_130;
          case 141:
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1210;
            goto LABEL_130;
          default:
            goto LABEL_134;
        }
        goto LABEL_134;
      }
      switch(v7)
      {
        case 1:
LABEL_53:
          BOOL v10 = v8 == 0;
          unsigned int v11 = 4200;
          break;
        case 2:
LABEL_54:
          BOOL v10 = v8 == 0;
          unsigned int v11 = 4202;
          break;
        case 3:
LABEL_52:
          BOOL v10 = v8 == 0;
          unsigned int v11 = 4204;
          break;
        default:
          goto LABEL_134;
      }
      break;
    case 7:
      goto LABEL_9;
    case 9:
      switch(v7)
      {
        case 3:
          goto LABEL_52;
        case 2:
          goto LABEL_54;
        case 1:
          goto LABEL_53;
      }
      goto LABEL_134;
    case 11:
      if (v7 == 45)
      {
        BOOL v16 = v8 == 0;
        unsigned int v17 = 1042;
      }
      else
      {
        if (v7 != 46) {
          goto LABEL_134;
        }
        BOOL v16 = v8 == 0;
        unsigned int v17 = 1012;
      }
      if (v16) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = v17 + 1;
      }
      goto LABEL_133;
    case 12:
      if (v7 > 175)
      {
        if (v7 <= 225)
        {
          switch(v7)
          {
            case 176:
              BOOL v10 = v8 == 0;
              unsigned int v11 = 1027;
              goto LABEL_130;
            case 177:
              BOOL v10 = v8 == 0;
              unsigned int v11 = 1036;
              goto LABEL_130;
            case 178:
              BOOL v10 = v8 == 0;
              unsigned int v11 = 1021;
              goto LABEL_130;
            case 179:
              BOOL v21 = v8 != 0;
              if (v8) {
                uint64_t v27 = 1038;
              }
              else {
                uint64_t v27 = 1039;
              }
              [(AXEventRepresentation *)v5 setType:v27];
              id v23 = a1;
              double v24 = v5;
              uint64_t v25 = 179;
              goto LABEL_127;
            case 180:
              BOOL v21 = v8 != 0;
              if (v8) {
                uint64_t v28 = 1040;
              }
              else {
                uint64_t v28 = 1041;
              }
              [(AXEventRepresentation *)v5 setType:v28];
              id v23 = a1;
              double v24 = v5;
              uint64_t v25 = 180;
              goto LABEL_127;
            case 181:
            case 182:
            case 183:
              goto LABEL_137;
            case 184:
              BOOL v21 = v8 != 0;
              if (v8) {
                uint64_t v29 = 1029;
              }
              else {
                uint64_t v29 = 1030;
              }
              [(AXEventRepresentation *)v5 setType:v29];
              id v23 = a1;
              double v24 = v5;
              uint64_t v25 = 184;
              goto LABEL_127;
            default:
              if (v7 != 205) {
                goto LABEL_137;
              }
              BOOL v21 = v8 != 0;
              if (v8) {
                uint64_t v26 = 1032;
              }
              else {
                uint64_t v26 = 1033;
              }
              [(AXEventRepresentation *)v5 setType:v26];
              id v23 = a1;
              double v24 = v5;
              uint64_t v25 = 205;
              break;
          }
          goto LABEL_127;
        }
        if (v7 > 432)
        {
          switch(v7)
          {
            case 433:
              BOOL v10 = v8 == 0;
              unsigned int v11 = 1023;
              goto LABEL_130;
            case 669:
              BOOL v21 = v8 != 0;
              if (v8) {
                uint64_t v32 = 4500;
              }
              else {
                uint64_t v32 = 4501;
              }
              [(AXEventRepresentation *)v5 setType:v32];
              _AXEventKeyInfoSetSimulatedFNKeyDown(v21);
              id v23 = a1;
              double v24 = v5;
              uint64_t v25 = 669;
              goto LABEL_127;
            case 547:
              BOOL v10 = v8 == 0;
              unsigned int v11 = 1034;
              goto LABEL_130;
          }
        }
        else
        {
          switch(v7)
          {
            case 226:
              BOOL v21 = v8 != 0;
              if (v8) {
                uint64_t v30 = 1025;
              }
              else {
                uint64_t v30 = 1026;
              }
              [(AXEventRepresentation *)v5 setType:v30];
              id v23 = a1;
              double v24 = v5;
              uint64_t v25 = 226;
              goto LABEL_127;
            case 233:
              BOOL v21 = v8 != 0;
              if (v8) {
                uint64_t v31 = 1006;
              }
              else {
                uint64_t v31 = 1007;
              }
              [(AXEventRepresentation *)v5 setType:v31];
              id v23 = a1;
              double v24 = v5;
              uint64_t v25 = 233;
              goto LABEL_127;
            case 234:
              BOOL v21 = v8 != 0;
              if (v8) {
                uint64_t v22 = 1008;
              }
              else {
                uint64_t v22 = 1009;
              }
              [(AXEventRepresentation *)v5 setType:v22];
              id v23 = a1;
              double v24 = v5;
              uint64_t v25 = 234;
LABEL_127:
              [v23 _appendKeyInfoToMediaKey:v24 usage:v25 downEvent:v21];
              goto LABEL_134;
          }
        }
LABEL_137:

        BOOL v5 = 0;
        goto LABEL_134;
      }
      if (v7 > 95)
      {
        if (v7 > 140)
        {
          if (v7 == 141)
          {
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1226;
            break;
          }
          if (v7 == 149)
          {
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1103;
            break;
          }
        }
        else
        {
          if (v7 == 96)
          {
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1222;
            break;
          }
          if (v7 == 128)
          {
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1220;
            break;
          }
        }
        goto LABEL_137;
      }
      switch(v7)
      {
        case '@':
          BOOL v10 = v8 == 0;
          unsigned int v11 = 1000;
          goto LABEL_130;
        case 'A':
          BOOL v10 = v8 == 0;
          unsigned int v11 = 1218;
          goto LABEL_130;
        case 'B':
          BOOL v10 = v8 == 0;
          unsigned int v11 = 1200;
          goto LABEL_130;
        case 'C':
          BOOL v10 = v8 == 0;
          unsigned int v11 = 1202;
          goto LABEL_130;
        case 'D':
          BOOL v10 = v8 == 0;
          unsigned int v11 = 1204;
          goto LABEL_130;
        case 'E':
          BOOL v10 = v8 == 0;
          unsigned int v11 = 1206;
          goto LABEL_130;
        default:
          if (v7 == 4)
          {
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1224;
          }
          else
          {
            if (v7 != 48) {
              goto LABEL_137;
            }
            BOOL v10 = v8 == 0;
            unsigned int v11 = 1010;
          }
          break;
      }
      break;
    default:
      goto LABEL_134;
  }
LABEL_130:
  if (v10) {
    uint64_t v20 = v11 + 1;
  }
  else {
    uint64_t v20 = v11;
  }
LABEL_133:
  [(AXEventRepresentation *)v5 setType:v20];
LABEL_134:
  [(AXEventRepresentation *)v5 setContextId:_ContextIDFromEvent((uint64_t)a3)];

  return v5;
}

+ (id)_wheelEvent:(__IOHIDEvent *)a3
{
  unsigned int v3 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v3 setType:1100];
  [(AXEventRepresentation *)v3 setScrollAmount:IOHIDEventGetIntegerValue()];
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    CFArrayRef v5 = Children;
    if (CFArrayGetCount(Children) >= 1)
    {
      CFArrayGetValueAtIndex(v5, 0);
      IOHIDEventGetFloatValue();
      [(AXEventRepresentation *)v3 setScrollAccelAmount:(uint64_t)v6];
    }
  }

  return v3;
}

+ (id)_gameControllerEvent:(__IOHIDEvent *)a3
{
  id v4 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v4 setType:1300];
  CFArrayRef v5 = +[AXGameControllerEvent axGameControllerInfoRepresentationFromEvent:a3];
  [(AXEventRepresentation *)v4 setGameControllerInfo:v5];

  return v4;
}

+ (id)_gameKeyboardControllerEvent:(__IOHIDEvent *)a3
{
  return +[AXGameControllerEvent axGameControllerInfoRepresentationFromEvent:a3];
}

+ (id)_pointerControllerEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4 serviceClient:(__IOHIDServiceClient *)a5
{
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v8 setType:3200];
  uint64_t v9 = objc_alloc_init(AXEventPointerInfoRepresentation);
  [(AXEventRepresentation *)v8 setPointerControllerInfo:v9];
  IOHIDEventGetFloatMultiple();
  [(AXEventPointerInfoRepresentation *)v9 setPointerX:v19];
  [(AXEventPointerInfoRepresentation *)v9 setPointerY:v20];
  [(AXEventPointerInfoRepresentation *)v9 setPointerZ:v21];
  [(AXEventPointerInfoRepresentation *)v9 setPointerButtonMask:v22];
  [(AXEventPointerInfoRepresentation *)v9 setPointerButtonNumber:v23];
  [(AXEventPointerInfoRepresentation *)v9 setPointerButtonClickCount:v24];
  [(AXEventPointerInfoRepresentation *)v9 setPointerButtonPressure:v25];
  [(AXEventPointerInfoRepresentation *)v9 setPointerIsAbsolute:IOHIDEventGetEventFlags() & 1];
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    CFArrayRef v11 = Children;
    CFIndex Count = CFArrayGetCount(Children);
    if (Count >= 1)
    {
      CFIndex v13 = Count;
      CFIndex v14 = 0;
      while (1)
      {
        ValueAtIndedouble x = CFArrayGetValueAtIndex(v11, v14);
        int Type = IOHIDEventGetType();
        if (Type > 10) {
          break;
        }
        if (Type == 2)
        {
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerButtonMask:](v9, "setPointerButtonMask:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerButtonNumber:](v9, "setPointerButtonNumber:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerButtonClickCount:](v9, "setPointerButtonClickCount:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerButtonPressure:](v9, "setPointerButtonPressure:");
        }
        else if (Type == 6)
        {
          unsigned int v17 = [a1 representationWithHIDEvent:ValueAtIndex hidStreamIdentifier:v7];
          [(AXEventPointerInfoRepresentation *)v9 setScrollEvent:v17];
LABEL_13:
        }
LABEL_14:
        if (v13 == ++v14) {
          goto LABEL_15;
        }
      }
      if (Type != 11)
      {
        if (Type == 17)
        {
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerAccelX:](v9, "setPointerAccelX:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerAccelY:](v9, "setPointerAccelY:");
          IOHIDEventGetFloatValue();
          -[AXEventPointerInfoRepresentation setPointerAccelZ:](v9, "setPointerAccelZ:");
          [(AXEventPointerInfoRepresentation *)v9 setIsPointerMove:1];
        }
        goto LABEL_14;
      }
      unsigned int v17 = [a1 representationWithHIDEvent:ValueAtIndex hidStreamIdentifier:v7];
      [(AXEventPointerInfoRepresentation *)v9 setTrackpadHandEvent:v17];
      goto LABEL_13;
    }
  }
LABEL_15:
  [(AXEventRepresentation *)v8 setContextId:_ContextIDFromEvent((uint64_t)a3)];

  return v8;
}

+ (id)_motionGestureTapEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5 clientID:(id)a6 taskPort:(unsigned int)a7
{
  return 0;
}

+ (id)_vendorDefinedAccessibilityEvent:(__IOHIDEvent *)a3
{
  if ([a1 _HIDEventIsAccessibilityEvent:a3])
  {
    unsigned int v3 = objc_alloc_init(AXEventRepresentation);
    [(AXEventRepresentation *)v3 setType:5000];
  }
  else
  {
    unsigned int v3 = 0;
  }

  return v3;
}

+ (AXEventRepresentation)representationWithLocation:(CGPoint)a3 windowLocation:(CGPoint)a4 handInfo:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v9 = a5;
  BOOL v10 = +[AXEventRepresentation representationWithType:subtype:time:location:windowLocation:handInfo:](AXEventRepresentation, "representationWithType:subtype:time:location:windowLocation:handInfo:", 0, 0, mach_absolute_time(), v9, v8, v7, x, y);

  return (AXEventRepresentation *)v10;
}

+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4
{
  return (AXEventRepresentation *)[a1 representationWithHIDEvent:a3 hidStreamIdentifier:a4 clientID:0 taskPort:0];
}

+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5
{
  return (AXEventRepresentation *)[a1 representationWithHIDEvent:a3 serviceClient:a4 hidStreamIdentifier:a5 clientID:0 taskPort:0];
}

+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 hidStreamIdentifier:(id)a4 clientID:(id)a5 taskPort:(unsigned int)a6
{
  return (AXEventRepresentation *)[a1 representationWithHIDEvent:a3 serviceClient:0 hidStreamIdentifier:a4 clientID:a5 taskPort:*(void *)&a6];
}

+ (AXEventRepresentation)representationWithHIDEvent:(__IOHIDEvent *)a3 serviceClient:(__IOHIDServiceClient *)a4 hidStreamIdentifier:(id)a5 clientID:(id)a6 taskPort:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    uint64_t v15 = 0;
LABEL_27:
    if (!v15)
    {
      double v24 = [MEMORY[0x1E4F48358] sharedInstance];
      char v25 = [v24 ignoreLogging];

      if ((v25 & 1) == 0)
      {
        uint64_t v26 = [MEMORY[0x1E4F48358] identifier];
        uint64_t v27 = AXLoggerForFacility();

        os_log_type_t v28 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = AXColorizeFormatLog();
          uint64_t v40 = a3;
          id v41 = v12;
          uint64_t v30 = _AXStringForArgs();
          if (os_log_type_enabled(v27, v28))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v43 = v30;
            _os_log_impl(&dword_18D308000, v27, v28, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    goto LABEL_34;
  }
  int Type = IOHIDEventGetType();
  uint64_t v15 = 0;
  BOOL v16 = 1;
  if (Type > 10)
  {
    switch(Type)
    {
      case 35:
        uint64_t v17 = [a1 _gameControllerEvent:a3];
        break;
      case 17:
        uint64_t v17 = [a1 _pointerControllerEvent:a3 hidStreamIdentifier:v12 serviceClient:a4];
        break;
      case 11:
        uint64_t v17 = [a1 _digitizerRepresentation:a3 hidStreamIdentifier:v12];
        break;
      default:
        goto LABEL_19;
    }
  }
  else
  {
    if (Type == 1)
    {
      uint64_t v15 = [a1 _vendorDefinedAccessibilityEvent:a3];
      BOOL v16 = v15 == 0;
      goto LABEL_19;
    }
    if (Type == 3)
    {
      uint64_t v15 = [a1 _keyboardButtonEvent:a3];
      if (v15)
      {
        uint64_t v18 = [a1 _gameKeyboardControllerEvent:a3];
        [v15 setGameControllerInfo:v18];
      }
      goto LABEL_18;
    }
    if (Type != 6) {
      goto LABEL_19;
    }
    uint64_t v17 = [a1 _wheelEvent:a3];
  }
  uint64_t v15 = (void *)v17;
LABEL_18:
  BOOL v16 = 0;
LABEL_19:
  [v15 setClientId:v13];
  [v15 setTaskPort:v7];
  uint64_t AttributeDataLength = IOHIDEventGetAttributeDataLength();
  if (AttributeDataLength >= 1)
  {
    double v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:IOHIDEventGetAttributeDataPtr() length:AttributeDataLength];
    [v15 setHIDAttributeData:v20];
  }
  [v15 setIsBuiltIn:IOHIDEventGetIntegerValue() != 0];
  BOOL v21 = IOHIDEventGetType() == 11 && IOHIDEventGetIntegerValue() != 0;
  [v15 setIsDisplayIntegrated:v21];
  [v15 setGenerationCount:IOHIDEventGetIntegerValue()];
  [v15 setWillUpdateMask:IOHIDEventGetIntegerValue()];
  [v15 setDidUpdateMask:IOHIDEventGetIntegerValue()];
  [v15 setSenderID:IOHIDEventGetSenderID()];
  [v15 setHIDTime:IOHIDEventGetTimeStamp()];
  unint64_t v22 = [v15 HIDTime];
  if (_AXGSEventConvertFromMachTime_onceToken != -1) {
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_851);
  }
  [v15 setTime:(unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v22)];
  [v15 setIsGeneratedEvent:0];
  [v15 setCreatorHIDEvent:a3];
  [v15 setCreatorHIDServiceClient:a4];
  double v23 = [v15 _accessibilityDataFromRealEvent:a3];
  [v15 setAccessibilityData:v23];

  if (!v16) {
    goto LABEL_27;
  }
LABEL_34:
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (!Children) {
    goto LABEL_39;
  }
  CFArrayRef v32 = Children;
  if (CFArrayGetCount(Children) < 1) {
    goto LABEL_39;
  }
  ValueAtIndedouble x = CFArrayGetValueAtIndex(v32, 0);
  v34 = _GetSubEventInfoFromDigitizerEventForPathEvent((uint64_t)a3, (uint64_t)ValueAtIndex);
  int v35 = [v34 locus];

  if (!v35) {
    goto LABEL_39;
  }
  double v36 = _GetSubEventInfoFromDigitizerEventForPathEvent((uint64_t)a3, (uint64_t)ValueAtIndex);
  int v37 = [v36 userIdentifier];

  if (v37) {
    BOOL v38 = _ContextIDFromEvent((uint64_t)a3) != 0;
  }
  else {
LABEL_39:
  }
    BOOL v38 = 0;
  objc_msgSend(v15, "setSystemDrag:", v38, v40, v41);

  return (AXEventRepresentation *)v15;
}

+ (id)accelerometerRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v4 setType:23];
  [(AXEventRepresentation *)v4 setHIDTime:mach_absolute_time()];
  unint64_t v5 = [(AXEventRepresentation *)v4 HIDTime];
  if (_AXGSEventConvertFromMachTime_onceToken != -1) {
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_851);
  }
  [(AXEventRepresentation *)v4 setTime:(unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v5)];
  [(AXEventRepresentation *)v4 setAccelerometerInfo:v3];

  return v4;
}

+ (id)keyRepresentationWithType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v4 setType:v3];
  [(AXEventRepresentation *)v4 setHIDTime:mach_absolute_time()];
  unint64_t v5 = [(AXEventRepresentation *)v4 HIDTime];
  if (_AXGSEventConvertFromMachTime_onceToken != -1) {
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_851);
  }
  [(AXEventRepresentation *)v4 setTime:(unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v5)];
  double v6 = objc_alloc_init(AXEventKeyInfoRepresentation);
  [(AXEventKeyInfoRepresentation *)v6 setKeyDown:v3 == 10];
  [(AXEventKeyInfoRepresentation *)v6 setUsagePage:7];
  [(AXEventRepresentation *)v4 setKeyInfo:v6];
  [(AXEventRepresentation *)v4 setIsGeneratedEvent:1];

  return v4;
}

+ (id)buttonRepresentationWithType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v4 setType:v3];
  [(AXEventRepresentation *)v4 setHIDTime:mach_absolute_time()];
  unint64_t v5 = [(AXEventRepresentation *)v4 HIDTime];
  if (_AXGSEventConvertFromMachTime_onceToken != -1) {
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_851);
  }
  [(AXEventRepresentation *)v4 setTime:(unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v5)];
  [(AXEventRepresentation *)v4 setIsGeneratedEvent:1];

  return v4;
}

+ (id)iosmacPointerRepresentationWithTypeWithPointerInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v4 setType:3201];
  [(AXEventRepresentation *)v4 setHIDTime:mach_absolute_time()];
  unint64_t v5 = [(AXEventRepresentation *)v4 HIDTime];
  if (_AXGSEventConvertFromMachTime_onceToken != -1) {
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_851);
  }
  [(AXEventRepresentation *)v4 setTime:(unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v5)];
  [(AXEventRepresentation *)v4 setIsGeneratedEvent:1];
  [(AXEventRepresentation *)v4 setIosmacPointerInfo:v3];

  return v4;
}

+ (id)gestureRepresentationWithHandType:(unsigned int)a3 locations:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = objc_alloc_init(AXEventHandInfoRepresentation);
  [(AXEventHandInfoRepresentation *)v6 setEventType:v4];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    char v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        CFIndex v14 = objc_alloc_init(AXEventPathInfoRepresentation);
        [v13 axCGPointValue];
        -[AXEventPathInfoRepresentation setPathLocation:](v14, "setPathLocation:");
        [(AXEventPathInfoRepresentation *)v14 setPathIndex:(v11 + i)];
        [(AXEventPathInfoRepresentation *)v14 setPathIdentity:(v11 + i)];
        [(AXEventPathInfoRepresentation *)v14 setTransducerType:2];
        if (v4 <= 0xB && ((1 << v4) & 0x826) != 0) {
          [(AXEventPathInfoRepresentation *)v14 setPathProximity:[(AXEventPathInfoRepresentation *)v14 pathProximity] | 3];
        }
        [(AXEventHandInfoRepresentation *)v6 setHandIndex:1];
        [v7 addObject:v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      v11 += i;
    }
    while (v9);
  }

  [(AXEventHandInfoRepresentation *)v6 setPaths:v7];
  uint64_t v15 = mach_absolute_time();
  BOOL v16 = [obj firstObject];
  [v16 axCGPointValue];
  double v18 = v17;
  double v20 = v19;
  BOOL v21 = [obj firstObject];
  [v21 axCGPointValue];
  double v24 = +[AXEventRepresentation representationWithType:subtype:time:location:windowLocation:handInfo:](AXEventRepresentation, "representationWithType:subtype:time:location:windowLocation:handInfo:", 3001, 0, v15, v6, v18, v20, v22, v23);

  return v24;
}

+ (id)touchRepresentationWithHandType:(unsigned int)a3 location:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v6 = *(void *)&a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(AXEventHandInfoRepresentation);
  [(AXEventHandInfoRepresentation *)v7 setEventType:v6];
  uint64_t v8 = objc_alloc_init(AXEventPathInfoRepresentation);
  -[AXEventPathInfoRepresentation setPathLocation:](v8, "setPathLocation:", x, y);
  [(AXEventPathInfoRepresentation *)v8 setPathIndex:1];
  [(AXEventPathInfoRepresentation *)v8 setTransducerType:2];
  if (v6 <= 0xB && ((1 << v6) & 0x806) != 0) {
    [(AXEventPathInfoRepresentation *)v8 setPathProximity:[(AXEventPathInfoRepresentation *)v8 pathProximity] | 3];
  }
  [(AXEventHandInfoRepresentation *)v7 setHandIndex:1];
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(AXEventHandInfoRepresentation *)v7 setPaths:v9];

  if (v6 == 1) {
    [(id)objc_opt_class() incrementTouchCounter];
  }
  uint64_t v10 = +[AXEventRepresentation representationWithType:subtype:time:location:windowLocation:handInfo:](AXEventRepresentation, "representationWithType:subtype:time:location:windowLocation:handInfo:", 3001, 0, mach_absolute_time(), v7, x, y, x, y);

  return v10;
}

+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5
{
  return (id)[a1 accessibilityEventRepresentationWithSender:a3 usagePage:a4 usage:a5 modifierFlags:0];
}

+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6
{
  return (id)[a1 accessibilityEventRepresentationWithSender:a3 usagePage:a4 usage:a5 modifierFlags:a6 eventValue1:0.0 eventValue2:0.0];
}

+ (id)accessibilityEventRepresentationWithSender:(int64_t)a3 usagePage:(int64_t)a4 usage:(int64_t)a5 modifierFlags:(int64_t)a6 eventValue1:(float)a7 eventValue2:(float)a8
{
  CFIndex v14 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v14 setType:5000];
  [(AXEventRepresentation *)v14 setHIDTime:mach_absolute_time()];
  unint64_t v15 = [(AXEventRepresentation *)v14 HIDTime];
  if (_AXGSEventConvertFromMachTime_onceToken != -1) {
    dispatch_once(&_AXGSEventConvertFromMachTime_onceToken, &__block_literal_global_851);
  }
  [(AXEventRepresentation *)v14 setTime:(unint64_t)(*(double *)&_AXGSEventConvertFromMachTime___scale * (double)v15)];
  [(AXEventRepresentation *)v14 setIsGeneratedEvent:1];
  *(float *)&double v16 = a7;
  *(float *)&double v17 = a8;
  double v18 = +[AXEventData dataWithSender:a3 page:a4 usage:a5 modifierFlags:a6 eventValue1:v16 eventValue2:v17];
  [(AXEventRepresentation *)v14 setAccessibilityData:v18];

  return v14;
}

- (id)dataRepresentation
{
  uint64_t v4 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v4];

  return v2;
}

- (__IOHIDEvent)newHIDEventRef
{
  uint64_t v3 = [(AXEventRepresentation *)self originalType];
  uint64_t v4 = 0;
  if ((int)v3 <= 1100)
  {
    if ((int)v3 <= 999)
    {
      if ((v3 - 10) >= 3)
      {
        if (v3 != 23) {
          return v4;
        }
        id v5 = [(AXEventRepresentation *)self _newAccelerometerHIDEventRef];
      }
      else
      {
        id v5 = [(AXEventRepresentation *)self _newKeyboardHIDEventRef];
      }
      goto LABEL_21;
    }
    char v6 = v3 + 24;
    if ((v3 - 1000) <= 0x33)
    {
      if (((1 << v6) & 0xFCF66603FC3) != 0) {
        goto LABEL_20;
      }
      if (((1 << v6) & 0xFF00000000000) != 0)
      {
        id v5 = [(AXEventRepresentation *)self _newTostadaButtonHIDEventRefWithType:v3];
        goto LABEL_21;
      }
    }
    if (v3 != 1100) {
      return v4;
    }
    return [(AXEventRepresentation *)self _newScrollHIDEventRef];
  }
  else
  {
    if ((int)v3 <= 3200)
    {
      if (((v3 - 1200) > 0x19 || ((1 << (v3 + 80)) & 0x3CFFFFF) == 0) && (v3 - 1101) >= 6)
      {
        if (v3 == 3001)
        {
          id v5 = [(AXEventRepresentation *)self _newHandHIDEventRef];
          goto LABEL_21;
        }
        return v4;
      }
      goto LABEL_20;
    }
    if ((int)v3 <= 4499)
    {
      if ((v3 - 4200) >= 6)
      {
        if (v3 != 3201) {
          return v4;
        }
        id v5 = [(AXEventRepresentation *)self _newIOSMACPointerRef];
LABEL_21:
        uint64_t v4 = v5;
        if (v5)
        {
          [(AXEventRepresentation *)self isBuiltIn];
          IOHIDEventSetIntegerValue();
          [(AXEventRepresentation *)self _applyAccessibilityDataToRealEvent:v4];
        }
        return v4;
      }
LABEL_20:
      id v5 = [(AXEventRepresentation *)self _newButtonHIDEventRefWithType:v3];
      goto LABEL_21;
    }
    if ((v3 - 4500) < 2) {
      goto LABEL_20;
    }
    if (v3 != 5000) {
      return v4;
    }
    return [(AXEventRepresentation *)self _newAccessibilityHIDEventRef];
  }
}

- (BOOL)isDownEvent
{
  int v2 = [(AXEventRepresentation *)self type];
  BOOL result = 1;
  if (v2 > 1199)
  {
    unsigned int v4 = v2 - 1200;
    BOOL v5 = v4 > 0x1E;
    int v6 = (1 << v4) & 0x55555555;
    if (!v5 && v6 != 0) {
      return result;
    }
    return 0;
  }
  if (((v2 - 1006) > 0x1A || ((1 << (v2 + 18)) & 0x4200005) == 0)
    && ((v2 - 1101) > 4 || ((1 << (v2 - 77)) & 0x15) == 0)
    && v2 != 10)
  {
    return 0;
  }
  return result;
}

- (unint64_t)_machTimeForHIDEventRef
{
  uint64_t v3 = mach_absolute_time();
  if (![(AXEventRepresentation *)self useOriginalHIDTime]) {
    return v3;
  }

  return [(AXEventRepresentation *)self HIDTime];
}

- (__IOHIDEvent)_newAccelerometerHIDEventRef
{
  [(AXEventRepresentation *)self _machTimeForHIDEventRef];
  uint64_t v3 = [(AXEventRepresentation *)self accelerometerInfo];
  [v3 x];
  unsigned int v4 = [(AXEventRepresentation *)self accelerometerInfo];
  [v4 y];
  BOOL v5 = [(AXEventRepresentation *)self accelerometerInfo];
  [v5 z];
  int v6 = [(AXEventRepresentation *)self accelerometerInfo];
  [v6 type];
  AccelerometerEventWithint Type = (__IOHIDEvent *)IOHIDEventCreateAccelerometerEventWithType();

  [(AXEventRepresentation *)self senderID];
  IOHIDEventSetSenderID();
  return AccelerometerEventWithType;
}

- (__IOHIDEvent)_newScrollHIDEventRef
{
  uint64_t v3 = *MEMORY[0x1E4F1CF80];
  unint64_t v4 = [(AXEventRepresentation *)self _machTimeForHIDEventRef];
  v5.n128_f64[0] = (double)[(AXEventRepresentation *)self scrollAmount];
  v6.n128_u64[0] = 0;
  v7.n128_u64[0] = 0;

  return (__IOHIDEvent *)MEMORY[0x1F40E8978](v3, v4, 0, v6, v5, v7);
}

- (__IOHIDEvent)_newKeyboardHIDEventRef
{
  uint64_t v3 = [(AXEventRepresentation *)self keyInfo];
  [v3 usagePage];

  [(AXEventRepresentation *)self isDownEvent];
  [(AXEventRepresentation *)self _machTimeForHIDEventRef];
  KeyboardEvent = (__IOHIDEvent *)IOHIDEventCreateKeyboardEvent();
  __n128 v5 = [(AXEventRepresentation *)self HIDAttributeData];

  if (v5)
  {
    id v6 = [(AXEventRepresentation *)self HIDAttributeData];
    [v6 bytes];
    __n128 v7 = [(AXEventRepresentation *)self HIDAttributeData];
    [v7 length];
    IOHIDEventSetAttributeData();
  }
  [(AXEventRepresentation *)self senderID];
  IOHIDEventSetSenderID();
  uint64_t v8 = [(AXEventRepresentation *)self keyInfo];
  [v8 keyCode];
  IOHIDEventSetIntegerValue();

  IOHIDEventSetIntegerValue();
  [(AXEventRepresentation *)self flags];
  IOHIDEventSetEventFlags();
  return KeyboardEvent;
}

- (__IOHIDEvent)_newButtonHIDEventRefWithType:(unsigned int)a3
{
  KeyboardEvent = 0;
  if ((int)a3 <= 4199)
  {
    if (a3 <= 0x1067)
    {
      switch(a3)
      {
        case 0x4B0u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B1u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B2u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B3u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B4u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B5u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B6u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B7u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B8u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4B9u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4BAu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4BBu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4BCu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4BDu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4BEu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4BFu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4C0u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4C1u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4C2u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4C3u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4C4u:
        case 0x4C5u:
          return KeyboardEvent;
        case 0x4C6u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4C7u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4C8u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4C9u:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4CAu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4CBu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4CCu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4CDu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4CEu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        case 0x4CFu:
          int v5 = 0;
          int v6 = 0;
          goto LABEL_105;
        default:
          JUMPOUT(0);
      }
    }
    int v5 = 0;
    int v6 = 0;
    switch(a3)
    {
      case 0x3E8u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x3E9u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x3EAu:
      case 0x3EBu:
      case 0x3ECu:
      case 0x3EDu:
      case 0x3F6u:
      case 0x3F7u:
      case 0x3F8u:
      case 0x3F9u:
      case 0x3FAu:
      case 0x3FBu:
      case 0x3FCu:
      case 0x403u:
      case 0x404u:
      case 0x407u:
      case 0x40Cu:
      case 0x40Du:
        return KeyboardEvent;
      case 0x3EEu:
        int v6 = 0;
        int v5 = 1;
        goto LABEL_105;
      case 0x3EFu:
        int v6 = 0;
        int v5 = 1;
        goto LABEL_105;
      case 0x3F0u:
        int v5 = 0;
        int v6 = 1;
        goto LABEL_105;
      case 0x3F1u:
        int v5 = 0;
        int v6 = 1;
        goto LABEL_105;
      case 0x3F2u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x3F3u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x3F4u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x3F5u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x3FDu:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x3FEu:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x3FFu:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x400u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x401u:
        goto LABEL_105;
      case 0x402u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x405u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x406u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x408u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x409u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x40Au:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x40Bu:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x40Eu:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x40Fu:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x410u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x411u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x412u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      case 0x413u:
        int v5 = 0;
        int v6 = 0;
        goto LABEL_105;
      default:
        switch(a3)
        {
          case 0x44Du:
            int v5 = 0;
            int v6 = 0;
            goto LABEL_105;
          case 0x44Eu:
            int v5 = 0;
            int v6 = 0;
            goto LABEL_105;
          case 0x44Fu:
            int v5 = 0;
            int v6 = 0;
            goto LABEL_105;
          case 0x450u:
            int v5 = 0;
            int v6 = 0;
            goto LABEL_105;
          case 0x451u:
            int v5 = 0;
            int v6 = 0;
            goto LABEL_105;
          case 0x452u:
            int v5 = 0;
            int v6 = 0;
            goto LABEL_105;
          default:
            return KeyboardEvent;
        }
    }
  }
  else
  {
    switch(a3)
    {
      case 0x1068u:
        int v5 = 0;
        int v6 = 0;
        break;
      case 0x1069u:
        int v5 = 0;
        int v6 = 0;
        break;
      case 0x106Au:
        int v5 = 0;
        int v6 = 0;
        break;
      case 0x106Bu:
        int v5 = 0;
        int v6 = 0;
        break;
      case 0x106Cu:
        int v5 = 0;
        int v6 = 0;
        break;
      case 0x106Du:
        int v5 = 0;
        int v6 = 0;
        break;
      default:
        if (a3 == 4500)
        {
          int v5 = 0;
          int v6 = 0;
        }
        else
        {
          if (a3 != 4501) {
            return KeyboardEvent;
          }
          int v5 = 0;
          int v6 = 0;
        }
        break;
    }
LABEL_105:
    [(AXEventRepresentation *)self _machTimeForHIDEventRef];
    KeyboardEvent = (__IOHIDEvent *)IOHIDEventCreateKeyboardEvent();
    __n128 v7 = [(AXEventRepresentation *)self HIDAttributeData];

    if (v7)
    {
      id v8 = [(AXEventRepresentation *)self HIDAttributeData];
      [v8 bytes];
      uint64_t v9 = [(AXEventRepresentation *)self HIDAttributeData];
      [v9 length];
      IOHIDEventSetAttributeData();
    }
    unint64_t v10 = [(AXEventRepresentation *)self additionalFlags];
    if (v5 | v6) {
      uint64_t v11 = v10 | 0x40;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v11)
    {
      IOHIDEventGetEventFlags();
      IOHIDEventSetEventFlags();
    }
    [(AXEventRepresentation *)self senderID];
    IOHIDEventSetSenderID();
  }
  return KeyboardEvent;
}

- (__IOHIDEvent)_newTostadaButtonHIDEventRefWithType:(unsigned int)a3
{
  if (a3 - 1044 > 7) {
    return 0;
  }
  [(AXEventRepresentation *)self _machTimeForHIDEventRef];
  TouchSensitiveButtonEvent = (__IOHIDEvent *)IOHIDEventCreateTouchSensitiveButtonEvent();
  ForceStageEvent = (const void *)IOHIDEventCreateForceStageEvent();
  VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
  [(AXEventRepresentation *)self senderID];
  IOHIDEventSetSenderID();
  IOHIDEventAppendEvent();
  IOHIDEventAppendEvent();
  CFRelease(ForceStageEvent);
  CFRelease(VendorDefinedEvent);
  return TouchSensitiveButtonEvent;
}

- (__IOHIDEvent)_newAccessibilityHIDEventRef
{
  [(AXEventRepresentation *)self _machTimeForHIDEventRef];
  uint64_t v3 = [(AXEventRepresentation *)self accessibilityData];
  unint64_t v4 = v3;
  if (v3)
  {
    [v3 dataBytes];
    [v4 dataLength];
    VendorDefinedEvent = (__IOHIDEvent *)IOHIDEventCreateVendorDefinedEvent();
    [(AXEventRepresentation *)self senderID];
    IOHIDEventSetSenderID();
  }
  else
  {
    VendorDefinedEvent = 0;
  }

  return VendorDefinedEvent;
}

- (id)normalizedEventRepresentation:(BOOL)a3 scale:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v5 = (AXEventRepresentation *)[(AXEventRepresentation *)self copy];
  }
  else {
    int v5 = self;
  }
  int v6 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  __n128 v7 = [(AXEventRepresentation *)v5 handInfo];
  id v8 = [v7 pathsIncludingMayBeginEvents];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v13 pathLocation];
        objc_msgSend(v13, "setPathLocation:", AXNormalizePoint(v4, v14));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v6;
}

- (id)fakeTouchScaleEventRepresentation:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (fakeTouchScaleEventRepresentation__onceToken == -1)
  {
    if (a3)
    {
LABEL_3:
      int v5 = (AXEventRepresentation *)[(AXEventRepresentation *)self copy];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&fakeTouchScaleEventRepresentation__onceToken, &__block_literal_global_34);
    if (a3) {
      goto LABEL_3;
    }
  }
  int v5 = self;
LABEL_6:
  __n128 v7 = v5;
  LODWORD(v6) = fakeTouchScaleEventRepresentation__TouchScaleFactor;
  if (*(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor != 1.0)
  {
    id v8 = [(AXEventRepresentation *)v5 handInfo];
    [v8 handPosition];
    double v10 = v9 * *(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor;
    uint64_t v11 = [(AXEventRepresentation *)v7 handInfo];
    [v11 handPosition];
    double v13 = v12 * *(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor;
    double v14 = [(AXEventRepresentation *)v7 handInfo];
    objc_msgSend(v14, "setHandPosition:", v10, v13);

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unint64_t v15 = [(AXEventRepresentation *)v7 handInfo];
    long long v16 = [v15 paths];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          [v21 pathLocation];
          objc_msgSend(v21, "setPathLocation:", v22 * *(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor, v23 * *(float *)&fakeTouchScaleEventRepresentation__TouchScaleFactor);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v18);
    }
  }

  return v7;
}

float __59__AXEventRepresentation_fakeTouchScaleEventRepresentation___block_invoke()
{
  GSMainScreenPixelSize();
  if (v0 == 1280.0)
  {
    GSMainScreenPixelSize();
    LODWORD(v0) = 0;
    if (v1 == 2272.0)
    {
      GSMainScreenScaleFactor();
      *(float *)&double v0 = 4.0 / *(float *)&v0;
      fakeTouchScaleEventRepresentation__TouchScaleFactor = LODWORD(v0);
    }
  }
  return *(float *)&v0;
}

- (void)modifyPoints:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(void))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = [(AXEventRepresentation *)self handInfo];
  double v6 = [v5 paths];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v11 pathLocation];
        v4[2](v4);
        objc_msgSend(v11, "setPathLocation:");
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)neuterUpdates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(AXEventRepresentation *)self handInfo];
  BOOL v4 = [v3 paths];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 setDidUpdateMask:0];
        [v9 setWillUpdateMask:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(AXEventRepresentation *)self setGenerationCount:0];
  [(AXEventRepresentation *)self setDidUpdateMask:0];
  [(AXEventRepresentation *)self setWillUpdateMask:0];
}

- (id)denormalizedEventRepresentation:(BOOL)a3 descale:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3) {
    BOOL v4 = (AXEventRepresentation *)[(AXEventRepresentation *)self copy];
  }
  else {
    BOOL v4 = self;
  }
  uint64_t v5 = v4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(AXEventRepresentation *)v4 handInfo];
  uint64_t v7 = [v6 pathsIncludingMayBeginEvents];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v12 pathLocation];
        AXDenormalizePoint();
        objc_msgSend(v12, "setPathLocation:");
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v5;
}

- (__IOHIDEvent)_newIOSMACPointerRef
{
  [(AXEventRepresentation *)self HIDTime];
  uint64_t v3 = [(AXEventRepresentation *)self iosmacPointerInfo];
  [v3 location];
  BOOL v4 = [(AXEventRepresentation *)self iosmacPointerInfo];
  [v4 location];
  uint64_t v5 = [(AXEventRepresentation *)self iosmacPointerInfo];
  [v5 pressed];
  MouseEvent = (__IOHIDEvent *)IOHIDEventCreateMouseEvent();

  if ([(AXEventRepresentation *)self contextId])
  {
    [(AXEventRepresentation *)self contextId];
    BKSHIDEventSetSimpleInfo();
  }
  return MouseEvent;
}

- (__IOHIDEvent)_newHandHIDEventRef
{
  uint64_t v3 = [(AXEventRepresentation *)self handInfo];
  unsigned int v4 = [v3 eventType];

  switch(v4)
  {
    case 1u:
    case 6u:
      AXDeviceHasHomeButton();
      break;
    default:
      break;
  }
  [(AXEventRepresentation *)self _machTimeForHIDEventRef];
  if (![(AXEventRepresentation *)self isGeneratedEvent])
  {
    uint64_t v5 = [(AXEventRepresentation *)self handInfo];
    [v5 handEventMask];
  }
  unsigned int v41 = (v4 < 0xC) & (0x826u >> v4);
  if ([(AXEventRepresentation *)self isGeneratedEvent])
  {
    uint64_t v6 = [(AXEventRepresentation *)self handInfo];
    [v6 additionalHandEventFlagsForGeneratedEvents];
  }
  uint64_t v7 = [(AXEventRepresentation *)self handInfo];
  [v7 handIndex];
  uint64_t v8 = [(AXEventRepresentation *)self handInfo];
  [v8 handIdentity];
  uint64_t v9 = [(AXEventRepresentation *)self handInfo];
  [v9 handPosition];
  uint64_t v10 = [(AXEventRepresentation *)self handInfo];
  [v10 handPosition];
  uint64_t DigitizerEvent = IOHIDEventCreateDigitizerEvent();

  long long v12 = (__IOHIDEvent *)DigitizerEvent;
  if (v4 <= 0xB && ((1 << v4) & 0x826) != 0) {
    IOHIDEventSetIntegerValue();
  }
  [(AXEventRepresentation *)self generationCount];
  IOHIDEventSetIntegerValue();
  [(AXEventRepresentation *)self willUpdateMask];
  IOHIDEventSetIntegerValue();
  [(AXEventRepresentation *)self didUpdateMask];
  IOHIDEventSetIntegerValue();
  long long v13 = [(AXEventRepresentation *)self handInfo];
  long long v14 = [v13 pathsIncludingMayBeginEvents];
  uint64_t v15 = [v14 count];

  if (v15 >= 1)
  {
    uint64_t v16 = 0;
    uint64_t v40 = v12;
    do
    {
      long long v17 = [(AXEventRepresentation *)self handInfo];
      uint64_t v18 = [v17 pathsIncludingMayBeginEvents];
      uint64_t v19 = [v18 objectAtIndex:v16];

      [v19 pathLocation];
      double v21 = v20;
      double v23 = v22;
      if (![(AXEventRepresentation *)self isGeneratedEvent]) {
        [v19 pathEventMask];
      }
      if ([(AXEventRepresentation *)self isGeneratedEvent])
      {
        double v24 = [(AXEventRepresentation *)self handInfo];
        [v24 additionalHandEventFlagsForGeneratedEvents];
      }
      int v25 = v41;
      if (![(AXEventRepresentation *)self isGeneratedEvent])
      {
        unsigned int v26 = [v19 pathProximity];
        [v19 pathProximity];
        int v25 = (v26 >> 1) & 1;
      }
      if (-[AXEventRepresentation screenEdgeForPoint:](self, "screenEdgeForPoint:", v21, v23)) {
        AXDeviceHasHomeButton();
      }
      int v27 = [v19 transducerType];
      [v19 pathIndex];
      [v19 pathIdentity];
      if (v27)
      {
        [v19 pathPressure];
        [v19 pathTwist];
        [v19 pathMinorRadius];
        [v19 pathMajorRadius];
        [v19 pathQuality];
        [v19 pathDensity];
        uint64_t v39 = 0;
        double v38 = v28;
        DigitizerFingerEventWithQualitdouble y = (const void *)IOHIDEventCreateDigitizerFingerEventWithQuality();
      }
      else
      {
        [v19 pathZValue];
        [v19 pathPressure];
        [v19 barrelPressure];
        [v19 pathTwist];
        [v19 altitude];
        [v19 azimuth];
        if (v25) {
          int v30 = 0x20000;
        }
        else {
          int v30 = 0;
        }
        LODWORD(v37) = v30;
        DigitizerFingerEventWithQualitdouble y = (const void *)IOHIDEventCreateDigitizerStylusEventWithPolarOrientation();
        objc_msgSend(v19, "pathQuality", v37);
        IOHIDEventSetFloatValue();
        [v19 pathDensity];
        IOHIDEventSetFloatValue();
        [v19 pathMajorRadius];
        IOHIDEventSetFloatValue();
        [v19 pathMinorRadius];
        IOHIDEventSetFloatValue();
        [v19 phaseBits];
        IOHIDEventSetPhase();
      }
      long long v12 = v40;
      objc_msgSend(v19, "roll", *(void *)&v38, v39);
      IOHIDEventSetFloatValue();
      [v19 willUpdateMask];
      IOHIDEventSetIntegerValue();
      [v19 didUpdateMask];
      IOHIDEventSetIntegerValue();
      [v19 orbValue];
      IOHIDEventSetFloatValue();
      [v19 transducerType];
      IOHIDEventSetIntegerValue();
      [v19 orbValue];
      [v19 pathMajorRadiusTolerance];
      IOHIDEventSetFloatValue();
      [(AXEventRepresentation *)self generationCount];
      IOHIDEventSetIntegerValue();
      if ([v19 shouldSetTouchFlag])
      {
        IOHIDEventGetIntegerValue();
        IOHIDEventSetIntegerValue();
      }
      if ([(AXEventRepresentation *)self secureName])
      {
        IOHIDEventGetTimeStamp();
        IOHIDEventCreateVendorDefinedEvent();
        IOHIDEventAppendEvent();
      }
      [v19 phaseBits];
      IOHIDEventSetPhase();
      IOHIDEventAppendEvent();
      CFRelease(DigitizerFingerEventWithQuality);

      ++v16;
    }
    while (v15 != v16);
  }
  uint64_t v31 = [(AXEventRepresentation *)self HIDAttributeData];

  if (v31)
  {
    id v32 = [(AXEventRepresentation *)self HIDAttributeData];
    [v32 bytes];
    int v33 = [(AXEventRepresentation *)self HIDAttributeData];
    [v33 length];
    IOHIDEventSetAttributeData();
  }
  [(AXEventRepresentation *)self senderID];
  IOHIDEventSetSenderID();
  v34 = [(AXEventRepresentation *)self handInfo];
  int v35 = [v34 eventType];

  if (v35 == 8) {
    [(AXEventRepresentation *)self isDisplayIntegrated];
  }
  IOHIDEventSetIntegerValue();
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(AXEventRepresentation);
  [(AXEventRepresentation *)v5 setType:[(AXEventRepresentation *)self type]];
  [(AXEventRepresentation *)v5 setOriginalType:[(AXEventRepresentation *)self originalType]];
  [(AXEventRepresentation *)v5 setSubtype:[(AXEventRepresentation *)self subtype]];
  [(AXEventRepresentation *)self location];
  -[AXEventRepresentation setLocation:](v5, "setLocation:");
  [(AXEventRepresentation *)self windowLocation];
  -[AXEventRepresentation setWindowLocation:](v5, "setWindowLocation:");
  [(AXEventRepresentation *)v5 setWindow:[(AXEventRepresentation *)self window]];
  [(AXEventRepresentation *)v5 setTime:[(AXEventRepresentation *)self time]];
  [(AXEventRepresentation *)v5 setFlags:[(AXEventRepresentation *)self flags]];
  [(AXEventRepresentation *)v5 setPid:[(AXEventRepresentation *)self pid]];
  uint64_t v6 = [(AXEventRepresentation *)self handInfo];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];

  [(AXEventRepresentation *)v5 setHandInfo:v7];
  uint64_t v8 = [(AXEventRepresentation *)self data];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];

  [(AXEventRepresentation *)v5 setData:v9];
  uint64_t v10 = [(AXEventRepresentation *)self clientId];
  long long v11 = (void *)[v10 copyWithZone:a3];

  [(AXEventRepresentation *)v5 setClientId:v11];
  [(AXEventRepresentation *)v5 setTaskPort:[(AXEventRepresentation *)self taskPort]];
  [(AXEventRepresentation *)v5 setHIDTime:[(AXEventRepresentation *)self HIDTime]];
  long long v12 = [(AXEventRepresentation *)self HIDAttributeData];
  [(AXEventRepresentation *)v5 setHIDAttributeData:v12];

  [(AXEventRepresentation *)v5 setAdditionalFlags:[(AXEventRepresentation *)self additionalFlags]];
  [(AXEventRepresentation *)v5 setContextId:[(AXEventRepresentation *)self contextId]];
  [(AXEventRepresentation *)v5 setDisplayId:[(AXEventRepresentation *)self displayId]];
  [(AXEventRepresentation *)v5 setSenderID:[(AXEventRepresentation *)self senderID]];
  long long v13 = [(AXEventRepresentation *)self keyInfo];
  long long v14 = (void *)[v13 copyWithZone:a3];
  [(AXEventRepresentation *)v5 setKeyInfo:v14];

  uint64_t v15 = [(AXEventRepresentation *)self accelerometerInfo];
  [(AXEventRepresentation *)v5 setAccelerometerInfo:v15];

  [(AXEventRepresentation *)v5 setIsGeneratedEvent:[(AXEventRepresentation *)self isGeneratedEvent]];
  [(AXEventRepresentation *)v5 setScrollAmount:[(AXEventRepresentation *)self scrollAmount]];
  [(AXEventRepresentation *)v5 setScrollAccelAmount:[(AXEventRepresentation *)self scrollAccelAmount]];
  [(AXEventRepresentation *)v5 setIsDisplayIntegrated:[(AXEventRepresentation *)self isDisplayIntegrated]];
  [(AXEventRepresentation *)v5 setWillUpdateMask:[(AXEventRepresentation *)self willUpdateMask]];
  [(AXEventRepresentation *)v5 setDidUpdateMask:[(AXEventRepresentation *)self didUpdateMask]];
  [(AXEventRepresentation *)v5 setGenerationCount:[(AXEventRepresentation *)self generationCount]];
  [(AXEventRepresentation *)v5 setRedirectEvent:[(AXEventRepresentation *)self isRedirectEvent]];
  [(AXEventRepresentation *)v5 setSystemDrag:[(AXEventRepresentation *)self isSystemDrag]];
  uint64_t v16 = [(AXEventRepresentation *)self gameControllerInfo];
  long long v17 = (void *)[v16 copyWithZone:a3];

  [(AXEventRepresentation *)v5 setGameControllerInfo:v17];
  uint64_t v18 = [(AXEventRepresentation *)self pointerControllerInfo];
  uint64_t v19 = (void *)[v18 copyWithZone:a3];

  [(AXEventRepresentation *)v5 setPointerControllerInfo:v19];
  double v20 = [(AXEventRepresentation *)self iosmacPointerInfo];
  double v21 = (void *)[v20 copyWithZone:a3];
  [(AXEventRepresentation *)v5 setIosmacPointerInfo:v21];

  [(AXEventRepresentation *)v5 setCreatorHIDEvent:[(AXEventRepresentation *)self creatorHIDEvent]];
  [(AXEventRepresentation *)v5 setIsBuiltIn:[(AXEventRepresentation *)self isBuiltIn]];
  double v22 = [(AXEventRepresentation *)self auxiliaryData];
  [(AXEventRepresentation *)v5 setAuxiliaryData:v22];

  return v5;
}

- (AXEventRepresentation)initWithCoder:(id)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AXEventRepresentation;
  uint64_t v5 = [(AXEventRepresentation *)&v23 init];
  if (v5)
  {
    v5->_type = [v4 decodeInt32ForKey:@"type"];
    v5->_originalint Type = [v4 decodeInt32ForKey:@"originalType"];
    v5->_subtype = [v4 decodeInt32ForKey:@"subtype"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    [v6 getValue:&v5->_location size:16];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"windowLocation"];
    [v7 getValue:&v5->_windowLocation size:16];

    v5->_time = [v4 decodeInt64ForKey:@"time"];
    v5->_window = (void *)[v4 decodeInt64ForKey:@"window"];
    v5->_flags = [v4 decodeInt32ForKey:@"flags"];
    v5->_pid = [v4 decodeInt32ForKey:@"pid"];
    v5->_redirectEvent = [v4 decodeBoolForKey:@"isRedirectEvent"];
    v5->_systemDrag = [v4 decodeBoolForKey:@"isSystemDrag"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handInfo"];
    [(AXEventRepresentation *)v5 setHandInfo:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyInfo"];
    [(AXEventRepresentation *)v5 setKeyInfo:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gameInfo"];
    [(AXEventRepresentation *)v5 setGameControllerInfo:v10];

    long long v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointerInfo"];
    [(AXEventRepresentation *)v5 setPointerControllerInfo:v11];

    long long v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accelerometerInfo"];
    [(AXEventRepresentation *)v5 setAccelerometerInfo:v12];

    long long v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    [(AXEventRepresentation *)v5 setData:v13];

    long long v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iosmacPointerInfo"];
    [(AXEventRepresentation *)v5 setIosmacPointerInfo:v14];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientId"];
    [(AXEventRepresentation *)v5 setClientId:v15];

    v5->_taskPort = [v4 decodeInt32ForKey:@"taskPort"];
    v5->_HIDTime = [v4 decodeInt64ForKey:@"HIDTime"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HIDAttributeData"];
    [(AXEventRepresentation *)v5 setHIDAttributeData:v16];

    -[AXEventRepresentation setAdditionalFlags:](v5, "setAdditionalFlags:", [v4 decodeInt64ForKey:@"additionalFlags"]);
    v5->_contextId = [v4 decodeInt32ForKey:@"contextId"];
    v5->_displayId = [v4 decodeInt32ForKey:@"displayId"];
    v5->_senderID = [v4 decodeInt64ForKey:@"HIDSenderId"];
    v5->_isBuiltIn = [v4 decodeBoolForKey:@"isBuiltIn"];
    v5->_isDisplayIntegrated = [v4 decodeBoolForKey:@"isDisplayIntegrated"];
    v5->_generationCFIndex Count = [v4 decodeInt64ForKey:@"generationCount"];
    v5->_willUpdateMask = [v4 decodeInt32ForKey:@"willUpdateMask"];
    v5->_didUpdateMask = [v4 decodeInt32ForKey:@"didUpdateMask"];
    v5->_isGeneratedEvent = [v4 decodeBoolForKey:@"isGeneratedEvent"];
    v5->_scrollAmount = [v4 decodeInt64ForKey:@"scrollAmount"];
    v5->_scrollAccelAmount = [v4 decodeInt64ForKey:@"scrollAccelAmount"];
    long long v17 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    uint64_t v19 = [v17 setWithArray:v18];
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"auxiliaryData"];
    auxiliaryData = v5->_auxiliaryData;
    v5->_auxiliaryData = (NSDictionary *)v20;
  }
  return v5;
}

- (void)dealloc
{
  creatorHIDEvent = self->_creatorHIDEvent;
  if (creatorHIDEvent)
  {
    CFRelease(creatorHIDEvent);
    self->_creatorHIDEvent = 0;
  }
  creatorHIDServiceClient = self->_creatorHIDServiceClient;
  if (creatorHIDServiceClient)
  {
    CFRelease(creatorHIDServiceClient);
    self->_creatorHIDServiceClient = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AXEventRepresentation;
  [(AXEventRepresentation *)&v5 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v8 = a3;
  [v8 encodeInt32:type forKey:@"type"];
  [v8 encodeInt32:self->_originalType forKey:@"originalType"];
  [v8 encodeInt32:self->_subtype forKey:@"subtype"];
  objc_super v5 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_location objCType:"{CGPoint=dd}"];
  [v8 encodeObject:v5 forKey:@"location"];

  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_windowLocation objCType:"{CGPoint=dd}"];
  [v8 encodeObject:v6 forKey:@"windowLocation"];

  [v8 encodeInt64:self->_time forKey:@"time"];
  [v8 encodeInt64:self->_window forKey:@"window"];
  [v8 encodeInt32:self->_flags forKey:@"flags"];
  [v8 encodeInt32:self->_pid forKey:@"pid"];
  [v8 encodeObject:self->_data forKey:@"data"];
  [v8 encodeObject:self->_handInfo forKey:@"handInfo"];
  [v8 encodeObject:self->_gameControllerInfo forKey:@"gameInfo"];
  [v8 encodeObject:self->_pointerControllerInfo forKey:@"pointerInfo"];
  [v8 encodeObject:self->_keyInfo forKey:@"keyInfo"];
  [v8 encodeObject:self->_accelerometerInfo forKey:@"accelerometerInfo"];
  [v8 encodeObject:self->_clientId forKey:@"clientId"];
  [v8 encodeInt32:self->_taskPort forKey:@"taskPort"];
  [v8 encodeInt64:self->_HIDTime forKey:@"HIDTime"];
  [v8 encodeObject:self->_HIDAttributeData forKey:@"HIDAttributeData"];
  [v8 encodeInt64:self->_additionalFlags forKey:@"additionalFlags"];
  [v8 encodeInt32:self->_contextId forKey:@"contextId"];
  [v8 encodeInt32:self->_displayId forKey:@"displayId"];
  [v8 encodeInt64:self->_senderID forKey:@"HIDSenderId"];
  [v8 encodeBool:self->_isBuiltIn forKey:@"isBuiltIn"];
  [v8 encodeBool:self->_isDisplayIntegrated forKey:@"isDisplayIntegrated"];
  [v8 encodeInt64:self->_generationCount forKey:@"generationCount"];
  [v8 encodeInt32:self->_willUpdateMask forKey:@"willUpdateMask"];
  [v8 encodeInt32:self->_didUpdateMask forKey:@"didUpdateMask"];
  [v8 encodeBool:self->_isGeneratedEvent forKey:@"isGeneratedEvent"];
  [v8 encodeInt64:self->_scrollAmount forKey:@"scrollAmount"];
  [v8 encodeInt64:self->_scrollAccelAmount forKey:@"scrollAccelAmount"];
  [v8 encodeBool:self->_redirectEvent forKey:@"isRedirectEvent"];
  [v8 encodeBool:self->_systemDrag forKey:@"isSystemDrag"];
  uint64_t v7 = [(AXEventRepresentation *)self iosmacPointerInfo];
  [v8 encodeObject:v7 forKey:@"iosmacPointerInfo"];

  [v8 encodeObject:self->_auxiliaryData forKey:@"auxiliaryData"];
}

- (unsigned)firstPathContextId
{
  if ([(AXEventRepresentation *)self type] != 3001) {
    return 0;
  }
  uint64_t v3 = [(AXEventRepresentation *)self handInfo];
  id v4 = [v3 paths];
  objc_super v5 = [v4 firstPath];

  LODWORD(v3) = [v5 pathWindowContextID];
  return v3;
}

- (id)accessibilityEventRepresentationTabularDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"%@<%p>\n  Type:             %u (orig:%u)\n  Subtype:          %d\n  Location:         x:%f y:%f\n  Window Location:  x:%f y:%f\n  Window:           %p\n  Flags:            %d\n  PID:              %d\n  Time:             %llu\n  HIDTime:          %llu\n  Data:             %@\n  Task Port:        %d\n  client ID:        %@\n  context ID:       %u\n", v5, self, self->_type, self->_originalType, self->_subtype, *(void *)&self->_location.x, *(void *)&self->_location.y, *(void *)&self->_windowLocation.x, *(void *)&self->_windowLocation.y, self->_window, self->_flags, self->_pid, self->_time, self->_HIDTime, self->_data, self->_taskPort,
    self->_clientId,
  uint64_t v6 = self->_contextId);

  uint64_t v7 = [(AXEventRepresentation *)self handInfo];

  if (v7)
  {
    id v8 = [(AXEventRepresentation *)self handInfo];
    uint64_t v9 = [v8 accessibilityEventRepresentationTabularDescription];
    [v6 appendString:v9];
  }
  uint64_t v10 = [(AXEventRepresentation *)self gameControllerInfo];

  if (v10)
  {
    long long v11 = [(AXEventRepresentation *)self gameControllerInfo];
    long long v12 = [v11 accessibilityEventRepresentationTabularDescription];
    [v6 appendString:v12];
  }
  long long v13 = [(AXEventRepresentation *)self pointerControllerInfo];

  if (v13)
  {
    long long v14 = [(AXEventRepresentation *)self pointerControllerInfo];
    uint64_t v15 = [v14 accessibilityEventRepresentationTabularDescription];
    [v6 appendString:v15];
  }

  return v6;
}

- (NSString)description
{
  uint64_t v20 = (void *)MEMORY[0x1E4F28E78];
  v21.receiver = self;
  v21.super_class = (Class)AXEventRepresentation;
  uint64_t v3 = [(AXEventRepresentation *)&v21 description];
  CGPoint location = self->_location;
  CGFloat x = self->_windowLocation.x;
  CGFloat y = self->_windowLocation.y;
  unint64_t time = self->_time;
  clientId = self->_clientId;
  unint64_t HIDTime = self->_HIDTime;
  window = self->_window;
  uint64_t type = self->_type;
  uint64_t flags = self->_flags;
  subuint64_t type = self->_subtype;
  uint64_t taskPort = self->_taskPort;
  uint64_t pid = self->_pid;
  uint64_t contextId = self->_contextId;
  long long v13 = [(AXEventRepresentation *)self _senderNameForID];
  long long v14 = [v20 stringWithFormat:@"%@. type:%u subtype:%d loc:[x:%f y:%f] windowLoc:[x:%f y:%f] window:%p flags:%d pid:%d time:%llu HIDTime:%llu taskPort:%d client:%@ ctxtID:%u sender:%@ data:[%lu bytes]", v3, type, subtype, location, *(void *)&x, *(void *)&y, window, flags, pid, time, HIDTime, taskPort, clientId, contextId, v13, -[NSData length](self->_data, "length")];

  if (self->_accessibilityData) {
    [v14 appendFormat:@"\nAXData: %@", self->_accessibilityData];
  }
  if (self->_handInfo) {
    [v14 appendFormat:@"\nHand Info: %@", self->_handInfo];
  }
  if (self->_keyInfo) {
    [v14 appendFormat:@"\nKey Info: %@", self->_keyInfo];
  }

  return (NSString *)v14;
}

- (id)_senderNameForID
{
  unint64_t v3 = [(AXEventRepresentation *)self senderID];
  if (v3 + 0x7FFFFFF7E8CE6C8FLL >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (ID:0x%04llx)", -[AXEventRepresentation senderID](self, "senderID"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = off_1E5588080[v3 - 0x817319371];
  }

  return v4;
}

- (unint64_t)fingerCount
{
  int v2 = [(AXEventRepresentation *)self handInfo];
  unint64_t v3 = [v2 currentFingerCount];

  return v3;
}

- (BOOL)isTouchDown
{
  int v2 = [(AXEventRepresentation *)self handInfo];
  BOOL v3 = [v2 eventType] == 1;

  return v3;
}

- (BOOL)isMove
{
  int v2 = [(AXEventRepresentation *)self handInfo];
  BOOL v3 = [v2 eventType] == 2;

  return v3;
}

- (BOOL)isChordChange
{
  int v2 = [(AXEventRepresentation *)self handInfo];
  BOOL v3 = [v2 eventType] == 5;

  return v3;
}

- (BOOL)isLift
{
  int v2 = [(AXEventRepresentation *)self handInfo];
  BOOL v3 = [v2 eventType] == 6;

  return v3;
}

- (BOOL)isInRange
{
  int v2 = [(AXEventRepresentation *)self handInfo];
  BOOL v3 = [v2 eventType] == 9;

  return v3;
}

- (BOOL)isInRangeLift
{
  int v2 = [(AXEventRepresentation *)self handInfo];
  BOOL v3 = [v2 eventType] == 10;

  return v3;
}

- (BOOL)isCancel
{
  int v2 = [(AXEventRepresentation *)self handInfo];
  BOOL v3 = [v2 eventType] == 8;

  return v3;
}

- (unsigned)screenEdgeForPoint:(CGPoint)a3
{
  if (a3.x < 0.01) {
    return 1;
  }
  if (a3.x > 0.99) {
    return 2;
  }
  if (a3.y >= 0.01) {
    return 4 * (a3.y > 0.99);
  }
  return 3;
}

- (unsigned)originalType
{
  if (self->_originalType) {
    return self->_originalType;
  }
  else {
    return [(AXEventRepresentation *)self type];
  }
}

- (void)applyAccessibilityDataToCreatorHIDEvent
{
  BOOL v3 = [(AXEventRepresentation *)self creatorHIDEvent];
  if (v3)
  {
    [(AXEventRepresentation *)self _applyAccessibilityDataToRealEvent:v3];
  }
}

+ (BOOL)_HIDEventIsAccessibilityEvent:(__IOHIDEvent *)a3
{
  if (!a3) {
    return 0;
  }
  if (IOHIDEventGetType() == 1)
  {
    int IntegerValue = IOHIDEventGetIntegerValue();
    int v4 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 65280 && v4 == 34) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)_HIDEventIsAccessibilityEvent:(__IOHIDEvent *)a3
{
  int v4 = objc_opt_class();

  return [v4 _HIDEventIsAccessibilityEvent:a3];
}

- (__IOHIDEvent)_accessibilityEventFromRealEvent:(__IOHIDEvent *)a3
{
  ValueAtIndeCGFloat x = a3;
  if (a3 && ![(AXEventRepresentation *)self _HIDEventIsAccessibilityEvent:a3])
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children && (CFArrayRef v6 = Children, Count = CFArrayGetCount(Children), Count >= 1))
    {
      CFIndex v8 = Count;
      CFIndex v9 = 0;
      while (1)
      {
        ValueAtIndeCGFloat x = (__IOHIDEvent *)CFArrayGetValueAtIndex(v6, v9);
        if ([(AXEventRepresentation *)self _HIDEventIsAccessibilityEvent:ValueAtIndex])
        {
          break;
        }
        if (v8 == ++v9) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return ValueAtIndex;
}

- (void)_applyAccessibilityDataToRealEvent:(__IOHIDEvent *)a3
{
  objc_super v5 = [(AXEventRepresentation *)self accessibilityData];
  if (a3 && v5)
  {
    id v7 = v5;
    if ([(AXEventRepresentation *)self _HIDEventIsAccessibilityEvent:a3]
      || [(AXEventRepresentation *)self _accessibilityEventFromRealEvent:a3])
    {
      _AXAssert();
LABEL_6:
      objc_super v5 = v7;
      goto LABEL_7;
    }
    IOHIDEventGetTimeStamp();
    [v7 dataBytes];
    [v7 dataLength];
    VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
    IOHIDEventAppendEvent();
    objc_super v5 = v7;
    if (VendorDefinedEvent)
    {
      CFRelease(VendorDefinedEvent);
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (id)_accessibilityDataFromRealEvent:(__IOHIDEvent *)a3
{
  if (a3)
  {
    int v4 = -[AXEventRepresentation _accessibilityEventFromRealEvent:](self, "_accessibilityEventFromRealEvent:");
    if (v4)
    {
      uint64_t DataValue = IOHIDEventGetDataValue();
      if (DataValue)
      {
        int v4 = +[AXEventData dataWithBytes:DataValue length:IOHIDEventGetIntegerValue()];
      }
      else
      {
        _AXLogWithFacility();
        int v4 = 0;
      }
    }
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

+ (void)incrementTouchCounter
{
  int v3 = [a1 touchCounter];
  if ((v3 + 1) > 1) {
    uint64_t v4 = (v3 + 1);
  }
  else {
    uint64_t v4 = 1;
  }

  [a1 setTouchCounter:v4];
}

+ (unsigned)touchCounter
{
  return touchCounter;
}

+ (void)setTouchCounter:(unsigned int)a3
{
  touchCounter = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_uint64_t type = a3;
}

- (void)setOriginalType:(unsigned int)a3
{
  self->_originalint Type = a3;
}

- (int)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int)a3
{
  self->_subuint64_t type = a3;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_CGPoint location = a3;
}

- (CGPoint)windowLocation
{
  double x = self->_windowLocation.x;
  double y = self->_windowLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setWindowLocation:(CGPoint)a3
{
  self->_windowLocation = a3;
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  self->_unint64_t time = a3;
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_uint64_t flags = a3;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (AXEventHandInfoRepresentation)handInfo
{
  return self->_handInfo;
}

- (void)setHandInfo:(id)a3
{
}

- (AXEventKeyInfoRepresentation)keyInfo
{
  return self->_keyInfo;
}

- (void)setKeyInfo:(id)a3
{
}

- (AXEventAccelerometerInfoRepresentation)accelerometerInfo
{
  return self->_accelerometerInfo;
}

- (void)setAccelerometerInfo:(id)a3
{
}

- (AXEventGameControllerInfoRepresentation)gameControllerInfo
{
  return self->_gameControllerInfo;
}

- (void)setGameControllerInfo:(id)a3
{
}

- (AXEventPointerInfoRepresentation)pointerControllerInfo
{
  return self->_pointerControllerInfo;
}

- (void)setPointerControllerInfo:(id)a3
{
}

- (AXEventIOSMACPointerInfoRepresentation)iosmacPointerInfo
{
  return self->_iosmacPointerInfo;
}

- (void)setIosmacPointerInfo:(id)a3
{
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
}

- (unsigned)taskPort
{
  return self->_taskPort;
}

- (void)setTaskPort:(unsigned int)a3
{
  self->_uint64_t taskPort = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_uint64_t pid = a3;
}

- (unint64_t)HIDTime
{
  return self->_HIDTime;
}

- (void)setHIDTime:(unint64_t)a3
{
  self->_unint64_t HIDTime = a3;
}

- (NSData)HIDAttributeData
{
  return self->_HIDAttributeData;
}

- (void)setHIDAttributeData:(id)a3
{
}

- (int64_t)scrollAmount
{
  return self->_scrollAmount;
}

- (void)setScrollAmount:(int64_t)a3
{
  self->_scrollAmount = a3;
}

- (int64_t)scrollAccelAmount
{
  return self->_scrollAccelAmount;
}

- (void)setScrollAccelAmount:(int64_t)a3
{
  self->_scrollAccelAmount = a3;
}

- (unint64_t)additionalFlags
{
  return self->_additionalFlags;
}

- (void)setAdditionalFlags:(unint64_t)a3
{
  self->_additionalFlags = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_uint64_t contextId = a3;
}

- (unsigned)displayId
{
  return self->_displayId;
}

- (void)setDisplayId:(unsigned int)a3
{
  self->_displayId = a3;
}

- (BOOL)isBuiltIn
{
  return self->_isBuiltIn;
}

- (void)setIsBuiltIn:(BOOL)a3
{
  self->_isBuiltIn = a3;
}

- (BOOL)isDisplayIntegrated
{
  return self->_isDisplayIntegrated;
}

- (void)setIsDisplayIntegrated:(BOOL)a3
{
  self->_isDisplayIntegrated = a3;
}

- (int64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(int64_t)a3
{
  self->_generationCFIndex Count = a3;
}

- (unsigned)willUpdateMask
{
  return self->_willUpdateMask;
}

- (void)setWillUpdateMask:(unsigned int)a3
{
  self->_willUpdateMask = a3;
}

- (unsigned)didUpdateMask
{
  return self->_didUpdateMask;
}

- (void)setDidUpdateMask:(unsigned int)a3
{
  self->_didUpdateMask = a3;
}

- (BOOL)isGeneratedEvent
{
  return self->_isGeneratedEvent;
}

- (void)setIsGeneratedEvent:(BOOL)a3
{
  self->_isGeneratedEvent = a3;
}

- (BOOL)useOriginalHIDTime
{
  return self->_useOriginalHIDTime;
}

- (void)setUseOriginalHIDTime:(BOOL)a3
{
  self->_useOriginalunint64_t HIDTime = a3;
}

- (__IOHIDEvent)creatorHIDEvent
{
  return self->_creatorHIDEvent;
}

- (void)setCreatorHIDEvent:(__IOHIDEvent *)a3
{
}

- (__IOHIDServiceClient)creatorHIDServiceClient
{
  return self->_creatorHIDServiceClient;
}

- (void)setCreatorHIDServiceClient:(__IOHIDServiceClient *)a3
{
}

- (BOOL)isRedirectEvent
{
  return self->_redirectEvent;
}

- (void)setRedirectEvent:(BOOL)a3
{
  self->_redirectEvent = a3;
}

- (BOOL)isSystemDrag
{
  return self->_systemDrag;
}

- (void)setSystemDrag:(BOOL)a3
{
  self->_systemDrag = a3;
}

- (NSDictionary)auxiliaryData
{
  return self->_auxiliaryData;
}

- (void)setAuxiliaryData:(id)a3
{
}

- (AXEventData)accessibilityData
{
  return self->_accessibilityData;
}

- (void)setAccessibilityData:(id)a3
{
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (void)setSecureName:(unsigned int)a3
{
  self->_secureName = a3;
}

- (void)window
{
  return self->_window;
}

- (void)setWindow:(void *)a3
{
  self->_window = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_accessibilityData, 0);
  objc_storeStrong((id *)&self->_auxiliaryData, 0);
  objc_storeStrong((id *)&self->_HIDAttributeData, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_iosmacPointerInfo, 0);
  objc_storeStrong((id *)&self->_pointerControllerInfo, 0);
  objc_storeStrong((id *)&self->_gameControllerInfo, 0);
  objc_storeStrong((id *)&self->_accelerometerInfo, 0);
  objc_storeStrong((id *)&self->_keyInfo, 0);

  objc_storeStrong((id *)&self->_handInfo, 0);
}

@end