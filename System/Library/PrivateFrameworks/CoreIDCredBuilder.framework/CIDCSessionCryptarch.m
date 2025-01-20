@interface CIDCSessionCryptarch
- (BOOL)deriveSessionKeysFromSessionTranscript:(id)a3 error:(id *)a4;
- (BOOL)deriveSessionKeysFromSessionTranscript:(id)a3 intermediateKeyMaterial:(id)a4 error:(id *)a5;
- (BOOL)setRemoteKey:(id)a3 error:(id *)a4;
- (CIDCSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4;
- (CIDCSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4 variant:(unint64_t)a5;
- (NSData)publicKey;
- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)internalCryptarch;
- (id)decryptData:(id)a3 error:(id *)a4;
- (id)encryptData:(id)a3 error:(id *)a4;
- (void)setInternalCryptarch:(id)a3;
@end

@implementation CIDCSessionCryptarch

- (CIDCSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4
{
  return [(CIDCSessionCryptarch *)self initWithRole:a3 curve:a4 variant:0];
}

- (CIDCSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4 variant:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CIDCSessionCryptarch;
  v8 = [(CIDCSessionCryptarch *)&v11 init];
  v9 = [[_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch alloc] initWithRole:a3 curve:a4 variant:a5];
  [(CIDCSessionCryptarch *)v8 setInternalCryptarch:v9];

  return v8;
}

- (BOOL)setRemoteKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CIDCSessionCryptarch *)self internalCryptarch];
  LOBYTE(a4) = [v7 setRemoteKey:v6 error:a4];

  return (char)a4;
}

- (BOOL)deriveSessionKeysFromSessionTranscript:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CIDCSessionCryptarch *)self internalCryptarch];
  LOBYTE(a4) = [v7 deriveSessionKeysWithSessionTranscript:v6 ikm:0 error:a4];

  return (char)a4;
}

- (BOOL)deriveSessionKeysFromSessionTranscript:(id)a3 intermediateKeyMaterial:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(CIDCSessionCryptarch *)self internalCryptarch];
  LOBYTE(a5) = [v10 deriveSessionKeysWithSessionTranscript:v9 ikm:v8 error:a5];

  return (char)a5;
}

- (id)decryptData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CIDCSessionCryptarch *)self internalCryptarch];
  id v8 = [v7 decryptWithData:v6 error:a4];

  return v8;
}

- (id)encryptData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CIDCSessionCryptarch *)self internalCryptarch];
  id v8 = [v7 encryptWithData:v6 error:a4];

  return v8;
}

- (NSData)publicKey
{
  v2 = [(CIDCSessionCryptarch *)self internalCryptarch];
  v3 = [v2 publicKey];

  return (NSData *)v3;
}

- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)internalCryptarch
{
  return self->_internalCryptarch;
}

- (void)setInternalCryptarch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end