@interface AACloudKitDevicesListResponse
- (AACloudKitDevicesListResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSArray)incompatibleDeviceNames;
- (NSArray)incompatibleDevices;
- (NSArray)needUpgradeDeviceNames;
- (NSArray)needUpgradeDevices;
@end

@implementation AACloudKitDevicesListResponse

- (AACloudKitDevicesListResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)AACloudKitDevicesListResponse;
  v4 = [(AAResponse *)&v17 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(AAResponse *)v4 responseDictionary];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"neverEligible"];
    incompatibleDevices = v5->_incompatibleDevices;
    v5->_incompatibleDevices = (NSArray *)v7;

    uint64_t v9 = [(NSArray *)v5->_incompatibleDevices aaf_map:&__block_literal_global_705];
    incompatibleDeviceNames = v5->_incompatibleDeviceNames;
    v5->_incompatibleDeviceNames = (NSArray *)v9;

    v11 = [(AAResponse *)v5 responseDictionary];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"needsUpgrade"];
    needUpgradeDevices = v5->_needUpgradeDevices;
    v5->_needUpgradeDevices = (NSArray *)v12;

    uint64_t v14 = [(NSArray *)v5->_needUpgradeDevices aaf_map:&__block_literal_global_710];
    needUpgradeDeviceNames = v5->_needUpgradeDeviceNames;
    v5->_needUpgradeDeviceNames = (NSArray *)v14;
  }
  return v5;
}

uint64_t __59__AACloudKitDevicesListResponse_initWithHTTPResponse_data___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"name"];
}

uint64_t __59__AACloudKitDevicesListResponse_initWithHTTPResponse_data___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"name"];
}

- (NSArray)incompatibleDevices
{
  return self->_incompatibleDevices;
}

- (NSArray)needUpgradeDevices
{
  return self->_needUpgradeDevices;
}

- (NSArray)incompatibleDeviceNames
{
  return self->_incompatibleDeviceNames;
}

- (NSArray)needUpgradeDeviceNames
{
  return self->_needUpgradeDeviceNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needUpgradeDeviceNames, 0);
  objc_storeStrong((id *)&self->_incompatibleDeviceNames, 0);
  objc_storeStrong((id *)&self->_needUpgradeDevices, 0);

  objc_storeStrong((id *)&self->_incompatibleDevices, 0);
}

@end