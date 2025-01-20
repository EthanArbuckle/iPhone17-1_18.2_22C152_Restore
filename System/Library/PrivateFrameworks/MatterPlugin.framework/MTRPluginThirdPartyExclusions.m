@interface MTRPluginThirdPartyExclusions
+ (BOOL)attributeReadDisallowedOverXPCWithEndpointID:(id)a3 clusterID:(id)a4 attribute:(id)a5 isPrivatelyEntitled:(BOOL)a6;
+ (BOOL)attributeWriteDisallowedOverXPCWithEndpointID:(id)a3 clusterID:(id)a4 attribute:(id)a5 isPrivatelyEntitled:(BOOL)a6;
+ (BOOL)commandDisallowedOverXPCWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 isPrivatelyEntitled:(BOOL)a6;
+ (BOOL)connectionIsPrivatelyEntitled:(id)a3;
@end

@implementation MTRPluginThirdPartyExclusions

+ (BOOL)connectionIsPrivatelyEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.homekit"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)attributeReadDisallowedOverXPCWithEndpointID:(id)a3 clusterID:(id)a4 attribute:(id)a5 isPrivatelyEntitled:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6) {
    goto LABEL_7;
  }
  if (attributeReadDisallowedOverXPCWithEndpointID_clusterID_attribute_isPrivatelyEntitled__onceToken != -1) {
    dispatch_once(&attributeReadDisallowedOverXPCWithEndpointID_clusterID_attribute_isPrivatelyEntitled__onceToken, &__block_literal_global_4);
  }
  v12 = [(id)attributeReadDisallowedOverXPCWithEndpointID_clusterID_attribute_isPrivatelyEntitled__disallowedClusterToAttributeMap allKeys];
  int v13 = [v12 containsObject:v10];

  if (!v13) {
    goto LABEL_7;
  }
  v14 = [(id)attributeReadDisallowedOverXPCWithEndpointID_clusterID_attribute_isPrivatelyEntitled__disallowedClusterToAttributeMap objectForKeyedSubscript:v10];
  char v15 = [v14 containsObject:v11];

  if (v15) {
    BOOL v16 = 1;
  }
  else {
LABEL_7:
  }
    BOOL v16 = 0;

  return v16;
}

void __118__MTRPluginThirdPartyExclusions_attributeReadDisallowedOverXPCWithEndpointID_clusterID_attribute_isPrivatelyEntitled___block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = &unk_27046A9C8;
  v2[1] = &unk_27046A9F8;
  v3[0] = &unk_27046AB90;
  v3[1] = &unk_27046ABA8;
  v2[2] = &unk_27046AA28;
  v3[2] = &unk_27046ABC0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)attributeReadDisallowedOverXPCWithEndpointID_clusterID_attribute_isPrivatelyEntitled__disallowedClusterToAttributeMap;
  attributeReadDisallowedOverXPCWithEndpointID_clusterID_attribute_isPrivatelyEntitled__disallowedClusterToAttributeMap = v0;
}

+ (BOOL)attributeWriteDisallowedOverXPCWithEndpointID:(id)a3 clusterID:(id)a4 attribute:(id)a5 isPrivatelyEntitled:(BOOL)a6
{
  return 0;
}

+ (BOOL)commandDisallowedOverXPCWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 isPrivatelyEntitled:(BOOL)a6
{
  if (a6) {
    return 0;
  }
  else {
    return [&unk_27046ABD8 containsObject:a4];
  }
}

@end