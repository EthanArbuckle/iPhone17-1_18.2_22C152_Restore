@interface GEOExternalRequestCounterInfo
- (GEOExternalRequestCounterInfo)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)appId;
- (NSString)requestSubtype;
- (NSString)requestType;
- (NSString)source;
- (int64_t)recvBytes;
- (int64_t)xmitBytes;
- (unint64_t)usedInterface;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAppId:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setRecvBytes:(int64_t)a3;
- (void)setRequestSubtype:(id)a3;
- (void)setRequestType:(id)a3;
- (void)setSource:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setUsedInterface:(unint64_t)a3;
- (void)setXmitBytes:(int64_t)a3;
@end

@implementation GEOExternalRequestCounterInfo

- (GEOExternalRequestCounterInfo)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GEOExternalRequestCounterInfo;
  v6 = [(GEOExternalRequestCounterInfo *)&v25 init];
  if (v6)
  {
    string = xpc_dictionary_get_string(v5, "appId");
    if (string)
    {
      uint64_t v8 = [NSString stringWithUTF8String:string];
      appId = v6->_appId;
      v6->_appId = (NSString *)v8;
    }
    if (xpc_dictionary_get_double(v5, "startTime") != 0.0)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      startTime = v6->_startTime;
      v6->_startTime = (NSDate *)v10;
    }
    if (xpc_dictionary_get_double(v5, "endTime") != 0.0)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      endTime = v6->_endTime;
      v6->_endTime = (NSDate *)v12;
    }
    v6->_xmitBytes = xpc_dictionary_get_int64(v5, "xmitBytes");
    v6->_recvBytes = xpc_dictionary_get_int64(v5, "recvBytes");
    v6->_usedInterface = xpc_dictionary_get_int64(v5, "interface");
    v14 = xpc_dictionary_get_string(v5, "reqType");
    if (v14)
    {
      uint64_t v15 = [NSString stringWithUTF8String:v14];
      requestType = v6->_requestType;
      v6->_requestType = (NSString *)v15;
    }
    v17 = xpc_dictionary_get_string(v5, "reqSubtype");
    if (v17)
    {
      uint64_t v18 = [NSString stringWithUTF8String:v17];
      requestSubtype = v6->_requestSubtype;
      v6->_requestSubtype = (NSString *)v18;
    }
    v20 = xpc_dictionary_get_string(v5, "source");
    if (v20)
    {
      uint64_t v21 = [NSString stringWithUTF8String:v20];
      source = v6->_source;
      v6->_source = (NSString *)v21;
    }
    v23 = v6;
  }

  return v6;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  appId = self->_appId;
  if (appId)
  {
    id v5 = [(NSString *)appId UTF8String];
    if (v5) {
      xpc_dictionary_set_string(xdict, "appId", v5);
    }
  }
  startTime = self->_startTime;
  if (startTime)
  {
    [(NSDate *)startTime timeIntervalSinceReferenceDate];
    if (v7 != 0.0) {
      xpc_dictionary_set_double(xdict, "startTime", v7);
    }
  }
  endTime = self->_endTime;
  if (endTime)
  {
    [(NSDate *)endTime timeIntervalSinceReferenceDate];
    if (v9 != 0.0) {
      xpc_dictionary_set_double(xdict, "endTime", v9);
    }
  }
  xpc_dictionary_set_int64(xdict, "xmitBytes", self->_xmitBytes);
  xpc_dictionary_set_int64(xdict, "recvBytes", self->_recvBytes);
  xpc_dictionary_set_int64(xdict, "interface", self->_usedInterface);
  requestType = self->_requestType;
  if (requestType)
  {
    v11 = [(NSString *)requestType UTF8String];
    if (v11) {
      xpc_dictionary_set_string(xdict, "reqType", v11);
    }
  }
  requestSubtype = self->_requestSubtype;
  if (requestSubtype)
  {
    v13 = [(NSString *)requestSubtype UTF8String];
    if (v13) {
      xpc_dictionary_set_string(xdict, "reqSubtype", v13);
    }
  }
  source = self->_source;
  if (source)
  {
    uint64_t v15 = [(NSString *)source UTF8String];
    if (v15) {
      xpc_dictionary_set_string(xdict, "source", v15);
    }
  }
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (int64_t)xmitBytes
{
  return self->_xmitBytes;
}

- (void)setXmitBytes:(int64_t)a3
{
  self->_xmitBytes = a3;
}

- (int64_t)recvBytes
{
  return self->_recvBytes;
}

- (void)setRecvBytes:(int64_t)a3
{
  self->_recvBytes = a3;
}

- (unint64_t)usedInterface
{
  return self->_usedInterface;
}

- (void)setUsedInterface:(unint64_t)a3
{
  self->_usedInterface = a3;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(id)a3
{
}

- (NSString)requestSubtype
{
  return self->_requestSubtype;
}

- (void)setRequestSubtype:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_requestSubtype, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

@end