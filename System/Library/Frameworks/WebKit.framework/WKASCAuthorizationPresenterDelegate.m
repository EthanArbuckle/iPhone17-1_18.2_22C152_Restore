@interface WKASCAuthorizationPresenterDelegate
- (WKASCAuthorizationPresenterDelegate)initWithCoordinator:(void *)a3;
- authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(WebKit::AuthenticatorPresenterCoordinator *)this authenticatedContext:completionHandler:;
- (id).cxx_construct;
- (uint64_t)authorizationPresenter:(WTF *)this credentialRequestedForLoginChoice:(WTF::StringImpl *)a2 authenticatedContext:completionHandler:;
- (uint64_t)authorizationPresenter:(WTF *)this credentialRequestedForLoginChoice:(void *)a2 authenticatedContext:completionHandler:;
- (uint64_t)authorizationPresenter:(WTF *)this validateUserEnteredPIN:(WTF::StringImpl *)a2 completionHandler:;
- (uint64_t)authorizationPresenter:(const void *)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:;
- (uint64_t)authorizationPresenter:(const void *)a1 validateUserEnteredPIN:completionHandler:;
- (uint64_t)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(uint64_t)a2 authenticatedContext:completionHandler:;
- (uint64_t)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:;
- (uint64_t)authorizationPresenter:(uint64_t)a1 validateUserEnteredPIN:(uint64_t)a2 completionHandler:;
- (uint64_t)authorizationPresenter:(uint64_t)a1 validateUserEnteredPIN:completionHandler:;
- (uint64_t)dispatchCoordinatorCallback:(WTF *)this;
- (uint64_t)dispatchCoordinatorCallback:(uint64_t)result;
- (void)authorizationPresenter:(id)a3 credentialRequestedForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6;
- (void)authorizationPresenter:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5;
- (void)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(WebKit::AuthenticatorPresenterCoordinator *)this authenticatedContext:completionHandler:;
- (void)authorizationPresenter:(void *)a1 credentialRequestedForLoginChoice:(WTF::StringImpl *)a2 authenticatedContext:completionHandler:;
- (void)authorizationPresenter:(void *)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:;
- (void)authorizationPresenter:(void *)a1 validateUserEnteredPIN:(WTF::StringImpl *)a2 completionHandler:;
- (void)dispatchCoordinatorCallback:(void *)a1;
- (void)dispatchCoordinatorCallback:(void *)a3;
@end

@implementation WKASCAuthorizationPresenterDelegate

- (WKASCAuthorizationPresenterDelegate)initWithCoordinator:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WKASCAuthorizationPresenterDelegate;
  v5 = [(WKASCAuthorizationPresenterDelegate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = *(void *)a3;
    if (*(void *)a3) {
      goto LABEL_7;
    }
    uint64_t v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)uint64_t v6 = 1;
    *(void *)(v6 + 8) = a3;
    v7 = *(unsigned int **)a3;
    *(void *)a3 = v6;
    if (!v7) {
      goto LABEL_7;
    }
    if (atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v4);
    }
    uint64_t v6 = *(void *)a3;
    if (*(void *)a3) {
LABEL_7:
    }
      atomic_fetch_add((atomic_uint *volatile)v6, 1u);
    m_ptr = (unsigned int *)v5->_coordinator.m_impl.m_ptr;
    v5->_coordinator.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v4);
    }
  }
  return v5;
}

- (void)authorizationPresenter:(id)a3 credentialRequestedForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6
{
  v9 = _Block_copy(a6);
  objc_super v10 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(void *)objc_super v10 = &unk_1EE9D2BA0;
  *((void *)v10 + 1) = v9;
  v24 = v10;
  [(WKASCAuthorizationPresenterDelegate *)self dispatchCoordinatorCallback:&v24];
  v11 = v24;
  v24 = 0;
  if (v11) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  WebKit::getASCPlatformPublicKeyCredentialLoginChoiceClass[0](v12);
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if ([a4 isRegistrationRequest])
    {
      if (a5) {
        CFRetain(a5);
      }
      v14 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
      *(void *)v14 = &unk_1EE9D2BF0;
      *((void *)v14 + 1) = a5;
      v24 = v14;
      [(WKASCAuthorizationPresenterDelegate *)self dispatchCoordinatorCallback:&v24];
      v15 = v24;
      v24 = 0;
      if (v15) {
        (*(void (**)(WTF::StringImpl *))(*(void *)v15 + 8))(v15);
      }
      goto LABEL_21;
    }
    MEMORY[0x19972EAD0](&v24, [a4 name]);
    v19 = v24;
    v24 = 0;
    if (a5) {
      CFRetain(a5);
    }
    v20 = (void *)WTF::fastMalloc((WTF *)0x18);
    void *v20 = &unk_1EE9D2C18;
    v20[1] = v19;
    v20[2] = a5;
    v23 = v20;
    [(WKASCAuthorizationPresenterDelegate *)self dispatchCoordinatorCallback:&v23];
  }
  else
  {
    WebKit::getASCSecurityKeyPublicKeyCredentialLoginChoiceClass[0]((WebKit *)isKindOfClass);
    if ((objc_opt_isKindOfClass() & 1) == 0 || [a4 credentialKind] != 1) {
      goto LABEL_21;
    }
    MEMORY[0x19972EAD0](&v24, [a4 name]);
    v16 = v24;
    v24 = 0;
    v17 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v17 = &unk_1EE9D2C40;
    v17[1] = v16;
    v23 = v17;
    [(WKASCAuthorizationPresenterDelegate *)self dispatchCoordinatorCallback:&v23];
  }
  v21 = v23;
  v23 = 0;
  if (v21) {
    (*(void (**)(void *))(*v21 + 8))(v21);
  }
  v22 = v24;
  v24 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy(v22, v18);
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
LABEL_21:
  _Block_release(0);
}

- (void)authorizationPresenter:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  v8 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(void *)v8 = &unk_1EE9D2C68;
  *((void *)v8 + 1) = v7;
  v16 = v8;
  [(WKASCAuthorizationPresenterDelegate *)self dispatchCoordinatorCallback:&v16];
  v9 = v16;
  v16 = 0;
  if (v9) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
  MEMORY[0x19972EAD0](&v16, a4);
  objc_super v10 = v16;
  v16 = 0;
  v11 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v11 = &unk_1EE9D2CB8;
  v11[1] = v10;
  v15 = v11;
  [(WKASCAuthorizationPresenterDelegate *)self dispatchCoordinatorCallback:&v15];
  v13 = v15;
  v15 = 0;
  if (v13) {
    (*(void (**)(void *))(*v13 + 8))(v13);
  }
  v14 = v16;
  v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v12);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  _Block_release(0);
}

- (void)dispatchCoordinatorCallback:(void *)a3
{
  WTF::RunLoop::main((WTF::RunLoop *)self);
  m_ptr = self->_coordinator.m_impl.m_ptr;
  if (m_ptr) {
    atomic_fetch_add((atomic_uint *volatile)m_ptr, 1u);
  }
  uint64_t v6 = *(void *)a3;
  *(void *)a3 = 0;
  v7 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v7 = &unk_1EE9D2CE0;
  v7[1] = m_ptr;
  v7[2] = v6;
  v8 = v7;
  WTF::RunLoop::dispatch();
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_coordinator.m_impl.m_ptr;
  self->_coordinator.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (uint64_t)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)authorizationPresenter:(const void *)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:
{
  *a1 = &unk_1EE9D2BC8;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(uint64_t)a2 authenticatedContext:completionHandler:
{
  v4 = (void *)WTF::fastMalloc((WTF *)0x10);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  void *v4 = &unk_1EE9D2BC8;
  v4[1] = v5;
  uint64_t result = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = v4;
  if (result)
  {
    v7 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v7();
  }
  return result;
}

- (void)authorizationPresenter:(void *)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9D2BF0;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)authorizationPresenter:(WTF *)this credentialRequestedForLoginChoice:(void *)a2 authenticatedContext:completionHandler:
{
  v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9D2BF0;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (void)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(WebKit::AuthenticatorPresenterCoordinator *)this authenticatedContext:completionHandler:
{
}

- (void)authorizationPresenter:(void *)a1 credentialRequestedForLoginChoice:(WTF::StringImpl *)a2 authenticatedContext:completionHandler:
{
  v3 = (WTF::StringImpl *)a1[1];
  *a1 = &unk_1EE9D2C40;
  a1[1] = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, a2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }
  return a1;
}

- (uint64_t)authorizationPresenter:(WTF *)this credentialRequestedForLoginChoice:(WTF::StringImpl *)a2 authenticatedContext:completionHandler:
{
  v3 = (WTF::StringImpl *)*((void *)this + 1);
  *(void *)this = &unk_1EE9D2C40;
  *((void *)this + 1) = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, a2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }

  return WTF::fastFree(this, a2);
}

- authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(WebKit::AuthenticatorPresenterCoordinator *)this authenticatedContext:completionHandler:
{
  return WebKit::AuthenticatorPresenterCoordinator::didSelectAssertionResponse(this, (WTF::StringImpl **)(a1 + 8), 0);
}

- (uint64_t)authorizationPresenter:(uint64_t)a1 validateUserEnteredPIN:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)authorizationPresenter:(const void *)a1 validateUserEnteredPIN:completionHandler:
{
  *a1 = &unk_1EE9D2C90;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)authorizationPresenter:(uint64_t)a1 validateUserEnteredPIN:(uint64_t)a2 completionHandler:
{
  return WTF::CompletionHandler<void ()(WTF::String const&)>::operator()((WTF::RefCountedBase *)(a2 + 96), (WTF::RefCountedBase *)(a1 + 8));
}

- (void)authorizationPresenter:(void *)a1 validateUserEnteredPIN:(WTF::StringImpl *)a2 completionHandler:
{
  v3 = (WTF::StringImpl *)a1[1];
  *a1 = &unk_1EE9D2CB8;
  a1[1] = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, a2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }
  return a1;
}

- (uint64_t)authorizationPresenter:(WTF *)this validateUserEnteredPIN:(WTF::StringImpl *)a2 completionHandler:
{
  v3 = (WTF::StringImpl *)*((void *)this + 1);
  *(void *)this = &unk_1EE9D2CB8;
  *((void *)this + 1) = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2) {
      WTF::StringImpl::destroy(v3, a2);
    }
    else {
      *(_DWORD *)v3 -= 2;
    }
  }

  return WTF::fastFree(this, a2);
}

- (void)dispatchCoordinatorCallback:(void *)a1
{
  *a1 = &unk_1EE9D2CE0;
  uint64_t v3 = a1[2];
  a1[2] = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  v4 = (unsigned int *)a1[1];
  a1[1] = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }
  return a1;
}

- (uint64_t)dispatchCoordinatorCallback:(WTF *)this
{
  *(void *)this = &unk_1EE9D2CE0;
  uint64_t v3 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  v4 = (unsigned int *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)dispatchCoordinatorCallback:(uint64_t)result
{
  uint64_t v1 = *(void *)(result + 8);
  if (v1)
  {
    if (*(void *)(v1 + 8)) {
      return (*(uint64_t (**)(void))(**(void **)(result + 16) + 16))();
    }
  }
  return result;
}

@end