@interface MGRemoteQueryClientTarget
+ (MGRemoteQueryClientTarget)targetWithEndpoint:(id)a3 txtRecord:(id)a4;
- (BOOL)_parseTXTRecord:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)homeHash;
- (OS_nw_endpoint)endpoint;
- (id)_initWithEndpoint:(id)a3 txtRecord:(id)a4;
- (id)description;
- (unint64_t)hash;
- (unint64_t)protocolVersion;
- (void)_parseTXTRecord:(id)a3 forVersion:(id)a4 result:(id)a5;
@end

@implementation MGRemoteQueryClientTarget

+ (MGRemoteQueryClientTarget)targetWithEndpoint:(id)a3 txtRecord:(id)a4
{
  v6 = a3;
  id v7 = a4;
  if (nw_endpoint_get_type(v6) == nw_endpoint_type_bonjour_service) {
    v8 = (void *)[objc_alloc((Class)a1) _initWithEndpoint:v6 txtRecord:v7];
  }
  else {
    v8 = 0;
  }

  return (MGRemoteQueryClientTarget *)v8;
}

- (id)_initWithEndpoint:(id)a3 txtRecord:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MGRemoteQueryClientTarget;
  v9 = [(MGRemoteQueryClientTarget *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpoint, a3);
    v10->_protocolVersion = 0;
    if (![(MGRemoteQueryClientTarget *)v10 _parseTXTRecord:v8])
    {

      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(MGRemoteQueryClientTarget *)self protocolVersion];
  id v7 = [(MGRemoteQueryClientTarget *)self endpoint];
  id v8 = [v3 stringWithFormat:@"<%@: %p, _protocolVersion=%lu, _endpoint=%@>", v5, self, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v2 = [(MGRemoteQueryClientTarget *)self endpoint];
  v3 = [v2 description];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MGRemoteQueryClientTarget *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    char v17 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = v5;
    id v7 = NSString;
    id v8 = [(MGRemoteQueryClientTarget *)self endpoint];
    v9 = [v7 stringWithUTF8String:nw_endpoint_get_bonjour_service_name(v8)];

    v10 = NSString;
    v11 = [(MGRemoteQueryClientTarget *)v6 endpoint];
    objc_super v12 = [v10 stringWithUTF8String:nw_endpoint_get_bonjour_service_name(v11)];

    unint64_t v13 = [(MGRemoteQueryClientTarget *)self protocolVersion];
    if (v13 == [(MGRemoteQueryClientTarget *)v6 protocolVersion])
    {
      v14 = [(MGRemoteQueryClientTarget *)self endpoint];
      nw_endpoint_type_t type = nw_endpoint_get_type(v14);
      v16 = [(MGRemoteQueryClientTarget *)v6 endpoint];
      if (type == nw_endpoint_get_type(v16)) {
        char v17 = [v9 isEqualToString:v12];
      }
      else {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
LABEL_7:
    char v17 = 0;
  }
LABEL_13:

  return v17;
}

- (BOOL)_parseTXTRecord:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  unint64_t v4 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke;
  v19[3] = &unk_26485E930;
  v19[4] = &v24;
  v19[5] = &v28;
  [(MGRemoteQueryClientTarget *)self _parseTXTRecord:v4 forVersion:0x26DD64518 result:v19];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke_2;
  v18[3] = &unk_26485E930;
  v18[4] = &v20;
  v18[5] = &v28;
  [(MGRemoteQueryClientTarget *)self _parseTXTRecord:v4 forVersion:0x26DD644F8 result:v18];
  if (!*((unsigned char *)v29 + 24)) {
    goto LABEL_11;
  }
  unint64_t v5 = v21[3];
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  if (v5 <= (v25[3] != 0))
  {
    self->_unint64_t protocolVersion = 1;
    unint64_t v6 = MGLogForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(MGRemoteQueryClientTarget *)self endpoint];
      unint64_t protocolVersion = self->_protocolVersion;
      uint64_t v12 = v21[3];
      uint64_t v13 = v25[3];
      *(_DWORD *)buf = 134219522;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v10;
      __int16 v36 = 2048;
      unint64_t v37 = protocolVersion;
      __int16 v38 = 2048;
      uint64_t v39 = v12;
      __int16 v40 = 2048;
      uint64_t v41 = v13;
      __int16 v42 = 2048;
      uint64_t v43 = 1;
      __int16 v44 = 2048;
      uint64_t v45 = 1;
      _os_log_impl(&dword_229257000, v6, OS_LOG_TYPE_DEFAULT, "%p target %@ compatible version using %lu, peer(%lu->%lu) me(%lu->%lu)", buf, 0x48u);
    }
  }
  else
  {
    *((unsigned char *)v29 + 24) = 0;
    unint64_t v6 = MGLogForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(MGRemoteQueryClientTarget *)self endpoint];
      unint64_t v8 = v21[3];
      uint64_t v9 = v25[3];
      *(_DWORD *)buf = 134219266;
      v33 = self;
      __int16 v34 = 2112;
      v35 = v7;
      __int16 v36 = 2048;
      unint64_t v37 = v8;
      __int16 v38 = 2048;
      uint64_t v39 = v9;
      __int16 v40 = 2048;
      uint64_t v41 = 1;
      __int16 v42 = 2048;
      uint64_t v43 = 1;
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p target %@ incompatible version, peer(%lu->%lu) me(%lu->%lu)", buf, 0x3Eu);
    }
  }

  if (*((unsigned char *)v29 + 24))
  {
    v14 = (const char *)[@"h" UTF8String];
    access_value[0] = MEMORY[0x263EF8330];
    access_value[1] = 3221225472;
    access_value[2] = __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke_2;
    access_value[3] = &unk_26485E958;
    access_value[4] = self;
    nw_txt_record_access_key(v4, v14, access_value);
    BOOL v15 = *((unsigned char *)v29 + 24) != 0;
  }
  else
  {
LABEL_11:
    BOOL v15 = 0;
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

uint64_t __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke(uint64_t result, char a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke_2(uint64_t result, char a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __45__MGRemoteQueryClientTarget__parseTXTRecord___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  BOOL v5 = a3 != 4 || a5 == 0;
  uint64_t v6 = !v5;
  if (!v5)
  {
    uint64_t v8 = [[NSString alloc] initWithBytes:a4 length:a5 encoding:4];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = v8;
  }
  return v6;
}

- (void)_parseTXTRecord:(id)a3 forVersion:(id)a4 result:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, BOOL, void))a5;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v10 = v8;
  v11 = (const char *)[v10 UTF8String];
  access_value[0] = MEMORY[0x263EF8330];
  access_value[1] = 3221225472;
  access_value[2] = __63__MGRemoteQueryClientTarget__parseTXTRecord_forVersion_result___block_invoke;
  access_value[3] = &unk_26485E980;
  access_value[4] = &v14;
  BOOL v12 = nw_txt_record_access_key(v7, v11, access_value);
  v9[2](v9, v12, v15[3]);
  _Block_object_dispose(&v14, 8);
}

BOOL __63__MGRemoteQueryClientTarget__parseTXTRecord_forVersion_result___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  BOOL result = 0;
  if (a3 == 4)
  {
    if (a5)
    {
      uint64_t v6 = (void *)[[NSString alloc] initWithBytes:a4 length:a5 encoding:4];
      id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 unsignedIntegerValue];
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

      if (v8) {
        return 1;
      }
    }
  }
  return result;
}

- (OS_nw_endpoint)endpoint
{
  return self->_endpoint;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)homeHash
{
  return self->_homeHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeHash, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end