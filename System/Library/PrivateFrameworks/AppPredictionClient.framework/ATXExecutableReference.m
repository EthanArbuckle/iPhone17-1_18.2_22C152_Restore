@interface ATXExecutableReference
+ (BOOL)supportsSecureCoding;
- (ATXExecutableReference)initWithClientModelId:(id)a3 date:(id)a4 shouldClearOnEngagement:(BOOL)a5;
- (ATXExecutableReference)initWithClientModelId:(id)a3 date:(id)a4 shouldClearOnEngagement:(BOOL)a5 shouldPurge:(BOOL)a6 suggestionIsHidden:(BOOL)a7;
- (ATXExecutableReference)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldClearOnEngagement;
- (BOOL)shouldPurge;
- (BOOL)suggestionIsHidden;
- (NSDate)date;
- (NSString)clientModelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonDict;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldPurge:(BOOL)a3;
- (void)setSuggestionIsHidden:(BOOL)a3;
- (void)updateDateTo:(id)a3;
@end

@implementation ATXExecutableReference

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXExecutableReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientModelId"];
  uint64_t v7 = [v4 decodeBoolForKey:@"shouldClearOnEngagement"];
  uint64_t v8 = [v4 decodeBoolForKey:@"shouldPurge"];
  uint64_t v9 = [v4 decodeBoolForKey:@"suggestionIsHidden"];

  v10 = [(ATXExecutableReference *)self initWithClientModelId:v6 date:v5 shouldClearOnEngagement:v7 shouldPurge:v8 suggestionIsHidden:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_clientModelId forKey:@"clientModelId"];
  [v5 encodeBool:self->_shouldClearOnEngagement forKey:@"shouldClearOnEngagement"];
  [v5 encodeBool:self->_shouldPurge forKey:@"shouldPurge"];
  [v5 encodeBool:self->_suggestionIsHidden forKey:@"suggestionIsHidden"];
}

- (ATXExecutableReference)initWithClientModelId:(id)a3 date:(id)a4 shouldClearOnEngagement:(BOOL)a5
{
  return [(ATXExecutableReference *)self initWithClientModelId:a3 date:a4 shouldClearOnEngagement:a5 shouldPurge:0 suggestionIsHidden:0];
}

- (ATXExecutableReference)initWithClientModelId:(id)a3 date:(id)a4 shouldClearOnEngagement:(BOOL)a5 shouldPurge:(BOOL)a6 suggestionIsHidden:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ATXExecutableReference;
  v14 = [(ATXExecutableReference *)&v19 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    clientModelId = v14->_clientModelId;
    v14->_clientModelId = (NSString *)v15;

    objc_storeStrong((id *)&v14->_date, a4);
    v14->_shouldClearOnEngagement = a5;
    v14->_shouldPurge = a6;
    v14->_suggestionIsHidden = a7;
    v17 = v14;
  }

  return v14;
}

- (id)jsonDict
{
  v12[5] = *MEMORY[0x1E4F143B8];
  clientModelId = self->_clientModelId;
  date = self->_date;
  v12[0] = clientModelId;
  v11[0] = @"clientModelId";
  v11[1] = @"date";
  id v5 = [(NSDate *)date description];
  v12[1] = v5;
  v11[2] = @"shouldClearOnEngagement";
  v6 = [NSNumber numberWithBool:self->_shouldClearOnEngagement];
  v12[2] = v6;
  v11[3] = @"shouldPurge";
  uint64_t v7 = [NSNumber numberWithBool:self->_shouldPurge];
  v12[3] = v7;
  v11[4] = @"suggestionIsHidden";
  uint64_t v8 = [NSNumber numberWithBool:self->_suggestionIsHidden];
  v12[4] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXExecutableReference *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = self->_clientModelId;
      v6 = v5;
      if (v5 == v4->_clientModelId) {
        char v7 = 1;
      }
      else {
        char v7 = -[NSString isEqual:](v5, "isEqual:");
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_clientModelId hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ATXExecutableReference alloc];
  clientModelId = self->_clientModelId;
  date = self->_date;
  BOOL shouldClearOnEngagement = self->_shouldClearOnEngagement;
  BOOL shouldPurge = self->_shouldPurge;
  BOOL suggestionIsHidden = self->_suggestionIsHidden;

  return [(ATXExecutableReference *)v4 initWithClientModelId:clientModelId date:date shouldClearOnEngagement:shouldClearOnEngagement shouldPurge:shouldPurge suggestionIsHidden:suggestionIsHidden];
}

- (void)updateDateTo:(id)a3
{
  id v5 = a3;
  date = self->_date;
  p_date = (id *)&self->_date;
  id v10 = v5;
  id v8 = [v5 earlierDate:date];
  id v9 = *p_date;

  if (v8 == v9) {
    objc_storeStrong(p_date, a3);
  }
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)shouldClearOnEngagement
{
  return self->_shouldClearOnEngagement;
}

- (BOOL)shouldPurge
{
  return self->_shouldPurge;
}

- (void)setShouldPurge:(BOOL)a3
{
  self->_BOOL shouldPurge = a3;
}

- (BOOL)suggestionIsHidden
{
  return self->_suggestionIsHidden;
}

- (void)setSuggestionIsHidden:(BOOL)a3
{
  self->_BOOL suggestionIsHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_clientModelId, 0);
}

@end