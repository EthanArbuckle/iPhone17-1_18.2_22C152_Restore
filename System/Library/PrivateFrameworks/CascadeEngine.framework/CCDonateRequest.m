@interface CCDonateRequest
- (BMAccessAssertion)accessAssertion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDonateRequest:(id)a3;
- (CCDevice)remoteDevice;
- (CCDonateRequest)initWithConnection:(id)a3 manager:(id)a4 itemType:(unsigned __int16)a5 encodedDescriptors:(id)a6 personaIdentifier:(id)a7 version:(unint64_t)a8 validity:(id)a9 remoteDevice:(id)a10 accessAssertion:(id)a11;
- (NSString)encodedDescriptors;
- (NSString)personaIdentifier;
- (NSString)validity;
- (id)_connectionTypeString;
- (id)description;
- (unint64_t)hash;
- (unint64_t)version;
- (unsigned)itemType;
- (unsigned)requestId;
- (void)handle;
- (void)terminateWithType:(int64_t)a3;
- (void)timeout;
@end

@implementation CCDonateRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_encodedDescriptors, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->_connection);
}

- (CCDonateRequest)initWithConnection:(id)a3 manager:(id)a4 itemType:(unsigned __int16)a5 encodedDescriptors:(id)a6 personaIdentifier:(id)a7 version:(unint64_t)a8 validity:(id)a9 remoteDevice:(id)a10 accessAssertion:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v30 = a6;
  id v29 = a7;
  id v28 = a9;
  id v27 = a10;
  id v26 = a11;
  v32.receiver = self;
  v32.super_class = (Class)CCDonateRequest;
  v19 = [(CCDonateRequest *)&v32 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_connection, v17);
    objc_storeWeak((id *)&v20->_manager, v18);
    v20->_itemType = a5;
    objc_storeStrong((id *)&v20->_encodedDescriptors, a6);
    objc_storeStrong((id *)&v20->_personaIdentifier, a7);
    v20->_version = a8;
    objc_storeStrong((id *)&v20->_validity, a9);
    v20->_requestId = atomic_fetch_add(requestCount, 1u);
    v21 = __biome_log_for_category();
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    v23 = __biome_log_for_category();
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_249B69000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "donateRequestQueued", " enableTelemetry=YES ", buf, 2u);
    }

    v20->_requestQueuedSignpostId = v22;
    objc_storeStrong((id *)&v20->_remoteDevice, a10);
    objc_storeStrong((id *)&v20->_accessAssertion, a11);
  }

  return v20;
}

- (id)description
{
  v2 = NSString;
  uint64_t requestId = self->_requestId;
  v4 = [(CCDonateRequest *)self _connectionTypeString];
  v5 = CCDonateServiceRequestDescription();
  v6 = [v2 stringWithFormat:@"#%u [%@] %@", requestId, v4, v5];

  return v6;
}

- (void)handle
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = __biome_log_for_category();
  v4 = v3;
  os_signpost_id_t requestQueuedSignpostId = self->_requestQueuedSignpostId;
  if (requestQueuedSignpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = [(CCDonateRequest *)self _connectionTypeString];
    int itemType = self->_itemType;
    *(_DWORD *)buf = 138543618;
    id v18 = v6;
    __int16 v19 = 1026;
    int v20 = itemType;
    _os_signpost_emit_with_name_impl(&dword_249B69000, v4, OS_SIGNPOST_INTERVAL_END, requestQueuedSignpostId, "donateRequestQueued", " requestType=%{public,signpost.telemetry:string1}@  itemType=%{public,signpost.telemetry:number1}d ", buf, 0x12u);
  }
  v8 = __biome_log_for_category();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = __biome_log_for_category();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_249B69000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "donateRequestHandled", " enableTelemetry=YES ", buf, 2u);
  }

  self->_requestHandledSignpostId = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  int v13 = [WeakRetained isAlive];

  if (v13)
  {
    personaIdentifier = self->_personaIdentifier;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __25__CCDonateRequest_handle__block_invoke;
    v16[3] = &unk_265277CC0;
    v16[4] = self;
    [MEMORY[0x263F29E78] runAsPersonaIdentifier:personaIdentifier block:v16];
  }
  else
  {
    v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl(&dword_249B69000, v15, OS_LOG_TYPE_DEFAULT, "Connection is invalidated for request %@", buf, 0xCu);
    }

    [(CCDonateRequest *)self terminateWithType:1];
  }
}

void __25__CCDonateRequest_handle__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained resume];
}

- (void)terminateWithType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = __biome_log_for_category();
  v6 = v5;
  os_signpost_id_t requestHandledSignpostId = self->_requestHandledSignpostId;
  if (requestHandledSignpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int itemType = self->_itemType;
    uint64_t v9 = [(CCDonateRequest *)self _connectionTypeString];
    v10 = (void *)v9;
    if ((unint64_t)a3 > 4) {
      v11 = @"Undefined";
    }
    else {
      v11 = off_265278548[a3];
    }
    v13[0] = 67240706;
    v13[1] = itemType;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_signpost_emit_with_name_impl(&dword_249B69000, v6, OS_SIGNPOST_INTERVAL_END, requestHandledSignpostId, "donateRequestHandled", " itemType=%{public,signpost.telemetry:number1}d  requestType=%{public,signpost.telemetry:string1}@  result=%{public,signpost.telemetry:string2}@ ", (uint8_t *)v13, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained completeRequest:self];
}

- (id)_connectionTypeString
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if ([WeakRetained isXPC]) {
    v3 = @"XPC";
  }
  else {
    v3 = @"In Process";
  }
  v4 = v3;

  return v4;
}

- (BMAccessAssertion)accessAssertion
{
  return self->_accessAssertion;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)validity
{
  return self->_validity;
}

- (CCDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (NSString)encodedDescriptors
{
  return self->_encodedDescriptors;
}

- (unsigned)requestId
{
  return self->_requestId;
}

- (void)timeout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained timeout];

  id v4 = objc_loadWeakRetained((id *)&self->_manager);
  [v4 completeRequest:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCDonateRequest *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCDonateRequest *)self isEqualToDonateRequest:v5];

  return v6;
}

- (BOOL)isEqualToDonateRequest:(id)a3
{
  id v6 = a3;
  unsigned int requestId = self->_requestId;
  if (requestId != [v6 requestId]
    || (int itemType = self->_itemType, itemType != [v6 itemType]))
  {
    char v13 = 0;
    goto LABEL_9;
  }
  encodedDescriptors = self->_encodedDescriptors;
  v10 = encodedDescriptors;
  if (!encodedDescriptors)
  {
    uint64_t v11 = [v6 encodedDescriptors];
    if (!v11)
    {
      v36 = 0;
      int v12 = 0;
      goto LABEL_12;
    }
    v36 = (void *)v11;
    v10 = self->_encodedDescriptors;
  }
  v3 = [v6 encodedDescriptors];
  if (![(NSString *)v10 isEqual:v3])
  {
    char v13 = 0;
LABEL_44:

    goto LABEL_45;
  }
  int v12 = 1;
LABEL_12:
  personaIdentifier = self->_personaIdentifier;
  __int16 v16 = personaIdentifier;
  if (!personaIdentifier)
  {
    uint64_t v17 = [v6 personaIdentifier];
    if (!v17)
    {
      unint64_t version = self->_version;
      int v19 = 0;
      v35 = 0;
      char v13 = 0;
      if (version != [v6 version]) {
        goto LABEL_47;
      }
      goto LABEL_21;
    }
    v35 = (void *)v17;
    __int16 v16 = self->_personaIdentifier;
  }
  id v4 = [v6 personaIdentifier];
  if (([(NSString *)v16 isEqual:v4] & 1) == 0)
  {

    char v13 = 0;
    goto LABEL_42;
  }
  unint64_t v18 = self->_version;
  if (v18 != [v6 version])
  {
    char v13 = 0;
    goto LABEL_41;
  }
  int v19 = 1;
LABEL_21:
  validity = self->_validity;
  os_signpost_id_t v22 = validity;
  if (!validity)
  {
    uint64_t v23 = [v6 validity];
    if (!v23)
    {
      int v32 = v19;
      int v33 = 0;
      v31 = 0;
LABEL_28:
      remoteDevice = self->_remoteDevice;
      v25 = remoteDevice;
      if (!remoteDevice)
      {
        uint64_t v26 = [v6 remoteDevice];
        if (!v26)
        {
          id v28 = 0;
          char v13 = 1;
          goto LABEL_37;
        }
        uint64_t v29 = v26;
        v25 = self->_remoteDevice;
      }
      id v27 = objc_msgSend(v6, "remoteDevice", v29, v31);
      char v13 = [(CCDevice *)v25 isEqual:v27];

      if (remoteDevice)
      {
        if (!v33)
        {
          int v19 = v32;
          goto LABEL_39;
        }
        int v19 = v32;
        goto LABEL_38;
      }
      id v28 = v30;
LABEL_37:

      int v19 = v32;
      if ((v33 & 1) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    v31 = (void *)v23;
    os_signpost_id_t v22 = self->_validity;
  }
  v34 = [v6 validity];
  if (-[NSString isEqual:](v22, "isEqual:"))
  {
    int v32 = v19;
    int v33 = 1;
    goto LABEL_28;
  }
  char v13 = 0;
LABEL_38:

LABEL_39:
  if (validity)
  {
    if (!v19) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }

  if (v19) {
LABEL_41:
  }

LABEL_42:
  if (personaIdentifier)
  {
    if (!v12) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_47:

  if (v12) {
    goto LABEL_44;
  }
LABEL_45:
  if (!encodedDescriptors) {

  }
LABEL_9:
  return v13;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInt:self->_requestId];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedShort:self->_itemType];
  uint64_t v6 = [v5 hash] ^ v4;
  NSUInteger v7 = [(NSString *)self->_encodedDescriptors hash];
  v8 = [NSNumber numberWithUnsignedLongLong:self->_version];
  uint64_t v9 = v6 ^ v7 ^ [v8 hash];
  NSUInteger v10 = [(NSString *)self->_validity hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_personaIdentifier hash];
  unint64_t v12 = v9 ^ v11 ^ [(CCDevice *)self->_remoteDevice hash];

  return v12;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

@end