@interface ATXWidgetModeEntity
+ (BOOL)supportsSecureCoding;
- (ATXModeEntityScore)scoreMetadata;
- (ATXWidgetModeEntity)initWithCoder:(id)a3;
- (ATXWidgetModeEntity)initWithWidget:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CHSWidget)widget;
- (NSString)debugDescription;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)jsonDict;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setScoreMetadata:(id)a3;
- (void)setWidget:(id)a3;
@end

@implementation ATXWidgetModeEntity

- (ATXWidgetModeEntity)initWithWidget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetModeEntity;
  v5 = [(ATXWidgetModeEntity *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    widget = v5->_widget;
    v5->_widget = (CHSWidget *)v6;
  }
  return v5;
}

- (id)identifier
{
  id v3 = [NSString alloc];
  id v4 = [(CHSWidget *)self->_widget extensionIdentity];
  v5 = [v4 extensionBundleIdentifier];
  uint64_t v6 = [(CHSWidget *)self->_widget extensionIdentity];
  v7 = [v6 containerBundleIdentifier];
  v8 = [(CHSWidget *)self->_widget kind];
  [(CHSWidget *)self->_widget family];
  objc_super v9 = NSStringFromWidgetFamily();
  v10 = (void *)[v3 initWithFormat:@"%@:%@:%@:%@", v5, v7, v8, v9];

  return v10;
}

- (id)jsonDict
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"entityIdentifier";
  id v3 = [(ATXWidgetModeEntity *)self identifier];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"scoreMetadata";
  v11[0] = v4;
  v5 = [(ATXWidgetModeEntity *)self scoreMetadata];
  uint64_t v6 = [v5 jsonDict];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (!v3) {

  }
  return v8;
}

- (NSString)debugDescription
{
  v2 = [(ATXWidgetModeEntity *)self jsonDict];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(ATXWidgetModeEntity *)self identifier];
  v5 = [(ATXWidgetModeEntity *)self scoreMetadata];
  [v5 score];
  v7 = (void *)[v3 initWithFormat:@"entityIdentifier: %@, score: %.3f", v4, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXWidgetModeEntity *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(ATXWidgetModeEntity *)self identifier];
      v7 = [(ATXWidgetModeEntity *)v5 identifier];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ATXWidgetModeEntity *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXWidgetModeEntity *)self widget];
  [v4 encodeObject:v5 forKey:@"codingKeyForWidget"];

  id v6 = [(ATXWidgetModeEntity *)self scoreMetadata];
  [v4 encodeObject:v6 forKey:@"codingKeyForScoreMetadata"];
}

- (ATXWidgetModeEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_modes();
  char v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForWidget" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.widgetModeEntity" errorCode:-1 logHandle:v7];

  objc_super v9 = [v4 error];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_modes();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForScoreMetadata" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.widgetModeEntity" errorCode:-1 logHandle:v13];

    v15 = [v4 error];

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      self = [(ATXWidgetModeEntity *)self initWithWidget:v8];
      [(ATXWidgetModeEntity *)self setScoreMetadata:v14];
      v10 = self;
    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXWidgetModeEntity allocWithZone:a3];
  v5 = [(ATXWidgetModeEntity *)self widget];
  uint64_t v6 = [(ATXWidgetModeEntity *)v4 initWithWidget:v5];

  return v6;
}

- (ATXModeEntityScore)scoreMetadata
{
  return self->_scoreMetadata;
}

- (void)setScoreMetadata:(id)a3
{
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (void)setWidget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widget, 0);

  objc_storeStrong((id *)&self->_scoreMetadata, 0);
}

@end