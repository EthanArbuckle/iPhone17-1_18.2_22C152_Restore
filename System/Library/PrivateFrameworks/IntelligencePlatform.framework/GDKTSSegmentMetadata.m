@interface GDKTSSegmentMetadata
- (GDKTSSegmentMetadata)initWithSegmentId:(id)a3;
- (NSString)segmentId;
@end

@implementation GDKTSSegmentMetadata

- (void).cxx_destruct
{
}

- (NSString)segmentId
{
  return self->_segmentId;
}

- (GDKTSSegmentMetadata)initWithSegmentId:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDKTSSegmentMetadata;
  v9 = [(GDKTSSegmentMetadata *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    segmentId = v9->_segmentId;
    v9->_segmentId = (NSString *)v10;
  }
  return v9;
}

@end