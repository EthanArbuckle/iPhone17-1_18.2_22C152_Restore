unint64_t absTimeNS()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (machTimeToNS_onceToken != -1) {
    dispatch_once(&machTimeToNS_onceToken, &__block_literal_global_722);
  }
  return v0 * machTimeToNS_timebase / *(unsigned int *)algn_1EB801B64;
}

uint64_t AttentionServiceEventFilter::filter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v7 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 65289 && v7 == 2)
  {
    BOOL v10 = IOHIDEventGetIntegerValue() == 1;
    isSmartCoverEvent_flap1SensorIsEngaged = v10;
    BOOL v9 = isSmartCoverEvent_openSensorIsEngaged != 0;
    goto LABEL_9;
  }
  if (IntegerValue == 65289 && v7 == 1)
  {
    BOOL v9 = IOHIDEventGetIntegerValue() == 1;
    isSmartCoverEvent_openSensorIsEngaged = v9;
    BOOL v10 = isSmartCoverEvent_flap1SensorIsEngaged != 0;
LABEL_9:
    [*(id *)(a1 + 24) setSmartCoverClosed:v10 & v9];
  }
  if (![*(id *)(a1 + 24) clientCount] || (IOHIDEventGetEventFlags() & 0x800000) != 0) {
    return a3;
  }
  int Type = IOHIDEventGetType();
  uint64_t v12 = 2;
  if (Type > 28)
  {
    if (Type > 38)
    {
      if (Type == 39)
      {
        uint64_t v12 = 2048;
        goto LABEL_45;
      }
      if (Type == 42) {
        goto LABEL_45;
      }
    }
    else
    {
      if (Type == 29)
      {
        uint64_t v12 = 512;
        goto LABEL_45;
      }
      if (Type == 35)
      {
        uint64_t v12 = 64;
        goto LABEL_45;
      }
    }
  }
  else if (Type > 10)
  {
    if (Type == 11)
    {
      uint64_t v12 = 8;
      goto LABEL_45;
    }
    if (Type == 17)
    {
      uint64_t v12 = 16;
      goto LABEL_45;
    }
  }
  else
  {
    if (Type == 2) {
      goto LABEL_45;
    }
    if (Type == 3)
    {
      uint64_t v12 = 4;
      if (IOHIDEventGetIntegerValue()) {
        uint64_t v12 = 2;
      }
LABEL_45:
      uint64_t v17 = mach_absolute_time();
      uint64_t TimeStamp = IOHIDEventGetTimeStamp();
      if (machTimeToNS_onceToken != -1) {
        dispatch_once(&machTimeToNS_onceToken, &__block_literal_global_722);
      }
      unint64_t v19 = v17 * machTimeToNS_timebase / *(unsigned int *)algn_1EB801B64;
      unint64_t v20 = TimeStamp * (unint64_t)machTimeToNS_timebase / *(unsigned int *)algn_1EB801B64;
      unint64_t v21 = v19 - v20;
      if (v19 >= v20)
      {
        if (v21 < 0x2540BE401)
        {
          v14 = 0;
LABEL_62:
          [*(id *)(a1 + 24) processHIDEvent:a3 mask:v12 timestamp:v20 senderID:a2];
          goto LABEL_63;
        }
        v22 = NSString;
        if (v21 != -1)
        {
          double v23 = (double)v21 / 1000000000.0;
          v24 = @"%13.5f seconds in the past";
          goto LABEL_57;
        }
        v24 = @"%13.5f seconds in the past";
      }
      else
      {
        v22 = NSString;
        if (v20 - v19 != -1)
        {
          double v23 = (double)(v20 - v19) / 1000000000.0;
          v24 = @"%13.5f seconds in the future";
          goto LABEL_57;
        }
        v24 = @"%13.5f seconds in the future";
      }
      double v23 = INFINITY;
LABEL_57:
      v14 = objc_msgSend(v22, "stringWithFormat:", v24, *(void *)&v23);
      if (v14)
      {
        if (currentLogLevel >= 3)
        {
          v25 = _AALog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            unint64_t v27 = absTimeNS();
            if (v27 == -1) {
              double v28 = INFINITY;
            }
            else {
              double v28 = (double)v27 / 1000000000.0;
            }
            int v29 = IOHIDEventGetType();
            if (v19 == -1) {
              double v30 = INFINITY;
            }
            else {
              double v30 = (double)v19 / 1000000000.0;
            }
            if (v20 == -1) {
              double v31 = INFINITY;
            }
            else {
              double v31 = (double)v20 / 1000000000.0;
            }
            *(_DWORD *)buf = 134219522;
            double v35 = v28;
            __int16 v36 = 1024;
            int v37 = v29;
            __int16 v38 = 2112;
            double v39 = *(double *)&v14;
            __int16 v40 = 2048;
            *(void *)v41 = v17;
            *(_WORD *)&v41[8] = 2048;
            *(double *)&v41[10] = v30;
            *(_WORD *)&v41[18] = 2048;
            *(void *)&v41[20] = TimeStamp;
            __int16 v42 = 2048;
            double v43 = v31;
            _os_log_error_impl(&dword_1B3B4B000, v25, OS_LOG_TYPE_ERROR, "%13.5f: EventType %u from %@ (now %llu (%13.5f), event timestamp %llu (%13.5f))", buf, 0x44u);
          }
        }
        unint64_t v20 = v19;
      }
      goto LABEL_62;
    }
  }
  if (currentLogLevel >= 7)
  {
    BOOL v13 = 1;
    if (Type <= 0x19)
    {
      if (((1 << Type) & 0x210F000) != 0) {
        return a3;
      }
      if (Type == 1) {
        BOOL v13 = IOHIDEventGetIntegerValue() != 65292;
      }
    }
    if (v13 && currentLogLevel >= 7)
    {
      v14 = _AALog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_63;
      }
      v15 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/EventFilter/EventFilter.mm";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/EventFilter/EventFilter.mm"; ; ++i)
      {
        if (*(i - 1) == 47)
        {
          v15 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v32 = absTimeNS();
          if (v32 == -1) {
            double v33 = INFINITY;
          }
          else {
            double v33 = (double)v32 / 1000000000.0;
          }
          *(_DWORD *)buf = 136316418;
          double v35 = *(double *)&v15;
          __int16 v36 = 1024;
          int v37 = 142;
          __int16 v38 = 2048;
          double v39 = v33;
          __int16 v40 = 1024;
          *(_DWORD *)v41 = IOHIDEventGetType();
          *(_WORD *)&v41[4] = 2112;
          *(void *)&v41[6] = a3;
          *(_WORD *)&v41[14] = 2112;
          *(void *)&v41[16] = a2;
          _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: unknown event type %u : %@ from sender %@", buf, 0x36u);
LABEL_63:

          return a3;
        }
      }
    }
  }
  return a3;
}

void sub_1B3B4E8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void updateDeadline(unint64_t *a1, unint64_t a2, void *a3, uint64_t a4, int a5)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (*a1 <= a2)
  {
    if (currentLogLevel < 7) {
      goto LABEL_41;
    }
    BOOL v13 = _AALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          v14 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v18 = absTimeNS();
          if (v18 == -1) {
            double v19 = INFINITY;
          }
          else {
            double v19 = (double)v18 / 1000000000.0;
          }
          if (*a1 == -1) {
            double v21 = INFINITY;
          }
          else {
            double v21 = (double)*a1 / 1000000000.0;
          }
          if (a2 == -1) {
            double v23 = INFINITY;
          }
          else {
            double v23 = (double)a2 / 1000000000.0;
          }
          int v24 = 136316930;
          v25 = v14;
          __int16 v26 = 1024;
          int v27 = 1283;
          __int16 v28 = 2048;
          double v29 = v19;
          __int16 v30 = 2112;
          id v31 = v9;
          __int16 v32 = 2048;
          double v33 = v21;
          __int16 v34 = 2048;
          double v35 = v23;
          __int16 v36 = 2080;
          uint64_t v37 = a4;
          __int16 v38 = 1024;
          int v39 = a5;
          _os_log_impl(&dword_1B3B4B000, v13, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ ignoring updating from %13.5f to %13.5f (%s, line %d)", (uint8_t *)&v24, 0x4Au);
          break;
        }
      }
    }

    goto LABEL_41;
  }
  if (currentLogLevel < 7) {
    goto LABEL_37;
  }
  BOOL v10 = _AALog();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_36;
  }
  v11 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
  for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/RemoteClient.m";
        *(j - 1) == 47;
        ++j)
  {
    v11 = j;
LABEL_9:
    ;
  }
  if (*(j - 1)) {
    goto LABEL_9;
  }
  unint64_t v16 = absTimeNS();
  if (v16 == -1) {
    double v17 = INFINITY;
  }
  else {
    double v17 = (double)v16 / 1000000000.0;
  }
  if (*a1 == -1) {
    double v20 = INFINITY;
  }
  else {
    double v20 = (double)*a1 / 1000000000.0;
  }
  if (a2 == -1) {
    double v22 = INFINITY;
  }
  else {
    double v22 = (double)a2 / 1000000000.0;
  }
  int v24 = 136316930;
  v25 = v11;
  __int16 v26 = 1024;
  int v27 = 1278;
  __int16 v28 = 2048;
  double v29 = v17;
  __int16 v30 = 2112;
  id v31 = v9;
  __int16 v32 = 2048;
  double v33 = v20;
  __int16 v34 = 2048;
  double v35 = v22;
  __int16 v36 = 2080;
  uint64_t v37 = a4;
  __int16 v38 = 1024;
  int v39 = a5;
  _os_log_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: %@ updating from %13.5f to %13.5f (%s, line %d)", (uint8_t *)&v24, 0x4Au);
LABEL_36:

LABEL_37:
  *a1 = a2;
LABEL_41:
}

void sub_1B3B4FBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B4FDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id awQueue(int a1)
{
  if (a1)
  {
    if (awQueue_onceToken != -1) {
      dispatch_once(&awQueue_onceToken, &__block_literal_global_151);
    }
    v1 = &awQueue_queue;
  }
  else
  {
    if (awQueue_onceToken_154 != -1) {
      dispatch_once(&awQueue_onceToken_154, &__block_literal_global_156);
    }
    v1 = &awQueue_queue_153;
  }
  v2 = (void *)*v1;

  return v2;
}

__CFString *getEventMaskDescription(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28E78] string];
  v3 = v2;
  if (a1)
  {
    [v2 appendString:@"AttentionLost|"];
    a1 &= ~1uLL;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 appendString:@"Button|"];
  a1 &= ~2uLL;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 appendString:@"Keyboard|"];
  a1 &= ~4uLL;
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 appendString:@"Digitizer|"];
  a1 &= ~8uLL;
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 appendString:@"Pointer|"];
  a1 &= ~0x10uLL;
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 appendString:@"Remote|"];
  a1 &= ~0x20uLL;
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 appendString:@"GameController|"];
  a1 &= ~0x40uLL;
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 appendString:@"FaceDetect|"];
  a1 &= ~0x80uLL;
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 appendString:@"DigitalCrown|"];
  a1 &= ~0x100uLL;
  if ((a1 & 0x200) == 0)
  {
LABEL_11:
    if ((a1 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 appendString:@"MesaTouch|"];
  a1 &= ~0x200uLL;
  if ((a1 & 0x400) == 0)
  {
LABEL_12:
    if ((a1 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 appendString:@"RemoteProximity|"];
  a1 &= ~0x400uLL;
  if ((a1 & 0x800) == 0)
  {
LABEL_13:
    if (!a1) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_28:
  [v3 appendString:@"GenericGesture|"];
  a1 &= ~0x800uLL;
  if (a1) {
LABEL_14:
  }
    objc_msgSend(v3, "appendFormat:", @"UNKNOWN EVENT MASK 0x%016llx|", a1);
LABEL_15:
  uint64_t v4 = [v3 length];
  if (v4)
  {
    objc_msgSend(v3, "deleteCharactersInRange:", v4 - 1, 1);
    v5 = v3;
  }
  else
  {
    v5 = @"NONE";
  }

  return v5;
}

id tagDescription(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"tagIndex %llu", a1);
  }
  else if (isEventFilterProcess == 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"tagIndex %llu (tag not present in server)", a1);
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"tagIndex %llu (nil tag)", a1);
  uint64_t v4 = };

  return v4;
}

id _AALog()
{
  if (_AALog_onceToken != -1) {
    dispatch_once(&_AALog_onceToken, &__block_literal_global_877);
  }
  v0 = (void *)_AALog_log;

  return v0;
}

double decodeDouble(void *a1, unsigned char *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a1;
  uint64_t v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:v5];

  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      BOOL v10 = _AALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v12 = absTimeNS();
        if (v12 == -1) {
          double v13 = INFINITY;
        }
        else {
          double v13 = (double)v12 / 1000000000.0;
        }
        int v14 = 134218242;
        double v15 = v13;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_error_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", (uint8_t *)&v14, 0x16u);
      }
    }
    *a2 = 1;
    double v9 = 0.0;
  }

  return v9;
}

uint64_t decodeUInt64(void *a1, unsigned char *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a1;
  uint64_t v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:v5];

  if (v7)
  {
    uint64_t v8 = [v7 unsignedLongLongValue];
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      double v9 = _AALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        unint64_t v11 = absTimeNS();
        if (v11 == -1) {
          double v12 = INFINITY;
        }
        else {
          double v12 = (double)v11 / 1000000000.0;
        }
        int v13 = 134218242;
        double v14 = v12;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_error_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", (uint8_t *)&v13, 0x16u);
      }
    }
    uint64_t v8 = 0;
    *a2 = 1;
  }

  return v8;
}

id decodeString(void *a1, unsigned char *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (([v5 containsValueForKey:v6] & 1) == 0)
  {
    if (currentLogLevel >= 3)
    {
      BOOL v10 = _AALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v12 = absTimeNS();
        if (v12 == -1) {
          double v13 = INFINITY;
        }
        else {
          double v13 = (double)v12 / 1000000000.0;
        }
        int v14 = 134218242;
        double v15 = v13;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_error_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", (uint8_t *)&v14, 0x16u);
      }
    }
    *a2 = 1;
  }

  return v8;
}

void sub_1B3B53640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B3B54E38(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1B3B5586C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B55AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B58EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
}

char *getEndReasonDescriptions(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4) {
    return off_1E606A060[a1 - 1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"unknown BKOperationEndReason %llu", a1);
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 UTF8String];

  return (char *)v3;
}

void sub_1B3B5BB3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1B3B5BC1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getPearlDevice_block_invoke()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F50510] availableDevices];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v14 != v3) {
          objc_enumerationMutation(v0);
        }
        id v5 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v5 type] == 2)
        {
          id v12 = 0;
          uint64_t v6 = [MEMORY[0x1E4F504F8] deviceWithDescriptor:v5 error:&v12];
          id v7 = v12;
          uint64_t v8 = (void *)getPearlDevice_result;
          getPearlDevice_result = v6;

          if (v7 && currentLogLevel >= 3)
          {
            id v9 = _AALog();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              unint64_t v10 = absTimeNS();
              if (v10 == -1) {
                double v11 = INFINITY;
              }
              else {
                double v11 = (double)v10 / 1000000000.0;
              }
              *(_DWORD *)buf = 134218242;
              double v18 = v11;
              __int16 v19 = 2112;
              id v20 = v7;
              _os_log_error_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_ERROR, "%13.5f: Failed to get pearl device: %@", buf, 0x16u);
            }
          }
          goto LABEL_15;
        }
      }
      uint64_t v2 = [v0 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

char *getDeviceStateDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 5) {
    return off_1E606A0E0[a1 - 1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"unknown BKPearlDeviceState %llu", a1);
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 UTF8String];

  return (char *)v3;
}

char *getDeviceEventDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 0xC) {
    return off_1E606A080[a1 - 1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"unknown BKPearlDeviceEvent %llu", a1);
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 UTF8String];

  return (char *)v3;
}

char *getOperationStateDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 5) {
    return off_1E606A108[a1 - 1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"unknown BKOperationState %llu", a1);
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 UTF8String];

  return (char *)v3;
}

void __getPearlDevice_block_invoke_332()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F50510] availableDevices];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v14 != v3) {
          objc_enumerationMutation(v0);
        }
        id v5 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v5 type] == 2)
        {
          id v12 = 0;
          uint64_t v6 = [MEMORY[0x1E4F504F8] deviceWithDescriptor:v5 error:&v12];
          id v7 = v12;
          uint64_t v8 = (void *)getPearlDevice_result_327;
          getPearlDevice_result_327 = v6;

          if (v7 && currentLogLevel >= 3)
          {
            id v9 = _AALog();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              unint64_t v10 = absTimeNS();
              if (v10 == -1) {
                double v11 = INFINITY;
              }
              else {
                double v11 = (double)v10 / 1000000000.0;
              }
              *(_DWORD *)buf = 134218242;
              double v18 = v11;
              __int16 v19 = 2112;
              id v20 = v7;
              _os_log_error_impl(&dword_1B3B4B000, v9, OS_LOG_TYPE_ERROR, "%13.5f: Failed to get pearl device: %@", buf, 0x16u);
            }
          }
          goto LABEL_15;
        }
      }
      uint64_t v2 = [v0 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

uint64_t AttentionServiceEventFilter::Release(AttentionServiceEventFilter *this, void *a2)
{
  int v2 = *((_DWORD *)this + 2);
  uint64_t v3 = (v2 - 1);
  *((_DWORD *)this + 2) = v3;
  if (v2 == 1)
  {
    CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)this + 2));
    CFRelease(*((CFTypeRef *)this + 2));

    MEMORY[0x1B3EC13C0](this, 0x10E0C406288F30FLL);
  }
  return v3;
}

void __clang_call_terminate(void *a1)
{
}

uint64_t AttentionServiceEventFilter::AddRef(AttentionServiceEventFilter *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 2) + 1);
  *((_DWORD *)this + 2) = v2;
  return v2;
}

uint64_t AttentionServiceEventFilter::QueryInterface(AttentionServiceEventFilter *this, void *a2, CFUUIDBytes a3, void **a4)
{
  uint64_t v4 = *(void **)&a3.byte8;
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0, *(CFUUIDBytes *)&a2);
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
  CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v8)
    || (CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(v7, 0x19u, 0xD7u, 0x74u, 0x41u, 0xBBu, 0xC4u, 0x45u, 0x11u, 0x91u, 0x49u, 0x60u, 0x57u, 0x2Au, 0xBu, 1u, 0x5Cu), CFEqual(v6, v9)))
  {
    uint64_t v10 = 0;
    ++*((_DWORD *)this + 2);
  }
  else
  {
    this = 0;
    uint64_t v10 = 2147483652;
  }
  *uint64_t v4 = this;
  CFRelease(v6);
  return v10;
}

_DWORD *_AWAttentionServiceEventFilterFactory(const __CFAllocator *a1, const void *a2)
{
  isEventFilterProcess = 1;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
  CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (!CFEqual(a2, v5)) {
    return 0;
  }
  CFUUIDRef v6 = CFAllocatorAllocate(a1, 32, 0);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(v4, 0xE9u, 0xC1u, 0x6Bu, 0x10u, 0x46u, 0xD0u, 0x46u, 0x2Cu, 0x86u, 0xDDu, 0x34u, 0x46u, 0x45u, 0x10u, 0x56u, 0xAAu);
  *(void *)CFUUIDRef v6 = &AttentionServiceEventFilter::functionTable;
  v6[2] = 1;
  *((void *)v6 + 2) = 0;
  *((void *)v6 + 3) = 0;
  CFPlugInAddInstanceForFactory(v7);
  *((void *)v6 + 2) = CFRetain(v7);
  uint64_t v8 = +[AWAttentionAwareService sharedAttentionService];
  CFUUIDRef v9 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v8;

  return v6;
}

void sub_1B3B60A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B3B614F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1B3B62690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3B627DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3B62F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__599(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__600(uint64_t a1)
{
}

void sub_1B3B63278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *getPollEventTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 5) {
    return off_1E606A260[a1 - 1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"unknown AWAttentionPollEventType %llu", a1);
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 UTF8String];

  return (char *)v3;
}

void sub_1B3B64C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __registerForPrefsChange_block_invoke_284(uint64_t a1, void *a2)
{
  if (!a2 || (objc_opt_isKindOfClass() & 1) != 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return MEMORY[0x1F4181820]();
}

void __registerForPrefsChange_block_invoke_2_287(uint64_t a1)
{
  id v5 = [(id)registerForPrefsChange_notifyBlocks objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    objc_msgSend((id)registerForPrefsChange_notifyBlocks, "setObject:forKeyedSubscript:");
  }
  id v2 = (void *)MEMORY[0x1B3EC18C0](*(void *)(a1 + 40));
  [v5 addObject:v2];

  uint64_t v3 = *(void *)(a1 + 40);
  CFAllocatorRef v4 = [(id)registerForPrefsChange_curPrefs objectForKeyedSubscript:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

uint64_t __registerForPrefsChange_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = (void *)registerForPrefsChange_notifyBlocks;
  registerForPrefsChange_notifyBlocks = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.AttentionAwareness.PreferencesChanged", 0);
  uint64_t v3 = (void *)registerForPrefsChange_queue;
  registerForPrefsChange_queue = (uint64_t)v2;

  uint64_t v4 = getPreferences();
  id v5 = (void *)registerForPrefsChange_curPrefs;
  registerForPrefsChange_curPrefs = v4;

  int out_token = 0;
  return notify_register_dispatch("com.apple.AttentionAwareness.PreferencesChanged", &out_token, (dispatch_queue_t)registerForPrefsChange_queue, &__block_literal_global_282);
}

id getPreferences()
{
  uint64_t v6 = 0;
  CFUUIDRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CFUUIDRef v9 = __Block_byref_object_copy__724;
  uint64_t v10 = __Block_byref_object_dispose__725;
  id v11 = 0;
  if (isEventFilterProcess == 1)
  {
    CFPreferencesAppSynchronize(@"com.apple.AttentionAwareness");
    CFDictionaryRef v0 = CFPreferencesCopyMultiple(0, @"com.apple.AttentionAwareness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    uint64_t v1 = (void *)v7[5];
    v7[5] = (uint64_t)v0;
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getPreferences_block_invoke;
    v5[3] = &unk_1E606A320;
    v5[4] = &v6;
    id v2 = +[AWServiceManager invokeWithService:v5];
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1B3B66D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __registerForPrefsChange_block_invoke_2()
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v0 = getPreferences();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = [(id)registerForPrefsChange_notifyBlocks allKeys];
  uint64_t v1 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v4 = *(void *)v48;
    *(void *)&long long v2 = 136316418;
    long long v41 = v2;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v48 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v47 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend((id)registerForPrefsChange_curPrefs, "objectForKeyedSubscript:", v6, v41);
        uint64_t v8 = [v0 objectForKeyedSubscript:v6];
        CFUUIDRef v9 = (void *)v8;
        if (v7 | v8)
        {
          if (v7) {
            BOOL v10 = v8 == 0;
          }
          else {
            BOOL v10 = 0;
          }
          if (v10)
          {
            if (currentLogLevel != 5)
            {
              if (currentLogLevel < 6) {
                goto LABEL_73;
              }
              id v12 = _AALog();
              if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_72;
              }
              __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m";
              for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m"; ; ++i)
              {
                if (*(i - 1) == 47)
                {
                  __int16 v19 = i;
                }
                else if (!*(i - 1))
                {
                  unint64_t v25 = absTimeNS();
                  if (v25 == -1) {
                    double v26 = INFINITY;
                  }
                  else {
                    double v26 = (double)v25 / 1000000000.0;
                  }
                  *(_DWORD *)buf = 136316162;
                  double v53 = *(double *)&v19;
                  __int16 v54 = 1024;
                  *(_DWORD *)v55 = 515;
                  *(_WORD *)&v55[4] = 2048;
                  *(double *)&v55[6] = v26;
                  *(_WORD *)&v55[14] = 2112;
                  *(void *)&v55[16] = v6;
                  *(_WORD *)&v55[24] = 2112;
                  *(void *)&v55[26] = v7;
                  int v27 = v12;
                  __int16 v28 = "%30s:%-4d: %13.5f: preference %@ removed (was %@)";
LABEL_70:
                  uint32_t v31 = 48;
LABEL_71:
                  _os_log_impl(&dword_1B3B4B000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, v31);
LABEL_72:

                  goto LABEL_73;
                }
              }
            }
            id v12 = _AALog();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_72;
            }
            unint64_t v15 = absTimeNS();
            if (v15 == -1) {
              double v16 = INFINITY;
            }
            else {
              double v16 = (double)v15 / 1000000000.0;
            }
            *(_DWORD *)buf = 134218498;
            double v53 = v16;
            __int16 v54 = 2112;
            *(void *)v55 = v6;
            *(_WORD *)&v55[8] = 2112;
            *(void *)&v55[10] = v7;
            int v27 = v12;
            __int16 v28 = "%13.5f: preference %@ removed (was %@)";
LABEL_61:
            uint32_t v31 = 32;
            goto LABEL_71;
          }
          if (v7) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v8 == 0;
          }
          if (!v11)
          {
            if (currentLogLevel != 5)
            {
              if (currentLogLevel >= 6)
              {
                id v12 = _AALog();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  double v21 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m";
                  for (j = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m"; ; ++j)
                  {
                    if (*(j - 1) == 47)
                    {
                      double v21 = j;
                    }
                    else if (!*(j - 1))
                    {
                      unint64_t v29 = absTimeNS();
                      if (v29 == -1) {
                        double v30 = INFINITY;
                      }
                      else {
                        double v30 = (double)v29 / 1000000000.0;
                      }
                      *(_DWORD *)buf = 136316162;
                      double v53 = *(double *)&v21;
                      __int16 v54 = 1024;
                      *(_DWORD *)v55 = 519;
                      *(_WORD *)&v55[4] = 2048;
                      *(double *)&v55[6] = v30;
                      *(_WORD *)&v55[14] = 2112;
                      *(void *)&v55[16] = v6;
                      *(_WORD *)&v55[24] = 2112;
                      *(void *)&v55[26] = v9;
                      int v27 = v12;
                      __int16 v28 = "%30s:%-4d: %13.5f: preference %@ set to %@";
                      goto LABEL_70;
                    }
                  }
                }
                goto LABEL_72;
              }
              goto LABEL_73;
            }
            id v12 = _AALog();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_72;
            }
            unint64_t v17 = absTimeNS();
            if (v17 == -1) {
              double v18 = INFINITY;
            }
            else {
              double v18 = (double)v17 / 1000000000.0;
            }
            *(_DWORD *)buf = 134218498;
            double v53 = v18;
            __int16 v54 = 2112;
            *(void *)v55 = v6;
            *(_WORD *)&v55[8] = 2112;
            *(void *)&v55[10] = v9;
            int v27 = v12;
            __int16 v28 = "%13.5f: preference %@ set to %@";
            goto LABEL_61;
          }
          if (([(id)v7 isEqual:v8] & 1) == 0)
          {
            if (currentLogLevel == 5)
            {
              id v12 = _AALog();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v13 = absTimeNS();
                if (v13 == -1) {
                  double v14 = INFINITY;
                }
                else {
                  double v14 = (double)v13 / 1000000000.0;
                }
                *(_DWORD *)buf = 134218754;
                double v53 = v14;
                __int16 v54 = 2112;
                *(void *)v55 = v6;
                *(_WORD *)&v55[8] = 2112;
                *(void *)&v55[10] = v7;
                *(_WORD *)&v55[18] = 2112;
                *(void *)&v55[20] = v9;
                int v27 = v12;
                __int16 v28 = "%13.5f: preference %@ changed from %@ to %@";
                uint32_t v31 = 42;
                goto LABEL_71;
              }
              goto LABEL_72;
            }
            if (currentLogLevel >= 6)
            {
              id v12 = _AALog();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                double v23 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m";
                for (k = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m"; ; ++k)
                {
                  if (*(k - 1) == 47)
                  {
                    double v23 = k;
                  }
                  else if (!*(k - 1))
                  {
                    unint64_t v32 = absTimeNS();
                    if (v32 == -1) {
                      double v33 = INFINITY;
                    }
                    else {
                      double v33 = (double)v32 / 1000000000.0;
                    }
                    *(_DWORD *)buf = v41;
                    double v53 = *(double *)&v23;
                    __int16 v54 = 1024;
                    *(_DWORD *)v55 = 523;
                    *(_WORD *)&v55[4] = 2048;
                    *(double *)&v55[6] = v33;
                    *(_WORD *)&v55[14] = 2112;
                    *(void *)&v55[16] = v6;
                    *(_WORD *)&v55[24] = 2112;
                    *(void *)&v55[26] = v7;
                    __int16 v56 = 2112;
                    v57 = v9;
                    int v27 = v12;
                    __int16 v28 = "%30s:%-4d: %13.5f: preference %@ changed from %@ to %@";
                    uint32_t v31 = 58;
                    goto LABEL_71;
                  }
                }
              }
              goto LABEL_72;
            }
LABEL_73:
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            __int16 v34 = [(id)registerForPrefsChange_notifyBlocks objectForKeyedSubscript:v6];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v44;
              do
              {
                for (uint64_t m = 0; m != v36; ++m)
                {
                  if (*(void *)v44 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  (*(void (**)(void))(*(void *)(*((void *)&v43 + 1) + 8 * m) + 16))();
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
              }
              while (v36);
            }
          }
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v39 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
      uint64_t v3 = v39;
    }
    while (v39);
  }

  uint64_t v40 = (void *)registerForPrefsChange_curPrefs;
  registerForPrefsChange_curPrefs = (uint64_t)v0;
}

uint64_t __machTimeToNS_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&machTimeToNS_timebase);
}

uint64_t __Block_byref_object_copy__724(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__725(uint64_t a1)
{
}

uint64_t __getPreferences_block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __getPreferences_block_invoke_2;
  v3[3] = &unk_1E606A2F8;
  v3[4] = *(void *)(a1 + 32);
  [a2 getDebugPreferences:v3];
  return 0;
}

void __getPreferences_block_invoke_2(uint64_t a1, void *a2)
{
}

__CFString *getNotificationMaskDescription(uint64_t a1)
{
  long long v2 = [MEMORY[0x1E4F28E78] string];
  uint64_t v3 = v2;
  if (a1)
  {
    [v2 appendString:@"FaceDetectWasInterrupted|"];
    a1 &= ~1uLL;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 appendString:@"FaceDetectInterruptionDidEnd|"];
  a1 &= ~2uLL;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 appendString:@"FaceDetectWasDisabled|"];
  a1 &= ~4uLL;
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 appendString:@"MotionDetectWasInterrupted|"];
  a1 &= ~8uLL;
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if (!a1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_14:
  [v3 appendString:@"MotionDetectInterruptionDidEnd|"];
  a1 &= ~0x10uLL;
  if (a1) {
LABEL_7:
  }
    objc_msgSend(v3, "appendFormat:", @"UNKNOWN NOTIFICATION MASK 0x%016llx|", a1);
LABEL_8:
  uint64_t v4 = [v3 length];
  if (v4)
  {
    objc_msgSend(v3, "deleteCharactersInRange:", v4 - 1, 1);
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = @"NONE";
  }

  return v5;
}

__CFString *getFaceDetectOrientationDescription(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown AWFaceDetectOrientation %llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E606A368[a1];
  }

  return v1;
}

__CFString *getEyeReliefFaceStateDescription(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown AWEyeReliefFaceState %llu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E606A390[a1];
  }

  return v1;
}

uint64_t connectionHasEntitlement(void *a1, uint64_t a2)
{
  long long v2 = [a1 valueForEntitlement:a2];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

uint64_t __awQueue_block_invoke_2()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AttentionAwareness.Framework", 0);
  uint64_t v1 = awQueue_queue_153;
  awQueue_queue_153 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __awQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AttentionAwareness.Server", 0);
  uint64_t v1 = awQueue_queue;
  awQueue_queue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id xpcInterfaceForScheduler()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C5CB28];
  uint64_t v1 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C61388];
  long long v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C5D0E8];
  [v0 setInterface:v1 forSelector:sel_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents_ argumentIndex:0 ofReply:0];
  [v0 setInterface:v2 forSelector:sel_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents_ argumentIndex:0 ofReply:1];
  uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C5EB08];

  [v0 setInterface:v3 forSelector:sel_getUnitTestSamplerWithReply_ argumentIndex:0 ofReply:1];

  return v0;
}

id decodeStringSet(void *a1, unsigned char *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  CFUUIDRef v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  BOOL v10 = [v5 decodeObjectOfClasses:v9 forKey:v6];
  if (!v10)
  {
    if ([v5 containsValueForKey:v6])
    {
      id v16 = 0;
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    if (currentLogLevel >= 3)
    {
      unint64_t v17 = _AALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unint64_t v19 = absTimeNS();
        if (v19 == -1) {
          double v20 = INFINITY;
        }
        else {
          double v20 = (double)v19 / 1000000000.0;
        }
        *(_DWORD *)buf = 134218242;
        double v27 = v20;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_error_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_ERROR, "%13.5f: Failed to decode %@", buf, 0x16u);
      }
    }
    id v16 = 0;
    *a2 = 1;
    goto LABEL_19;
  }
  double v21 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          a2 = v21;
          goto LABEL_15;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v16 = v11;
LABEL_19:

  return v16;
}

uint64_t deviceSupportsPearl()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = AVGestaltGetBoolAnswer();
  if (!result) {
    return result;
  }
  bzero(__s1, 0x800uLL);
  size_t v9 = 2048;
  sysctlbyname("kern.bootargs", __s1, &v9, 0, 0);
  uint64_t v1 = strstr(__s1, "disable-attention-checks");
  if (v1)
  {
    int v2 = strtol(v1 + 25, 0, 0);
    uint64_t result = 0;
    if (v2) {
      return result;
    }
  }
  if (isPearlDisabledViaAccessibility_onceToken != -1) {
    dispatch_once(&isPearlDisabledViaAccessibility_onceToken, &__block_literal_global_308);
  }
  size_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  *(void *)__s1 = MEMORY[0x1E4F143A8];
  *(void *)&__s1[8] = 3221225472;
  *(void *)&__s1[16] = __isPearlDisabledViaAccessibility_block_invoke_315;
  *(void *)&__s1[24] = &unk_1E606A348;
  uint64_t v14 = &v9;
  dispatch_sync((dispatch_queue_t)isPearlDisabledViaAccessibility_queue, __s1);
  int v3 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  if (!v3) {
    return 1;
  }
  if (currentLogLevel < 7) {
    return 0;
  }
  uint64_t v4 = _AALog();
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_20;
  }
  id v5 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m";
  for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m"; *(i - 1) == 47; ++i)
  {
    id v5 = i;
LABEL_14:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_14;
  }
  unint64_t v7 = absTimeNS();
  if (v7 == -1) {
    double v8 = INFINITY;
  }
  else {
    double v8 = (double)v7 / 1000000000.0;
  }
  *(_DWORD *)__s1 = 136315650;
  *(void *)&__s1[4] = v5;
  *(_WORD *)&__s1[12] = 1024;
  *(_DWORD *)&__s1[14] = 654;
  *(_WORD *)&__s1[18] = 2048;
  *(double *)&__s1[20] = v8;
  _os_log_impl(&dword_1B3B4B000, v4, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: Pearl disabled via accessibility; disabling FaceDetect",
    __s1,
    0x1Cu);
LABEL_20:

  return 0;
}

uint64_t __isPearlDisabledViaAccessibility_block_invoke_315(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = isPearlDisabledViaAccessibility_accessibilityValue;
  return result;
}

uint64_t __isPearlDisabledViaAccessibility_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AttentionAwareness.pearlAccessibilitySettingsChanged", 0);
  uint64_t v1 = (void *)isPearlDisabledViaAccessibility_queue;
  isPearlDisabledViaAccessibility_queue = (uint64_t)v0;

  isPearlDisabledViaAccessibility_accessibilityValue = _AXSAttentionAwarenessFeaturesEnabled() == 0;
  int out_token = 0;
  int v2 = (const char *)[ (id) *MEMORY[0x1E4FB90B0] UTF8String];
  return notify_register_dispatch(v2, &out_token, (dispatch_queue_t)isPearlDisabledViaAccessibility_queue, &__block_literal_global_311);
}

uint64_t __isPearlDisabledViaAccessibility_block_invoke_2()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = _AXSAttentionAwarenessFeaturesEnabled();
  if (isPearlDisabledViaAccessibility_accessibilityValue != (result == 0))
  {
    isPearlDisabledViaAccessibility_accessibilityValue = result == 0;
    if (currentLogLevel == 5)
    {
      uint64_t v1 = _AALog();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v2 = absTimeNS();
        if (v2 == -1) {
          double v3 = INFINITY;
        }
        else {
          double v3 = (double)v2 / 1000000000.0;
        }
        double v8 = "OFF";
        if (!isPearlDisabledViaAccessibility_accessibilityValue) {
          double v8 = "ON";
        }
        int v13 = 134218242;
        double v14 = v3;
        __int16 v15 = 2080;
        *(void *)id v16 = v8;
        size_t v9 = "%13.5f: Attention Aware Features set to %s";
        BOOL v10 = v1;
        uint32_t v11 = 22;
LABEL_25:
        _os_log_impl(&dword_1B3B4B000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
      }
    }
    else
    {
      if (currentLogLevel < 6) {
        return notify_post("com.apple.AttentionAwareness.SupportedEventsChanged");
      }
      uint64_t v1 = _AALog();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m";
        for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Shared/Utils.m"; ; ++i)
        {
          if (*(i - 1) == 47)
          {
            uint64_t v4 = i;
          }
          else if (!*(i - 1))
          {
            unint64_t v6 = absTimeNS();
            if (v6 == -1) {
              double v7 = INFINITY;
            }
            else {
              double v7 = (double)v6 / 1000000000.0;
            }
            int v13 = 136315906;
            if (isPearlDisabledViaAccessibility_accessibilityValue) {
              char v12 = "OFF";
            }
            else {
              char v12 = "ON";
            }
            double v14 = *(double *)&v4;
            __int16 v15 = 1024;
            *(_DWORD *)id v16 = 611;
            *(_WORD *)&v16[4] = 2048;
            *(double *)&v16[6] = v7;
            __int16 v17 = 2080;
            double v18 = v12;
            size_t v9 = "%30s:%-4d: %13.5f: Attention Aware Features set to %s";
            BOOL v10 = v1;
            uint32_t v11 = 38;
            goto LABEL_25;
          }
        }
      }
    }

    return notify_post("com.apple.AttentionAwareness.SupportedEventsChanged");
  }
  return result;
}

void sub_1B3B69264(_Unwind_Exception *a1)
{
  double v7 = v3;
  objc_destroyWeak(v7);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_1B3B6A26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 240), 8);
  _Block_object_dispose((const void *)(v49 - 208), 8);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1040(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1041(uint64_t a1)
{
}

void sub_1B3B6BBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1136(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1137(uint64_t a1)
{
}

uint64_t __schedulerQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.AttentionAwareness.Scheduler", 0);
  uint64_t v1 = schedulerQueue_queue;
  schedulerQueue_queue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void AWStartAttentionAwarenessServer()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (currentLogLevel == 5)
  {
    dispatch_queue_t v0 = _AALog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v1 = absTimeNS();
      if (v1 == -1) {
        double v2 = INFINITY;
      }
      else {
        double v2 = (double)v1 / 1000000000.0;
      }
      int v10 = 134217984;
      double v11 = v2;
      double v7 = "%13.5f: This method doesn't do anything, this is an empty stub";
      double v8 = v0;
      uint32_t v9 = 12;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    if (currentLogLevel < 6) {
      return;
    }
    dispatch_queue_t v0 = _AALog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      double v3 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/DevelopmentMode.m";
      for (uint64_t i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/DevelopmentMode.m"; ; ++i)
      {
        if (*(i - 1) == 47)
        {
          double v3 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v5 = absTimeNS();
          if (v5 == -1) {
            double v6 = INFINITY;
          }
          else {
            double v6 = (double)v5 / 1000000000.0;
          }
          int v10 = 136315650;
          double v11 = *(double *)&v3;
          __int16 v12 = 1024;
          int v13 = 34;
          __int16 v14 = 2048;
          double v15 = v6;
          double v7 = "%30s:%-4d: %13.5f: This method doesn't do anything, this is an empty stub";
          double v8 = v0;
          uint32_t v9 = 28;
          goto LABEL_19;
        }
      }
    }
  }
}

void _AWStartStandaloneServer()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFUUIDRef v0 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  _AWAttentionServiceEventFilterFactory(0, v0);
  unint64_t v1 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  if (!IOHIDEventSystemClientSetProperty(v1, @"ClientEventFilter", &unk_1F0C5AE58) && currentLogLevel >= 3)
  {
    double v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      unint64_t v4 = absTimeNS();
      if (v4 == -1) {
        double v5 = INFINITY;
      }
      else {
        double v5 = (double)v4 / 1000000000.0;
      }
      *(_DWORD *)buf = 134217984;
      double v7 = v5;
      _os_log_error_impl(&dword_1B3B4B000, v2, OS_LOG_TYPE_ERROR, "%13.5f: IOHIDEventSystemClientSetProperty failed", buf, 0xCu);
    }
  }
  IOHIDEventSystemClientRegisterEventBlock();
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.AttentionAwareness.StandaloneServerQueue", 0);
  IOHIDEventSystemClientScheduleWithDispatchQueue();
}

void sub_1B3B6F658(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1B3B6F720(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

char *getAttentionSamplerStateDescription(unsigned int a1)
{
  if (a1 < 6) {
    return off_1E606A5B0[a1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"unknown AWAttentionSamplerState %llu", a1);
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 UTF8String];

  return (char *)v3;
}

void sub_1B3B703A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1639(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1640(uint64_t a1)
{
}

void sub_1B3B706D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B70A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B70D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B71034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B71368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B716C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B71D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B74ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B766C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2053(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2054(uint64_t a1)
{
}

void sub_1B3B7C90C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B3B7F858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2315(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2316(uint64_t a1)
{
}

void sub_1B3B805C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B80920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B80B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B80E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B810D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B81478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B8165C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B81AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B81BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B8234C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3B825D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x1F40D0EB8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t BKSHIDServicesIsSmartCoverClosed()
{
  return MEMORY[0x1F410BFB0]();
}

uint64_t BLSBacklightStateIsActive()
{
  return MEMORY[0x1F410C0C8]();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1F40D89D0](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x1F40E89E8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1F40E8A28]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1F40E8AC8]();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return MEMORY[0x1F40E8AE8]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x1F40E8B18]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1F40E8B48](client, key, property);
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x1F40E8D90]();
}

uint64_t IOHIDServiceGetTypeID()
{
  return MEMORY[0x1F40E8DA0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x1F40E7088]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PLLogTimeSensitiveRegisteredEvent()
{
  return MEMORY[0x1F4145D98]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x1F4178940]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t analytics_send_event()
{
  return MEMORY[0x1F41138D0]();
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2F0](atoken);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CDFE0](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x1F40CDFE8](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}