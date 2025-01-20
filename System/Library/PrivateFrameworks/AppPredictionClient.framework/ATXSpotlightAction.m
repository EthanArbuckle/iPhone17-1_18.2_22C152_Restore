@interface ATXSpotlightAction
+ (BOOL)supportsSecureCoding;
+ (id)_contactSuggestionResultWithId:(id)a3 title:(id)a4;
+ (id)_searchSuggestionResultWithString:(id)a3;
+ (id)actionIdentifierFromTopic:(id)a3;
+ (id)spotlightActionTypeFromTopic:(id)a3;
+ (unint64_t)instanceIdentifierFromTopic:(id)a3;
- (ATXActionCriteria)criteria;
- (ATXSpotlightAction)initWithCoder:(id)a3;
- (ATXSpotlightAction)initWithContactName:(id)a3 contactEmail:(id)a4 subtitle:(id)a5 criteria:(id)a6;
- (ATXSpotlightAction)initWithContactName:(id)a3 contactIdentifier:(id)a4 subtitle:(id)a5 criteria:(id)a6;
- (ATXSpotlightAction)initWithEntityName:(id)a3 qid:(id)a4 criteria:(id)a5;
- (ATXSpotlightAction)initWithFlightCode:(id)a3 date:(id)a4 criteria:(id)a5;
- (ATXSpotlightAction)initWithMediaName:(id)a3 identifier:(id)a4 criteria:(id)a5;
- (ATXSpotlightAction)initWithPOIName:(id)a3 muid:(id)a4 criteria:(id)a5;
- (ATXSpotlightAction)initWithSearchString:(id)a3;
- (ATXSpotlightAction)initWithSportsTeamName:(id)a3 qid:(id)a4 criteria:(id)a5;
- (ATXSpotlightAction)initWithTopic:(id)a3 criteria:(id)a4 actionDescription:(id)a5 actionIdentifier:(id)a6;
- (ATXSpotlightAction)initWithWeatherLatitude:(double)a3 longitude:(double)a4 criteria:(id)a5;
- (ATXSpotlightAction)initWithWeatherLocation:(id)a3 latitude:(double)a4 longitude:(double)a5 criteria:(id)a6;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)actionDescription;
- (NSString)actionIdentifier;
- (SFTopic)topic;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSpotlightAction

- (ATXSpotlightAction)initWithTopic:(id)a3 criteria:(id)a4 actionDescription:(id)a5 actionIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXSpotlightAction;
  v15 = [(ATXSpotlightAction *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_topic, a3);
    objc_storeStrong((id *)&v16->_criteria, a4);
    objc_storeStrong((id *)&v16->_actionDescription, a5);
    objc_storeStrong((id *)&v16->_actionIdentifier, a6);
  }

  return v16;
}

- (ATXActionCriteria)criteria
{
  criteria = self->_criteria;
  if (criteria) {
    v3 = criteria;
  }
  else {
    v3 = (ATXActionCriteria *)objc_opt_new();
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  topic = self->_topic;
  id v5 = a3;
  [v5 encodeObject:topic forKey:@"KEY_TOPIC"];
  [v5 encodeObject:self->_actionDescription forKey:@"KEY_ACTION_DESCRIPTION"];
  [v5 encodeObject:self->_actionIdentifier forKey:@"KEY_ACTION_IDENTIFIER"];
  [v5 encodeObject:self->_criteria forKey:@"KEY_ACTION_CRITERIA"];
}

- (ATXSpotlightAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_default();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"KEY_TOPIC" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSpotlightAction" errorCode:-1 logHandle:v7];

  v9 = [v4 error];

  v10 = 0;
  if (!v9 && v8)
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_default();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"KEY_ACTION_DESCRIPTION" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSpotlightAction" errorCode:-1 logHandle:v13];

    v15 = [v4 error];

    v10 = 0;
    if (!v15 && v14)
    {
      id v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      objc_super v18 = __atxlog_handle_default();
      v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"KEY_ACTION_IDENTIFIER" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXSpotlightAction" errorCode:-1 logHandle:v18];

      v20 = [v4 error];

      v10 = 0;
      if (!v20 && v19)
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v22 = objc_opt_class();
        v23 = __atxlog_handle_default();
        v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"KEY_ACTION_CRITERIA" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXSpotlightAction" errorCode:-1 logHandle:v23];

        v25 = [v4 error];

        if (v25)
        {
          v10 = 0;
        }
        else
        {
          self = [(ATXSpotlightAction *)self initWithTopic:v8 criteria:v24 actionDescription:v14 actionIdentifier:v19];
          v10 = self;
        }
      }
    }
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(SFTopic *)self->_topic identifier];
  uint64_t v4 = [v3 hash];

  return [(NSString *)self->_actionIdentifier hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXSpotlightAction *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    if ([(ATXSpotlightAction *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      uint64_t v6 = [(SFTopic *)self->_topic identifier];
      uint64_t v7 = [(SFTopic *)v5->_topic identifier];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        char v9 = [v6 isEqual:v7];

        if ((v9 & 1) == 0)
        {
          char v10 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      id v11 = self->_actionIdentifier;
      uint64_t v12 = v11;
      if (v11 == v5->_actionIdentifier) {
        char v10 = 1;
      }
      else {
        char v10 = -[NSString isEqual:](v11, "isEqual:");
      }

      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (ATXSpotlightAction)initWithSearchString:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4FA5D70] localTopicWithTitle:a3];
  id v5 = [(ATXSpotlightAction *)self initWithTopic:v4 criteria:0 actionDescription:@"Search-String" actionIdentifier:@"SP-Search-String"];

  return v5;
}

- (ATXSpotlightAction)initWithContactName:(id)a3 contactIdentifier:(id)a4 subtitle:(id)a5 criteria:(id)a6
{
  id v10 = a3;
  id v11 = (void *)MEMORY[0x1E4FA5D70];
  id v12 = a6;
  id v13 = [v11 localTopicWithContactName:v10 contactIdentifier:a4 detailText:a5];
  id v14 = v10;
  v15 = [(id)objc_opt_class() actionIdentifierFromTopic:v13];
  id v16 = [(ATXSpotlightAction *)self initWithTopic:v13 criteria:v12 actionDescription:v14 actionIdentifier:v15];

  return v16;
}

- (ATXSpotlightAction)initWithContactName:(id)a3 contactEmail:(id)a4 subtitle:(id)a5 criteria:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (objc_opt_respondsToSelector())
  {
    id v14 = (void *)MEMORY[0x1E4FA5D70];
    v22[0] = v11;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v16 = [v14 localTopicWithContactName:v10 emails:v15 phones:0 detailText:v12];

    id v17 = v10;
    objc_super v18 = [(id)objc_opt_class() actionIdentifierFromTopic:v16];
    v19 = [(ATXSpotlightAction *)self initWithTopic:v16 criteria:v13 actionDescription:v17 actionIdentifier:v18];

    self = v19;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (ATXSpotlightAction)initWithFlightCode:(id)a3 date:(id)a4 criteria:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x1E4F9A0D8];
  id v11 = a5;
  id v12 = [v10 alloc];
  id v13 = v12;
  if (v9)
  {
    id v14 = (void *)[v12 initWithQuery:v8 date:v9];
  }
  else
  {
    v15 = [MEMORY[0x1E4F1C9C8] now];
    id v14 = (void *)[v13 initWithQuery:v8 date:v15];
  }
  id v16 = v8;
  id v17 = [(id)objc_opt_class() actionIdentifierFromTopic:v14];
  objc_super v18 = [(ATXSpotlightAction *)self initWithTopic:v14 criteria:v11 actionDescription:v16 actionIdentifier:v17];

  return v18;
}

- (ATXSpotlightAction)initWithWeatherLocation:(id)a3 latitude:(double)a4 longitude:(double)a5 criteria:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a4 == 0.0 || a5 == 0.0)
  {
    objc_super v18 = __atxlog_handle_default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXSpotlightAction initWithWeatherLocation:latitude:longitude:criteria:](v18, a4, a5);
    }

    id v17 = 0;
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F9A188]);
    [v12 setLat:a4];
    [v12 setLng:a5];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F9A578]) initWithQuery:v10 location:v12];
    id v14 = v10;
    v15 = [(id)objc_opt_class() actionIdentifierFromTopic:v13];
    id v16 = [(ATXSpotlightAction *)self initWithTopic:v13 criteria:v11 actionDescription:v14 actionIdentifier:v15];

    self = v16;
    id v17 = self;
  }

  return v17;
}

- (ATXSpotlightAction)initWithWeatherLatitude:(double)a3 longitude:(double)a4 criteria:(id)a5
{
  return [(ATXSpotlightAction *)self initWithWeatherLocation:@"lat_long" latitude:a5 longitude:a3 criteria:a4];
}

- (ATXSpotlightAction)initWithMediaName:(id)a3 identifier:(id)a4 criteria:(id)a5
{
  id v8 = a3;
  id v9 = (objc_class *)MEMORY[0x1E4F9A300];
  id v10 = a5;
  id v11 = a4;
  id v12 = (void *)[[v9 alloc] initWithType:1 query:v8 identifier:v11];

  id v13 = v8;
  id v14 = [(id)objc_opt_class() actionIdentifierFromTopic:v12];
  v15 = [(ATXSpotlightAction *)self initWithTopic:v12 criteria:v10 actionDescription:v13 actionIdentifier:v14];

  return v15;
}

- (ATXSpotlightAction)initWithPOIName:(id)a3 muid:(id)a4 criteria:(id)a5
{
  id v8 = a3;
  id v9 = (objc_class *)MEMORY[0x1E4F9A300];
  id v10 = a5;
  id v11 = a4;
  id v12 = [v9 alloc];
  id v13 = [v11 stringValue];

  id v14 = (void *)[v12 initWithType:6 query:v8 identifier:v13];
  id v15 = v8;
  id v16 = [(id)objc_opt_class() actionIdentifierFromTopic:v14];
  id v17 = [(ATXSpotlightAction *)self initWithTopic:v14 criteria:v10 actionDescription:v15 actionIdentifier:v16];

  return v17;
}

- (ATXSpotlightAction)initWithSportsTeamName:(id)a3 qid:(id)a4 criteria:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F9A448];
  id v9 = a5;
  id v10 = a4;
  id v11 = (__CFString *)a3;
  id v12 = (void *)[[v8 alloc] initWithQuery:@"team-qid" requestedEntityType:@"Team" identifier:v10];

  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = @"team-qid";
  }
  id v14 = v13;
  id v15 = [(id)objc_opt_class() actionIdentifierFromTopic:v12];
  id v16 = [(ATXSpotlightAction *)self initWithTopic:v12 criteria:v9 actionDescription:v14 actionIdentifier:v15];

  return v16;
}

- (ATXSpotlightAction)initWithEntityName:(id)a3 qid:(id)a4 criteria:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F9A300];
  id v9 = a5;
  id v10 = a4;
  id v11 = (__CFString *)a3;
  id v12 = (void *)[[v8 alloc] initWithType:2 query:@"entity-qid" identifier:v10];

  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = @"entity-qid";
  }
  id v14 = [(ATXSpotlightAction *)self initWithTopic:v12 criteria:v9 actionDescription:v13 actionIdentifier:@"SP-Entity-QID"];

  return v14;
}

+ (id)actionIdentifierFromTopic:(id)a3
{
  id v4 = a3;
  id v5 = [a1 spotlightActionTypeFromTopic:v4];
  uint64_t v6 = [a1 instanceIdentifierFromTopic:v4];

  uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"%@:%lu", v5, v6];

  return v7;
}

+ (unint64_t)instanceIdentifierFromTopic:(id)a3
{
  v3 = [a3 identifier];
  unint64_t v4 = [v3 hash];

  return v4;
}

+ (id)spotlightActionTypeFromTopic:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = @"SP-Contact";
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      unint64_t v4 = @"SP-Media-AdamId";
      switch([v5 queryType])
      {
        case 0u:
        case 2u:
        case 7u:
        case 8u:
          uint64_t v6 = __atxlog_handle_default();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            +[ATXSpotlightAction spotlightActionTypeFromTopic:](v5);
          }
          goto LABEL_11;
        case 1u:
          goto LABEL_13;
        case 3u:
          unint64_t v4 = @"SP-Sports-Team-QID";
          goto LABEL_13;
        case 4u:
          unint64_t v4 = @"SP-Weather";
          goto LABEL_13;
        case 5u:
          unint64_t v4 = @"SP-Flight";
          goto LABEL_13;
        case 6u:
          unint64_t v4 = @"SP-POI-Muid";
          goto LABEL_13;
        default:
          uint64_t v6 = __atxlog_handle_default();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            +[ATXSpotlightAction spotlightActionTypeFromTopic:](v5);
          }
LABEL_11:

          goto LABEL_12;
      }
    }
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ATXSpotlightAction spotlightActionTypeFromTopic:]((uint64_t)v3, v5);
    }
LABEL_12:
    unint64_t v4 = 0;
LABEL_13:
  }
  return v4;
}

+ (id)_searchSuggestionResultWithString:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F9A3C0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = objc_opt_new();
  [v6 setText:v4];
  [v5 setTitle:v6];
  [v5 setCompletion:v4];
  [v5 setResultBundleId:@"com.apple.searchd.suggestion"];
  [v5 setSectionBundleIdentifier:@"com.apple.searchd.recent.suggestions"];
  [v5 setIdentifier:v4];
  uint64_t v7 = objc_opt_new();
  [v7 setSymbolName:@"magnifyingglass.circle.fill"];
  [v7 setIsTemplate:1];
  id v8 = objc_opt_new();
  id v9 = [v5 resultBundleId];
  [v8 setBundleIdentifier:v9];

  id v10 = objc_opt_new();
  id v11 = [MEMORY[0x1E4F9A378] textWithString:v4];
  [v10 setSuggestionText:v11];

  id v12 = [v10 suggestionText];
  [v12 setMaxLines:1];

  [v10 setSuggestionType:0];
  v19[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v10 setPunchoutOptions:v13];

  [v10 setThumbnail:v7];
  id v14 = objc_opt_new();
  [v14 setSearchString:v4];

  [v14 setQuerySource:1];
  [v10 setCommand:v14];
  id v15 = objc_opt_new();
  objc_super v18 = v10;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v15 setCardSections:v16];

  [v5 setInlineCard:v15];

  return v5;
}

+ (id)_contactSuggestionResultWithId:(id)a3 title:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F9A3C0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v9 = objc_opt_new();
  [v9 setText:v6];
  [v8 setTitle:v9];
  [v8 setCompletion:v6];
  [v8 setResultBundleId:@"com.apple.searchd.suggestion"];
  [v8 setSectionBundleIdentifier:@"com.apple.searchd.recent.suggestions"];
  [v8 setIdentifier:v7];
  id v10 = objc_opt_new();
  id v11 = [v8 resultBundleId];
  [v10 setBundleIdentifier:v11];

  id v12 = objc_opt_new();
  [v12 setSymbolName:@"person.crop.circle"];
  [v12 setIsTemplate:1];
  id v13 = objc_opt_new();
  [v13 setEntityType:2];
  [v13 setEntityIdentifier:v7];

  [v13 setTokenString:v6];
  [v13 setSymbolImage:v12];
  id v14 = objc_opt_new();
  [v14 setCommand:v13];
  id v15 = objc_opt_new();
  v18[0] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v15 setCardSections:v16];

  [v8 setInlineCard:v15];

  return v8;
}

- (SFTopic)topic
{
  return self->_topic;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDescription, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_topic, 0);

  objc_storeStrong((id *)&self->_criteria, 0);
}

- (void)initWithWeatherLocation:(double)a3 latitude:longitude:criteria:.cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXSpotlightAction Weather: received 0 lat or long. %f, %f", (uint8_t *)&v3, 0x16u);
}

+ (void)spotlightActionTypeFromTopic:(void *)a1 .cold.1(void *a1)
{
  [a1 queryType];
  OUTLINED_FUNCTION_0_12(&dword_1A790D000, v1, v2, "spotlightActionTypeFromTopic: new type %d", v3, v4, v5, v6, 0);
}

+ (void)spotlightActionTypeFromTopic:(void *)a1 .cold.2(void *a1)
{
  [a1 queryType];
  OUTLINED_FUNCTION_0_12(&dword_1A790D000, v1, v2, "spotlightActionTypeFromTopic: unsupported type %d", v3, v4, v5, v6, 0);
}

+ (void)spotlightActionTypeFromTopic:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "spotlightActionTypeFromTopic: not a local topic or query topic: %@", (uint8_t *)&v5, 0xCu);
}

@end