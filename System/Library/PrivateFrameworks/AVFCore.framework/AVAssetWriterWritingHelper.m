@interface AVAssetWriterWritingHelper
+ (id)finalStepWorkaroundOperationWithFigAssetWriter:(OpaqueFigAssetWriter *)a3;
+ (id)finishWritingDelegateOperationWithAssetWriter:(id)a3 andFigAssetWriter:(OpaqueFigAssetWriter *)a4 andDelegate:(id)a5;
+ (id)prepareInputsOperationsWithInputs:(id)a3;
- (AVAssetWriterWritingHelper)initWithConfigurationState:(id)a3 assetWriter:(id)a4;
- (AVAssetWriterWritingHelper)initWithConfigurationState:(id)a3 assetWriter:(id)a4 error:(id *)a5;
- (BOOL)_isDefunct;
- (BOOL)areAllInputsPreferredMediaChunkAlignmentEqualTo:(int64_t)a3;
- (BOOL)checkAVAssetWriterInputConfigurationToOutputSegmentDataForFragmentedMPEG4FileTypeProfile:(id)a3 preferredOutputSegmentInterval:(id *)a4 returningDebugDescription:(id *)a5;
- (BOOL)checkConfigurationToOutputSegmentDataReturningDebugDescription:(id *)a3;
- (BOOL)hasProRes4KHighFPSVideoOutputSetting;
- (BOOL)hasProResVideoOutputSetting;
- (BOOL)isConfiguredForFragmentedMPEG4;
- (BOOL)isOutputFileOnExternalStorageDevice;
- (OpaqueFigAssetWriter)_retainedFigAssetWriter;
- (id)_makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:(id)a3;
- (id)_transitionToFinishWritingHelperWithFinishWritingOperations:(id)a3;
- (id)figTrackReferences;
- (id)storageSpacePreallocationSize;
- (id)writerInputForTrackID:(int)a3;
- (int64_t)status;
- (void)cancelWriting;
- (void)dealloc;
- (void)didReceiveFigAssetWriterNotificationWithSuccess:(BOOL)a3 error:(id)a4;
- (void)endSessionAtSourceTime:(id *)a3;
- (void)finishWriting;
- (void)finishWritingWithCompletionHandler:(id)a3;
- (void)flushSegment;
- (void)prepareEncodedSampleBuffersForPaddedWrites;
- (void)setAllInputsFigPreferredChunkAlignmentTo:(int64_t)a3;
- (void)startSessionAtSourceTime:(id *)a3;
- (void)transitionToFailedStatusWithError:(id)a3;
@end

@implementation AVAssetWriterWritingHelper

- (AVAssetWriterWritingHelper)initWithConfigurationState:(id)a3 assetWriter:(id)a4
{
  return [(AVAssetWriterWritingHelper *)self initWithConfigurationState:a3 assetWriter:a4 error:0];
}

- (AVAssetWriterWritingHelper)initWithConfigurationState:(id)a3 assetWriter:(id)a4 error:(id *)a5
{
  v187[1] = *MEMORY[0x1E4F143B8];
  v181.receiver = self;
  v181.super_class = (Class)AVAssetWriterWritingHelper;
  v182 = 0;
  v7 = [(AVAssetWriterHelper *)&v181 initWithConfigurationState:a3];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(NSURL *)[(AVAssetWriterHelper *)v7 outputURL] pathExtension];
    if (v9 && [(id)AVUnsupportedOutputURLPathExtensions() containsObject:v9])
    {
      uint64_t v10 = -11843;
      v11 = 0;
LABEL_9:
      v182 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", v10, v11);

      v8 = 0;
      goto LABEL_10;
    }
    *(void *)time1 = 0;
    if (![(AVAssetWriterWritingHelper *)v8 checkConfigurationToOutputSegmentDataReturningDebugDescription:time1])
    {
      uint64_t v186 = *MEMORY[0x1E4F28228];
      v187[0] = *(void *)time1;
      v11 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v187 forKeys:&v186 count:1];
      uint64_t v10 = -11875;
      goto LABEL_9;
    }
    uint64_t v154 = [(AVAssetWriterHelper *)v8 outputURL];
    [(AVAssetWriterHelper *)v8 delegate];
    if (objc_opt_respondsToSelector()) {
      int v151 = 1;
    }
    else {
      int v151 = objc_opt_respondsToSelector();
    }
    v152 = a5;
    if (objc_opt_respondsToSelector()) {
      int v150 = 1;
    }
    else {
      int v150 = objc_opt_respondsToSelector();
    }
    v13 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAssetWriterHelper shouldOptimizeForNetworkUse](v8, "shouldOptimizeForNetworkUse"));
    v15 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, *MEMORY[0x1E4F32550], 0);
    v16 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v17 = [(AVMediaFileType *)[(AVAssetWriterHelper *)v8 mediaFileType] figFormatReaderFileFormat];
    v153 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, *MEMORY[0x1E4F32C18], 0);
    CFRunLoopGetCurrent();
    uint64_t v18 = [(AVAssetWriterHelper *)v8 directoryForTemporaryFiles];
    v19 = +[AVMediaFileType figFileTypeProfileFromAVFileTypeProfile:[(AVAssetWriterHelper *)v8 outputFileTypeProfile]];
    long long v177 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    v20 = [(AVAssetWriterHelper *)v8 inputs];
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v177 objects:v185 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      LOBYTE(v23) = 0;
      uint64_t v24 = *(void *)v178;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v178 != v24) {
            objc_enumerationMutation(v20);
          }
          if (v23) {
            int v23 = 1;
          }
          else {
            int v23 = [*(id *)(*((void *)&v177 + 1) + 8 * i) expectsMediaDataInRealTime];
          }
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v177 objects:v185 count:16];
      }
      while (v22);
      if (v18) {
        goto LABEL_28;
      }
    }
    else
    {
      int v23 = 0;
      if (v18) {
LABEL_28:
      }
        [v15 setObject:v18 forKey:*MEMORY[0x1E4F344D8]];
    }
    if (v23) {
      [v15 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F32558]];
    }
    if (!FigGetCFPreferenceBooleanWithDefault())
    {
      int v28 = 0;
      if (!v23) {
        goto LABEL_50;
      }
LABEL_46:
      if ([(AVAssetWriterWritingHelper *)v8 isOutputFileOnExternalStorageDevice])
      {
        if ([(AVAssetWriterWritingHelper *)v8 hasProRes4KHighFPSVideoOutputSetting])
        {
          uint64_t v29 = [(AVAssetWriterWritingHelper *)v8 storageSpacePreallocationSize];
          if (v29) {
            [v15 setObject:v29 forKey:*MEMORY[0x1E4F32570]];
          }
        }
      }
LABEL_50:
      if ([(AVAssetWriterHelper *)v8 usesVirtualCaptureCard]) {
        [v15 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F32568]];
      }
      if (v19) {
        [v153 setObject:v19 forKey:*MEMORY[0x1E4F32C90]];
      }
      v8->_figAssetWriterCallbackContextToken = objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "registerCallbackContextObject:", a4);
      if ([(AVAssetWriterHelper *)v8 requiresInProcessOperation])
      {
        if (v154)
        {
          uint64_t v30 = FigAssetWriterCreateWithURL();
        }
        else
        {
          if (((v151 | v150) & 1) == 0) {
            goto LABEL_65;
          }
          uint64_t v30 = FigAssetWriterCreateForWritingFragmentedData();
        }
      }
      else if (v154)
      {
        uint64_t v30 = FigAssetWriterRemoteCreateWithURL();
      }
      else
      {
        if (((v151 | v150) & 1) == 0) {
          goto LABEL_65;
        }
        uint64_t v30 = FigAssetWriterRemoteCreateForWritingFragmentedData();
      }
      uint64_t v31 = v30;
      if (v30)
      {

        id v32 = +[AVAssetWriter _errorForOSStatus:v31];
        goto LABEL_72;
      }
LABEL_65:
      if (v8->_figAssetWriter)
      {
        v33 = [[AVAssetWriterFigAssetWriterNotificationHandler alloc] initWithFigAssetWriter:v8->_figAssetWriter];
        v8->_notificationHandler = v33;
        [(AVAssetWriterFigAssetWriterNotificationHandler *)v33 setDelegate:v8];
        long long v175 = 0uLL;
        uint64_t v176 = 0;
        [(AVAssetWriterHelper *)v8 movieFragmentInterval];
        if ((BYTE12(v175) & 0x1D) == 1)
        {
          *(_OWORD *)time1 = v175;
          *(void *)&time1[16] = v176;
          *(_OWORD *)time2 = *MEMORY[0x1E4F1FA48];
          *(void *)&time2[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
          if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1)
          {
            CFAllocatorRef v34 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            *(_OWORD *)time1 = v175;
            *(void *)&time1[16] = v176;
            CFDictionaryRef v35 = CMTimeCopyAsDictionary((CMTime *)time1, v34);
            if (v35)
            {
              CFDictionaryRef v36 = v35;
              figAssetWriter = v8->_figAssetWriter;
              uint64_t v38 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v38) {
                uint64_t v39 = v38;
              }
              else {
                uint64_t v39 = 0;
              }
              v40 = *(void (**)(OpaqueFigAssetWriter *, void, CFDictionaryRef))(v39 + 56);
              if (v40) {
                v40(figAssetWriter, *MEMORY[0x1E4F32D00], v36);
              }
              CFRelease(v36);
            }
          }
        }
        long long v173 = 0uLL;
        uint64_t v174 = 0;
        [(AVAssetWriterHelper *)v8 initialMovieFragmentInterval];
        if ((BYTE12(v173) & 0x1D) == 1)
        {
          *(_OWORD *)time1 = v173;
          *(void *)&time1[16] = v174;
          *(_OWORD *)time2 = *MEMORY[0x1E4F1FA48];
          *(void *)&time2[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
          if (CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1)
          {
            CFAllocatorRef v41 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            *(_OWORD *)time1 = v173;
            *(void *)&time1[16] = v174;
            CFDictionaryRef v42 = CMTimeCopyAsDictionary((CMTime *)time1, v41);
            if (v42)
            {
              CFDictionaryRef v43 = v42;
              v44 = v8->_figAssetWriter;
              uint64_t v45 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v45) {
                uint64_t v46 = v45;
              }
              else {
                uint64_t v46 = 0;
              }
              v47 = *(void (**)(OpaqueFigAssetWriter *, void, CFDictionaryRef))(v46 + 56);
              if (v47) {
                v47(v44, *MEMORY[0x1E4F32CC8], v43);
              }
              CFRelease(v43);
            }
          }
        }
        long long v171 = 0uLL;
        uint64_t v172 = 0;
        [(AVAssetWriterHelper *)v8 preferredOutputSegmentInterval];
        *(_OWORD *)time1 = v171;
        *(void *)&time1[16] = v172;
        *(_OWORD *)time2 = *MEMORY[0x1E4F1F9F0];
        *(void *)&time2[16] = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
        if (!CMTimeCompare((CMTime *)time1, (CMTime *)time2)
          || (BYTE12(v171) & 0x1D) == 1
          && (*(_OWORD *)time1 = v171,
              *(void *)&time1[16] = v172,
              *(_OWORD *)time2 = *MEMORY[0x1E4F1FA48],
              *(void *)&time2[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16),
              CMTimeCompare((CMTime *)time1, (CMTime *)time2) >= 1))
        {
          CFAllocatorRef v48 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          *(_OWORD *)time1 = v171;
          *(void *)&time1[16] = v172;
          CFDictionaryRef v49 = CMTimeCopyAsDictionary((CMTime *)time1, v48);
          if (v49)
          {
            CFDictionaryRef v50 = v49;
            uint64_t FigBaseObject = FigAssetWriterGetFigBaseObject();
            uint64_t v52 = *(void *)(CMBaseObjectGetVTable() + 8);
            if (v52) {
              uint64_t v53 = v52;
            }
            else {
              uint64_t v53 = 0;
            }
            v54 = *(void (**)(uint64_t, void, CFDictionaryRef))(v53 + 56);
            if (v54) {
              v54(FigBaseObject, *MEMORY[0x1E4F32590], v50);
            }
            CFRelease(v50);
          }
        }
        long long v169 = 0uLL;
        uint64_t v170 = 0;
        [(AVAssetWriterHelper *)v8 initialSegmentStartTime];
        if ((BYTE12(v169) & 0x1D) == 1)
        {
          CFAllocatorRef v55 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          *(_OWORD *)time1 = v169;
          *(void *)&time1[16] = v170;
          CFDictionaryRef v56 = CMTimeCopyAsDictionary((CMTime *)time1, v55);
          if (v56)
          {
            CFDictionaryRef v57 = v56;
            uint64_t v58 = FigAssetWriterGetFigBaseObject();
            uint64_t v59 = *(void *)(CMBaseObjectGetVTable() + 8);
            if (v59) {
              uint64_t v60 = v59;
            }
            else {
              uint64_t v60 = 0;
            }
            v61 = *(void (**)(uint64_t, void, CFDictionaryRef))(v60 + 56);
            if (v61) {
              v61(v58, *MEMORY[0x1E4F32578], v57);
            }
            CFRelease(v57);
          }
        }
        uint64_t v62 = [(AVAssetWriterHelper *)v8 initialMovieFragmentSequenceNumber];
        if (v62 >= 1)
        {
          v63 = v8->_figAssetWriter;
          uint64_t v64 = [MEMORY[0x1E4F28ED0] numberWithInteger:v62];
          uint64_t v65 = *(void *)(CMBaseObjectGetVTable() + 16);
          uint64_t v66 = v65 ? v65 : 0;
          v67 = *(void (**)(OpaqueFigAssetWriter *, void, uint64_t))(v66 + 56);
          if (v67) {
            v67(v63, *MEMORY[0x1E4F32D28], v64);
          }
        }
        if ([(AVAssetWriterHelper *)v8 producesCombinableFragments])
        {
          v68 = v8->_figAssetWriter;
          uint64_t v69 = *(void *)(CMBaseObjectGetVTable() + 16);
          uint64_t v70 = v69 ? v69 : 0;
          v71 = *(void (**)(OpaqueFigAssetWriter *, void, void))(v70 + 56);
          if (v71) {
            v71(v68, *MEMORY[0x1E4F32D40], *MEMORY[0x1E4F1CFD0]);
          }
        }
        long long v167 = 0uLL;
        uint64_t v168 = 0;
        [(AVAssetWriterHelper *)v8 overallDurationHint];
        if (BYTE12(v167))
        {
          CFAllocatorRef v72 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          *(_OWORD *)time1 = v167;
          *(void *)&time1[16] = v168;
          CFDictionaryRef v73 = CMTimeCopyAsDictionary((CMTime *)time1, v72);
          if (v73)
          {
            CFDictionaryRef v74 = v73;
            v75 = v8->_figAssetWriter;
            uint64_t v76 = *(void *)(CMBaseObjectGetVTable() + 16);
            if (v76) {
              uint64_t v77 = v76;
            }
            else {
              uint64_t v77 = 0;
            }
            v78 = *(void (**)(OpaqueFigAssetWriter *, void, CFDictionaryRef))(v77 + 56);
            if (v78) {
              v78(v75, *MEMORY[0x1E4F32CF8], v74);
            }
            CFRelease(v74);
          }
        }
        v79 = [(AVAssetWriterHelper *)v8 metadata];
        if (v79)
        {
          v80 = v79;
          if ([(NSArray *)v79 count])
          {
            id v81 = +[AVMetadataItem _figMetadataPropertyFromMetadataItems:v80];
            uint64_t v82 = FigAssetWriterGetFigBaseObject();
            uint64_t v83 = *(void *)(CMBaseObjectGetVTable() + 8);
            uint64_t v84 = v83 ? v83 : 0;
            v85 = *(void (**)(uint64_t, void, id))(v84 + 56);
            if (v85) {
              v85(v82, *MEMORY[0x1E4F32588], v81);
            }
          }
        }
        int v86 = [(AVAssetWriterHelper *)v8 movieTimeScale];
        if (v86)
        {
          v87 = v8->_figAssetWriter;
          uint64_t v88 = [MEMORY[0x1E4F28ED0] numberWithInteger:v86];
          uint64_t v89 = *(void *)(CMBaseObjectGetVTable() + 16);
          uint64_t v90 = v89 ? v89 : 0;
          v91 = *(void (**)(OpaqueFigAssetWriter *, void, uint64_t))(v90 + 56);
          if (v91) {
            v91(v87, *MEMORY[0x1E4F32D18], v88);
          }
        }
        long long v166 = 0u;
        memset(time1, 0, sizeof(time1));
        [(AVAssetWriterHelper *)v8 preferredTransform];
        *(_OWORD *)time2 = *(_OWORD *)time1;
        *(_OWORD *)&time2[16] = *(_OWORD *)&time1[16];
        long long v164 = v166;
        v92 = (const void *)FigCreate3x3MatrixArrayFromCGAffineTransform();
        v93 = v8->_figAssetWriter;
        uint64_t v94 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v94) {
          uint64_t v95 = v94;
        }
        else {
          uint64_t v95 = 0;
        }
        v96 = *(void (**)(OpaqueFigAssetWriter *, void, const void *))(v95 + 56);
        if (v96) {
          v96(v93, *MEMORY[0x1E4F32D08], v92);
        }
        if (v92) {
          CFRelease(v92);
        }
        [(AVAssetWriterHelper *)v8 preferredVolume];
        v97 = v8->_figAssetWriter;
        uint64_t v98 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:");
        uint64_t v99 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v99) {
          uint64_t v100 = v99;
        }
        else {
          uint64_t v100 = 0;
        }
        v101 = *(void (**)(OpaqueFigAssetWriter *, void, uint64_t))(v100 + 56);
        if (v101) {
          v101(v97, *MEMORY[0x1E4F32D38], v98);
        }
        [(AVAssetWriterHelper *)v8 preferredRate];
        v102 = v8->_figAssetWriter;
        uint64_t v103 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:");
        uint64_t v104 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v104) {
          uint64_t v105 = v104;
        }
        else {
          uint64_t v105 = 0;
        }
        v106 = *(void (**)(OpaqueFigAssetWriter *, void, uint64_t))(v105 + 56);
        if (v106) {
          v106(v102, *MEMORY[0x1E4F34810], v103);
        }
        uint64_t v107 = [(AVAssetWriterHelper *)v8 singlePassFileSize];
        uint64_t v108 = [(AVAssetWriterHelper *)v8 singlePassMediaDataSize];
        if (v107)
        {
          uint64_t v109 = v108;
          if (v108)
          {
            v110 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v111 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v107];
            uint64_t v112 = *MEMORY[0x1E4F32CB8];
            uint64_t v113 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v109];
            uint64_t v114 = objc_msgSend(v110, "dictionaryWithObjectsAndKeys:", v111, v112, v113, *MEMORY[0x1E4F32CB0], 0);
            v115 = v8->_figAssetWriter;
            uint64_t v116 = *(void *)(CMBaseObjectGetVTable() + 16);
            uint64_t v117 = v116 ? v116 : 0;
            v118 = *(void (**)(OpaqueFigAssetWriter *, void, uint64_t))(v117 + 56);
            if (v118) {
              v118(v115, *MEMORY[0x1E4F32D60], v114);
            }
          }
        }
        long long v161 = 0u;
        long long v162 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        v119 = [(AVAssetWriterHelper *)v8 inputs];
        uint64_t v120 = [(NSArray *)v119 countByEnumeratingWithState:&v159 objects:v184 count:16];
        if (v120)
        {
          uint64_t v121 = v120;
          LOBYTE(v122) = 0;
          uint64_t v123 = *(void *)v160;
          do
          {
            for (uint64_t j = 0; j != v121; ++j)
            {
              if (*(void *)v160 != v123) {
                objc_enumerationMutation(v119);
              }
              if (v122) {
                int v122 = 1;
              }
              else {
                int v122 = [*(id *)(*((void *)&v159 + 1) + 8 * j) maximizePowerEfficiency];
              }
            }
            uint64_t v121 = [(NSArray *)v119 countByEnumeratingWithState:&v159 objects:v184 count:16];
          }
          while (v121);
          if (v122)
          {
            uint64_t v125 = FigAssetWriterGetFigBaseObject();
            uint64_t v126 = *(void *)(CMBaseObjectGetVTable() + 8);
            uint64_t v127 = v126 ? v126 : 0;
            v128 = *(void (**)(uint64_t, void, void))(v127 + 56);
            if (v128) {
              v128(v125, *MEMORY[0x1E4F32580], *MEMORY[0x1E4F1CFD0]);
            }
          }
        }
        long long v157 = 0u;
        long long v158 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        v129 = [(AVAssetWriterHelper *)v8 inputs];
        uint64_t v130 = [(NSArray *)v129 countByEnumeratingWithState:&v155 objects:v183 count:16];
        if (v130)
        {
          uint64_t v131 = v130;
          uint64_t v132 = *(void *)v156;
          while (2)
          {
            for (uint64_t k = 0; k != v131; ++k)
            {
              if (*(void *)v156 != v132) {
                objc_enumerationMutation(v129);
              }
              if ((objc_msgSend(*(id *)(*((void *)&v155 + 1) + 8 * k), "_prepareForWritingWithFigAssetWriter:mediaFileType:error:", v8->_figAssetWriter, -[AVAssetWriterHelper mediaFileType](v8, "mediaFileType"), &v182) & 1) == 0)
              {
                if (!v182) {
                  v182 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
                }

                v8 = 0;
                goto LABEL_209;
              }
            }
            uint64_t v131 = [(NSArray *)v129 countByEnumeratingWithState:&v155 objects:v183 count:16];
            if (v131) {
              continue;
            }
            break;
          }
        }
        id v134 = [(AVAssetWriterWritingHelper *)v8 figTrackReferences];
        v135 = v8->_figAssetWriter;
        uint64_t v136 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v136) {
          uint64_t v137 = v136;
        }
        else {
          uint64_t v137 = 0;
        }
        v138 = *(void (**)(OpaqueFigAssetWriter *, void, id))(v137 + 56);
        if (v138) {
          v138(v135, *MEMORY[0x1E4F32D50], v134);
        }
        uint64_t v139 = [v134 objectForKey:*MEMORY[0x1E4F34AF0]];
        if (v139)
        {
          v140 = (void *)v139;
          if ([(AVAssetWriterWritingHelper *)v8 isConfiguredForFragmentedMPEG4])
          {
            if ([v140 count])
            {
              unint64_t v141 = 0;
              uint64_t v142 = *MEMORY[0x1E4F32E40];
              do
              {
                v143 = (void *)[v140 objectAtIndex:v141];
                if (v143)
                {
                  uint64_t v144 = [v143 intValue];
                  v145 = objc_msgSend(-[AVAssetWriterWritingHelper writerInputForTrackID:](v8, "writerInputForTrackID:", v144), "mediaDataLocation");
                  if (([v145 isEqualToString:@"AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData"] & 1) != 0|| objc_msgSend(v145, "isEqualToString:", @"AVAssetWriterInputMediaDataLocationSparselyInterleavedWithMainMediaData"))
                  {
                    v146 = v8->_figAssetWriter;
                    uint64_t v147 = *(void *)(CMBaseObjectGetVTable() + 16);
                    uint64_t v148 = v147 ? v147 : 0;
                    v149 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, void *))(v148 + 64);
                    if (v149) {
                      v149(v146, v144, v142, &unk_1EE5E1830);
                    }
                  }
                }
                v141 += 2;
              }
              while (v141 < [v140 count]);
            }
          }
        }
        if (v28) {
          [(AVAssetWriterWritingHelper *)v8 setAllInputsFigPreferredChunkAlignmentTo:0x4000];
        }
        v8->_figAssetWriterAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avassetwriter.writing.assetwriteraccessqueue", 0);
LABEL_209:
        a5 = v152;
        if (!v152) {
          return v8;
        }
        goto LABEL_11;
      }

      id v32 = (id)AVLocalizedError(@"AVFoundationErrorDomain", -11800, 0);
LABEL_72:
      v8 = 0;
      v182 = v32;
      goto LABEL_209;
    }
    if (v154) {
      int v26 = v23;
    }
    else {
      int v26 = 0;
    }
    if (v26 == 1
      && [(AVAssetWriterWritingHelper *)v8 hasProResVideoOutputSetting]
      && [(AVAssetWriterWritingHelper *)v8 areAllInputsPreferredMediaChunkAlignmentEqualTo:0])
    {
      int v27 = 1;
    }
    else
    {
      int v27 = 0;
      int v28 = 0;
      if (![(AVAssetWriterWritingHelper *)v8 areAllInputsPreferredMediaChunkAlignmentEqualTo:0x4000])goto LABEL_41; {
    }
      }
    [v15 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F32560]];
    [(AVAssetWriterWritingHelper *)v8 prepareEncodedSampleBuffersForPaddedWrites];
    int v28 = v27;
LABEL_41:
    if (!v23) {
      goto LABEL_50;
    }
    goto LABEL_46;
  }
LABEL_10:
  if (a5) {
LABEL_11:
  }
    *a5 = v182;
  return v8;
}

- (id)writerInputForTrackID:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(AVAssetWriterHelper *)self inputs];
  id v5 = (id)[(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if ([v9 outputTrackID] == a3)
        {
          id v5 = v9;
          return v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = (id)[(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (BOOL)isConfiguredForFragmentedMPEG4
{
  v3 = [(AVAssetWriterHelper *)self outputFileTypeProfile];
  int v4 = [(NSString *)[(AVMediaFileType *)[(AVAssetWriterHelper *)self mediaFileType] UTI] isEqual:@"public.mpeg-4"];
  if (v4)
  {
    if ([(NSString *)v3 isEqualToString:@"MPEG4AppleHLS"])
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = [(NSString *)v3 isEqualToString:@"MPEG4CMAFCompliant"];
    }
  }
  return v4;
}

- (BOOL)checkConfigurationToOutputSegmentDataReturningDebugDescription:(id *)a3
{
  id v5 = [(AVAssetWriterHelper *)self outputURL];
  [(AVAssetWriterHelper *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int v6 = 1;
  }
  else {
    int v6 = objc_opt_respondsToSelector();
  }
  if (objc_opt_respondsToSelector()) {
    int v7 = 1;
  }
  else {
    int v7 = objc_opt_respondsToSelector();
  }
  uint64_t v22 = 0;
  int v8 = v6 ^ 1;
  if (v5 && (v8 & 1) == 0)
  {
    LOBYTE(v8) = 0;
    uint64_t v9 = @"The outputURL and the delegate method to output segment data cannot be specified at same time. Only one of them must be specified.";
    goto LABEL_52;
  }
  int v10 = v7 ^ 1;
  if (v5 && (v10 & 1) == 0)
  {
    LOBYTE(v8) = 0;
    uint64_t v9 = @"The outputURL and the delegate method to produce fragmented data cannot be specified at same time. Only one of them must be specified.";
    goto LABEL_52;
  }
  if (((v8 | v10) & 1) == 0)
  {
    LOBYTE(v8) = 0;
    uint64_t v9 = @"The delegate method to output segment data and the delegate method to produce fragmented data cannot be specified at same time. Only one of them must be specified.";
    goto LABEL_52;
  }
  if (!((v5 != 0) | (v6 | v7) & 1))
  {
    LOBYTE(v8) = 0;
    uint64_t v9 = @"Neither the outputURL nor the delegate method to output segment data is specified. One of them must be specified.";
    goto LABEL_52;
  }
  long long v11 = [(AVAssetWriterHelper *)self outputFileTypeProfile];
  int v12 = [(NSString *)v11 isEqualToString:@"MPEG4AppleHLS"]
     || [(NSString *)v11 isEqualToString:@"MPEG4CMAFCompliant"];
  memset(&v21, 0, sizeof(v21));
  if (self) {
    [(AVAssetWriterHelper *)self preferredOutputSegmentInterval];
  }
  CMTime time1 = v21;
  long long v17 = *MEMORY[0x1E4F1F9F0];
  *(_OWORD *)&time2.value = *MEMORY[0x1E4F1F9F0];
  CMTimeEpoch v13 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  time2.epoch = v13;
  if (!CMTimeCompare(&time1, &time2))
  {
    if (v6) {
      goto LABEL_28;
    }
    if (v12) {
      goto LABEL_43;
    }
    goto LABEL_50;
  }
  if ((v21.flags & 0x1D) == 1)
  {
    CMTime time1 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime time2 = v21;
    int32_t v14 = CMTimeCompare(&time1, &time2);
    if (v6)
    {
      if ((v14 & 0x80000000) == 0)
      {
        LOBYTE(v8) = 0;
        uint64_t v9 = @"The value of the preferredOutputSegmentInterval property must be kCMTimeIndefinite or a positive numeric time to output segment data.";
        goto LABEL_52;
      }
LABEL_28:
      memset(&time1, 0, sizeof(time1));
      if (self) {
        [(AVAssetWriterHelper *)self initialSegmentStartTime];
      }
      CMTime time2 = v21;
      *(_OWORD *)&v18.value = v17;
      v18.epoch = v13;
      if (CMTimeCompare(&time2, &v18) && (time1.flags & 0x1D) != 1)
      {
        LOBYTE(v8) = 0;
        uint64_t v9 = @"The value of the initialSegmentStartTime property must be a numeric time to output segment data.";
        goto LABEL_52;
      }
      v15 = [(AVMediaFileType *)[(AVAssetWriterHelper *)self mediaFileType] UTI];
      if ([(NSString *)v15 isEqual:@"public.mpeg-4"])
      {
        if (v12)
        {
          CMTime time2 = v21;
          LOBYTE(v8) = [(AVAssetWriterWritingHelper *)self checkAVAssetWriterInputConfigurationToOutputSegmentDataForFragmentedMPEG4FileTypeProfile:v11 preferredOutputSegmentInterval:&time2 returningDebugDescription:&v22];
          uint64_t v9 = v22;
        }
        else
        {
          LOBYTE(v8) = 0;
          uint64_t v9 = @"The value of the outputFileTypeProfile property must be file type profile AppleHLS or CMAFCompliant to output segment data.";
        }
        goto LABEL_52;
      }
      if (([(NSString *)v15 isEqual:@"org.w3.webvtt"] & 1) == 0)
      {
        uint64_t v9 = (__CFString *)[NSString stringWithFormat:@"AVAssetWriter does not supports file type %@ if the delegate method to output segment data is implemented.", v15];
        goto LABEL_44;
      }
LABEL_49:
      uint64_t v9 = 0;
      LOBYTE(v8) = 1;
      goto LABEL_52;
    }
    if (v12)
    {
LABEL_43:
      uint64_t v9 = (__CFString *)[NSString stringWithFormat:@"AVAssetWriter supports file type profile %@ if the delegate method to output segment data is implemented. Please use -initWithContentType: initializer and implement -assetWriter:didOutputSegmentData:segmentType:segmentReport: or -assetWriter:didOutputSegmentData:segmentType: delegate method.", v11];
LABEL_44:
      LOBYTE(v8) = 0;
      goto LABEL_52;
    }
    if ((v14 & 0x80000000) == 0) {
      goto LABEL_49;
    }
LABEL_50:
    LOBYTE(v8) = 0;
    uint64_t v9 = @"The preferredOutputSegmentInterval property is used if the delegate method to output segment data is implemented. Please use -initWithContentType: initializer and implemen -assetWriter:didOutputSegmentData:segmentType:segmentReport: or -assetWriter:didOutputSegmentData:segmentType: delegate method.";
    goto LABEL_52;
  }
  if (v6) {
    uint64_t v9 = @"The value of the preferredOutputSegmentInterval property must be kCMTimeIndefinite or a positive numeric time to output segment data.";
  }
  else {
    uint64_t v9 = 0;
  }
  if (!(v6 & 1 | ((v12 & 1) == 0))) {
    goto LABEL_43;
  }
LABEL_52:
  *a3 = v9;
  return v8 & 1;
}

- (BOOL)checkAVAssetWriterInputConfigurationToOutputSegmentDataForFragmentedMPEG4FileTypeProfile:(id)a3 preferredOutputSegmentInterval:(id *)a4 returningDebugDescription:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = [(AVAssetWriterHelper *)self inputs];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v29 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v25 = 0;
    uint64_t v28 = 0;
    uint64_t v10 = *(void *)v33;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v5);
        }
        int v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        uint64_t v13 = [v12 outputSettings];
        int32_t v14 = (void *)[v12 mediaType];
        if (([v14 isEqual:@"vide"] & 1) != 0
          || ([v14 isEqual:@"auxv"] & 1) != 0
          || [v14 isEqual:@"scen"])
        {
          if (v13) {
            ++v8;
          }
          else {
            ++v9;
          }
        }
        else if ([v14 isEqual:@"soun"])
        {
          if (v13) {
            ++v29;
          }
          else {
            ++v27;
          }
        }
        else if ([v14 isEqual:@"clcp"])
        {
          if (v13) {
            ++v26;
          }
          else {
            ++v25;
          }
        }
        else
        {
          if (![v14 isEqual:@"meta"])
          {
            uint64_t v16 = (void *)[NSString stringWithFormat:@"Media type '%@' is not allowed for file type profile %@.", v14, a3];
            goto LABEL_66;
          }
          ++v28;
        }
        ++v11;
      }
      while (v7 != v11);
      uint64_t v15 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
      uint64_t v7 = v15;
    }
    while (v15);
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v29 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v25 = 0;
    uint64_t v28 = 0;
  }
  if ([a3 isEqualToString:@"MPEG4CMAFCompliant"])
  {
    if ([(NSArray *)[(AVAssetWriterHelper *)self inputs] count] >= 2)
    {
      uint64_t v16 = (void *)[NSString stringWithFormat:@"More than one track is not allowed for file type profile %@.", a3, v20];
LABEL_66:
      BOOL v18 = 0;
      goto LABEL_67;
    }
    if (v25 + v26 >= 1)
    {
      uint64_t v16 = (void *)[NSString stringWithFormat:@"Closed caption track is not allowed for file type profile %@.", a3, v20];
      goto LABEL_66;
    }
    if (v28 >= 1)
    {
      uint64_t v16 = (void *)[NSString stringWithFormat:@"Metadata track is not allowed for file type profile %@.", a3, v20];
      goto LABEL_66;
    }
  }
  uint64_t v17 = v9 + v8;
  if (v9 + v8 > 1)
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"More than one video track is not allowed for file type profile %@.", a3, v20];
    goto LABEL_66;
  }
  if (v27 + v29 >= 2)
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"More than one audio track is not allowed for file type profile %@.", a3, v20];
    goto LABEL_66;
  }
  if (v25 + v26 >= 2)
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"More than one closed caption track is not allowed for file type profile %@.", a3, v20];
    goto LABEL_66;
  }
  if (v28 >= 2)
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"More than one metadata track is not allowed for file type profile %@.", a3, v20];
    goto LABEL_66;
  }
  if (!v17 && v25 + v26 >= 1)
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"Closed caption track must accompany video track for file type profile %@.", a3, v20];
    goto LABEL_66;
  }
  if (!((v27 + v29) | v17) && v28 >= 1)
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"Metadata track must accompany video track or audio track for file type profile %@.", a3, v20];
    goto LABEL_66;
  }
  if (v8 >= 1 && v27 >= 1)
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"AVAssetWriter does not support encoding of video track and passthrough of audio track at same time for file type profile %@. Please match both AVAssetWriterInput's output settings.", a3, v20];
    goto LABEL_66;
  }
  if (v29 >= 1 && v9 >= 1)
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"AVAssetWriter does not support encoding of audio track and passthrough of video track at same time for file type profile %@. Please match both AVAssetWriterInput's output settings.", a3, v20];
    goto LABEL_66;
  }
  if ((a4->var2 & 0x1D) == 1)
  {
    CMTime time1 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime time2 = (CMTime)*a4;
    if (CMTimeCompare(&time1, &time2) < 0 && v9 >= 1 && v27 >= 1)
    {
      uint64_t v16 = (void *)[NSString stringWithFormat:@"If the value of the preferredOutputSegmentInterval property is a positive numeric time, AVAssetWriter does not support passthrough of video track and audio track at same time for file type profile %@. Please specify a non-nil output settings dictionary for both AVAssetWriterInput. Otherwise, please add one of them.", a3, v20];
      goto LABEL_66;
    }
  }
  CMTime time1 = (CMTime)*a4;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  if (!CMTimeCompare(&time1, &time2) && (v8 > 0 || v29 > 0 || v26 >= 1))
  {
    uint64_t v16 = (void *)[NSString stringWithFormat:@"If the value of the preferredOutputSegmentInterval property is kCMTimeIndefinite, AVAssetWriter only supports pssthrough for file type profile %@. Please specify nil for all AVAssetWriterInput's output settings.", a3, v20];
    goto LABEL_66;
  }
  uint64_t v16 = 0;
  BOOL v18 = 1;
LABEL_67:
  *a5 = v16;
  return v18;
}

- (id)figTrackReferences
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [(AVAssetWriterHelper *)self inputs];
  uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v38;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        int v4 = *(void **)(*((void *)&v37 + 1) + 8 * v3);
        int v5 = [v4 outputTrackID];
        uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:v5];
        uint64_t v7 = (void *)[v4 _trackReferences];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v27 = v7;
        id v25 = (id)[v7 keyEnumerator];
        uint64_t v8 = [v25 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v26 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v34 != v26) {
                objc_enumerationMutation(v25);
              }
              uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              int v12 = (void *)[v28 objectForKey:v11];
              if (!v12)
              {
                int v12 = (void *)[MEMORY[0x1E4F1CA48] array];
                [v28 setObject:v12 forKey:v11];
              }
              uint64_t v13 = (void *)[v27 objectForKey:v11];
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v41 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v30;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v30 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    int v18 = [*(id *)(*((void *)&v29 + 1) + 8 * j) outputTrackID];
                    uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithInteger:v18];
                    [v12 addObject:v6];
                    [v12 addObject:v19];
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v41 count:16];
                }
                while (v15);
              }
            }
            uint64_t v9 = [v25 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v9);
        }
        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v23);
  }
  if ([v28 count]) {
    return v28;
  }
  else {
    return 0;
  }
}

- (BOOL)areAllInputsPreferredMediaChunkAlignmentEqualTo:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = [(AVAssetWriterHelper *)self inputs];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v8) preferredMediaChunkAlignment] != a3) {
          return 0;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (void)setAllInputsFigPreferredChunkAlignmentTo:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = [(AVAssetWriterHelper *)self inputs];
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v15 = *MEMORY[0x1E4F32E88];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v8), "outputTrackID", v15);
        figAssetWriter = self->_figAssetWriter;
        uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v14 = *(void (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, uint64_t))(v13 + 64);
        if (v14) {
          v14(figAssetWriter, v9, v15, v11);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)prepareEncodedSampleBuffersForPaddedWrites
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(AVAssetWriterHelper *)self inputs];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v7, "mediaType"), "isEqual:", @"vide"))
        {
          uint64_t v8 = (void *)[v7 _outputSettingsObject];
          if (v8) {
            [v8 setShouldPrepareEncodedSampleBuffersForPaddedWrites:1];
          }
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)storageSpacePreallocationSize
{
  uint64_t v9 = 0;
  id result = [(AVAssetWriterHelper *)self outputURL];
  if (result)
  {
    uint64_t v3 = (void *)[result URLByDeletingLastPathComponent];
    id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfFileSystemForPath:error:", objc_msgSend(v3, "path"), &v9);
    if (result)
    {
      id result = (id)[result objectForKey:*MEMORY[0x1E4F283A0]];
      if (result)
      {
        id v4 = result;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v5 = [v4 longLongValue];
          if (v5 >= 0) {
            uint64_t v6 = v5;
          }
          else {
            uint64_t v6 = v5 + 1;
          }
          uint64_t v7 = v6 >> 1;
          if (v5 <= 0x8000000001) {
            uint64_t v8 = v7;
          }
          else {
            uint64_t v8 = 0x4000000000;
          }
          return (id)[MEMORY[0x1E4F28ED0] numberWithLongLong:v8];
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (BOOL)hasProRes4KHighFPSVideoOutputSetting
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(AVAssetWriterHelper *)self inputs];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "mediaType"), "isEqual:", @"vide"))
        {
          uint64_t v8 = (void *)[v7 _outputSettingsObject];
          if (v8)
          {
            if ([v8 isProRes4KHighFPSSetting])
            {
              LOBYTE(v3) = 1;
              return v3;
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)hasProResVideoOutputSetting
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(AVAssetWriterHelper *)self inputs];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "mediaType"), "isEqual:", @"vide"))
        {
          uint64_t v8 = (void *)[v7 _outputSettingsObject];
          if (v8)
          {
            if ([v8 isProRes])
            {
              LOBYTE(v3) = 1;
              return v3;
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)isOutputFileOnExternalStorageDevice
{
  v2 = [(AVAssetWriterHelper *)self outputURL];
  if (v2)
  {
    v2 = [(NSURL *)v2 absoluteURL];
    if (v2) {
      LOBYTE(v2) = FigFileIsFileOnExternalStorageDevice() != 0;
    }
  }
  return (char)v2;
}

- (void)dealloc
{
  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter) {
    CFRelease(figAssetWriter);
  }

  figAssetWriterAccessQueue = self->_figAssetWriterAccessQueue;
  if (figAssetWriterAccessQueue) {
    dispatch_release(figAssetWriterAccessQueue);
  }
  if (self->_figAssetWriterCallbackContextToken)
  {
    objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "unregisterCallbackContextForToken:", self->_figAssetWriterCallbackContextToken);
    self->_figAssetWriterCallbackContextToken = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriterWritingHelper;
  [(AVAssetWriterHelper *)&v5 dealloc];
}

- (void)didReceiveFigAssetWriterNotificationWithSuccess:(BOOL)a3 error:(id)a4
{
}

- (int64_t)status
{
  return 1;
}

- (void)startSessionAtSourceTime:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(AVAssetWriterWritingHelper *)self _retainedFigAssetWriter];
  if (v5)
  {
    uint64_t v6 = v5;
    long long v19 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(OpaqueFigAssetWriter *, long long *))(v8 + 72);
    if (v9)
    {
      long long v21 = v19;
      int64_t v22 = var3;
      v9(v6, &v21);
    }
    self->_startSessionCalled = 1;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v10 = [(AVAssetWriterHelper *)self inputs];
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v14++) _didStartInitialSession];
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
    CFRelease(v6);
  }
}

- (void)endSessionAtSourceTime:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [(AVAssetWriterHelper *)self inputs];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) _prepareToEndSession];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }
  uint64_t v11 = [(AVAssetWriterWritingHelper *)self _retainedFigAssetWriter];
  if (v11)
  {
    uint64_t v12 = v11;
    long long v26 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    long long v15 = *(uint64_t (**)(OpaqueFigAssetWriter *, long long *))(v14 + 112);
    if (v15)
    {
      long long v32 = v26;
      int64_t v33 = var3;
      int v16 = v15(v12, &v32);
      CFRelease(v12);
      if (v16 == -12142)
      {
        long long v17 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v18 = *MEMORY[0x1E4F1C3B8];
        long long v19 = (objc_class *)objc_opt_class();
        id v25 = (void *)[v17 exceptionWithName:v18, AVMethodExceptionReasonWithClassAndSelector(v19, a2, @"Cannot end a session without first starting a session", v20, v21, v22, v23, v24, v26), 0 reason userInfo];
        objc_exception_throw(v25);
      }
    }
    else
    {
      CFRelease(v12);
    }
  }
}

- (OpaqueFigAssetWriter)_retainedFigAssetWriter
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  figAssetWriterAccessQueue = self->_figAssetWriterAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__AVAssetWriterWritingHelper__retainedFigAssetWriter__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(figAssetWriterAccessQueue, v5);
  uint64_t v3 = (OpaqueFigAssetWriter *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __53__AVAssetWriterWritingHelper__retainedFigAssetWriter__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 24);
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)cancelWriting
{
  if ([(AVAssetWriterHelper *)self _transitionToClientInitiatedTerminalStatus:4])
  {
    [(AVAssetWriterFigAssetWriterNotificationHandler *)self->_notificationHandler setDelegate:0];
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    figAssetWriterAccessQueue = self->_figAssetWriterAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__AVAssetWriterWritingHelper_cancelWriting__block_invoke;
    block[3] = &unk_1E57B2110;
    block[4] = self;
    block[5] = &v10;
    dispatch_sync(figAssetWriterAccessQueue, block);
    uint64_t FigBaseObject = FigAssetWriterGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = *(void (**)(uint64_t))(v6 + 24);
      if (v7) {
        v7(FigBaseObject);
      }
    }
    CFRelease((CFTypeRef)v11[3]);
    uint64_t v8 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", -[AVAssetWriterHelper outputURL](self, "outputURL"), &v8);
    _Block_object_dispose(&v10, 8);
  }
}

uint64_t __43__AVAssetWriterWritingHelper_cancelWriting__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  *(void *)(*(void *)(result + 32) + 24) = 0;
  return result;
}

- (void)finishWriting
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F29060] currentThread];
  if (objc_msgSend(v3, "isEqual:", objc_msgSend(MEMORY[0x1E4F29060], "mainThread")))
  {
    NSLog(&cfstr_WarningFinishw.isa);
    uint64_t v4 = [AVBlockOperation alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__AVAssetWriterWritingHelper_finishWriting__block_invoke;
    v9[3] = &unk_1E57B4590;
    v9[4] = self;
    id v5 = [(AVAssetWriterWritingHelper *)self _makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:[(AVBlockOperation *)v4 initWithBlock:v9]];
    AVExecuteOperationsSynchronously(objc_msgSend(v5, "arrayByAddingObject:", -[AVAssetWriterWritingHelper _transitionToFinishWritingHelperWithFinishWritingOperations:](self, "_transitionToFinishWritingHelperWithFinishWritingOperations:", v5)));
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v6 = [(AVAssetWriterWritingHelper *)self _makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:0];
    id v7 = [(AVAssetWriterWritingHelper *)self _transitionToFinishWritingHelperWithFinishWritingOperations:v6];
    [v8 setName:@"com.apple.avfoundation.assetwriter.finishwriting"];
    [v8 addOperations:v6 waitUntilFinished:0];
    [v8 addOperation:v7];
    [v7 waitUntilFinished];
  }
}

uint64_t __43__AVAssetWriterWritingHelper_finishWriting__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (const void *)[*(id *)(a1 + 32) _retainedFigAssetWriter];
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = *(uint64_t (**)(const void *))(v5 + 120);
  if (v6) {
    uint64_t v7 = v6(v3);
  }
  else {
    uint64_t v7 = 4294954514;
  }
  uint64_t FigBaseObject = FigAssetWriterGetFigBaseObject();
  if (FigBaseObject)
  {
    uint64_t v9 = FigBaseObject;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v11 = v10 ? v10 : 0;
    uint64_t v12 = *(void (**)(uint64_t))(v11 + 24);
    if (v12) {
      v12(v9);
    }
  }
  if (v7)
  {
    if (a2) {
      *a2 = +[AVAssetWriter _errorForOSStatus:v7];
    }
    uint64_t v13 = 4;
  }
  else
  {
    uint64_t v13 = 2;
  }
  CFRelease(v3);
  return v13;
}

- (void)finishWritingWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = +[AVGlobalOperationQueue defaultQueue];
  id v6 = [(AVAssetWriterWritingHelper *)self _makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:0];
  id v7 = [(AVAssetWriterWritingHelper *)self _transitionToFinishWritingHelperWithFinishWritingOperations:v6];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__AVAssetWriterWritingHelper_finishWritingWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E57B45B8;
  v16[4] = a3;
  [v7 setCompletionBlock:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [v5 enqueueOperation:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
  [v5 enqueueOperation:v7];
}

uint64_t __65__AVAssetWriterWritingHelper_finishWritingWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_makeFinishWritingOperationsWithCustomFigAssetWriterFinishOperation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v6 = [(AVWeakReference *)[(AVAssetWriterHelper *)self weakReferenceToAssetWriter] referencedObject];
  id v7 = [(AVAssetWriterWritingHelper *)self _retainedFigAssetWriter];
  uint64_t v8 = [v6 finishWritingDelegate];
  if (!self->_startSessionCalled) {
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v10 = 0;
    if (a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v10 = [(id)objc_opt_class() finishWritingDelegateOperationWithAssetWriter:v6 andFigAssetWriter:v7 andDelegate:v8];
  [v5 addObject:v10];
  if (!a3) {
LABEL_4:
  }
    a3 = [[AVFigAssetWriterFinishWritingAsyncOperation alloc] initWithFigAssetWriter:v7];
LABEL_5:
  [v5 addObject:a3];
  [a3 setName:objc_msgSend(NSString, "stringWithFormat:", @"Finish writing file at %@, initiated by %@", -[AVAssetWriterHelper outputURL](self, "outputURL"), v6)];
  uint64_t v11 = objc_msgSend((id)objc_opt_class(), "prepareInputsOperationsWithInputs:", -[AVAssetWriterHelper inputs](self, "inputs"));
  [v5 addObjectsFromArray:v11];
  long long v12 = (void *)[(id)objc_opt_class() finalStepWorkaroundOperationWithFigAssetWriter:v7];
  long long v19 = v5;
  [v5 addObject:v12];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (v9) {
          [*(id *)(*((void *)&v20 + 1) + 8 * i) addDependency:v10];
        }
        [a3 addDependency:v17];
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
  [v12 addDependency:a3];
  id v5 = v19;
LABEL_15:
  if (v7) {
    CFRelease(v7);
  }
  return v5;
}

- (id)_transitionToFinishWritingHelperWithFinishWritingOperations:(id)a3
{
  uint64_t v4 = [[AVAssetWriterFinishWritingHelper alloc] initWithConfigurationState:[(AVAssetWriterHelper *)self configurationState] finishWritingOperations:a3 figAssetWriterCallbackContextToken:self->_figAssetWriterCallbackContextToken figAssetWriter:self->_figAssetWriter];
  self->_figAssetWriterCallbackContextToken = 0;
  id v5 = [(AVAssetWriterFinishWritingHelper *)v4 transitionToTerminalStatusOperation];
  id v6 = [(AVWeakReference *)[(AVAssetWriterHelper *)self weakReferenceToAssetWriter] referencedObject];
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self->_notificationHandler setDelegate:0];
  [v6 _setHelper:v4 ifCurrentHelper:self];

  return v5;
}

+ (id)prepareInputsOperationsWithInputs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [AVBlockOperation alloc];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __64__AVAssetWriterWritingHelper_prepareInputsOperationsWithInputs___block_invoke;
        v13[3] = &unk_1E57B4590;
        v13[4] = v9;
        uint64_t v11 = [(AVBlockOperation *)v10 initWithBlock:v13];
        -[AVBlockOperation setName:](v11, "setName:", [NSString stringWithFormat:@"Prepare for finishing input %@", v9]);
        [v4 addObject:v11];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return v4;
}

uint64_t __64__AVAssetWriterWritingHelper_prepareInputsOperationsWithInputs___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) _prepareToFinishWritingReturningError:a2]) {
    return 2;
  }
  else {
    return 4;
  }
}

+ (id)finishWritingDelegateOperationWithAssetWriter:(id)a3 andFigAssetWriter:(OpaqueFigAssetWriter *)a4 andDelegate:(id)a5
{
  if (!a3)
  {
    long long v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    long long v16 = "assetWriter != nil";
    goto LABEL_6;
  }
  if (!a4)
  {
    long long v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    long long v16 = "figAssetWriter != NULL";
LABEL_6:
    long long v17 = (void *)[v14 exceptionWithName:v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, (uint64_t)a5, v5, v6, v7, (uint64_t)v16), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  CFRetain(a4);
  uint64_t v11 = [AVBlockOperation alloc];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__AVAssetWriterWritingHelper_finishWritingDelegateOperationWithAssetWriter_andFigAssetWriter_andDelegate___block_invoke;
  v19[3] = &unk_1E57B45E0;
  v19[4] = a5;
  v19[5] = a3;
  v19[6] = a4;
  long long v12 = [(AVBlockOperation *)v11 initWithBlock:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__AVAssetWriterWritingHelper_finishWritingDelegateOperationWithAssetWriter_andFigAssetWriter_andDelegate___block_invoke_2;
  v18[3] = &__block_descriptor_40_e5_v8__0l;
  v18[4] = a4;
  [(AVBlockOperation *)v12 setCompletionBlock:v18];
  [(AVBlockOperation *)v12 setName:@"Call finish-writing delegate"];
  return v12;
}

uint64_t __106__AVAssetWriterWritingHelper_finishWritingDelegateOperationWithAssetWriter_andFigAssetWriter_andDelegate___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v2 = (void *)[*(id *)(a1 + 40) inputs];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v38;
      uint64_t v34 = *MEMORY[0x1E4F32E00];
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      uint64_t v32 = *MEMORY[0x1E4F32ED8];
      uint64_t v33 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v38 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          CFArrayRef theArray = 0;
          uint64_t v9 = *(void *)(a1 + 48);
          uint64_t v10 = [v8 outputTrackID];
          uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v11) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 0;
          }
          uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, const __CFAllocator *, CFArrayRef *))(v12 + 160);
          if (v13) {
            v13(v9, v10, v34, v6, &theArray);
          }
          if (theArray)
          {
            uint64_t Count = CFArrayGetCount(theArray);
            if (Count >= 1)
            {
              uint64_t v15 = Count;
              CFMutableArrayRef Mutable = CFArrayCreateMutable(v6, Count, MEMORY[0x1E4F1D510]);
              if (Mutable)
              {
                long long v17 = Mutable;
                CFAllocatorRef v18 = v6;
                uint64_t v19 = v2;
                for (CFIndex j = 0; j != v15; ++j)
                {
                  ValueAtIndex = CFArrayGetValueAtIndex(theArray, j);
                  CFTypeRef cf = 0;
                  int v22 = [*(id *)(a1 + 32) assetWriterInput:v8 shouldReplaceFormatDescription:ValueAtIndex replacementFormatDescription:&cf];
                  CFTypeRef v23 = cf;
                  if (v22) {
                    BOOL v24 = cf == 0;
                  }
                  else {
                    BOOL v24 = 1;
                  }
                  if (v24) {
                    CFTypeRef v23 = ValueAtIndex;
                  }
                  CFArraySetValueAtIndex(v17, j, v23);
                  if (cf) {
                    CFRelease(cf);
                  }
                }
                uint64_t v25 = *(void *)(a1 + 48);
                uint64_t v26 = [v8 outputTrackID];
                uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 16);
                uint64_t v28 = v27 ? v27 : 0;
                long long v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __CFArray *))(v28 + 64);
                v2 = v19;
                if (v29)
                {
                  CFAllocatorRef v6 = v18;
                  int v30 = v29(v25, v26, v32, v17);
                }
                else
                {
                  int v30 = -12782;
                  CFAllocatorRef v6 = v18;
                }
                uint64_t v5 = v33;
                CFRelease(v17);
                CFRelease(theArray);
                if (v30) {
                  return 4;
                }
              }
            }
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
  }
  return 2;
}

void __106__AVAssetWriterWritingHelper_finishWritingDelegateOperationWithAssetWriter_andFigAssetWriter_andDelegate___block_invoke_2(uint64_t a1)
{
}

+ (id)finalStepWorkaroundOperationWithFigAssetWriter:(OpaqueFigAssetWriter *)a3
{
  if (!a3)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"figAssetWriter != NULL"), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  CFRetain(a3);
  uint64_t v9 = [AVBlockOperation alloc];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__AVAssetWriterWritingHelper_finalStepWorkaroundOperationWithFigAssetWriter___block_invoke;
  v14[3] = &__block_descriptor_40_e9_q16__0__8l;
  v14[4] = a3;
  uint64_t v10 = [(AVBlockOperation *)v9 initWithBlock:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__AVAssetWriterWritingHelper_finalStepWorkaroundOperationWithFigAssetWriter___block_invoke_2;
  v13[3] = &__block_descriptor_40_e5_v8__0l;
  v13[4] = a3;
  [(AVBlockOperation *)v10 setCompletionBlock:v13];
  [(AVBlockOperation *)v10 setName:@"Invalidate FigAssetWriter, to ensure that audio files are finalized properly"];
  return v10;
}

uint64_t __77__AVAssetWriterWritingHelper_finalStepWorkaroundOperationWithFigAssetWriter___block_invoke()
{
  uint64_t FigBaseObject = FigAssetWriterGetFigBaseObject();
  if (FigBaseObject)
  {
    uint64_t v1 = FigBaseObject;
    uint64_t v2 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v2) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void (**)(uint64_t))(v3 + 24);
    if (v4) {
      v4(v1);
    }
  }
  return 2;
}

void __77__AVAssetWriterWritingHelper_finalStepWorkaroundOperationWithFigAssetWriter___block_invoke_2(uint64_t a1)
{
}

- (void)transitionToFailedStatusWithError:(id)a3
{
  uint64_t FigBaseObject = FigAssetWriterGetFigBaseObject();
  if (FigBaseObject)
  {
    uint64_t v6 = FigBaseObject;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(uint64_t))(v8 + 24);
    if (v9) {
      v9(v6);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)AVAssetWriterWritingHelper;
  [(AVAssetWriterHelper *)&v10 transitionToFailedStatusWithError:a3];
}

- (void)flushSegment
{
  uint64_t v2 = [(AVAssetWriterWritingHelper *)self _retainedFigAssetWriter];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(OpaqueFigAssetWriter *))(v5 + 168);
    if (v6) {
      v6(v3);
    }
    CFRelease(v3);
  }
}

- (BOOL)_isDefunct
{
  unsigned __int8 v9 = 0;
  figAssetWriter = self->_figAssetWriter;
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = (unsigned int (*)(OpaqueFigAssetWriter *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(figAssetWriter, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

@end