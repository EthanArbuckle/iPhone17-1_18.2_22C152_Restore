@interface GKPlayerActivityItemInternal
+ (id)constantToTypeMap;
+ (id)secureCodedPropertyKeys;
+ (id)typeToConstantMap;
+ (id)typeToConstantMapMetrics;
- (GKPlayerActivityItemInternal)initWithDictionary:(id)a3;
- (GKPlayerActivityRelationships)relationships;
- (NSDate)timeStamp;
- (NSString)instrumentationKey;
- (NSString)message;
- (NSString)scrollId;
- (NSString)summaryMessage;
- (NSString)uuid;
- (id)description;
- (int64_t)activityType;
- (int64_t)layoutType;
- (void)setActivityType:(int64_t)a3;
- (void)setInstrumentationKey:(id)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setMessage:(id)a3;
- (void)setRelationships:(id)a3;
- (void)setScrollId:(id)a3;
- (void)setSummaryMessage:(id)a3;
- (void)setTimeStamp:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation GKPlayerActivityItemInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_9 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_9, &__block_literal_global_39);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_9;

  return v2;
}

void __55__GKPlayerActivityItemInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"uuid";
  v3[0] = objc_opt_class();
  v2[1] = @"scrollId";
  v3[1] = objc_opt_class();
  v2[2] = @"activityType";
  v3[2] = objc_opt_class();
  v2[3] = @"layoutType";
  v3[3] = objc_opt_class();
  v2[4] = @"timeStamp";
  v3[4] = objc_opt_class();
  v2[5] = @"message";
  v3[5] = objc_opt_class();
  v2[6] = @"summaryMessage";
  v3[6] = objc_opt_class();
  v2[7] = @"relationships";
  v3[7] = objc_opt_class();
  v2[8] = @"instrumentationKey";
  v3[8] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_9;
  secureCodedPropertyKeys_sSecureCodedKeys_9 = v0;
}

- (GKPlayerActivityItemInternal)initWithDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)GKPlayerActivityItemInternal;
  v5 = [(GKPlayerActivityItemInternal *)&v31 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v6 UUIDString];
    [(GKPlayerActivityItemInternal *)v5 setUuid:v7];

    v8 = (void *)MEMORY[0x1E4F1C9C8];
    v9 = [v4 objectForKeyedSubscript:@"timestamp"];
    v10 = [v8 _gkDateFromServerTimestamp:v9];
    [(GKPlayerActivityItemInternal *)v5 setTimeStamp:v10];

    v11 = [v4 objectForKeyedSubscript:@"message"];
    [(GKPlayerActivityItemInternal *)v5 setMessage:v11];

    v12 = [v4 objectForKeyedSubscript:@"summary"];
    [(GKPlayerActivityItemInternal *)v5 setSummaryMessage:v12];

    v13 = [v4 objectForKeyedSubscript:@"id"];
    [(GKPlayerActivityItemInternal *)v5 setScrollId:v13];

    v14 = [(GKPlayerActivityItemInternal *)v5 scrollId];
    uint64_t v15 = [v14 length];

    if (!v15)
    {
      v16 = [(GKPlayerActivityItemInternal *)v5 uuid];
      [(GKPlayerActivityItemInternal *)v5 setScrollId:v16];
    }
    v17 = +[GKPlayerActivityItemInternal constantToTypeMap];
    v18 = [v4 objectForKeyedSubscript:@"type"];
    v19 = [v17 objectForKeyedSubscript:v18];

    if (v19) {
      uint64_t v20 = [v19 integerValue];
    }
    else {
      uint64_t v20 = 0;
    }
    [(GKPlayerActivityItemInternal *)v5 setActivityType:v20];
    v21 = [GKPlayerActivityRelationships alloc];
    v22 = [v4 objectForKeyedSubscript:@"relationships"];
    v23 = [(GKPlayerActivityRelationships *)v21 initWithDictionary:v22];
    [(GKPlayerActivityItemInternal *)v5 setRelationships:v23];

    v24 = [v4 objectForKeyedSubscript:@"style"];
    v25 = [v24 objectForKeyedSubscript:@"layout"];
    if ([v25 isEqualToString:@"MILESTONE"]) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 1;
    }
    [(GKPlayerActivityItemInternal *)v5 setLayoutType:v26];

    uint64_t v27 = [v4 objectForKeyedSubscript:@"instKey"];
    v28 = (void *)v27;
    if (v27) {
      v29 = (__CFString *)v27;
    }
    else {
      v29 = &stru_1F1E47DF8;
    }
    [(GKPlayerActivityItemInternal *)v5 setInstrumentationKey:v29];
  }
  return v5;
}

+ (id)typeToConstantMap
{
  if (typeToConstantMap_onceToken != -1) {
    dispatch_once(&typeToConstantMap_onceToken, &__block_literal_global_105);
  }
  v2 = (void *)typeToConstantMap_typeToConstMap;

  return v2;
}

void __49__GKPlayerActivityItemInternal_typeToConstantMap__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1E7EBD0;
  v2[1] = &unk_1F1E7EBE8;
  v3[0] = @"GAME_WITH_PLAYERS";
  v3[1] = @"PLAYER_WITH_GAME";
  v2[2] = &unk_1F1E7EC00;
  v2[3] = &unk_1F1E7EC18;
  v3[2] = @"FRIEND";
  v3[3] = @"ACHIEVEMENT";
  v2[4] = &unk_1F1E7EC30;
  v2[5] = &unk_1F1E7EC48;
  v3[4] = @"SCORE";
  v3[5] = @"SCORES";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)typeToConstantMap_typeToConstMap;
  typeToConstantMap_typeToConstMap = v0;
}

+ (id)typeToConstantMapMetrics
{
  if (typeToConstantMapMetrics_onceToken != -1) {
    dispatch_once(&typeToConstantMapMetrics_onceToken, &__block_literal_global_118);
  }
  v2 = (void *)typeToConstantMapMetrics_typeToConstMap;

  return v2;
}

void __56__GKPlayerActivityItemInternal_typeToConstantMapMetrics__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1E7EBD0;
  v2[1] = &unk_1F1E7EBE8;
  v3[0] = @"multiFriendStartedPlaying";
  v3[1] = @"friendStartedPlaying";
  v2[2] = &unk_1F1E7EC00;
  v2[3] = &unk_1F1E7EC18;
  v3[2] = @"newFriend";
  v3[3] = @"achievement";
  v2[4] = &unk_1F1E7EC30;
  v2[5] = &unk_1F1E7EC48;
  v3[4] = @"leaderboard";
  v3[5] = @"leaderboard";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)typeToConstantMapMetrics_typeToConstMap;
  typeToConstantMapMetrics_typeToConstMap = v0;
}

+ (id)constantToTypeMap
{
  if (constantToTypeMap_onceToken != -1) {
    dispatch_once(&constantToTypeMap_onceToken, &__block_literal_global_120);
  }
  v2 = (void *)constantToTypeMap_constToTypeMap;

  return v2;
}

void __49__GKPlayerActivityItemInternal_constantToTypeMap__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"GAME_WITH_PLAYERS";
  v2[1] = @"PLAYER_WITH_GAME";
  v3[0] = &unk_1F1E7EBD0;
  v3[1] = &unk_1F1E7EBE8;
  v2[2] = @"FRIEND";
  v2[3] = @"ACHIEVEMENT";
  v3[2] = &unk_1F1E7EC00;
  v3[3] = &unk_1F1E7EC18;
  v2[4] = @"SCORE";
  v2[5] = @"SCORES";
  v3[4] = &unk_1F1E7EC30;
  v3[5] = &unk_1F1E7EC48;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)constantToTypeMap_constToTypeMap;
  constantToTypeMap_constToTypeMap = v0;
}

- (id)description
{
  v16 = self;
  uint64_t v15 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = [(GKPlayerActivityItemInternal *)self uuid];
  v5 = [(GKPlayerActivityItemInternal *)self scrollId];
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKPlayerActivityItemInternal activityType](self, "activityType"));
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKPlayerActivityItemInternal layoutType](self, "layoutType"));
  v8 = [(GKPlayerActivityItemInternal *)self message];
  v9 = [(GKPlayerActivityItemInternal *)self summaryMessage];
  v10 = [(GKPlayerActivityItemInternal *)self timeStamp];
  v11 = [(GKPlayerActivityItemInternal *)self relationships];
  v12 = [(GKPlayerActivityItemInternal *)self instrumentationKey];
  v13 = [v15 stringWithFormat:@"<%@ %p>: {\n            \tuuid: %@ \n            \tscrollId: %@ \n            \tactivityType: %@ \n            \tlayoutType: %@ \n            \tmessage: %@ \n            \tsummaryMessage: %@ \n            \ttimestamp: %@ \n            \trelations: %@ \n            \tinstrumentationKey: %@ \n            }", v3, &v16, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)scrollId
{
  return self->_scrollId;
}

- (void)setScrollId:(id)a3
{
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)summaryMessage
{
  return self->_summaryMessage;
}

- (void)setSummaryMessage:(id)a3
{
}

- (GKPlayerActivityRelationships)relationships
{
  return self->_relationships;
}

- (void)setRelationships:(id)a3
{
}

- (NSString)instrumentationKey
{
  return self->_instrumentationKey;
}

- (void)setInstrumentationKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationKey, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_summaryMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_scrollId, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end