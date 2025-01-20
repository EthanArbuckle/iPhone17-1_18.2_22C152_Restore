@interface IRSessionAnalytics
- (BOOL)_isSessionOngoing;
- (IRCandidateDO)bannerCandidate;
- (IRCandidateDO)chosenCandidate;
- (IREventDO)bannerEvent;
- (IREventDO)playbackStartEvent;
- (IRMiloLslPredictionDO)bannerMiLoPrediction;
- (IRServiceDO)service;
- (IRSessionAnalytics)initWithQueue:(id)a3 service:(id)a4;
- (IRTimer)timer;
- (OS_dispatch_queue)queue;
- (void)_handleBannerEvent:(id)a3 withCandidate:(id)a4 WithMiLoPrediction:(id)a5 systemState:(id)a6;
- (void)_handleNonBannerEvent:(id)a3 forCandidate:(id)a4 forceStopSession:(BOOL)a5;
- (void)_handleSessionTimeout;
- (void)_invalidate;
- (void)_stopSessionAndSendCA:(unint64_t)a3;
- (void)contextChangedWithReason:(id)a3 systemState:(id)a4;
- (void)event:(id)a3 forCandidate:(id)a4 miloPrediction:(id)a5 systemState:(id)a6;
- (void)setBannerCandidate:(id)a3;
- (void)setBannerEvent:(id)a3;
- (void)setBannerMiLoPrediction:(id)a3;
- (void)setChosenCandidate:(id)a3;
- (void)setPlaybackStartEvent:(id)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation IRSessionAnalytics

- (void)contextChangedWithReason:(id)a3 systemState:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(IRSessionAnalytics *)self queue];
  dispatch_assert_queue_V2(v7);

  if ((([v8 isEqual:@"Output device"] & 1) != 0
     || [v8 isEqual:@"Predicted output device"])
    && [(IRSessionAnalytics *)self _isSessionOngoing]
    && [v6 isHeadphonesRoutedOrPredicted])
  {
    [(IRSessionAnalytics *)self _stopSessionAndSendCA:3];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IRSessionAnalytics)initWithQueue:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRSessionAnalytics;
  id v8 = [(IRSessionAnalytics *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(IRSessionAnalytics *)v8 setQueue:v6];
    [(IRSessionAnalytics *)v9 setService:v7];
  }

  return v9;
}

- (void)event:(id)a3 forCandidate:(id)a4 miloPrediction:(id)a5 systemState:(id)a6
{
  id v14 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [(IRSessionAnalytics *)self queue];
  dispatch_assert_queue_V2(v13);

  if ([v12 isBannerEvent]) {
    [(IRSessionAnalytics *)self _handleBannerEvent:v12 withCandidate:v11 WithMiLoPrediction:v14 systemState:v10];
  }
  else {
    [(IRSessionAnalytics *)self _handleNonBannerEvent:v12 forCandidate:v11 forceStopSession:0];
  }
}

- (void)_handleBannerEvent:(id)a3 withCandidate:(id)a4 WithMiLoPrediction:(id)a5 systemState:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v10 = a4;
  id v28 = a5;
  id v11 = a6;
  if ([(IRSessionAnalytics *)self _isSessionOngoing]) {
    [(IRSessionAnalytics *)self _stopSessionAndSendCA:6];
  }
  id v12 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v13 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    [v29 eventType];
    v15 = IRMediaEventTypeToString();
    v16 = [v10 candidateIdentifier];
    v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v28, "canUse"));
    v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isHeadphonesRoutedOrPredicted"));
    *(_DWORD *)buf = 136316418;
    v33 = "#session-analytics, ";
    __int16 v34 = 2112;
    v35 = v12;
    __int16 v36 = 2112;
    v37 = v15;
    __int16 v38 = 2112;
    v39 = v16;
    __int16 v40 = 2112;
    v41 = v17;
    __int16 v42 = 2112;
    v43 = v18;
    _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_INFO, "%s[%@], Starting with eventType: %@, candidateIdentifier: %@, miloCanUse: %@, isHeadphonesRoutedOrPredicted: %@", buf, 0x3Eu);
  }
  [(IRSessionAnalytics *)self setBannerEvent:v29];
  [(IRSessionAnalytics *)self setBannerCandidate:v10];
  [(IRSessionAnalytics *)self setBannerMiLoPrediction:v28];
  if ([v11 isHeadphonesRoutedOrPredicted]
    || !v10
    || ([v10 candidateIdentifier],
        v19 = objc_claimAutoreleasedReturnValue(),
        BOOL v20 = v19 == 0,
        v19,
        v20))
  {
    [(IRSessionAnalytics *)self _stopSessionAndSendCA:7];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v21 = [IRTimer alloc];
    v22 = +[IRPreferences shared];
    v23 = [v22 coreAnalyticsSessionPeriodInSeconds];
    [v23 doubleValue];
    double v25 = v24;
    v26 = [(IRSessionAnalytics *)self queue];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __86__IRSessionAnalytics__handleBannerEvent_withCandidate_WithMiLoPrediction_systemState___block_invoke;
    v30[3] = &unk_26539FA70;
    objc_copyWeak(&v31, (id *)buf);
    v27 = [(IRTimer *)v21 initWithInterval:0 repeats:v26 queue:v30 block:v25];
    [(IRSessionAnalytics *)self setTimer:v27];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
}

void __86__IRSessionAnalytics__handleBannerEvent_withCandidate_WithMiLoPrediction_systemState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleSessionTimeout];
    id WeakRetained = v2;
  }
}

- (void)_handleNonBannerEvent:(id)a3 forCandidate:(id)a4 forceStopSession:(BOOL)a5
{
  id v22 = a3;
  id v8 = a4;
  if ([(IRSessionAnalytics *)self _isSessionOngoing])
  {
    v9 = +[IREventDO eventDOWithMediaType:5];
    int v10 = [v22 isEqual:v9];

    id v11 = +[IREventDO eventDOWithMediaType:0];
    int v12 = [v22 isEqual:v11];

    if ((v10 & 1) != 0 || v12)
    {
      [(IRSessionAnalytics *)self setChosenCandidate:v8];
      if (!v10 || a5)
      {
        v13 = [(IRSessionAnalytics *)self bannerCandidate];
        id v14 = [v13 candidateIdentifier];
        v15 = [(IRSessionAnalytics *)self chosenCandidate];
        v16 = [v15 candidateIdentifier];
        int v17 = [v14 isEqual:v16];

        if (!v8) {
          goto LABEL_16;
        }
        uint64_t v18 = 4;
        if (!v17) {
          uint64_t v18 = 5;
        }
        uint64_t v19 = 1;
        if (!v17) {
          uint64_t v19 = 2;
        }
        uint64_t v20 = v10 ? v18 : v19;
        v21 = [v8 candidateIdentifier];

        if (!v21) {
LABEL_16:
        }
          uint64_t v20 = 7;
        [(IRSessionAnalytics *)self _stopSessionAndSendCA:v20];
      }
      else
      {
        [(IRSessionAnalytics *)self setPlaybackStartEvent:v22];
      }
    }
  }
}

- (void)_handleSessionTimeout
{
  v3 = [(IRSessionAnalytics *)self playbackStartEvent];

  if (v3)
  {
    id v5 = [(IRSessionAnalytics *)self playbackStartEvent];
    v4 = [(IRSessionAnalytics *)self chosenCandidate];
    [(IRSessionAnalytics *)self _handleNonBannerEvent:v5 forCandidate:v4 forceStopSession:1];
  }
  else
  {
    [(IRSessionAnalytics *)self _stopSessionAndSendCA:0];
  }
}

- (BOOL)_isSessionOngoing
{
  id v2 = [(IRSessionAnalytics *)self timer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_stopSessionAndSendCA:(unint64_t)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v6 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    log = v6;
    v45 = [(IRSessionAnalytics *)self bannerEvent];
    [v45 eventType];
    IRMediaEventTypeToString();
    v41 = unint64_t v47 = a3;
    id v7 = [(IRSessionAnalytics *)self bannerCandidate];
    id v8 = [v7 candidateIdentifier];
    v9 = [(IRSessionAnalytics *)self chosenCandidate];
    int v10 = [v9 candidateIdentifier];
    id v11 = IRSessionAnalyticsMetricPostBannerInteractionToString(v47);
    int v12 = NSNumber;
    v13 = [(IRSessionAnalytics *)self bannerEvent];
    id v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isOutsideApp"));
    *(_DWORD *)buf = 136316674;
    v50 = "#session-analytics, ";
    __int16 v51 = 2112;
    v52 = v5;
    __int16 v53 = 2112;
    v54 = v41;
    __int16 v55 = 2112;
    v56 = v8;
    __int16 v57 = 2112;
    v58 = v10;
    __int16 v59 = 2112;
    v60 = v11;
    __int16 v61 = 2112;
    v62 = v14;
    _os_log_impl(&dword_25418E000, log, OS_LOG_TYPE_INFO, "%s[%@], Stopping with eventType: %@, bannerCandidateIdentifier: %@, chosenCandidateIdentifier: %@, postBannerInteraction: %@, isOutsideApp: %@", buf, 0x48u);

    a3 = v47;
  }

  v15 = [IRSessionAnalyticsMetric alloc];
  os_log_t loga = [(IRSessionAnalytics *)self service];
  v48 = [loga clientIdentifier];
  v16 = NSNumber;
  __int16 v42 = [(IRSessionAnalytics *)self bannerEvent];
  __int16 v40 = [v42 bundleID];
  v46 = objc_msgSend(v16, "numberWithInteger:", +[IRAnalyticsUtilities getRedactedBundleID:](IRAnalyticsUtilities, "getRedactedBundleID:", v40));
  int v17 = NSNumber;
  v39 = [(IRSessionAnalytics *)self bannerEvent];
  v35 = objc_msgSend(v17, "numberWithUnsignedInteger:", IRSessionAnalyticsMetricEventTypeFromEvent(objc_msgSend(v39, "eventType")));
  uint64_t v18 = NSNumber;
  __int16 v38 = [(IRSessionAnalytics *)self bannerMiLoPrediction];
  uint64_t v19 = objc_msgSend(v18, "numberWithBool:", objc_msgSend(v38, "canUse"));
  v37 = [(IRSessionAnalytics *)self bannerCandidate];
  v32 = +[IRAnalyticsUtilities candidateTypeForCandidate:v37];
  __int16 v36 = [(IRSessionAnalytics *)self bannerCandidate];
  id v31 = +[IRAnalyticsUtilities candidateModelTypeForCandidate:v36];
  v33 = [(IRSessionAnalytics *)self chosenCandidate];
  uint64_t v20 = +[IRAnalyticsUtilities candidateTypeForCandidate:v33];
  v21 = [(IRSessionAnalytics *)self chosenCandidate];
  id v22 = +[IRAnalyticsUtilities candidateModelTypeForCandidate:v21];
  v23 = [NSNumber numberWithUnsignedInteger:a3];
  double v24 = NSNumber;
  double v25 = [(IRSessionAnalytics *)self bannerEvent];
  v26 = objc_msgSend(v24, "numberWithBool:", objc_msgSend(v25, "isOutsideApp"));
  __int16 v34 = [(IRSessionAnalyticsMetric *)v15 initWithClientIdentifier:v48 internalAppName:v46 eventType:v35 miloAvailable:v19 bannerCandidateType:v32 bannerCandidateModelType:v31 chosenCandidateType:v20 chosenCandidateModelType:v22 postBannerInteraction:v23 isOutsideApp:v26];

  v27 = [(IRSessionAnalyticsMetric *)v34 name];
  id v28 = [(IRSessionAnalytics *)self service];
  id v29 = [v28 clientIdentifier];
  v30 = [(IRSessionAnalyticsMetric *)v34 dictionaryRepresentation];
  +[IRAnalyticsManager sendEventLazyForEventIdentifier:v27 clientIdentifier:v29 analytics:v30];

  [(IRSessionAnalytics *)self _invalidate];
}

- (void)_invalidate
{
  BOOL v3 = [(IRSessionAnalytics *)self timer];
  [v3 invalidate];

  [(IRSessionAnalytics *)self setTimer:0];
  [(IRSessionAnalytics *)self setBannerEvent:0];
  [(IRSessionAnalytics *)self setBannerCandidate:0];
  [(IRSessionAnalytics *)self setBannerMiLoPrediction:0];
  [(IRSessionAnalytics *)self setChosenCandidate:0];

  [(IRSessionAnalytics *)self setPlaybackStartEvent:0];
}

- (void)setQueue:(id)a3
{
}

- (IRServiceDO)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (IRTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (IREventDO)bannerEvent
{
  return self->_bannerEvent;
}

- (void)setBannerEvent:(id)a3
{
}

- (IRCandidateDO)bannerCandidate
{
  return self->_bannerCandidate;
}

- (void)setBannerCandidate:(id)a3
{
}

- (IRMiloLslPredictionDO)bannerMiLoPrediction
{
  return self->_bannerMiLoPrediction;
}

- (void)setBannerMiLoPrediction:(id)a3
{
}

- (IRCandidateDO)chosenCandidate
{
  return self->_chosenCandidate;
}

- (void)setChosenCandidate:(id)a3
{
}

- (IREventDO)playbackStartEvent
{
  return self->_playbackStartEvent;
}

- (void)setPlaybackStartEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackStartEvent, 0);
  objc_storeStrong((id *)&self->_chosenCandidate, 0);
  objc_storeStrong((id *)&self->_bannerMiLoPrediction, 0);
  objc_storeStrong((id *)&self->_bannerCandidate, 0);
  objc_storeStrong((id *)&self->_bannerEvent, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end