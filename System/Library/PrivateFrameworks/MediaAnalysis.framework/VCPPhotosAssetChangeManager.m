@interface VCPPhotosAssetChangeManager
+ (id)managerForPhotoLibrary:(id)a3;
+ (signed)sensitivityFromAnalysis:(id)a3;
- (VCPPhotosAssetChangeManager)initWithPhotoLibrary:(id)a3;
- (id)matchPerson:(CGRect)a3 withPHFaces:(id)a4 withMinIOU:(float)a5 iou:(float *)a6;
- (int)associateTraitsForAsset:(id)a3 withAnalysis:(id)a4 result:(id)a5;
- (int)associateTraitsForMovieAsset:(id)a3 withAnalysis:(id)a4 result:(id)a5;
- (int)associateTraitsWithFaceTorspPrints:(id)a3 forAsset:(id)a4 withAnalysis:(id)a5 results:(id)a6;
- (int)publishPendingChanges;
- (int)updateAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5;
- (int)updateImageAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5;
- (int)updateLegacyAsset:(id)a3 withAnalysis:(id)a4;
- (int)updateMovieAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5;
- (void)dealloc;
@end

@implementation VCPPhotosAssetChangeManager

- (VCPPhotosAssetChangeManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPPhotosAssetChangeManager;
  v6 = [(VCPPhotosAssetChangeManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint64_t v8 = +[NSMutableArray array];
    pendingChanges = v7->_pendingChanges;
    v7->_pendingChanges = (NSMutableArray *)v8;

    v7->_pendingResourceChangeCount = 0;
  }

  return v7;
}

+ (id)managerForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v3];

  return v4;
}

+ (signed)sensitivityFromAnalysis:(id)a3
{
  id v3 = objc_msgSend(a3, "vcp_results");
  id v4 = [v3 objectForKeyedSubscript:@"SafetyResults"];

  if (v4 && [v4 count])
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 objectForKeyedSubscript:@"attributes"];

    if (v6)
    {
      v7 = [v6 objectForKeyedSubscript:@"Sensitivity"];
      uint64_t v8 = v7;
      if (v7) {
        signed __int16 v9 = (unsigned __int16)[v7 intValue];
      }
      else {
        signed __int16 v9 = -1;
      }
    }
    else
    {
      signed __int16 v9 = -1;
    }
  }
  else
  {
    signed __int16 v9 = -1;
  }

  return v9;
}

- (void)dealloc
{
  [(VCPPhotosAssetChangeManager *)self publishPendingChanges];
  v3.receiver = self;
  v3.super_class = (Class)VCPPhotosAssetChangeManager;
  [(VCPPhotosAssetChangeManager *)&v3 dealloc];
}

- (id)matchPerson:(CGRect)a3 withPHFaces:(id)a4 withMinIOU:(float)a5 iou:(float *)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  objc_super v11 = a4;
  v12 = 0;
  id v13 = [v11 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v13)
  {
    float v44 = 0.0;
    v38 = v11;
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v14 = *(void *)v48;
  float v44 = 0.0;
  CGFloat v43 = height;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v48 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      [v16 bodyWidth];
      double v18 = v17;
      [v16 bodyHeight];
      if (v18 * v19 > 0.0)
      {
        [v16 bodyCenterX];
        double v21 = v20;
        [v16 bodyWidth];
        double v23 = v22;
        [v16 bodyCenterY];
        double v25 = v24;
        [v16 bodyHeight];
        double v27 = v26;
        [v16 bodyWidth];
        CGFloat v29 = v28;
        [v16 bodyHeight];
        v60.size.CGFloat height = v30;
        CGFloat v31 = v21 + v23 * -0.5;
        CGFloat v32 = v25 + v27 * -0.5;
        v57.origin.CGFloat x = x;
        v57.origin.CGFloat y = y;
        v57.size.CGFloat width = width;
        v57.size.CGFloat height = v43;
        v60.origin.CGFloat x = v31;
        v60.origin.CGFloat y = v32;
        v60.size.CGFloat width = v29;
        CGFloat v33 = v60.size.height;
        CGRect v58 = CGRectUnion(v57, v60);
        double v45 = v58.size.height;
        double v46 = v58.size.width;
        v58.origin.CGFloat x = x;
        v58.origin.CGFloat y = y;
        v58.size.CGFloat width = width;
        v58.size.CGFloat height = v43;
        v61.origin.CGFloat x = v31;
        v61.origin.CGFloat y = v32;
        v61.size.CGFloat width = v29;
        v61.size.CGFloat height = v33;
        CGRect v59 = CGRectIntersection(v58, v61);
        float v34 = v46 * v45;
        float v35 = 0.0;
        if (v34 != 0.0)
        {
          float v36 = v59.size.width * v59.size.height;
          float v35 = v36 / v34;
        }
        if (v35 > v44 && v35 > a5)
        {
          id v37 = v16;

          v12 = v37;
          float v44 = v35;
        }
      }
    }
    id v13 = [v11 countByEnumeratingWithState:&v47 objects:v55 count:16];
  }
  while (v13);

  if (v12 && (int)MediaAnalysisLogLevel() >= 7)
  {
    v38 = VCPLogInstance();
    os_log_type_t v39 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v38, v39))
    {
      v40 = [v12 localIdentifier];
      *(_DWORD *)buf = 138412546;
      v52 = v40;
      __int16 v53 = 2048;
      double v54 = v44;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "   [%@] found matchPerson with iou %f", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_20:
  if (a6) {
    *a6 = v44;
  }

  return v12;
}

- (int)associateTraitsForMovieAsset:(id)a3 withAnalysis:(id)a4 result:(id)a5
{
  id v53 = a3;
  id v57 = a4;
  id v7 = a5;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v8, v9))
    {
      v10 = [v53 localIdentifier];
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "   [%@] Associate PHFace HAR result for movie asset", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v90 = PHFacePropertySetClustering;
  objc_super v11 = +[NSArray arrayWithObjects:&v90 count:1];
  long long v50 = objc_msgSend(v53, "vcp_PHFaces:", v11);

  if (v50)
  {
    id v12 = [v50 count];
    int v13 = 0;
    if (v7 && v12)
    {
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v14 = v50;
      id v15 = [v14 countByEnumeratingWithState:&v78 objects:v89 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v79;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v79 != v16) {
              objc_enumerationMutation(v14);
            }
            [v7 setObject:&__NSArray0__struct forKeyedSubscript:*(void *)(*((void *)&v78 + 1) + 8 * i)];
          }
          id v15 = [v14 countByEnumeratingWithState:&v78 objects:v89 count:16];
        }
        while (v15);
      }

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id obj = v14;
      id v18 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
      int v13 = 0;
      if (v18)
      {
        uint64_t v55 = *(void *)v75;
        os_log_type_t type = VCPLogToOSLogType[7];
        *(void *)&long long v19 = 138413058;
        long long v49 = v19;
        do
        {
          double v20 = 0;
          int v21 = v13;
          id v56 = v18;
          do
          {
            int v58 = v21;
            if (*(void *)v75 != v55) {
              objc_enumerationMutation(obj);
            }
            CGRect v61 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v20);
            objc_msgSend(v57, "vcp_queryActionResultForPHFace:", v61);
            CFDictionaryRef v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            CFDictionaryRef v60 = v22;
            if (!v22)
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                double v25 = VCPLogInstance();
                if (os_log_type_enabled(v25, type))
                {
                  double v26 = [v53 localIdentifier];
                  double v27 = [v61 localIdentifier];
                  LODWORD(buf.start.value) = 138412546;
                  *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v26;
                  LOWORD(buf.start.flags) = 2112;
                  *(void *)((char *)&buf.start.flags + 2) = v27;
                  _os_log_impl((void *)&_mh_execute_header, v25, type, "   [%@] No matched action for PHFace %@", (uint8_t *)&buf, 0x16u);
                }
                int v24 = 7;
                goto LABEL_48;
              }
              int v24 = 7;
LABEL_49:
              int v13 = v58;
              goto LABEL_50;
            }
            CMTimeRangeMakeFromDictionary(&buf, v22);
            CMTimeValue value = buf.start.value;
            CMTimeFlags flags = buf.start.flags;
            CMTimeScale timescale = buf.start.timescale;
            if (buf.start.flags)
            {
              int v13 = -18;
              int v24 = 10;
              CMTimeFlags v65 = buf.duration.flags;
              if ((buf.duration.flags & 1) != 0 && !buf.duration.epoch)
              {
                CMTimeValue v64 = buf.duration.value;
                if ((buf.duration.value & 0x8000000000000000) == 0)
                {
                  CMTimeEpoch epoch = buf.start.epoch;
                  CMTimeScale v62 = buf.duration.timescale;
                  if ((int)MediaAnalysisLogLevel() >= 7)
                  {
                    double v28 = VCPLogInstance();
                    if (os_log_type_enabled(v28, type))
                    {
                      CGFloat v29 = [v53 localIdentifier];
                      CGFloat v30 = [v61 localIdentifier];
                      time.CMTimeValue value = value;
                      time.CMTimeScale timescale = timescale;
                      time.CMTimeFlags flags = flags;
                      time.CMTimeEpoch epoch = epoch;
                      CMTimeValue Seconds = CMTimeGetSeconds(&time);
                      rhs.CMTimeEpoch epoch = 0;
                      lhs.CMTimeValue value = value;
                      lhs.CMTimeScale timescale = timescale;
                      lhs.CMTimeFlags flags = flags;
                      lhs.CMTimeEpoch epoch = epoch;
                      rhs.CMTimeValue value = v64;
                      rhs.CMTimeScale timescale = v62;
                      rhs.CMTimeFlags flags = v65;
                      CMTimeAdd(&v72, &lhs, &rhs);
                      Float64 v32 = CMTimeGetSeconds(&v72);
                      LODWORD(buf.start.value) = v49;
                      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v29;
                      LOWORD(buf.start.flags) = 2112;
                      *(void *)((char *)&buf.start.flags + 2) = v30;
                      HIWORD(buf.start.epoch) = 2048;
                      buf.duration.CMTimeValue value = Seconds;
                      LOWORD(buf.duration.timescale) = 2048;
                      *(Float64 *)((char *)&buf.duration.timescale + 2) = v32;
                      _os_log_impl((void *)&_mh_execute_header, v28, type, "   [%@] Found match action for PHFace %@, at time [%f, %f]", (uint8_t *)&buf, 0x2Au);
                    }
                  }
                  CGFloat v33 = [(__CFDictionary *)v60 objectForKeyedSubscript:@"attributes", v49];
                  v51 = [v33 objectForKeyedSubscript:@"humanActions"];

                  float v34 = +[NSMutableArray array];
                  long long v70 = 0u;
                  long long v71 = 0u;
                  long long v68 = 0u;
                  long long v69 = 0u;
                  double v25 = v51;
                  id v35 = [v25 countByEnumeratingWithState:&v68 objects:v84 count:16];
                  if (v35)
                  {
                    uint64_t v36 = *(void *)v69;
                    while (2)
                    {
                      for (j = 0; j != v35; j = (char *)j + 1)
                      {
                        if (*(void *)v69 != v36) {
                          objc_enumerationMutation(v25);
                        }
                        v38 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
                        os_log_type_t v39 = [v25 objectForKeyedSubscript:v38];
                        [v39 floatValue];
                        float v41 = v40;

                        id v42 = objc_alloc((Class)PHDetectionTrait);
                        LOWORD(v38) = (unsigned __int16)[v38 intValue];
                        v67.CMTimeValue value = value;
                        v67.CMTimeScale timescale = timescale;
                        v67.CMTimeFlags flags = flags;
                        v67.CMTimeEpoch epoch = epoch;
                        double v43 = CMTimeGetSeconds(&v67);
                        v66.CMTimeValue value = v64;
                        v66.CMTimeScale timescale = v62;
                        v66.CMTimeFlags flags = v65;
                        v66.CMTimeEpoch epoch = 0;
                        id v44 = [v42 initWithType:1 value:(__int16)v38 score:v41 startTime:v43 duration:CMTimeGetSeconds(&v66)];
                        if (!v44)
                        {

                          int v24 = 10;
                          int v58 = -18;
                          goto LABEL_47;
                        }
                        [v34 addObject:v44];
                      }
                      id v35 = [v25 countByEnumeratingWithState:&v68 objects:v84 count:16];
                      if (v35) {
                        continue;
                      }
                      break;
                    }
                  }

                  if ([v34 count]) {
                    [v7 setObject:v34 forKeyedSubscript:v61];
                  }
                  int v24 = 0;
LABEL_47:

LABEL_48:
                  goto LABEL_49;
                }
              }
            }
            else
            {
              int v13 = -18;
              int v24 = 10;
            }
LABEL_50:

            if (v24 != 7 && v24) {
              goto LABEL_57;
            }
            double v20 = (char *)v20 + 1;
            int v21 = v13;
          }
          while (v20 != v56);
          id v18 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
        }
        while (v18);
      }
LABEL_57:

      if (v13)
      {
        [v7 removeAllObjects];
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          double v46 = VCPLogInstance();
          os_log_type_t v47 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v46, v47))
          {
            long long v48 = [v53 localIdentifier];
            LODWORD(buf.start.value) = 138412290;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v48;
            _os_log_impl((void *)&_mh_execute_header, v46, v47, "   [%@] Failed to populate detection traits", (uint8_t *)&buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (int)associateTraitsWithFaceTorspPrints:(id)a3 forAsset:(id)a4 withAnalysis:(id)a5 results:(id)a6
{
  id v9 = a3;
  id v61 = a4;
  id v10 = a5;
  CGRect v59 = v10;
  id v60 = a6;
  int v58 = v9;
  if (v10)
  {
    if (![v9 count])
    {
      LODWORD(v10) = 0;
      goto LABEL_56;
    }
    [v61 duration];
    LODWORD(v10) = 0;
    if (v60)
    {
      if (v11 > 0.0)
      {
        objc_msgSend(v59, "vcp_actionsAggregated");
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v53 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
        if (!v53)
        {
          LODWORD(v10) = 0;
          goto LABEL_55;
        }
        uint64_t v54 = *(void *)v68;
        os_log_type_t type = VCPLogToOSLogType[4];
LABEL_7:
        uint64_t v57 = 0;
        while (1)
        {
          if (*(void *)v68 != v54) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v67 + 1) + 8 * v57);
          uint64_t v55 = [obj objectForKeyedSubscript:v12];
          int v13 = [v55 objectForKeyedSubscript:@"humanActions"];
          id v14 = [v13 objectForKeyedSubscript:v12];
          [v14 floatValue];
          float v16 = v15;

          if (v16 != 0.0) {
            break;
          }
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            double v17 = VCPLogInstance();
            if (os_log_type_enabled(v17, type))
            {
              *(_WORD *)CMTimeRange buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, type, "associateTraitsForMovieAsset : action with confidence of 0.0f", buf, 2u);
            }
LABEL_41:
          }
          if ((id)++v57 == v53)
          {
            LODWORD(v10) = 0;
            id v53 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
            if (v53) {
              goto LABEL_7;
            }
LABEL_55:

            goto LABEL_56;
          }
        }
        id v18 = objc_alloc((Class)PHDetectionTrait);
        signed __int16 v19 = (unsigned __int16)[v12 intValue];
        [v61 duration];
        v51 = [v18 initWithType:1 value:v19 score:v16 startTime:0.0 duration:v20];
        if (!v51) {
          goto LABEL_53;
        }
        int v21 = [v55 objectForKeyedSubscript:@"torsoPrint"];
        long long v50 = v21;
        if (v21)
        {
          CFDictionaryRef v22 = [objc_alloc((Class)VNTorsoprint) initWithState:v21 error:0];
          if (!v22)
          {
            int v48 = MediaAnalysisLogLevel();
            if (v48 >= 4)
            {
              CFDictionaryRef v22 = VCPLogInstance();
              if (os_log_type_enabled(v22, type))
              {
                *(_WORD *)CMTimeRange buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v22, type, "queryActionResultForPHFace : failed to decode torsoprintAction", buf, 2u);
              }
LABEL_51:

              int v21 = v50;
            }

LABEL_53:
            LODWORD(v10) = -18;
            goto LABEL_55;
          }
        }
        else
        {
          CFDictionaryRef v22 = 0;
        }
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v23 = v58;
        id v24 = [v23 countByEnumeratingWithState:&v63 objects:v74 count:16];
        if (v24)
        {
          unsigned int v25 = 0;
          uint64_t v26 = *(void *)v64;
          uint64_t v27 = 0xFFFFFFFFLL;
          float v28 = 1.0;
          while (2)
          {
            CGFloat v29 = 0;
            uint64_t v30 = v25;
            unsigned int v52 = v25 + v24;
            do
            {
              if (*(void *)v64 != v26) {
                objc_enumerationMutation(v23);
              }
              CGFloat v31 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v29);
              Float64 v32 = [v31 torsoprint];
              BOOL v33 = v32 == 0;

              if (!v33)
              {
                float v34 = [v31 torsoprint];
                id v62 = 0;
                id v35 = [v34 computeDistance:v22 withDistanceFunction:0 error:&v62];
                id v36 = v62;

                if (v36)
                {
                  if ((int)MediaAnalysisLogLevel() >= 3)
                  {
                    double v45 = VCPLogInstance();
                    os_log_type_t v46 = VCPLogToOSLogType[3];
                    if (os_log_type_enabled(v45, v46))
                    {
                      *(_DWORD *)CMTimeRange buf = 138412290;
                      id v73 = v36;
                      _os_log_impl((void *)&_mh_execute_header, v45, v46, "%@", buf, 0xCu);
                    }
                  }
                  goto LABEL_51;
                }
                [v35 floatValue];
                if (v28 <= 0.3) {
                  float v38 = v28;
                }
                else {
                  float v38 = 0.3;
                }
                if (v37 < v38)
                {
                  [v35 floatValue];
                  float v28 = v39;
                  uint64_t v27 = (uint64_t)v29 + v30;
                }
              }
              CGFloat v29 = (char *)v29 + 1;
            }
            while (v24 != v29);
            id v24 = [v23 countByEnumeratingWithState:&v63 objects:v74 count:16];
            unsigned int v25 = v52;
            if (v24) {
              continue;
            }
            break;
          }

          if ((v27 & 0x80000000) == 0)
          {
            float v40 = +[NSNumber numberWithInt:v27];
            float v41 = [v60 objectForKeyedSubscript:v40];
            BOOL v42 = v41 == 0;

            if (v42)
            {
              long long v71 = v51;
              id v23 = +[NSArray arrayWithObjects:&v71 count:1];
              double v43 = +[NSMutableArray arrayWithArray:v23];
              id v44 = +[NSNumber numberWithInt:v27];
              [v60 setObject:v43 forKeyedSubscript:v44];
            }
            else
            {
              id v23 = +[NSNumber numberWithInt:v27];
              double v43 = [v60 objectForKeyedSubscript:v23];
              [v43 addObject:v51];
            }

            goto LABEL_39;
          }
        }
        else
        {
LABEL_39:
        }
        double v17 = v51;
        goto LABEL_41;
      }
    }
  }
LABEL_56:

  return (int)v10;
}

- (int)associateTraitsForAsset:(id)a3 withAnalysis:(id)a4 result:(id)a5
{
  id v8 = a3;
  id v117 = a4;
  id v9 = a5;
  v115 = v8;
  id v10 = objc_msgSend(v8, "vcp_PHFaces:", 0);
  v116 = v10;
  if (!v10)
  {
    int v12 = 0;
    goto LABEL_103;
  }
  id v11 = [v10 count];
  int v12 = 0;
  if (v9 && v11)
  {
    v106 = self;
    int v13 = +[NSMutableDictionary dictionary];
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v14 = v116;
    id v15 = [v14 countByEnumeratingWithState:&v144 objects:v155 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v145;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v145 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v144 + 1) + 8 * i);
          signed __int16 v19 = [v18 localIdentifier];
          BOOL v20 = v19 == 0;

          if (!v20)
          {
            int v21 = [v18 localIdentifier];
            [v13 setObject:v18 forKeyedSubscript:v21];
          }
          [v9 setObject:&__NSArray0__struct forKeyedSubscript:v18];
        }
        id v15 = [v14 countByEnumeratingWithState:&v144 objects:v155 count:16];
      }
      while (v15);
    }

    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    CFDictionaryRef v22 = objc_msgSend(v117, "vcp_results");
    id obj = [v22 objectForKeyedSubscript:@"HumanActionClassificationResults"];

    id v111 = [obj countByEnumeratingWithState:&v140 objects:v154 count:16];
    if (v111)
    {
      uint64_t v118 = *(void *)v141;
      os_log_type_t type = VCPLogToOSLogType[7];
      os_log_type_t v103 = VCPLogToOSLogType[4];
      do
      {
        id v121 = 0;
        do
        {
          if (*(void *)v141 != v118) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v140 + 1) + 8 * (void)v121);
          id v24 = [v23 objectForKeyedSubscript:@"attributes"];
          v123 = [v24 objectForKeyedSubscript:@"faceIdentifier"];

          unsigned int v25 = v123;
          if (v123)
          {
            uint64_t v26 = [v13 objectForKeyedSubscript:v123];
            BOOL v27 = v26 == 0;

            if (!v27) {
              goto LABEL_26;
            }
            float v28 = [v23 objectForKeyedSubscript:@"attributes"];
            CGFloat v29 = [v28 objectForKeyedSubscript:@"humanBounds"];
            NSRect v156 = NSRectFromString(v29);
            double x = v156.origin.x;
            double y = v156.origin.y;
            double width = v156.size.width;
            double height = v156.size.height;

            LODWORD(v34) = 1060320051;
            id v35 = -[VCPPhotosAssetChangeManager matchPerson:withPHFaces:withMinIOU:iou:](v106, "matchPerson:withPHFaces:withMinIOU:iou:", v14, 0, x, y, width, height, v34);
            unsigned int v25 = v123;
            if (v35)
            {
              [v13 setObject:v35 forKeyedSubscript:v123];
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                id v36 = VCPLogInstance();
                if (os_log_type_enabled(v36, type))
                {
                  float v37 = [v115 localIdentifier];
                  float v38 = [v35 localIdentifier];
                  LODWORD(buf.start.value) = 138412802;
                  *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v37;
                  LOWORD(buf.start.flags) = 2112;
                  *(void *)((char *)&buf.start.flags + 2) = v38;
                  HIWORD(buf.start.epoch) = 2112;
                  buf.duration.CMTimeValue value = (CMTimeValue)v123;
                  _os_log_impl((void *)&_mh_execute_header, v36, type, "   [%@] Associated PHFace (%@) with HAR result localIdentifier (%@)", (uint8_t *)&buf, 0x20u);
                }
              }

LABEL_26:
              memset(&buf, 0, sizeof(buf));
              CMTimeRangeMakeFromDictionary(&buf, (CFDictionaryRef)v23);
              float v39 = 0.0;
              if ((buf.start.flags & 1) != 0 && (buf.duration.flags & 1) != 0 && !buf.duration.epoch)
              {
                float v40 = 0.0;
                if ((buf.duration.value & 0x8000000000000000) == 0)
                {
                  CMTime time = buf.start;
                  double Seconds = CMTimeGetSeconds(&time);
                  CMTime duration = buf.duration;
                  float v40 = Seconds;
                  float v39 = CMTimeGetSeconds(&duration);
                }
              }
              else
              {
                float v40 = 0.0;
              }
              v109 = [v13 objectForKeyedSubscript:v123];
              BOOL v42 = [v23 objectForKeyedSubscript:@"attributes"];
              v108 = [v42 objectForKeyedSubscript:@"humanActions"];

              double v43 = +[NSMutableArray array];
              long long v136 = 0u;
              long long v137 = 0u;
              long long v134 = 0u;
              long long v135 = 0u;
              id v44 = v108;
              id v45 = [v44 countByEnumeratingWithState:&v134 objects:v152 count:16];
              if (v45)
              {
                uint64_t v46 = *(void *)v135;
                double v47 = v40;
                double v48 = v39;
LABEL_34:
                uint64_t v49 = 0;
                while (1)
                {
                  if (*(void *)v135 != v46) {
                    objc_enumerationMutation(v44);
                  }
                  long long v50 = *(void **)(*((void *)&v134 + 1) + 8 * v49);
                  v51 = [v44 objectForKeyedSubscript:v50];
                  [v51 floatValue];
                  float v53 = v52;

                  id v54 = objc_msgSend(objc_alloc((Class)PHDetectionTrait), "initWithType:value:score:startTime:duration:", 1, (__int16)objc_msgSend(v50, "intValue"), v53, v47, v48);
                  if (!v54) {
                    break;
                  }
                  [v43 addObject:v54];

                  if (v45 == (id)++v49)
                  {
                    id v45 = [v44 countByEnumeratingWithState:&v134 objects:v152 count:16];
                    if (!v45) {
                      goto LABEL_40;
                    }
                    goto LABEL_34;
                  }
                }

LABEL_95:
                [v9 removeAllObjects];
                if ((int)MediaAnalysisLogLevel() < 3)
                {
                  int v12 = -18;
                }
                else
                {
                  v96 = VCPLogInstance();
                  os_log_type_t v97 = VCPLogToOSLogType[3];
                  if (os_log_type_enabled(v96, v97))
                  {
                    v98 = [v115 localIdentifier];
                    LODWORD(buf.start.value) = 138412290;
                    *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v98;
                    _os_log_impl((void *)&_mh_execute_header, v96, v97, "   [%@] Failed to populate detection traits", (uint8_t *)&buf, 0xCu);
                  }
                  int v12 = -18;
LABEL_101:
                }
                goto LABEL_103;
              }
LABEL_40:

              if ([v43 count]) {
                [v9 setObject:v43 forKeyedSubscript:v109];
              }

LABEL_43:
              unsigned int v25 = v123;
              goto LABEL_44;
            }
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              uint64_t v55 = VCPLogInstance();
              if (os_log_type_enabled(v55, v103))
              {
                id v56 = [v115 localIdentifier];
                LODWORD(buf.start.value) = 138412546;
                *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v56;
                LOWORD(buf.start.flags) = 2112;
                *(void *)((char *)&buf.start.flags + 2) = v123;
                _os_log_impl((void *)&_mh_execute_header, v55, v103, "   [%@] No matched PHFace for HAR result localIdentifier (%@)", (uint8_t *)&buf, 0x16u);
              }
              goto LABEL_43;
            }
          }
LABEL_44:

          id v121 = (char *)v121 + 1;
        }
        while (v121 != v111);
        id v57 = [obj countByEnumeratingWithState:&v140 objects:v154 count:16];
        id v111 = v57;
      }
      while (v57);
    }

    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    int v58 = objc_msgSend(v117, "vcp_results");
    id obj = [v58 objectForKeyedSubscript:@"HumanActionResults"];

    id v105 = [obj countByEnumeratingWithState:&v130 objects:v151 count:16];
    if (!v105) {
      goto LABEL_91;
    }
    uint64_t v107 = *(void *)v131;
    os_log_type_t v102 = VCPLogToOSLogType[7];
    os_log_type_t v101 = VCPLogToOSLogType[4];
    *(void *)&long long v59 = 138412546;
    long long v100 = v59;
LABEL_53:
    uint64_t v113 = 0;
    while (1)
    {
      if (*(void *)v131 != v107) {
        objc_enumerationMutation(obj);
      }
      id v60 = *(void **)(*((void *)&v130 + 1) + 8 * v113);
      v123 = objc_msgSend(v60, "objectForKeyedSubscript:", @"attributes", v100);
      id v61 = [v123 objectForKeyedSubscript:@"faceIdentifier"];
      if (!v61) {
        goto LABEL_84;
      }
      v112 = v61;
      id v62 = [v13 objectForKeyedSubscript:v61];
      BOOL v63 = v62 == 0;

      if (!v63) {
        goto LABEL_64;
      }
      long long v64 = [v60 objectForKeyedSubscript:@"attributes"];
      long long v65 = [v64 objectForKeyedSubscript:@"humanBounds"];
      NSRect v157 = NSRectFromString(v65);
      double v66 = v157.origin.x;
      double v67 = v157.origin.y;
      double v68 = v157.size.width;
      double v69 = v157.size.height;

      LODWORD(v70) = 1060320051;
      long long v71 = -[VCPPhotosAssetChangeManager matchPerson:withPHFaces:withMinIOU:iou:](v106, "matchPerson:withPHFaces:withMinIOU:iou:", v14, 0, v66, v67, v68, v69, v70);
      id v61 = v112;
      if (v71) {
        break;
      }
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_84;
      }
      v93 = VCPLogInstance();
      if (os_log_type_enabled(v93, v101))
      {
        v94 = [v115 localIdentifier];
        LODWORD(buf.start.value) = v100;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v94;
        LOWORD(buf.start.flags) = 2112;
        *(void *)((char *)&buf.start.flags + 2) = v112;
        _os_log_impl((void *)&_mh_execute_header, v93, v101, "   [%@] No matched PHFace for action result localIdentifier (%@)", (uint8_t *)&buf, 0x16u);
      }
LABEL_83:
      id v61 = v112;
LABEL_84:

      if ((id)++v113 == v105)
      {
        id v95 = [obj countByEnumeratingWithState:&v130 objects:v151 count:16];
        id v105 = v95;
        if (!v95)
        {
LABEL_91:
          int v12 = 0;
          v96 = obj;
          goto LABEL_101;
        }
        goto LABEL_53;
      }
    }
    [v13 setObject:v71 forKeyedSubscript:v112];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      CMTime v72 = VCPLogInstance();
      if (os_log_type_enabled(v72, v102))
      {
        id v73 = [v115 localIdentifier];
        long long v74 = [v71 localIdentifier];
        LODWORD(buf.start.value) = 138412802;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v73;
        LOWORD(buf.start.flags) = 2112;
        *(void *)((char *)&buf.start.flags + 2) = v74;
        HIWORD(buf.start.epoch) = 2112;
        buf.duration.CMTimeValue value = (CMTimeValue)v112;
        _os_log_impl((void *)&_mh_execute_header, v72, v102, "   [%@] Associated PHFace (%@) with action result localIdentifier (%@)", (uint8_t *)&buf, 0x20u);
      }
    }

LABEL_64:
    memset(&buf, 0, sizeof(buf));
    CMTimeRangeMakeFromDictionary(&buf, (CFDictionaryRef)v60);
    float v75 = 0.0;
    if ((buf.start.flags & 1) != 0 && (buf.duration.flags & 1) != 0 && !buf.duration.epoch)
    {
      float v76 = 0.0;
      if ((buf.duration.value & 0x8000000000000000) == 0)
      {
        CMTime start = buf.start;
        double v77 = CMTimeGetSeconds(&start);
        CMTime v128 = buf.duration;
        float v75 = v77;
        float v76 = CMTimeGetSeconds(&v128);
      }
    }
    else
    {
      float v76 = 0.0;
    }
    v110 = [v13 objectForKeyedSubscript:v112];
    v119 = +[NSMutableArray array];
    long long v78 = [v9 objectForKeyedSubscript:v110];
    [v119 addObjectsFromArray:v78];

    v149[0] = @"absoluteScore";
    v149[1] = @"relativeScore";
    v150[0] = &off_10022F238;
    v150[1] = &off_10022F250;
    long long v79 = +[NSDictionary dictionaryWithObjects:v150 forKeys:v149 count:2];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v122 = v79;
    id v80 = [v122 countByEnumeratingWithState:&v124 objects:v148 count:16];
    if (v80)
    {
      uint64_t v120 = *(void *)v125;
      double v81 = v75;
      double v82 = v76;
      while (2)
      {
        for (j = 0; j != v80; j = (char *)j + 1)
        {
          if (*(void *)v125 != v120) {
            objc_enumerationMutation(v122);
          }
          uint64_t v84 = *(void *)(*((void *)&v124 + 1) + 8 * (void)j);
          v85 = [v123 objectForKeyedSubscript:v84];
          BOOL v86 = v85 == 0;

          if (!v86)
          {
            id v87 = objc_alloc((Class)PHDetectionTrait);
            v88 = [v122 objectForKeyedSubscript:v84];
            signed __int16 v89 = (unsigned __int16)[v88 intValue];
            uint64_t v90 = [v123 objectForKeyedSubscript:v84];
            [v90 floatValue];
            id v92 = [v87 initWithType:2 value:v89 score:v91 startTime:v81 duration:v82];

            if (!v92)
            {

              goto LABEL_95;
            }
            [v119 addObject:v92];
          }
        }
        id v80 = [v122 countByEnumeratingWithState:&v124 objects:v148 count:16];
        if (v80) {
          continue;
        }
        break;
      }
    }

    if ([v119 count]) {
      [v9 setObject:v119 forKeyedSubscript:v110];
    }

    goto LABEL_83;
  }
LABEL_103:

  return v12;
}

- (int)updateImageAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v146 = a3;
  id v147 = a4;
  BOOL v141 = v5;
  if (v5 && objc_msgSend(v146, "vcp_isLivePhoto"))
  {
    unint64_t v7 = (unint64_t)+[PHAsset vcp_fullAnalysisImageOnlyTypes];
    if (!v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        p_super = VCPLogInstance();
        os_log_type_t v9 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(p_super, v9))
        {
          id v10 = [v146 localIdentifier];
          *(_DWORD *)CMTimeRange buf = 138412290;
          v175 = v10;
          _os_log_impl((void *)&_mh_execute_header, p_super, v9, "[%@] updateImageAsset : required types is MediaAnalysisTypeNone; skip",
            buf,
            0xCu);

          int v11 = 0;
LABEL_148:

          goto LABEL_149;
        }
        goto LABEL_38;
      }
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v7 = (unint64_t)+[PHAsset vcp_fullAnalysisImageOnlyTypes] | 8;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    int v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = [v146 localIdentifier];
      MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(v147, "vcp_types"));
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v16 = (unint64_t)objc_msgSend(v147, "vcp_types");
      MediaAnalysisTypeShortDescription(v7);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v18 = objc_msgSend(v146, "vcp_isLivePhoto");
      *(_DWORD *)CMTimeRange buf = 138413570;
      CFStringRef v19 = @"NO";
      v175 = v14;
      __int16 v176 = 2112;
      __int16 v178 = 2048;
      if (v18) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      uint64_t v177 = (uint64_t)v15;
      if (v5) {
        CFStringRef v19 = @"YES";
      }
      unint64_t v179 = v16 & v7;
      __int16 v180 = 2112;
      id v181 = v17;
      __int16 v182 = 2112;
      CFStringRef v183 = v20;
      __int16 v184 = 2112;
      CFStringRef v185 = v19;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] Update image asset with analysis type %@ (%llu), required type %@, isLivePhoto:%@, isImageOnly:%@", buf, 0x3Eu);
    }
  }
  if ((v7 & ~(unint64_t)objc_msgSend(v147, "vcp_types")) == 0)
  {
    int v21 = objc_alloc_init(VCPImageChangeEntry);
    long long v144 = v21;
    [(VCPImageChangeEntry *)v21 setAsset:v146];
    [(VCPImageChangeEntry *)v21 setImageOnly:v141];
    if (((unint64_t)objc_msgSend(v147, "vcp_types") & 0x2000000000000) != 0)
    {
      BOOL v27 = objc_msgSend(v147, "vcp_results");
      uint64_t v142 = [v27 objectForKeyedSubscript:@"MiCaImageCaptionResults"];

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        float v28 = VCPLogInstance();
        os_log_type_t v29 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = [v146 localIdentifier];
          *(_DWORD *)CMTimeRange buf = 138412546;
          v175 = v30;
          __int16 v176 = 2112;
          uint64_t v177 = v142;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "[%@] Update Asset with MediaAnalysisMiCaImageCaptionResultsKey: %@", buf, 0x16u);
        }
      }
      CFDictionaryRef v22 = (void *)v142;
    }
    else
    {
      CFDictionaryRef v22 = 0;
    }
    long long v143 = v22;
    if ([v22 count])
    {
      CGFloat v31 = [v143 objectAtIndexedSubscript:0];
      Float64 v32 = [v31 objectForKeyedSubscript:@"attributes"];
      BOOL v33 = [v32 objectForKeyedSubscript:@"imageCaptionText"];

      [(VCPImageChangeEntry *)v21 setImageCaption:v33];
    }
    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled")&& ((unint64_t)objc_msgSend(v147, "vcp_types") & 0x1000000000000) != 0)
    {
      [(VCPImageChangeEntry *)v21 setImageEmbeddingVersion:70];
    }
    if (!objc_msgSend(v146, "vcp_isLivePhoto") || -[VCPImageChangeEntry imageOnly](v21, "imageOnly"))
    {
LABEL_118:
      id v122 = objc_msgSend(v147, "vcp_results");
      v123 = [v122 objectForKeyedSubscript:@"FaceResults"];
      -[VCPImageChangeEntry setFaceCount:](v21, "setFaceCount:", [v123 count]);

      long long v124 = v144;
      if ((objc_msgSend(v147, "vcp_types") & 0x40000000) != 0)
      {
        v139 = +[NSMutableDictionary dictionary];
        int v11 = -[VCPPhotosAssetChangeManager associateTraitsForAsset:withAnalysis:result:](self, "associateTraitsForAsset:withAnalysis:result:", v146, v147);
        if (v11)
        {
LABEL_146:

          goto LABEL_147;
        }
        [(VCPImageChangeEntry *)v144 setHumanActions:v139];

        long long v124 = v144;
      }
      if (v141 && (objc_msgSend(v146, "vcp_isLivePhoto") & 1) != 0
        || !objc_msgSend(v146, "mad_isEligibleForComputeSync"))
      {
LABEL_134:
        [(NSMutableArray *)self->_pendingChanges addObject:v124];
        int v11 = 0;
LABEL_147:

        p_super = &v144->super;
        goto LABEL_148;
      }
      -[VCPImageChangeEntry setAnalysisStage:](v124, "setAnalysisStage:", objc_msgSend(v146, "mad_analysisStageAfterCompletingAnalysis:", 1));
      long long v125 = VCPSignPostLog();
      os_signpost_id_t v126 = os_signpost_id_generate(v125);

      long long v127 = VCPSignPostLog();
      CMTime v128 = v127;
      if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v128, OS_SIGNPOST_INTERVAL_BEGIN, v126, "VCPPhotosAssetChangeManager_Image_PackComputeSyncPayload", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v129 = +[VCPProtoAssetAnalysis imageAnalysisComputeSyncPayloadFromLegacyDictionary:v147];
      long long v130 = VCPSignPostLog();
      long long v131 = v130;
      if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v130))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v131, OS_SIGNPOST_INTERVAL_END, v126, "VCPPhotosAssetChangeManager_Image_PackComputeSyncPayload", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v129)
      {
        long long v132 = [v129 data];
        [(VCPImageChangeEntry *)v144 setComputeSyncPayload:v132];
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_133;
        }
        long long v132 = VCPLogInstance();
        os_log_type_t v133 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v132, v133))
        {
          long long v134 = [v146 localIdentifier];
          *(_DWORD *)CMTimeRange buf = 138412290;
          v175 = v134;
          _os_log_impl((void *)&_mh_execute_header, v132, v133, "[%@] Failed to serialize image analysis results as compute sync payload", buf, 0xCu);
        }
      }

LABEL_133:
      long long v124 = v144;
      goto LABEL_134;
    }
    if (((unint64_t)objc_msgSend(v147, "vcp_types", 0) & 0x200000000000) != 0)
    {
      id v35 = objc_msgSend(v147, "vcp_results", 0);
      uint64_t v138 = [v35 objectForKeyedSubscript:@"MiCaVideoCaptionResults"];

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v36 = VCPLogInstance();
        os_log_type_t v37 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v36, v37))
        {
          float v38 = [v146 localIdentifier];
          *(_DWORD *)CMTimeRange buf = 138412546;
          v175 = v38;
          __int16 v176 = 2112;
          uint64_t v177 = v138;
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "[%@] Update Asset with MediaAnalysisMiCaVideoCaptionResultsKey: %@", buf, 0x16u);
        }
      }
      double v34 = (void *)v138;
    }
    else
    {
      double v34 = 0;
    }
    if (objc_msgSend(v34, "count", v34))
    {
      float v39 = [v139 objectAtIndexedSubscript:0];
      float v40 = [v39 objectForKeyedSubscript:@"attributes"];
      float v41 = [v40 objectForKeyedSubscript:@"videoCaptionText"];

      [(VCPImageChangeEntry *)v21 setVideoCaption:v41];
    }
    if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled")&& ((unint64_t)objc_msgSend(v147, "vcp_types") & 0x80000000000) != 0)
    {
      [(VCPImageChangeEntry *)v21 setVideoEmbeddingVersion:70];
    }
    if ((objc_msgSend(v147, "vcp_types") & 0x40000) != 0)
    {
      id v92 = objc_msgSend(v147, "vcp_results");
      uint64_t v49 = [v92 objectForKeyedSubscript:@"MovieSummaryResults"];

      if ([v49 count])
      {
        v93 = [v49 objectAtIndexedSubscript:0];
        v94 = v93;
        if (v93)
        {
          objc_msgSend(v93, "vcp_timerange");
        }
        else
        {
          long long v171 = 0u;
          long long v172 = 0u;
          long long v170 = 0u;
        }
        v169[0] = v170;
        v169[1] = v171;
        v169[2] = v172;
        [(VCPImageChangeEntry *)v21 setSummaryTimeRange:v169];

        v104 = [v49 objectAtIndexedSubscript:0];
        unsigned int v105 = objc_msgSend(v104, "vcp_flags");
        v106 = [v49 objectAtIndexedSubscript:0];
        objc_msgSend(v106, "vcp_quality");
        double v108 = v107 * (double)((v105 >> 19) & 1);
        *(float *)&double v108 = v108;
        [(VCPImageChangeEntry *)v21 setAutoplayScore:v108];

        if (!v21) {
          goto LABEL_144;
        }
        [(VCPImageChangeEntry *)v21 summaryTimeRange];
        if ((v176 & 1) == 0) {
          goto LABEL_144;
        }
        [(VCPImageChangeEntry *)v21 summaryTimeRange];
        if ((v168 & 1) == 0) {
          goto LABEL_144;
        }
        [(VCPImageChangeEntry *)v21 summaryTimeRange];
        if (v167) {
          goto LABEL_144;
        }
        [(VCPImageChangeEntry *)v21 summaryTimeRange];
        if (v166 < 0) {
          goto LABEL_144;
        }
        long long v164 = *(_OWORD *)&kCMTimeInvalid.value;
        CMTimeEpoch epoch = kCMTimeInvalid.epoch;
        [(VCPImageChangeEntry *)v21 setKeyFrameTime:&v164];
        v109 = [v49 objectAtIndexedSubscript:0];
        v110 = [v109 objectForKeyedSubscript:@"attributes"];

        if (![v110 count]
          || ([v110 objectForKey:@"bestPlaybackCrop"],
              id v111 = objc_claimAutoreleasedReturnValue(),
              BOOL v112 = v111 == 0,
              v111,
              v112))
        {
          -[VCPImageChangeEntry setBestPlaybackRect:](v144, "setBestPlaybackRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
        }
        else
        {
          uint64_t v113 = [v110 objectForKey:@"bestPlaybackCrop"];
          NSRect v195 = NSRectFromString(v113);
          -[VCPImageChangeEntry setBestPlaybackRect:](v144, "setBestPlaybackRect:", v195.origin.x, v195.origin.y, v195.size.width, v195.size.height);
        }
      }
      else
      {
        long long v99 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
        v163[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
        v163[1] = v99;
        v163[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
        [(VCPImageChangeEntry *)v21 setSummaryTimeRange:v163];
        [(VCPImageChangeEntry *)v21 setAutoplayScore:0.0];
        long long v161 = *(_OWORD *)&kCMTimeInvalid.value;
        CMTimeEpoch v162 = kCMTimeInvalid.epoch;
        [(VCPImageChangeEntry *)v21 setKeyFrameTime:&v161];
        -[VCPImageChangeEntry setBestPlaybackRect:](v21, "setBestPlaybackRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
      }
      long long v100 = objc_msgSend(v147, "vcp_results");
      os_log_type_t v101 = [v100 objectForKeyedSubscript:@"AnimatedStickerResults"];

      if ([v101 count])
      {
        os_log_type_t v102 = [v101 objectAtIndexedSubscript:0];
        os_log_type_t v103 = v102;
        if (v102)
        {
          objc_msgSend(v102, "vcp_timerange");
        }
        else
        {
          long long v159 = 0u;
          long long v160 = 0u;
          long long v158 = 0u;
        }
        v157[0] = v158;
        v157[1] = v159;
        v157[2] = v160;
        [(VCPImageChangeEntry *)v144 setAnimatedStickerTimeRange:v157];

        long long v135 = [v101 objectAtIndexedSubscript:0];
        objc_msgSend(v135, "vcp_quality");
        *(float *)&double v136 = v136;
        [(VCPImageChangeEntry *)v144 setAnimatedStickerScore:v136];

        if (!v144
          || ([(VCPImageChangeEntry *)v144 animatedStickerTimeRange], (v176 & 1) == 0)
          || ([(VCPImageChangeEntry *)v144 animatedStickerTimeRange], (v168 & 1) == 0)
          || ([(VCPImageChangeEntry *)v144 animatedStickerTimeRange], v167)
          || ([(VCPImageChangeEntry *)v144 animatedStickerTimeRange], v166 < 0))
        {

          goto LABEL_144;
        }
      }
      else
      {
        long long v114 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
        v156[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
        v156[1] = v114;
        v156[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
        [(VCPImageChangeEntry *)v144 setAnimatedStickerTimeRange:v156];
        [(VCPImageChangeEntry *)v144 setAnimatedStickerScore:0.0];
      }
      v115 = objc_msgSend(v147, "vcp_results");
      v116 = [v115 objectForKeyedSubscript:@"SettlingEffectsGatingResults"];

      if ([v116 count])
      {
        id v117 = [v116 objectAtIndexedSubscript:0];
        objc_msgSend(v117, "vcp_quality");
        *(float *)&double v118 = v118;
        [(VCPImageChangeEntry *)v144 setSettlingEffectScore:v118];

        v119 = [v116 objectAtIndexedSubscript:0];
        uint64_t v120 = [v119 objectForKeyedSubscript:@"attributes"];
        id v121 = [v120 objectForKeyedSubscript:@"RankingLevel"];
        [v121 floatValue];
        -[VCPImageChangeEntry setSettlingEffectRankingScore:](v144, "setSettlingEffectRankingScore:");
      }
      else
      {
        [(VCPImageChangeEntry *)v144 setSettlingEffectScore:0.0];
        [(VCPImageChangeEntry *)v144 setSettlingEffectRankingScore:0.0];
      }

      int v21 = v144;
    }
    else
    {
      long long v42 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
      v155[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
      v155[1] = v42;
      v155[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
      [(VCPImageChangeEntry *)v21 setSummaryTimeRange:v155];
      LODWORD(v43) = 0.5;
      [(VCPImageChangeEntry *)v21 setAutoplayScore:v43];
      long long v153 = *(_OWORD *)&kCMTimeInvalid.value;
      CMTimeEpoch v154 = kCMTimeInvalid.epoch;
      [(VCPImageChangeEntry *)v21 setKeyFrameTime:&v153];
      -[VCPImageChangeEntry setBestPlaybackRect:](v21, "setBestPlaybackRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
      long long v44 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
      v152[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
      v152[1] = v44;
      v152[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
      [(VCPImageChangeEntry *)v21 setAnimatedStickerTimeRange:v152];
      LODWORD(v45) = 1050253722;
      [(VCPImageChangeEntry *)v21 setAnimatedStickerScore:v45];
      LODWORD(v46) = -1.0;
      [(VCPImageChangeEntry *)v21 setSettlingEffectScore:v46];
      LODWORD(v47) = 0.5;
      [(VCPImageChangeEntry *)v21 setSettlingEffectRankingScore:v47];
    }
    [(VCPImageChangeEntry *)v21 bestPlaybackRect];
    if (!CGRectIsNull(v186))
    {
      [(VCPImageChangeEntry *)v21 bestPlaybackRect];
      CGFloat x = v187.origin.x;
      CGFloat y = v187.origin.y;
      CGFloat width = v187.size.width;
      CGFloat height = v187.size.height;
      if (CGRectGetMinX(v187) < 0.0) {
        goto LABEL_145;
      }
      v188.origin.CGFloat x = x;
      v188.origin.CGFloat y = y;
      v188.size.CGFloat width = width;
      v188.size.CGFloat height = height;
      if (CGRectGetMinX(v188) > 1.0) {
        goto LABEL_145;
      }
      v189.origin.CGFloat x = x;
      v189.origin.CGFloat y = y;
      v189.size.CGFloat width = width;
      v189.size.CGFloat height = height;
      if (CGRectGetMinY(v189) < 0.0) {
        goto LABEL_145;
      }
      v190.origin.CGFloat x = x;
      v190.origin.CGFloat y = y;
      v190.size.CGFloat width = width;
      v190.size.CGFloat height = height;
      if (CGRectGetMinY(v190) > 1.0) {
        goto LABEL_145;
      }
      v191.origin.CGFloat x = x;
      v191.origin.CGFloat y = y;
      v191.size.CGFloat width = width;
      v191.size.CGFloat height = height;
      if (CGRectGetMaxX(v191) < 0.0) {
        goto LABEL_145;
      }
      v192.origin.CGFloat x = x;
      v192.origin.CGFloat y = y;
      v192.size.CGFloat width = width;
      v192.size.CGFloat height = height;
      if (CGRectGetMaxX(v192) > 1.0) {
        goto LABEL_145;
      }
      v193.origin.CGFloat x = x;
      v193.origin.CGFloat y = y;
      v193.size.CGFloat width = width;
      v193.size.CGFloat height = height;
      if (CGRectGetMaxY(v193) < 0.0) {
        goto LABEL_145;
      }
      v194.origin.CGFloat x = x;
      v194.origin.CGFloat y = y;
      v194.size.CGFloat width = width;
      v194.size.CGFloat height = height;
      if (CGRectGetMaxY(v194) > 1.0) {
        goto LABEL_145;
      }
    }
    if ((objc_msgSend(v147, "vcp_types") & 0x100000) == 0) {
      goto LABEL_57;
    }
    double v48 = objc_msgSend(v147, "vcp_results");
    uint64_t v49 = [v48 objectForKeyedSubscript:@"LivePhotoEffectsResults"];

    if (![v49 count])
    {
LABEL_56:

      int v21 = v144;
LABEL_57:
      if ((objc_msgSend(v147, "vcp_types") & 0x200000) != 0)
      {
        [(VCPImageChangeEntry *)v21 setAudioClassification:0];
        id v54 = objc_msgSend(v147, "vcp_results");
        uint64_t v55 = [v54 objectForKeyedSubscript:@"ApplauseResults"];
        BOOL v56 = [v55 count] == 0;

        if (!v56) {
          [(VCPImageChangeEntry *)v144 setAudioClassification:[(VCPImageChangeEntry *)v144 audioClassification] | 1];
        }
        id v57 = objc_msgSend(v147, "vcp_results");
        int v58 = [v57 objectForKeyedSubscript:@"BabbleResults"];
        BOOL v59 = [v58 count] == 0;

        if (!v59) {
          [(VCPImageChangeEntry *)v144 setAudioClassification:[(VCPImageChangeEntry *)v144 audioClassification] | 2];
        }
        id v60 = objc_msgSend(v147, "vcp_results");
        id v61 = [v60 objectForKeyedSubscript:@"CheeringResults"];
        BOOL v62 = [v61 count] == 0;

        if (!v62) {
          [(VCPImageChangeEntry *)v144 setAudioClassification:[(VCPImageChangeEntry *)v144 audioClassification] | 4];
        }
        BOOL v63 = objc_msgSend(v147, "vcp_results");
        long long v64 = [v63 objectForKeyedSubscript:@"LaughterResults"];
        BOOL v65 = [v64 count] == 0;

        if (!v65) {
          [(VCPImageChangeEntry *)v144 setAudioClassification:[(VCPImageChangeEntry *)v144 audioClassification] | 8];
        }
        double v66 = objc_msgSend(v147, "vcp_results");
        double v67 = [v66 objectForKeyedSubscript:@"VoiceResults"];
        BOOL v68 = [v67 count] == 0;

        if (!v68) {
          [(VCPImageChangeEntry *)v144 setAudioClassification:[(VCPImageChangeEntry *)v144 audioClassification] | 0x10];
        }
        double v69 = objc_msgSend(v147, "vcp_results");
        double v70 = [v69 objectForKeyedSubscript:@"MusicResults"];
        BOOL v71 = [v70 count] == 0;

        if (!v71) {
          [(VCPImageChangeEntry *)v144 setAudioClassification:[(VCPImageChangeEntry *)v144 audioClassification] | 0x20];
        }
        long long v145 = +[NSMutableSet set];
        CMTime v72 = objc_msgSend((id)objc_opt_class(), "mad_audioTaxonomy:useResultsKey:", 1, 1);
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id v73 = [v72 allKeys];
        id v74 = [v73 countByEnumeratingWithState:&v148 objects:v173 count:16];
        if (v74)
        {
          uint64_t v75 = *(void *)v149;
          do
          {
            for (i = 0; i != v74; i = (char *)i + 1)
            {
              if (*(void *)v149 != v75) {
                objc_enumerationMutation(v73);
              }
              uint64_t v77 = *(void *)(*((void *)&v148 + 1) + 8 * i);
              long long v78 = objc_msgSend(v147, "vcp_results");
              long long v79 = [v78 objectForKeyedSubscript:v77];
              BOOL v80 = [v79 count] == 0;

              if (!v80)
              {
                id v81 = objc_alloc((Class)PHSceneClassification);
                double v82 = [v72 objectForKeyedSubscript:v77];
                id v83 = objc_msgSend(v81, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", objc_msgSend(v82, "longLongValue"), 3, 1.0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height, 0.0, 2.0);

                if (v83) {
                  [v145 addObject:v83];
                }
              }
            }
            id v74 = [v73 countByEnumeratingWithState:&v148 objects:v173 count:16];
          }
          while (v74);
        }

        [(VCPImageChangeEntry *)v144 setAudioClassifications:v145];
        int v21 = v144;
      }
      if (((unint64_t)objc_msgSend(v147, "vcp_types") & 0x400000000) != 0)
      {
        uint64_t v84 = objc_msgSend(v147, "vcp_results");
        v85 = [v84 objectForKeyedSubscript:@"AudioQualityResults"];

        if ([v85 count])
        {
          id v87 = [v85 objectAtIndexedSubscript:0];
          v88 = [v87 objectForKeyedSubscript:@"quality"];
          [v88 floatValue];
          float v90 = v89;

          LODWORD(v91) = 1.0;
          if (v90 < MediaAnalysisAudioQualityThreshold) {
            *(float *)&double v91 = 0.0;
          }
          [(VCPImageChangeEntry *)v144 setAudioScore:v91];
        }
        else
        {
          LODWORD(v86) = 0.5;
          [(VCPImageChangeEntry *)v144 setAudioScore:v86];
        }

        int v21 = v144;
      }
      -[VCPImageChangeEntry setScreenTimeDeviceImageSensitivity:](v21, "setScreenTimeDeviceImageSensitivity:", [(id)objc_opt_class() sensitivityFromAnalysis:v147]);

      int v21 = v144;
      goto LABEL_118;
    }
    long long v50 = [v49 objectAtIndexedSubscript:0];
    v51 = [v50 objectForKeyedSubscript:@"attributes"];

    if (v51)
    {
      float v52 = [v51 objectForKeyedSubscript:@"loopSuggestionState"];
      -[VCPImageChangeEntry setLoopSuggestionState:](v144, "setLoopSuggestionState:", [v52 unsignedIntegerValue]);

      float v53 = [v51 objectForKeyedSubscript:@"longExposureSuggestionState"];
      -[VCPImageChangeEntry setLongExposureSuggestionState:](v144, "setLongExposureSuggestionState:", [v53 unsignedIntegerValue]);

      goto LABEL_56;
    }
LABEL_144:

LABEL_145:
    int v11 = 0;
    goto LABEL_146;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    p_super = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(p_super, v23))
    {
      id v24 = [v146 localIdentifier];
      unsigned int v25 = MediaAnalysisTypeDescription((uint64_t)objc_msgSend(v147, "vcp_types"));
      uint64_t v26 = MediaAnalysisTypeDescription(v7);
      *(_DWORD *)CMTimeRange buf = 138412802;
      v175 = v24;
      __int16 v176 = 2112;
      uint64_t v177 = (uint64_t)v25;
      __int16 v178 = 2112;
      unint64_t v179 = (unint64_t)v26;
      _os_log_impl((void *)&_mh_execute_header, p_super, v23, "[%@] updateImageAsset : analysis types %@ does not include required types %@, skip", buf, 0x20u);

      int v11 = 0;
      goto LABEL_148;
    }
LABEL_38:
    int v11 = 0;
    goto LABEL_148;
  }
LABEL_23:
  int v11 = 0;
LABEL_149:

  return v11;
}

- (int)updateMovieAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v279 = a3;
  id v280 = a4;
  if (v5)
  {
    uint64_t v7 = (uint64_t)+[PHAsset vcp_fullAnalysisImageOnlyTypes];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v8 = VCPLogInstance();
      os_log_type_t v9 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v8, v9))
      {
        id v10 = [v279 localIdentifier];
        MediaAnalysisTypeDescription((uint64_t)objc_msgSend(v280, "vcp_types"));
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v12 = (unint64_t)objc_msgSend(v280, "vcp_types");
        os_log_type_t v13 = MediaAnalysisTypeShortDescription(v7);
        *(_DWORD *)CMTimeRange buf = 138413314;
        *(void *)v344 = v10;
        *(_WORD *)&v344[8] = 2112;
        *(void *)&v344[10] = v11;
        __int16 v345 = 2048;
        *(void *)&double v346 = v12 & v7;
        __int16 v347 = 2112;
        id v348 = v13;
        __int16 v349 = 2112;
        CFStringRef v350 = @"YES";
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%@] Update movie asset with analysis type %@ (%llu), required type %@, imageOnly:%@", buf, 0x34u);
      }
    }
    if (v7)
    {
      if ((v7 & ~(unint64_t)objc_msgSend(v280, "vcp_types")) == 0)
      {
        log = objc_alloc_init(VCPMovieChangeEntry);
        [(VCPMovieChangeEntry *)log setAsset:v279];
        [(VCPMovieChangeEntry *)log setImageOnly:1];
        if (((unint64_t)objc_msgSend(v280, "vcp_types") & 0x2000000000000) != 0)
        {
          double v45 = objc_msgSend(v280, "vcp_results");
          id v14 = [v45 objectForKeyedSubscript:@"MiCaImageCaptionResults"];

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            double v46 = VCPLogInstance();
            os_log_type_t v47 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v46, v47))
            {
              double v48 = [v279 localIdentifier];
              *(_DWORD *)CMTimeRange buf = 138412546;
              *(void *)v344 = v48;
              *(_WORD *)&v344[8] = 2112;
              *(void *)&v344[10] = v14;
              _os_log_impl((void *)&_mh_execute_header, v46, v47, "[%@] Update Asset with MediaAnalysisMiCaImageCaptionResultsKey: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v14 = 0;
        }
        if ([v14 count])
        {
          uint64_t v49 = [v14 objectAtIndexedSubscript:0];
          long long v50 = [v49 objectForKeyedSubscript:@"attributes"];
          v51 = [v50 objectForKeyedSubscript:@"imageCaptionText"];

          [(VCPMovieChangeEntry *)log setImageCaption:v51];
        }
        if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled")&& ((unint64_t)objc_msgSend(v280, "vcp_types") & 0x1000000000000) != 0)
        {
          [(VCPMovieChangeEntry *)log setImageEmbeddingVersion:70];
        }
        [(NSMutableArray *)self->_pendingChanges addObject:log];

LABEL_39:
        int v39 = 0;
        goto LABEL_74;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        double v34 = VCPLogInstance();
        os_log_type_t v35 = VCPLogToOSLogType[3];
        log = (VCPMovieChangeEntry *)v34;
        if (os_log_type_enabled(v34, v35))
        {
          id v36 = [v279 localIdentifier];
          os_log_type_t v37 = MediaAnalysisTypeDescription((uint64_t)objc_msgSend(v280, "vcp_types"));
          float v38 = MediaAnalysisTypeDescription(v7);
          *(_DWORD *)CMTimeRange buf = 138412802;
          *(void *)v344 = v36;
          *(_WORD *)&v344[8] = 2112;
          *(void *)&v344[10] = v37;
          __int16 v345 = 2112;
          double v346 = *(double *)&v38;
          _os_log_impl((void *)&_mh_execute_header, &log->super, v35, "[%@] updateMovieAsset : analysis types %@ does not include required types %@, skip", buf, 0x20u);
        }
        goto LABEL_39;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      CGFloat v31 = VCPLogInstance();
      os_log_type_t v32 = VCPLogToOSLogType[3];
      log = (VCPMovieChangeEntry *)v31;
      if (os_log_type_enabled(v31, v32))
      {
        BOOL v33 = [v279 localIdentifier];
        *(_DWORD *)CMTimeRange buf = 138412290;
        *(void *)v344 = v33;
        _os_log_impl((void *)&_mh_execute_header, &log->super, v32, "[%@] updateMovieAsset : required types is MediaAnalysisTypeNone; skip",
          buf,
          0xCu);
      }
      goto LABEL_39;
    }
LABEL_26:
    int v39 = 0;
    goto LABEL_75;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = [v279 localIdentifier];
      MediaAnalysisTypeShortDescription((uint64_t)objc_msgSend(v280, "vcp_types"));
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v19 = (unint64_t)objc_msgSend(v280, "vcp_types");
      uint64_t v20 = MediaAnalysisTypeRequiredForMoviePersistence;
      MediaAnalysisTypeShortDescription(MediaAnalysisTypeRequiredForMoviePersistence);
      unint64_t v21 = v20 & v19;
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CMTimeRange buf = 138413314;
      *(void *)v344 = v17;
      *(_WORD *)&v344[8] = 2112;
      *(void *)&v344[10] = v18;
      __int16 v345 = 2048;
      double v346 = *(double *)&v21;
      __int16 v347 = 2112;
      id v348 = v22;
      __int16 v349 = 2112;
      CFStringRef v350 = @"NO";
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%@] Update movie asset with analysis type %@ (%llu), required type %@, imageOnly:%@", buf, 0x34u);
    }
  }
  unint64_t v23 = (unint64_t)objc_msgSend(v280, "vcp_types");
  uint64_t v24 = MediaAnalysisTypeRequiredForMoviePersistence;
  if ((MediaAnalysisTypeRequiredForMoviePersistence & ~v23) != 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v26 = VCPLogInstance();
      os_log_type_t v27 = VCPLogToOSLogType[3];
      log = (VCPMovieChangeEntry *)v26;
      if (os_log_type_enabled(v26, v27))
      {
        float v28 = [v279 localIdentifier];
        os_log_type_t v29 = MediaAnalysisTypeDescription((uint64_t)objc_msgSend(v280, "vcp_types"));
        uint64_t v30 = MediaAnalysisTypeDescription(v24);
        *(_DWORD *)CMTimeRange buf = 138412802;
        *(void *)v344 = v28;
        *(_WORD *)&v344[8] = 2112;
        *(void *)&v344[10] = v29;
        __int16 v345 = 2112;
        double v346 = *(double *)&v30;
        _os_log_impl((void *)&_mh_execute_header, &log->super, v27, "[%@] updateMovieAsset : analysis types %@ does not include required types %@, skip", buf, 0x20u);
      }
      goto LABEL_39;
    }
    goto LABEL_26;
  }
  log = objc_alloc_init(VCPMovieChangeEntry);
  [(VCPMovieChangeEntry *)log setAsset:v279];
  if (((unint64_t)objc_msgSend(v280, "vcp_types") & 0x200000000000) != 0)
  {
    float v40 = objc_msgSend(v280, "vcp_results");
    float v41 = [v40 objectForKeyedSubscript:@"MiCaVideoCaptionResults"];

    unsigned int v25 = v41;
    if ([v41 count])
    {
      long long v42 = [v41 objectAtIndexedSubscript:0];
      double v43 = [v42 objectForKeyedSubscript:@"attributes"];
      long long v44 = [v43 objectForKeyedSubscript:@"videoCaptionText"];

      [(VCPMovieChangeEntry *)log setVideoCaption:v44];
      unsigned int v25 = v41;
    }
    else
    {
      [(VCPMovieChangeEntry *)log setVideoCaption:&stru_10021F768];
    }
  }
  else
  {
    unsigned int v25 = 0;
  }
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled")&& ((unint64_t)objc_msgSend(v280, "vcp_types") & 0x80000000000) != 0)
  {
    [(VCPMovieChangeEntry *)log setVideoEmbeddingVersion:70];
  }
  float v52 = objc_msgSend(v280, "vcp_results");
  v269 = v25;
  v271 = [v52 objectForKeyedSubscript:@"MovieSummaryResults"];

  if ([v271 count])
  {
    float v53 = [v271 objectAtIndexedSubscript:0];
    v270 = [v53 objectForKeyedSubscript:@"attributes"];

    if (![v270 count]) {
      goto LABEL_71;
    }
    id v54 = [v271 objectAtIndexedSubscript:0];
    uint64_t v55 = v54;
    if (v54)
    {
      objc_msgSend(v54, "vcp_timerange");
    }
    else
    {
      long long v331 = 0u;
      long long v332 = 0u;
      long long v330 = 0u;
    }
    v329[0] = v330;
    v329[1] = v331;
    v329[2] = v332;
    [(VCPMovieChangeEntry *)log setSummaryTimeRange:v329];

    double v70 = [v270 objectForKey:@"bestPlaybackCrop"];
    NSRect v360 = NSRectFromString(v70);
    -[VCPMovieChangeEntry setBestPlaybackRect:](log, "setBestPlaybackRect:", v360.origin.x, v360.origin.y, v360.size.width, v360.size.height);

    [(VCPMovieChangeEntry *)log bestPlaybackRect];
    if (CGRectIsNull(v361)) {
      goto LABEL_71;
    }
    BOOL v71 = [v271 objectAtIndexedSubscript:0];
    CFDictionaryRef v72 = [v71 objectForKeyedSubscript:@"start"];
    CMTimeMakeFromDictionary(&v328, v72);
    CMTime v327 = v328;
    [(VCPMovieChangeEntry *)log setKeyFrameTime:&v327];

    id v73 = [v271 objectAtIndexedSubscript:0];
    unsigned int v74 = objc_msgSend(v73, "vcp_flags");
    uint64_t v75 = [v271 objectAtIndexedSubscript:0];
    objc_msgSend(v75, "vcp_quality");
    double v77 = v76 * (double)((v74 >> 19) & 1);
    *(float *)&double v77 = v77;
    [(VCPMovieChangeEntry *)log setAutoplayScore:v77];

    if (!log) {
      goto LABEL_71;
    }
    [(VCPMovieChangeEntry *)log summaryTimeRange];
    if ((v344[8] & 1) == 0) {
      goto LABEL_71;
    }
    [(VCPMovieChangeEntry *)log summaryTimeRange];
    if ((v326 & 1) == 0) {
      goto LABEL_71;
    }
    [(VCPMovieChangeEntry *)log summaryTimeRange];
    if (v325) {
      goto LABEL_71;
    }
    [(VCPMovieChangeEntry *)log summaryTimeRange];
    if (v324 < 0) {
      goto LABEL_71;
    }
    [(VCPMovieChangeEntry *)log keyFrameTime];
    if ((v344[8] & 1) == 0) {
      goto LABEL_71;
    }
    CGRect v190 = objc_msgSend(v280, "vcp_results");
    CGRect v191 = [v190 objectForKeyedSubscript:@"KeyFrameResourceResults"];

    if ([v191 count])
    {
      CGRect v192 = [v191 objectAtIndexedSubscript:0];
      BOOL v193 = v192 == 0;

      if (v193)
      {

        goto LABEL_71;
      }
      CGRect v194 = [v191 objectAtIndexedSubscript:0];
      [(VCPMovieChangeEntry *)log setKeyFrameResource:CFRetain(v194)];

      ++self->_pendingResourceChangeCount;
    }
    else
    {
      [(VCPMovieChangeEntry *)log setKeyFrameResource:0];
    }
  }
  else
  {
    long long v56 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
    v323[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
    v323[1] = v56;
    v323[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
    [(VCPMovieChangeEntry *)log setSummaryTimeRange:v323];
    long long v321 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    [(VCPMovieChangeEntry *)log setKeyFrameTime:&v321];
    [(VCPMovieChangeEntry *)log setAutoplayScore:0.0];
    [(VCPMovieChangeEntry *)log setKeyFrameResource:0];
    -[VCPMovieChangeEntry setBestPlaybackRect:](log, "setBestPlaybackRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }
  [(VCPMovieChangeEntry *)log bestPlaybackRect];
  if (!CGRectIsNull(v351))
  {
    [(VCPMovieChangeEntry *)log bestPlaybackRect];
    CGFloat x = v352.origin.x;
    CGFloat y = v352.origin.y;
    CGFloat width = v352.size.width;
    CGFloat height = v352.size.height;
    if (CGRectGetMinX(v352) < 0.0) {
      goto LABEL_64;
    }
    v353.origin.CGFloat x = x;
    v353.origin.CGFloat y = y;
    v353.size.CGFloat width = width;
    v353.size.CGFloat height = height;
    if (CGRectGetMinX(v353) > 1.0) {
      goto LABEL_64;
    }
    v354.origin.CGFloat x = x;
    v354.origin.CGFloat y = y;
    v354.size.CGFloat width = width;
    v354.size.CGFloat height = height;
    if (CGRectGetMinY(v354) < 0.0) {
      goto LABEL_64;
    }
    v355.origin.CGFloat x = x;
    v355.origin.CGFloat y = y;
    v355.size.CGFloat width = width;
    v355.size.CGFloat height = height;
    if (CGRectGetMinY(v355) > 1.0) {
      goto LABEL_64;
    }
    v356.origin.CGFloat x = x;
    v356.origin.CGFloat y = y;
    v356.size.CGFloat width = width;
    v356.size.CGFloat height = height;
    if (CGRectGetMaxX(v356) < 0.0) {
      goto LABEL_64;
    }
    v357.origin.CGFloat x = x;
    v357.origin.CGFloat y = y;
    v357.size.CGFloat width = width;
    v357.size.CGFloat height = height;
    if (CGRectGetMaxX(v357) > 1.0) {
      goto LABEL_64;
    }
    v358.origin.CGFloat x = x;
    v358.origin.CGFloat y = y;
    v358.size.CGFloat width = width;
    v358.size.CGFloat height = height;
    if (CGRectGetMaxY(v358) < 0.0) {
      goto LABEL_64;
    }
    v359.origin.CGFloat x = x;
    v359.origin.CGFloat y = y;
    v359.size.CGFloat width = width;
    v359.size.CGFloat height = height;
    if (CGRectGetMaxY(v359) > 1.0) {
      goto LABEL_64;
    }
  }
  objc_msgSend(v280, "vcp_quality");
  *(float *)&double v57 = v57;
  [(VCPMovieChangeEntry *)log setVideoScore:v57];
  [(VCPMovieChangeEntry *)log videoScore];
  if (v58 < 0.0 || ([(VCPMovieChangeEntry *)log videoScore], v59 > 1.0))
  {
LABEL_64:
    int v39 = 0;
    goto LABEL_73;
  }
  id v60 = objc_msgSend(v280, "vcp_results");
  v270 = [v60 objectForKeyedSubscript:@"ActivityLevelResults"];

  if ([v270 count])
  {
    BOOL v62 = [v270 objectAtIndexedSubscript:0];
    BOOL v63 = [v62 objectForKeyedSubscript:@"quality"];
    [v63 floatValue];
    -[VCPMovieChangeEntry setActivityScore:](log, "setActivityScore:");

    [(VCPMovieChangeEntry *)log activityScore];
    if (v64 >= 0.0)
    {
      [(VCPMovieChangeEntry *)log activityScore];
      if (v65 <= 1.0) {
        goto LABEL_77;
      }
    }
LABEL_71:
    int v39 = 0;
    goto LABEL_72;
  }
  LODWORD(v61) = 0.5;
  [(VCPMovieChangeEntry *)log setActivityScore:v61];
LABEL_77:
  long long v79 = objc_msgSend(v280, "vcp_results");
  v250 = [v79 objectForKeyedSubscript:@"FacePrintResults"];

  -[VCPMovieChangeEntry setFaceCount:](log, "setFaceCount:", [v250 count]);
  BOOL v80 = [v279 photoLibrary];
  v253 = [v80 librarySpecificFetchOptions];

  uint64_t v342 = PHFacePropertySetClustering;
  id v81 = +[NSArray arrayWithObjects:&v342 count:1];
  [v253 setFetchPropertySets:v81];

  [v253 setIncludeMediaAnalysisProcessingRangeTypes:2];
  v245 = +[PHFace fetchFacesInAsset:v279 options:v253];
  v273 = +[NSMutableArray array];
  long long v319 = 0u;
  long long v320 = 0u;
  long long v317 = 0u;
  long long v318 = 0u;
  id obj = v245;
  id v82 = [obj countByEnumeratingWithState:&v317 objects:v341 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v318;
    os_log_type_t v84 = VCPLogToOSLogType[7];
    do
    {
      for (i = 0; i != v82; i = (char *)i + 1)
      {
        if (*(void *)v318 != v83) {
          objc_enumerationMutation(obj);
        }
        double v86 = *(void **)(*((void *)&v317 + 1) + 8 * i);
        id v87 = [v86 faceClusteringProperties];
        v88 = [v87 groupingIdentifier];
        unsigned int v89 = [v88 isEqualToString:kVideoFaceGroupIdentifier];

        if (v89)
        {
          [v273 addObject:v86];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            float v90 = VCPLogInstance();
            if (os_log_type_enabled(v90, v84))
            {
              double v91 = [v86 localIdentifier];
              *(_DWORD *)CMTimeRange buf = 138412290;
              *(void *)v344 = v91;
              _os_log_impl((void *)&_mh_execute_header, v90, v84, "Delete fullrange video face [%@]", buf, 0xCu);
            }
          }
        }
      }
      id v82 = [obj countByEnumeratingWithState:&v317 objects:v341 count:16];
    }
    while (v82);
  }

  if ([v273 count])
  {
    id v92 = [v279 photoLibrary];
    v315[0] = _NSConcreteStackBlock;
    v315[1] = 3221225472;
    v315[2] = sub_10011D7F4;
    v315[3] = &unk_100219FC8;
    v316 = v273;
    id v314 = 0;
    unsigned __int8 v93 = [v92 performChangesAndWait:v315 error:&v314];
    id v249 = v314;

    if ((v93 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        NSRect v195 = VCPLogInstance();
        os_log_type_t v196 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v195, v196))
        {
          v197 = [v249 description];
          *(_DWORD *)CMTimeRange buf = 138412290;
          *(void *)v344 = v197;
          _os_log_impl((void *)&_mh_execute_header, v195, v196, "Failed to delete faces %@", buf, 0xCu);
        }
      }
      int v39 = -18;
      v198 = v316;
LABEL_282:

      v234 = v249;
      goto LABEL_283;
    }
  }
  [(VCPMovieChangeEntry *)log setAudioClassification:0];
  if ((objc_msgSend(v280, "vcp_types") & 0x200000) != 0)
  {
    v274 = +[NSMutableSet set];
    v94 = objc_msgSend((id)objc_opt_class(), "mad_audioTaxonomy:useResultsKey:", 1, 1);
    long long v312 = 0u;
    long long v313 = 0u;
    long long v310 = 0u;
    long long v311 = 0u;
    id v95 = [v94 allKeys];
    id v96 = [v95 countByEnumeratingWithState:&v310 objects:v340 count:16];
    if (!v96) {
      goto LABEL_106;
    }
    uint64_t v97 = *(void *)v311;
    while (1)
    {
      for (j = 0; j != v96; j = (char *)j + 1)
      {
        if (*(void *)v311 != v97) {
          objc_enumerationMutation(v95);
        }
        uint64_t v99 = *(void *)(*((void *)&v310 + 1) + 8 * (void)j);
        objc_msgSend(v280, "vcp_results");
        id v100 = (id)objc_claimAutoreleasedReturnValue();
        os_log_type_t v101 = [v100 objectForKeyedSubscript:v99];
        if ([v101 count])
        {
          [v279 duration];
          BOOL v103 = v102 > 0.0;

          if (!v103) {
            continue;
          }
          id v104 = objc_alloc((Class)PHSceneClassification);
          unsigned int v105 = [v94 objectForKeyedSubscript:v99];
          id v106 = [v105 longLongValue];
          double v107 = CGRectNull.origin.y;
          double v108 = CGRectNull.size.width;
          double v109 = CGRectNull.size.height;
          [v279 duration];
          id v100 = objc_msgSend(v104, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v106, 3, 1.0, CGRectNull.origin.x, v107, v108, v109, 0.0, v110);

          if (v100) {
            [v274 addObject:v100];
          }
        }
        else
        {
        }
      }
      id v96 = [v95 countByEnumeratingWithState:&v310 objects:v340 count:16];
      if (!v96)
      {
LABEL_106:

        [(VCPMovieChangeEntry *)log setAudioClassifications:v274];
        break;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v111 = VCPLogInstance();
    os_log_type_t v112 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v111, v112))
    {
      uint64_t v113 = [v279 localIdentifier];
      *(_DWORD *)CMTimeRange buf = 138412290;
      *(void *)v344 = v113;
      _os_log_impl((void *)&_mh_execute_header, v111, v112, "publish full-range scene classification result to movie %@", buf, 0xCu);
    }
  }
  if (((unint64_t)objc_msgSend(v280, "vcp_types") & 0x40000004000) != 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      long long v114 = VCPLogInstance();
      os_log_type_t v115 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v114, v115))
      {
        v116 = [v279 localIdentifier];
        *(_DWORD *)CMTimeRange buf = 138412290;
        *(void *)v344 = v116;
        _os_log_impl((void *)&_mh_execute_header, v114, v115, "[%@] check scene classification result from full-range video", buf, 0xCu);
      }
    }
    v256 = +[NSMutableSet set];
    v275 = +[NSMutableSet set];
    long long v308 = 0u;
    long long v309 = 0u;
    long long v306 = 0u;
    long long v307 = 0u;
    id v117 = [v279 sceneClassifications];
    id v118 = [v117 countByEnumeratingWithState:&v306 objects:v339 count:16];
    if (v118)
    {
      uint64_t v119 = *(void *)v307;
      do
      {
        for (k = 0; k != v118; k = (char *)k + 1)
        {
          if (*(void *)v307 != v119) {
            objc_enumerationMutation(v117);
          }
          id v121 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(*((void *)&v306 + 1) + 8 * (void)k) extendedSceneIdentifier]);
          [v275 addObject:v121];
        }
        id v118 = [v117 countByEnumeratingWithState:&v306 objects:v339 count:16];
      }
      while (v118);
    }

    id v122 = +[NSMutableDictionary dictionary];
    long long v304 = 0u;
    long long v305 = 0u;
    long long v302 = 0u;
    long long v303 = 0u;
    v123 = objc_msgSend(v280, "vcp_results");
    id v260 = [v123 objectForKeyedSubscript:@"ClassificationResults"];

    id v124 = [v260 countByEnumeratingWithState:&v302 objects:v338 count:16];
    if (v124)
    {
      uint64_t v264 = *(void *)v303;
      do
      {
        id v125 = v124;
        for (m = 0; m != v125; m = (char *)m + 1)
        {
          if (*(void *)v303 != v264) {
            objc_enumerationMutation(v260);
          }
          long long v127 = [*(id *)(*((void *)&v302 + 1) + 8 * (void)m) objectForKeyedSubscript:@"attributes"];
          long long v300 = 0u;
          long long v301 = 0u;
          long long v298 = 0u;
          long long v299 = 0u;
          id v128 = v127;
          id v129 = [v128 countByEnumeratingWithState:&v298 objects:v337 count:16];
          if (v129)
          {
            uint64_t v130 = *(void *)v299;
            do
            {
              for (n = 0; n != v129; n = (char *)n + 1)
              {
                if (*(void *)v299 != v130) {
                  objc_enumerationMutation(v128);
                }
                uint64_t v132 = *(void *)(*((void *)&v298 + 1) + 8 * (void)n);
                uint64_t v133 = [v128 objectForKeyedSubscript:v132];
                [(id)v133 floatValue];
                float v135 = v134;

                double v136 = [v122 objectForKeyedSubscript:v132];
                LOBYTE(v133) = v136 == 0;

                if ((v133 & 1) == 0)
                {
                  uint64_t v138 = [v122 objectForKeyedSubscript:v132];
                  [v138 floatValue];
                  float v140 = v139;

                  float v135 = fmaxf(v140, v135);
                }
                *(float *)&double v137 = v135;
                BOOL v141 = +[NSNumber numberWithFloat:v137];
                [v122 setObject:v141 forKeyedSubscript:v132];
              }
              id v129 = [v128 countByEnumeratingWithState:&v298 objects:v337 count:16];
            }
            while (v129);
          }
        }
        id v124 = [v260 countByEnumeratingWithState:&v302 objects:v338 count:16];
      }
      while (v124);
    }

    long long v296 = 0u;
    long long v297 = 0u;
    long long v294 = 0u;
    long long v295 = 0u;
    uint64_t v142 = objc_msgSend(v280, "vcp_results");
    id v258 = [v142 objectForKeyedSubscript:@"SafetyResults"];

    id v143 = [v258 countByEnumeratingWithState:&v294 objects:v336 count:16];
    if (v143)
    {
      *(void *)os_log_type_t type = *(void *)v295;
      do
      {
        id v265 = v143;
        for (ii = 0; ii != v265; ii = (char *)ii + 1)
        {
          if (*(void *)v295 != *(void *)type) {
            objc_enumerationMutation(v258);
          }
          long long v145 = [*(id *)(*((void *)&v294 + 1) + 8 * (void)ii) objectForKeyedSubscript:@"attributes"];
          id v146 = v145;
          if (v145)
          {
            id v147 = [v145 objectForKeyedSubscript:@"SensitivitySceneResults"];
            long long v292 = 0u;
            long long v293 = 0u;
            long long v290 = 0u;
            long long v291 = 0u;
            id v148 = v147;
            id v149 = [v148 countByEnumeratingWithState:&v290 objects:v335 count:16];
            if (v149)
            {
              uint64_t v150 = *(void *)v291;
              do
              {
                for (jj = 0; jj != v149; jj = (char *)jj + 1)
                {
                  if (*(void *)v291 != v150) {
                    objc_enumerationMutation(v148);
                  }
                  uint64_t v152 = *(void *)(*((void *)&v290 + 1) + 8 * (void)jj);
                  uint64_t v153 = [v148 objectForKeyedSubscript:v152];
                  [(id)v153 floatValue];
                  float v155 = v154;

                  NSRect v156 = [v122 objectForKeyedSubscript:v152];
                  LOBYTE(v153) = v156 == 0;

                  if ((v153 & 1) == 0)
                  {
                    long long v158 = [v122 objectForKeyedSubscript:v152];
                    [v158 floatValue];
                    float v160 = v159;

                    float v155 = fmaxf(v160, v155);
                  }
                  *(float *)&double v157 = v155;
                  long long v161 = +[NSNumber numberWithFloat:v157];
                  [v122 setObject:v161 forKeyedSubscript:v152];
                }
                id v149 = [v148 countByEnumeratingWithState:&v290 objects:v335 count:16];
              }
              while (v149);
            }
          }
        }
        id v143 = [v258 countByEnumeratingWithState:&v294 objects:v336 count:16];
      }
      while (v143);
    }

    long long v288 = 0u;
    long long v289 = 0u;
    long long v286 = 0u;
    long long v287 = 0u;
    id v162 = v122;
    id v163 = [v162 countByEnumeratingWithState:&v286 objects:v334 count:16];
    if (v163)
    {
      char v266 = 0;
      uint64_t v164 = *(void *)v287;
      os_log_type_t typea = VCPLogToOSLogType[6];
      do
      {
        for (kk = 0; kk != v163; kk = (char *)kk + 1)
        {
          if (*(void *)v287 != v164) {
            objc_enumerationMutation(v162);
          }
          uint64_t v166 = *(void **)(*((void *)&v286 + 1) + 8 * (void)kk);
          if (([v275 containsObject:v166] & 1) == 0)
          {
            uint64_t v167 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
            char v168 = objc_msgSend(v167, "nodeForExtendedSceneClassId:", objc_msgSend(v166, "longLongValue"));

            if (v168)
            {
              [v168 highPrecisionThreshold];
              double v170 = v169;
              [v168 highRecallThreshold];
              double v172 = v171;
              [v168 searchThreshold];
              double v174 = v172 >= v170 ? v170 : v172;
              double v175 = v173 >= v174 ? v174 : v173;
              __int16 v176 = [v162 objectForKeyedSubscript:v166];
              [v176 floatValue];
              float v178 = v177;

              double v179 = v178;
              if (v175 < v179)
              {
                [v279 duration];
                if (v180 > 0.0)
                {
                  id v181 = objc_alloc((Class)PHSceneClassification);
                  id v182 = [v166 longLongValue];
                  double v183 = CGRectNull.origin.y;
                  double v184 = CGRectNull.size.width;
                  double v185 = CGRectNull.size.height;
                  [v279 duration];
                  id v187 = objc_msgSend(v181, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v182, 2, v179, CGRectNull.origin.x, v183, v184, v185, 0.0, v186);
                  if (v187)
                  {
                    [v256 addObject:v187];
                    if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      CGRect v188 = VCPLogInstance();
                      if (os_log_type_enabled(v188, typea))
                      {
                        id v261 = [v279 localIdentifier];
                        v267 = +[PFSceneTaxonomy vcp_sharedTaxonomy];
                        objc_msgSend(v267, "mad_sceneNameFromExtendedSceneId:", objc_msgSend(v166, "longLongValue"));
                        id v189 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)CMTimeRange buf = 138412802;
                        *(void *)v344 = v261;
                        *(_WORD *)&v344[8] = 2112;
                        *(void *)&v344[10] = v189;
                        __int16 v345 = 2048;
                        double v346 = v179;
                        _os_log_impl((void *)&_mh_execute_header, v188, typea, "[%@] add scene classification result [%@, %f] from full-range video", buf, 0x20u);
                      }
                    }
                    char v266 = 1;
                  }
                }
              }
            }
          }
        }
        id v163 = [v162 countByEnumeratingWithState:&v286 objects:v334 count:16];
      }
      while (v163);

      if (v266) {
        [(VCPMovieChangeEntry *)log setSceneClassifications:v256];
      }
    }
    else
    {
    }
  }
  if ((objc_msgSend(v280, "vcp_types") & 8) == 0) {
    goto LABEL_266;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v199 = VCPLogInstance();
    os_log_type_t v200 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v199, v200))
    {
      int v201 = _os_feature_enabled_impl();
      uint64_t v202 = [v279 localIdentifier];
      v203 = (void *)v202;
      if (v201) {
        int v204 = 15;
      }
      else {
        int v204 = 11;
      }
      *(_DWORD *)CMTimeRange buf = 67109378;
      *(_DWORD *)v344 = v204;
      *(_WORD *)&v344[4] = 2112;
      *(void *)&v344[6] = v202;
      _os_log_impl((void *)&_mh_execute_header, v199, v200, "publish full-range video faces (processing version %d) to movie %@", buf, 0x12u);
    }
  }
  id v249 = +[NSMutableArray array];
  uint64_t v205 = +[NSMutableDictionary dictionary];
  long long v284 = 0u;
  long long v285 = 0u;
  long long v282 = 0u;
  long long v283 = 0u;
  id v254 = v250;
  v246 = v205;
  id v206 = [v254 countByEnumeratingWithState:&v282 objects:v333 count:16];
  if (!v206) {
    goto LABEL_265;
  }
  int v39 = 0;
  uint64_t v255 = *(void *)v283;
  os_log_type_t v247 = VCPLogToOSLogType[3];
  os_log_type_t v248 = VCPLogToOSLogType[7];
  while (2)
  {
    v207 = 0;
    id v257 = v206;
    do
    {
      if (*(void *)v283 != v255) {
        objc_enumerationMutation(v254);
      }
      v208 = *(void **)(*((void *)&v282 + 1) + 8 * (void)v207);
      v209 = [v208 objectForKeyedSubscript:@"attributes"];
      v276 = [v209 objectForKeyedSubscript:@"facePrint"];

      v210 = [v208 objectForKeyedSubscript:@"attributes"];
      v268 = [v210 objectForKeyedSubscript:@"torsoPrint"];

      id v211 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v276 error:0];
      v212 = [v211 decodeObjectOfClass:objc_opt_class() forKey:@"facePrint"];
      if (v212)
      {
        v213 = +[NSMutableArray array];
        [v212 confidence];
        float v215 = v214;
        if (_os_feature_enabled_impl()) {
          float v216 = 0.2;
        }
        else {
          float v216 = 0.9;
        }
        if (v215 < v216) {
          goto LABEL_249;
        }
        if (v268)
        {
          v217 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v268 error:0];
          uint64_t v218 = [v217 decodeObjectOfClass:objc_opt_class() forKey:@"torsoPrint"];
          if (!v218)
          {
            if ((int)MediaAnalysisLogLevel() < 3)
            {
              int v221 = 61;
LABEL_259:

              goto LABEL_260;
            }
            v231 = VCPLogInstance();
            if (os_log_type_enabled(v231, v247))
            {
              v232 = [v279 localIdentifier];
              *(_DWORD *)CMTimeRange buf = 138412290;
              *(void *)v344 = v232;
              _os_log_impl((void *)&_mh_execute_header, v231, v247, "Failed to decode torsoprint for asset [%@]", buf, 0xCu);
            }
            int v221 = 61;
LABEL_257:

            goto LABEL_259;
          }
          v219 = (void *)v218;
        }
        else
        {
          v219 = 0;
        }
        v251 = v219;
        id v252 = [objc_alloc((Class)VNFaceTorsoprint) initWithFaceprint:v212 torsoprint:v219];
        id v281 = 0;
        v222 = [v252 serializeStateAndReturnError:&v281];
        id v223 = v281;
        v224 = v223;
        if (!v222 || v223)
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
            v228 = v224;
            int v39 = -18;
            int v229 = 1;
            goto LABEL_247;
          }
          v227 = VCPLogInstance();
          v228 = v224;
          if (os_log_type_enabled(v227, v247))
          {
            v230 = [v224 description];
            *(_DWORD *)CMTimeRange buf = 138412290;
            *(void *)v344 = v230;
            _os_log_impl((void *)&_mh_execute_header, v227, v247, "Unable to serialize faceTorsoprint %@", buf, 0xCu);
          }
        }
        else
        {
          id v225 = objc_alloc((Class)PHFaceprint);
          if (_os_feature_enabled_impl()) {
            uint64_t v226 = 15;
          }
          else {
            uint64_t v226 = 11;
          }
          v227 = [v225 initWithFaceprintData:v222 faceprintVersion:v226];
          if (v227)
          {
            v228 = 0;
            [v213 addObject:v252];
            [v249 addObject:v227];
            int v229 = 0;
LABEL_246:

LABEL_247:
            if (v229)
            {
              int v221 = 1;
LABEL_260:

              goto LABEL_261;
            }
LABEL_249:
            if (![v213 count])
            {
              int v221 = 0;
              goto LABEL_260;
            }
            v217 = +[NSMutableDictionary dictionary];
            if ([(VCPPhotosAssetChangeManager *)self associateTraitsWithFaceTorspPrints:v213 forAsset:v279 withAnalysis:v280 results:v217])
            {
              if ((int)MediaAnalysisLogLevel() < 3)
              {
                int v39 = -18;
                int v221 = 1;
                goto LABEL_259;
              }
              v231 = VCPLogInstance();
              if (os_log_type_enabled(v231, v247))
              {
                *(_WORD *)CMTimeRange buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v231, v247, "Failed to associateTraits", buf, 2u);
              }
              int v39 = -18;
              int v221 = 1;
            }
            else
            {
              v217 = v217;
              int v221 = 0;
              v231 = v246;
              v246 = v217;
            }
            goto LABEL_257;
          }
          v228 = 0;
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v233 = VCPLogInstance();
            if (os_log_type_enabled(v233, v247))
            {
              *(_WORD *)CMTimeRange buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v233, v247, "Unable to create faceprint", buf, 2u);
            }
          }
        }
        int v39 = -18;
        int v229 = 1;
        goto LABEL_246;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v213 = VCPLogInstance();
        if (os_log_type_enabled(v213, v248))
        {
          v220 = [v279 localIdentifier];
          *(_DWORD *)CMTimeRange buf = 138412290;
          *(void *)v344 = v220;
          _os_log_impl((void *)&_mh_execute_header, v213, v248, "Failed to decode faceprint for asset [%@]", buf, 0xCu);
        }
        int v221 = 61;
        goto LABEL_260;
      }
      int v221 = 61;
LABEL_261:

      if (v221 != 61 && v221)
      {

        v198 = v246;
        goto LABEL_282;
      }
      v207 = (char *)v207 + 1;
    }
    while (v257 != v207);
    id v206 = [v254 countByEnumeratingWithState:&v282 objects:v333 count:16];
    if (v206) {
      continue;
    }
    break;
  }
LABEL_265:

  [(VCPMovieChangeEntry *)log setFacesToAdd:v249];
  [(VCPMovieChangeEntry *)log setHumanActionsForFacesToAdd:v246];

LABEL_266:
  if ((objc_msgSend(v280, "vcp_types") & 0x40000000) == 0)
  {
LABEL_269:
    -[VCPMovieChangeEntry setScreenTimeDeviceImageSensitivity:](log, "setScreenTimeDeviceImageSensitivity:", [(id)objc_opt_class() sensitivityFromAnalysis:v280]);
    if (!objc_msgSend(v279, "mad_isEligibleForComputeSync"))
    {
LABEL_280:
      [(NSMutableArray *)self->_pendingChanges addObject:log];
      int v39 = 0;
      goto LABEL_284;
    }
    -[VCPMovieChangeEntry setAnalysisStage:](log, "setAnalysisStage:", objc_msgSend(v279, "mad_analysisStageAfterCompletingAnalysis:", 1));
    v235 = VCPSignPostLog();
    os_signpost_id_t v236 = os_signpost_id_generate(v235);

    v237 = VCPSignPostLog();
    v238 = v237;
    if (v236 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v237))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v238, OS_SIGNPOST_INTERVAL_BEGIN, v236, "VCPPhotosAssetChangeManager_Movie_PackComputeSyncPayload", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    v239 = +[VCPProtoAssetAnalysis movieAnalysisComputeSyncPayloadFromLegacyDictionary:v280];
    v240 = VCPSignPostLog();
    v241 = v240;
    if (v236 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v240))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v241, OS_SIGNPOST_INTERVAL_END, v236, "VCPPhotosAssetChangeManager_Movie_PackComputeSyncPayload", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v239)
    {
      v242 = [v239 data];
      [(VCPMovieChangeEntry *)log setComputeSyncPayload:v242];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_279;
      }
      v242 = VCPLogInstance();
      os_log_type_t v243 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v242, v243))
      {
        v244 = [v279 localIdentifier];
        *(_DWORD *)CMTimeRange buf = 138412290;
        *(void *)v344 = v244;
        _os_log_impl((void *)&_mh_execute_header, v242, v243, "[%@] Failed to serialize movie analysis results as compute sync payload", buf, 0xCu);
      }
    }

LABEL_279:
    goto LABEL_280;
  }
  v234 = +[NSMutableDictionary dictionary];
  int v39 = [(VCPPhotosAssetChangeManager *)self associateTraitsForMovieAsset:v279 withAnalysis:v280 result:v234];
  if (!v39)
  {
    [(VCPMovieChangeEntry *)log setHumanActions:v234];

    goto LABEL_269;
  }
LABEL_283:

LABEL_284:
LABEL_72:

LABEL_73:
LABEL_74:

LABEL_75:
  return v39;
}

- (int)updateLegacyAsset:(id)a3 withAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_msgSend(v7, "vcp_types") & 0x40000) != 0)
  {
    id v8 = objc_alloc_init(VCPLegacyChangeEntry);
    [(VCPLegacyChangeEntry *)v8 setAsset:v6];
    -[VCPLegacyChangeEntry setMediaAnalysisVersion:](v8, "setMediaAnalysisVersion:", objc_msgSend(v7, "vcp_version"));
    os_log_type_t v9 = objc_msgSend(v7, "vcp_results");
    id v10 = [v9 objectForKeyedSubscript:@"MovieSummaryResults"];

    if ([v10 count])
    {
      id v11 = [v10 objectAtIndexedSubscript:0];
      unint64_t v12 = [v11 objectForKeyedSubscript:@"attributes"];

      if (![v12 count])
      {

LABEL_36:
        goto LABEL_37;
      }
      os_log_type_t v13 = [v10 objectAtIndexedSubscript:0];
      id v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "vcp_timerange");
      }
      else
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
      }
      v39[0] = v40;
      v39[1] = v41;
      v39[2] = v42;
      [(VCPLegacyChangeEntry *)v8 setSummaryTimeRange:v39];

      uint64_t v24 = [v10 objectAtIndexedSubscript:0];
      unint64_t v25 = (unint64_t)objc_msgSend(v24, "vcp_flags");
      double v26 = 0.0;
      if ((v25 & 0x80000) != 0) {
        *(float *)&double v26 = 1.0;
      }
      [(VCPLegacyChangeEntry *)v8 setAutoplayScore:v26];

      if (!v8
        || ([(VCPLegacyChangeEntry *)v8 summaryTimeRange], (v45 & 1) == 0)
        || ([(VCPLegacyChangeEntry *)v8 summaryTimeRange], (v38 & 1) == 0)
        || ([(VCPLegacyChangeEntry *)v8 summaryTimeRange], v37))
      {

        goto LABEL_36;
      }
      [(VCPLegacyChangeEntry *)v8 summaryTimeRange];

      if (v36 < 0) {
        goto LABEL_36;
      }
    }
    else
    {
      long long v15 = *(_OWORD *)&kCMTimeRangeZero.start.epoch;
      v35[0] = *(_OWORD *)&kCMTimeRangeZero.start.value;
      v35[1] = v15;
      v35[2] = *(_OWORD *)&kCMTimeRangeZero.duration.timescale;
      [(VCPLegacyChangeEntry *)v8 setSummaryTimeRange:v35];
      [(VCPLegacyChangeEntry *)v8 setAutoplayScore:0.0];
    }
    if (!objc_msgSend(v6, "mad_isEligibleForComputeSync"))
    {
LABEL_35:
      [(NSMutableArray *)self->_pendingChanges addObject:v8];
      goto LABEL_36;
    }
    -[VCPLegacyChangeEntry setAnalysisStage:](v8, "setAnalysisStage:", objc_msgSend(v6, "mad_analysisStageAfterCompletingAnalysis:", 1));
    if ([v6 isVideo])
    {
      os_log_type_t v16 = VCPSignPostLog();
      os_signpost_id_t v17 = os_signpost_id_generate(v16);

      id v18 = VCPSignPostLog();
      unint64_t v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPPhotosAssetChangeManager_LegacyMovie_PackComputeSyncPayload", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      uint64_t v20 = +[VCPProtoAssetAnalysis movieAnalysisComputeSyncPayloadFromLegacyDictionary:v7];
      unint64_t v21 = VCPSignPostLog();
      id v22 = v21;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)CMTimeRange buf = 0;
        unint64_t v23 = "VCPPhotosAssetChangeManager_LegacyMovie_PackComputeSyncPayload";
LABEL_30:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v17, v23, (const char *)&unk_1001F3BD3, buf, 2u);
      }
    }
    else
    {
      os_log_type_t v27 = VCPSignPostLog();
      os_signpost_id_t v17 = os_signpost_id_generate(v27);

      float v28 = VCPSignPostLog();
      os_log_type_t v29 = v28;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPPhotosAssetChangeManager_LegacyImage_PackComputeSyncPayload", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      uint64_t v20 = +[VCPProtoAssetAnalysis imageAnalysisComputeSyncPayloadFromLegacyDictionary:v7];
      uint64_t v30 = VCPSignPostLog();
      id v22 = v30;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        *(_WORD *)CMTimeRange buf = 0;
        unint64_t v23 = "VCPPhotosAssetChangeManager_LegacyImage_PackComputeSyncPayload";
        goto LABEL_30;
      }
    }

    if (v20)
    {
      CGFloat v31 = [v20 data];
      [(VCPLegacyChangeEntry *)v8 setComputeSyncPayload:v31];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_34;
      }
      CGFloat v31 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v31, v33))
      {
        double v34 = [v6 localIdentifier];
        *(_DWORD *)CMTimeRange buf = 138412290;
        long long v44 = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, v33, "[%@] Failed to serialize analysis results as compute sync payload", buf, 0xCu);
      }
    }

LABEL_34:
    goto LABEL_35;
  }
LABEL_37:

  return 0;
}

- (int)updateAsset:(id)a3 withAnalysis:(id)a4 imageOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v10, v11))
    {
      unint64_t v12 = [v8 localIdentifier];
      objc_msgSend(v8, "vcp_typeDescription");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = MediaAnalysisTypeDescription((uint64_t)objc_msgSend(v9, "vcp_types"));
      long long v15 = (void *)v14;
      CFStringRef v16 = @"NO";
      *(_DWORD *)int v39 = 138413058;
      *(void *)&v39[4] = v12;
      if (v5) {
        CFStringRef v16 = @"YES";
      }
      *(_WORD *)&v39[12] = 2112;
      *(void *)&v39[14] = v13;
      *(_WORD *)&v39[22] = 2112;
      uint64_t v40 = v14;
      __int16 v41 = 2112;
      CFStringRef v42 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%@] Updating asset (%@) with results %@ (imageOnly: %@)", v39, 0x2Au);
    }
  }
  os_signpost_id_t v17 = objc_msgSend(v9, "vcp_dateModified", *(_OWORD *)v39);
  id v18 = objc_msgSend(v8, "vcp_modificationDate");
  unsigned __int8 v19 = [v17 isEqualToDate:v18];

  if ((v19 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unint64_t v21 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v21, v22))
      {
        unint64_t v23 = [v8 localIdentifier];
        uint64_t v24 = objc_msgSend(v9, "vcp_dateModified");
        unint64_t v25 = objc_msgSend(v8, "vcp_modificationDate");
        *(_DWORD *)int v39 = 138412802;
        *(void *)&v39[4] = v23;
        *(_WORD *)&v39[12] = 2112;
        *(void *)&v39[14] = v24;
        *(_WORD *)&v39[22] = 2112;
        uint64_t v40 = (uint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "[%@] analysis vcp_dateModified: %@, but asset vcp_modificationDate: %@; skip updating ...",
          v39,
          0x20u);
      }
    }
    goto LABEL_32;
  }
  if (objc_msgSend(v9, "vcp_version") == 70 || v5 && objc_msgSend(v8, "isVideo"))
  {
    if ([v8 isVideo]) {
      unsigned int v20 = [(VCPPhotosAssetChangeManager *)self updateMovieAsset:v8 withAnalysis:v9 imageOnly:v5];
    }
    else {
      unsigned int v20 = [(VCPPhotosAssetChangeManager *)self updateImageAsset:v8 withAnalysis:v9 imageOnly:v5];
    }
LABEL_23:
    int v29 = v20;
    if (v20) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  if ((int)objc_msgSend(v9, "vcp_version") < 70
    && (signed int v26 = objc_msgSend(v9, "vcp_version"),
        [v8 mediaAnalysisProperties],
        os_log_type_t v27 = objc_claimAutoreleasedReturnValue(),
        BOOL v28 = (unint64_t)[v27 mediaAnalysisVersion] < v26,
        v27,
        v28))
  {
    if (([v8 isVideo] & 1) != 0 || objc_msgSend(v8, "vcp_isLivePhoto"))
    {
      unsigned int v20 = [(VCPPhotosAssetChangeManager *)self updateLegacyAsset:v8 withAnalysis:v9];
      goto LABEL_23;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v30 = VCPLogInstance();
    os_log_type_t v31 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = [v8 localIdentifier];
      unsigned int v33 = objc_msgSend(v9, "vcp_version");
      double v34 = [v8 mediaAnalysisProperties];
      unsigned int v35 = [v34 mediaAnalysisImageVersion];
      uint64_t v36 = [v8 mediaAnalysisProperties];
      unsigned int v37 = [v36 mediaAnalysisVersion];
      *(_DWORD *)int v39 = 138413058;
      *(void *)&v39[4] = v32;
      *(_WORD *)&v39[12] = 1024;
      *(_DWORD *)&v39[14] = v33;
      *(_WORD *)&v39[18] = 1024;
      *(_DWORD *)&v39[20] = v35;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v37;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "[%@] Nothing to update Photos analysis vcp_version %d, Photos mediaAnalysisImageVersion %d, mediaAnalysisVersion %d", v39, 0x1Eu);
    }
  }
LABEL_29:
  if ((unint64_t)[(NSMutableArray *)self->_pendingChanges count] <= 0x63
    && self->_pendingResourceChangeCount < 5
    || (int v29 = [(VCPPhotosAssetChangeManager *)self publishPendingChanges]) == 0)
  {
LABEL_32:
    int v29 = 0;
  }
LABEL_33:

  return v29;
}

- (int)publishPendingChanges
{
  if (![(NSMutableArray *)self->_pendingChanges count]) {
    return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    objc_super v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      unsigned int v5 = [(NSMutableArray *)self->_pendingChanges count];
      qos_class_t v6 = qos_class_self();
      id v7 = VCPMAQoSDescription(v6);
      *(_DWORD *)CMTimeRange buf = 67109378;
      unsigned int v25 = v5;
      __int16 v26 = 2112;
      os_log_type_t v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "  Publishing PHAssetPropertySetMediaAnalysis for %d assets (QoS: %@)", buf, 0x12u);
    }
  }
  id v8 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v8, "addBreadcrumb:", @"[PhotosAssetChangeManager] Persisting %d assets to Photos", -[NSMutableArray count](self->_pendingChanges, "count"));

  id v9 = +[MADStateHandler sharedStateHandler];
  [v9 enterKnownTimeoutRisk:1];

  id v10 = VCPSignPostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  unint64_t v12 = VCPSignPostLog();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VCPFullAnalysisPersistChanges", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  photoLibrarCGFloat y = self->_photoLibrary;
  id v22 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10011E67C;
  v23[3] = &unk_100219FC8;
  v23[4] = self;
  [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v23 error:&v22];
  id v15 = v22;
  CFStringRef v16 = VCPSignPostLog();
  os_signpost_id_t v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v11, "VCPFullAnalysisPersistChanges", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  id v18 = +[MADStateHandler sharedStateHandler];
  [v18 exitKnownTimeoutRisk];

  unsigned __int8 v19 = +[MADStateHandler sharedStateHandler];
  objc_msgSend(v19, "addBreadcrumb:", @"[PhotosAssetChangeManager] Finished persisting %d assets to Photos", -[NSMutableArray count](self->_pendingChanges, "count"));

  [(NSMutableArray *)self->_pendingChanges removeAllObjects];
  self->_pendingResourceChangeCount = 0;
  if (v15) {
    int v20 = -18;
  }
  else {
    int v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end