@interface GEOAnalyticsDataServiceRemoteProxy
- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3;
- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3;
@end

@implementation GEOAnalyticsDataServiceRemoteProxy

- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return -1;
  }
  id v3 = a3;
  v4 = +[GEOXPCConnection createServerConnectionFor:24 debugIdentifier:@"anayticsData" eventHandler:0];
  id v16 = v3;
  v17[0] = @"message";
  v17[1] = @"userInfo";
  v18[0] = @"analyticdata.readNetEventData";
  v15 = @"day";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  uint64_t v7 = [v4 sendDictionaryWithMessageReplySync:v6 error:0];
  v8 = (void *)v7;
  if (v7 && (uint64_t v9 = MEMORY[0x18C1213B0](v7), v10 = MEMORY[0x1E4F14590], v9 == MEMORY[0x1E4F14590]))
  {
    uint64_t v12 = xpc_dictionary_get_dictionary(v8, "userInfo");
    v13 = (void *)v12;
    if (v12 && MEMORY[0x18C1213B0](v12) == v10) {
      int v11 = xpc_dictionary_dup_fd(v13, "fd");
    }
    else {
      int v11 = -1;
    }
  }
  else
  {
    int v11 = -1;
  }

  return v11;
}

- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v4 = +[GEOXPCConnection createServerConnectionFor:24 debugIdentifier:@"anayticsData" eventHandler:0];
  v18[0] = @"message";
  v18[1] = @"userInfo";
  v19[0] = @"analyticdata.readReqRespMetadata";
  id v16 = @"bid";
  v5 = [NSNumber numberWithUnsignedLongLong:a3];
  v17 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  uint64_t v8 = [v4 sendDictionaryWithMessageReplySync:v7 error:0];
  uint64_t v9 = (void *)v8;
  if (v8 && (uint64_t v10 = MEMORY[0x18C1213B0](v8), v11 = MEMORY[0x1E4F14590], v10 == MEMORY[0x1E4F14590]))
  {
    uint64_t v13 = xpc_dictionary_get_dictionary(v9, "userInfo");
    v14 = (void *)v13;
    if (v13 && MEMORY[0x18C1213B0](v13) == v11) {
      int v12 = xpc_dictionary_dup_fd(v14, "fd");
    }
    else {
      int v12 = -1;
    }
  }
  else
  {
    int v12 = -1;
  }

  return v12;
}

@end