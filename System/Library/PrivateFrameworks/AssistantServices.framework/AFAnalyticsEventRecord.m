@interface AFAnalyticsEventRecord
+ (BOOL)supportsSecureCoding;
- (AFAnalyticsEvent)event;
- (AFAnalyticsEventRecord)initWithCoder:(id)a3;
- (AFAnalyticsEventRecord)initWithEvent:(id)a3 streamUID:(id)a4 dateCreated:(id)a5 speechId:(id)a6;
- (AFAnalyticsEventRecord)initWithEvent:(id)a3 streamUID:(id)a4 dateCreated:(id)a5 speechId:(id)a6 recordId:(id)a7;
- (NSDate)dateCreated;
- (NSString)recordId;
- (NSString)speechId;
- (NSString)streamUID;
- (void)encodeWithCoder:(id)a3;
- (void)siriCoreSQLiteRecord_enumerateColumnNamesAndValuesUsingBlock:(id)a3;
@end

@implementation AFAnalyticsEventRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_streamUID, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (NSString)recordId
{
  return self->_recordId;
}

- (NSString)speechId
{
  return self->_speechId;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSString)streamUID
{
  return self->_streamUID;
}

- (AFAnalyticsEvent)event
{
  return self->_event;
}

- (AFAnalyticsEventRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AFAnalyticsEventRecord;
  v5 = [(AFAnalyticsEventRecord *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_event"];
    event = v5->_event;
    v5->_event = (AFAnalyticsEvent *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_streamUID"];
    streamUID = v5->_streamUID;
    v5->_streamUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dateCreated"];
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_speechId"];
    speechId = v5->_speechId;
    v5->_speechId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordId"];
    recordId = v5->_recordId;
    v5->_recordId = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  event = self->_event;
  id v5 = a3;
  [v5 encodeObject:event forKey:@"_event"];
  [v5 encodeObject:self->_streamUID forKey:@"_streamUID"];
  [v5 encodeObject:self->_dateCreated forKey:@"_dateCreated"];
  [v5 encodeObject:self->_speechId forKey:@"_speechId"];
  [v5 encodeObject:self->_recordId forKey:@"_recordId"];
}

- (AFAnalyticsEventRecord)initWithEvent:(id)a3 streamUID:(id)a4 dateCreated:(id)a5 speechId:(id)a6 recordId:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)AFAnalyticsEventRecord;
  objc_super v17 = [(AFAnalyticsEventRecord *)&v31 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    event = v17->_event;
    v17->_event = (AFAnalyticsEvent *)v18;

    uint64_t v20 = [v13 copy];
    streamUID = v17->_streamUID;
    v17->_streamUID = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    dateCreated = v17->_dateCreated;
    v17->_dateCreated = (NSDate *)v22;

    uint64_t v24 = [v15 copy];
    speechId = v17->_speechId;
    v17->_speechId = (NSString *)v24;

    if (v16)
    {
      uint64_t v26 = [v16 copy];
      recordId = v17->_recordId;
      v17->_recordId = (NSString *)v26;
    }
    else
    {
      recordId = [MEMORY[0x1E4F29128] UUID];
      uint64_t v28 = [recordId UUIDString];
      v29 = v17->_recordId;
      v17->_recordId = (NSString *)v28;
    }
  }

  return v17;
}

- (AFAnalyticsEventRecord)initWithEvent:(id)a3 streamUID:(id)a4 dateCreated:(id)a5 speechId:(id)a6
{
  return [(AFAnalyticsEventRecord *)self initWithEvent:a3 streamUID:a4 dateCreated:a5 speechId:a6 recordId:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)siriCoreSQLiteRecord_enumerateColumnNamesAndValuesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, __CFString *, NSString *, unsigned char *))a3;
  if (v4
    && self->_streamUID
    && ([(AFAnalyticsEvent *)self->_event deliveryStream]
     || [(AFAnalyticsEvent *)self->_event type]))
  {
    char v17 = 0;
    v4[2](v4, @"stream_uid", self->_streamUID, &v17);
    if (!v17)
    {
      id v5 = (void *)MEMORY[0x1E4F28ED0];
      [(NSDate *)self->_dateCreated timeIntervalSince1970];
      objc_msgSend(v5, "numberWithDouble:");
      uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, @"date_created", v6, &v17);

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AFAnalyticsEvent type](self->_event, "type"));
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, @"type", v7, &v17);

        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AFAnalyticsEvent deliveryStream](self->_event, "deliveryStream"));
          uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, @"delivery_stream", v8, &v17);

          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[AFAnalyticsEvent timestamp](self->_event, "timestamp"));
            v9 = (NSString *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, @"timestamp", v9, &v17);

            if (!v17)
            {
              objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AFAnalyticsEvent contextDataType](self->_event, "contextDataType"));
              uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
              v4[2](v4, @"context_data_type", v10, &v17);

              if (!v17)
              {
                v11 = [(AFAnalyticsEvent *)self->_event contextData];
                if (v11) {
                  v4[2](v4, @"context_data", v11, &v17);
                }
                if (!v17)
                {
                  speechId = self->_speechId;
                  if (speechId)
                  {
                    v4[2](v4, @"assistant_id", speechId, &v17);
                  }
                  else
                  {
                    id v13 = [MEMORY[0x1E4F1CA98] null];
                    v4[2](v4, @"assistant_id", v13, &v17);
                  }
                  if (!v17)
                  {
                    recordId = self->_recordId;
                    if (recordId)
                    {
                      v4[2](v4, @"record_id", recordId, &v17);
                    }
                    else
                    {
                      id v15 = [MEMORY[0x1E4F29128] UUID];
                      id v16 = [v15 UUIDString];
                      v4[2](v4, @"record_id", v16, &v17);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

@end