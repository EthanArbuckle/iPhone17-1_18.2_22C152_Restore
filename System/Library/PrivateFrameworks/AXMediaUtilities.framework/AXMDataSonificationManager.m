@interface AXMDataSonificationManager
+ (id)sharedManager;
- (AXMChartDescriptor)currentChartDescriptor;
- (AXMDataSonificationManager)init;
- (AXMDataSummary)dataSeriesSummary;
- (BOOL)hapticsEnabled;
- (BOOL)isDataSeriesRegressionModelLoaded;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)isScrubbing;
- (NSArray)xCategoryLabels;
- (NSArray)xGridlinePositions;
- (NSTimer)scrubbingValueAnnouncementTimer;
- (double)currentPlaybackPosition;
- (double)lastPlayheadPosition;
- (double)lastScrubbingValueAnnouncementPosition;
- (id)categoryNameForXAxisPosition:(double)a3;
- (id)valueDescriptionForPlayheadPosition;
- (int64_t)currentSeriesIndex;
- (unint64_t)playbackStatus;
- (void)beginLiveModeSession;
- (void)beginScrubbingSession;
- (void)endLiveModeSession;
- (void)endScrubbingSession;
- (void)pause;
- (void)play;
- (void)scrubToPosition:(double)a3;
- (void)setCurrentChartDescriptor:(id)a3;
- (void)setCurrentSeriesIndex:(int64_t)a3;
- (void)setDataSeriesSummary:(id)a3;
- (void)setHapticsEnabled:(BOOL)a3;
- (void)setLastPlayheadPosition:(double)a3;
- (void)setLastScrubbingValueAnnouncementPosition:(double)a3;
- (void)setLiveModeValue:(double)a3;
- (void)setScrubbingValueAnnouncementTimer:(id)a3;
- (void)stopPlaying;
@end

@implementation AXMDataSonificationManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AXMDataSonificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager__SharedSonificationManager;

  return v2;
}

void __43__AXMDataSonificationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager__SharedSonificationManager;
  sharedManager__SharedSonificationManager = (uint64_t)v1;

  if ((AXDeviceIsAudioAccessory() & 1) == 0)
  {
    id v3 = +[AXMDataSonifier sharedInstance];
    [v3 addPlaybackObserver:sharedManager__SharedSonificationManager];
  }
}

- (AXMDataSonificationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMDataSonificationManager;
  v2 = [(AXMDataSonificationManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessibility.vot.DataSonifierAccess", 0);
    dataSonifierAccessQueue = v2->_dataSonifierAccessQueue;
    v2->_dataSonifierAccessQueue = (OS_dispatch_queue *)v3;

    v2->_hapticsEnabled = 1;
  }
  return v2;
}

- (void)beginLiveModeSession
{
  id v2 = +[AXMDataSonifier sharedInstance];
  [v2 beginLiveContinuousToneSession];
}

- (void)endLiveModeSession
{
  id v2 = +[AXMDataSonifier sharedInstance];
  [v2 endLiveContinuousToneSession];
}

- (void)setLiveModeValue:(double)a3
{
  id v4 = +[AXMDataSonifier sharedInstance];
  [v4 setLiveContinuousToneNormalizedFrequency:a3];
}

- (void)setCurrentChartDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_currentChartDescriptor, a3);
  id v5 = a3;
  id v6 = +[AXMDataSonifier sharedInstance];
  [v6 setCurrentChartDescriptor:self->_currentChartDescriptor];
}

- (BOOL)isPlaying
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__AXMDataSonificationManager_isPlaying__block_invoke;
  block[3] = &unk_1E6116AD8;
  block[4] = &v6;
  dispatch_sync(dataSonifierAccessQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__AXMDataSonificationManager_isPlaying__block_invoke(uint64_t a1)
{
  id v3 = +[AXMDataSonifier sharedInstance];
  if ([v3 isPlaying])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    id v2 = +[AXMDataSonifier sharedInstance];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isInLiveContinuousToneSession];
  }
}

- (BOOL)isPaused
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AXMDataSonificationManager_isPaused__block_invoke;
  block[3] = &unk_1E6116AD8;
  block[4] = &v6;
  dispatch_sync(dataSonifierAccessQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__AXMDataSonificationManager_isPaused__block_invoke(uint64_t a1)
{
  id v2 = +[AXMDataSonifier sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isPaused];
}

- (BOOL)isScrubbing
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AXMDataSonificationManager_isScrubbing__block_invoke;
  block[3] = &unk_1E6116AD8;
  block[4] = &v6;
  dispatch_sync(dataSonifierAccessQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__AXMDataSonificationManager_isScrubbing__block_invoke(uint64_t a1)
{
  id v2 = +[AXMDataSonifier sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isScrubbing];
}

- (double)currentPlaybackPosition
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AXMDataSonificationManager_currentPlaybackPosition__block_invoke;
  block[3] = &unk_1E6116AD8;
  block[4] = &v6;
  dispatch_sync(dataSonifierAccessQueue, block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __53__AXMDataSonificationManager_currentPlaybackPosition__block_invoke(uint64_t a1)
{
  id v3 = +[AXMDataSonifier sharedInstance];
  [v3 currentPlaybackPosition];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
}

- (void)play
{
}

void __34__AXMDataSonificationManager_play__block_invoke()
{
  id v0 = +[AXMDataSonifier sharedInstance];
  [v0 play];
}

- (void)pause
{
}

void __35__AXMDataSonificationManager_pause__block_invoke()
{
  id v0 = +[AXMDataSonifier sharedInstance];
  [v0 pause];
}

- (void)stopPlaying
{
}

void __41__AXMDataSonificationManager_stopPlaying__block_invoke()
{
  id v0 = +[AXMDataSonifier sharedInstance];
  [v0 stopPlaying];
}

- (void)beginScrubbingSession
{
  [(AXMDataSonificationManager *)self setLastScrubbingValueAnnouncementPosition:1.79769313e308];
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;

  dispatch_sync(dataSonifierAccessQueue, &__block_literal_global_32);
}

void __51__AXMDataSonificationManager_beginScrubbingSession__block_invoke()
{
  id v0 = +[AXMDataSonifier sharedInstance];
  [v0 beginScrubbing];
}

- (void)scrubToPosition:(double)a3
{
  [(AXMDataSonificationManager *)self currentPlaybackPosition];
  double v6 = vabdd_f64(a3, v5);
  [(AXMDataSonificationManager *)self lastScrubbingValueAnnouncementPosition];
  if (vabdd_f64(a3, v7) > 0.1)
  {
    [(AXMDataSonificationManager *)self stopSpeaking];
    uint64_t v8 = +[AXMDataSonifier sharedInstance];
    [v8 masterVolume];
    double v10 = v9;

    if (v10 < 1.0)
    {
      v11 = +[AXMDataSonifier sharedInstance];
      [v11 setMasterVolume:1.0 fadeDuration:0.5];
    }
  }
  if (v6 >= 0.025
    || ([(AXMDataSonificationManager *)self lastScrubbingValueAnnouncementPosition], vabdd_f64(v12, a3) <= 0.025))
  {
    v15 = [(AXMDataSonificationManager *)self scrubbingValueAnnouncementTimer];
    [v15 invalidate];

    [(AXMDataSonificationManager *)self setScrubbingValueAnnouncementTimer:0];
  }
  else
  {
    v13 = [(AXMDataSonificationManager *)self scrubbingValueAnnouncementTimer];
    [v13 invalidate];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__AXMDataSonificationManager_scrubToPosition___block_invoke;
    v18[3] = &unk_1E61184F0;
    v18[4] = self;
    *(double *)&v18[5] = a3;
    v14 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v18 block:0.5];
    [(AXMDataSonificationManager *)self setScrubbingValueAnnouncementTimer:v14];
  }
  [(AXMDataSonificationManager *)self setLastPlayheadPosition:a3];
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AXMDataSonificationManager_scrubToPosition___block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&block[4] = a3;
  dispatch_sync(dataSonifierAccessQueue, block);
}

uint64_t __46__AXMDataSonificationManager_scrubToPosition___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[AXMDataSonifier sharedInstance];
  [v2 setMasterVolume:0.4 fadeDuration:0.5];

  [*(id *)(a1 + 32) announceValueForPlayheadPosition];
  double v3 = *(double *)(a1 + 40);
  id v4 = *(void **)(a1 + 32);

  return [v4 setLastScrubbingValueAnnouncementPosition:v3];
}

void __46__AXMDataSonificationManager_scrubToPosition___block_invoke_2(uint64_t a1)
{
  id v2 = +[AXMDataSonifier sharedInstance];
  [v2 setPlaybackPosition:*(double *)(a1 + 32)];
}

- (void)endScrubbingSession
{
}

void __49__AXMDataSonificationManager_endScrubbingSession__block_invoke()
{
  id v0 = +[AXMDataSonifier sharedInstance];
  [v0 endScrubbing];

  id v1 = +[AXMDataSonifier sharedInstance];
  [v1 setMasterVolume:1.0];
}

- (void)setCurrentSeriesIndex:(int64_t)a3
{
  dataSonifierAccessQueue = self->_dataSonifierAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AXMDataSonificationManager_setCurrentSeriesIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_sync(dataSonifierAccessQueue, block);
}

void __52__AXMDataSonificationManager_setCurrentSeriesIndex___block_invoke(uint64_t a1)
{
  id v2 = +[AXMDataSonifier sharedInstance];
  [v2 setCurrentSeriesIndex:*(void *)(a1 + 32)];
}

- (int64_t)currentSeriesIndex
{
  id v2 = +[AXMDataSonifier sharedInstance];
  int64_t v3 = [v2 currentSeriesIndex];

  return v3;
}

- (id)categoryNameForXAxisPosition:(double)a3
{
  return 0;
}

- (unint64_t)playbackStatus
{
  if ([(AXMDataSonificationManager *)self isScrubbing])
  {
    int64_t v3 = +[AXMDataSonifier sharedInstance];
    int v4 = [v3 isEndingScrubbing];

    if (!v4) {
      return 3;
    }
  }
  if ([(AXMDataSonificationManager *)self isPlaying]) {
    return 1;
  }
  if ([(AXMDataSonificationManager *)self isPaused]) {
    return 2;
  }
  return 0;
}

- (id)valueDescriptionForPlayheadPosition
{
  v148[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = +[AXMDataSonifier sharedInstance];
  [v4 currentPlaybackPosition];
  double v6 = v5;

  if ([(AXMDataSonificationManager *)self currentSeriesIndex] < 1)
  {
    v106 = 0;
  }
  else
  {
    double v7 = [(AXMDataSonificationManager *)self currentChartDescriptor];
    uint64_t v8 = [v7 series];
    v106 = objc_msgSend(v8, "objectAtIndexedSubscript:", -[AXMDataSonificationManager currentSeriesIndex](self, "currentSeriesIndex") - 1);
  }
  double v9 = [(AXMDataSonificationManager *)self currentChartDescriptor];
  double v10 = [v9 xAxis];
  int v11 = [v10 isCategoricalAxis];

  if (!v11)
  {
    if (v106)
    {
      v145 = v106;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:1];
    }
    else
    {
      v45 = [(AXMDataSonificationManager *)self currentChartDescriptor];
      v15 = [v45 series];
    }
    v46 = [(AXMDataSonificationManager *)self currentChartDescriptor];
    v47 = [v46 xAxis];

    [v47 upperBound];
    double v49 = v48;
    [v47 lowerBound];
    double v51 = v50;
    [v47 lowerBound];
    double v53 = v52;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v17 = v15;
    uint64_t v115 = [v17 countByEnumeratingWithState:&v130 objects:v144 count:16];
    if (!v115)
    {
      unint64_t v18 = 0;
      v13 = v17;
      goto LABEL_78;
    }
    unint64_t v54 = 0;
    double v55 = v49 - v51;
    double v56 = v53 + v6 * (v49 - v51);
    v109 = v47;
    uint64_t v111 = *(void *)v131;
    double v57 = v55 * 0.05;
    id obja = v17;
    v113 = v3;
LABEL_37:
    uint64_t v58 = 0;
    while (1)
    {
      v59 = v3;
      if (*(void *)v131 != v111) {
        objc_enumerationMutation(v17);
      }
      v60 = *(void **)(*((void *)&v130 + 1) + 8 * v58);
      v61 = [MEMORY[0x1E4F1CA48] array];
      v62 = [v60 name];
      v63 = [v60 name];

      if (v63)
      {
        v121 = v62;
      }
      else
      {
        uint64_t v64 = [v17 indexOfObject:v60];
        v65 = NSString;
        v66 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
        v67 = [v66 localizedStringForKey:@"audiograph.series.number" value:&stru_1F0E72D10 table:@"Accessibility"];
        v68 = v65;
        id v17 = obja;
        uint64_t v69 = objc_msgSend(v68, "localizedStringWithFormat:", v67, v64);

        v121 = (void *)v69;
      }
      int64_t v3 = v59;
      if ([v60 isContinuous])
      {
        long long v128 = 0uLL;
        long long v129 = 0uLL;
        long long v126 = 0uLL;
        long long v127 = 0uLL;
        v70 = [v60 dataPoints];
        uint64_t v71 = [v70 countByEnumeratingWithState:&v126 objects:v143 count:16];
        if (!v71) {
          goto LABEL_69;
        }
        uint64_t v72 = v71;
        uint64_t v117 = v58;
        id v73 = 0;
        uint64_t v74 = *(void *)v127;
        do
        {
          for (uint64_t i = 0; i != v72; ++i)
          {
            v76 = v73;
            if (*(void *)v127 != v74) {
              objc_enumerationMutation(v70);
            }
            v77 = *(void **)(*((void *)&v126 + 1) + 8 * i);
            if (v76)
            {
              v78 = [v76 xValue];
              [v78 number];
              if (v56 <= v79)
              {
              }
              else
              {
                v80 = [v77 xValue];
                [v80 number];
                double v82 = v81;

                if (v56 < v82)
                {
                  v94 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
                  v95 = [v94 localizedStringForKey:@"audiograph.datapoint" value:&stru_1F0E72D10 table:@"Accessibility"];
                  [v61 addObject:v95];

                  v96 = [v76 valueDescription];
                  [v61 addObject:v96];

                  ++v54;
                  goto LABEL_67;
                }
              }
            }
            id v73 = v77;
          }
          uint64_t v72 = [v70 countByEnumeratingWithState:&v126 objects:v143 count:16];
        }
        while (v72);
        v76 = v73;
LABEL_67:

        int64_t v3 = v113;
      }
      else
      {
        long long v124 = 0uLL;
        long long v125 = 0uLL;
        long long v122 = 0uLL;
        long long v123 = 0uLL;
        v70 = [v60 dataPoints];
        uint64_t v83 = [v70 countByEnumeratingWithState:&v122 objects:v142 count:16];
        if (!v83) {
          goto LABEL_69;
        }
        uint64_t v84 = v83;
        uint64_t v117 = v58;
        uint64_t v85 = *(void *)v123;
        do
        {
          for (uint64_t j = 0; j != v84; ++j)
          {
            if (*(void *)v123 != v85) {
              objc_enumerationMutation(v70);
            }
            v87 = *(void **)(*((void *)&v122 + 1) + 8 * j);
            v88 = [v87 xValue];
            [v88 number];
            double v90 = v89;

            if (vabdd_f64(v90, v56) < v57)
            {
              v91 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
              v92 = [v91 localizedStringForKey:@"audiograph.datapoint" value:&stru_1F0E72D10 table:@"Accessibility"];
              [v61 addObject:v92];

              v93 = [v87 valueDescription];
              [v61 addObject:v93];

              ++v54;
            }
          }
          uint64_t v84 = [v70 countByEnumeratingWithState:&v122 objects:v142 count:16];
        }
        while (v84);
      }
      uint64_t v58 = v117;
      id v17 = obja;
LABEL_69:

      if ((unint64_t)[v17 count] >= 2 && objc_msgSend(v61, "count")) {
        [v61 insertObject:v121 atIndex:0];
      }
      [v3 addObjectsFromArray:v61];

      if (++v58 == v115)
      {
        uint64_t v115 = [v17 countByEnumeratingWithState:&v130 objects:v144 count:16];
        if (!v115)
        {
          v13 = v17;
          unint64_t v18 = v54;
          v47 = v109;
          goto LABEL_78;
        }
        goto LABEL_37;
      }
    }
  }
  double v12 = [(AXMDataSonificationManager *)self currentChartDescriptor];
  v13 = [v12 xAxis];

  if (v106)
  {
    v148[0] = v106;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:1];
  }
  else
  {
    v16 = [(AXMDataSonificationManager *)self currentChartDescriptor];
    v14 = [v16 series];
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v17 = v14;
  uint64_t v110 = [v17 countByEnumeratingWithState:&v138 objects:v147 count:16];
  if (v110)
  {
    obuint64_t j = v17;
    unint64_t v18 = 0;
    uint64_t v107 = *(void *)v139;
    v108 = v13;
    v112 = v3;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v139 != v107) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v138 + 1) + 8 * v19);
        v120 = [MEMORY[0x1E4F1CA48] array];
        v21 = [v20 name];
        v22 = [v20 name];

        if (!v22)
        {
          uint64_t v23 = [obj indexOfObject:v20];
          v24 = NSString;
          v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
          v26 = [v25 localizedStringForKey:@"audiograph.series.number" value:&stru_1F0E72D10 table:@"Accessibility"];
          uint64_t v27 = objc_msgSend(v24, "localizedStringWithFormat:", v26, v23);

          v21 = (void *)v27;
        }
        if ((unint64_t)[obj count] >= 2) {
          [v120 addObject:v21];
        }
        v28 = [v13 categoryOrder];
        double v29 = 1.0 / (double)(unint64_t)[v28 count];

        unint64_t v30 = vcvtmd_s64_f64(v6 / v29);
        v31 = [v13 categoryOrder];
        unint64_t v32 = [v31 count];

        uint64_t v116 = v19;
        if (v32 <= v30)
        {
          v34 = 0;
        }
        else
        {
          v33 = [v13 categoryOrder];
          v34 = [v33 objectAtIndexedSubscript:v30];
        }
        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        v35 = [v20 dataPoints];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v134 objects:v146 count:16];
        v114 = v21;
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v135;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v135 != v38) {
                objc_enumerationMutation(v35);
              }
              v40 = *(void **)(*((void *)&v134 + 1) + 8 * k);
              v41 = [v40 xValue];
              v42 = [v41 category];
              int v43 = [v42 isEqualToString:v34];

              if (v43)
              {
                v44 = [v40 valueDescription];
                [v120 addObject:v44];

                ++v18;
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v134 objects:v146 count:16];
          }
          while (v37);
        }

        int64_t v3 = v112;
        [v112 addObjectsFromArray:v120];

        uint64_t v19 = v116 + 1;
        v13 = v108;
      }
      while (v116 + 1 != v110);
      uint64_t v110 = [obj countByEnumeratingWithState:&v138 objects:v147 count:16];
    }
    while (v110);
    id v17 = obj;
  }
  else
  {
    unint64_t v18 = 0;
  }
  v47 = v17;
LABEL_78:

  if (v18 < 2)
  {
    v100 = 0;
  }
  else
  {
    v97 = NSString;
    v98 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v99 = [v98 localizedStringForKey:@"audiograph.datapoints.count" value:&stru_1F0E72D10 table:@"Accessibility"];
    v100 = objc_msgSend(v97, "localizedStringWithFormat:", v99, v18);
  }
  v101 = [v3 componentsJoinedByString:@", "];
  v102 = v101;
  if (v100)
  {
    id v103 = [NSString stringWithFormat:@"%@, %@", v100, v101];
  }
  else
  {
    id v103 = v101;
  }
  v104 = v103;

  return v104;
}

- (AXMChartDescriptor)currentChartDescriptor
{
  id v2 = +[AXMDataSonifier sharedInstance];
  int64_t v3 = [v2 currentChartDescriptor];

  return (AXMChartDescriptor *)v3;
}

- (BOOL)hapticsEnabled
{
  return self->_hapticsEnabled;
}

- (void)setHapticsEnabled:(BOOL)a3
{
  self->_hapticsEnabled = a3;
}

- (double)lastPlayheadPosition
{
  return self->_lastPlayheadPosition;
}

- (void)setLastPlayheadPosition:(double)a3
{
  self->_lastPlayheadPosition = a3;
}

- (NSArray)xGridlinePositions
{
  return self->_xGridlinePositions;
}

- (NSArray)xCategoryLabels
{
  return self->_xCategoryLabels;
}

- (AXMDataSummary)dataSeriesSummary
{
  return self->_dataSeriesSummary;
}

- (void)setDataSeriesSummary:(id)a3
{
}

- (BOOL)isDataSeriesRegressionModelLoaded
{
  return self->_isDataSeriesRegressionModelLoaded;
}

- (double)lastScrubbingValueAnnouncementPosition
{
  return self->_lastScrubbingValueAnnouncementPosition;
}

- (void)setLastScrubbingValueAnnouncementPosition:(double)a3
{
  self->_lastScrubbingValueAnnouncementPosition = a3;
}

- (NSTimer)scrubbingValueAnnouncementTimer
{
  return self->_scrubbingValueAnnouncementTimer;
}

- (void)setScrubbingValueAnnouncementTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubbingValueAnnouncementTimer, 0);
  objc_storeStrong((id *)&self->_dataSeriesSummary, 0);
  objc_storeStrong((id *)&self->_xCategoryLabels, 0);
  objc_storeStrong((id *)&self->_xGridlinePositions, 0);
  objc_storeStrong((id *)&self->_currentChartDescriptor, 0);

  objc_storeStrong((id *)&self->_dataSonifierAccessQueue, 0);
}

@end