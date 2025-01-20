@interface WKNSURLAuthenticationChallengeSender
- (void)cancelAuthenticationChallenge:(id)a3;
- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3;
- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3;
- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3;
- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4;
@end

@implementation WKNSURLAuthenticationChallengeSender

- (void)cancelAuthenticationChallenge:(id)a3
{
  checkChallenge((NSURLAuthenticationChallenge *)a3);
  uint64_t v4 = *(void *)(objc_msgSend(a3, "_web_authenticationChallengeProxy") + 464);
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v9);
  CFTypeRef cf = 0;
  WebKit::AuthenticationDecisionListener::completeChallenge(v4);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  v8 = v9;
  v9 = 0;
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

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  checkChallenge((NSURLAuthenticationChallenge *)a3);
  uint64_t v4 = *(void *)(objc_msgSend(a3, "_web_authenticationChallengeProxy") + 464);
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v9);
  CFTypeRef cf = 0;
  WebKit::AuthenticationDecisionListener::completeChallenge(v4);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  v8 = v9;
  v9 = 0;
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

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  checkChallenge((NSURLAuthenticationChallenge *)a4);
  uint64_t v6 = *(void *)(objc_msgSend(a4, "_web_authenticationChallengeProxy") + 464);
  MEMORY[0x19972F4E0](&v11, a3);
  WebKit::AuthenticationDecisionListener::completeChallenge(v6);
  CFTypeRef v8 = cf;
  CFTypeRef cf = 0;
  if (v8) {
    CFRelease(v8);
  }
  v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v7);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  v10 = v11;
  v11 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v7);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  checkChallenge((NSURLAuthenticationChallenge *)a3);
  uint64_t v4 = *(void *)(objc_msgSend(a3, "_web_authenticationChallengeProxy") + 464);
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v9);
  CFTypeRef cf = 0;
  WebKit::AuthenticationDecisionListener::completeChallenge(v4);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  CFTypeRef v8 = v9;
  v9 = 0;
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

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  checkChallenge((NSURLAuthenticationChallenge *)a3);
  uint64_t v4 = *(void *)(objc_msgSend(a3, "_web_authenticationChallengeProxy") + 464);
  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v9);
  CFTypeRef cf = 0;
  WebKit::AuthenticationDecisionListener::completeChallenge(v4);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  CFTypeRef v8 = v9;
  v9 = 0;
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

@end