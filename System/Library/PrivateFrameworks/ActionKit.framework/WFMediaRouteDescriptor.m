@interface WFMediaRouteDescriptor
+ (BOOL)routeUID:(id)a3 isEqualToRouteUID:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
- (BOOL)isEqualInRouteUIDs:(id)a3;
- (BOOL)isLocalDevice;
- (NSString)displayName;
- (NSString)groupUID;
- (NSString)routeName;
- (NSString)routeUID;
- (WFMediaRouteDescriptor)initWithRouteUID:(id)a3 groupUID:(id)a4 routeName:(id)a5 isLocalDevice:(BOOL)a6;
- (id)findMatchingRoute:(id)a3;
@end

@implementation WFMediaRouteDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_groupUID, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (id)findMatchingRoute:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFMediaRouteDescriptor *)self routeUID];

  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v12 = objc_opt_class();
          v13 = objc_msgSend(v11, "routeUID", (void)v19);
          v14 = [(WFMediaRouteDescriptor *)self routeUID];
          LOBYTE(v12) = [(id)v12 routeUID:v13 isEqualToRouteUID:v14];

          if (v12)
          {
            id v17 = v11;
            goto LABEL_16;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  if (![(WFMediaRouteDescriptor *)self isLocalDevice]
    || ([v4 objectMatchingKey:@"isDeviceSpeakerRoute" BOOLValue:1],
        (v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v16 = [(WFMediaRouteDescriptor *)self routeName];

    if (v16)
    {
      id v6 = [(WFMediaRouteDescriptor *)self routeName];
      id v17 = [v4 objectMatchingKey:@"routeName" value:v6];
LABEL_16:
      v15 = v17;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (BOOL)isEqualInRouteUIDs:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(WFMediaRouteDescriptor *)self routeUID];
  uint64_t v7 = [v4 routeUID];

  LOBYTE(v4) = [v5 routeUID:v6 isEqualToRouteUID:v7];
  return (char)v4;
}

- (NSString)displayName
{
  if ([(WFMediaRouteDescriptor *)self isLocalDevice])
  {
    v3 = [MEMORY[0x263F85258] currentDevice];
    id v4 = [v3 localizedModel];
  }
  else
  {
    id v4 = [(WFMediaRouteDescriptor *)self routeName];
  }
  return (NSString *)v4;
}

- (WFMediaRouteDescriptor)initWithRouteUID:(id)a3 groupUID:(id)a4 routeName:(id)a5 isLocalDevice:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFMediaRouteDescriptor;
  v13 = [(MTLModel *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    groupUID = v13->_groupUID;
    v13->_groupUID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    routeUID = v13->_routeUID;
    v13->_routeUID = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    routeName = v13->_routeName;
    v13->_routeName = (NSString *)v18;

    v13->_isLocalDevice = a6;
    long long v20 = v13;
  }

  return v13;
}

+ (BOOL)routeUID:(id)a3 isEqualToRouteUID:(id)a4
{
  id v5 = a4;
  id v6 = [a3 componentsSeparatedByString:@"//"];
  uint64_t v7 = [v5 componentsSeparatedByString:@"//"];

  uint64_t v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") != 1);
  uint64_t v9 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") != 1);
  if ([v8 containsString:v9]) {
    char v10 = 1;
  }
  else {
    char v10 = [v9 containsString:v8];
  }

  return v10;
}

+ (id)JSONKeyPathsByPropertyKey
{
  return (id)objc_msgSend(NSDictionary, "mtl_identityPropertyMapWithModel:", a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end