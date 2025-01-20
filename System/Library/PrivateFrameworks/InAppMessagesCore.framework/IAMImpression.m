@interface IAMImpression
- (IAMImpression)initWithMessageEntry:(id)a3 targetIdentifier:(id)a4;
- (ICInAppMessageEntry)messageEntry;
- (NSDate)displayEndTime;
- (NSDate)displayStartTime;
- (NSString)messageIdentifier;
- (NSString)targetIdentifier;
- (id)reportableMetricsEventDictionary;
- (int)messageType;
- (void)setDisplayEndTime:(id)a3;
- (void)setDisplayStartTime:(id)a3;
- (void)setMessageEntry:(id)a3;
- (void)setTargetIdentifier:(id)a3;
@end

@implementation IAMImpression

- (IAMImpression)initWithMessageEntry:(id)a3 targetIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IAMImpression;
  v9 = [(IAMImpression *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageEntry, a3);
    uint64_t v11 = [v8 copy];
    targetIdentifier = v10->_targetIdentifier;
    v10->_targetIdentifier = (NSString *)v11;
  }
  return v10;
}

- (NSString)messageIdentifier
{
  v2 = [(ICInAppMessageEntry *)self->_messageEntry applicationMessage];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (int)messageType
{
  v2 = [(ICInAppMessageEntry *)self->_messageEntry applicationMessage];
  int v3 = [v2 messageType];

  return v3;
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
}

- (ICInAppMessageEntry)messageEntry
{
  return self->_messageEntry;
}

- (void)setMessageEntry:(id)a3
{
}

- (NSDate)displayStartTime
{
  return self->_displayStartTime;
}

- (void)setDisplayStartTime:(id)a3
{
}

- (NSDate)displayEndTime
{
  return self->_displayEndTime;
}

- (void)setDisplayEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayEndTime, 0);
  objc_storeStrong((id *)&self->_displayStartTime, 0);
  objc_storeStrong((id *)&self->_messageEntry, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
}

- (id)reportableMetricsEventDictionary
{
  v43[1] = *MEMORY[0x263EF8340];
  int v3 = [(IAMImpression *)self messageEntry];
  v4 = [v3 applicationMessage];
  int v5 = [v4 hasImpressionEvent];

  if (v5)
  {
    v6 = [(IAMImpression *)self messageEntry];
    id v7 = [v6 applicationMessage];
    id v8 = [v7 impressionEvent];
    v9 = (void *)[v8 copy];

    if ([v9 hasImpression])
    {
      v10 = [v9 impression];
      uint64_t v11 = [v10 dictionaryRepresentation];
      v12 = (void *)[v11 mutableCopy];

      [v9 setImpression:0];
    }
    else
    {
      v12 = objc_opt_new();
    }
    objc_super v14 = [(IAMImpression *)self messageIdentifier];
    v15 = (void *)[v14 copy];
    [v12 setObject:v15 forKeyedSubscript:@"id"];

    v16 = [(IAMImpression *)self targetIdentifier];
    v17 = (void *)[v16 copy];
    [v12 setObject:v17 forKeyedSubscript:@"name"];

    v18 = [NSNumber numberWithInt:1];
    [v12 setObject:v18 forKeyedSubscript:@"impressionId"];

    v19 = [NSNumber numberWithInt:0];
    [v12 setObject:v19 forKeyedSubscript:@"impressionIndex"];

    v20 = [(IAMImpression *)self displayStartTime];

    if (v20)
    {
      v21 = [(IAMImpression *)self displayStartTime];
      [v21 timeIntervalSince1970];
      uint64_t v23 = (uint64_t)(v22 * 1000.0);

      v24 = [NSNumber numberWithLongLong:v23];
      v43[0] = v24;
      v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
      [v12 setObject:v25 forKeyedSubscript:@"impressionTimes"];

      v26 = [(IAMImpression *)self displayEndTime];

      if (v26)
      {
        v27 = [(IAMImpression *)self displayEndTime];
        [v27 timeIntervalSince1970];
        uint64_t v29 = (uint64_t)(v28 * 1000.0);

        v40[0] = @"s";
        v30 = [NSNumber numberWithLongLong:v23];
        v40[1] = @"d";
        v41[0] = v30;
        v31 = [NSNumber numberWithLongLong:v29 - v23];
        v41[1] = v31;
        v32 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
        v42 = v32;
        v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
        [v12 setObject:v33 forKeyedSubscript:@"viewedInfo"];
      }
    }
    v34 = [v9 reportableDictionary];
    v35 = (void *)[v34 mutableCopy];

    v36 = (void *)[v12 copy];
    v39 = v36;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    [v35 setObject:v37 forKeyedSubscript:@"impressions"];

    v13 = (void *)[v35 copy];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

@end