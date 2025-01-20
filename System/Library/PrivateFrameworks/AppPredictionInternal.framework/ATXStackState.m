@interface ATXStackState
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenEvent)lastStackRotationEvent;
- (ATXHomeScreenEvent)lastStackShownEvent;
- (ATXHomeScreenEvent)lastUserScrollStackRotationEvent;
- (ATXHomeScreenEvent)stackCreationEvent;
- (ATXStackState)initWithCoder:(id)a3;
- (ATXSuggestionLayout)layoutForLastStalenessRotation;
- (NSDate)dateOfLastStalenessRotation;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDateOfLastStalenessRotation:(id)a3;
- (void)setLastStackRotationEvent:(id)a3;
- (void)setLastStackShownEvent:(id)a3;
- (void)setLastUserScrollStackRotationEvent:(id)a3;
- (void)setLayoutForLastStalenessRotation:(id)a3;
- (void)setStackCreationEvent:(id)a3;
@end

@implementation ATXStackState

- (id)description
{
  id v16 = [NSString alloc];
  v15 = [(ATXHomeScreenEvent *)self->_stackCreationEvent date];
  v13 = [(ATXHomeScreenEvent *)self->_lastStackRotationEvent date];
  v3 = [(ATXHomeScreenEvent *)self->_lastStackRotationEvent eventTypeString];
  v14 = [(ATXHomeScreenEvent *)self->_lastStackRotationEvent widgetBundleId];
  v11 = [(ATXHomeScreenEvent *)self->_lastStackRotationEvent reason];
  v12 = [(ATXHomeScreenEvent *)self->_lastStackShownEvent date];
  v4 = [(ATXHomeScreenEvent *)self->_lastStackShownEvent widgetBundleId];
  v5 = [(ATXHomeScreenEvent *)self->_lastUserScrollStackRotationEvent date];
  v6 = [(ATXHomeScreenEvent *)self->_lastUserScrollStackRotationEvent eventTypeString];
  v7 = [(ATXHomeScreenEvent *)self->_lastUserScrollStackRotationEvent widgetBundleId];
  v8 = [(ATXHomeScreenEvent *)self->_lastUserScrollStackRotationEvent reason];
  v9 = [(ATXSuggestionLayout *)self->_layoutForLastStalenessRotation jsonRawData];
  v17 = (void *)[v16 initWithFormat:@"Stack created %@\nLast stack rotation: %@: %@ - %@ - %@\nLast stack shown: %@: %@\nLast user scroll stack rotation: %@: %@ - %@ - %@\nLast staleness rotation layout for stack: %@\nDate of last staleness rotation: %@\n", v15, v13, v3, v14, v11, v12, v4, v5, v6, v7, v8, v9, self->_dateOfLastStalenessRotation];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  stackCreationEvent = self->_stackCreationEvent;
  id v5 = a3;
  [v5 encodeObject:stackCreationEvent forKey:@"codingKeyForStackCreationEvent"];
  [v5 encodeObject:self->_lastStackRotationEvent forKey:@"codingKeyForLastStackRotationEvent"];
  [v5 encodeObject:self->_lastStackShownEvent forKey:@"codingKeyForLastStackShownEvent"];
  [v5 encodeObject:self->_lastUserScrollStackRotationEvent forKey:@"codingKeyForLastUserScrollStackRotationEvent"];
  [v5 encodeObject:self->_layoutForLastStalenessRotation forKey:@"codingKeyForLayoutForLastStalenessRotation"];
  [v5 encodeObject:self->_dateOfLastStalenessRotation forKey:@"codingKeyFordateOfLastStalenessRotation"];
}

- (ATXStackState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_blending();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForStackCreationEvent" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v7];

  v9 = [v4 error];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_blending();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForLastStackRotationEvent" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v13];

    v15 = [v4 error];

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      v18 = __atxlog_handle_blending();
      v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"codingKeyForLastStackShownEvent" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v18];

      v20 = [v4 error];

      if (v20)
      {
        v10 = 0;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v22 = objc_opt_class();
        v23 = __atxlog_handle_blending();
        v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"codingKeyForLastUserScrollStackRotationEvent" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v23];

        v25 = [v4 error];

        if (v25)
        {
          v10 = 0;
        }
        else
        {
          v26 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v27 = objc_opt_class();
          v28 = __atxlog_handle_blending();
          v29 = [v26 robustDecodeObjectOfClass:v27 forKey:@"codingKeyForLayoutForLastStalenessRotation" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v28];

          v30 = [v4 error];

          if (v30)
          {
            v10 = 0;
          }
          else
          {
            v31 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v32 = objc_opt_class();
            v33 = __atxlog_handle_blending();
            v34 = [v31 robustDecodeObjectOfClass:v32 forKey:@"codingKeyFordateOfLastStalenessRotation" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v33];

            v35 = [v4 error];

            if (v35)
            {
              v10 = 0;
            }
            else
            {
              v39.receiver = self;
              v39.super_class = (Class)ATXStackState;
              v36 = [(ATXStackState *)&v39 init];
              p_isa = (id *)&v36->super.isa;
              if (v36)
              {
                objc_storeStrong((id *)&v36->_stackCreationEvent, v8);
                objc_storeStrong(p_isa + 2, v14);
                objc_storeStrong(p_isa + 3, v19);
                objc_storeStrong(p_isa + 4, v24);
                objc_storeStrong(p_isa + 5, v29);
                objc_storeStrong(p_isa + 6, v34);
              }
              self = p_isa;
              v10 = self;
            }
          }
        }
      }
    }
  }
  return v10;
}

- (ATXHomeScreenEvent)stackCreationEvent
{
  return self->_stackCreationEvent;
}

- (void)setStackCreationEvent:(id)a3
{
}

- (ATXHomeScreenEvent)lastStackRotationEvent
{
  return self->_lastStackRotationEvent;
}

- (void)setLastStackRotationEvent:(id)a3
{
}

- (ATXHomeScreenEvent)lastStackShownEvent
{
  return self->_lastStackShownEvent;
}

- (void)setLastStackShownEvent:(id)a3
{
}

- (ATXHomeScreenEvent)lastUserScrollStackRotationEvent
{
  return self->_lastUserScrollStackRotationEvent;
}

- (void)setLastUserScrollStackRotationEvent:(id)a3
{
}

- (ATXSuggestionLayout)layoutForLastStalenessRotation
{
  return self->_layoutForLastStalenessRotation;
}

- (void)setLayoutForLastStalenessRotation:(id)a3
{
}

- (NSDate)dateOfLastStalenessRotation
{
  return self->_dateOfLastStalenessRotation;
}

- (void)setDateOfLastStalenessRotation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastStalenessRotation, 0);
  objc_storeStrong((id *)&self->_layoutForLastStalenessRotation, 0);
  objc_storeStrong((id *)&self->_lastUserScrollStackRotationEvent, 0);
  objc_storeStrong((id *)&self->_lastStackShownEvent, 0);
  objc_storeStrong((id *)&self->_lastStackRotationEvent, 0);
  objc_storeStrong((id *)&self->_stackCreationEvent, 0);
}

@end