@interface GEORequestResponseMetadataFile
- (BOOL)unsafe_readReqRespMetadataWithVisitorBlock:(id)a3;
- (BOOL)writeRequestResponseMetadata:(id)a3;
- (id)initForReadWithFileDescriptor:(int)a3;
- (id)initForReadWithFilePath:(id)a3;
- (id)initForWriteWithFilePath:(id)a3;
@end

@implementation GEORequestResponseMetadataFile

- (id)initForReadWithFileDescriptor:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return [(GEOAnalyticsDataFile *)&v4 initForReadWithFileMagic:195944097 fileDescriptor:*(void *)&a3];
}

- (id)initForReadWithFilePath:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return [(GEOAnalyticsDataFile *)&v4 initForReadWithFileMagic:195944097 filePath:a3];
}

- (id)initForWriteWithFilePath:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return [(GEOAnalyticsDataFile *)&v4 initForWriteWithFileMagic:195944097 filePath:a3];
}

- (BOOL)writeRequestResponseMetadata:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return [(GEOAnalyticsDataFile *)&v4 writeAnalyticData:a3];
}

- (BOOL)unsafe_readReqRespMetadataWithVisitorBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEORequestResponseMetadataFile;
  return [(GEOAnalyticsDataFile *)&v4 unsafe_readAnalyticDataWithVisitorBlock:a3];
}

@end