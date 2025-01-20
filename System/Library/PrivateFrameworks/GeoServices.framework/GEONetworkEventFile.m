@interface GEONetworkEventFile
- (BOOL)unsafe_readNetworkEventDataWithVisitorBlock:(id)a3;
- (BOOL)writeNetworkEventData:(id)a3;
- (id)initForReadWithFileDescriptor:(int)a3;
- (id)initForReadWithFilePath:(id)a3;
- (id)initForWriteWithFilePath:(id)a3;
@end

@implementation GEONetworkEventFile

- (BOOL)writeNetworkEventData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEONetworkEventFile;
  return [(GEOAnalyticsDataFile *)&v4 writeAnalyticData:a3];
}

- (id)initForWriteWithFilePath:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEONetworkEventFile;
  return [(GEOAnalyticsDataFile *)&v4 initForWriteWithFileMagic:2128731812 filePath:a3];
}

- (id)initForReadWithFileDescriptor:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEONetworkEventFile;
  return [(GEOAnalyticsDataFile *)&v4 initForReadWithFileMagic:2128731812 fileDescriptor:*(void *)&a3];
}

- (id)initForReadWithFilePath:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEONetworkEventFile;
  return [(GEOAnalyticsDataFile *)&v4 initForReadWithFileMagic:2128731812 filePath:a3];
}

- (BOOL)unsafe_readNetworkEventDataWithVisitorBlock:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEONetworkEventFile;
  return [(GEOAnalyticsDataFile *)&v4 unsafe_readAnalyticDataWithVisitorBlock:a3];
}

@end