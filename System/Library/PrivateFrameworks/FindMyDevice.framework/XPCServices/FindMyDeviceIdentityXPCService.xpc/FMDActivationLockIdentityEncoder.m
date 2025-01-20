@interface FMDActivationLockIdentityEncoder
- (FMDActivationLockCertificateDataSource)certificateDataSource;
- (FMDActivationLockIdentityEncoder)initWithCertificateDataSource:(id)a3 signatureDataSource:(id)a4;
- (FMDPasscodeActivationUnlockSignatureDataSource)signatureDataSource;
- (id)_compressData:(id)a3;
- (void)identityForActivationLockRequest:(id)a3 completion:(id)a4;
- (void)setCertificateDataSource:(id)a3;
- (void)setSignatureDataSource:(id)a3;
@end

@implementation FMDActivationLockIdentityEncoder

- (FMDActivationLockIdentityEncoder)initWithCertificateDataSource:(id)a3 signatureDataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDActivationLockIdentityEncoder;
  v9 = [(FMDActivationLockIdentityEncoder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_certificateDataSource, a3);
    objc_storeStrong((id *)&v10->_signatureDataSource, a4);
  }

  return v10;
}

- (void)identityForActivationLockRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100005770();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDActivationLockIdentityEncoder identityForActivationLockData:completion:", buf, 2u);
  }

  v9 = [(FMDActivationLockIdentityEncoder *)self certificateDataSource];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000062D0;
  v12[3] = &unk_10000CF30;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 activationLockCertificatesWithRequest:v11 completion:v12];
}

- (id)_compressData:(id)a3
{
  id v3 = a3;
  v4 = sub_100005770();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    id v15 = [v3 length];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to compress %ld bytes", (uint8_t *)&v14, 0xCu);
  }

  size_t v5 = 2 * (void)[v3 length];
  id v6 = +[NSMutableData dataWithLength:v5];
  id v7 = (uint8_t *)[v6 mutableBytes];
  id v8 = v3;
  size_t v9 = compression_encode_buffer(v7, v5, (const uint8_t *)[v8 bytes], (size_t)objc_msgSend(v8, "length"), 0, COMPRESSION_ZLIB);
  id v10 = sub_100005770();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      id v15 = (id)v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Compressed to %ld bytes", (uint8_t *)&v14, 0xCu);
    }

    objc_super v12 = objc_msgSend(v6, "subdataWithRange:", 0, v9);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100007E6C(v11);
    }

    objc_super v12 = 0;
  }

  return v12;
}

- (FMDActivationLockCertificateDataSource)certificateDataSource
{
  return self->_certificateDataSource;
}

- (void)setCertificateDataSource:(id)a3
{
}

- (FMDPasscodeActivationUnlockSignatureDataSource)signatureDataSource
{
  return self->_signatureDataSource;
}

- (void)setSignatureDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureDataSource, 0);

  objc_storeStrong((id *)&self->_certificateDataSource, 0);
}

@end