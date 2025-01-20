@interface CRDTModelSyncMapper
- (id)cloudDataFromRecord:(id)a3;
- (id)recordFromCloudData:(id)a3;
@end

@implementation CRDTModelSyncMapper

- (id)cloudDataFromRecord:(id)a3
{
  return sub_10007D3A0((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(id))_s14bookdatastored19CRDTModelSyncMapperC9cloudData4fromSo014BCMutableCloudF0CSgSo8CKRecordC_tF_0);
}

- (id)recordFromCloudData:(id)a3
{
  return sub_10007D3A0((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(id))_s14bookdatastored19CRDTModelSyncMapperC6record4fromSo8CKRecordCSgSo18BCMutableCloudDataC_tF_0);
}

@end