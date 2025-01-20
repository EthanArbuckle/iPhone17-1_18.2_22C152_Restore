@interface PHAsset
- (BOOL)mad_isFullAnalysisVersionOutdated:(BOOL)a3;
- (BOOL)vcp_eligibleForFullAnalysis;
- (BOOL)vcp_isAnalysisValid:(id)a3;
@end

@implementation PHAsset

- (BOOL)vcp_eligibleForFullAnalysis
{
  v3 = [(PHAsset *)self localIdentifier];
  v4 = [(PHAsset *)self vcp_modificationDate];

  if (!v4)
  {
    if ((int)MediaAnalysisLogLevel() < 5)
    {
      BOOL v8 = 0;
      goto LABEL_12;
    }
    v6 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v11))
    {
      int v13 = 138412290;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, v11, "  [%@] Missing modification date; ineligible",
        (uint8_t *)&v13,
        0xCu);
    }
    goto LABEL_10;
  }
  v5 = [(PHAsset *)self photoLibrary];
  v6 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v5];

  int v7 = [v6 getBlacklistCountForLocalIdentifier:v3];
  BOOL v8 = v7 < 2;
  if (v7 >= 2)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v9, v10))
      {
        int v13 = 138412290;
        v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "  [%@] Blacklisted; ineligible", (uint8_t *)&v13, 0xCu);
      }
    }
LABEL_10:
    BOOL v8 = 0;
  }

LABEL_12:
  return v8;
}

- (BOOL)vcp_isAnalysisValid:(id)a3
{
  id v4 = a3;
  v5 = [(PHAsset *)self vcp_modificationDate];
  v6 = objc_msgSend(v4, "vcp_dateModified");
  unsigned __int8 v7 = [v5 isEqualToDate:v6];

  return v7;
}

- (BOOL)mad_isFullAnalysisVersionOutdated:(BOOL)a3
{
  BOOL v3 = a3;
  if ((-[PHAsset vcp_needsFullAnalysisProcessing:](self, "vcp_needsFullAnalysisProcessing:") & 1) == 0)
  {
    if (([(PHAsset *)self mad_isNonLivePhotoImage] & 1) == 0 && v3) {
      return 0;
    }
    v6 = [(PHAsset *)self photoLibrary];
    unsigned __int8 v7 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v6];

    BOOL v8 = +[NSMutableDictionary dictionary];
    v9 = [(PHAsset *)self localIdentifier];
    v18 = v9;
    os_log_type_t v10 = +[NSArray arrayWithObjects:&v18 count:1];
    BOOL v11 = [v7 queryHeadersForAssets:v10 analyses:v8] == 0;

    if (!v11) {
      goto LABEL_7;
    }
    v12 = [(PHAsset *)self localIdentifier];
    int v13 = [v8 objectForKeyedSubscript:v12];

    if ((int)objc_msgSend(v13, "vcp_version") >= 70)
    {
      v14 = objc_msgSend(v13, "vcp_dateModified");
      v15 = [(PHAsset *)self vcp_modificationDate];
      unsigned __int8 v16 = [v14 isEqualToDate:v15];

      if (v16)
      {
LABEL_7:
        BOOL v5 = 0;
LABEL_12:

        return v5;
      }
    }
    else
    {
    }
    BOOL v5 = 1;
    goto LABEL_12;
  }
  return 1;
}

@end