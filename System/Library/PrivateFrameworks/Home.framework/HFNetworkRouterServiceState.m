@interface HFNetworkRouterServiceState
+ (NSString)combinedStateTypeIdentifier;
+ (id)optionalCharacteristicTypes;
+ (id)stateClassIdentifier;
+ (unint64_t)_typeForStatus:(unint64_t)a3;
+ (unint64_t)combinedType;
- (HFNetworkRouterServiceState)initWithBatchReadResponse:(id)a3;
- (id)stateTypeIdentifier;
- (int64_t)primaryState;
- (int64_t)priority;
- (unint64_t)type;
- (unint64_t)underlyingStatus;
@end

@implementation HFNetworkRouterServiceState

+ (id)stateClassIdentifier
{
  return @"NetworkRouter";
}

+ (id)optionalCharacteristicTypes
{
  if (qword_26AB2E870 != -1) {
    dispatch_once(&qword_26AB2E870, &__block_literal_global_216_2);
  }
  v2 = (void *)qword_26AB2E878;
  return v2;
}

void __58__HFNetworkRouterServiceState_optionalCharacteristicTypes__block_invoke_2()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C5C8];
  v5[0] = *MEMORY[0x263F0C388];
  v5[1] = v1;
  v5[2] = *MEMORY[0x263F0C5B0];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)qword_26AB2E878;
  qword_26AB2E878 = v3;
}

+ (unint64_t)_typeForStatus:(unint64_t)a3
{
  unint64_t v3 = 1;
  uint64_t v4 = 3;
  if ((a3 & 0x20000000) == 0) {
    uint64_t v4 = 4;
  }
  uint64_t v5 = 2;
  if ((a3 & 0x40000002) == 0) {
    uint64_t v5 = v4;
  }
  if ((a3 & 1) == 0) {
    unint64_t v3 = v5;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (HFNetworkRouterServiceState)initWithBatchReadResponse:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F0C388];
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F0D898];
  id v7 = a3;
  v8 = [v5 setWithObject:v6];
  v9 = [v7 responseForCharacteristicType:v4 inServicesOfTypes:v8];
  v10 = [v9 valueWithExpectedClass:objc_opt_class()];

  uint64_t v11 = *MEMORY[0x263F0C5C8];
  v12 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D8A0]];
  v13 = [v7 responseForCharacteristicType:v11 inServicesOfTypes:v12];
  v14 = [v13 valueWithExpectedClass:objc_opt_class()];

  uint64_t v15 = *MEMORY[0x263F0C5B0];
  v16 = [MEMORY[0x263EFFA08] setWithObject:v6];
  v17 = [v7 responseForCharacteristicType:v15 inServicesOfTypes:v16];

  v18 = [v17 valueWithExpectedClass:objc_opt_class()];

  if (v10) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = v19;
  if (v20 == 1 && v14 == 0)
  {
    v24 = 0;
  }
  else
  {
    if (v20)
    {
      uint64_t v22 = [v14 integerValue];
      uint64_t v23 = [MEMORY[0x263F0DF00] networkRouterStatusFromWiFiSatelliteStatus:v22];
    }
    else
    {
      uint64_t v25 = [v10 integerValue];
      uint64_t v23 = [MEMORY[0x263F0DF00] networkRouterStatusFromRouterStatus:v25 wanStatusListData:v18];
    }
    unint64_t v26 = v23;
    v30.receiver = self;
    v30.super_class = (Class)HFNetworkRouterServiceState;
    v27 = [(HFNetworkRouterServiceState *)&v30 init];
    v28 = v27;
    if (v27)
    {
      v27->_underlyingStatus = v26;
      v27->_type = [(id)objc_opt_class() _typeForStatus:v26];
    }
    self = v28;
    v24 = self;
  }

  return v24;
}

+ (unint64_t)combinedType
{
  return 4;
}

+ (NSString)combinedStateTypeIdentifier
{
  return (NSString *)@"NoInternet";
}

- (id)stateTypeIdentifier
{
  switch([(HFNetworkRouterServiceState *)self type])
  {
    case 1uLL:
      v2 = @"Unknown";
      break;
    case 2uLL:
      v2 = @"NotConnected";
      break;
    case 3uLL:
      v2 = @"NotReady";
      break;
    case 4uLL:
      v2 = +[HFNetworkRouterServiceState combinedStateTypeIdentifier];
      break;
    default:
      v2 = @"Connected";
      break;
  }
  return v2;
}

- (int64_t)primaryState
{
  if ([(HFNetworkRouterServiceState *)self type]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)priority
{
  if ([(HFNetworkRouterServiceState *)self type]) {
    return 1;
  }
  else {
    return -1;
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)underlyingStatus
{
  return self->_underlyingStatus;
}

@end