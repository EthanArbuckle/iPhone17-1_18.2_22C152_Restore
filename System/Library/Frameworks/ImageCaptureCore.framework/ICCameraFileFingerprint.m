@interface ICCameraFileFingerprint
- (ICCameraFileFingerprint)init;
- (NSString)zeroByteFileFingerprint;
- (id)fingerprintForData:(id)a3 error:(id *)a4;
- (id)fingerprintForFD:(int)a3 error:(id *)a4;
- (id)fingerprintForFileAtURL:(id)a3 error:(id *)a4;
- (id)fixupFileHandleError:(id)a3;
- (void)_createSignatureGenerator;
@end

@implementation ICCameraFileFingerprint

- (ICCameraFileFingerprint)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICCameraFileFingerprint;
  return [(ICCameraFileFingerprint *)&v3 init];
}

- (id)fixupFileHandleError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  int v6 = [v4 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v6)
  {
    v7 = [v3 userInfo];
    uint64_t v8 = *MEMORY[0x1E4F28A50];
    v9 = [v7 objectForKey:*MEMORY[0x1E4F28A50]];

    if (!v9)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], objc_msgSend(v3, "code"), 0);
      v11 = [v3 userInfo];
      v12 = (void *)[v11 mutableCopy];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v15 = v14;

      [v15 setObject:v10 forKey:v8];
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v5, objc_msgSend(v3, "code"), v15);

      id v3 = (id)v16;
    }
  }

  return v3;
}

- (void)_createSignatureGenerator
{
  v2 = [@"MYSUPERSECRECTKEYPADDEDTO32BYTES" dataUsingEncoding:4];
  id v3 = (void **)MMCSSignatureGeneratorCreateWithBoundaryKey();

  return v3;
}

- (id)fingerprintForFileAtURL:(id)a3 error:(id *)a4
{
  int v6 = objc_msgSend(MEMORY[0x1E4F28CB0], "fileHandleForReadingFromURL:error:", a3);
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = -[ICCameraFileFingerprint fingerprintForFD:error:](self, "fingerprintForFD:error:", [v6 fileDescriptor], a4);
    [v7 closeFile];
  }
  else if (a4)
  {
    [(ICCameraFileFingerprint *)self fixupFileHandleError:*a4];
    uint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)fingerprintForData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = [(ICCameraFileFingerprint *)self _createSignatureGenerator];
  id v7 = v5;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v7 length];

  MEMORY[0x1C189FD00](v6, v8, v9, 1);
  uint64_t v10 = MMCSSignatureGeneratorFinish();
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v10 length:MEMORY[0x1C189FCD0](v10) freeWhenDone:1];
  v12 = [v11 base64EncodedStringWithOptions:0];

  return v12;
}

- (id)fingerprintForFD:(int)a3 error:(id *)a4
{
  lseek(a3, 0, 0);
  int v6 = malloc_type_malloc(0x20000uLL, 0xCD74D96CuLL);
  for (i = [(ICCameraFileFingerprint *)self _createSignatureGenerator];
        ;
        MEMORY[0x1C189FD00](i, v6, v8, 1))
  {
    ssize_t v8 = read(a3, v6, 0x20000uLL);
    if (!v8) {
      break;
    }
    if (v8 == -1)
    {
      MMCSSignatureGeneratorFinish();
      i = 0;
      break;
    }
  }
  if (v6) {
    free(v6);
  }
  if (i)
  {
    uint64_t v9 = MMCSSignatureGeneratorFinish();
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v9 length:MEMORY[0x1C189FCD0](v9) freeWhenDone:1];
    v11 = [v10 base64EncodedStringWithOptions:0];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)zeroByteFileFingerprint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_zeroByteFileFingerprint)
  {
    v4 = [MEMORY[0x1E4F1C9B8] data];
    id v10 = 0;
    id v5 = [(ICCameraFileFingerprint *)self fingerprintForData:v4 error:&v10];
    id v6 = v10;
    zeroByteFileFingerprint = self->_zeroByteFileFingerprint;
    self->_zeroByteFileFingerprint = v5;
  }
  os_unfair_lock_unlock(p_lock);
  ssize_t v8 = self->_zeroByteFileFingerprint;

  return v8;
}

- (void).cxx_destruct
{
}

@end