@interface _WKNotificationData
- (NSData)data;
- (NSDictionary)userInfo;
- (NSString)body;
- (NSString)identifier;
- (NSString)lang;
- (NSString)origin;
- (NSString)tag;
- (NSString)title;
- (NSURL)securityOrigin;
- (NSURL)serviceWorkerRegistrationURL;
- (NSUUID)notificationUUID;
- (NSUUID)uuid;
- (const)_getCoreData;
- (id).cxx_construct;
- (id)_init;
- (id)_initWithCoreData:(const void *)a3;
- (unint64_t)alert;
- (unint64_t)dir;
- (void)dealloc;
- (void)setAlert:(unint64_t)a3;
- (void)setBody:(id)a3;
- (void)setData:(id)a3;
- (void)setDir:(unint64_t)a3;
- (void)setLang:(id)a3;
- (void)setNotificationUUID:(id)a3;
- (void)setSecurityOrigin:(id)a3;
- (void)setServiceWorkerRegistrationURL:(id)a3;
- (void)setTag:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation _WKNotificationData

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_WKNotificationData;
  return [(_WKNotificationData *)&v3 init];
}

- (id)_initWithCoreData:(const void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_WKNotificationData;
  v4 = [(_WKNotificationData *)&v12 init];
  v5 = v4;
  if (v4)
  {
    WTF::String::operator=((uint64_t *)v4 + 2, (WTF::StringImpl **)a3);
    long long v6 = *(_OWORD *)((char *)a3 + 24);
    *(_OWORD *)(v5 + 24) = *(_OWORD *)((char *)a3 + 8);
    *(_OWORD *)(v5 + 40) = v6;
    WTF::String::operator=((uint64_t *)v5 + 7, (WTF::StringImpl **)a3 + 5);
    WTF::String::operator=((uint64_t *)v5 + 8, (WTF::StringImpl **)a3 + 6);
    WTF::String::operator=((uint64_t *)v5 + 9, (WTF::StringImpl **)a3 + 7);
    WTF::String::operator=((uint64_t *)v5 + 10, (WTF::StringImpl **)a3 + 8);
    WTF::String::operator=((uint64_t *)v5 + 11, (WTF::StringImpl **)a3 + 9);
    v5[96] = *((unsigned char *)a3 + 80);
    WTF::String::operator=((uint64_t *)v5 + 13, (WTF::StringImpl **)a3 + 11);
    WTF::String::operator=((uint64_t *)v5 + 14, (WTF::StringImpl **)a3 + 12);
    long long v7 = *(_OWORD *)((char *)a3 + 104);
    *(_OWORD *)(v5 + 136) = *(_OWORD *)((char *)a3 + 120);
    *(_OWORD *)(v5 + 120) = v7;
    *((_OWORD *)v5 + 10) = *((_OWORD *)a3 + 9);
    long long v8 = *((_OWORD *)a3 + 13);
    long long v10 = *((_OWORD *)a3 + 10);
    long long v9 = *((_OWORD *)a3 + 11);
    *((_OWORD *)v5 + 13) = *((_OWORD *)a3 + 12);
    *((_OWORD *)v5 + 14) = v8;
    *((_OWORD *)v5 + 11) = v10;
    *((_OWORD *)v5 + 12) = v9;
    WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)v5 + 60, (uint64_t)a3 + 224);
    *((_WORD *)v5 + 128) = *((_WORD *)a3 + 120);
  }
  return v5;
}

- (const)_getCoreData
{
  return &self->_coreData;
}

- (void)setTitle:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  v5 = (StringImpl *)v9;
  long long v9 = 0;
  m_ptr = (WTF::StringImpl *)self->_coreData.title.m_impl.m_ptr;
  self->_coreData.title.m_impl.m_ptr = v5;
  if (m_ptr)
  {
    int v7 = *(_DWORD *)m_ptr - 2;
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, v4);
      m_ptr = v9;
      long long v9 = 0;
      if (!m_ptr) {
        return;
      }
      int v7 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
      {
        WTF::StringImpl::destroy(m_ptr, v8);
        return;
      }
    }
    *(_DWORD *)m_ptr = v7;
  }
}

- (NSString)title
{
  if (self->_coreData.title.m_impl.m_ptr) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setDir:(unint64_t)a3
{
  if (a3 <= 2) {
    self->_coreData.direction = a3;
  }
}

- (unint64_t)dir
{
  int direction = self->_coreData.direction;
  if (direction == 2) {
    return 2;
  }
  else {
    return direction == 1;
  }
}

- (void)setLang:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  v5 = (StringImpl *)v9;
  long long v9 = 0;
  m_ptr = (WTF::StringImpl *)self->_coreData.language.m_impl.m_ptr;
  self->_coreData.language.m_impl.m_ptr = v5;
  if (m_ptr)
  {
    int v7 = *(_DWORD *)m_ptr - 2;
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, v4);
      m_ptr = v9;
      long long v9 = 0;
      if (!m_ptr) {
        return;
      }
      int v7 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
      {
        WTF::StringImpl::destroy(m_ptr, v8);
        return;
      }
    }
    *(_DWORD *)m_ptr = v7;
  }
}

- (NSString)lang
{
  if (self->_coreData.language.m_impl.m_ptr) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setBody:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  v5 = (StringImpl *)v9;
  long long v9 = 0;
  m_ptr = (WTF::StringImpl *)self->_coreData.body.m_impl.m_ptr;
  self->_coreData.body.m_impl.m_ptr = v5;
  if (m_ptr)
  {
    int v7 = *(_DWORD *)m_ptr - 2;
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, v4);
      m_ptr = v9;
      long long v9 = 0;
      if (!m_ptr) {
        return;
      }
      int v7 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
      {
        WTF::StringImpl::destroy(m_ptr, v8);
        return;
      }
    }
    *(_DWORD *)m_ptr = v7;
  }
}

- (NSString)body
{
  if (self->_coreData.body.m_impl.m_ptr) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setTag:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  v5 = (StringImpl *)v9;
  long long v9 = 0;
  m_ptr = (WTF::StringImpl *)self->_coreData.tag.m_impl.m_ptr;
  self->_coreData.tag.m_impl.m_ptr = v5;
  if (m_ptr)
  {
    int v7 = *(_DWORD *)m_ptr - 2;
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, v4);
      m_ptr = v9;
      long long v9 = 0;
      if (!m_ptr) {
        return;
      }
      int v7 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
      {
        WTF::StringImpl::destroy(m_ptr, v8);
        return;
      }
    }
    *(_DWORD *)m_ptr = v7;
  }
}

- (NSString)tag
{
  if (self->_coreData.tag.m_impl.m_ptr) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setAlert:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      __int16 v3 = 256;
LABEL_8:
      *(_WORD *)&self->_anon_a8[88] = v3;
      return;
    case 1uLL:
      __int16 v3 = 257;
      goto LABEL_8;
    case 0uLL:
      if (self->_anon_a8[89]) {
        self->_anon_a8[89] = 0;
      }
      break;
  }
}

- (unint64_t)alert
{
  if (!self->_anon_a8[89]) {
    return 0;
  }
  if (self->_anon_a8[88]) {
    return 1;
  }
  return 2;
}

- (void)setData:(id)a3
{
  __int16 v3 = (char *)a3;
  if (a3 && (v5 = [a3 bytes], v6 = objc_msgSend(v3, "length"), (__int16 v3 = (char *)v6) != 0))
  {
    if (HIDWORD(v6))
    {
      __break(0xC471u);
      return;
    }
    uint64_t v7 = WTF::fastMalloc((WTF *)v6);
    uint64_t v8 = v7;
    long long v9 = 0;
    do
    {
      v9[v7] = v9[v5];
      ++v9;
    }
    while (v3 != v9);
  }
  else
  {
    uint64_t v8 = 0;
  }
  long long v10 = *(WTF **)&self->_anon_a8[72];
  if (v10)
  {
    *(void *)&self->_anon_a8[72] = 0;
    *(_DWORD *)&self->_anon_a8[80] = 0;
    WTF::fastFree(v10, (void *)a2);
  }
  *(void *)&self->_anon_a8[72] = v8;
  *(_DWORD *)&self->_anon_a8[80] = v3;
  *(_DWORD *)&self->_anon_a8[84] = v3;
}

- (NSData)data
{
  v2 = (void *)CFMakeCollectable((CFTypeRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)&self->_anon_a8[72] length:*(unsigned int *)&self->_anon_a8[84]]);

  return (NSData *)v2;
}

- (NSString)origin
{
  if (self->_coreData.originString.m_impl.m_ptr) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setSecurityOrigin:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x19972E8A0](v10, a3);
  WebCore::SecurityOriginData::fromURL(v13, (WebCore::SecurityOriginData *)v10, v4);
  WebCore::SecurityOriginData::toString((uint64_t *)&v11, (WebCore::SecurityOriginData *)v13);
  unint64_t v6 = (StringImpl *)v11;
  v11 = 0;
  m_ptr = self->_coreData.originString.m_impl.m_ptr;
  self->_coreData.originString.m_impl.m_ptr = v6;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v5);
      uint64_t v8 = v11;
      v11 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 == 2) {
          WTF::StringImpl::destroy(v8, v5);
        }
        else {
          *(_DWORD *)v8 -= 2;
        }
      }
    }
    else
    {
      *(_DWORD *)m_ptr -= 2;
      v11 = 0;
    }
  }
  if (v14 != -1) {
    ((void (*)(char *, uint64_t *))off_1EE9CA7F0[v14])(&v12, v13);
  }
  int v14 = -1;
  long long v9 = v10[0];
  v10[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v5);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
}

- (NSURL)securityOrigin
{
  WTF::URL::URL((uint64_t)&v6, (WTF::StringImpl **)&self->_coreData.originString);
  __int16 v3 = (NSURL *)WTF::URL::operator NSURL *();
  v4 = v6;
  unint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  return v3;
}

- (void)setServiceWorkerRegistrationURL:(id)a3
{
  MEMORY[0x19972E8A0](v6, a3);
  WTF::URL::operator=((uint64_t)&self->_coreData.serviceWorkerRegistrationURL, (uint64_t)v6);
  uint64_t v5 = v6[0];
  v6[0] = 0;
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

- (NSURL)serviceWorkerRegistrationURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (NSString)identifier
{
  WTF::UUID::toString((uint64_t *)&v6, (WTF::UUID *)&self->_coreData.notificationID[8]);
  if (!v6) {
    return (NSString *)&stru_1EEA10550;
  }
  __int16 v3 = (NSString *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  unint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  return v3;
}

- (void)setUuid:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  WTF::UUID::fromNSUUID((uint64_t *)&v4, (WTF::UUID *)a3, (NSUUID *)a2);
  if (v5) {
    *(_OWORD *)&self->_coreData.notificationID[8] = v4;
  }
}

- (NSUUID)uuid
{
  return (NSUUID *)WTF::UUID::operator NSUUID *();
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)WebCore::NotificationData::dictionaryRepresentation((WebCore::NotificationData *)&self->_coreData);
}

- (void)dealloc
{
  __int16 v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKNotificationData;
    [(_WKNotificationData *)&v4 dealloc];
  }
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (void)setNotificationUUID:(id)a3
{
  self->_notificationUUID = (NSUUID *)a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  WTF::URL::URL((WTF::URL *)&self->_coreData);
  *(_OWORD *)&self->_coreData.title.m_impl.m_ptr = 0u;
  self->_coreData.originString.m_impl.m_ptr = 0;
  *(_OWORD *)&self->_coreData.iconURL.m_impl.m_ptr = 0u;
  self->_coreData.language.m_impl.m_ptr = 0;
  WTF::URL::URL((WTF::URL *)&self->_coreData.serviceWorkerRegistrationURL);
  WTF::UUID::UUID((WTF::UUID *)v5);
  uint64_t v3 = v5[1];
  *(void *)&self->_coreData.notificationID[8] = v5[0];
  *(void *)self->_anon_a8 = v3;
  self->_anon_a8[8] = 0;
  self->_anon_a8[40] = 0;
  *(void *)&self->_anon_a8[56] = 1;
  *(void *)&self->_anon_a8[64] = 0;
  *(void *)&self->_anon_a8[72] = 0;
  *(void *)&self->_anon_a8[80] = 0;
  *(_WORD *)&self->_anon_a8[88] = 0;
  return self;
}

@end