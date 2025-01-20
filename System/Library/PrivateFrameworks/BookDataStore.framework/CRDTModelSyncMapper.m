@interface CRDTModelSyncMapper
- (id)cloudDataFromRecord:(id)a3;
- (id)recordFromCloudData:(id)a3;
@end

@implementation CRDTModelSyncMapper

- (id)cloudDataFromRecord:(id)a3
{
  return sub_2361A0F0C((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(id))_s13BookDataStore19CRDTModelSyncMapperC05cloudB04fromSo014BCMutableCloudB0CSgSo8CKRecordC_tF_0);
}

- (id)recordFromCloudData:(id)a3
{
  return sub_2361A0F0C((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(id))_s13BookDataStore19CRDTModelSyncMapperC6record4fromSo8CKRecordCSgSo014BCMutableCloudB0C_tF_0);
}

@end