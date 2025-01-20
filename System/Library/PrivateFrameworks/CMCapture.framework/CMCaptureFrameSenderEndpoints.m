@interface CMCaptureFrameSenderEndpoints
- (BOOL)_pruneStalePIDsFromDictionary;
- (BOOL)addEndpoint:(id)a3 endpointUniqueID:(id)a4 endpointType:(id)a5 endpointPID:(int)a6 endpointProxyPID:(int)a7 endpointAuditToken:(id)a8 endpointProxyAuditToken:(id)a9 endpointCameraUniqueID:(id)a10;
- (BOOL)removeAllEndpointsWithPID:(int)a3;
- (BOOL)removeAllEndpointsWithPID:(int)a3 pruneStalePIDs:(BOOL)a4;
- (BOOL)removeEndpointWithUniqueID:(id)a3;
- (CMCaptureFrameSenderEndpoints)init;
- (CMCaptureFrameSenderEndpoints)initWithXPCArrayOfFrameSenderEndpoints:(id)a3;
- (NSDictionary)endpointsByPID;
- (id)createXPCArrayOfFrameSenderEndpoints;
- (void)dealloc;
@end

@implementation CMCaptureFrameSenderEndpoints

- (BOOL)addEndpoint:(id)a3 endpointUniqueID:(id)a4 endpointType:(id)a5 endpointPID:(int)a6 endpointProxyPID:(int)a7 endpointAuditToken:(id)a8 endpointProxyAuditToken:(id)a9 endpointCameraUniqueID:(id)a10
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v14 = [(CMCaptureFrameSenderEndpoints *)self _pruneStalePIDsFromDictionary];
  uint64_t v15 = [NSNumber numberWithInt:v10];
  v16 = (void *)[(NSMutableDictionary *)self->_frameSenderEndpoints objectForKeyedSubscript:v15];
  if (!v16)
  {
    v16 = (void *)[MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)self->_frameSenderEndpoints setObject:v16 forKeyedSubscript:v15];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
LABEL_5:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v27 != v19) {
        objc_enumerationMutation(v16);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v20), "objectForKeyedSubscript:", @"endpoint-uid"), "isEqualToString:", a4))break; {
      if (v18 == ++v20)
      }
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v18) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    cfse_addEndpointInfo(v15, [NSNumber numberWithInt:a7], (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a8, (uint64_t)a9, (__CFString *)a10, v16);
    if (dword_1EB4C5310)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      BOOL v14 = 1;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      return 1;
    }
  }
  return v14;
}

- (BOOL)_pruneStalePIDsFromDictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[(NSMutableDictionary *)self->_frameSenderEndpoints allKeys];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) intValue];
        v18[0] = 0;
        objc_msgSend(MEMORY[0x1E4F963E8], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E4F963F8], "identifierWithPid:", v8), v18);
        if (v18[0] && [v18[0] code] == 3)
        {
          if (dword_1EB4C5310)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v5 |= -[CMCaptureFrameSenderEndpoints removeAllEndpointsWithPID:pruneStalePIDs:](self, "removeAllEndpointsWithPID:pruneStalePIDs:", v8, 0, v11, v12);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (CMCaptureFrameSenderEndpoints)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMCaptureFrameSenderEndpoints;
  v2 = [(CMCaptureFrameSenderEndpoints *)&v4 init];
  if (v2) {
    v2->_frameSenderEndpoints = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (CMCaptureFrameSenderEndpoints)initWithXPCArrayOfFrameSenderEndpoints:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMCaptureFrameSenderEndpoints;
  objc_super v4 = [(CMCaptureFrameSenderEndpoints *)&v7 init];
  if (v4)
  {
    v4->_frameSenderEndpoints = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __72__CMCaptureFrameSenderEndpoints_initWithXPCArrayOfFrameSenderEndpoints___block_invoke;
    applier[3] = &unk_1E5C245F8;
    applier[4] = v4;
    xpc_array_apply(a3, applier);
  }
  return v4;
}

uint64_t __72__CMCaptureFrameSenderEndpoints_initWithXPCArrayOfFrameSenderEndpoints___block_invoke(int a1, int a2, xpc_object_t xdict)
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMCaptureFrameSenderEndpoints;
  [(CMCaptureFrameSenderEndpoints *)&v3 dealloc];
}

- (NSDictionary)endpointsByPID
{
  [(CMCaptureFrameSenderEndpoints *)self _pruneStalePIDsFromDictionary];
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_frameSenderEndpoints copy];
  return (NSDictionary *)v3;
}

- (BOOL)removeAllEndpointsWithPID:(int)a3
{
  return [(CMCaptureFrameSenderEndpoints *)self removeAllEndpointsWithPID:*(void *)&a3 pruneStalePIDs:1];
}

- (BOOL)removeAllEndpointsWithPID:(int)a3 pruneStalePIDs:(BOOL)a4
{
  HIDWORD(v14) = a4;
  uint64_t v4 = *(void *)&a3;
  int v5 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_frameSenderEndpoints, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"));
  char v7 = v6 != 0;
  if (v6) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_frameSenderEndpoints, "setObject:forKeyedSubscript:", 0, [NSNumber numberWithInt:v4]);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)[(NSMutableDictionary *)v5->_frameSenderEndpoints allKeys];
  uint64_t v18 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v22;
    long long v17 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        uint64_t v20 = v8;
        v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v5->_frameSenderEndpoints, "objectForKeyedSubscript:");
        if ([v9 count])
        {
          unint64_t v10 = 0;
          do
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "objectForKeyedSubscript:", @"endpoint-proxy-pid"), "intValue") == v4)
            {
              if (dword_1EB4C5310)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(v9, "removeObjectAtIndex:", v10, v13, v14);
              char v7 = 1;
            }
            else
            {
              ++v10;
            }
          }
          while (v10 < [v9 count]);
        }
        int v5 = v17;
        if (![v9 count]) {
          [(NSMutableDictionary *)v17->_frameSenderEndpoints setObject:0 forKeyedSubscript:v19];
        }
        ++v8;
      }
      while (v20 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }
  if (HIDWORD(v14)) {
    v7 |= [(CMCaptureFrameSenderEndpoints *)v5 _pruneStalePIDsFromDictionary];
  }
  return v7 & 1;
}

- (BOOL)removeEndpointWithUniqueID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v5 = (void *)[(NSMutableDictionary *)self->_frameSenderEndpoints allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = (void *)[(NSMutableDictionary *)self->_frameSenderEndpoints objectForKeyedSubscript:v10];
        if ([v11 count])
        {
          uint64_t v12 = 0;
          while (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", v12), "objectForKeyedSubscript:", @"endpoint-uid"), "isEqualToString:", a3))
          {
            if (++v12 >= (unint64_t)[v11 count]) {
              goto LABEL_10;
            }
          }
          [v11 removeObjectAtIndex:v12];
          if (dword_1EB4C5310)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (!objc_msgSend(v11, "count", v16, v17)) {
            [(NSMutableDictionary *)self->_frameSenderEndpoints setObject:0 forKeyedSubscript:v10];
          }
          char v13 = 1;
          return v13 | [(CMCaptureFrameSenderEndpoints *)self _pruneStalePIDsFromDictionary];
        }
LABEL_10:
        ;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      char v13 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v13 = 0;
  }
  return v13 | [(CMCaptureFrameSenderEndpoints *)self _pruneStalePIDsFromDictionary];
}

- (id)createXPCArrayOfFrameSenderEndpoints
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_array_create(0, 0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)[(NSMutableDictionary *)self->_frameSenderEndpoints allValues];
  uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v4;
        int v5 = *(void **)(*((void *)&v24 + 1) + 8 * v4);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v21;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v21 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
              xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
              uint64_t v12 = (void *)[v10 objectForKeyedSubscript:@"endpoint"];
              if (v10) {
                xpc_dictionary_set_value(v11, "endpoint", v12);
              }
              if ([v10 objectForKeyedSubscript:@"endpoint-uid"]) {
                FigXPCMessageSetCFString();
              }
              if ([v10 objectForKeyedSubscript:@"endpoint-type"]) {
                FigXPCMessageSetCFString();
              }
              char v13 = (void *)[v10 objectForKeyedSubscript:@"endpoint-pid"];
              if (v13) {
                xpc_dictionary_set_int64(v11, "endpoint-pid", (int)[v13 intValue]);
              }
              uint64_t v14 = (void *)[v10 objectForKeyedSubscript:@"endpoint-proxy-pid"];
              if (v14) {
                xpc_dictionary_set_int64(v11, "endpoint-proxy-pid", (int)[v14 intValue]);
              }
              if ([v10 objectForKeyedSubscript:@"endpoint-audit-token"]) {
                FigXPCMessageSetCFData();
              }
              if ([v10 objectForKeyedSubscript:@"endpoint-proxy-audit-token"]) {
                FigXPCMessageSetCFData();
              }
              if ([v10 objectForKeyedSubscript:@"endpoint-camera-uid"]) {
                FigXPCMessageSetCFString();
              }
              xpc_array_append_value(v3, v11);
              xpc_release(v11);
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v7);
        }
        uint64_t v4 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }
  return v3;
}

@end