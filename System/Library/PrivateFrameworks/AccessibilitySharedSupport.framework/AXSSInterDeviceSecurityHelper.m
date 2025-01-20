@interface AXSSInterDeviceSecurityHelper
- (AXSSInterDeviceSecurityHelper)init;
- (__SecIdentity)_appleIDIdentity;
- (id)_certificateChain;
- (id)securityIdentity;
- (void)_appleIDIdentity;
- (void)_appleIDsDidChange;
- (void)_certificateChain;
- (void)dealloc;
- (void)securityIdentity;
- (void)verifyCertificate:(id)a3 completion:(id)a4;
@end

@implementation AXSSInterDeviceSecurityHelper

- (AXSSInterDeviceSecurityHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSSInterDeviceSecurityHelper;
  v2 = [(AXSSInterDeviceSecurityHelper *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_appleIDsDidChange, @"SFAppleIDIdentityDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SFAppleIDIdentityDidChangeNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)AXSSInterDeviceSecurityHelper;
  [(AXSSInterDeviceSecurityHelper *)&v4 dealloc];
}

- (void)_appleIDsDidChange
{
  v3 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B3B9D000, v3, OS_LOG_TYPE_DEFAULT, "Apple IDs changed", v6, 2u);
  }

  cachedCertificateChain = self->_cachedCertificateChain;
  self->_cachedAppleIDIdentity = 0;
  self->_cachedCertificateChain = 0;

  cachedSecurityIdentity = self->_cachedSecurityIdentity;
  self->_cachedSecurityIdentity = 0;
}

- (__SecIdentity)_appleIDIdentity
{
  result = self->_cachedAppleIDIdentity;
  if (!result)
  {
    uint64_t v24 = 0;
    objc_super v4 = (void *)_AppleIDAuthenticationCopyAppleIDs();
    objc_super v5 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXSSInterDeviceSecurityHelper _appleIDIdentity].cold.4();
    }

    if ([v4 count])
    {
      v6 = [v4 lastObject];
      uint64_t v7 = _AppleIDCopySecIdentityForAppleIDAccount();
      if (v7)
      {
        v8 = (__SecIdentity *)v7;
        v9 = _AppleIDAuthenticationCopyCertificateInfo();
        v10 = [v9 objectForKeyedSubscript:@"CertificateReference"];

        if (v10)
        {
          self->_cachedAppleIDIdentity = v8;
        }
        else
        {
          v23 = AXSSLogForCategory(1);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[AXSSInterDeviceSecurityHelper _appleIDIdentity]();
          }
        }
      }
      else
      {
        v9 = AXSSLogForCategory(1);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(AXSSInterDeviceSecurityHelper *)(uint64_t)&v24 _appleIDIdentity];
        }
      }
    }
    else
    {
      v6 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(AXSSInterDeviceSecurityHelper *)(uint64_t)&v24 _appleIDIdentity];
      }
    }

    return self->_cachedAppleIDIdentity;
  }
  return result;
}

- (id)_certificateChain
{
  v34[1] = *MEMORY[0x1E4F143B8];
  cachedCertificateChain = self->_cachedCertificateChain;
  if (!cachedCertificateChain)
  {
    objc_super v4 = [(AXSSInterDeviceSecurityHelper *)self _appleIDIdentity];
    if (v4)
    {
      objc_super v5 = v4;
      SecCertificateRef certificateRef = 0;
      v6 = [MEMORY[0x1E4F1CA48] array];
      OSStatus v7 = SecIdentityCopyCertificate(v5, &certificateRef);
      int v8 = v7;
      if (!certificateRef || v7)
      {
        uint64_t v22 = AXSSLogForCategory(1);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          [(AXSSInterDeviceSecurityHelper *)v8 _certificateChain];
        }
      }
      else
      {
        SecTrustRef trust = 0;
        v34[0] = certificateRef;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
        SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
        OSStatus v11 = SecTrustCreateWithCertificates(v9, BasicX509, &trust);
        if (BasicX509) {
          CFRelease(BasicX509);
        }
        if (!trust || v11)
        {
          v23 = AXSSLogForCategory(1);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            [(AXSSInterDeviceSecurityHelper *)v11 _certificateChain];
          }
        }
        else
        {
          CFErrorRef error = 0;
          BOOL v12 = SecTrustEvaluateWithError(trust, &error);
          if (error || !v12)
          {
            p_super = AXSSLogForCategory(1);
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
              [(AXSSInterDeviceSecurityHelper *)(uint64_t)&error _certificateChain];
            }
          }
          else
          {
            CFIndex CertificateCount = SecTrustGetCertificateCount(trust);
            CFIndex v14 = CertificateCount - 1;
            if (CertificateCount >= 1)
            {
              CFIndex v15 = CertificateCount;
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (v14 == i) {
                  break;
                }
                CFArrayRef v17 = SecTrustCopyCertificateChain(trust);
                CFArrayRef v18 = v17;
                if (v17)
                {
                  uint64_t v19 = [(__CFArray *)v17 objectAtIndex:i];
                  if (v19) {
                    [v6 addObject:v19];
                  }
                }
              }
            }
            if ([v6 count] == 2)
            {
              uint64_t v20 = v6;
              p_super = &self->_cachedCertificateChain->super;
              self->_cachedCertificateChain = v20;
            }
            else
            {
              p_super = AXSSLogForCategory(1);
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
                -[AXSSInterDeviceSecurityHelper _certificateChain]();
              }
            }
          }

          if (error) {
            CFRelease(error);
          }
        }
        if (trust) {
          CFRelease(trust);
        }
      }
      if (certificateRef) {
        CFRelease(certificateRef);
      }
    }
    cachedCertificateChain = self->_cachedCertificateChain;
  }

  return cachedCertificateChain;
}

- (id)securityIdentity
{
  v17[1] = *MEMORY[0x1E4F143B8];
  cachedSecurityIdentity = self->_cachedSecurityIdentity;
  if (!cachedSecurityIdentity)
  {
    objc_super v4 = [(AXSSInterDeviceSecurityHelper *)self _certificateChain];
    if ([v4 count])
    {
      objc_super v5 = [(AXSSInterDeviceSecurityHelper *)self _appleIDIdentity];
      if (v5)
      {
        v17[0] = v5;
        v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
        OSStatus v7 = [v6 arrayByAddingObjectsFromArray:v4];
        int v8 = self->_cachedSecurityIdentity;
        self->_cachedSecurityIdentity = v7;
      }
      else
      {
        v6 = AXSSLogForCategory(0);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          [(AXSSInterDeviceSecurityHelper *)v6 securityIdentity];
        }
      }
    }
    cachedSecurityIdentity = self->_cachedSecurityIdentity;
  }

  return cachedSecurityIdentity;
}

- (void)verifyCertificate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  OSStatus v7 = (void (**)(void, void))v6;
  if (a3)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke;
    uint64_t v13 = &unk_1E606C830;
    uint64_t v14 = self;
    id v15 = v6;
    SFAppleIDVerifyCertificateChain();
  }
  else
  {
    int v8 = AXSSLogForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1B3B9D000, v8, OS_LOG_TYPE_DEFAULT, "No certificate to verify.", v9, 2u);
    }

    v7[2](v7, 0);
  }
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke(uint64_t a1, SecTrustRef trust)
{
  v2 = trust;
  if (trust)
  {
    if (SecTrustGetCertificateCount(trust) < 1)
    {
      v2 = 0;
    }
    else
    {
      CFArrayRef v4 = SecTrustCopyCertificateChain(v2);
      CFArrayRef v5 = v4;
      if (v4) {
        [(__CFArray *)v4 firstObject];
      }
      OSStatus v6 = SFAppleIDCommonNameForCertificate();
      v2 = (__SecTrust *)0;
      if (v6)
      {
        OSStatus v7 = (__CFString *)SecCopyErrorMessageString(v6, 0);
        int v8 = AXSSLogForCategory(1);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_5();
        }
      }
    }
  }
  if ([(__SecTrust *)v2 length])
  {
    uint64_t v9 = [*(id *)(a1 + 32) _certificateChain];
    if (![v9 count]) {
      goto LABEL_29;
    }
    [v9 firstObject];
    OSStatus v10 = SFAppleIDCommonNameForCertificate();
    id v11 = 0;
    if (v10)
    {
      uint64_t v12 = (__CFString *)SecCopyErrorMessageString(v10, 0);
      uint64_t v13 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_4();
      }
    }
    if (objc_msgSend(v11, "length", 0))
    {
      if ([(__SecTrust *)v2 isEqualToString:v11]) {
        goto LABEL_28;
      }
      uint64_t v14 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_3();
      }
    }
    else
    {
      uint64_t v14 = AXSSLogForCategory(1);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_2(v14);
      }
    }

LABEL_28:
    goto LABEL_29;
  }
  uint64_t v9 = AXSSLogForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_1(v9);
  }
LABEL_29:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSecurityIdentity, 0);

  objc_storeStrong((id *)&self->_cachedCertificateChain, 0);
}

- (void)_appleIDIdentity
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1B3B9D000, v0, OS_LOG_TYPE_DEBUG, "Apple IDs: %@", v1, 0xCu);
}

- (void)_certificateChain
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "Unable to get certificate for Apple ID identity. Error code: %i", (uint8_t *)v2, 8u);
}

- (void)securityIdentity
{
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_ERROR, "Could not get nonempty account identifier from other certificate.", v1, 2u);
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_ERROR, "Could not get nonempty account identifier from my certificate.", v1, 2u);
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1B3B9D000, v0, v1, "Mismatch between other identifier \"%{private}@\" and my identifier \"%{private}@\"");
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B3B9D000, v0, v1, "Unable to get Apple ID common name for my certificate: %i (%@)");
}

void __62__AXSSInterDeviceSecurityHelper_verifyCertificate_completion___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B3B9D000, v0, v1, "Unable to get Apple ID common name for other certificate: %i (%@)");
}

@end