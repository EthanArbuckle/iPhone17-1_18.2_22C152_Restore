@interface WKPaymentAuthorizationDelegate
- (id).cxx_construct;
- (id)_initWithRequest:(id)a3 presenter:(void *)a4;
- (void)_didAuthorizePayment:(id)a3 completion:(id)a4;
- (void)_didChangeCouponCode:(id)a3 completion:(id)a4;
- (void)_didFinish;
- (void)_didRequestMerchantSession:(id)a3;
- (void)_didSelectPaymentMethod:(id)a3 completion:(id)a4;
- (void)_didSelectShippingContact:(id)a3 completion:(id)a4;
- (void)_didSelectShippingMethod:(id)a3 completion:(id)a4;
- (void)_getPaymentServicesMerchantURL:(id)a3;
- (void)_willFinishWithError:(id)a3;
- (void)completeCouponCodeChange:(id)a3;
- (void)completeMerchantValidation:(id)a3 error:(id)a4;
- (void)completePaymentMethodSelection:(id)a3;
- (void)completePaymentSession:(int64_t)a3 errors:(id)a4;
- (void)completePaymentSession:(int64_t)a3 errors:(id)a4 orderDetails:(id)a5;
- (void)completeShippingContactSelection:(id)a3;
- (void)completeShippingMethodSelection:(id)a3;
- (void)invalidate;
@end

@implementation WKPaymentAuthorizationDelegate

- (void)completeMerchantValidation:(id)a3 error:(id)a4
{
  m_block = (void (**)(id, id, id))self->_didRequestMerchantSessionCompletion.m_block;
  self->_didRequestMerchantSessionCompletion.m_block = 0;
  v8 = _Block_copy(0);
  _Block_release(self->_didRequestMerchantSessionCompletion.m_block);
  self->_didRequestMerchantSessionCompletion.m_block = v8;
  _Block_release(0);
  m_block[2](m_block, a3, a4);

  _Block_release(m_block);
}

- (void)completePaymentMethodSelection:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    CFRetain(a3);
    v5 = objc_msgSend((id)objc_msgSend(v4, "paymentSummaryItems"), "copy");
    m_ptr = self->_summaryItems.m_ptr;
    self->_summaryItems.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v7 = objc_msgSend((id)objc_msgSend(v4, "availableShippingMethods"), "copy");
    v8 = self->_availableShippingMethods.m_ptr;
    self->_availableShippingMethods.m_ptr = v7;
    if (v8) {
      CFRelease(v8);
    }
  }
  else
  {
    id v4 = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E4FB6440])(self, a2)), "initWithPaymentSummaryItems:", self->_summaryItems.m_ptr);
    [v4 setAvailableShippingMethods:self->_availableShippingMethods.m_ptr];
  }
  m_block = (void (**)(id, id))self->_didSelectPaymentMethodCompletion.m_block;
  self->_didSelectPaymentMethodCompletion.m_block = 0;
  v10 = _Block_copy(0);
  _Block_release(self->_didSelectPaymentMethodCompletion.m_block);
  self->_didSelectPaymentMethodCompletion.m_block = v10;
  _Block_release(0);
  m_block[2](m_block, v4);
  _Block_release(m_block);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)completePaymentSession:(int64_t)a3 errors:(id)a4
{
  v5 = (const void *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E4FB6408])(self, a2)), "initWithStatus:errors:", a3, a4);
  m_block = (void (**)(id, const void *))self->_didAuthorizePaymentCompletion.m_block;
  self->_didAuthorizePaymentCompletion.m_block = 0;
  v7 = _Block_copy(0);
  _Block_release(self->_didAuthorizePaymentCompletion.m_block);
  self->_didAuthorizePaymentCompletion.m_block = v7;
  _Block_release(0);
  m_block[2](m_block, v5);
  _Block_release(m_block);
  if (v5)
  {
    CFRelease(v5);
  }
}

- (void)completePaymentSession:(int64_t)a3 errors:(id)a4 orderDetails:(id)a5
{
  v7 = objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E4FB6408])(self, a2)), "initWithStatus:errors:", a3, a4);
  [v7 setOrderDetails:a5];
  m_block = (void (**)(id, void *))self->_didAuthorizePaymentCompletion.m_block;
  self->_didAuthorizePaymentCompletion.m_block = 0;
  v9 = _Block_copy(0);
  _Block_release(self->_didAuthorizePaymentCompletion.m_block);
  self->_didAuthorizePaymentCompletion.m_block = v9;
  _Block_release(0);
  m_block[2](m_block, v7);
  _Block_release(m_block);
  if (v7)
  {
    CFRelease(v7);
  }
}

- (void)completeShippingContactSelection:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    CFRetain(a3);
    v5 = objc_msgSend((id)objc_msgSend(v4, "paymentSummaryItems"), "copy");
    m_ptr = self->_summaryItems.m_ptr;
    self->_summaryItems.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v7 = objc_msgSend((id)objc_msgSend(v4, "availableShippingMethods"), "copy");
    v8 = self->_availableShippingMethods.m_ptr;
    self->_availableShippingMethods.m_ptr = v7;
    if (v8) {
      CFRelease(v8);
    }
  }
  else
  {
    id v4 = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E4FB6460])(self, a2)), "initWithPaymentSummaryItems:", self->_summaryItems.m_ptr);
    [v4 setAvailableShippingMethods:self->_availableShippingMethods.m_ptr];
  }
  m_block = (void (**)(id, id))self->_didSelectShippingContactCompletion.m_block;
  self->_didSelectShippingContactCompletion.m_block = 0;
  v10 = _Block_copy(0);
  _Block_release(self->_didSelectShippingContactCompletion.m_block);
  self->_didSelectShippingContactCompletion.m_block = v10;
  _Block_release(0);
  m_block[2](m_block, v4);
  _Block_release(m_block);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)completeShippingMethodSelection:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    CFRetain(a3);
    v5 = objc_msgSend((id)objc_msgSend(v4, "paymentSummaryItems"), "copy");
    m_ptr = self->_summaryItems.m_ptr;
    self->_summaryItems.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v7 = objc_msgSend((id)objc_msgSend(v4, "availableShippingMethods"), "copy");
    v8 = self->_availableShippingMethods.m_ptr;
    self->_availableShippingMethods.m_ptr = v7;
    if (v8) {
      CFRelease(v8);
    }
  }
  else
  {
    id v4 = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E4FB6458])(self, a2)), "initWithPaymentSummaryItems:", self->_summaryItems.m_ptr);
    [v4 setAvailableShippingMethods:self->_availableShippingMethods.m_ptr];
  }
  m_block = (void (**)(id, id))self->_didSelectShippingMethodCompletion.m_block;
  self->_didSelectShippingMethodCompletion.m_block = 0;
  v10 = _Block_copy(0);
  _Block_release(self->_didSelectShippingMethodCompletion.m_block);
  self->_didSelectShippingMethodCompletion.m_block = v10;
  _Block_release(0);
  m_block[2](m_block, v4);
  _Block_release(m_block);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)completeCouponCodeChange:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    CFRetain(a3);
    v5 = objc_msgSend((id)objc_msgSend(v4, "paymentSummaryItems"), "copy");
    m_ptr = self->_summaryItems.m_ptr;
    self->_summaryItems.m_ptr = v5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v7 = objc_msgSend((id)objc_msgSend(v4, "availableShippingMethods"), "copy");
    v8 = self->_availableShippingMethods.m_ptr;
    self->_availableShippingMethods.m_ptr = v7;
    if (v8) {
      CFRelease(v8);
    }
  }
  else
  {
    id v4 = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E4FB6430])(self, a2)), "initWithPaymentSummaryItems:", self->_summaryItems.m_ptr);
    [v4 setAvailableShippingMethods:self->_availableShippingMethods.m_ptr];
  }
  m_block = (void (**)(id, id))self->_didChangeCouponCodeCompletion.m_block;
  self->_didChangeCouponCodeCompletion.m_block = 0;
  v10 = _Block_copy(0);
  _Block_release(self->_didChangeCouponCodeCompletion.m_block);
  self->_didChangeCouponCodeCompletion.m_block = v10;
  _Block_release(0);
  m_block[2](m_block, v4);
  _Block_release(m_block);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)invalidate
{
  if (self->_didAuthorizePaymentCompletion.m_block) {
    [(WKPaymentAuthorizationDelegate *)self completePaymentSession:1 errors:MEMORY[0x1E4F1CBF0]];
  }
}

- (void).cxx_destruct
{
  _Block_release(self->_didChangeCouponCodeCompletion.m_block);
  _Block_release(self->_didSelectShippingMethodCompletion.m_block);
  _Block_release(self->_didSelectShippingContactCompletion.m_block);
  _Block_release(self->_didSelectPaymentMethodCompletion.m_block);
  _Block_release(self->_didRequestMerchantSessionCompletion.m_block);
  _Block_release(self->_didAuthorizePaymentCompletion.m_block);
  m_ptr = self->_sessionError.m_ptr;
  self->_sessionError.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v5 = self->_availableShippingMethods.m_ptr;
  self->_availableShippingMethods.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->_summaryItems.m_ptr;
  self->_summaryItems.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = (unsigned int *)self->_presenter.m_impl.m_ptr;
  self->_presenter.m_impl.m_ptr = 0;
  if (v7 && atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v7);
    WTF::fastFree((WTF *)v7, v3);
  }
  v8 = self->_request.m_ptr;
  self->_request.m_ptr = 0;
  if (v8)
  {
    CFRelease(v8);
  }
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (id)_initWithRequest:(id)a3 presenter:(void *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)WKPaymentAuthorizationDelegate;
  v7 = [(WKPaymentAuthorizationDelegate *)&v19 init];
  if (!v7) {
    return v7;
  }
  uint64_t v8 = *((void *)a4 + 1);
  if (v8) {
    goto LABEL_7;
  }
  uint64_t v8 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)uint64_t v8 = 1;
  *(void *)(v8 + 8) = a4;
  v9 = (unsigned int *)*((void *)a4 + 1);
  *((void *)a4 + 1) = v8;
  if (!v9) {
    goto LABEL_7;
  }
  if (atomic_fetch_add((atomic_uint *volatile)v9, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v9);
    WTF::fastFree((WTF *)v9, v6);
  }
  uint64_t v8 = *((void *)a4 + 1);
  if (v8) {
LABEL_7:
  }
    atomic_fetch_add((atomic_uint *volatile)v8, 1u);
  m_ptr = (unsigned int *)v7->_presenter.m_impl.m_ptr;
  v7->_presenter.m_impl.m_ptr = (DefaultWeakPtrImpl *)v8;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, v6);
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (a3) {
LABEL_11:
  }
    CFRetain(a3);
LABEL_12:
  v11 = v7->_request.m_ptr;
  v7->_request.m_ptr = a3;
  if (v11) {
    CFRelease(v11);
  }
  v12 = (void *)[a3 availableShippingMethods];
  v13 = v12;
  if (v12) {
    CFRetain(v12);
  }
  v14 = v7->_availableShippingMethods.m_ptr;
  v7->_availableShippingMethods.m_ptr = v13;
  if (v14) {
    CFRelease(v14);
  }
  v15 = (void *)[a3 paymentSummaryItems];
  v16 = v15;
  if (v15) {
    CFRetain(v15);
  }
  v17 = v7->_summaryItems.m_ptr;
  v7->_summaryItems.m_ptr = v16;
  if (v17) {
    CFRelease(v17);
  }
  return v7;
}

- (void)_didAuthorizePayment:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_release(self->_didAuthorizePaymentCompletion.m_block);
  self->_didAuthorizePaymentCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (uint64_t v8 = *((void *)m_ptr + 1)) != 0)
  {
    uint64_t v9 = *(void *)(v8 + 16);
    if (a3) {
      CFRetain(a3);
    }
    WebCore::Payment::Payment();
    (*(void (**)(uint64_t, uint64_t, unsigned char *))(*(void *)v9 + 16))(v9, v8, v11);
    WebCore::Payment::~Payment((WebCore::Payment *)v11);
    if (a3) {
      CFRelease(a3);
    }
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
    [(WKPaymentAuthorizationDelegate *)self completePaymentSession:1 errors:v10];
  }
}

- (void)_didFinish
{
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr)
  {
    uint64_t v3 = *((void *)m_ptr + 1);
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 16);
      CFTypeRef v6 = self->_sessionError.m_ptr;
      self->_sessionError.m_ptr = 0;
      WebCore::PaymentSessionError::PaymentSessionError();
      (*(void (**)(uint64_t, uint64_t, CFTypeRef *))(*(void *)v4 + 24))(v4, v3, &cf);
      CFTypeRef v5 = cf;
      CFTypeRef cf = 0;
      if (v5) {
        CFRelease(v5);
      }
      if (v6) {
        CFRelease(v6);
      }
    }
  }
}

- (void)_didRequestMerchantSession:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_release(self->_didRequestMerchantSessionCompletion.m_block);
  self->_didRequestMerchantSessionCompletion.m_block = v4;
  _Block_release(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__WKPaymentAuthorizationDelegate_Protected___didRequestMerchantSession___block_invoke;
  v5[3] = &unk_1E5811CE8;
  v5[4] = self;
  [(WKPaymentAuthorizationDelegate *)self _getPaymentServicesMerchantURL:v5];
}

uint64_t __72__WKPaymentAuthorizationDelegate_Protected___didRequestMerchantSession___block_invoke(WTF::RunLoop *a1, const void *a2)
{
  WTF::RunLoop::main(a1);
  uint64_t v4 = (const void *)*((void *)a1 + 4);
  if (v4) {
    CFRetain(v4);
  }
  if (a2) {
    CFRetain(a2);
  }
  CFTypeRef v5 = (void *)WTF::fastMalloc((WTF *)0x20);
  void *v5 = &unk_1EE9BDA48;
  v5[1] = v4;
  v5[2] = v4;
  v5[3] = a2;
  v7 = v5;
  WTF::RunLoop::dispatch();
  uint64_t result = (uint64_t)v7;
  if (v7) {
    return (*(uint64_t (**)(void *))(*v7 + 8))(v7);
  }
  return result;
}

- (void)_didSelectPaymentMethod:(id)a3 completion:(id)a4
{
  CFTypeRef v6 = _Block_copy(a4);
  _Block_release(self->_didSelectPaymentMethodCompletion.m_block);
  self->_didSelectPaymentMethodCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (uint64_t v8 = *((void *)m_ptr + 1)) != 0)
  {
    uint64_t v9 = *(void *)(v8 + 16);
    if (a3) {
      CFRetain(a3);
    }
    WebCore::PaymentMethod::PaymentMethod();
    (*(void (**)(uint64_t, uint64_t, unsigned char *))(*(void *)v9 + 32))(v9, v8, v10);
    WebCore::PaymentMethod::~PaymentMethod((WebCore::PaymentMethod *)v10);
    if (a3) {
      CFRelease(a3);
    }
  }
  else
  {
    [(WKPaymentAuthorizationDelegate *)self completePaymentMethodSelection:0];
  }
}

- (void)_didSelectShippingContact:(id)a3 completion:(id)a4
{
  CFTypeRef v6 = _Block_copy(a4);
  _Block_release(self->_didSelectShippingContactCompletion.m_block);
  self->_didSelectShippingContactCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (uint64_t v8 = *((void *)m_ptr + 1)) != 0)
  {
    uint64_t v9 = *(void *)(v8 + 16);
    if (a3) {
      CFRetain(a3);
    }
    WebCore::PaymentContact::PaymentContact();
    (*(void (**)(uint64_t, uint64_t, unsigned char *))(*(void *)v9 + 40))(v9, v8, v10);
    WebCore::PaymentContact::~PaymentContact((WebCore::PaymentContact *)v10);
    if (a3) {
      CFRelease(a3);
    }
  }
  else
  {
    [(WKPaymentAuthorizationDelegate *)self completeShippingContactSelection:0];
  }
}

- (void)_didSelectShippingMethod:(id)a3 completion:(id)a4
{
  CFTypeRef v6 = _Block_copy(a4);
  _Block_release(self->_didSelectShippingMethodCompletion.m_block);
  self->_didSelectShippingMethodCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (uint64_t v8 = *((void *)m_ptr + 1)) != 0)
  {
    uint64_t v9 = *(void *)(v8 + 16);
    char v40 = 0;
    char v41 = 0;
    LOBYTE(v24) = 0;
    MEMORY[0x19972EAD0](&v42, objc_msgSend((id)objc_msgSend(a3, "amount"), "stringValue"));
    v23[0] = v42;
    MEMORY[0x19972EAD0](&v42, [a3 detail]);
    v22[1] = v42;
    MEMORY[0x19972EAD0](&v42, [a3 identifier]);
    v23[1] = v42;
    MEMORY[0x19972EAD0](&v42, objc_msgSend(a3, "label", v42));
    v22[0] = v42;
    if ([a3 dateComponentsRange])
    {
      uint64_t v10 = (void *)[a3 dateComponentsRange];
      v11 = (void *)[v10 startDateComponents];
      int v12 = [v11 year];
      int v13 = [v11 month];
      int v14 = [v11 day];
      int v15 = [v11 hour];
      v16 = (void *)[v10 endDateComponents];
      int v24 = v12;
      char v25 = 1;
      int v26 = v13;
      char v27 = 1;
      int v28 = v14;
      char v29 = 1;
      int v30 = v15;
      char v31 = 1;
      int v32 = [v16 year];
      char v33 = 1;
      int v34 = [v16 month];
      char v35 = 1;
      int v36 = [v16 day];
      char v37 = 1;
      int v38 = [v16 hour];
      char v39 = 1;
      char v40 = 1;
    }
    char v41 = 1;
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(void *)v9 + 48))(v9, v8, v22);
    v18 = v23[1];
    v23[1] = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2) {
        WTF::StringImpl::destroy(v18, v17);
      }
      else {
        *(_DWORD *)v18 -= 2;
      }
    }
    objc_super v19 = v23[0];
    v23[0] = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2) {
        WTF::StringImpl::destroy(v19, v17);
      }
      else {
        *(_DWORD *)v19 -= 2;
      }
    }
    v20 = v22[1];
    v22[1] = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2) {
        WTF::StringImpl::destroy(v20, v17);
      }
      else {
        *(_DWORD *)v20 -= 2;
      }
    }
    v21 = v22[0];
    v22[0] = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2) {
        WTF::StringImpl::destroy(v21, v17);
      }
      else {
        *(_DWORD *)v21 -= 2;
      }
    }
  }
  else
  {
    [(WKPaymentAuthorizationDelegate *)self completeShippingMethodSelection:0];
  }
}

- (void)_didChangeCouponCode:(id)a3 completion:(id)a4
{
  CFTypeRef v6 = _Block_copy(a4);
  _Block_release(self->_didChangeCouponCodeCompletion.m_block);
  self->_didChangeCouponCodeCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (uint64_t v8 = *((void *)m_ptr + 1)) != 0)
  {
    uint64_t v9 = *(void *)(v8 + 16);
    MEMORY[0x19972EAD0](&v12, a3);
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(void *)v9 + 56))(v9, v8, &v12);
    v11 = v12;
    int v12 = 0;
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
  else
  {
    [(WKPaymentAuthorizationDelegate *)self completeCouponCodeChange:0];
  }
}

- (void)_getPaymentServicesMerchantURL:(id)a3
{
}

- (void)_willFinishWithError:(id)a3
{
  CFTypeRef v5 = (void *)[a3 domain];
  if ([v5 isEqualToString:PAL::get_PassKitCore_PKPassKitErrorDomain((PAL *)v5)])
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = self->_sessionError.m_ptr;
    self->_sessionError.m_ptr = a3;
    if (m_ptr)
    {
      CFRelease(m_ptr);
    }
  }
}

@end