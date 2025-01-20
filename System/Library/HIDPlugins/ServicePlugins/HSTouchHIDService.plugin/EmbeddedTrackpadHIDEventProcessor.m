@interface EmbeddedTrackpadHIDEventProcessor
- (BOOL)shouldDispatchEvent:(id)a3;
- (EmbeddedTrackpadHIDEventProcessor)initWithDeviceID:(unint64_t)a3;
- (id)handleHIDEvent:(id)a3;
- (void)copyPhaseFrom:(id)a3 to:(id)a4;
@end

@implementation EmbeddedTrackpadHIDEventProcessor

- (EmbeddedTrackpadHIDEventProcessor)initWithDeviceID:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EmbeddedTrackpadHIDEventProcessor;
  return [(TrackpadHIDEventProcessor *)&v4 initWithDeviceID:a3];
}

- (id)handleHIDEvent:(id)a3
{
  id v79 = a3;
  objc_super v4 = objc_opt_new();
  if ([v79 type] != 11)
  {
    v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "[Error] ";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "";
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = [v79 type];
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Unexpected event type: %u Eating it.", buf, 0x26u);
    }
    goto LABEL_12;
  }
  if ([v79 integerValueForField:720918] != (char *)&def_411C8 + 1)
  {
    v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "[Error] ";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "";
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Unexpected digitizer event. Eating it.", buf, 0x20u);
    }
    goto LABEL_12;
  }
  v5 = [v79 parent];

  if (v5)
  {
    v6 = MTLoggingPlugin();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "[Error] ";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "";
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
      _os_log_impl(&def_411C8, v6, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Unexpected child digitizer event. Eating it.", buf, 0x20u);
    }
LABEL_12:

    id v7 = v4;
    goto LABEL_13;
  }
  v73 = objc_opt_new();
  v76 = +[HIDEvent pointerEvent:mach_absolute_time() x:[(TrackpadHIDEventProcessor *)self previousButtonState] y:0 z:0.0 buttonMask:0.0 options:0.0];
  if (v76)
  {
    v77 = v79;
    v9 = [v77 children];
    id v10 = [v9 copy];

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
    if (v11)
    {
      char v75 = 0;
      v13 = 0;
      v74 = 0;
      v72 = 0;
      v70 = 0;
      v71 = 0;
      uint64_t v14 = *(void *)v85;
      *(void *)&long long v12 = 136316162;
      long long v69 = v12;
      while (1)
      {
        v15 = 0;
        do
        {
          if (*(void *)v85 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v84 + 1) + 8 * (void)v15);
          if (objc_msgSend(v16, "type", v69) != 11)
          {
            if ([v16 type] == 17)
            {
              if (![(TrackpadHIDEventProcessor *)self noPointing])
              {
                [v16 doubleValueForField:1114112];
                double v18 = v17;
                [v16 doubleValueForField:1114113];
                if (v75)
                {
                  v20 = MTLoggingPlugin();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&buf[4] = "[Error] ";
                    *(_WORD *)&buf[12] = 2080;
                    *(void *)&buf[14] = "";
                    *(_WORD *)&buf[22] = 2080;
                    *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
                    _os_log_impl(&def_411C8, v20, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Unexpected multiple pointer events. Eating it.", buf, 0x20u);
                  }
                  char v75 = 1;
                  goto LABEL_89;
                }
                double v28 = v19;
                float v29 = v18;
                [v76 setDoubleValue:1114112 forField:v29];
                float v30 = v28;
                [v76 setDoubleValue:1114113 forField:v30];
                char v75 = 1;
              }
LABEL_90:
              v57 = [v16 children];
              BOOL v58 = [v57 count] == 0;

              if (!v58)
              {
                v59 = MTLoggingPlugin();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  unsigned int v60 = [v16 type];
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "[Error] ";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "";
                  *(_WORD *)&buf[22] = 2080;
                  *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
                  *(_WORD *)&buf[32] = 1024;
                  *(_DWORD *)&buf[34] = v60;
                  _os_log_impl(&def_411C8, v59, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Unexpected grandchild events inside event type: %u. Eating them", buf, 0x26u);
                }
              }
              [v77 removeEvent:v16];
              goto LABEL_95;
            }
            if ([v16 type] == 2)
            {
              id v21 = [v16 integerValueForField:0x20000];
              id v22 = v21;
              if (v13)
              {
                if ([(TrackpadHIDEventProcessor *)self previousButtonState] == v21)
                {
                  memset(buf, 170, 0x400uLL);
                  v23 = basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PostAlg/EventProcessors/EmbeddedTrackpadHIDEventProcessor.mm", (char *)buf);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v89 = 136315906;
                    v90 = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
                    __int16 v91 = 2080;
                    v92 = v23;
                    __int16 v93 = 2048;
                    uint64_t v94 = 121;
                    __int16 v95 = 2080;
                    v96 = "buttonMask != self.previousButtonState";
                    _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v89, 0x2Au);
                  }
                }
                v20 = [(TrackpadHIDEventProcessor *)self createPointingEventWithDeltaX:0 deltaY:0 buttonMask:v22 timestamp:mach_absolute_time()];
                if (!v20)
                {
                  memset(buf, 170, 0x400uLL);
                  basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PostAlg/EventProcessors/EmbeddedTrackpadHIDEventProcessor.mm", (char *)buf);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    -[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]();
                  }
                  goto LABEL_142;
                }
                [v73 addObject:v20];
LABEL_89:
              }
              else
              {
                [v76 setIntegerValue:v21 forField:1114115];
                [(TrackpadHIDEventProcessor *)self setPreviousButtonState:v22];
                v31 = +[HIDEvent buttonEvent:buttonMask:options:](HIDEvent, "buttonEvent:buttonMask:options:", mach_absolute_time(), v22, [v16 options]);
                v33 = v31;
                if (!v31)
                {
                  memset(buf, 170, 0x400uLL);
                  basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PostAlg/EventProcessors/EmbeddedTrackpadHIDEventProcessor.mm", (char *)buf);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    -[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]();
                  }
                  v33 = 0;
                  goto LABEL_143;
                }
                if (v22)
                {
                  v32.i32[0] = (int)v22;
                  uint8x8_t v34 = (uint8x8_t)vcnt_s8(v32);
                  v34.i16[0] = vaddlv_u8(v34);
                  if (v34.i32[0] >= 2u)
                  {
                    memset(buf, 170, 0x400uLL);
                    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PostAlg/EventProcessors/EmbeddedTrackpadHIDEventProcessor.mm", (char *)buf);
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      -[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]();
                    }
                    goto LABEL_143;
                  }
                }
                unsigned int v35 = __clz(__rbit32(v22));
                if (v22) {
                  uint64_t v36 = v35 + 1;
                }
                else {
                  uint64_t v36 = 1;
                }
                [v31 setIntegerValue:v36 forField:131073];
                [v33 setIntegerValue:v22 != 0 forField:131076];
                [v76 appendEvent:v33];
                v13 = v33;
              }
              goto LABEL_90;
            }
            if ([v16 type] == 6)
            {
              if (v74)
              {
                v24 = MTLoggingPlugin();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&buf[4] = "[Debug] ";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "";
                  *(_WORD *)&buf[22] = 2080;
                  *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
                  _os_log_impl(&def_411C8, v24, OS_LOG_TYPE_DEBUG, "[HID] [MT] %s%s%s Multiple scroll events. Merging.", buf, 0x20u);
                }

                [(TrackpadHIDEventProcessor *)self mergeScrollEvent:v74 with:v16];
              }
              else
              {
                [v16 doubleValueForField:393216];
                double v38 = v37;
                [v16 doubleValueForField:393217];
                double v40 = v39;
                [v16 doubleValueForField:393218];
                double v42 = v41;
                id v43 = [v16 options];
                float v44 = v42;
                uint64_t v45 = (int)v44;
                float v46 = v38;
                float v47 = v40;
                uint64_t v48 = [(TrackpadHIDEventProcessor *)self createScrollEventWithDeltaX:(int)v46 deltaY:(int)v47 deltaZ:v45 options:v43];
                if (!v48)
                {
                  memset(buf, 170, 0x400uLL);
                  basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PostAlg/EventProcessors/EmbeddedTrackpadHIDEventProcessor.mm", (char *)buf);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    -[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:].cold.4();
                  }
                  v74 = 0;
LABEL_142:
                  v33 = v13;
LABEL_143:

                  id v7 = 0;
                  goto LABEL_144;
                }
                [v76 appendEvent:v48];
                v74 = (void *)v48;
              }
              goto LABEL_90;
            }
            if ([v16 type] == 7)
            {
              if (!v72)
              {
                [v16 doubleValueForField:458752];
                [v16 doubleValueForField:458753];
                [v16 doubleValueForField:458754];
                mach_absolute_time();
                [v16 options];
                uint64_t ScaleEvent = IOHIDEventCreateScaleEvent();
                if (!ScaleEvent)
                {
                  memset(buf, 170, 0x400uLL);
                  basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PostAlg/EventProcessors/EmbeddedTrackpadHIDEventProcessor.mm", (char *)buf);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    -[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:].cold.5();
                  }
                  v72 = 0;
                  goto LABEL_142;
                }
                [(EmbeddedTrackpadHIDEventProcessor *)self copyPhaseFrom:v16 to:ScaleEvent];
                [v76 appendEvent:ScaleEvent];
                v72 = (void *)ScaleEvent;
                goto LABEL_90;
              }
              v20 = MTLoggingPlugin();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                goto LABEL_89;
              }
              *(_DWORD *)buf = 136315650;
              *(void *)&buf[4] = "[Error] ";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "";
              *(_WORD *)&buf[22] = 2080;
              *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
              v25 = v20;
              os_log_type_t v26 = OS_LOG_TYPE_ERROR;
              v27 = "[HID] [MT] %s%s%s Unexpected multiple scale events. Eating the latest.";
              goto LABEL_87;
            }
            if ([v16 type] == 5)
            {
              if (!v71)
              {
                [v16 doubleValueForField:327680];
                [v16 doubleValueForField:327681];
                [v16 doubleValueForField:327682];
                mach_absolute_time();
                [v16 options];
                uint64_t RotationEvent = IOHIDEventCreateRotationEvent();
                if (!RotationEvent)
                {
                  memset(buf, 170, 0x400uLL);
                  basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PostAlg/EventProcessors/EmbeddedTrackpadHIDEventProcessor.mm", (char *)buf);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    -[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:].cold.6();
                  }
                  v71 = 0;
                  goto LABEL_142;
                }
                [(EmbeddedTrackpadHIDEventProcessor *)self copyPhaseFrom:v16 to:RotationEvent];
                [v76 appendEvent:RotationEvent];
                v71 = (void *)RotationEvent;
                goto LABEL_90;
              }
              v20 = MTLoggingPlugin();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                goto LABEL_89;
              }
              *(_DWORD *)buf = 136315650;
              *(void *)&buf[4] = "[Error] ";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "";
              *(_WORD *)&buf[22] = 2080;
              *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
              v25 = v20;
              os_log_type_t v26 = OS_LOG_TYPE_ERROR;
              v27 = "[HID] [MT] %s%s%s Unexpected multiple rotate events. Eating the latest.";
              goto LABEL_87;
            }
            if ([v16 type] == 4)
            {
              if (!v70)
              {
                [v16 doubleValueForField:0x40000];
                [v16 doubleValueForField:262145];
                [v16 doubleValueForField:262146];
                mach_absolute_time();
                [v16 options];
                uint64_t TranslationEvent = IOHIDEventCreateTranslationEvent();
                if (!TranslationEvent)
                {
                  memset(buf, 170, 0x400uLL);
                  basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/MT2TPHIDService/HSTrackpad/PostAlg/EventProcessors/EmbeddedTrackpadHIDEventProcessor.mm", (char *)buf);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    -[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:].cold.7();
                  }
                  v70 = 0;
                  goto LABEL_142;
                }
                [(EmbeddedTrackpadHIDEventProcessor *)self copyPhaseFrom:v16 to:TranslationEvent];
                [v76 appendEvent:TranslationEvent];
                v70 = (void *)TranslationEvent;
                goto LABEL_90;
              }
              v20 = MTLoggingPlugin();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                goto LABEL_89;
              }
              *(_DWORD *)buf = 136315650;
              *(void *)&buf[4] = "[Error] ";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "";
              *(_WORD *)&buf[22] = 2080;
              *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
              v25 = v20;
              os_log_type_t v26 = OS_LOG_TYPE_ERROR;
              v27 = "[HID] [MT] %s%s%s Unexpected multiple translate events. Eating the latest.";
LABEL_87:
              uint32_t v56 = 32;
LABEL_88:
              _os_log_impl(&def_411C8, v25, v26, v27, buf, v56);
              goto LABEL_89;
            }
            if ([v16 type] == 41 && _os_feature_enabled_impl())
            {
LABEL_67:
              v20 = [v16 copy];
              [v76 appendEvent:v20];
              goto LABEL_89;
            }
            if ([v16 type] != 1)
            {
              if ([v16 type] == 32)
              {
                v20 = MTLoggingPlugin();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_89;
                }
                *(_DWORD *)buf = 136315650;
                *(void *)&buf[4] = "[Debug] ";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "";
                *(_WORD *)&buf[22] = 2080;
                *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
                v25 = v20;
                os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
                v27 = "[HID] [MT] %s%s%s Force event. Ignoring.";
                goto LABEL_87;
              }
              if ([v16 type] == 3)
              {
                v20 = MTLoggingPlugin();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_89;
                }
                uint64_t IntegerValue = IOHIDEventGetIntegerValue();
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = "[Error] ";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "";
                *(_WORD *)&buf[22] = 2080;
                *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
                *(_WORD *)&buf[32] = 2048;
                *(void *)&buf[34] = IntegerValue;
                v25 = v20;
                os_log_type_t v26 = OS_LOG_TYPE_ERROR;
                v27 = "[HID] [MT] %s%s%s Unexpected keyboard child event with usage %lu. Eating it";
              }
              else
              {
                if ([v16 type] != 24)
                {
                  v20 = MTLoggingPlugin();
                  if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_89;
                  }
                  unsigned int v62 = [v16 type];
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "[Error] ";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "";
                  *(_WORD *)&buf[22] = 2080;
                  *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
                  *(_WORD *)&buf[32] = 1024;
                  *(_DWORD *)&buf[34] = v62;
                  v25 = v20;
                  os_log_type_t v26 = OS_LOG_TYPE_ERROR;
                  v27 = "[HID] [MT] %s%s%s Unexpected child event type: %u. Eating it";
                  uint32_t v56 = 38;
                  goto LABEL_88;
                }
                v20 = MTLoggingPlugin();
                if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_89;
                }
                uint64_t v61 = IOHIDEventGetIntegerValue();
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = "[Error] ";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "";
                *(_WORD *)&buf[22] = 2080;
                *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
                *(_WORD *)&buf[32] = 2048;
                *(void *)&buf[34] = v61;
                v25 = v20;
                os_log_type_t v26 = OS_LOG_TYPE_ERROR;
                v27 = "[HID] [MT] %s%s%s Unexpected hotkey child event with value %lu. Eating it";
              }
              uint32_t v56 = 42;
              goto LABEL_88;
            }
            id v51 = [v16 integerValueForField:0x10000];
            v52 = (char *)[v16 integerValueForField:65537];
            id v53 = v52;
            if (v51 == &loc_FF00 && v52 == (unsigned char *)&dword_10 + 1)
            {
              if ((_os_feature_enabled_impl() & 1) == 0) {
                goto LABEL_67;
              }
            }
            else if (v51 == &loc_FF00 && v52 == (unsigned char *)&def_411C8 + 1)
            {
              v20 = MTLoggingPlugin();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_89;
              }
              *(_DWORD *)buf = 136315650;
              *(void *)&buf[4] = "[Debug] ";
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "";
              *(_WORD *)&buf[22] = 2080;
              *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
              v25 = v20;
              os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
              v27 = "[HID] [MT] %s%s%s Vendor-defined Momentum event. Ignoring.";
              goto LABEL_87;
            }
            v20 = MTLoggingPlugin();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_89;
            }
            *(_DWORD *)buf = v69;
            *(void *)&buf[4] = "[Error] ";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "";
            *(_WORD *)&buf[22] = 2080;
            *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
            *(_WORD *)&buf[32] = 2048;
            *(void *)&buf[34] = v51;
            *(_WORD *)&buf[42] = 2048;
            *(void *)&buf[44] = v53;
            v25 = v20;
            os_log_type_t v26 = OS_LOG_TYPE_ERROR;
            v27 = "[HID] [MT] %s%s%s Unexpected vendor-defined child event with usage page %lu and usage %lu. Eating it";
            uint32_t v56 = 52;
            goto LABEL_88;
          }
LABEL_95:
          v15 = (char *)v15 + 1;
        }
        while (v11 != v15);
        id v63 = [obj countByEnumeratingWithState:&v84 objects:v98 count:16];
        id v11 = v63;
        if (!v63) {
          goto LABEL_111;
        }
      }
    }
    v13 = 0;
    v74 = 0;
    v72 = 0;
    v70 = 0;
    v71 = 0;
LABEL_111:

    [v76 appendEvent:v77];
    if ([(EmbeddedTrackpadHIDEventProcessor *)self shouldDispatchEvent:v76])
    {
      [v4 addObject:v76];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v65 = v73;
      id v66 = [v65 countByEnumeratingWithState:&v80 objects:v88 count:16];
      if (v66)
      {
        uint64_t v67 = *(void *)v81;
        do
        {
          for (i = 0; i != v66; i = (char *)i + 1)
          {
            if (*(void *)v81 != v67) {
              objc_enumerationMutation(v65);
            }
            if (*(void *)(*((void *)&v80 + 1) + 8 * i)) {
              objc_msgSend(v4, "addObject:");
            }
          }
          id v66 = [v65 countByEnumeratingWithState:&v80 objects:v88 count:16];
        }
        while (v66);
      }
    }
    id v7 = [v4 copy];
    v33 = v13;
LABEL_144:

    v64 = v77;
  }
  else
  {
    v64 = MTLoggingPlugin();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "[Error] ";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "";
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = "-[EmbeddedTrackpadHIDEventProcessor handleHIDEvent:]";
      _os_log_impl(&def_411C8, v64, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Failed to create pointer event. Bailing.", buf, 0x20u);
    }
    v33 = 0;
    v74 = 0;
    v72 = 0;
    v70 = 0;
    v71 = 0;
    id v7 = 0;
  }

LABEL_13:

  return v7;
}

- (BOOL)shouldDispatchEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && [v4 type] == 17
    && ([v5 parent], v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    [v5 doubleValueForField:1114112];
    double v10 = v9;
    [v5 doubleValueForField:1114113];
    float v12 = v10;
    LOBYTE(v7) = 1;
    if (v12 == 0.0)
    {
      float v13 = v11;
      if (v13 == 0.0)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v14 = objc_msgSend(v5, "children", 0);
        id v7 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7)
        {
          uint64_t v15 = *(void *)v25;
          while (2)
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v14);
              }
              double v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              if ([(TrackpadHIDEventProcessor *)self isDigitizerCollectionHIDEvent:v17])
              {
                id v18 = [v17 integerValueForField:720903];
                unsigned __int8 v19 = [v17 integerValueForField:720920];
                if (v18) {
                  BOOL v20 = 0;
                }
                else {
                  BOOL v20 = (v19 & 2) == 0;
                }
                if (!v20 || (v19 & 1) != 0)
                {
LABEL_26:
                  LOBYTE(v7) = 1;
                  goto LABEL_27;
                }
              }
              else
              {
                id v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v17 type]);
                unsigned __int8 v23 = [&off_14A118 containsObject:v22];

                if (v23) {
                  goto LABEL_26;
                }
              }
            }
            id v7 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_27:
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (void)copyPhaseFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  IOHIDEventGetPhase();
  IOHIDEventSetPhase();
}

- (void)handleHIDEvent:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHIDEvent:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHIDEvent:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHIDEvent:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHIDEvent:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHIDEvent:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHIDEvent:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end