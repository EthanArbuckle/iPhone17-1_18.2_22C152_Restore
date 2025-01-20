@interface AFArbitrationParticipationController
- (AFArbitrationParticipationController)init;
- (AFSettingsConnection)settingsConnection;
- (NSMutableArray)participationsPublished;
- (NSMutableDictionary)participationsForUserFeedback;
- (OS_dispatch_queue)queue;
- (void)_publishFeedbackArbitrationRecord;
- (void)_publishFeedbackArbitrationRecordForNearMiss;
- (void)_resetSettingsConnection;
- (void)_updateUserFeedbackParticipationAllAdvertisements:(id)a3 session:(id)a4 ownRecord:(id)a5 won:(BOOL)a6 triggerType:(id)a7 lastActivationTime:(double)a8 requestStartDate:(id)a9 voiceTriggerDate:(id)a10 scoreBoosters:(id)a11 deviceClass:(unsigned __int8)a12;
- (void)arbitrationDidUpdateWithContext:(id)a3 session:(id)a4 completion:(id)a5;
- (void)arbitrationEndedAdvertising:(id)a3;
- (void)arbitrationEndedTask:(id)a3;
- (void)arbitrationSessionWillStart:(id)a3;
- (void)dealloc;
- (void)requestWillPresentUsefulUserResult:(id)a3;
- (void)setParticipationsForUserFeedback:(id)a3;
- (void)setParticipationsPublished:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSettingsConnection:(id)a3;
@end

@implementation AFArbitrationParticipationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participationsPublished, 0);
  objc_storeStrong((id *)&self->_participationsForUserFeedback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

- (void)setParticipationsPublished:(id)a3
{
}

- (NSMutableArray)participationsPublished
{
  return self->_participationsPublished;
}

- (void)setParticipationsForUserFeedback:(id)a3
{
}

- (NSMutableDictionary)participationsForUserFeedback
{
  return self->_participationsForUserFeedback;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSettingsConnection:(id)a3
{
}

- (void)_resetSettingsConnection
{
  settingsConnection = self->_settingsConnection;
  if (settingsConnection)
  {
    self->_settingsConnection = 0;
  }
}

- (void)_updateUserFeedbackParticipationAllAdvertisements:(id)a3 session:(id)a4 ownRecord:(id)a5 won:(BOOL)a6 triggerType:(id)a7 lastActivationTime:(double)a8 requestStartDate:(id)a9 voiceTriggerDate:(id)a10 scoreBoosters:(id)a11 deviceClass:(unsigned __int8)a12
{
  BOOL v91 = a6;
  v118[1] = *MEMORY[0x1E4F143B8];
  id v96 = a3;
  id v18 = a4;
  id v19 = a5;
  id v95 = a7;
  id v97 = a9;
  id v98 = a10;
  id v20 = a11;
  v94 = v18;
  v21 = [v18 sessionId];
  v99 = [v21 UUIDString];

  v22 = v99;
  if ([v99 length])
  {
    v23 = [(NSMutableDictionary *)self->_participationsForUserFeedback objectForKeyedSubscript:v99];
    if (!v23)
    {
      v52 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AFArbitrationParticipationController _updateUserFeedbackParticipationAllAdvertisements:se"
                             "ssion:ownRecord:won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreB"
                             "oosters:deviceClass:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v99;
        _os_log_debug_impl(&dword_19CF1D000, v52, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback unable to find SCDAFParticipation with myriad sessionId: %@", buf, 0x16u);
        v52 = AFSiriLogContextConnection;
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        participationsForUserFeedback = self->_participationsForUserFeedback;
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AFArbitrationParticipationController _updateUserFeedbackParticipationAllAdvertisements:se"
                             "ssion:ownRecord:won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreB"
                             "oosters:deviceClass:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = participationsForUserFeedback;
        _os_log_debug_impl(&dword_19CF1D000, v52, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback unable to find SCDAFParticipation in: %@", buf, 0x16u);
      }
      goto LABEL_63;
    }
    objc_msgSend(v23, "setRawGoodnessScore:", (double)objc_msgSend(v19, "rawAudioGoodnessScore"));
    [v23 setRequestStartDate:v97];
    if (v98) {
      objc_msgSend(v23, "setVoiceTriggerDate:");
    }
    [v23 setCdaId:v99];
    if (objc_opt_respondsToSelector()) {
      [v23 performSelector:sel_setTriggerType_ withObject:v95];
    }
    v24 = [MEMORY[0x1E4F1C9C8] date];
    [v24 timeIntervalSinceDate:v98];
    double v26 = v25;

    if (v26 > 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v27 = [MEMORY[0x1E4F28ED0] numberWithDouble:v26 * 1000.0];
      [v23 performSelector:sel_setTimeSinceTriggerInMilliseconds_ withObject:v27];
    }
    double v28 = 0.0;
    if (a8 > 0.0)
    {
      v29 = [MEMORY[0x1E4F28F80] processInfo];
      [v29 systemUptime];
      double v31 = v30;

      double v28 = v31 - a8;
    }
    if (objc_opt_respondsToSelector())
    {
      v32 = [MEMORY[0x1E4F28ED0] numberWithDouble:v28 * 1000.0];
      [v23 performSelector:sel_setTimeSinceLastWinInMilliseconds_ withObject:v32];
    }
    if (v91) {
      uint64_t v33 = 3;
    }
    else {
      uint64_t v33 = 2;
    }
    [v23 setResult:v33];
    id v34 = objc_alloc_init(MEMORY[0x1E4F9FB00]);
    v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v19, "userConfidence"));
    objc_msgSend(v34, "setConfidence:", objc_msgSend(v35, "integerValue"));

    v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v19, "goodness"));
    objc_msgSend(v34, "setGoodnessScore:", objc_msgSend(v36, "integerValue"));

    v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", objc_msgSend(v19, "pHash"));
    [v34 setAdvertHash:v37];

    v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v19, "deviceClass"));
    objc_msgSend(v34, "setDeviceClass:", objc_msgSend(v38, "integerValue"));

    v39 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v19, "tieBreaker"));
    objc_msgSend(v34, "setTieBreaker:", objc_msgSend(v39, "integerValue"));

    v40 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v19, "productType"));
    objc_msgSend(v34, "setProductType:", objc_msgSend(v40, "integerValue"));

    v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v19, "deviceGroup"));
    objc_msgSend(v34, "setDeviceGroup:", objc_msgSend(v41, "integerValue"));

    if (objc_opt_respondsToSelector())
    {
      v42 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v19, "deviceGroup"));
      [v34 performSelector:sel_setDeviceGroupWithNumber_ withObject:v42];
    }
    [v23 setAdvertisement:v34];
    id v43 = objc_alloc_init(MEMORY[0x1E4F9FB10]);
    v44 = (void *)MGCopyAnswer();
    [v43 setBuild:v44];

    if (MGGetSInt32Answer())
    {
      v45 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X", MGGetSInt32Answer());
      [v43 setEnclosureColor:v45];
    }
    v93 = [MEMORY[0x1E4F1CA20] currentLocale];
    if (v93)
    {
      v46 = [v93 countryCode];
      if (v46)
      {
        v47 = NSString;
        v48 = [v93 languageCode];
        v49 = [v93 countryCode];
        v50 = [v47 stringWithFormat:@"%@_%@", v48, v49];
      }
      else
      {
        v50 = [v93 languageCode];
      }

      if ([v50 length]) {
        [v43 setLocale:v50];
      }
    }
    v54 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:a12];
    v118[0] = v54;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:1];
    [v43 setDeviceClass:v55];

    v90 = (void *)MGCopyAnswer();
    if (v90)
    {
      v117 = v90;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
      [v43 setProductTypes:v56];
    }
    v57 = (void *)MGCopyAnswer();
    [v43 setName:v57];

    [v23 setDevice:v43];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v114 = __Block_byref_object_copy__38473;
    v115 = __Block_byref_object_dispose__38474;
    if (v91) {
      v58 = v34;
    }
    else {
      v58 = 0;
    }
    id v116 = v58;
    v106[0] = 0;
    v106[1] = v106;
    v106[2] = 0x3032000000;
    v106[3] = __Block_byref_object_copy__38473;
    v106[4] = __Block_byref_object_dispose__38474;
    id v107 = 0;
    id v92 = v96;
    v59 = [MEMORY[0x1E4F1CA48] array];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __203__AFArbitrationParticipationController__updateUserFeedbackParticipationAllAdvertisements_session_ownRecord_won_triggerType_lastActivationTime_requestStartDate_voiceTriggerDate_scoreBoosters_deviceClass___block_invoke;
    v100[3] = &unk_1E592A948;
    id v101 = v19;
    id v88 = v34;
    id v102 = v88;
    id v89 = v59;
    id v103 = v89;
    v104 = buf;
    v105 = v106;
    [v92 enumerateObjectsUsingBlock:v100];
    if (*(void *)(*(void *)&buf[8] + 40)) {
      objc_msgSend(v23, "setWinnerAdvertisement:");
    }
    v60 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v109 = 136315394;
      v110 = "-[AFArbitrationParticipationController _updateUserFeedbackParticipationAllAdvertisements:session:ownRecord:"
             "won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreBoosters:deviceClass:]";
      __int16 v111 = 2112;
      id v112 = v20;
      _os_log_debug_impl(&dword_19CF1D000, v60, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback scoreBoosters from myriadInstrumentation: %@", v109, 0x16u);
      if (v20)
      {
LABEL_43:
        if ([v20 isTrump]
          && (uint64_t v61 = [v20 trumpReason] - 1, v61 < 8))
        {
          uint64_t v62 = v61 + 1;
        }
        else
        {
          uint64_t v62 = 0;
        }
        v63 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v62];
        v108 = v63;
        v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
        [v23 setTrumpReasons:v64];

        v65 = [MEMORY[0x1E4F1CA48] array];
        if ([v20 deviceBoost])
        {
          id v66 = objc_alloc_init(MEMORY[0x1E4F9FB08]);
          [v66 setKind:0];
          [v66 setType:0];
          v67 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v20, "deviceBoost"));
          [v67 floatValue];
          [v66 setBoostValue:v68];

          [v65 addObject:v66];
        }
        if ([v20 recentAlarmBoost])
        {
          id v69 = objc_alloc_init(MEMORY[0x1E4F9FB08]);
          [v69 setKind:6];
          [v69 setType:0];
          v70 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v20, "recentAlarmBoost"));
          [v70 floatValue];
          [v69 setBoostValue:v71];

          [v65 addObject:v69];
        }
        if ([v20 recentMotionBoost])
        {
          id v72 = objc_alloc_init(MEMORY[0x1E4F9FB08]);
          [v72 setKind:4];
          [v72 setType:0];
          v73 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v20, "recentMotionBoost"));
          [v73 floatValue];
          [v72 setBoostValue:v74];

          [v65 addObject:v72];
        }
        if ([v20 recentUnlockBoost])
        {
          id v75 = objc_alloc_init(MEMORY[0x1E4F9FB08]);
          [v75 setKind:1];
          [v75 setType:0];
          v76 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v20, "recentUnlockBoost"));
          [v76 floatValue];
          [v75 setBoostValue:v77];

          [v65 addObject:v75];
        }
        if ([v20 recentPlaybackBoost])
        {
          id v78 = objc_alloc_init(MEMORY[0x1E4F9FB08]);
          [v78 setKind:5];
          [v78 setType:0];
          v79 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v20, "recentPlaybackBoost"));
          [v79 floatValue];
          [v78 setBoostValue:v80];

          [v65 addObject:v78];
        }
        if ([v20 recentSiriRequestBoost])
        {
          id v81 = objc_alloc_init(MEMORY[0x1E4F9FB08]);
          [v81 setKind:3];
          [v81 setType:0];
          v82 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v20, "recentSiriRequestBoost"));
          [v82 floatValue];
          [v81 setBoostValue:v83];

          [v65 addObject:v81];
        }
        if ([v20 recentRaiseToWakeBoost])
        {
          id v84 = objc_alloc_init(MEMORY[0x1E4F9FB08]);
          [v84 setKind:2];
          [v84 setType:0];
          v85 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(v20, "recentRaiseToWakeBoost"));
          [v85 floatValue];
          [v84 setBoostValue:v86];

          [v65 addObject:v84];
        }
        v87 = [MEMORY[0x1E4F1C978] arrayWithArray:v65];
        [v23 setBoosts:v87];
      }
    }
    else if (v20)
    {
      goto LABEL_43;
    }
    [v23 setSeenAdvertisements:v89];

    _Block_object_dispose(v106, 8);
    _Block_object_dispose(buf, 8);

LABEL_63:
    v22 = v99;
    goto LABEL_64;
  }
  v51 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[AFArbitrationParticipationController _updateUserFeedbackParticipationAllAdvertisements:sessio"
                         "n:ownRecord:won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreBoosters:deviceClass:]";
    _os_log_debug_impl(&dword_19CF1D000, v51, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback myriad sessionid is nil. Returning", buf, 0xCu);
  }
LABEL_64:
}

void __203__AFArbitrationParticipationController__updateUserFeedbackParticipationAllAdvertisements_session_ownRecord_won_triggerType_lastActivationTime_requestStartDate_voiceTriggerDate_scoreBoosters_deviceClass___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  id v6 = objc_alloc_init(MEMORY[0x1E4F9FB00]);
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v18, "userConfidence"));
  objc_msgSend(v6, "setConfidence:", objc_msgSend(v7, "integerValue"));

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v18, "goodness"));
  objc_msgSend(v6, "setGoodnessScore:", objc_msgSend(v8, "integerValue"));

  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedShort:", objc_msgSend(v18, "pHash"));
  [v6 setAdvertHash:v9];

  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v18, "deviceClass"));
  objc_msgSend(v6, "setDeviceClass:", objc_msgSend(v10, "integerValue"));

  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v18, "tieBreaker"));
  objc_msgSend(v6, "setTieBreaker:", objc_msgSend(v11, "integerValue"));

  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v18, "productType"));
  objc_msgSend(v6, "setProductType:", objc_msgSend(v12, "integerValue"));

  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(v18, "deviceGroup"));
  objc_msgSend(v6, "setDeviceGroup:", objc_msgSend(v13, "integerValue"));

  if (objc_opt_respondsToSelector())
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", objc_msgSend(*(id *)(a1 + 32), "deviceGroup"));
    [*(id *)(a1 + 40) performSelector:sel_setDeviceGroupWithNumber_ withObject:v14];
  }
  [*(id *)(a1 + 48) addObject:v6];
  if (!a3)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v17 = *(void *)(v15 + 40);
    v16 = (id *)(v15 + 40);
    if (!v17)
    {
      objc_storeStrong(v16, v6);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    }
  }
}

- (void)_publishFeedbackArbitrationRecord
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_participationsForUserFeedback allValues];
  if (!self->_participationsPublished)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    participationsPublished = self->_participationsPublished;
    self->_participationsPublished = v4;
  }
  id v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v7 = v6;
    *(_DWORD *)buf = 136315394;
    v10 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecord]";
    __int16 v11 = 2048;
    uint64_t v12 = [v3 count];
    _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback action: publishing %lu pariticipations", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__AFArbitrationParticipationController__publishFeedbackArbitrationRecord__block_invoke;
  v8[3] = &unk_1E592A920;
  v8[4] = self;
  [v3 enumerateObjectsUsingBlock:v8];
}

void __73__AFArbitrationParticipationController__publishFeedbackArbitrationRecord__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 result] || (objc_msgSend(v3, "rawGoodnessScore"), v9 != 0.0))
  {
    v4 = [v3 requestStartDate];

    if (v4)
    {
      v5 = *(void **)(*(void *)(a1 + 32) + 32);
      id v6 = [v3 requestStartDate];
      LODWORD(v5) = [v5 containsObject:v6];

      if (!v5)
      {
        v10 = [*(id *)(a1 + 32) settingsConnection];
        [v10 publishFeedbackArbitrationParticipation:v3];

        __int16 v11 = *(void **)(*(void *)(a1 + 32) + 32);
        uint64_t v12 = [v3 requestStartDate];
        [v11 addObject:v12];

        goto LABEL_13;
      }
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 136315138;
        v14 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecord]_block_invoke";
        v8 = "%s #myriad #feedback participation already published throwing out.";
LABEL_11:
        _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 136315138;
        v14 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecord]_block_invoke";
        v8 = "%s #myriad #feedback participation without request start date, throwing out";
        goto LABEL_11;
      }
    }
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      v14 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecord]_block_invoke";
      v8 = "%s #myriad #feedback removing participation with nil result";
      goto LABEL_11;
    }
  }
LABEL_13:
}

- (void)_publishFeedbackArbitrationRecordForNearMiss
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = (void *)MGCopyAnswer();
  [v4 setBuild:v5];

  if (MGGetSInt32Answer())
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X", MGGetSInt32Answer());
    [v4 setEnclosureColor:v6];
  }
  v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  v8 = v7;
  if (v7)
  {
    double v9 = [v7 countryCode];
    if (v9)
    {
      v10 = NSString;
      __int16 v11 = [v8 languageCode];
      uint64_t v12 = [v8 countryCode];
      int v13 = [v10 stringWithFormat:@"%@_%@", v11, v12];
    }
    else
    {
      int v13 = [v8 languageCode];
    }

    if ([v13 length]) {
      [v4 setLocale:v13];
    }
  }
  uint64_t v14 = MGCopyAnswer();
  uint64_t v15 = (void *)v14;
  if (v14)
  {
    v23[0] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v4 setProductTypes:v16];
  }
  uint64_t v17 = (void *)MGCopyAnswer();
  [v4 setName:v17];

  [v3 setDevice:v4];
  [v3 setResult:1];
  id v18 = [MEMORY[0x1E4F1C9C8] now];
  [v3 setRequestStartDate:v18];
  [v3 setVoiceTriggerDate:v18];
  id v19 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecordForNearMiss]";
    _os_log_debug_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback", buf, 0xCu);
  }
  id v20 = [(AFArbitrationParticipationController *)self settingsConnection];
  [v20 publishFeedbackArbitrationParticipation:v3];
}

- (void)requestWillPresentUsefulUserResult:(id)a3
{
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__AFArbitrationParticipationController_requestWillPresentUsefulUserResult___block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __75__AFArbitrationParticipationController_requestWillPresentUsefulUserResult___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[AFArbitrationParticipationController requestWillPresentUsefulUserResult:]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: requestWillPresentUsefulUserResult", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _publishFeedbackArbitrationRecord];
}

- (void)arbitrationEndedTask:(id)a3
{
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__AFArbitrationParticipationController_arbitrationEndedTask___block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __61__AFArbitrationParticipationController_arbitrationEndedTask___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[AFArbitrationParticipationController arbitrationEndedTask:]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: arbitrationEndedTask", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _publishFeedbackArbitrationRecord];
}

- (void)arbitrationEndedAdvertising:(id)a3
{
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__AFArbitrationParticipationController_arbitrationEndedAdvertising___block_invoke;
    block[3] = &unk_1E592C678;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __68__AFArbitrationParticipationController_arbitrationEndedAdvertising___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[AFArbitrationParticipationController arbitrationEndedAdvertising:]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: arbitrationEndedAdvertising", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _resetSettingsConnection];
}

- (void)arbitrationDidUpdateWithContext:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__AFArbitrationParticipationController_arbitrationDidUpdateWithContext_session_completion___block_invoke;
    v12[3] = &unk_1E592A8F8;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(queue, v12);
  }
}

uint64_t __91__AFArbitrationParticipationController_arbitrationDidUpdateWithContext_session_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[AFArbitrationParticipationController arbitrationDidUpdateWithContext:session:completion:]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: arbitrationDidUpdateWithContext", buf, 0xCu);
  }
  id v3 = *(void **)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) advertisements];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 40) ownAdvertisement];
  uint64_t v7 = [*(id *)(a1 + 40) decisionIsWon];
  id v8 = [*(id *)(a1 + 40) triggerType];
  [*(id *)(a1 + 40) lastActivationTime];
  double v10 = v9;
  __int16 v11 = [*(id *)(a1 + 40) requestStartDate];
  uint64_t v12 = [*(id *)(a1 + 40) voiceTriggerDate];
  id v13 = [*(id *)(a1 + 40) scoreBoosters];
  LOBYTE(v15) = [*(id *)(a1 + 40) deviceClass];
  [v3 _updateUserFeedbackParticipationAllAdvertisements:v4 session:v5 ownRecord:v6 won:v7 triggerType:v8 lastActivationTime:v11 requestStartDate:v10 voiceTriggerDate:v12 scoreBoosters:v13 deviceClass:v15];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)arbitrationSessionWillStart:(id)a3
{
  id v4 = a3;
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__AFArbitrationParticipationController_arbitrationSessionWillStart___block_invoke;
    v6[3] = &unk_1E592C710;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

void __68__AFArbitrationParticipationController_arbitrationSessionWillStart___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    double v10 = "-[AFArbitrationParticipationController arbitrationSessionWillStart:]_block_invoke";
    _os_log_debug_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: arbitrationSessionWillStart", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  id v3 = [*(id *)(a1 + 40) sessionId];
  id v4 = [v3 UUIDString];

  if ([v4 length])
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v6 = objc_opt_new();
    [v5 setValue:v6 forKey:v4];

    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      double v10 = "-[AFArbitrationParticipationController arbitrationSessionWillStart:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s #myriad #feedback Created participation for %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      double v10 = "-[AFArbitrationParticipationController arbitrationSessionWillStart:]_block_invoke";
      _os_log_debug_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback myriad sessionid is nil. Returning", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (AFSettingsConnection)settingsConnection
{
  settingsConnection = self->_settingsConnection;
  if (!settingsConnection)
  {
    id v4 = objc_alloc_init(AFSettingsConnection);
    uint64_t v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    [(AFSettingsConnection *)self->_settingsConnection setXPCConnectionManagementQueue:self->_queue];
    settingsConnection = self->_settingsConnection;
  }
  return settingsConnection;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.voicetrigger.NearTrigger", 0);
  v4.receiver = self;
  v4.super_class = (Class)AFArbitrationParticipationController;
  [(AFArbitrationParticipationController *)&v4 dealloc];
}

- (AFArbitrationParticipationController)init
{
  v13.receiver = self;
  v13.super_class = (Class)AFArbitrationParticipationController;
  v2 = [(AFArbitrationParticipationController *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    participationsForUserFeedback = v2->_participationsForUserFeedback;
    v2->_participationsForUserFeedback = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    participationsPublished = v2->_participationsPublished;
    v2->_participationsPublished = (NSMutableArray *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v9 = dispatch_queue_create("AFArbitrationParticipationQueue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)notificationNearMissCallback, @"com.apple.voicetrigger.NearTrigger", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

@end