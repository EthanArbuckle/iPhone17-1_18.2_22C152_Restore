@interface _WKInspectorDebuggableInfo
- (BOOL)targetIsSimulator;
- (NSString)targetBuildVersion;
- (NSString)targetPlatformName;
- (NSString)targetProductVersion;
- (Object)_apiObject;
- (_WKInspectorDebuggableInfo)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)debuggableType;
- (void)dealloc;
- (void)setDebuggableType:(int64_t)a3;
- (void)setTargetBuildVersion:(id)a3;
- (void)setTargetIsSimulator:(BOOL)a3;
- (void)setTargetPlatformName:(id)a3;
- (void)setTargetProductVersion:(id)a3;
@end

@implementation _WKInspectorDebuggableInfo

- (_WKInspectorDebuggableInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)_WKInspectorDebuggableInfo;
  v2 = [(_WKInspectorDebuggableInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(_WKInspectorDebuggableInfo *)v2 _apiObject];
    *(_OWORD *)(v4 + 8) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(void *)uint64_t v4 = &unk_1EE9D1E28;
    WebKit::InitializeWebKit2((WebKit *)v4);
    *(void *)(v4 + 32) = 0;
    *(void *)(v4 + 40) = 0;
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 48) = 0;
    *(void *)uint64_t v4 = &unk_1EE9DF388;
    *(void *)(v4 + 8) = v3;
  }
  return v3;
}

- (int64_t)debuggableType
{
  unint64_t v2 = (char)self->_debuggableInfo.data.__lx[16];
  if (v2 > 4) {
    return 1;
  }
  else {
    return qword_1994F6588[v2];
  }
}

- (void)setDebuggableType:(int64_t)a3
{
  unint64_t v3 = 0x402030100uLL >> (8 * a3);
  if ((unint64_t)a3 >= 5) {
    LOBYTE(v3) = 1;
  }
  self->_debuggableInfo.data.__lx[16] = v3;
}

- (NSString)targetPlatformName
{
  if (*(void *)&self->_debuggableInfo.data.__lx[24]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setTargetPlatformName:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self->_debuggableInfo.data.__lx[24], &v6);
  v5 = v6;
  objc_super v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (NSString)targetBuildVersion
{
  if (*(void *)&self->_debuggableInfo.data.__lx[32]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setTargetBuildVersion:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self->_debuggableInfo.data.__lx[32], &v6);
  v5 = v6;
  objc_super v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (NSString)targetProductVersion
{
  if (*(void *)&self->_debuggableInfo.data.__lx[40]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setTargetProductVersion:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self->_debuggableInfo.data.__lx[40], &v6);
  v5 = v6;
  objc_super v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (BOOL)targetIsSimulator
{
  return (BOOL)self[1].super.isa;
}

- (void)setTargetIsSimulator:(BOOL)a3
{
  LOBYTE(self[1].super.isa) = a3;
}

- (void)dealloc
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::DebuggableInfo::~DebuggableInfo((API::DebuggableInfo *)&self->_debuggableInfo, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKInspectorDebuggableInfo;
    [(_WKInspectorDebuggableInfo *)&v5 dealloc];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setDebuggableType:", -[_WKInspectorDebuggableInfo debuggableType](self, "debuggableType"));
  objc_msgSend(v4, "setTargetPlatformName:", -[_WKInspectorDebuggableInfo targetPlatformName](self, "targetPlatformName"));
  objc_msgSend(v4, "setTargetBuildVersion:", -[_WKInspectorDebuggableInfo targetBuildVersion](self, "targetBuildVersion"));
  objc_msgSend(v4, "setTargetProductVersion:", -[_WKInspectorDebuggableInfo targetProductVersion](self, "targetProductVersion"));
  objc_msgSend(v4, "setTargetIsSimulator:", -[_WKInspectorDebuggableInfo targetIsSimulator](self, "targetIsSimulator"));
  return v4;
}

- (Object)_apiObject
{
  return (Object *)&self->_debuggableInfo;
}

@end