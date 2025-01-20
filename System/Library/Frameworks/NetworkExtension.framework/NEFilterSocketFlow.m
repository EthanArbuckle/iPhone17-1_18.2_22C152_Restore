@interface NEFilterSocketFlow
+ (BOOL)supportsSecureCoding;
+ (void)writeMessageWithControlSocket:(int)a3 drop:(uint64_t)a4 socketID:(uint64_t)a5 inboundPassOffset:(uint64_t)a6 inboundPeekOffset:(uint64_t)a7 outboundPassOffset:(uint64_t)a8 outboundPeekOffset:(uint64_t)a9 statsReportFrequency:;
- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6;
- (NEFilterSocketFlow)initWithCoder:(id)a3;
- (NSString)remoteHostname;
- (NSUUID)euuid;
- (NSUUID)ruuid;
- (NSUUID)uuid;
- (NWEndpoint)localEndpoint;
- (NWEndpoint)remoteEndpoint;
- (OS_nw_endpoint)localFlowEndpoint;
- (OS_nw_endpoint)remoteFlowEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)identifier;
- (id)identifierString;
- (int)socketFamily;
- (int)socketProtocol;
- (int)socketType;
- (void)encodeWithCoder:(id)a3;
- (void)initWithSocketFamily:(int)a3 socketType:(int)a4 socketProtocol:(uint64_t)a5 pid:(uint64_t)a6 epid:(uint64_t)a7 uuid:(uint64_t)a8 euuid:(uint64_t)a9 socketID:;
- (void)setEuuid:(id)a3;
- (void)setLocalAddress:(void *)result;
- (void)setLocalFlowEndpoint:(id)a3;
- (void)setRemoteAddress:(void *)result;
- (void)setRemoteFlowEndpoint:(id)a3;
- (void)setRemoteHostname:(id)a3;
- (void)setRuuid:(id)a3;
- (void)setSocketFamily:(int)a3;
- (void)setSocketProtocol:(int)a3;
- (void)setSocketType:(int)a3;
- (void)setUuid:(id)a3;
- (void)writeXPCMessage:(int)a3 drop:(uint64_t)a4 inboundPassOffset:(uint64_t)a5 inboundPeekOffset:(uint64_t)a6 outboundPassOffset:(uint64_t)a7 outboundPeekOffset:(uint64_t)a8 statsReportFrequency:;
@end

@implementation NEFilterSocketFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruuid, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_socketUUID, 0);
  objc_storeStrong((id *)&self->_localFlowEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteHostname, 0);

  objc_storeStrong((id *)&self->_remoteFlowEndpoint, 0);
}

- (void)setRuuid:(id)a3
{
}

- (NSUUID)ruuid
{
  return self->_ruuid;
}

- (void)setEuuid:(id)a3
{
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setSocketProtocol:(int)a3
{
  self->_socketProtocol = a3;
}

- (int)socketProtocol
{
  return self->_socketProtocol;
}

- (void)setSocketType:(int)a3
{
  self->_socketType = a3;
}

- (int)socketType
{
  return self->_socketType;
}

- (void)setSocketFamily:(int)a3
{
  self->_socketFamily = a3;
}

- (int)socketFamily
{
  return self->_socketFamily;
}

- (void)setLocalFlowEndpoint:(id)a3
{
}

- (OS_nw_endpoint)localFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRemoteHostname:(id)a3
{
}

- (NSString)remoteHostname
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRemoteFlowEndpoint:(id)a3
{
}

- (OS_nw_endpoint)remoteFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  id v13 = a3;
  if ([a6 drop]) {
    +[NEFilterDataVerdict dropVerdict];
  }
  else {
  v14 = +[NEFilterDataVerdict allowVerdict];
  }
  BOOL v15 = [(NEFilterSocketFlow *)self createDataReply:v13 controlSocket:v9 direction:a5 verdict:v14 context:v12];

  return v15;
}

- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  id v11 = a3;
  char v12 = -[NEFilterFlow updateCurrentVerdictFromDataVerdict:direction:](self, a6, a5);
  id v14 = v11;
  if (self)
  {
    if (self->_socketID == -1)
    {
      int v29 = objc_msgSend(objc_getProperty(self, v13, 112, 1), "drop");
      uint64_t v31 = objc_msgSend(objc_getProperty(self, v30, 112, 1), "inboundPassOffset");
      uint64_t v33 = objc_msgSend(objc_getProperty(self, v32, 112, 1), "inboundPeekOffset");
      uint64_t v35 = objc_msgSend(objc_getProperty(self, v34, 112, 1), "outboundPassOffset");
      uint64_t v37 = objc_msgSend(objc_getProperty(self, v36, 112, 1), "outboundPeekOffset");
      uint64_t v39 = objc_msgSend(objc_getProperty(self, v38, 112, 1), "statisticsReportFrequency");
      -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:](self, v14, v29, v31, v33, v35, v37, v39);
    }
    else
    {
      int v15 = objc_msgSend(objc_getProperty(self, v13, 112, 1), "drop");
      unint64_t socketID = self->_socketID;
      char v18 = v12;
      uint64_t v19 = objc_msgSend(objc_getProperty(self, v17, 112, 1), "inboundPassOffset");
      uint64_t v21 = objc_msgSend(objc_getProperty(self, v20, 112, 1), "inboundPeekOffset");
      uint64_t v23 = objc_msgSend(objc_getProperty(self, v22, 112, 1), "outboundPassOffset");
      uint64_t v25 = objc_msgSend(objc_getProperty(self, v24, 112, 1), "outboundPeekOffset");
      uint64_t v27 = objc_msgSend(objc_getProperty(self, v26, 112, 1), "statisticsReportFrequency");
      uint64_t v28 = v19;
      char v12 = v18;
      +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]((uint64_t)NEFilterSocketFlow, a4, v15, socketID, v28, v21, v23, v25, v27);
    }
  }

  return v12;
}

+ (void)writeMessageWithControlSocket:(int)a3 drop:(uint64_t)a4 socketID:(uint64_t)a5 inboundPassOffset:(uint64_t)a6 inboundPeekOffset:(uint64_t)a7 outboundPassOffset:(uint64_t)a8 outboundPeekOffset:(uint64_t)a9 statsReportFrequency:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  self;
  if (a2 < 0) {
    return;
  }
  uint64_t v25 = 0x100000040;
  if (a3) {
    int v16 = 17;
  }
  else {
    int v16 = 16;
  }
  int v26 = 2;
  int v27 = v16;
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v31 = a7;
  uint64_t v32 = a8;
  uint64_t v33 = 0;
  self;
  if ((unint64_t)(a9 - 1) > 2) {
    int v17 = 0;
  }
  else {
    int v17 = dword_19DF9C138[a9 - 1];
  }
  unint64_t v18 = 0;
  LODWORD(v33) = v17;
  while (1)
  {
    ssize_t v19 = write(a2, (char *)&v25 + v18, 64 - v18);
    if (v19 < 1) {
      break;
    }
    v18 += v19;
LABEL_13:
    if (v18 > 0x3F) {
      return;
    }
  }
  if ((v19 & 0x8000000000000000) == 0 || *__error() == 35) {
    goto LABEL_13;
  }
  int v20 = *__error();
  uint64_t v21 = ne_log_obj();
  SEL v22 = v21;
  if (v20 == 22)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v35 = v27;
      _os_log_debug_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_DEBUG, "Sent a %d message for a non-existent socket", buf, 8u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v23 = v27;
    SEL v24 = strerror(v20);
    *(_DWORD *)buf = 67109378;
    int v35 = v23;
    __int16 v36 = 2080;
    uint64_t v37 = v24;
    _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "Write operation on the control socket failed while sending a %d message (%s)", buf, 0x12u);
  }
}

- (void)writeXPCMessage:(int)a3 drop:(uint64_t)a4 inboundPassOffset:(uint64_t)a5 inboundPeekOffset:(uint64_t)a6 outboundPassOffset:(uint64_t)a7 outboundPeekOffset:(uint64_t)a8 statsReportFrequency:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  int v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id Property = objc_getProperty(a1, v17, 128, 1);
    int v23 = "allow";
    *(_DWORD *)SEL v24 = 138413570;
    *(void *)&v24[4] = Property;
    *(_WORD *)&v24[12] = 2080;
    if (a3) {
      int v23 = "drop";
    }
    *(void *)&v24[14] = v23;
    __int16 v25 = 2048;
    uint64_t v26 = a4;
    __int16 v27 = 2048;
    uint64_t v28 = a5;
    __int16 v29 = 2048;
    uint64_t v30 = a6;
    __int16 v31 = 2048;
    uint64_t v32 = a7;
    _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "%@ send verdict: %s, in (%lld/%lld), out (%lld/%lld)", v24, 0x3Eu);
  }

  *(void *)SEL v24 = 0;
  *(void *)&v24[8] = 0;
  uuid_clear(v24);
  objc_msgSend(objc_getProperty(a1, v18, 128, 1), "getUUIDBytes:", v24);
  xpc_dictionary_set_uuid(v15, "flow-uuid", v24);
  uint64_t v19 = 3;
  if ((a6 & a4) == 0xFFFFFFFFFFFFFFFFLL) {
    uint64_t v19 = 1;
  }
  if (a3) {
    int64_t v20 = 2;
  }
  else {
    int64_t v20 = v19;
  }
  xpc_dictionary_set_int64(v15, "verdict-value", v20);
  xpc_dictionary_set_uint64(v15, "input-pass-offset", a4);
  xpc_dictionary_set_uint64(v15, "input-peek-offset", a5);
  xpc_dictionary_set_uint64(v15, "output-pass-offset", a6);
  xpc_dictionary_set_uint64(v15, "output-peek-offset", a7);
  self;
  uint64_t v21 = 0;
  if ((unint64_t)(a8 - 1) <= 2) {
    uint64_t v21 = dword_19DF9C138[a8 - 1];
  }
  xpc_dictionary_set_uint64(v15, "stats-report-frequency", v21);
}

- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    id v11 = +[NEFilterNewFlowVerdict allowVerdict];
  }
  if (![v11 drop])
  {
    if (self)
    {
      unint64_t socketID = self->_socketID;
      if (socketID == -1)
      {
        -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:](self, v10, 0, [v11 filterInbound] - 1, objc_msgSend(v11, "peekInboundBytes"), objc_msgSend(v11, "filterOutbound") - 1, objc_msgSend(v11, "peekOutboundBytes"), objc_msgSend(v11, "statisticsReportFrequency"));
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t socketID = 0;
    }
    +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]((uint64_t)NEFilterSocketFlow, a4, 0, socketID, [v11 filterInbound] - 1, objc_msgSend(v11, "peekInboundBytes"), objc_msgSend(v11, "filterOutbound") - 1, objc_msgSend(v11, "peekOutboundBytes"), objc_msgSend(v11, "statisticsReportFrequency"));
LABEL_17:
    int v23 = -[NEFilterAbsoluteVerdict initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:]([NEFilterAbsoluteVerdict alloc], "initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:", 0, [v11 filterInbound] - 1, objc_msgSend(v11, "peekInboundBytes"), objc_msgSend(v11, "filterOutbound") - 1, objc_msgSend(v11, "peekOutboundBytes"));
    __int16 v25 = v23;
    if (self)
    {
      objc_setProperty_atomic(self, v24, v23, 112);

      uint64_t v26 = [v11 shouldReport];
      id Property = objc_getProperty(self, v27, 112, 1);
    }
    else
    {

      uint64_t v26 = [v11 shouldReport];
      id Property = 0;
    }
    [Property setShouldReport:v26];
    uint64_t v30 = [v11 statisticsReportFrequency];
    if (self) {
      id v31 = objc_getProperty(self, v29, 112, 1);
    }
    else {
      id v31 = 0;
    }
    [v31 setStatisticsReportFrequency:v30];
    unsigned __int8 v22 = -[NEFilterFlow shouldCloseWithVerdict:](self, v11);
    goto LABEL_22;
  }
  if (self)
  {
    unint64_t v13 = self->_socketID;
    if (v13 == -1)
    {
      -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:](self, v10, 1, 0, 0, 0, 0, 0);
      id v15 = [v12 _principalObject];
      int v16 = [v15 filterConfiguration];
      int v17 = [v16 organization];

      if (v17)
      {
        SEL v18 = [v15 filterConfiguration];
        id v19 = [v18 organization];
        int64_t v20 = (const char *)[v19 cStringUsingEncoding:4];

        xpc_dictionary_set_string(v10, "organization", v20);
      }

      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]((uint64_t)NEFilterSocketFlow, a4, 1, v13, 0, 0, 0, 0, 0);
LABEL_13:
  uint64_t v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = [(NEFilterSocketFlow *)self identifierString];
    *(_DWORD *)buf = 138412290;
    int v35 = v33;
    _os_log_debug_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_DEBUG, "Dropping new flow %@", buf, 0xCu);
  }
  unsigned __int8 v22 = 1;
LABEL_22:

  return v22;
}

- (id)identifierString
{
  if (!self)
  {
    id v3 = [NSString alloc];
    unint64_t socketID = 0;
    goto LABEL_4;
  }
  if (self->_socketID != -1)
  {
    id v3 = [NSString alloc];
    unint64_t socketID = self->_socketID;
LABEL_4:
    v5 = objc_msgSend(v3, "initWithFormat:", @"%llx", socketID);
    goto LABEL_6;
  }
  v7.receiver = self;
  v7.super_class = (Class)NEFilterSocketFlow;
  v5 = [(NEFilterFlow *)&v7 identifierString];
LABEL_6:

  return v5;
}

- (id)identifier
{
  if (self)
  {
    unint64_t socketID = self->_socketID;
    if (socketID == -1)
    {
      v7.receiver = self;
      v7.super_class = (Class)NEFilterSocketFlow;
      id v5 = [(NEFilterFlow *)&v7 identifier];
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t socketID = 0;
  }
  p_generateIdentifierOnce = &self->_generateIdentifierOnce;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NEFilterSocketFlow_identifier__block_invoke;
  block[3] = &unk_1E5990BA0;
  block[4] = self;
  block[5] = socketID;
  if (self->_generateIdentifierOnce != -1) {
    dispatch_once(p_generateIdentifierOnce, block);
  }
  id v5 = objc_getProperty(self, a2, 208, 1);
LABEL_7:

  return v5;
}

void __32__NEFilterSocketFlow_identifier__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(dst, 0, sizeof(dst));
  uuid_copy(dst, "؛[]y<I@");
  *(void *)&dst[8] = *(void *)(a1 + 40);
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:dst];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 208);
  *(void *)(v3 + 208) = v2;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)NEFilterSocketFlow;
  objc_super v7 = -[NEFilterFlow descriptionWithIndent:options:](&v18, sel_descriptionWithIndent_options_);
  if (self)
  {
    if (self->_socketID == -1) {
      goto LABEL_5;
    }
    id v8 = [NSString alloc];
    unint64_t socketID = self->_socketID;
  }
  else
  {
    id v8 = [NSString alloc];
    unint64_t socketID = 0;
  }
  id v10 = objc_msgSend(v8, "initWithFormat:", @"%llx", socketID);
  [v7 appendPrettyObject:v10 withName:@"socketID" andIndent:v5 options:a4];

LABEL_5:
  id v11 = [(NEFilterSocketFlow *)self localFlowEndpoint];
  [v7 appendPrettyObject:v11 withName:@"localEndpoint" andIndent:v5 options:a4 | 1];

  id v12 = [(NEFilterSocketFlow *)self remoteFlowEndpoint];
  [v7 appendPrettyObject:v12 withName:@"remoteEndpoint" andIndent:v5 options:a4 | 1];

  unint64_t v13 = [(NEFilterSocketFlow *)self remoteHostname];
  [v7 appendPrettyObject:v13 withName:@"remoteHostname" andIndent:v5 options:a4 | 1];

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"), @"protocol", v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterSocketFlow socketFamily](self, "socketFamily"), @"family", v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEFilterSocketFlow socketType](self, "socketType"), @"type", v5, a4);
  id v14 = [(NEFilterSocketFlow *)self uuid];
  [v7 appendPrettyObject:v14 withName:@"procUUID" andIndent:v5 options:a4];

  id v15 = [(NEFilterSocketFlow *)self euuid];
  [v7 appendPrettyObject:v15 withName:@"eprocUUID" andIndent:v5 options:a4];

  int v16 = [(NEFilterSocketFlow *)self ruuid];
  [v7 appendPrettyObject:v16 withName:@"rprocUUID" andIndent:v5 options:a4];

  return v7;
}

- (NWEndpoint)localEndpoint
{
  uint64_t v3 = [(NEFilterSocketFlow *)self localFlowEndpoint];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F38BE8];
    uint64_t v5 = [(NEFilterSocketFlow *)self localFlowEndpoint];
    uint64_t v6 = [v4 endpointWithCEndpoint:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NWEndpoint *)v6;
}

- (NWEndpoint)remoteEndpoint
{
  uint64_t v3 = [(NEFilterSocketFlow *)self remoteFlowEndpoint];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F38BE8];
    uint64_t v5 = [(NEFilterSocketFlow *)self remoteFlowEndpoint];
    uint64_t v6 = [v4 endpointWithCEndpoint:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NWEndpoint *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NEFilterSocketFlow;
  v4 = [(NEFilterFlow *)&v12 copyWithZone:a3];
  objc_msgSend(v4, "setSocketFamily:", -[NEFilterSocketFlow socketFamily](self, "socketFamily"));
  objc_msgSend(v4, "setSocketType:", -[NEFilterSocketFlow socketType](self, "socketType"));
  objc_msgSend(v4, "setSocketProtocol:", -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"));
  uint64_t v5 = [(NEFilterSocketFlow *)self uuid];
  [v4 setUuid:v5];

  uint64_t v6 = [(NEFilterSocketFlow *)self euuid];
  [v4 setEuuid:v6];

  objc_super v7 = [(NEFilterSocketFlow *)self localFlowEndpoint];
  [v4 setLocalFlowEndpoint:v7];

  id v8 = [(NEFilterSocketFlow *)self remoteFlowEndpoint];
  [v4 setRemoteFlowEndpoint:v8];

  uint64_t v9 = [(NEFilterSocketFlow *)self remoteHostname];
  [v4 setRemoteHostname:v9];

  if (!self)
  {
    unint64_t socketID = 0;
    if (!v4) {
      return v4;
    }
    goto LABEL_3;
  }
  unint64_t socketID = self->_socketID;
  if (v4) {
LABEL_3:
  }
    v4[25] = socketID;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEFilterSocketFlow;
  [(NEFilterFlow *)&v17 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterSocketFlow socketFamily](self, "socketFamily"), @"SocketFamily");
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterSocketFlow socketType](self, "socketType"), @"SocketType");
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"), @"SocketProtocol");
  uint64_t v5 = [(NEFilterSocketFlow *)self uuid];
  [v4 encodeObject:v5 forKey:@"UUID"];

  uint64_t v6 = [(NEFilterSocketFlow *)self euuid];
  [v4 encodeObject:v6 forKey:@"EUUID"];

  objc_super v7 = [(NEFilterSocketFlow *)self localFlowEndpoint];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F38BE8];
    uint64_t v9 = [(NEFilterSocketFlow *)self localFlowEndpoint];
    id v10 = [v8 endpointWithCEndpoint:v9];
    [v4 encodeObject:v10 forKey:@"LocalEndpoint"];
  }
  id v11 = [(NEFilterSocketFlow *)self remoteFlowEndpoint];

  if (v11)
  {
    objc_super v12 = (void *)MEMORY[0x1E4F38BE8];
    unint64_t v13 = [(NEFilterSocketFlow *)self remoteFlowEndpoint];
    id v14 = [v12 endpointWithCEndpoint:v13];
    [v4 encodeObject:v14 forKey:@"RemoteEndpoint"];
  }
  id v15 = [(NEFilterSocketFlow *)self remoteHostname];
  [v4 encodeObject:v15 forKey:@"RemoteHostname"];

  if (self) {
    unint64_t socketID = self->_socketID;
  }
  else {
    unint64_t socketID = 0;
  }
  [v4 encodeInt64:socketID forKey:@"SocketID"];
}

- (NEFilterSocketFlow)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NEFilterSocketFlow;
  uint64_t v5 = [(NEFilterFlow *)&v14 initWithCoder:v4];
  if (v5)
  {
    -[NEFilterSocketFlow setSocketFamily:](v5, "setSocketFamily:", [v4 decodeIntForKey:@"SocketFamily"]);
    -[NEFilterSocketFlow setSocketType:](v5, "setSocketType:", [v4 decodeIntForKey:@"SocketType"]);
    -[NEFilterSocketFlow setSocketProtocol:](v5, "setSocketProtocol:", [v4 decodeIntForKey:@"SocketProtocol"]);
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    [(NEFilterSocketFlow *)v5 setUuid:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EUUID"];
    [(NEFilterSocketFlow *)v5 setEuuid:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalEndpoint"];
    uint64_t v9 = (void *)[v8 copyCEndpoint];
    [(NEFilterSocketFlow *)v5 setLocalFlowEndpoint:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteEndpoint"];
    id v11 = (void *)[v10 copyCEndpoint];
    [(NEFilterSocketFlow *)v5 setRemoteFlowEndpoint:v11];

    objc_super v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteHostname"];
    [(NEFilterSocketFlow *)v5 setRemoteHostname:v12];

    v5->_unint64_t socketID = [v4 decodeInt64ForKey:@"SocketID"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)initWithSocketFamily:(int)a3 socketType:(int)a4 socketProtocol:(uint64_t)a5 pid:(uint64_t)a6 epid:(uint64_t)a7 uuid:(uint64_t)a8 euuid:(uint64_t)a9 socketID:
{
  if (!a1) {
    return 0;
  }
  v21.receiver = a1;
  v21.super_class = (Class)NEFilterSocketFlow;
  id v16 = objc_msgSendSuper2(&v21, sel_init);
  objc_super v17 = v16;
  if (v16)
  {
    *((_DWORD *)v16 + 40) = a2;
    *((_DWORD *)v16 + 41) = a3;
    *((_DWORD *)v16 + 42) = a4;
    *((void *)v16 + 25) = a9;
    [v16 setPid:a5];
    [v17 setEpid:a6];
    objc_super v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a7];
    [v17 setUuid:v18];

    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a8];
    [v17 setEuuid:v19];
  }
  return v17;
}

- (void)setRemoteAddress:(void *)result
{
  if (address)
  {
    int sa_family = address->sa_family;
    if (sa_family == 30 || sa_family == 2)
    {
      id v4 = result;
      nw_endpoint_t v5 = nw_endpoint_create_address(address);
      if (v5) {
        [v4 setRemoteFlowEndpoint:v5];
      }
      return (void *)MEMORY[0x1F41817F8]();
    }
  }
  return result;
}

- (void)setLocalAddress:(void *)result
{
  if (address)
  {
    int sa_family = address->sa_family;
    if (sa_family == 30 || sa_family == 2)
    {
      id v4 = result;
      nw_endpoint_t v5 = nw_endpoint_create_address(address);
      if (v5) {
        [v4 setLocalFlowEndpoint:v5];
      }
      return (void *)MEMORY[0x1F41817F8]();
    }
  }
  return result;
}

@end