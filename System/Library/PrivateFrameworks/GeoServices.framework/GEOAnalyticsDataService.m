@interface GEOAnalyticsDataService
+ (id)sharedService;
+ (void)useLocalProxy;
- (GEOAnalyticsDataService)initWithProxyClass:(Class)a3;
- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3;
- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3;
@end

@implementation GEOAnalyticsDataService

+ (void)useLocalProxy
{
  _MergedGlobals_183 = 1;
}

+ (id)sharedService
{
  if (qword_1EB29F4E0 != -1) {
    dispatch_once(&qword_1EB29F4E0, &__block_literal_global_9);
  }
  v2 = (void *)qword_1EB29F4D8;

  return v2;
}

void __40__GEOAnalyticsDataService_sharedService__block_invoke()
{
  v0 = [[GEOAnalyticsDataService alloc] initWithProxyClass:objc_opt_class()];
  v1 = (void *)qword_1EB29F4D8;
  qword_1EB29F4D8 = (uint64_t)v0;
}

- (GEOAnalyticsDataService)initWithProxyClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEOAnalyticsDataService;
  v4 = [(GEOAnalyticsDataService *)&v8 init];
  if (v4)
  {
    v5 = (GEOAnalyticsDataServiceProxy *)objc_alloc_init(a3);
    proxyObj = v4->_proxyObj;
    v4->_proxyObj = v5;
  }
  return v4;
}

- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3
{
  return [(GEOAnalyticsDataServiceProxy *)self->_proxyObj networkEventFileDescriptorForRepresentativeDate:a3];
}

- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3
{
  return [(GEOAnalyticsDataServiceProxy *)self->_proxyObj requestResponseMetadataFileDescriptorForBatchID:a3];
}

- (void).cxx_destruct
{
}

@end