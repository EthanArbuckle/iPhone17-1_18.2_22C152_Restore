@interface BMComputeXPCSubscription
+ (BOOL)supportsSecureCoding;
+ (id)storageForIdentifier:(id)a3;
- (BMComputeXPCSubscription)initWithCoder:(id)a3;
- (BMComputeXPCSubscription)initWithIdentifier:(id)a3 client:(id)a4 createdAt:(id)a5 waking:(BOOL)a6 DSLGraph:(id)a7 subscriber:(id)a8 block:(id)a9;
- (BMComputeXPCSubscription)initWithIdentifier:(id)a3 client:(id)a4 waking:(BOOL)a5 DSLGraph:(id)a6 block:(id)a7;
- (BMComputeXPCSubscription)initWithToken:(unint64_t)a3 descriptor:(id)a4;
- (BMDSL)graph;
- (BMDSLSubscriber)subscriber;
- (BOOL)isUnclaimed;
- (BOOL)pendingDemand;
- (BOOL)waking;
- (NSDate)createdAt;
- (NSDate)initialBookmarkTimestamp;
- (NSSet)postMigrationStreamIdentifiers;
- (NSSet)streamIdentifiers;
- (NSString)client;
- (NSString)identifier;
- (NSString)uniqueIdentifier;
- (NSString)useCase;
- (NSXPCConnection)connection;
- (id)XPCEvent;
- (id)block;
- (id)description;
- (id)fetchBookmarkFromStorage:(id)a3 error:(id *)a4;
- (id)startEvent;
- (unint64_t)token;
- (void)XPCEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setClient:(id)a3;
- (void)setConnection:(id)a3;
- (void)setInitialBookmarkTimestamp:(id)a3;
- (void)setPendingDemand:(BOOL)a3;
@end

@implementation BMComputeXPCSubscription

- (id)fetchBookmarkFromStorage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(BMComputeXPCSubscription *)self identifier];
  v8 = [(BMComputeXPCSubscription *)self client];
  int v9 = [v6 checkExistenceOfBookmarkForSubscriptionWithIdentifier:v7 client:v8];

  if (v9)
  {
    id v10 = [(BMComputeXPCSubscription *)self identifier];
    v11 = [(BMComputeXPCSubscription *)self client];
    v12 = [v6 readBookmarkForSubscriptionWithIdentifier:v10 client:v11 error:a4];
  }
  else
  {
    v13 = [(BMComputeXPCSubscription *)self graph];
    v14 = [(BMComputeXPCSubscription *)self initialBookmarkTimestamp];
    id v18 = 0;
    v12 = BMDSLGetBookmarkForDate(v13, v14, &v18);
    id v10 = v18;

    v15 = [(BMComputeXPCSubscription *)self identifier];
    v16 = [(BMComputeXPCSubscription *)self client];
    [v6 writeBookmark:v12 forSubscriptionWithIdentifier:v15 client:v16];

    if (a4) {
      *a4 = v10;
    }
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)client
{
  return self->_client;
}

- (NSSet)postMigrationStreamIdentifiers
{
  return self->_postMigrationStreamIdentifiers;
}

- (id)block
{
  return self->_block;
}

- (BMDSLSubscriber)subscriber
{
  return self->_subscriber;
}

- (BMDSL)graph
{
  return self->_graph;
}

- (BOOL)waking
{
  return self->_waking;
}

- (unint64_t)token
{
  return self->_token;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (id)startEvent
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F502A8]);
    v3 = [v1 client];
    v4 = [v1 identifier];
    v5 = [v1 useCase];
    id v1 = (id)[v2 initWithClient:v3 identifier:v4 useCase:v5 starting:1];
  }

  return v1;
}

- (BMComputeXPCSubscription)initWithIdentifier:(id)a3 client:(id)a4 waking:(BOOL)a5 DSLGraph:(id)a6 block:(id)a7
{
  BOOL v8 = a5;
  v12 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 now];
  id v18 = [(BMComputeXPCSubscription *)self initWithIdentifier:v16 client:v15 createdAt:v17 waking:v8 DSLGraph:v14 subscriber:0 block:v13];

  return v18;
}

- (BMComputeXPCSubscription)initWithIdentifier:(id)a3 client:(id)a4 createdAt:(id)a5 waking:(BOOL)a6 DSLGraph:(id)a7 subscriber:(id)a8 block:(id)a9
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v57 = a8;
  id v19 = a9;
  if (BMIdentifierIsPathSafe())
  {
    v62.receiver = self;
    v62.super_class = (Class)BMComputeXPCSubscription;
    v20 = [(BMComputeXPCSubscription *)&v62 init];
    if (v20)
    {
      aBlock = v19;
      id v55 = v17;
      uint64_t v21 = [v15 copy];
      identifier = v20->_identifier;
      v20->_identifier = (NSString *)v21;

      id v56 = v16;
      uint64_t v23 = [v16 copy];
      client = v20->_client;
      v20->_client = (NSString *)v23;

      v25 = [(NSString *)v20->_client stringByAppendingString:@":"];
      uint64_t v26 = [v25 stringByAppendingString:v15];
      uniqueIdentifier = v20->_uniqueIdentifier;
      v20->_uniqueIdentifier = (NSString *)v26;

      v20->_waking = a6;
      objc_storeStrong((id *)&v20->_graph, a7);
      objc_storeStrong((id *)&v20->_subscriber, a8);
      v54 = v18;
      uint64_t v28 = [v18 rootStreamIdentifiers];
      streamIdentifiers = v20->_streamIdentifiers;
      v20->_streamIdentifiers = (NSSet *)v28;

      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v31 = v20->_streamIdentifiers;
      uint64_t v32 = [(NSSet *)v31 countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v59 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            uint64_t v37 = BMBiomeLibraryStreamIdentifierForPremigratedStreamIdentifier();
            v38 = (void *)v37;
            if (v37) {
              v39 = (void *)v37;
            }
            else {
              v39 = v36;
            }
            id v40 = v39;

            [v30 addObject:v40];
          }
          uint64_t v33 = [(NSSet *)v31 countByEnumeratingWithState:&v58 objects:v63 count:16];
        }
        while (v33);
      }

      objc_storeStrong((id *)&v20->_postMigrationStreamIdentifiers, v30);
      id v19 = aBlock;
      v41 = _Block_copy(aBlock);
      id block = v20->_block;
      v20->_id block = v41;

      objc_storeStrong((id *)&v20->_createdAt, a5);
      objc_storeStrong((id *)&v20->_initialBookmarkTimestamp, a5);
      connection = v20->_connection;
      v20->_connection = 0;

      v20->_pendingDemand = 0;
      v20->_token = 0;
      id v18 = v54;
      v44 = [v54 streamPublishers];
      if ((unint64_t)[v44 count] >= 2)
      {
        v45 = __biome_log_for_category();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[BMComputeXPCSubscription initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:](v45);
        }
      }
      v46 = [v44 allObjects];
      v47 = [v46 firstObject];
      uint64_t v48 = [v47 useCase];
      useCase = v20->_useCase;
      v20->_useCase = (NSString *)v48;

      id v17 = v55;
      id v16 = v56;
    }
    self = v20;
    v50 = self;
  }
  else
  {
    v51 = __biome_log_for_category();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCSubscription initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:]();
    }

    v50 = 0;
  }

  return v50;
}

- (BMComputeXPCSubscription)initWithToken:(unint64_t)a3 descriptor:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  string = xpc_dictionary_get_string(v6, "identifier");
  if (string)
  {
    BOOL v8 = string;
    int v9 = [NSString stringWithUTF8String:string];
    char IsPathSafe = BMIdentifierIsPathSafe();

    if (IsPathSafe)
    {
      v11 = [NSString stringWithUTF8String:v8];
      v12 = xpc_dictionary_get_string(v6, "client");
      if (!v12)
      {
        uint64_t v28 = (void *)MEMORY[0x192FB19F0](v6);
        v29 = __biome_log_for_category();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[BMComputeXPCSubscription initWithToken:descriptor:]();
        }

        free(v28);
        v27 = 0;
        goto LABEL_45;
      }
      id v13 = [NSString stringWithUTF8String:v12];
      xpc_dictionary_get_double(v6, "createdAt");
      id v14 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
      id v15 = xpc_dictionary_get_dictionary(v6, "graph");
      if (v15)
      {
        id v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v45 = __biome_log_for_category();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            -[BMComputeXPCSubscription initWithToken:descriptor:].cold.6();
          }

          v27 = 0;
          goto LABEL_44;
        }
        id v17 = v14;
        v51 = v13;
        id v55 = 0;
        id v18 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v16 options:0 error:&v55];
        id v19 = v55;
        v20 = v19;
        if (!v18
          || v19
          || ([MEMORY[0x1E4F4FA48] unarchiveDSLFromData:v18],
              (uint64_t v21 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v22 = __biome_log_for_category();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v11;
            __int16 v57 = 2112;
            long long v58 = v20;
            _os_log_impl(&dword_18E67D000, v22, OS_LOG_TYPE_DEFAULT, "BMComputeXPCSubscription unable to unarchive BMDSL as JSON archived object, falling back to legacy dictionary-based format. Subscription: %@; error: %@",
              buf,
              0x16u);
          }

          id v54 = 0;
          uint64_t v21 = [objc_alloc(MEMORY[0x1E4F4FA10]) initWithDictionary:v16 error:&v54];
          id v23 = v54;
          v24 = v23;
          if (!v21 || v23)
          {
            v47 = __biome_log_for_category();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              -[BMComputeXPCSubscription initWithToken:descriptor:].cold.4();
            }

            v27 = 0;
            id v16 = (void *)v21;
            id v13 = v51;
            id v14 = v17;
            goto LABEL_44;
          }
        }

        id v16 = (void *)v21;
      }
      else
      {
        id v17 = v14;
        v51 = v13;
        *(void *)buf = 0;
        data = xpc_dictionary_get_data(v6, "graphData", (size_t *)buf);
        id v31 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v32 = (void *)[v31 initWithBytes:data length:*(void *)buf];
        uint64_t v33 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v34 = [MEMORY[0x1E4F4FA28] allowed];
        id v53 = 0;
        id v16 = [v33 unarchivedObjectOfClasses:v34 fromData:v32 error:&v53];
        id v35 = v53;

        if (!v16 || v35)
        {
          v46 = __biome_log_for_category();
          id v14 = v17;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            -[BMComputeXPCSubscription initWithToken:descriptor:].cold.4();
          }

          v27 = 0;
          goto LABEL_43;
        }
      }
      id v14 = v17;
      *(void *)buf = 0;
      v36 = xpc_dictionary_get_data(v6, "subscriber", (size_t *)buf);
      if (v36)
      {
        uint64_t v37 = v36;
        v50 = v17;
        id v38 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v39 = (void *)[v38 initWithBytes:v37 length:*(void *)buf];
        id v40 = (void *)MEMORY[0x1E4F28DC0];
        v41 = [MEMORY[0x1E4F4FA28] allowed];
        id v52 = 0;
        v42 = [v40 unarchivedObjectOfClasses:v41 fromData:v39 error:&v52];
        id v43 = v52;

        if (v43)
        {
          v44 = __biome_log_for_category();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[BMComputeXPCSubscription initWithToken:descriptor:]();
          }

          v27 = 0;
          id v14 = v50;
LABEL_42:

LABEL_43:
          id v13 = v51;
LABEL_44:

LABEL_45:
          goto LABEL_46;
        }

        id v14 = v50;
      }
      else
      {
        v42 = 0;
      }
      uint64_t v48 = [(BMComputeXPCSubscription *)self initWithIdentifier:v11 client:v51 createdAt:v14 waking:1 DSLGraph:v16 subscriber:v42 block:0];
      if (v48) {
        v48->_token = a3;
      }
      self = v48;
      v27 = self;
      goto LABEL_42;
    }
  }
  v25 = (void *)MEMORY[0x192FB19F0](v6);
  uint64_t v26 = __biome_log_for_category();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[BMComputeXPCSubscription initWithToken:descriptor:]();
  }

  free(v25);
  v27 = 0;
LABEL_46:

  return v27;
}

- (BOOL)isUnclaimed
{
  if ([(BMComputeXPCSubscription *)self waking]) {
    return 0;
  }
  v4 = [(BMComputeXPCSubscription *)self connection];
  BOOL v3 = v4 == 0;

  return v3;
}

- (id)XPCEvent
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v4 = [(BMComputeXPCSubscription *)self identifier];
  v5 = (const char *)[v4 UTF8String];

  if (v5) {
    xpc_dictionary_set_string(empty, "identifier", v5);
  }
  id v6 = [(BMComputeXPCSubscription *)self client];
  v7 = (const char *)[v6 UTF8String];

  if (v7) {
    xpc_dictionary_set_string(empty, "client", v7);
  }
  BOOL v8 = [(BMComputeXPCSubscription *)self createdAt];
  [v8 timeIntervalSince1970];
  xpc_dictionary_set_double(empty, "createdAt", v9);

  id v10 = (void *)MEMORY[0x1E4F28DB0];
  v11 = [(BMComputeXPCSubscription *)self graph];
  id v33 = 0;
  v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v33];
  id v13 = v33;

  if (v13)
  {
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCSubscription XPCEvent]();
    }

LABEL_9:
    id v15 = 0;
    goto LABEL_17;
  }
  id v16 = v12;
  xpc_dictionary_set_data(empty, "graphData", (const void *)[v16 bytes], objc_msgSend(v16, "length"));
  id v17 = [(BMComputeXPCSubscription *)self subscriber];

  if (v17)
  {
    id v18 = (void *)MEMORY[0x1E4F28DB0];
    id v19 = [(BMComputeXPCSubscription *)self subscriber];
    id v32 = 0;
    v20 = [v18 archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v32];
    id v21 = v32;

    if (v21)
    {
      v22 = __biome_log_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        [(BMComputeXPCSubscription *)v22 XPCEvent];
      }

      goto LABEL_9;
    }
    id v30 = v20;
    xpc_dictionary_set_data(empty, "subscriber", (const void *)[v30 bytes], objc_msgSend(v30, "length"));
  }
  id v15 = empty;
LABEL_17:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMComputeXPCSubscription)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client"];
  [v4 decodeDoubleForKey:@"createdAt"];
  v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:");
  uint64_t v8 = [v4 decodeBoolForKey:@"waking"];
  double v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"graphData"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriber"];
  uint64_t v11 = [v4 decodeInt64ForKey:@"token"];

  v12 = [(BMComputeXPCSubscription *)self initWithIdentifier:v5 client:v6 createdAt:v7 waking:v8 DSLGraph:v9 subscriber:v10 block:0];
  id v13 = v12;
  if (v12) {
    v12->_token = v11;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(BMComputeXPCSubscription *)self identifier];
  [v10 encodeObject:v4 forKey:@"identifier"];

  v5 = [(BMComputeXPCSubscription *)self client];
  [v10 encodeObject:v5 forKey:@"client"];

  id v6 = [(BMComputeXPCSubscription *)self createdAt];
  [v6 timeIntervalSince1970];
  objc_msgSend(v10, "encodeDouble:forKey:", @"createdAt");

  objc_msgSend(v10, "encodeBool:forKey:", -[BMComputeXPCSubscription waking](self, "waking"), @"waking");
  v7 = [(BMComputeXPCSubscription *)self graph];
  [v10 encodeObject:v7 forKey:@"graphData"];

  objc_msgSend(v10, "encodeInt64:forKey:", -[BMComputeXPCSubscription token](self, "token"), @"token");
  uint64_t v8 = [(BMComputeXPCSubscription *)self subscriber];

  if (v8)
  {
    double v9 = [(BMComputeXPCSubscription *)self subscriber];
    [v10 encodeObject:v9 forKey:@"subscriber"];
  }
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(BMComputeXPCSubscription *)self client];
  id v6 = [(BMComputeXPCSubscription *)self identifier];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMComputeXPCSubscription waking](self, "waking"));
  uint64_t v8 = [(BMComputeXPCSubscription *)self streamIdentifiers];
  double v9 = [(BMComputeXPCSubscription *)self graph];
  id v10 = [(BMComputeXPCSubscription *)self subscriber];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMComputeXPCSubscription token](self, "token"));
  v12 = [v3 stringWithFormat:@"<%@ %p> client: %@, identifier: %@, waking: %@, streams: %@, graph: %@, subscriber:%@, token: %@", v4, self, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

+ (id)storageForIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"BMComputeXPCSubscription.m", 313, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if (BMIdentifierIsPathSafe())
  {
    id v6 = [MEMORY[0x1E4F4FB78] localComputeDirectory];
    v7 = [MEMORY[0x1E4F4FBA0] persistent];
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];

    double v9 = [v8 stringByAppendingPathComponent:v5];
    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    uint64_t v11 = [[BMSimpleKeyValueStorage alloc] initWithURL:v10];
  }
  else
  {
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[BMComputeXPCSubscription storageForIdentifier:]();
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (void)setClient:(id)a3
{
}

- (NSSet)streamIdentifiers
{
  return self->_streamIdentifiers;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSDate)initialBookmarkTimestamp
{
  return self->_initialBookmarkTimestamp;
}

- (void)setInitialBookmarkTimestamp:(id)a3
{
}

- (BOOL)pendingDemand
{
  return self->_pendingDemand;
}

- (void)setPendingDemand:(BOOL)a3
{
  self->_pendingDemand = a3;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_initialBookmarkTimestamp, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_postMigrationStreamIdentifiers, 0);
  objc_storeStrong((id *)&self->_streamIdentifiers, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log client:createdAt:waking:DSLGraph:subscriber:block:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Error: received DSL graph with multiple upstreams, using the useCase on the first upstream", v1, 2u);
}

- (void)initWithIdentifier:client:createdAt:waking:DSLGraph:subscriber:block:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "BMComputeXPCSubscription error: provided identifier '%@' is invalid", v2, v3, v4, v5, v6);
}

- (void)initWithToken:descriptor:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Error: xpc_event subscription has invalid identifier: %s", v2, v3, v4, v5, v6);
}

- (void)initWithToken:descriptor:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Error: xpc_event subscription is missing client identifier: %s", v2, v3, v4, v5, v6);
}

- (void)initWithToken:descriptor:.cold.3()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "BMComputeXPCSubscription unable to unarchive BMDSL Subscriber for subscription: %@; error: %@");
}

- (void)initWithToken:descriptor:.cold.4()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "BMComputeXPCSubscription unable to unarchive BMDSL graph for subscription: %@; error: %@");
}

- (void)initWithToken:descriptor:.cold.6()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "BMComputeXPCSubscription unable to unarchive BMDSL graph for subscription: %@, provided graph is not a dictionary and was not able to be parsed", v2, v3, v4, v5, v6);
}

- (void)initWithToken:descriptor:.cold.7()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "xpc_event subscription %@ is missing createdAt date - and could not fetch boot time, defaulting to 30 days ago %@");
}

- (void)XPCEvent
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "BMComputeXPCSubscription error archiving graph while converting subscription to xpc event %@", v2, v3, v4, v5, v6);
}

+ (void)storageForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "BMComputeXPCSubscription unable to locate storage, invalid identifier %@", v2, v3, v4, v5, v6);
}

@end