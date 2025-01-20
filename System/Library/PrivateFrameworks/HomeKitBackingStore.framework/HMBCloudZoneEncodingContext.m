@interface HMBCloudZoneEncodingContext
- (HMBCloudZoneEncodingContext)initWithModelContainer:(id)a3;
- (NSMutableDictionary)createdRecords;
@end

@implementation HMBCloudZoneEncodingContext

- (void).cxx_destruct
{
}

- (NSMutableDictionary)createdRecords
{
  return self->_createdRecords;
}

- (HMBCloudZoneEncodingContext)initWithModelContainer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMBCloudZoneEncodingContext;
  v3 = [(HMBModelContainerEncodingContext *)&v7 initWithModelContainer:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    createdRecords = v3->_createdRecords;
    v3->_createdRecords = (NSMutableDictionary *)v4;
  }
  return v3;
}

@end