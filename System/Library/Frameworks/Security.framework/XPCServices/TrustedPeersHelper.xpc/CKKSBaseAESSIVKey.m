@interface CKKSBaseAESSIVKey
- (BOOL)isEqual:(id)a3;
- (CKKSBaseAESSIVKey)init;
- (CKKSBaseAESSIVKey)initWithBase64:(id)a3;
- (CKKSBaseAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)zeroKey;
@end

@implementation CKKSBaseAESSIVKey

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  unint64_t size = self->size;

  return [v4 initWithBytes:self->key len:size];
}

- (void)zeroKey
{
}

- (void)dealloc
{
  [(CKKSBaseAESSIVKey *)self zeroKey];
  v3.receiver = self;
  v3.super_class = (Class)CKKSBaseAESSIVKey;
  [(CKKSBaseAESSIVKey *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    size_t size = self->size;
    if (size == v4[11] && !memcmp(self->key, v4 + 1, size)) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (CKKSBaseAESSIVKey)initWithBase64:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSBaseAESSIVKey;
  v5 = [(CKKSBaseAESSIVKey *)&v9 init];
  if (!v5)
  {
LABEL_6:
    v7 = v5;
    goto LABEL_7;
  }
  BOOL v6 = (CKKSBaseAESSIVKey *)[objc_alloc((Class)NSData) initWithBase64EncodedString:v4 options:0];
  v7 = v6;
  if (v6)
  {
    if ((unint64_t)[(CKKSBaseAESSIVKey *)v6 length] <= 0x50)
    {
      v5->size_t size = (unint64_t)[(CKKSBaseAESSIVKey *)v7 length];
      memcpy(v5->key, [(CKKSBaseAESSIVKey *)v7 bytes], v5->size);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (CKKSBaseAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CKKSBaseAESSIVKey;
  BOOL v6 = [(CKKSBaseAESSIVKey *)&v9 init];
  v7 = v6;
  if (a4 <= 0x50 && v6)
  {
    v6->size_t size = a4;
    memcpy(v6->key, a3, a4);
  }
  return v7;
}

- (CKKSBaseAESSIVKey)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKKSBaseAESSIVKey;
  v2 = [(CKKSBaseAESSIVKey *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->size_t size = 80;
    [(CKKSBaseAESSIVKey *)v2 zeroKey];
  }
  return v3;
}

@end