@interface VCPAssetAnalysisTask
+ (id)taskWithAnalysisTypes:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5;
- (BOOL)allowStreaming;
- (NSDictionary)analysisResults;
- (PHAsset)asset;
- (VCPAssetAnalysisTask)initWithAnalysisTypes:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5;
- (VCPPhotosAssetChangeManager)photosChangeManager;
- (double)cost;
- (int)mainInternal;
- (unint64_t)types;
- (void)_reportCoreAnalyticsWithAsset:(id)a3 analysis:(id)a4 analysisStatus:(int64_t)a5 processingInterval:(double)a6 extendedAnalysisStatus:(id)a7;
- (void)publishLivePhotoEffectsAnalysis:(id)a3 toAsset:(id)a4;
- (void)setAllowStreaming:(BOOL)a3;
- (void)setPhotosChangeManager:(id)a3;
@end

@implementation VCPAssetAnalysisTask

- (VCPAssetAnalysisTask)initWithAnalysisTypes:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [v9 photoLibrary];
    v15.receiver = self;
    v15.super_class = (Class)VCPAssetAnalysisTask;
    v12 = [(VCPTask *)&v15 initWithPhotoLibrary:v11];

    if (v12)
    {
      v12->_types = a3;
      objc_storeStrong((id *)&v12->_asset, a4);
      objc_storeStrong((id *)&v12->_existingAnalysis, a5);
      v12->_allowStreaming = 0;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)taskWithAnalysisTypes:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [objc_alloc((Class)objc_opt_class()) initWithAnalysisTypes:a3 forAsset:v7 withExistingAnalysis:v8];

  return v9;
}

- (double)cost
{
  if ([(PHAsset *)self->_asset isVideo] && self->_types != VCPMAFullAnalysisTypesThumbnail)
  {
    asset = self->_asset;
    [(PHAsset *)asset duration];
  }
  else
  {
    if (![(PHAsset *)self->_asset vcp_isLivePhoto]) {
      return 1.0;
    }
    double result = 3.0;
    if ((VCPMAFullAnalysisTypesLivePhoto & self->_types) == 0) {
      return 1.0;
    }
  }
  return result;
}

- (void)publishLivePhotoEffectsAnalysis:(id)a3 toAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"metadataRanges"];
    id v8 = [v7 objectForKeyedSubscript:@"LivePhotoEffectsResults"];

    if ([v8 count])
    {
      id v9 = [v8 objectAtIndexedSubscript:0];
      id v10 = [v9 objectForKeyedSubscript:@"attributes"];

      if (v10)
      {
        v11 = [v10 objectForKeyedSubscript:@"loopSuggestionState"];
        signed int v12 = [v11 intValue];

        v13 = [v10 objectForKeyedSubscript:@"longExposureSuggestionState"];
        signed int v14 = [v13 intValue];

        objc_super v15 = [v6 photoLibrary];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000A1FCC;
        v22[3] = &unk_10021A408;
        id v23 = v6;
        uint64_t v24 = v12;
        uint64_t v25 = v14;
        id v21 = 0;
        unsigned int v16 = [v15 performChangesAndWait:v22 error:&v21];
        id v17 = v21;

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v18 = VCPLogInstance();
          os_log_type_t v19 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v18, v19))
          {
            CFStringRef v20 = @"NO";
            if (v16) {
              CFStringRef v20 = @"YES";
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v27 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, v19, "Publish live photo effects suggestion states success: %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void)_reportCoreAnalyticsWithAsset:(id)a3 analysis:(id)a4 analysisStatus:(int64_t)a5 processingInterval:(double)a6 extendedAnalysisStatus:(id)a7
{
  id v39 = a3;
  id v11 = a4;
  signed int v12 = (__CFString *)a7;
  v13 = +[NSMutableDictionary dictionary];
  unint64_t v14 = (unint64_t)objc_msgSend(v11, "vcp_flags");
  objc_super v15 = +[NSNumber numberWithBool:a5 == 2];
  [v13 setObject:v15 forKeyedSubscript:@"AnalyzeSuccess"];

  unsigned int v16 = objc_msgSend(v39, "vcp_typeDescription");
  [v13 setObject:v16 forKeyedSubscript:@"AssetType"];

  id v17 = +[NSNumber numberWithDouble:a6];
  [v13 setObject:v17 forKeyedSubscript:@"TimeAnalyzing"];

  if ((objc_msgSend(v39, "vcp_isLivePhoto") & 1) != 0 || objc_msgSend(v39, "isVideo"))
  {
    v18 = +[NSNumber numberWithBool:(v14 >> 29) & 1];
    [v13 setObject:v18 forKeyedSubscript:@"IsStreamAnalysis"];

    if ([v39 isVideo])
    {
      [v39 duration];
      os_log_type_t v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v13 setObject:v19 forKeyedSubscript:@"LengthOfMovieContentInSeconds"];
    }
  }
  if (v12) {
    CFStringRef v20 = v12;
  }
  else {
    CFStringRef v20 = &stru_10021F768;
  }
  [v13 setObject:v20 forKeyedSubscript:@"AnalysisStatusExtension"];
  unint64_t v21 = (unint64_t)objc_msgSend(v39, "vcp_fullAnalysisTypes");
  unint64_t v22 = v21 & ~(unint64_t)objc_msgSend(v11, "vcp_types") & 0xFFFFFFFFFFEFFFFFLL;
  id v23 = +[NSNumber numberWithBool:v22 == 0];
  [v13 setObject:v23 forKeyedSubscript:@"ResourceCondition"];

  uint64_t v24 = objc_msgSend(v11, "vcp_dateAnalyzed");
  [v24 timeIntervalSinceReferenceDate];
  double v26 = v25;

  CFStringRef v27 = [v39 creationDate];
  [v27 timeIntervalSinceReferenceDate];
  double v29 = v28;

  v30 = [v39 photoLibrary];
  v31 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v30];

  v32 = VCPStartTimestampKeyForTask(1);
  id v33 = [v31 valueForKey:v32];

  if ((uint64_t)v33 <= (uint64_t)v29) {
    uint64_t v34 = (uint64_t)v29;
  }
  else {
    uint64_t v34 = (uint64_t)v33;
  }
  v35 = +[NSNumber numberWithLongLong:(unint64_t)(((((uint64_t)v26 - v34) & (unint64_t)~(((uint64_t)v26 - v34) >> 63))* (unsigned __int128)0x1845C8A0CE512957uLL) >> 64) >> 13];
  [v13 setObject:v35 forKeyedSubscript:@"DaysWaitedBeforeAnalyzed"];

  v36 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v36 sendEvent:@"com.apple.mediaanalysisd.FullAnalysisPerAssetInfo" withAnalytics:v13];
  if (a5 == 3) {
    [v36 accumulateInt64Value:1 forField:@"NumberOfAssetsIntoBlacklist" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];
  }
  if ((v14 & 0x20000000) != 0) {
    [v36 accumulateInt64Value:1 forField:@"NumberOfAssetsSteamed" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];
  }
  if ([v39 isVideo])
  {
    v37 = &VCPAnalyticsFieldNumberOfMoviesAnalyzedPartialResource;
    v38 = &VCPAnalyticsFieldNumberOfMoviesAnalyzedFullResource;
  }
  else if (objc_msgSend(v39, "vcp_isLivePhoto"))
  {
    v37 = &VCPAnalyticsFieldNumberOfLivePhotosAnalyzedPartialResource;
    v38 = &VCPAnalyticsFieldNumberOfLivePhotosAnalyzedFullResource;
  }
  else
  {
    v37 = &VCPAnalyticsFieldNumberOfPhotosAnalyzedPartialResource;
    v38 = &VCPAnalyticsFieldNumberOfPhotosAnalyzedFullResource;
  }
  if (!v22) {
    v37 = v38;
  }
  [v36 accumulateInt64Value:1 forField:*v37 andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];
}

- (int)mainInternal
{
  v86 = [(PHAsset *)self->_asset localIdentifier];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = [(PHAsset *)self->_asset vcp_typeDescription];
      id v7 = MediaAnalysisTypeShortDescription(self->_types);
      *(_DWORD *)buf = 138412802;
      v92 = v86;
      __int16 v93 = 2112;
      double v94 = *(double *)&v6;
      __int16 v95 = 2112;
      v96 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "  [%@] Analyzing %@ (%@)", buf, 0x20u);
    }
  }
  v85 = +[NSDate date];
  unsigned int v8 = [(PHAsset *)self->_asset isVideo];
  unint64_t types = self->_types;
  if (types == VCPMAFullAnalysisTypesThumbnail) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = v8;
  }
  if (v10 == 1)
  {
    id v11 = [objc_alloc((Class)VCPMovieAnalyzer) initWithPHAsset:self->_asset withExistingAnalysis:self->_existingAnalysis forAnalysisTypes:self->_types];
    buf[0] = 0;
    objc_msgSend(v11, "setAllowStreaming:", -[VCPAssetAnalysisTask allowStreaming](self, "allowStreaming"));
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_1000A36AC;
    v90[3] = &unk_100219D98;
    v90[4] = self;
    signed int v12 = [v11 analyzeAsset:v90 streamed:buf];
    uint64_t v13 = (uint64_t)[v11 status];
    BOOL v15 = [v11 status] == (id)4 && buf[0] != 0;
    goto LABEL_35;
  }
  if ((types & 0xFFFFFFFFCBFFFFFFLL) == 0)
  {
    id v11 = [(NSDictionary *)self->_existingAnalysis mutableCopy];
LABEL_19:
    if ((self->_types & 0x34000000) != 0)
    {
      v18 = objc_msgSend(v11, "vcp_results");
      os_log_type_t v19 = [v18 objectForKeyedSubscript:@"MovieSummaryResults"];

      if ([v19 count]
        && ([v19 objectAtIndexedSubscript:0],
            CFStringRef v20 = objc_claimAutoreleasedReturnValue(),
            BOOL v21 = ((unint64_t)objc_msgSend(v20, "vcp_flags") & 0x80000) == 0,
            v20,
            !v21))
      {
        id v24 = [objc_alloc((Class)VCPPhotoAnalyzer) initWithPHAsset:self->_asset withExistingAnalysis:0 forAnalysisTypes:self->_types & 0x34000000];
        objc_msgSend(v24, "setAllowStreaming:", -[VCPAssetAnalysisTask allowStreaming](self, "allowStreaming"));
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_1000A379C;
        v88[3] = &unk_100219D98;
        v88[4] = self;
        double v25 = [v24 analyzeAsset:v88 withOptions:0];
        uint64_t v13 = (uint64_t)[v24 status];
        if (v13 == 2)
        {
          v2 = objc_msgSend(v25, "vcp_results");
          objc_msgSend(v11, "vcp_addEntriesFromResults:", v2);

          objc_msgSend(v11, "vcp_addTypes:", self->_types & 0x34000000);
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          unint64_t v22 = VCPLogInstance();
          os_log_type_t v23 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v22, v23))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v86;
            _os_log_impl((void *)&_mh_execute_header, v22, v23, "  [%@] Pre-gating for stabilization not passed.", buf, 0xCu);
          }
        }
        objc_msgSend(v11, "vcp_addTypes:", self->_types & 0x34000000);
        uint64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v13 = 2;
    }
    goto LABEL_32;
  }
  id v16 = [objc_alloc((Class)VCPPhotoAnalyzer) initWithPHAsset:self->_asset withExistingAnalysis:self->_existingAnalysis forAnalysisTypes:self->_types & 0xFFFFFFFFCBFFFFFFLL];
  objc_msgSend(v16, "setAllowStreaming:", -[VCPAssetAnalysisTask allowStreaming](self, "allowStreaming"));
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1000A3724;
  v89[3] = &unk_100219D98;
  v89[4] = self;
  id v17 = [v16 analyzeAsset:v89 withOptions:0];
  id v11 = [v17 mutableCopy];

  uint64_t v13 = (uint64_t)[v16 status];
  if (v13 == 2) {
    goto LABEL_19;
  }
LABEL_32:
  if (v11)
  {
    id v11 = v11;
    BOOL v15 = 0;
    signed int v12 = v11;
  }
  else
  {
    BOOL v15 = 0;
    signed int v12 = 0;
  }
LABEL_35:

  objc_storeStrong((id *)&self->_analysisResults, v12);
  double v26 = [(VCPTask *)self photoLibrary];
  CFStringRef v27 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v26];

  if (v12 && v13 != 2 && [(PHAsset *)self->_asset vcp_isLivePhoto])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v28 = VCPLogInstance();
      os_log_type_t v29 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v28, v29))
      {
        *(_DWORD *)buf = 138412290;
        v92 = v86;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "  [%@] Partial analysis completed", buf, 0xCu);
      }
    }
    unsigned int v30 = [v27 storeAnalysisForAsset:self->_asset analysis:v12];
    LODWORD(v2) = v30;
    if (v30 == -108 || v30 == -36 || v30 == -23) {
      goto LABEL_125;
    }
  }
  switch(v13)
  {
    case 4:
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v40 = VCPLogInstance();
        os_log_type_t v41 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v40, v41))
        {
          *(_DWORD *)buf = 138412290;
          v92 = v86;
          _os_log_impl((void *)&_mh_execute_header, v40, v41, "  [%@] Analysis cancelled", buf, 0xCu);
        }
      }
      if (v12 && [(PHAsset *)self->_asset isVideo])
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v42 = VCPLogInstance();
          os_log_type_t v43 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v42, v43))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v86;
            _os_log_impl((void *)&_mh_execute_header, v42, v43, "  [%@] Analysis cancelled with partially valid results", buf, 0xCu);
          }
        }
        v44 = +[VCPPausedAnalysis pausedAnalysis:v12 forAsset:self->_asset];
        [v44 persist];
        unsigned int v45 = [v27 decrementBlacklistCountForLocalIdentifier:v86];
        unsigned int v46 = v45;
        if (v45 == -108 || v45 == -36)
        {
          unsigned int v47 = v45;
        }
        else
        {
          unsigned int v47 = v45;
          if (v45 != -23) {
            unsigned int v47 = v2;
          }
        }

        if (v46 == -108 || v46 == -36 || v46 == -23) {
          goto LABEL_110;
        }
        CFStringRef v53 = @"CanceledWithPartialResults";
LABEL_124:
        v60 = +[NSDate date];
        [v60 timeIntervalSinceDate:v85];
        double v62 = v61;

        [(VCPAssetAnalysisTask *)self _reportCoreAnalyticsWithAsset:self->_asset analysis:v12 analysisStatus:4 processingInterval:v53 extendedAnalysisStatus:v62];
        LODWORD(v2) = -128;
        goto LABEL_125;
      }
      v48 = +[NSDate date];
      [v48 timeIntervalSinceDate:v85];
      double v50 = v49;

      if (v50 >= 1800.0)
      {
        if ((int)MediaAnalysisLogLevel() < 4)
        {
          CFStringRef v53 = @"CanceledWithNoProgress";
          goto LABEL_124;
        }
        v51 = VCPLogInstance();
        os_log_type_t v54 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v51, v54))
        {
          *(_DWORD *)buf = 138412546;
          v92 = v86;
          __int16 v93 = 2048;
          double v94 = v50;
          _os_log_impl((void *)&_mh_execute_header, v51, v54, "  [%@] Analysis failed to progress in extended processing interval (%.0fs)", buf, 0x16u);
        }
        CFStringRef v53 = @"CanceledWithNoProgress";
      }
      else
      {
        if (!v15)
        {
          unsigned int v56 = [v27 decrementBlacklistCountForLocalIdentifier:v86];
          if (v56 == -108 || v56 == -36)
          {
            unsigned int v57 = v56;
          }
          else
          {
            unsigned int v57 = v56;
            if (v56 != -23) {
              unsigned int v57 = v2;
            }
          }
          if (v56 == -108 || v56 == -36 || v56 == -23)
          {
            LODWORD(v2) = v57;
            goto LABEL_125;
          }
          CFStringRef v53 = 0;
          goto LABEL_124;
        }
        if ((int)MediaAnalysisLogLevel() < 4)
        {
          CFStringRef v53 = @"CanceledAfterStreaming";
          goto LABEL_124;
        }
        v51 = VCPLogInstance();
        os_log_type_t v52 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v51, v52))
        {
          *(_DWORD *)buf = 138412290;
          v92 = v86;
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "  [%@] Analysis cancelled after resource streamed", buf, 0xCu);
        }
        CFStringRef v53 = @"CanceledAfterStreaming";
      }

      goto LABEL_124;
    case 3:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v35 = VCPLogInstance();
        os_log_type_t v36 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v35, v36))
        {
          *(_DWORD *)buf = 138412290;
          v92 = v86;
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "  [%@] Analysis failed", buf, 0xCu);
        }
      }
      v37 = +[NSDate date];
      [v37 timeIntervalSinceDate:v85];
      double v39 = v38;

      [(VCPAssetAnalysisTask *)self _reportCoreAnalyticsWithAsset:self->_asset analysis:v12 analysisStatus:3 processingInterval:0 extendedAnalysisStatus:v39];
      break;
    case 2:
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v31 = VCPLogInstance();
        os_log_type_t v32 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v31, v32))
        {
          *(_DWORD *)buf = 138412290;
          v92 = v86;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "  [%@] Analysis completed", buf, 0xCu);
        }
      }
      unsigned int v33 = [v27 storeAnalysisForAsset:self->_asset analysis:v12];
      if (v33 == -108 || v33 == -36)
      {
        unsigned int v34 = v33;
      }
      else
      {
        unsigned int v34 = v33;
        if (v33 != -23) {
          unsigned int v34 = v2;
        }
      }
      if (v33 == -108 || v33 == -36 || v33 == -23)
      {
        LODWORD(v2) = v34;
        goto LABEL_125;
      }
      unsigned int v55 = [v27 removeLocalIdentifierFromBlacklist:v86];
      if (v55 == -108 || v55 == -36)
      {
        unsigned int v47 = v55;
      }
      else
      {
        unsigned int v47 = v55;
        if (v55 != -23) {
          unsigned int v47 = v34;
        }
      }
      if (v55 == -108 || v55 == -36 || v55 == -23)
      {
LABEL_110:
        LODWORD(v2) = v47;
        goto LABEL_125;
      }
      if ([(PHAsset *)self->_asset vcp_isLivePhoto]) {
        [(VCPAssetAnalysisTask *)self publishLivePhotoEffectsAnalysis:v12 toAsset:self->_asset];
      }
      v58 = [(PHAsset *)self->_asset localIdentifier];
      id v87 = 0;
      unsigned int v59 = [v27 analysisForAsset:v58 analysis:&v87];
      id v84 = v87;

      if (v59 == -108 || v59 == -36)
      {
        LODWORD(v2) = v59;
      }
      else
      {
        LODWORD(v2) = v59;
        if (v59 != -23) {
          LODWORD(v2) = v47;
        }
      }
      if (v59 == -108 || v59 == -36 || v59 == -23)
      {
        uint64_t v64 = (uint64_t)v12;
LABEL_147:

        signed int v12 = (void *)v64;
        goto LABEL_125;
      }
      v65 = objc_msgSend(v12, "vcp_results");
      v83 = [v65 objectForKeyedSubscript:@"KeyFrameResourceResults"];

      uint64_t v64 = MergeKeyFrameResourceResultsIntoExistingAnalysis(v83, v84);

      if (self->_photosChangeManager)
      {
        v66 = [(PHAsset *)self->_asset mediaAnalysisProperties];
        v67 = v66;
        v82 = v66;
        if (!v66
          || (unint64_t)[v66 mediaAnalysisVersion] < 0x46
          || ([v67 mediaAnalysisTimeStamp],
              v68 = objc_claimAutoreleasedReturnValue(),
              [(PHAsset *)self->_asset vcp_modificationDate],
              v69 = objc_claimAutoreleasedReturnValue(),
              unsigned int v70 = [v68 isEqualToDate:v69],
              v69,
              v68,
              v70))
        {
          if ([(VCPPhotosAssetChangeManager *)self->_photosChangeManager updateAsset:self->_asset withAnalysis:v64 imageOnly:0]&& (int)MediaAnalysisLogLevel() >= 4)
          {
            v71 = VCPLogInstance();
            os_log_type_t v72 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v71, v72))
            {
              *(_DWORD *)buf = 138412290;
              v92 = v86;
              _os_log_impl((void *)&_mh_execute_header, v71, v72, "  [%@] Failed to store PHAssetMediaAnalysisProperties", buf, 0xCu);
            }
          }
        }
        v73 = +[NSDate now];
        [v73 timeIntervalSinceDate:v85];
        double v75 = v74;

        v76 = [(VCPTask *)self photoLibrary];
        v2 = +[VCPBackgroundProcessingMetrics sharedMetricsWithPhotoLibrary:v76];

        [v2 loadMetrics];
        [v2 reportAnalyzedAsset:self->_asset withAnalysis:v64 andProcessingTime:v75];
        [(VCPAssetAnalysisTask *)self _reportCoreAnalyticsWithAsset:self->_asset analysis:v64 analysisStatus:2 processingInterval:0 extendedAnalysisStatus:v75];
        v77 = VCPTaskIDDescription(1);
        v78 = [(PHAsset *)self->_asset vcp_typeDescription];
        v79 = +[NSString stringWithFormat:@"%@-Analyze-%@", v77, v78];

        VCPCoreAnalyticsQoSReportSpeed(v79, v75 * 1000.0);
        LODWORD(v2) = 0;
        v80 = v82;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          LODWORD(v2) = -18;
          goto LABEL_146;
        }
        v80 = VCPLogInstance();
        os_log_type_t v81 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v80, v81))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v80, v81, "Failed to retrieve VCPPhotosAssetChangeManager", buf, 2u);
        }
        LODWORD(v2) = -18;
      }

LABEL_146:
      goto LABEL_147;
  }
  LODWORD(v2) = 0;
LABEL_125:

  return (int)v2;
}

- (unint64_t)types
{
  return self->_types;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSDictionary)analysisResults
{
  return self->_analysisResults;
}

- (BOOL)allowStreaming
{
  return self->_allowStreaming;
}

- (void)setAllowStreaming:(BOOL)a3
{
  self->_allowStreaming = a3;
}

- (VCPPhotosAssetChangeManager)photosChangeManager
{
  return self->_photosChangeManager;
}

- (void)setPhotosChangeManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosChangeManager, 0);
  objc_storeStrong((id *)&self->_analysisResults, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_existingAnalysis, 0);
}

@end