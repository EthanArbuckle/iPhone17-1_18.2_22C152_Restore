@interface VCPVideoSaliencyAnalyzer
- (BOOL)isOutOfBoundary:(CGRect)a3;
- (VCPVideoSaliencyAnalyzer)initWithTransform:(CGAffineTransform *)a3;
- (float)boundDistance:(CGRect)a3 relativeTo:(CGRect)a4 landscape:(BOOL)a5;
- (float)updateConfidence:(float)a3 prevBound:(CGRect)a4 newBound:(CGRect)a5 width:(int)a6 height:(int)a7;
- (id)pruneRegions:(id)a3 withOverlapRatio:(float)a4;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)finishAnalysisPass:(id *)a3;
@end

@implementation VCPVideoSaliencyAnalyzer

- (VCPVideoSaliencyAnalyzer)initWithTransform:(CGAffineTransform *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)VCPVideoSaliencyAnalyzer;
  v3 = [(VCPVideoSaliencyAnalyzer *)&v23 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v6;

    v8 = (long long *)MEMORY[0x1E4F1FA08];
    long long v9 = *MEMORY[0x1E4F1FA08];
    *((void *)v3 + 5) = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *(_OWORD *)(v3 + 24) = v9;
    long long v10 = *v8;
    *((void *)v3 + 8) = *((void *)v8 + 2);
    *((_OWORD *)v3 + 3) = v10;
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)(v3 + 72) = *MEMORY[0x1E4F1F9F8];
    *((void *)v3 + 11) = v11;
    uint64_t v12 = +[VCPImageSaliencyAnalyzer analyzerWith:3 prune:0];
    v13 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = v12;

    v14 = (void *)*((void *)v3 + 12);
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
      v16 = (void *)*((void *)v3 + 13);
      *((void *)v3 + 13) = v15;

      uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
      v18 = (void *)*((void *)v3 + 14);
      *((void *)v3 + 14) = v17;

      uint64_t v19 = [MEMORY[0x1E4F1C978] array];
      v20 = (void *)*((void *)v3 + 15);
      *((void *)v3 + 15) = v19;

      v14 = v3;
    }
    v21 = v14;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (float)updateConfidence:(float)a3 prevBound:(CGRect)a4 newBound:(CGRect)a5 width:(int)a6 height:(int)a7
{
  float v8 = a4.origin.x + a4.size.width * 0.5;
  float v9 = a4.origin.y + a4.size.height * 0.5;
  float v10 = a5.origin.x + a5.size.width * 0.5;
  float v11 = a5.origin.y + a5.size.height * 0.5;
  float v12 = expf((float)((float)((float)((float)((float)(v11 - (float)((float)a7 * 0.5))* (float)(v11 - (float)((float)a7 * 0.5)))+ (float)((float)(v10 - (float)((float)a6 * 0.5))* (float)(v10 - (float)((float)a6 * 0.5))))- (float)((float)((float)(v9 - (float)((float)a7 * 0.5)) * (float)(v9 - (float)((float)a7 * 0.5)))+ (float)((float)(v8 - (float)((float)a6 * 0.5)) * (float)(v8 - (float)((float)a6 * 0.5)))))* -2.0)/ (float)(a6 * a6 + a7 * a7))* a3;
  float v13 = 1.0;
  if (v12 < 1.0) {
    float v13 = v12;
  }
  BOOL v14 = v12 > 0.0;
  float result = 0.0;
  if (v14) {
    return v13;
  }
  return result;
}

- (BOOL)isOutOfBoundary:(CGRect)a3
{
  float v3 = a3.origin.x + a3.size.width * 0.5;
  float v4 = a3.origin.y + a3.size.height * 0.5;
  if (v4 >= v3) {
    float v5 = v3;
  }
  else {
    float v5 = v4;
  }
  if (v3 < v4) {
    float v3 = v4;
  }
  return v3 > 0.9 || v5 < 0.1;
}

- (id)pruneRegions:(id)a3 withOverlapRatio:(float)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v34 = [MEMORY[0x1E4F1CA48] array];
  float v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:v35];
  unint64_t v5 = 0;
  uint64_t v6 = (double *)MEMORY[0x1E4F1DB28];
  while ([v35 count] > v5)
  {
    if (v5 >= 2) {
      unsigned int v7 = 2;
    }
    else {
      unsigned int v7 = v5;
    }
    float v38 = kConfidenceThresh[v7];
    double y = v6[1];
    rect[0] = *v6;
    double width = v6[2];
    double height = v6[3];
    float v11 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    memset(&rect[1], 0, 32);
    float v12 = [v4 reverseObjectEnumerator];
    uint64_t v13 = [v12 countByEnumeratingWithState:&rect[1] objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = **(void **)&rect[3];
      float v37 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (**(void **)&rect[3] != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*(void *)&rect[2] + 8 * i);
          [v16 confidence];
          float v18 = v17;
          if (v17 > v38)
          {
            [v16 bound];
            CGFloat v20 = v19;
            CGFloat v22 = v21;
            double v24 = v23;
            double v26 = v25;
            v45.origin.x = rect[0];
            v45.origin.double y = y;
            v45.size.double width = width;
            v45.size.double height = height;
            if (CGRectIsEmpty(v45))
            {
              [v11 addObject:v16];
              float v37 = v18;
              rect[0] = v20;
              double y = v22;
              double width = v24;
              double height = v26;
            }
            else
            {
              v46.origin.x = rect[0];
              v46.origin.double y = y;
              v46.size.double width = width;
              v46.size.double height = height;
              v52.origin.x = v20;
              v52.origin.double y = v22;
              v52.size.double width = v24;
              v52.size.double height = v26;
              if (CGRectIntersectsRect(v46, v52))
              {
                v47.origin.x = rect[0];
                v47.origin.double y = y;
                v47.size.double width = width;
                v47.size.double height = height;
                v53.origin.x = v20;
                v53.origin.double y = v22;
                v53.size.double width = v24;
                v53.size.double height = v26;
                CGRect v48 = CGRectIntersection(v47, v53);
                double v27 = width * height;
                if (v24 * v26 < width * height) {
                  double v27 = v24 * v26;
                }
                float v28 = v27;
                if (v48.size.width * v48.size.height > (float)(v28 * a4))
                {
                  v49.origin.x = rect[0];
                  v49.origin.double y = y;
                  v49.size.double width = width;
                  v49.size.double height = height;
                  v54.origin.x = v20;
                  v54.origin.double y = v22;
                  v54.size.double width = v24;
                  v54.size.double height = v26;
                  CGRect v50 = CGRectUnion(v49, v54);
                  rect[0] = v50.origin.x;
                  double y = v50.origin.y;
                  double width = v50.size.width;
                  double height = v50.size.height;
                  float v29 = v37;
                  if (v37 < v18) {
                    float v29 = v18;
                  }
                  float v37 = v29;
                  [v11 addObject:v16];
                }
              }
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&rect[1] objects:v42 count:16];
      }
      while (v13);
    }
    else
    {
      float v37 = 0.0;
    }

    v51.origin.x = rect[0];
    v51.origin.double y = y;
    v51.size.double width = width;
    v51.size.double height = height;
    if (!CGRectIsEmpty(v51))
    {
      v30 = [VCPSaliencyRegion alloc];
      *(float *)&double v31 = v37;
      v32 = -[VCPSaliencyRegion initWith:confidence:](v30, "initWith:confidence:", rect[0], y, width, height, v31);
      if (!v32) {
        goto LABEL_30;
      }
      [v34 addObject:v32];
    }
    [v4 removeObjectsInArray:v11];
    if (![v4 count])
    {
LABEL_30:

      break;
    }

    ++v5;
  }

  return v34;
}

- (float)boundDistance:(CGRect)a3 relativeTo:(CGRect)a4 landscape:(BOOL)a5
{
  if (!a5) {
    return 0.0;
  }
  float v5 = a3.origin.x + a3.size.width * 0.5 - (a4.origin.x + a4.size.width * 0.5);
  return fabsf(v5);
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  v93 = (CMTime *)a4;
  p_timeLastTracking = &self->_timeLastTracking;
  CMTime lhs = *(CMTime *)a4;
  CMTime rhs = (CMTime)self->_timeLastTracking;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) >= 0.200000003
    || (CMTime lhs = *v93,
        CMTime rhs = (CMTime)self->_timeLastDetection,
        CMTimeSubtract(&v126, &lhs, &rhs),
        CMTimeGetSeconds(&v126) >= 1.0))
  {
    int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    context = (void *)MEMORY[0x1C186D320]();
    uint64_t v125 = 0;
    v82 = [MEMORY[0x1E4F1CA48] array];
    v84 = [MEMORY[0x1E4F1CA48] array];
    float v10 = self;
    float v11 = [MEMORY[0x1E4F1CA48] array];
    float v12 = (float)Width;
    uint64_t v119 = 0;
    uint64_t v118 = 0;
    long long v124 = 0uLL;
    trackers = self->_trackers;
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __73__VCPVideoSaliencyAnalyzer_analyzeFrame_withTimestamp_andDuration_flags___block_invoke;
    v113[3] = &unk_1E62986A0;
    double v117 = (float)(1.0 / (float)Width);
    double v120 = (float)(-1.0 / (float)Height);
    long long v121 = xmmword_1BC281930;
    v116 = a3;
    v113[4] = self;
    id v14 = v11;
    id v114 = v14;
    int v122 = Width;
    int v123 = Height;
    id v15 = v82;
    id v115 = v15;
    v81 = v14;
    [(NSMutableDictionary *)trackers enumerateKeysAndObjectsUsingBlock:v113];
    long long v16 = *(_OWORD *)&v93->value;
    p_timeLastTracking->CMTimeEpoch epoch = v93->epoch;
    *(_OWORD *)&p_timeLastTracking->value = v16;
    [(NSMutableDictionary *)self->_trackers removeObjectsForKeys:v14];
    CMTime lhs = *v93;
    CMTime rhs = (CMTime)self->_timeLastDetection;
    CMTimeSubtract(&v112, &lhs, &rhs);
    v79 = v15;
    if (CMTimeGetSeconds(&v112) >= 1.0)
    {
      [(NSMutableDictionary *)self->_trackers removeAllObjects];
      saliencyAnalyer = self->_saliencyAnalyer;
      id v111 = 0;
      int v8 = [(VCPImageSaliencyAnalyzer *)saliencyAnalyer analyzePixelBuffer:a3 flags:&v125 results:&v111 cancel:&__block_literal_global_24];
      id v83 = v111;
      if (v8)
      {
LABEL_49:

        return v8;
      }
      obuint64_t j = [MEMORY[0x1E4F1CA48] array];
      double v23 = (void *)MEMORY[0x1E4F1CA48];
      double v24 = [v83 objectForKeyedSubscript:@"SaliencyResults"];
      id v25 = (id)[v23 arrayWithArray:v24];

      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      double v26 = [v83 objectForKeyedSubscript:@"SaliencyResults"];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v107 objects:v136 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v108;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v108 != v28) {
              objc_enumerationMutation(v26);
            }
            v30 = [*(id *)(*((void *)&v107 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
            double v31 = [v30 objectForKeyedSubscript:@"saliencyBounds"];
            if (v31)
            {
              v32 = [v30 objectForKeyedSubscript:@"saliencyConfidence"];
              [v32 floatValue];
              int v34 = v33;

              id v35 = [VCPSaliencyRegion alloc];
              NSRect v138 = NSRectFromString(v31);
              LODWORD(v36) = v34;
              float v37 = -[VCPSaliencyRegion initWith:confidence:](v35, "initWith:confidence:", v138.origin.x, v138.origin.y, v138.size.width, v138.size.height, v36);
              if (!v37)
              {

LABEL_45:
                int v8 = -108;
                goto LABEL_48;
              }
              [obj addObject:v37];
            }
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v107 objects:v136 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      [obj sortUsingComparator:&__block_literal_global_238];
      float v38 = self;
      LODWORD(v39) = 0.5;
      long long v40 = [(VCPVideoSaliencyAnalyzer *)self pruneRegions:obj withOverlapRatio:v39];
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v87 = v40;
      uint64_t v41 = [v87 countByEnumeratingWithState:&v103 objects:v135 count:16];
      if (v41)
      {
        int v42 = 0;
        double v43 = v12;
        double v44 = (float)-(float)Height;
        double v45 = (double)Height;
        uint64_t v89 = *(void *)v104;
LABEL_24:
        uint64_t v46 = 0;
        if (v42 <= 4) {
          int v47 = 4;
        }
        else {
          int v47 = v42;
        }
        uint64_t v48 = (v47 - v42);
        uint64_t v49 = v42;
        while (1)
        {
          if (*(void *)v104 != v89) {
            objc_enumerationMutation(v87);
          }
          if (v48 == v46) {
            break;
          }
          CGRect v50 = *(void **)(*((void *)&v103 + 1) + 8 * v46);
          [v50 bound];
          *(_OWORD *)&v102.b = v124;
          v102.a = v43;
          v102.d = v44;
          v102.tdouble x = 0.0;
          v102.tdouble y = v45;
          CGRect v140 = CGRectApplyAffineTransform(v139, &v102);
          double x = v140.origin.x;
          double y = v140.origin.y;
          double v53 = v140.size.width;
          double v54 = v140.size.height;
          v55 = [VCPVideoObjectTracker alloc];
          long long v100 = *(_OWORD *)&v93->value;
          CMTimeEpoch epoch = v93->epoch;
          v56 = -[VCPVideoObjectTracker initWithObjectBounds:inFrame:timestamp:](v55, "initWithObjectBounds:inFrame:timestamp:", a3, &v100, x, y, v53, v54);
          if (!v56)
          {

            goto LABEL_45;
          }
          v57 = v38->_trackers;
          v58 = [NSNumber numberWithInt:v49 + v46];
          [(NSMutableDictionary *)v57 setObject:v56 forKey:v58];

          confidences = self->_confidences;
          v60 = NSNumber;
          [v50 confidence];
          v61 = objc_msgSend(v60, "numberWithFloat:");
          v62 = [NSNumber numberWithInt:v49 + v46];
          [(NSMutableDictionary *)confidences setObject:v61 forKey:v62];

          [v84 addObject:v50];
          ++v46;
          float v38 = self;
          if (v41 == v46)
          {
            uint64_t v41 = [v87 countByEnumeratingWithState:&v103 objects:v135 count:16];
            int v42 = v49 + v46;
            if (v41) {
              goto LABEL_24;
            }
            break;
          }
        }
      }

      long long v63 = *(_OWORD *)&v93->value;
      self->_timeLastDetection.CMTimeEpoch epoch = v93->epoch;
      *(_OWORD *)&self->_timeLastDetection.value = v63;

      float v10 = self;
    }
    else
    {
      [v84 addObjectsFromArray:v15];
      id v83 = 0;
    }
    LODWORD(v17) = 1045220557;
    obuint64_t j = [(VCPVideoSaliencyAnalyzer *)v10 pruneRegions:v84 withOverlapRatio:v17];
    [(NSMutableArray *)v10->_latestRegions removeAllObjects];
    [(NSMutableArray *)v10->_latestRegions addObjectsFromArray:obj];
    float v18 = (void *)[obj copy];
    +[VCPSaliencyRegion attachSalientRegions:v18 toPixelBuffer:a3];

    double v19 = self;
    if ([obj count] && !-[NSArray count](self->_activeRegions, "count"))
    {
      objc_storeStrong((id *)&self->_activeRegions, obj);
      double v19 = self;
      int64_t v20 = v93->epoch;
      *(_OWORD *)&self->_start.value = *(_OWORD *)&v93->value;
      self->_start.CMTimeEpoch epoch = v20;
    }
    p_start = (CMTime *)&v19->_start;
    CMTime lhs = *v93;
    CMTime rhs = (CMTime)v19->_start;
    CMTimeSubtract(&v99, &lhs, &rhs);
    if (CMTimeGetSeconds(&v99) >= 1.0)
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      v86 = v19->_activeRegions;
      uint64_t v64 = [(NSArray *)v86 countByEnumeratingWithState:&v95 objects:v134 count:16];
      if (v64)
      {
        CVPixelBufferRef pixelBuffera = *(CVPixelBufferRef *)v96;
        do
        {
          for (uint64_t j = 0; j != v64; ++j)
          {
            if (*(CVPixelBufferRef *)v96 != pixelBuffera) {
              objc_enumerationMutation(v86);
            }
            v66 = *(void **)(*((void *)&v95 + 1) + 8 * j);
            v132[0] = @"saliencyBounds";
            [v66 bound];
            v67 = NSStringFromRect(v141);
            v133[0] = v67;
            v132[1] = @"saliencyConfidence";
            v68 = NSNumber;
            [v66 confidence];
            v69 = objc_msgSend(v68, "numberWithFloat:");
            v133[1] = v69;
            v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:2];

            detections = self->_detections;
            v130[0] = @"start";
            CMTime lhs = *p_start;
            CFDictionaryRef v72 = CMTimeCopyAsDictionary(&lhs, 0);
            v131[0] = v72;
            v130[1] = @"duration";
            CMTime lhs = *v93;
            CMTime rhs = *p_start;
            CMTimeSubtract(&v94, &lhs, &rhs);
            CMTime lhs = v94;
            CFDictionaryRef v73 = CMTimeCopyAsDictionary(&lhs, 0);
            v130[2] = @"attributes";
            v131[1] = v73;
            v131[2] = v70;
            v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v131 forKeys:v130 count:3];
            [(NSMutableArray *)detections addObject:v74];
          }
          uint64_t v64 = [(NSArray *)v86 countByEnumeratingWithState:&v95 objects:v134 count:16];
        }
        while (v64);
      }

      if ([obj count])
      {
        v75 = (NSArray *)obj;
      }
      else
      {
        v75 = [MEMORY[0x1E4F1C978] array];
        v93 = (CMTime *)MEMORY[0x1E4F1F9F8];
      }
      activeRegions = self->_activeRegions;
      self->_activeRegions = v75;

      int v8 = 0;
      long long v77 = *(_OWORD *)&v93->value;
      p_start->CMTimeEpoch epoch = v93->epoch;
      *(_OWORD *)&p_start->value = v77;
    }
    else
    {
      int v8 = 0;
    }
LABEL_48:

    goto LABEL_49;
  }
  unsigned int v7 = (void *)[(NSMutableArray *)self->_latestRegions copy];
  +[VCPSaliencyRegion attachSalientRegions:v7 toPixelBuffer:a3];

  return 0;
}

void __73__VCPVideoSaliencyAnalyzer_analyzeFrame_withTimestamp_andDuration_flags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 trackObjectInFrame:*(void *)(a1 + 56)];
  [v6 objectBounds];
  long long v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v34.a = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v34.c = v7;
  *(_OWORD *)&v34.tdouble x = *(_OWORD *)(a1 + 96);
  CGRect v36 = CGRectApplyAffineTransform(v35, &v34);
  double x = v36.origin.x;
  double y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;
  [v6 objectBounds];
  if (CGRectIsEmpty(v37)
    || (int)[v6 lostCount] > 10
    || objc_msgSend(*(id *)(a1 + 32), "isOutOfBoundary:", x, y, width, height))
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    float v12 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKeyedSubscript:v5];

    if (v12)
    {
      uint64_t v13 = *(id **)(a1 + 32);
      id v14 = [v13[14] objectForKeyedSubscript:v5];
      [v14 floatValue];
      int v33 = v15;
      [v6 objectBoundsInitial];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      [v6 objectBounds];
      double v32 = v24;
      LODWORD(v24) = v33;
      objc_msgSend(v13, "updateConfidence:prevBound:newBound:width:height:", *(unsigned int *)(a1 + 112), *(unsigned int *)(a1 + 116), v24, v17, v19, v21, v23, *(void *)&v32, v25, v26, v27);
      LODWORD(v23) = v28;

      float v29 = [VCPSaliencyRegion alloc];
      LODWORD(v30) = LODWORD(v23);
      double v31 = -[VCPSaliencyRegion initWith:confidence:](v29, "initWith:confidence:", x, y, width, height, v30);
      [*(id *)(a1 + 48) addObject:v31];
    }
  }
}

uint64_t __73__VCPVideoSaliencyAnalyzer_analyzeFrame_withTimestamp_andDuration_flags___block_invoke_2()
{
  return 0;
}

uint64_t __73__VCPVideoSaliencyAnalyzer_analyzeFrame_withTimestamp_andDuration_flags___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  float v7 = v6;
  [v5 confidence];
  if (v7 >= v8)
  {
    [v5 confidence];
    float v11 = v10;
    [v5 confidence];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_activeRegions count])
  {
    memset(&v29, 0, sizeof(v29));
    long long v4 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.CMTimeEpoch epoch = v4;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v28, &range);
    CMTime lhs = v28;
    CMTime rhs = (CMTime)self->_start;
    CMTimeSubtract(&v29, &lhs, &rhs);
    CMTime time = v29;
    if (CMTimeGetSeconds(&time) > 1.0)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      obuint64_t j = self->_activeRegions;
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v36 count:16];
      if (v5)
      {
        uint64_t v20 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(obj);
            }
            float v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v34[0] = @"saliencyBounds";
            [v7 bound];
            float v8 = NSStringFromRect(v38);
            v35[0] = v8;
            v34[1] = @"saliencyConfidence";
            uint64_t v9 = NSNumber;
            [v7 confidence];
            float v10 = objc_msgSend(v9, "numberWithFloat:");
            v35[1] = v10;
            float v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

            detections = self->_detections;
            CMTime lhs = (CMTime)self->_start;
            v32[0] = @"start";
            CFDictionaryRef v13 = CMTimeCopyAsDictionary(&lhs, 0);
            v33[0] = v13;
            v32[1] = @"duration";
            CMTime lhs = v29;
            CFDictionaryRef v14 = CMTimeCopyAsDictionary(&lhs, 0);
            v32[2] = @"attributes";
            v33[1] = v14;
            v33[2] = v11;
            int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
            [(NSMutableArray *)detections addObject:v15];
          }
          uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v36 count:16];
        }
        while (v5);
      }
    }
    double v16 = [MEMORY[0x1E4F1C978] array];
    activeRegions = self->_activeRegions;
    self->_activeRegions = v16;
  }
  return 0;
}

- (id)results
{
  v7[1] = *MEMORY[0x1E4F143B8];
  float v3 = (void *)[(NSMutableArray *)self->_detections count];
  if (v3)
  {
    detections = self->_detections;
    float v6 = @"SaliencyResults";
    v7[0] = detections;
    float v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRegions, 0);
  objc_storeStrong((id *)&self->_confidences, 0);
  objc_storeStrong((id *)&self->_trackers, 0);
  objc_storeStrong((id *)&self->_saliencyAnalyer, 0);
  objc_storeStrong((id *)&self->_latestRegions, 0);
  objc_storeStrong((id *)&self->_detections, 0);
}

@end