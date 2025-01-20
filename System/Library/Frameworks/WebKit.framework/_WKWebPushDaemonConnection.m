@interface _WKWebPushDaemonConnection
- (Object)_apiObject;
- (_WKWebPushDaemonConnection)initWithConfiguration:(id)a3;
- (uint64_t)getNextPendingPushMessage:(const void *)a1;
- (uint64_t)getNextPendingPushMessage:(uint64_t)a1;
- (uint64_t)getNotifications:(const void *)a1 tag:completionHandler:;
- (uint64_t)getNotifications:(uint64_t)a1 tag:(uint64_t)a2 completionHandler:;
- (uint64_t)getNotifications:(uint64_t)a1 tag:completionHandler:;
- (uint64_t)getPushPermissionStateForOrigin:(const void *)a1 completionHandler:;
- (uint64_t)getPushPermissionStateForOrigin:(uint64_t)a1 completionHandler:;
- (uint64_t)getSubscriptionForScope:(const void *)a1 completionHandler:;
- (uint64_t)getSubscriptionForScope:(uint64_t)a1 completionHandler:;
- (uint64_t)getSubscriptionForScope:(uint64_t)a1 completionHandler:(uint64_t)a2;
- (uint64_t)requestPushPermissionForOrigin:(const void *)a1 completionHandler:;
- (uint64_t)requestPushPermissionForOrigin:(uint64_t)a1 completionHandler:;
- (uint64_t)showNotification:(const void *)a1 completionHandler:;
- (uint64_t)showNotification:(uint64_t)a1 completionHandler:;
- (uint64_t)subscribeToPushServiceForScope:(const void *)a1 applicationServerKey:completionHandler:;
- (uint64_t)subscribeToPushServiceForScope:(uint64_t)a1 applicationServerKey:completionHandler:;
- (uint64_t)unsubscribeFromPushServiceForScope:(const void *)a1 completionHandler:;
- (uint64_t)unsubscribeFromPushServiceForScope:(uint64_t)a1 completionHandler:;
- (uint64_t)unsubscribeFromPushServiceForScope:(uint64_t)a1 completionHandler:(uint64_t)a2;
- (void)cancelNotification:(id)a3 uuid:(id)a4;
- (void)getNextPendingPushMessage:(id)a3;
- (void)getNotifications:(id)a3 tag:(id)a4 completionHandler:(id)a5;
- (void)getPushPermissionStateForOrigin:(id)a3 completionHandler:(id)a4;
- (void)getSubscriptionForScope:(id)a3 completionHandler:(id)a4;
- (void)requestPushPermissionForOrigin:(id)a3 completionHandler:(id)a4;
- (void)setAppBadge:(unint64_t *)a3 origin:(id)a4;
- (void)showNotification:(id)a3 completionHandler:(id)a4;
- (void)subscribeToPushServiceForScope:(id)a3 applicationServerKey:(id)a4 completionHandler:(id)a5;
- (void)subscribeToPushServiceForScope:(uint64_t)a1 applicationServerKey:(uint64_t)a2 completionHandler:;
- (void)unsubscribeFromPushServiceForScope:(id)a3 completionHandler:(id)a4;
@end

@implementation _WKWebPushDaemonConnection

- (_WKWebPushDaemonConnection)initWithConfiguration:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_WKWebPushDaemonConnection;
  v4 = [(_WKWebPushDaemonConnection *)&v14 init];
  if (v4)
  {
    uint64_t v5 = [a3 machServiceName];
    uint64_t v6 = [a3 partition];
    uint64_t v7 = [a3 bundleIdentifier];
    v8 = [(_WKWebPushDaemonConnection *)v4 _apiObject];
    MEMORY[0x19972EAD0](&v17, v5);
    MEMORY[0x19972EAD0](&v16, v6);
    MEMORY[0x19972EAD0](&v15, v7);
    API::WebPushDaemonConnection::WebPushDaemonConnection((API::WebPushDaemonConnection *)v8, (const WTF::String *)&v17, &v16, &v15);
    v10 = v15;
    v15 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v9);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
    v11 = v16;
    v16 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v9);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
    v12 = v17;
    v17 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v9);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    v8->var1 = v4;
  }
  return v4;
}

- (void)getPushPermissionStateForOrigin:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v12, a3);
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v7 = &unk_1EE9CC3B8;
  v7[1] = v6;
  v11 = v7;
  API::WebPushDaemonConnection::getPushPermissionState((uint64_t)&self->_connection, (WebCore::SecurityOriginData *)v12, (uint64_t *)&v11);
  uint64_t v8 = (uint64_t)v11;
  v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
  v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)requestPushPermissionForOrigin:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v12, a3);
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v7 = &unk_1EE9CC3E0;
  v7[1] = v6;
  v11 = v7;
  API::WebPushDaemonConnection::requestPushPermission((uint64_t)&self->_connection, (WebCore::SecurityOriginData *)v12, (uint64_t *)&v11);
  uint64_t v8 = (uint64_t)v11;
  v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
  v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)setAppBadge:(unint64_t *)a3 origin:(id)a4
{
  BOOL v5 = a3 != 0;
  p_connection = &self->_connection;
  MEMORY[0x19972E8A0](v9, a4);
  API::WebPushDaemonConnection::setAppBadge((uint64_t)p_connection, (WebCore::SecurityOriginData *)v9, (uint64_t)a3, v5);
  uint64_t v8 = v9[0];
  v9[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
}

- (void)subscribeToPushServiceForScope:(id)a3 applicationServerKey:(id)a4 completionHandler:(id)a5
{
  if (a4)
  {
    uint64_t v9 = [a4 bytes];
    unint64_t v10 = [a4 length];
    unint64_t v11 = v10;
    v23 = 0;
    LODWORD(v24) = 0;
    HIDWORD(v24) = v10;
    if (v10)
    {
      if (HIDWORD(v10))
      {
        __break(0xC471u);
        return;
      }
      v12 = (WTF *)WTF::fastMalloc((WTF *)v10);
      uint64_t v13 = 0;
      LODWORD(v24) = v11;
      v23 = v12;
      do
      {
        *((unsigned char *)v12 + v13) = *(unsigned char *)(v9 + v13);
        ++v13;
      }
      while (v11 != v13);
    }
  }
  else
  {
    v23 = 0;
    uint64_t v24 = 0;
  }
  MEMORY[0x19972E8A0](v22, a3);
  objc_super v14 = _Block_copy(a5);
  v15 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v15 = &unk_1EE9CC408;
  v15[1] = v14;
  v21 = v15;
  uint64_t v16 = *(void *)&self->_connection.data.__lx[16] + 32;
  v25[0] = v22;
  v25[1] = &v23;
  IPC::MessageSender::sendWithAsyncReplyWithoutUsingIPCConnection<Messages::PushClientConnection::SubscribeToPushService,WTF::CompletionHandler<void ()(std::experimental::fundamentals_v3::expected<WebCore::PushSubscriptionData,WebCore::ExceptionData> const&)>>(v16, (uint64_t)v25, (uint64_t *)&v21);
  uint64_t v17 = (uint64_t)v21;
  v21 = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  _Block_release(0);
  v19 = v22[0];
  v22[0] = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy(v19, v18);
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  v20 = v23;
  if (v23)
  {
    v23 = 0;
    LODWORD(v24) = 0;
    WTF::fastFree(v20, v18);
  }
}

- (void)unsubscribeFromPushServiceForScope:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v13, a3);
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v7 = &unk_1EE9CC478;
  v7[1] = v6;
  v12 = v7;
  uint64_t v8 = *(void *)&self->_connection.data.__lx[16] + 32;
  v14[0] = 0;
  v14[8] = 0;
  v15[0] = v13;
  v15[1] = v14;
  IPC::MessageSender::sendWithAsyncReplyWithoutUsingIPCConnection<Messages::PushClientConnection::UnsubscribeFromPushService,WTF::CompletionHandler<void ()(std::experimental::fundamentals_v3::expected<BOOL,WebCore::ExceptionData> const&)>>(v8, (uint64_t)v15, (uint64_t *)&v12);
  uint64_t v9 = (uint64_t)v12;
  v12 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
  unint64_t v11 = v13[0];
  v13[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
}

- (void)getSubscriptionForScope:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v13, a3);
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v7 = &unk_1EE9CC4C0;
  v7[1] = v6;
  v12 = v7;
  uint64_t v8 = *(void *)&self->_connection.data.__lx[16] + 32;
  objc_super v14 = v13;
  IPC::MessageSender::sendWithAsyncReplyWithoutUsingIPCConnection<Messages::PushClientConnection::GetPushSubscription,WTF::CompletionHandler<void ()(std::experimental::fundamentals_v3::expected<std::optional<WebCore::PushSubscriptionData>,WebCore::ExceptionData> const&)>>(v8, (uint64_t **)&v14, (uint64_t *)&v12);
  uint64_t v9 = (uint64_t)v12;
  v12 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
  unint64_t v11 = v13[0];
  v13[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
}

- (void)getNextPendingPushMessage:(id)a3
{
  v4 = _Block_copy(a3);
  BOOL v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  *BOOL v5 = &unk_1EE9CC508;
  v5[1] = v4;
  uint64_t v8 = v5;
  uint64_t v6 = *(void *)&self->_connection.data.__lx[16] + 32;
  char v9 = 0;
  IPC::MessageSender::sendWithAsyncReplyWithoutUsingIPCConnection<Messages::PushClientConnection::GetPendingPushMessage,WTF::CompletionHandler<void ()(std::optional<WebKit::WebPushMessage> const&)>>(v6, (uint64_t)&v9, (uint64_t *)&v8);
  uint64_t v7 = (uint64_t)v8;
  uint64_t v8 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)showNotification:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = [a3 _getCoreData];
  uint64_t v7 = _Block_copy(a4);
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v8 = &unk_1EE9CC558;
  v8[1] = v7;
  unint64_t v10 = v8;
  API::WebPushDaemonConnection::showNotification((uint64_t)&self->_connection, v6, (uint64_t *)&v10);
  uint64_t v9 = (uint64_t)v10;
  unint64_t v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
}

- (void)getNotifications:(id)a3 tag:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x19972E8A0](v17, a3);
  MEMORY[0x19972EAD0](&v16, a4);
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v9 = &unk_1EE9CC580;
  v9[1] = v8;
  v15 = v9;
  uint64_t v10 = *(void *)&self->_connection.data.__lx[16] + 32;
  v18[0] = (uint64_t *)v17;
  v18[1] = (uint64_t *)&v16;
  IPC::MessageSender::sendWithAsyncReplyWithoutUsingIPCConnection<Messages::PushClientConnection::GetNotifications,WTF::CompletionHandler<void ()(std::experimental::fundamentals_v3::expected<WTF::Vector<WebCore::NotificationData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WebCore::ExceptionData> const&)>>(v10, v18, (uint64_t *)&v15);
  uint64_t v11 = (uint64_t)v15;
  v15 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  uint64_t v13 = v16;
  uint64_t v16 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  objc_super v14 = v17[0];
  v17[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v12);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
}

- (void)cancelNotification:(id)a3 uuid:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  MEMORY[0x19972E8A0](v9, a3);
  WTF::UUID::fromNSUUID(v10, (WTF::UUID *)a4, v6);
  if (!v11) {
    __break(1u);
  }
  API::WebPushDaemonConnection::cancelNotification((API::WebPushDaemonConnection *)&self->_connection, (const WTF::URL *)v9, (const WTF::UUID *)v10);
  uint64_t v8 = v9[0];
  v9[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_connection;
}

- (uint64_t)getPushPermissionStateForOrigin:(uint64_t)a1 completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)getPushPermissionStateForOrigin:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9CC3B8;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)requestPushPermissionForOrigin:(uint64_t)a1 completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)requestPushPermissionForOrigin:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9CC3E0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)subscribeToPushServiceForScope:(uint64_t)a1 applicationServerKey:completionHandler:
{
  *(void *)a1 = &unk_1EE9CC408;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)subscribeToPushServiceForScope:(const void *)a1 applicationServerKey:completionHandler:
{
  *a1 = &unk_1EE9CC408;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)subscribeToPushServiceForScope:(uint64_t)a1 applicationServerKey:(uint64_t)a2 completionHandler:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v9[0].n128_u8[0] = 0;
  int v10 = -1;
  uint64_t v2 = *(unsigned int *)(a2 + 80);
  if (v2 == -1)
  {
    uint64_t v12 = *MEMORY[0x1E4F28568];
    goto LABEL_17;
  }
  ((void (*)(__n128 **, __n128 *, uint64_t))off_1EE9CC458[v2])(v11, v9, a2);
  int v10 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    if (v2 == 1)
    {
      if (v9[0].n128_u64[1]) {
        BOOL v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        BOOL v5 = &stru_1EEA10550;
      }
      v13[0] = v5;
      objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"WKErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v9[0].n128_u64[0]));
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
      goto LABEL_12;
    }
LABEL_17:
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  __n128 v6 = API::WebPushSubscriptionData::create(v11, v9);
  uint64_t v7 = v11[0];
  uint64_t v8 = (const void *)v11[0]->n128_u64[1];
  if (v8) {
    CFRetain((CFTypeRef)v11[0]->n128_u64[1]);
  }
  (*(void (**)(__n128))(*(void *)(a1 + 8) + 16))(v6);
  if (v8) {
    CFRelease(v8);
  }
  CFRelease((CFTypeRef)v7->n128_u64[1]);
LABEL_12:
  if (v10 != -1) {
    ((void (*)(__n128 **, __n128 *))off_1EE9CC448[v10])(v11, v9);
  }
}

- (uint64_t)unsubscribeFromPushServiceForScope:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9CC478;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)unsubscribeFromPushServiceForScope:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9CC478;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)unsubscribeFromPushServiceForScope:(uint64_t)a1 completionHandler:(uint64_t)a2
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  int v9 = -1;
  uint64_t v2 = *(unsigned int *)(a2 + 16);
  if (v2 == -1)
  {
    uint64_t v10 = *MEMORY[0x1E4F28568];
    goto LABEL_12;
  }
  ((void (*)(void *, unsigned char *, uint64_t))off_1EE9CC4A0[v2])(v11, v7, a2);
  int v9 = v2;
  if (!v2) {
    goto LABEL_7;
  }
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  if (v2 != 1)
  {
LABEL_12:
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  if (v8) {
    BOOL v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    BOOL v5 = &stru_1EEA10550;
  }
  v11[0] = v5;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"WKErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
LABEL_7:
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v9 != -1) {
    return ((uint64_t (*)(void *, unsigned char *))off_1EE9CC490[v9])(v11, v7);
  }
  return result;
}

- (uint64_t)getSubscriptionForScope:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9CC4C0;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)getSubscriptionForScope:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9CC4C0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)getSubscriptionForScope:(uint64_t)a1 completionHandler:(uint64_t)a2
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v15[0] = 0;
  int v17 = -1;
  uint64_t v2 = *(unsigned int *)(a2 + 96);
  if (v2 == -1)
  {
    uint64_t v18 = *MEMORY[0x1E4F28568];
    goto LABEL_20;
  }
  ((void (*)(__n128 *, unsigned char *, uint64_t))off_1EE9CC4E8[v2])(v13, v15, a2 + 8);
  int v17 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    if (v2 == 1)
    {
      if (v16) {
        BOOL v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        BOOL v5 = &stru_1EEA10550;
      }
      v19[0] = v5;
      objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"WKErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
      goto LABEL_7;
    }
LABEL_20:
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  std::__optional_copy_base<WebCore::PushSubscriptionData,false>::__optional_copy_base[abi:sn180100](v13, (uint64_t)v15);
  if (!v14)
  {
    std::__optional_destruct_base<WebCore::PushSubscriptionData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v13, v7);
LABEL_7:
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
    goto LABEL_14;
  }
  __n128 v8 = API::WebPushSubscriptionData::create(&v12, v13);
  int v9 = v12;
  uint64_t v10 = (const void *)v12->n128_u64[1];
  if (v10) {
    CFRetain((CFTypeRef)v12->n128_u64[1]);
  }
  (*(void (**)(__n128))(*(void *)(a1 + 8) + 16))(v8);
  if (v10) {
    CFRelease(v10);
  }
  CFRelease((CFTypeRef)v9->n128_u64[1]);
  uint64_t result = std::__optional_destruct_base<WebCore::PushSubscriptionData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v13, v11);
LABEL_14:
  if (v17 != -1) {
    return ((uint64_t (*)(__n128 *, unsigned char *))off_1EE9CC4D8[v17])(v13, v15);
  }
  return result;
}

- (uint64_t)getNextPendingPushMessage:(uint64_t)a1
{
  LOBYTE(v10[0]) = 0;
  char v14 = 0;
  if (*(unsigned char *)(a2 + 216))
  {
    std::__optional_copy_base<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>::__optional_copy_base[abi:sn180100]((uint64_t)v10, a2);
    v4 = *(_DWORD **)(a2 + 24);
    if (v4) {
      *v4 += 2;
    }
    v10[3] = (uint64_t)v4;
    BOOL v5 = *(_DWORD **)(a2 + 32);
    if (v5) {
      *v5 += 2;
    }
    v10[4] = (uint64_t)v5;
    long long v11 = *(_OWORD *)(a2 + 40);
    long long v12 = *(_OWORD *)(a2 + 56);
    std::__optional_copy_base<WebCore::NotificationPayload,false>::__optional_copy_base[abi:sn180100](v13, a2 + 72);
    char v14 = 1;
    __n128 v6 = (CFTypeRef *)API::Object::newObject(0xE8uLL, 121);
    *__n128 v6 = &unk_1EE9D1E28;
    WebKit::InitializeWebKit2((WebKit *)v6);
    *__n128 v6 = &unk_1EE9CC530;
    WebKit::WebPushMessage::WebPushMessage((uint64_t)(v6 + 2), v10);
    CFTypeRef v7 = v6[1];
    if (v7) {
      CFRetain(v6[1]);
    }
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))(*(void *)(a1 + 8));
    if (v7) {
      CFRelease(v7);
    }
    CFRelease(v6[1]);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))(*(void *)(a1 + 8));
  }
  return std::__optional_destruct_base<WebKit::WebPushMessage,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v10, v8);
}

- (uint64_t)getNextPendingPushMessage:(const void *)a1
{
  *a1 = &unk_1EE9CC508;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)showNotification:(uint64_t)a1 completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)showNotification:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9CC558;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)getNotifications:(uint64_t)a1 tag:completionHandler:
{
  *(void *)a1 = &unk_1EE9CC580;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)getNotifications:(const void *)a1 tag:completionHandler:
{
  *a1 = &unk_1EE9CC580;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)getNotifications:(uint64_t)a1 tag:(uint64_t)a2 completionHandler:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  LOBYTE(v11) = 0;
  int v13 = -1;
  uint64_t v2 = *(unsigned int *)(a2 + 16);
  if (v2 == -1)
  {
    uint64_t v14 = *MEMORY[0x1E4F28568];
    goto LABEL_16;
  }
  ((void (*)(void *, uint64_t *, uint64_t))off_1EE9CC5A8[v2])(v15, &v11, a2);
  int v13 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    if (v2 == 1)
    {
      if (v12) {
        BOOL v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        BOOL v5 = &stru_1EEA10550;
      }
      v15[0] = v5;
      objc_msgSend(v4, "errorWithDomain:code:userInfo:", @"WKErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
      goto LABEL_11;
    }
LABEL_16:
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:HIDWORD(v12)];
  if (v13) {
    goto LABEL_16;
  }
  CFTypeRef v7 = (void *)v6;
  if (HIDWORD(v12))
  {
    uint64_t v8 = v11;
    unint64_t v9 = (unint64_t)HIDWORD(v12) << 8;
    do
    {
      objc_msgSend(v7, "addObject:", -[_WKNotificationData _initWithCoreData:]([_WKNotificationData alloc], "_initWithCoreData:", v8));
      v8 += 256;
      v9 -= 256;
    }
    while (v9);
  }
LABEL_11:
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v13 != -1) {
    return ((uint64_t (*)(void *, uint64_t *))off_1EE9CC598[v13])(v15, &v11);
  }
  return result;
}

@end