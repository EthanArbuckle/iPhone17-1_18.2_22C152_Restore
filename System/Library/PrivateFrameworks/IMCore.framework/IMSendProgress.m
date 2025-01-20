@interface IMSendProgress
+ (Class)_timeDataSourceClass;
- (BOOL)_hasSendingMessages;
- (BOOL)startSendProgressImmediately;
- (BOOL)wasShowing;
- (IMSendProgress)initWithDelegate:(id)a3 context:(id)a4;
- (IMSendProgressDelegate)delegate;
- (IMSendProgressTimeDataSource)timeDataSource;
- (NSDictionary)sendingItems;
- (NSTimer)sendProgressTimer;
- (double)_getEstimatedSendTimeOverStewieInSeconds;
- (float)cachedSendProgress;
- (id)context;
- (id)description;
- (unint64_t)_sGetEstimatedNumberOfRetries:(unint64_t)a3;
- (unint64_t)_sGetNumberOfDataGrams:(unint64_t)a3;
- (void)_resetSendProgress;
- (void)_scheduleSendProgressTimerIfNeeded;
- (void)_sendProgressTimerFired:(id)a3;
- (void)_updateSendProgress;
- (void)dealloc;
- (void)invalidate;
- (void)setCachedSendProgress:(float)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSendProgressTimer:(id)a3;
- (void)setSendingItems:(id)a3;
- (void)setStartSendProgressImmediately:(BOOL)a3;
- (void)setTimeDataSource:(id)a3;
- (void)setWasShowing:(BOOL)a3;
- (void)updateForItems:(id)a3 forced:(BOOL)a4;
@end

@implementation IMSendProgress

- (unint64_t)_sGetNumberOfDataGrams:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 >= 0xD) {
    return (unint64_t)(ceil((double)(a3 - 11) / 17.0) + 1.0);
  }
  return 1;
}

- (unint64_t)_sGetEstimatedNumberOfRetries:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  double v3 = ((double)a3 + -1.0) / 0.7 + 2.04081633 - (double)a3;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  return vcvtpd_u64_f64(v3);
}

- (double)_getEstimatedSendTimeOverStewieInSeconds
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  v5 = objc_msgSend_sendingItems(self, a2, v2, v3);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A4C0C5D0;
  v15[3] = &unk_1E5B7E2E8;
  v15[4] = &v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v6, (uint64_t)v15, v7);

  unint64_t NumberOfDataGrams = objc_msgSend__sGetNumberOfDataGrams_(self, v8, *((int *)v17 + 6), v9);
  double v13 = ceil(((double)(unint64_t)(2 * objc_msgSend__sGetEstimatedNumberOfRetries_(self, v11, NumberOfDataGrams, v12))+ (double)NumberOfDataGrams * 2.0)* 2.56)+ 2.56;
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self->_sendProgressTimer, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMSendProgress;
  [(IMSendProgress *)&v5 dealloc];
}

- (id)description
{
  return (id)objc_msgSend_description(self->_sendingItems, a2, v2, v3);
}

- (IMSendProgress)initWithDelegate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IMSendProgress;
  v8 = [(IMSendProgress *)&v17 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak(&v9->_context, v7);
    v10 = objc_opt_class();
    v14 = (IMSendProgressTimeDataSource *)objc_alloc_init((Class)objc_msgSend__timeDataSourceClass(v10, v11, v12, v13));
    timeDataSource = v9->_timeDataSource;
    v9->_timeDataSource = v14;
  }
  return v9;
}

- (void)updateForItems:(id)a3 forced:(BOOL)a4
{
  BOOL v95 = a4;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v96 = self;
  v98 = self->_sendingItems;
  id v6 = v5;
  v97 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id obj = v6;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v110, (uint64_t)buf, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v111;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v111 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v110 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v18 = objc_msgSend_isTypingOrCancelTypingMessage(v14, v15, v16, v17) ^ 1;
        }
        else {
          int v18 = 0;
        }
        int v19 = objc_msgSend_sharedInstance(IMChorosMonitor, v15, v16, v17);
        int isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v19, v20, v21, v22);

        if (((isSatelliteConnectionActive | v18 ^ 1) & 1) == 0)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            goto LABEL_28;
          }
LABEL_13:
          v28 = objc_msgSend_guid(v14, v24, v25, v26);
          v32 = objc_msgSend__senderHandle(v14, v29, v30, v31);
          v36 = objc_msgSend_service(v32, v33, v34, v35);

          id v37 = v14;
          v40 = objc_msgSend_objectForKey_(v98, v38, (uint64_t)v28, v39);

          if (objc_msgSend_isFromMe(v37, v41, v42, v43)
            && !objc_msgSend_errorCode(v37, v44, v45, v46))
          {
            int v50 = objc_msgSend_isSent(v37, v47, v48, v49) ^ 1;
          }
          else
          {
            LOBYTE(v50) = 0;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v40) {
              char v58 = 1;
            }
            else {
              char v58 = v50;
            }
            if ((v58 & 1) == 0) {
              objc_msgSend_isLocatingMessage(v37, v51, v52, v53);
            }
            goto LABEL_27;
          }
          int isDiscontinued = objc_msgSend_isDiscontinued(v36, v51, v52, v53);
          if (v50 & 1 | (v40 != 0))
          {
            if (isDiscontinued) {
              goto LABEL_27;
            }
LABEL_26:
            objc_msgSend_setObject_forKey_(v97, v55, (uint64_t)v37, (uint64_t)v28);
          }
          else if (((objc_msgSend_isLocatingMessage(v37, v55, v56, v57) ^ 1 | isDiscontinued) & 1) == 0)
          {
            goto LABEL_26;
          }
LABEL_27:

          goto LABEL_28;
        }

        if ((isSatelliteConnectionActive & v18) != 0) {
          goto LABEL_13;
        }
LABEL_28:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v110, (uint64_t)buf, 16);
      uint64_t v11 = v59;
    }
    while (v59);
  }

  *(void *)&long long v110 = 0;
  *((void *)&v110 + 1) = &v110;
  *(void *)&long long v111 = 0x2020000000;
  BYTE8(v111) = 0;
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = sub_1A4C66A30;
  v107[3] = &unk_1E5B7F1F8;
  id v60 = v97;
  id v108 = v60;
  v109 = &v110;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v98, v61, (uint64_t)v107, v62);
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  char v106 = 0;
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = sub_1A4C66A8C;
  v100[3] = &unk_1E5B7F1F8;
  v63 = v98;
  v101 = v63;
  v102 = &v103;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v60, v64, (uint64_t)v100, v65);
  v69 = self;
  if (*((unsigned char *)v104 + 24)) {
    goto LABEL_33;
  }
  if (*(unsigned char *)(*((void *)&v110 + 1) + 24))
  {
    if (self->_cachedSendProgress <= 0.0 || objc_msgSend_count(v60, v66, v67, v68))
    {
LABEL_33:
      self->_cachedSendProgress = 0.0;
      goto LABEL_34;
    }
    self->_cachedSendProgress = 1.0;
  }
LABEL_34:
  if (IMOSLoggingEnabled())
  {
    v72 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v74 = objc_loadWeakRetained(&self->_context);
      v78 = objc_msgSend_allKeys(self->_sendingItems, v75, v76, v77);
      v82 = objc_msgSend_allKeys(v60, v79, v80, v81);
      int v83 = *(unsigned __int8 *)(*((void *)&v110 + 1) + 24);
      int v84 = *((unsigned __int8 *)v104 + 24);
      int hasSendingMessages = objc_msgSend__hasSendingMessages(v96, v85, v86, v87);
      *(_DWORD *)buf = 134220034;
      v115 = v96;
      __int16 v116 = 2048;
      id v117 = WeakRetained;
      __int16 v118 = 2048;
      id v119 = v74;
      __int16 v120 = 2112;
      v121 = v78;
      __int16 v122 = 2112;
      v123 = v82;
      __int16 v124 = 1024;
      int v125 = v83;
      __int16 v126 = 1024;
      int v127 = v84;
      __int16 v128 = 1024;
      BOOL v129 = v95;
      __int16 v130 = 1024;
      int v131 = hasSendingMessages;
      _os_log_impl(&dword_1A4AF7000, v72, OS_LOG_TYPE_INFO, "IMSendProgress: %p (delegate: %p, context: %p) is updating sending items from %@ to %@. (removed? %d, inserted? %d, forced? %d, hasSendingMessages? %d)", buf, 0x4Cu);
    }
    v69 = v96;
  }
  objc_msgSend_setSendingItems_(v69, v70, (uint64_t)v60, v71);
  objc_msgSend__scheduleSendProgressTimerIfNeeded(v69, v89, v90, v91);
  if (*(unsigned char *)(*((void *)&v110 + 1) + 24)
    || *((unsigned char *)v104 + 24)
    || (objc_msgSend__hasSendingMessages(v69, v92, v93, v94) | v95) == 1)
  {
    objc_msgSend__updateSendProgress(v69, v92, v93, v94);
  }

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v110, 8);
}

- (void)invalidate
{
  objc_msgSend_invalidate(self->_sendProgressTimer, a2, v2, v3);
  sendProgressTimer = self->_sendProgressTimer;
  self->_sendProgressTimer = 0;
}

- (BOOL)_hasSendingMessages
{
  return objc_msgSend_count(self->_sendingItems, a2, v2, v3) != 0;
}

- (void)_resetSendProgress
{
  self->_cachedSendProgress = 0.0;
  self->_wasShowing = 0;
  objc_msgSend_setSendingItems_(self, a2, 0, v2);
}

- (void)_updateSendProgress
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  unint64_t v52 = 0;
  unint64_t v53 = 0;
  id v5 = objc_msgSend_timeDataSource(self, a2, v2, v3);
  objc_msgSend_timeIntervalSinceReferenceDate(v5, v6, v7, v8);
  double v10 = v9;

  double v51 = v10;
  id v14 = objc_msgSend_sharedInstance(IMChorosMonitor, v11, v12, v13);
  int isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v14, v15, v16, v17);

  if (isSatelliteConnectionActive)
  {
    objc_msgSend__getEstimatedSendTimeOverStewieInSeconds(self, v19, v20, v21);
    float v26 = IMSendProgressProgressForSatellite(self->_sendingItems, &v53, &v52, &v51, v22);
  }
  else
  {
    sendingItems = self->_sendingItems;
    v28 = objc_msgSend_timeDataSource(self, v19, v20, v21);
    v29 = sendingItems;
    id v30 = v28;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = &v70;
    uint64_t v72 = 0x2020000000;
    uint64_t v73 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    uint64_t v65 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = (float *)&v58;
    uint64_t v60 = 0x2020000000;
    int v61 = 0;
    uint64_t v54 = 0;
    v55 = (double *)&v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1A4C672A0;
    v79 = &unk_1E5B7F220;
    *(void *)&v80[8] = &v54;
    *(void *)&v80[16] = &v74;
    uint64_t v81 = &v70;
    v82 = &v66;
    id v31 = v30;
    *(void *)uint64_t v80 = v31;
    int v83 = &v58;
    int v84 = &v62;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v29, v32, (uint64_t)buf, v33);
    unint64_t v34 = v71[3] + v75[3];
    unint64_t v35 = v63[3] + v67[3];
    unint64_t v36 = v35 + v34;
    if (v35)
    {
      float v26 = (float)((float)(v59[6] / (float)v35) + (float)v34) / (float)v36;
    }
    else
    {
      if (v36) {
        float v26 = 1.0;
      }
      else {
        float v26 = 0.0;
      }
      unint64_t v36 = 0;
    }
    if (v36 >= v34 + 1) {
      unint64_t v37 = v34 + 1;
    }
    else {
      unint64_t v37 = v36;
    }
    unint64_t v52 = v36;
    unint64_t v53 = v37;
    if (v55[3] > 0.0) {
      double v51 = v55[3];
    }

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);
  }
  char started = objc_msgSend_startSendProgressImmediately(self, v23, v24, v25);
  if (v10 - v51 > 5.0) {
    char v39 = 1;
  }
  else {
    char v39 = started;
  }
  float cachedSendProgress = self->_cachedSendProgress;
  if (v26 > cachedSendProgress) {
    float cachedSendProgress = v26;
  }
  self->_float cachedSendProgress = cachedSendProgress;
  if ((v39 & 1) == 0)
  {
    if (cachedSendProgress != 1.0) {
      return;
    }
    if (!self->_wasShowing) {
      goto LABEL_31;
    }
  }
  BOOL v41 = cachedSendProgress == 1.0;
  self->_wasShowing = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&double v43 = self->_cachedSendProgress;
  objc_msgSend_sendProgress_progressDidChange_sendingMessages_sendCount_totalCount_finished_(WeakRetained, v44, (uint64_t)self, (uint64_t)self->_sendingItems, v53, v52, v41, v43);

  if (v41)
  {
LABEL_31:
    if (IMOSLoggingEnabled())
    {
      uint64_t v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        id v49 = objc_loadWeakRetained((id *)&self->_delegate);
        id v50 = objc_loadWeakRetained(&self->_context);
        *(_DWORD *)buf = 134219008;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v49;
        *(_WORD *)&buf[22] = 2048;
        v79 = v50;
        *(_WORD *)uint64_t v80 = 2048;
        *(void *)&v80[2] = v53;
        *(_WORD *)&v80[10] = 2048;
        *(void *)&v80[12] = v52;
        _os_log_impl(&dword_1A4AF7000, v48, OS_LOG_TYPE_INFO, "IMSendProgress: %p (delegate: %p, context: %p) finished! (sendCount = %tu, totalCount = %tu)", buf, 0x34u);
      }
    }
    objc_msgSend__resetSendProgress(self, v45, v46, v47);
  }
}

- (void)_scheduleSendProgressTimerIfNeeded
{
  if (!self->_sendProgressTimer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      uint64_t v7 = WeakRetained;
      int hasSendingMessages = objc_msgSend__hasSendingMessages(self, v4, v5, v6);

      if (hasSendingMessages)
      {
        objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x1E4F1CB00], v9, (uint64_t)self, (uint64_t)sel__sendProgressTimerFired_, 0, 1, 0.0166666667);
        double v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        sendProgressTimer = self->_sendProgressTimer;
        self->_sendProgressTimer = v10;

        objc_msgSend_setTolerance_(self->_sendProgressTimer, v12, v13, v14, 0.0333333333);
        objc_msgSend_currentRunLoop(MEMORY[0x1E4F1CAC0], v15, v16, v17);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addTimer_forMode_(v19, v18, (uint64_t)self->_sendProgressTimer, *MEMORY[0x1E4F1C4B0]);
      }
    }
  }
}

- (void)_sendProgressTimerFired:(id)a3
{
  if (objc_msgSend__hasSendingMessages(self, a2, (uint64_t)a3, v3))
  {
    objc_msgSend__updateSendProgress(self, v5, v6, v7);
  }
  else
  {
    objc_msgSend_invalidate(self->_sendProgressTimer, v5, v6, v7);
    sendProgressTimer = self->_sendProgressTimer;
    self->_sendProgressTimer = 0;
  }
}

+ (Class)_timeDataSourceClass
{
  return (Class)objc_opt_class();
}

- (IMSendProgressDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMSendProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)context
{
  id WeakRetained = objc_loadWeakRetained(&self->_context);

  return WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)sendingItems
{
  return self->_sendingItems;
}

- (void)setSendingItems:(id)a3
{
}

- (BOOL)startSendProgressImmediately
{
  return self->_startSendProgressImmediately;
}

- (void)setStartSendProgressImmediately:(BOOL)a3
{
  self->_startSendProgressImmediately = a3;
}

- (IMSendProgressTimeDataSource)timeDataSource
{
  return self->_timeDataSource;
}

- (void)setTimeDataSource:(id)a3
{
}

- (NSTimer)sendProgressTimer
{
  return self->_sendProgressTimer;
}

- (void)setSendProgressTimer:(id)a3
{
}

- (float)cachedSendProgress
{
  return self->_cachedSendProgress;
}

- (void)setCachedSendProgress:(float)a3
{
  self->_float cachedSendProgress = a3;
}

- (BOOL)wasShowing
{
  return self->_wasShowing;
}

- (void)setWasShowing:(BOOL)a3
{
  self->_wasShowing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendProgressTimer, 0);
  objc_storeStrong((id *)&self->_timeDataSource, 0);
  objc_storeStrong((id *)&self->_sendingItems, 0);
  objc_destroyWeak(&self->_context);

  objc_destroyWeak((id *)&self->_delegate);
}

@end