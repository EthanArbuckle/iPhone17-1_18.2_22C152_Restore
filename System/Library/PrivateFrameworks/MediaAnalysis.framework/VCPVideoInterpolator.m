@interface VCPVideoInterpolator
+ (BOOL)allowDetectSingleDrop;
+ (BOOL)allowMultipleFormats;
+ (BOOL)isEnabled;
+ (int64_t)getFRCQualityMode;
+ (void)sendPreGatedAnalytics;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)getFramePTSAfter:(SEL)a3 forAsset:(id *)a4;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)adjustedTimeRange;
- (BOOL)cancelled;
- (BOOL)enableStyle;
- (BOOL)hasStyleApplied;
- (BOOL)isIntraFrame:(id *)a3;
- (BOOL)processAborted;
- (CGSize)getFrameSize:(id)a3;
- (VCPVideoInterpolator)initWithTimestamps:(id)a3 andIdentifier:(id)a4 andTrack:(id)a5;
- (__CVBuffer)calculateDeltaforUnstyledFrame:(__CVBuffer *)a3 styledFrame:(__CVBuffer *)a4 withCoefficients:(id)a5;
- (__CVBuffer)revertStyle:(__CVBuffer *)a3 withMetadata:(id)a4 withDeltaMap:(__CVBuffer *)a5;
- (id).cxx_construct;
- (id)addInputMediaType:(id)a3 toWriter:(id)a4 forTrack:(id)a5;
- (id)createDeltaTrackDecoder:(id)a3 timerange:(id *)a4;
- (id)createStyleInforMetadata:(id)a3 timerange:(id *)a4;
- (id)deserializeMetadata:(opaqueCMSampleBuffer *)a3;
- (id)findDeltaTrack:(id)a3;
- (id)findLearnedTrack:(id)a3;
- (id)findLivePhotoInfoOutput:(id)a3;
- (id)findStyleInfoTrack:(id)a3;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)appendOutput:(id)a3 toTrack:(id)a4 startTimeStamp:(id *)a5 endTimeStamp:(id *)a6 offset:(id *)a7 duration:(id *)a8;
- (int)appendOutput:(id)a3 toWriterInput:(id)a4;
- (int)appendOutput:(id)a3 toWriterInput:(id)a4 startTimeStamp:(id *)a5 endTimeStamp:(id *)a6 offset:(id *)a7 duration:(id *)a8;
- (int)checkFirstDisplayTimeForTrack:(id)a3;
- (int)combineVideoSegments;
- (int)combineVideoSegmentsWithAssetWriter;
- (int)findIntraFrameList:(id)a3;
- (int)finishAnalysisPass:(id *)a3;
- (int)setupAdditionalAuxTrack;
- (int)setupLivePhotoInfoOutput:(id)a3;
- (int)updateLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3 withTimestamp:(id *)a4 withMetadata:(id)a5 isInterpolated:(BOOL)a6 updatedSample:(opaqueCMSampleBuffer *)a7;
- (void)dealloc;
- (void)setCancelled:(BOOL)a3;
@end

@implementation VCPVideoInterpolator

+ (BOOL)isEnabled
{
  return 0;
}

+ (BOOL)allowMultipleFormats
{
  return 0;
}

+ (int64_t)getFRCQualityMode
{
  return 0;
}

+ (BOOL)allowDetectSingleDrop
{
  return 0;
}

+ (void)sendPreGatedAnalytics
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F616F0];
  v6[0] = @"FRCGatingStatusField";
  v6[1] = v2;
  v7[0] = &unk_1F15EB670;
  v7[1] = &unk_1F15EB670;
  uint64_t v3 = *MEMORY[0x1E4F616E8];
  v6[2] = @"FRCGatingCauseField";
  v6[3] = v3;
  v7[2] = &unk_1F15EB688;
  v7[3] = &unk_1F15EB688;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v5 sendEvent:@"com.apple.mediaanalysisd.livePhotoFillingGaps" withAnalytics:v4];
}

- (VCPVideoInterpolator)initWithTimestamps:(id)a3 andIdentifier:(id)a4 andTrack:(id)a5
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v163 = a4;
  id v9 = a5;
  v192.receiver = self;
  v192.super_class = (Class)VCPVideoInterpolator;
  v164 = v8;
  v10 = [(VCPVideoInterpolator *)&v192 init];
  v166 = v10;
  if (v10)
  {
    v162 = v9;
    v161 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v161 fileExistsAtPath:@"/tmp/com.apple.mediaanalysisd/"])
    {
      id v159 = 0;
    }
    else
    {
      id v191 = 0;
      char v12 = [v161 createDirectoryAtPath:@"/tmp/com.apple.mediaanalysisd/" withIntermediateDirectories:1 attributes:0 error:&v191];
      id v159 = v191;
      if ((v12 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          v11 = 0;
          goto LABEL_30;
        }
        v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = [v159 description];
          LODWORD(buf.start.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v23;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "Failed to create resource file cache directory (%@)", (uint8_t *)&buf, 0xCu);
        }
        v11 = 0;
LABEL_29:

LABEL_30:
        id v9 = v162;
        goto LABEL_31;
      }
    }
    v168 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v167 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v158 = [v8 objectForKeyedSubscript:@"MetaAdjusterResults"];
    [v10 getFrameSize:v9];
    uint64_t v15 = [MEMORY[0x1E4F61710] getUsageFromSizeWidth:(unint64_t)v13 height:(unint64_t)v14];
    if (v15 == -1)
    {
      v18 = v10;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.start.value) = 0;
          v20 = "Video resolution not supported";
          goto LABEL_14;
        }
LABEL_15:

LABEL_16:
        v21 = 0;
LABEL_17:
        v18 = v166;
LABEL_24:
        v26 = 0;
        v27 = v18 + 336;
LABEL_25:
        unsigned char *v27 = 1;
LABEL_26:
        v11 = v26;
        goto LABEL_27;
      }
    }
    else
    {
      v16 = [v9 segments];
      BOOL v17 = (unint64_t)[v16 count] > 1;

      if (v17)
      {
        v18 = v10;
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.start.value) = 0;
            v20 = "Video with multiple edits not supported";
LABEL_14:
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&buf, 2u);
            goto LABEL_15;
          }
          goto LABEL_15;
        }
      }
      else
      {
        v10[336] = 0;
        v10[339] = 0;
        long long v24 = *MEMORY[0x1E4F1FA30];
        long long v25 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
        *(_OWORD *)(v10 + 356) = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
        *(_OWORD *)(v10 + 372) = v25;
        v157 = (long long *)(v10 + 340);
        *(_OWORD *)(v10 + 340) = v24;
        objc_storeStrong((id *)v10 + 24, a5);
        v18 = v10;
        v10[338] = 1;
        if (![v10 checkFirstDisplayTimeForTrack:*((void *)v10 + 24)])
        {
          v29 = [v9 asset];
          v30 = [v10 findDeltaTrack:v29];
          BOOL v31 = v30 == 0;

          if (v31)
          {
            v33 = v10;
            v10[338] = 0;
          }
          else
          {
            v10[338] = 1;
            BOOL v32 = +[VCPVideoInterpolator isEnabled];
            v33 = v10;
            if (!v32)
            {
              if ((int)MediaAnalysisLogLevel() < 5)
              {
                v11 = 0;
                goto LABEL_28;
              }
              v21 = VCPLogInstance();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf.start.value) = 0;
                _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "FRC disabled for style non-standard captures", (uint8_t *)&buf, 2u);
              }
              v11 = 0;
LABEL_27:

LABEL_28:
              v22 = v168;
              goto LABEL_29;
            }
          }
          v34 = (void *)*((void *)v33 + 1);
          *((void *)v33 + 1) = 0;

          v35 = (void *)*((void *)v10 + 3);
          *((void *)v10 + 3) = 0;

          v36 = (void *)*((void *)v10 + 4);
          *((void *)v10 + 4) = 0;

          *((void *)v10 + 5) = 0;
          v37 = NSString;
          v38 = [MEMORY[0x1E4F29128] UUID];
          v39 = [v38 UUIDString];
          uint64_t v40 = [v37 stringWithFormat:@"%@frc-tmp-%@.MOV", @"/tmp/com.apple.mediaanalysisd/", v39];
          v41 = (void *)*((void *)v10 + 20);
          *((void *)v10 + 20) = v40;

          v42 = NSString;
          v43 = NSTemporaryDirectory();
          v44 = [MEMORY[0x1E4F29128] UUID];
          v45 = [v44 UUIDString];
          uint64_t v46 = [v42 stringWithFormat:@"%@frc-tmp-segment-%@.MOV", v43, v45];
          v47 = (void *)*((void *)v10 + 21);
          *((void *)v10 + 21) = v46;

          uint64_t v48 = [v164 objectForKeyedSubscript:@"MetaSSResults"];
          v49 = (void *)*((void *)v10 + 29);
          *((void *)v10 + 29) = v48;

          v10[337] = *((void *)v10 + 29) != 0;
          id v50 = objc_alloc(MEMORY[0x1E4F16378]);
          v51 = [v9 asset];
          uint64_t v52 = [v50 initWithAsset:v51 error:0];
          v53 = (void *)*((void *)v10 + 40);
          *((void *)v10 + 40) = v52;

          uint64_t v54 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          v55 = (void *)*((void *)v10 + 41);
          *((void *)v10 + 41) = v54;

          v56 = [v9 asset];
          v57 = v56;
          if (v56) {
            objc_msgSend(v56, "vcp_livePhotoStillDisplayTime");
          }
          else {
            memset(&buf, 0, 24);
          }
          CMTimeEpoch epoch = buf.start.epoch;
          *(_OWORD *)(v10 + 88) = *(_OWORD *)&buf.start.value;
          v154 = v10 + 88;
          *((void *)v10 + 13) = epoch;

          uint64_t v59 = MEMORY[0x1E4F1F9F8];
          uint64_t v60 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
          *((_OWORD *)v10 + 7) = *MEMORY[0x1E4F1F9F8];
          *((void *)v10 + 16) = v60;
          uint64_t v61 = *(void *)(v59 + 16);
          *(_OWORD *)(v10 + 136) = *(_OWORD *)v59;
          v155 = v10 + 136;
          v156 = v10 + 112;
          *((void *)v10 + 19) = v61;
          id v62 = objc_alloc_init(MEMORY[0x1E4F61710]);
          v63 = (void *)*((void *)v10 + 2);
          *((void *)v10 + 2) = v62;

          if (!*((void *)v10 + 2)) {
            goto LABEL_16;
          }
          if (!+[VCPVideoInterpolator allowDetectSingleDrop](VCPVideoInterpolator, "allowDetectSingleDrop"))[*((id *)v10 + 2) setSingleDropRecoveryEnabled:0]; {
          if (v10[337])
          }
          {
            [*((id *)v10 + 2) setQualityMode:4];
            [*((id *)v10 + 2) setLowMemoryMode:1];
          }
          else
          {
            objc_msgSend(*((id *)v10 + 2), "setQualityMode:", +[VCPVideoInterpolator getFRCQualityMode](VCPVideoInterpolator, "getFRCQualityMode"));
          }
          if (v9)
          {
            [v9 preferredTransform];
          }
          else
          {
            long long v189 = 0u;
            long long v190 = 0u;
            long long v188 = 0u;
          }
          v64 = (void *)*((void *)v10 + 2);
          v187[0] = v188;
          v187[1] = v189;
          v187[2] = v190;
          [v64 setPreferredTransform:v187];
          if ([*((id *)v10 + 2) startSessionWithUsage:v15] != -22000) {
            goto LABEL_16;
          }
          id v65 = objc_alloc(MEMORY[0x1E4F16378]);
          v66 = [v9 asset];
          uint64_t v67 = [v65 initWithAsset:v66 error:0];
          v68 = (void *)*((void *)v10 + 22);
          *((void *)v10 + 22) = v67;

          *((void *)v10 + 26) = 0;
          uint64_t v69 = [MEMORY[0x1E4F1CA48] array];
          v70 = (void *)*((void *)v10 + 27);
          *((void *)v10 + 27) = v69;

          v18 = v10;
          if (![v10 findIntraFrameList:v9])
          {
            long long v185 = 0u;
            long long v186 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            obunint64_t j = v158;
            uint64_t v71 = [obj countByEnumeratingWithState:&v183 objects:v196 count:16];
            if (v71)
            {
              uint64_t v165 = *(void *)v184;
              do
              {
                for (uint64_t i = 0; i != v71; ++i)
                {
                  if (*(void *)v184 != v165) {
                    objc_enumerationMutation(obj);
                  }
                  v73 = [*(id *)(*((void *)&v183 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
                  id v74 = objc_alloc_init(MEMORY[0x1E4F61720]);
                  CFDictionaryRef v75 = [v73 objectForKeyedSubscript:@"MetaItemPTSResultsKey"];
                  CMTimeMakeFromDictionary(&v182, v75);
                  CMTime v181 = v182;
                  [v74 setPresentationTimeStamp:&v181];

                  [v168 addObject:v74];
                  id v76 = objc_alloc_init(MEMORY[0x1E4F61718]);
                  v77 = [v73 objectForKeyedSubscript:@"MetaOriginalPTSInNanosResults"];
                  objc_msgSend(v76, "setOriginalPTSInNanos:", objc_msgSend(v77, "unsignedIntegerValue"));

                  v78 = [v73 objectForKeyedSubscript:@"MetaPTSInNanosResults"];
                  objc_msgSend(v76, "setPtsInNanos:", objc_msgSend(v78, "unsignedIntegerValue"));

                  v79 = [v73 objectForKeyedSubscript:@"MetaAdjusterRecipeResults"];
                  objc_msgSend(v76, "setSequenceAdjusterRecipe:", objc_msgSend(v79, "unsignedIntegerValue"));

                  v80 = [v73 objectForKeyedSubscript:@"MetaAdjusterDisplacementKey"];
                  objc_msgSend(v76, "setSequenceAdjusterDisplacement:", objc_msgSend(v80, "integerValue"));

                  [v167 addObject:v76];
                }
                uint64_t v71 = [obj countByEnumeratingWithState:&v183 objects:v196 count:16];
              }
              while (v71);
            }

            v81 = (void *)*((void *)v10 + 2);
            id v180 = 0;
            uint64_t v82 = [v81 selectFrameInsertionPointsFromTimingList:v168 metadataList:v167 withError:&v180];
            v21 = v180;
            v83 = (void *)*((void *)v10 + 1);
            *((void *)v10 + 1) = v82;

            if ([v21 code] == -22006)
            {
              if ((int)MediaAnalysisLogLevel() >= 5)
              {
                v84 = VCPLogInstance();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  v85 = [v21 localizedDescription];
                  LODWORD(buf.start.value) = 138412290;
                  *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v85;
                  _os_log_impl(&dword_1BBEDA000, v84, OS_LOG_TYPE_DEFAULT, "FRC gating not passed: %@", (uint8_t *)&buf, 0xCu);
                }
              }
              v26 = v10;
              v27 = v10 + 336;
              goto LABEL_25;
            }
            if ((unint64_t)[*((id *)v10 + 1) count] >= 2)
            {
              v86 = (id *)v10;
              uint64_t v87 = [*((id *)v10 + 1) count];
              unint64_t v88 = 0;
              unint64_t v89 = 0;
              do
              {
                if (v89 >= [v86[1] count]) {
                  break;
                }
                v90 = [v86[1] objectAtIndexedSubscript:v89];
                v91 = v90;
                if (v90) {
                  [v90 presentationTimeStamp];
                }
                else {
                  memset(v179, 0, sizeof(v179));
                }
                int v92 = [v86 isIntraFrame:v179];
                uint64_t v93 = [v91 numberOfFramesToInsert];
                if (v92) {
                  unint64_t v88 = v89;
                }
                BOOL v94 = v93 == 0;

                ++v89;
                v86 = (id *)v166;
              }
              while (v94);
              unint64_t v95 = [v86[1] count];
              if (v95 > v88 + 1)
              {
                do
                {
                  if (v95 < [v86[1] count])
                  {
                    v96 = [v86[1] objectAtIndexedSubscript:v95];
                    v97 = v96;
                    if (v96) {
                      [v96 presentationTimeStamp];
                    }
                    else {
                      memset(v178, 0, sizeof(v178));
                    }
                    int v98 = [v86 isIntraFrame:v178];

                    if (v98) {
                      uint64_t v87 = v95;
                    }
                    v86 = (id *)v166;
                  }
                  v99 = [v86[1] objectAtIndexedSubscript:v95 - 2];
                  BOOL v100 = [v99 numberOfFramesToInsert] == 0;

                  BOOL v101 = --v95 > v88 + 1 && v100;
                  v86 = (id *)v166;
                }
                while (v101);
              }
              v102 = [v86[1] objectAtIndexedSubscript:v88];
              v103 = v102;
              if (v102) {
                [v102 presentationTimeStamp];
              }
              else {
                memset(&buf, 0, 24);
              }
              long long v104 = *(_OWORD *)&buf.start.value;
              *((void *)v156 + 2) = buf.start.epoch;
              *(_OWORD *)v156 = v104;

              v18 = v166;
              if (v87 == [*((id *)v166 + 1) count])
              {
                long long v105 = *MEMORY[0x1E4F1FA10];
                *((void *)v155 + 2) = *(void *)(MEMORY[0x1E4F1FA10] + 16);
                *(_OWORD *)v155 = v105;
              }
              else
              {
                v106 = [*((id *)v166 + 1) objectAtIndexedSubscript:v87];
                v107 = v106;
                if (v106) {
                  [v106 presentationTimeStamp];
                }
                else {
                  memset(&buf, 0, 24);
                }
                long long v108 = *(_OWORD *)&buf.start.value;
                *((void *)v155 + 2) = buf.start.epoch;
                *(_OWORD *)v155 = v108;

                v18 = v166;
              }
              if (v87 - v88 < 2) {
                goto LABEL_24;
              }
              uint64_t v109 = [*((id *)v18 + 1) subarrayWithRange:v88];
              v110 = (void *)*((void *)v18 + 1);
              *((void *)v18 + 1) = v109;

              long long v111 = *(_OWORD *)v156;
              start.CMTimeEpoch epoch = *((void *)v156 + 2);
              *(_OWORD *)&start.value = v111;
              long long v112 = *(_OWORD *)v155;
              lhs.CMTimeEpoch epoch = *((void *)v155 + 2);
              *(_OWORD *)&lhs.value = v112;
              long long v113 = *(_OWORD *)v156;
              rhs.CMTimeEpoch epoch = *((void *)v156 + 2);
              *(_OWORD *)&rhs.value = v113;
              CMTimeSubtract(&duration, &lhs, &rhs);
              CMTimeRangeMake(&buf, &start, &duration);
              long long v114 = *(_OWORD *)&buf.start.value;
              long long v115 = *(_OWORD *)&buf.duration.timescale;
              v157[1] = *(_OWORD *)&buf.start.epoch;
              v157[2] = v115;
              long long *v157 = v114;
              v18 = v166;
              v116 = v162;
              if (v166[337])
              {
                long long v117 = *(_OWORD *)v156;
                uint64_t v175 = *((void *)v156 + 2);
                long long v174 = v117;
                v118 = [v162 asset];
                [v166 getFramePTSAfter:&v174 forAsset:v118];
                CMTimeEpoch v119 = buf.start.epoch;
                *(_OWORD *)(v166 + 296) = *(_OWORD *)&buf.start.value;
                *((void *)v166 + 39) = v119;

                v120 = v166;
                if (v166[338])
                {
                  v121 = [v162 asset];
                  uint64_t v122 = [v166 findDeltaTrack:v121];
                  v123 = (void *)*((void *)v166 + 25);
                  *((void *)v166 + 25) = v122;

                  uint64_t v124 = *((void *)v166 + 25);
                  long long v125 = *v157;
                  long long v126 = v157[2];
                  v173[1] = v157[1];
                  v173[2] = v126;
                  v173[0] = v125;
                  uint64_t v127 = [v166 createDeltaTrackDecoder:v124 timerange:v173];
                  v128 = (void *)*((void *)v166 + 31);
                  *((void *)v166 + 31) = v127;

                  v120 = v166;
                }
                uint64_t v129 = [objc_alloc(MEMORY[0x1E4F55F08]) initWithOptionalMetalCommandQueue:0 useCase:0];
                v130 = (void *)*((void *)v120 + 28);
                *((void *)v120 + 28) = v129;

                v18 = v166;
                v131 = (void *)*((void *)v166 + 40);
                long long v132 = *v157;
                long long v133 = v157[2];
                v172[1] = v157[1];
                v172[2] = v133;
                v172[0] = v132;
                v116 = v162;
                [v131 setTimeRange:v172];
                if ([v166 setupAdditionalAuxTrack]) {
                  goto LABEL_24;
                }
              }
              v134 = (void *)*((void *)v18 + 22);
              long long v135 = *v157;
              long long v136 = v157[2];
              v171[1] = v157[1];
              v171[2] = v136;
              v171[0] = v135;
              [v134 setTimeRange:v171];
              v137 = [v116 asset];
              int v138 = [v18 setupLivePhotoInfoOutput:v137];

              if (!v138)
              {
                v139 = v162;
                v140 = (id *)v166;
                uint64_t v141 = [obj count];
                uint64_t v142 = 0;
                for (unint64_t j = 0; j < [v140[1] count] - 1; ++j)
                {
                  v144 = [v140[1] objectAtIndexedSubscript:j];
                  uint64_t v145 = [v144 numberOfFramesToInsert];

                  v142 += v145;
                  v139 = v162;
                  v140 = (id *)v166;
                }
                [v139 estimatedDataRate];
                float v147 = v146;
                v148 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v140[20]];
                uint64_t v149 = +[VCPMovieAssetWriter assetWriterWithURL:andTrack:andBitrate:withOutputSize:enableAudio:enableStyle:hasStyleApplied:](VCPMovieAssetWriter, "assetWriterWithURL:andTrack:andBitrate:withOutputSize:enableAudio:enableStyle:hasStyleApplied:", v148, v139, (uint64_t)fminf((float)(v147 * (float)(v142 + v141)) / (float)v141, 25000000.0), 1, *((unsigned __int8 *)v140 + 337), *((unsigned __int8 *)v140 + 338), *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
                id v150 = v140[6];
                v140[6] = (id)v149;

                id v151 = v140[6];
                if (v151)
                {
                  if (![v151 dispatchEncoding])
                  {
                    v152 = (void *)*((void *)v166 + 6);
                    long long v153 = *(_OWORD *)v154;
                    uint64_t v170 = *((void *)v154 + 2);
                    long long v169 = v153;
                    [v152 updateStillPTS:&v169];
                    v26 = v166;
                    goto LABEL_26;
                  }
                }
              }
            }
            goto LABEL_17;
          }
        }
      }
    }
    v21 = 0;
    goto LABEL_24;
  }
  v11 = 0;
LABEL_31:

  return v11;
}

- (id)createDeltaTrackDecoder:(id)a3 timerange:(id *)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [NSNumber numberWithUnsignedInt:758670896];
  v14[0] = v6;
  v7 = [NSNumber numberWithUnsignedInt:758674992];
  v14[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  uint64_t v12 = *MEMORY[0x1E4F24D70];
  double v13 = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10 = [[VCPVideoTrackStandardDecoder alloc] initWithTrack:v5 timerange:a4 withSettings:v9 applyTransform:0];

  return v10;
}

- (id)findDeltaTrack:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [a3 tracksWithMediaType:*MEMORY[0x1E4F15BB8]];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v3)
  {
    uint64_t v20 = *MEMORY[0x1E4F15D20];
    uint64_t v21 = *(void *)v28;
    uint64_t v18 = *MEMORY[0x1E4F15E00];
    uint64_t v19 = *MEMORY[0x1E4F15EC0];
    do
    {
      uint64_t v17 = v3;
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1E4F16558];
        v7 = objc_msgSend(v5, "metadataForFormat:", v20, v17);
        id v8 = [v6 metadataItemsFromArray:v7 withKey:v19 keySpace:v18];

        if (v8)
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v24 != v11) {
                  objc_enumerationMutation(v9);
                }
                double v13 = [*(id *)(*((void *)&v23 + 1) + 8 * j) stringValue];
                char v14 = [v13 isEqualToString:@"com.apple.quicktime.video-map.smart-style-delta-map"];

                if (v14)
                {
                  id v15 = v5;

                  goto LABEL_21;
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      id v15 = 0;
    }
    while (v3);
  }
  else
  {
    id v15 = 0;
  }
LABEL_21:

  return v15;
}

- (id)findStyleInfoTrack:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E4F15BE0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "formatDescriptions", (void)v12);
        id v9 = [v8 firstObject];

        if (v9)
        {
          uint64_t v10 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v9);
          if ([v10 containsObject:@"mdta/com.apple.quicktime.smartstyle-info"])
          {
            id v4 = v7;

            goto LABEL_13;
          }
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)findLivePhotoInfoOutput:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E4F15BE0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = *MEMORY[0x1E4F52790];
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "formatDescriptions", (void)v13);
        uint64_t v10 = [v9 firstObject];

        if (v10)
        {
          uint64_t v11 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v10);
          if ([v11 containsObject:v6])
          {
            id v4 = v8;

            goto LABEL_13;
          }
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (int)setupLivePhotoInfoOutput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VCPVideoInterpolator *)self findLivePhotoInfoOutput:v4];
  uint64_t v6 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v5 outputSettings:0];
  livePhotoInfoOutput = self->_livePhotoInfoOutput;
  self->_livePhotoInfoOutput = v6;

  if ([(AVAssetReader *)self->_assetReader canAddOutput:self->_livePhotoInfoOutput])
  {
    [(AVAssetReader *)self->_assetReader addOutput:self->_livePhotoInfoOutput];
    if ([(AVAssetReader *)self->_assetReader startReading]) {
      int v8 = 0;
    }
    else {
      int v8 = -19;
    }
  }
  else
  {
    int v8 = -18;
  }

  return v8;
}

- (int)findIntraFrameList:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  long long v23 = [v24 formatDescriptions];
  if ([v23 count] == 1)
  {
    id v3 = [v23 objectAtIndexedSubscript:0];

    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v3);
    id v5 = objc_alloc(MEMORY[0x1E4F16378]);
    uint64_t v6 = [v24 asset];
    v22 = (void *)[v5 initWithAsset:v6 error:0];

    long long v25 = [MEMORY[0x1E4F16398] assetReaderSampleReferenceOutputWithTrack:v24];
    if (objc_msgSend(v22, "canAddOutput:"))
    {
      [v22 addOutput:v25];
      if ([v22 startReading])
      {
        uint64_t v7 = *MEMORY[0x1E4F1F1D8];
        uint64_t v8 = *MEMORY[0x1E4F1F1A8];
        while (1)
        {
          id v9 = (opaqueCMSampleBuffer *)objc_msgSend(v25, "copyNextSampleBuffer", v22);
          uint64_t v10 = v9;
          if (!v9) {
            break;
          }
          sCMTimeRange buf = v9;
          if (CMSampleBufferGetNumSamples(v9))
          {
            uint64_t v11 = CMSampleBufferGetSampleAttachmentsArray(v10, 1u);
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            obuint64_t j = v11;
            uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v31 != v13) {
                    objc_enumerationMutation(obj);
                  }
                  long long v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                  long long v16 = [v15 objectForKeyedSubscript:v7];
                  uint64_t v17 = [v15 objectForKeyedSubscript:v8];
                  uint64_t v18 = v17;
                  if (MediaSubType == 1752589105 && v16
                    || MediaSubType != 1752589105 && v17 && ![v17 intValue])
                  {
                    memset(&v29, 0, sizeof(v29));
                    CMSampleBufferGetOutputPresentationTimeStamp(&v29, sbuf);
                    intraFrameList = self->_intraFrameList;
                    CMTime time = v29;
                    CFDictionaryRef v20 = CMTimeCopyAsDictionary(&time, 0);
                    [(NSMutableArray *)intraFrameList addObject:v20];
                  }
                }
                uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
              }
              while (v12);
            }
          }
          CFRelease(sbuf);
        }
      }
      else
      {
        LODWORD(v10) = -19;
      }
    }
    else
    {
      LODWORD(v10) = -18;
    }
  }
  else
  {
    LODWORD(v10) = -18;
  }

  return (int)v10;
}

- (void)dealloc
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ([(VCPMovieAssetWriter *)self->_assetWriter status] == 1) {
    [(VCPMovieAssetWriter *)self->_assetWriter cancel];
  }
  previousMetadata = self->_previousMetadata;
  if (previousMetadata)
  {
    CFRelease(previousMetadata);
    self->_previousMetadata = 0;
  }
  if (self->_hasStyleApplied)
  {
    previousDeltaSample = self->_previousDeltaSample;
    if (previousDeltaSample)
    {
      CFRelease(previousDeltaSample);
      self->_previousDeltaSample = 0;
    }
  }
  [(AVAssetReader *)self->_assetReader cancelReading];
  if (self->_processAborted)
  {
    frameInterpolator = self->_frameInterpolator;
    if (frameInterpolator) {
      [(FRCFrameInterpolator *)frameInterpolator endSession];
    }
  }
  if (self->_cancelled)
  {
    uint64_t v6 = *MEMORY[0x1E4F616F0];
    v15[0] = @"FRCGatingStatusField";
    v15[1] = v6;
    v16[0] = &unk_1F15EB6A0;
    v16[1] = &unk_1F15EB6A0;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    uint64_t v8 = [(FRCFrameInterpolator *)self->_frameInterpolator sessionStatistics];
    id v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F616F0]];
    [v9 setObject:v10 forKeyedSubscript:@"FRCGatingStatusField"];

    uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F616E8]];
    [v9 setObject:v11 forKeyedSubscript:@"FRCGatingCauseField"];

    uint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F616F8]];
    [v9 setObject:v12 forKeyedSubscript:@"FRCLivePhotoBurstDropDurationKeyField"];

    uint64_t v7 = (void *)[v9 copy];
  }
  uint64_t v13 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v13 sendEvent:@"com.apple.mediaanalysisd.livePhotoFillingGaps" withAnalytics:v7];

  v14.receiver = self;
  v14.super_class = (Class)VCPVideoInterpolator;
  [(VCPVideoInterpolator *)&v14 dealloc];
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  v259[1] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1C186D320](self, a2, a3, a4, a5, a6);
  uint64_t v10 = v9;
  if (self->_processAborted)
  {
    return 0;
  }
  p_previousFrame = (id *)&self->_previousFrame;
  if (!self->_previousFrame)
  {
    uint64_t v18 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:0];
    uint64_t v19 = v18;
    if (v18) {
      [v18 presentationTimeStamp];
    }
    else {
      memset(&time1, 0, 24);
    }
    *(_OWORD *)&self->_anchorPTS.value = *(_OWORD *)&time1.start.value;
    self->_anchorPTS.int64_t epoch = time1.start.epoch;

    id v20 = objc_alloc(MEMORY[0x1E4F61700]);
    long long v240 = *(_OWORD *)&self->_anchorPTS.value;
    int64_t epoch = self->_anchorPTS.epoch;
    uint64_t v21 = [v20 initWithBuffer:a3 presentationTimeStamp:&v240];
    id v22 = *p_previousFrame;
    id *p_previousFrame = (id)v21;

    self->_unint64_t anchorIndex = 0;
    for (uint64_t i = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_livePhotoInfoOutput copyNextSampleBuffer];
          ;
          uint64_t i = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_livePhotoInfoOutput copyNextSampleBuffer])
    {
      p_previousMetadata = &self->_previousMetadata;
      self->_previousMetadata = i;
      if (!i) {
        goto LABEL_29;
      }
      CMItemCount NumSamples = CMSampleBufferGetNumSamples(i);
      long long v26 = *p_previousMetadata;
      if (NumSamples) {
        break;
      }
      if (v26)
      {
        CFRelease(v26);
        *p_previousMetadata = 0;
      }
    }
    if (!v26)
    {
LABEL_29:
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_67;
      }
      long long v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(time1.start.value) = 0;
        uint64_t v17 = "Inconsistent number of metadata and video frames";
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    CMSampleBufferGetOutputPresentationTimeStamp(&rhs, v26);
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0;
    time1.start.int64_t epoch = a4->var3;
    CMTime time2 = rhs;
    if (CMTimeCompare(&time1.start, &time2))
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_67;
      }
      long long v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(time1.start.value) = 0;
        uint64_t v17 = "Inconsistent live photo info and video frame timestamp";
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (self->_enableStyle)
    {
      if (self->_hasStyleApplied)
      {
        long long v33 = [(VCPVideoTrackDecoder *)self->_deltaTrackDecoder copyNextSampleBuffer];
        self->_previousDeltaSample = v33;
        if (!v33)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            long long v16 = VCPLogInstance();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              goto LABEL_33;
            }
            LOWORD(time1.start.value) = 0;
            uint64_t v17 = "Number of frames inconsistent with delta map samples";
            goto LABEL_32;
          }
          goto LABEL_67;
        }
      }
      v34 = [(NSArray *)self->_smartStyleMetadata objectAtIndexedSubscript:0];
      v35 = [v34 objectForKeyedSubscript:@"attributes"];
      CFDataRef v36 = [v35 objectForKeyedSubscript:@"MetaSSInfoResults"];
      obuint64_t j = (id)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v36, 2uLL, 0, 0);

      if (!obj)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          long long v16 = VCPLogInstance();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_33;
          }
          LOWORD(time1.start.value) = 0;
          uint64_t v17 = "Missing metadata";
          goto LABEL_32;
        }
        goto LABEL_67;
      }
      objc_storeStrong((id *)&self->_previousSmartStyleMetadata, obj);
      if (!self->_hasStyleApplied)
      {
        id v192 = 0;
        int v27 = 0;
        int v28 = 0;
        int v29 = 1;
        goto LABEL_36;
      }
      v37 = [(VCPVideoInterpolator *)self revertStyle:a3 withMetadata:obj withDeltaMap:CMSampleBufferGetImageBuffer(self->_previousDeltaSample)];
      if (!v37)
      {
        long long v30 = obj;
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          long long v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            LOWORD(time1.start.value) = 0;
            _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Unable to compute unstyled buffer", (uint8_t *)&time1, 2u);
          }
          goto LABEL_34;
        }
LABEL_68:
        id v192 = 0;
        int v27 = 0;
        int v28 = -18;
LABEL_69:
        int v29 = 1;
        goto LABEL_70;
      }
      id v38 = objc_alloc(MEMORY[0x1E4F61700]);
      long long v238 = *(_OWORD *)&self->_anchorPTS.value;
      int64_t v239 = self->_anchorPTS.epoch;
      v39 = (FRCFrame *)[v38 initWithBuffer:v37 presentationTimeStamp:&v238];
      previousUnstyledFrame = self->_previousUnstyledFrame;
      self->_previousUnstyledFrame = v39;

      long long v30 = obj;
      CFRelease(v37);
    }
    else
    {
      long long v30 = 0;
    }
    id v192 = 0;
    int v27 = 0;
    int v28 = 0;
    goto LABEL_69;
  }
  unint64_t anchorIndex = self->_anchorIndex;
  if (anchorIndex + 1 < [(NSArray *)self->_frameInsertionLists count])
  {
    uint64_t v14 = [(AVAssetReaderTrackOutput *)self->_livePhotoInfoOutput copyNextSampleBuffer];
    if (v14)
    {
      long long v15 = (void *)v14;
      while (!CMSampleBufferGetNumSamples((CMSampleBufferRef)v15))
      {
        CFRelease(v15);
        long long v15 = (void *)[(AVAssetReaderTrackOutput *)self->_livePhotoInfoOutput copyNextSampleBuffer];
        if (!v15) {
          goto LABEL_9;
        }
      }
      CMSampleBufferGetOutputPresentationTimeStamp(&rhs, (CMSampleBufferRef)v15);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0;
      time1.start.int64_t epoch = a4->var3;
      CMTime time2 = rhs;
      if (CMTimeCompare(&time1.start, &time2))
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          long long v16 = VCPLogInstance();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_33;
          }
          LOWORD(time1.start.value) = 0;
          uint64_t v17 = "Inconsistent live photo info and video frame timestamp";
          goto LABEL_32;
        }
        goto LABEL_67;
      }
      long long v31 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex];
      long long v32 = v31;
      if (v31) {
        [v31 presentationTimeStamp];
      }
      else {
        memset(&rhs, 0, sizeof(rhs));
      }
      p_stillPTS = &self->_stillPTS;
      time1.CMTime start = rhs;
      CMTime time2 = (CMTime)self->_stillPTS;
      if (CMTimeCompare(&time1.start, &time2) < 1)
      {
        v42 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex + 1];
        id v193 = v42;
        if (v42) {
          [v42 presentationTimeStamp];
        }
        else {
          memset(&v237, 0, sizeof(v237));
        }
        time1.CMTime start = v237;
        *(_OWORD *)&time2.value = *(_OWORD *)&p_stillPTS->value;
        time2.int64_t epoch = self->_stillPTS.epoch;
        BOOL obja = CMTimeCompare(&time1.start, &time2) > 0;

        if (obja)
        {
          *(_OWORD *)&time1.start.value = *(_OWORD *)&self->_anchorPTS.value;
          time1.start.int64_t epoch = self->_anchorPTS.epoch;
          *(_OWORD *)&time2.value = *(_OWORD *)&p_stillPTS->value;
          time2.int64_t epoch = self->_stillPTS.epoch;
          CMTimeAdd(&v237, &time1.start, &time2);
          v43 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex];
          v44 = v43;
          if (v43) {
            [v43 presentationTimeStamp];
          }
          else {
            memset(&v236, 0, sizeof(v236));
          }
          time1.CMTime start = v237;
          CMTime time2 = v236;
          CMTimeSubtract(&rhs, &time1.start, &time2);
          *(_OWORD *)&p_stillPTS->value = *(_OWORD *)&rhs.value;
          self->_stillPTS.int64_t epoch = rhs.epoch;

          assetWriter = self->_assetWriter;
          long long v234 = *(_OWORD *)&p_stillPTS->value;
          int64_t v235 = self->_stillPTS.epoch;
          [(VCPMovieAssetWriter *)assetWriter updateStillPTS:&v234];
        }
      }
      else
      {
      }
      uint64_t v46 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex];
      memset(&v237, 0, sizeof(v237));
      long long v189 = v46;
      if (v46) {
        [v46 interpolatedFrameDuration];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      int v47 = [v189 numberOfFramesToInsert];
      time1.CMTime start = time2;
      CMTimeMultiply(&v237, &time1.start, v47 + 1);
      id v48 = objc_alloc(MEMORY[0x1E4F61700]);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&self->_anchorPTS.value;
      p_anchorPTS = &self->_anchorPTS;
      time1.start.int64_t epoch = self->_anchorPTS.epoch;
      CMTime time2 = v237;
      CMTimeAdd(&v233, &time1.start, &time2);
      id v182 = (id)[v48 initWithBuffer:a3 presentationTimeStamp:&v233];
      if (self->_enableStyle)
      {
        if (self->_hasStyleApplied)
        {
          sCMTimeRange buf = [(VCPVideoTrackDecoder *)self->_deltaTrackDecoder copyNextSampleBuffer];
          if (!sbuf)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v49 = VCPLogInstance();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                LOWORD(time1.start.value) = 0;
                id v50 = "Number of frames inconsistent with delta map samples";
LABEL_104:
                _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_ERROR, v50, (uint8_t *)&time1, 2u);
                goto LABEL_105;
              }
              goto LABEL_105;
            }
            goto LABEL_107;
          }
        }
        else
        {
          sCMTimeRange buf = 0;
        }
        unint64_t v59 = self->_anchorIndex;
        if (v59 + 1 >= [(NSArray *)self->_smartStyleMetadata count])
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v49 = VCPLogInstance();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              LOWORD(time1.start.value) = 0;
              id v50 = "Number of frames inconsistent with smart style metadata";
              goto LABEL_104;
            }
LABEL_105:
            obuint64_t j = 0;
LABEL_106:
            id v192 = 0;
            int v27 = 0;
            int v28 = -18;
            int v29 = 1;
LABEL_146:

            goto LABEL_147;
          }
          goto LABEL_107;
        }
        id v185 = [(NSArray *)self->_smartStyleMetadata objectAtIndexedSubscript:self->_anchorIndex + 1];
        uint64_t v60 = [v185 objectForKeyedSubscript:@"attributes"];
        CFDataRef v61 = [v60 objectForKeyedSubscript:@"MetaSSInfoResults"];
        obuint64_t j = (id)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v61, 2uLL, 0, 0);

        if (!obj)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v49 = VCPLogInstance();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              LOWORD(time1.start.value) = 0;
              id v50 = "Missing metadata";
              goto LABEL_104;
            }
            goto LABEL_105;
          }
LABEL_107:
          obuint64_t j = 0;
          goto LABEL_108;
        }
        if (self->_hasStyleApplied)
        {
          id v62 = [(VCPVideoInterpolator *)self revertStyle:a3 withMetadata:obj withDeltaMap:CMSampleBufferGetImageBuffer(sbuf)];
          if (!v62)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v49 = VCPLogInstance();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                LOWORD(time1.start.value) = 0;
                _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_ERROR, "Unable to compute unstyled buffer", (uint8_t *)&time1, 2u);
              }
              goto LABEL_106;
            }
LABEL_108:
            id v192 = 0;
            int v27 = 0;
            int v28 = -18;
            int v29 = 1;
LABEL_147:

            long long v16 = v189;
            goto LABEL_35;
          }
          id v63 = objc_alloc(MEMORY[0x1E4F61700]);
          *(_OWORD *)&time1.start.value = *(_OWORD *)&p_anchorPTS->value;
          time1.start.int64_t epoch = self->_anchorPTS.epoch;
          CMTime time2 = v237;
          CMTimeAdd(&v232, &time1.start, &time2);
          uint64_t v64 = [v63 initWithBuffer:v62 presentationTimeStamp:&v232];
          CFRelease(v62);
          id v192 = (id)v64;
LABEL_86:
          if (![v189 numberOfFramesToInsert])
          {
            v173 = 0;
            long long v174 = 0;
            uint64_t v54 = 0;
            goto LABEL_121;
          }
          frameInterpolator = self->_frameInterpolator;
          id v52 = *p_previousFrame;
          v53 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex];
          id v231 = 0;
          id v180 = -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:numberOfFrames:withError:](frameInterpolator, "interpolateBetweenFirstFrame:secondFrame:numberOfFrames:withError:", v52, v182, [v53 numberOfFramesToInsert], &v231);
          id v184 = v231;

          if (self->_enableStyle)
          {
            uint64_t v54 = v180;
            if (self->_hasStyleApplied)
            {
              [(FRCFrameInterpolator *)self->_frameInterpolator pauseGatingForNextPair];
              v176 = self->_frameInterpolator;
              v55 = self->_previousUnstyledFrame;
              v56 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex];
              id v230 = v184;
              uint64_t v183 = -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:numberOfFrames:withError:](v176, "interpolateBetweenFirstFrame:secondFrame:numberOfFrames:withError:", v55, v192, [v56 numberOfFramesToInsert], &v230);
              id v57 = v230;

              v58 = v57;
              uint64_t v54 = v180;
LABEL_112:
              id v186 = v58;
              if ([v58 code] == -22006)
              {
                self->_processAborted = 1;
                if ((int)MediaAnalysisLogLevel() >= 5)
                {
                  id v65 = VCPLogInstance();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                  {
                    v66 = [v186 localizedDescription];
                    LODWORD(time1.start.value) = 138412290;
                    *(CMTimeValue *)((char *)&time1.start.value + 4) = (CMTimeValue)v66;
                    _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_DEFAULT, "FRC gating not passed: %@", (uint8_t *)&time1, 0xCu);
                  }
                }
                [(VCPMovieAssetWriter *)self->_assetWriter cancel];
                CFRelease(v15);
                int v27 = 0;
                int v29 = 1;
                if (self->_enableStyle && sbuf)
                {
                  CFRelease(sbuf);
                  int v27 = 0;
                  int v28 = 0;
                }
                else
                {
                  int v28 = 0;
                }
                goto LABEL_145;
              }
              v173 = (void *)v183;
              long long v174 = v186;
LABEL_121:
              id v180 = v54;
              uint64_t v172 = [v54 count];
              uint64_t v229 = 0;
              uint64_t v67 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex];
              v68 = v67;
              if (v67) {
                [v67 presentationTimeStamp];
              }
              else {
                memset(v228, 0, sizeof(v228));
              }
              if ([(VCPVideoInterpolator *)self isIntraFrame:v228])
              {
                uint64_t v258 = *MEMORY[0x1E4F1F288];
                v259[0] = MEMORY[0x1E4F1CC38];
                id v177 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v259 forKeys:&v258 count:1];
              }
              else
              {
                id v177 = 0;
              }

              uint64_t v69 = self->_assetWriter;
              v70 = v177;
              uint64_t v71 = [*p_previousFrame buffer];
              if (*p_previousFrame) {
                [*p_previousFrame presentationTimeStamp];
              }
              else {
                memset(v227, 0, sizeof(v227));
              }
              int v27 = [(VCPMovieAssetWriter *)v69 addPixelBuffer:v71 withTime:v227 withAttachment:v177];
              if (v27) {
                goto LABEL_140;
              }
              previousMetadata = self->_previousMetadata;
              if (*p_previousFrame) {
                [*p_previousFrame presentationTimeStamp];
              }
              else {
                memset(v226, 0, sizeof(v226));
              }
              int v27 = [(VCPVideoInterpolator *)self updateLivePhotoInfoSample:previousMetadata withTimestamp:v226 withMetadata:0 isInterpolated:0 updatedSample:&v229];
              if (v27) {
                goto LABEL_140;
              }
              int v27 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:v229];
              if (v27) {
                goto LABEL_140;
              }
              if (self->_enableStyle)
              {
                if (self->_hasStyleApplied)
                {
                  v73 = self->_assetWriter;
                  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(self->_previousDeltaSample);
                  if (*p_previousFrame) {
                    [*p_previousFrame presentationTimeStamp];
                  }
                  else {
                    memset(v225, 0, sizeof(v225));
                  }
                  int v27 = [(VCPMovieAssetWriter *)v73 addAuxPixelBuffer:ImageBuffer withTime:v225 withAttachment:v177];
                  if (v27) {
                    goto LABEL_140;
                  }
                }
                memset(&time1, 0, sizeof(time1));
                if (*p_previousFrame) {
                  [*p_previousFrame presentationTimeStamp];
                }
                else {
                  memset(&start, 0, sizeof(start));
                }
                CMTimeMake(&duration, 20, 600);
                CMTimeRangeMake(&time1, &start, &duration);
                previousSmartStyleMetadata = self->_previousSmartStyleMetadata;
                CMTimeRange v222 = time1;
                uint64_t v76 = [(VCPVideoInterpolator *)self createStyleInforMetadata:previousSmartStyleMetadata timerange:&v222];
                v77 = self->_assetWriter;
                CMTimeRange v221 = time1;
                uint64_t v165 = (void *)v76;
                int v27 = [(VCPMovieAssetWriter *)v77 addStyleInfoData:v76 timerange:&v221];
                if (v27) {
                  goto LABEL_161;
                }
                CMTime time2 = (CMTime)self->_previousFrameOrigianlPTS;
                CMTime rhs = (CMTime)self->_nextAuxSamplePTS;
                p_nextAuxSamplePTS = &self->_nextAuxSamplePTS;
                int32_t v78 = CMTimeCompare(&time2, &rhs);
                auxInputToOutputMap = self->_auxInputToOutputMap;
                if (v78 < 0)
                {
                  id v187 = [(NSMapTable *)auxInputToOutputMap objectForKey:@"com.apple.quicktime.video-map.smart-style-linear-thumbnail"];
                  while (1)
                  {
                    v86 = (opaqueCMSampleBuffer *)[v187 copyNextSampleBuffer];
                    uint64_t v87 = v86;
                    if (!v86) {
                      goto LABEL_187;
                    }
                    if (CMSampleBufferGetNumSamples(v86)) {
                      break;
                    }
                    CFRelease(v87);
                  }
                  if (*p_previousFrame) {
                    [*p_previousFrame presentationTimeStamp];
                  }
                  else {
                    memset(&v214, 0, sizeof(v214));
                  }
                  CMSampleBufferSetOutputPresentationTimeStamp(v87, &v214);
                  int v27 = [(VCPMovieAssetWriter *)self->_assetWriter addAdditionalAuxTracks:v87 toTrack:@"com.apple.quicktime.video-map.smart-style-linear-thumbnail"];
                  if (v27) {
                    goto LABEL_186;
                  }
                }
                else
                {
                  id v187 = [(NSMapTable *)auxInputToOutputMap keyEnumerator];
                  v80 = 0;
                  while (2)
                  {
                    v81 = [v187 nextObject];

                    if (v81)
                    {
                      uint64_t v82 = [(NSMapTable *)self->_auxInputToOutputMap objectForKey:v81];
                      while (1)
                      {
                        v83 = (opaqueCMSampleBuffer *)[v82 copyNextSampleBuffer];
                        v84 = v83;
                        if (!v83) {
                          goto LABEL_176;
                        }
                        if (CMSampleBufferGetNumSamples(v83)) {
                          break;
                        }
                        CFRelease(v84);
                      }
                      CMSampleBufferGetDuration(&v219, v84);
                      CMSampleBufferGetOutputPresentationTimeStamp(&v218, v84);
                      CMTime time2 = v219;
                      CMTime rhs = v218;
                      CMTimeAdd(&v220, &time2, &rhs);
                      *(_OWORD *)&time2.value = *(_OWORD *)&p_nextAuxSamplePTS->value;
                      time2.int64_t epoch = self->_nextAuxSamplePTS.epoch;
                      CMTime rhs = v220;
                      if (CMTimeCompare(&time2, &rhs) < 0)
                      {
                        CMSampleBufferGetDuration(&v217, v84);
                        CMSampleBufferGetOutputPresentationTimeStamp(&v216, v84);
                        CMTime time2 = v217;
                        CMTime rhs = v216;
                        CMTimeAdd(&v236, &time2, &rhs);
                        v85 = &self->_nextAuxSamplePTS;
                      }
                      else
                      {
                        v85 = &self->_nextAuxSamplePTS;
                        *(_OWORD *)&v236.value = *(_OWORD *)&p_nextAuxSamplePTS->value;
                        v236.int64_t epoch = self->_nextAuxSamplePTS.epoch;
                      }
                      *(CMTime *)v85 = v236;
                      if (*p_previousFrame) {
                        [*p_previousFrame presentationTimeStamp];
                      }
                      else {
                        memset(&outputPresentationTimeStamp, 0, sizeof(outputPresentationTimeStamp));
                      }
                      CMSampleBufferSetOutputPresentationTimeStamp(v84, &outputPresentationTimeStamp);
                      int v27 = [(VCPMovieAssetWriter *)self->_assetWriter addAdditionalAuxTracks:v84 toTrack:v81];
                      if (!v27)
                      {
LABEL_176:

                        v80 = v81;
                        continue;
                      }

LABEL_186:
LABEL_161:

LABEL_209:
                      v70 = v177;
LABEL_140:
                      self->_processAborted = 1;
                      CFRelease(v15);
                      if (self->_hasStyleApplied && sbuf) {
                        CFRelease(sbuf);
                      }
                      [(VCPMovieAssetWriter *)self->_assetWriter cancel];
                      int v29 = 0;
                      id v186 = v174;
                      goto LABEL_144;
                    }
                    break;
                  }
                }
LABEL_187:
              }
              if (v172)
              {
                id v156 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v171 = [(VCPVideoInterpolator *)self deserializeMetadata:self->_previousMetadata];
                if (v171)
                {
                  unint64_t v88 = objc_msgSend(v171, "objectForKeyedSubscript:");
                  BOOL v89 = v88 == 0;

                  if (!v89)
                  {
                    v255[0] = *MEMORY[0x1E4F6F350];
                    if (*p_previousFrame) {
                      [*p_previousFrame presentationTimeStamp];
                    }
                    else {
                      memset(&v213, 0, sizeof(v213));
                    }
                    v97 = CMTimeToNSDictionary(&v213);
                    v256[0] = v97;
                    int v98 = (void *)MEMORY[0x1E4F6F348];
                    v255[1] = *MEMORY[0x1E4F6F348];
                    v99 = [v171 objectForKeyedSubscript:@"trajectoryHomography"];
                    v256[1] = v99;
                    v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v256 forKeys:v255 count:2];

                    uint64_t v170 = [(VCPVideoInterpolator *)self deserializeMetadata:v15];
                    if (v170)
                    {
                      BOOL v100 = [v170 objectForKeyedSubscript:@"trajectoryHomography"];
                      BOOL v101 = v100 == 0;

                      if (!v101)
                      {
                        v253[0] = *MEMORY[0x1E4F6F350];
                        if (v182) {
                          [v182 presentationTimeStamp];
                        }
                        else {
                          memset(&v212, 0, sizeof(v212));
                        }
                        v102 = CMTimeToNSDictionary(&v212);
                        v253[1] = *v98;
                        v254[0] = v102;
                        v103 = [v170 objectForKeyedSubscript:@"trajectoryHomography"];
                        v254[1] = v103;
                        id v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v254 forKeys:v253 count:2];

                        v252[0] = v154;
                        v252[1] = v151;
                        id v150 = [MEMORY[0x1E4F1C978] arrayWithObjects:v252 count:2];
                        id v157 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        for (uint64_t j = 0; j != v172; ++j)
                        {
                          long long v105 = [v180 objectAtIndexedSubscript:j];
                          v106 = v105;
                          if (v105) {
                            [v105 presentationTimeStamp];
                          }
                          else {
                            memset(&v211, 0, sizeof(v211));
                          }
                          v107 = CMTimeToNSDictionary(&v211);
                          [v157 addObject:v107];
                        }
                        id v164 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        long long v108 = [v171 allKeys];
                        unint64_t v109 = [v108 count];
                        v110 = [v170 allKeys];
                        BOOL v111 = v109 > [v110 count];

                        if (v111)
                        {
                          long long v209 = 0uLL;
                          long long v210 = 0uLL;
                          long long v207 = 0uLL;
                          long long v208 = 0uLL;
                          id v188 = v171;
                          uint64_t v166 = [v188 countByEnumeratingWithState:&v207 objects:v251 count:16];
                          if (v166)
                          {
                            CFTypeRef cf = *(CFTypeRef *)v208;
                            do
                            {
                              for (uint64_t k = 0; k != v166; ++k)
                              {
                                if (*(CFTypeRef *)v208 != cf) {
                                  objc_enumerationMutation(v188);
                                }
                                uint64_t v113 = *(void *)(*((void *)&v207 + 1) + 8 * k);
                                long long v114 = [v170 allKeys];
                                char v115 = [v114 containsObject:v113];

                                if ((v115 & 1) == 0) {
                                  [v164 addObject:v113];
                                }
                              }
                              uint64_t v166 = [v188 countByEnumeratingWithState:&v207 objects:v251 count:16];
                            }
                            while (v166);
                          }
                        }
                        else
                        {
                          long long v205 = 0uLL;
                          long long v206 = 0uLL;
                          long long v203 = 0uLL;
                          long long v204 = 0uLL;
                          id v188 = v170;
                          uint64_t v167 = [v188 countByEnumeratingWithState:&v203 objects:v250 count:16];
                          if (v167)
                          {
                            CFTypeRef cfa = *(CFTypeRef *)v204;
                            do
                            {
                              for (uint64_t m = 0; m != v167; ++m)
                              {
                                if (*(CFTypeRef *)v204 != cfa) {
                                  objc_enumerationMutation(v188);
                                }
                                uint64_t v117 = *(void *)(*((void *)&v203 + 1) + 8 * m);
                                v118 = [v171 allKeys];
                                char v119 = [v118 containsObject:v117];

                                if ((v119 & 1) == 0) {
                                  [v164 addObject:v117];
                                }
                              }
                              uint64_t v167 = [v188 countByEnumeratingWithState:&v203 objects:v250 count:16];
                            }
                            while (v167);
                          }
                        }

                        [v188 removeObjectsForKeys:v164];
                        uint64_t v120 = *MEMORY[0x1E4F6F360];
                        v248[0] = *MEMORY[0x1E4F6F358];
                        v248[1] = v120;
                        v249[0] = MEMORY[0x1E4F1CC38];
                        v249[1] = MEMORY[0x1E4F1CC38];
                        uint64_t v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v249 forKeys:v248 count:2];
                        v202[9] = v174;
                        v168 = ICFillHomographyGaps();
                        id v186 = v174;

                        if ([v168 count] == v172)
                        {
                          if (*p_previousFrame) {
                            [*p_previousFrame presentationTimeStamp];
                          }
                          else {
                            memset(&v202[6], 0, 24);
                          }
                          if (v182) {
                            [v182 presentationTimeStamp];
                          }
                          else {
                            memset(&v202[3], 0, 24);
                          }
                          uint64_t v175 = alInterpolateMetadataForGap();
                          if ([v175 count] == v172)
                          {
                            for (uint64_t n = 0; n != v172; ++n)
                            {
                              uint64_t v122 = [MEMORY[0x1E4F1CA60] dictionary];
                              v123 = [v175 objectAtIndexedSubscript:n];
                              [v122 addEntriesFromDictionary:v123];

                              uint64_t v124 = [v168 objectAtIndexedSubscript:n];
                              [v122 addEntriesFromDictionary:v124];

                              [v156 addObject:v122];
                            }
                            uint64_t v125 = 0;
                            uint64_t v126 = *MEMORY[0x1E4F1F2B0];
                            do
                            {
                              uint64_t v246 = v126;
                              uint64_t v247 = MEMORY[0x1E4F1CC38];
                              v155 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v247 forKeys:&v246 count:1];
                              oslog = self->_assetWriter;
                              cfb = [v180 objectAtIndexedSubscript:v125];
                              uint64_t v127 = [cfb buffer];
                              v128 = [v180 objectAtIndexedSubscript:v125];
                              uint64_t v129 = v128;
                              if (v128) {
                                [v128 presentationTimeStamp];
                              }
                              else {
                                memset(v202, 0, 24);
                              }
                              int v27 = [(VCPMovieAssetWriter *)oslog addPixelBuffer:v127 withTime:v202 withAttachment:v155];

                              if (v27) {
                                goto LABEL_297;
                              }
                              v130 = self->_previousMetadata;
                              cfc = [v180 objectAtIndexedSubscript:v125];
                              if (cfc) {
                                [cfc presentationTimeStamp];
                              }
                              else {
                                memset(v201, 0, sizeof(v201));
                              }
                              v131 = [v156 objectAtIndexedSubscript:v125];
                              int v27 = [(VCPVideoInterpolator *)self updateLivePhotoInfoSample:v130 withTimestamp:v201 withMetadata:v131 isInterpolated:1 updatedSample:&v229];

                              if (v27) {
                                goto LABEL_297;
                              }
                              int v27 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:v229];
                              if (v27) {
                                goto LABEL_297;
                              }

                              ++v125;
                            }
                            while (v172 != v125);
                            if (!self->_enableStyle || !self->_hasStyleApplied)
                            {
                              int v29 = 0;
                              int v27 = 0;
                              goto LABEL_299;
                            }
                            smartStyleUtilities = self->_smartStyleUtilities;
                            long long v133 = self->_previousSmartStyleMetadata;
                            if (*p_previousFrame) {
                              [*p_previousFrame presentationTimeStamp];
                            }
                            else {
                              memset(v200, 0, sizeof(v200));
                            }
                            if (v182) {
                              [v182 presentationTimeStamp];
                            }
                            else {
                              memset(v199, 0, sizeof(v199));
                            }
                            v155 = [(CMISmartStyleUtilitiesV1 *)smartStyleUtilities interpolateCoefficientsFromStartFrameMetadataDict:v133 startFrameTime:v200 endFrameMetadataDict:obj endFrameTime:v199 frameTimesToInterpolate:v157];
                            if ([v155 count] == v172)
                            {
                              uint64_t v179 = 0;
                              while (1)
                              {
                                uint64_t v244 = v126;
                                uint64_t v245 = MEMORY[0x1E4F1CC38];
                                os_log_t osloga = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v245 forKeys:&v244 count:1];
                                v134 = [v173 objectAtIndexedSubscript:v179];
                                CFTypeRef cfe = (CFTypeRef)[v134 buffer];
                                v148 = [v180 objectAtIndexedSubscript:v179];
                                uint64_t v135 = [v148 buffer];
                                long long v136 = [v155 objectAtIndexedSubscript:v179];
                                cfd = [(VCPVideoInterpolator *)self calculateDeltaforUnstyledFrame:cfe styledFrame:v135 withCoefficients:v136];

                                v137 = self->_assetWriter;
                                int v138 = [v180 objectAtIndexedSubscript:v179];
                                v139 = v138;
                                if (v138) {
                                  [v138 presentationTimeStamp];
                                }
                                else {
                                  memset(v198, 0, sizeof(v198));
                                }
                                int v27 = [(VCPMovieAssetWriter *)v137 addAuxPixelBuffer:cfd withTime:v198 withAttachment:osloga];

                                if (v27) {
                                  goto LABEL_295;
                                }
                                if (cfd) {
                                  CFRelease(cfd);
                                }
                                memset(&time1, 0, sizeof(time1));
                                v140 = [v180 objectAtIndexedSubscript:v179];
                                uint64_t v141 = v140;
                                if (v140) {
                                  [v140 presentationTimeStamp];
                                }
                                else {
                                  memset(&v197, 0, sizeof(v197));
                                }
                                CMTimeMake(&v196, 20, 600);
                                CMTimeRangeMake(&time1, &v197, &v196);

                                uint64_t v142 = [v155 objectAtIndexedSubscript:v179];
                                CMTimeRange v195 = time1;
                                v143 = [(VCPVideoInterpolator *)self createStyleInforMetadata:v142 timerange:&v195];

                                v144 = self->_assetWriter;
                                CMTimeRange v194 = time1;
                                int v27 = [(VCPMovieAssetWriter *)v144 addStyleInfoData:v143 timerange:&v194];

                                if (v27) {
                                  goto LABEL_295;
                                }

                                if (v172 == ++v179)
                                {
                                  int v29 = 0;
                                  int v27 = 0;
                                  goto LABEL_298;
                                }
                              }
                            }
                            if ((int)MediaAnalysisLogLevel() >= 3)
                            {
                              VCPLogInstance();
                              os_log_t osloga = (os_log_t)objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(osloga, OS_LOG_TYPE_ERROR))
                              {
                                LOWORD(time1.start.value) = 0;
                                _os_log_impl(&dword_1BBEDA000, osloga, OS_LOG_TYPE_ERROR, "Missing metadata", (uint8_t *)&time1, 2u);
                              }
                              int v27 = -18;
LABEL_295:

                              goto LABEL_297;
                            }
                            int v27 = -18;
LABEL_297:
                            int v29 = 60;
LABEL_298:
                          }
                          else
                          {
                            int v27 = 0;
                            int v29 = 1;
                          }
LABEL_299:
                        }
                        else
                        {
                          int v27 = 0;
                          int v29 = 1;
                        }

                        if (v29)
                        {
                          v70 = v177;
                          if (v29 != 60) {
                            goto LABEL_144;
                          }
                          goto LABEL_207;
                        }
                        memset(&v236, 0, sizeof(v236));
                        if (v189) {
                          [v189 interpolatedFrameDuration];
                        }
                        else {
                          memset(&time2, 0, sizeof(time2));
                        }
                        time1.CMTime start = time2;
                        CMTimeMultiply(&v236, &time1.start, v172 + 1);
                        *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
                        time2.int64_t epoch = self->_anchorPTS.epoch;
                        CMTime rhs = v236;
                        CMTimeAdd(&time1.start, &time2, &rhs);
                        *(_OWORD *)&p_anchorPTS->value = *(_OWORD *)&time1.start.value;
                        self->_anchorPTS.int64_t epoch = time1.start.epoch;
                        uint64_t v145 = [v180 objectAtIndexedSubscript:v172 - 1];
                        float v146 = v145;
                        if (v145) {
                          [v145 presentationTimeStamp];
                        }
                        else {
                          memset(&rhs, 0, sizeof(rhs));
                        }
                        time1.CMTime start = rhs;
                        *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
                        time2.int64_t epoch = self->_anchorPTS.epoch;
                        int32_t v147 = CMTimeCompare(&time1.start, &time2);

                        if (v147 >= 0)
                        {
                          int v27 = -18;
                          goto LABEL_208;
                        }
                        long long v174 = v186;
LABEL_200:
                        ++self->_anchorIndex;
                        objc_storeStrong((id *)&self->_previousFrame, v182);
                        BOOL v94 = self->_previousMetadata;
                        if (v94)
                        {
                          CFRelease(v94);
                          self->_previousMetadata = 0;
                        }
                        self->_previousMetadata = (opaqueCMSampleBuffer *)v15;
                        objc_storeStrong((id *)&self->_previousUnstyledFrame, v192);
                        if (self->_hasStyleApplied)
                        {
                          previousDeltaSample = self->_previousDeltaSample;
                          if (previousDeltaSample)
                          {
                            CFRelease(previousDeltaSample);
                            self->_previousDeltaSample = 0;
                          }
                          self->_previousDeltaSample = sbuf;
                        }
                        objc_storeStrong((id *)&self->_previousSmartStyleMetadata, obj);
                        int64_t var3 = a4->var3;
                        *(_OWORD *)&self->_previousFrameOrigianlPTS.value = *(_OWORD *)&a4->var0;
                        self->_previousFrameOrigianlPTS.int64_t epoch = var3;
                        id v186 = v174;
LABEL_207:
                        if (v27)
                        {
LABEL_208:
                          long long v174 = v186;
                          goto LABEL_209;
                        }
                        int v29 = 0;
LABEL_218:
                        v70 = v177;
LABEL_144:

                        int v28 = -18;
                        uint64_t v183 = (uint64_t)v173;
LABEL_145:

                        v49 = v183;
                        goto LABEL_146;
                      }
                    }
                  }
                }

                int v27 = 0;
                int v29 = 1;
                id v186 = v174;
                goto LABEL_218;
              }
              memset(&v236, 0, sizeof(v236));
              v90 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex + 1];
              v91 = v90;
              if (v90) {
                [v90 presentationTimeStamp];
              }
              else {
                memset(&rhs, 0, sizeof(rhs));
              }
              int v92 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex];
              uint64_t v93 = v92;
              if (v92) {
                [v92 presentationTimeStamp];
              }
              else {
                memset(&v220, 0, sizeof(v220));
              }
              time1.CMTime start = rhs;
              CMTime time2 = v220;
              CMTimeSubtract(&v236, &time1.start, &time2);

              *(_OWORD *)&time2.value = *(_OWORD *)&p_anchorPTS->value;
              time2.int64_t epoch = self->_anchorPTS.epoch;
              CMTime rhs = v236;
              CMTimeAdd(&time1.start, &time2, &rhs);
              int v27 = 0;
              *(_OWORD *)&p_anchorPTS->value = *(_OWORD *)&time1.start.value;
              self->_anchorPTS.int64_t epoch = time1.start.epoch;
              goto LABEL_200;
            }
            uint64_t v183 = 0;
          }
          else
          {
            uint64_t v183 = 0;
            uint64_t v54 = v180;
          }
          v58 = v184;
          goto LABEL_112;
        }
      }
      else
      {
        sCMTimeRange buf = 0;
        obuint64_t j = 0;
      }
      id v192 = 0;
      goto LABEL_86;
    }
LABEL_9:
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(time1.start.value) = 0;
        uint64_t v17 = "Inconsistent number of metadata and video frames";
LABEL_32:
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&time1, 2u);
        goto LABEL_33;
      }
      goto LABEL_33;
    }
LABEL_67:
    long long v30 = 0;
    goto LABEL_68;
  }
  if ((int)MediaAnalysisLogLevel() < 3) {
    goto LABEL_67;
  }
  long long v16 = VCPLogInstance();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    LOWORD(time1.start.value) = 0;
    uint64_t v17 = "FRC number of frames inconsistent with metadata";
    goto LABEL_32;
  }
LABEL_33:
  obuint64_t j = 0;
LABEL_34:
  id v192 = 0;
  int v27 = 0;
  int v28 = -18;
  int v29 = 1;
LABEL_35:

LABEL_36:
  long long v30 = obj;
LABEL_70:

  if (v29) {
    return v28;
  }
  else {
    return v27;
  }
}

- (BOOL)isIntraFrame:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_intraFrameList;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        CMTimeMakeFromDictionary(&v10, *(CFDictionaryRef *)(*((void *)&v11 + 1) + 8 * i));
        CMTime time1 = v10;
        CMTime time2 = (CMTime)*a3;
        if (!CMTimeCompare(&time1, &time2))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (id)deserializeMetadata:(opaqueCMSampleBuffer *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F166C0]) initWithSampleBuffer:a3];
  obuint64_t j = [v19 items];
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v5)
  {
    int v6 = 0;
    goto LABEL_20;
  }
  uint64_t v21 = v5;
  int v6 = 0;
  uint64_t v23 = *(void *)v29;
  uint64_t v22 = *MEMORY[0x1E4F52758];
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v29 != v23) {
        objc_enumerationMutation(obj);
      }
      BOOL v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      id v9 = [v8 dataType];
      int v10 = [v9 isEqualToString:v22];

      if (v10)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
        id v24 = [v8 dataValue];
        [v24 bytes];
        [v24 length];
        int v27 = 0;
        uint64_t v26 = 0;
        int v12 = FigLivePhotoMetadataComputeDeserializationSize();
        if (v12)
        {
          int v6 = v12;
        }
        else
        {
          int v13 = MediaAnalysisLogLevel();
          long long v14 = v24;
          if (v13 < 3)
          {
            int v6 = -50;
            goto LABEL_19;
          }
          long long v15 = VCPLogInstance();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)CMTimeRange buf = 0;
            _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "FigLivePhotoMetadataVersion >= 3 is required", buf, 2u);
          }

          int v6 = -50;
        }
        long long v14 = v24;
LABEL_19:

        goto LABEL_20;
      }
    }
    uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v21) {
      continue;
    }
    break;
  }
LABEL_20:

  if (v6) {
    long long v16 = 0;
  }
  else {
    long long v16 = v4;
  }
  id v17 = v16;

  return v17;
}

- (id)createStyleInforMetadata:(id)a3 timerange:(id *)a4
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F165A0] metadataItem];
  CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  [v6 setValue:Data];

  [v6 setIdentifier:@"mdta/com.apple.quicktime.smartstyle-info"];
  [v6 setDataType:*MEMORY[0x1E4F1F020]];
  long long v10 = *(_OWORD *)&a4->var0.var0;
  int64_t var3 = a4->var0.var3;
  [v6 setTime:&v10];
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a4->var1;
  [v6 setDuration:&var1];

  return v6;
}

- (int)updateLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3 withTimestamp:(id *)a4 withMetadata:(id)a5 isInterpolated:(BOOL)a6 updatedSample:(opaqueCMSampleBuffer *)a7
{
  BOOL v95 = a6;
  id v10 = a5;
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  formatDescriptiouint64_t n = CMSampleBufferGetFormatDescription(a3);
  size_t totalLengthOut = 0;
  lengthAtOffsetOut[0] = 0;
  dataPointerOut = 0;
  CMBlockBufferGetDataPointer(DataBuffer, 0, lengthAtOffsetOut, &totalLengthOut, &dataPointerOut);
  uint64_t v100 = 0;
  if (!dataPointerOut)
  {
    int v19 = -18;
    goto LABEL_66;
  }
  int v12 = (uint64_t *)MEMORY[0x1E4F52790];
  size_t v13 = 0;
  if (!totalLengthOut)
  {
LABEL_14:
    v91 = a4;
    int v92 = a7;
    CMBlockBufferRef blockBufferOut = 0;
    memoryBlocuint64_t k = malloc_type_malloc(v13, 0x84C1CE92uLL);
    bzero(memoryBlock, v13);
    if (totalLengthOut)
    {
      size_t v22 = 0;
      uint64_t v23 = *v12;
      uint64_t v94 = v23;
      id v24 = (unsigned int *)memoryBlock;
      do
      {
        unsigned int v25 = *(_DWORD *)&dataPointerOut[v22];
        uint64_t v26 = FigMetadataFormatDescriptionGetIdentifierForLocalID();
        size_t v27 = bswap32(v25);
        if ([v26 isEqualToString:v23])
        {
          if (v95)
          {
            *id v24 = bswap32(v100 + 8);
            v24[1] = *(_DWORD *)&dataPointerOut[v22 + 4];
            v24[2] = 3;
            long long v28 = [v10 objectForKeyedSubscript:@"privET"];

            if (v28)
            {
              long long v29 = [v10 objectForKeyedSubscript:@"privET"];
              [v29 floatValue];
              unsigned int v31 = v30;

              v24[3] = v31;
              __int16 v32 = 1;
            }
            else
            {
              __int16 v32 = 0;
            }
            CFDataRef v36 = [v10 objectForKeyedSubscript:@"privAFS"];

            if (v36)
            {
              v37 = [v10 objectForKeyedSubscript:@"privAFS"];
              uint64_t v38 = [v37 longValue];
              v32 |= 2u;

              *((void *)v24 + 2) = v38;
            }
            v39 = [v10 objectForKeyedSubscript:@"privECMVct"];
            if (v39)
            {
              uint64_t v40 = [v10 objectForKeyedSubscript:@"privECMVct"];
              uint64_t v41 = [v40 count];

              if (v41 == 2)
              {
                v42 = [v10 objectForKeyedSubscript:@"privECMVct"];
                v43 = [v42 objectAtIndexedSubscript:0];
                [v43 floatValue];
                unsigned int v45 = v44;

                uint64_t v46 = [v10 objectForKeyedSubscript:@"privECMVct"];
                int v47 = [v46 objectAtIndexedSubscript:1];
                [v47 floatValue];
                unsigned int v49 = v48;
                v32 |= 4u;

                v24[6] = v45;
                v24[7] = v49;
              }
            }
            id v50 = [v10 objectForKeyedSubscript:@"privEMBVct"];
            if (v50)
            {
              v51 = [v10 objectForKeyedSubscript:@"privEMBVct"];
              uint64_t v52 = [v51 count];

              if (v52 == 2)
              {
                v53 = [v10 objectForKeyedSubscript:@"privEMBVct"];
                uint64_t v54 = [v53 objectAtIndexedSubscript:0];
                [v54 floatValue];
                unsigned int v56 = v55;

                id v57 = [v10 objectForKeyedSubscript:@"privEMBVct"];
                v58 = [v57 objectAtIndexedSubscript:1];
                [v58 floatValue];
                unsigned int v60 = v59;
                v32 |= 8u;

                v24[8] = v56;
                v24[9] = v60;
              }
            }
            CFDataRef v61 = [v10 objectForKeyedSubscript:@"privTZF"];

            if (v61)
            {
              id v62 = [v10 objectForKeyedSubscript:@"privTZF"];
              [v62 floatValue];
              unsigned int v64 = v63;
              v32 |= 0x10u;

              v24[10] = v64;
            }
            id v65 = [v10 objectForKeyedSubscript:@"privImgG"];

            if (v65)
            {
              v66 = [v10 objectForKeyedSubscript:@"privImgG"];
              [v66 floatValue];
              unsigned int v68 = v67;
              v32 |= 0x20u;

              v24[11] = v68;
            }
            uint64_t v69 = [v10 objectForKeyedSubscript:@"privAFSt"];

            if (v69)
            {
              v70 = [v10 objectForKeyedSubscript:@"privAFSt"];
              char v71 = [v70 intValue];
              v32 |= 0x40u;

              *((unsigned char *)v24 + 48) = v71;
            }
            v72 = [v10 objectForKeyedSubscript:@"privFM"];

            if (v72)
            {
              v73 = [v10 objectForKeyedSubscript:@"privFM"];
              char v74 = [v73 intValue];
              v32 |= 0x80u;

              *((unsigned char *)v24 + 49) = v74;
            }
            *((_WORD *)v24 + 25) = v32;
            *(void *)(v24 + 15) = 0;
            *(void *)(v24 + 13) = 0;
            v24[17] = 0;
            *((_WORD *)v24 + 36) = 33;
            CFDictionaryRef v75 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F6F348]];
            if ([v75 count] != 9)
            {

              int v19 = -18;
              v81 = memoryBlock;
LABEL_57:
              CMBlockBufferRef v82 = blockBufferOut;
              goto LABEL_58;
            }
            for (uint64_t i = 0; i != 9; ++i)
            {
              v77 = [v75 objectAtIndexedSubscript:i];
              [v77 floatValue];
              unsigned int v79 = v78;

              v24[i + 19] = v79;
            }
            *((unsigned char *)v24 + 130) = 1;

            uint64_t v23 = v94;
          }
          else
          {
            memcpy(v24, &dataPointerOut[v22], v27);
            v34 = &v24[8 * v24[13]];
            uint64_t v35 = (uint64_t)&v34[8 * v34[15] + 14 + 8 * v34[14] + 8 * v34[16] + 8 * v34[17]];
            *(_WORD *)(v35 + 16) |= 0x20u;
            *(unsigned char *)(v35 + 74) = 0;
          }
          size_t v33 = v100 + 8;
        }
        else
        {
          memcpy(v24, &dataPointerOut[v22], v27);
          size_t v33 = v27;
        }
        v22 += v27;
        id v24 = (unsigned int *)((char *)v24 + v33);
      }
      while (v22 < totalLengthOut);
    }
    CFAllocatorRef v80 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v81 = memoryBlock;
    int v19 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], memoryBlock, v13, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, v13, 0, &blockBufferOut);
    CMBlockBufferRef v82 = blockBufferOut;
    if (v19) {
      BOOL v83 = 1;
    }
    else {
      BOOL v83 = blockBufferOut == 0;
    }
    if (!v83)
    {
      long long v84 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v84;
      CMTimeEpoch v85 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
      long long v86 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
      *(_OWORD *)&sampleTimingArray.duration.int64_t epoch = v86;
      *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)&v91->var0;
      CMTimeEpoch var3 = v91->var3;
      sampleTimingArray.decodeTimeStamp.int64_t epoch = v85;
      sampleTimingArray.presentationTimeStamp.int64_t epoch = var3;
      size_t sampleSizeArray = CMBlockBufferGetDataLength(blockBufferOut);
      int v19 = CMSampleBufferCreate(v80, blockBufferOut, 1u, 0, 0, formatDescription, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, v92);
      goto LABEL_57;
    }
LABEL_58:
    if (v19) {
      BOOL v89 = v82 == 0;
    }
    else {
      BOOL v89 = 0;
    }
    if (v89)
    {
      free(v81);
    }
    else if (v82)
    {
      CFRelease(v82);
    }
    goto LABEL_66;
  }
  size_t v14 = 0;
  uint64_t v15 = *MEMORY[0x1E4F52790];
  while (1)
  {
    unsigned int v16 = *(_DWORD *)&dataPointerOut[v14];
    id v17 = FigMetadataFormatDescriptionGetIdentifierForLocalID();
    uint64_t v18 = bswap32(v16);
    if (![v17 isEqualToString:v15])
    {
      uint64_t v21 = v18;
      goto LABEL_13;
    }
    if (*(_DWORD *)&dataPointerOut[v14 + 8] <= 2u) {
      break;
    }
    if (v95)
    {
      int v19 = FigLivePhotoMetadataComputeSerializationSizeV3();
      if (v19) {
        goto LABEL_65;
      }
      uint64_t v20 = v100;
      if (v100 != 136)
      {
        int v19 = -18;
        goto LABEL_65;
      }
    }
    else
    {
      uint64_t v20 = (v18 - 8);
      uint64_t v100 = v20;
    }
    uint64_t v21 = v20 + 8;
LABEL_13:
    v13 += v21;
    v14 += v18;

    if (v14 >= totalLengthOut) {
      goto LABEL_14;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unint64_t v88 = VCPLogInstance();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      LOWORD(sampleTimingArray.duration.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v88, OS_LOG_TYPE_ERROR, "FigLivePhotoMetadataVersion >= 3 is required", (uint8_t *)&sampleTimingArray, 2u);
    }
  }
  int v19 = -50;
LABEL_65:

LABEL_66:
  return v19;
}

- (int)finishAnalysisPass:(id *)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  uint64_t v63 = 0;
  uint64_t v68 = *MEMORY[0x1E4F1F280];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  v69[0] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
  int v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(NSArray *)self->_frameInsertionLists objectAtIndexedSubscript:self->_anchorIndex];
  BOOL v8 = v7;
  if (v7) {
    [v7 presentationTimeStamp];
  }
  else {
    memset(v62, 0, sizeof(v62));
  }
  BOOL v9 = [(VCPVideoInterpolator *)self isIntraFrame:v62];

  if (v9)
  {
    uint64_t v66 = *MEMORY[0x1E4F1F288];
    uint64_t v67 = v4;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    [v6 addEntriesFromDictionary:v10];
  }
  if (self->_processAborted)
  {
    id v11 = 0;
    int v12 = 0;
    goto LABEL_18;
  }
  assetWriter = self->_assetWriter;
  uint64_t v14 = [(FRCFrame *)self->_previousFrame buffer];
  previousFrame = self->_previousFrame;
  if (previousFrame) {
    [(FRCFrame *)previousFrame presentationTimeStamp];
  }
  else {
    memset(v61, 0, sizeof(v61));
  }
  int v12 = [(VCPMovieAssetWriter *)assetWriter addPixelBuffer:v14 withTime:v61 withAttachment:v6];
  if (v12) {
    goto LABEL_17;
  }
  previousMetadata = self->_previousMetadata;
  id v17 = self->_previousFrame;
  if (v17) {
    [(FRCFrame *)v17 presentationTimeStamp];
  }
  else {
    memset(v60, 0, sizeof(v60));
  }
  int v12 = [(VCPVideoInterpolator *)self updateLivePhotoInfoSample:previousMetadata withTimestamp:v60 withMetadata:0 isInterpolated:0 updatedSample:&v63];
  if (v12
    || (int v12 = [(VCPMovieAssetWriter *)self->_assetWriter addLivePhotoInfoBuffer:v63]) != 0)
  {
LABEL_17:
    id v11 = 0;
    goto LABEL_18;
  }
  if (!self->_enableStyle)
  {
    id v11 = 0;
    goto LABEL_67;
  }
  memset(&buf, 0, sizeof(buf));
  unsigned int v25 = self->_previousFrame;
  if (v25) {
    [(FRCFrame *)v25 presentationTimeStamp];
  }
  else {
    memset(&start, 0, sizeof(start));
  }
  CMTimeMake(&duration, 20, 600);
  CMTimeRangeMake(&buf, &start, &duration);
  previousSmartStyleMetadata = self->_previousSmartStyleMetadata;
  CMTimeRange v56 = buf;
  id v11 = [(VCPVideoInterpolator *)self createStyleInforMetadata:previousSmartStyleMetadata timerange:&v56];
  if (self->_hasStyleApplied)
  {
    size_t v27 = self->_assetWriter;
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(self->_previousDeltaSample);
    long long v29 = self->_previousFrame;
    if (v29) {
      [(FRCFrame *)v29 presentationTimeStamp];
    }
    else {
      memset(v55, 0, sizeof(v55));
    }
    int v12 = [(VCPMovieAssetWriter *)v27 addAuxPixelBuffer:ImageBuffer withTime:v55 withAttachment:v6];
    if (v12) {
      goto LABEL_18;
    }
  }
  unsigned int v30 = self->_assetWriter;
  CMTimeRange v54 = buf;
  int v12 = [(VCPMovieAssetWriter *)v30 addStyleInfoData:v11 timerange:&v54];
  if (v12) {
    goto LABEL_18;
  }
  CMTime time1 = (CMTime)self->_previousFrameOrigianlPTS;
  CMTime time2 = (CMTime)self->_nextAuxSamplePTS;
  int32_t v31 = CMTimeCompare(&time1, &time2);
  auxInputToOutputMap = self->_auxInputToOutputMap;
  if (v31 < 0)
  {
    unsigned int v45 = [(NSMapTable *)auxInputToOutputMap objectForKey:@"com.apple.quicktime.video-map.smart-style-linear-thumbnail"];
    while (1)
    {
      uint64_t v40 = (opaqueCMSampleBuffer *)[v45 copyNextSampleBuffer];
      uint64_t v41 = v40;
      if (!v40) {
        goto LABEL_66;
      }
      if (CMSampleBufferGetNumSamples(v40))
      {
        v42 = self->_previousFrame;
        if (v42) {
          [(FRCFrame *)v42 presentationTimeStamp];
        }
        else {
          memset(&v46, 0, sizeof(v46));
        }
        CMSampleBufferSetOutputPresentationTimeStamp(v41, &v46);
        int v12 = [(VCPMovieAssetWriter *)self->_assetWriter addAdditionalAuxTracks:v41 toTrack:@"com.apple.quicktime.video-map.smart-style-linear-thumbnail"];
        if (!v12) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }
      CFRelease(v41);
    }
  }
  p_nextAuxSamplePTS = &self->_nextAuxSamplePTS;
  unsigned int v45 = [(NSMapTable *)auxInputToOutputMap keyEnumerator];
  size_t v33 = 0;
  while (2)
  {
    v34 = [v45 nextObject];

    if (!v34)
    {
LABEL_66:

LABEL_67:
      if ([(VCPMovieAssetWriter *)self->_assetWriter finish])
      {
        int v12 = -18;
      }
      else
      {
        if (self->_enableStyle) {
          int v43 = [(VCPVideoInterpolator *)self combineVideoSegmentsWithAssetWriter];
        }
        else {
          int v43 = [(VCPVideoInterpolator *)self combineVideoSegments];
        }
        int v12 = v43;
        if (!v43)
        {
          if ([(FRCFrameInterpolator *)self->_frameInterpolator endSession] == -22000) {
            int v12 = 0;
          }
          else {
            int v12 = -18;
          }
        }
      }
      goto LABEL_18;
    }
    uint64_t v35 = [(NSMapTable *)self->_auxInputToOutputMap objectForKey:v34];
    while (1)
    {
      CFDataRef v36 = (opaqueCMSampleBuffer *)[v35 copyNextSampleBuffer];
      v37 = v36;
      if (!v36) {
        goto LABEL_55;
      }
      if (CMSampleBufferGetNumSamples(v36)) {
        break;
      }
      CFRelease(v37);
    }
    CMSampleBufferGetDuration(&v51, v37);
    CMSampleBufferGetOutputPresentationTimeStamp(&v50, v37);
    CMTime time1 = v51;
    CMTime time2 = v50;
    CMTimeAdd(&v52, &time1, &time2);
    *(_OWORD *)&time1.value = *(_OWORD *)&p_nextAuxSamplePTS->value;
    time1.int64_t epoch = self->_nextAuxSamplePTS.epoch;
    CMTime time2 = v52;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMSampleBufferGetDuration(&v49, v37);
      CMSampleBufferGetOutputPresentationTimeStamp(&v48, v37);
      CMTime time1 = v49;
      CMTime time2 = v48;
      CMTimeAdd(&v53, &time1, &time2);
      uint64_t v38 = &self->_nextAuxSamplePTS;
    }
    else
    {
      uint64_t v38 = &self->_nextAuxSamplePTS;
      *(_OWORD *)&v53.value = *(_OWORD *)&p_nextAuxSamplePTS->value;
      v53.int64_t epoch = self->_nextAuxSamplePTS.epoch;
    }
    *(CMTime *)uint64_t v38 = v53;
    v39 = self->_previousFrame;
    if (v39) {
      [(FRCFrame *)v39 presentationTimeStamp];
    }
    else {
      memset(&outputPresentationTimeStamp, 0, sizeof(outputPresentationTimeStamp));
    }
    CMSampleBufferSetOutputPresentationTimeStamp(v37, &outputPresentationTimeStamp);
    int v12 = [(VCPMovieAssetWriter *)self->_assetWriter addAdditionalAuxTracks:v37 toTrack:v34];
    if (!v12)
    {
LABEL_55:

      size_t v33 = v34;
      continue;
    }
    break;
  }

LABEL_65:
LABEL_18:
  uint64_t v18 = self->_previousMetadata;
  if (v18)
  {
    CFRelease(v18);
    self->_previousMetadata = 0;
  }
  if (v12)
  {
    self->_processAborted = 1;
    if ([(VCPMovieAssetWriter *)self->_assetWriter status] == 1) {
      [(VCPMovieAssetWriter *)self->_assetWriter cancel];
    }
  }
  int v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v20 = [v19 fileExistsAtPath:self->_filePath];

  if (v20)
  {
    uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v22 = [v21 removeItemAtPath:self->_filePath error:0];

    if ((v22 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.start.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "  Failed to delete FRC temporary files", (uint8_t *)&buf, 2u);
      }
    }
  }

  return v12;
}

- (int)combineVideoSegments
{
  uint64_t v76 = [(AVAssetTrack *)self->_originalTrack asset];
  id v3 = (void *)MEMORY[0x1E4F166C8];
  uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_filePath];
  id v5 = [v3 assetWithURL:v4];

  v77 = (void *)[objc_alloc(MEMORY[0x1E4F165A8]) initWithSettingsFromMovie:0 options:0 error:0];
  int v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 fileExistsAtPath:self->_combinedFilePath];

  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 removeItemAtPath:self->_combinedFilePath error:0];
  }
  BOOL v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 createFileAtPath:self->_combinedFilePath contents:0 attributes:0];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F16520]);
    int v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_combinedFilePath];
    size_t v13 = (void *)[v11 initWithURL:v12 options:0];
    [v77 setDefaultMediaDataStorage:v13];

    uint64_t v14 = [v5 metadata];
    [v77 setMetadata:v14];

    uint64_t v15 = *MEMORY[0x1E4F15C18];
    unsigned int v16 = [v5 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    CFDictionaryRef v75 = [v16 firstObject];

    char v74 = [(VCPVideoInterpolator *)self findLivePhotoInfoOutput:v76];
    v73 = [(VCPVideoInterpolator *)self findLivePhotoInfoOutput:v5];
    if (v75 && v74 && v73)
    {
      char v71 = [v5 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
      id v17 = [v5 tracksWithMediaType:*MEMORY[0x1E4F15BE0]];
      uint64_t v18 = [v5 tracksWithMediaType:v15];
      v72 = [v77 addMutableTracksCopyingSettingsFromTracks:v18 options:0];

      int v19 = [v75 metadata];
      int v20 = [v72 objectAtIndexedSubscript:0];
      [v20 setMetadata:v19];

      v70 = [v77 addMutableTracksCopyingSettingsFromTracks:v71 options:0];
      uint64_t v69 = [v77 addMutableTracksCopyingSettingsFromTracks:v17 options:0];
      if (v72 && [v72 count] && v70 && objc_msgSend(v70, "count") && v69 && objc_msgSend(v69, "count"))
      {
        unint64_t v21 = 0;
        uint64_t v22 = *MEMORY[0x1E4F52790];
        while (v21 < [v17 count])
        {
          uint64_t v23 = v17;
          id v24 = [v17 objectAtIndexedSubscript:v21];
          unsigned int v25 = [v24 formatDescriptions];
          uint64_t v26 = [v25 firstObject];

          if (v26)
          {
            size_t v27 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v26);
            char v28 = [v27 containsObject:v22];

            if (v28)
            {

              id v17 = v23;
              goto LABEL_41;
            }
          }

          ++v21;
          id v17 = v23;
        }
        unint64_t v21 = 0;
LABEL_41:
        uint64_t v35 = [v72 objectAtIndexedSubscript:0];
        unsigned int v64 = v35;
        id v65 = [v69 objectAtIndexedSubscript:v21];
        uint64_t v68 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v76 error:0];
        uint64_t v67 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:self->_originalTrack outputSettings:0];
        uint64_t v66 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v74 outputSettings:0];
        if (([v68 canAddOutput:v67] & 1) == 0
          || ([v68 addOutput:v67], !objc_msgSend(v68, "canAddOutput:", v66)))
        {
          size_t v33 = v17;
          int v30 = -18;
          goto LABEL_62;
        }
        [v68 addOutput:v66];
        CFDataRef v36 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v5 error:0];
        uint64_t v62 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v75 outputSettings:0];
        uint64_t v63 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v73 outputSettings:0];
        v37 = (void *)v62;
        if (([v36 canAddOutput:v62] & 1) == 0
          || ([v36 addOutput:v62], !objc_msgSend(v36, "canAddOutput:", v63)))
        {
          size_t v33 = v17;
          int v30 = -18;
          goto LABEL_61;
        }
        [v36 addOutput:v63];
        if ([v68 startReading])
        {
          size_t v33 = v17;
          if ([v36 startReading])
          {
            CFDataRef v61 = v36;
            uint64_t v38 = (CMTime *)MEMORY[0x1E4F1FA48];
            CMTime v128 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            CMTime v127 = v128;
            CMTime v126 = v128;
            p_startAdjustedPTS = &self->_startAdjustedPTS;
            long long v124 = *(_OWORD *)&self->_startAdjustedPTS.value;
            int64_t epoch = self->_startAdjustedPTS.epoch;
            CMTime v123 = v128;
            int v30 = [(VCPVideoInterpolator *)self appendOutput:v67 toTrack:v35 startTimeStamp:&v126 endTimeStamp:&v124 offset:&v123 duration:&v128];
            if (v30) {
              goto LABEL_102;
            }
            long long v121 = *(_OWORD *)&v38->value;
            CMTimeEpoch v122 = v38->epoch;
            long long v119 = *(_OWORD *)&p_startAdjustedPTS->value;
            int64_t v120 = self->_startAdjustedPTS.epoch;
            long long v117 = v121;
            CMTimeEpoch v118 = v122;
            int v30 = [(VCPVideoInterpolator *)self appendOutput:v66 toTrack:v65 startTimeStamp:&v121 endTimeStamp:&v119 offset:&v117 duration:&v127];
            if (v30) {
              goto LABEL_102;
            }
            long long v115 = *(_OWORD *)&v38->value;
            CMTimeEpoch v116 = v38->epoch;
            uint64_t v40 = (long long *)MEMORY[0x1E4F1FA10];
            long long v113 = *MEMORY[0x1E4F1FA10];
            uint64_t v114 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
            long long v111 = *(_OWORD *)&p_startAdjustedPTS->value;
            int64_t v112 = self->_startAdjustedPTS.epoch;
            int v30 = [(VCPVideoInterpolator *)self appendOutput:v62 toTrack:v64 startTimeStamp:&v115 endTimeStamp:&v113 offset:&v111 duration:&v128];
            if (v30) {
              goto LABEL_102;
            }
            long long v109 = *(_OWORD *)&v38->value;
            CMTimeEpoch v110 = v38->epoch;
            long long v107 = *v40;
            uint64_t v108 = *((void *)v40 + 2);
            long long v105 = *(_OWORD *)&p_startAdjustedPTS->value;
            int64_t v106 = self->_startAdjustedPTS.epoch;
            int v30 = [(VCPVideoInterpolator *)self appendOutput:v63 toTrack:v65 startTimeStamp:&v109 endTimeStamp:&v107 offset:&v105 duration:&v127];
            if (v30) {
              goto LABEL_102;
            }
            CMTime v127 = v128;
            p_endAdjustedPTS = &self->_endAdjustedPTS;
            long long v103 = *(_OWORD *)&self->_endAdjustedPTS.value;
            int64_t v104 = self->_endAdjustedPTS.epoch;
            long long v101 = *v40;
            uint64_t v102 = *((void *)v40 + 2);
            buf.CMTime start = v128;
            CMTime rhs = (CMTime)self->_endAdjustedPTS;
            CMTimeSubtract(&v100, &buf.start, &rhs);
            int v30 = [(VCPVideoInterpolator *)self appendOutput:v67 toTrack:v64 startTimeStamp:&v103 endTimeStamp:&v101 offset:&v100 duration:&v128];
            if (v30) {
              goto LABEL_102;
            }
            long long v98 = *(_OWORD *)&p_endAdjustedPTS->value;
            int64_t v99 = self->_endAdjustedPTS.epoch;
            long long v96 = *v40;
            uint64_t v97 = *((void *)v40 + 2);
            buf.CMTime start = v127;
            *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
            rhs.int64_t epoch = self->_endAdjustedPTS.epoch;
            CMTimeSubtract(&v95, &buf.start, &rhs);
            int v30 = [(VCPVideoInterpolator *)self appendOutput:v66 toTrack:v65 startTimeStamp:&v98 endTimeStamp:&v96 offset:&v95 duration:&v127];
            if (v30) {
              goto LABEL_102;
            }
            unsigned int v59 = [v64 formatDescriptions];
            if ((unint64_t)[v59 count] >= 2)
            {
              v42 = [v59 objectAtIndexedSubscript:0];

              for (unint64_t i = 1; ; ++i)
              {
                if (i >= [v59 count]) {
                  goto LABEL_65;
                }
                unsigned int v44 = [v59 objectAtIndexedSubscript:i];

                if (!CMFormatDescriptionEqual((CMFormatDescriptionRef)v44, (CMFormatDescriptionRef)v42)
                  && !+[VCPVideoInterpolator allowMultipleFormats])
                {
                  break;
                }
              }
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_100;
              }
              CMTimeRange v54 = VCPLogInstance();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf.start.value) = 0;
                unsigned int v55 = "FRC processed video has multiple format descriptions";
                p_CMTimeRange buf = &buf;
LABEL_98:
                _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_ERROR, v55, (uint8_t *)p_buf, 2u);
              }
LABEL_99:

              goto LABEL_100;
            }
LABEL_65:
            memset(&buf, 0, sizeof(buf));
            CMTime start = *v38;
            CMTime duration = v128;
            CMTimeRangeMake(&buf, &start, &duration);
            for (unint64_t j = 0; j < [v70 count]; ++j)
            {
              unsigned int v60 = [v70 objectAtIndexedSubscript:j];
              CMTimeRange v91 = buf;
              CMTime v46 = [v71 objectAtIndexedSubscript:j];
              long long v89 = *(_OWORD *)&v38->value;
              CMTimeEpoch v90 = v38->epoch;
              char v47 = [v60 insertTimeRange:&v91 ofTrack:v46 atTime:&v89 copySampleData:1 error:0];

              if ((v47 & 1) == 0)
              {
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  CMTime v51 = VCPLogInstance();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    LOWORD(rhs.value) = 0;
                    CMTime v52 = "Error inserting audio tracks";
LABEL_88:
                    _os_log_impl(&dword_1BBEDA000, v51, OS_LOG_TYPE_ERROR, v52, (uint8_t *)&rhs, 2u);
                  }
                  goto LABEL_89;
                }
                goto LABEL_90;
              }
            }
            for (unint64_t k = 0; k < [v69 count]; ++k)
            {
              if (v21 != k)
              {
                unsigned int v60 = [v69 objectAtIndexedSubscript:k];
                CMTimeRange v88 = buf;
                CMTime v49 = [v33 objectAtIndexedSubscript:k];
                long long v86 = *(_OWORD *)&v38->value;
                CMTimeEpoch v87 = v38->epoch;
                char v50 = [v60 insertTimeRange:&v88 ofTrack:v49 atTime:&v86 copySampleData:1 error:0];

                if ((v50 & 1) == 0)
                {
                  if ((int)MediaAnalysisLogLevel() < 3) {
                    goto LABEL_90;
                  }
                  CMTime v51 = VCPLogInstance();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    LOWORD(rhs.value) = 0;
                    CMTime v52 = "Error inserting metadata tracks";
                    goto LABEL_88;
                  }
LABEL_89:

LABEL_90:
LABEL_100:
                  int v30 = -18;
LABEL_101:

LABEL_102:
                  CFDataRef v36 = v61;
                  v37 = (void *)v62;
LABEL_61:

LABEL_62:
                  __int16 v32 = v64;
LABEL_31:

                  goto LABEL_34;
                }
              }
            }
            CMTimeRange v85 = buf;
            CMTimeRange v84 = buf;
            if ([v64 insertMediaTimeRange:&v85 intoTimeRange:&v84])
            {
              CMTimeRange v83 = buf;
              CMTimeRange v82 = buf;
              if ([v65 insertMediaTimeRange:&v83 intoTimeRange:&v82])
              {
                originalTracunint64_t k = self->_originalTrack;
                if (originalTrack)
                {
                  [(AVAssetTrack *)originalTrack preferredTransform];
                }
                else
                {
                  long long v80 = 0u;
                  long long v81 = 0u;
                  long long v79 = 0u;
                }
                v78[0] = v79;
                v78[1] = v80;
                v78[2] = v81;
                [v64 setPreferredTransform:v78];
                id v57 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_combinedFilePath];
                int v58 = [v77 writeMovieHeaderToURL:v57 fileType:*MEMORY[0x1E4F15AB0] options:0 error:0];

                if (v58) {
                  int v30 = 0;
                }
                else {
                  int v30 = -20;
                }
                goto LABEL_101;
              }
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_100;
              }
              CMTimeRange v54 = VCPLogInstance();
              if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                goto LABEL_99;
              }
              LOWORD(rhs.value) = 0;
              unsigned int v55 = "Error inserting live photo info track";
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() < 3) {
                goto LABEL_100;
              }
              CMTimeRange v54 = VCPLogInstance();
              if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                goto LABEL_99;
              }
              LOWORD(rhs.value) = 0;
              unsigned int v55 = "Error inserting video track";
            }
            p_CMTimeRange buf = (CMTimeRange *)&rhs;
            goto LABEL_98;
          }
        }
        else
        {
          size_t v33 = v17;
        }
        int v30 = -19;
        goto LABEL_61;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        __int16 v32 = VCPLogInstance();
        size_t v33 = v17;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.start.value) = 0;
          _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "Error creating output track", (uint8_t *)&buf, 2u);
        }
        int v30 = -18;
        goto LABEL_31;
      }
      size_t v33 = v17;
      int v30 = -18;
LABEL_34:
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v30 = -18;
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
      int32_t v31 = VCPLogInstance();
      char v71 = v31;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.start.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "Error getting video or metadata track", (uint8_t *)&buf, 2u);
      }
      int v30 = -18;
    }

    goto LABEL_36;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    long long v29 = VCPLogInstance();
    CFDictionaryRef v75 = v29;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "Error creating final movie file", (uint8_t *)&buf, 2u);
    }
    int v30 = -18;
    goto LABEL_37;
  }
  int v30 = -18;
LABEL_38:

  return v30;
}

- (int)appendOutput:(id)a3 toTrack:(id)a4 startTimeStamp:(id *)a5 endTimeStamp:(id *)a6 offset:(id *)a7 duration:(id *)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v24 = a4;
  uint64_t v23 = v13;
  while (1)
  {
    while (1)
    {
      uint64_t v14 = (opaqueCMSampleBuffer *)[v13 copyNextSampleBuffer];
      uint64_t v15 = v14;
      if (!v14) {
        goto LABEL_13;
      }
      if (CMSampleBufferGetNumSamples(v14))
      {
        memset(&v32, 0, sizeof(v32));
        CMSampleBufferGetDecodeTimeStamp(&v32, v15);
        memset(&v31, 0, sizeof(v31));
        CMSampleBufferGetPresentationTimeStamp(&v31, v15);
        memset(&v30, 0, sizeof(v30));
        CMSampleBufferGetDuration(&v30, v15);
        time1.CMTime duration = v32;
        CMTime time2 = (CMTime)*a6;
        if ((CMTimeCompare(&time1.duration, &time2) & 0x80000000) == 0)
        {
          CFRelease(v15);
LABEL_13:
          OSStatus v16 = 0;
          goto LABEL_21;
        }
        time1.CMTime duration = v32;
        CMTime time2 = (CMTime)*a5;
        if ((CMTimeCompare(&time1.duration, &time2) & 0x80000000) == 0) {
          break;
        }
      }
      CMSampleBufferRef v17 = v15;
LABEL_11:
      CFRelease(v17);
    }
    CMSampleBufferRef sampleBufferOut = 0;
    memset(&v28, 0, sizeof(v28));
    time1.CMTime duration = v32;
    CMTime time2 = (CMTime)*a7;
    CMTimeAdd(&v28, &time1.duration, &time2);
    memset(&v27, 0, sizeof(v27));
    time1.CMTime duration = v31;
    CMTime time2 = (CMTime)*a7;
    CMTimeAdd(&v27, &time1.duration, &time2);
    *(_OWORD *)&time1.duration.value = *MEMORY[0x1E4F1F9F8];
    time1.duration.int64_t epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    time1.presentationTimeStamp = v27;
    time1.decodeTimeStamp = v28;
    OSStatus v16 = CMSampleBufferCreateCopyWithNewTiming(0, v15, 1, &time1, &sampleBufferOut);
    if (v16)
    {
      CMSampleBufferRef v17 = v15;
LABEL_20:
      CFRelease(v17);
      goto LABEL_21;
    }
    CMSampleBufferRef v17 = sampleBufferOut;
    CFRelease(v15);
    CMTime lhs = (CMTime)*a8;
    CMTime rhs = v30;
    CMTimeAdd(&time2, &lhs, &rhs);
    *(CMTime *)a8 = time2;
    id v25 = 0;
    int v18 = [v24 appendSampleBuffer:v17 decodeTime:0 presentationTime:0 error:&v25];
    id v19 = v25;
    int v20 = v19;
    if ((v18 & 1) == 0) {
      break;
    }

    id v13 = v23;
    if (v17) {
      goto LABEL_11;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    unint64_t v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(time2.value) = 138412290;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v20;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Error appending sample: %@", (uint8_t *)&time2, 0xCu);
    }
  }
  OSStatus v16 = -18;
  if (v17) {
    goto LABEL_20;
  }
LABEL_21:

  return v16;
}

- (id)results
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v13 = @"InterpolationResults";
  char v10 = @"attributes";
  combinedFilePath = self->_combinedFilePath;
  BOOL v8 = @"interpolationURL";
  BOOL v9 = combinedFilePath;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v11 = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  int v12 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v14[0] = v5;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v6;
}

- (CGSize)getFrameSize:(id)a3
{
  id v3 = [a3 formatDescriptions];
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];

    CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v4, 0, 0);
    CGFloat width = PresentationDimensions.width;
    CGFloat height = PresentationDimensions.height;
  }
  else
  {
    CGFloat width = *MEMORY[0x1E4F1DB30];
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (__CVBuffer)revertStyle:(__CVBuffer *)a3 withMetadata:(id)a4 withDeltaMap:(__CVBuffer *)a5
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  CFTypeRef cf = 0;
  p_unstyledImagePixelBufferPool = &self->_unstyledImagePixelBufferPool;
  value = self->_unstyledImagePixelBufferPool.value_;
  if (!value)
  {
    v19[0] = *MEMORY[0x1E4F24D70];
    id v11 = [NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(a3)];
    v20[0] = v11;
    v19[1] = *MEMORY[0x1E4F24E10];
    int v12 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(a3)];
    v20[1] = v12;
    v19[2] = *MEMORY[0x1E4F24D08];
    id v13 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(a3)];
    v19[3] = *MEMORY[0x1E4F24D20];
    v20[2] = v13;
    v20[3] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

    if (p_unstyledImagePixelBufferPool->value_)
    {
      CFRelease(p_unstyledImagePixelBufferPool->value_);
      p_unstyledImagePixelBufferPool->value_ = 0;
    }
    BOOL v15 = CVPixelBufferPoolCreate(0, 0, v14, &self->_unstyledImagePixelBufferPool.value_) == 0;

    if (!v15) {
      goto LABEL_9;
    }
    value = p_unstyledImagePixelBufferPool->value_;
  }
  if (!CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], value, (CVPixelBufferRef *)&cf)
    && ![(CMISmartStyleUtilitiesV1 *)self->_smartStyleUtilities computeOriginalUnstyledPixelBufferFrom:a3 inputDeltaMapPixelBuffer:a5 inputMetadataDict:v8 outputUnstyledPixelBuffer:cf])
  {
    CVBufferPropagateAttachments(a3, (CVBufferRef)cf);
    OSStatus v16 = (__CVBuffer *)cf;
    goto LABEL_10;
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_9:
  OSStatus v16 = 0;
LABEL_10:

  return v16;
}

- (__CVBuffer)calculateDeltaforUnstyledFrame:(__CVBuffer *)a3 styledFrame:(__CVBuffer *)a4 withCoefficients:(id)a5
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  CFTypeRef cf = 0;
  p_deltaMapPixelBufferPool = &self->_deltaMapPixelBufferPool;
  value = self->_deltaMapPixelBufferPool.value_;
  if (!value)
  {
    v19[0] = *MEMORY[0x1E4F24D70];
    id v11 = [NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(a3)];
    v20[0] = v11;
    v19[1] = *MEMORY[0x1E4F24E10];
    int v12 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(a3)];
    v20[1] = v12;
    v19[2] = *MEMORY[0x1E4F24D08];
    id v13 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(a3)];
    v19[3] = *MEMORY[0x1E4F24D20];
    v20[2] = v13;
    v20[3] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

    if (p_deltaMapPixelBufferPool->value_)
    {
      CFRelease(p_deltaMapPixelBufferPool->value_);
      p_deltaMapPixelBufferPool->value_ = 0;
    }
    BOOL v15 = CVPixelBufferPoolCreate(0, 0, v14, &self->_deltaMapPixelBufferPool.value_) == 0;

    if (!v15) {
      goto LABEL_9;
    }
    value = p_deltaMapPixelBufferPool->value_;
  }
  if (!CVPixelBufferPoolCreatePixelBuffer(0, value, (CVPixelBufferRef *)&cf)
    && ![(CMISmartStyleUtilitiesV1 *)self->_smartStyleUtilities computeDeltaMapForSourcePixelBuffer:a3 targetPixelBuffer:a4 coefficientsDict:v8 outputDeltaMapPixelBuffer:cf])
  {
    CVBufferPropagateAttachments(a3, (CVBufferRef)cf);
    OSStatus v16 = (__CVBuffer *)cf;
    goto LABEL_10;
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_9:
  OSStatus v16 = 0;
LABEL_10:

  return v16;
}

- (id)findLearnedTrack:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [a3 tracksWithMediaType:*MEMORY[0x1E4F15BB8]];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v3)
  {
    uint64_t v25 = *(void *)v32;
    uint64_t v24 = *MEMORY[0x1E4F15D20];
    uint64_t v23 = *MEMORY[0x1E4F15EC0];
    uint64_t v22 = *MEMORY[0x1E4F15E00];
    do
    {
      uint64_t v20 = v3;
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        int v6 = (void *)MEMORY[0x1E4F16558];
        int v7 = [v5 metadataForFormat:v24];
        unint64_t v21 = v5;
        id v8 = [v6 metadataItemsFromArray:v7 withKey:v23 keySpace:v22];

        if (v8)
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v28;
            while (2)
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v28 != v11) {
                  objc_enumerationMutation(v9);
                }
                id v13 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                CFDictionaryRef v14 = [v13 stringValue];
                int v15 = [v14 isEqualToString:@"com.apple.quicktime.video-map.smart-style-delta-map"];
                OSStatus v16 = [v13 stringValue];
                int v17 = [v16 isEqualToString:@"com.apple.quicktime.video-map.smart-style-linear-thumbnail"];

                if (((v15 | v17) & 1) == 0)
                {
                  id v18 = v21;

                  goto LABEL_21;
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      id v18 = 0;
    }
    while (v3);
  }
  else
  {
    id v18 = 0;
  }
LABEL_21:

  return v18;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)getFramePTSAfter:(SEL)a3 forAsset:(id *)a4
{
  int v7 = [(VCPVideoInterpolator *)self findLearnedTrack:a5];
  id v8 = objc_alloc(MEMORY[0x1E4F16378]);
  id v9 = [v7 asset];
  uint64_t v10 = (void *)[v8 initWithAsset:v9 error:0];

  uint64_t v11 = [MEMORY[0x1E4F16398] assetReaderSampleReferenceOutputWithTrack:v7];
  if (([v10 canAddOutput:v11] & 1) != 0
    && ([v10 addOutput:v11], objc_msgSend(v10, "startReading")))
  {
    while (1)
    {
      int v12 = (opaqueCMSampleBuffer *)[v11 copyNextSampleBuffer];
      id v13 = v12;
      if (!v12) {
        break;
      }
      if (CMSampleBufferGetNumSamples(v12))
      {
        memset(&v16, 0, sizeof(v16));
        CMSampleBufferGetPresentationTimeStamp(&v16, v13);
        CMTime time1 = v16;
        CMTime time2 = (CMTime)*a4;
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        {
          CMTime v17 = v16;
          CFRelease(v13);
          break;
        }
      }
      CFRelease(v13);
    }
    CFDictionaryRef v14 = &v17;
  }
  else
  {
    CFDictionaryRef v14 = (CMTime *)MEMORY[0x1E4F1F9F8];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v14->value;
  retstr->CMTimeEpoch var3 = v14->epoch;

  return result;
}

- (int)setupAdditionalAuxTrack
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVAssetTrack *)self->_originalTrack asset];
  uint64_t v4 = [v3 tracksWithMediaType:*MEMORY[0x1E4F15BB8]];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v5)
  {
    uint64_t v29 = *(void *)v38;
    uint64_t v27 = *MEMORY[0x1E4F15D20];
    uint64_t v26 = *MEMORY[0x1E4F15EC0];
    uint64_t v25 = *MEMORY[0x1E4F15E00];
    do
    {
      uint64_t v6 = 0;
      uint64_t v28 = v5;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        id v8 = objc_msgSend(v7, "formatDescriptions", v25, v26);
        uint64_t v32 = v6;
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          uint64_t v10 = (void *)MEMORY[0x1E4F16558];
          uint64_t v11 = [v7 metadataForFormat:v27];
          long long v30 = [v10 metadataItemsFromArray:v11 withKey:v26 keySpace:v25];

          int v12 = v30;
          if (v30)
          {
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v13 = v30;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v34;
              while (2)
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v34 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  CMTime v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                  id v18 = [v17 stringValue];
                  char v19 = [v18 isEqualToString:@"com.apple.quicktime.video-map.smart-style-delta-map"];

                  if ((v19 & 1) == 0)
                  {
                    uint64_t v20 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v7 outputSettings:0];
                    if (![(AVAssetReader *)self->_auxAssetReader canAddOutput:v20])
                    {

                      int v23 = -18;
                      goto LABEL_24;
                    }
                    [(AVAssetReader *)self->_auxAssetReader addOutput:v20];
                    auxInputToOutputMap = self->_auxInputToOutputMap;
                    uint64_t v22 = [v17 stringValue];
                    [(NSMapTable *)auxInputToOutputMap setObject:v20 forKey:v22];
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }

            int v12 = v30;
          }
        }
        uint64_t v6 = v32 + 1;
      }
      while (v32 + 1 != v28);
      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v5);
  }

  [(AVAssetReader *)self->_auxAssetReader startReading];
  int v23 = 0;
LABEL_24:

  return v23;
}

- (int)combineVideoSegmentsWithAssetWriter
{
  uint64_t v340 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v3 = [v2 fileExistsAtPath:self->_combinedFilePath];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v4 removeItemAtPath:self->_combinedFilePath error:0];
  }
  id v177 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v175 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v170 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v171 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v173 = [(AVAssetTrack *)self->_originalTrack asset];
  uint64_t v5 = (void *)MEMORY[0x1E4F166C8];
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_filePath];
  long long v174 = [v5 assetWithURL:v6];

  int v7 = (void *)MEMORY[0x1E4F163B8];
  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_combinedFilePath];
  uint64_t v9 = *MEMORY[0x1E4F15AB0];
  id v327 = 0;
  v178 = [v7 assetWriterWithURL:v8 fileType:v9 error:&v327];
  id v172 = v327;

  uint64_t v10 = v178;
  if (!v178)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v96 = -18;
      goto LABEL_134;
    }
    log = VCPLogInstance();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      long long v105 = [v172 description];
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v105;
      _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "Failed to create asset writer (%@)", (uint8_t *)&buf, 0xCu);
    }
LABEL_112:
    int v96 = -18;
    goto LABEL_133;
  }
  uint64_t v11 = (void *)*MEMORY[0x1E4F15C18];
  log = [(VCPVideoInterpolator *)self addInputMediaType:*MEMORY[0x1E4F15C18] toWriter:v178 forTrack:self->_originalTrack];
  if (!log)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v107 = VCPLogInstance();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v107, OS_LOG_TYPE_ERROR, "Failed to add AVAssetWriterInput", (uint8_t *)&buf, 2u);
      }
      int v96 = -18;
      goto LABEL_132;
    }
    goto LABEL_112;
  }
  id v156 = v11;
  uint64_t v12 = *MEMORY[0x1E4F15BB8];
  [v174 tracksWithMediaType:*MEMORY[0x1E4F15BB8]];
  long long v326 = 0u;
  long long v325 = 0u;
  long long v324 = 0u;
  long long v323 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v323 objects:v338 count:16];
  if (v13)
  {
    uint64_t v165 = *(void *)v324;
    uint64_t v163 = *MEMORY[0x1E4F15D20];
    uint64_t v160 = *MEMORY[0x1E4F15EC0];
    id v158 = (id)*MEMORY[0x1E4F15E00];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v324 != v165) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v323 + 1) + 8 * i);
        CMTime v16 = [v15 formatDescriptions];
        BOOL v17 = v16 == 0;

        if (!v17)
        {
          id v18 = (void *)MEMORY[0x1E4F16558];
          char v19 = [v15 metadataForFormat:v163];
          uint64_t v20 = [v18 metadataItemsFromArray:v19 withKey:v160 keySpace:v158];

          if (v20)
          {
            long long v322 = 0u;
            long long v321 = 0u;
            long long v320 = 0u;
            long long v319 = 0u;
            id v176 = v20;
            uint64_t v21 = [v176 countByEnumeratingWithState:&v319 objects:v337 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v320;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v320 != v22) {
                    objc_enumerationMutation(v176);
                  }
                  uint64_t v24 = *(void **)(*((void *)&v319 + 1) + 8 * j);
                  uint64_t v25 = [(VCPVideoInterpolator *)self addInputMediaType:v12 toWriter:v178 forTrack:v15];
                  if (!v25)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 3)
                    {
                      int64_t v106 = VCPLogInstance();
                      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                      {
                        LOWORD(buf.value) = 0;
                        _os_log_impl(&dword_1BBEDA000, v106, OS_LOG_TYPE_ERROR, "Failed to add AVAssetWriterInput", (uint8_t *)&buf, 2u);
                      }
                    }
                    int v96 = -18;
                    id v164 = obj;
                    goto LABEL_130;
                  }
                  objc_msgSend(v25, "setMarksOutputTrackAsEnabled:", objc_msgSend(v15, "isEnabled"));
                  uint64_t v26 = [v24 stringValue];
                  [v177 setObject:v25 forKey:v26];
                }
                uint64_t v21 = [v176 countByEnumeratingWithState:&v319 objects:v337 count:16];
              }
              while (v21);
            }
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v323 objects:v338 count:16];
    }
    while (v13);
  }

  uint64_t v27 = [(VCPVideoInterpolator *)self findLivePhotoInfoOutput:v173];
  uint64_t v161 = *MEMORY[0x1E4F15BE0];
  id v164 = -[VCPVideoInterpolator addInputMediaType:toWriter:forTrack:](self, "addInputMediaType:toWriter:forTrack:");

  if (!v164)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v96 = -18;
      goto LABEL_131;
    }
    uint64_t v108 = VCPLogInstance();
    id v176 = v108;
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v108, OS_LOG_TYPE_ERROR, "Failed to add AVAssetWriterInput", (uint8_t *)&buf, 2u);
    }
LABEL_121:
    int v96 = -18;
    goto LABEL_130;
  }
  uint64_t v28 = [(VCPVideoInterpolator *)self findStyleInfoTrack:v173];
  id v176 = [(VCPVideoInterpolator *)self addInputMediaType:v161 toWriter:v178 forTrack:v28];

  if (!v176)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v109 = VCPLogInstance();
      uint64_t v166 = v109;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v109, OS_LOG_TYPE_ERROR, "Failed to add AVAssetWriterInput", (uint8_t *)&buf, 2u);
      }
      int v96 = -18;
      goto LABEL_129;
    }
    goto LABEL_121;
  }
  uint64_t v29 = [objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v173 error:0];
  uint64_t v166 = v29;
  long long v30 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:self->_originalTrack outputSettings:0];
  if (([v29 canAddOutput:v30] & 1) == 0)
  {
    int v96 = -18;
    goto LABEL_128;
  }
  [v29 addOutput:v30];
  uint64_t v149 = v30;
  long long v31 = [(AVAssetTrack *)self->_originalTrack asset];
  uint64_t v32 = [v31 tracksWithMediaType:v12];

  long long v318 = 0u;
  long long v317 = 0u;
  long long v316 = 0u;
  long long v315 = 0u;
  id v159 = v32;
  uint64_t v33 = [v159 countByEnumeratingWithState:&v315 objects:v336 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v316;
    uint64_t v154 = *MEMORY[0x1E4F15D20];
    uint64_t v152 = *MEMORY[0x1E4F15EC0];
    id v150 = (id)*MEMORY[0x1E4F15E00];
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v316 != v34) {
          objc_enumerationMutation(v159);
        }
        long long v36 = *(void **)(*((void *)&v315 + 1) + 8 * k);
        long long v37 = [v36 formatDescriptions];
        BOOL v38 = v37 == 0;

        if (!v38)
        {
          long long v39 = (void *)MEMORY[0x1E4F16558];
          long long v40 = [v36 metadataForFormat:v154];
          uint64_t v41 = [v39 metadataItemsFromArray:v40 withKey:v152 keySpace:v150];

          if (v41)
          {
            long long v314 = 0u;
            long long v313 = 0u;
            long long v312 = 0u;
            long long v311 = 0u;
            id v168 = v41;
            uint64_t v42 = [v168 countByEnumeratingWithState:&v311 objects:v335 count:16];
            if (v42)
            {
              uint64_t v43 = *(void *)v312;
              do
              {
                for (uint64_t m = 0; m != v42; ++m)
                {
                  if (*(void *)v312 != v43) {
                    objc_enumerationMutation(v168);
                  }
                  unsigned int v45 = *(void **)(*((void *)&v311 + 1) + 8 * m);
                  CMTime v46 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v36 outputSettings:0];
                  if (([v166 canAddOutput:v46] & 1) == 0)
                  {
                    int v96 = -18;
                    uint64_t v153 = (uint64_t)v168;
                    uint64_t v155 = (uint64_t)v159;
                    goto LABEL_125;
                  }
                  [v166 addOutput:v46];
                  char v47 = [v45 stringValue];
                  [v175 setObject:v46 forKey:v47];
                }
                uint64_t v42 = [v168 countByEnumeratingWithState:&v311 objects:v335 count:16];
              }
              while (v42);
            }
          }
        }
      }
      uint64_t v33 = [v159 countByEnumeratingWithState:&v315 objects:v336 count:16];
    }
    while (v33);
  }

  CMTime v48 = (void *)MEMORY[0x1E4F163A0];
  CMTime v49 = [(VCPVideoInterpolator *)self findLivePhotoInfoOutput:v173];
  uint64_t v155 = [v48 assetReaderTrackOutputWithTrack:v49 outputSettings:0];

  char v50 = (void *)v155;
  if (([v166 canAddOutput:v155] & 1) == 0)
  {
    int v96 = -18;
    goto LABEL_127;
  }
  [v166 addOutput:v155];
  CMTime v51 = (void *)MEMORY[0x1E4F163A0];
  CMTime v52 = [(VCPVideoInterpolator *)self findStyleInfoTrack:v173];
  uint64_t v153 = [v51 assetReaderTrackOutputWithTrack:v52 outputSettings:0];

  CMTime v53 = (void *)v153;
  if (([v166 canAddOutput:v153] & 1) == 0)
  {
    int v96 = -18;
    goto LABEL_126;
  }
  [v166 addOutput:v153];
  id v168 = (id)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v174 error:0];
  CMTimeRange v54 = (void *)MEMORY[0x1E4F163A0];
  unsigned int v55 = [v174 tracksWithMediaType:v156];
  CMTimeRange v56 = [v55 firstObject];
  CMTime v46 = [v54 assetReaderTrackOutputWithTrack:v56 outputSettings:0];

  if (([v168 canAddOutput:v46] & 1) == 0)
  {
    int v96 = -18;
    goto LABEL_125;
  }
  [v168 addOutput:v46];
  long long v310 = 0u;
  long long v309 = 0u;
  long long v308 = 0u;
  long long v307 = 0u;
  id v151 = obj;
  uint64_t v57 = [v151 countByEnumeratingWithState:&v307 objects:v334 count:16];
  if (v57)
  {
    uint64_t v146 = *(void *)v308;
    id v144 = (id)*MEMORY[0x1E4F15D20];
    uint64_t v142 = *MEMORY[0x1E4F15EC0];
    uint64_t v140 = *MEMORY[0x1E4F15E00];
    do
    {
      for (uint64_t n = 0; n != v57; ++n)
      {
        if (*(void *)v308 != v146) {
          objc_enumerationMutation(v151);
        }
        unsigned int v59 = *(void **)(*((void *)&v307 + 1) + 8 * n);
        unsigned int v60 = [v59 formatDescriptions];
        BOOL v61 = v60 == 0;

        if (!v61)
        {
          uint64_t v62 = (void *)MEMORY[0x1E4F16558];
          uint64_t v63 = [v59 metadataForFormat:v144];
          unsigned int v64 = [v62 metadataItemsFromArray:v63 withKey:v142 keySpace:v140];

          if (v64)
          {
            long long v306 = 0u;
            long long v305 = 0u;
            long long v304 = 0u;
            long long v303 = 0u;
            id v157 = v64;
            uint64_t v65 = [v157 countByEnumeratingWithState:&v303 objects:v333 count:16];
            if (v65)
            {
              uint64_t v66 = *(void *)v304;
              do
              {
                for (iuint64_t i = 0; ii != v65; ++ii)
                {
                  if (*(void *)v304 != v66) {
                    objc_enumerationMutation(v157);
                  }
                  uint64_t v68 = *(void **)(*((void *)&v303 + 1) + 8 * ii);
                  uint64_t v69 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v59 outputSettings:0];
                  if (([v168 canAddOutput:v69] & 1) == 0)
                  {
                    int v96 = -18;
                    uint64_t v75 = (uint64_t)v157;
                    goto LABEL_139;
                  }
                  [v168 addOutput:v69];
                  v70 = [v68 stringValue];
                  [v171 setObject:v69 forKey:v70];
                }
                uint64_t v65 = [v157 countByEnumeratingWithState:&v303 objects:v333 count:16];
              }
              while (v65);
            }
          }
        }
      }
      uint64_t v57 = [v151 countByEnumeratingWithState:&v307 objects:v334 count:16];
    }
    while (v57);
  }

  char v71 = (void *)MEMORY[0x1E4F163A0];
  v72 = [(VCPVideoInterpolator *)self findLivePhotoInfoOutput:v174];
  id v151 = [v71 assetReaderTrackOutputWithTrack:v72 outputSettings:0];

  if (([v168 canAddOutput:v151] & 1) == 0)
  {
    int v96 = -18;
    goto LABEL_142;
  }
  [v168 addOutput:v151];
  v73 = (void *)MEMORY[0x1E4F163A0];
  char v74 = [(VCPVideoInterpolator *)self findStyleInfoTrack:v174];
  uint64_t v75 = [v73 assetReaderTrackOutputWithTrack:v74 outputSettings:0];

  uint64_t v76 = (void *)v75;
  if (([v168 canAddOutput:v75] & 1) == 0)
  {
    int v96 = -18;
    goto LABEL_141;
  }
  [v168 addOutput:v75];
  id v77 = objc_alloc(MEMORY[0x1E4F163C0]);
  uint64_t v78 = *MEMORY[0x1E4F15BA8];
  long long v79 = (void *)[v77 initWithMediaType:*MEMORY[0x1E4F15BA8] outputSettings:0];
  id v157 = v79;
  [v79 setExpectsMediaDataInRealTime:1];
  if (([v178 canAddInput:v79] & 1) == 0)
  {
    int v96 = -18;
    goto LABEL_140;
  }
  [v178 addInput:v79];
  uint64_t v331 = *MEMORY[0x1E4F151E0];
  v332 = &unk_1F15EB6B8;
  uint64_t v139 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v332 forKeys:&v331 count:1];
  long long v80 = (void *)MEMORY[0x1E4F163A0];
  long long v81 = [v174 tracksWithMediaType:v78];
  CMTimeRange v82 = [v81 firstObject];
  uint64_t v141 = [v80 assetReaderTrackOutputWithTrack:v82 outputSettings:v139];

  if (([v168 canAddOutput:v141] & 1) == 0)
  {
    int v96 = -18;
    goto LABEL_166;
  }
  [v168 addOutput:v141];
  [v170 setObject:v141 forKey:v157];
  [v174 tracksWithMediaType:v161];
  long long v302 = 0u;
  long long v301 = 0u;
  long long v300 = 0u;
  long long v299 = 0u;
  id v145 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v147 = [v145 countByEnumeratingWithState:&v299 objects:v330 count:16];
  if (v147)
  {
    uint64_t v83 = *(void *)v300;
    uint64_t v143 = *MEMORY[0x1E4F52790];
    do
    {
      for (juint64_t j = 0; jj != v147; ++jj)
      {
        if (*(void *)v300 != v83) {
          objc_enumerationMutation(v145);
        }
        CMTimeRange v85 = *(void **)(*((void *)&v299 + 1) + 8 * jj);
        long long v86 = [v85 formatDescriptions];
        CMTimeEpoch v87 = [v86 firstObject];

        if (v87)
        {
          CMTimeRange v88 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v87);
          if (([v88 containsObject:@"mdta/com.apple.quicktime.smartstyle-info"] & 1) == 0
            && ([v88 containsObject:v143] & 1) == 0)
          {
            long long v89 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v85 outputSettings:0];
            if (([v168 canAddOutput:v89] & 1) == 0) {
              goto LABEL_148;
            }
            [v168 addOutput:v89];
            CMTimeEpoch v90 = (void *)[objc_alloc(MEMORY[0x1E4F163C0]) initWithMediaType:v161 outputSettings:0 sourceFormatHint:0];
            if (v85)
            {
              [v85 preferredTransform];
            }
            else
            {
              long long v298 = 0u;
              long long v297 = 0u;
              long long v296 = 0u;
            }
            v295[0] = v296;
            v295[1] = v297;
            v295[2] = v298;
            [v90 setTransform:v295];
            CMTimeRange v91 = [v85 metadata];
            [v90 setMetadata:v91];

            if (([v178 canAddInput:v90] & 1) == 0)
            {

LABEL_148:
              int v96 = -18;
              goto LABEL_165;
            }
            [v178 addInput:v90];
            [v170 setObject:v89 forKey:v90];
          }
        }
      }
      uint64_t v147 = [v145 countByEnumeratingWithState:&v299 objects:v330 count:16];
    }
    while (v147);
  }

  int v92 = [v173 metadata];
  [v178 setMetadata:v92];

  [v178 startWriting];
  uint64_t v93 = (CMTime *)MEMORY[0x1E4F1FA48];
  long long v293 = *MEMORY[0x1E4F1FA48];
  uint64_t v294 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v178 startSessionAtSourceTime:&v293];
  [v166 startReading];
  [v168 startReading];
  CMTime v292 = *v93;
  CMTime v291 = v292;
  CMTime v290 = v292;
  CMTime v289 = *v93;
  CMTime v288 = *v93;
  CMTime v287 = *v93;
  CMTime v286 = v287;
  p_startAdjustedPTS = &self->_startAdjustedPTS;
  long long v95 = *(_OWORD *)&self->_startAdjustedPTS.value;
  int64_t epoch = self->_startAdjustedPTS.epoch;
  long long v284 = v95;
  CMTime v283 = v287;
  int v96 = [(VCPVideoInterpolator *)self appendOutput:v149 toWriterInput:log startTimeStamp:&v286 endTimeStamp:&v284 offset:&v283 duration:&v292];
  if (v96) {
    goto LABEL_165;
  }
  v162 = [v175 keyEnumerator];
  uint64_t v97 = 0;
  while (1)
  {
    long long v98 = [v162 nextObject];

    if (!v98) {
      break;
    }
    if ([v98 isEqualToString:@"com.apple.quicktime.video-map.smart-style-linear-thumbnail"])
    {
      int64_t v99 = [v175 objectForKey:v98];
      CMTime v100 = [v177 objectForKey:v98];
      long long v281 = *(_OWORD *)&v93->value;
      CMTimeEpoch v282 = v93->epoch;
      long long v279 = *(_OWORD *)&p_startAdjustedPTS->value;
      int64_t v280 = self->_startAdjustedPTS.epoch;
      long long v277 = v281;
      CMTimeEpoch v278 = v282;
      int v96 = [(VCPVideoInterpolator *)self appendOutput:v99 toWriterInput:v100 startTimeStamp:&v281 endTimeStamp:&v279 offset:&v277 duration:&v288];

LABEL_96:
      uint64_t v97 = v98;
      if (v96) {
        goto LABEL_163;
      }
    }
    else
    {
      if ([v98 isEqualToString:@"com.apple.quicktime.video-map.smart-style-delta-map"])
      {
        long long v101 = [v175 objectForKey:v98];
        uint64_t v102 = [v177 objectForKey:v98];
        long long v275 = *(_OWORD *)&v93->value;
        CMTimeEpoch v276 = v93->epoch;
        long long v273 = *(_OWORD *)&p_startAdjustedPTS->value;
        int64_t v274 = self->_startAdjustedPTS.epoch;
        long long v271 = v275;
        CMTimeEpoch v272 = v276;
        int v96 = [(VCPVideoInterpolator *)self appendOutput:v101 toWriterInput:v102 startTimeStamp:&v275 endTimeStamp:&v273 offset:&v271 duration:&v290];

        goto LABEL_96;
      }
      CMTime buf = *v93;
      long long v103 = [v175 objectForKey:v98];
      int64_t v104 = [v177 objectForKey:v98];
      long long v269 = *(_OWORD *)&v93->value;
      CMTimeEpoch v270 = v93->epoch;
      long long v267 = *(_OWORD *)&p_startAdjustedPTS->value;
      int64_t v268 = self->_startAdjustedPTS.epoch;
      long long v265 = v269;
      CMTimeEpoch v266 = v270;
      int v96 = [(VCPVideoInterpolator *)self appendOutput:v103 toWriterInput:v104 startTimeStamp:&v269 endTimeStamp:&v267 offset:&v265 duration:&buf];

      if (v96)
      {
LABEL_163:

LABEL_164:
        goto LABEL_165;
      }
      CMTime v289 = buf;
      uint64_t v97 = v98;
    }
  }
  long long v263 = *(_OWORD *)&v93->value;
  CMTimeEpoch v264 = v93->epoch;
  long long v261 = *(_OWORD *)&p_startAdjustedPTS->value;
  int64_t v262 = self->_startAdjustedPTS.epoch;
  long long v259 = v263;
  CMTimeEpoch v260 = v264;
  int v96 = [(VCPVideoInterpolator *)self appendOutput:v155 toWriterInput:v164 startTimeStamp:&v263 endTimeStamp:&v261 offset:&v259 duration:&v291];
  if (v96) {
    goto LABEL_164;
  }
  long long v257 = *(_OWORD *)&v93->value;
  CMTimeEpoch v258 = v93->epoch;
  long long v255 = *(_OWORD *)&p_startAdjustedPTS->value;
  int64_t v256 = self->_startAdjustedPTS.epoch;
  long long v253 = v257;
  CMTimeEpoch v254 = v258;
  int v96 = [(VCPVideoInterpolator *)self appendOutput:v153 toWriterInput:v176 startTimeStamp:&v257 endTimeStamp:&v255 offset:&v253 duration:&v287];
  if (v96) {
    goto LABEL_164;
  }
  long long v251 = *(_OWORD *)&v93->value;
  CMTimeEpoch v252 = v93->epoch;
  long long v249 = *MEMORY[0x1E4F1FA10];
  uint64_t v250 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  long long v247 = *(_OWORD *)&p_startAdjustedPTS->value;
  int64_t v248 = self->_startAdjustedPTS.epoch;
  int v96 = [(VCPVideoInterpolator *)self appendOutput:v46 toWriterInput:log startTimeStamp:&v251 endTimeStamp:&v249 offset:&v247 duration:&v292];
  if (v96) {
    goto LABEL_164;
  }
  v148 = [v171 keyEnumerator];

  long long v111 = 0;
  CMTime v246 = *v93;
  while (1)
  {
    int64_t v112 = [v148 nextObject];

    if (!v112) {
      break;
    }
    if ([v112 isEqualToString:@"com.apple.quicktime.video-map.smart-style-linear-thumbnail"])
    {
      long long v113 = [v171 objectForKey:v112];
      uint64_t v114 = [v177 objectForKey:v112];
      long long v244 = *(_OWORD *)&v93->value;
      CMTimeEpoch v245 = v93->epoch;
      long long v242 = *MEMORY[0x1E4F1FA10];
      uint64_t v243 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
      long long v240 = *(_OWORD *)&p_startAdjustedPTS->value;
      int64_t v241 = self->_startAdjustedPTS.epoch;
      int v96 = [(VCPVideoInterpolator *)self appendOutput:v113 toWriterInput:v114 startTimeStamp:&v244 endTimeStamp:&v242 offset:&v240 duration:&v288];
    }
    else
    {
      if ([v112 isEqualToString:@"com.apple.quicktime.video-map.smart-style-delta-map"])
      {
        long long v115 = [v171 objectForKey:v112];
        CMTimeEpoch v116 = [v177 objectForKey:v112];
        long long v238 = *(_OWORD *)&v93->value;
        CMTimeEpoch v239 = v93->epoch;
        long long v236 = *MEMORY[0x1E4F1FA10];
        uint64_t v237 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
        long long v234 = *(_OWORD *)&p_startAdjustedPTS->value;
        int64_t v235 = self->_startAdjustedPTS.epoch;
        int v96 = [(VCPVideoInterpolator *)self appendOutput:v115 toWriterInput:v116 startTimeStamp:&v238 endTimeStamp:&v236 offset:&v234 duration:&v290];
      }
      else
      {
        CMTime v246 = v289;
        long long v115 = [v171 objectForKey:v112];
        CMTimeEpoch v116 = [v177 objectForKey:v112];
        long long v232 = *(_OWORD *)&v93->value;
        CMTimeEpoch v233 = v93->epoch;
        long long v230 = *MEMORY[0x1E4F1FA10];
        uint64_t v231 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
        long long v228 = *(_OWORD *)&p_startAdjustedPTS->value;
        int64_t v229 = self->_startAdjustedPTS.epoch;
        int v96 = [(VCPVideoInterpolator *)self appendOutput:v115 toWriterInput:v116 startTimeStamp:&v232 endTimeStamp:&v230 offset:&v228 duration:&v246];
      }
    }
    long long v111 = v112;
    if (v96)
    {
LABEL_161:
      v162 = v148;
LABEL_162:

      goto LABEL_164;
    }
  }
  CMTime v289 = v246;
  long long v226 = *(_OWORD *)&v93->value;
  CMTimeEpoch v227 = v93->epoch;
  long long v224 = *MEMORY[0x1E4F1FA10];
  uint64_t v225 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  int64_t v223 = self->_startAdjustedPTS.epoch;
  long long v222 = *(_OWORD *)&p_startAdjustedPTS->value;
  int v96 = [(VCPVideoInterpolator *)self appendOutput:v151 toWriterInput:v164 startTimeStamp:&v226 endTimeStamp:&v224 offset:&v222 duration:&v291];
  if (!v96)
  {
    long long v220 = *(_OWORD *)&v93->value;
    CMTimeEpoch v221 = v93->epoch;
    long long v218 = *MEMORY[0x1E4F1FA10];
    uint64_t v219 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    long long v216 = *(_OWORD *)&p_startAdjustedPTS->value;
    int64_t v217 = self->_startAdjustedPTS.epoch;
    int v96 = [(VCPVideoInterpolator *)self appendOutput:v75 toWriterInput:v176 startTimeStamp:&v220 endTimeStamp:&v218 offset:&v216 duration:&v287];
    if (!v96)
    {
      *(_OWORD *)&v287.value = *(_OWORD *)&v292.value;
      *(_OWORD *)&v291.value = *(_OWORD *)&v292.value;
      *(_OWORD *)&v290.value = *(_OWORD *)&v292.value;
      *(_OWORD *)&v289.value = *(_OWORD *)&v292.value;
      *(_OWORD *)&v288.value = *(_OWORD *)&v292.value;
      p_endAdjustedPTS = &self->_endAdjustedPTS;
      long long v214 = *(_OWORD *)&self->_endAdjustedPTS.value;
      long long v212 = *MEMORY[0x1E4F1FA10];
      v287.int64_t epoch = v292.epoch;
      v291.int64_t epoch = v292.epoch;
      v290.int64_t epoch = v292.epoch;
      v289.int64_t epoch = v292.epoch;
      v288.int64_t epoch = v292.epoch;
      int64_t v215 = self->_endAdjustedPTS.epoch;
      uint64_t v213 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
      CMTime buf = v292;
      CMTime rhs = (CMTime)self->_endAdjustedPTS;
      CMTimeSubtract(&v211, &buf, &rhs);
      int v96 = [(VCPVideoInterpolator *)self appendOutput:v149 toWriterInput:log startTimeStamp:&v214 endTimeStamp:&v212 offset:&v211 duration:&v292];
      if (!v96)
      {
        uint64_t v118 = [v175 keyEnumerator];

        long long v119 = 0;
        v148 = (void *)v118;
        while (1)
        {
          int64_t v112 = [v148 nextObject];

          if (!v112) {
            break;
          }
          if ([v112 isEqualToString:@"com.apple.quicktime.video-map.smart-style-linear-thumbnail"])
          {
            int64_t v120 = [v175 objectForKey:v112];
            long long v121 = [v177 objectForKey:v112];
            long long v209 = *(_OWORD *)&p_endAdjustedPTS->value;
            int64_t v210 = self->_endAdjustedPTS.epoch;
            long long v207 = *MEMORY[0x1E4F1FA10];
            uint64_t v208 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
            CMTime buf = v288;
            *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
            rhs.int64_t epoch = self->_endAdjustedPTS.epoch;
            CMTimeSubtract(&v206, &buf, &rhs);
            int v96 = [(VCPVideoInterpolator *)self appendOutput:v120 toWriterInput:v121 startTimeStamp:&v209 endTimeStamp:&v207 offset:&v206 duration:&v288];
          }
          else
          {
            if ([v112 isEqualToString:@"com.apple.quicktime.video-map.smart-style-delta-map"])
            {
              CMTimeEpoch v122 = [v175 objectForKey:v112];
              CMTime v123 = [v177 objectForKey:v112];
              long long v204 = *(_OWORD *)&p_endAdjustedPTS->value;
              int64_t v205 = self->_endAdjustedPTS.epoch;
              long long v202 = *MEMORY[0x1E4F1FA10];
              uint64_t v203 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
              CMTime buf = v290;
              *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
              rhs.int64_t epoch = self->_endAdjustedPTS.epoch;
              CMTimeSubtract(&v201, &buf, &rhs);
              int v96 = [(VCPVideoInterpolator *)self appendOutput:v122 toWriterInput:v123 startTimeStamp:&v204 endTimeStamp:&v202 offset:&v201 duration:&v290];
            }
            else
            {
              CMTime v246 = v289;
              CMTimeEpoch v122 = [v175 objectForKey:v112];
              CMTime v123 = [v177 objectForKey:v112];
              long long v199 = *(_OWORD *)&p_endAdjustedPTS->value;
              int64_t v200 = self->_endAdjustedPTS.epoch;
              long long v197 = *MEMORY[0x1E4F1FA10];
              uint64_t v198 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
              CMTime buf = v289;
              *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
              rhs.int64_t epoch = self->_endAdjustedPTS.epoch;
              CMTimeSubtract(&v196, &buf, &rhs);
              int v96 = [(VCPVideoInterpolator *)self appendOutput:v122 toWriterInput:v123 startTimeStamp:&v199 endTimeStamp:&v197 offset:&v196 duration:&v246];
            }
          }
          long long v119 = v112;
          if (v96) {
            goto LABEL_161;
          }
        }
        long long v194 = *(_OWORD *)&p_endAdjustedPTS->value;
        int64_t v195 = self->_endAdjustedPTS.epoch;
        long long v192 = *MEMORY[0x1E4F1FA10];
        uint64_t v193 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
        CMTime buf = v291;
        *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
        rhs.int64_t epoch = self->_endAdjustedPTS.epoch;
        CMTimeSubtract(&v191, &buf, &rhs);
        int v96 = [(VCPVideoInterpolator *)self appendOutput:v155 toWriterInput:v164 startTimeStamp:&v194 endTimeStamp:&v192 offset:&v191 duration:&v291];
        if (!v96)
        {
          long long v189 = *(_OWORD *)&p_endAdjustedPTS->value;
          int64_t v190 = self->_endAdjustedPTS.epoch;
          long long v187 = *MEMORY[0x1E4F1FA10];
          uint64_t v188 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
          CMTime buf = v287;
          *(_OWORD *)&rhs.value = *(_OWORD *)&p_endAdjustedPTS->value;
          rhs.int64_t epoch = self->_endAdjustedPTS.epoch;
          CMTimeSubtract(&v186, &buf, &rhs);
          int v96 = [(VCPVideoInterpolator *)self appendOutput:v153 toWriterInput:v176 startTimeStamp:&v189 endTimeStamp:&v187 offset:&v186 duration:&v287];
          if (!v96)
          {
            v162 = [v170 keyEnumerator];

            long long v124 = 0;
            while (1)
            {
              uint64_t v125 = [v162 nextObject];

              if (!v125) {
                break;
              }
              CMTime v126 = [v170 objectForKey:v125];
              int v96 = [(VCPVideoInterpolator *)self appendOutput:v126 toWriterInput:v125];

              long long v124 = (void *)v125;
              if (v96)
              {
                int64_t v112 = v125;
                goto LABEL_162;
              }
            }
            dispatch_semaphore_t v127 = dispatch_semaphore_create(0);
            v184[0] = MEMORY[0x1E4F143A8];
            v184[1] = 3221225472;
            v184[2] = __59__VCPVideoInterpolator_combineVideoSegmentsWithAssetWriter__block_invoke;
            v184[3] = &unk_1E6296FF8;
            int64_t v112 = v127;
            id v185 = v112;
            [v178 finishWritingWithCompletionHandler:v184];
            dispatch_semaphore_wait(v112, 0xFFFFFFFFFFFFFFFFLL);
            CMTime v128 = (void *)MEMORY[0x1E4F166C8];
            uint64_t v129 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_combinedFilePath];
            v130 = [v128 assetWithURL:v129];

            long long v182 = 0u;
            long long v183 = 0u;
            long long v180 = 0u;
            long long v181 = 0u;
            v131 = [v130 tracks];
            uint64_t v132 = [v131 countByEnumeratingWithState:&v180 objects:v329 count:16];
            if (v132)
            {
              uint64_t v133 = *(void *)v181;
              while (2)
              {
                for (kuint64_t k = 0; kk != v132; ++kk)
                {
                  if (*(void *)v181 != v133) {
                    objc_enumerationMutation(v131);
                  }
                  uint64_t v135 = [*(id *)(*((void *)&v180 + 1) + 8 * kk) formatDescriptions];
                  if ((unint64_t)[v135 count] < 2)
                  {
                  }
                  else
                  {
                    BOOL v136 = +[VCPVideoInterpolator allowMultipleFormats];

                    if (!v136)
                    {
                      int v137 = MediaAnalysisLogLevel();
                      if (v137 >= 3)
                      {
                        int v138 = VCPLogInstance();
                        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
                        {
                          LOWORD(buf.value) = 0;
                          _os_log_impl(&dword_1BBEDA000, v138, OS_LOG_TYPE_ERROR, "Multiple format descriptions found", (uint8_t *)&buf, 2u);
                        }
                      }
                      int v96 = -18;
                      goto LABEL_204;
                    }
                  }
                }
                uint64_t v132 = [v131 countByEnumeratingWithState:&v180 objects:v329 count:16];
                if (v132) {
                  continue;
                }
                break;
              }
            }
            int v96 = 0;
LABEL_204:

            goto LABEL_162;
          }
        }
      }
    }
  }

LABEL_165:
LABEL_166:

  uint64_t v69 = (void *)v139;
LABEL_139:

LABEL_140:
  uint64_t v76 = (void *)v75;
LABEL_141:

LABEL_142:
LABEL_125:

  CMTime v53 = (void *)v153;
LABEL_126:

  char v50 = (void *)v155;
LABEL_127:

  long long v30 = v149;
LABEL_128:

LABEL_129:
LABEL_130:

LABEL_131:
  long long v107 = obj;
LABEL_132:

LABEL_133:
  uint64_t v10 = v178;
LABEL_134:

  return v96;
}

intptr_t __59__VCPVideoInterpolator_combineVideoSegmentsWithAssetWriter__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)addInputMediaType:(id)a3 toWriter:(id)a4 forTrack:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((id)*MEMORY[0x1E4F15BB8] == v7)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F163C0]) initWithMediaType:v7 outputSettings:0 sourceFormatHint:0];
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F163C0]);
    uint64_t v11 = [v9 formatDescriptions];
    uint64_t v12 = [v11 firstObject];
    uint64_t v13 = (void *)[v10 initWithMediaType:v7 outputSettings:0 sourceFormatHint:v12];

    if (v9)
    {
LABEL_3:
      [v9 preferredTransform];
      goto LABEL_6;
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
LABEL_6:
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  [v13 setTransform:v16];
  uint64_t v14 = [v9 metadata];
  [v13 setMetadata:v14];

  if ([v8 canAddInput:v13]) {
    [v8 addInput:v13];
  }

  return v13;
}

- (int)appendOutput:(id)a3 toWriterInput:(id)a4 startTimeStamp:(id *)a5 endTimeStamp:(id *)a6 offset:(id *)a7 duration:(id *)a8
{
  id v13 = a3;
  id v18 = a4;
  while (1)
  {
    uint64_t v14 = (opaqueCMSampleBuffer *)[v13 copyNextSampleBuffer];
    uint64_t v15 = v14;
    if (!v14) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v14))
    {
      memset(&v25, 0, sizeof(v25));
      CMSampleBufferGetDecodeTimeStamp(&v25, v15);
      memset(&v24, 0, sizeof(v24));
      CMSampleBufferGetPresentationTimeStamp(&v24, v15);
      memset(&v23, 0, sizeof(v23));
      CMSampleBufferGetDuration(&v23, v15);
      time1.CMTime duration = v25;
      CMTime time2 = (CMTime)*a6;
      if ((CMTimeCompare(&time1.duration, &time2) & 0x80000000) == 0)
      {
        CFRelease(v15);
        break;
      }
      time1.CMTime duration = v25;
      CMTime time2 = (CMTime)*a5;
      if (CMTimeCompare(&time1.duration, &time2) < 0)
      {
        CMSampleBufferRef v16 = v15;
      }
      else
      {
        CMSampleBufferRef sampleBufferOut = 0;
        memset(&v21, 0, sizeof(v21));
        time1.CMTime duration = v25;
        CMTime time2 = (CMTime)*a7;
        CMTimeAdd(&v21, &time1.duration, &time2);
        memset(&v20, 0, sizeof(v20));
        time1.CMTime duration = v24;
        CMTime time2 = (CMTime)*a7;
        CMTimeAdd(&v20, &time1.duration, &time2);
        *(_OWORD *)&time1.duration.value = *MEMORY[0x1E4F1F9F8];
        time1.duration.int64_t epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        time1.presentationTimeStamp = v20;
        time1.decodeTimeStamp = v21;
        CMSampleBufferCreateCopyWithNewTiming(0, v15, 1, &time1, &sampleBufferOut);
        CMSampleBufferRef v16 = sampleBufferOut;
        CFRelease(v15);
        CMTime lhs = (CMTime)*a8;
        CMTime rhs = v23;
        CMTimeAdd(&time2, &lhs, &rhs);
        *(CMTime *)a8 = time2;
        if (!v16 || ([v18 appendSampleBuffer:v16] & 1) == 0) {
          break;
        }
      }
      uint64_t v15 = v16;
    }
    CFRelease(v15);
  }

  return 0;
}

- (int)appendOutput:(id)a3 toWriterInput:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  while ([v6 isReadyForMoreMediaData])
  {
    id v7 = (const void *)[v5 copyNextSampleBuffer];
    if (!v7) {
      break;
    }
    if (([v6 appendSampleBuffer:v7] & 1) == 0)
    {
      CFRelease(v7);
      break;
    }
    CFRelease(v7);
  }

  return 0;
}

- (int)checkFirstDisplayTimeForTrack:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F16378]);
  id v5 = [(AVAssetTrack *)self->_originalTrack asset];
  id v6 = (void *)[v4 initWithAsset:v5 error:0];

  id v7 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:self->_originalTrack outputSettings:0];
  [v6 addOutput:v7];
  if ([v6 startReading])
  {
    id v8 = (CMTime *)MEMORY[0x1E4F1FA48];
    while (1)
    {
      id v9 = (opaqueCMSampleBuffer *)[v7 copyNextSampleBuffer];
      id v10 = v9;
      if (!v9) {
        break;
      }
      if (CMSampleBufferGetNumSamples(v9))
      {
        memset(&v13, 0, sizeof(v13));
        CMSampleBufferGetOutputPresentationTimeStamp(&v13, v10);
        CMTime time1 = v13;
        CMTime time2 = *v8;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v11 = VCPLogInstance();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              LOWORD(time1.value) = 0;
              _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "Do not handle videos with Edits", (uint8_t *)&time1, 2u);
            }
          }
          CFRelease(v10);
          LODWORD(v10) = -18;
          break;
        }
      }
      CFRelease(v10);
    }
  }
  else
  {
    LODWORD(v10) = -19;
  }

  return (int)v10;
}

- (BOOL)processAborted
{
  return self->_processAborted;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)adjustedTimeRange
{
  objc_copyStruct(retstr, &self->_cancelled + 1, 48, 1, 0);
  return result;
}

- (BOOL)enableStyle
{
  return self->_enableStyle;
}

- (BOOL)hasStyleApplied
{
  return self->_hasStyleApplied;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxInputToOutputMap, 0);
  objc_storeStrong((id *)&self->_auxAssetReader, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_unstyledImagePixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_deltaMapPixelBufferPool.value_);
  objc_storeStrong((id *)&self->_deltaTrackDecoder, 0);
  objc_storeStrong((id *)&self->_previousSmartStyleMetadata, 0);
  objc_storeStrong((id *)&self->_smartStyleMetadata, 0);
  objc_storeStrong((id *)&self->_smartStyleUtilities, 0);
  objc_storeStrong((id *)&self->_intraFrameList, 0);
  objc_storeStrong((id *)&self->_deltaTrack, 0);
  objc_storeStrong((id *)&self->_originalTrack, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_combinedFilePath, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_previousUnstyledFrame, 0);
  objc_storeStrong((id *)&self->_previousFrame, 0);
  objc_storeStrong((id *)&self->_frameInterpolator, 0);
  objc_storeStrong((id *)&self->_frameInsertionLists, 0);
}

- (id).cxx_construct
{
  *((void *)self + 32) = 0;
  *((void *)self + 33) = 0;
  return self;
}

@end