@interface CKKSWrappedAESSIVKey
+ (BOOL)supportsSecureCoding;
+ (id)zeroedKey;
- (CKKSWrappedAESSIVKey)init;
- (CKKSWrappedAESSIVKey)initWithBase64:(id)a3;
- (CKKSWrappedAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4;
- (CKKSWrappedAESSIVKey)initWithCoder:(id)a3;
- (CKKSWrappedAESSIVKey)initWithData:(id)a3;
- (id)base64WrappedKey;
- (id)wrappedData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKKSWrappedAESSIVKey

- (CKKSWrappedAESSIVKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKSWrappedAESSIVKey;
  v5 = [(CKKSBaseAESSIVKey *)&v10 init];
  if (v5)
  {
    unint64_t v9 = 0;
    id v6 = [v4 decodeBytesForKey:@"wrappedkey" returnedLength:&v9];
    if (v6)
    {
      if (v9 >= 0x50) {
        size_t v7 = 80;
      }
      else {
        size_t v7 = v9;
      }
      memcpy(v5->super.key, v6, v7);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)base64WrappedKey
{
  v2 = [(CKKSWrappedAESSIVKey *)self wrappedData];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return v3;
}

- (id)wrappedData
{
  id v2 = [objc_alloc((Class)NSData) initWithBytes:self->super.key length:self->super.size];

  return v2;
}

- (CKKSWrappedAESSIVKey)initWithData:(id)a3
{
  id v4 = a3;
  if ([v4 length] != (id)80)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"length (%lu) was not %d", [v4 length], 80);
    id v9 = +[NSException exceptionWithName:@"WrongKeySizeException" reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  id v5 = v4;
  v10.receiver = self;
  v10.super_class = (Class)CKKSWrappedAESSIVKey;
  id v6 = -[CKKSBaseAESSIVKey initWithBytes:len:](&v10, "initWithBytes:len:", [v5 bytes], objc_msgSend(v5, "length"));

  return v6;
}

- (CKKSWrappedAESSIVKey)initWithBase64:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKSWrappedAESSIVKey;
  id v5 = [(CKKSBaseAESSIVKey *)&v10 initWithBase64:v4];
  id v6 = v5;
  if (v5 && v5->super.size != 80)
  {
    v8 = +[NSString stringWithFormat:@"length (%lu) was not %d", v5->super.size, 80];
    id v9 = +[NSException exceptionWithName:@"WrongKeySizeException" reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }

  return v6;
}

- (CKKSWrappedAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  if (a4 != 80)
  {
    id v5 = +[NSString stringWithFormat:@"length (%lu) was not %d", a4, 80];
    id v6 = +[NSException exceptionWithName:@"WrongKeySizeException" reason:v5 userInfo:0];

    objc_exception_throw(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)CKKSWrappedAESSIVKey;
  return -[CKKSBaseAESSIVKey initWithBytes:len:](&v7, "initWithBytes:len:", a3);
}

- (CKKSWrappedAESSIVKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKKSWrappedAESSIVKey;
  result = [(CKKSBaseAESSIVKey *)&v3 init];
  if (result) {
    result->super.size = 80;
  }
  return result;
}

+ (id)zeroedKey
{
  id v2 = +[NSMutableData dataWithLength:80];
  objc_super v3 = [[CKKSWrappedAESSIVKey alloc] initWithData:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end