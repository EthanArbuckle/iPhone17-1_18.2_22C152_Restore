@interface AVPersistableContentKeyRequest
- (NSData)persistableContentKeyFromKeyVendorResponse:(NSData *)keyVendorResponse options:(NSDictionary *)options error:(NSError *)outError;
@end

@implementation AVPersistableContentKeyRequest

- (NSData)persistableContentKeyFromKeyVendorResponse:(NSData *)keyVendorResponse options:(NSDictionary *)options error:(NSError *)outError
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v39 = 0;
  if (!keyVendorResponse)
  {
    v34 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v35 = *MEMORY[0x1E4F1C3C8];
    v36 = @"valid keyVendorResponse is required";
    goto LABEL_40;
  }
  if ([(AVContentKeyRequest *)self status] >= AVContentKeyRequestStatusCancelled)
  {
    if (outError)
    {
      uint64_t v42 = *MEMORY[0x1E4F1D138];
      v43[0] = @"content key request cancelled or already failed";
      v12 = (NSError *)AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1]);
      result = 0;
      *outError = v12;
      return result;
    }
    return 0;
  }
  if (![(AVContentKeyRequest *)self _requestID])
  {
    v19 = [(AVContentKeyRequest *)self figCryptor];
    if (v19)
    {
      v20 = v19;
      uint64_t v21 = *MEMORY[0x1E4F1CFD0];
      uint64_t v40 = *MEMORY[0x1E4F21958];
      uint64_t v41 = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v23 = *(void **)(CMBaseObjectGetVTable() + 16);
      if (v23) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
      if (*v24 >= 4uLL)
      {
        v28 = (uint64_t (*)(OpaqueFigCPECryptor *, NSData *, uint64_t))v24[12];
        if (v28)
        {
          signed int v29 = v28(v20, keyVendorResponse, v22);
          if (v29)
          {
LABEL_27:
            signed int v26 = v29;
LABEL_17:
            v27 = 0;
            goto LABEL_29;
          }
          uint64_t v30 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v30) {
            uint64_t v31 = v30;
          }
          else {
            uint64_t v31 = 0;
          }
          v32 = *(uint64_t (**)(OpaqueFigCPECryptor *, void, void, id *))(v31 + 48);
          if (v32)
          {
            signed int v29 = v32(v20, *MEMORY[0x1E4F1FDD0], *MEMORY[0x1E4F1CF80], &v39);
            goto LABEL_27;
          }
        }
      }
      v27 = 0;
      signed int v26 = -12782;
      goto LABEL_29;
    }
    v34 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v35 = *MEMORY[0x1E4F1C3B8];
    v36 = @"persistable content key cannot be created at this time";
LABEL_40:
    v37 = objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v35, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v36, (uint64_t)options, (uint64_t)outError, v5, v6, v7, v38), 0);
    objc_exception_throw(v37);
  }
  v14 = [(AVContentKeyRequest *)self _copyContentKeyBoss];
  if (v14)
  {
    v15 = v14;
    unint64_t v16 = [(AVContentKeyRequest *)self _requestID];
    uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v17) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    v25 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t, NSData *, id *))(v18 + 24);
    if (v25) {
      signed int v26 = v25(v15, v16, keyVendorResponse, &v39);
    }
    else {
      signed int v26 = -12782;
    }
    CFRelease(v15);
    goto LABEL_17;
  }
  v27 = (NSError *)AVLocalizedError(@"AVFoundationErrorDomain", -11862, 0);
  signed int v26 = 0;
LABEL_29:
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v26) {
    v27 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v26, 0);
  }
  if (v27)
  {
    if (outError)
    {
      result = 0;
      *outError = v27;
      return result;
    }
    return 0;
  }
  return (NSData *)v39;
}

@end