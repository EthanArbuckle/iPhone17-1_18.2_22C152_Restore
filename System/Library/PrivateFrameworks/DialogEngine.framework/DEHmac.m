@interface DEHmac
+ (BOOL)verify:(id)a3 computed:(id)a4;
- ($1DC23E134A5F43A06C89BE309303CDCF)context;
- (DEHmac)initWithKey:(id)a3 iv:(id)a4;
- (NSData)hmac;
- (void)close;
- (void)setContext:(id *)a3;
- (void)setHmac:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation DEHmac

- (void).cxx_destruct
{
}

- (void)setContext:(id *)a3
{
}

- ($1DC23E134A5F43A06C89BE309303CDCF)context
{
  return ($1DC23E134A5F43A06C89BE309303CDCF *)memcpy(retstr, &self->_context, sizeof($1DC23E134A5F43A06C89BE309303CDCF));
}

- (void)setHmac:(id)a3
{
}

- (NSData)hmac
{
  return self->_hmac;
}

- (void)close
{
  if (!self->_hmac)
  {
    v3 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
    CCHmacFinal((CCHmacContext *)&self->_context, (void *)[(NSData *)v3 mutableBytes]);
    hmac = self->_hmac;
    self->_hmac = v3;
  }
}

- (void)writeData:(id)a3
{
  id v5 = a3;
  if (!self->_hmac)
  {
    id v4 = v5;
    CCHmacUpdate((CCHmacContext *)&self->_context, (const void *)[v4 bytes], objc_msgSend(v4, "length"));
  }
}

- (DEHmac)initWithKey:(id)a3 iv:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DEHmac;
  v8 = [(DEHmac *)&v15 init];
  v9 = v8;
  if (v8)
  {
    hmac = v8->_hmac;
    v8->_hmac = 0;

    id v11 = v6;
    CCHmacInit((CCHmacContext *)&v9->_context, 2u, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
    id v12 = v7;
    CCHmacUpdate((CCHmacContext *)&v9->_context, (const void *)[v12 bytes], objc_msgSend(v12, "length"));
    v13 = v9;
  }

  return v9;
}

+ (BOOL)verify:(id)a3 computed:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = (const void *)[v7 bytes];
  id v9 = v6;
  LOBYTE(v6) = timingsafe_bcmp(v8, (const void *)[v9 bytes], objc_msgSend(v7, "length")) == 0;

  return (char)v6;
}

@end