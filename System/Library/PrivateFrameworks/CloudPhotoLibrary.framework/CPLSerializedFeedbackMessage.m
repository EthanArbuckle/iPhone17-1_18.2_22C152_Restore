@interface CPLSerializedFeedbackMessage
+ (id)messagesForPlistRepresentation:(id)a3;
+ (id)plistRepresentationForMessages:(id)a3;
- (CPLSerializedFeedbackMessage)initWithDictionaryRepresentation:(id)a3;
- (CPLSerializedFeedbackMessage)initWithMessage:(id)a3;
- (CPLServerFeedbackMessage)serverMessage;
- (NSDictionary)dictionaryRepresentation;
- (NSString)feedbackType;
- (NSUUID)uuid;
- (id)description;
@end

@implementation CPLSerializedFeedbackMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackType, 0);
  objc_storeStrong((id *)&self->_serverMessage, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (CPLServerFeedbackMessage)serverMessage
{
  return self->_serverMessage;
}

- (NSString)feedbackType
{
  return self->_feedbackType;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@ [", objc_opt_class()];
  unint64_t v4 = [(CPLServerFeedbackMessage *)self->_serverMessage keysAndValuesCount];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = 0;
    v7 = @"%@='%@'";
    do
    {
      v8 = [(CPLServerFeedbackMessage *)self->_serverMessage keysAndValuesAtIndex:v6];
      v9 = [v8 key];
      v10 = [v8 value];
      objc_msgSend(v3, "appendFormat:", v7, v9, v10);

      ++v6;
      v7 = @", %@='%@'";
    }
    while (v5 != v6);
  }
  [v3 appendString:@"]"];
  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"uuid";
  v3 = [(NSUUID *)self->_uuid UUIDString];
  v7[1] = @"msg";
  v8[0] = v3;
  unint64_t v4 = [(CPLServerFeedbackMessage *)self->_serverMessage data];
  v8[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (CPLSerializedFeedbackMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [v4 objectForKeyedSubscript:@"uuid"];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"msg"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
      if (v7)
      {
        v8 = [[CPLServerFeedbackMessage alloc] initWithData:v6];
        v9 = v8;
        if (v8 && [(CPLServerFeedbackMessage *)v8 keysAndValuesCount])
        {
          v10 = [(CPLServerFeedbackMessage *)v9 keysAndValuesAtIndex:0];
          if ([v10 hasKey]
            && [v10 hasValue]
            && ([v10 key],
                v11 = objc_claimAutoreleasedReturnValue(),
                int v12 = [v11 isEqualToString:@"type"],
                v11,
                v12))
          {
            v19.receiver = self;
            v19.super_class = (Class)CPLSerializedFeedbackMessage;
            v13 = [(CPLSerializedFeedbackMessage *)&v19 init];
            v14 = v13;
            if (v13)
            {
              objc_storeStrong((id *)&v13->_uuid, v7);
              uint64_t v15 = [v10 value];
              feedbackType = v14->_feedbackType;
              v14->_feedbackType = (NSString *)v15;

              objc_storeStrong((id *)&v14->_serverMessage, v9);
            }
            self = v14;
            v17 = self;
          }
          else
          {
            v17 = 0;
          }
        }
        else
        {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CPLSerializedFeedbackMessage)initWithMessage:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPLSerializedFeedbackMessage;
  unint64_t v5 = [(CPLSerializedFeedbackMessage *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v8 = [v4 feedbackType];
    uint64_t v9 = [v8 copy];
    feedbackType = v5->_feedbackType;
    v5->_feedbackType = (NSString *)v9;

    uint64_t v11 = [v4 serverMessage];
    serverMessage = v5->_serverMessage;
    v5->_serverMessage = (CPLServerFeedbackMessage *)v11;
  }
  return v5;
}

+ (id)messagesForPlistRepresentation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [CPLSerializedFeedbackMessage alloc];
          int v12 = -[CPLSerializedFeedbackMessage initWithDictionaryRepresentation:](v11, "initWithDictionaryRepresentation:", v10, (void)v14);
          if (v12) {
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C978] array];
  }

  return v4;
}

+ (id)plistRepresentationForMessages:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end