@interface RFSelfAuthExtensionHelper
- (BOOL)loadTestConfigFromUserDefaults;
- (RFSelfAuthExtensionHelper)init;
- (TestConfigFlag)testConfiguration;
- (id).cxx_construct;
- (int64_t)getPersonalizationInfo;
- (int64_t)getSignedTicketAndStore:(BOOL)a3;
- (void)clearRFSelfTestTicket;
- (void)dealloc;
- (void)resetAll;
@end

@implementation RFSelfAuthExtensionHelper

- (RFSelfAuthExtensionHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)RFSelfAuthExtensionHelper;
  v2 = [(RFSelfAuthExtensionHelper *)&v8 init];
  BasebandRFDiagnostics::create((uint64_t *)&v7, (BasebandRFDiagnostics *)v2);
  long long v3 = v7;
  long long v7 = 0uLL;
  v4 = (std::__shared_weak_count *)*((void *)v2 + 2);
  *(_OWORD *)(v2 + 8) = v3;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  v5 = (std::__shared_weak_count *)*((void *)&v7 + 1);
  if (!*((void *)&v7 + 1)
    || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v7 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    return (RFSelfAuthExtensionHelper *)v2;
  }
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return (RFSelfAuthExtensionHelper *)v2;
}

- (void)dealloc
{
  long long v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "RFSelfAuthExtensionHelper dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)RFSelfAuthExtensionHelper;
  [(RFSelfAuthExtensionHelper *)&v4 dealloc];
}

- (void)resetAll
{
  ptr = self->fBasebandDiagnostics.__ptr_;
  if (ptr) {
    BasebandRFDiagnostics::resetAll(ptr);
  }
  long long v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "RFSelfAuthExtensionHelper reset", v4, 2u);
  }
}

- (void)clearRFSelfTestTicket
{
}

- (int64_t)getSignedTicketAndStore:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int SignedTicketAndStore = BasebandRFDiagnostics::getSignedTicketAndStore(self->fBasebandDiagnostics.__ptr_, a3);
  if (SignedTicketAndStore > 5) {
    int64_t v5 = -99;
  }
  else {
    int64_t v5 = qword_1000038E0[SignedTicketAndStore];
  }
  v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = v3;
    __int16 v9 = 2080;
    uint64_t v10 = BasebandRFDiagnostics::asString();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Get signed tiket with APTag(=%d) and store:  %s", (uint8_t *)v8, 0x12u);
  }
  return v5;
}

- (int64_t)getPersonalizationInfo
{
  int PersonalizationInfo = BasebandRFDiagnostics::getPersonalizationInfo(self->fBasebandDiagnostics.__ptr_);
  BOOL v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = BasebandRFDiagnostics::asString();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Get personalization info: %s", (uint8_t *)&v5, 0xCu);
  }
  return PersonalizationInfo != 0;
}

- (BOOL)loadTestConfigFromUserDefaults
{
  __p = operator new(0x20uLL);
  long long v9 = xmmword_1000038C0;
  strcpy((char *)__p, "overrideTestConfigEnable");
  self->testConfig.BOOL overrideTestConfigEnable = BasebandDiagnostics::readIntegerFromUserDefaults() != 0;
  if (SHIBYTE(v9) < 0) {
    operator delete(__p);
  }
  __p = operator new(0x20uLL);
  long long v9 = xmmword_1000038D0;
  strcpy((char *)__p, "override_addAPTagToTicket");
  self->testConfig.BOOL override_addAPTagToTicket = BasebandDiagnostics::readIntegerFromUserDefaults() != 0;
  if (SHIBYTE(v9) < 0) {
    operator delete(__p);
  }
  BOOL v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL overrideTestConfigEnable = self->testConfig.overrideTestConfigEnable;
    LODWORD(__p) = 67109120;
    HIDWORD(__p) = overrideTestConfigEnable;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Test config: overrides test config enabled = %d", (uint8_t *)&__p, 8u);
  }
  if (self->testConfig.overrideTestConfigEnable)
  {
    int v5 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL override_addAPTagToTicket = self->testConfig.override_addAPTagToTicket;
      LODWORD(__p) = 67109120;
      HIDWORD(__p) = override_addAPTagToTicket;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "\taddTagToTicket=%d", (uint8_t *)&__p, 8u);
    }
  }
  return self->testConfig.overrideTestConfigEnable;
}

- (TestConfigFlag)testConfiguration
{
  return self->testConfig;
}

- (void).cxx_destruct
{
  cntrl = self->fBasebandDiagnostics.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end