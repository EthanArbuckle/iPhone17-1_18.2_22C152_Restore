@interface ADAnalyticsEventRecordBuilder
- (id)build;
- (void)reset;
- (void)setValue:(id)a3 forColumnName:(id)a4;
@end

@implementation ADAnalyticsEventRecordBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdValue, 0);
  objc_storeStrong((id *)&self->_speechIdValue, 0);
  objc_storeStrong((id *)&self->_dateCreatedValue, 0);
  objc_storeStrong((id *)&self->_contextDataTypeValue, 0);
  objc_storeStrong((id *)&self->_contextDataValue, 0);
  objc_storeStrong((id *)&self->_timestampValue, 0);
  objc_storeStrong((id *)&self->_typeValue, 0);
  objc_storeStrong((id *)&self->_deliveryStreamValue, 0);
  objc_storeStrong((id *)&self->_streamUIDValue, 0);
}

- (id)build
{
  id v21 = objc_alloc((Class)AFAnalyticsEvent);
  v3 = [(SiriCoreSQLiteValue *)self->_deliveryStreamValue siriCoreSQLiteValue_toNumber];
  id v4 = [v3 unsignedLongLongValue];
  v5 = [(SiriCoreSQLiteValue *)self->_typeValue siriCoreSQLiteValue_toNumber];
  id v6 = [v5 integerValue];
  v7 = [(SiriCoreSQLiteValue *)self->_timestampValue siriCoreSQLiteValue_toNumber];
  id v8 = [v7 unsignedLongLongValue];
  v9 = [(SiriCoreSQLiteValue *)self->_contextDataTypeValue siriCoreSQLiteValue_toNumber];
  id v10 = [v9 integerValue];
  v11 = [(SiriCoreSQLiteValue *)self->_contextDataValue siriCoreSQLiteValue_toData];
  id v12 = [v21 initWithDeliveryStream:v4 type:v6 timestamp:v8 contextDataType:v10 contextData:v11];

  id v13 = objc_alloc((Class)AFAnalyticsEventRecord);
  v14 = [(SiriCoreSQLiteValue *)self->_streamUIDValue siriCoreSQLiteValue_toString];
  v15 = [(SiriCoreSQLiteValue *)self->_dateCreatedValue siriCoreSQLiteValue_toNumber];
  [v15 doubleValue];
  v16 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  v17 = [(SiriCoreSQLiteValue *)self->_speechIdValue siriCoreSQLiteValue_toString];
  v18 = [(SiriCoreSQLiteValue *)self->_recordIdValue siriCoreSQLiteValue_toString];
  id v19 = [v13 initWithEvent:v12 streamUID:v14 dateCreated:v16 speechId:v17 recordId:v18];

  return v19;
}

- (void)setValue:(id)a3 forColumnName:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"stream_uid"])
  {
    uint64_t v8 = 8;
  }
  else if ([v7 isEqualToString:@"delivery_stream"])
  {
    uint64_t v8 = 16;
  }
  else if ([v7 isEqualToString:@"type"])
  {
    uint64_t v8 = 24;
  }
  else if ([v7 isEqualToString:@"timestamp"])
  {
    uint64_t v8 = 32;
  }
  else if ([v7 isEqualToString:@"context_data"])
  {
    uint64_t v8 = 40;
  }
  else if ([v7 isEqualToString:@"context_data_type"])
  {
    uint64_t v8 = 48;
  }
  else if ([v7 isEqualToString:@"date_created"])
  {
    uint64_t v8 = 56;
  }
  else if ([v7 isEqualToString:@"assistant_id"])
  {
    uint64_t v8 = 64;
  }
  else
  {
    if (![v7 isEqualToString:@"record_id"]) {
      goto LABEL_20;
    }
    uint64_t v8 = 72;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v8), a3);
LABEL_20:
}

- (void)reset
{
  streamUIDValue = self->_streamUIDValue;
  self->_streamUIDValue = 0;

  deliveryStreamValue = self->_deliveryStreamValue;
  self->_deliveryStreamValue = 0;

  typeValue = self->_typeValue;
  self->_typeValue = 0;

  timestampValue = self->_timestampValue;
  self->_timestampValue = 0;

  contextDataValue = self->_contextDataValue;
  self->_contextDataValue = 0;

  contextDataTypeValue = self->_contextDataTypeValue;
  self->_contextDataTypeValue = 0;

  dateCreatedValue = self->_dateCreatedValue;
  self->_dateCreatedValue = 0;

  speechIdValue = self->_speechIdValue;
  self->_speechIdValue = 0;

  recordIdValue = self->_recordIdValue;
  self->_recordIdValue = 0;
}

@end