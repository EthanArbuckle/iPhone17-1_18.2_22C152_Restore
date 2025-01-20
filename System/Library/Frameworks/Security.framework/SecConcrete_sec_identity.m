@interface SecConcrete_sec_identity
- (SecConcrete_sec_identity)initWithCertificates:(__CFArray *)a3 signBlock:(id)a4 decryptBlock:(id)a5 queue:(id)a6;
- (SecConcrete_sec_identity)initWithIdentity:(__SecIdentity *)a3;
- (SecConcrete_sec_identity)initWithIdentityAndCertificates:(__SecIdentity *)a3 certificates:(__CFArray *)a4;
- (void)dealloc;
@end

@implementation SecConcrete_sec_identity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->operation_queue, 0);
  objc_storeStrong(&self->decrypt_block, 0);

  objc_storeStrong(&self->sign_block, 0);
}

- (void)dealloc
{
  identity = self->identity;
  if (identity)
  {
    CFRelease(identity);
    self->identity = 0;
    certs = self->certs;
    if (certs) {
      CFRelease(certs);
    }
    self->certs = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SecConcrete_sec_identity;
  [(SecConcrete_sec_identity *)&v5 dealloc];
}

- (SecConcrete_sec_identity)initWithCertificates:(__CFArray *)a3 signBlock:(id)a4 decryptBlock:(id)a5 queue:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = 0;
  if (a3 && v10 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)SecConcrete_sec_identity;
    self = [(SecConcrete_sec_identity *)&v19 init];
    if (self)
    {
      CFRetain(a3);
      self->certs = a3;
      v14 = _Block_copy(v10);
      id sign_block = self->sign_block;
      self->id sign_block = v14;

      v16 = _Block_copy(v11);
      id decrypt_block = self->decrypt_block;
      self->id decrypt_block = v16;

      objc_storeStrong((id *)&self->operation_queue, a6);
      self = self;
      v13 = self;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (SecConcrete_sec_identity)initWithIdentityAndCertificates:(__SecIdentity *)a3 certificates:(__CFArray *)a4
{
  if (a3
    && (v9.receiver = self,
        v9.super_class = (Class)SecConcrete_sec_identity,
        (self = [(SecConcrete_sec_identity *)&v9 init]) != 0))
  {
    v6 = self;
    CFRetain(a3);
    v6->identity = a3;
    if (a4) {
      CFRetain(a4);
    }
    v6->certs = a4;
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SecConcrete_sec_identity)initWithIdentity:(__SecIdentity *)a3
{
  v3 = (SecConcrete_sec_identity *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SecConcrete_sec_identity;
    self = [(SecConcrete_sec_identity *)&v6 init];
    if (self)
    {
      v4 = self;
      CFRetain(v3);
      v4->identity = (__SecIdentity *)v3;
      self = v4;
      v3 = self;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

@end