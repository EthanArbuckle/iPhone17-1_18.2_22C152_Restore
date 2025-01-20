@interface WKContactPicker
- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3;
- (ContactInfo)_contactInfoFromCNContact:(SEL)a3;
- (WKContactPicker)initWithView:(id)a3;
- (WKContactPickerDelegate)delegate;
- (id).cxx_construct;
- (id)_contactsFromJSContacts:(id)a3;
- (void)_contactPickerDidDismissWithContactInfo:(void *)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContacts:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dismiss;
- (void)dismissWithContacts:(id)a3;
- (void)presentWithRequestData:(const void *)a3 completionHandler:(void *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation WKContactPicker

- (WKContactPickerDelegate)delegate
{
  WeakRetained = (WKContactPickerDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (WKContactPicker)initWithView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKContactPicker;
  v4 = [(WKContactPicker *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak(&v4->_webView.m_weakReference, a3);
  }
  return v5;
}

- (void)presentWithRequestData:(const void *)a3 completionHandler:(void *)a4
{
  p_properties = &self->_properties;
  if (&self->_properties != a3)
  {
    unsigned int m_size = self->_properties.m_size;
    unsigned int v9 = *((_DWORD *)a3 + 3);
    if (m_size <= v9)
    {
      if (v9 > self->_properties.m_capacity)
      {
        WTF::Vector<WebCore::AuthenticatorTransport,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&self->_properties, 0);
        WTF::Vector<WebCore::AuthenticatorTransport,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)p_properties, (WTF *)*((unsigned int *)a3 + 3));
        unsigned int m_size = self->_properties.m_size;
      }
    }
    else
    {
      self->_properties.unsigned int m_size = v9;
      unsigned int m_size = v9;
    }
    if (m_size)
    {
      memmove(self->_properties.m_buffer, *(const void **)a3, m_size);
      uint64_t v10 = self->_properties.m_size;
    }
    else
    {
      uint64_t v10 = 0;
    }
    memcpy(&self->_properties.m_buffer[v10], (const void *)(*(void *)a3 + v10), *(void *)a3 + *((unsigned int *)a3 + 3) - (*(void *)a3 + v10));
    self->_properties.unsigned int m_size = *((_DWORD *)a3 + 3);
  }
  v11 = *(void **)a4;
  *(void *)a4 = 0;
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = v11;
  if (value) {
    (*(void (**)(void *))(*(void *)value + 8))(value);
  }
  if (*((unsigned char *)a3 + 16)) {
    v13 = WKCNContactPickerMultiSelectDelegate;
  }
  else {
    v13 = WKCNContactPickerSingleSelectDelegate;
  }
  v14 = (void *)[[v13 alloc] initWithContactPickerDelegate:self];
  m_ptr = self->_contactPickerDelegate.m_ptr;
  self->_contactPickerDelegate.m_ptr = v14;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v16 = (void *)[objc_alloc((Class)getCNContactPickerViewControllerClass()) init];
  v17 = self->_contactPickerViewController.m_ptr;
  self->_contactPickerViewController.m_ptr = v16;
  if (v17)
  {
    CFRelease(v17);
    v16 = self->_contactPickerViewController.m_ptr;
  }
  [v16 setDelegate:self->_contactPickerDelegate.m_ptr];
  v18 = self->_contactPickerViewController.m_ptr;
  if (*((void *)a3 + 3)) {
    v19 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v19 = &stru_1EEA10550;
  }
  [v18 setPrompt:v19];
  v20 = objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "_wk_viewControllerForFullScreenPresentation");
  v21 = self->_contactPickerViewController.m_ptr;
  id v22 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3321888768;
  v23[2] = __60__WKContactPicker_presentWithRequestData_completionHandler___block_invoke;
  v23[3] = &__block_descriptor_40_e8_32c73_ZTSKZ60__WKContactPicker_presentWithRequestData_completionHandler__E3__7_e5_v8__0l;
  objc_initWeak(&v22, self);
  id v24 = 0;
  objc_copyWeak(&v24, &v22);
  [v20 presentViewController:v21 animated:1 completion:v23];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
}

void __60__WKContactPicker_presentWithRequestData_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend((id)objc_msgSend(v2, "delegate"), "contactPickerDidPresent:", v2);
    }
    CFRelease(v2);
  }
}

- (void)dismiss
{
}

- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3
{
  if (a3 == 1)
  {
    if (objc_msgSend(self->_contactPickerViewController.m_ptr, "_wk_isInFullscreenPresentation")) {
      return 0;
    }
    goto LABEL_5;
  }
  if ((a3 - 1) <= 1) {
LABEL_5:
  }
    [(WKContactPicker *)self setDelegate:0];
  [(WKContactPicker *)self dismiss];
  return 1;
}

- (void)contactPickerDidCancel:(id)a3
{
  v4[0] = 0;
  v4[1] = 0;
  [(WKContactPicker *)self _contactPickerDidDismissWithContactInfo:v4];
  WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v4, v3);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    [(WKContactPicker *)self _contactInfoFromCNContact:a4];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  int v10 = 1;
  uint64_t v9 = WTF::fastMalloc((WTF *)0x30);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v9, (uint64_t)&v12);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v9 + 16, (uint64_t)&v13);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v9 + 32, (uint64_t)&v14);
  int v11 = 1;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v5);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v6);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v12, v7);
  [(WKContactPicker *)self _contactPickerDidDismissWithContactInfo:&v9];
  WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v8);
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  unint64_t v6 = objc_msgSend(a4, "count", a3);
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (!v6)
  {
LABEL_8:
    [(WKContactPicker *)self _contactPickerDidDismissWithContactInfo:&v24];
    WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v24, v23);
    return;
  }
  unint64_t v7 = v6;
  if (v6 < 0x5555556)
  {
    uint64_t v8 = 0;
    LODWORD(v25) = 48 * (int)v6 / 0x30u;
    uint64_t v24 = WTF::fastMalloc((WTF *)(48 * v6));
    uint64_t v9 = v24 + 24;
    do
    {
      uint64_t v10 = objc_msgSend(a4, "objectAtIndexedSubscript:", v8, v24, v25);
      if (self)
      {
        [(WKContactPicker *)self _contactInfoFromCNContact:v10];
        uint64_t v12 = v26;
        int v14 = v27;
        int v13 = v28;
        uint64_t v15 = v29;
        int v17 = v30;
        int v16 = v31;
        uint64_t v18 = v32;
        int v20 = v33;
        int v19 = v34;
      }
      else
      {
        int v19 = 0;
        int v20 = 0;
        uint64_t v18 = 0;
        int v16 = 0;
        int v17 = 0;
        uint64_t v15 = 0;
        int v13 = 0;
        int v14 = 0;
        uint64_t v12 = 0;
      }
      uint64_t v26 = 0;
      *(void *)(v9 - 24) = v12;
      int v27 = 0;
      *(_DWORD *)(v9 - 16) = v14;
      int v28 = 0;
      *(_DWORD *)(v9 - 12) = v13;
      *(void *)uint64_t v9 = 0;
      uint64_t v29 = 0;
      *(void *)(v9 - 8) = v15;
      int v30 = 0;
      *(_DWORD *)uint64_t v9 = v17;
      int v31 = 0;
      *(_DWORD *)(v9 + 4) = v16;
      *(void *)(v9 + 16) = 0;
      uint64_t v32 = 0;
      *(void *)(v9 + 8) = v18;
      int v33 = 0;
      *(_DWORD *)(v9 + 16) = v20;
      int v34 = 0;
      *(_DWORD *)(v9 + 20) = v19;
      HIDWORD(v25) = ++v8;
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v32, v11);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v29, v21);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v26, v22);
      v9 += 48;
    }
    while (v7 != v8);
    goto LABEL_8;
  }
  __break(0xC471u);
}

- (void)_contactPickerDidDismissWithContactInfo:(void *)a3
{
  v6[0] = *(void *)a3;
  uint64_t v4 = *((void *)a3 + 1);
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  v6[1] = v4;
  char v7 = 1;
  WTF::CompletionHandler<void ()(std::optional<WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>> &&)>::operator()((uint64_t *)&self->_completionHandler);
  WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v6, v5);
  objc_loadWeak(&self->_delegate.m_weakReference);
  if (objc_opt_respondsToSelector()) {
    [objc_loadWeak(&self->_delegate.m_weakReference) contactPickerDidDismiss:self];
  }
}

- (ContactInfo)_contactInfoFromCNContact:(SEL)a3
{
  v42[1] = *(_DWORD **)MEMORY[0x1E4F143B8];
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  uint64_t m_buffer_high = HIDWORD(self->var2.m_buffer);
  if (m_buffer_high)
  {
    char v7 = self;
    uint64_t v8 = 0;
    uint64_t v9 = *(unsigned __int8 **)&self->var1.m_capacity;
    do
    {
      if (v9[v8] == 1)
      {
        uint64_t v10 = [(id)getCNContactFormatterClass() stringFromContact:a4 style:0];
        MEMORY[0x19972EAD0](v42, v10);
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)&v38, v42, 1uLL);
        uint64_t m_size = retstr->var0.m_size;
        if (m_size) {
          WTF::VectorDestructor<true,WTF::String>::destruct((WTF::StringImpl *)retstr->var0.m_buffer, (WTF::StringImpl *)&retstr->var0.m_buffer[m_size]);
        }
        m_buffer = retstr->var0.m_buffer;
        if (retstr->var0.m_buffer)
        {
          retstr->var0.m_buffer = 0;
          retstr->var0.m_capacity = 0;
          WTF::fastFree((WTF *)m_buffer, v11);
        }
        retstr->var0.m_buffer = v38;
        uint64_t v14 = v39;
        v38 = 0;
        uint64_t v39 = 0;
        *(void *)&retstr->var0.m_capacity = v14;
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v38, v11);
        self = (ContactInfo *)v42[0];
        v42[0] = 0;
        if (self)
        {
          if (LODWORD(self->var0.m_buffer) == 2) {
            self = (ContactInfo *)WTF::StringImpl::destroy((WTF::StringImpl *)self, v15);
          }
          else {
            LODWORD(self->var0.m_buffer) -= 2;
          }
        }
        uint64_t m_buffer_high = HIDWORD(v7->var2.m_buffer);
        if (m_buffer_high)
        {
          uint64_t v9 = *(unsigned __int8 **)&v7->var1.m_capacity;
          break;
        }
        return self;
      }
      ++v8;
    }
    while (m_buffer_high != v8);
    while (*v9++)
    {
      if (!--m_buffer_high) {
        goto LABEL_30;
      }
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    int v17 = (void *)[a4 emailAddresses];
    self = (ContactInfo *)[v17 countByEnumeratingWithState:&v34 objects:v41 count:16];
    uint64_t v18 = self;
    if (self)
    {
      uint64_t v19 = *(void *)v35;
      do
      {
        int v20 = 0;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v17);
          }
          v38 = (String *)[*(id *)(*((void *)&v34 + 1) + 8 * (void)v20) value];
          uint64_t v21 = retstr->var1.m_size;
          if (v21 == retstr->var1.m_capacity)
          {
            WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,NSString *&>((uint64_t)&retstr->var1, &v38);
          }
          else
          {
            MEMORY[0x19972EAD0](&retstr->var1.m_buffer[v21]);
            ++retstr->var1.m_size;
          }
          int v20 = (ContactInfo *)((char *)v20 + 1);
        }
        while (v18 != v20);
        self = (ContactInfo *)[v17 countByEnumeratingWithState:&v34 objects:v41 count:16];
        uint64_t v18 = self;
      }
      while (self);
    }
LABEL_30:
    uint64_t v22 = HIDWORD(v7->var2.m_buffer);
    if (v22)
    {
      v23 = *(unsigned __int8 **)&v7->var1.m_capacity;
      while (1)
      {
        int v24 = *v23++;
        if (v24 == 2) {
          break;
        }
        if (!--v22) {
          return self;
        }
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v25 = objc_msgSend(a4, "phoneNumbers", 0);
      self = (ContactInfo *)[v25 countByEnumeratingWithState:&v30 objects:v40 count:16];
      uint64_t v26 = self;
      if (self)
      {
        uint64_t v27 = *(void *)v31;
        do
        {
          int v28 = 0;
          do
          {
            if (*(void *)v31 != v27) {
              objc_enumerationMutation(v25);
            }
            v38 = (String *)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)v28), "value"), "stringValue");
            uint64_t v29 = retstr->var2.m_size;
            if (v29 == retstr->var2.m_capacity)
            {
              WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,NSString *&>((uint64_t)&retstr->var2, &v38);
            }
            else
            {
              MEMORY[0x19972EAD0](&retstr->var2.m_buffer[v29]);
              ++retstr->var2.m_size;
            }
            int v28 = (ContactInfo *)((char *)v28 + 1);
          }
          while (v26 != v28);
          self = (ContactInfo *)[v25 countByEnumeratingWithState:&v30 objects:v40 count:16];
          uint64_t v26 = self;
        }
        while (self);
      }
    }
  }
  return self;
}

- (void)dismissWithContacts:(id)a3
{
  m_ptr = self->_contactPickerViewController.m_ptr;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __39__WKContactPicker_dismissWithContacts___block_invoke;
  v10[3] = &__block_descriptor_56_e8_32c52_ZTSKZ39__WKContactPicker_dismissWithContacts__E3__8_e5_v8__0l;
  id v8 = 0;
  objc_initWeak(&v8, self);
  CFTypeRef cf = a3;
  if (a3) {
    CFRetain(a3);
  }
  v10[4] = self;
  id v11 = 0;
  objc_copyWeak(&v11, &v8);
  CFTypeRef v12 = cf;
  if (cf) {
    CFRetain(cf);
  }
  objc_msgSend(m_ptr, "dismissViewControllerAnimated:completion:", 0, v10, self);
  CFTypeRef v5 = cf;
  CFTypeRef cf = 0;
  if (v5) {
    CFRelease(v5);
  }
  objc_destroyWeak(&v8);
  CFTypeRef v6 = v12;
  CFTypeRef v12 = 0;
  if (v6) {
    CFRelease(v6);
  }
  objc_destroyWeak(&v11);
}

void __39__WKContactPicker_dismissWithContacts___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "contactPicker:didSelectContacts:", *(void *)(*(void *)(a1 + 32) + 56), objc_msgSend(WeakRetained, "_contactsFromJSContacts:", *(void *)(a1 + 48)));
    CFRelease(v3);
  }
}

- (id)_contactsFromJSContacts:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    int v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v4)
    {
      uint64_t v27 = *(void *)v39;
      id v23 = v3;
      do
      {
        uint64_t v5 = 0;
        uint64_t v25 = v4;
        do
        {
          if (*(void *)v39 != v27) {
            objc_enumerationMutation(v3);
          }
          CFTypeRef v6 = *(void **)(*((void *)&v38 + 1) + 8 * v5);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFTypeRef cf = (void *)[objc_alloc((Class)off_1EC2B20C8()) init];
            char v7 = (void *)[v6 objectForKey:@"name"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              memset(v37, 0, sizeof(v37));
              if (objc_msgSend((id)objc_msgSend(v7, "filteredArrayUsingPredicate:", v26), "countByEnumeratingWithState:objects:count:", v37, v44, 16))
              {
                [cf setGivenName:**((void **)&v37[0] + 1)];
              }
            }
            id v8 = (void *)[v6 objectForKey:@"email"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              uint64_t v10 = (void *)[v8 filteredArrayUsingPredicate:v26];
              uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
              if (v11)
              {
                uint64_t v12 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0; i != v11; ++i)
                  {
                    if (*(void *)v34 != v12) {
                      objc_enumerationMutation(v10);
                    }
                    objc_msgSend(v9, "addObject:", objc_msgSend((id)_MergedGlobals_119(), "labeledValueWithLabel:value:", 0, *(void *)(*((void *)&v33 + 1) + 8 * i)));
                  }
                  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
                }
                while (v11);
              }
              [cf setEmailAddresses:v9];
              id v3 = v23;
              uint64_t v4 = v25;
            }
            uint64_t v14 = (void *)[v6 objectForKey:@"tel"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = (void *)[MEMORY[0x1E4F1CA48] array];
              long long v31 = 0u;
              long long v32 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              int v16 = (void *)[v14 filteredArrayUsingPredicate:v26];
              uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v42 count:16];
              if (v17)
              {
                uint64_t v18 = *(void *)v30;
                do
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if (*(void *)v30 != v18) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v20 = [(id)off_1EC2B20C0() phoneNumberWithStringValue:*(void *)(*((void *)&v29 + 1) + 8 * j)];
                    objc_msgSend(v15, "addObject:", objc_msgSend((id)_MergedGlobals_119(), "labeledValueWithLabel:value:", 0, v20));
                  }
                  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v42 count:16];
                }
                while (v17);
              }
              [cf setPhoneNumbers:v15];
              uint64_t v4 = v25;
            }
            [v24 addObject:cf];
            if (cf) {
              CFRelease(cf);
            }
          }
          ++v5;
        }
        while (v5 != v4);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v4);
    }
    return v24;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v22 array];
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_contactPickerViewController.m_ptr;
  self->_contactPickerViewController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_contactPickerDelegate.m_ptr;
  self->_contactPickerDelegate.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8))(value, a2);
  }
  m_buffer = self->_properties.m_buffer;
  if (m_buffer)
  {
    self->_properties.m_buffer = 0;
    self->_properties.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  objc_destroyWeak(&self->_delegate.m_weakReference);

  objc_destroyWeak(&self->_webView.m_weakReference);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end