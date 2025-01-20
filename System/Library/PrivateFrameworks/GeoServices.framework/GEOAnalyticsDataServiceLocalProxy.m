@interface GEOAnalyticsDataServiceLocalProxy
- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3;
- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3;
@end

@implementation GEOAnalyticsDataServiceLocalProxy

- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3
{
  id v3 = a3;
  v4 = +[GEONetworkEventFileManager sharedManager];
  int v5 = [v4 fileDescriptorOfNetworkEventDataFileForRepresentativeDate:v3];

  return v5;
}

- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3
{
  v4 = +[GEORequestResponseMetadataFileManager sharedManager];
  LODWORD(a3) = [v4 fileDescriptorOfRequestResponseMetadataFileForBatchID:a3];

  return a3;
}

@end