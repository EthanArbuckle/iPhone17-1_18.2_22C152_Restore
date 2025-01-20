@interface GTShaderProfilerHelper
- (BOOL)_prepareCounterNames:(id)a3 derivedCounterNames:(id)a4 withContext:(id)a5;
- (BOOL)_shouldUseProgramAddressMappings:(id)a3;
- (BOOL)analyzeShaderInfoResult:(id)a3 forDataSource:(const GTMTLReplayDataSource *)a4 forReplayController:(const GTMTLReplayController *)a5;
- (DebugInfo)_getDebugInfoForBinary:(SEL)a3 withTextSegment:(id)a4 forTargetIndex:(id)a5;
- (GTShaderProfilerHelper)initWithOptions:(GTProfilerOptions *)a3;
- (NSString)metalPluginName;
- (char)_calculateEffectiveGPUEncoderCostforData:(float *)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:;
- (char)_calculateEffectiveGPUEncoderCostforData:(uint64_t)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:;
- (char)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:(unint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (double)_calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:;
- (double)_latencyAdjustmentFactorWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6;
- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4;
- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4 forLimiterType:(id)a5;
- (double)_latencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5;
- (double)_waitLatencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4;
- (double)_waitLatencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5;
- (id).cxx_construct;
- (id)_analyzeBinary:(id)a3 uscSamples:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10;
- (id)_build;
- (id)_calculatePerDrawCallCostWithSampleData:(id)a3 targetIndex:(int)a4;
- (id)_calculatePerDrawCallWithGRCSampleData:(id)a3 targetIndex:(int)a4;
- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7;
- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10;
- (id)_codeGenCounterProcessing:(id)a3 derivedCounterNames:(id)a4;
- (id)_createPerCounterCommandData:(id)a3 withPerCommandData:(id)a4;
- (id)_createPerFileCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4;
- (id)_createPerFileLineCostDictionaryForCIWith:(const void *)a3 lineOffset:(unsigned int)a4;
- (id)_createPerLineCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4;
- (id)_extractShaderBinaryTextSegment:(id)a3;
- (id)_gatherStaticInformation:(const GTMTLReplayDataSource *)a3 forReplayController:(const GTMTLReplayController *)a4;
- (id)_prepareAndEvaluateCounterValues:(unsigned int *)a3 numElementsPerSample:(unint64_t)a4 numSamples:(unint64_t)a5 withContext:(id)a6 withGPUCyclesCounterIndex:(unint64_t)a7;
- (id)_processGPURawCounterData:(id)a3 andFillDeivedCounterNames:(id)a4;
- (id)_processHarvestedBinaryData:(id)a3 forStreamedData:(id)a4;
- (id)_processPerLineCostDataForLineTable:(void *)a3 withFileCost:(void *)a4 withDebugInfo:(void *)a5 andAllDrawCost:(double)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 withDrawCost:(void *)a9;
- (id)_productType;
- (id)_setupLimiterInfoPerDrawCall:(id)a3 forPayload:(id)a4 withShaderInfo:(id)a5;
- (id)_targetType;
- (id)_version;
- (id)analyzedBinary:(id)a3 processedUscSamples:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7;
- (id)convertBinaryInfoToJSONDictionary:(id)a3;
- (pair<std::vector<unsigned)_getAddressAndLineTableForDebugInfo:(pair<std:(std:(SEL)a3 :(void *)a4 vector<std::vector<DebugInfo::LineEntry *>>> *)self :vector<unsigned)int>;
- (uint64_t)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:;
- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(uint64_t *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(void *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (unsigned)_getLegacyProgramType:(id)a3;
- (unsigned)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_PrintLimiterData:(PerfCounterCompressedSample *)a3 withRawLimiterList:(id)a4 withDerivedCounters:(id)a5 andDerivedCounterNames:(id)a6;
- (void)_ProcessLineList:(void *)a3 forFileCostMap:(void *)a4 forDebugInfo:(void *)a5 andCost:(double)a6 forAddr:(unsigned int)a7 andDrawIndex:(unsigned int)a8 andTargetIndex:(int)a9;
- (void)_addBlitTimesToEffectiveKickTimes:(id)a3;
- (void)_addDerivedCounterDataToTimelineInfo:(id)a3 usingShaderProfilerResult:(id)a4;
- (void)_analyzeShaderBinarySamplesForResult:(id)a3 forShaderKeyToSourcePath:(id)a4;
- (void)_calculateEffectiveGPUEncoderCostforData:(id)a3 andPerLimiterBatchCost:(void *)a4 forShaderProfilerResult:(id)a5;
- (void)_calculateFrameTime:(id)a3 result:(id)a4;
- (void)_calculatePerDrawCosts:(id)a3;
- (void)_calculatePerSampleActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5;
- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:(unint64_t)a2 forWorkloadInfo:(unint64_t)a3;
- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:;
- (void)_calculatePerSampleAggregatedActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5;
- (void)_calculateRealTimeInfoWithGPUTime:(double)a3 forShaderInfoResult:(id)a4;
- (void)_dumpGPUTimelineDataResult:(id)a3;
- (void)_dumpShaderBinaryInfo:(id)a3 usingKey:(id)a4 withBaseFileName:(id)a5 targetIndex:(int)a6;
- (void)_dumpTraceProfileDataForResult:(id)a3;
- (void)_generateSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 andBatchIndexMax:(unsigned int)a6 andMinIndex:(unsigned int)a7 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a8 withUSCSampleList:(DYMTLShaderProfilerUSCSample *)a9 withUSCSampleNum:(unsigned int)a10 withBatchIDToEncoderIndex:(void *)a11 andEncoderIndexToBatchIdMap:(void *)a12;
- (void)_handlePerDrawCounterData;
- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4;
- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressData:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9;
- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressMappings:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9;
- (void)_preProcessUSCSampleData:(id)a3 result:(id)a4 targetIndex:(int)a5;
- (void)_processBatchIdCounterData:(id)a3;
- (void)_processDerivedEncoderCounterData:(id)a3 forDerivedEncoderData:(id)a4 withEffectivePerDrawKickTimes:(id)a5 withShaderInfo:(id)a6;
- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:(uint64_t)a4 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_saveAddressList:(DYMTLShaderProfilerProgramAddress *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveAddressMappings:(id)a3 filename:(const char *)a4;
- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 targetIndex:(int)a5;
- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 withTextSegment:(id)a5 targetIndex:(int)a6;
- (void)_saveSampleDataFromGPURawCounters:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveSampleDataFromGPURawCountersBytes:(char *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveSampleList:(DYMTLShaderProfilerUSCSample *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveSampleListForTarget:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveShaderBinariesWith:(id)a3 targetIndex:(int)a4;
- (void)_showDrawCallDataforResult:(id)a3;
- (void)_updateShaderTimelineInfo:(id)a3 withShaderTimelineDataEx:(id)a4 forGPUTimelineInfo:(id)a5 withEncoderGlobalTraceIdToStateMirrorIdMapping:(void *)a6;
- (void)_visitAllShaderInfosInResult:(id)a3 usingBlock:(id)a4;
- (void)processGPUTimelineDataSources:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5;
- (void)processStreamingGRCData:(id)a3;
- (void)profileBatchIdFilteredData:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5;
- (void)profileShadersForDataSource:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5;
- (void)setMetalPluginName:(id)a3;
- (void)waitForCompletion;
- (void)writeGPUTimelineSerializedData;
@end

@implementation GTShaderProfilerHelper

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalPluginName, 0);
  objc_storeStrong((id *)&self->_workloadTimelineInfo, 0);
  objc_storeStrong((id *)&self->_batchIdPartialResults, 0);
  objc_storeStrong((id *)&self->waitOperation, 0);
  objc_storeStrong((id *)&self->_streamingMTLResult, 0);
  objc_storeStrong((id *)&self->_shaderInfoResult, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_shaderProfilerHelper, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_shaderSourcePath, 0);

  std::unique_ptr<MTLGRCStreamingSampleHelper>::reset[abi:nn180100]((uint64_t **)&self->_streamingHelper, 0);
}

- (void)setMetalPluginName:(id)a3
{
}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (void)_calculateEffectiveGPUEncoderCostforData:(id)a3 andPerLimiterBatchCost:(void *)a4 forShaderProfilerResult:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  v11 = (unsigned int *)[v10 bytes];
  unint64_t v12 = (unint64_t)[v10 length];
  if (v12 >= 0x18)
  {
    v70 = self;
    v71 = v9;
    id v72 = v10;
    long long v79 = 0u;
    long long v80 = 0u;
    int v81 = 1065353216;
    long long v76 = 0u;
    long long v77 = 0u;
    int v78 = 1065353216;
    *(void *)&v75[0] = &v76;
    *(void *)&v75[1] = &v79;
    *(void *)&v75[2] = a4;
    unint64_t v13 = v12 / 0x18 - 1;
    if (v12 / 0x18 != 1)
    {
      uint64_t v14 = 0;
      while (1)
      {
        v15 = &v11[6 * v14];
        uint64_t v16 = *(void *)(v15 + 3);
        unint64_t v17 = 125 * (*(void *)(v15 + 9) - v16) / 3uLL;
        unsigned int v18 = *v15;
        unsigned int v19 = v15[2];
        if (*v15) {
          break;
        }
        v20 = std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::BatchInfo>::operator[]((float *)&v76, v19);
        *(_DWORD *)v20 = (v18 >> 1) & 7;
        *((void *)v20 + 1) = v16;
        *((void *)v20 + 2) = 0;
        -[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::$_4::operator()(v75, &v11[6 * v14], v17);
LABEL_37:
        if (++v14 == v13) {
          goto LABEL_38;
        }
      }
      v21 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(&v76, v19);
      if (!v21)
      {
LABEL_35:
        if (*((void *)&v77 + 1)) {
          -[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::$_4::operator()(v75, &v11[6 * v14], v17);
        }
        goto LABEL_37;
      }
      v22 = v21;
      uint64_t v23 = v21[4];
      v24 = std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, *((_DWORD *)v21 + 4));
      *(double *)&v24[8 * *((unsigned int *)v22 + 6)] = *(double *)&v24[8 * *((unsigned int *)v22 + 6)]
                                                      + (double)(125 * (v16 - v23) / 3uLL);
      unint64_t v25 = *((void *)&v76 + 1);
      unint64_t v26 = v22[1];
      uint8x8_t v27 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v76 + 8));
      v27.i16[0] = vaddlv_u8(v27);
      if (v27.u32[0] > 1uLL)
      {
        if (v26 >= *((void *)&v76 + 1)) {
          v26 %= *((void *)&v76 + 1);
        }
      }
      else
      {
        v26 &= *((void *)&v76 + 1) - 1;
      }
      uint64_t v28 = *v22;
      v29 = *(uint64_t **)(v76 + 8 * v26);
      do
      {
        v30 = v29;
        v29 = (uint64_t *)*v29;
      }
      while (v29 != v22);
      if (v30 == (uint64_t *)&v77) {
        goto LABEL_24;
      }
      unint64_t v31 = v30[1];
      if (v27.u32[0] > 1uLL)
      {
        if (v31 >= *((void *)&v76 + 1)) {
          v31 %= *((void *)&v76 + 1);
        }
      }
      else
      {
        v31 &= *((void *)&v76 + 1) - 1;
      }
      if (v31 != v26)
      {
LABEL_24:
        if (v28)
        {
          unint64_t v32 = *(void *)(v28 + 8);
          if (v27.u32[0] > 1uLL)
          {
            unint64_t v33 = *(void *)(v28 + 8);
            if (v32 >= *((void *)&v76 + 1)) {
              unint64_t v33 = v32 % *((void *)&v76 + 1);
            }
          }
          else
          {
            unint64_t v33 = v32 & (*((void *)&v76 + 1) - 1);
          }
          if (v33 == v26) {
            goto LABEL_28;
          }
        }
        *(void *)(v76 + 8 * v26) = 0;
        uint64_t v28 = *v22;
      }
      if (!v28)
      {
LABEL_34:
        uint64_t *v30 = v28;
        --*((void *)&v77 + 1);
        operator delete(v22);
        goto LABEL_35;
      }
      unint64_t v32 = *(void *)(v28 + 8);
LABEL_28:
      if (v27.u32[0] > 1uLL)
      {
        if (v32 >= v25) {
          v32 %= v25;
        }
      }
      else
      {
        v32 &= v25 - 1;
      }
      if (v32 != v26)
      {
        *(void *)(v76 + 8 * v32) = v30;
        uint64_t v28 = *v22;
      }
      goto LABEL_34;
    }
LABEL_38:
    id v9 = v71;
    unsigned int v34 = [v71 encoderCount];
    unsigned int v35 = v34;
    if (v34)
    {
      size_t v36 = 48 * v34;
      v37 = (char *)operator new(v36);
      bzero(v37, 48 * ((v36 - 48) / 0x30) + 48);
      v38 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v35);
      bzero(v38, 4 * v35);
      v40 = (uint64_t *)v80;
      for (i = v38; v40; v40 = (uint64_t *)*v40)
      {
        uint64_t v41 = 0;
        unsigned int v42 = *((_DWORD *)v40 + 4);
        v43 = (double *)(v40 + 6);
        uint64_t v44 = -3;
        v45 = v37 + 24;
        do
        {
          uint64_t v46 = v42 % v35;
          uint64_t v47 = (uint64_t)&v37[48 * v46 + 8 * v41];
          *(double *)(v47 + 24) = *v43 + *(double *)(v47 + 24);
          double v48 = *(v43 - 3);
          if (v48 < *v43)
          {
            fprintf(__stderrp, "%u[%u]: Duration %f < Effective Time %f\n", v42, v44 + 3, *(v43 - 3), *v43);
            double v48 = *(v43 - 3);
            unsigned int v42 = *((_DWORD *)v40 + 4);
            uint64_t v46 = v42 % v35;
          }
          v49 = &v45[48 * v46];
          double v39 = v48 + *((double *)v49 - 3);
          *((double *)v49 - 3) = v39;
          ++v41;
          v45 += 8;
          ++v43;
        }
        while (!__CFADD__(v44++, 1));
        v38 = i;
        ++*((_DWORD *)i + v46);
      }
      uint64_t v51 = 0;
      if (v35 <= 1uLL) {
        uint64_t v52 = 1;
      }
      else {
        uint64_t v52 = v35;
      }
      v53 = v37;
      id v9 = v71;
      id v10 = v72;
      do
      {
        uint64_t v54 = 0;
        LODWORD(v39) = *((_DWORD *)v38 + v51);
        double v39 = (double)*(unint64_t *)&v39;
        do
        {
          v55 = (double *)&v53[v54];
          v55[3] = *(double *)&v53[v54 + 24] / v39;
          double *v55 = *(double *)&v53[v54] / v39;
          v54 += 8;
        }
        while (v54 != 24);
        ++v51;
        v53 += 48;
      }
      while (v51 != v52);
      options = v70->_options;
      if ((*((unsigned char *)options + 16) & 0x40) != 0)
      {
        id v57 = [options->var0 stringByAppendingPathComponent:@"/EffectGPUTimePerBatch.txt"];
        v58 = fopen((const char *)[v57 UTF8String], "wt");
        if (v58)
        {
          id v73 = v57;
          uint64_t v59 = *((void *)&v80 + 1);
          fwrite("Batch DM  Time\n", 0xFuLL, 1uLL, v58);
          uint64_t v60 = 0;
          v61 = v37;
          do
          {
            for (uint64_t j = 0; j != 3; ++j)
            {
              double v63 = *(double *)&v61[8 * j + 24];
              if (v63 > 2.22044605e-16) {
                fprintf(v58, "%lu %u\t%f µs / %f µs = %f %% \n", v60, j, v63 * 0.001, *(double *)&v61[8 * j] * 0.001, v63 * 100.0 / *(double *)&v61[8 * j]);
              }
            }
            ++v60;
            v61 += 48;
          }
          while (v60 != v52);
          fwrite("\n\n", 2uLL, 1uLL, v58);
          if (v59)
          {
            for (uint64_t k = 0; k != v59; ++k)
            {
              for (uint64_t m = 0; m != 3; ++m)
              {
                if (*(double *)&std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k)[8 * m + 24] > 2.22044605e-16)
                {
                  double v66 = *(double *)&std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k)[8 * m + 24];
                  double v67 = *(double *)&std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k)[8 * m];
                  double v68 = *(double *)&std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k)[8 * m + 24];
                  v69 = std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]((uint64_t)&v79, k);
                  fprintf(v58, "%lu %u\t%f µs / %f µs = %f %% \n", k, m, v66 * 0.001, v67 * 0.001, v68 * 100.0 / *(double *)&v69[8 * m]);
                }
              }
            }
          }
          fclose(v58);
          id v9 = v71;
          id v10 = v72;
          id v57 = v73;
          v38 = i;
        }
      }
      if (v38) {
        operator delete(v38);
      }
      operator delete(v37);
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v76);
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v79);
  }
}

- (char)_calculateEffectiveGPUEncoderCostforData:(float *)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:
{
  unint64_t v5 = a2;
  unint64_t v6 = *((void *)a1 + 1);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v2 = a2;
      if (v6 <= a2) {
        unint64_t v2 = a2 % v6;
      }
    }
    else
    {
      unint64_t v2 = (v6 - 1) & a2;
    }
    id v8 = *(void ***)(*(void *)a1 + 8 * v2);
    if (v8)
    {
      id v9 = *v8;
      if (*v8)
      {
        do
        {
          unint64_t v10 = v9[1];
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2) {
              return (char *)(v9 + 3);
            }
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6) {
                v10 %= v6;
              }
            }
            else
            {
              v10 &= v6 - 1;
            }
            if (v10 != v2) {
              break;
            }
          }
          id v9 = (void *)*v9;
        }
        while (v9);
      }
    }
  }
  id v9 = operator new(0x30uLL);
  *id v9 = 0;
  v9[1] = v5;
  *((_DWORD *)v9 + 4) = a2;
  *((_DWORD *)v9 + 6) = 0;
  v9[4] = 0;
  v9[5] = 0;
  float v11 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v12 = a1[8];
  if (v6 && (float)(v12 * (float)v6) >= v11)
  {
    unint64_t v5 = v2;
    goto LABEL_64;
  }
  BOOL v13 = (v6 & (v6 - 1)) == 0;
  if (v6 < 3) {
    BOOL v13 = 0;
  }
  unint64_t v14 = (2 * v6) | !v13;
  unint64_t v15 = vcvtps_u32_f32(v11 / v12);
  if (v14 <= v15) {
    int8x8_t prime = (int8x8_t)v15;
  }
  else {
    int8x8_t prime = (int8x8_t)v14;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v6 = *((void *)a1 + 1);
  }
  if (*(void *)&prime <= v6)
  {
    if (*(void *)&prime >= v6) {
      goto LABEL_60;
    }
    unint64_t v23 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
    if (v6 < 3 || (uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
    {
      unint64_t v23 = std::__next_prime(v23);
    }
    else
    {
      uint64_t v25 = 1 << -(char)__clz(v23 - 1);
      if (v23 >= 2) {
        unint64_t v23 = v25;
      }
    }
    if (*(void *)&prime <= v23) {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime >= v6)
    {
      unint64_t v6 = *((void *)a1 + 1);
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      unint64_t v32 = *(void **)a1;
      *(void *)a1 = 0;
      if (v32) {
        operator delete(v32);
      }
      unint64_t v6 = 0;
      *((void *)a1 + 1) = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  unint64_t v17 = operator new(8 * *(void *)&prime);
  unsigned int v18 = *(void **)a1;
  *(void *)a1 = v17;
  if (v18) {
    operator delete(v18);
  }
  uint64_t v19 = 0;
  *((int8x8_t *)a1 + 1) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v19++) = 0;
  while (*(void *)&prime != v19);
  v20 = (void *)*((void *)a1 + 2);
  if (v20)
  {
    unint64_t v21 = v20[1];
    uint8x8_t v22 = (uint8x8_t)vcnt_s8(prime);
    v22.i16[0] = vaddlv_u8(v22);
    if (v22.u32[0] > 1uLL)
    {
      if (v21 >= *(void *)&prime) {
        v21 %= *(void *)&prime;
      }
    }
    else
    {
      v21 &= *(void *)&prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v21) = a1 + 4;
    unint64_t v26 = (void *)*v20;
    if (*v20)
    {
      do
      {
        unint64_t v27 = v26[1];
        if (v22.u32[0] > 1uLL)
        {
          if (v27 >= *(void *)&prime) {
            v27 %= *(void *)&prime;
          }
        }
        else
        {
          v27 &= *(void *)&prime - 1;
        }
        if (v27 != v21)
        {
          if (!*(void *)(*(void *)a1 + 8 * v27))
          {
            *(void *)(*(void *)a1 + 8 * v27) = v20;
            goto LABEL_56;
          }
          void *v20 = *v26;
          *unint64_t v26 = **(void **)(*(void *)a1 + 8 * v27);
          **(void **)(*(void *)a1 + 8 * v27) = v26;
          unint64_t v26 = v20;
        }
        unint64_t v27 = v21;
LABEL_56:
        v20 = v26;
        unint64_t v26 = (void *)*v26;
        unint64_t v21 = v27;
      }
      while (v26);
    }
  }
  unint64_t v6 = (unint64_t)prime;
LABEL_60:
  if ((v6 & (v6 - 1)) != 0)
  {
    if (v6 <= v5) {
      v5 %= v6;
    }
  }
  else
  {
    unint64_t v5 = (v6 - 1) & v5;
  }
LABEL_64:
  uint64_t v28 = *(void **)a1;
  v29 = *(void **)(*(void *)a1 + 8 * v5);
  if (v29)
  {
    *id v9 = *v29;
LABEL_72:
    void *v29 = v9;
    goto LABEL_73;
  }
  *id v9 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v9;
  v28[v5] = a1 + 4;
  if (*v9)
  {
    unint64_t v30 = *(void *)(*v9 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v30 >= v6) {
        v30 %= v6;
      }
    }
    else
    {
      v30 &= v6 - 1;
    }
    v29 = (void *)(*(void *)a1 + 8 * v30);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
  return (char *)(v9 + 3);
}

- (double)_calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:
{
  v4 = result;
  unsigned int v6 = *a2;
  unsigned int v5 = a2[1];
  if (v5 >= v5 + (*a2 >> 4))
  {
    unint64_t v15 = *(float **)result;
    goto LABEL_17;
  }
  double v8 = 0.0;
  unint64_t v9 = a2[1];
  do
  {
    unint64_t v10 = *(uint64_t **)(**((void **)v4 + 2) + 40 * v9 + 16);
    if (!v10) {
      goto LABEL_11;
    }
    do
    {
      float v11 = *(float **)v4;
      unsigned int v12 = *((_DWORD *)v10 + 4);
      result = (double *)std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(*(void **)v4, v12);
      if (result)
      {
        BOOL v13 = (double *)(v10 + 3);
        double v14 = *((double *)v10 + 3);
        result = (double *)std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::BatchInfo>::operator[](v11, v12);
        result[2] = v14 + result[2];
LABEL_6:
        double v8 = v8 + *v13;
        goto LABEL_8;
      }
      if (v12 == -1)
      {
        BOOL v13 = (double *)(v10 + 3);
        goto LABEL_6;
      }
LABEL_8:
      unint64_t v10 = (uint64_t *)*v10;
    }
    while (v10);
    unsigned int v6 = *a2;
    unsigned int v5 = a2[1];
LABEL_11:
    ++v9;
  }
  while (v9 < v5 + (v6 >> 4));
  unint64_t v15 = *(float **)v4;
  if (v8 > 2.22044605e-16)
  {
    for (i = (uint64_t *)*((void *)v15 + 2); i; i = (uint64_t *)*i)
    {
      double v17 = *((double *)i + 5) / v8 * (double)a3;
      result = (double *)std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[](*((void *)v4 + 1), *((_DWORD *)i + 4));
      unsigned int v18 = &result[*((unsigned int *)i + 6)];
      v18[3] = v17 + v18[3];
      i[5] = 0;
    }
    return result;
  }
LABEL_17:
  uint64_t v19 = (uint64_t *)*((void *)v15 + 2);
  if (v19)
  {
    double v20 = (double)a3 / (double)*((unint64_t *)v15 + 3);
    do
    {
      result = (double *)std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[](*((void *)v4 + 1), *((_DWORD *)v19 + 4));
      unint64_t v21 = &result[*((unsigned int *)v19 + 6)];
      v21[3] = v20 + v21[3];
      uint64_t v19 = (uint64_t *)*v19;
    }
    while (v19);
  }
  return result;
}

- (char)_calculateEffectiveGPUEncoderCostforData:(uint64_t)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:
{
  unint64_t v5 = a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v2 = a2;
      if (v6 <= a2) {
        unint64_t v2 = a2 % v6;
      }
    }
    else
    {
      unint64_t v2 = (v6 - 1) & a2;
    }
    double v8 = *(void ***)(*(void *)a1 + 8 * v2);
    if (v8)
    {
      unint64_t v9 = (char *)*v8;
      if (*v8)
      {
        do
        {
          unint64_t v10 = *((void *)v9 + 1);
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2) {
              return v9 + 24;
            }
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6) {
                v10 %= v6;
              }
            }
            else
            {
              v10 &= v6 - 1;
            }
            if (v10 != v2) {
              break;
            }
          }
          unint64_t v9 = *(char **)v9;
        }
        while (v9);
      }
    }
  }
  unint64_t v9 = (char *)operator new(0x48uLL);
  *(void *)unint64_t v9 = 0;
  *((void *)v9 + 1) = v5;
  *((_DWORD *)v9 + 4) = a2;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 56) = 0u;
  float v11 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    BOOL v13 = 1;
    if (v6 >= 3) {
      BOOL v13 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v14 = v13 | (2 * v6);
    unint64_t v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v16);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v2 = v5 % v6;
      }
      else {
        unint64_t v2 = v5;
      }
    }
    else
    {
      unint64_t v2 = (v6 - 1) & v5;
    }
  }
  uint64_t v17 = *(void *)a1;
  unsigned int v18 = *(void **)(*(void *)a1 + 8 * v2);
  if (v18)
  {
    *(void *)unint64_t v9 = *v18;
LABEL_38:
    *unsigned int v18 = v9;
    goto LABEL_39;
  }
  *(void *)unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v9;
  *(void *)(v17 + 8 * v2) = a1 + 16;
  if (*(void *)v9)
  {
    unint64_t v19 = *(void *)(*(void *)v9 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v19 >= v6) {
        v19 %= v6;
      }
    }
    else
    {
      v19 &= v6 - 1;
    }
    unsigned int v18 = (void *)(*(void *)a1 + 8 * v19);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v9 + 24;
}

{
  unint64_t v2;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  void **v8;
  char *v9;
  unint64_t v10;
  float v11;
  float v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;

  unint64_t v5 = a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v2 = a2;
      if (v6 <= a2) {
        unint64_t v2 = a2 % v6;
      }
    }
    else
    {
      unint64_t v2 = (v6 - 1) & a2;
    }
    double v8 = *(void ***)(*(void *)a1 + 8 * v2);
    if (v8)
    {
      unint64_t v9 = (char *)*v8;
      if (*v8)
      {
        do
        {
          unint64_t v10 = *((void *)v9 + 1);
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2) {
              return v9 + 24;
            }
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6) {
                v10 %= v6;
              }
            }
            else
            {
              v10 &= v6 - 1;
            }
            if (v10 != v2) {
              break;
            }
          }
          unint64_t v9 = *(char **)v9;
        }
        while (v9);
      }
    }
  }
  unint64_t v9 = (char *)operator new(0x48uLL);
  *(void *)unint64_t v9 = 0;
  *((void *)v9 + 1) = v5;
  *((_DWORD *)v9 + 4) = a2;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 56) = 0u;
  float v11 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    BOOL v13 = 1;
    if (v6 >= 3) {
      BOOL v13 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v14 = v13 | (2 * v6);
    unint64_t v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>(a1, v16);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v2 = v5 % v6;
      }
      else {
        unint64_t v2 = v5;
      }
    }
    else
    {
      unint64_t v2 = (v6 - 1) & v5;
    }
  }
  uint64_t v17 = *(void *)a1;
  unsigned int v18 = *(void **)(*(void *)a1 + 8 * v2);
  if (v18)
  {
    *(void *)unint64_t v9 = *v18;
LABEL_38:
    *unsigned int v18 = v9;
    goto LABEL_39;
  }
  *(void *)unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v9;
  *(void *)(v17 + 8 * v2) = a1 + 16;
  if (*(void *)v9)
  {
    unint64_t v19 = *(void *)(*(void *)v9 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v19 >= v6) {
        v19 %= v6;
      }
    }
    else
    {
      v19 &= v6 - 1;
    }
    unsigned int v18 = (void *)(*(void *)a1 + 8 * v19);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v9 + 24;
}

- (id)_processGPURawCounterData:(id)a3 andFillDeivedCounterNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 objectForKeyedSubscript:@"limiter sample data"];
  unint64_t v9 = v8;
  if (v8)
  {
    unint64_t v10 = (char *)[v8 bytes];
    float v11 = [v6 objectForKeyedSubscript:@"limiter sample counters"];
    float v12 = [v6 objectForKeyedSubscript:@"LimiterCounters"];
    if (v12)
    {
      BOOL v13 = objc_opt_new();
      unint64_t v14 = [v12 objectForKeyedSubscript:@"DerivedCounterScript"];
      unsigned __int8 v15 = [v13 evaluteScript:v14 scriptURL:0];

      if (v15)
      {
        size_t v16 = [v12 objectForKeyedSubscript:@"DerivedCounterDictionary"];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"DerivedCounters"];

        unsigned int v18 = [v17 allKeys];
        if ([(GTShaderProfilerHelper *)self _prepareCounterNames:v11 derivedCounterNames:v18 withContext:v13])
        {
          unint64_t v19 = -[GTShaderProfilerHelper _prepareAndEvaluateCounterValues:numElementsPerSample:numSamples:withContext:withGPUCyclesCounterIndex:](self, "_prepareAndEvaluateCounterValues:numElementsPerSample:numSamples:withContext:withGPUCyclesCounterIndex:", v10 + 4);
          [v7 addObjectsFromArray:v18];
        }
        else
        {
          unint64_t v19 = 0;
        }
      }
      else
      {
        unint64_t v19 = 0;
      }
    }
    else
    {
      unint64_t v19 = 0;
    }
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

- (void)_PrintLimiterData:(PerfCounterCompressedSample *)a3 withRawLimiterList:(id)a4 withDerivedCounters:(id)a5 andDerivedCounterNames:(id)a6
{
  id v24 = a4;
  id v9 = a5;
  id v10 = a6;
  if ((*(_DWORD *)a3 & 0x3FFFFFF) != 0)
  {
    unsigned int v23 = 0;
    do
    {
      float v11 = +[NSMutableString string];
      unsigned int v12 = 0;
      unsigned int v13 = v23 * (*(unsigned int *)a3 >> 26);
      while (1)
      {
        unsigned int v14 = v12;
        if ((unint64_t)[v24 count] <= v12) {
          break;
        }
        unsigned __int8 v15 = [v24 objectAtIndexedSubscript:v12];
        [v11 appendFormat:@"%@ = %u, ", v15, a3->var2[v13 + v14]];

        unsigned int v12 = v14 + 1;
      }
      NSLog(@"%@", v11);
      size_t v16 = +[NSMutableString string];
      unsigned int v17 = 0;
      unsigned int v18 = v23 * [v10 count];
      while (1)
      {
        unsigned int v19 = v17;
        if ((unint64_t)[v10 count] <= v17) {
          break;
        }
        double v20 = [v10 objectAtIndexedSubscript:v17];
        unint64_t v21 = [v9 objectAtIndexedSubscript:v18 + v17];
        [v21 doubleValue];
        [v16 appendFormat:@"%@ = %f, ", v20, v22];

        unsigned int v17 = v19 + 1;
      }
      NSLog(@"%@", v16);

      ++v23;
    }
    while (v23 < (*(_DWORD *)a3 & 0x3FFFFFFu));
  }
}

- (id)_prepareAndEvaluateCounterValues:(unsigned int *)a3 numElementsPerSample:(unint64_t)a4 numSamples:(unint64_t)a5 withContext:(id)a6 withGPUCyclesCounterIndex:(unint64_t)a7
{
  id v11 = a6;
  [v11 setRawArrayValues:@"_RawCounterValues" withUint32Values:a3 andNumCounters:a5 * a4];
  unsigned int v12 = +[NSNumber numberWithUnsignedLong:a5];
  v18[0] = v12;
  unsigned int v13 = +[NSNumber numberWithUnsignedLong:a7];
  v18[1] = v13;
  unsigned int v14 = +[NSArray arrayWithObjects:v18 count:2];
  [v11 callFunction:@"_SetAndEvaluateRawCounterValues" withArguments:v14];

  unsigned __int8 v15 = [v11 getValue:@"_DerivedCounterResult"];
  size_t v16 = [v15 toArray];

  return v16;
}

- (BOOL)_prepareCounterNames:(id)a3 derivedCounterNames:(id)a4 withContext:(id)a5
{
  id v8 = a5;
  id v9 = [(GTShaderProfilerHelper *)self _codeGenCounterProcessing:a3 derivedCounterNames:a4];
  id v10 = [v8 context];
  [v10 setObject:&__block_literal_global_919 forKeyedSubscript:@"ErrorLog"];

  LOBYTE(v10) = [v8 evaluteScript:v9 scriptURL:0];
  return (char)v10;
}

void __79__GTShaderProfilerHelper__prepareCounterNames_derivedCounterNames_withContext___block_invoke(id a1, NSString *a2)
{
}

- (id)_codeGenCounterProcessing:(id)a3 derivedCounterNames:(id)a4
{
  id v5 = a3;
  id v23 = a4;
  id v6 = +[NSMutableString string];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        [v6 appendFormat:@"var %@_noruint64_t m = 0;\n"];
          *(void *)(*((void *)&v32 + 1) + 8 * i));
      }
      id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }

  [v6 appendString:@"var _DerivedCounterResult = [];\n\n"];
  [v6 appendFormat:@"function _SetAndEvaluateRawCounterValues(numSamples, gpuCyclesCounterIndex) {\n"];
  [v6 appendString:@"\t_DerivedCounterResult = [];\n"];
  [v6 appendString:@"\tfor (var sampleIndex = 0; sampleIndex < numSamples; ++sampleIndex) {\n"];
  [v6 appendFormat:@"\t\tvar sampleStartIndex = sampleIndex * %lu;\n", [v7 count]];
  [v6 appendFormat:@"\t\tvar gpuCycles = _RawCounterValues[gpuCyclesCounterIndex + sampleStartIndex] / num_cores;\n"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v28 + 1) + 8 * (void)j);
        [v6 appendFormat:@"\t\t%@_noruint64_t m = 100.0 * (_RawCounterValues[%lu + sampleStartIndex] / gpuCycles);\n"];
          v16,
          (char *)j + v13);
      }
      id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
      v13 += (uint64_t)j;
    }
    while (v12);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = v23;
  id v18 = [v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v18; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(id *)(*((void *)&v24 + 1) + 8 * (void)k);
        [v6 appendFormat:@"\t\ttry { value = %@(); if (!isFinite(value)) { value = 0; } _DerivedCounterResult.push(value); } catch(err) { ErrorLog(err); _DerivedCounterResult.push(0); }\n"];
          v21);
      }
      id v18 = [v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v18);
  }

  [v6 appendFormat:@"\t}\n"];
  [v6 appendFormat:@"}\n"];

  return v6;
}

- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4 forLimiterType:(id)a5
{
  id v7 = a5;
  id v8 = [a3 objectAtIndexedSubscript:a4];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"ALU"];
  [v9 doubleValue];
  double v11 = v10;

  id v12 = [v8 objectForKeyedSubscript:v7];
  [v12 doubleValue];
  double v14 = v13 * 0.01;

  return 1.0 - v11 * 0.01 / (v11 * 0.01 + v14 + 0.00001);
}

- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4
{
  v4 = [a3 objectAtIndexedSubscript:a4];
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __87__GTShaderProfilerHelper__latencyAdjustmentFactorWithLimiterDataForDraw_forDataMaster___block_invoke;
  v8[3] = &unk_745638;
  v8[4] = &v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  double v5 = v10[3] * 0.01;
  if (v5 >= 1.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0 - v5;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __87__GTShaderProfilerHelper__latencyAdjustmentFactorWithLimiterDataForDraw_forDataMaster___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [v6 doubleValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 < *(double *)(v5 + 24)) {
    double v4 = *(double *)(v5 + 24);
  }
  *(double *)(v5 + 24) = v4;
}

- (double)_waitLatencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4
{
  double v4 = [a3 objectAtIndexedSubscript:a4];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ALU"];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [v4 objectForKeyedSubscript:@"TPU"];
  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = [v4 objectForKeyedSubscript:@"GlobalLoad"];
  [v11 doubleValue];
  double v12 = v10 * 0.01;
  double v13 = v7 * 0.01;
  double v15 = v14 * 0.01;

  if (v12 >= v15) {
    double v16 = v12;
  }
  else {
    double v16 = v15;
  }
  double v17 = v13 / (v16 + 0.00001);
  double v18 = 1.0 - v17;
  BOOL v19 = v17 < 1.0;
  double v20 = 0.0;
  if (v19) {
    double v20 = v18;
  }
  double v21 = (1.0 - (v13 + (1.0 - v13) * 0.5)) * (1.0 - v13 / (v13 + v16 + 0.00001)) + (v13 + (1.0 - v13) * 0.5) * v20;

  return v21;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  id v9 = a3;
  double v10 = [v9 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + 4) + a4];
  [v10 doubleValue];
  double v12 = v11;

  double v13 = [v9 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + 4 * a6) + a4];
  [v13 doubleValue];
  double v15 = v14 * 0.01;

  return 1.0 - v12 * 0.01 / (v12 * 0.01 + v15 + 0.00001);
}

- (double)_latencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  uint64_t v8 = 0;
  double v9 = 0.0;
  do
  {
    double v10 = [a3 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + v8) + a4];
    [v10 doubleValue];
    double v12 = v11;

    if (v9 < v12) {
      double v9 = v12;
    }
    v8 += 4;
  }
  while (v8 != 36);
  double result = 0.0;
  if (v9 * 0.01 < 1.0) {
    return 1.0 - v9 * 0.01;
  }
  return result;
}

- (double)_waitLatencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + 4) + a4];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = [v7 objectAtIndexedSubscript:**(unsigned int **)a5 + a4];
  [v11 doubleValue];
  double v13 = v12;

  double v14 = [v7 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + 8) + a4];
  [v14 doubleValue];
  double v15 = v13 * 0.01;
  double v16 = v10 * 0.01;
  double v18 = v17 * 0.01;

  if (v15 >= v18) {
    double v19 = v15;
  }
  else {
    double v19 = v18;
  }
  double v20 = v16 / (v19 + 0.00001);
  double v21 = 1.0 - v20;
  BOOL v22 = v20 < 1.0;
  double v23 = 0.0;
  if (v22) {
    double v23 = v21;
  }
  double v24 = (1.0 - (v16 + (1.0 - v16) * 0.5)) * (1.0 - v16 / (v16 + v19 + 0.00001)) + (v16 + (1.0 - v16) * 0.5) * v23;

  return v24;
}

- (id)_setupLimiterInfoPerDrawCall:(id)a3 forPayload:(id)a4 withShaderInfo:(id)a5
{
  id v44 = a3;
  id v41 = a4;
  id v42 = a5;
  id v7 = [v42 objectForKeyedSubscript:@"LimiterCounterData"];
  v43 = v7;
  if (!v7)
  {
    id v47 = 0;
    goto LABEL_51;
  }
  v40 = [v7 objectForKeyedSubscript:@"derivedCounterData"];
  uint64_t v8 = [v40 objectForKeyedSubscript:@"counters"];
  double v9 = v8;
  if (v8)
  {
    obuint64_t j = [v8 firstObject];

    unint64_t v10 = (unint64_t)[&off_758B40 count];
    unint64_t v11 = v10;
    if (v10)
    {
      if (v10 >> 62) {
        abort();
      }
      double v12 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(v10);
      bzero(v12, 4 * v11);
    }
    else
    {
      double v12 = 0;
    }
    __p = v12;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obja = obj;
    id v13 = [obja countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v13)
    {
      unsigned int v14 = 0;
      uint64_t v53 = *(void *)v62;
      v55 = 0;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v62 != v53) {
            objc_enumerationMutation(obja);
          }
          unsigned int v16 = 0;
          double v17 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          while (1)
          {
            uint64_t v18 = v16;
            if ((unint64_t)[&off_758B40 count] <= v16) {
              break;
            }
            double v19 = [&off_758B40 objectAtIndexedSubscript:v16];
            double v20 = [&off_759210 objectForKeyedSubscript:v19];

            double v21 = [&off_758B40 objectAtIndexedSubscript:v18];
            if ([v17 isEqualToString:v21])
            {

LABEL_23:
              v12[v18] = v14;

              ++v55;
              break;
            }
            if (v20)
            {
              unsigned __int8 v22 = [v17 isEqualToString:v20];

              if (v22) {
                goto LABEL_23;
              }
            }
            else
            {
            }
            unsigned int v16 = v18 + 1;
          }
          ++v14;
        }
        id v13 = [obja countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v13);
    }
    else
    {
      v55 = 0;
    }

    BOOL v23 = v55 == [&off_758B40 count];
    double v24 = v12;
    if (v23)
    {
      uint64_t v46 = [v40 objectForKeyedSubscript:@"AverageSamples"];
      id v47 = (id)objc_opt_new();
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v45 = [v44 drawCallInfoList];
      id v25 = [v45 countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v25)
      {
        uint64_t v48 = *(void *)v58;
        do
        {
          uint64_t v26 = 0;
          id v49 = v25;
          do
          {
            if (*(void *)v58 != v48) {
              objc_enumerationMutation(v45);
            }
            long long v27 = *(void **)(*((void *)&v57 + 1) + 8 * v26);
            long long v28 = [v27 programInfo];
            uint64_t v54 = v26;
            if (!v28
              || ([v27 programInfo],
                  long long v29 = objc_claimAutoreleasedReturnValue(),
                  BOOL v30 = [v29 programId] == (id)-1,
                  v29,
                  v28,
                  !v30))
            {
              long long v31 = [v46 objectAtIndexedSubscript:[v27 encoderIndex]];
              v56 = +[NSMutableArray arrayWithCapacity:3];
              id v32 = [&off_758B58 count];
              uint64_t v33 = 0;
              long long v34 = __p;
              do
              {
                long long v35 = objc_opt_new();
                if (v32)
                {
                  for (uint64_t j = 0; j != v32; ++j)
                  {
                    v37 = [v31 objectAtIndexedSubscript:v34[(void)j]];
                    v38 = [&off_758B58 objectAtIndexedSubscript:j];
                    [v35 setObject:v37 forKeyedSubscript:v38];
                  }
                }
                [v56 addObject:v35];

                ++v33;
                v34 += (uint64_t)v32;
              }
              while (v33 != 3);
              [v47 addObject:v56];
            }
            uint64_t v26 = v54 + 1;
          }
          while ((id)(v54 + 1) != v49);
          id v25 = [v45 countByEnumeratingWithState:&v57 objects:v65 count:16];
        }
        while (v25);
      }

      double v24 = __p;
      if (!__p) {
        goto LABEL_49;
      }
    }
    else
    {
      id v47 = 0;
      if (!v12)
      {
LABEL_49:

        goto LABEL_50;
      }
    }
    operator delete(v24);
    goto LABEL_49;
  }
  id v47 = 0;
LABEL_50:

LABEL_51:

  return v47;
}

- (void)_saveShaderBinariesWith:(id)a3 targetIndex:(int)a4
{
  double v6 = (id *)a3;
  id v7 = [self->_options->var0 stringByAppendingPathComponent:@"/shaderBinaries"];
  id v8 = [v7 stringByAppendingPathComponent:@"/legacy-drawCallToBinariesMap.txt"];
  double v9 = fopen((const char *)[v8 UTF8String], "wt");

  if (v9)
  {
    id v47 = self;
    int v48 = a4;
    fwrite("Index | DisplayIdx |          VS_Hash     |          FS_Hash     |         CS_Hash        \n", 0x5BuLL, 1uLL, v9);
    for (unsigned int i = 0; ; unsigned int i = v13 + 1)
    {
      unint64_t v11 = [v6 drawCallInfoList];
      id v12 = [v11 count];
      int v13 = i;

      if ((unint64_t)v12 <= i) {
        break;
      }
      unsigned int v14 = [v6 drawCallInfoList];
      double v15 = [v14 objectAtIndexedSubscript:i];

      unsigned int v16 = [v15 functionIndex];
      double v17 = (void *)v15[1];
      if (v17) {
        uint64_t v18 = (const char *)[v17 UTF8String];
      }
      else {
        uint64_t v18 = "";
      }
      double v19 = (void *)v15[2];
      if (v19) {
        double v20 = (const char *)[v19 UTF8String];
      }
      else {
        double v20 = "";
      }
      double v21 = (void *)v15[3];
      if (v21) {
        unsigned __int8 v22 = (const char *)[v21 UTF8String];
      }
      else {
        unsigned __int8 v22 = "";
      }
      fprintf(v9, "%5u | %10u | %19s | %19s | %19s\n", v13, v16, v18, v20, v22);
    }
    fclose(v9);
    id v23 = [v7 stringByAppendingPathComponent:@"/drawCallToBinariesMap.txt"];
    double v24 = fopen((const char *)[v23 UTF8String], "wt");

    if (v24)
    {
      fwrite("Index | DisplayIdx | All Binary keys\n", 0x25uLL, 1uLL, v24);
      unsigned int v25 = 0;
      uint64_t v26 = v6;
      long long v27 = v7;
      while (1)
      {
        long long v28 = [v6 drawCallInfoList];
        id v29 = [v28 count];

        if ((unint64_t)v29 <= v25) {
          break;
        }
        BOOL v30 = [v6 drawCallInfoList];
        unsigned int v49 = v25;
        long long v31 = [v30 objectAtIndexedSubscript:v25];

        fprintf(v24, "%5u | %10u |", v25, [v31 functionIndex]);
        for (unsigned int j = 0; (unint64_t)[v31[4] count] > j; ++j)
        {
          uint64_t v33 = [v31[4] objectAtIndexedSubscript:j];
          long long v34 = [v6[33] objectForKeyedSubscript:v33];
          long long v35 = [v34 type];

          if (j) {
            size_t v36 = ", ";
          }
          else {
            size_t v36 = " ";
          }
          id v37 = v33;
          v38 = (const char *)[v37 UTF8String];
          if (v35) {
            double v39 = (const char *)[v35 UTF8String];
          }
          else {
            double v39 = "";
          }
          fprintf(v24, "%s%s(%s)", v36, v38, v39);

          double v6 = v26;
          id v7 = v27;
        }
        fputc(10, v24);

        unsigned int v25 = v49 + 1;
      }
      fclose(v24);
      id v40 = v6[30];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke;
      v59[3] = &unk_745610;
      v59[4] = v47;
      id v41 = v7;
      id v60 = v41;
      int v61 = v48;
      [v40 enumerateKeysAndObjectsUsingBlock:v59];
      id v42 = v6[31];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_2;
      v56[3] = &unk_745610;
      v56[4] = v47;
      id v43 = v41;
      id v57 = v43;
      int v58 = v48;
      [v42 enumerateKeysAndObjectsUsingBlock:v56];
      id v44 = v6[32];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_3;
      v53[3] = &unk_745610;
      v53[4] = v47;
      id v45 = v43;
      id v54 = v45;
      int v55 = v48;
      [v44 enumerateKeysAndObjectsUsingBlock:v53];
      id v46 = v6[33];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_4;
      v50[3] = &unk_745610;
      v50[4] = v47;
      id v51 = v45;
      int v52 = v48;
      [v46 enumerateKeysAndObjectsUsingBlock:v50];
    }
  }
}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  double v6 = *(void **)(a1 + 32);
  id v7 = +[NSString stringWithFormat:@"%@/legacy-VS_%@", *(void *)(a1 + 40), v8];
  [v6 _dumpShaderBinaryInfo:v5 usingKey:v8 withBaseFileName:v7 targetIndex:*(unsigned int *)(a1 + 48)];
}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  double v6 = *(void **)(a1 + 32);
  id v7 = +[NSString stringWithFormat:@"%@/legacy-FS_%@", *(void *)(a1 + 40), v8];
  [v6 _dumpShaderBinaryInfo:v5 usingKey:v8 withBaseFileName:v7 targetIndex:*(unsigned int *)(a1 + 48)];
}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  double v6 = *(void **)(a1 + 32);
  id v7 = +[NSString stringWithFormat:@"%@/legacy-CS_%@", *(void *)(a1 + 40), v8];
  [v6 _dumpShaderBinaryInfo:v5 usingKey:v8 withBaseFileName:v7 targetIndex:*(unsigned int *)(a1 + 48)];
}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  double v6 = *(void **)(a1 + 32);
  id v7 = +[NSString stringWithFormat:@"%@/%@", *(void *)(a1 + 40), v8];
  [v6 _dumpShaderBinaryInfo:v5 usingKey:v8 withBaseFileName:v7 targetIndex:*(unsigned int *)(a1 + 48)];
}

- (void)_dumpShaderBinaryInfo:(id)a3 usingKey:(id)a4 withBaseFileName:(id)a5 targetIndex:(int)a6
{
  id v12 = a3;
  id v8 = a5;
  double v9 = [v12 binary];

  if (v9)
  {
    uint64_t v10 = [v8 stringByAppendingString:@".bin"];
    unint64_t v11 = [v12 binary];
    [v11 writeToFile:v10 atomically:0];

    [(GTShaderProfilerHelper *)self _extractShaderBinaryTextSegment:v12];
    objc_claimAutoreleasedReturnValue();
    operator new();
  }
}

- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 withTextSegment:(id)a5 targetIndex:(int)a6
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (lldb::SBDebugger *)a5;
  lldb::SBDebugger::Create(v15, v10);
  if (lldb::SBDebugger::IsValid((lldb::SBDebugger *)v15))
  {
    id v11 = v8;
    lldb::SBDebugger::CreateTargetWithFileAndArch(v14, (lldb::SBDebugger *)v15, (const char *)[v11 UTF8String], "16777235-0");
    if (lldb::SBTarget::IsValid((lldb::SBTarget *)v14))
    {
      lldb::SBFileSpec::SBFileSpec((lldb::SBFileSpec *)v13, (const char *)[v11 UTF8String], 1);
      lldb::SBTarget::FindModule(v12, (lldb::SBTarget *)v14, (const lldb::SBFileSpec *)v13);
      if (lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v12)
        && fopen((const char *)[v9 UTF8String], "wt"))
      {
        operator new();
      }
      lldb::SBModule::~SBModule((lldb::SBModule *)v12);
      lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v13);
    }
    lldb::SBTarget::~SBTarget((lldb::SBTarget *)v14);
  }
  lldb::SBDebugger::~SBDebugger((lldb::SBDebugger *)v15);
}

- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 targetIndex:(int)a5
{
}

- (id)_createPerFileLineCostDictionaryForCIWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  double v6 = +[NSMutableDictionary dictionaryWithCapacity:*((void *)a3 + 7)];
  for (unsigned int i = (double *)*((void *)a3 + 6); i; unsigned int i = *(double **)i)
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a4 + ((uint64_t)(*((void *)i + 4) - *((void *)i + 3)) >> 3)];
    for (unsigned int j = a4; j; --j)
      [v8 addObject:&off_759A38];
    uint64_t v10 = *((void *)i + 3);
    if (*((void *)i + 4) != v10)
    {
      unint64_t v11 = 0;
      double v12 = 100.0 / (i[6] + 2.22507386e-308);
      unsigned int v13 = 1;
      do
      {
        unsigned int v14 = +[NSNumber numberWithDouble:v12 * *(double *)(v10 + 8 * v11)];
        [v8 addObject:v14];

        unint64_t v11 = v13;
        uint64_t v10 = *((void *)i + 3);
        ++v13;
      }
      while (v11 < (*((void *)i + 4) - v10) >> 3);
    }
    double v15 = +[NSString stringWithFormat:@"%u", *((unsigned int *)i + 4)];
    [v6 setObject:v8 forKeyedSubscript:v15];
  }

  return v6;
}

- (id)_createPerFileCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = [(GTShaderProfilerHelper *)self _createPerLineCostDictionaryWith:a3 lineOffset:v4];
  [v7 setObject:v8 forKeyedSubscript:@"allDrawCall"];

  id v9 = +[NSMutableDictionary dictionaryWithCapacity:*((void *)a3 + 7)];
  [v7 setObject:v9 forKeyedSubscript:@"perDrawCall"];

  for (unsigned int i = (uint64_t **)*((void *)a3 + 6); i; unsigned int i = (uint64_t **)*i)
  {
    unint64_t v11 = [(GTShaderProfilerHelper *)self _createPerLineCostDictionaryWith:i + 3 lineOffset:v4];
    double v12 = [v7 objectForKeyedSubscript:@"perDrawCall"];
    unsigned int v13 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)i + 4)];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }

  return v7;
}

- (id)_createPerLineCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  double v6 = +[NSMutableDictionary dictionary];
  if (*(void *)a3 != *((void *)a3 + 1))
  {
    id v7 = +[NSNumber numberWithDouble:*((double *)a3 + 3)];
    [v6 setObject:v7 forKeyedSubscript:@"totalCost"];

    id v8 = +[NSMutableDictionary dictionaryWithCapacity:(uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3];
    [v6 setObject:v8 forKeyedSubscript:@"perLineCost"];

    uint64_t v10 = *(void *)a3;
    uint64_t v9 = *((void *)a3 + 1);
    if (v9 != *(void *)a3)
    {
      unint64_t v11 = 0;
      unsigned int v12 = 1;
      do
      {
        if (*(double *)(v10 + 8 * v11) > 2.22044605e-16)
        {
          unsigned int v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          unsigned int v14 = [v6 objectForKeyedSubscript:@"perLineCost"];
          double v15 = +[NSNumber numberWithUnsignedInt:a4 + v12 - 1];
          [v14 setObject:v13 forKeyedSubscript:v15];

          uint64_t v10 = *(void *)a3;
          uint64_t v9 = *((void *)a3 + 1);
        }
        unint64_t v11 = v12++;
      }
      while (v11 < (v9 - v10) >> 3);
    }
  }

  return v6;
}

- (id)_calculatePerDrawCallCostWithSampleData:(id)a3 targetIndex:(int)a4
{
  long long v22 = 0u;
  long long v23 = 0u;
  int v24 = 1065353216;
  id v5 = a3;
  double v6 = (unsigned int *)[v5 bytes];
  unint64_t v7 = (unint64_t)[v5 length];
  double v9 = 0.0;
  uint64_t v10 = (v7 / 0x14);
  if ((v7 / 0x14))
  {
    do
    {
      unsigned int v11 = *v6;
      unsigned int v12 = v6[1];
      unsigned int v21 = *v6;
      if ((a4 & 0x80000000) == 0 || v12 == 3)
      {
        if (a4 < 0)
        {
          double v13 = 1.0;
        }
        else
        {
          LODWORD(v8) = v6[4];
          double v13 = (double)v12 / (double)v8;
        }
        unsigned int v14 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)&v22, v11, &v21);
        double v9 = v9 + v13;
        v14[3] = v13 + v14[3];
      }
      v6 += 5;
      --v10;
    }
    while (v10);
  }
  double v15 = objc_opt_new();
  [v15 setTotalCost:v9];
  unsigned int v16 = +[NSMutableDictionary dictionaryWithCapacity:*((void *)&v23 + 1)];
  [v15 setDrawCallCost:v16];
  for (unsigned int i = (double *)v23; i; unsigned int i = *(double **)i)
  {
    uint64_t v18 = +[NSNumber numberWithDouble:i[3]];
    double v19 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)i + 4)];
    [v16 setObject:v18 forKeyedSubscript:v19];
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v22);

  return v15;
}

- (id)_extractShaderBinaryTextSegment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 binary];
  id v5 = [v4 bytes];

  if (v5)
  {
    double v6 = v5 + 8;
    for (int i = v5[4]; i; --i)
    {
      if (*v6 == 25) {
        break;
      }
      double v6 = (_DWORD *)((char *)v6 + v6[1]);
    }
    int v8 = v6[16];
    if (v8)
    {
      double v9 = v6 + 18;
      while (v9[4] != 1163157343 || *(_DWORD *)((char *)v9 + 19) != 5527621)
      {
        v9 += 20;
        if (!--v8) {
          goto LABEL_12;
        }
      }
      id v5 = +[NSData dataWithBytes:(char *)v5 + v9[12] length:v9[10]];
    }
    else
    {
LABEL_12:
      id v5 = 0;
    }
  }

  return v5;
}

- (void)_calculateRealTimeInfoWithGPUTime:(double)a3 forShaderInfoResult:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  if (v5)
  {
    [v5 vertexTiming];
    [v6 fragmentTiming];
    [v6 computeTiming];
    double v7 = *(double *)&v26 + v25 + v24;
  }
  else
  {
    double v7 = 0.0;
  }
  if (v7 >= 0.01) {
    double v8 = v7;
  }
  else {
    double v8 = 0.01;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v9 = [v6 drawCallInfoList];
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    BOOL v12 = a3 == 0.0 || v8 == 0.0;
    double v19 = a3 / v8;
    do
    {
      for (int i = 0; i != v10; int i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        if (!v12)
        {
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          double v15 = v19 * *(double *)(v14 + 56);
          *(float64x2_t *)(v14 + 64) = vmulq_n_f64(*(float64x2_t *)(v14 + 40), v19);
          *(double *)(v14 + 80) = v15;
          double v16 = v19 * *(double *)(v14 + 104);
          *(float64x2_t *)(v14 + 112) = vmulq_n_f64(*(float64x2_t *)(v14 + 88), v19);
          *(double *)(v14 + 128) = v16;
          double v17 = v19 * *(double *)(v14 + 152);
          *(float64x2_t *)(v14 + 160) = vmulq_n_f64(*(float64x2_t *)(v14 + 136), v19);
          *(double *)(v14 + 176) = v17;
          double v18 = v19 * *(double *)(v14 + 200);
          *(float64x2_t *)(v14 + 208) = vmulq_n_f64(*(float64x2_t *)(v14 + 184), v19);
          *(double *)(v14 + 224) = v18;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v10);
  }

  if (v6)
  {
    [v6 vertexTiming];
    [v6 fragmentTiming];
    [v6 computeTiming];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
  }
}

- (void)_showDrawCallDataforResult:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 vertexTiming];
    [v4 fragmentTiming];
    double v5 = *(double *)&v33 + *(double *)&v30;
  }
  else
  {
    double v5 = 0.0;
  }
  fwrite("index\tfunctionIndex\tvertTiming\tvertCyclePercent\fragTiming\tfragmentCyclePercent", 0x4EuLL, 1uLL, __stdoutp);
  double v6 = [v4 drawCallInfoList];
  unint64_t v7 = (unint64_t)[v6 count];
  if (v7 >= 0x10)
  {
    unint64_t v10 = v7 >> 4;
    double v8 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v7 >> 4);
    bzero(v8, 8 * v10);
    double v9 = &v8[v10];
  }
  else
  {
    double v8 = 0;
    double v9 = 0;
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v4 drawCallInfoList];
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (int i = 0; i != v12; int i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        double v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (v15)
        {
          [*(id *)(*((void *)&v26 + 1) + 8 * i) vertexTiming];
          double v16 = *(double *)&v33;
          [v15 fragmentTiming];
          double v17 = *(double *)&v30;
        }
        else
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          double v17 = 0.0;
          double v16 = 0.0;
          long long v30 = 0u;
          long long v31 = 0u;
        }
        unsigned int v18 = [v15 drawCallIndex];
        v8[v18 >> 4] = v16 * 100.0 / v5 + v17 * 100.0 / v5 + v8[v18 >> 4];
      }
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v12);
  }

  fwrite("Encoder Index\t Percentage Frame\n", 0x20uLL, 1uLL, __stdoutp);
  if (v9 != v8)
  {
    uint64_t v19 = 0;
    unsigned int v20 = 1;
    do
    {
      fprintf(__stdoutp, "%u\t %g\n", v20 - 1, v8[v19]);
      uint64_t v19 = v20;
    }
    while (v9 - v8 > (unint64_t)v20++);
  }
  double v22 = *v8;
  uint64_t v23 = 1;
  double v24 = "Failed";
  do
  {
    double v25 = v8[v23];
    if (fabs(v22 / v25 + -4.0) <= 1.6)
    {
      double v22 = v8[v23];
    }
    else
    {
      fprintf(__stdoutp, "Failed ratio %g / %g = %g\n", v22, v8[v23], v22 / v25);
      if (v8[v23] >= 1.0) {
        goto LABEL_27;
      }
    }
    ++v23;
  }
  while (v23 != 4);
  double v24 = "Passed";
LABEL_27:
  fprintf(__stdoutp, "%s Shader Profling Test\n", v24);
  operator delete(v8);
}

- (void)_dumpTraceProfileDataForResult:(id)a3
{
  id v3 = a3;
  v91 = v3;
  if (v3)
  {
    id v4 = v3;
    [v3 vertexTiming];
    [v4 fragmentTiming];
    [v4 computeTiming];
    double v5 = *(double *)&v130 + *(double *)&v127 + *(double *)&v124;
  }
  else
  {
    double v5 = 0.0;
  }
  double v6 = [v91 programPipelineInfoList];
  v84 = [v6 sortedArrayUsingComparator:&__block_literal_global_677];

  id v85 = [self->_options->var0 stringByAppendingFormat:@"/PipelineState.txt"];
  unint64_t v7 = fopen((const char *)[v85 UTF8String], "w");
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  obunsigned int j = v84;
  id v8 = [obj countByEnumeratingWithState:&v120 objects:v136 count:16];
  if (v8)
  {
    v94 = *(FILE **)v121;
    double v9 = 0.0;
    do
    {
      uint64_t v10 = 0;
      id v97 = v8;
      do
      {
        if (*(FILE **)v121 != v94) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v120 + 1) + 8 * v10);
        if (v11)
        {
          [*(id *)(*((void *)&v120 + 1) + 8 * v10) timing];
          double v12 = *(double *)&v130;
        }
        else
        {
          double v12 = 0.0;
        }
        uint64_t v13 = v11[1];
        unsigned int v14 = [v11 programIndex];
        id v15 = [v11 programId];
        if (v13)
        {
          [v11 vertexTiming];
          double v16 = *(double *)&v130;
          [v11 fragmentTiming];
          fprintf(v7, "[%u] PipelineState 0x%llX\tVertex[%.4f%%]\tFragment[%.4f%%]\n", v14, v15, v16 * 100.0 / v5, *(double *)&v127 * 100.0 / v5);
          double v17 = "\tVert\t\tFragment";
        }
        else
        {
          [v11 computeTiming];
          fprintf(v7, "[%u] PipelineState 0x%llX\tCompute[%.4f%%]\n", v14, v15, *(double *)&v130 * 100.0 / v5);
          double v17 = "\tCompute";
        }
        uint64_t v100 = v10;
        fprintf(v7, "\tindex\tfunctionIndex\t%s\n", v17);
        unsigned int v18 = [v11 drawCallInfoList];
        v118[0] = _NSConcreteStackBlock;
        v118[1] = 3221225472;
        v118[2] = __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_2;
        v118[3] = &unk_7469C8;
        id v19 = v91;
        id v119 = v19;
        unsigned int v20 = [v18 sortedArrayUsingComparator:v118];

        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v21 = v20;
        id v22 = [v21 countByEnumeratingWithState:&v114 objects:v135 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v115;
          do
          {
            for (int i = 0; i != v22; int i = (char *)i + 1)
            {
              if (*(void *)v115 != v23) {
                objc_enumerationMutation(v21);
              }
              double v25 = *(void **)(*((void *)&v114 + 1) + 8 * i);
              long long v26 = [v19 drawCallInfoList];
              long long v27 = [v26 objectAtIndexedSubscript:[v25 unsignedIntegerValue]];

              if (v13)
              {
                [v27 drawCallIndex];
                [v27 functionIndex];
                if (v27)
                {
                  [v27 vertexTiming];
                  [v27 fragmentTiming];
                }
                else
                {
                  long long v131 = 0u;
                  long long v132 = 0u;
                  long long v129 = 0u;
                  long long v130 = 0u;
                  long long v127 = 0u;
                  long long v128 = 0u;
                }
                fprintf(v7, "\t%6u\t\t%6u\t\t%.2f%%\t\t%.4f%%\n");
              }
              else
              {
                [v27 drawCallIndex];
                [v27 functionIndex];
                if (v27)
                {
                  [v27 computeTiming];
                }
                else
                {
                  long long v131 = 0u;
                  long long v132 = 0u;
                  long long v130 = 0u;
                }
                fprintf(v7, "\t%6u\t\t%6u\t\t%.4f%%\n");
              }
            }
            id v22 = [v21 countByEnumeratingWithState:&v114 objects:v135 count:16];
          }
          while (v22);
        }

        double v9 = v9 + v12;
        uint64_t v10 = v100 + 1;
      }
      while ((id)(v100 + 1) != v97);
      id v8 = [obj countByEnumeratingWithState:&v120 objects:v136 count:16];
    }
    while (v8);
  }
  else
  {
    double v9 = 0.0;
  }

  fclose(v7);
  v98 = objc_opt_new();
  id v86 = [self->_options->var0 stringByAppendingFormat:@"/DrawCallCosts_Unsorted.txt"];
  long long v28 = fopen((const char *)[v86 UTF8String], "wb");
  fwrite("\tindex\tfunctionIndex\t\tVert\t\t    Fragment\t\tCompute\t\tVS_Hash\t\tFS_Hash\t\tCS_HASH\tNumSamples\n", 0x58uLL, 1uLL, v28);
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v92 = [v91 drawCallInfoList];
  id v29 = [v92 countByEnumeratingWithState:&v110 objects:v134 count:16];
  v95 = v28;
  if (v29)
  {
    uint64_t v101 = *(void *)v111;
    do
    {
      for (unsigned int j = 0; j != v29; unsigned int j = (char *)j + 1)
      {
        if (*(void *)v111 != v101) {
          objc_enumerationMutation(v92);
        }
        long long v31 = *(void **)(*((void *)&v110 + 1) + 8 * (void)j);
        long long v32 = [v31 programInfo];
        if (v32)
        {
          long long v33 = [v31 programInfo];
          BOOL v34 = [v33 programId] == (id)-1;

          if (v34) {
            continue;
          }
        }
        long long v35 = objc_opt_new();
        [v98 addObject:v35];
        size_t v36 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 drawCallIndex]);
        [v35 setObject:v36 forKeyedSubscript:@"Index"];

        id v37 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 functionIndex]);
        [v35 setObject:v37 forKeyedSubscript:@"FunctionIndex"];

        if (v31)
        {
          [v31 vertexTiming];
          double v38 = *(double *)&v130;
        }
        else
        {
          long long v131 = 0u;
          long long v132 = 0u;
          double v38 = 0.0;
          long long v130 = 0u;
        }
        double v39 = +[NSNumber numberWithDouble:v38 * 100.0 / v5];
        [v35 setObject:v39 forKeyedSubscript:@"VS_Percent"];

        if (v31)
        {
          [v31 fragmentTiming];
          double v40 = *(double *)&v130;
        }
        else
        {
          long long v131 = 0u;
          long long v132 = 0u;
          double v40 = 0.0;
          long long v130 = 0u;
        }
        id v41 = +[NSNumber numberWithDouble:v40 * 100.0 / v5];
        [v35 setObject:v41 forKeyedSubscript:@"FS_Percent"];

        if (v31)
        {
          [v31 computeTiming];
          double v42 = *(double *)&v130;
        }
        else
        {
          long long v131 = 0u;
          long long v132 = 0u;
          double v42 = 0.0;
          long long v130 = 0u;
        }
        id v43 = +[NSNumber numberWithDouble:v42 * 100.0 / v5];
        [v35 setObject:v43 forKeyedSubscript:@"CS_Percent"];

        unsigned int v44 = [v31 drawCallIndex];
        unsigned int v45 = [v31 functionIndex];
        if (v31)
        {
          [v31 vertexTiming];
          double v46 = *(double *)&v130;
          [v31 fragmentTiming];
          double v47 = *(double *)&v127;
          [v31 computeTiming];
          double v48 = *(double *)&v124;
        }
        else
        {
          long long v131 = 0u;
          long long v132 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          double v48 = 0.0;
          double v47 = 0.0;
          double v46 = 0.0;
          long long v124 = 0u;
        }
        unsigned int v49 = (void *)v31[1];
        if (v49) {
          v50 = (const char *)[v49 UTF8String];
        }
        else {
          v50 = "\t\t";
        }
        id v51 = (void *)v31[2];
        if (v51) {
          int v52 = (const char *)[v51 UTF8String];
        }
        else {
          int v52 = "\t\t";
        }
        uint64_t v53 = (void *)v31[3];
        if (v53) {
          id v54 = (const char *)[v53 UTF8String];
        }
        else {
          id v54 = "\t\t";
        }
        [v31 vertexTiming];
        [v31 computeTiming];
        [v31 fragmentTiming];
        fprintf(v95, "\t%6u\t\t%6u\t\t%10.4f%%\t\t%10.4f%%\t\t%10.4f%%\t\t%s\t%s\t%s\t%g\n", v44, v45, v46 * 100.0 / v5, v47 * 100.0 / v5, v48 * 100.0 / v5, v50, v52, v54, v109 + v108 + v107);
      }
      id v29 = [v92 countByEnumeratingWithState:&v110 objects:v134 count:16];
    }
    while (v29);
  }

  if (v95) {
    fclose(v95);
  }

  int v55 = [v91 drawCallInfoList];
  v87 = [v55 sortedArrayUsingComparator:&__block_literal_global_712];

  v99 = objc_opt_new();
  id v89 = [self->_options->var0 stringByAppendingFormat:@"/DrawCallCosts_Sorted.txt"];
  v56 = fopen((const char *)[v89 UTF8String], "wb");
  fwrite("\tindex\tfunctionIndex\t\tVert\t\t    Fragment\t\tCompute\t\tVS_Hash\t\tFS_Hash\t\tCS_HASH\n", 0x4DuLL, 1uLL, v56);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v93 = v87;
  id v57 = [v93 countByEnumeratingWithState:&v103 objects:v133 count:16];
  v96 = v56;
  if (v57)
  {
    uint64_t v102 = *(void *)v104;
    do
    {
      for (uint64_t k = 0; k != v57; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v104 != v102) {
          objc_enumerationMutation(v93);
        }
        long long v59 = *(void **)(*((void *)&v103 + 1) + 8 * (void)k);
        id v60 = [v59 programInfo];
        if (v60)
        {
          int v61 = [v59 programInfo];
          BOOL v62 = [v61 programId] == (id)-1;

          if (v62) {
            continue;
          }
        }
        long long v63 = objc_opt_new();
        [v99 addObject:v63];
        long long v64 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v59 drawCallIndex]);
        [v63 setObject:v64 forKeyedSubscript:@"Index"];

        v65 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v59 functionIndex]);
        [v63 setObject:v65 forKeyedSubscript:@"FunctionIndex"];

        if (v59)
        {
          [v59 vertexTiming];
          double v66 = *(double *)&v130;
        }
        else
        {
          long long v131 = 0u;
          long long v132 = 0u;
          double v66 = 0.0;
          long long v130 = 0u;
        }
        double v67 = +[NSNumber numberWithDouble:v66 * 100.0 / v5];
        [v63 setObject:v67 forKeyedSubscript:@"VS_Percent"];

        if (v59)
        {
          [v59 fragmentTiming];
          double v68 = *(double *)&v130;
        }
        else
        {
          long long v131 = 0u;
          long long v132 = 0u;
          double v68 = 0.0;
          long long v130 = 0u;
        }
        v69 = +[NSNumber numberWithDouble:v68 * 100.0 / v5];
        [v63 setObject:v69 forKeyedSubscript:@"FS_Percent"];

        if (v59)
        {
          [v59 computeTiming];
          double v70 = *(double *)&v130;
        }
        else
        {
          long long v131 = 0u;
          long long v132 = 0u;
          double v70 = 0.0;
          long long v130 = 0u;
        }
        v71 = +[NSNumber numberWithDouble:v70 * 100.0 / v5];
        [v63 setObject:v71 forKeyedSubscript:@"CS_Percent"];

        unsigned int v72 = [v59 drawCallIndex];
        unsigned int v73 = [v59 functionIndex];
        if (v59)
        {
          [v59 vertexTiming];
          double v74 = *(double *)&v130;
          [v59 fragmentTiming];
          double v75 = *(double *)&v127;
          [v59 computeTiming];
          double v76 = *(double *)&v124;
        }
        else
        {
          long long v131 = 0u;
          long long v132 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          double v76 = 0.0;
          double v75 = 0.0;
          double v74 = 0.0;
          long long v124 = 0u;
        }
        long long v77 = (void *)v59[1];
        if (v77) {
          int v78 = (const char *)[v77 UTF8String];
        }
        else {
          int v78 = "\t\t";
        }
        long long v79 = (void *)v59[2];
        if (v79) {
          long long v80 = (const char *)[v79 UTF8String];
        }
        else {
          long long v80 = "\t\t";
        }
        int v81 = (void *)v59[3];
        if (v81) {
          v82 = (const char *)[v81 UTF8String];
        }
        else {
          v82 = "\t\t";
        }
        fprintf(v96, "\t%6u\t\t%6u\t\t%10.4f%%\t\t%10.4f%%\t\t%10.4f%%\t\t%s\t%s\t%s\n", v72, v73, v74 * 100.0 / v5, v75 * 100.0 / v5, v76 * 100.0 / v5, v78, v80, v82);
      }
      id v57 = [v93 countByEnumeratingWithState:&v103 objects:v133 count:16];
    }
    while (v57);
  }

  if (v96) {
    fclose(v96);
  }

  if (v5 > 1.0)
  {
    if (vabdd_f64(v5, v9) <= 0.1 && v5 >= 1.0) {
      goto LABEL_104;
    }
LABEL_106:
    v83 = "Failed";
    goto LABEL_107;
  }
  if (v5 < 1.0) {
    goto LABEL_106;
  }
LABEL_104:
  v83 = "Passed";
LABEL_107:
  fprintf(__stdoutp, "%s Shader Profling Test\n", v83);
}

uint64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) drawCallInfoList];
  id v8 = [v7 objectAtIndexedSubscript:[v5 unsignedIntegerValue]];

  double v9 = [*(id *)(a1 + 32) drawCallInfoList];
  uint64_t v10 = [v9 objectAtIndexedSubscript:[v6 unsignedIntegerValue]];

  if (v8)
  {
    [v8 timing];
    double v11 = v16;
    if (v10)
    {
LABEL_3:
      [v10 timing];
      double v12 = v15;
      goto LABEL_6;
    }
  }
  else
  {
    double v11 = 0.0;
    if (v10) {
      goto LABEL_3;
    }
  }
  double v12 = 0.0;
LABEL_6:
  if (v11 < v12) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }

  return v13;
}

int64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_3(id a1, NSNumber *a2, NSNumber *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  unint64_t v7 = v5;
  id v8 = v7;
  if (v6)
  {
    [(NSNumber *)v6 timing];
    double v9 = v14;
    if (v8)
    {
LABEL_3:
      [(NSNumber *)v8 timing];
      double v10 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    double v9 = 0.0;
    if (v7) {
      goto LABEL_3;
    }
  }
  double v10 = 0.0;
LABEL_6:
  if (v9 < v10) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = -1;
  }

  return v11;
}

int64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke(id a1, DYShaderProfilerProgramInfo *a2, DYShaderProfilerProgramInfo *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    [(DYShaderProfilerProgramInfo *)v4 timing];
    double v7 = v12;
    if (v6)
    {
LABEL_3:
      [(DYShaderProfilerProgramInfo *)v6 timing];
      double v8 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    double v7 = 0.0;
    if (v5) {
      goto LABEL_3;
    }
  }
  double v8 = 0.0;
LABEL_6:
  if (v7 < v8) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = -1;
  }

  return v9;
}

- (void)_preProcessUSCSampleData:(id)a3 result:(id)a4 targetIndex:(int)a5
{
  id v166 = a3;
  id v167 = a4;
  id v171 = [v166 objectForKeyedSubscript:@"usc sampling address data"];
  id v170 = [v166 objectForKeyedSubscript:@"usc sampling sample data"];
  v168 = [v166 objectForKeyedSubscript:@"usc sampling address mappings"];
  unsigned __int8 v165 = -[GTShaderProfilerHelper _shouldUseProgramAddressMappings:](self, "_shouldUseProgramAddressMappings:");
  if (g_runningInCI)
  {
    double v7 = +[NSString stringWithFormat:@"In _preProcessUSCSampleData, sample data %lu bytes, address data %lu bytes, address mappings %lu", [v170 length], [v171 length], [v168 count]];
    double v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    int64_t v9 = __stdoutp;
    id v10 = v8;
    fprintf(v9, "#CI-INFO# %s\n", (const char *)[v10 UTF8String]);
  }
  v176 = self;
  if (v171)
  {
    if (v170)
    {
      double v11 = [v167 drawCallInfoList];
      id v12 = [v11 count];

      if (v12)
      {
        id v13 = v171;
        v169 = (char *)[v13 bytes];
        unsigned int v14 = [v13 length];
        id v15 = v170;
        v160 = [v15 bytes];
        id v16 = v15;
        double v17 = (unsigned __int16 *)[v16 bytes];
        unsigned int v18 = [v16 length];
        uint64_t v19 = [v16 length] >> 3;
        if (a5 < 0)
        {
          BOOL v24 = 0;
          unsigned __int8 v165 = 0;
        }
        else
        {
          if (v19 >= 0x400) {
            uint64_t v20 = 1024;
          }
          else {
            uint64_t v20 = v19;
          }
          if (v20)
          {
            uint64_t v21 = v20 - 1;
            id v22 = v17;
            do
            {
              unint64_t v23 = (unint64_t)v22[3] << 48;
              BOOL v24 = v23 == 0xFEED000000000000;
              BOOL v25 = v23 == 0xFEED000000000000 || v21-- == 0;
              v22 += 4;
            }
            while (!v25);
          }
          else
          {
            BOOL v24 = 0;
          }
        }
        options = self->_options;
        if ((*((unsigned char *)options + 16) & 0x40) != 0)
        {
          id v27 = [options->var0 stringByAppendingPathComponent:@"/uscSamplingAddressRaw.txt"];
          -[GTShaderProfilerHelper _saveAddressList:size:filename:](self, "_saveAddressList:size:filename:", v169, v14 / 0x18uLL, [v27 UTF8String]);
          id v28 = [self->_options->var0 stringByAppendingPathComponent:@"/uscSamplingAddressMapping.txt"];
          -[GTShaderProfilerHelper _saveAddressMappings:filename:](self, "_saveAddressMappings:filename:", v168, [v28 UTF8String]);
        }
        unint64_t v163 = v14 / 0x18uLL;
        uint64_t v158 = v19;
        v159 = v17;
        BOOL v162 = v24;
        unsigned int v161 = v18;
        if (v165)
        {
          long long v200 = 0u;
          long long v201 = 0u;
          long long v198 = 0u;
          long long v199 = 0u;
          id v29 = v168;
          unsigned int v30 = 0;
          id v31 = [v29 countByEnumeratingWithState:&v198 objects:v204 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v199;
            LODWORD(v33) = -1;
            do
            {
              for (int i = 0; i != v31; int i = (char *)i + 1)
              {
                if (*(void *)v199 != v32) {
                  objc_enumerationMutation(v29);
                }
                long long v35 = [*(id *)(*((void *)&v198 + 1) + 8 * i) objectForKeyedSubscript:@"encIndex"];
                unsigned int v36 = [v35 unsignedIntValue];

                if (v36 >= v33) {
                  uint64_t v33 = v33;
                }
                else {
                  uint64_t v33 = v36;
                }
                if (v30 <= v36) {
                  unsigned int v30 = v36;
                }
              }
              id v31 = [v29 countByEnumeratingWithState:&v198 objects:v204 count:16];
            }
            while (v31);
          }
          else
          {
            uint64_t v33 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          if (v14 < 0x18) {
            goto LABEL_201;
          }
          unsigned int v30 = 0;
          if (v163 <= 1) {
            uint64_t v37 = 1;
          }
          else {
            uint64_t v37 = v163;
          }
          double v38 = v169 + 4;
          uint64_t v33 = 0xFFFFFFFFLL;
          do
          {
            if (*v38 != -1)
            {
              unsigned int v39 = *(v38 - 1);
              uint64_t v33 = v39 >> 8 >= v33 ? v33 : v39 >> 8;
              if (v30 <= v39 >> 8) {
                unsigned int v30 = v39 >> 8;
              }
            }
            v38 += 6;
            --v37;
          }
          while (v37);
        }
        int v40 = v30 - v33;
        if (v30 >= v33)
        {
          unsigned int v157 = v30;
          __p = 0;
          v196 = 0;
          unint64_t v197 = 0;
          v192 = 0;
          v193 = 0;
          v194 = 0;
          uint64_t v41 = (v40 + 1);
          if (v40 == -1)
          {
            double v42 = 0;
            long long v189 = 0u;
            long long v190 = 0u;
            int v191 = 1065353216;
            v186 = 0;
            v187 = 0;
            v188 = 0;
          }
          else
          {
            double v42 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>((v40 + 1));
            v192 = v42;
            v194 = &v42[4 * v43];
            memset(v42, 255, 4 * v41);
            v193 = &v42[4 * v41];
            long long v189 = 0u;
            long long v190 = 0u;
            int v191 = 1065353216;
            v186 = (char *)operator new(24 * v41);
            v188 = &v186[24 * v41];
            size_t v44 = 24 * ((24 * v41 - 24) / 0x18uLL) + 24;
            bzero(v186, v44);
            v187 = &v186[v44];
          }
          if (v165)
          {
            std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, 2 * (void)[v168 count]);
            LODWORD(v202) = 0;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v183 = 0u;
            long long v184 = 0u;
            obunsigned int j = v168;
            id v45 = [obj countByEnumeratingWithState:&v181 objects:v203 count:16];
            if (v45)
            {
              unsigned int v46 = 0;
              int v173 = 0;
              int v179 = 0;
              uint64_t v174 = *(void *)v182;
              unsigned int v47 = -1;
              do
              {
                double v48 = 0;
                id v175 = v45;
                do
                {
                  unsigned int v49 = v47;
                  if (*(void *)v182 != v174) {
                    objc_enumerationMutation(obj);
                  }
                  v50 = *(void **)(*((void *)&v181 + 1) + 8 * (void)v48);
                  id v51 = [v50 objectForKeyedSubscript:@"encID"];
                  unsigned int v47 = [v51 unsignedIntValue];

                  int v52 = [v50 objectForKeyedSubscript:@"drawCallIndex"];
                  unsigned int v53 = [v52 unsignedIntValue];

                  id v54 = [v50 objectForKeyedSubscript:@"mappedAddress"];
                  int v55 = (char *)[v54 unsignedLongLongValue];

                  v56 = [v50 objectForKeyedSubscript:@"mappedSize"];
                  id v57 = [v56 unsignedLongLongValue];

                  id v58 = [v50 objectForKeyedSubscript:@"binaryUniqueId"];
                  unint64_t v177 = strtoull((const char *)[v58 UTF8String], 0, 16);

                  long long v59 = [v50 objectForKeyedSubscript:@"type"];
                  unsigned __int8 v60 = [(GTShaderProfilerHelper *)v176 _getLegacyProgramType:v59];

                  if (v49 == -1 || v49 == v47)
                  {
                    int v61 = v53 + v173;
                  }
                  else
                  {
                    LODWORD(v202) = v47;
                    int v61 = v179 + 1;
                    unsigned int v46 = v47;
                    int v173 = v179 + 1;
                  }
                  int v179 = v61;
                  *((_DWORD *)v192 + v47 - v33) = v46;
                  unsigned int v178 = v46;
                  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v189, v46, &v202)+ 5) = v47;
                  int v62 = (v47 << 8) | 0x62;
                  long long v63 = &v55[(void)v57];
                  long long v64 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    double v67 = (char *)__p;
                    unint64_t v68 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (unsigned char *)__p) >> 3);
                    unint64_t v69 = v68 + 1;
                    if (v68 + 1 > 0xAAAAAAAAAAAAAAALL) {
                      goto LABEL_202;
                    }
                    if (0x5555555555555556 * ((uint64_t)(v197 - (void)__p) >> 3) > v69) {
                      unint64_t v69 = 0x5555555555555556 * ((uint64_t)(v197 - (void)__p) >> 3);
                    }
                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v197 - (void)__p) >> 3) >= 0x555555555555555) {
                      unint64_t v70 = 0xAAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v70 = v69;
                    }
                    if (v70) {
                      unint64_t v70 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v70);
                    }
                    else {
                      uint64_t v71 = 0;
                    }
                    unsigned int v72 = (char *)(v70 + 24 * v68);
                    *(_DWORD *)unsigned int v72 = v62;
                    *((_DWORD *)v72 + 1) = v179;
                    *((void *)v72 + 1) = v55;
                    *((void *)v72 + 2) = v63;
                    unsigned int v73 = v72;
                    if (v64 == v67)
                    {
                      unsigned int v66 = v178;
                    }
                    else
                    {
                      unsigned int v66 = v178;
                      do
                      {
                        long long v74 = *(_OWORD *)(v64 - 24);
                        *((void *)v73 - 1) = *((void *)v64 - 1);
                        *(_OWORD *)(v73 - 24) = v74;
                        v73 -= 24;
                        v64 -= 24;
                      }
                      while (v64 != v67);
                      long long v64 = (char *)__p;
                    }
                    v65 = v72 + 24;
                    __p = v73;
                    unint64_t v197 = v70 + 24 * v71;
                    if (v64) {
                      operator delete(v64);
                    }
                  }
                  else
                  {
                    *(_DWORD *)v196 = v62;
                    *((_DWORD *)v64 + 1) = v179;
                    v65 = v64 + 24;
                    *((void *)v64 + 1) = v55;
                    *((void *)v64 + 2) = v63;
                    unsigned int v66 = v178;
                  }
                  v196 = v65;
                  double v75 = &v186[24 * (v66 - v33)];
                  double v76 = v65 - 24;
                  long long v77 = (void **)(v75 + 8);
                  int v78 = (char **)*((void *)v75 + 1);
                  unint64_t v79 = *((void *)v75 + 2);
                  if ((unint64_t)v78 >= v79)
                  {
                    uint64_t v81 = ((uint64_t)v78 - *(void *)v75) >> 3;
                    if ((unint64_t)(v81 + 1) >> 61) {
                      abort();
                    }
                    uint64_t v82 = v79 - *(void *)v75;
                    uint64_t v83 = v82 >> 2;
                    if (v82 >> 2 <= (unint64_t)(v81 + 1)) {
                      uint64_t v83 = v81 + 1;
                    }
                    if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v84 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v84 = v83;
                    }
                    if (v84) {
                      unint64_t v84 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v84);
                    }
                    else {
                      uint64_t v85 = 0;
                    }
                    id v86 = (char **)(v84 + 8 * v81);
                    *id v86 = v76;
                    long long v80 = v86 + 1;
                    v87 = (char *)*v77;
                    v88 = *(char **)v75;
                    if (*v77 == *(void **)v75)
                    {
                      unsigned int v46 = v178;
                    }
                    else
                    {
                      unsigned int v46 = v178;
                      do
                      {
                        id v89 = (char *)*((void *)v87 - 1);
                        v87 -= 8;
                        *--id v86 = v89;
                      }
                      while (v87 != v88);
                      v87 = *(char **)v75;
                    }
                    *(void *)double v75 = v86;
                    *long long v77 = v80;
                    *((void *)v75 + 2) = v84 + 8 * v85;
                    if (v87) {
                      operator delete(v87);
                    }
                  }
                  else
                  {
                    *int v78 = v76;
                    long long v80 = v78 + 1;
                    unsigned int v46 = v178;
                  }
                  int v90 = (v47 << 8) | 0x63;
                  int v91 = v60;
                  *long long v77 = v80;
                  id v92 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    v95 = (char *)__p;
                    unint64_t v96 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (unsigned char *)__p) >> 3);
                    unint64_t v97 = v96 + 1;
                    if (v96 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_202:
                    }
                      abort();
                    if (0x5555555555555556 * ((uint64_t)(v197 - (void)__p) >> 3) > v97) {
                      unint64_t v97 = 0x5555555555555556 * ((uint64_t)(v197 - (void)__p) >> 3);
                    }
                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v197 - (void)__p) >> 3) >= 0x555555555555555) {
                      unint64_t v98 = 0xAAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v98 = v97;
                    }
                    if (v98) {
                      unint64_t v98 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v98);
                    }
                    else {
                      uint64_t v99 = 0;
                    }
                    uint64_t v100 = (char *)(v98 + 24 * v96);
                    *(_DWORD *)uint64_t v100 = v90;
                    *((_DWORD *)v100 + 1) = v179;
                    *((void *)v100 + 1) = v177;
                    *((_DWORD *)v100 + 4) = v91;
                    uint64_t v101 = v100;
                    if (v92 == v95)
                    {
                      id v94 = v175;
                      unsigned int v46 = v178;
                    }
                    else
                    {
                      id v94 = v175;
                      unsigned int v46 = v178;
                      do
                      {
                        long long v102 = *(_OWORD *)(v92 - 24);
                        *((void *)v101 - 1) = *((void *)v92 - 1);
                        *(_OWORD *)(v101 - 24) = v102;
                        v101 -= 24;
                        v92 -= 24;
                      }
                      while (v92 != v95);
                      id v92 = (char *)__p;
                    }
                    id v93 = v100 + 24;
                    __p = v101;
                    unint64_t v197 = v98 + 24 * v99;
                    if (v92) {
                      operator delete(v92);
                    }
                  }
                  else
                  {
                    *(_DWORD *)v196 = v90;
                    *((_DWORD *)v92 + 1) = v179;
                    *((void *)v92 + 1) = v177;
                    id v93 = v92 + 24;
                    *((_DWORD *)v92 + 4) = v91;
                    id v94 = v175;
                  }
                  v196 = v93;
                  double v48 = (char *)v48 + 1;
                }
                while (v48 != v94);
                id v45 = [obj countByEnumeratingWithState:&v181 objects:v203 count:16];
              }
              while (v45);
            }

            unint64_t v103 = v163;
          }
          else
          {
            std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, v163);
            LODWORD(v202) = 0;
            if (v14 >= 0x18)
            {
              uint64_t v104 = 0;
              int v105 = 0;
              int v180 = 0;
              if (v163 <= 1) {
                uint64_t v106 = 1;
              }
              else {
                uint64_t v106 = v163;
              }
              uint64_t v107 = 0xFFFFFFFFLL;
              do
              {
                double v108 = &v169[24 * v104];
                if ((*(void *)v108 & *((void *)v108 + 1) & *((void *)v108 + 2)) == -1
                  || (int v109 = *((_DWORD *)v108 + 1), v109 == -1))
                {
                  uint64_t v110 = v107;
                }
                else
                {
                  uint64_t v110 = *(_DWORD *)v108 >> 8;
                  if (v107 == -1 || v107 == v110)
                  {
                    int v105 = v109 + v180;
                  }
                  else
                  {
                    LODWORD(v202) = *(_DWORD *)v108 >> 8;
                    int v180 = ++v105;
                  }
                  long long v111 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    long long v114 = __p;
                    unint64_t v115 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (unsigned char *)__p) >> 3);
                    unint64_t v116 = v115 + 1;
                    if (v115 + 1 > 0xAAAAAAAAAAAAAAALL) {
                      abort();
                    }
                    if (0x5555555555555556 * ((uint64_t)(v197 - (void)__p) >> 3) > v116) {
                      unint64_t v116 = 0x5555555555555556 * ((uint64_t)(v197 - (void)__p) >> 3);
                    }
                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v197 - (void)__p) >> 3) >= 0x555555555555555) {
                      unint64_t v117 = 0xAAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v117 = v116;
                    }
                    if (v117) {
                      unint64_t v117 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v117);
                    }
                    else {
                      uint64_t v118 = 0;
                    }
                    long long v119 = *(_OWORD *)v108;
                    long long v120 = (char *)(v117 + 24 * v115);
                    *((void *)v120 + 2) = *((void *)v108 + 2);
                    *(_OWORD *)long long v120 = v119;
                    long long v121 = v120;
                    if (v111 != v114)
                    {
                      do
                      {
                        long long v122 = *(_OWORD *)((char *)v111 - 24);
                        *((void *)v121 - 1) = *((void *)v111 - 1);
                        *(_OWORD *)(v121 - 24) = v122;
                        v121 -= 24;
                        long long v111 = (_OWORD *)((char *)v111 - 24);
                      }
                      while (v111 != v114);
                      long long v111 = __p;
                    }
                    long long v113 = v120 + 24;
                    __p = v121;
                    unint64_t v197 = v117 + 24 * v118;
                    if (v111) {
                      operator delete(v111);
                    }
                  }
                  else
                  {
                    long long v112 = *(_OWORD *)v108;
                    *((void *)v196 + 2) = *((void *)v108 + 2);
                    *long long v111 = v112;
                    long long v113 = (char *)v111 + 24;
                  }
                  v196 = v113;
                  *((_DWORD *)v113 - 5) = v105;
                  unsigned int v123 = v202;
                  double v42 = (char *)v192;
                  *((_DWORD *)v192 + (v110 - v33)) = v202;
                  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v189, v123, &v202)+ 5) = v110;
                }
                ++v104;
                uint64_t v107 = v110;
              }
              while (v104 != v106);
            }
            v169 = (char *)__p;
            uint64_t v124 = (v196 - (unsigned char *)__p) >> 3;
            unint64_t v103 = 0xAAAAAAAAAAAAAAABLL * v124;
            if (-1431655765 * v124)
            {
              uint64_t v125 = (-1431655765 * v124);
              long long v126 = __p;
              do
              {
                unsigned int v185 = 0;
                unsigned int v185 = *(_DWORD *)&v42[4 * ((*v126 >> 8) - v33)];
                *long long v126 = *(unsigned __int8 *)v126 | (*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v189, v185, &v185)+ 5) << 8);
                v126 += 6;
                --v125;
              }
              while (v125);
            }
          }
          unint64_t v127 = v161 / 0xCuLL;
          long long v128 = v176->_options;
          if ((*((unsigned char *)v128 + 16) & 0x40) != 0)
          {
            if ((v165 & 1) == 0)
            {
              id v129 = [v128->var0 stringByAppendingPathComponent:@"/uscSamplingAddressProcessed.txt"];
              -[GTShaderProfilerHelper _saveAddressList:size:filename:](v176, "_saveAddressList:size:filename:", v169, v103, [v129 UTF8String]);

              long long v128 = v176->_options;
            }
            id v130 = [v128->var0 stringByAppendingPathComponent:@"/uscSamplingSampleRaw.txt"];
            long long v131 = v130;
            if (v162) {
              -[GTShaderProfilerHelper _saveSampleListForTarget:size:filename:](v176, "_saveSampleListForTarget:size:filename:", v159, v158, [v130 UTF8String]);
            }
            else {
              -[GTShaderProfilerHelper _saveSampleList:size:filename:](v176, "_saveSampleList:size:filename:", v160, v127, [v130 UTF8String]);
            }
          }
          char v132 = v165;
          if (!v103) {
            char v132 = 1;
          }
          if ((v132 & 1) == 0)
          {
            uint64_t v133 = 0;
            do
            {
              v134 = &v169[24 * v133];
              v135 = &v186[24 * ((*(_DWORD *)v134 >> 8) - v33)];
              v137 = (void **)(v135 + 8);
              v136 = (char **)*((void *)v135 + 1);
              unint64_t v138 = *((void *)v135 + 2);
              if ((unint64_t)v136 >= v138)
              {
                uint64_t v140 = ((uint64_t)v136 - *(void *)v135) >> 3;
                if ((unint64_t)(v140 + 1) >> 61) {
                  abort();
                }
                uint64_t v141 = v138 - *(void *)v135;
                uint64_t v142 = v141 >> 2;
                if (v141 >> 2 <= (unint64_t)(v140 + 1)) {
                  uint64_t v142 = v140 + 1;
                }
                if ((unint64_t)v141 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v143 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v143 = v142;
                }
                if (v143) {
                  unint64_t v143 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v143);
                }
                else {
                  uint64_t v144 = 0;
                }
                v145 = (char **)(v143 + 8 * v140);
                *v145 = v134;
                v139 = v145 + 1;
                v146 = (char *)*v137;
                v147 = *(char **)v135;
                if (*v137 != *(void **)v135)
                {
                  do
                  {
                    v148 = (char *)*((void *)v146 - 1);
                    v146 -= 8;
                    *--v145 = v148;
                  }
                  while (v146 != v147);
                  v146 = *(char **)v135;
                }
                *(void *)v135 = v145;
                *v137 = v139;
                *((void *)v135 + 2) = v143 + 8 * v144;
                if (v146) {
                  operator delete(v146);
                }
              }
              else
              {
                *v136 = v134;
                v139 = v136 + 1;
              }
              *v137 = v139;
              ++v133;
            }
            while (v133 != v103);
          }
          if (v162)
          {
            uint64_t v149 = 0;
            uint64_t v150 = v157;
          }
          else
          {
            uint64_t v150 = v157;
            if (v127 == 1)
            {
              uint64_t v149 = 0;
            }
            else
            {
              uint64_t v151 = 0;
              uint64_t v149 = 0;
              unsigned int v152 = -1;
              v153 = v160;
              do
              {
                if (*v153 == -1)
                {
                  if (v153[3] >= v152)
                  {
                    uint64_t v149 = v149;
                  }
                  else
                  {
                    unsigned int v152 = v153[3];
                    uint64_t v149 = v151;
                  }
                }
                ++v151;
                v153 += 3;
              }
              while (v127 - 1 != v151);
            }
          }
          if (a5 < 0)
          {
            LODWORD(v155) = v161 / 0xC;
            [(GTShaderProfilerHelper *)v176 _generateSamplesForResult:v167 withProgramAddressLUT:&v186 withBatchIndexMin:v33 andBatchIndexMax:v150 andMinIndex:v149 withProgramAddressList:v169 withUSCSampleList:v160 withUSCSampleNum:v155 withBatchIDToEncoderIndex:&v192 andEncoderIndexToBatchIdMap:&v189];
          }
          else
          {
            v154 = objc_opt_new();
            LODWORD(v156) = a5;
            [v154 generateTargetSamplesForResult:v167 withProgramAddressLUT:&v186 withBatchIndexMin:v33 withProgramAddressList:v169 withUSCSampleBuffer:v159 withUSCSampleNum:v158 withBatchIDToEncoderIndex:&v192 andEncoderIndexToBatchIdMap:&v189 targetIndex:v156];
          }
          v202 = &v186;
          std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v202);
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v189);
          if (v192)
          {
            v193 = (char *)v192;
            operator delete(v192);
          }
          if (__p) {
            operator delete(__p);
          }
        }
      }
    }
  }
LABEL_201:
}

- (void)_saveSampleDataFromGPURawCountersBytes:(char *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  double v7 = fopen(a5, "wt");
  if (v7)
  {
    double v8 = v7;
    if (a4)
    {
      int v9 = 0;
      do
      {
        fprintf(v8, "%6u : trace_id:0x%0.8x limiterIdx:%u nTracePackets:%u)\n", v9, *(void *)a3, *(void *)a3 >> 39, HIDWORD(*(void *)a3) & 0x7F);
        if ((a3[4] & 0x7F) != 0)
        {
          unint64_t v10 = 0;
          double v11 = a3 + 8;
          do
          {
            for (uint64_t i = 0; i != 4; ++i)
              fprintf(v8, "%6u : 0x%0.8llx 0x%0.8llx\n", i, HIDWORD(*(void *)&v11[8 * i]), *(void *)&v11[8 * i]);
            ++v10;
            unint64_t v13 = *((_DWORD *)a3 + 1) & 0x7F;
            v11 += 32;
          }
          while (v10 < v13);
        }
        else
        {
          unint64_t v13 = 0;
        }
        a3 += 32 * v13 + 8;
        ++v9;
      }
      while (v9 != a4);
    }
    fclose(v8);
  }
}

- (void)_saveSampleListForTarget:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  double v7 = fopen(a5, "wt");
  if (v7)
  {
    double v8 = v7;
    if (a4)
    {
      uint64_t v9 = 0;
      unsigned int v10 = 0;
      do
      {
        unint64_t v11 = a3[v10];
        if (HIWORD(v11) == 65261)
        {
          for (uint64_t i = 0; i != 3; ++i)
            v20[i] = a3[(v10 + i) % a4];
          unsigned int v13 = v20[0];
          uint64_t v14 = v20[0] & 0xF;
          if ((v20[0] & 0xC) != 0) {
            uint64_t v14 = 4;
          }
          uint64_t v15 = v9 + 1;
          uint64_t v16 = (LODWORD(v20[0]) >> 7) & 0x7F;
          fprintf(v8, "%6llu : %6u 0x%0.16llx (type:\"%s\" trace_id:0x%0.8x dm:%u render_id:0x%0.8x timestamp:0x%0.16llx gpu_cycles:0x%0.8x counter_num:%u)\n", v9, v10, v11, (&-[GTShaderProfilerHelper _saveSampleListForTarget:size:filename:]::type_string)[v14], v20[0] >> 16, LOWORD(v20[0]) >> 14, v22, v20[1], v21, (LODWORD(v20[0]) >> 7) & 0x7F);
          int v19 = (v13 >> 4) & 7;
          if (v16)
          {
            uint64_t v17 = 0;
            int v18 = v10 + 2 * ((v13 >> 4) & 7) - 1 + v16;
            do
            {
              if (v18 + (int)v17 < a4) {
                fprintf(v8, "%6llu : %6u 0x%0.8x 0x%0.8x\n", v15++, v17, a3[(v18 + v17)], HIDWORD(a3[(v18 + v17)]));
              }
              ++v17;
            }
            while (v16 != v17);
          }
          unsigned int v10 = v10 + v19 + v16 - 1;
          uint64_t v9 = v15;
        }
        else
        {
          fprintf(v8, "%6llu : %6u : 0x%0.8llx\n", v9, v10, v11);
        }
        ++v10;
      }
      while (v10 < a4);
    }
    fclose(v8);
  }
}

- (void)_saveSampleList:(DYMTLShaderProfilerUSCSample *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  double v7 = fopen(a5, "wt");
  if (v7)
  {
    double v8 = v7;
    if (a4)
    {
      uint64_t v9 = 0;
      p_var1 = &a3->var1.var0.var1;
      do
      {
        if (*(p_var1 - 2) == -1) {
          fprintf(v8, "%6u : %u --------\n");
        }
        else {
          fprintf(v8, "%6u : %6u 0x%0.8x 0x%0.8x\n");
        }
        ++v9;
        p_var1 += 3;
      }
      while (a4 != v9);
    }
    fclose(v8);
  }
}

- (void)_saveAddressMappings:(id)a3 filename:(const char *)a4
{
  id v23 = a3;
  id v5 = fopen(a4, "wt");
  if (v5)
  {
    fwrite("Encoder  Index [  Start -  End   ]  BinaryUniqueID  EncIdx Index Type\n", 0x46uLL, 1uLL, v5);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obunsigned int j = v23;
    id v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    id v27 = v5;
    if (v6)
    {
      uint64_t v25 = *(void *)v31;
      do
      {
        id v28 = v6;
        for (uint64_t i = 0; i != v28; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(obj);
          }
          double v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v9 = [v8 objectForKeyedSubscript:@"encID"];
          unsigned int v29 = [v9 unsignedIntValue];

          unsigned int v10 = [v8 objectForKeyedSubscript:@"index"];
          unsigned int v11 = [v10 unsignedIntValue];

          id v12 = [v8 objectForKeyedSubscript:@"drawCallIndex"];
          unsigned int v13 = [v12 unsignedIntValue];

          uint64_t v14 = [v8 objectForKeyedSubscript:@"mappedAddress"];
          uint64_t v15 = (char *)[v14 unsignedLongLongValue];

          uint64_t v16 = [v8 objectForKeyedSubscript:@"mappedSize"];
          id v17 = [v16 unsignedLongLongValue];

          id v18 = [v8 objectForKeyedSubscript:@"binaryUniqueId"];
          unint64_t v19 = strtoull((const char *)[v18 UTF8String], 0, 16);

          uint64_t v20 = [v8 objectForKeyedSubscript:@"encIndex"];
          LODWORD(v18) = [v20 unsignedIntValue];

          int v21 = [v8 objectForKeyedSubscript:@"type"];
          LODWORD(v20) = [(GTShaderProfilerHelper *)self _getLegacyProgramType:v21];

          id v22 = [v8 objectForKeyedSubscript:@"type"];
          fprintf(v27, "%08x %5d [%08llx-%08llx] %016llx %6d %5d %3d %s\n", v29, v13, v15, &v15[(void)v17], v19, v18, v11, v20, (const char *)[v22 UTF8String]);
        }
        id v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v6);
    }

    fclose(v27);
  }
}

- (void)_saveAddressList:(DYMTLShaderProfilerProgramAddress *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  double v7 = fopen(a5, "wt");
  if (v7)
  {
    double v8 = v7;
    fwrite("Index : ProgramType BatchIdx FunctionIdx [Start - End]\n", 0x37uLL, 1uLL, v7);
    if (a4)
    {
      uint64_t v9 = 0;
      p_unint64_t var1 = &a3->var1;
      do
      {
        unsigned int v11 = *((_DWORD *)&p_var1[-1].var1 + 2);
        if (v11 <= 0xFFFFFEFF) {
          int var3 = p_var1[-1].var1.var3;
        }
        else {
          int var3 = 999999;
        }
        unint64_t var0 = p_var1->var0.var0;
        unint64_t var1 = p_var1->var0.var1;
        p_unint64_t var1 = ($421EE431C39B988764BEB5E8283D4E0D *)((char *)p_var1 + 24);
        fprintf(v8, "%6u : %2u %6u %6u [0x%0.8llx - 0x%0.8llx]\n", v9++, v11, var3, v11 >> 8, var0, var1);
      }
      while (a4 != v9);
    }
    fclose(v8);
  }
}

- (void)_generateSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 andBatchIndexMax:(unsigned int)a6 andMinIndex:(unsigned int)a7 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a8 withUSCSampleList:(DYMTLShaderProfilerUSCSample *)a9 withUSCSampleNum:(unsigned int)a10 withBatchIDToEncoderIndex:(void *)a11 andEncoderIndexToBatchIdMap:(void *)a12
{
  uint64_t v14 = (id *)a3;
  uint64_t v15 = [v14 drawCallInfoList];
  unint64_t v16 = (unint64_t)[v15 count];
  unint64_t v17 = v16;
  unint64_t v97 = 0;
  unint64_t v98 = 0;
  uint64_t v99 = 0;
  if (v16)
  {
    if (v16 >= 0xAAAAAAAAAAAAAABLL) {
      abort();
    }
    unint64_t v97 = (char *)operator new(24 * v16);
    uint64_t v99 = &v97[24 * v17];
    size_t v18 = 24 * ((24 * v17 - 24) / 0x18) + 24;
    bzero(v97, v18);
    unint64_t v98 = &v97[v18];
  }
  unsigned int v90 = a6;
  unint64_t v19 = a9;

  unsigned int v20 = 0;
  id v92 = v14;
  unsigned int v93 = a5;
  while (1)
  {
    int v21 = [v14 drawCallInfoList];
    id v22 = [v21 count];
    unsigned int v23 = v20;

    if ((unint64_t)v22 <= v20) {
      break;
    }
    BOOL v24 = [v14 drawCallInfoList];
    uint64_t v25 = [v24 objectAtIndexedSubscript:v20];
    long long v26 = &v97[24 * v20];

    id v27 = v26 + 8;
    id v28 = (void *)*((void *)v26 + 1);
    unsigned int v29 = *(void **)v26;
    uint64_t v30 = (uint64_t)v28 - *(void *)v26;
    if ((unint64_t)v30 > 0x2F)
    {
      if (v30 != 48)
      {
        unsigned int v46 = v29 + 6;
        while (v28 != v46)
        {
          unsigned int v47 = (void *)*--v28;
        }
        *id v27 = v46;
      }
    }
    else
    {
      uint64_t v31 = v30 >> 3;
      unint64_t v32 = 6 - (v30 >> 3);
      long long v33 = &v97[24 * v20];
      uint64_t v36 = *((void *)v33 + 2);
      long long v35 = v33 + 16;
      uint64_t v34 = v36;
      if (v32 <= (v36 - (uint64_t)v28) >> 3)
      {
        double v48 = &v28[v32];
        uint64_t v49 = 48 - 8 * v31;
        unint64_t v19 = a9;
        do
        {
          *v28++ = 0;
          v49 -= 8;
        }
        while (v49);
        *id v27 = v48;
        a5 = v93;
      }
      else
      {
        uint64_t v37 = v34 - (void)v29;
        uint64_t v38 = v37 >> 2;
        if ((unint64_t)(v37 >> 2) <= 6) {
          uint64_t v38 = 6;
        }
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v39 = v38;
        }
        if (v39 >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        int v40 = operator new(8 * v39);
        uint64_t v41 = (char *)&v40[v31];
        do
          v40[v31++] = 0;
        while (v31 != 6);
        double v42 = (void *)*v27;
        uint64_t v43 = *(void **)v26;
        if (*v27 == *(void *)v26)
        {
          int64x2_t v45 = vdupq_n_s64((unint64_t)v42);
          a5 = v93;
        }
        else
        {
          a5 = v93;
          do
          {
            uint64_t v44 = *--v42;
            *double v42 = 0;
            *((void *)v41 - 1) = v44;
            v41 -= 8;
          }
          while (v42 != v43);
          int64x2_t v45 = *(int64x2_t *)v26;
        }
        *(void *)long long v26 = v41;
        *id v27 = v40 + 6;
        *long long v35 = &v40[v39];
        v50 = (char *)v45.i64[1];
        id v51 = (char *)v45.i64[0];
        while (v50 != v51)
        {
          int v52 = (void *)*((void *)v50 - 1);
          v50 -= 8;
        }
        uint64_t v14 = v92;
        unint64_t v19 = a9;
        if (v51) {
          operator delete(v51);
        }
      }
    }
    uint64_t v53 = [v14[30] objectForKeyedSubscript:v25[1]];
    id v54 = *(void **)(*(void *)v26 + 8);
    *(void *)(*(void *)v26 + 8) = v53;

    uint64_t v55 = [v14[31] objectForKeyedSubscript:v25[2]];
    v56 = *(void **)(*(void *)v26 + 16);
    *(void *)(*(void *)v26 + 16) = v55;

    uint64_t v57 = [v14[32] objectForKeyedSubscript:v25[3]];
    id v58 = *(void **)(*(void *)v26 + 24);
    *(void *)(*(void *)v26 + 24) = v57;

    unsigned int v20 = v23 + 1;
  }
  long long v59 = [self->_options->var0 stringByAppendingPathComponent:@"/uscSamplingProcessedSample.txt"];
  unsigned __int8 v60 = v59;
  unsigned int v61 = v90;
  if ((*((unsigned char *)self->_options + 16) & 0x40) != 0) {
    int v62 = fopen((const char *)[v59 UTF8String], "wt");
  }
  else {
    int v62 = 0;
  }
  if (a10)
  {
    uint64_t v63 = 0;
    id v86 = v60;
    do
    {
      long long v64 = &v19[v63];
      unsigned int var0 = v64->var0;
      if (v64->var0 != -1)
      {
        unsigned int v66 = &v19[v63];
        unsigned int v68 = v66->var1.var0.var0.var0;
        p_unint64_t var1 = &v66->var1;
        if (v68)
        {
          if (var0 < a5 || var0 > v61)
          {
            if (v62) {
              fprintf(v62, "%5u | %5u | batch index is out of range\n", v63, var0);
            }
          }
          else
          {
            unsigned int v70 = *(_DWORD *)(*(void *)a11 + 4 * (var0 - a5));
            unsigned int v96 = v70;
            if (v70 != -1)
            {
              unsigned int v71 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)a12, v70, &v96)+ 5);
              unint64_t v72 = v71 - a5;
              if (v71 >= a5 && 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3) > v72)
              {
                uint64_t v73 = *(void *)a4 + 24 * v72;
                double v75 = *(unsigned __int8 ***)v73;
                long long v74 = *(unsigned __int8 ***)(v73 + 8);
                if (v75 == v74)
                {
LABEL_57:
                  unsigned __int8 v60 = v86;
                  if (v62) {
                    fprintf(v62, "%5u | %5u | PC (0x%0.8x) is not within any program\n", v63, v64->var0, p_var1->var0.var1);
                  }
                }
                else
                {
                  unint64_t var1 = p_var1->var0.var1;
                  while (1)
                  {
                    long long v77 = *v75;
                    if (*((void *)*v75 + 1) <= var1 && *((void *)v77 + 2) > var1) {
                      break;
                    }
                    if (++v75 == v74) {
                      goto LABEL_57;
                    }
                  }
                  unint64_t v78 = *((unsigned int *)v77 + 1);
                  v88 = [v92 drawCallInfoList];
                  unint64_t v79 = v78 % (unint64_t)[v88 count];

                  id v80 = *(id *)(*(void *)&v97[24 * v79] + 8 * **v75);
                  int v81 = p_var1->var0.var1 - *((_DWORD *)*v75 + 2);
                  HIDWORD(v94) = p_var1->var0.var0.var0;
                  int v95 = v81;
                  int v85 = v79;
                  LODWORD(v94) = v79;
                  id v89 = v80;
                  [v80 uscSamples];
                  v82 = unsigned int v61 = v90;

                  if (!v82)
                  {
                    uint64_t v83 = objc_opt_new();
                    [v89 setUscSamples:v83];
                  }
                  unint64_t v84 = [v89 uscSamples];
                  [v84 appendBytes:&v94 length:20];

                  if (v62) {
                    fprintf(v62, "%5u | %5u(%5u) | %5u (%u) | %2u 0x%0.8x\n", v63, v64->var0, v71, v85, **v75, HIDWORD(v94), v95);
                  }

                  unsigned __int8 v60 = v86;
                }
              }
            }
            uint64_t v14 = v92;
          }
        }
      }
      ++v63;
    }
    while (v63 != a10);
  }
  if (v62) {
    fclose(v62);
  }

  id v94 = &v97;
  std::vector<std::vector<ShaderBinaryInfo * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
}

- (void)_calculateFrameTime:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    unint64_t v8 = 0;
    id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        unsigned int v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v8 += (unint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) unsignedLongLongValue:(void)v12];
          unsigned int v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [v6 setFrameTime:v8 / [v7 count]];
  }
}

- (void)profileBatchIdFilteredData:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  uint64_t v10 = (NSMutableDictionary *)objc_opt_new();
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v10;

  long long v12 = [(GTShaderProfilerHelper *)self _gatherStaticInformation:a3 forReplayController:a5];
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v12;

  objc_initWeak(&location, self);
  long long v14 = [v9 objectForKeyedSubscript:@"activePerEncoderDrawCallCount"];
  batchIdPartialResults = self->_batchIdPartialResults;
  self->_batchIdPartialResults = v14;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __85__GTShaderProfilerHelper_profileBatchIdFilteredData_withPayload_forReplayController___block_invoke;
  v16[3] = &unk_745560;
  objc_copyWeak(&v17, &location);
  objc_retainBlock(v16);
  operator new();
}

uint64_t __85__GTShaderProfilerHelper_profileBatchIdFilteredData_withPayload_forReplayController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v3 objectForKeyedSubscript:@"End Batch ID Streaming Data"];

  if (v5)
  {
    [WeakRetained _processBatchIdCounterData:WeakRetained[10]];
  }
  else
  {
    [WeakRetained[10] addObject:v3];
    if (g_runningInCI)
    {
      id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Received data for batch %lu", [WeakRetained[10] count]);
      id v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

      unint64_t v8 = __stdoutp;
      id v9 = v7;
      fprintf(v8, "#CI-INFO# %s\n", (const char *)[v9 UTF8String]);
    }
  }

  return 0;
}

- (void)profileShadersForDataSource:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  uint64_t v10 = (NSMutableDictionary *)objc_opt_new();
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v10;

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  long long v12 = [(GTShaderProfilerHelper *)self _gatherStaticInformation:a3 forReplayController:a5];
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v12;

  objc_initWeak(&location, self->_streamingMTLResult);
  objc_initWeak(&from, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  uint64_t v14[2] = __86__GTShaderProfilerHelper_profileShadersForDataSource_withPayload_forReplayController___block_invoke;
  v14[3] = &unk_745538;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  v14[4] = v19;
  objc_retainBlock(v14);
  operator new();
}

id __86__GTShaderProfilerHelper_profileShadersForDataSource_withPayload_forReplayController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [v3 objectForKeyedSubscript:@"usc sampling address data"];

  if (v6)
  {
    [v5 _preProcessStreamingUSCSampleData:v3 result:WeakRetained];
LABEL_6:
    long long v14 = 0;
    goto LABEL_7;
  }
  id v7 = [v3 objectForKeyedSubscript:@"Havested Binaries"];

  if (v7)
  {
    uint64_t v8 = [v3 objectForKeyedSubscript:@"MetalPluginName"];
    id v9 = v5[12];
    v5[12] = (id)v8;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MetalPluginTarget(v5[12]);
    uint64_t v10 = [v3 objectForKeyedSubscript:@"Havested Binaries"];
    unsigned int v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];

    long long v12 = +[NSNumber numberWithBool:*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 0];
    [v11 setObject:v12 forKeyedSubscript:@"BatchingFilteringAvailable"];

    id v13 = [v5 _processHarvestedBinaryData:WeakRetained forStreamedData:v11];
LABEL_5:

    goto LABEL_6;
  }
  id v16 = [v3 objectForKeyedSubscript:@"Finalize Shader Profiler Result"];

  if (v16)
  {
    [v5[5] adjustHWBiasAndFinalizeResult];
    [v5 _addBlitTimesToEffectiveKickTimes:WeakRetained];
    long long v14 = [WeakRetained effectiveKickTimes];

    if (v14)
    {
      v37[0] = @"Kick Time Data";
      id v17 = [WeakRetained effectiveKickTimes];
      v38[0] = v17;
      v37[1] = @"Encoder Load Action Times";
      size_t v18 = [WeakRetained loadActionTimes];
      v38[1] = v18;
      v37[2] = @"Encoder Store Action Times";
      unint64_t v19 = [WeakRetained storeActionTimes];
      v38[2] = v19;
      long long v14 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    }
  }
  else
  {
    int v20 = [v3 objectForKeyedSubscript:@"Shader Profiling Frame Time"];

    if (v20)
    {
      long long v14 = [WeakRetained shaderProfilingFrameTimes];

      if (v14)
      {
        unsigned int v11 = [WeakRetained shaderProfilingFrameTimes];
        int v21 = [v3 objectForKeyedSubscript:@"Shader Profiling Frame Time"];
        [v11 addObject:v21];

        goto LABEL_5;
      }
    }
    else
    {
      id v22 = [v3 objectForKeyedSubscript:@"Frame Time Data"];

      if (v22)
      {
        unsigned int v23 = [v3 objectForKeyedSubscript:@"GPU Time"];
        [v23 doubleValue];
        [WeakRetained setGpuTime:v24 / 1000000000.0];

        uint64_t v25 = [v3 objectForKeyedSubscript:@"Num Ring Buffers"];
        id v26 = [v25 unsignedIntValue];

        [v5[5] setupDataForEvaluatingStreamingSamples:WeakRetained forRingBufferCount:v26 forTargetIndex:*(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
        goto LABEL_6;
      }
      id v27 = [v3 objectForKeyedSubscript:@"Blit Command Nsec Times"];

      if (v27)
      {
        id v28 = [v3 objectForKeyedSubscript:@"Blit Command Nsec Times"];
        [WeakRetained setBlitTimeData:v28];

        unsigned int v11 = [WeakRetained blitEncoderTimeInfo];
        [v11 setDictionary:v3];
        goto LABEL_5;
      }
      long long v14 = [v3 objectForKeyedSubscript:@"derivedCounterData"];

      if (v14)
      {
        if (g_runningInCI)
        {
          unsigned int v29 = +[NSString stringWithFormat:@"derivedCounterData: strongSelf is %p, strongResult is %p", v5, WeakRetained];
          uint64_t v30 = [v29 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

          uint64_t v31 = __stdoutp;
          id v32 = v30;
          fprintf(v31, "#CI-INFO# %s\n", (const char *)[v32 UTF8String]);
        }
        if ((*((unsigned char *)v5[1] + 17) & 0x10) != 0)
        {
          if (g_runningInCI)
          {
            long long v33 = +[NSString stringWithFormat:@"includePerDrawTimings deferring"];
            uint64_t v34 = [v33 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

            long long v35 = __stdoutp;
            id v36 = v34;
            fprintf(v35, "#CI-INFO# %s\n", (const char *)[v36 UTF8String]);
          }
          [WeakRetained setDerivedCountersData:v3];
          goto LABEL_6;
        }
        [v5 _processDerivedEncoderCounterData:WeakRetained forDerivedEncoderData:v3 withEffectivePerDrawKickTimes:0 withShaderInfo:0];
        long long v14 = 0;
      }
    }
  }
LABEL_7:

  return v14;
}

- (void)writeGPUTimelineSerializedData
{
  id v3 = [self->_options->var0 stringByAppendingPathComponent:@"WorkloadArchive.data"];
  workloadTimelineInfo = self->_workloadTimelineInfo;
  id v7 = 0;
  id v5 = +[NSKeyedArchiver archivedDataWithRootObject:workloadTimelineInfo requiringSecureCoding:1 error:&v7];
  id v6 = v7;
  [v5 writeToFile:v3 atomically:0];
}

- (void)_dumpGPUTimelineDataResult:(id)a3
{
  id v4 = a3;
  int v52 = self;
  id v51 = [self->_options->var0 stringByAppendingPathComponent:@"aggregatedGPUTimeline.txt"];
  id v5 = [v4 aggregatedGPUTimelineInfo];
  id v6 = [v5 timestamps];
  id v7 = [v6 bytes];

  uint64_t v8 = [v4 aggregatedGPUTimelineInfo];
  id v9 = [v8 derivedCounterNames];
  LODWORD(v6) = [v9 count];

  uint64_t v10 = [v4 aggregatedGPUTimelineInfo];
  id v11 = [v10 derivedCounters];
  id v12 = [v11 bytes];

  id v13 = +[NSFileManager defaultManager];
  long long v14 = [v51 stringByDeletingLastPathComponent];
  [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:0];

  id v15 = v51;
  id v16 = fopen((const char *)[v15 UTF8String], "wt");
  id v17 = [v4 aggregatedGPUTimelineInfo];
  v50 = v15;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke;
  v62[3] = &unk_7454E8;
  long long v64 = v16;
  id v65 = v7;
  int v67 = (int)v6;
  id v18 = v4;
  id v63 = v18;
  id v66 = v12;
  [v17 enumerateActiveShadersForAllSamples:v62];

  fclose(v16);
  for (unint64_t i = 0; ; ++i)
  {
    int v20 = [v18 mGPUTimelineInfos];
    id v21 = [v20 count];

    if (i >= (unint64_t)v21) {
      break;
    }
    id var0 = v52->_options->var0;
    unsigned int v23 = +[NSString stringWithFormat:@"gpuTimeline_%lu.txt", i];
    double v24 = [var0 stringByAppendingPathComponent:v23];

    uint64_t v25 = [v18 mGPUTimelineInfos];
    id v26 = [v25 objectAtIndexedSubscript:i];
    id v27 = [v26 timestamps];
    id v28 = [v27 bytes];

    unsigned int v29 = [v18 mGPUTimelineInfos];
    uint64_t v30 = [v29 objectAtIndexedSubscript:i];
    uint64_t v31 = [v30 derivedCounterNames];
    LODWORD(v25) = [v31 count];

    id v32 = [v18 mGPUTimelineInfos];
    long long v33 = [v32 objectAtIndexedSubscript:i];
    id v34 = [v33 derivedCounters];
    id v35 = [v34 bytes];

    id v36 = +[NSFileManager defaultManager];
    uint64_t v37 = [v24 stringByDeletingLastPathComponent];
    [v36 createDirectoryAtPath:v37 withIntermediateDirectories:1 attributes:0 error:0];

    id v38 = v24;
    unint64_t v39 = fopen((const char *)[v38 UTF8String], "wt");
    int v40 = [v18 mGPUTimelineInfos];
    uint64_t v41 = [v40 objectAtIndexedSubscript:i];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_2;
    v56[3] = &unk_7454E8;
    id v58 = v39;
    id v59 = v28;
    int v61 = (int)v25;
    id v57 = v18;
    id v60 = v35;
    [v41 enumerateActiveShadersForAllSamples:v56];

    fclose(v39);
  }
  double v42 = [v18 derivedEncoderCounterInfo];
  uint64_t v43 = [v42 derivedCounterNames];

  uint64_t v44 = [v52->_options->var0 stringByAppendingPathComponent:@"gpuTimeline_derivedEncoderData.txt"];
  int64x2_t v45 = +[NSFileManager defaultManager];
  unsigned int v46 = [v44 stringByDeletingLastPathComponent];
  [v45 createDirectoryAtPath:v46 withIntermediateDirectories:1 attributes:0 error:0];

  id v47 = v44;
  double v48 = fopen((const char *)[v47 UTF8String], "wt");
  fprintf(v48, "TimeBase = %u/%u\n", [v18 timeBaseNumerator], [v18 timeBaseDenominator]);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_3;
  v53[3] = &unk_745510;
  uint64_t v55 = v48;
  id v49 = v43;
  id v54 = v49;
  [v18 enumerateEncoderDerivedData:v53];
  fclose(v48);
}

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke(uint64_t a1, _DWORD *a2, void *a3, unsigned int a4, int a5)
{
  fprintf(*(FILE **)(a1 + 40), "%8u %llu %8u : %u %u %llu 0x%llx\n", a4, *(void *)(*(void *)(a1 + 48) + 8 * a4), a5, *a2 & 0x3FFFFFFF, (*(void *)a2 >> 30) & 0x3FFFFFFF, *(void *)a2 >> 60, *a3);
  if (*(_DWORD *)(a1 + 64))
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(FILE **)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) aggregatedGPUTimelineInfo];
      uint64_t v10 = [v9 derivedCounterNames];
      id v11 = [v10 objectAtIndexedSubscript:v7];
      fprintf(v8, "\t\t\t%s : %f\n", (const char *)[v11 UTF8String], *(double *)(*(void *)(a1 + 56) + 8 * (v7 + *(_DWORD *)(a1 + 64) * a4)));

      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 64));
  }
}

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_2(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5)
{
  fprintf(*(FILE **)(a1 + 40), "%8u %llu %8u : %u %u %llu\n", a4, *(void *)(*(void *)(a1 + 48) + 8 * a4), a5, *a2 & 0x3FFFFFFF, (*(void *)a2 >> 30) & 0x3FFFFFFF, *(void *)a2 >> 60);
  if (*(_DWORD *)(a1 + 64))
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(FILE **)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) aggregatedGPUTimelineInfo];
      uint64_t v10 = [v9 derivedCounterNames];
      id v11 = [v10 objectAtIndexedSubscript:v7];
      fprintf(v8, "\t\t\t%s : %f\n", (const char *)[v11 UTF8String], *(double *)(*(void *)(a1 + 56) + 8 * (v7 + *(_DWORD *)(a1 + 64) * a4)));

      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 64));
  }
}

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_3(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  fprintf(*(FILE **)(a1 + 40), "Encoder Index:%8u Function Index:%llu EncoderType:%llu V[%.2f ns] F[%.2f ns] C[%.2f ns] B[%.2f ns]\n", a2, *(void *)a3, *(void *)(a3 + 8), *(double *)(a3 + 16), *(double *)(a3 + 24), *(double *)(a3 + 32), *(double *)(a3 + 40));
  if (a5)
  {
    uint64_t v8 = 0;
    do
    {
      id v9 = *(FILE **)(a1 + 40);
      id v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v8];
      fprintf(v9, "\t%s = %.3f\n", (const char *)[v10 UTF8String], *(double *)(a4 + 8 * v8));

      ++v8;
    }
    while (a5 != v8);
  }
}

- (void)processGPUTimelineDataSources:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  id v10 = (NSMutableDictionary *)objc_opt_new();
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v10;

  id v12 = [(GTShaderProfilerHelper *)self _gatherStaticInformation:a3 forReplayController:a5];
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v12;

  objc_initWeak(&location, self->_streamingMTLResult);
  objc_initWeak(&from, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  uint64_t v14[2] = __88__GTShaderProfilerHelper_processGPUTimelineDataSources_withPayload_forReplayController___block_invoke;
  v14[3] = &unk_7454C0;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  objc_retainBlock(v14);
  operator new();
}

uint64_t __88__GTShaderProfilerHelper_processGPUTimelineDataSources_withPayload_forReplayController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v7 = [v3 objectForKeyedSubscript:@"usc sampling address data"];

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v4);
    [v6 _calculatePerSampleActiveShaders:v3 withShaderProfilerResult:v8 forWorkloadInfo:v6[11]];
LABEL_5:

    goto LABEL_6;
  }
  id v9 = [v3 objectForKeyedSubscript:@"aggregated derived counters"];

  if (v9)
  {
    id v8 = objc_loadWeakRetained(v4);
    [v6 _calculatePerSampleAggregatedActiveShaders:v3 withShaderProfilerResult:v8 forWorkloadInfo:v6[11]];
    goto LABEL_5;
  }
  id v11 = [v3 objectForKeyedSubscript:@"derivedCounterData"];

  if (v11) {
    [v6 _addDerivedCounterDataToTimelineInfo:v3 usingShaderProfilerResult:WeakRetained];
  }
LABEL_6:

  return 0;
}

- (void)_addDerivedCounterDataToTimelineInfo:(id)a3 usingShaderProfilerResult:(id)a4
{
  id v5 = a3;
  id v38 = a4;
  double v42 = objc_opt_new();
  id v6 = [v5 objectForKeyedSubscript:@"derivedCounterData"];
  id v48 = v5;
  unint64_t v7 = [v6 objectForKeyedSubscript:@"counters"];
  id v8 = [v7 firstObject];

  unint64_t v39 = v8;
  id v9 = [v8 copy];
  [v42 setDerivedCounterNames:v9];

  id v10 = [v5 objectForKeyedSubscript:@"derivedCounterData"];
  uint64_t v41 = [v10 objectForKeyedSubscript:@"AverageSamples"];

  int64x2_t v45 = +[NSMutableData dataWithCapacity:8 * [v8 count] * [v41 count]];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obunsigned int j = v41;
  id v11 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v11)
  {
    uint64_t v44 = *(void *)v54;
    do
    {
      uint64_t v12 = 0;
      id v46 = v11;
      do
      {
        if (*(void *)v54 != v44) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v53 + 1) + 8 * v12);
        unint64_t v14 = (unint64_t)[v13 count];
        if (v14)
        {
          if (v14 >> 61) {
            abort();
          }
          id v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v14);
          id v17 = &v15[8 * v16];
          id v18 = v15;
        }
        else
        {
          id v18 = 0;
          id v17 = 0;
        }
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v19 = v13;
        id v20 = [v19 countByEnumeratingWithState:&v49 objects:v57 count:16];
        uint64_t v47 = v12;
        if (v20)
        {
          uint64_t v21 = *(void *)v50;
          id v22 = v18;
          do
          {
            for (unint64_t i = 0; i != v20; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v50 != v21) {
                objc_enumerationMutation(v19);
              }
              [*(id *)(*((void *)&v49 + 1) + 8 * i) doubleValue];
              uint64_t v25 = v24;
              if (v22 >= v17)
              {
                uint64_t v26 = (v22 - v18) >> 3;
                unint64_t v27 = v26 + 1;
                if ((unint64_t)(v26 + 1) >> 61) {
                  abort();
                }
                if ((v17 - v18) >> 2 > v27) {
                  unint64_t v27 = (v17 - v18) >> 2;
                }
                if ((unint64_t)(v17 - v18) >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v28 = v27;
                }
                if (v28) {
                  unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v28);
                }
                else {
                  uint64_t v29 = 0;
                }
                uint64_t v30 = (char *)(v28 + 8 * v26);
                *(void *)uint64_t v30 = v25;
                uint64_t v31 = v30 + 8;
                while (v22 != v18)
                {
                  uint64_t v32 = *((void *)v22 - 1);
                  v22 -= 8;
                  *((void *)v30 - 1) = v32;
                  v30 -= 8;
                }
                id v17 = (char *)(v28 + 8 * v29);
                if (v18) {
                  operator delete(v18);
                }
                id v18 = v30;
                id v22 = v31;
                id v5 = v48;
              }
              else
              {
                *(void *)id v22 = v24;
                v22 += 8;
              }
            }
            id v20 = [v19 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v20);
        }
        else
        {
          id v22 = v18;
        }

        [v45 appendBytes:v18 length:v22 - v18];
        if (v18) {
          operator delete(v18);
        }
        uint64_t v12 = v47 + 1;
      }
      while ((id)(v47 + 1) != v46);
      id v11 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v11);
  }

  [v42 setDerivedCounters:v45];
  long long v33 = [v5 objectForKeyedSubscript:@"GPU Encoder Info"];
  [v42 setEncoderInfos:v33];

  id v34 = [v5 objectForKeyedSubscript:@"Timebase"];
  id v35 = v34;
  if (v34 && [v34 count] == (char *)&def_1C1270 + 2)
  {
    id v36 = [v35 firstObject];
    -[DYWorkloadGPUTimelineInfo setTimeBaseNumerator:](self->_workloadTimelineInfo, "setTimeBaseNumerator:", [v36 unsignedIntValue]);

    uint64_t v37 = [v35 lastObject];
    -[DYWorkloadGPUTimelineInfo setTimeBaseDenominator:](self->_workloadTimelineInfo, "setTimeBaseDenominator:", [v37 unsignedIntValue]);
  }
  else
  {
    [(DYWorkloadGPUTimelineInfo *)self->_workloadTimelineInfo setTimeBaseNumerator:125];
    [(DYWorkloadGPUTimelineInfo *)self->_workloadTimelineInfo setTimeBaseDenominator:3];
  }
  [(DYWorkloadGPUTimelineInfo *)self->_workloadTimelineInfo setDerivedEncoderCounterInfo:v42];
}

- (void)waitForCompletion
{
  [(NSOperationQueue *)self->_operationQueue addOperation:self->waitOperation];
  [(NSOperation *)self->waitOperation waitUntilFinished];
  if ((*((unsigned char *)self->_options + 16) & 0x40) != 0)
  {
    id v3 = +[NSFileManager defaultManager];
    [v3 contentsOfDirectoryAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/" error:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          id v9 = [@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/" stringByAppendingPathComponent:v8];
          id v10 = [self->_options->var0 stringByAppendingPathComponent:v8];
          [v3 moveItemAtPath:v9 toPath:v10 error:0];
        }
        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  std::unique_ptr<MTLGRCStreamingSampleHelper>::reset[abi:nn180100]((uint64_t **)&self->_streamingHelper, 0);
}

- (void)processStreamingGRCData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __50__GTShaderProfilerHelper_processStreamingGRCData___block_invoke;
  v7[3] = &unk_745C68;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  uint64_t v6 = +[NSBlockOperation blockOperationWithBlock:v7];
  [(NSOperation *)self->waitOperation addDependency:v6];
  [(NSOperationQueue *)self->_operationQueue addOperation:v6];
  [v6 waitUntilFinished];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__GTShaderProfilerHelper_processStreamingGRCData___block_invoke(uint64_t a1)
{
  id WeakRetained = (MTLGRCStreamingSampleHelperImpl ***)objc_loadWeakRetained((id *)(a1 + 40));
  MTLGRCStreamingSampleHelperImpl::ProcessStreamedData(*WeakRetained[2], *(NSDictionary **)(a1 + 32), v2);
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"End Streaming Data"];

  if (v3)
  {
    id v4 = WeakRetained[2];
    id v5 = *v4;
    [*((id *)*v4 + 6) addOperation:*((void *)*v4 + 7)];
    [*((id *)v5 + 7) waitUntilFinished];
    [WeakRetained _handlePerDrawCounterData];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"End Batch ID Streaming Data"];

    if (v6)
    {
      unint64_t v7 = WeakRetained[2];
      id v8 = *v7;
      [*((id *)*v7 + 6) addOperation:*((void *)*v7 + 7)];
      [*((id *)v8 + 7) waitUntilFinished];
    }
  }
}

- (id)convertBinaryInfoToJSONDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [v5 objectForKeyedSubscript:v9];
          long long v11 = [v10 analyzerResult];
          long long v12 = [v11 perFileLineCostDictForCI];

          [v4 setObject:v12 forKeyedSubscript:v9];
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = &__NSDictionary0__struct;
  }

  return v4;
}

- (void)_handlePerDrawCounterData
{
  if ((*((unsigned char *)self->_options + 16) & 1) == 0)
  {
    [(GTShaderProfilerHelper *)self _analyzeShaderBinarySamplesForResult:self->_streamingMTLResult forShaderKeyToSourcePath:0];
    [(GTShaderProfilerHelper *)self _calculatePerDrawCosts:self->_streamingMTLResult];
    if ((*((unsigned char *)self->_options + 17) & 0x10) != 0)
    {
      uint64_t v44 = self;
      if (g_runningInCI)
      {
        id v3 = +[NSString stringWithFormat:@"includePerDrawTimings now processing"];
        id v4 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

        id v5 = __stdoutp;
        id v6 = v4;
        fprintf(v5, "#CI-INFO# %s\n", (const char *)[v6 UTF8String]);
      }
      uint64_t v7 = v44->_streamingMTLResult;
      uint64_t v43 = v7;
      if (g_runningInCI)
      {
        id v8 = +[NSString stringWithFormat:@"includePerDrawTimings: strongSelf is %p, result is %p", v44, v7];
        uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

        id v10 = __stdoutp;
        id v11 = v9;
        fprintf(v10, "#CI-INFO# %s\n", (const char *)[v11 UTF8String]);

        uint64_t v7 = v43;
      }
      id v46 = [(DYShaderProfilerResult *)v7 effectivePerEncoderDrawKickTimes];
      long long v12 = [(NSMutableDictionary *)v44->_payload objectForKeyedSubscript:@"totalDrawCount"];
      unsigned int v13 = [v12 unsignedIntValue];

      int64x2_t v45 = [(NSMutableDictionary *)v44->_payload objectForKeyedSubscript:@"activePerEncoderDrawCallCount"];
      double v42 = [(NSMutableDictionary *)v44->_payload objectForKeyedSubscript:@"perEncoderKickCount"];
      id v47 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v13];
      id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v13];
      id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v13];
      id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v13];
      id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v13];
      for (unint64_t i = 0; i < (unint64_t)[v46 count]; ++i)
      {
        id v19 = [v46 objectAtIndexedSubscript:i];
        id v20 = [v45 objectAtIndexedSubscript:i];
        unsigned int v21 = [v20 unsignedIntValue];

        if (v21)
        {
          for (unint64_t j = 0; j < (unint64_t)[v19 count]; ++j)
          {
            unsigned int v23 = [v19 objectAtIndexedSubscript:j];
            uint64_t v24 = [v23 objectAtIndexedSubscript:0];
            [v47 addObject:v24];

            uint64_t v25 = [v23 objectAtIndexedSubscript:1];
            [v14 addObject:v25];

            uint64_t v26 = [v23 objectAtIndexedSubscript:2];
            [v15 addObject:v26];

            unint64_t v27 = +[NSNumber numberWithUnsignedInteger:i];
            [v16 addObject:v27];

            unint64_t v28 = +[NSNumber numberWithUnsignedInteger:j];
            [v17 addObject:v28];
          }
        }
        else if ([v19 count] != (char *)&def_1C1270 + 1)
        {
          uint64_t v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Encoder %lu should be empty, expecting dummy draw call but found %lu", i, [v19 count]);
          uint64_t v30 = __stdoutp;
          int v31 = g_runningInCI;
          id v32 = v29;
          long long v33 = (const char *)[v32 UTF8String];
          id v34 = "#CI_ERROR# ";
          if (!v31) {
            id v34 = "";
          }
          fprintf(v30, "%s%s %u: %s\n", v34, "-[GTShaderProfilerHelper _handlePerDrawCounterData]", 3296, v33);
          id v35 = v32;
          GTMTLReplay_handleError(101, (uint64_t)[v35 UTF8String], "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm", (uint64_t)"-[GTShaderProfilerHelper _handlePerDrawCounterData]", 3296, 1);
        }
      }
      v50[0] = @"vertex";
      id v36 = [(GTShaderProfilerHelper *)v44 convertBinaryInfoToJSONDictionary:v43->super._vertexShaderBinaryInfo];
      v51[0] = v36;
      v50[1] = @"fragment";
      uint64_t v37 = [(GTShaderProfilerHelper *)v44 convertBinaryInfoToJSONDictionary:v43->super._fragmentShaderBinaryInfo];
      v51[1] = v37;
      v50[2] = @"compute";
      id v38 = [(GTShaderProfilerHelper *)v44 convertBinaryInfoToJSONDictionary:v43->super._computeKernelBinaryInfo];
      v51[2] = v38;
      unint64_t v39 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];

      v48[0] = @"GPUTime_vtx";
      v48[1] = @"GPUTime_frg";
      v49[0] = v47;
      v49[1] = v14;
      v48[2] = @"GPUTime_cmp";
      v48[3] = @"encoder";
      v49[2] = v15;
      v49[3] = v16;
      v48[4] = @"drawIndexInEncoder";
      v48[5] = @"activePerEncoderDrawCallCount";
      v49[4] = v17;
      v49[5] = v45;
      v48[6] = @"perEncoderKickCount";
      v49[6] = v42;
      int v40 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:7];
      uint64_t v41 = [(DYShaderProfilerResult *)v43 derivedCountersData];
      [(GTShaderProfilerHelper *)v44 _processDerivedEncoderCounterData:v43 forDerivedEncoderData:v41 withEffectivePerDrawKickTimes:v40 withShaderInfo:v39];
    }
  }
}

- (void)_calculatePerDrawCosts:(id)a3
{
  v196 = self;
  v209 = (char *)a3;
  unsigned int v3 = [v209 encoderCount];
  id v4 = operator new(0x20uLL);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v229 = 0;
  v230 = 0;
  v228 = 0;
  if (v3)
  {
    id v5 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v3);
    v228 = v5;
    v229 = v5;
    v230 = &v5[3 * v6];
    uint64_t v7 = &v5[3 * v3];
    do
    {
      *id v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
      std::vector<NSString * {__strong}>::__vallocate[abi:nn180100](v5, 4uLL);
      id v8 = (_OWORD *)v5[1];
      long long v9 = v4[1];
      *id v8 = *v4;
      v8[1] = v9;
      v5[1] = v8 + 2;
      v5 += 3;
    }
    while (v5 != v7);
    v229 = v7;
  }
  operator delete(v4);
  long long v199 = [v209 loadActionTimes];
  long long v198 = [v209 storeActionTimes];
  id v10 = [v199 count];
  if (v10 == (id)[v209 encoderCount])
  {
    id v11 = [v198 count];
    if (v11 == (id)[v209 encoderCount])
    {
      uint64_t v12 = 0;
      for (unint64_t i = 0; i < [v209 encoderCount]; ++i)
      {
        id v14 = [v199 objectAtIndexedSubscript:i];
        id v15 = v14;
        if (v14)
        {
          [v14 timing];
          double v16 = v226.f64[0];
        }
        else
        {
          memset(v227, 0, sizeof(v227));
          double v16 = 0.0;
          float64x2_t v226 = 0u;
        }

        id v17 = [v198 objectAtIndexedSubscript:i];
        id v18 = v17;
        if (v17)
        {
          [v17 timing];
          double v19 = v226.f64[0];
        }
        else
        {
          memset(v227, 0, sizeof(v227));
          double v19 = 0.0;
          float64x2_t v226 = 0u;
        }

        uint64_t v20 = v228[v12];
        *(double *)(v20 + 8) = v16 + v19 + *(double *)(v20 + 8);
        *(double *)(v20 + 24) = v16 + v19 + *(double *)(v20 + 24);
        v12 += 3;
      }
    }
  }
  [v209 shaderProfilingTime:v196];
  double v22 = v21;
  long long v224 = 0u;
  long long v225 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  unsigned int v23 = [v209 drawCallInfoList];
  obunint64_t j = v23;
  id v24 = [v23 countByEnumeratingWithState:&v222 objects:v234 count:16];
  if (v24)
  {
    int v25 = 0;
    uint64_t v26 = *(void *)v223;
    do
    {
      for (unint64_t j = 0; j != v24; unint64_t j = (char *)j + 1)
      {
        if (*(void *)v223 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v222 + 1) + 8 * (void)j);
        uint64_t v29 = [(id)v28 programInfo];
        if (v29
          && ([(id)v28 programInfo],
              uint64_t v30 = objc_claimAutoreleasedReturnValue(),
              BOOL v31 = [v30 programId] == (id)-1,
              v30,
              v29,
              v31))
        {
          ++v25;
        }
        else
        {
          id v32 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [(id)v28 drawCallIndex] - v25);
          long long v33 = *(void **)(v28 + 8);
          if (v33 && [v33 length])
          {
            id v34 = [*((id *)v209 + 30) objectForKeyedSubscript:*(void *)(v28 + 8)];
            id v35 = [v34 analyzerResult];

            id v36 = [v35 drawCallCost];
            uint64_t v37 = [v36 objectForKeyedSubscript:v32];
            [v37 doubleValue];
            double v39 = v38;

            *(double *)(v28 + 40) = v39;
            *(double *)(v28 + 48) = v39;
            *(double *)(v28 + 56) = v39;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 40), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v39 + *(double *)(v28 + 200);
            unsigned int v40 = [(id)v28 encoderIndex];
            *(double *)v228[3 * v40] = v39 + *(double *)v228[3 * v40];
            unsigned int v41 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v41] + 24) = v39 + *(double *)(v228[3 * v41] + 24);
          }
          double v42 = *(void **)(v28 + 16);
          if (v42 && [v42 length])
          {
            uint64_t v43 = [*((id *)v209 + 31) objectForKeyedSubscript:*(void *)(v28 + 16)];
            uint64_t v44 = [v43 analyzerResult];

            int64x2_t v45 = [v44 drawCallCost];
            id v46 = [v45 objectForKeyedSubscript:v32];
            [v46 doubleValue];
            double v48 = v47;

            *(double *)(v28 + 88) = v48;
            *(double *)(v28 + 96) = v48;
            *(double *)(v28 + 104) = v48;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 88), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v48 + *(double *)(v28 + 200);
            unsigned int v49 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v49] + 8) = v48 + *(double *)(v228[3 * v49] + 8);
            unsigned int v50 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v50] + 24) = v48 + *(double *)(v228[3 * v50] + 24);
          }
          long long v51 = *(void **)(v28 + 24);
          if (v51 && [v51 length])
          {
            long long v52 = [*((id *)v209 + 32) objectForKeyedSubscript:*(void *)(v28 + 24)];
            long long v53 = [v52 analyzerResult];

            long long v54 = [v53 drawCallCost];
            long long v55 = [v54 objectForKeyedSubscript:v32];
            [v55 doubleValue];
            double v57 = v56;

            *(double *)(v28 + 136) = v57;
            *(double *)(v28 + 144) = v57;
            *(double *)(v28 + 152) = v57;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 136), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v57 + *(double *)(v28 + 200);
            unsigned int v58 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v58] + 16) = v57 + *(double *)(v228[3 * v58] + 16);
            unsigned int v59 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v59] + 24) = v57 + *(double *)(v228[3 * v59] + 24);
          }
          *(float64x2_t *)(v209 + 8) = vaddq_f64(*(float64x2_t *)(v28 + 40), *(float64x2_t *)(v209 + 8));
          *((double *)v209 + 3) = *(double *)(v28 + 56) + *((double *)v209 + 3);
          *(float64x2_t *)(v209 + 56) = vaddq_f64(*(float64x2_t *)(v28 + 88), *(float64x2_t *)(v209 + 56));
          *((double *)v209 + 9) = *(double *)(v28 + 104) + *((double *)v209 + 9);
          *(float64x2_t *)(v209 + 104) = vaddq_f64(*(float64x2_t *)(v28 + 136), *(float64x2_t *)(v209 + 104));
          *((double *)v209 + 15) = *(double *)(v28 + 152) + *((double *)v209 + 15);
          *(float64x2_t *)(v209 + 152) = vaddq_f64(*(float64x2_t *)(v28 + 184), *(float64x2_t *)(v209 + 152));
          *((double *)v209 + 21) = *(double *)(v28 + 200) + *((double *)v209 + 21);
        }
      }
      unsigned int v23 = obj;
      id v24 = [obj countByEnumeratingWithState:&v222 objects:v234 count:16];
    }
    while (v24);
  }

  uint64_t v60 = 0;
  for (unint64_t k = 0; k < [v209 encoderCount]; ++k)
  {
    int v62 = [v199 objectAtIndexedSubscript:k];
    id v63 = v62;
    if (v62)
    {
      [v62 timing];
    }
    else
    {
      memset(v227, 0, sizeof(v227));
      float64x2_t v226 = 0u;
    }
    double v64 = *(double *)(v228[v60] + 8);
    id v65 = [v209 effectiveKickTimes];
    id v66 = [v65 objectAtIndexedSubscript:k];
    int v67 = [v66 objectAtIndexedSubscript:1];
    [v67 doubleValue];
    if (v64 != 0.0)
    {
      double v69 = v68 / 1000000000.0;
      if (v69 != 0.0)
      {
        double v70 = v69 / v64;
        *(float64x2_t *)((char *)v227 + 8) = vmulq_n_f64(v226, v70);
        *((double *)&v227[1] + 1) = v70 * *(double *)v227;
      }
    }

    unsigned int v71 = [v198 objectAtIndexedSubscript:k];
    unint64_t v72 = v71;
    if (v71)
    {
      [v71 timing];
    }
    else
    {
      memset(v227, 0, sizeof(v227));
      float64x2_t v226 = 0u;
    }
    double v73 = *(double *)(v228[v60] + 8);
    long long v74 = [v209 effectiveKickTimes];
    double v75 = [v74 objectAtIndexedSubscript:k];
    double v76 = [v75 objectAtIndexedSubscript:1];
    [v76 doubleValue];
    if (v73 != 0.0)
    {
      double v78 = v77 / 1000000000.0;
      if (v78 != 0.0)
      {
        double v79 = v78 / v73;
        *(float64x2_t *)((char *)v227 + 8) = vmulq_n_f64(v226, v79);
        *((double *)&v227[1] + 1) = v79 * *(double *)v227;
      }
    }

    v60 += 3;
  }
  long long v220 = 0u;
  long long v221 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  id v200 = [v209 drawCallInfoList];
  id v80 = [v200 countByEnumeratingWithState:&v218 objects:v233 count:16];
  if (v80)
  {
    uint64_t v201 = *(void *)v219;
    do
    {
      id v203 = v80;
      for (uint64_t m = 0; m != v203; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v219 != v201) {
          objc_enumerationMutation(v200);
        }
        uint64_t v82 = *(void *)(*((void *)&v218 + 1) + 8 * (void)m);
        uint64_t v83 = [(id)v82 programInfo];
        if (v83)
        {
          unint64_t v84 = [(id)v82 programInfo];
          BOOL v85 = [v84 programId] == (id)-1;

          if (v85) {
            continue;
          }
        }
        id v86 = *(void **)(v82 + 8);
        if (v86 && [v86 length])
        {
          unsigned int v87 = [(id)v82 encoderIndex];
          double v88 = *(double *)v228[3 * v87];
          id v89 = [v209 effectiveKickTimes];
          unsigned int v90 = [v89 objectAtIndexedSubscript:[v82 encoderIndex]];
          int v91 = [v90 objectAtIndexedSubscript:0];
          [v91 doubleValue];
          if (v88 != 0.0)
          {
            double v93 = v92 / 1000000000.0;
            if (v93 != 0.0)
            {
              double v94 = v93 / v88;
              double v95 = v94 * *(double *)(v82 + 56);
              *(float64x2_t *)(v82 + 64) = vmulq_n_f64(*(float64x2_t *)(v82 + 40), v94);
              *(double *)(v82 + 80) = v95;
            }
          }
        }
        unsigned int v96 = *(void **)(v82 + 16);
        if (v96 && [v96 length])
        {
          unsigned int v97 = [(id)v82 encoderIndex];
          double v98 = *(double *)(v228[3 * v97] + 8);
          uint64_t v99 = [v209 effectiveKickTimes];
          uint64_t v100 = [v99 objectAtIndexedSubscript:[v82 encoderIndex]];
          uint64_t v101 = [v100 objectAtIndexedSubscript:1];
          [v101 doubleValue];
          if (v98 != 0.0)
          {
            double v103 = v102 / 1000000000.0;
            if (v103 != 0.0)
            {
              double v104 = v103 / v98;
              double v105 = v104 * *(double *)(v82 + 104);
              *(float64x2_t *)(v82 + 112) = vmulq_n_f64(*(float64x2_t *)(v82 + 88), v104);
              *(double *)(v82 + 128) = v105;
            }
          }
        }
        uint64_t v106 = *(void **)(v82 + 24);
        if (v106 && [v106 length])
        {
          unsigned int v107 = [(id)v82 encoderIndex];
          double v108 = *(double *)(v228[3 * v107] + 16);
          int v109 = [v209 effectiveKickTimes];
          uint64_t v110 = [v109 objectAtIndexedSubscript:[v82 encoderIndex]];
          long long v111 = [v110 objectAtIndexedSubscript:2];
          [v111 doubleValue];
          if (v108 != 0.0)
          {
            double v113 = v112 / 1000000000.0;
            if (v113 != 0.0)
            {
              double v114 = v113 / v108;
              double v115 = v114 * *(double *)(v82 + 152);
              *(float64x2_t *)(v82 + 160) = vmulq_n_f64(*(float64x2_t *)(v82 + 136), v114);
              *(double *)(v82 + 176) = v115;
            }
          }
        }
        unsigned int v116 = [(id)v82 encoderIndex];
        double v117 = *(double *)(v228[3 * v116] + 24);
        id obja = [v209 effectiveKickTimes];
        uint64_t v118 = objc_msgSend(obja, "objectAtIndexedSubscript:", objc_msgSend((id)v82, "encoderIndex"));
        long long v119 = [v118 objectAtIndexedSubscript:0];
        [v119 doubleValue];
        double v121 = v120;
        long long v122 = [v209 effectiveKickTimes];
        unsigned int v123 = [v122 objectAtIndexedSubscript:[v82 encoderIndex]];
        uint64_t v124 = [v123 objectAtIndexedSubscript:1];
        [v124 doubleValue];
        double v126 = v125;
        unint64_t v127 = [v209 effectiveKickTimes];
        long long v128 = [v127 objectAtIndexedSubscript:[v82 encoderIndex]];
        id v129 = [v128 objectAtIndexedSubscript:2];
        [v129 doubleValue];
        if (v117 != 0.0)
        {
          double v131 = (v121 + v126 + v130) / 1000000000.0;
          if (v131 != 0.0)
          {
            double v132 = v131 / v117;
            double v133 = v132 * *(double *)(v82 + 200);
            *(float64x2_t *)(v82 + 208) = vmulq_n_f64(*(float64x2_t *)(v82 + 184), v132);
            *(double *)(v82 + 224) = v133;
          }
        }
      }
      id v80 = [v200 countByEnumeratingWithState:&v218 objects:v233 count:16];
    }
    while (v80);
  }

  double v134 = *((double *)v209 + 19);
  if (v134 == 0.0 || v22 / 1000000000.0 == 0.0)
  {
    objb[0] = *((id *)v209 + 19);
    v136 = v209;
    v138.f64[0] = *((float64_t *)v209 + 22);
  }
  else
  {
    double v135 = v22 / 1000000000.0 / v134;
    v136 = v209;
    double v137 = v135 * *((double *)v209 + 21);
    *(_OWORD *)objb = *(_OWORD *)(v209 + 152);
    float64x2_t v138 = vmulq_n_f64(*(float64x2_t *)objb, v135);
    *((float64x2_t *)v209 + 11) = v138;
    *((double *)v209 + 24) = v137;
  }
  double v139 = v138.f64[0] * 1000000000.0;
  if (v139 >= 1.0) {
    double v140 = v139;
  }
  else {
    double v140 = 1.0;
  }
  uint64_t v141 = [v136 blitTimeData];
  BOOL v142 = v141 == 0;

  double v143 = *(double *)objb / v140;
  if (v142)
  {
    double v148 = 0.0;
  }
  else
  {
    long long v216 = 0u;
    long long v217 = 0u;
    long long v214 = 0u;
    long long v215 = 0u;
    uint64_t v144 = [v209 drawCallInfoList];
    id v145 = [v144 countByEnumeratingWithState:&v214 objects:v232 count:16];
    if (v145)
    {
      unsigned int v146 = 0;
      uint64_t v147 = *(void *)v215;
      double v148 = 0.0;
      do
      {
        for (n = 0; n != v145; n = (char *)n + 1)
        {
          if (*(void *)v215 != v147) {
            objc_enumerationMutation(v144);
          }
          uint64_t v150 = *(void *)(*((void *)&v214 + 1) + 8 * (void)n);
          uint64_t v151 = [(id)v150 programInfo];
          if (v151)
          {
            v154 = [(id)v150 programInfo];
            BOOL v155 = [v154 programId] == (id)-1;

            if (v155)
            {
              uint64_t v156 = [v209 blitTimeData];
              BOOL v157 = (unint64_t)[v156 count] > v146;

              if (v157)
              {
                uint64_t v158 = [v209 blitTimeData];
                v159 = [v158 objectAtIndexedSubscript:v146];
                [v159 doubleValue];
                double v161 = v160;

                ++v146;
                double v152 = v143 * v161;
                *(double *)(v150 + 184) = v143 * v161;
                *(double *)(v150 + 192) = v143 * v161;
                *(double *)(v150 + 200) = v143 * v161;
                double v148 = v148 + v161;
                if (v143 * v161 != 0.0)
                {
                  v153.f64[0] = v161 / 1000000000.0;
                  if (v161 / 1000000000.0 != 0.0)
                  {
                    double v162 = v153.f64[0] / v152;
                    double v152 = v162 * v152;
                    float64x2_t v153 = vmulq_n_f64(*(float64x2_t *)(v150 + 184), v162);
                    *(float64x2_t *)(v150 + 208) = v153;
                    *(double *)(v150 + 224) = v152;
                  }
                }
              }
            }
          }
        }
        id v145 = [v144 countByEnumeratingWithState:&v214 objects:v232 count:16 v152 v153.f64[0]];
      }
      while (v145);
    }
    else
    {
      double v148 = 0.0;
    }
  }
  double v163 = v143 * v148 + *((double *)v209 + 19);
  *((double *)v209 + 19) = v163;
  *((double *)v209 + 20) = v163;
  *((double *)v209 + 21) = v163;
  [v209 gpuTime];
  if (v163 != 0.0 && v164 != 0.0)
  {
    double v165 = v164 / v163;
    double v166 = v165 * *((double *)v209 + 21);
    *((float64x2_t *)v209 + 11) = vmulq_n_f64(*(float64x2_t *)(v209 + 152), v165);
    *((double *)v209 + 24) = v166;
  }
  objc = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v209 encoderCount]);
  v202 = [*(id *)(v197 + 48) objectForKeyedSubscript:@"activePerEncoderDrawCallCount"];
  for (iunint64_t i = 0; ii < (unint64_t)[v202 count]; ++ii)
  {
    v168 = [v202 objectAtIndexedSubscript:ii];
    unsigned int v169 = [v168 unsignedIntValue];

    id v170 = +[NSMutableArray arrayWithCapacity:v169];
    id v171 = [&off_758B10 mutableCopy];
    [v170 addObject:v171];

    if (v169 >= 2)
    {
      uint64_t v172 = v169 - 1;
      do
      {
        id v173 = [&off_758B28 mutableCopy];
        [v170 addObject:v173];

        --v172;
      }
      while (v172);
    }
    [objc addObject:v170];
  }
  long long v212 = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  uint64_t v174 = [v209 drawCallInfoList];
  id v204 = v174;
  id v175 = [v174 countByEnumeratingWithState:&v210 objects:v231 count:16];
  if (v175)
  {
    unsigned int v176 = 0;
    uint64_t v177 = *(void *)v211;
    unsigned int v178 = -1;
    do
    {
      for (junint64_t j = 0; jj != v175; junint64_t j = (char *)jj + 1)
      {
        if (*(void *)v211 != v177) {
          objc_enumerationMutation(v204);
        }
        uint64_t v180 = *(void *)(*((void *)&v210 + 1) + 8 * (void)jj);
        long long v181 = [(id)v180 programInfo];
        if (v181)
        {
          long long v182 = [(id)v180 programInfo];
          BOOL v183 = [v182 programId] == (id)-1;

          if (v183) {
            continue;
          }
        }
        if ([(id)v180 encoderIndex] == v178)
        {
          ++v176;
        }
        else
        {
          unsigned int v178 = [(id)v180 encoderIndex];
          unsigned int v176 = 0;
        }
        if ((unint64_t)[objc count] > v178)
        {
          long long v184 = *(void **)(v180 + 8);
          if (v184 && [v184 length])
          {
            unsigned int v185 = +[NSNumber numberWithDouble:*(double *)(v180 + 64) * 1000000000.0];
            v186 = [objc objectAtIndexedSubscript:v178];
            v187 = [v186 objectAtIndexedSubscript:v176];
            [v187 setObject:v185 atIndexedSubscript:0];
          }
          v188 = *(void **)(v180 + 16);
          if (v188 && [v188 length])
          {
            long long v189 = +[NSNumber numberWithDouble:*(double *)(v180 + 112) * 1000000000.0];
            long long v190 = [objc objectAtIndexedSubscript:v178];
            int v191 = [v190 objectAtIndexedSubscript:v176];
            [v191 setObject:v189 atIndexedSubscript:1];
          }
          v192 = *(void **)(v180 + 24);
          if (v192 && [v192 length])
          {
            v193 = +[NSNumber numberWithDouble:*(double *)(v180 + 160) * 1000000000.0];
            v194 = [objc objectAtIndexedSubscript:v178];
            v195 = [v194 objectAtIndexedSubscript:v176];
            [v195 setObject:v193 atIndexedSubscript:2];
          }
        }
      }
      uint64_t v174 = v204;
      id v175 = [v204 countByEnumeratingWithState:&v210 objects:v231 count:16];
    }
    while (v175);
  }

  [v209 setEffectivePerEncoderDrawKickTimes:objc];
  *(void *)&v226.f64[0] = &v228;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v226);
}

- (void)_analyzeShaderBinarySamplesForResult:(id)a3 forShaderKeyToSourcePath:(id)a4
{
  id v5 = a3;
  int v6 = MetalPluginTarget(self->_metalPluginName);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke;
  v7[3] = &unk_745498;
  void v7[4] = self;
  int v8 = v6;
  [(GTShaderProfilerHelper *)self _visitAllShaderInfosInResult:v5 usingBlock:v7];
}

void __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke_2;
  v11[3] = &unk_745470;
  id v8 = v6;
  id v12 = v8;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = v9;
  uint64_t v14 = v10;
  int v15 = *(_DWORD *)(a1 + 40);
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
}

void __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke_2(uint64_t a1, void *a2)
{
  id v19 = a2;
  unsigned int v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:];
  id v4 = v3;
  if (g_runningInCI)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v3 binary];
    uint64_t v7 = [v4 dylib];
    id v8 = [v4 type];
    id v9 = [v4 uscSamples];
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"_analyzeShaderBinarySamplesForResult [%@][%@] binary:%p dylib:%@ type:%@ samples:%lu", v5, v19, v6, v7, v8, [v9 length]);

    id v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    id v12 = __stdoutp;
    id v13 = v11;
    fprintf(v12, "#CI-INFO# %s\n", (const char *)[v13 UTF8String]);
  }
  uint64_t v14 = [v4 binary];

  if (v14)
  {
    int v15 = *(void **)(a1 + 48);
    double v16 = [v4 binary];
    id v17 = [v4 uscSamples];
    id v18 = [v15 analyzedBinary:v16 processedUscSamples:v17 targetIndex:*(unsigned int *)(a1 + 56) withKey:v19 withShaderSourcePath:0];

    if (!v18) {
      id v18 = objc_opt_new();
    }
    [v4 setAnalyzerResult:v18];
  }
}

- (id)analyzedBinary:(id)a3 processedUscSamples:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v13 length])
  {
    double v16 = [(GTShaderProfilerHelper *)self _calculatePerLineCostWithSampleData:v13 binary:v12 targetIndex:v9 withKey:v14 withShaderSourcePath:v15];
    if (!v16)
    {
      double v16 = [(GTShaderProfilerHelper *)self _calculatePerDrawCallWithGRCSampleData:v13 targetIndex:v9];
    }
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (id)_calculatePerDrawCallWithGRCSampleData:(id)a3 targetIndex:(int)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  int v21 = 1065353216;
  id v4 = a3;
  uint64_t v5 = (char *)[v4 bytes];
  unint64_t v6 = (unint64_t)[v4 length];
  if ((v6 & 0xFFFFFFFF0) != 0)
  {
    uint64_t v7 = (v6 >> 4);
    id v8 = (double *)(v5 + 8);
    double v9 = 0.0;
    do
    {
      unsigned int v18 = *((_DWORD *)v8 - 1) & 0xFFFFFFF;
      double v10 = *v8;
      id v11 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)&v19, v18, &v18);
      double v9 = v9 + v10;
      v11[3] = v10 + v11[3];
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }
  id v12 = objc_opt_new();
  [v12 setTotalCost:v9];
  id v13 = +[NSMutableDictionary dictionaryWithCapacity:*((void *)&v20 + 1)];
  [v12 setDrawCallCost:v13];
  for (unint64_t i = (double *)v20; i; unint64_t i = *(double **)i)
  {
    id v15 = +[NSNumber numberWithDouble:i[3]];
    double v16 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)i + 4)];
    [v13 setObject:v15 forKeyedSubscript:v16];
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v19);

  return v12;
}

- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v38 = v12;
  if (g_runningInCI)
  {
    double v16 = +[NSString stringWithFormat:@"In _calculatePerLineCostWithSampleData"];
    id v17 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    unsigned int v18 = __stdoutp;
    id v19 = v17;
    fprintf(v18, "#CI-INFO# %s\n", (const char *)[v19 UTF8String]);

    id v12 = v38;
  }
  [(GTShaderProfilerHelper *)self _getDebugInfoForBinary:v13 withTextSegment:0 forTargetIndex:v9];
  long long v45 = 0uLL;
  uint64_t v46 = 0;
  [(GTShaderProfilerHelper *)self _getAddressAndLineTableForDebugInfo:v47];
  int v21 = __p[0];
  long long v20 = __p[1];
  __p[1] = 0;
  *(void *)uint64_t v43 = 0;
  __p[0] = 0;
  std::vector<std::vector<DebugInfo::LineEntry *>>::__vdeallocate((uint64_t *)&v45);
  long long v45 = *(_OWORD *)&v43[8];
  uint64_t v46 = v44;
  *(void *)&v43[16] = 0;
  uint64_t v44 = 0;
  *(void *)&v43[8] = 0;
  *(void *)&v40[0] = &v43[8];
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v40);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  id v22 = v12;
  unsigned int v23 = (char *)[v22 bytes];
  unint64_t v24 = (unint64_t)[v22 length];
  *(_OWORD *)__p = 0u;
  *(_OWORD *)uint64_t v43 = 0u;
  *(_DWORD *)&v43[16] = 1065353216;
  memset(v40, 0, sizeof(v40));
  int v41 = 1065353216;
  if ((void)v45 == *((void *)&v45 + 1))
  {
    id v34 = 0;
  }
  else
  {
    id v36 = v22;
    id v37 = v15;
    if ((v24 & 0xFFFFFFFF0) != 0)
    {
      uint64_t v25 = (v24 >> 4);
      uint64_t v26 = (double *)(v23 + 8);
      double v27 = 0.0;
      do
      {
        unint64_t v28 = *((unsigned int *)v26 - 2);
        unsigned int v29 = *((_DWORD *)v26 - 1) & 0xFFFFFFF;
        unsigned int v39 = v29;
        double v30 = *v26;
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v48[1] - v48[0]) >> 3) > v28)
        {
          uint64_t v31 = v48[0] + 40 * v28;
          *(double *)(v31 + 16) = v30 + *(double *)(v31 + 16);
          ++*(_DWORD *)(v31 + 24);
        }
        if ((v20 - (unsigned char *)v21) >> 2 <= v28) {
          unsigned int v32 = -1 - 1431655765 * ((*((void *)&v45 + 1) - (void)v45) >> 3);
        }
        else {
          unsigned int v32 = v21[v28];
        }
        -[GTShaderProfilerHelper _ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:](self, "_ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:", (void)v45 + 24 * v32, __p, v47, v30);
        long long v33 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)v40, v29, &v39);
        double v27 = v27 + v30;
        v33[3] = v30 + v33[3];
        v26 += 2;
        --v25;
      }
      while (v25);
    }
    else
    {
      double v27 = 0.0;
    }
    id v15 = v37;
    [(GTShaderProfilerHelper *)self _processPerLineCostDataForLineTable:&v45 withFileCost:__p withDebugInfo:v47 andAllDrawCost:v14 withKey:v37 withShaderSourcePath:v40 withDrawCost:v27];
    id v34 = v22 = v36;
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v40);
  std::__hash_table<std::__hash_value_type<std::string,PerFileCost>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerFileCost>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerFileCost>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerFileCost>>>::~__hash_table((uint64_t)__p);
  __p[0] = &v45;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  if (v21) {
    operator delete(v21);
  }
  __p[0] = v48;
  std::vector<DebugInfo::LineDisassemblyInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  __p[0] = v47;
  std::vector<DebugInfo::LineEntry>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);

  return v34;
}

- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v56 = a7;
  id v55 = a8;
  id v58 = a10;
  long long v54 = v17;
  [(GTShaderProfilerHelper *)self _getDebugInfoForBinary:v17 withTextSegment:v18 forTargetIndex:v13];
  long long v65 = 0uLL;
  uint64_t v66 = 0;
  [(GTShaderProfilerHelper *)self _getAddressAndLineTableForDebugInfo:v67];
  long long v20 = __p[0];
  id v19 = __p[1];
  __p[1] = 0;
  *(void *)id v63 = 0;
  __p[0] = 0;
  std::vector<std::vector<DebugInfo::LineEntry *>>::__vdeallocate((uint64_t *)&v65);
  long long v65 = *(_OWORD *)&v63[8];
  uint64_t v66 = v64;
  *(void *)&v63[16] = 0;
  uint64_t v64 = 0;
  *(void *)&v63[8] = 0;
  *(void *)&v60[0] = &v63[8];
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v60);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  int v21 = 0;
  if ((void)v65 != *((void *)&v65 + 1) && v20 != v19)
  {
    *(_OWORD *)__p = 0u;
    *(_OWORD *)id v63 = 0u;
    *(_DWORD *)&v63[16] = 1065353216;
    memset(v60, 0, sizeof(v60));
    int v61 = 1065353216;
    id v22 = v16;
    double v57 = v20;
    id v52 = v18;
    id v53 = v16;
    unsigned int v23 = (char *)[v22 bytes];
    unint64_t v24 = (unint64_t)[v22 length];
    uint64_t v26 = (v24 / 0x14);
    if ((v24 / 0x14))
    {
      unint64_t v27 = (v19 - v20) >> 2;
      unint64_t v28 = (unsigned int *)(v23 + 8);
      double v29 = 0.0;
      while (1)
      {
        unsigned int v30 = *(v28 - 1);
        unint64_t v31 = *v28;
        unint64_t v32 = *(v28 - 2);
        int v59 = *(v28 - 2);
        if ((v13 & 0x80000000) == 0 || v30 == 3)
        {
          if ((v13 & 0x80000000) != 0)
          {
            double v34 = 1.0;
LABEL_43:
            if (v27 <= v31) {
              unsigned int v49 = -1 - 1431655765 * ((*((void *)&v65 + 1) - (void)v65) >> 3);
            }
            else {
              unsigned int v49 = *(_DWORD *)&v20[4 * v31];
            }
            [(GTShaderProfilerHelper *)self _ProcessLineList:(void)v65 + 24 * v49 forFileCostMap:__p forDebugInfo:v67 andCost:v31 forAddr:v32 andDrawIndex:v13 andTargetIndex:v34];
            unsigned int v50 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)v60, v32, &v59);
            double v29 = v29 + v34;
            void v50[3] = v34 + v50[3];
            goto LABEL_47;
          }
          uint64_t v33 = v68[0];
          if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v68[1] - v68[0]) >> 3) > v31)
          {
            LODWORD(v25) = v28[2];
            double v34 = (double)v30 / (double)v25;
            if (v58 && (unint64_t)[v58 count] > v32)
            {
              int v35 = *(_DWORD *)(v33 + 40 * v31 + 36);
              double v36 = 1.0;
              switch(v35)
              {
                case 12:
                  id v37 = [v58 objectAtIndexedSubscript:v32];
                  [(GTShaderProfilerHelper *)self _latencyAdjustmentFactorWithLimiterDataForDraw:v37 forDataMaster:a9];
                  goto LABEL_15;
                case 13:
                  goto LABEL_36;
                case 14:
                  if (*(_DWORD *)(v33 + 40 * v31 + 32) == 2)
                  {
                    id v37 = [v58 objectAtIndexedSubscript:v32];
                    [&off_758AF8 objectAtIndexedSubscript:2];
                  }
                  else
                  {
                    id v37 = [v58 objectAtIndexedSubscript:v32];
                    [&off_758AF8 objectAtIndexedSubscript:6];
                  }
                  goto LABEL_26;
                case 15:
                  if (*(_DWORD *)(v33 + 40 * v31 + 32) == 2)
                  {
                    id v37 = [v58 objectAtIndexedSubscript:v32];
                    [&off_758AF8 objectAtIndexedSubscript:3];
                  }
                  else
                  {
                    id v37 = [v58 objectAtIndexedSubscript:v32];
                    [&off_758AF8 objectAtIndexedSubscript:7];
                  }
                  unsigned int v40 = LABEL_26:;
                  [(GTShaderProfilerHelper *)self _latencyAdjustmentFactorWithLimiterDataForDraw:v37 forDataMaster:a9 forLimiterType:v40];
                  goto LABEL_34;
                case 16:
                  id v37 = [v58 objectAtIndexedSubscript:v32];
                  unsigned int v40 = [&off_758AF8 objectAtIndexedSubscript:5];
                  [(GTShaderProfilerHelper *)self _latencyAdjustmentFactorWithLimiterDataForDraw:v37 forDataMaster:a9 forLimiterType:v40];
LABEL_34:
                  double v36 = v41;

                  goto LABEL_35;
                default:
                  if (v35 == 54)
                  {
                    if ((*(unsigned char *)(v33 + 40 * v31 + 33) & 2) != 0)
                    {
                      double v42 = [v58 objectAtIndexedSubscript:v32];
                      uint64_t v43 = [&off_758AF8 objectAtIndexedSubscript:4];
                      [(GTShaderProfilerHelper *)self _latencyAdjustmentFactorWithLimiterDataForDraw:v42 forDataMaster:a9 forLimiterType:v43];
                      double v36 = v44;
                    }
                  }
                  else if (v35 == 52)
                  {
                    int v39 = *(_DWORD *)(v33 + 40 * v31 + 32);
                    if (v39 == 256 || v39 == 128)
                    {
                      double v36 = 0.0;
                    }
                    else if (v39 == 64)
                    {
                      id v37 = [v58 objectAtIndexedSubscript:v32];
                      [(GTShaderProfilerHelper *)self _waitLatencyAdjustmentFactorWithLimiterDataForDraw:v37 forDataMaster:a9];
LABEL_15:
                      double v36 = v38;
LABEL_35:
                    }
                  }
LABEL_36:
                  unsigned int v45 = *(v28 - 1);
                  if (v45)
                  {
                    unsigned int v46 = v28[1];
                    if (!v46) {
                      unsigned int v46 = *(v28 - 1);
                    }
                    double v47 = (double)v46 / (double)v45;
                  }
                  else
                  {
                    double v47 = 1.0;
                  }
                  double v34 = v36 * ((1.0 - v36) * (v34 * v47) + v34 * v36);
                  break;
              }
            }
            uint64_t v48 = v33 + 40 * v31;
            *(double *)(v48 + 16) = v34 + *(double *)(v48 + 16);
            ++*(_DWORD *)(v48 + 24);
            long long v20 = v57;
            goto LABEL_43;
          }
          long long v20 = v57;
        }
LABEL_47:
        v28 += 5;
        if (!--v26) {
          goto LABEL_51;
        }
      }
    }
    double v29 = 0.0;
LABEL_51:
    int v21 = [(GTShaderProfilerHelper *)self _processPerLineCostDataForLineTable:&v65 withFileCost:__p withDebugInfo:v67 andAllDrawCost:v56 withKey:v55 withShaderSourcePath:v60 withDrawCost:v29];
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v60);
    std::__hash_table<std::__hash_value_type<std::string,PerFileCost>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerFileCost>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerFileCost>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerFileCost>>>::~__hash_table((uint64_t)__p);
    id v18 = v52;
    id v16 = v53;
  }
  __p[0] = &v65;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  if (v20) {
    operator delete(v20);
  }
  __p[0] = v68;
  std::vector<DebugInfo::LineDisassemblyInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  __p[0] = v67;
  std::vector<DebugInfo::LineEntry>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);

  return v21;
}

- (id)_processPerLineCostDataForLineTable:(void *)a3 withFileCost:(void *)a4 withDebugInfo:(void *)a5 andAllDrawCost:(double)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 withDrawCost:(void *)a9
{
  id v244 = a7;
  id v248 = a8;
  v250 = objc_opt_new();
  v287 = 0;
  uint64_t v288 = 0;
  v286 = &v287;
  unsigned int v285 = 0;
  uint64_t v13 = *(void *)a3;
  uint64_t v12 = *((void *)a3 + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v12 - *(void *)a3) >> 3) >= 2)
  {
    unsigned int v14 = 0;
    LODWORD(v15) = 1;
    v257 = (uint64_t *)a3;
    while (1)
    {
      id v16 = (uint64_t **)(v13 + 24 * v14);
      unsigned int v14 = v15;
      id v17 = *v16;
      v266 = v16[1];
      if (*v16 != v266) {
        break;
      }
LABEL_88:
      unint64_t v15 = v14 + 1;
      if (0xAAAAAAAAAAAAAAABLL * ((v12 - v13) >> 3) <= v15) {
        goto LABEL_89;
      }
    }
    unsigned int v260 = v15;
    while (1)
    {
      id v18 = *(unsigned int **)(*v17 + 56);
      id v19 = v287;
      unsigned int v20 = *v18;
      if (!v287) {
        goto LABEL_14;
      }
      int v21 = &v287;
      id v22 = v287;
      do
      {
        unsigned int v23 = v22;
        unint64_t v24 = v21;
        unsigned int v25 = *((_DWORD *)v22 + 8);
        uint64_t v26 = (uint64_t **)(v22 + 1);
        if (v25 >= v20)
        {
          uint64_t v26 = (uint64_t **)v23;
          int v21 = (uint64_t **)v23;
        }
        id v22 = *v26;
      }
      while (v22);
      if (v21 == &v287) {
        goto LABEL_14;
      }
      if (v25 < v20) {
        unsigned int v23 = (uint64_t *)v24;
      }
      if (v20 >= *((_DWORD *)v23 + 8))
      {
        unsigned int v38 = v285;
        if (v285 <= v20) {
          unsigned int v38 = *v18;
        }
        unsigned int v285 = v38;
      }
      else
      {
LABEL_14:
        if (v285 > v20) {
          unsigned int v20 = v285;
        }
        unsigned int v285 = v20;
        long long v282 = 0uLL;
        *(void *)&long long v283 = 0;
        unsigned int v27 = *v18;
        LODWORD(v289[0].__r_.__value_.__l.__data_) = *v18;
        memset(&v289[0].__r_.__value_.__r.__words[1], 0, sizeof(std::string));
        *(void *)&long long v283 = 0;
        long long v282 = 0uLL;
        unint64_t v28 = &v287;
        double v29 = &v287;
        if (v287)
        {
          while (1)
          {
            while (1)
            {
              double v29 = (uint64_t **)v19;
              unsigned int v30 = *((_DWORD *)v19 + 8);
              if (v27 >= v30) {
                break;
              }
              id v19 = *v29;
              unint64_t v28 = v29;
              if (!*v29) {
                goto LABEL_23;
              }
            }
            if (v30 >= v27) {
              break;
            }
            id v19 = v29[1];
            if (!v19)
            {
              unint64_t v28 = v29 + 1;
              goto LABEL_23;
            }
          }
        }
        else
        {
LABEL_23:
          unint64_t v31 = operator new(0x40uLL);
          v31[8] = v27;
          *((void *)v31 + 6) = 0;
          *((void *)v31 + 7) = 0;
          *((void *)v31 + 5) = 0;
          memset(&v289[0].__r_.__value_.__r.__words[1], 0, sizeof(std::string));
          *(void *)unint64_t v31 = 0;
          *((void *)v31 + 1) = 0;
          *((void *)v31 + 2) = v29;
          *unint64_t v28 = (uint64_t *)v31;
          if (*v286)
          {
            v286 = (uint64_t **)*v286;
            unint64_t v31 = *v28;
          }
          std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v287, (uint64_t *)v31);
          ++v288;
        }
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)&v289[0].__r_.__value_.__l.__size_);
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)&v282);
        unint64_t v32 = v287;
        int v21 = &v287;
        if (v287)
        {
          unsigned int v33 = **(_DWORD **)(*v17 + 56);
          double v34 = &v287;
          do
          {
            int v35 = v32;
            double v36 = v34;
            unsigned int v37 = *((_DWORD *)v32 + 8);
            if (v37 >= v33) {
              double v34 = (uint64_t **)v32;
            }
            else {
              ++v32;
            }
            unint64_t v32 = (uint64_t *)*v32;
          }
          while (v32);
          int v21 = &v287;
          if (v34 != &v287)
          {
            if (v37 < v33) {
              int v35 = (uint64_t *)v36;
            }
            int v21 = v34;
            if (v33 < *((_DWORD *)v35 + 8)) {
              int v21 = &v287;
            }
          }
        }
      }
      memset(v289, 0, 48);
      int v39 = (std::string *)v21[6];
      unsigned int v40 = v21[7];
      if (v39 >= (std::string *)v40)
      {
        double v42 = v21[5];
        unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * (((char *)v39 - (char *)v42) >> 4);
        unint64_t v44 = v43 + 1;
        if (v43 + 1 > 0x555555555555555) {
          abort();
        }
        unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * (((char *)v40 - (char *)v42) >> 4);
        if (2 * v45 > v44) {
          unint64_t v44 = 2 * v45;
        }
        if (v45 >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v46 = 0x555555555555555;
        }
        else {
          unint64_t v46 = v44;
        }
        double v47 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<DynamicBuffer>>(v46);
        unsigned int v49 = (std::string *)&v47[48 * v43];
        v49->__r_.__value_.__r.__words[0] = 0;
        v49->__r_.__value_.__l.__size_ = 0;
        v49->__r_.__value_.__r.__words[2] = 0;
        std::string *v49 = v289[0];
        memset(v289, 0, 24);
        v49[1].__r_.__value_.__r.__words[0] = 0;
        v49[1].__r_.__value_.__l.__size_ = 0;
        v49[1].__r_.__value_.__r.__words[2] = 0;
        v49[1] = v289[1];
        memset(&v289[1], 0, sizeof(std::string));
        unsigned int v50 = v21[5];
        long long v51 = v21[6];
        if (v51 == v50)
        {
          double v41 = (uint64_t *)&v49[2];
          v21[5] = (uint64_t *)v49;
          v21[6] = (uint64_t *)&v49[2];
          v21[7] = (uint64_t *)&v47[48 * v48];
          if (!v51) {
            goto LABEL_55;
          }
        }
        else
        {
          unint64_t v52 = 0;
          do
          {
            id v53 = (std::string::__raw *)&v49[v52 / 0x18];
            long long v54 = &v51[v52 / 8];
            v53[-2].__words[0] = 0;
            v53[-2].__words[1] = 0;
            v53[-2].__words[2] = 0;
            *(_OWORD *)v53[-2].__words = *(_OWORD *)&v51[v52 / 8 - 6];
            v53[-2].__words[2] = v51[v52 / 8 - 4];
            *(v54 - 6) = 0;
            *(v54 - 5) = 0;
            *(v54 - 4) = 0;
            v53[-1].__words[0] = 0;
            v53[-1].__words[1] = 0;
            v53[-1].__words[2] = 0;
            *(_OWORD *)v53[-1].__words = *(_OWORD *)&v51[v52 / 8 - 3];
            v53[-1].__words[2] = v51[v52 / 8 - 1];
            *(v54 - 3) = 0;
            *(v54 - 2) = 0;
            *(v54 - 1) = 0;
            v52 -= 48;
          }
          while (&v51[v52 / 8] != v50);
          long long v51 = v21[5];
          id v55 = v21[6];
          double v41 = (uint64_t *)&v49[2];
          v21[5] = (uint64_t *)&v49[v52 / 0x18];
          v21[6] = (uint64_t *)&v49[2];
          v21[7] = (uint64_t *)&v47[48 * v48];
          if (v55 != v51)
          {
            do
            {
              id v56 = v55 - 6;
              *(void *)&long long v282 = v55 - 3;
              std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&v282);
              std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::~vector[abi:nn180100](v56);
              id v55 = v56;
            }
            while (v56 != v51);
          }
          if (!v51) {
            goto LABEL_55;
          }
        }
        operator delete(v51);
      }
      else
      {
        v39->__r_.__value_.__r.__words[2] = 0;
        v39[1].__r_.__value_.__r.__words[0] = 0;
        v39->__r_.__value_.__r.__words[0] = 0;
        v39->__r_.__value_.__l.__size_ = 0;
        *int v39 = v289[0];
        memset(v289, 0, 24);
        v39[1].__r_.__value_.__l.__size_ = 0;
        v39[1].__r_.__value_.__r.__words[2] = 0;
        v39[1] = v289[1];
        memset(&v289[1], 0, sizeof(std::string));
        double v41 = (uint64_t *)&v39[2];
      }
LABEL_55:
      v21[6] = v41;
      *(void *)&long long v282 = &v289[1];
      std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&v282);
      std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::~vector[abi:nn180100]((uint64_t *)v289);
      uint64_t v57 = *v17;
      uint64_t v58 = (uint64_t)(v21[6] - 3);
      v270 = v17;
      if (v58 != *v17 + 56)
      {
        std::vector<DebugInfo::BlockInfo>::__assign_with_size[abi:nn180100]<DebugInfo::BlockInfo*,DebugInfo::BlockInfo*>(v58, *(void *)(v57 + 56), *(void *)(v57 + 64), 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(*(void *)(v57 + 64) - *(void *)(v57 + 56)) >> 3));
        uint64_t v57 = *v17;
      }
      uint64_t v59 = *(void *)(v57 + 32);
      __streauint64_t m = *(FILE **)(v57 + 40);
      if ((FILE *)v59 != __stream)
      {
        int v60 = *(_DWORD *)(v57 + 24);
        while (1)
        {
          int v61 = *(void **)v59;
          if (*(void *)v59) {
            break;
          }
LABEL_79:
          ++v60;
          v59 += 40;
          if ((FILE *)v59 == __stream) {
            goto LABEL_84;
          }
        }
        int v62 = v21[6];
        unint64_t v64 = *(v62 - 5);
        unint64_t v63 = *(v62 - 4);
        if (v64 < v63)
        {
          long long v65 = *(void **)(v59 + 8);
          uint64_t v66 = *(void *)(v59 + 16);
          int v67 = *(_DWORD *)(v59 + 24);
          uint64_t v68 = *(unsigned int *)(v59 + 36);
          uint64_t v69 = *(void *)(v59 + 28);
          *(void *)&long long v70 = v69;
          *((void *)&v70 + 1) = HIDWORD(v69);
          id v71 = v61;
          id v72 = v65;
          *(void *)unint64_t v64 = v71;
          *(void *)(v64 + 8) = v72;
          *(_DWORD *)(v64 + 16) = v60;
          *(_DWORD *)(v64 + 20) = v67;
          *(void *)(v64 + 24) = v66;
          *(_OWORD *)(v64 + 32) = v70;
          double v73 = (char *)(v64 + 56);
          *(void *)(v64 + 48) = v68;
LABEL_78:
          *(v62 - 5) = (uint64_t)v73;
          goto LABEL_79;
        }
        uint64_t v74 = *(v62 - 6);
        uint64_t v75 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v64 - v74) >> 3);
        unint64_t v76 = v75 + 1;
        if ((unint64_t)(v75 + 1) > 0x492492492492492) {
          abort();
        }
        unint64_t v77 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v63 - v74) >> 3);
        if (2 * v77 > v76) {
          unint64_t v76 = 2 * v77;
        }
        if (v77 >= 0x249249249249249) {
          unint64_t v78 = 0x492492492492492;
        }
        else {
          unint64_t v78 = v76;
        }
        if (v78)
        {
          double v79 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>>(v78);
          uint64_t v274 = v80;
          int v61 = *(void **)v59;
        }
        else
        {
          double v79 = 0;
          uint64_t v274 = 0;
        }
        int v81 = &v79[56 * v75];
        uint64_t v82 = *(void **)(v59 + 8);
        uint64_t v83 = *(void *)(v59 + 16);
        int v84 = *(_DWORD *)(v59 + 24);
        uint64_t v85 = *(unsigned int *)(v59 + 36);
        uint64_t v86 = *(void *)(v59 + 28);
        *(void *)&long long v87 = v86;
        *((void *)&v87 + 1) = HIDWORD(v86);
        id v88 = v61;
        id v89 = v82;
        *(void *)int v81 = v88;
        *((void *)v81 + 1) = v89;
        *((_DWORD *)v81 + 4) = v60;
        *((_DWORD *)v81 + 5) = v84;
        *((void *)v81 + 3) = v83;
        *((_OWORD *)v81 + 2) = v87;
        *((void *)v81 + 6) = v85;
        unsigned int v90 = (id *)*(v62 - 6);
        int v91 = (id *)*(v62 - 5);
        if (v91 == v90)
        {
          double v73 = v81 + 56;
          *(v62 - 6) = (uint64_t)v81;
          *(v62 - 5) = (uint64_t)(v81 + 56);
          *(v62 - 4) = (uint64_t)&v79[56 * v274];
        }
        else
        {
          double v92 = v81;
          do
          {
            long long v93 = *(_OWORD *)(v91 - 7);
            v91 -= 7;
            id *v91 = 0;
            v91[1] = 0;
            *(_OWORD *)(v92 - 56) = v93;
            v92 -= 56;
            long long v94 = *((_OWORD *)v91 + 1);
            long long v95 = *((_OWORD *)v91 + 2);
            *((void *)v92 + 6) = v91[6];
            *((_OWORD *)v92 + 1) = v94;
            *((_OWORD *)v92 + 2) = v95;
          }
          while (v91 != v90);
          int v91 = (id *)*(v62 - 6);
          unsigned int v96 = (id *)*(v62 - 5);
          double v73 = v81 + 56;
          *(v62 - 6) = (uint64_t)v92;
          *(v62 - 5) = (uint64_t)(v81 + 56);
          *(v62 - 4) = (uint64_t)&v79[56 * v274];
          if (v96 != v91)
          {
            do
            {

              unsigned int v97 = *(v96 - 7);
              v96 -= 7;
            }
            while (v96 != v91);
            if (!v91) {
              goto LABEL_78;
            }
LABEL_77:
            operator delete(v91);
            goto LABEL_78;
          }
        }
        if (!v91) {
          goto LABEL_78;
        }
        goto LABEL_77;
      }
LABEL_84:
      id v17 = v270 + 1;
      if (v270 + 1 == v266)
      {
        uint64_t v13 = *v257;
        uint64_t v12 = v257[1];
        unsigned int v14 = v260;
        goto LABEL_88;
      }
    }
  }
LABEL_89:
  long long v282 = 0u;
  long long v283 = 0u;
  int v284 = 1065353216;
  v281[0] = &v282;
  v281[1] = &v285;
  memset(&__p, 0, sizeof(__p));
  if (v248
    && (+[NSFileManager defaultManager],
        double v98 = objc_claimAutoreleasedReturnValue(),
        unsigned int v99 = [v98 fileExistsAtPath:v248],
        v98,
        v99))
  {
    std::string::basic_string[abi:nn180100]<0>(v289, (char *)[v248 UTF8String]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v289[0];
    -[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::$_2::operator()(v281, (uint64_t)&__p);
    int v264 = 1;
  }
  else
  {
    int v264 = 0;
  }
  uint64_t v100 = v286;
  if (v286 == &v287) {
    goto LABEL_173;
  }
  p_p = &__p;
  if (!v264) {
    p_p = v289;
  }
  uint64_t v262 = (uint64_t)p_p;
  do
  {
    uint64_t v102 = v100[5][3];
    if (*(char *)(v102 + 103) < 0) {
      std::string::__init_copy_ctor_external(v289, *(const std::string::value_type **)(v102 + 80), *(void *)(v102 + 88));
    }
    else {
      v289[0] = *(std::string *)(v102 + 80);
    }
    if ((v264 & 1) == 0) {
      -[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::$_2::operator()(v281, (uint64_t)v289);
    }
    double v104 = v100[5];
    double v103 = v100[6];
    if (v104 == v103)
    {
      double v110 = 0.0;
      goto LABEL_138;
    }
    if ((v289[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      double v105 = v289;
    }
    else {
      double v105 = (std::string *)v289[0].__r_.__value_.__r.__words[0];
    }
    if ((v289[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v289[0].__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v289[0].__r_.__value_.__l.__size_;
    }
    int8x8_t v107 = *(int8x8_t *)((char *)a4 + 8);
    uint64_t v272 = *(void *)a4;
    uint8x8_t v108 = (uint8x8_t)vcnt_s8(v107);
    v108.i16[0] = vaddlv_u8(v108);
    unint64_t v109 = v108.u32[0];
    uint64_t __streama = *(void *)&v107 - 1;
    int v267 = *((_DWORD *)a5 + 12);
    double v110 = 0.0;
    long long v111 = v100[5];
    v275 = v100[6];
    do
    {
      uint64_t v112 = *v111;
      uint64_t v113 = v111[1];
      if (*v111 != v113)
      {
        do
        {
          double v110 = v110 + *(double *)(v112 + 24);
          v112 += 56;
        }
        while (v112 != v113);
        goto LABEL_133;
      }
      unint64_t v114 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v105, size);
      if (!*(void *)&v107) {
        goto LABEL_133;
      }
      unint64_t v115 = v114;
      if (v109 > 1)
      {
        unint64_t v116 = v114;
        if (v114 >= *(void *)&v107) {
          unint64_t v116 = v114 % *(void *)&v107;
        }
      }
      else
      {
        unint64_t v116 = __streama & v114;
      }
      double v117 = *(unsigned __int8 ***)(v272 + 8 * v116);
      if (!v117) {
        goto LABEL_132;
      }
      std::string::size_type v118 = size;
      long long v119 = v105;
      double v120 = *v117;
      if (!*v117)
      {
LABEL_131:
        double v105 = v119;
        std::string::size_type size = v118;
LABEL_132:
        double v103 = v275;
        goto LABEL_133;
      }
      while (1)
      {
        unint64_t v121 = *((void *)v120 + 1);
        if (v121 == v115) {
          break;
        }
        if (v109 > 1)
        {
          if (v121 >= *(void *)&v107) {
            v121 %= *(void *)&v107;
          }
        }
        else
        {
          v121 &= __streama;
        }
        if (v121 != v116) {
          goto LABEL_131;
        }
LABEL_130:
        double v120 = *(unsigned __int8 **)v120;
        if (!v120) {
          goto LABEL_131;
        }
      }
      if (!std::equal_to<std::string>::operator()[abi:nn180100](v120 + 16, (unsigned __int8 *)v289)) {
        goto LABEL_130;
      }
      uint64_t v122 = *((void *)v120 + 5);
      uint64_t v123 = *((void *)v120 + 6) - v122;
      unint64_t v124 = *((_DWORD *)v100 + 8) - v267;
      double v105 = v119;
      std::string::size_type size = v118;
      double v103 = v275;
      if (v124 < v123 >> 3) {
        double v110 = *(double *)(v122 + 8 * v124);
      }
LABEL_133:
      v111 += 6;
    }
    while (v111 != v103);
LABEL_138:
    double v125 = std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](&v282, v262);
    if (v125)
    {
      unint64_t v126 = (*((_DWORD *)v100 + 8) - 1);
      uint64_t v127 = *((void *)v125 + 5);
      if (0x6DB6DB6DB6DB6DB7 * ((*((void *)v125 + 6) - v127) >> 3) > v126)
      {
        long long v128 = (double *)(v127 + 56 * v126);
        *long long v128 = v110;
        id v129 = (uint64_t *)(v128 + 4);
        if (v129 != (uint64_t *)(v100 + 5))
        {
          uint64_t v130 = v127 + 56 * v126;
          uint64_t v133 = *(void *)(v130 + 48);
          double v132 = (void *)(v130 + 48);
          uint64_t v131 = v133;
          unint64_t v134 = 0xAAAAAAAAAAAAAAABLL * (((char *)v103 - (char *)v104) >> 4);
          double v135 = (uint64_t *)*v129;
          if (0xAAAAAAAAAAAAAAABLL * ((v133 - *v129) >> 4) >= v134)
          {
            if (0xAAAAAAAAAAAAAAABLL
               * ((uint64_t)(*(void *)(v127 + 56 * v126 + 40) - (void)v135) >> 4) < v134)
            {
              uint64_t v141 = &v104[2 * ((uint64_t)(*(void *)(v127 + 56 * v126 + 40) - (void)v135) >> 4)];
              std::__copy[abi:nn180100]<std::_ClassicAlgPolicy,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *>(v104, v141, v135);
              double v104 = v141;
              goto LABEL_154;
            }
            uint64_t v151 = std::__copy[abi:nn180100]<std::_ClassicAlgPolicy,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo *>(v104, v103, v135);
            std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::__base_destruct_at_end[abi:nn180100](v129, v151);
          }
          else
          {
            if (v135)
            {
              std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::__base_destruct_at_end[abi:nn180100](v129, (uint64_t *)*v129);
              operator delete((void *)*v129);
              uint64_t v131 = 0;
              *id v129 = 0;
              v129[1] = 0;
              v129[2] = 0;
            }
            if (v134 > 0x555555555555555) {
              goto LABEL_253;
            }
            unint64_t v136 = 0xAAAAAAAAAAAAAAABLL * (v131 >> 4);
            uint64_t v137 = 2 * v136;
            if (2 * v136 <= v134) {
              uint64_t v137 = 0xAAAAAAAAAAAAAAABLL * (((char *)v103 - (char *)v104) >> 4);
            }
            unint64_t v138 = v136 >= 0x2AAAAAAAAAAAAAALL ? 0x555555555555555 : v137;
            if (v138 > 0x555555555555555) {
LABEL_253:
            }
              abort();
            double v139 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<DynamicBuffer>>(v138);
            *(int64x2_t *)id v129 = vdupq_n_s64((unint64_t)v139);
            *double v132 = &v139[48 * v140];
LABEL_154:
            uint64_t v142 = v127 + 56 * v126;
            id v145 = *(void **)(v142 + 40);
            double v143 = (void *)(v142 + 40);
            uint64_t v144 = v145;
            if (v104 == v103)
            {
              unsigned int v146 = v144;
            }
            else
            {
              unsigned int v146 = v144;
              do
              {
                void *v146 = 0;
                v146[1] = 0;
                v146[2] = 0;
                uint64_t v147 = *v104;
                uint64_t v148 = v104[1];
                if (v148 != *v104)
                {
                  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::__vallocate[abi:nn180100](v146, 0x6DB6DB6DB6DB6DB7 * ((v148 - *v104) >> 3));
                  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::__construct_at_end<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo*,-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo*>(v146, v147, v148);
                }
                v146[3] = 0;
                v146[4] = 0;
                v146[5] = 0;
                uint64_t v149 = v104[3];
                uint64_t v150 = v104[4];
                if (v150 != v149)
                {
                  std::vector<DebugInfo::BlockInfo>::__vallocate[abi:nn180100](v146 + 3, 0x4EC4EC4EC4EC4EC5 * ((v150 - v149) >> 3));
                  std::vector<DebugInfo::BlockInfo>::__construct_at_end<DebugInfo::BlockInfo*,DebugInfo::BlockInfo*>((uint64_t)(v146 + 3), v149, v150);
                }
                v146 += 6;
                v104 += 6;
              }
              while (v104 != v103);
            }
            *double v143 = v146;
          }
        }
      }
    }
    if (SHIBYTE(v289[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v289[0].__r_.__value_.__l.__data_);
    }
    double v152 = v100[1];
    if (v152)
    {
      do
      {
        float64x2_t v153 = (uint64_t **)v152;
        double v152 = (uint64_t *)*v152;
      }
      while (v152);
    }
    else
    {
      do
      {
        float64x2_t v153 = (uint64_t **)v100[2];
        BOOL v154 = *v153 == (uint64_t *)v100;
        uint64_t v100 = v153;
      }
      while (!v154);
    }
    uint64_t v100 = v153;
  }
  while (v153 != &v287);
LABEL_173:
  v258 = objc_opt_new();
  BOOL v155 = +[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  v256 = [v155 invertedSet];

  for (unint64_t i = (uint64_t *)v283; i; unint64_t i = (uint64_t *)*i)
  {
    BOOL v157 = i + 2;
    if (*((char *)i + 39) < 0) {
      BOOL v157 = (void *)*v157;
    }
    uint64_t v158 = +[NSString stringWithUTF8String:v157];
    v159 = [v158 lastPathComponent];
    double v160 = [v159 stringByDeletingPathExtension];

    double v161 = [v160 componentsSeparatedByCharactersInSet:v256];
    double v162 = [v161 componentsJoinedByString:&stru_7482F0];

    [v258 addObject:v162];
  }
  v247 = objc_opt_new();
  id v246 = [v258 componentsJoinedByString:@"_"];
  double v163 = (const char *)[v246 UTF8String];
  id v245 = v244;
  snprintf((char *)v289, 0x400uLL, "/tmp/com.apple.gputools.profiling/shaderProfilerResults/shader_cost_%s_%s.txt", v163, (const char *)[v245 UTF8String]);
  __streamb = fopen((const char *)v289, "w");
  v249 = objc_opt_new();
  [v247 setObject:forKeyedSubscript:];
  double v164 = (uint64_t *)v283;
  double v165 = 100.0 / (a6 + 2.22507386e-308);
  if ((void)v283)
  {
    do
    {
      double v166 = (const char **)(v164 + 2);
      v252 = (uint64_t **)v164;
      int v167 = *((char *)v164 + 39);
      v168 = (const char *)(v164 + 2);
      if (v167 < 0) {
        v168 = *v166;
      }
      fprintf(__streamb, "%s\n", v168);
      v253 = objc_opt_new();
      if (*((char *)v252 + 39) < 0) {
        double v166 = (const char **)*v166;
      }
      v251 = +[NSString stringWithUTF8String:v166];
      [v249 setObject:v253 forKeyedSubscript:];
      v263 = objc_opt_new();
      [v253 setObject:forKeyedSubscript:];
      v269 = v252[5];
      v261 = v252[6];
      if (v269 != v261)
      {
        uint64_t v265 = 1;
        do
        {
          v268 = objc_opt_new();
          [v263 addObject:];
          uint64_t v169 = (uint64_t)(v269 + 1);
          if (*((char *)v269 + 31) < 0) {
            uint64_t v169 = v269[1];
          }
          id v170 = +[NSString stringWithUTF8String:v169];
          [v268 setObject:v170 forKeyedSubscript:@"source"];

          id v171 = +[NSNumber numberWithUnsignedInt:v265];
          [v268 setObject:v171 forKeyedSubscript:@"line"];

          uint64_t v172 = +[NSNumber numberWithDouble:*(double *)v269];
          [v268 setObject:v172 forKeyedSubscript:@"cost"];

          id v173 = +[NSNumber numberWithDouble:v165 * *(double *)v269];
          [v268 setObject:v173 forKeyedSubscript:@"percent"];

          if (*(double *)v269 <= 2.22507386e-308) {
            fprintf(__streamb, "%u: %s\n");
          }
          else {
            fprintf(__streamb, "%u: %s      %.1f %.2f%%\n");
          }
          v273 = objc_opt_new();
          [v268 setObject:forKeyedSubscript:];
          id v175 = (uint64_t *)v269[4];
          uint64_t v174 = (uint64_t *)v269[5];
          v271 = v174;
          while (v175 != v174)
          {
            v276 = objc_opt_new();
            unsigned int v176 = objc_opt_new();
            uint64_t v177 = (uint64_t *)v175[3];
            unsigned int v178 = (uint64_t *)v175[4];
            if (v177 != v178)
            {
              int v179 = v177 + 7;
              do
              {
                uint64_t v180 = objc_opt_new();
                long long v181 = v179 - 7;
                long long v182 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v179 - 14)];
                [v180 setObject:v182 forKeyedSubscript:@"lineIndex"];

                BOOL v183 = (const char *)(v179 - 3);
                long long v184 = (const char *)(v179 - 3);
                if (*((char *)v179 - 1) < 0) {
                  long long v184 = *(const char **)v183;
                }
                unsigned int v185 = +[NSString stringWithUTF8String:v184];
                [v180 setObject:v185 forKeyedSubscript:@"function"];

                v186 = v179;
                if (*((char *)v179 + 23) < 0) {
                  v186 = (uint64_t *)*v179;
                }
                v187 = +[NSString stringWithUTF8String:v186];
                [v180 setObject:v187 forKeyedSubscript:@"filename"];

                v188 = v179 + 3;
                if (*((char *)v179 + 47) < 0) {
                  v188 = (void *)*v188;
                }
                long long v189 = +[NSString stringWithUTF8String:v188];
                [v180 setObject:v189 forKeyedSubscript:@"fullpath"];

                long long v190 = v179 - 6;
                if (*((char *)v179 - 25) < 0) {
                  long long v190 = (uint64_t *)*v190;
                }
                int v191 = +[NSString stringWithUTF8String:v190];
                [v180 setObject:v191 forKeyedSubscript:@"directory"];

                if (*((char *)v179 - 1) < 0) {
                  BOOL v183 = *(const char **)v183;
                }
                v192 = (const char *)v179;
                if (*((char *)v179 + 23) < 0) {
                  v192 = (const char *)*v179;
                }
                fprintf(__streamb, "      -----> %u:  %s : %s\n", *(_DWORD *)v181, v183, v192);
                [v176 addObject:v180];

                v179 += 13;
              }
              while (v181 + 13 != v178);
            }
            if ([v176 count]) {
              [v276 setObject:v176 forKeyedSubscript:@"callstackInfos"];
            }
            [v273 addObject:v276];
            if (*v175 != v175[1])
            {
              v193 = objc_opt_new();
              [v276 setObject:v193 forKeyedSubscript:@"diassembly"];
              uint64_t v194 = *v175;
              uint64_t v195 = v175[1];
              if (*v175 != v195)
              {
                do
                {
                  v196 = objc_opt_new();
                  [v193 addObject:v196];
                  uint64_t v197 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v194 + 16)];
                  [v196 setObject:v197 forKeyedSubscript:@"offset"];

                  [v196 setObject:*(void *)v194 forKeyedSubscript:@"disasm"];
                  long long v198 = +[NSNumber numberWithDouble:*(double *)(v194 + 24)];
                  [v196 setObject:v198 forKeyedSubscript:@"cost"];

                  long long v199 = +[NSNumber numberWithDouble:v165 * *(double *)(v194 + 24)];
                  [v196 setObject:v199 forKeyedSubscript:@"percent"];

                  v194 += 56;
                }
                while (v194 != v195);
                uint64_t v200 = *v175;
                uint64_t v201 = v175[1];
                while (v200 != v201)
                {
                  v202 = *(void **)(v200 + 8);
                  if (*(double *)(v200 + 24) <= 2.22507386e-308)
                  {
                    [v202 UTF8String];
                    fprintf(__streamb, "    %d %s\n");
                  }
                  else
                  {
                    [v202 UTF8String];
                    fprintf(__streamb, "    %d %s %.1f %.2f%%\n");
                  }
                  v200 += 56;
                }
              }
            }
            v175 += 6;
            uint64_t v174 = v271;
          }

          uint64_t v265 = (v265 + 1);
          v269 += 7;
        }
        while (v269 != v261);
      }

      double v164 = *v252;
    }
    while (*v252);
  }
  if (*((void *)a5 + 3) != *((void *)a5 + 4))
  {
    fwrite("\n----------- Full Binary Disassembly -----------\n", 0x31uLL, 1uLL, __streamb);
    id v203 = objc_opt_new();
    uint64_t v204 = *((void *)a5 + 3);
    uint64_t v205 = *((void *)a5 + 4);
    if (v204 != v205)
    {
      uint64_t v206 = 0;
      do
      {
        if (*(void *)v204)
        {
          v207 = objc_opt_new();
          v208 = +[NSNumber numberWithUnsignedInt:v206];
          [v207 setObject:v208 forKeyedSubscript:@"offset"];

          [v207 setObject:*(void *)v204 forKeyedSubscript:@"disasmSource"];
          [v207 setObject:*(void *)(v204 + 8) forKeyedSubscript:@"irSource"];
          v209 = +[NSNumber numberWithDouble:*(double *)(v204 + 16)];
          [v207 setObject:v209 forKeyedSubscript:@"cost"];

          long long v210 = +[NSNumber numberWithDouble:v165 * *(double *)(v204 + 16)];
          [v207 setObject:v210 forKeyedSubscript:@"costPercentage"];

          long long v211 = +[NSNumber numberWithInt:*(unsigned int *)(v204 + 28)];
          [v207 setObject:v211 forKeyedSubscript:@"opcodeType"];

          long long v212 = +[NSNumber numberWithInt:*(unsigned int *)(v204 + 32)];
          [v207 setObject:v212 forKeyedSubscript:@"opcodeSubType"];

          long long v213 = +[NSNumber numberWithInt:*(unsigned int *)(v204 + 36)];
          [v207 setObject:v213 forKeyedSubscript:@"opcode"];

          [v203 addObject:v207];
          long long v214 = *(void **)v204;
          if (*(double *)(v204 + 16) <= 2.22507386e-308)
          {
            [v214 UTF8String];
            fprintf(__streamb, "    %d %s\n");
          }
          else
          {
            [v214 UTF8String];
            fprintf(__streamb, "    %d %s %.1f %.2f%%\n");
          }
        }
        uint64_t v206 = (v206 + 1);
        v204 += 40;
      }
      while (v204 != v205);
    }
    [v247 setObject:v203 forKeyedSubscript:@"binaryDisassemblyInfo"];
  }
  fclose(__streamb);
  long long v215 = +[NSJSONSerialization dataWithJSONObject:v247 options:1 error:0];
  if (v215)
  {
    snprintf((char *)v289, 0x400uLL, "/tmp/com.apple.gputools.profiling/shaderProfilerResults/json/shader_cost_%s_%s.json", (const char *)[v246 UTF8String], (const char *)[v245 UTF8String]);
    id v216 = [objc_alloc((Class)NSString) initWithData:v215 encoding:4];
    long long v217 = +[NSString stringWithUTF8String:v289];
    [v216 writeToFile:v217 atomically:0 encoding:4 error:0];
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::~unordered_map[abi:nn180100]((uint64_t)&v282);
  long long v218 = +[NSMutableDictionary dictionaryWithCapacity:*((void *)a4 + 3) == 0];
  [v250 setPerFileCost:v218];
  id v219 = objc_alloc_init((Class)NSMutableDictionary);
  [v250 setPerFileLineCostDictForCI:v219];
  for (unint64_t j = (uint64_t *)*((void *)a4 + 2); j; unint64_t j = (uint64_t *)*j)
  {
    long long v221 = [(GTShaderProfilerHelper *)self _createPerFileCostDictionaryWith:j + 5 lineOffset:*((unsigned int *)a5 + 12)];
    long long v222 = j + 2;
    long long v223 = j + 2;
    if (*((char *)j + 39) < 0) {
      long long v223 = (void *)*v222;
    }
    long long v224 = +[NSString stringWithUTF8String:v223];
    [v218 setObject:v221 forKeyedSubscript:v224];

    long long v225 = [(GTShaderProfilerHelper *)self _createPerFileLineCostDictionaryForCIWith:j + 5 lineOffset:*((unsigned int *)a5 + 12)];
    if (*((char *)j + 39) < 0) {
      long long v222 = (void *)*v222;
    }
    float64x2_t v226 = +[NSString stringWithUTF8String:v222];
    [v219 setObject:v225 forKeyedSubscript:v226];
  }
  [v250 setTotalCost:a6];
  v227 = +[NSMutableDictionary dictionaryWithCapacity:*((void *)a9 + 3)];
  [v250 setDrawCallCost:v227];
  for (unint64_t k = (double *)*((void *)a9 + 2); k; unint64_t k = *(double **)k)
  {
    v229 = +[NSNumber numberWithDouble:k[3]];
    v230 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)k + 4)];
    [v227 setObject:v229 forKeyedSubscript:v230];
  }
  v231 = [v250 perFileCost];
  BOOL v232 = [v231 count] == (char *)&def_1C1270 + 1;

  if (v232)
  {
    v233 = [v250 perFileCost];
    v234 = [v233 allValues];

    v235 = [v234 objectAtIndexedSubscript:0];
    v236 = [v235 objectForKeyedSubscript:@"allDrawCall"];
    [v250 setTotalPerLineCost:v236];

    v237 = [v234 objectAtIndexedSubscript:0];
    v238 = [v237 objectForKeyedSubscript:@"perDrawCall"];
    [v250 setDrawCallPerLineCost:v238];

    goto LABEL_247;
  }
  v239 = [v250 perFileCost];
  v234 = [v239 objectForKeyedSubscript:@"/program_source"];

  if (v234)
  {
    v240 = [v234 objectForKeyedSubscript:@"allDrawCall"];
    [v250 setTotalPerLineCost:v240];

    v237 = [v234 objectForKeyedSubscript:@"perDrawCall"];
    [v250 setDrawCallPerLineCost:v237];
LABEL_247:
  }
  id v241 = v250;

  std::__tree<std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>>>>::destroy(v287);

  return v241;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  if (*a1)
  {
    std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::__base_destruct_at_end[abi:nn180100]((uint64_t)a1, *a1);
    operator delete((void *)*a1);
  }
  return a1;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

- (void)_processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t v5 = (uint64_t)*a1;
  if (std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100](*a1, a2))
  {
    return;
  }
  long long v82 = 0uLL;
  uint64_t v83 = 0;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v84, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    long long v7 = v82;
    unint64_t v6 = v83;
  }
  else
  {
    unint64_t v6 = 0;
    std::string v84 = *(std::string *)a2;
    long long v7 = 0uLL;
  }
  long long v76 = v7;
  long long v85 = v7;
  v86[0] = v6;
  uint64_t v83 = 0;
  long long v82 = 0uLL;
  if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v8 = &v84;
  }
  else {
    id v8 = (std::string *)v84.__r_.__value_.__r.__words[0];
  }
  if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v84.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v84.__r_.__value_.__l.__size_;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v8, size);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(v5 + 8);
  uint64_t v75 = a1;
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v2 = v10;
      if (v10 >= v12) {
        unint64_t v2 = v10 % v12;
      }
    }
    else
    {
      unint64_t v2 = (v12 - 1) & v10;
    }
    unint64_t v15 = *(std::locale::__imp ***)(*(void *)v5 + 8 * v2);
    if (v15)
    {
      for (unint64_t i = *v15; i; unint64_t i = *(std::locale::__imp **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)i + 16, (unsigned __int8 *)&v84)) {
            goto LABEL_83;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v2) {
            break;
          }
        }
      }
    }
  }
  id v18 = (char *)operator new(0x40uLL);
  id v19 = (void *)(v5 + 16);
  v77[0].__locale_ = (std::locale::__imp *)v18;
  v77[1].__locale_ = (std::locale::__imp *)(v5 + 16);
  *(void *)id v18 = 0;
  *((void *)v18 + 1) = v11;
  *(std::string *)(v18 + 16) = v84;
  memset(&v84, 0, sizeof(v84));
  *(_OWORD *)(v18 + 40) = v76;
  *((void *)v18 + 7) = v6;
  v86[0] = 0;
  long long v85 = 0uLL;
  LOBYTE(v77[2].__locale_) = 1;
  float v20 = (float)(unint64_t)(*(void *)(v5 + 24) + 1);
  float v21 = *(float *)(v5 + 32);
  if (v12 && (float)(v21 * (float)v12) >= v20) {
    goto LABEL_74;
  }
  BOOL v22 = (v12 & (v12 - 1)) == 0;
  if (v12 < 3) {
    BOOL v22 = 0;
  }
  unint64_t v23 = (2 * v12) | !v22;
  unint64_t v24 = vcvtps_u32_f32(v20 / v21);
  if (v23 <= v24) {
    int8x8_t prime = (int8x8_t)v24;
  }
  else {
    int8x8_t prime = (int8x8_t)v23;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v12 = *(void *)(v5 + 8);
  }
  if (*(void *)&prime > v12) {
    goto LABEL_40;
  }
  if (*(void *)&prime < v12)
  {
    unint64_t v32 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 24) / *(float *)(v5 + 32));
    if (v12 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
    {
      unint64_t v32 = std::__next_prime(v32);
    }
    else
    {
      uint64_t v34 = 1 << -(char)__clz(v32 - 1);
      if (v32 >= 2) {
        unint64_t v32 = v34;
      }
    }
    if (*(void *)&prime <= v32) {
      int8x8_t prime = (int8x8_t)v32;
    }
    if (*(void *)&prime >= v12)
    {
      unint64_t v12 = *(void *)(v5 + 8);
    }
    else
    {
      if (prime)
      {
LABEL_40:
        if (*(void *)&prime >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        uint64_t v26 = operator new(8 * *(void *)&prime);
        unsigned int v27 = *(void **)v5;
        *(void *)uint64_t v5 = v26;
        if (v27) {
          operator delete(v27);
        }
        uint64_t v28 = 0;
        *(int8x8_t *)(v5 + 8) = prime;
        do
          *(void *)(*(void *)v5 + 8 * v28++) = 0;
        while (*(void *)&prime != v28);
        double v29 = (void *)*v19;
        if (*v19)
        {
          unint64_t v30 = v29[1];
          uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
          v31.i16[0] = vaddlv_u8(v31);
          if (v31.u32[0] > 1uLL)
          {
            if (v30 >= *(void *)&prime) {
              v30 %= *(void *)&prime;
            }
          }
          else
          {
            v30 &= *(void *)&prime - 1;
          }
          *(void *)(*(void *)v5 + 8 * v30) = v19;
          int v35 = (void *)*v29;
          if (*v29)
          {
            do
            {
              unint64_t v36 = v35[1];
              if (v31.u32[0] > 1uLL)
              {
                if (v36 >= *(void *)&prime) {
                  v36 %= *(void *)&prime;
                }
              }
              else
              {
                v36 &= *(void *)&prime - 1;
              }
              if (v36 != v30)
              {
                if (!*(void *)(*(void *)v5 + 8 * v36))
                {
                  *(void *)(*(void *)v5 + 8 * v36) = v29;
                  goto LABEL_65;
                }
                void *v29 = *v35;
                *int v35 = **(void **)(*(void *)v5 + 8 * v36);
                **(void **)(*(void *)v5 + 8 * v36) = v35;
                int v35 = v29;
              }
              unint64_t v36 = v30;
LABEL_65:
              double v29 = v35;
              int v35 = (void *)*v35;
              unint64_t v30 = v36;
            }
            while (v35);
          }
        }
        unint64_t v12 = (unint64_t)prime;
        goto LABEL_69;
      }
      uint64_t v74 = *(void **)v5;
      *(void *)uint64_t v5 = 0;
      if (v74) {
        operator delete(v74);
      }
      unint64_t v12 = 0;
      *(void *)(v5 + 8) = 0;
    }
  }
LABEL_69:
  if ((v12 & (v12 - 1)) != 0)
  {
    if (v11 >= v12) {
      unint64_t v2 = v11 % v12;
    }
    else {
      unint64_t v2 = v11;
    }
  }
  else
  {
    unint64_t v2 = (v12 - 1) & v11;
  }
LABEL_74:
  unsigned int v37 = *(std::locale::__imp ***)(*(void *)v5 + 8 * v2);
  if (v37)
  {
    *(void *)v77[0].__locale_ = *v37;
    void *v37 = v77[0].__locale_;
  }
  else
  {
    *(void *)v77[0].__locale_ = *(void *)(v5 + 16);
    *(std::locale *)(v5 + 16) = v77[0];
    *(void *)(*(void *)v5 + 8 * v2) = v19;
    if (*(void *)v77[0].__locale_)
    {
      unint64_t v38 = *(void *)(*(void *)v77[0].__locale_ + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v38 >= v12) {
          v38 %= v12;
        }
      }
      else
      {
        v38 &= v12 - 1;
      }
      *(std::locale *)(*(void *)v5 + 8 * v38) = v77[0];
    }
  }
  unint64_t i = v77[0].__locale_;
  v77[0].__locale_ = 0;
  ++*(void *)(v5 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>,void *>>>>::~unique_ptr[abi:nn180100]((uint64_t)v77);
LABEL_83:
  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::~vector[abi:nn180100]((void **)&v85);
  if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v84.__r_.__value_.__l.__data_);
  }
  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::~vector[abi:nn180100]((void **)&v82);
  char v81 = 0;
  int v39 = +[NSFileManager defaultManager];
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v40 = a2;
  }
  else {
    uint64_t v40 = *(void *)a2;
  }
  double v41 = +[NSString stringWithUTF8String:v40];
  unsigned __int8 v42 = [v39 fileExistsAtPath:v41 isDirectory:&v81];
  if (v81) {
    unsigned __int8 v43 = 0;
  }
  else {
    unsigned __int8 v43 = v42;
  }

  if ((v43 & 1) == 0)
  {
    uint64_t v63 = *((void *)i + 5);
    uint64_t v64 = *((void *)i + 6);
    unint64_t v65 = (*(_DWORD *)v75[1] + 1);
    unint64_t v66 = 0x6DB6DB6DB6DB6DB7 * ((v64 - v63) >> 3);
    unint64_t v67 = v65 - v66;
    if (v65 <= v66)
    {
      if (v65 < v66)
      {
        uint64_t v73 = v63 + 56 * v65;
        while (v64 != v73)
        {
          v64 -= 56;
          std::allocator_traits<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::destroy[abi:nn180100]<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo,void>(v64);
        }
        *((void *)i + 6) = v73;
      }
    }
    else
    {
      uint64_t v68 = *((void *)i + 7);
      if (0x6DB6DB6DB6DB6DB7 * ((v68 - v64) >> 3) >= v67)
      {
        bzero(*((void **)i + 6), 56 * ((56 * v67 - 56) / 0x38) + 56);
        *((void *)i + 6) = v64 + 56 * ((56 * v67 - 56) / 0x38) + 56;
      }
      else
      {
        unint64_t v69 = 0x6DB6DB6DB6DB6DB7 * ((v68 - v63) >> 3);
        if (2 * v69 > v65) {
          unint64_t v65 = 2 * v69;
        }
        if (v69 >= 0x249249249249249) {
          unint64_t v70 = 0x492492492492492;
        }
        else {
          unint64_t v70 = v65;
        }
        std::__split_buffer<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::__split_buffer(&v84, v70, v66, (uint64_t)i + 56);
        std::string::size_type v71 = v84.__r_.__value_.__r.__words[2];
        size_t v72 = 56 * ((56 * v67 - 56) / 0x38) + 56;
        bzero((void *)v84.__r_.__value_.__r.__words[2], v72);
        v84.__r_.__value_.__r.__words[2] = v71 + v72;
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::__swap_out_circular_buffer((uint64_t *)i + 5, &v84);
        std::__split_buffer<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::~__split_buffer((uint64_t)&v84);
      }
    }
    return;
  }
  *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + *(void *)(v84.__r_.__value_.__r.__words[0] - 24)) = v44;
  v84.__r_.__value_.__l.__size_ = 0;
  unint64_t v45 = (std::ios_base *)((char *)&v84 + *(void *)(v84.__r_.__value_.__r.__words[0] - 24));
  std::ios_base::init(v45, &v84.__r_.__value_.__r.__words[2]);
  v45[1].__vftable = 0;
  v45[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)&v84 + *(void *)(v84.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&v86[-1] + *(void *)(v84.__r_.__value_.__r.__words[0] - 24)) | 4);
  }
  if (*(_DWORD *)((char *)&v86[-1] + *(void *)(v84.__r_.__value_.__r.__words[0] - 24))) {
    goto LABEL_140;
  }
  memset(&__str, 0, sizeof(__str));
  unint64_t v46 = (void *)((char *)i + 40);
  while (2)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&v84 + *(void *)(v84.__r_.__value_.__r.__words[0] - 24)));
    double v47 = std::locale::use_facet(v77, &std::ctype<char>::id);
    unsigned __int8 v48 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v47->__vftable[2].~facet_0)(v47, 10);
    std::locale::~locale(v77);
    std::istream::sentry::sentry();
    if (!LOBYTE(v77[0].__locale_)) {
      goto LABEL_113;
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    {
      *__str.__r_.__value_.__l.__data_ = 0;
      __str.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      __str.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&__str.__r_.__value_.__s + 23) = 0;
    }
    uint64_t v49 = 0;
    while (1)
    {
      unsigned int v50 = *(void **)((char *)v86 + *(void *)(v84.__r_.__value_.__r.__words[0] - 24));
      long long v51 = (unsigned char *)v50[3];
      if (v51 != (unsigned char *)v50[4])
      {
        void v50[3] = v51 + 1;
        LOBYTE(v50) = *v51;
        goto LABEL_104;
      }
      LODWORD(v50) = (*(uint64_t (**)(void *))(*v50 + 80))(v50);
      if (v50 == -1) {
        break;
      }
LABEL_104:
      if (v48 == v50)
      {
        int v52 = 0;
        goto LABEL_112;
      }
      std::string::push_back(&__str, (std::string::value_type)v50);
      ++v49;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0 && __str.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
      {
        int v52 = 4;
        goto LABEL_112;
      }
    }
    if (v49) {
      int v52 = 2;
    }
    else {
      int v52 = 6;
    }
LABEL_112:
    std::ios_base::clear((std::ios_base *)((char *)&v84 + *(void *)(v84.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&v86[-1] + *(void *)(v84.__r_.__value_.__r.__words[0] - 24)) | v52);
LABEL_113:
    if ((*((unsigned char *)&v86[-1] + *(void *)(v84.__r_.__value_.__r.__words[0] - 24)) & 5) == 0)
    {
      double v79 = 0;
      long long v78 = 0u;
      memset(v77, 0, sizeof(v77));
      unint64_t v53 = *((void *)i + 6);
      unint64_t v54 = *((void *)i + 7);
      if (v53 >= v54)
      {
        uint64_t v57 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - *v46) >> 3);
        unint64_t v58 = v57 + 1;
        if ((unint64_t)(v57 + 1) > 0x492492492492492) {
          abort();
        }
        unint64_t v59 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v54 - *v46) >> 3);
        if (2 * v59 > v58) {
          unint64_t v58 = 2 * v59;
        }
        if (v59 >= 0x249249249249249) {
          unint64_t v60 = 0x492492492492492;
        }
        else {
          unint64_t v60 = v58;
        }
        std::__split_buffer<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::__split_buffer(&v82, v60, v57, (uint64_t)i + 56);
        int v61 = v83;
        v83->__locale_ = (std::locale::__imp *)v77[0];
        long long v62 = *(_OWORD *)&v77[1].__locale_;
        v61[3].__locale_ = (std::locale::__imp *)v77[3];
        v61[4].__locale_ = 0;
        *(_OWORD *)&v61[1].__locale_ = v62;
        memset(&v77[1], 0, 24);
        v61[5].__locale_ = 0;
        v61[6].__locale_ = 0;
        *(_OWORD *)&v61[4].__locale_ = v78;
        v61[6].__locale_ = v79;
        long long v78 = 0uLL;
        double v79 = 0;
        v83 += 7;
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::__swap_out_circular_buffer((uint64_t *)i + 5, &v82);
        unint64_t v56 = *((void *)i + 6);
        std::__split_buffer<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>::~__split_buffer((uint64_t)&v82);
      }
      else
      {
        *(void *)unint64_t v53 = 0;
        long long v55 = *(_OWORD *)&v77[1].__locale_;
        *(std::locale *)(v53 + 24) = v77[3];
        *(void *)(v53 + 32) = 0;
        *(_OWORD *)(v53 + 8) = v55;
        memset(&v77[1], 0, 24);
        *(void *)(v53 + 40) = 0;
        *(void *)(v53 + 48) = 0;
        *(_OWORD *)(v53 + 32) = v78;
        *(void *)(v53 + 48) = v79;
        long long v78 = 0uLL;
        double v79 = 0;
        unint64_t v56 = v53 + 56;
      }
      *((void *)i + 6) = v56;
      std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)&v78);
      if (SHIBYTE(v77[3].__locale_) < 0) {
        operator delete(v77[1].__locale_);
      }
      std::string::operator=((std::string *)(*((void *)i + 6) - 48), &__str);
      continue;
    }
    break;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
LABEL_140:
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
}

- (unsigned)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = (uint64_t *)a2;
  }
  else {
    uint64_t v5 = *(uint64_t **)a2;
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v6 = *(void *)(a2 + 8);
  }
  unint64_t v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v5, v6);
  int8x8_t v8 = (int8x8_t)a1[1];
  if (!*(void *)&v8) {
    return 0;
  }
  unint64_t v9 = v7;
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  unint64_t v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v12 = v7;
    if (v7 >= *(void *)&v8) {
      unint64_t v12 = v7 % *(void *)&v8;
    }
  }
  else
  {
    unint64_t v12 = (*(void *)&v8 - 1) & v7;
  }
  uint8x8_t v13 = *(unsigned __int8 ***)(*a1 + 8 * v12);
  if (!v13) {
    return 0;
  }
  for (unint64_t i = *v13; i; unint64_t i = *(unsigned __int8 **)i)
  {
    unint64_t v15 = *((void *)i + 1);
    if (v15 == v9)
    {
      if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)a2)) {
        return i;
      }
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(void *)&v8) {
          v15 %= *(void *)&v8;
        }
      }
      else
      {
        v15 &= *(void *)&v8 - 1;
      }
      if (v15 != v12) {
        return 0;
      }
    }
  }
  return i;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(uint64_t *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  unsigned int v3 = result;
  int v4 = (uint64_t *)result[1];
  if (v4 != a2)
  {
    do
    {
      uint64_t v5 = v4 - 6;
      unint64_t v6 = (void **)(v4 - 3);
      std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100](&v6);
      double result = std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::~vector[abi:nn180100](v5);
      int v4 = v5;
    }
    while (v5 != a2);
  }
  v3[1] = (uint64_t)a2;
  return result;
}

- (void)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  unint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    int v4 = *a1;
    if ((void *)v3 != v2)
    {
      do
      {
        v3 -= 56;
        std::allocator_traits<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::destroy[abi:nn180100]<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo,void>(v3);
      }
      while ((void *)v3 != v2);
      int v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)(a1 + 32));
  if (*(char *)(a1 + 31) < 0)
  {
    unint64_t v2 = *(void **)(a1 + 8);
    operator delete(v2);
  }
}

- (char)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:(unint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  if (a2 >= 0x492492492492493) {
    abort();
  }
  double result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t v3 = result;
  uint64_t v4 = result[1];
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(void *)uint64_t v4 = *(id *)v6;
      double result = *(id *)(v6 + 8);
      *(void *)(v4 + 8) = result;
      uint64_t v7 = *(void *)(v6 + 48);
      long long v8 = *(_OWORD *)(v6 + 32);
      *(_OWORD *)(v4 + 16) = *(_OWORD *)(v6 + 16);
      *(_OWORD *)(v4 + 32) = v8;
      *(void *)(v4 + 48) = v7;
      v4 += 56;
      v6 += 56;
    }
    while (v6 != a3);
  }
  v3[1] = v4;
  return result;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; i -= 56)
  {

    uint64_t v5 = *(void **)(i - 56);
  }
  *(void *)(a1 + 8) = a2;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:(uint64_t)a4 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x492492492492493) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v7 = (char *)operator new(56 * a2);
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v8 = &v7[56 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[56 * a2];
  return a1;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(void *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + v5;
      uint64_t v7 = v2 + v5;
      *(void *)(v6 - 56) = *(void *)(v2 + v5 - 56);
      long long v8 = *(_OWORD *)(v2 + v5 - 48);
      *(void *)(v6 - 32) = *(void *)(v2 + v5 - 32);
      *(_OWORD *)(v6 - 48) = v8;
      *(void *)(v7 - 40) = 0;
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 48) = 0;
      *(void *)(v6 - 24) = 0;
      *(void *)(v6 - 16) = 0;
      *(void *)(v6 - 8) = 0;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(void *)(v6 - 8) = *(void *)(v2 + v5 - 8);
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      v5 -= 56;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v9 = *result;
  *double result = v4;
  a2[1] = v9;
  uint64_t v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

- (void)_ProcessLineList:(void *)a3 forFileCostMap:(void *)a4 forDebugInfo:(void *)a5 andCost:(double)a6 forAddr:(unsigned int)a7 andDrawIndex:(unsigned int)a8 andTargetIndex:(int)a9
{
  uint64_t v10 = *(size_t **)a3;
  uint64_t v9 = (size_t *)*((void *)a3 + 1);
  if (*(size_t **)a3 != v9)
  {
    uint64_t v12 = (uint64_t)a5;
    char v90 = 0;
    long long v95 = (char *)a4 + 16;
    int v91 = (size_t *)*((void *)a3 + 1);
    while (1)
    {
      size_t v15 = *v10;
      if (*(_DWORD *)(*v10 + 24) < *(_DWORD *)(v12 + 64)) {
        break;
      }
LABEL_173:
      if (++v10 == v9) {
        return;
      }
    }
    unint64_t v16 = *(unsigned __int8 *)(v15 + 23);
    if (*(char *)(v15 + 23) < 0)
    {
      if (*(void *)(v15 + 8)) {
        goto LABEL_7;
      }
    }
    else if (*(unsigned char *)(v15 + 23))
    {
LABEL_7:
      if ((v16 & 0x80u) == 0) {
        unint64_t v17 = (uint64_t *)v15;
      }
      else {
        unint64_t v17 = *(uint64_t **)v15;
      }
      if ((v16 & 0x80u) == 0) {
        unint64_t v18 = v16;
      }
      else {
        unint64_t v18 = *(void *)(v15 + 8);
      }
      unint64_t v19 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v17, v18);
      unint64_t v20 = v19;
      unint64_t v21 = *((void *)a4 + 1);
      if (v21)
      {
        uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v21);
        v22.i16[0] = vaddlv_u8(v22);
        unint64_t v23 = v22.u32[0];
        if (v22.u32[0] > 1uLL)
        {
          uint64_t v12 = v19;
          if (v19 >= v21) {
            uint64_t v12 = v19 % v21;
          }
        }
        else
        {
          uint64_t v12 = (v21 - 1) & v19;
        }
        unint64_t v24 = *(uint64_t ***)(*(void *)a4 + 8 * v12);
        if (v24)
        {
          for (uint64_t i = *v24; i; uint64_t i = (uint64_t *)*i)
          {
            unint64_t v26 = i[1];
            if (v26 == v20)
            {
              if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)i + 16, (unsigned __int8 *)v15))
              {
                goto LABEL_90;
              }
            }
            else
            {
              if (v23 > 1)
              {
                if (v26 >= v21) {
                  v26 %= v21;
                }
              }
              else
              {
                v26 &= v21 - 1;
              }
              if (v26 != v12) {
                break;
              }
            }
          }
        }
      }
      unsigned int v27 = (char *)operator new(0x70uLL);
      v97[0] = v27;
      v97[1] = v95;
      char v98 = 0;
      *(void *)unsigned int v27 = 0;
      *((void *)v27 + 1) = v20;
      uint64_t v28 = (std::string *)(v27 + 16);
      if (*(char *)(v15 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v28, *(const std::string::value_type **)v15, *(void *)(v15 + 8));
      }
      else
      {
        long long v29 = *(_OWORD *)v15;
        *((void *)v27 + 4) = *(void *)(v15 + 16);
        *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
      }
      *((void *)v27 + 13) = 0;
      *(_OWORD *)(v27 + 88) = 0u;
      *(_OWORD *)(v27 + 72) = 0u;
      *(_OWORD *)(v27 + 56) = 0u;
      *(_OWORD *)(v27 + 40) = 0u;
      *((_DWORD *)v27 + 26) = 1065353216;
      char v98 = 1;
      float v30 = (float)(unint64_t)(*((void *)a4 + 3) + 1);
      float v31 = *((float *)a4 + 8);
      if (v21 && (float)(v31 * (float)v21) >= v30)
      {
LABEL_80:
        unint64_t v46 = *(void **)(*(void *)a4 + 8 * v12);
        uint64_t i = (uint64_t *)v97[0];
        if (v46)
        {
          *(void *)v97[0] = *v46;
        }
        else
        {
          *(void *)v97[0] = *((void *)a4 + 2);
          *((void *)a4 + 2) = i;
          *(void *)(*(void *)a4 + 8 * v12) = v95;
          if (!*i)
          {
LABEL_89:
            v97[0] = 0;
            ++*((void *)a4 + 3);
            std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PerFileCost>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerFileCost>,void *>>>>::reset[abi:nn180100]((uint64_t)v97);
LABEL_90:
            unint64_t v48 = i[10];
            if (v48)
            {
              uint8x8_t v49 = (uint8x8_t)vcnt_s8((int8x8_t)v48);
              v49.i16[0] = vaddlv_u8(v49);
              if (v49.u32[0] > 1uLL)
              {
                size_t v15 = a8;
                if (v48 <= a8) {
                  size_t v15 = a8 % v48;
                }
              }
              else
              {
                size_t v15 = (v48 - 1) & a8;
              }
              unsigned int v50 = *(void ***)(i[9] + 8 * v15);
              if (v50)
              {
                long long v51 = (char *)*v50;
                if (*v50)
                {
                  do
                  {
                    unint64_t v52 = *((void *)v51 + 1);
                    if (v52 == a8)
                    {
                      if (*((_DWORD *)v51 + 4) == a8) {
                        goto LABEL_162;
                      }
                    }
                    else
                    {
                      if (v49.u32[0] > 1uLL)
                      {
                        if (v52 >= v48) {
                          v52 %= v48;
                        }
                      }
                      else
                      {
                        v52 &= v48 - 1;
                      }
                      if (v52 != v15) {
                        break;
                      }
                    }
                    long long v51 = *(char **)v51;
                  }
                  while (v51);
                }
              }
            }
            unint64_t v53 = i + 11;
            long long v51 = (char *)operator new(0x38uLL);
            *(void *)long long v51 = 0;
            *((void *)v51 + 1) = a8;
            *((_DWORD *)v51 + 4) = a8;
            *(_OWORD *)(v51 + 24) = 0u;
            *(_OWORD *)(v51 + 40) = 0u;
            float v54 = (float)(unint64_t)(i[12] + 1);
            float v55 = *((float *)i + 26);
            if (v48 && (float)(v55 * (float)v48) >= v54)
            {
LABEL_152:
              uint64_t v72 = i[9];
              uint64_t v73 = *(void **)(v72 + 8 * v15);
              if (v73)
              {
                *(void *)long long v51 = *v73;
              }
              else
              {
                *(void *)long long v51 = *v53;
                void *v53 = v51;
                *(void *)(v72 + 8 * v15) = v53;
                if (!*(void *)v51) {
                  goto LABEL_161;
                }
                unint64_t v74 = *(void *)(*(void *)v51 + 8);
                if ((v48 & (v48 - 1)) != 0)
                {
                  if (v74 >= v48) {
                    v74 %= v48;
                  }
                }
                else
                {
                  v74 &= v48 - 1;
                }
                uint64_t v73 = (void *)(i[9] + 8 * v74);
              }
              *uint64_t v73 = v51;
LABEL_161:
              ++i[12];
LABEL_162:
              uint64_t v12 = (uint64_t)a5;
              if (i[5] == i[6])
              {
                unint64_t v75 = *((unsigned int *)a5 + 14);
                v97[0] = 0;
                std::vector<double>::resize((char **)i + 5, v75, v97);
                i[8] = 0;
              }
              uint64_t v76 = *((void *)v51 + 3);
              if (v76 == *((void *)v51 + 4))
              {
                unint64_t v77 = *((unsigned int *)a5 + 14);
                v97[0] = 0;
                std::vector<double>::resize((char **)v51 + 3, v77, v97);
                *((void *)v51 + 6) = 0;
                uint64_t v76 = *((void *)v51 + 3);
              }
              size_t v78 = *v10;
              unsigned int v79 = **(_DWORD **)(*v10 + 56) - *((_DWORD *)a5 + 12);
              double v80 = a6 / (double)(unint64_t)((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
              *(double *)(i[5] + 8 * v79) = *(double *)(i[5] + 8 * v79) + v80;
              *((double *)i + 8) = *((double *)i + 8) + v80;
              *(double *)(v76 + 8 * v79) = v80 + *(double *)(v76 + 8 * v79);
              *((double *)v51 + 6) = v80 + *((double *)v51 + 6);
              unint64_t v81 = a7 - *(_DWORD *)(v78 + 24);
              uint64_t v82 = *(void *)(v78 + 32);
              if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(v78 + 40) - v82) >> 3) <= v81)
              {
                uint64_t v9 = v91;
              }
              else
              {
                uint64_t v83 = v82 + 40 * v81;
                *(double *)(v83 + 16) = v80 + *(double *)(v83 + 16);
                uint64_t v9 = v91;
                if (!*(void *)v83)
                {
                  *(void *)uint64_t v83 = &stru_7482F0;
                  uint64_t v84 = *((void *)a5 + 3);
                  uint64_t v85 = 40 * a7;
                  uint64_t v86 = *(void **)(v84 + v85);
                  *(void *)(v84 + v85) = &stru_7482F0;
                }
                if ((v90 & 1) == 0) {
                  ++*(_DWORD *)(v82 + 40 * v81 + 24);
                }
                char v90 = 1;
              }
              goto LABEL_173;
            }
            BOOL v56 = (v48 & (v48 - 1)) != 0;
            if (v48 < 3) {
              BOOL v56 = 1;
            }
            unint64_t v57 = v56 | (2 * v48);
            unint64_t v58 = vcvtps_u32_f32(v54 / v55);
            if (v57 <= v58) {
              int8x8_t prime = (int8x8_t)v58;
            }
            else {
              int8x8_t prime = (int8x8_t)v57;
            }
            if (*(void *)&prime == 1)
            {
              int8x8_t prime = (int8x8_t)2;
            }
            else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
            {
              int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
            }
            unint64_t v48 = i[10];
            if (*(void *)&prime > v48) {
              goto LABEL_118;
            }
            if (*(void *)&prime < v48)
            {
              unint64_t v66 = vcvtps_u32_f32((float)(unint64_t)i[12] / *((float *)i + 26));
              if (v48 < 3 || (uint8x8_t v67 = (uint8x8_t)vcnt_s8((int8x8_t)v48), v67.i16[0] = vaddlv_u8(v67), v67.u32[0] > 1uLL))
              {
                unint64_t v66 = std::__next_prime(v66);
              }
              else
              {
                uint64_t v68 = 1 << -(char)__clz(v66 - 1);
                if (v66 >= 2) {
                  unint64_t v66 = v68;
                }
              }
              if (*(void *)&prime <= v66) {
                int8x8_t prime = (int8x8_t)v66;
              }
              if (*(void *)&prime >= v48)
              {
                unint64_t v48 = i[10];
              }
              else
              {
                if (prime)
                {
LABEL_118:
                  if (*(void *)&prime >> 61) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  unint64_t v60 = operator new(8 * *(void *)&prime);
                  int v61 = (void *)i[9];
                  i[9] = (uint64_t)v60;
                  if (v61) {
                    operator delete(v61);
                  }
                  uint64_t v62 = 0;
                  i[10] = (uint64_t)prime;
                  do
                    *(void *)(i[9] + 8 * v62++) = 0;
                  while (*(void *)&prime != v62);
                  uint64_t v63 = (void *)*v53;
                  if (*v53)
                  {
                    unint64_t v64 = v63[1];
                    uint8x8_t v65 = (uint8x8_t)vcnt_s8(prime);
                    v65.i16[0] = vaddlv_u8(v65);
                    if (v65.u32[0] > 1uLL)
                    {
                      if (v64 >= *(void *)&prime) {
                        v64 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v64 &= *(void *)&prime - 1;
                    }
                    *(void *)(i[9] + 8 * v64) = v53;
                    unint64_t v69 = (void *)*v63;
                    if (*v63)
                    {
                      do
                      {
                        unint64_t v70 = v69[1];
                        if (v65.u32[0] > 1uLL)
                        {
                          if (v70 >= *(void *)&prime) {
                            v70 %= *(void *)&prime;
                          }
                        }
                        else
                        {
                          v70 &= *(void *)&prime - 1;
                        }
                        if (v70 != v64)
                        {
                          uint64_t v71 = i[9];
                          if (!*(void *)(v71 + 8 * v70))
                          {
                            *(void *)(v71 + 8 * v70) = v63;
                            goto LABEL_143;
                          }
                          *uint64_t v63 = *v69;
                          void *v69 = **(void **)(i[9] + 8 * v70);
                          **(void **)(i[9] + 8 * v70) = v69;
                          unint64_t v69 = v63;
                        }
                        unint64_t v70 = v64;
LABEL_143:
                        uint64_t v63 = v69;
                        unint64_t v69 = (void *)*v69;
                        unint64_t v64 = v70;
                      }
                      while (v69);
                    }
                  }
                  unint64_t v48 = (unint64_t)prime;
                  goto LABEL_147;
                }
                id v88 = (void *)i[9];
                i[9] = 0;
                if (v88) {
                  operator delete(v88);
                }
                unint64_t v48 = 0;
                i[10] = 0;
              }
            }
LABEL_147:
            if ((v48 & (v48 - 1)) != 0)
            {
              if (v48 <= a8) {
                size_t v15 = a8 % v48;
              }
              else {
                size_t v15 = a8;
              }
            }
            else
            {
              size_t v15 = (v48 - 1) & a8;
            }
            goto LABEL_152;
          }
          unint64_t v47 = *(void *)(*i + 8);
          if ((v21 & (v21 - 1)) != 0)
          {
            if (v47 >= v21) {
              v47 %= v21;
            }
          }
          else
          {
            v47 &= v21 - 1;
          }
          unint64_t v46 = (void *)(*(void *)a4 + 8 * v47);
        }
        *unint64_t v46 = i;
        goto LABEL_89;
      }
      BOOL v32 = (v21 & (v21 - 1)) != 0;
      if (v21 < 3) {
        BOOL v32 = 1;
      }
      unint64_t v33 = v32 | (2 * v21);
      unint64_t v34 = vcvtps_u32_f32(v30 / v31);
      if (v33 <= v34) {
        size_t v15 = v34;
      }
      else {
        size_t v15 = v33;
      }
      if (v15 == 1)
      {
        size_t v15 = 2;
      }
      else if ((v15 & (v15 - 1)) != 0)
      {
        size_t v15 = std::__next_prime(v15);
      }
      unint64_t v21 = *((void *)a4 + 1);
      if (v15 > v21) {
        goto LABEL_46;
      }
      if (v15 < v21)
      {
        unint64_t v41 = vcvtps_u32_f32((float)*((unint64_t *)a4 + 3) / *((float *)a4 + 8));
        if (v21 < 3 || (uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v21), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
        {
          unint64_t v41 = std::__next_prime(v41);
        }
        else
        {
          uint64_t v43 = 1 << -(char)__clz(v41 - 1);
          if (v41 >= 2) {
            unint64_t v41 = v43;
          }
        }
        if (v15 <= v41) {
          size_t v15 = v41;
        }
        if (v15 >= v21)
        {
          unint64_t v21 = *((void *)a4 + 1);
        }
        else
        {
          if (v15)
          {
LABEL_46:
            if (v15 >> 61) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            int v35 = operator new(8 * v15);
            unint64_t v36 = *(void **)a4;
            *(void *)a4 = v35;
            if (v36) {
              operator delete(v36);
            }
            uint64_t v37 = 0;
            *((void *)a4 + 1) = v15;
            do
              *(void *)(*(void *)a4 + 8 * v37++) = 0;
            while (v15 != v37);
            unint64_t v38 = (void *)*v95;
            if (*v95)
            {
              size_t v39 = v38[1];
              uint8x8_t v40 = (uint8x8_t)vcnt_s8((int8x8_t)v15);
              v40.i16[0] = vaddlv_u8(v40);
              if (v40.u32[0] > 1uLL)
              {
                if (v39 >= v15) {
                  v39 %= v15;
                }
              }
              else
              {
                v39 &= v15 - 1;
              }
              *(void *)(*(void *)a4 + 8 * v39) = v95;
              std::string::size_type v44 = (void *)*v38;
              if (*v38)
              {
                do
                {
                  size_t v45 = v44[1];
                  if (v40.u32[0] > 1uLL)
                  {
                    if (v45 >= v15) {
                      v45 %= v15;
                    }
                  }
                  else
                  {
                    v45 &= v15 - 1;
                  }
                  if (v45 != v39)
                  {
                    if (!*(void *)(*(void *)a4 + 8 * v45))
                    {
                      *(void *)(*(void *)a4 + 8 * v45) = v38;
                      goto LABEL_71;
                    }
                    void *v38 = *v44;
                    *std::string::size_type v44 = **(void **)(*(void *)a4 + 8 * v45);
                    **(void **)(*(void *)a4 + 8 * v45) = v44;
                    std::string::size_type v44 = v38;
                  }
                  size_t v45 = v39;
LABEL_71:
                  unint64_t v38 = v44;
                  std::string::size_type v44 = (void *)*v44;
                  size_t v39 = v45;
                }
                while (v44);
              }
            }
            unint64_t v21 = v15;
            goto LABEL_75;
          }
          long long v87 = *(void **)a4;
          *(void *)a4 = 0;
          if (v87) {
            operator delete(v87);
          }
          unint64_t v21 = 0;
          *((void *)a4 + 1) = 0;
        }
      }
LABEL_75:
      if ((v21 & (v21 - 1)) != 0)
      {
        if (v20 >= v21) {
          uint64_t v12 = v20 % v21;
        }
        else {
          uint64_t v12 = v20;
        }
      }
      else
      {
        uint64_t v12 = (v21 - 1) & v20;
      }
      goto LABEL_80;
    }
    NSLog(@"Empty Path", a2);
    unint64_t v16 = *(unsigned __int8 *)(v15 + 23);
    goto LABEL_7;
  }
}

- (pair<std::vector<unsigned)_getAddressAndLineTableForDebugInfo:(pair<std:(std:(SEL)a3 :(void *)a4 vector<std::vector<DebugInfo::LineEntry *>>> *)self :vector<unsigned)int>
{
  uint64_t v5 = *(void *)a4;
  uint64_t v4 = *((void *)a4 + 1);
  if (*(void *)a4 == v4)
  {
    *(_OWORD *)&retstr->var0.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->var1.unint64_t var1 = 0u;
    *(_OWORD *)&retstr->var0.__begin_ = 0u;
  }
  else
  {
    uint64_t v7 = *((unsigned int *)a4 + 16);
    if (v7)
    {
      long long v8 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::IntersectionFunctionTag>>(*((unsigned int *)a4 + 16));
      id v89 = &v8[v9];
      memset(v8, 255, 4 * v7);
      int v91 = &v8[v7];
      uint64_t v5 = *(void *)a4;
      uint64_t v4 = *((void *)a4 + 1);
    }
    else
    {
      long long v8 = 0;
      int v91 = 0;
      id v89 = 0;
    }
    int64x2_t v97 = 0uLL;
    char v98 = 0;
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v4 - v5) >> 4);
    if (v10 >= 2)
    {
      if (v10 >= 0x1555555555555556) {
        abort();
      }
      long long v95 = (void **)&v98;
      uint64_t v11 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v10 >> 1);
      std::string __p = v11;
      v93.i64[0] = (uint64_t)v11;
      uint8x8_t v13 = &v11[24 * v12];
      v93.i64[1] = (uint64_t)v11;
      long long v94 = v13;
      unint64_t v14 = (void *)v97.i64[1];
      size_t v15 = (void *)v97.i64[0];
      if (v97.i64[1] == v97.i64[0])
      {
        int64x2_t v18 = vdupq_n_s64(v97.u64[1]);
        unint64_t v16 = v11;
      }
      else
      {
        unint64_t v16 = v11;
        do
        {
          *((void *)v16 - 3) = 0;
          *((void *)v16 - 2) = 0;
          v16 -= 24;
          *((void *)v16 + 2) = 0;
          long long v17 = *(_OWORD *)(v14 - 3);
          v14 -= 3;
          *(_OWORD *)unint64_t v16 = v17;
          *((void *)v16 + 2) = v14[2];
          *unint64_t v14 = 0;
          v14[1] = 0;
          uint64_t v14[2] = 0;
        }
        while (v14 != v15);
        int64x2_t v18 = v97;
        uint64_t v11 = (char *)v93.i64[1];
        uint8x8_t v13 = v94;
      }
      v97.i64[0] = (uint64_t)v16;
      v97.i64[1] = (uint64_t)v11;
      int64x2_t v93 = v18;
      unint64_t v19 = v98;
      char v98 = v13;
      long long v94 = v19;
      std::string __p = (void *)v18.i64[0];
      std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
      uint64_t v5 = *(void *)a4;
      uint64_t v4 = *((void *)a4 + 1);
    }
    if (v4 != v5)
    {
      uint64_t v20 = 0;
      unsigned int v21 = 0;
      do
      {
        uint64_t v22 = v5 + 80 * v20;
        unint64_t v23 = *(unsigned int *)(v22 + 24);
        if (v91 - v8 > v23)
        {
          unsigned int v24 = v8[v23];
          uint64_t v25 = v97.i64[0];
          if (v24 == -1)
          {
            unint64_t v26 = (char *)v97.i64[1];
            unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v97.i64[1] - v97.i64[0]) >> 3);
            do
            {
              v8[v23] = v27;
              LODWORD(v23) = v23 + 1;
            }
            while (v23 < *(_DWORD *)(v5 + 80 * v20 + 28));
            if (v26 >= v98)
            {
              if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
                abort();
              }
              unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v98[-v25] >> 3);
              uint64_t v30 = 2 * v29;
              if (2 * v29 <= v27 + 1) {
                uint64_t v30 = v27 + 1;
              }
              if (v29 >= 0x555555555555555) {
                unint64_t v31 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v31 = v30;
              }
              long long v95 = (void **)&v98;
              BOOL v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v31);
              unint64_t v33 = &v32[24 * v27];
              std::string __p = v32;
              v93.i64[0] = (uint64_t)v33;
              long long v94 = &v32[24 * v34];
              uint64_t v28 = v33 + 24;
              *(void *)unint64_t v33 = 0;
              *((void *)v33 + 1) = 0;
              *((void *)v33 + 2) = 0;
              v93.i64[1] = (uint64_t)(v33 + 24);
              int v35 = (void *)v97.i64[1];
              unint64_t v36 = (void *)v97.i64[0];
              uint64_t v37 = v93.i64[0];
              if (v97.i64[1] == v97.i64[0])
              {
                int64x2_t v39 = vdupq_n_s64(v97.u64[1]);
              }
              else
              {
                do
                {
                  *(void *)(v37 - 24) = 0;
                  *(void *)(v37 - 16) = 0;
                  v37 -= 24;
                  *(void *)(v37 + 16) = 0;
                  long long v38 = *(_OWORD *)(v35 - 3);
                  v35 -= 3;
                  *(_OWORD *)uint64_t v37 = v38;
                  *(void *)(v37 + 16) = v35[2];
                  *int v35 = 0;
                  v35[1] = 0;
                  v35[2] = 0;
                }
                while (v35 != v36);
                int64x2_t v39 = v97;
                uint64_t v28 = (void *)v93.i64[1];
              }
              v97.i64[0] = v37;
              v97.i64[1] = (uint64_t)v28;
              int64x2_t v93 = v39;
              uint8x8_t v40 = v98;
              char v98 = v94;
              long long v94 = v40;
              std::string __p = (void *)v39.i64[0];
              std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
            }
            else
            {
              uint64_t v28 = v26 + 24;
              *(void *)unint64_t v26 = 0;
              *((void *)v26 + 1) = 0;
              *((void *)v26 + 2) = 0;
            }
            v97.i64[1] = (uint64_t)v28;
            unsigned int v24 = v8[*(unsigned int *)(v22 + 24)];
            uint64_t v25 = v97.i64[0];
          }
          unint64_t v41 = (void **)(v25 + 24 * v24);
          uint64_t v43 = v41 + 1;
          uint8x8_t v42 = v41[1];
          unint64_t v44 = (unint64_t)v41[2];
          if ((unint64_t)v42 >= v44)
          {
            uint64_t v46 = ((char *)v42 - (unsigned char *)*v41) >> 3;
            if ((unint64_t)(v46 + 1) >> 61) {
              abort();
            }
            uint64_t v47 = v44 - (void)*v41;
            uint64_t v48 = v47 >> 2;
            if (v47 >> 2 <= (unint64_t)(v46 + 1)) {
              uint64_t v48 = v46 + 1;
            }
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v49 = v48;
            }
            if (v49) {
              unint64_t v49 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v49);
            }
            else {
              uint64_t v50 = 0;
            }
            long long v51 = (void *)(v49 + 8 * v46);
            *long long v51 = v22;
            size_t v45 = v51 + 1;
            unint64_t v52 = (char *)*v43;
            unint64_t v53 = (char *)*v41;
            if (*v43 != *v41)
            {
              do
              {
                uint64_t v54 = *((void *)v52 - 1);
                v52 -= 8;
                *--long long v51 = v54;
              }
              while (v52 != v53);
              unint64_t v52 = (char *)*v41;
            }
            *unint64_t v41 = v51;
            void *v43 = v45;
            v41[2] = (void *)(v49 + 8 * v50);
            if (v52) {
              operator delete(v52);
            }
          }
          else
          {
            *uint8x8_t v42 = v22;
            size_t v45 = v42 + 1;
          }
          void *v43 = v45;
          uint64_t v5 = *(void *)a4;
          uint64_t v4 = *((void *)a4 + 1);
        }
        uint64_t v20 = ++v21;
      }
      while (0xCCCCCCCCCCCCCCCDLL * ((v4 - v5) >> 4) > v21);
    }
    uint64_t v55 = v97.i64[1];
    if (v97.i64[1] >= (unint64_t)v98)
    {
      unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((v97.i64[1] - v97.i64[0]) >> 3);
      unint64_t v58 = v57 + 1;
      if (v57 + 1 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      if (0x5555555555555556 * ((uint64_t)&v98[-v97.i64[0]] >> 3) > v58) {
        unint64_t v58 = 0x5555555555555556 * ((uint64_t)&v98[-v97.i64[0]] >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v98[-v97.i64[0]] >> 3) >= 0x555555555555555) {
        unint64_t v59 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v59 = v58;
      }
      long long v95 = (void **)&v98;
      unint64_t v60 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v59);
      int v61 = &v60[24 * v57];
      v93.i64[0] = (uint64_t)v61;
      long long v94 = &v60[24 * v62];
      BOOL v56 = v61 + 24;
      *(void *)int v61 = 0;
      *((void *)v61 + 1) = 0;
      *((void *)v61 + 2) = 0;
      v93.i64[1] = (uint64_t)(v61 + 24);
      uint64_t v63 = (void *)v97.i64[1];
      unint64_t v64 = (void *)v97.i64[0];
      uint64_t v65 = v93.i64[0];
      if (v97.i64[1] == v97.i64[0])
      {
        int64x2_t v67 = vdupq_n_s64(v97.u64[1]);
      }
      else
      {
        do
        {
          *(void *)(v65 - 24) = 0;
          *(void *)(v65 - 16) = 0;
          v65 -= 24;
          *(void *)(v65 + 16) = 0;
          long long v66 = *(_OWORD *)(v63 - 3);
          v63 -= 3;
          *(_OWORD *)uint64_t v65 = v66;
          *(void *)(v65 + 16) = v63[2];
          *uint64_t v63 = 0;
          v63[1] = 0;
          v63[2] = 0;
        }
        while (v63 != v64);
        int64x2_t v67 = v97;
        BOOL v56 = (void *)v93.i64[1];
      }
      v97.i64[0] = v65;
      v97.i64[1] = (uint64_t)v56;
      int64x2_t v93 = v67;
      uint64_t v68 = v98;
      char v98 = v94;
      long long v94 = v68;
      std::string __p = (void *)v67.i64[0];
      std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
    }
    else
    {
      BOOL v56 = (void *)(v97.i64[1] + 24);
      *(void *)v97.i64[1] = 0;
      *(void *)(v55 + 8) = 0;
      *(void *)(v55 + 16) = 0;
    }
    v97.i64[1] = (uint64_t)v56;
    uint64_t v69 = *(void *)a4;
    uint64_t v70 = *((void *)a4 + 1);
    if (v69 != v70)
    {
      do
      {
        uint64_t v71 = v97.i64[1];
        uint64_t v73 = *(void **)(v97.i64[1] - 16);
        unint64_t v72 = *(void *)(v97.i64[1] - 8);
        if ((unint64_t)v73 >= v72)
        {
          uint64_t v75 = *(void *)(v97.i64[1] - 24);
          uint64_t v76 = ((uint64_t)v73 - v75) >> 3;
          if ((unint64_t)(v76 + 1) >> 61) {
            abort();
          }
          uint64_t v77 = v72 - v75;
          uint64_t v78 = v77 >> 2;
          if (v77 >> 2 <= (unint64_t)(v76 + 1)) {
            uint64_t v78 = v76 + 1;
          }
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v79 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v79 = v78;
          }
          if (v79) {
            unint64_t v79 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v79);
          }
          else {
            uint64_t v80 = 0;
          }
          unint64_t v81 = (void *)(v79 + 8 * v76);
          *unint64_t v81 = v69;
          unint64_t v74 = v81 + 1;
          uint64_t v83 = *(char **)(v71 - 24);
          uint64_t v82 = *(char **)(v71 - 16);
          if (v82 != v83)
          {
            do
            {
              uint64_t v84 = *((void *)v82 - 1);
              v82 -= 8;
              *--unint64_t v81 = v84;
            }
            while (v82 != v83);
            uint64_t v82 = *(char **)(v71 - 24);
          }
          *(void *)(v71 - 24) = v81;
          *(void *)(v71 - 16) = v74;
          *(void *)(v71 - 8) = v79 + 8 * v80;
          if (v82) {
            operator delete(v82);
          }
        }
        else
        {
          *uint64_t v73 = v69;
          unint64_t v74 = v73 + 1;
        }
        *(void *)(v71 - 16) = v74;
        v69 += 80;
      }
      while (v69 != v70);
      BOOL v56 = (void *)v97.i64[1];
    }
    uint64_t v85 = (void *)v97.i64[0];
    if (v8 != v91)
    {
      unsigned int v86 = -1431655765 * (((unint64_t)v56 - v97.i64[0]) >> 3) - 1;
      long long v87 = v8;
      do
      {
        if (*v87 == -1) {
          unsigned int *v87 = v86;
        }
        ++v87;
      }
      while (v87 != v91);
      uint64_t v85 = (void *)v97.i64[0];
    }
    id v88 = v98;
    char v98 = 0;
    uint64_t v96 = 0;
    int64x2_t v97 = 0uLL;
    retstr->var0.__begin_ = v8;
    retstr->var0.__end_ = v91;
    std::string __p = 0;
    int64x2_t v93 = 0uLL;
    long long v94 = 0;
    retstr->var0.__end_cap_.__value_ = v89;
    retstr->var1.id var0 = v85;
    retstr->var1.unint64_t var1 = v56;
    retstr->var1.var2.id var0 = v88;
    long long v95 = 0;
    unsigned int v99 = &v94;
    std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v99);
    if (__p)
    {
      v93.i64[0] = (uint64_t)__p;
      operator delete(__p);
    }
    std::string __p = &v97;
    std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  }
  return self;
}

- (DebugInfo)_getDebugInfoForBinary:(SEL)a3 withTextSegment:(id)a4 forTargetIndex:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v168 = v9;
  if (![v9 length]
    || (id v11 = v9,
        MachOInfo::MachOInfo((MachOInfo *)&v180, (unsigned __int8 *)[v11 bytes]),
        !v181))
  {
    retstr->unsigned int var6 = 0;
    *(_OWORD *)&retstr->var1.unint64_t var1 = 0u;
    *(_OWORD *)&retstr->unsigned int var2 = 0u;
    *(_OWORD *)&retstr->var0.id var0 = 0u;
    *(_OWORD *)&retstr->var0.var2.id var0 = 0u;
    goto LABEL_196;
  }
  double v163 = self;
  id v12 = v11;
  id v164 = v10;
  *(_OWORD *)&retstr->var0.id var0 = 0u;
  *(_OWORD *)&retstr->var0.var2.id var0 = 0u;
  *(_OWORD *)&retstr->var1.unint64_t var1 = 0u;
  *(_OWORD *)&retstr->unsigned int var2 = 0u;
  retstr->unsigned int var6 = 0;
  if (!v12) {
    goto LABEL_195;
  }
  int v167 = retstr;
  if (![v12 length]) {
    goto LABEL_195;
  }
  id v156 = v10;
  id v157 = v12;
  id v159 = +[NSMutableData dataWithData:v12];
  uint8x8_t v13 = (char *)[v159 bytes];
  bzero(&v13[v180], v181);
  id v162 = v159;
  unint64_t v14 = (char *)[v162 bytes];
  bzero(&v14[v182], v183);
  size_t v15 = +[NSFileManager defaultManager];
  unint64_t v16 = NSTemporaryDirectory();
  long long v17 = [&stru_7482F0 stringByAppendingString:@"XXXXXX"];
  int64x2_t v18 = [v16 stringByAppendingPathComponent:v17];

  CFStringGetFileSystemRepresentation(v18, buffer, 1024);
  int v19 = mkstemp(buffer);
  if (v19 == -1)
  {
    uint64_t v158 = 0;
  }
  else
  {
    close(v19);
    uint64_t v20 = [v15 stringWithFileSystemRepresentation:buffer length:strlen(buffer)];
    if ([v15 removeItemAtPath:v20 error:0])
    {
      uint64_t v158 = +[NSURL fileURLWithPath:v20 isDirectory:0];
    }
    else
    {
      uint64_t v158 = 0;
    }
  }
  unsigned int v21 = v158;
  if (([v162 writeToURL:v158 atomically:0] & 1) == 0) {
    goto LABEL_194;
  }
  id v22 = v158;
  v203[0] = off_745688;
  v203[1] = v22;
  v203[3] = v203;
  std::__function::__value_func<void ()(void)>::__value_func[abi:nn180100]((uint64_t)v204, (uint64_t)v203);
  unint64_t v23 = (lldb::SBDebugger *)std::__function::__value_func<void ()(void)>::~__value_func[abi:nn180100](v203);
  lldb::SBDebugger::Create(v200, v23);
  if ((lldb::SBDebugger::IsValid((lldb::SBDebugger *)v200) & 1) == 0) {
    goto LABEL_193;
  }
  id v24 = [v22 path];
  lldb::SBDebugger::CreateTargetWithFileAndArch(v199, (lldb::SBDebugger *)v200, (const char *)[v24 UTF8String], "16777235-0");

  if ((lldb::SBTarget::IsValid((lldb::SBTarget *)v199) & 1) == 0) {
    goto LABEL_192;
  }
  id v25 = [v22 path];
  lldb::SBFileSpec::SBFileSpec((lldb::SBFileSpec *)v198, (const char *)[v25 UTF8String], 1);

  lldb::SBTarget::FindModule(v197, (lldb::SBTarget *)v199, (const lldb::SBFileSpec *)v198);
  if (!lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v197)) {
    goto LABEL_191;
  }
  lldb::SBModule::SBModule((lldb::SBModule *)v195, (const lldb::SBModule *)v197);
  unsigned int NumCompileUnits = lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v195);
  if (NumCompileUnits >= 2)
  {
    unsigned int v27 = 0;
    char v28 = 0;
    unsigned int v179 = 0;
    unint64_t v29 = -1;
    while (1)
    {
      lldb::SBModule::GetCompileUnitAtIndex((uint64_t *)buffer, (lldb::SBModule *)v195, v27);
      int NumLineEntries = lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)buffer);
      if (NumLineEntries) {
        break;
      }
LABEL_39:
      lldb::SBCompileUnit::~SBCompileUnit((lldb::SBCompileUnit *)buffer);
      if (++v27 == NumCompileUnits) {
        goto LABEL_42;
      }
    }
    int v31 = 0;
    BOOL v32 = 0;
    unint64_t v33 = -1;
    do
    {
      lldb::SBCompileUnit::GetLineEntryAtIndex((lldb::SBCompileUnit *)buffer);
      lldb::SBLineEntry::GetStartAddress((uint64_t *)v201, (lldb::SBLineEntry *)v193);
      lldb::SBAddress::GetSymbol((uint64_t *)&__s1, (lldb::SBAddress *)v201);
      Name = (const char *)lldb::SBSymbol::GetName((lldb::SBSymbol *)&__s1);
      lldb::SBSymbol::~SBSymbol((lldb::SBSymbol *)&__s1);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)v201);
      if (!v32 && Name != 0) {
        BOOL v32 = strlen(Name) == 8 && *(void *)Name == 0x6E69616D2E6DLL;
      }
      lldb::SBLineEntry::GetStartAddress((uint64_t *)&__s1, (lldb::SBLineEntry *)v193);
      unint64_t FileAddress = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)&__s1);
      if (FileAddress < v33) {
        unint64_t v33 = FileAddress;
      }
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)&__s1);
      lldb::SBLineEntry::~SBLineEntry((lldb::SBLineEntry *)v193);
      ++v31;
    }
    while (NumLineEntries != v31);
    if (v32)
    {
      unsigned int v36 = v179;
      if ((v28 & (v33 >= v29)) == 0) {
        unsigned int v36 = v27;
      }
      unsigned int v179 = v36;
      if ((v28 & (v33 >= v29)) == 0) {
        unint64_t v29 = v33;
      }
    }
    else if ((v28 & 1) == 0)
    {
      char v28 = 0;
      unsigned int v37 = v179;
      if (v33 < v29) {
        unsigned int v37 = v27;
      }
      unsigned int v179 = v37;
      if (v33 < v29) {
        unint64_t v29 = v33;
      }
      goto LABEL_38;
    }
    char v28 = 1;
LABEL_38:
    retstr = v167;
    goto LABEL_39;
  }
  unsigned int v179 = 0;
LABEL_42:
  lldb::SBModule::GetCompileUnitAtIndex(&v196, (lldb::SBModule *)v197, v179);
  lldb::SBModule::~SBModule((lldb::SBModule *)v195);
  if (!lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v196)) {
    goto LABEL_190;
  }
  unsigned int v38 = lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v196);
  std::vector<DebugInfo::LineEntry>::resize((uint64_t)retstr, v38);
  *(void *)&retstr->unsigned int var2 = 0xFFFFFFFFLL;
  unsigned int v39 = v181;
  retstr->var5 = 0;
  retstr->unsigned int var6 = v39;
  std::string::basic_string[abi:nn180100]<0>(v193, "::air.vertexFetchFunction()");
  unint64_t v40 = 0;
  uint64_t v160 = 72;
  int v161 = -1;
  while (v40 < lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v196))
  {
    lldb::SBCompileUnit::GetLineEntryAtIndex((lldb::SBCompileUnit *)&v196);
    lldb::SBLineEntry::GetStartAddress((uint64_t *)&__s1, (lldb::SBLineEntry *)v192);
    lldb::SBAddress::GetBlock((uint64_t *)buffer, (lldb::SBAddress *)&__s1);
    char IsInlined = lldb::SBBlock::IsInlined((lldb::SBBlock *)buffer);
    lldb::SBBlock::~SBBlock((lldb::SBBlock *)buffer);
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)&__s1);
    unint64_t v166 = v40;
    if (IsInlined)
    {
      lldb::SBBlock::SBBlock((lldb::SBBlock *)v188);
      lldb::SBLineEntry::GetStartAddress((uint64_t *)buffer, (lldb::SBLineEntry *)v192);
      lldb::SBAddress::GetBlock(&v187, (lldb::SBAddress *)buffer);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)buffer);
      lldb::SBLineEntry::GetFileSpec(&v186, (lldb::SBLineEntry *)v192);
      int Line = lldb::SBLineEntry::GetLine((lldb::SBLineEntry *)v192);
      while (lldb::SBBlock::IsInlined((lldb::SBBlock *)&v187))
      {
        lldb::SBBlock::operator=();
        lldb::SBBlock::GetParent((uint64_t *)buffer, (lldb::SBBlock *)&v187);
        lldb::SBBlock::operator=();
        lldb::SBBlock::~SBBlock((lldb::SBBlock *)buffer);
        id var0 = retstr->var0.var0;
        unint64_t v44 = (char *)retstr->var0.var0 + 80 * v40;
        uint64_t v209 = 0;
        long long __p = 0u;
        memset(v207, 0, sizeof(v207));
        long long v206 = 0u;
        memset(buffer, 0, sizeof(buffer));
        unint64_t v45 = *((void *)v44 + 8);
        unint64_t v46 = *((void *)v44 + 9);
        uint64_t v47 = (unint64_t *)(v44 + 64);
        if (v45 >= v46)
        {
          unint64_t v52 = std::vector<DebugInfo::BlockInfo>::__push_back_slow_path<DebugInfo::BlockInfo>((unint64_t *)var0 + 10 * v40 + 7, (uint64_t)buffer);
          int v53 = SHIBYTE(v209);
          *uint64_t v47 = v52;
          if (v53 < 0) {
            operator delete((void *)__p);
          }
        }
        else
        {
          *(void *)unint64_t v45 = 0;
          long long v48 = *(_OWORD *)&buffer[8];
          *(void *)(v45 + 24) = *(void *)&buffer[24];
          *(_OWORD *)(v45 + 8) = v48;
          memset(&buffer[8], 0, 24);
          uint64_t v49 = v207[0];
          *(_OWORD *)(v45 + 32) = v206;
          *(void *)(v45 + 48) = v49;
          v207[0] = 0;
          long long v206 = 0uLL;
          long long v50 = *(_OWORD *)&v207[1];
          *(void *)(v45 + 72) = v207[3];
          *(_OWORD *)(v45 + 56) = v50;
          memset(&v207[1], 0, 24);
          long long v51 = __p;
          *(void *)(v45 + 96) = v209;
          *(_OWORD *)(v45 + 80) = v51;
          long long __p = 0uLL;
          uint64_t v209 = 0;
          *uint64_t v47 = v45 + 104;
        }
        if (SHIBYTE(v207[3]) < 0) {
          operator delete((void *)v207[1]);
        }
        if (SHIBYTE(v207[0]) < 0) {
          operator delete((void *)v206);
        }
        if (buffer[31] < 0) {
          operator delete(*(void **)&buffer[8]);
        }
        unint64_t v54 = *v47;
        if (lldb::SBBlock::GetInlinedName((lldb::SBBlock *)v188))
        {
          InlinedName = (const std::string::value_type *)lldb::SBBlock::GetInlinedName((lldb::SBBlock *)v188);
          std::string::assign((std::string *)(v54 - 72), InlinedName);
        }
        if (lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)&v186)
          && lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)&v186))
        {
          Directory = (const std::string::value_type *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)&v186);
          std::string::assign((std::string *)(v54 - 96), Directory);
          Filename = (const std::string::value_type *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)&v186);
          std::string::assign((std::string *)(v54 - 48), Filename);
          constructFullPath((uint64_t)buffer, v54 - 96, v54 - 48);
          unint64_t v58 = (void **)(v54 - 24);
          if (*(char *)(v54 - 1) < 0) {
            operator delete(*v58);
          }
          *(_OWORD *)unint64_t v58 = *(_OWORD *)buffer;
          *(void *)(v54 - 8) = *(void *)&buffer[16];
        }
        *(_DWORD *)(v54 - 104) = Line;
        int Line = lldb::SBBlock::GetInlinedCallSiteLine((lldb::SBBlock *)v188);
        lldb::SBBlock::GetInlinedCallSiteFile((uint64_t *)buffer, (lldb::SBBlock *)v188);
        lldb::SBFileSpec::operator=();
        lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)buffer);
      }
      lldb::SBLineEntry::GetStartAddress((uint64_t *)v201, (lldb::SBLineEntry *)v192);
      lldb::SBAddress::GetFunction((uint64_t *)buffer, (lldb::SBAddress *)v201);
      uint64_t v68 = lldb::SBFunction::GetName((lldb::SBFunction *)buffer);
      if (v68)
      {
        lldb::SBLineEntry::GetStartAddress(&v184, (lldb::SBLineEntry *)v192);
        lldb::SBAddress::GetFunction(&v185, (lldb::SBAddress *)&v184);
        uint64_t v69 = (char *)lldb::SBFunction::GetName((lldb::SBFunction *)&v185);
      }
      else
      {
        uint64_t v69 = "";
      }
      std::string::basic_string[abi:nn180100]<0>(&__s1, v69);
      if (v68)
      {
        lldb::SBFunction::~SBFunction((lldb::SBFunction *)&v185);
        lldb::SBAddress::~SBAddress((lldb::SBAddress *)&v184);
      }
      lldb::SBFunction::~SBFunction((lldb::SBFunction *)buffer);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)v201);
      unint64_t v79 = retstr->var0.var0;
      uint64_t v80 = (char *)retstr->var0.var0 + 80 * v40;
      unint64_t v83 = *((void *)v80 + 7);
      uint64_t v82 = (unint64_t *)(v80 + 56);
      unint64_t v81 = v83;
      uint64_t v85 = v82 + 1;
      unint64_t v84 = v82[1];
      if (v83 != v84)
      {
        uint64_t v86 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
        if ((__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = __s1.__r_.__value_.__l.__size_;
        }
        unint64_t v88 = v194;
        if ((v194 & 0x80u) != 0) {
          unint64_t v88 = (unint64_t)v193[1];
        }
        if (size != v88) {
          goto LABEL_112;
        }
        if ((v194 & 0x80u) == 0) {
          id v89 = v193;
        }
        else {
          id v89 = (void **)v193[0];
        }
        if ((*((unsigned char *)&__s1.__r_.__value_.__s + 23) & 0x80) != 0)
        {
          if (memcmp(__s1.__r_.__value_.__l.__data_, v89, __s1.__r_.__value_.__l.__size_)) {
            goto LABEL_112;
          }
        }
        else if (*((unsigned char *)&__s1.__r_.__value_.__s + 23))
        {
          p_s1 = &__s1;
          while (p_s1->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v89)
          {
            p_s1 = (std::string *)((char *)p_s1 + 1);
            id v89 = (void **)((char *)v89 + 1);
            if (!--v86) {
              goto LABEL_128;
            }
          }
LABEL_112:
          uint64_t v209 = 0;
          long long __p = 0u;
          memset(v207, 0, sizeof(v207));
          long long v206 = 0u;
          memset(buffer, 0, sizeof(buffer));
          if (v84 >= *((void *)v79 + 10 * v40 + 9))
          {
            unint64_t v95 = std::vector<DebugInfo::BlockInfo>::__push_back_slow_path<DebugInfo::BlockInfo>(v82, (uint64_t)buffer);
            int v96 = SHIBYTE(v209);
            *uint64_t v85 = v95;
            if (v96 < 0) {
              operator delete((void *)__p);
            }
          }
          else
          {
            *(void *)unint64_t v84 = 0;
            long long v91 = *(_OWORD *)&buffer[8];
            *(void *)(v84 + 24) = *(void *)&buffer[24];
            *(_OWORD *)(v84 + 8) = v91;
            memset(&buffer[8], 0, 24);
            uint64_t v92 = v207[0];
            *(_OWORD *)(v84 + 32) = v206;
            *(void *)(v84 + 48) = v92;
            v207[0] = 0;
            long long v206 = 0uLL;
            long long v93 = *(_OWORD *)&v207[1];
            *(void *)(v84 + 72) = v207[3];
            *(_OWORD *)(v84 + 56) = v93;
            memset(&v207[1], 0, 24);
            long long v94 = __p;
            *(void *)(v84 + 96) = v209;
            *(_OWORD *)(v84 + 80) = v94;
            long long __p = 0uLL;
            uint64_t v209 = 0;
            *uint64_t v85 = v84 + 104;
          }
          if (SHIBYTE(v207[3]) < 0) {
            operator delete((void *)v207[1]);
          }
          if (SHIBYTE(v207[0]) < 0) {
            operator delete((void *)v206);
          }
          if (buffer[31] < 0) {
            operator delete(*(void **)&buffer[8]);
          }
          unint64_t v97 = *v85;
          std::string::operator=((std::string *)(*v85 - 72), &__s1);
          if (lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)&v186)
            && lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)&v186))
          {
            char v98 = (const std::string::value_type *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)&v186);
            std::string::assign((std::string *)(v97 - 96), v98);
            unsigned int v99 = (const std::string::value_type *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)&v186);
            std::string::assign((std::string *)(v97 - 48), v99);
            constructFullPath((uint64_t)buffer, v97 - 96, v97 - 48);
            uint64_t v100 = (void **)(v97 - 24);
            if (*(char *)(v97 - 1) < 0) {
              operator delete(*v100);
            }
            *(_OWORD *)uint64_t v100 = *(_OWORD *)buffer;
            *(void *)(v97 - 8) = *(void *)&buffer[16];
          }
          *(_DWORD *)(v97 - 104) = Line;
          unint64_t v81 = *v82;
          unint64_t v84 = *v85;
        }
LABEL_128:
        if (v81 != v84)
        {
          unint64_t v101 = v84 - 104;
          if (v84 - 104 > v81)
          {
            unint64_t v102 = v81 + 104;
            do
            {
              uint64_t v103 = *(void *)(v102 - 104);
              uint64_t v104 = *(void *)(v102 - 96);
              uint64_t v105 = *(void *)(v102 - 88);
              *(void *)&buffer[7] = *(void *)(v102 - 81);
              *(void *)buffer = v105;
              char v106 = *(unsigned char *)(v102 - 73);
              int8x8_t v107 = (void **)(v102 - 72);
              uint64_t v108 = *(void *)(v102 - 72);
              *(void *)(v102 - 96) = 0;
              *(void *)(v102 - 88) = 0;
              uint64_t v109 = *(void *)(v102 - 57);
              *(void *)uint64_t v201 = *(void *)(v102 - 64);
              *(void *)&v201[7] = v109;
              char v169 = *(unsigned char *)(v102 - 49);
              *(void *)(v102 - 64) = 0;
              *(void *)(v102 - 72) = 0;
              double v110 = (void **)(v102 - 48);
              uint64_t v173 = *(void *)(v102 - 48);
              uint64_t v111 = *(void *)(v102 - 40);
              *(void *)&v211[7] = *(void *)(v102 - 33);
              *(void *)long long v211 = v111;
              unint64_t v112 = v102 - 24;
              uint64_t v177 = *(void *)(v102 - 24);
              *(void *)(v102 - 80) = 0;
              *(void *)(v102 - 56) = 0;
              char v171 = *(unsigned char *)(v102 - 25);
              *(void *)(v102 - 40) = 0;
              *(void *)(v102 - 48) = 0;
              uint64_t v113 = *(void *)(v102 - 16);
              *(void *)((char *)v210 + 7) = *(void *)(v102 - 9);
              v210[0] = v113;
              char v175 = *(unsigned char *)(v102 - 1);
              *(void *)(v112 + 8) = 0;
              *(void *)(v112 + 16) = 0;
              *(void *)(v102 - 32) = 0;
              *(void *)unint64_t v112 = 0;
              *(void *)(v102 - 104) = *(void *)v101;
              long long v114 = *(_OWORD *)(v101 + 8);
              *(void *)(v102 - 80) = *(void *)(v101 + 24);
              *(_OWORD *)(v102 - 96) = v114;
              *(unsigned char *)(v101 + 31) = 0;
              *(unsigned char *)(v101 + 8) = 0;
              if (*(char *)(v102 - 49) < 0) {
                operator delete(*v107);
              }
              long long v115 = *(_OWORD *)(v101 + 32);
              *(void *)(v102 - 56) = *(void *)(v101 + 48);
              *(_OWORD *)int8x8_t v107 = v115;
              *(unsigned char *)(v101 + 55) = 0;
              *(unsigned char *)(v101 + 32) = 0;
              if (*(char *)(v102 - 25) < 0) {
                operator delete(*v110);
              }
              long long v116 = *(_OWORD *)(v101 + 56);
              *(void *)(v102 - 32) = *(void *)(v101 + 72);
              *(_OWORD *)double v110 = v116;
              *(unsigned char *)(v101 + 79) = 0;
              *(unsigned char *)(v101 + 56) = 0;
              if (*(char *)(v102 - 1) < 0) {
                operator delete(*(void **)v112);
              }
              long long v117 = *(_OWORD *)(v101 + 80);
              *(void *)(v102 - 8) = *(void *)(v101 + 96);
              *(_OWORD *)unint64_t v112 = v117;
              *(unsigned char *)(v101 + 103) = 0;
              *(unsigned char *)(v101 + 80) = 0;
              *(void *)unint64_t v101 = v103;
              if (*(char *)(v101 + 31) < 0) {
                operator delete(*(void **)(v101 + 8));
              }
              *(void *)(v101 + 8) = v104;
              uint64_t v118 = *(void *)buffer;
              *(void *)(v101 + 23) = *(void *)&buffer[7];
              *(void *)(v101 + 16) = v118;
              *(unsigned char *)(v101 + 31) = v106;
              if (*(char *)(v101 + 55) < 0) {
                operator delete(*(void **)(v101 + 32));
              }
              *(void *)(v101 + 32) = v108;
              uint64_t v119 = *(void *)v201;
              *(void *)(v101 + 47) = *(void *)&v201[7];
              *(void *)(v101 + 40) = v119;
              *(unsigned char *)(v101 + 55) = v169;
              if (*(char *)(v101 + 79) < 0) {
                operator delete(*(void **)(v101 + 56));
              }
              *(void *)(v101 + 56) = v173;
              uint64_t v120 = *(void *)v211;
              *(void *)(v101 + 71) = *(void *)&v211[7];
              *(void *)(v101 + 64) = v120;
              *(unsigned char *)(v101 + 79) = v171;
              unint64_t v40 = v166;
              if (*(char *)(v101 + 103) < 0) {
                operator delete(*(void **)(v101 + 80));
              }
              *(void *)(v101 + 80) = v177;
              uint64_t v121 = v210[0];
              *(void *)(v101 + 95) = *(void *)((char *)v210 + 7);
              *(void *)(v101 + 88) = v121;
              *(unsigned char *)(v101 + 103) = v175;
              v101 -= 104;
              BOOL v122 = v102 >= v101;
              v102 += 104;
            }
            while (!v122);
          }
        }
      }
      if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__s1.__r_.__value_.__l.__data_);
      }
      lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)&v186);
      lldb::SBBlock::~SBBlock((lldb::SBBlock *)&v187);
      lldb::SBBlock::~SBBlock((lldb::SBBlock *)v188);
      retstr = v167;
      unint64_t v59 = v167->var0.var0;
      goto LABEL_150;
    }
    lldb::SBLineEntry::GetFileSpec((uint64_t *)v211, (lldb::SBLineEntry *)v192);
    unint64_t v59 = retstr->var0.var0;
    unint64_t v60 = (char *)retstr->var0.var0 + 80 * v40;
    uint64_t v209 = 0;
    long long __p = 0u;
    memset(v207, 0, sizeof(v207));
    long long v206 = 0u;
    memset(buffer, 0, sizeof(buffer));
    unint64_t v61 = *((void *)v60 + 8);
    unint64_t v62 = *((void *)v60 + 9);
    uint64_t v63 = (unint64_t *)(v60 + 64);
    if (v61 >= v62)
    {
      unint64_t v70 = std::vector<DebugInfo::BlockInfo>::__push_back_slow_path<DebugInfo::BlockInfo>((unint64_t *)v59 + 10 * v40 + 7, (uint64_t)buffer);
      int v71 = SHIBYTE(v209);
      *uint64_t v63 = v70;
      if (v71 < 0) {
        operator delete((void *)__p);
      }
    }
    else
    {
      *(void *)unint64_t v61 = 0;
      long long v64 = *(_OWORD *)&buffer[8];
      *(void *)(v61 + 24) = *(void *)&buffer[24];
      *(_OWORD *)(v61 + 8) = v64;
      memset(&buffer[8], 0, 24);
      uint64_t v65 = v207[0];
      *(_OWORD *)(v61 + 32) = v206;
      *(void *)(v61 + 48) = v65;
      v207[0] = 0;
      long long v206 = 0uLL;
      long long v66 = *(_OWORD *)&v207[1];
      *(void *)(v61 + 72) = v207[3];
      *(_OWORD *)(v61 + 56) = v66;
      memset(&v207[1], 0, 24);
      long long v67 = __p;
      *(void *)(v61 + 96) = v209;
      *(_OWORD *)(v61 + 80) = v67;
      long long __p = 0uLL;
      uint64_t v209 = 0;
      *uint64_t v63 = v61 + 104;
    }
    if (SHIBYTE(v207[3]) < 0) {
      operator delete((void *)v207[1]);
    }
    if (SHIBYTE(v207[0]) < 0) {
      operator delete((void *)v206);
    }
    if (buffer[31] < 0) {
      operator delete(*(void **)&buffer[8]);
    }
    lldb::SBLineEntry::GetStartAddress((uint64_t *)&__s1, (lldb::SBLineEntry *)v192);
    lldb::SBAddress::GetFunction((uint64_t *)buffer, (lldb::SBAddress *)&__s1);
    uint64_t v72 = lldb::SBFunction::GetName((lldb::SBFunction *)buffer);
    if (v72)
    {
      lldb::SBLineEntry::GetStartAddress(&v190, (lldb::SBLineEntry *)v192);
      lldb::SBAddress::GetFunction(&v191, (lldb::SBAddress *)&v190);
      uint64_t v73 = (const std::string::value_type *)lldb::SBFunction::GetName((lldb::SBFunction *)&v191);
    }
    else
    {
      uint64_t v73 = "-";
    }
    std::string::assign((std::string *)(*v63 - 72), v73);
    if (v72)
    {
      lldb::SBFunction::~SBFunction((lldb::SBFunction *)&v191);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)&v190);
    }
    lldb::SBFunction::~SBFunction((lldb::SBFunction *)buffer);
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)&__s1);
    if (lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v211)
      && lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v211))
    {
      unint64_t v74 = (const std::string::value_type *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v211);
      std::string::assign((std::string *)(*v63 - 96), v74);
      uint64_t v75 = (const std::string::value_type *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v211);
      std::string::assign((std::string *)(*v63 - 48), v75);
      uint64_t v76 = (char *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v211);
      std::string::basic_string[abi:nn180100]<0>(&__s1, v76);
      uint64_t v77 = (char *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v211);
      std::string::basic_string[abi:nn180100]<0>(v201, v77);
      constructFullPath((uint64_t)buffer, (uint64_t)&__s1, (uint64_t)v201);
      uint64_t v78 = *v63 - 24;
      if (*(char *)(*v63 - 1) < 0) {
        operator delete(*(void **)v78);
      }
      *(_OWORD *)uint64_t v78 = *(_OWORD *)buffer;
      *(void *)(v78 + 16) = *(void *)&buffer[16];
      if (v202 < 0) {
        operator delete(*(void **)v201);
      }
      if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__s1.__r_.__value_.__l.__data_);
      }
    }
    *(_DWORD *)(*v63 - 104) = lldb::SBLineEntry::GetLine((lldb::SBLineEntry *)v192);
    lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v211);
LABEL_150:
    uint64_t v123 = (char *)v59 + 80 * v40;
    uint64_t v125 = *((void *)v123 + 7);
    unint64_t v124 = (unsigned int **)(v123 + 56);
    constructFullPath((uint64_t)buffer, v125 + 8, v125 + 56);
    unint64_t v126 = (char *)v59 + 80 * v40;
    if (v126[23] < 0) {
      operator delete(*(void **)v126);
    }
    *(_OWORD *)unint64_t v126 = *(_OWORD *)buffer;
    *((void *)v126 + 2) = *(void *)&buffer[16];
    lldb::SBLineEntry::GetStartAddress((uint64_t *)buffer, (lldb::SBLineEntry *)v192);
    unsigned int v127 = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)buffer);
    unsigned int var6 = retstr->var6;
    if (var6 >= v127) {
      unsigned int v129 = v127;
    }
    else {
      unsigned int v129 = retstr->var6;
    }
    *((_DWORD *)v59 + 20 * v40 + 6) = v129;
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)buffer);
    lldb::SBLineEntry::GetEndAddress((uint64_t *)buffer, (lldb::SBLineEntry *)v192);
    unsigned int v130 = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)buffer);
    if (var6 >= v130) {
      unsigned int v131 = v130;
    }
    else {
      unsigned int v131 = var6;
    }
    *((_DWORD *)v59 + 20 * v40 + 7) = v131;
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)buffer);
    unsigned int var3 = **v124;
    if (var3 != -1)
    {
      unsigned int var2 = retstr->var2;
      if (var3 < var2) {
        unsigned int var2 = **v124;
      }
      if (retstr->var3 > var3) {
        unsigned int var3 = retstr->var3;
      }
      retstr->unsigned int var2 = var2;
      retstr->unsigned int var3 = var3;
      if (v166)
      {
        unsigned int v134 = v161;
        double v135 = (void *)((char *)v59 + v160);
        id v170 = v59;
        do
        {
          uint64_t v136 = v134;
          uint64_t v137 = (char *)v59 + 80 * v134;
          unsigned int v139 = *((_DWORD *)v137 + 6);
          unint64_t v138 = v137 + 24;
          if (*((_DWORD *)v135 - 12) < v139)
          {
            long long v140 = *(_OWORD *)(v135 - 9);
            *(void *)&buffer[16] = *(v135 - 7);
            *(_OWORD *)buffer = v140;
            *(v135 - 8) = 0;
            *(v135 - 7) = 0;
            *(v135 - 9) = 0;
            uint64_t v141 = *(v135 - 6);
            *(void *)&buffer[24] = v141;
            uint64_t v142 = (char *)v59 + 80 * v134;
            long long v174 = *(_OWORD *)(v135 - 5);
            long long v206 = v174;
            uint64_t v172 = *(v135 - 3);
            v207[0] = v172;
            *(v135 - 5) = 0;
            *(v135 - 4) = 0;
            *(v135 - 3) = 0;
            long long v178 = *((_OWORD *)v135 - 1);
            *(_OWORD *)&v207[1] = v178;
            uint64_t v176 = *v135;
            v207[3] = *v135;
            *(v135 - 1) = 0;
            void *v135 = 0;
            *(v135 - 2) = 0;
            long long v143 = *(_OWORD *)v142;
            *(v135 - 7) = *((void *)v142 + 2);
            *(_OWORD *)(v135 - 9) = v143;
            v142[23] = 0;
            *uint64_t v142 = 0;
            *(v135 - 6) = *v138;
            std::vector<DebugInfo::LineDisassemblyInfo>::__vdeallocate(v135 - 5);
            *(_OWORD *)(v135 - 5) = *((_OWORD *)v142 + 2);
            *(v135 - 3) = *((void *)v142 + 6);
            *((void *)v142 + 5) = 0;
            *((void *)v142 + 4) = 0;
            *((void *)v142 + 6) = 0;
            std::vector<DebugInfo::BlockInfo>::__vdeallocate((void **)v135 - 2);
            *((_OWORD *)v135 - 1) = *(_OWORD *)(v142 + 56);
            void *v135 = *((void *)v142 + 9);
            *((void *)v142 + 8) = 0;
            *((void *)v142 + 7) = 0;
            *((void *)v142 + 9) = 0;
            if (v142[23] < 0) {
              operator delete(*(void **)v142);
            }
            long long v144 = *(_OWORD *)buffer;
            *((void *)v142 + 2) = *(void *)&buffer[16];
            *(_OWORD *)uint64_t v142 = v144;
            buffer[23] = 0;
            buffer[0] = 0;
            *unint64_t v138 = v141;
            std::vector<DebugInfo::LineDisassemblyInfo>::__vdeallocate((uint64_t *)v142 + 4);
            *((_OWORD *)v142 + 2) = v174;
            *((void *)v142 + 6) = v172;
            long long v206 = 0uLL;
            v207[0] = 0;
            std::vector<DebugInfo::BlockInfo>::__vdeallocate((void **)v142 + 7);
            *(_OWORD *)(v142 + 56) = v178;
            *((void *)v142 + 9) = v176;
            memset(&v207[1], 0, 24);
            __s1.__r_.__value_.__r.__words[0] = (std::string::size_type)&v207[1];
            std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&__s1);
            __s1.__r_.__value_.__r.__words[0] = (std::string::size_type)&v206;
            std::vector<DebugInfo::LineDisassemblyInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&__s1);
            if (buffer[23] < 0) {
              operator delete(*(void **)buffer);
            }
            retstr = v167;
            unint64_t v59 = v170;
          }
          v135 -= 10;
          --v134;
        }
        while (v136);
      }
    }
    lldb::SBLineEntry::~SBLineEntry((lldb::SBLineEntry *)v192);
    unint64_t v40 = v166 + 1;
    v160 += 80;
    ++v161;
  }
  retstr->var4 = retstr->var3 - retstr->var2 + 1;
  id v145 = retstr->var0.var0;
  int64_t v146 = retstr->var0.var1 - retstr->var0.var0;
  if (v146)
  {
    unint64_t v147 = 0;
    unsigned int v148 = 0;
    unint64_t v149 = 0xCCCCCCCCCCCCCCCDLL * (v146 >> 4);
    do
    {
      unsigned int v150 = *((_DWORD *)v145 + 20 * v147 + 7);
      unint64_t v151 = v148 + 1;
      if (v149 > v151)
      {
        int v152 = *((_DWORD *)v145 + 20 * v147 + 6);
        do
        {
          if (v152 != *((_DWORD *)v145 + 20 * v151 + 6)) {
            break;
          }
          if (v150 <= *((_DWORD *)v145 + 20 * v151 + 7)) {
            unsigned int v150 = *((_DWORD *)v145 + 20 * v151 + 7);
          }
          unint64_t v151 = (v151 + 1);
        }
        while (v149 > v151);
      }
      unint64_t v147 = v148;
      if (v148 < v151)
      {
        unint64_t v153 = v151 - (unint64_t)v148;
        BOOL v154 = (unsigned int *)((char *)v145 + 80 * v148 + 28);
        do
        {
          unsigned int *v154 = v150;
          v154 += 20;
          --v153;
        }
        while (v153);
        unint64_t v147 = v151;
        unsigned int v148 = v151;
      }
    }
    while (v149 > v147);
  }
  if ((a6 & 0x80000000) == 0) {
    operator new();
  }
  if ((char)v194 < 0) {
    operator delete(v193[0]);
  }
LABEL_190:
  lldb::SBCompileUnit::~SBCompileUnit((lldb::SBCompileUnit *)&v196);
LABEL_191:
  lldb::SBModule::~SBModule((lldb::SBModule *)v197);
  lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v198);
LABEL_192:
  lldb::SBTarget::~SBTarget((lldb::SBTarget *)v199);
  unsigned int v21 = v158;
LABEL_193:
  lldb::SBDebugger::~SBDebugger((lldb::SBDebugger *)v200);
  GTScopeFunction::~GTScopeFunction((GTScopeFunction *)v204);
LABEL_194:

  id v10 = v156;
  id v12 = v157;
LABEL_195:

LABEL_196:
  return result;
}

- (void)_processBatchIdCounterData:(id)a3
{
  id v79 = a3;
  if (g_runningInCI)
  {
    uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Got %lu partial results", [v79 count]);
    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    uint64_t v6 = __stdoutp;
    id v7 = v5;
    fprintf(v6, "#CI-INFO# %s\n", (const char *)[v7 UTF8String]);
  }
  unint64_t v83 = [(NSMutableDictionary *)self->_payload objectForKeyedSubscript:@"activePerEncoderDrawCallCount"];
  unint64_t v8 = (unint64_t)[v83 count];
  unint64_t v9 = v8;
  uint64_t v78 = self;
  if (v8)
  {
    if (v8 >> 61) {
      abort();
    }
    long long __p = std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v8);
    bzero(__p, 8 * v9);
    unint64_t v10 = 0;
    id v11 = 0;
    do
    {
      *((void *)__p + (void)v11) = v10;
      id v12 = [v83 objectAtIndexedSubscript:v11];
      v10 += [v12 unsignedIntValue];

      ++v11;
    }
    while ((char *)v9 != v11);
  }
  else
  {
    long long __p = 0;
    unint64_t v10 = 0;
  }
  if (g_runningInCI)
  {
    uint8x8_t v13 = +[NSString stringWithFormat:@"Got %lu draw calls in %lu encoders", v10, v9];
    unint64_t v14 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    size_t v15 = __stdoutp;
    id v16 = v14;
    fprintf(v15, "#CI-INFO# %s\n", (const char *)[v16 UTF8String]);
  }
  id v81 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v9];
  id v80 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v9];
  long long v93 = 0;
  long long v94 = 0;
  unint64_t v95 = 0;
  if (v10)
  {
    if (v10 >> 61) {
      abort();
    }
    long long v93 = (char *)operator new(8 * v10);
    unint64_t v95 = &v93[8 * v10];
    bzero(v93, 8 * v10);
    long long v94 = (id *)v95;
    char v90 = (void **)operator new(8 * v10);
    uint64_t v92 = &v90[v10];
    bzero(v90, 8 * v10);
    long long v91 = v92;
  }
  else
  {
    char v90 = 0;
    long long v91 = 0;
    uint64_t v92 = 0;
  }
  id v82 = v79;
  unint64_t v17 = 0;
  uint64_t v86 = 0;
  while (v17 < (unint64_t)[v82 count])
  {
    int64x2_t v18 = [v82 objectAtIndexedSubscript:v17];
    int v19 = [v18 objectForKeyedSubscript:@"derivedCounterDataForBottleneckAnalysis"];
    unint64_t v84 = [v19 objectForKeyedSubscript:@"counters"];

    uint64_t v20 = [v18 objectForKeyedSubscript:@"derivedCounterDataForBottleneckAnalysis"];
    unsigned int v21 = [v20 objectForKeyedSubscript:@"AverageSamples"];

    [v81 setObject:v21 atIndexedSubscript:v17];
    long long v87 = v21;
    if (v17)
    {
      if (([v84 isEqualToArray:v86] & 1) == 0)
      {
        id v22 = +[NSString stringWithFormat:@"Batch counter list has changed between batches from %@ to %@", v86, v84];
        unint64_t v23 = __stdoutp;
        int v24 = g_runningInCI;
        id v88 = v22;
        id v25 = (const char *)[v88 UTF8String];
        unint64_t v26 = "#CI_ERROR# ";
        if (!v24) {
          unint64_t v26 = "";
        }
        fprintf(v23, "%s%s %u: %s\n", v26, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2185, v25);
        id v89 = v88;
        GTMTLReplay_handleError(101, (uint64_t)[v89 UTF8String], "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm", (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2185, 1);
        goto LABEL_38;
      }
    }
    else
    {
      id v27 = v84;

      uint64_t v86 = v27;
    }
    id v89 = [v18 objectForKeyedSubscript:@"BatchInfos"];
    [v80 setObject:atIndexedSubscript:];
    if ([v21 count] == (id)v9 && objc_msgSend(v89, "count") == (id)v9)
    {
      if (v9)
      {
        for (uint64_t i = 0; i != (char *)v9; ++i)
        {
          unint64_t v29 = [v89 objectAtIndexedSubscript:i];
          unsigned int v30 = [v29 unsignedIntValue];

          if (v30 != -1)
          {
            uint64_t v31 = v30;
            unint64_t v32 = *((void *)__p + i) + v30;
            if (v32 >= v10)
            {
              unint64_t v33 = v18;
              unint64_t v34 = v9;
              int v35 = [v83 objectAtIndexedSubscript:i];
              unsigned int v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"drawId %lu > numDraws %lu, drawIndexWithinEncoder %lu (max %d)", v32, v10, v31, [v35 unsignedIntValue]);

              unsigned int v37 = __stdoutp;
              int v38 = g_runningInCI;
              id v39 = v36;
              unint64_t v40 = (const char *)[v39 UTF8String];
              unint64_t v41 = "#CI_ERROR# ";
              if (!v38) {
                unint64_t v41 = "";
              }
              fprintf(v37, "%s%s %u: %s\n", v41, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2208, v40);
              id v42 = v39;
              GTMTLReplay_handleError(101, (uint64_t)[v42 UTF8String], "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm", (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2208, 1);

              unint64_t v32 = v10 - 1;
              unint64_t v9 = v34;
              int64x2_t v18 = v33;
            }
            unsigned int v21 = v87;
            uint64_t v43 = +[NSNumber numberWithUnsignedInteger:v17];
            unint64_t v44 = *(void **)&v93[8 * v32];
            *(void *)&v93[8 * v32] = v43;

            unint64_t v45 = [v87 objectAtIndexedSubscript:i];
            unint64_t v46 = v90[v32];
            v90[v32] = v45;
          }
        }
      }
      char v47 = 1;
      goto LABEL_39;
    }
    long long v48 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Batch has invalid encoder count, encoderCount %lu, averageSamplesByEncoder.count %lu, batchInfos.count %lu", v9, [v21 count], objc_msgSend(v89, "count"));
    uint64_t v49 = __stdoutp;
    int v50 = g_runningInCI;
    id v51 = v48;
    unint64_t v52 = (const char *)[v51 UTF8String];
    int v53 = "#CI_ERROR# ";
    if (!v50) {
      int v53 = "";
    }
    fprintf(v49, "%s%s %u: %s\n", v53, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2194, v52);
    id v54 = v51;
    GTMTLReplay_handleError(101, (uint64_t)[v54 UTF8String], "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm", (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2194, 1);

LABEL_38:
    char v47 = 0;
    unsigned int v21 = v87;
LABEL_39:

    ++v17;
    if ((v47 & 1) == 0) {
      goto LABEL_59;
    }
  }
  id v55 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
  BOOL v56 = (id *)v93;
  if (v93 != (char *)v94)
  {
    do
    {
      unint64_t v57 = (_UNKNOWN **)*v56;
      if (v57) {
        unint64_t v58 = v57;
      }
      else {
        unint64_t v58 = &off_759A20;
      }
      [v55 addObject:v58];

      ++v56;
    }
    while (v56 != v94);
  }
  id v59 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v86, "count"));
  for (unint64_t j = 0; j < (unint64_t)[v86 count]; ++j)
  {
    id v61 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v10];
    if (v10)
    {
      for (uint64_t k = 0; k != v10; ++k)
      {
        uint64_t v63 = v90[k];
        long long v64 = v63;
        if (v63)
        {
          uint64_t v65 = [v63 objectAtIndexedSubscript:j];
          [v61 addObject:v65];
        }
        else
        {
          [v61 addObject:&off_759A38];
        }
      }
    }
    long long v66 = [v86 objectAtIndexedSubscript:j];
    id v67 = [v61 copy];
    [v59 setObject:v67 forKeyedSubscript:v66];
  }
  uint64_t v68 = [(NSMutableDictionary *)v78->_payload objectForKeyedSubscript:@"MetalPluginName"];
  v100[0] = v68;
  v99[0] = @"MetalPluginName";
  v99[1] = @"PerCounterDrawCallData";
  id v69 = [v59 copy];
  v100[1] = v69;
  v99[2] = @"intermediate";
  v97[0] = @"activePerEncoderDrawCount";
  v97[1] = @"drawToBatchId";
  v98[0] = v83;
  v98[1] = v55;
  void v97[2] = @"batchInfoList";
  v97[3] = @"rawBatchResults";
  v98[2] = v80;
  v98[3] = v81;
  v97[4] = @"counters";
  v98[4] = v86;
  unint64_t v70 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:5];
  v100[2] = v70;
  int v71 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:3];

  uint64_t v72 = +[NSJSONSerialization dataWithJSONObject:v71 options:1 error:0];
  if ([v78->_options->var0 length])
  {
    uint64_t v73 = +[NSURL fileURLWithPath:v78->_options->var0];
    unint64_t v74 = [v78->_options->var1 lastPathComponent];
    uint64_t v75 = [v74 stringByDeletingPathExtension];
    uint64_t v76 = [v75 stringByAppendingPathExtension:@"json"];
    uint64_t v77 = +[NSURL fileURLWithPath:v76 isDirectory:0 relativeToURL:v73];
    [v72 writeToURL:v77 atomically:0];
  }
  else
  {
    uint64_t v73 = +[NSURL fileURLWithPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/derivedCountersByDraw.json"];
    [v72 writeToURL:v73 atomically:0];
  }

LABEL_59:
  int v96 = &v90;
  std::vector<objc_object  {objcproto7MTLHeap}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v96);
  char v90 = (void **)&v93;
  std::vector<objc_object  {objcproto7MTLHeap}* {__strong}>::__destroy_vector::operator()[abi:nn180100](&v90);

  if (__p) {
    operator delete(__p);
  }
}

- (void)_processDerivedEncoderCounterData:(id)a3 forDerivedEncoderData:(id)a4 withEffectivePerDrawKickTimes:(id)a5 withShaderInfo:(id)a6
{
  id v10 = a4;
  id v45 = a5;
  id v46 = a6;
  char v47 = v10;
  [a3 setDerivedCountersData:v10];
  id v11 = [v10 objectForKeyedSubscript:@"derivedCounterDataForBottleneckAnalysis"];
  uint64_t v43 = [v11 objectForKeyedSubscript:@"counters"];

  payload = self->_payload;
  long long v48 = self;
  if (payload)
  {
    unint64_t v44 = [(NSMutableDictionary *)payload objectForKeyedSubscript:@"MetalPluginName"];
  }
  else
  {
    unint64_t v44 = 0;
  }
  id v49 = objc_alloc_init((Class)NSMutableDictionary);
  [v49 setObject:v44 forKeyedSubscript:@"MetalPluginName"];
  uint8x8_t v13 = [v10 objectForKeyedSubscript:@"derivedCounterDataForBottleneckAnalysis"];
  unint64_t v14 = [v13 objectForKeyedSubscript:@"AverageSamples"];
  size_t v15 = [(GTShaderProfilerHelper *)self _createPerCounterCommandData:v43 withPerCommandData:v14];
  [v49 setObject:v15 forKeyedSubscript:@"PerCounterEncoderCallData"];

  id v16 = [v10 objectForKeyedSubscript:@"DerivedCounterConfigurationVariables"];
  id v17 = [v16 mutableCopy];
  [v49 setObject:v17 forKeyedSubscript:@"ConfigurationVariables"];

  unint64_t v41 = [(GTShaderProfilerHelper *)self _version];
  if (v41)
  {
    int64x2_t v18 = [v49 objectForKeyedSubscript:@"ConfigurationVariables"];
    [v18 setObject:v41 forKeyedSubscript:@"Version"];
  }
  id v42 = [(GTShaderProfilerHelper *)self _build];
  if (v42)
  {
    int v19 = [v49 objectForKeyedSubscript:@"ConfigurationVariables"];
    [v19 setObject:v42 forKeyedSubscript:@"Build"];
  }
  uint64_t v20 = [(GTShaderProfilerHelper *)self _targetType];
  id v39 = (void *)v20;
  if (v20) {
    [v49 setObject:v20 forKeyedSubscript:@"Target"];
  }
  uint64_t v21 = [(GTShaderProfilerHelper *)self _productType];
  unint64_t v40 = (void *)v21;
  if (v21) {
    [v49 setObject:v21 forKeyedSubscript:@"Product"];
  }
  id v22 = [v10 objectForKeyedSubscript:@"DerivedCounterInfo"];
  unint64_t v23 = [v22 objectForKeyedSubscript:@"DerivedCounterDictionary"];
  int v24 = [v23 objectForKeyedSubscript:@"DerivedCounters"];

  id v25 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v24 count]);
  [v24 allKeys];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v27; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v31 = [v24 objectForKeyedSubscript:v30];
        unint64_t v32 = [v31 objectForKeyedSubscript:@"counters"];
        [v25 setObject:v32 forKeyedSubscript:v30];
      }
      id v27 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v27);
  }

  [v49 setObject:v25 forKeyedSubscript:@"DerivedCounterDependentCounters"];
  if (v45) {
    [v49 setObject:v45 forKeyedSubscript:@"effectivePerDrawKickTimes"];
  }
  if (v46) {
    [v49 setObject:v46 forKeyedSubscript:@"shaderInfo"];
  }
  unint64_t v33 = +[NSJSONSerialization dataWithJSONObject:v49 options:1 error:0];
  if ([v48->_options->var0 length])
  {
    unint64_t v34 = +[NSURL fileURLWithPath:v48->_options->var0];
    int v35 = [v48->_options->var1 lastPathComponent];
    unsigned int v36 = [v35 stringByDeletingPathExtension];
    unsigned int v37 = [v36 stringByAppendingPathExtension:@"json"];
    int v38 = +[NSURL fileURLWithPath:v37 isDirectory:0 relativeToURL:v34];
    [v33 writeToURL:v38 atomically:0];
  }
  else
  {
    unint64_t v34 = +[NSURL fileURLWithPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/derivedCounters.json"];
    [v33 writeToURL:v34 atomically:0];
  }
}

- (id)_build
{
  id v2 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  uint64_t v3 = [v2 objectForKey:@"ProductBuildVersion"];

  return v3;
}

- (id)_version
{
  id v2 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  uint64_t v3 = [v2 objectForKey:@"ProductVersion"];

  return v3;
}

- (id)_productType
{
  size_t v9 = 0;
  *(void *)id v10 = 0x1B00000006;
  int v2 = sysctl(v10, 2u, 0, &v9, 0, 0);
  uint64_t v3 = 0;
  if (v2 != -1 && v9 != 0)
  {
    uint64_t v5 = (char *)&v8 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v9);
    int v6 = sysctl(v10, 2u, v5, &v9, 0, 0);
    uint64_t v3 = 0;
    if (!v6)
    {
      uint64_t v3 = +[NSString stringWithUTF8String:v5];
    }
  }

  return v3;
}

- (id)_targetType
{
  size_t v9 = 0;
  *(void *)id v10 = 0x1A00000006;
  int v2 = sysctl(v10, 2u, 0, &v9, 0, 0);
  uint64_t v3 = 0;
  if (v2 != -1 && v9 != 0)
  {
    uint64_t v5 = (char *)&v8 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v9);
    int v6 = sysctl(v10, 2u, v5, &v9, 0, 0);
    uint64_t v3 = 0;
    if (!v6)
    {
      uint64_t v3 = +[NSString stringWithUTF8String:v5];
    }
  }

  return v3;
}

- (id)_createPerCounterCommandData:(id)a3 withPerCommandData:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = [v19 count];
  for (unint64_t i = 0; i < (unint64_t)[v5 count]; ++i)
  {
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v7];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v19;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (unint64_t j = 0; j != v11; unint64_t j = (char *)j + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          unint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) objectAtIndexedSubscript:i];
          [v9 addObject:v14];
        }
        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    size_t v15 = [v5 objectAtIndexedSubscript:i];
    id v16 = [v9 copy];
    [v6 setObject:v16 forKeyedSubscript:v15];
  }
  id v17 = [v6 copy];

  return v17;
}

- (void)_addBlitTimesToEffectiveKickTimes:(id)a3
{
  id v24 = a3;
  uint64_t v3 = [v24 blitEncoderTimeInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"Blit Encoder Kick Times Nsec"];

  if (v4)
  {
    id v5 = (char *)[v4 count];
    id v6 = [v24 blitEncoderTimeInfo];
    id v7 = [v6 objectForKeyedSubscript:@"Blit Encoder Indices"];

    id v25 = v7;
    if (v5 == [v7 count])
    {
      [v24 effectiveKickTimes];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v31;
        double v11 = 0.0;
        do
        {
          for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v31 != v10) {
              objc_enumerationMutation(v8);
            }
            uint8x8_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v14 = v13;
            id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v27;
              do
              {
                for (unint64_t j = 0; j != v15; unint64_t j = (char *)j + 1)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) doubleValue];
                  double v11 = v11 + v18;
                }
                id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v15);
            }
          }
          id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v9);
      }
      else
      {
        double v11 = 0.0;
      }

      [v24 setShaderProfilingTime:v11];
      if (v5)
      {
        for (uint64_t k = 0; k != v5; ++k)
        {
          long long v20 = [v25 objectAtIndexedSubscript:k];
          unsigned int v21 = [v20 unsignedIntValue];

          long long v22 = [v8 objectAtIndexedSubscript:v21];
          long long v23 = [v4 objectAtIndexedSubscript:k];
          [v22 setArray:v23];
        }
      }
    }
  }
}

- (id)_processHarvestedBinaryData:(id)a3 forStreamedData:(id)a4
{
  id v6 = a3;
  id v44 = a4;
  id v7 = [v44 objectForKeyedSubscript:@"draw call info"];
  id v45 = self;
  id v8 = [(NSMutableDictionary *)self->_payload objectForKeyedSubscript:@"perCommandBufferEncoderCount"];
  [v6 setCommandBufferCount:[v8 count]];

  id v9 = [(NSMutableDictionary *)v45->_payload objectForKeyedSubscript:@"perCommandBufferEncoderCount"];
  [v6 setPerCommandBufferEncoderCount:v9];

  uint64_t v10 = [(NSMutableDictionary *)v45->_payload objectForKeyedSubscript:@"encoderIndexToLabel"];
  [v6 setEncoderIndexToLabelMap:v10];

  objc_storeStrong((id *)&v45->_shaderInfoResult, a4);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v11 = [v6 drawCallInfoList];
  uint64_t v12 = 0;
  id v13 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v48;
    do
    {
      for (unint64_t i = 0; i != v13; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(v11);
        }
        if ([*(id *)(*((void *)&v47 + 1) + 8 * i) pipelineStateId] == (id)-1) {
          ++v12;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v13);
  }

  uint64_t v16 = (char *)[v7 count];
  id v17 = [v6 drawCallInfoList];
  LOBYTE(v16) = &v16[v12] == [v17 count];

  if (v16)
  {
    unsigned int v18 = 0;
    memset(v51, 0, sizeof(v51));
    int v52 = 1065353216;
    while ((unint64_t)[v7 count] > v18)
    {
      id v19 = [v7 objectAtIndexedSubscript:v18];
      long long v20 = [v6 drawCallInfoList];
      unsigned int v21 = [v20 objectAtIndexedSubscript:v18];

      uint64_t v22 = [v19 objectForKeyedSubscript:@"vertex shader key"];
      id v23 = v21[1];
      v21[1] = (id)v22;

      uint64_t v24 = [v19 objectForKeyedSubscript:@"fragment shader key"];
      id v25 = v21[2];
      v21[2] = (id)v24;

      uint64_t v26 = [v19 objectForKeyedSubscript:@"compute kernel key"];
      id v27 = v21[3];
      v21[3] = (id)v26;

      long long v28 = [v19 objectForKeyedSubscript:@"mutiple binary keys"];
      long long v29 = v28;
      if (v28)
      {
        id v30 = [v28 copy];
        objc_storeStrong(v21 + 4, v30);
      }
      else
      {
        id v31 = &__NSArray0__struct;
        id v30 = v21[4];
        v21[4] = &__NSArray0__struct;
      }

      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v51, v18))
      {
        long long v32 = [v6 programPipelineInfoList];
        [v32 objectAtIndexedSubscript:[v21 pipelineStateIndex]];
        long long v33 = (id *)objc_claimAutoreleasedReturnValue();

        objc_storeStrong(v33 + 1, v21[1]);
        objc_storeStrong(v33 + 2, v21[2]);
        objc_storeStrong(v33 + 3, v21[3]);
        objc_storeStrong(v33 + 4, v21[4]);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v51, v18, v18);
      }
      ++v18;
    }
    uint64_t v34 = objc_opt_new();
    int v35 = (void *)v6[30];
    v6[30] = v34;

    uint64_t v36 = objc_opt_new();
    unsigned int v37 = (void *)v6[31];
    v6[31] = v36;

    uint64_t v38 = objc_opt_new();
    id v39 = (void *)v6[32];
    v6[32] = v38;

    uint64_t v40 = objc_opt_new();
    unint64_t v41 = (void *)v6[33];
    v6[33] = v40;

    uint64_t v42 = MetalPluginTarget(v45->_metalPluginName);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke;
    v46[3] = &unk_7453D8;
    v46[4] = v45;
    [(GTShaderProfilerHelper *)v45 _visitAllShaderInfosInResult:v6 usingBlock:v46];
    if ((*((unsigned char *)v45->_options + 16) & 0x40) != 0) {
      [(GTShaderProfilerHelper *)v45 _saveShaderBinariesWith:v6 targetIndex:v42];
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v51);
  }

  return 0;
}

void __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:a2];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke_2;
  v8[3] = &unk_7453B0;
  id v7 = v5;
  id v9 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = [v5 objectForKeyedSubscript:@"binary"];
  [v6 setBinary:v7];

  id v8 = [v5 objectForKeyedSubscript:@"type"];
  [v6 setType:v8];

  id v9 = [v5 objectForKeyedSubscript:@"dylib"];
  [v6 setDylib:v9];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v10];
}

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressMappings:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9
{
  uint64_t v9 = *(void *)&a7;
  id v80 = a3;
  id v77 = a4;
  id v81 = a5;
  id v78 = a6;
  unsigned int v75 = [v78 length];
  id v79 = +[NSString stringWithFormat:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/uscSamplingAddressMappings.txt", v9];
  -[GTShaderProfilerHelper _saveAddressMappings:filename:](self, "_saveAddressMappings:filename:", v81, [v79 UTF8String]);
  memset(v103, 0, sizeof(v103));
  int v104 = 1065353216;
  long long __p = 0;
  unint64_t v101 = 0;
  unint64_t v102 = 0;
  std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, 2 * (void)[v81 count]);
  memset(v98, 0, sizeof(v98));
  int v99 = 1065353216;
  memset(v96, 0, sizeof(v96));
  int v97 = 1065353216;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obunint64_t j = v81;
  id v13 = [obj countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v13)
  {
    uint64_t v83 = *(void *)v93;
    unsigned int v87 = -1;
    unsigned int v88 = 0;
    do
    {
      id v85 = v13;
      for (unint64_t i = 0; i != v85; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v93 != v83) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        uint64_t v16 = [v15 objectForKeyedSubscript:@"encID"];
        unsigned int v17 = [v16 unsignedIntValue];

        unsigned int v91 = v17;
        unsigned int v18 = [v15 objectForKeyedSubscript:@"drawCallIndex"];
        unsigned int v89 = [v18 unsignedIntValue];

        id v19 = [v15 objectForKeyedSubscript:@"mappedAddress"];
        long long v20 = (char *)[v19 unsignedLongLongValue];

        unsigned int v21 = [v15 objectForKeyedSubscript:@"mappedSize"];
        id v22 = [v21 unsignedLongLongValue];

        id v23 = [v15 objectForKeyedSubscript:@"binaryUniqueId"];
        unint64_t v24 = strtoull((const char *)[v23 UTF8String], 0, 16);

        id v25 = [v15 objectForKeyedSubscript:@"encIndex"];
        unsigned int v26 = [v25 unsignedIntValue];

        unsigned int v90 = v26;
        id v27 = [v15 objectForKeyedSubscript:@"type"];
        unsigned __int8 v28 = [(GTShaderProfilerHelper *)self _getLegacyProgramType:v27];

        unint64_t v86 = v24;
        int v29 = (v17 << 8) | 0x62;
        id v30 = &v20[(void)v22];
        id v31 = (char *)v101;
        if ((unint64_t)v101 >= v102)
        {
          long long v33 = (char *)__p;
          unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (unsigned char *)__p) >> 3);
          unint64_t v35 = v34 + 1;
          if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_70;
          }
          if (0x5555555555555556 * ((uint64_t)(v102 - (void)__p) >> 3) > v35) {
            unint64_t v35 = 0x5555555555555556 * ((uint64_t)(v102 - (void)__p) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v102 - (void)__p) >> 3) >= 0x555555555555555) {
            unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v36 = v35;
          }
          if (v36) {
            unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v36);
          }
          else {
            uint64_t v37 = 0;
          }
          uint64_t v38 = (int *)(v36 + 24 * v34);
          int *v38 = v29;
          v38[1] = v89;
          *((void *)v38 + 1) = v20;
          *((void *)v38 + 2) = v30;
          id v39 = (char *)v38;
          if (v31 != v33)
          {
            do
            {
              long long v40 = *(_OWORD *)(v31 - 24);
              *((void *)v39 - 1) = *((void *)v31 - 1);
              *(_OWORD *)(v39 - 24) = v40;
              v39 -= 24;
              v31 -= 24;
            }
            while (v31 != v33);
            id v31 = (char *)__p;
          }
          long long v32 = v38 + 6;
          long long __p = v39;
          unint64_t v101 = v38 + 6;
          unint64_t v102 = v36 + 24 * v37;
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          *unint64_t v101 = v29;
          *((_DWORD *)v31 + 1) = v89;
          long long v32 = (int *)(v31 + 24);
          *((void *)v31 + 1) = v20;
          *((void *)v31 + 2) = v30;
        }
        unint64_t v101 = v32;
        unint64_t v41 = std::__hash_table<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v96, v26, &v90);
        uint64_t v42 = v41;
        uint64_t v43 = v32 - 6;
        id v45 = (int **)v41[4];
        unint64_t v44 = v41[5];
        if ((unint64_t)v45 >= v44)
        {
          uint64_t v47 = v41[3];
          uint64_t v48 = ((uint64_t)v45 - v47) >> 3;
          if ((unint64_t)(v48 + 1) >> 61) {
            abort();
          }
          uint64_t v49 = v44 - v47;
          uint64_t v50 = v49 >> 2;
          if (v49 >> 2 <= (unint64_t)(v48 + 1)) {
            uint64_t v50 = v48 + 1;
          }
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v50;
          }
          if (v51) {
            unint64_t v51 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v51);
          }
          else {
            uint64_t v52 = 0;
          }
          long long v53 = (int **)(v51 + 8 * v48);
          const char *v53 = v43;
          id v46 = v53 + 1;
          id v55 = (char *)v42[3];
          id v54 = (char *)v42[4];
          if (v54 != v55)
          {
            do
            {
              BOOL v56 = (int *)*((void *)v54 - 1);
              v54 -= 8;
              *--long long v53 = v56;
            }
            while (v54 != v55);
            id v54 = (char *)v42[3];
          }
          v42[3] = v53;
          v42[4] = v46;
          v42[5] = v51 + 8 * v52;
          if (v54) {
            operator delete(v54);
          }
        }
        else
        {
          GTShaderProfilerHelper *v45 = v43;
          id v46 = v45 + 1;
        }
        int v57 = (v17 << 8) | 0x63;
        int v58 = v28;
        v42[4] = v46;
        id v59 = (char *)v101;
        if ((unint64_t)v101 >= v102)
        {
          id v61 = (char *)__p;
          unint64_t v62 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (unsigned char *)__p) >> 3);
          unint64_t v63 = v62 + 1;
          if (v62 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_70:
          }
            abort();
          if (0x5555555555555556 * ((uint64_t)(v102 - (void)__p) >> 3) > v63) {
            unint64_t v63 = 0x5555555555555556 * ((uint64_t)(v102 - (void)__p) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v102 - (void)__p) >> 3) >= 0x555555555555555) {
            unint64_t v64 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v64 = v63;
          }
          if (v64) {
            unint64_t v64 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v64);
          }
          else {
            uint64_t v65 = 0;
          }
          long long v66 = (int *)(v64 + 24 * v62);
          *long long v66 = v57;
          v66[1] = v89;
          *((void *)v66 + 1) = v86;
          v66[4] = v58;
          id v67 = (char *)v66;
          if (v59 != v61)
          {
            do
            {
              long long v68 = *(_OWORD *)(v59 - 24);
              *((void *)v67 - 1) = *((void *)v59 - 1);
              *(_OWORD *)(v67 - 24) = v68;
              v67 -= 24;
              v59 -= 24;
            }
            while (v59 != v61);
            id v59 = (char *)__p;
          }
          unint64_t v60 = v66 + 6;
          long long __p = v67;
          unint64_t v102 = v64 + 24 * v65;
          if (v59) {
            operator delete(v59);
          }
        }
        else
        {
          *unint64_t v101 = v57;
          *((_DWORD *)v59 + 1) = v89;
          *((void *)v59 + 1) = v86;
          unint64_t v60 = (int *)(v59 + 24);
          *((_DWORD *)v59 + 4) = v28;
        }
        unint64_t v101 = v60;
        if (v26 >= v87) {
          unsigned int v69 = v87;
        }
        else {
          unsigned int v69 = v26;
        }
        unsigned int v70 = v88;
        if (v26 > v88) {
          unsigned int v70 = v26;
        }
        unsigned int v87 = v69;
        unsigned int v88 = v70;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v103, v17, &v91)+ 5) = v26;
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v98, v26, v26);
      }
      id v13 = [obj countByEnumeratingWithState:&v92 objects:v105 count:16];
    }
    while (v13);

    unsigned int v71 = v87;
    unsigned int v91 = v87;
    do
    {
      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v98, v71))*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)v103, v71, &v91)+ 5) = v71; {
      unsigned int v91 = ++v71;
      }
    }
    while (v71 <= v88);
  }
  else
  {

    unsigned int v87 = -1;
    unsigned int v88 = 0;
  }
  shaderProfilerHelper = self->_shaderProfilerHelper;
  id v73 = v78;
  LODWORD(v74) = v88;
  -[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:](shaderProfilerHelper, "evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:", [v73 bytes], v75 >> 3, v96, a9, a8, v87, v74, v103, v80);
  std::__hash_table<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>>>::~__hash_table((uint64_t)v96);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v98);
  if (__p) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v103);
}

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressData:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9
{
  uint64_t v9 = *(void *)&a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v93 = v15;
  long long v95 = v16;
  unsigned int v17 = (char *)[v93 bytes];
  LODWORD(a6) = [v93 length];
  unsigned int v18 = [v16 length];
  id v19 = +[NSString stringWithFormat:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/uscSamplingAddressRaw.txt", v9];
  unint64_t v20 = a6 / 0x18uLL;
  -[GTShaderProfilerHelper _saveAddressList:size:filename:](self, "_saveAddressList:size:filename:", v17, v20, [v19 UTF8String]);
  long long v106 = 0u;
  long long v107 = 0u;
  int v108 = 1065353216;
  if (a6 >= 0x18)
  {
    unsigned int v21 = 0;
    uint64_t v91 = v18 >> 3;
    uint64_t v22 = v20 <= 1 ? 1 : v20;
    id v23 = v17 + 4;
    uint64_t v24 = 0xFFFFFFFFLL;
    uint64_t v96 = v22;
    do
    {
      if (*v23 == -1)
      {
        unsigned int v25 = *(v23 - 1);
        unsigned int v26 = v25 >> 8;
        if (v25 >> 8 != 0xFFFFFF)
        {
          LODWORD(v100) = v25 >> 8;
          id v27 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v106, v25 >> 8, &v100);
          if (v24 == -1) {
            uint64_t v24 = v26;
          }
          else {
            uint64_t v24 = v24;
          }
          *((_DWORD *)v27 + 5) = v26;
          unsigned int v21 = v26;
        }
      }
      v23 += 6;
      --v22;
    }
    while (v22);
    if (v21 >= v24)
    {
      unsigned int v87 = v21;
      uint64_t v103 = 0;
      int v104 = 0;
      unint64_t v105 = 0;
      long long v100 = 0u;
      long long v101 = 0u;
      float v102 = 0.3;
      id v89 = v14;
      id v90 = v13;
      id v88 = v19;
      unsigned __int8 v28 = [v14 drawCallInfoList];
      id v29 = [v28 count];
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v100, vcvtps_u32_f32((float)(unint64_t)(4 * (void)v29) / v102));

      std::vector<DYMTLShaderProfilerProgramAddress>::reserve((void **)&v103, v20);
      uint64_t v30 = 0;
      unsigned int v31 = v24 - 1;
      long long v97 = 0u;
      long long v98 = 0u;
      float v99 = 1.0;
      uint64_t v32 = v96;
      while (1)
      {
        long long v33 = &v17[24 * v30];
        if ((*(void *)v33 & *((void *)v33 + 1) & *((void *)v33 + 2)) != -1)
        {
          unint64_t v35 = (unsigned int *)(v33 + 4);
          uint64_t v34 = *((unsigned int *)v33 + 1);
          unint64_t v36 = *(unsigned int *)v33;
          if (v34 != -1)
          {
            if ((v36 & 0xFC) == 0) {
              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&v100, (v36 >> 8) | (v34 << 32), (v36 >> 8) | (v34 << 32));
            }
            if (*((void *)&v101 + 1)) {
              unint64_t v37 = (DWORD2(v101) - 1);
            }
            else {
              unint64_t v37 = 0;
            }
            uint64_t v38 = v104;
            if ((unint64_t)v104 >= v105)
            {
              unint64_t v41 = v103;
              unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((v104 - v103) >> 3) + 1;
              if (v42 > 0xAAAAAAAAAAAAAAALL) {
                abort();
              }
              if (0x5555555555555556 * ((uint64_t)(v105 - (void)v103) >> 3) > v42) {
                unint64_t v42 = 0x5555555555555556 * ((uint64_t)(v105 - (void)v103) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v105 - (void)v103) >> 3) >= 0x555555555555555) {
                unint64_t v43 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v43 = v42;
              }
              if (v43) {
                unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v43);
              }
              else {
                uint64_t v44 = 0;
              }
              long long v45 = *(_OWORD *)v33;
              id v46 = (char *)(v43 + 8 * ((v38 - v41) >> 3));
              *((void *)v46 + 2) = *((void *)v33 + 2);
              *(_OWORD *)id v46 = v45;
              uint64_t v47 = v46;
              if (v38 == v41)
              {
                uint64_t v32 = v96;
              }
              else
              {
                uint64_t v32 = v96;
                do
                {
                  long long v48 = *(_OWORD *)(v38 - 24);
                  *((void *)v47 - 1) = *((void *)v38 - 1);
                  *(_OWORD *)(v47 - 24) = v48;
                  v47 -= 24;
                  v38 -= 24;
                }
                while (v38 != v41);
                uint64_t v38 = v103;
              }
              long long v40 = v46 + 24;
              uint64_t v103 = v47;
              unint64_t v105 = v43 + 24 * v44;
              if (v38) {
                operator delete(v38);
              }
            }
            else
            {
              long long v39 = *(_OWORD *)v33;
              *((void *)v104 + 2) = *((void *)v33 + 2);
              *(_OWORD *)uint64_t v38 = v39;
              long long v40 = v38 + 24;
            }
            int v104 = v40;
            *((_DWORD *)v40 - 6) = *(v40 - 24) | (v31 << 8);
            *((_DWORD *)v40 - 5) = v37;
            *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)&v106, *v35, v35)+ 5) = v31;
            uint64_t v49 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(&v106, v31);
            if (v49)
            {
              unint64_t v50 = *((void *)&v106 + 1);
              unint64_t v51 = v49[1];
              uint8x8_t v52 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v106 + 8));
              v52.i16[0] = vaddlv_u8(v52);
              if (v52.u32[0] > 1uLL)
              {
                if (v51 >= *((void *)&v106 + 1)) {
                  v51 %= *((void *)&v106 + 1);
                }
              }
              else
              {
                v51 &= *((void *)&v106 + 1) - 1;
              }
              long long v53 = *(uint64_t **)(v106 + 8 * v51);
              do
              {
                id v54 = v53;
                long long v53 = (uint64_t *)*v53;
              }
              while (v53 != v49);
              if (v54 == (uint64_t *)&v107) {
                goto LABEL_61;
              }
              unint64_t v55 = v54[1];
              if (v52.u32[0] > 1uLL)
              {
                if (v55 >= *((void *)&v106 + 1)) {
                  v55 %= *((void *)&v106 + 1);
                }
              }
              else
              {
                v55 &= *((void *)&v106 + 1) - 1;
              }
              if (v55 != v51)
              {
LABEL_61:
                if (!*v49) {
                  goto LABEL_62;
                }
                unint64_t v56 = *(void *)(*v49 + 8);
                if (v52.u32[0] > 1uLL)
                {
                  if (v56 >= *((void *)&v106 + 1)) {
                    v56 %= *((void *)&v106 + 1);
                  }
                }
                else
                {
                  v56 &= *((void *)&v106 + 1) - 1;
                }
                if (v56 != v51) {
LABEL_62:
                }
                  *(void *)(v106 + 8 * v51) = 0;
              }
              uint64_t v57 = *v49;
              if (*v49)
              {
                unint64_t v58 = *(void *)(v57 + 8);
                if (v52.u32[0] > 1uLL)
                {
                  if (v58 >= v50) {
                    v58 %= v50;
                  }
                }
                else
                {
                  v58 &= v50 - 1;
                }
                if (v58 != v51)
                {
                  *(void *)(v106 + 8 * v58) = v54;
                  uint64_t v57 = *v49;
                }
              }
              *id v54 = v57;
              --*((void *)&v107 + 1);
              operator delete(v49);
            }
            unint64_t v59 = *((void *)&v97 + 1);
            if (*((void *)&v97 + 1))
            {
              uint8x8_t v60 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v97 + 8));
              v60.i16[0] = vaddlv_u8(v60);
              if (v60.u32[0] > 1uLL)
              {
                unint64_t v37 = v31;
                if (*((void *)&v97 + 1) <= (unint64_t)v31) {
                  unint64_t v37 = (unint64_t)v31 % *((void *)&v97 + 1);
                }
              }
              else
              {
                unint64_t v37 = (DWORD2(v97) - 1) & v31;
              }
              id v61 = *(void ***)(v97 + 8 * v37);
              if (v61)
              {
                unint64_t v62 = *v61;
                if (*v61)
                {
                  do
                  {
                    unint64_t v63 = v62[1];
                    if (v63 == v31)
                    {
                      if (*((_DWORD *)v62 + 4) == v31) {
                        goto LABEL_109;
                      }
                    }
                    else
                    {
                      if (v60.u32[0] > 1uLL)
                      {
                        if (v63 >= *((void *)&v97 + 1)) {
                          v63 %= *((void *)&v97 + 1);
                        }
                      }
                      else
                      {
                        v63 &= *((void *)&v97 + 1) - 1;
                      }
                      if (v63 != v37) {
                        break;
                      }
                    }
                    unint64_t v62 = (void *)*v62;
                  }
                  while (v62);
                }
              }
            }
            unint64_t v62 = operator new(0x30uLL);
            *unint64_t v62 = 0;
            v62[1] = v31;
            *((_DWORD *)v62 + 4) = v31;
            void v62[4] = 0;
            v62[5] = 0;
            v62[3] = 0;
            float v64 = (float)(unint64_t)(*((void *)&v98 + 1) + 1);
            if (!v59 || (float)(v99 * (float)v59) < v64)
            {
              BOOL v65 = (v59 & (v59 - 1)) != 0;
              if (v59 < 3) {
                BOOL v65 = 1;
              }
              unint64_t v66 = v65 | (2 * v59);
              unint64_t v67 = vcvtps_u32_f32(v64 / v99);
              if (v66 <= v67) {
                size_t v68 = v67;
              }
              else {
                size_t v68 = v66;
              }
              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v97, v68);
              unint64_t v59 = *((void *)&v97 + 1);
              if ((*((void *)&v97 + 1) & (*((void *)&v97 + 1) - 1)) != 0)
              {
                if (*((void *)&v97 + 1) <= (unint64_t)v31) {
                  unint64_t v37 = (unint64_t)v31 % *((void *)&v97 + 1);
                }
                else {
                  unint64_t v37 = v31;
                }
              }
              else
              {
                unint64_t v37 = (DWORD2(v97) - 1) & v31;
              }
            }
            uint64_t v69 = v97;
            unsigned int v70 = *(void **)(v97 + 8 * v37);
            if (v70)
            {
              *unint64_t v62 = *v70;
              goto LABEL_107;
            }
            *unint64_t v62 = v98;
            *(void *)&long long v98 = v62;
            *(void *)(v69 + 8 * v37) = &v98;
            if (*v62)
            {
              unint64_t v71 = *(void *)(*v62 + 8);
              if ((v59 & (v59 - 1)) != 0)
              {
                if (v71 >= v59) {
                  v71 %= v59;
                }
              }
              else
              {
                v71 &= v59 - 1;
              }
              unsigned int v70 = (void *)(v97 + 8 * v71);
LABEL_107:
              void *v70 = v62;
            }
            ++*((void *)&v98 + 1);
LABEL_109:
            uint64_t v72 = v104 - 24;
            uint64_t v74 = (char **)v62[4];
            unint64_t v73 = v62[5];
            if ((unint64_t)v74 >= v73)
            {
              uint64_t v76 = v62[3];
              uint64_t v77 = ((uint64_t)v74 - v76) >> 3;
              if ((unint64_t)(v77 + 1) >> 61) {
                abort();
              }
              uint64_t v78 = v73 - v76;
              uint64_t v79 = v78 >> 2;
              if (v78 >> 2 <= (unint64_t)(v77 + 1)) {
                uint64_t v79 = v77 + 1;
              }
              if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v80 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v80 = v79;
              }
              if (v80) {
                unint64_t v80 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v80);
              }
              else {
                uint64_t v81 = 0;
              }
              id v82 = (char **)(v80 + 8 * v77);
              unint64_t *v82 = v72;
              unsigned int v75 = v82 + 1;
              unint64_t v84 = (char *)v62[3];
              uint64_t v83 = (char *)v62[4];
              if (v83 != v84)
              {
                do
                {
                  id v85 = (char *)*((void *)v83 - 1);
                  v83 -= 8;
                  *--id v82 = v85;
                }
                while (v83 != v84);
                uint64_t v83 = (char *)v62[3];
              }
              v62[3] = v82;
              void v62[4] = v75;
              v62[5] = v80 + 8 * v81;
              if (v83) {
                operator delete(v83);
              }
            }
            else
            {
              *uint64_t v74 = v72;
              unsigned int v75 = v74 + 1;
            }
            void v62[4] = v75;
            goto LABEL_126;
          }
          if (v36 < 0xFFFFFF00) {
            ++v31;
          }
        }
LABEL_126:
        if (++v30 == v32)
        {
          id v13 = v90;
          LODWORD(v86) = v87;
          -[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:](self->_shaderProfilerHelper, "evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:", [v95 bytes], v91, &v97, a9, a8, v24, v86, &v106, v90);
          std::__hash_table<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>>>::~__hash_table((uint64_t)&v97);
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v100);
          id v19 = v88;
          id v14 = v89;
          if (v103) {
            operator delete(v103);
          }
          break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v106);
}

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  int v7 = MetalPluginTarget(self->_metalPluginName);
  id v8 = [v32 objectForKeyedSubscript:@"usc sampling address data"];
  uint64_t v9 = [v32 objectForKeyedSubscript:@"usc sampling sample data"];
  id v10 = (void *)v9;
  if (v8)
  {
    if (v9)
    {
      double v11 = [v6 drawCallInfoList];
      id v12 = [v11 count];

      if (v12)
      {
        id v13 = [v32 objectForKeyedSubscript:@"frame index"];
        id v14 = [v13 unsignedIntValue];

        id v15 = [v32 objectForKeyedSubscript:@"ring buffer"];
        id v16 = [v15 unsignedIntValue];

        LODWORD(v15) = [v10 length];
        id v29 = v16;
        id v30 = v14;
        id v31 = +[NSString stringWithFormat:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/uscSamplingSampleRaw.txt", v14, v16];
        unsigned int v17 = +[NSFileManager defaultManager];
        unsigned int v18 = [v31 stringByDeletingLastPathComponent];
        [v17 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:0];

        id v19 = v10;
        id v20 = [v19 bytes];
        id v21 = v31;
        -[GTShaderProfilerHelper _saveSampleDataFromGPURawCounters:size:filename:](self, "_saveSampleDataFromGPURawCounters:size:filename:", v20, v15 >> 3, [v21 UTF8String]);
        uint64_t v22 = [v32 objectForKeyedSubscript:@"usc sampling address mappings"];
        if (g_runningInCI)
        {
          int v28 = v7;
          id v23 = [NSString stringWithFormat:@"In _preProcessStreamingUSCSampleData, sample data %lu bytes, address data %lu bytes, address mappings %lu", [v19 length], [v8 length], [v22 count]];
          uint64_t v24 = [v23 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

          unsigned int v25 = __stdoutp;
          id v26 = v24;
          fprintf(v25, "#CI-INFO# %s\n", (const char *)[v26 UTF8String]);

          int v7 = v28;
        }
        LODWORD(v27) = v7;
        if ([(GTShaderProfilerHelper *)self _shouldUseProgramAddressMappings:v22]) {
          [(GTShaderProfilerHelper *)self _preProcessStreamingUSCSampleData:v32 result:v6 withAddressMappings:v22 sampleData:v19 frameIndex:v30 ringBufferIdx:v29 targetIndex:v27];
        }
        else {
          [(GTShaderProfilerHelper *)self _preProcessStreamingUSCSampleData:v32 result:v6 withAddressData:v8 sampleData:v19 frameIndex:v30 ringBufferIdx:v29 targetIndex:v27];
        }
      }
    }
  }
}

- (void)_calculatePerSampleActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5
{
  id v8 = a3;
  id v198 = a4;
  id v189 = a5;
  unsigned __int8 v194 = v8;
  uint64_t v9 = [v8 objectForKeyedSubscript:@"ring buffer"];
  LODWORD(a4) = [v9 unsignedIntValue];

  uint64_t v195 = [v189 mGPUTimelineInfoAtIndex:a4];
  id v10 = [v8 objectForKeyedSubscript:@"limiter data"];
  [v195 setDerivedCounters:v10];

  double v11 = [v8 objectForKeyedSubscript:@"limiter time stamps"];
  [v195 setTimestamps:v11];

  id v12 = [v195 timestamps];
  [v195 setNumPeriodicSamples:[v12 length] >> 3];

  id v13 = [v8 objectForKeyedSubscript:@"limiter counter list"];
  [v195 setDerivedCounterNames:v13];

  uint64_t v190 = [v8 objectForKeyedSubscript:@"shader timeline data"];
  [v8 objectForKeyedSubscript:@"shader timeline data ex"];
  memset(v218, 0, sizeof(v218));
  v188 = int v219 = 1050253722;
  [(GTShaderProfilerHelper *)self _updateShaderTimelineInfo:v190 withShaderTimelineDataEx:v188 forGPUTimelineInfo:v195 withEncoderGlobalTraceIdToStateMirrorIdMapping:v218];
  std::vector<std::vector<DYGPUTimelinePipelineStateInfo>>::vector(&v216, [v195 numPeriodicSamples]);
  id v14 = 0;
  unint64_t v15 = 0;
  *(_OWORD *)long long __p = 0u;
  long long v214 = 0u;
  float v215 = 1.0;
  uint64_t v16 = -1;
  while (1)
  {
    unsigned int v17 = [v198 drawCallInfoList];
    BOOL v18 = v15 < (unint64_t)[v17 count];

    if (!v18) {
      break;
    }
    id v19 = [v198 drawCallInfoList];
    id v20 = [v19 objectAtIndexedSubscript:v15];

    if ((id)v16 != [v20 encoderFunctionIndex])
    {
      uint64_t v16 = (uint64_t)[v20 encoderFunctionIndex];
      id v14 = 0;
    }
    id v21 = [v20 encoderFunctionIndex];
    uint64_t v22 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]((uint64_t)__p[0], (unint64_t)__p[1], (unint64_t)v21);
    if (v22) {
      goto LABEL_79;
    }
    unint64_t v23 = (unint64_t)[v20 encoderFunctionIndex];
    unint64_t v24 = v23;
    uint64_t v211 = 0;
    long long v209 = 0u;
    long long v210 = 0u;
    *(_OWORD *)v208 = 0u;
    int v212 = 1050253722;
    unint64_t v25 = (unint64_t)__p[1];
    if (__p[1])
    {
      uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v26.i16[0] = vaddlv_u8(v26);
      if (v26.u32[0] > 1uLL)
      {
        unint64_t v5 = v23;
        if ((void *)v23 >= __p[1]) {
          unint64_t v5 = v23 % (unint64_t)__p[1];
        }
      }
      else
      {
        unint64_t v5 = ((unint64_t)__p[1] - 1) & v23;
      }
      uint64_t v27 = (void *)*((void *)__p[0] + v5);
      if (v27)
      {
        uint64_t v22 = (void *)*v27;
        if (*v27)
        {
          do
          {
            unint64_t v28 = v22[1];
            if (v28 == v23)
            {
              if (v22[2] == v23) {
                goto LABEL_77;
              }
            }
            else
            {
              if (v26.u32[0] > 1uLL)
              {
                if ((void *)v28 >= __p[1]) {
                  v28 %= (unint64_t)__p[1];
                }
              }
              else
              {
                v28 &= (unint64_t)__p[1] - 1;
              }
              if (v28 != v5) {
                break;
              }
            }
            uint64_t v22 = (void *)*v22;
          }
          while (v22);
        }
      }
    }
    id v29 = operator new(0x58uLL);
    *(void *)&long long v201 = v29;
    *((void *)&v201 + 1) = &v214;
    void *v29 = 0;
    v29[1] = v24;
    v29[2] = v24;
    v29[3] = 0;
    v29[4] = 0;
    v29[5] = 0;
    *(_OWORD *)v208 = 0u;
    long long v209 = 0u;
    v29[6] = 0;
    v29[7] = 0;
    v29[8] = 0;
    v29[9] = 0;
    *((_DWORD *)v29 + 20) = 1050253722;
    LOBYTE(v202) = 1;
    float v30 = (float)(unint64_t)(*((void *)&v214 + 1) + 1);
    if (!v25 || (float)(v215 * (float)v25) < v30)
    {
      BOOL v31 = (v25 & (v25 - 1)) == 0;
      if (v25 < 3) {
        BOOL v31 = 0;
      }
      unint64_t v32 = (2 * v25) | !v31;
      unint64_t v33 = vcvtps_u32_f32(v30 / v215);
      if (v32 <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      else {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        unint64_t v25 = (unint64_t)__p[1];
      }
      if (*(void *)&prime <= v25)
      {
        if (*(void *)&prime < v25)
        {
          unint64_t v41 = vcvtps_u32_f32((float)*((unint64_t *)&v214 + 1) / v215);
          if (v25 < 3 || (uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v25), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
          {
            unint64_t v41 = std::__next_prime(v41);
          }
          else
          {
            uint64_t v43 = 1 << -(char)__clz(v41 - 1);
            if (v41 >= 2) {
              unint64_t v41 = v43;
            }
          }
          if (*(void *)&prime <= v41) {
            int8x8_t prime = (int8x8_t)v41;
          }
          if (*(void *)&prime >= v25)
          {
            unint64_t v25 = (unint64_t)__p[1];
          }
          else
          {
            if (prime) {
              goto LABEL_34;
            }
            uint64_t v49 = __p[0];
            __p[0] = 0;
            if (v49) {
              operator delete(v49);
            }
            unint64_t v25 = 0;
            __p[1] = 0;
          }
        }
      }
      else
      {
LABEL_34:
        if (*(void *)&prime >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        unint64_t v35 = operator new(8 * *(void *)&prime);
        unint64_t v36 = __p[0];
        __p[0] = v35;
        if (v36) {
          operator delete(v36);
        }
        uint64_t v37 = 0;
        __p[1] = (void *)prime;
        do
          *((void *)__p[0] + v37++) = 0;
        while (*(void *)&prime != v37);
        uint64_t v38 = (void **)v214;
        if ((void)v214)
        {
          unint64_t v39 = *(void *)(v214 + 8);
          uint8x8_t v40 = (uint8x8_t)vcnt_s8(prime);
          v40.i16[0] = vaddlv_u8(v40);
          if (v40.u32[0] > 1uLL)
          {
            if (v39 >= *(void *)&prime) {
              v39 %= *(void *)&prime;
            }
          }
          else
          {
            v39 &= *(void *)&prime - 1;
          }
          *((void *)__p[0] + v39) = &v214;
          for (i = *v38; i; unint64_t v39 = v45)
          {
            unint64_t v45 = i[1];
            if (v40.u32[0] > 1uLL)
            {
              if (v45 >= *(void *)&prime) {
                v45 %= *(void *)&prime;
              }
            }
            else
            {
              v45 &= *(void *)&prime - 1;
            }
            if (v45 != v39)
            {
              if (!*((void *)__p[0] + v45))
              {
                *((void *)__p[0] + v45) = v38;
                goto LABEL_59;
              }
              char *v38 = (void *)*i;
              void *i = **((void **)__p[0] + v45);
              **((void **)__p[0] + v45) = i;
              unint64_t i = v38;
            }
            unint64_t v45 = v39;
LABEL_59:
            uint64_t v38 = (void **)i;
            unint64_t i = (void *)*i;
          }
        }
        unint64_t v25 = (unint64_t)prime;
      }
      if ((v25 & (v25 - 1)) != 0)
      {
        if (v24 >= v25) {
          unint64_t v5 = v24 % v25;
        }
        else {
          unint64_t v5 = v24;
        }
      }
      else
      {
        unint64_t v5 = (v25 - 1) & v24;
      }
    }
    id v46 = (void *)*((void *)__p[0] + v5);
    if (v46)
    {
      *(void *)long long v201 = *v46;
      *id v46 = v201;
    }
    else
    {
      *(void *)long long v201 = v214;
      *(void *)&long long v214 = v201;
      *((void *)__p[0] + v5) = &v214;
      if (*(void *)v201)
      {
        unint64_t v47 = *(void *)(*(void *)v201 + 8);
        if ((v25 & (v25 - 1)) != 0)
        {
          if (v47 >= v25) {
            v47 %= v25;
          }
        }
        else
        {
          v47 &= v25 - 1;
        }
        *((void *)__p[0] + v47) = v201;
      }
    }
    uint64_t v22 = (void *)v201;
    *(void *)&long long v201 = 0;
    ++*((void *)&v214 + 1);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>>>>::~unique_ptr[abi:nn180100]((uint64_t)&v201);
LABEL_77:
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v209 + 8);
    if (v208[0])
    {
      v208[1] = v208[0];
      operator delete(v208[0]);
    }
LABEL_79:
    id v48 = [v20 pipelineStateId];
    v208[0] = v14;
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)(v22 + 6), (unint64_t)v14, v208)[3] = v48;

    ++v15;
    ++v14;
  }
  id v193 = [v194 objectForKeyedSubscript:@"usc sampling address data"];
  v192 = [v194 objectForKeyedSubscript:@"usc sampling sample data"];
  uint64_t v191 = [v194 objectForKeyedSubscript:@"usc sampling address mappings"];
  unsigned __int8 v50 = -[GTShaderProfilerHelper _shouldUseProgramAddressMappings:](self, "_shouldUseProgramAddressMappings:");
  if (g_runningInCI)
  {
    unint64_t v51 = +[NSString stringWithFormat:@"In _calculatePerSampleActiveShaders, sample data %lu bytes, address data %lu bytes, address mappings %lu" [v192 length], [v193 length], [v191 count]];
    uint8x8_t v52 = [v51 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    long long v53 = __stdoutp;
    id v54 = v52;
    fprintf(v53, "#CI-INFO# %s\n", (const char *)[v54 UTF8String]);
  }
  if (v193)
  {
    if (v192)
    {
      unint64_t v55 = [v198 drawCallInfoList];
      BOOL v56 = [v55 count] == 0;

      if (!v56)
      {
        id v57 = v193;
        unint64_t v58 = (char *)[v57 bytes];
        unsigned int v59 = [v57 length];
        id v185 = +[NSString stringWithFormat:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/1/uscSamplingAddressRaw.txt"];
        uint8x8_t v60 = +[NSFileManager defaultManager];
        id v61 = [v185 stringByDeletingLastPathComponent];
        [v60 createDirectoryAtPath:v61 withIntermediateDirectories:1 attributes:0 error:0];

        id v187 = v185;
        unsigned int v62 = v59 / 0x18;
        -[GTShaderProfilerHelper _saveAddressList:size:filename:](self, "_saveAddressList:size:filename:", v58, v59 / 0x18uLL, [v187 UTF8String]);
        unint64_t v63 = [v187 stringByDeletingLastPathComponent];
        float v64 = +[NSString stringWithFormat:@"%@/uscSamplingAddressMapRaw.txt", v63];

        id v184 = v64;
        -[GTShaderProfilerHelper _saveAddressMappings:filename:](self, "_saveAddressMappings:filename:", v191, [v184 UTF8String]);
        if (v50)
        {
          long long v206 = 0u;
          long long v207 = 0u;
          long long v204 = 0u;
          long long v205 = 0u;
          obunint64_t j = v191;
          id v65 = [obj countByEnumeratingWithState:&v204 objects:v220 count:16];
          if (v65)
          {
            uint64_t v66 = *(void *)v205;
            do
            {
              for (unint64_t j = 0; j != v65; unint64_t j = (char *)j + 1)
              {
                if (*(void *)v205 != v66) {
                  objc_enumerationMutation(obj);
                }
                size_t v68 = *(void **)(*((void *)&v204 + 1) + 8 * (void)j);
                uint64_t v69 = [v68 objectForKeyedSubscript:@"encID"];
                unsigned int v70 = [v69 unsignedIntValue];

                unint64_t v71 = [v68 objectForKeyedSubscript:@"drawCallIndex"];
                unsigned int v72 = [v71 unsignedIntValue];

                unint64_t v73 = [v68 objectForKeyedSubscript:@"mappedAddress"];
                unsigned int v74 = [v73 unsignedLongLongValue];

                unsigned int v75 = [v68 objectForKeyedSubscript:@"mappedSize"];
                unsigned int v76 = [v75 unsignedLongLongValue];

                uint64_t v77 = [v68 objectForKeyedSubscript:@"type"];
                unsigned int v78 = [(GTShaderProfilerHelper *)self _getLegacyProgramType:v77];
                unsigned int v79 = v78;
                if (v78 < 4 || v78 - 100 <= 1)
                {
                  unint64_t v80 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned long long>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned long long>>>::find<unsigned int>(*(uint64_t *)&v218[0], *((unint64_t *)&v218[0] + 1), v70);
                  if (v80)
                  {
                    unint64_t v81 = v80[3];
                    id v82 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]((uint64_t)__p[0], (unint64_t)__p[1], v81);
                    if (v82)
                    {
                      uint64_t v83 = v82;
                      if (v79 <= 3)
                      {
                        v208[0] = (void *)v72;
                        unint64_t v81 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)(v82 + 6), v72, v208)[3];
                      }
                      unsigned int v84 = v76 + v74;
                      uint64_t v86 = (unsigned int *)v83[4];
                      unint64_t v85 = v83[5];
                      if ((unint64_t)v86 >= v85)
                      {
                        id v88 = (unsigned int *)v83[3];
                        uint64_t v89 = ((char *)v86 - (char *)v88) >> 4;
                        unint64_t v90 = v89 + 1;
                        if ((unint64_t)(v89 + 1) >> 60) {
                          abort();
                        }
                        uint64_t v91 = v85 - (void)v88;
                        if (v91 >> 3 > v90) {
                          unint64_t v90 = v91 >> 3;
                        }
                        BOOL v92 = (unint64_t)v91 >= 0x7FFFFFFFFFFFFFF0;
                        unint64_t v93 = 0xFFFFFFFFFFFFFFFLL;
                        if (!v92) {
                          unint64_t v93 = v90;
                        }
                        if (v93)
                        {
                          unint64_t v93 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v93);
                          id v88 = (unsigned int *)v83[3];
                          uint64_t v86 = (unsigned int *)v83[4];
                        }
                        else
                        {
                          uint64_t v94 = 0;
                        }
                        long long v95 = (unsigned int *)(v93 + 16 * v89);
                        unsigned int *v95 = v74;
                        v95[1] = v84;
                        v95[2] = v81;
                        v95[3] = v79;
                        uint64_t v96 = v95;
                        if (v86 != v88)
                        {
                          do
                          {
                            *((_OWORD *)v96 - 1) = *((_OWORD *)v86 - 1);
                            v96 -= 4;
                            v86 -= 4;
                          }
                          while (v86 != v88);
                          id v88 = (unsigned int *)v83[3];
                        }
                        unsigned int v87 = v95 + 4;
                        v83[3] = v96;
                        v83[4] = v95 + 4;
                        v83[5] = v93 + 16 * v94;
                        if (v88) {
                          operator delete(v88);
                        }
                      }
                      else
                      {
                        *uint64_t v86 = v74;
                        v86[1] = v84;
                        unsigned int v87 = v86 + 4;
                        v86[2] = v81;
                        v86[3] = v79;
                      }
                      v83[4] = v87;
                    }
                  }
                }
              }
              id v65 = [obj countByEnumeratingWithState:&v204 objects:v220 count:16];
            }
            while (v65);
          }
        }
        else if (v59 >= 0x18)
        {
          uint64_t v97 = 0;
          if (v62 <= 1) {
            uint64_t v98 = 1;
          }
          else {
            uint64_t v98 = v62;
          }
          do
          {
            float v99 = &v58[24 * v97];
            if ((*(void *)v99 & *((void *)v99 + 1) & *((void *)v99 + 2)) != -1)
            {
              unsigned int v100 = *((_DWORD *)v99 + 1);
              if (v100 != -1)
              {
                unint64_t v101 = *(unsigned int *)v99;
                if ((v101 & 0xFC) == 0 || (*(_DWORD *)v99 & 0xFE) == 0x64)
                {
                  float v102 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned long long>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned long long>>>::find<unsigned int>(*(uint64_t *)&v218[0], *((unint64_t *)&v218[0] + 1), v100);
                  if (v102)
                  {
                    unint64_t v103 = v102[3];
                    int v104 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]((uint64_t)__p[0], (unint64_t)__p[1], v103);
                    if (v104)
                    {
                      unint64_t v105 = v104;
                      if ((v101 & 0xFC) == 0)
                      {
                        v208[0] = (void *)(v101 >> 8);
                        unint64_t v103 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)(v104 + 6), v101 >> 8, v208)[3];
                        LOBYTE(v101) = *v99;
                      }
                      long long v106 = (int64x2_t *)&v58[24 * v97 + 8];
                      __int32 v107 = v101;
                      uint64_t v109 = (int32x2_t *)v105[4];
                      unint64_t v108 = v105[5];
                      if ((unint64_t)v109 >= v108)
                      {
                        uint64_t v111 = (int32x2_t *)v105[3];
                        uint64_t v112 = ((char *)v109 - (char *)v111) >> 4;
                        unint64_t v113 = v112 + 1;
                        if ((unint64_t)(v112 + 1) >> 60) {
                          abort();
                        }
                        uint64_t v114 = v108 - (void)v111;
                        if (v114 >> 3 > v113) {
                          unint64_t v113 = v114 >> 3;
                        }
                        if ((unint64_t)v114 >= 0x7FFFFFFFFFFFFFF0) {
                          unint64_t v115 = 0xFFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v115 = v113;
                        }
                        if (v115)
                        {
                          unint64_t v115 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v115);
                          uint64_t v111 = (int32x2_t *)v105[3];
                          uint64_t v109 = (int32x2_t *)v105[4];
                        }
                        else
                        {
                          uint64_t v116 = 0;
                        }
                        long long v117 = (int32x2_t *)(v115 + 16 * v112);
                        *long long v117 = vmovn_s64(*v106);
                        v117[1].i32[0] = v103;
                        v117[1].i32[1] = v107;
                        uint64_t v118 = v117;
                        if (v109 != v111)
                        {
                          do
                          {
                            *(_OWORD *)v118[-2].i8 = *(_OWORD *)v109[-2].i8;
                            v118 -= 2;
                            v109 -= 2;
                          }
                          while (v109 != v111);
                          uint64_t v111 = (int32x2_t *)v105[3];
                        }
                        double v110 = v117 + 2;
                        v105[3] = v118;
                        v105[4] = v117 + 2;
                        v105[5] = v115 + 16 * v116;
                        if (v111) {
                          operator delete(v111);
                        }
                      }
                      else
                      {
                        *uint64_t v109 = vmovn_s64(*v106);
                        v109[1].i32[0] = v103;
                        v109[1].i32[1] = v101;
                        double v110 = v109 + 2;
                      }
                      v105[4] = v110;
                    }
                  }
                }
              }
            }
            ++v97;
          }
          while (v97 != v98);
        }
        for (uint64_t k = (void *)v214; k; uint64_t k = (void *)*k)
        {
          uint64_t v120 = k[3];
          uint64_t v121 = (char *)k[4];
          unint64_t v122 = 126 - 2 * __clz((uint64_t)&v121[-v120] >> 4);
          if (v121 == (char *)v120) {
            uint64_t v123 = 0;
          }
          else {
            uint64_t v123 = v122;
          }
          std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned int,unsigned int,unsigned int,unsigned int> *,false>(v120, v121, v123, 1);
        }
        unsigned int v124 = [v192 length];
        uint64_t v125 = (char *)[v192 bytes];
        *(_OWORD *)v208 = 0u;
        long long v209 = 0u;
        LODWORD(v210) = 1050253722;
        long long v201 = 0u;
        long long v202 = 0u;
        int v203 = 1050253722;
        if (v124 >= 8)
        {
          unsigned int v127 = v125;
          unsigned int v128 = 0;
          unsigned int v126 = 0;
          unsigned int v129 = v124 >> 3;
          LODWORD(v186) = -1;
          unsigned int v182 = v124 >> 3;
          size_t v183 = v125;
          do
          {
            unsigned int v130 = &v127[8 * v128];
            unint64_t v131 = *(void *)v130;
            if (*(void *)v130 != -1)
            {
              double v132 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned long long>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned long long>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned long long>>>::find<unsigned int>(*(uint64_t *)&v218[0], *((unint64_t *)&v218[0] + 1), *(void *)v130);
              if (v132)
              {
                uint64_t v133 = v132;
                unsigned int v134 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]((uint64_t)__p[0], (unint64_t)__p[1], v132[3]);
                if (v134)
                {
                  double v135 = v134;
                  if (v134[3] != v134[4])
                  {
                    uint64_t v200 = v133;
                    unint64_t v136 = v131;
                    if (v186 != v131 >> 39)
                    {
                      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(&v201);
                      unint64_t v136 = *(void *)v130;
                      uint64_t v186 = *(void *)v130 >> 39;
                    }
                    if ((v136 & 0x7F00000000) != 0)
                    {
                      unint64_t v137 = 0;
                      do
                      {
                        unint64_t v138 = 0;
                        uint64_t v139 = (uint64_t)&v130[32 * v137 + 8];
                        do
                        {
                          if (*(_DWORD *)(v139 + 4 * v138))
                          {
                            ++v138;
                            std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v208, *(_DWORD *)(v139 + 4 * v138), *(_DWORD *)(v139 + 4 * v138));
                          }
                          BOOL v92 = v138++ >= 7;
                        }
                        while (!v92);
                        ++v137;
                      }
                      while (v137 < (*((_DWORD *)v130 + 1) & 0x7Fu));
                    }
                    id obja = (id)v131;
                    long long v140 = (uint64_t *)v209;
                    for (uint64_t m = v200; v140; v140 = (uint64_t *)*v140)
                    {
                      unsigned int v142 = *((_DWORD *)v140 + 4);
                      long long v143 = (_DWORD *)v135[3];
                      uint64_t v144 = v135[4] - (void)v143;
                      if (v144)
                      {
                        unint64_t v145 = v144 >> 4;
                        int64_t v146 = (_DWORD *)v135[3];
                        do
                        {
                          unint64_t v147 = v145 >> 1;
                          unsigned int v148 = &v146[4 * (v145 >> 1)];
                          if (v142 >= *v148)
                          {
                            if (*v148 >= v142 && v148[1] == -1 && v148[2] == -1)
                            {
                              unint64_t v147 = v145 + ~v147;
                              int64_t v146 = v148 + 4;
                            }
                            else
                            {
                              int64_t v146 = v148 + 4;
                              unint64_t v147 = v145 + ~v147;
                            }
                          }
                          unint64_t v145 = v147;
                        }
                        while (v147);
                      }
                      else
                      {
                        int64_t v146 = (_DWORD *)v135[3];
                      }
                      if (v143 == v146) {
                        uint64_t v149 = 0;
                      }
                      else {
                        uint64_t v149 = -1;
                      }
                      unsigned int v150 = &v146[4 * v149];
                      if (v142 >= *v150 && v142 <= v150[1])
                      {
                        unint64_t v152 = v150[2] & 0x3FFFFFFF | ((m[3] & 0x3FFFFFFF) << 30) | ((unint64_t)v150[3] << 60);
                        if (std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(&v201, v152))
                        {
                          uint64_t m = v200;
                        }
                        else
                        {
                          unsigned int v153 = v126;
                          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)&v201, v152, v152);
                          BOOL v154 = (void **)&v216[3 * (*(void *)v130 >> 39)];
                          BOOL v155 = v154 + 1;
                          id v156 = (unint64_t *)v154[1];
                          unint64_t v157 = (unint64_t)v154[2];
                          if ((unint64_t)v156 >= v157)
                          {
                            uint64_t v160 = ((char *)v156 - (unsigned char *)*v154) >> 3;
                            if ((unint64_t)(v160 + 1) >> 61) {
                              abort();
                            }
                            uint64_t v161 = v157 - (void)*v154;
                            uint64_t v162 = v161 >> 2;
                            if (v161 >> 2 <= (unint64_t)(v160 + 1)) {
                              uint64_t v162 = v160 + 1;
                            }
                            if ((unint64_t)v161 >= 0x7FFFFFFFFFFFFFF8) {
                              unint64_t v163 = 0x1FFFFFFFFFFFFFFFLL;
                            }
                            else {
                              unint64_t v163 = v162;
                            }
                            if (v163) {
                              unint64_t v163 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v163);
                            }
                            else {
                              uint64_t v164 = 0;
                            }
                            double v165 = (unint64_t *)(v163 + 8 * v160);
                            *double v165 = v152;
                            uint64_t v158 = v165 + 1;
                            unint64_t v166 = (char *)*v155;
                            int v167 = (char *)*v154;
                            if (*v155 == *v154)
                            {
                              uint64_t m = v200;
                            }
                            else
                            {
                              uint64_t m = v200;
                              do
                              {
                                unint64_t v168 = *((void *)v166 - 1);
                                v166 -= 8;
                                *--double v165 = v168;
                              }
                              while (v166 != v167);
                              unint64_t v166 = (char *)*v154;
                            }
                            unsigned int *v154 = v165;
                            *BOOL v155 = v158;
                            v154[2] = (void *)(v163 + 8 * v164);
                            if (v166) {
                              operator delete(v166);
                            }
                            unsigned int v159 = v153;
                          }
                          else
                          {
                            *id v156 = v152;
                            uint64_t v158 = v156 + 1;
                            unsigned int v159 = v153;
                            uint64_t m = v200;
                          }
                          *BOOL v155 = v158;
                          unsigned int v126 = v159 + 1;
                        }
                      }
                    }
                    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(v208);
                    unsigned int v129 = v182;
                    unsigned int v127 = v183;
                    unint64_t v131 = (unint64_t)obja;
                  }
                }
              }
            }
            v128 += ((v131 >> 30) & 0x1FC) + 1;
          }
          while (v128 < v129);
        }
        else
        {
          unsigned int v126 = 0;
        }
        unsigned int v169 = [v195 numPeriodicSamples];
        if (v169)
        {
          size_t v170 = 8 * v169;
          char v171 = (char *)operator new(v170);
          bzero(v171, v170);
          uint64_t v172 = &v171[v170];
        }
        else
        {
          char v171 = 0;
          uint64_t v172 = 0;
        }
        uint64_t v173 = +[NSMutableData dataWithCapacity:8 * v126];
        long long v174 = v216;
        char v175 = v217;
        if (v216 != v217)
        {
          unsigned int v176 = 0;
          int v177 = 0;
          do
          {
            uint64_t v178 = v176;
            *(_DWORD *)&v171[8 * v176 + 4] = v177;
            uint64_t v179 = v174[1];
            if (*v174 != v179)
            {
              *(_DWORD *)&v171[8 * v178] = (unint64_t)(v179 - *v174) >> 3;
              [v173 appendBytes:length:];
              v177 += (v174[1] - *v174) >> 3;
            }
            unsigned int v176 = v178 + 1;
            v174 += 3;
          }
          while (v174 != v175);
        }
        [v195 setActiveShadersPerPeriodicSample:v173];
        uint64_t v180 = objc_opt_new();
        [v195 setActiveCoreInfoMasksPerPeriodicSample:v180];

        size_t v181 = +[NSMutableData dataWithBytes:v171 length:v172 - v171];
        [v195 setNumActiveShadersPerPeriodicSample:v181];

        if (v171) {
          operator delete(v171);
        }
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v201);
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v208);
      }
    }
  }

  std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::~unordered_map[abi:nn180100]((uint64_t)__p);
  v208[0] = &v216;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)v208);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v218);
}

- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:(unint64_t)a2 forWorkloadInfo:(unint64_t)a3
{
  if (!a2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a3;
    if (a3 >= a2) {
      unint64_t v4 = a3 % a2;
    }
  }
  else
  {
    unint64_t v4 = (a2 - 1) & a3;
  }
  unint64_t v5 = *(void **)(a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  double result = (void *)*v5;
  if (*v5)
  {
    do
    {
      unint64_t v7 = result[1];
      if (v7 == a3)
      {
        if (result[2] == a3) {
          return result;
        }
      }
      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= a2) {
            v7 %= a2;
          }
        }
        else
        {
          v7 &= a2 - 1;
        }
        if (v7 != v4) {
          return 0;
        }
      }
      double result = (void *)*result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint8x8_t v3 = (void *)*v2;
      std::allocator_traits<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>>>::destroy[abi:nn180100]<std::pair<unsigned long long const,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void,void>((uint64_t)(v2 + 2));
      operator delete(v2);
      int v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:
{
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(a1 + 32);
  int v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

- (void)_updateShaderTimelineInfo:(id)a3 withShaderTimelineDataEx:(id)a4 forGPUTimelineInfo:(id)a5 withEncoderGlobalTraceIdToStateMirrorIdMapping:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v50 = a5;
  id v51 = v9;
  uint8x8_t v52 = [v51 bytes];
  id v11 = v10;
  id v12 = [v11 bytes];
  unint64_t v13 = (unint64_t)[v51 length];
  id v14 = +[NSMutableData dataWithLength:24 * (v13 / 0x18)];
  [v50 setEncoderTimelineInfos:v14];
  uint64_t v49 = v11;

  int8x8_t prime = [v50 encoderTimelineInfos];
  BufferView<DYGPUTimelineEncoderTimelineInfo>::BufferView(v53, *(void **)&prime);

  if (v13 < 0x18) {
    goto LABEL_2;
  }
  uint64_t v16 = 0;
  if (v13 / 0x18 <= 1) {
    unint64_t v17 = 1;
  }
  else {
    unint64_t v17 = v13 / 0x18;
  }
  BOOL v18 = (char *)a6 + 16;
  do
  {
    uint64_t v19 = v53[0] + 24 * v16;
    id v20 = &v52[24 * v16];
    *(void *)uint64_t v19 = v12[3 * v16];
    *(void *)(v19 + 8) = *(void *)(v20 + 12);
    *(_DWORD *)(v19 + 16) = *((_DWORD *)v20 + 1);
    unsigned int v21 = *(_DWORD *)(v19 + 20) & 0xFFFFFF00 | (*(_DWORD *)v20 >> 1) & 7;
    *(_DWORD *)(v19 + 20) = v21;
    *(_DWORD *)(v19 + 20) = ((*(_DWORD *)v20 & 1) << 16) | (unsigned __int16)v21;
    uint64_t v22 = v12[3 * v16];
    unint64_t v23 = *((unsigned int *)v20 + 5);
    unint64_t v24 = *((void *)a6 + 1);
    if (v24)
    {
      uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
      v25.i16[0] = vaddlv_u8(v25);
      if (v25.u32[0] > 1uLL)
      {
        int8x8_t prime = (int8x8_t)*((unsigned int *)v20 + 5);
        if (v24 <= v23) {
          int8x8_t prime = (int8x8_t)(v23 % v24);
        }
      }
      else
      {
        int8x8_t prime = (int8x8_t)((v24 - 1) & v23);
      }
      uint8x8_t v26 = *(void ***)(*(void *)a6 + 8 * *(void *)&prime);
      if (v26)
      {
        uint64_t v27 = *v26;
        if (*v26)
        {
          do
          {
            unint64_t v28 = v27[1];
            if (v28 == v23)
            {
              if (*((_DWORD *)v27 + 4) == v23) {
                goto LABEL_79;
              }
            }
            else
            {
              if (v25.u32[0] > 1uLL)
              {
                if (v28 >= v24) {
                  v28 %= v24;
                }
              }
              else
              {
                v28 &= v24 - 1;
              }
              if (v28 != *(void *)&prime) {
                break;
              }
            }
            uint64_t v27 = (void *)*v27;
          }
          while (v27);
        }
      }
    }
    uint64_t v27 = operator new(0x20uLL);
    *uint64_t v27 = 0;
    v27[1] = v23;
    *((_DWORD *)v27 + 4) = v23;
    v27[3] = 0;
    float v29 = (float)(unint64_t)(*((void *)a6 + 3) + 1);
    float v30 = *((float *)a6 + 8);
    if (v24 && (float)(v30 * (float)v24) >= v29)
    {
      unint64_t v23 = (unint64_t)prime;
      goto LABEL_69;
    }
    BOOL v31 = (v24 & (v24 - 1)) != 0;
    if (v24 < 3) {
      BOOL v31 = 1;
    }
    unint64_t v32 = v31 | (2 * v24);
    unint64_t v33 = vcvtps_u32_f32(v29 / v30);
    if (v32 <= v33) {
      int8x8_t prime = (int8x8_t)v33;
    }
    else {
      int8x8_t prime = (int8x8_t)v32;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v24 = *((void *)a6 + 1);
    }
    if (*(void *)&prime <= v24)
    {
      if (*(void *)&prime >= v24) {
        goto LABEL_65;
      }
      unint64_t v40 = vcvtps_u32_f32((float)*((unint64_t *)a6 + 3) / *((float *)a6 + 8));
      if (v24 < 3 || (uint8x8_t v41 = (uint8x8_t)vcnt_s8((int8x8_t)v24), v41.i16[0] = vaddlv_u8(v41), v41.u32[0] > 1uLL))
      {
        unint64_t v40 = std::__next_prime(v40);
      }
      else
      {
        uint64_t v42 = 1 << -(char)__clz(v40 - 1);
        if (v40 >= 2) {
          unint64_t v40 = v42;
        }
      }
      if (*(void *)&prime <= v40) {
        int8x8_t prime = (int8x8_t)v40;
      }
      if (*(void *)&prime >= v24)
      {
        unint64_t v24 = *((void *)a6 + 1);
        goto LABEL_65;
      }
      if (!*(void *)&prime)
      {
        id v48 = *(void **)a6;
        *(void *)a6 = 0;
        if (v48) {
          operator delete(v48);
        }
        unint64_t v24 = 0;
        *((void *)a6 + 1) = 0;
        goto LABEL_65;
      }
    }
    if (*(void *)&prime >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v34 = operator new(8 * *(void *)&prime);
    unint64_t v35 = *(void **)a6;
    *(void *)a6 = v34;
    if (v35) {
      operator delete(v35);
    }
    uint64_t v36 = 0;
    *((int8x8_t *)a6 + 1) = prime;
    do
      *(void *)(*(void *)a6 + 8 * v36++) = 0;
    while (*(void *)&prime != v36);
    uint64_t v37 = (void *)*v18;
    if (*v18)
    {
      unint64_t v38 = v37[1];
      uint8x8_t v39 = (uint8x8_t)vcnt_s8(prime);
      v39.i16[0] = vaddlv_u8(v39);
      if (v39.u32[0] > 1uLL)
      {
        if (v38 >= *(void *)&prime) {
          v38 %= *(void *)&prime;
        }
      }
      else
      {
        v38 &= *(void *)&prime - 1;
      }
      *(void *)(*(void *)a6 + 8 * v38) = v18;
      uint64_t v43 = (void *)*v37;
      if (*v37)
      {
        do
        {
          unint64_t v44 = v43[1];
          if (v39.u32[0] > 1uLL)
          {
            if (v44 >= *(void *)&prime) {
              v44 %= *(void *)&prime;
            }
          }
          else
          {
            v44 &= *(void *)&prime - 1;
          }
          if (v44 != v38)
          {
            if (!*(void *)(*(void *)a6 + 8 * v44))
            {
              *(void *)(*(void *)a6 + 8 * v44) = v37;
              goto LABEL_61;
            }
            void *v37 = *v43;
            void *v43 = **(void **)(*(void *)a6 + 8 * v44);
            **(void **)(*(void *)a6 + 8 * v44) = v43;
            uint64_t v43 = v37;
          }
          unint64_t v44 = v38;
LABEL_61:
          uint64_t v37 = v43;
          uint64_t v43 = (void *)*v43;
          unint64_t v38 = v44;
        }
        while (v43);
      }
    }
    unint64_t v24 = (unint64_t)prime;
LABEL_65:
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v24 <= v23) {
        v23 %= v24;
      }
    }
    else
    {
      unint64_t v23 = (v24 - 1) & v23;
    }
LABEL_69:
    unint64_t v45 = *(void **)a6;
    id v46 = *(void **)(*(void *)a6 + 8 * v23);
    if (v46)
    {
      *uint64_t v27 = *v46;
LABEL_77:
      *id v46 = v27;
      goto LABEL_78;
    }
    *uint64_t v27 = *v18;
    *BOOL v18 = v27;
    v45[v23] = v18;
    if (*v27)
    {
      unint64_t v47 = *(void *)(*v27 + 8);
      if ((v24 & (v24 - 1)) != 0)
      {
        if (v47 >= v24) {
          v47 %= v24;
        }
      }
      else
      {
        v47 &= v24 - 1;
      }
      id v46 = (void *)(*(void *)a6 + 8 * v47);
      goto LABEL_77;
    }
LABEL_78:
    ++*((void *)a6 + 3);
LABEL_79:
    v27[3] = v22;
    ++v16;
  }
  while (v16 != v17);
LABEL_2:
}

- (void)_calculatePerSampleAggregatedActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5
{
  id v7 = a3;
  id v139 = a4;
  id v150 = a5;
  uint64_t v141 = v7;
  unint64_t v147 = [v150 aggregatedGPUTimelineInfo];
  id v8 = [v7 objectForKeyedSubscript:@"aggregated derived counters"];
  [v147 setDerivedCounters:v8];

  id v9 = [v7 objectForKeyedSubscript:@"sampled timestamps"];
  [v147 setTimestamps:v9];

  id v10 = [v147 timestamps];
  objc_msgSend(v147, "setNumPeriodicSamples:", objc_msgSend(v10, "length") >> 3);

  id v11 = [v150 mGPUTimelineInfos];
  id v12 = [v11 firstObject];
  unint64_t v13 = [v12 derivedCounterNames];
  id v14 = [v13 copy];
  [v147 setDerivedCounterNames:v14];

  unint64_t v15 = [v150 mGPUTimelineInfos];
  uint64_t v16 = [v15 firstObject];
  unint64_t v17 = [v16 encoderTimelineInfos];
  [v147 setEncoderTimelineInfos:v17];

  BOOL v18 = [v147 timestamps];
  BufferView<unsigned long long>::BufferView(v168, v18);

  uint64_t v19 = [v147 encoderTimelineInfos];
  BufferView<DYGPUTimelineEncoderTimelineInfo>::BufferView(&v166, v19);

  if (v167)
  {
    uint64_t v20 = 0;
    LODWORD(j) = 0;
    for (i = 0; i < v167; uint64_t v20 = ++i)
    {
      uint64_t v23 = v166;
      unint64_t v24 = (void *)(v166 + 24 * v20 + 8);
      for (unint64_t j = j; j < [v147 numPeriodicSamples]; ++j)
      {
        if (*(void *)(v168[0] + 8 * j) >= *v24)
        {
          *(_DWORD *)(v23 + 24 * v20 + 16) = j;
          break;
        }
      }
    }
  }
  uint8x8_t v25 = [v141 objectForKeyedSubscript:@"ring buffer sampled counter data"];
  [v150 setPerRingSampledDerivedCounters:v25];

  uint8x8_t v26 = [v141 objectForKeyedSubscript:@"core counts"];
  [v150 setCoreCounts:v26];

  uint64_t v27 = [v141 objectForKeyedSubscript:@"Restore Timestamps"];
  long long v140 = (void *)v27;
  if (v27) {
    [v150 setRestoreTimestamps:v27];
  }
  unint64_t v28 = [v141 objectForKeyedSubscript:@"ring buffer blend factors"];
  unint64_t v163 = 0;
  uint64_t v164 = 0;
  unint64_t v165 = 0;
  std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&v163, (unint64_t)[v28 count]);
  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  obunint64_t j = v28;
  id v29 = [obj countByEnumeratingWithState:&v159 objects:v169 count:16 v28];
  if (v29)
  {
    uint64_t v30 = *(void *)v160;
    do
    {
      for (uint64_t k = 0; k != v29; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v160 != v30) {
          objc_enumerationMutation(obj);
        }
        unint64_t v32 = *(void **)(*((void *)&v159 + 1) + 8 * (void)k);
        if ((unint64_t)v164 >= v165)
        {
          unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((v164 - (unsigned char *)v163) >> 3);
          unint64_t v35 = v34 + 1;
          if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
            abort();
          }
          if (0x5555555555555556 * ((uint64_t)(v165 - (void)v163) >> 3) > v35) {
            unint64_t v35 = 0x5555555555555556 * ((uint64_t)(v165 - (void)v163) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v165 - (void)v163) >> 3) >= 0x555555555555555) {
            unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v36 = v35;
          }
          if (v36)
          {
            uint64_t v37 = std::__allocate_at_least[abi:nn180100]<std::allocator<AccelerationStructureViewer::FilterToken>>(v36);
            uint64_t v39 = v38;
          }
          else
          {
            uint64_t v37 = 0;
            uint64_t v39 = 0;
          }
          unint64_t v40 = (char *)BufferView<double>::BufferView(&v37[3 * v34], v32);
          uint64_t v42 = v163;
          uint8x8_t v41 = v164;
          uint64_t v43 = v40;
          if (v164 != v163)
          {
            do
            {
              long long v44 = *(_OWORD *)(v41 - 3);
              *((void *)v43 - 1) = *(v41 - 1);
              *(_OWORD *)(v43 - 24) = v44;
              v43 -= 24;
              v41 -= 3;
            }
            while (v41 != v42);
            uint8x8_t v41 = v163;
          }
          unint64_t v45 = (char *)&v37[3 * v39];
          unint64_t v33 = v40 + 24;
          unint64_t v163 = v43;
          unint64_t v165 = (unint64_t)v45;
          if (v41) {
            operator delete(v41);
          }
        }
        else
        {
          unint64_t v33 = (char *)(BufferView<double>::BufferView(v164, *(void **)(*((void *)&v159 + 1) + 8 * (void)k)) + 3);
        }
        uint64_t v164 = v33;
      }
      id v29 = [obj countByEnumeratingWithState:&v159 objects:v169 count:16];
    }
    while (v29);
  }

  unsigned int v46 = [v147 numPeriodicSamples];
  id v156 = 0;
  unint64_t v157 = 0;
  uint64_t v158 = 0;
  if (v46)
  {
    unsigned int v47 = v46;
    size_t v48 = 24 * v46;
    id v156 = (char *)operator new(v48);
    uint64_t v158 = &v156[24 * v47];
    size_t v49 = 24 * ((v48 - 24) / 0x18) + 24;
    bzero(v156, v49);
    unint64_t v157 = &v156[v49];
  }
  std::vector<std::vector<DYGPUTimelinePipelineStateInfo>>::vector(&v154, [v147 numPeriodicSamples]);
  unsigned int v50 = [v147 numPeriodicSamples];
  if (v50)
  {
    size_t v51 = 8 * v50;
    uint8x8_t v52 = (char *)operator new(v51);
    bzero(v52, v51);
    unint64_t v138 = &v52[v51];
  }
  else
  {
    unint64_t v138 = 0;
    uint8x8_t v52 = 0;
  }
  unint64_t v53 = 0;
  unsigned int v145 = 0;
  long long v151 = 0u;
  *(_OWORD *)long long __p = 0u;
  long long v143 = v164;
  uint64_t v149 = (char *)v163;
  int v153 = 1050253722;
  if ((unint64_t)((v164 - (unsigned char *)v163) / 24) <= 1) {
    int64_t v54 = 1;
  }
  else {
    int64_t v54 = (v164 - (unsigned char *)v163) / 24;
  }
  int64_t v148 = v54;
  while (v53 < [v147 numPeriodicSamples])
  {
    if (v143 != v149)
    {
      uint64_t v55 = 0;
      do
      {
        double v56 = *(double *)(*(void *)&v149[24 * v55] + 8 * v53);
        id v57 = [v150 mGPUTimelineInfos];
        unint64_t v58 = [v57 objectAtIndexedSubscript:v55];
        id v59 = [v58 activeShadersPerPeriodicSample];
        uint8x8_t v60 = (char *)[v59 bytes];
        [v59 length];

        id v61 = [v150 mGPUTimelineInfos];
        unsigned int v62 = [v61 objectAtIndexedSubscript:v55];
        id v63 = [v62 numActiveShadersPerPeriodicSample];
        float v64 = [v63 bytes];
        [v63 length];

        uint64_t v65 = (v56 + 2.22044605e-16);
        uint64_t v66 = &v64[2 * v65];
        if (*v66)
        {
          unsigned int v67 = 0;
          do
          {
            size_t v68 = (unint64_t *)&v60[8 * v67 + 8 * v64[2 * v65 + 1]];
            uint64_t v69 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v151, *v68, v68);
            v69[3] |= 1 << v55;
            ++v67;
          }
          while (v67 < *v66);
        }
        uint64_t v70 = (ceil(v56 + -2.22044605e-16) + 2.22044605e-16);
        if (v70 != v65)
        {
          unint64_t v71 = &v64[2 * v70];
          if (*v71)
          {
            unsigned int v72 = 0;
            unint64_t v73 = &v64[2 * v70 + 1];
            do
            {
              unsigned int v74 = (unint64_t *)&v60[8 * v72 + 8 * *v73];
              unsigned int v75 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v151, *v74, v74);
              v75[3] |= 1 << v55;
              ++v72;
            }
            while (v72 < *v71);
          }
        }
        ++v55;
      }
      while (v55 != v148);
    }
    unint64_t v76 = (unint64_t)__p[1];
    uint64_t v77 = &v52[8 * v53];
    unsigned int v78 = v145;
    *(_DWORD *)uint64_t v77 = __p[1];
    *((_DWORD *)v77 + 1) = v145;
    unsigned int v79 = (void *)(v154 + 24 * v53);
    unint64_t v81 = (char **)(v79 + 1);
    unint64_t v80 = (char *)v79[1];
    id v82 = (char *)*v79;
    unint64_t v83 = (uint64_t)&v80[-*v79] >> 3;
    int v144 = v76;
    if (v76 <= v83)
    {
      if (v76 >= v83) {
        goto LABEL_71;
      }
      unsigned int v100 = &v82[8 * v76];
      goto LABEL_70;
    }
    unint64_t v84 = v76 - v83;
    uint64_t v85 = v154 + 24 * v53;
    uint64_t v88 = *(void *)(v85 + 16);
    unsigned int v87 = (void *)(v85 + 16);
    uint64_t v86 = v88;
    if (v76 - v83 <= (v88 - (uint64_t)v80) >> 3)
    {
      bzero(v80, 8 * v84);
      unsigned int v100 = &v80[8 * v84];
LABEL_70:
      *unint64_t v81 = v100;
      goto LABEL_71;
    }
    if (v76 >> 61) {
      goto LABEL_113;
    }
    uint64_t v89 = v86 - (void)v82;
    uint64_t v90 = v89 >> 2;
    if (v89 >> 2 <= v76) {
      uint64_t v90 = v76;
    }
    if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v91 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v91 = v90;
    }
    BOOL v92 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<NSString * {__strong}>>(v91);
    uint64_t v142 = v93;
    uint64_t v94 = v92;
    long long v95 = &v92[8 * v83];
    bzero(v95, 8 * v84);
    uint64_t v96 = *v81;
    uint64_t v97 = (char *)*v79;
    uint64_t v98 = v95;
    if (*v81 != (char *)*v79)
    {
      do
      {
        uint64_t v99 = *((void *)v96 - 1);
        v96 -= 8;
        *((void *)v98 - 1) = v99;
        v98 -= 8;
      }
      while (v96 != v97);
      uint64_t v96 = (char *)*v79;
    }
    *unsigned int v79 = v98;
    *unint64_t v81 = &v95[8 * v84];
    void *v87 = &v94[8 * v142];
    unsigned int v78 = v145;
    if (v96) {
      operator delete(v96);
    }
LABEL_71:
    unint64_t v101 = &v156[24 * v53];
    uint64_t v102 = (uint64_t)__p[1];
    int v104 = (char **)(v101 + 8);
    unint64_t v103 = (char *)*((void *)v101 + 1);
    unint64_t v105 = *(char **)v101;
    unint64_t v106 = (uint64_t)&v103[-*(void *)v101] >> 3;
    if (__p[1] <= (void *)v106)
    {
      if (__p[1] >= (void *)v106) {
        goto LABEL_89;
      }
      uint64_t v120 = &v105[8 * (uint64_t)__p[1]];
      goto LABEL_88;
    }
    __int32 v107 = (char *)__p[1] - v106;
    unint64_t v108 = &v156[24 * v53];
    uint64_t v111 = *((void *)v108 + 2);
    double v110 = v108 + 16;
    uint64_t v109 = v111;
    if ((char *)__p[1] - v106 <= (void *)((v111 - (uint64_t)v103) >> 3))
    {
      bzero(v103, 8 * (void)v107);
      uint64_t v120 = &v103[8 * (void)v107];
LABEL_88:
      *int v104 = v120;
      goto LABEL_89;
    }
    if ((unint64_t)__p[1] >> 61) {
LABEL_113:
    }
      abort();
    uint64_t v112 = v109 - (void)v105;
    if ((void *)(v112 >> 2) > __p[1]) {
      uint64_t v102 = v112 >> 2;
    }
    if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v113 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v113 = v102;
    }
    if (v113 >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v114 = (char *)operator new(8 * v113);
    unint64_t v115 = &v114[8 * v106];
    bzero(v115, 8 * (void)v107);
    uint64_t v116 = *v104;
    long long v117 = *(char **)v101;
    uint64_t v118 = v115;
    if (*v104 != *(char **)v101)
    {
      do
      {
        uint64_t v119 = *((void *)v116 - 1);
        v116 -= 8;
        *((void *)v118 - 1) = v119;
        v118 -= 8;
      }
      while (v116 != v117);
      uint64_t v116 = *(char **)v101;
    }
    *(void *)unint64_t v101 = v118;
    *int v104 = &v115[8 * (void)v107];
    *double v110 = &v114[8 * v113];
    unsigned int v78 = v145;
    if (v116) {
      operator delete(v116);
    }
LABEL_89:
    uint64_t v121 = __p[0];
    if (__p[0])
    {
      unsigned int v122 = 0;
      do
      {
        *(void *)(*(void *)(v154 + 24 * v53) + 8 * v122) = v121[2];
        *(void *)(*(void *)&v156[24 * v53] + 8 * v122++) = v121[3];
        uint64_t v121 = (void *)*v121;
      }
      while (v121);
    }
    if (__p[1])
    {
      uint64_t v123 = __p[0];
      if (__p[0])
      {
        do
        {
          unsigned int v124 = (void *)*v123;
          operator delete(v123);
          uint64_t v123 = v124;
        }
        while (v124);
      }
      __p[0] = 0;
      uint64_t v125 = *((void *)&v151 + 1);
      if (*((void *)&v151 + 1))
      {
        uint64_t v126 = 0;
        do
          *(void *)(v151 + 8 * v126++) = 0;
        while (v125 != v126);
      }
      __p[1] = 0;
    }
    unsigned int v145 = v78 + v144;
    ++v53;
  }
  unsigned int v127 = +[NSMutableData dataWithBytes:v52 length:v138 - v52];
  [v147 setNumActiveShadersPerPeriodicSample:v127];

  unsigned int v128 = +[NSMutableData dataWithCapacity:8 * v145];
  unsigned int v129 = +[NSMutableData dataWithCapacity:8 * v145];
  uint64_t v130 = v154;
  if (v155 != v154)
  {
    uint64_t v131 = 0;
    unint64_t v132 = 0;
    do
    {
      uint64_t v133 = (uint64_t *)(v130 + v131);
      uint64_t v134 = *v133;
      uint64_t v135 = v133[1];
      if (v134 != v135) {
        [v128 appendBytes:v134 length:v135 - v134];
      }
      uint64_t v136 = *(void *)&v156[v131];
      uint64_t v137 = *(void *)&v156[v131 + 8];
      if (v136 != v137) {
        [v129 appendBytes:v136 length:v137 - v136];
      }
      ++v132;
      uint64_t v130 = v154;
      v131 += 24;
    }
    while (v132 < 0xAAAAAAAAAAAAAAABLL * ((v155 - v154) >> 3));
  }
  [v147 setActiveShadersPerPeriodicSample:v128];
  [v147 setActiveCoreInfoMasksPerPeriodicSample:v129];

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v151);
  if (v52) {
    operator delete(v52);
  }
  *(void *)&long long v151 = &v154;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v151);
  *(void *)&long long v151 = &v156;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v151);
  if (v163) {
    operator delete(v163);
  }
}

- (void)_saveSampleDataFromGPURawCounters:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  id v7 = fopen(a5, "wt");
  if (v7)
  {
    id v8 = v7;
    if (a4)
    {
      unsigned int v9 = 0;
      do
      {
        unint64_t v10 = a3[v9];
        unsigned int v11 = v9 + 4 * (BYTE4(v10) & 0x7F) + 1;
        fprintf(v8, "%6u : encoderId:%u limiterIdx:%u nTracePackets:%u)\n", v11, v10, v10 >> 39, BYTE4(v10) & 0x7F);
        if ((a3[v9] & 0x7F00000000) != 0)
        {
          unint64_t v12 = 0;
          unint64_t v13 = &a3[v9 + 1];
          do
          {
            for (uint64_t i = 0; i != 4; ++i)
              fprintf(v8, "%6u : 0x%0.8llx 0x%0.8llx\n", i, HIDWORD(v13[i]), v13[i]);
            ++v12;
            v13 += 4;
          }
          while (v12 < (HIDWORD(a3[v9]) & 0x7Fu));
        }
        unsigned int v9 = v11;
      }
      while (v11 < a4);
    }
    fclose(v8);
  }
}

- (id)_gatherStaticInformation:(const GTMTLReplayDataSource *)a3 forReplayController:(const GTMTLReplayController *)a4
{
  __chkstk_darwin(self, a2, a3, a4);
  uint64_t v97 = v4;
  uint64_t v6 = v5;
  uint64_t v7 = objc_opt_new();
  id v8 = (void *)v7;
  uint64_t v107 = *(void *)(v6 + 16);
  uint64_t v9 = *(void *)(v6 + 112);
  uint64_t v114 = *(void *)(v6 + 120);
  long long v130 = 0u;
  long long v131 = 0u;
  float v132 = 1.0;
  uint64_t v104 = v9;
  int v10 = *(_DWORD *)(v9 + 12);
  if (v10 >= 1)
  {
    int v100 = 0;
    int v11 = 0;
    uint64_t v109 = 0;
    unsigned int v116 = 0;
    uint64_t v106 = v7 + 200;
    unint64_t v12 = -1;
    unint64_t v115 = (void *)v7;
    uint64_t v96 = v6;
    do
    {
      uint64_t v13 = *(void *)(v104 + 24);
      int v105 = v11;
      uint64_t v14 = v11;
      uint64_t v112 = (uint64_t *)(v13 + 32 * v11);
      uint64_t v15 = *(void *)(v114 + 24) + (*v112 << 6);
      int v16 = *(_DWORD *)(v15 + 8);
      if (GetFuncEnumConstructorType(v16) == 25)
      {
        ++v100;
      }
      else if (GTMTLReplayHost_IsFuncEnumSampledEncoder(v16, 1, 0))
      {
        uint64_t v99 = (unint64_t *)v15;
        [v8 setEncoderCount:[v8 encoderCount] + 1];
        unint64_t v17 = [v8 encoderInfoList];
        BOOL v18 = [v8 drawCallInfoList];
        uint64_t v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
        [v17 addObject:v19];

        bzero(v129, 0x2B90uLL);
        bzero(v128, 0x2B90uLL);
        uint64_t v20 = *v112;
        uint64_t v98 = v13 + 32 * v14;
        unsigned int v21 = (void *)(v98 + 8);
        if ((unint64_t)*v112 >= *(void *)(v98 + 8))
        {
LABEL_112:
          v105 += *(_DWORD *)(v98 + 20);
          int v10 = *(_DWORD *)(v104 + 12);
          goto LABEL_113;
        }
        unsigned int v108 = v100 - 1;
        while (2)
        {
          uint64_t v22 = (unsigned int *)(*(void *)(v114 + 24) + (v20 << 6));
          uint64_t v23 = IsFuncEnumParallelCommandEncoderCall(v22[2]);
          if (v23) {
            unint64_t v24 = v129;
          }
          else {
            unint64_t v24 = v128;
          }
          GTMTLSMCommandEncoder_processTraceFunc((uint64_t)v24, (uint64_t *)v22, *(void *)(v6 + 16));
          unsigned int v25 = v22[2];
          if (v25 != -16279 && v25 != -16337)
          {
            int v113 = v23;
            if (IsFuncEnumGPUCommandCall(v25))
            {
              if (IsFuncEnumSampledBlitCall(v25) || IsFuncEnumSampledBlitCallAGX(v25)) {
                unint64_t v12 = -1;
              }
              BOOL v31 = objc_opt_new();
              unint64_t v32 = [v8 drawCallInfoList];
              id v33 = [v32 count];

              [v31 setPipelineStateId:v12];
              [v31 setPipelineStateIndex:v116];
              [v31 setPipelineStateFunctionIndex:v109];
              [v31 setDrawCallIndex:v33];
              [v31 setCommandBufferIndex:v108];
              [v31 setFunctionIndex:*v22];
              [v31 setEncoderIndex:[v8 encoderCount] - 1];
              unint64_t v34 = v129;
              if (!v113) {
                unint64_t v34 = v128;
              }
              [v31 setEncoderStateId:*((void *)v34 + 1), v96];
              [v31 setEncoderFunctionIndex:*v112];
              if (v12 != -1)
              {
                unint64_t v35 = [v8 programPipelineInfoList];
                unint64_t v36 = [v35 objectAtIndexedSubscript:v116];

                uint64_t v37 = [v36 drawCallInfoList];
                uint64_t v38 = +[NSNumber numberWithUnsignedInt:v33];
                [v37 addObject:v38];

                id v8 = v115;
                unsigned int v21 = (void *)(v98 + 8);
              }
              *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v106, *(void *)v22, v22)+ 6) = v33;
              uint64_t v39 = [v8 drawCallInfoList];
              [v39 addObject:v31];

              unint64_t v40 = +[NSNumber numberWithUnsignedInt:v33];
              uint8x8_t v41 = [v8 encoderInfoList];
              [v41 setObject:v40 atIndexedSubscript:[v31 encoderIndex]];
            }
            else if (v25 >> 2 == 1073737833)
            {
              p = **(apr_pool_t ***)(v97 + 152);
              GTMTLSMContext_indirectCommandBufferResources((uint64_t)v125, *(_DWORD ***)(v6 + 40), *v99, p);
              GetExecuteCommandsInBufferArgs((uint64_t)&v119, *(void *)(v114 + 24) + (v20 << 6), *(void *)(v6 + 16));
              Object = GTMTLSMContext_getObject(**(void **)(v6 + 40), v119, *v99);
              GTMTLCreateIndirectCommandEncoder((uint64_t)v123, Object[13]);
              memcpy(__dst, v24, sizeof(__dst));
              if (*(_DWORD *)v24 == 28)
              {
                if ((GT_SUPPORT_0 & 0x10) != 0)
                {
                  uint64_t v79 = v121;
                  if (v121)
                  {
                    unsigned int v111 = 0;
                    uint64_t v80 = v122 + v124 * (v105 + (int)v120);
                    uint64_t v103 = v80;
                    do
                    {
                      uint64_t v126 = v80;
                      if (GTMTLSMComputeCommandEncoder_loadIndirectCommand((uint64_t)&__dst[7], v123, v80, v125))
                      {
                        unint64_t v81 = objc_opt_new();
                        id v82 = [v115 drawCallInfoList];
                        id v83 = [v82 count];

                        [v81 setPipelineStateId:__dst[8]];
                        id v117 = [v81 pipelineStateId];
                        [v81 setPipelineStateIndex:*((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v130, (unint64_t)v117, &v117)+ 6));
                        id v117 = [v81 pipelineStateId];
                        [v81 setPipelineStateFunctionIndex:std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v130, (unint64_t)v117, &v117)[4]];
                        [v81 setDrawCallIndex:v83];
                        [v81 setCommandBufferIndex:v108];
                        [v81 setFunctionIndex:*v22];
                        [v81 setSubCommandIndex:v111];
                        [v81 setEncoderIndex:[v115 encoderCount] - 1];
                        unint64_t v84 = v129;
                        if (!v113) {
                          unint64_t v84 = v128;
                        }
                        [v81 setEncoderStateId:*((void *)v84 + 1), v96];
                        [v81 setEncoderFunctionIndex:*v112];
                        if (v12 != -1)
                        {
                          uint64_t v85 = [v115 programPipelineInfoList];
                          uint64_t v86 = [v85 objectAtIndexedSubscript:v116];

                          unsigned int v87 = [v86 drawCallInfoList];
                          uint64_t v88 = +[NSNumber numberWithUnsignedInt:v83];
                          [v87 addObject:v88];
                        }
                        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v106, *(void *)v22, v22)+ 6) = v83;
                        uint64_t v89 = [v115 drawCallInfoList];
                        [v89 addObject:v81];

                        uint64_t v90 = [v115 encoderInfoList];
                        id v91 = [v90 count];
                        unsigned int v92 = [v81 encoderIndex];

                        if ((unint64_t)v91 <= v92)
                        {
                          uint64_t v93 = [v115 encoderInfoList];
                          uint64_t v94 = +[NSNumber numberWithUnsignedInt:v83];
                          [v93 addObject:v94];
                        }
                        else
                        {
                          uint64_t v93 = +[NSNumber numberWithUnsignedInt:v83];
                          uint64_t v94 = [v115 encoderInfoList];
                          objc_msgSend(v94, "setObject:atIndexedSubscript:", v93, objc_msgSend(v81, "encoderIndex"));
                        }
                        ++v111;

                        uint64_t v80 = v103;
                      }
                      --v79;
                    }
                    while (v79);
                  }
                }
              }
              else if (*(_DWORD *)v24 == 70)
              {
                uint64_t v57 = v121;
                if (v121)
                {
                  unsigned int v110 = 0;
                  uint64_t v58 = v122;
                  uint64_t v59 = v124;
                  uint64_t v60 = v120 << 32;
                  uint64_t v101 = v124;
                  uint64_t v102 = v122;
                  do
                  {
                    uint64_t v126 = v58 + v59 * (v60 >> 32);
                    if (GTMTLSMRenderCommandEncoder_loadIndirectCommand((uint64_t)&__dst[7], v123, v126, v125))
                    {
                      id v61 = objc_opt_new();
                      unsigned int v62 = [v115 drawCallInfoList];
                      id v63 = [v62 count];

                      [v61 setPipelineStateId:__dst[1075]];
                      id v117 = [v61 pipelineStateId];
                      [v61 setPipelineStateIndex:*((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v130, (unint64_t)v117, &v117)+ 6));
                      id v117 = [v61 pipelineStateId];
                      [v61 setPipelineStateFunctionIndex:std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v130, (unint64_t)v117, &v117)[4]];
                      [v61 setDrawCallIndex:v63];
                      [v61 setCommandBufferIndex:v108];
                      [v61 setFunctionIndex:*v22];
                      [v61 setSubCommandIndex:v110];
                      [v61 setEncoderIndex:[v115 encoderCount] - 1];
                      float v64 = v129;
                      if (!v113) {
                        float v64 = v128;
                      }
                      [v61 setEncoderStateId:*((void *)v64 + 1), v96];
                      [v61 setEncoderFunctionIndex:*v112];
                      if (v12 != -1)
                      {
                        uint64_t v65 = [v115 programPipelineInfoList];
                        uint64_t v66 = [v65 objectAtIndexedSubscript:v116];

                        unsigned int v67 = [v66 drawCallInfoList];
                        size_t v68 = +[NSNumber numberWithUnsignedInt:v63];
                        [v67 addObject:v68];
                      }
                      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v106, *(void *)v22, v22)+ 6) = v63;
                      uint64_t v69 = [v115 drawCallInfoList];
                      [v69 addObject:v61];

                      uint64_t v70 = [v115 encoderInfoList];
                      id v71 = [v70 count];
                      unsigned int v72 = [v61 encoderIndex];

                      if ((unint64_t)v71 <= v72)
                      {
                        unint64_t v73 = [v115 encoderInfoList];
                        unsigned int v74 = +[NSNumber numberWithUnsignedInt:v63];
                        [v73 addObject:v74];
                      }
                      else
                      {
                        unint64_t v73 = +[NSNumber numberWithUnsignedInt:v63];
                        unsigned int v74 = [v115 encoderInfoList];
                        [v74 setObject:v73 atIndexedSubscript:[v61 encoderIndex]];
                      }
                      ++v110;

                      uint64_t v59 = v101;
                      uint64_t v58 = v102;
                    }
                    v60 += 0x100000000;
                    --v57;
                  }
                  while (v57);
                }
              }
              apr_pool_clear(p);
              id v8 = v115;
              uint64_t v6 = v96;
              unsigned int v21 = (void *)(v98 + 8);
            }
            goto LABEL_96;
          }
          uint64_t v27 = GTTraceFunc_argumentBytesWithMap(v22, *((unsigned __int8 *)v22 + 13), v107);
          unint64_t v12 = *((void *)v27 + 1);
          if (*((void *)&v130 + 1))
          {
            uint8x8_t v28 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v130 + 8));
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              unint64_t v29 = *((void *)v27 + 1);
              if (v12 >= *((void *)&v130 + 1)) {
                unint64_t v29 = v12 % *((void *)&v130 + 1);
              }
            }
            else
            {
              unint64_t v29 = (*((void *)&v130 + 1) - 1) & v12;
            }
            uint64_t v42 = *(uint64_t ***)(v130 + 8 * v29);
            if (v42)
            {
              for (uint64_t i = *v42; i; uint64_t i = (uint64_t *)*i)
              {
                unint64_t v44 = i[1];
                if (v44 == v12)
                {
                  if (i[2] == v12)
                  {
                    unsigned int v116 = *((_DWORD *)i + 6);
                    uint64_t v109 = i[4];
                    goto LABEL_96;
                  }
                }
                else
                {
                  if (v28.u32[0] > 1uLL)
                  {
                    if (v44 >= *((void *)&v130 + 1)) {
                      v44 %= *((void *)&v130 + 1);
                    }
                  }
                  else
                  {
                    v44 &= *((void *)&v130 + 1) - 1;
                  }
                  if (v44 != v29) {
                    break;
                  }
                }
              }
            }
          }
          unsigned int v116 = DWORD2(v131);
          unint64_t v45 = objc_opt_new();
          [v45 setProgramId:v12];
          [v45 setProgramIndex:v116];
          [v45 setPipelineStateFunctionIndex:v20];
          unint64_t v46 = *((void *)&v130 + 1);
          if (*((void *)&v130 + 1))
          {
            uint8x8_t v47 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v130 + 8));
            v47.i16[0] = vaddlv_u8(v47);
            if (v47.u32[0] > 1uLL)
            {
              uint64_t v23 = v12;
              if (v12 >= *((void *)&v130 + 1)) {
                uint64_t v23 = v12 % *((void *)&v130 + 1);
              }
            }
            else
            {
              uint64_t v23 = (*((void *)&v130 + 1) - 1) & v12;
            }
            size_t v48 = *(void ***)(v130 + 8 * v23);
            if (v48)
            {
              size_t v49 = *v48;
              if (*v48)
              {
                do
                {
                  unint64_t v50 = v49[1];
                  if (v50 == v12)
                  {
                    if (v49[2] == v12) {
                      goto LABEL_95;
                    }
                  }
                  else
                  {
                    if (v47.u32[0] > 1uLL)
                    {
                      if (v50 >= *((void *)&v130 + 1)) {
                        v50 %= *((void *)&v130 + 1);
                      }
                    }
                    else
                    {
                      v50 &= *((void *)&v130 + 1) - 1;
                    }
                    if (v50 != v23) {
                      break;
                    }
                  }
                  size_t v49 = (void *)*v49;
                }
                while (v49);
              }
            }
          }
          size_t v49 = operator new(0x28uLL);
          void *v49 = 0;
          v49[1] = v12;
          v49[2] = v12;
          *((_DWORD *)v49 + 6) = 0;
          v49[4] = 0;
          float v51 = (float)(unint64_t)(*((void *)&v131 + 1) + 1);
          if (!v46 || (float)(v132 * (float)v46) < v51)
          {
            BOOL v52 = (v46 & (v46 - 1)) != 0;
            if (v46 < 3) {
              BOOL v52 = 1;
            }
            unint64_t v53 = v52 | (2 * v46);
            unint64_t v54 = vcvtps_u32_f32(v51 / v132);
            if (v53 <= v54) {
              size_t v55 = v54;
            }
            else {
              size_t v55 = v53;
            }
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v130, v55);
            unint64_t v46 = *((void *)&v130 + 1);
            if ((v46 & (v46 - 1)) != 0)
            {
              if (v12 >= *((void *)&v130 + 1)) {
                uint64_t v23 = v12 % *((void *)&v130 + 1);
              }
              else {
                uint64_t v23 = v12;
              }
            }
            else
            {
              uint64_t v23 = (*((void *)&v130 + 1) - 1) & v12;
            }
          }
          uint64_t v75 = v130;
          unint64_t v76 = *(void **)(v130 + 8 * v23);
          if (v76)
          {
            void *v49 = *v76;
            goto LABEL_93;
          }
          void *v49 = v131;
          *(void *)&long long v131 = v49;
          *(void *)(v75 + 8 * v23) = &v131;
          if (*v49)
          {
            unint64_t v77 = *(void *)(*v49 + 8);
            if ((v46 & (v46 - 1)) != 0)
            {
              if (v77 >= v46) {
                v77 %= v46;
              }
            }
            else
            {
              v77 &= v46 - 1;
            }
            unint64_t v76 = (void *)(v130 + 8 * v77);
LABEL_93:
            *unint64_t v76 = v49;
          }
          ++*((void *)&v131 + 1);
LABEL_95:
          *((_DWORD *)v49 + 6) = v116;
          v49[4] = v20;
          [v45 setValid:1 v96];
          unsigned int v78 = [v8 programPipelineInfoList];
          [v78 addObject:v45];

          uint64_t v109 = v20;
LABEL_96:
          if ((unint64_t)++v20 >= *v21) {
            goto LABEL_112;
          }
          continue;
        }
      }
LABEL_113:
      int v11 = v105 + 1;
    }
    while (v105 + 1 < v10);
  }
  if (objc_opt_respondsToSelector()) {
    [v8 buildDrawCallIndexMap];
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v130);

  return v8;
}

- (id)_analyzeBinary:(id)a3 uscSamples:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  if ([v17 length])
  {
    LODWORD(v24) = a9;
    uint64_t v22 = [(GTShaderProfilerHelper *)self _calculatePerLineCostWithSampleData:v17 binary:v16 targetIndex:v13 withTextSegment:v18 withKey:v19 withShaderSourcePath:v20 forDataMaster:v24 withPerDrawLimiterData:v21];
    if (!v22)
    {
      uint64_t v22 = [(GTShaderProfilerHelper *)self _calculatePerDrawCallCostWithSampleData:v17 targetIndex:v13];
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (BOOL)analyzeShaderInfoResult:(id)a3 forDataSource:(const GTMTLReplayDataSource *)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v84 = a3;
  unsigned int v87 = [v84 objectForKeyedSubscript:@"draw call info"];
  uint64_t v7 = [v84 objectForKeyedSubscript:@"MetalPluginName"];
  metalPluginName = self->_metalPluginName;
  self->_metalPluginName = v7;

  uint64_t v9 = [(GTShaderProfilerHelper *)self _gatherStaticInformation:a4 forReplayController:a5];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  int v10 = [v9 drawCallInfoList];
  uint64_t v93 = v9;
  uint64_t v11 = 0;
  id v12 = [v10 countByEnumeratingWithState:&v109 objects:v116 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v110 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v109 + 1) + 8 * i) pipelineStateId] == (id)-1) {
          ++v11;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v109 objects:v116 count:16];
    }
    while (v12);
  }

  uint64_t v15 = (char *)[v87 count];
  id v16 = [v93 drawCallInfoList];
  id v82 = &v15[v11];
  id v83 = (char *)[v16 count];

  if (&v15[v11] == v83)
  {
    id v17 = [v84 objectForKeyedSubscript:@"frametime"];
    [(GTShaderProfilerHelper *)self _calculateFrameTime:v17 result:v93];

    unsigned int v91 = MetalPluginTarget(self->_metalPluginName);
    unsigned int v18 = 0;
    memset(v107, 0, sizeof(v107));
    int v108 = 1065353216;
    while ((unint64_t)[v87 count] > v18)
    {
      id v19 = [v87 objectAtIndexedSubscript:v18];
      id v20 = [v93 drawCallInfoList];
      id v21 = [v20 objectAtIndexedSubscript:v18];

      uint64_t v22 = [v19 objectForKeyedSubscript:@"vertex shader key"];
      id v23 = v21[1];
      v21[1] = (id)v22;

      uint64_t v24 = [v19 objectForKeyedSubscript:@"fragment shader key"];
      id v25 = v21[2];
      v21[2] = (id)v24;

      uint64_t v26 = [v19 objectForKeyedSubscript:@"compute kernel key"];
      id v27 = v21[3];
      v21[3] = (id)v26;

      uint8x8_t v28 = [v19 objectForKeyedSubscript:@"mutiple binary keys"];
      unint64_t v29 = v28;
      if (v28)
      {
        id v30 = [v28 copy];
        objc_storeStrong(v21 + 4, v30);
      }
      else
      {
        id v31 = &__NSArray0__struct;
        id v30 = v21[4];
        v21[4] = &__NSArray0__struct;
      }

      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>(v107, v18))
      {
        unint64_t v32 = [v93 programPipelineInfoList];
        [v32 objectAtIndexedSubscript:[v21 pipelineStateIndex]];
        id v33 = (id *)objc_claimAutoreleasedReturnValue();

        objc_storeStrong(v33 + 1, v21[1]);
        objc_storeStrong(v33 + 2, v21[2]);
        objc_storeStrong(v33 + 3, v21[3]);
        objc_storeStrong(v33 + 4, v21[4]);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)v107, v18, v18);
      }
      ++v18;
    }
    uint64_t v34 = objc_opt_new();
    unint64_t v35 = (void *)*((void *)v93 + 30);
    *((void *)v93 + 30) = v34;

    uint64_t v36 = objc_opt_new();
    uint64_t v37 = (void *)*((void *)v93 + 31);
    *((void *)v93 + 31) = v36;

    uint64_t v38 = objc_opt_new();
    uint64_t v39 = (void *)*((void *)v93 + 32);
    *((void *)v93 + 32) = v38;

    uint64_t v40 = objc_opt_new();
    uint8x8_t v41 = (void *)*((void *)v93 + 33);
    *((void *)v93 + 33) = v40;

    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke;
    v106[3] = &unk_7453D8;
    v106[4] = self;
    [(GTShaderProfilerHelper *)self _visitAllShaderInfosInResult:v93 usingBlock:v106];
    if ((*((unsigned char *)self->_options + 16) & 0x40) != 0) {
      [(GTShaderProfilerHelper *)self _saveShaderBinariesWith:v93 targetIndex:v91];
    }
    memset(v105, 0, sizeof(v105));
    uint64_t v42 = [v84 objectForKeyedSubscript:@"payload"];
    uint64_t v43 = [(GTShaderProfilerHelper *)self _setupLimiterInfoPerDrawCall:v93 forPayload:v42 withShaderInfo:v84];

    [(GTShaderProfilerHelper *)self _preProcessUSCSampleData:v84 result:v93 targetIndex:v91];
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_3;
    v102[3] = &unk_745448;
    v102[4] = self;
    unsigned int v104 = v91;
    id v81 = v43;
    id v103 = v81;
    [(GTShaderProfilerHelper *)self _visitAllShaderInfosInResult:v93 usingBlock:v102];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    obunint64_t j = [v93 drawCallInfoList];
    id v89 = [obj countByEnumeratingWithState:&v98 objects:v115 count:16];
    if (v89)
    {
      uint64_t v88 = *(void *)v99;
      do
      {
        for (unint64_t j = 0; j != v89; unint64_t j = (char *)j + 1)
        {
          if (*(void *)v99 != v88) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = *(void *)(*((void *)&v98 + 1) + 8 * (void)j);
          unint64_t v45 = [v93 programPipelineInfoList];
          uint64_t v90 = objc_msgSend(v45, "objectAtIndexedSubscript:", objc_msgSend((id)v44, "pipelineStateIndex"));

          unint64_t v46 = *(void **)(v44 + 8);
          if (v46 && [v46 length])
          {
            uint8x8_t v47 = [*((id *)v93 + 30) objectForKeyedSubscript:*(void *)(v44 + 8)];
            size_t v48 = [v47 analyzerResult];

            size_t v49 = [v48 drawCallCost];
            unint64_t v50 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [(id)v44 drawCallIndex]);
            float v51 = [v49 objectForKeyedSubscript:v50];
            unsigned int v52 = [v51 unsignedIntValue];

            *(double *)(v44 + 40) = (double)v52;
            *(double *)(v44 + 48) = (double)v52;
            *(double *)(v44 + 56) = (double)v52;
            *(float64x2_t *)(v44 + 184) = vaddq_f64(*(float64x2_t *)(v44 + 40), *(float64x2_t *)(v44 + 184));
            *(double *)(v44 + 200) = *(double *)(v44 + 200) + (double)v52;
          }
          unint64_t v53 = *(void **)(v44 + 16);
          if (v53 && [v53 length])
          {
            unint64_t v54 = [*((id *)v93 + 31) objectForKeyedSubscript:*(void *)(v44 + 16)];
            size_t v55 = [v54 analyzerResult];

            double v56 = [v55 drawCallCost];
            uint64_t v57 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [(id)v44 drawCallIndex]);
            uint64_t v58 = [v56 objectForKeyedSubscript:v57];
            unsigned int v59 = [v58 unsignedIntValue];

            *(double *)(v44 + 88) = (double)v59;
            *(double *)(v44 + 96) = (double)v59;
            *(double *)(v44 + 104) = (double)v59;
            *(float64x2_t *)(v44 + 184) = vaddq_f64(*(float64x2_t *)(v44 + 88), *(float64x2_t *)(v44 + 184));
            *(double *)(v44 + 200) = *(double *)(v44 + 200) + (double)v59;
          }
          uint64_t v60 = *(void **)(v44 + 24);
          if (v60 && [v60 length])
          {
            id v61 = [*((id *)v93 + 32) objectForKeyedSubscript:*(void *)(v44 + 24)];
            unsigned int v62 = [v61 analyzerResult];

            id v63 = [v62 drawCallCost];
            float v64 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [(id)v44 drawCallIndex]);
            uint64_t v65 = [v63 objectForKeyedSubscript:v64];
            unsigned int v66 = [v65 unsignedIntValue];

            *(double *)(v44 + 136) = (double)v66;
            *(double *)(v44 + 144) = (double)v66;
            *(double *)(v44 + 152) = (double)v66;
            *(float64x2_t *)(v44 + 184) = vaddq_f64(*(float64x2_t *)(v44 + 136), *(float64x2_t *)(v44 + 184));
            *(double *)(v44 + 200) = *(double *)(v44 + 200) + (double)v66;
          }
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          id v67 = *(id *)(v44 + 32);
          id v68 = [v67 countByEnumeratingWithState:&v94 objects:v114 count:16];
          if (v68)
          {
            uint64_t v69 = *(void *)v95;
            do
            {
              for (uint64_t k = 0; k != v68; uint64_t k = (char *)k + 1)
              {
                if (*(void *)v95 != v69) {
                  objc_enumerationMutation(v67);
                }
                id v71 = [*((id *)v93 + 33) objectForKeyedSubscript:*(void *)(*((void *)&v94 + 1) + 8 * (void)k)];
                unsigned int v72 = [v71 analyzerResult];

                unint64_t v73 = [v72 drawCallCost];
                unsigned int v74 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [(id)v44 drawCallIndex]);
                uint64_t v75 = [v73 objectForKeyedSubscript:v74];
                unsigned int v76 = [v75 unsignedIntValue];

                *(float64x2_t *)(v44 + 184) = vaddq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v76), 0), *(float64x2_t *)(v44 + 184));
                *(double *)(v44 + 200) = *(double *)(v44 + 200) + (double)v76;
              }
              id v68 = [v67 countByEnumeratingWithState:&v94 objects:v114 count:16];
            }
            while (v68);
          }

          *(float64x2_t *)(v90 + 40) = vaddq_f64(*(float64x2_t *)(v44 + 40), *(float64x2_t *)(v90 + 40));
          *(double *)(v90 + 56) = *(double *)(v44 + 56) + *(double *)(v90 + 56);
          *(float64x2_t *)(v90 + 88) = vaddq_f64(*(float64x2_t *)(v44 + 88), *(float64x2_t *)(v90 + 88));
          *(double *)(v90 + 104) = *(double *)(v44 + 104) + *(double *)(v90 + 104);
          *(float64x2_t *)(v90 + 136) = vaddq_f64(*(float64x2_t *)(v44 + 136), *(float64x2_t *)(v90 + 136));
          *(double *)(v90 + 152) = *(double *)(v44 + 152) + *(double *)(v90 + 152);
          *(float64x2_t *)(v90 + 184) = vaddq_f64(*(float64x2_t *)(v44 + 184), *(float64x2_t *)(v90 + 184));
          *(double *)(v90 + 200) = *(double *)(v44 + 200) + *(double *)(v90 + 200);
          *(float64x2_t *)(v93 + 8) = vaddq_f64(*(float64x2_t *)(v44 + 40), *(float64x2_t *)(v93 + 8));
          *((double *)v93 + 3) = *(double *)(v44 + 56) + *((double *)v93 + 3);
          *(float64x2_t *)(v93 + 56) = vaddq_f64(*(float64x2_t *)(v44 + 88), *(float64x2_t *)(v93 + 56));
          *((double *)v93 + 9) = *(double *)(v44 + 104) + *((double *)v93 + 9);
          *(float64x2_t *)(v93 + 104) = vaddq_f64(*(float64x2_t *)(v44 + 136), *(float64x2_t *)(v93 + 104));
          *((double *)v93 + 15) = *(double *)(v44 + 152) + *((double *)v93 + 15);
        }
        id v89 = [obj countByEnumeratingWithState:&v98 objects:v115 count:16];
      }
      while (v89);
    }

    uint64_t v77 = *((void *)self->_options + 2);
    if ((v77 & 0x10) != 0)
    {
      [(GTShaderProfilerHelper *)self _showDrawCallDataforResult:v93];
    }
    else
    {
      unsigned int v78 = v93;
      if ((v77 & 8) != 0) {
        [(GTShaderProfilerHelper *)self _dumpTraceProfileDataForResult:v93];
      }
    }
    if ((*((unsigned char *)self->_options + 16) & 0x40) != 0)
    {
      uint64_t v79 = +[NSFileManager defaultManager];
      [v79 moveItemAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults" toPath:self->_options->var0 error:0];
    }
    int v113 = (void **)v105;
    std::vector<std::unordered_map<unsigned int,GTEncoderSampleIndexInfo>>::__destroy_vector::operator()[abi:nn180100](&v113);

    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v107);
  }

  return v82 == v83;
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:a2];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_2;
  v8[3] = &unk_7453B0;
  id v7 = v5;
  id v9 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned int a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v7];
  if (a4 > 2)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_5;
    v13[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
    unsigned int v14 = a4;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    uint64_t v15[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_4;
    v15[3] = &unk_745400;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    id v16 = v10;
    uint64_t v17 = v11;
    int v19 = *(_DWORD *)(a1 + 48);
    unsigned int v20 = a4;
    id v18 = v12;
    [v9 enumerateKeysAndObjectsUsingBlock:v15];

    id v9 = v16;
  }
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_4(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint8x8_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:];
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = [v3 binary];
  uint64_t v6 = [v3 uscSamples];
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  id v8 = [*(id *)(a1 + 40) _extractShaderBinaryTextSegment:v3];
  LODWORD(v10) = *(_DWORD *)(a1 + 60);
  id v9 = [v4 _analyzeBinary:v5 uscSamples:v6 targetIndex:v7 withTextSegment:v8 withKey:v11 withShaderSourcePath:0 forDataMaster:v10 withPerDrawLimiterData:*(void *)(a1 + 48)];

  if (!v9) {
    id v9 = objc_opt_new();
  }
  [v3 setAnalyzerResult:v9];
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (g_runningInCI)
  {
    id v8 = v3;
    uint64_t v4 = +[NSString stringWithFormat:@"analyzeShaderInfoResult ignoring data master %d on key %@", *(unsigned int *)(a1 + 32), v3];
    id v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "];

    uint64_t v6 = __stdoutp;
    id v7 = v5;
    fprintf(v6, "#CI-INFO# %s\n", (const char *)[v7 UTF8String]);

    id v3 = v8;
  }
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  id v7 = [v5 objectForKeyedSubscript:@"binary"];
  [v6 setBinary:v7];

  id v8 = [v5 objectForKeyedSubscript:@"type"];
  [v6 setType:v8];

  id v9 = [v5 objectForKeyedSubscript:@"dylib"];
  [v6 setDylib:v9];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v10];
}

- (void)_visitAllShaderInfosInResult:(id)a3 usingBlock:(id)a4
{
  id v5 = (id *)a3;
  uint64_t v6 = (void (**)(id, void *, void, uint64_t))a4;
  v10[0] = v5[30];
  v10[1] = v5[31];
  int v10[2] = v5[32];
  uint64_t v7 = 0;
  v10[3] = v5[33];
  do
  {
    id v8 = [&off_758AE0 objectAtIndexedSubscript:v7];
    v6[2](v6, v8, v10[v7], v7);

    ++v7;
  }
  while (v7 != 4);
  for (uint64_t i = 3; i != -1; --i)
}

- (unsigned)_getLegacyProgramType:(id)a3
{
  id v3 = [&off_7591E8 objectForKeyedSubscript:a3];
  uint64_t v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v5 = 255;
  }

  return v5;
}

- (BOOL)_shouldUseProgramAddressMappings:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  BOOL v5 = 0;
  if (v3 && (dword_77313C & 0x200) != 0) {
    BOOL v5 = [v3 count] != 0;
  }

  return v5;
}

- (GTShaderProfilerHelper)initWithOptions:(GTProfilerOptions *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GTShaderProfilerHelper;
  uint64_t v4 = [(GTShaderProfilerHelper *)&v15 init];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    if ([a3->var0 length])
    {
      uint64_t v6 = +[NSFileManager defaultManager];
      [v6 createDirectoryAtPath:a3->var0 withIntermediateDirectories:1 attributes:0 error:0];
      uint64_t v7 = [a3->var0 stringByAppendingPathComponent:@"shaderBinaries"];
      [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

      [v6 removeItemAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults" error:0];
      [v6 createDirectoryAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults" withIntermediateDirectories:1 attributes:0 error:0];
      [v6 createDirectoryAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/json" withIntermediateDirectories:1 attributes:0 error:0];
      if (-[GTShaderProfilerHelper initWithOptions:]::onceToken != -1) {
        dispatch_once(&-[GTShaderProfilerHelper initWithOptions:]::onceToken, &__block_literal_global_2085);
      }
      uint64_t v8 = objc_opt_new();
      waitOperation = v5->waitOperation;
      v5->waitOperation = (NSOperation *)v8;
    }
    id v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v10;

    [(NSOperationQueue *)v5->_operationQueue setName:@"gputools.AGXMTLReplayer.serialQueue"];
    [(NSOperationQueue *)v5->_operationQueue setMaxConcurrentOperationCount:1];
    uint64_t v12 = objc_opt_new();
    workloadTimelineInfo = v5->_workloadTimelineInfo;
    v5->_workloadTimelineInfo = (DYWorkloadGPUTimelineInfo *)v12;
  }
  return v5;
}

void __42__GTShaderProfilerHelper_initWithOptions___block_invoke(id a1)
{
}

@end