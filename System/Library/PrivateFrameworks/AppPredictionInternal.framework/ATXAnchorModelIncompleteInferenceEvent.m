@interface ATXAnchorModelIncompleteInferenceEvent
+ (BOOL)supportsSecureCoding;
- (ATXAnchor)anchor;
- (ATXAnchorModelIncompleteInferenceEvent)initWithAnchor:(id)a3 anchorEvent:(id)a4;
- (ATXAnchorModelIncompleteInferenceEvent)initWithAnchorClassString:(id)a3 anchorEvent:(id)a4 dateFirstAdded:(id)a5 retryCount:(id)a6;
- (ATXAnchorModelIncompleteInferenceEvent)initWithCoder:(id)a3;
- (ATXDuetEvent)anchorEvent;
- (NSDate)dateFirstAdded;
- (NSNumber)retryCount;
- (id)description;
- (void)anchor;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(id)a3;
@end

@implementation ATXAnchorModelIncompleteInferenceEvent

- (ATXAnchorModelIncompleteInferenceEvent)initWithAnchor:(id)a3 anchorEvent:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = objc_opt_new();
  v9 = [(ATXAnchorModelIncompleteInferenceEvent *)self initWithAnchorClassString:v7 anchorEvent:v5 dateFirstAdded:v8 retryCount:&unk_1F27F1E60];

  return v9;
}

- (ATXAnchorModelIncompleteInferenceEvent)initWithAnchorClassString:(id)a3 anchorEvent:(id)a4 dateFirstAdded:(id)a5 retryCount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXAnchorModelIncompleteInferenceEvent;
  v14 = [(ATXAnchorModelIncompleteInferenceEvent *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    anchorClassString = v14->_anchorClassString;
    v14->_anchorClassString = (NSString *)v15;

    objc_storeStrong((id *)&v14->_anchorEvent, a4);
    objc_storeStrong((id *)&v14->_dateFirstAdded, a5);
    objc_storeStrong((id *)&v14->_retryCount, a6);
  }

  return v14;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Anchor class: %@, anchorEvent: %@, dateAdded: %@, retryCount: %@", self->_anchorClassString, self->_anchorEvent, self->_dateFirstAdded, self->_retryCount];
  return v2;
}

- (ATXAnchor)anchor
{
  p_anchorClassString = (uint64_t *)&self->_anchorClassString;
  if (NSClassFromString(self->_anchorClassString))
  {
    v4 = objc_opt_new();
    id v5 = [(ATXDuetEvent *)self->_anchorEvent identifier];
    [v4 setAnchorEventIdentifier:v5];
  }
  else
  {
    v6 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(ATXAnchorModelIncompleteInferenceEvent *)p_anchorClassString anchor];
    }

    v4 = 0;
  }
  return (ATXAnchor *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(ATXAnchorModelIncompleteInferenceEvent *)self dateFirstAdded];
  [v6 encodeObject:v4 forKey:@"codingKeyForDateFirstAdded"];

  [v6 encodeObject:self->_anchorClassString forKey:@"codingKeyForAnchorClassString"];
  id v5 = [(ATXAnchorModelIncompleteInferenceEvent *)self anchorEvent];
  [v6 encodeObject:v5 forKey:@"codingKeyForAnchorEvent"];

  [v6 encodeObject:self->_retryCount forKey:@"codingKeyForRetryCount"];
}

- (ATXAnchorModelIncompleteInferenceEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_anchor();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForDateFirstAdded" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelInferenceEvent" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_anchor();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForAnchorClassString" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelInferenceEvent" errorCode:-1 logHandle:v13];

    if (v14 && ([v4 error], uint64_t v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      objc_super v18 = __atxlog_handle_anchor();
      v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"codingKeyForAnchorEvent" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelInferenceEvent" errorCode:-1 logHandle:v18];

      if (v19
        && ([v4 error], v20 = objc_claimAutoreleasedReturnValue(), v20, !v20))
      {
        v21 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v22 = objc_opt_class();
        v23 = __atxlog_handle_anchor();
        v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"codingKeyForRetryCount" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelInferenceEvent" errorCode:-1 logHandle:v23];

        if (v24
          && ([v4 error], v25 = objc_claimAutoreleasedReturnValue(), v25, !v25))
        {
          self = [(ATXAnchorModelIncompleteInferenceEvent *)self initWithAnchorClassString:v14 anchorEvent:v19 dateFirstAdded:v8 retryCount:v24];
          id v10 = self;
        }
        else
        {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (ATXDuetEvent)anchorEvent
{
  return self->_anchorEvent;
}

- (NSDate)dateFirstAdded
{
  return self->_dateFirstAdded;
}

- (NSNumber)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_dateFirstAdded, 0);
  objc_storeStrong((id *)&self->_anchorEvent, 0);
  objc_storeStrong((id *)&self->_anchorClassString, 0);
}

- (void)anchor
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Failed to retrieve appropriate Class for anchor. Anchor Class: %@", (uint8_t *)&v3, 0xCu);
}

@end