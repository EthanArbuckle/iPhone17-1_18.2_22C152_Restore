@interface IMAVEmbeddedInterface
+ (void)updateCriticalState;
- (int64_t)_checkNetworkForChat:(id)a3 requiresWifi:(BOOL)a4;
- (int64_t)_runPingTestForChat:(id)a3;
- (void)_conferenceEnded:(id)a3;
- (void)_conferenceWillStart:(id)a3;
- (void)chatStateUpdated;
@end

@implementation IMAVEmbeddedInterface

- (void)_conferenceWillStart:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IMAVEmbeddedInterface;
  [(IMAVInterface *)&v28 _conferenceWillStart:v4];
  v9 = (void *)qword_2680BEF50;
  if (!qword_2680BEF50)
  {
    v9 = (void *)MEMORY[0x22A628610](@"AVSystemController", @"Celestial");
    qword_2680BEF50 = (uint64_t)v9;
  }
  if (!qword_2680BEF58)
  {
    v10 = (void **)MEMORY[0x22A628620]("AVSystemController_UplinkMuteAttribute", @"Celestial");
    if (v10) {
      v11 = *v10;
    }
    else {
      v11 = 0;
    }
    objc_storeStrong((id *)&qword_2680BEF58, v11);
    v9 = (void *)qword_2680BEF50;
  }
  v12 = objc_msgSend_sharedAVSystemController(v9, v5, v6, v7, v8);
  v16 = objc_msgSend_attributeForKey_(v12, v13, qword_2680BEF58, v14, v15);

  if (objc_msgSend_BOOLValue(v16, v17, v18, v19, v20))
  {
    v24 = objc_msgSend__existingConferenceForAVChat_(self, v21, (uint64_t)v4, v22, v23);
    objc_msgSend_setMicrophoneMuted_(v24, v25, 1, v26, v27);
  }
}

- (void)_conferenceEnded:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "_conferenceEnded: %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)IMAVEmbeddedInterface;
  [(IMAVConferenceInterface *)&v6 _conferenceEnded:v4];
}

- (void)chatStateUpdated
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  objc_super v6 = objc_msgSend__nonFinalChat(IMAVChat, a2, v2, v3, v4);
  uint64_t v7 = sub_224FB12A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl(&dword_224F93000, v7, OS_LOG_TYPE_DEFAULT, "Found non final chat: %@", buf, 0xCu);
  }

  if (!qword_2680BEF60) {
    qword_2680BEF60 = MEMORY[0x22A628610](@"UIApplication", @"UIKit");
  }
  id v8 = sub_224FB12A0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Disabling system idle timer", buf, 2u);
    }

    uint64_t v14 = objc_msgSend_sharedApplication((void *)qword_2680BEF60, v10, v11, v12, v13);
    objc_msgSend_setIdleTimerDisabled_(v14, v15, 1, v16, v17);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224F93000, v8, OS_LOG_TYPE_DEFAULT, "Enabling system idle timer", buf, 2u);
    }

    uint64_t v14 = objc_msgSend_sharedApplication((void *)qword_2680BEF60, v18, v19, v20, v21);
    objc_msgSend_setIdleTimerDisabled_(v14, v22, 0, v23, v24);
  }

  sub_224FA9330(v6 != 0);
  v30.receiver = self;
  v30.super_class = (Class)IMAVEmbeddedInterface;
  [(IMAVConferenceInterface *)&v30 chatStateUpdated];
  v25 = objc_opt_class();
  objc_msgSend_updateCriticalState(v25, v26, v27, v28, v29);
}

+ (void)updateCriticalState
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_sharedInstance(IMAVController, a2, v2, v3, v4);
  if (objc_msgSend__shouldRunConferences(v5, v6, v7, v8, v9))
  {
  }
  else
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMAVController, v10, v11, v12, v13);
    int shouldRunACConferences = objc_msgSend__shouldRunACConferences(v18, v19, v20, v21, v22);

    if (!shouldRunACConferences) {
      return;
    }
  }
  uint64_t v24 = objc_msgSend__connectingChats(IMAVChat, v14, v15, v16, v17);
  if (objc_msgSend_count(v24, v25, v26, v27, v28))
  {
    BOOL v33 = 1;
  }
  else
  {
    v34 = objc_msgSend__connectedChats(IMAVChat, v29, v30, v31, v32);
    if (objc_msgSend_count(v34, v35, v36, v37, v38))
    {
      BOOL v33 = 1;
    }
    else
    {
      v43 = objc_msgSend__incomingInvitations(IMAVChat, v39, v40, v41, v42);
      if (objc_msgSend_count(v43, v44, v45, v46, v47))
      {
        BOOL v33 = 1;
      }
      else
      {
        v52 = objc_msgSend__outgoingInvitations(IMAVChat, v48, v49, v50, v51);
        BOOL v33 = objc_msgSend_count(v52, v53, v54, v55, v56) != 0;
      }
    }
  }
  v57 = sub_224FB12A0();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = @"NO";
    if (v33) {
      v58 = @"YES";
    }
    int v67 = 138412290;
    v68 = v58;
    _os_log_impl(&dword_224F93000, v57, OS_LOG_TYPE_DEFAULT, "Any chats need critical state: %@", (uint8_t *)&v67, 0xCu);
  }

  v63 = objc_msgSend_sharedInstance(MEMORY[0x263F3BB40], v59, v60, v61, v62);
  objc_msgSend_setEnableCriticalReliability_(v63, v64, v33, v65, v66);
}

- (int64_t)_checkNetworkForChat:(id)a3 requiresWifi:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = sub_224FB12A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = @"NO";
    if (v4) {
      objc_super v6 = @"YES";
    }
    int v14 = 138412290;
    uint64_t v15 = v6;
    _os_log_impl(&dword_224F93000, v5, OS_LOG_TYPE_DEFAULT, "Running network check on AVConference, requiresWifi: %@", (uint8_t *)&v14, 0xCu);
  }

  if (!qword_2680BEF68) {
    qword_2680BEF68 = MEMORY[0x22A628610](@"AVConference", @"AVConference");
  }
  if (objc_opt_respondsToSelector())
  {
    unsigned int v10 = objc_msgSend_doBlockingConnectionCheck_((void *)qword_2680BEF68, v7, v4, v8, v9);
    if (v10 >= 4) {
      int64_t v11 = -1;
    }
    else {
      int64_t v11 = v10;
    }
    uint64_t v12 = sub_224FB12A0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      LODWORD(v15) = v11;
      _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, " => returning result: %d", (uint8_t *)&v14, 8u);
    }
  }
  else
  {
    uint64_t v12 = sub_224FB12A0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_224F93000, v12, OS_LOG_TYPE_DEFAULT, " => Network check not implemented", (uint8_t *)&v14, 2u);
    }
    int64_t v11 = -1;
  }

  return v11;
}

- (int64_t)_runPingTestForChat:(id)a3
{
  *(void *)&v107[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend__localNetworkConnectionType(v3, v4, v5, v6, v7) == 2)
  {
    uint64_t v12 = objc_msgSend_sharedInstance(MEMORY[0x263F4A638], v8, v9, v10, v11);
    uint64_t v17 = objc_msgSend_myGatewayAddress(v12, v13, v14, v15, v16);

    if (objc_msgSend_length(v17, v18, v19, v20, v21))
    {
      uint64_t v22 = sub_224FB12A0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v107[0] = 2;
        LOWORD(v107[1]) = 2112;
        *(void *)((char *)&v107[1] + 2) = v17;
        _os_log_impl(&dword_224F93000, v22, OS_LOG_TYPE_DEFAULT, "Running ping test: connection type %d - gateway IP %@", buf, 0x12u);
      }

      uint64_t v23 = (void *)MEMORY[0x22A628890]();
      IMPerformPingTest();
      id v24 = 0;
      int v29 = objc_msgSend_packetsSuccessfullySent(v24, v25, v26, v27, v28);
      uint64_t v30 = 4 * (v29 < 1);
      objc_msgSend__setPingTestResult_(v3, v31, v30, v32, v33);
      v34 = sub_224FB12A0();
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      if (v29 < 1)
      {
        if (v35)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v107 = @"Failed to run";
          _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, "Ping test ended with error: %@", buf, 0xCu);
        }
      }
      else
      {
        if (v35)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v107 = v24;
          _os_log_impl(&dword_224F93000, v34, OS_LOG_TYPE_DEFAULT, "Ping results: %@", buf, 0xCu);
        }

        uint64_t v36 = NSNumber;
        objc_msgSend_minRoundtripTime(v24, v37, v38, v39, v40);
        float v45 = 0.0;
        BOOL v47 = v46 <= 0.0;
        double v48 = 0.0;
        if (!v47)
        {
          objc_msgSend_minRoundtripTime(v24, v41, v42, v43, v44, 0.0);
          *(float *)&double v48 = v48;
        }
        v34 = objc_msgSend_numberWithFloat_(v36, v41, v42, v43, v44, v48);
        uint64_t v49 = NSNumber;
        objc_msgSend_maxRoundtripTime(v24, v50, v51, v52, v53);
        if (v58 > 0.0)
        {
          objc_msgSend_maxRoundtripTime(v24, v54, v55, v56, v57);
          float v45 = v58;
        }
        *(float *)&double v58 = v45;
        v59 = objc_msgSend_numberWithFloat_(v49, v54, v55, v56, v57, v58);
        uint64_t v60 = NSNumber;
        objc_msgSend_averageRoundtripTime(v24, v61, v62, v63, v64);
        float v69 = 0.0;
        BOOL v47 = v70 <= 0.0;
        double v71 = 0.0;
        if (!v47)
        {
          objc_msgSend_averageRoundtripTime(v24, v65, v66, v67, v68, 0.0);
          *(float *)&double v71 = v71;
        }
        v72 = objc_msgSend_numberWithFloat_(v60, v65, v66, v67, v68, v71);
        v73 = NSNumber;
        objc_msgSend_standardDeviationRoundtripTime(v24, v74, v75, v76, v77);
        if (v82 > 0.0)
        {
          objc_msgSend_standardDeviationRoundtripTime(v24, v78, v79, v80, v81);
          float v69 = v82;
        }
        *(float *)&double v82 = v69;
        v83 = objc_msgSend_numberWithFloat_(v73, v78, v79, v80, v81, v82);
        v84 = NSNumber;
        objc_msgSend_packetLossRate(v24, v85, v86, v87, v88);
        double v94 = v93;
        double v95 = 0.0;
        if (v94 > 0.0)
        {
          objc_msgSend_packetLossRate(v24, v89, v90, v91, v92, 0.0);
          *(float *)&double v95 = v95;
        }
        v96 = objc_msgSend_numberWithFloat_(v84, v89, v90, v91, v92, v95);
        id v97 = objc_alloc(NSDictionary);
        v101 = objc_msgSend_initWithObjectsAndKeys_(v97, v98, (uint64_t)v34, v99, v100, @"AVPingTestMin", v59, @"AVPingTestMax", v72, @"AVPingTestAvg", v83, @"AVPingTestStdDeviation", v96, @"AVPingTestPacketLoss", 0);
        objc_msgSend__setPingTestResults_(v3, v102, (uint64_t)v101, v103, v104);
      }
    }
    else
    {
      uint64_t v30 = 4;
    }
  }
  else
  {
    uint64_t v30 = -1;
  }

  return v30;
}

@end