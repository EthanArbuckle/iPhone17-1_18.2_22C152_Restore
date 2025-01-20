@interface CPLFingerprintSchemeInvalid
- (BOOL)isMMCSv2;
- (BOOL)isValid;
- (id)_invalidFingerprintForSelector:(SEL)a3 withError:(id *)a4;
- (id)fingerPrintForData:(id)a3 error:(id *)a4;
- (id)fingerPrintForFD:(int)a3 error:(id *)a4;
- (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4;
- (id)fingerprintSchemeDescription;
- (id)zeroByteFileFingerprint;
@end

@implementation CPLFingerprintSchemeInvalid

- (id)fingerprintSchemeDescription
{
  return @"Invalid";
}

- (BOOL)isValid
{
  return 0;
}

- (BOOL)isMMCSv2
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 378, @"%@ should not be used on %@", v6, objc_opt_class() object file lineNumber description];

  abort();
}

- (id)zeroByteFileFingerprint
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 374, @"%@ should not be used on %@", v6, objc_opt_class() object file lineNumber description];

  abort();
}

- (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4
{
  return [(CPLFingerprintSchemeInvalid *)self _invalidFingerprintForSelector:a2 withError:a4];
}

- (id)fingerPrintForData:(id)a3 error:(id *)a4
{
  return [(CPLFingerprintSchemeInvalid *)self _invalidFingerprintForSelector:a2 withError:a4];
}

- (id)fingerPrintForFD:(int)a3 error:(id *)a4
{
  return [(CPLFingerprintSchemeInvalid *)self _invalidFingerprintForSelector:a2 withError:a4];
}

- (id)_invalidFingerprintForSelector:(SEL)a3 withError:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (_invalidFingerprintForSelector_withError__onceToken != -1) {
    dispatch_once(&_invalidFingerprintForSelector_withError__onceToken, &__block_literal_global_128);
  }
  v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v9 = [v8 BOOLForKey:@"CPLCrashOnInvalidFingerprintScheme"];

  if (v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFingerprintScheme.m"];
    v15 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, v14, 353, @"Trying to user %@ with an invalid fingerprint scheme", v15 object file lineNumber description];

    abort();
  }
  v10 = __CPLGenericOSLogDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v12 = NSStringFromSelector(a3);
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_fault_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_FAULT, "Trying to use %{public}@ with an invalid fingerprint scheme", buf, 0xCu);
  }
  if (a4) {
    *a4 = (id) _invalidFingerprintForSelector_withError__invalidError;
  }
  return 0;
}

uint64_t __72__CPLFingerprintSchemeInvalid__invalidFingerprintForSelector_withError___block_invoke()
{
  uint64_t v0 = +[CPLErrors cplErrorWithCode:100 description:@"Invalid fingerprint scheme (likely cause: missing master identifier)"];
  uint64_t v1 = _invalidFingerprintForSelector_withError__invalidError;
  _invalidFingerprintForSelector_withError__invalidError = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end