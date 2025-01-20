@interface BMDistributedContextSubscribeMessage
- (BMDistributedContextSubscribeMessage)initWithMessageDictionary:(id)a3 fromRemoteDevice:(id)a4 localDevice:(id)a5;
- (BMDistributedContextSubscribeMessage)initWithSubscriptions:(id)a3 localDevice:(id)a4 messageIntent:(unint64_t)a5;
- (BOOL)shouldWake;
- (NSArray)subscriptions;
- (NSString)localDevice;
- (NSString)messageVersion;
- (id)dictionaryRepresentation;
- (unint64_t)messageIntent;
- (void)setLocalDevice:(id)a3;
- (void)setMessageIntent:(unint64_t)a3;
- (void)setMessageVersion:(id)a3;
- (void)setShouldWake:(BOOL)a3;
- (void)setSubscriptions:(id)a3;
@end

@implementation BMDistributedContextSubscribeMessage

- (BMDistributedContextSubscribeMessage)initWithMessageDictionary:(id)a3 fromRemoteDevice:(id)a4 localDevice:(id)a5
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v56 = a4;
  id v57 = a5;
  v67.receiver = self;
  v67.super_class = (Class)BMDistributedContextSubscribeMessage;
  v9 = [(BMDistributedContextSubscribeMessage *)&v67 init];
  if (!v9) {
    goto LABEL_27;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:@"messageVersion"];
  if (v10)
  {
    v11 = (void *)v10;
    uint64_t v12 = [v8 objectForKeyedSubscript:@"messageVersion"];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [v8 objectForKeyedSubscript:@"messageVersion"];
      char v15 = [v14 isEqualToString:@"1.0"];

      if ((v15 & 1) == 0) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    id v49 = a5;
    v50 = v9;
    v55 = (NSArray *)objc_opt_new();
    v58 = objc_opt_new();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v18 = [v8 objectForKeyedSubscript:@"dsls"];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v64;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v64 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v63 + 1) + 8 * v22);
          v24 = (void *)MEMORY[0x223C679A0](v19);
          v25 = objc_msgSend(v8, "objectForKeyedSubscript:", @"dsls", v49);
          v26 = [v25 objectForKeyedSubscript:v23];

          v27 = -[NSData bmdsl_deserialize](v26);
          [v58 setObject:v27 forKeyedSubscript:v23];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v63 objects:v69 count:16];
        uint64_t v20 = v19;
      }
      while (v19);
    }

    v51 = v8;
    v28 = [v8 objectForKeyedSubscript:@"dslIdentifiers"];
    v29 = [v28 objectForKeyedSubscript:v57];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v54 = v29;
    id obj = [v29 allKeys];
    uint64_t v30 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v53 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v60 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void *)(*((void *)&v59 + 1) + 8 * i);
          v34 = (void *)MEMORY[0x223C679A0]();
          v35 = [v58 objectForKeyedSubscript:v33];
          v36 = [v54 objectForKeyedSubscript:v33];
          v37 = [v36 objectForKeyedSubscript:@"oneOffSubscription"];
          if ([v37 BOOLValue]) {
            uint64_t v38 = 2;
          }
          else {
            uint64_t v38 = 0;
          }
          v39 = objc_msgSend(v36, "objectForKeyedSubscript:", @"wake", v49);
          uint64_t v40 = v38 | [v39 BOOLValue];
          v41 = [v36 objectForKeyedSubscript:@"lastChangeDate"];
          v42 = [[BMDistributedContextSubscriptionConfiguration alloc] initWithOptions:v40 lastChangedDate:v41];
          v43 = [[BMDistributedContextSubscription alloc] initWithIdentifier:v33 dsl:v35 subscribingDevice:v56 subscribedDevice:v57 configuration:v42];
          [(NSArray *)v55 addObject:v43];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v31);
    }

    v9 = v50;
    subscriptions = v50->_subscriptions;
    v50->_subscriptions = v55;
    v45 = v55;

    id v8 = v51;
    uint64_t v46 = [v51 objectForKeyedSubscript:@"messageVersion"];
    messageVersion = v50->_messageVersion;
    v50->_messageVersion = (NSString *)v46;

    objc_storeStrong((id *)&v50->_localDevice, v49);
LABEL_27:
    v17 = v9;
    goto LABEL_28;
  }
LABEL_5:
  v16 = __biome_log_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    -[BMDistributedContextSubscribeMessage initWithMessageDictionary:fromRemoteDevice:localDevice:](v8);
  }

  v17 = 0;
LABEL_28:

  return v17;
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v24 = objc_opt_new();
  v3 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = self->_subscriptions;
  uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        context = (void *)MEMORY[0x223C679A0]();
        v6 = [v5 subscribedDevice];
        v7 = [v3 objectForKeyedSubscript:v6];

        if (!v7)
        {
          id v8 = objc_opt_new();
          v9 = [v5 subscribedDevice];
          [v3 setObject:v8 forKeyedSubscript:v9];
        }
        v36[0] = @"lastChangeDate";
        v28 = [v5 configuration];
        v27 = [v28 lastChangedDate];
        v37[0] = v27;
        v36[1] = @"wake";
        v26 = [v5 configuration];
        uint64_t v10 = [v26 wakeState];
        v37[1] = v10;
        v36[2] = @"oneOffSubscription";
        v11 = [v5 configuration];
        uint64_t v12 = [v11 oneOffSubscription];
        v37[2] = v12;
        v13 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
        v14 = [v5 subscribedDevice];
        char v15 = [v3 objectForKeyedSubscript:v14];
        v16 = [v5 identifier];
        [v15 setObject:v13 forKeyedSubscript:v16];

        v17 = [v5 dsl];
        v18 = -[BMDSL bmdsl_serialize]((uint64_t)v17);
        uint64_t v19 = [v5 identifier];
        [v24 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v25);
  }

  v34[0] = @"type";
  v34[1] = @"messageVersion";
  v35[0] = @"subscription";
  v35[1] = @"1.0";
  v34[2] = @"version";
  v34[3] = @"dslIdentifiers";
  v35[2] = &unk_26D209C08;
  v35[3] = v3;
  v34[4] = @"dsls";
  v35[4] = v24;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:5];

  return v20;
}

- (BMDistributedContextSubscribeMessage)initWithSubscriptions:(id)a3 localDevice:(id)a4 messageIntent:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)BMDistributedContextSubscribeMessage;
  v11 = [(BMDistributedContextSubscribeMessage *)&v27 init];
  uint64_t v12 = v11;
  if (v11)
  {
    id v22 = v10;
    objc_storeStrong((id *)&v11->_subscriptions, a3);
    objc_storeStrong((id *)&v12->_localDevice, a4);
    v12->_messageIntent = a5;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v23 + 1) + 8 * v17) configuration];
          uint64_t v19 = [v18 wakeState];
          int v20 = [v19 BOOLValue];

          if (v20) {
            v12->_shouldWake = 1;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }

    id v10 = v22;
  }

  return v12;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSString)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(id)a3
{
}

- (NSString)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
}

- (unint64_t)messageIntent
{
  return self->_messageIntent;
}

- (void)setMessageIntent:(unint64_t)a3
{
  self->_messageIntent = a3;
}

- (BOOL)shouldWake
{
  return self->_shouldWake;
}

- (void)setShouldWake:(BOOL)a3
{
  self->_shouldWake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

- (void)initWithMessageDictionary:(void *)a1 fromRemoteDevice:localDevice:.cold.1(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"messageVersion"];
  OUTLINED_FUNCTION_0_2(&dword_2201A2000, v2, v3, "Incoming subscription is dropped. This message verson is not supported %@", v4, v5, v6, v7, 2u);
}

@end