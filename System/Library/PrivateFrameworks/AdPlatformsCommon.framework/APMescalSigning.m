@interface APMescalSigning
- (APMescalSigning)init;
- (APMescalSigningRequestor)requesterObject;
- (id)signatureForData:(id)a3;
- (void)dealloc;
- (void)signatureForData:(id)a3 completion:(id)a4;
- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5;
@end

@implementation APMescalSigning

- (APMescalSigning)init
{
  v6.receiver = self;
  v6.super_class = (Class)APMescalSigning;
  v2 = [(APMescalSigning *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(APMescalSigningRequestor);
    requesterObject = v2->_requesterObject;
    v2->_requesterObject = v3;
  }
  return v2;
}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_requesterObject(self, v8, v9, v10, v11, v12, v13);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signatureForData_completion_(v18, v14, (uint64_t)v7, (uint64_t)v6, v15, v16, v17);
}

- (id)signatureForData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_requesterObject(self, v5, v6, v7, v8, v9, v10);
  double v17 = objc_msgSend_signatureForData_(v11, v12, (uint64_t)v4, v13, v14, v15, v16);

  return v17;
}

- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  objc_msgSend_requesterObject(self, v10, v11, v12, v13, v14, v15);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signatureForData_waitTime_completion_(v19, v16, (uint64_t)v9, (uint64_t)v8, v17, a4, v18);
}

- (void)dealloc
{
  id v8 = objc_msgSend_requesterObject(self, a2, v2, v3, v4, v5, v6);
  objc_msgSend_finished(v8, v9, v10, v11, v12, v13, v14);

  v15.receiver = self;
  v15.super_class = (Class)APMescalSigning;
  [(APMescalSigning *)&v15 dealloc];
}

- (APMescalSigningRequestor)requesterObject
{
  return self->_requesterObject;
}

- (void).cxx_destruct
{
}

@end