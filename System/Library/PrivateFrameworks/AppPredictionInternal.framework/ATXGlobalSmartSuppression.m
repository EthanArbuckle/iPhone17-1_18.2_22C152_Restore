@interface ATXGlobalSmartSuppression
+ (int)decodeAssociationScoreForContext:(unint64_t)a3 forEncodedScore:(int)a4;
+ (int)decodeGeoAssociationScoreAtGeoHashResolution:(unint64_t)a3 forEncodedScore:(int)a4;
- (ATXGlobalSmartSuppression)init;
- (id)fetchContextualAssociationScoresForBundleId:(id)a3;
@end

@implementation ATXGlobalSmartSuppression

- (ATXGlobalSmartSuppression)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXGlobalSmartSuppression;
  v2 = [(ATXGlobalSmartSuppression *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ATXGlobalAppScoresUtil initializeTrieAtPath:@"ATXGlobalAssociationScores"];
    associationScoresTrie = v2->_associationScoresTrie;
    v2->_associationScoresTrie = (_PASCFBurstTrie *)v3;
  }
  return v2;
}

- (id)fetchContextualAssociationScoresForBundleId:(id)a3
{
  uint64_t v3 = [(_PASCFBurstTrie *)self->_associationScoresTrie payloadForString:a3];
  v4 = objc_opt_new();
  v5 = objc_msgSend(NSNumber, "numberWithInt:", +[ATXGlobalSmartSuppression decodeAssociationScoreForContext:forEncodedScore:](ATXGlobalSmartSuppression, "decodeAssociationScoreForContext:forEncodedScore:", 1, v3));
  [v4 setObject:v5 forKeyedSubscript:@"LOIType"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithInt:", +[ATXGlobalSmartSuppression decodeAssociationScoreForContext:forEncodedScore:](ATXGlobalSmartSuppression, "decodeAssociationScoreForContext:forEncodedScore:", 2, v3));
  [v4 setObject:v6 forKeyedSubscript:@"PartOfWeek"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", +[ATXGlobalSmartSuppression decodeAssociationScoreForContext:forEncodedScore:](ATXGlobalSmartSuppression, "decodeAssociationScoreForContext:forEncodedScore:", 3, v3));
  [v4 setObject:v7 forKeyedSubscript:@"CoarseTime"];

  v8 = objc_msgSend(NSNumber, "numberWithInt:", +[ATXGlobalSmartSuppression decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:](ATXGlobalSmartSuppression, "decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:", 2, v3));
  [v4 setObject:v8 forKeyedSubscript:@"GeohashZoom7"];

  v9 = objc_msgSend(NSNumber, "numberWithInt:", +[ATXGlobalSmartSuppression decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:](ATXGlobalSmartSuppression, "decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:", 1, v3));
  [v4 setObject:v9 forKeyedSubscript:@"GeohashCoarse"];

  v10 = objc_msgSend(NSNumber, "numberWithInt:", +[ATXGlobalSmartSuppression decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:](ATXGlobalSmartSuppression, "decodeGeoAssociationScoreAtGeoHashResolution:forEncodedScore:", 0, v3));
  [v4 setObject:v10 forKeyedSubscript:@"GeohashSpecific"];

  v11 = (void *)[v4 copy];
  return v11;
}

+ (int)decodeAssociationScoreForContext:(unint64_t)a3 forEncodedScore:(int)a4
{
  switch(a3)
  {
    case 0uLL:
      v4 = __atxlog_handle_app_prediction();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[ATXGlobalSmartSuppression decodeAssociationScoreForContext:forEncodedScore:](v4);
      }

      int result = 0;
      break;
    case 1uLL:
      int result = ((__int16)((33555 * (a4 % 10000)) >> 16) >> 9)
             + (((a4 % 10000 + ((-31981 * (a4 % 10000)) >> 16)) & 0x8000) >> 15);
      break;
    case 2uLL:
      uint64_t v6 = 1759218605 * (a4 % 100000);
      unint64_t v7 = (unint64_t)v6 >> 63;
      uint64_t v8 = v6 >> 44;
      goto LABEL_9;
    case 3uLL:
      uint64_t v9 = 351843721 * (a4 % 1000000);
      unint64_t v7 = (unint64_t)v9 >> 63;
      uint64_t v8 = v9 >> 45;
LABEL_9:
      int result = v8 + v7;
      break;
    default:
      int result = 0;
      break;
  }
  return result;
}

+ (int)decodeGeoAssociationScoreAtGeoHashResolution:(unint64_t)a3 forEncodedScore:(int)a4
{
  switch(a3)
  {
    case 0uLL:
      return a4 % 10;
    case 1uLL:
      int v6 = 103 * (char)(a4 - 100 * (((unint64_t)(1374389535 * a4) >> 37) + (1374389535 * a4 < 0)));
      return ((v6 >> 15) & 1) + (v6 >> 10);
    case 2uLL:
      int v4 = 5243
         * (__int16)(a4
                   - 1000
                   * (((unint64_t)(274877907 * a4) >> 38) + ((unint64_t)(274877907 * a4) >> 63)));
      return (v4 >> 19) + (v4 >> 31);
    default:
      return 0;
  }
}

- (void).cxx_destruct
{
}

+ (void)decodeAssociationScoreForContext:(os_log_t)log forEncodedScore:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Invalid argument: _ATXAssociationScoreContextGeoHash. To fectch geo association scores for this context, use fetchGeoAssociationScoreForBundleId.", v1, 2u);
}

@end