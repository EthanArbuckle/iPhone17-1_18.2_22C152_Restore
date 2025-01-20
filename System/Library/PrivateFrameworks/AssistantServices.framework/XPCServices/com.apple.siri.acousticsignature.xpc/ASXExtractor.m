@interface ASXExtractor
- (ASXExtractor)init;
- (id)_sigx;
- (id)currentSignature;
- (int)sampleRate;
- (void)appendAcousticData:(id)a3 sampleCount:(int)a4;
- (void)reset;
- (void)setSampleRate:(int)a3;
@end

@implementation ASXExtractor

- (void).cxx_destruct
{
}

- (int)sampleRate
{
  return self->_sampleRate;
}

- (void)reset
{
  sigx = self->_sigx;
  if (sigx)
  {
    id v5 = 0;
    [(SigX *)sigx resetWithError:&v5];
    id v3 = v5;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v4 = [v3 code];
        *(_DWORD *)buf = 134217984;
        id v7 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error resetting %ld", buf, 0xCu);
      }
    }
  }
}

- (id)currentSignature
{
  sigx = self->_sigx;
  if (sigx)
  {
    __p = 0;
    v10 = 0;
    uint64_t v11 = 0;
    id v8 = 0;
    [(SigX *)sigx getSignature:&__p error:&v8];
    id v3 = v8;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v7 = [v3 code];
        *(_DWORD *)buf = 134217984;
        id v13 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error getting signature %ld", buf, 0xCu);
      }
      id v4 = 0;
    }
    else
    {
      id v5 = objc_alloc((Class)NSData);
      id v4 = [v5 initWithBytes:__p length:v10 - (unsigned char *)__p];
    }
    if (__p)
    {
      v10 = __p;
      operator delete(__p);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)appendAcousticData:(id)a3 sampleCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(ASXExtractor *)self _sigx];
  if (v7)
  {
    id v10 = 0;
    objc_msgSend(v7, "flowIntSamples:sampleCount:error:", objc_msgSend(v6, "bytes"), v4, &v10);
    id v8 = v10;
    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v8 code];
      *(_DWORD *)buf = 134217984;
      id v12 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error appending acoustic data %ld", buf, 0xCu);
    }
  }
}

- (void)setSampleRate:(int)a3
{
  if (self->_sampleRate != a3)
  {
    self->_sampleRate = a3;
    if (self->_sigx)
    {
      self->_sigx = 0;
      _objc_release_x1();
    }
  }
}

- (id)_sigx
{
  p_sigx = &self->_sigx;
  sigx = self->_sigx;
  if (!sigx)
  {
    id v5 = [SigX alloc];
    uint64_t sampleRate = self->_sampleRate;
    id v12 = 0;
    id v7 = [(SigX *)v5 initWithSignatureType:2 sampleRate:sampleRate error:&v12];
    id v8 = v12;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v9 = [v8 code];
        int v10 = self->_sampleRate;
        *(_DWORD *)buf = 134218240;
        id v14 = v9;
        __int16 v15 = 1024;
        int v16 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error %ld setting sample rate %d", buf, 0x12u);
      }
    }
    else
    {
      objc_storeStrong((id *)p_sigx, v7);
    }

    sigx = *p_sigx;
  }
  return sigx;
}

- (ASXExtractor)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASXExtractor;
  result = [(ASXExtractor *)&v3 init];
  if (result) {
    result->_uint64_t sampleRate = 16000;
  }
  return result;
}

@end