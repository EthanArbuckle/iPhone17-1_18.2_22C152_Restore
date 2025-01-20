@interface MPCLyricsReportingController
- (void)recordLyricsViewEvent:(id)a3;
@end

@implementation MPCLyricsReportingController

- (void)recordLyricsViewEvent:(id)a3
{
  v84[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 modelSong];
  v5 = [v4 lyrics];
  char v6 = [v5 hasStoreLyrics];

  v7 = (MPCReportingPlaybackEventSource *)os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
  BOOL v8 = os_log_type_enabled(&v7->super, OS_LOG_TYPE_INFO);
  if (v6)
  {
    v66 = v4;
    if (v8)
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v63 = [v3 modelSong];
      v60 = [v63 identifiers];
      v11 = [v60 universalStore];
      uint64_t v12 = [v11 subscriptionAdamID];
      v13 = [v3 modelSong];
      v14 = [v13 identifiers];
      v15 = [v14 universalStore];
      uint64_t v16 = [v15 adamID];
      uint64_t v17 = [v3 displayType];
      [v3 visibleDuration];
      *(float *)&double v18 = v18;
      *(_DWORD *)buf = 138544642;
      v71 = v10;
      __int16 v72 = 2048;
      id v73 = v3;
      __int16 v74 = 2048;
      uint64_t v75 = v12;
      __int16 v76 = 2048;
      uint64_t v77 = v16;
      __int16 v78 = 2048;
      uint64_t v79 = v17;
      __int16 v80 = 2048;
      double v81 = *(float *)&v18;
      _os_log_impl(&dword_21BB87000, &v7->super, OS_LOG_TYPE_INFO, "Beginning report for <%{public}@: %p, (subscriptionAdamId=%lld, adamId=%lld) type=%ld, dur=%f>", buf, 0x3Eu);

      v4 = v66;
    }

    v7 = objc_alloc_init(MPCReportingPlaybackEventSource);
    v64 = +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment];
    v19 = [[MPCReportingPlaybackEnvironmentPropertiesLoader alloc] initWithPlaybackRequestEnvironment:v64];
    [(MPCReportingPlaybackEventSource *)v7 setIdentityPropertiesLoader:v19];
    id v20 = objc_alloc(MEMORY[0x263F11EE0]);
    v21 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __54__MPCLyricsReportingController_recordLyricsViewEvent___block_invoke;
    v68[3] = &unk_2643C5DF8;
    id v22 = v4;
    id v69 = v22;
    v23 = (void *)[v20 initWithIdentifiers:v21 block:v68];
    [(MPCReportingPlaybackEventSource *)v7 setItemGenericObject:v23];

    v24 = [v3 modelPlayEvent];
    [(MPCReportingPlaybackEventSource *)v7 setModelPlayEvent:v24];

    v25 = [v3 featureName];
    [(MPCReportingPlaybackEventSource *)v7 setFeatureName:v25];

    v26 = [v3 recommendationData];
    [(MPCReportingPlaybackEventSource *)v7 setRecommendationData:v26];

    v27 = [v3 lyricsID];

    if (v27)
    {
      v28 = [v3 lyricsID];
      [(MPCReportingPlaybackEventSource *)v7 setLyricsID:v28];
    }
    else
    {
      v28 = [v22 lyrics];
      v39 = [v28 identifiers];
      v40 = [v39 lyricsID];
      [(MPCReportingPlaybackEventSource *)v7 setLyricsID:v40];
    }
    v41 = +[MPCReportingPlaybackObserver sharedReportingPlaybackObserver];
    v42 = (void *)[v41 newPlayActivityEvent];

    [v42 setEventType:2];
    [v3 visibleDuration];
    objc_msgSend(v42, "setItemEndTime:");
    objc_msgSend(v42, "setLyricsDisplayedCharacterCount:", objc_msgSend(v3, "displayedCharacterCount"));
    v43 = [v3 language];
    [v42 setLyricsLanguage:v43];

    objc_msgSend(v42, "setContinuityCameraUsed:", objc_msgSend(v3, "continuityCameraUsed"));
    objc_msgSend(v42, "setSourceType:", 2 * (objc_msgSend(v3, "sourceType") == 1));
    unint64_t v44 = [v3 displayType];
    if (v44 < 3) {
      unint64_t v45 = v44 + 1;
    }
    else {
      unint64_t v45 = 0;
    }
    [v42 setDisplayType:v45];
    v46 = +[MPCReportingPlaybackObserver sharedReportingPlaybackObserver];
    v84[0] = v42;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:1];
    [v46 recordPlayActivityEvents:v47 forEventSource:v7];

    v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      v62 = [v3 modelSong];
      v59 = [v62 identifiers];
      v58 = [v59 universalStore];
      uint64_t v56 = [v58 subscriptionAdamID];
      v57 = [v3 modelSong];
      v51 = [v57 identifiers];
      v52 = [v51 universalStore];
      uint64_t v53 = [v52 adamID];
      uint64_t v54 = [v3 displayType];
      [v3 visibleDuration];
      *(float *)&double v55 = v55;
      *(_DWORD *)buf = 138544898;
      v71 = v50;
      __int16 v72 = 2048;
      id v73 = v3;
      __int16 v74 = 2048;
      uint64_t v75 = v56;
      __int16 v76 = 2048;
      uint64_t v77 = v53;
      __int16 v78 = 2048;
      uint64_t v79 = v54;
      __int16 v80 = 2048;
      double v81 = *(float *)&v55;
      __int16 v82 = 2048;
      v83 = v42;
      _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_INFO, "Reported <%{public}@: %p, (subscriptionAdamId=%lld, adamId=%lld) type=%ld, dur=%f> with playActivityEvent: %p", buf, 0x48u);

      v4 = v66;
    }
  }
  else if (v8)
  {
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v65 = [v3 modelSong];
    v61 = [v65 identifiers];
    v31 = [v61 universalStore];
    uint64_t v32 = [v31 subscriptionAdamID];
    [v3 modelSong];
    v33 = v67 = v4;
    v34 = [v33 identifiers];
    v35 = [v34 universalStore];
    uint64_t v36 = [v35 adamID];
    uint64_t v37 = [v3 displayType];
    [v3 visibleDuration];
    *(float *)&double v38 = v38;
    *(_DWORD *)buf = 138544642;
    v71 = v30;
    __int16 v72 = 2048;
    id v73 = v3;
    __int16 v74 = 2048;
    uint64_t v75 = v32;
    __int16 v76 = 2048;
    uint64_t v77 = v36;
    __int16 v78 = 2048;
    uint64_t v79 = v37;
    __int16 v80 = 2048;
    double v81 = *(float *)&v38;
    _os_log_impl(&dword_21BB87000, &v7->super, OS_LOG_TYPE_INFO, "Not reporting non store lyrics event for <%{public}@: %p, (subscriptionAdamId=%lld, adamId=%lld) type=%ld, dur=%f>", buf, 0x3Eu);

    v4 = v67;
  }
}

uint64_t __54__MPCLyricsReportingController_recordLyricsViewEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSong:*(void *)(a1 + 32)];
}

@end