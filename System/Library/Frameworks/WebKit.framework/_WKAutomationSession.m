@interface _WKAutomationSession
- (BOOL)isPaired;
- (BOOL)isPendingTermination;
- (BOOL)isSimulatingUserInteraction;
- (NSString)sessionIdentifier;
- (Object)_apiObject;
- (_WKAutomationSession)init;
- (_WKAutomationSession)initWithConfiguration:(id)a3;
- (_WKAutomationSessionConfiguration)configuration;
- (_WKAutomationSessionDelegate)delegate;
- (id).cxx_construct;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)terminate;
@end

@implementation _WKAutomationSession

- (_WKAutomationSession)init
{
  v3 = objc_alloc_init(_WKAutomationSessionConfiguration);
  v4 = [(_WKAutomationSession *)self initWithConfiguration:v3];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (_WKAutomationSession)initWithConfiguration:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_WKAutomationSession;
  v4 = [(_WKAutomationSession *)&v9 init];
  v5 = v4;
  if (v4)
  {
    *((void *)WebKit::WebAutomationSession::WebAutomationSession((WebKit::WebAutomationSession *)[(_WKAutomationSession *)v4 _apiObject])+ 1) = v4;
    uint64_t v6 = [a3 copy];
    m_ptr = v5->_configuration.m_ptr;
    v5->_configuration.m_ptr = (void *)v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    uint64_t v5 = *(void *)&self->_anon_38[8];
    *(void *)&self->_anon_38[8] = 0;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    WebKit::WebAutomationSession::~WebAutomationSession((WebKit::WebAutomationSession *)&self->_session, v4);
    v6.receiver = self;
    v6.super_class = (Class)_WKAutomationSession;
    [(_WKAutomationSession *)&v6 dealloc];
  }
}

- (_WKAutomationSessionDelegate)delegate
{
  return (_WKAutomationSessionDelegate *)objc_loadWeak(&self->_delegate.m_weakReference);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate.m_weakReference, a3);
  if (a3)
  {
    uint64_t v5 = WTF::fastMalloc((WTF *)0x18);
    WebKit::AutomationSessionClient::AutomationSessionClient(v5, a3);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)&self->_anon_38[8];
  *(void *)&self->_anon_38[8] = v5;
  if (v6)
  {
    v7 = *(void (**)(void))(*(void *)v6 + 8);
    v7();
  }
}

- (NSString)sessionIdentifier
{
  v2 = *(WTF::StringImpl **)&self->_anon_38[16];
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (void)setSessionIdentifier:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self->_anon_38[16], &v6);
  uint64_t v5 = v6;
  uint64_t v6 = 0;
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

- (_WKAutomationSessionConfiguration)configuration
{
  v2 = (void *)CFMakeCollectable((CFTypeRef)[self->_configuration.m_ptr copy]);

  return (_WKAutomationSessionConfiguration *)v2;
}

- (BOOL)isPaired
{
  return *(unsigned char *)(*(void *)&self->_anon_38[264] + 20);
}

- (BOOL)isPendingTermination
{
  return *(unsigned char *)(*(void *)&self->_anon_38[264] + 21);
}

- (BOOL)isSimulatingUserInteraction
{
  uint64_t v2 = *(void *)&self->_anon_38[128];
  return v2 && *(_DWORD *)(v2 - 12) || self->_anon_38[252] != 0;
}

- (void)terminate
{
}

- (Object)_apiObject
{
  return (Object *)&self->_session;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate.m_weakReference);
  m_ptr = self->_configuration.m_ptr;
  self->_configuration.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 41) = 0;
  *((void *)self + 42) = 0;
  return self;
}

@end