@interface CATActiveIDSServiceConnectionContentSendData
+ (id)instanceWithDictionary:(id)a3;
- (CATActiveIDSServiceConnectionContentSendData)initWithSequenceNumber:(id)a3 dataNumber:(unint64_t)a4 dataSegment:(id)a5 segmentRange:(_NSRange)a6 segmentNumber:(unint64_t)a7 totalSegments:(unint64_t)a8;
- (NSData)dataSegment;
- (NSDictionary)dictionaryValue;
- (NSNumber)sequenceNumber;
- (int64_t)contentType;
- (unint64_t)dataNumber;
- (unint64_t)segmentNumber;
- (unint64_t)totalSegments;
@end

@implementation CATActiveIDSServiceConnectionContentSendData

- (CATActiveIDSServiceConnectionContentSendData)initWithSequenceNumber:(id)a3 dataNumber:(unint64_t)a4 dataSegment:(id)a5 segmentRange:(_NSRange)a6 segmentNumber:(unint64_t)a7 totalSegments:(unint64_t)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a3;
  id v16 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CATActiveIDSServiceConnectionContentSendData;
  v17 = [(CATActiveIDSServiceConnectionContentSendData *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sequenceNumber, a3);
    v18->_dataNumber = a4;
    uint64_t v19 = [v16 copy];
    mUnderlyingDataSegment = v18->mUnderlyingDataSegment;
    v18->mUnderlyingDataSegment = (NSData *)v19;

    v18->_segmentNumber = a7;
    v18->_totalSegments = a8;
    v18->mSegmentRange.NSUInteger location = location;
    v18->mSegmentRange.NSUInteger length = length;
  }

  return v18;
}

- (NSData)dataSegment
{
  return -[NSData subdataWithRange:](self->mUnderlyingDataSegment, "subdataWithRange:", self->mSegmentRange.location, self->mSegmentRange.length);
}

- (int64_t)contentType
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CATActiveIDSServiceConnectionContentSendData dataNumber](self, "dataNumber"));
  [v3 setObject:v4 forKeyedSubscript:@"DataNumber"];

  v5 = [(CATActiveIDSServiceConnectionContentSendData *)self dataSegment];
  v6 = (void *)[v5 copy];
  [v3 setObject:v6 forKeyedSubscript:@"DataSegment"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CATActiveIDSServiceConnectionContentSendData segmentNumber](self, "segmentNumber"));
  [v3 setObject:v7 forKeyedSubscript:@"SegmentNumber"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CATActiveIDSServiceConnectionContentSendData totalSegments](self, "totalSegments"));
  [v3 setObject:v8 forKeyedSubscript:@"TotalSegments"];

  v9 = [(CATActiveIDSServiceConnectionContentSendData *)self sequenceNumber];
  [v3 setObject:v9 forKeyedSubscript:@"SequenceNumber"];

  v10 = (void *)[v3 copy];

  return (NSDictionary *)v10;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"DataNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"DataSegment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = [v4 objectForKeyedSubscript:@"SegmentNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  v14 = [v4 objectForKeyedSubscript:@"TotalSegments"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  v17 = [v4 objectForKeyedSubscript:@"SequenceNumber"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  v20 = 0;
  if (v7 && v10 && v13 && v16) {
    v20 = objc_msgSend(objc_alloc((Class)a1), "initWithSequenceNumber:dataNumber:dataSegment:segmentRange:segmentNumber:totalSegments:", v19, objc_msgSend(v7, "unsignedIntegerValue"), v10, 0, objc_msgSend(v10, "length"), objc_msgSend(v13, "unsignedIntegerValue"), objc_msgSend(v16, "unsignedIntegerValue"));
  }

  return v20;
}

- (NSNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unint64_t)dataNumber
{
  return self->_dataNumber;
}

- (unint64_t)segmentNumber
{
  return self->_segmentNumber;
}

- (unint64_t)totalSegments
{
  return self->_totalSegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceNumber, 0);

  objc_storeStrong((id *)&self->mUnderlyingDataSegment, 0);
}

@end