@interface IMNicknameEncryptionTag
+ (id)_tagWithDataRepresentation:(id)a3 length:(unint64_t)a4 error:(id *)a5;
+ (id)_tagWithStringRepresentation:(id)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTag:(id)a3 error:(id *)a4;
- (IMNicknameEncryptionTag)initWithDataRepresentation:(id)a3;
- (NSData)dataRepresentation;
- (NSString)stringRepresentation;
- (id)description;
- (unint64_t)hash;
- (void)setDataRepresentation:(id)a3;
@end

@implementation IMNicknameEncryptionTag

+ (id)_tagWithDataRepresentation:(id)a3 length:(unint64_t)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 length] >= a4)
  {
    v16 = objc_msgSend(v8, "subdataWithRange:", 0, a4);

    v15 = (void *)[objc_alloc((Class)a1) initWithDataRepresentation:v16];
  }
  else
  {
    v9 = NSString;
    uint64_t v10 = [v8 length];

    v11 = [v9 stringWithFormat:@"Provided tag is too short {tagLength: %tu, expectedLength: %tu}", v10, a4];
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = v11;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v14 = [v12 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-2001 userInfo:v13];

    if (a5) {
      *a5 = v14;
    }

    v15 = 0;
  }

  return v15;
}

+ (id)_tagWithStringRepresentation:(id)a3 length:(unint64_t)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v9 = a3;
  uint64_t v10 = (void *)[[v8 alloc] initWithBase64EncodedString:v9 options:0];

  v11 = [a1 _tagWithDataRepresentation:v10 length:a4 error:a5];

  return v11;
}

- (IMNicknameEncryptionTag)initWithDataRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMNicknameEncryptionTag;
  v6 = [(IMNicknameEncryptionTag *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataRepresentation, a3);
  }

  return v7;
}

- (NSString)stringRepresentation
{
  v2 = [(IMNicknameEncryptionTag *)self dataRepresentation];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return (NSString *)v3;
}

- (BOOL)isEqualToTag:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMNicknameEncryptionTag *)self dataRepresentation];
  id v8 = (const void *)[v7 bytes];
  objc_super v9 = [v6 dataRepresentation];

  id v10 = v9;
  v11 = (const void *)[v10 bytes];
  v12 = [(IMNicknameEncryptionTag *)self dataRepresentation];
  int v13 = timingsafe_bcmp(v8, v11, [v12 length]);

  if (a4 && v13)
  {
    v14 = [NSString stringWithFormat:@"Tags mismatch {className: %@}", objc_opt_class()];
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = v14;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a4 = [v15 errorWithDomain:@"IMNicknameEncryptionHelpersErrorDomain" code:-2001 userInfo:v16];
  }
  return v13 == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(IMNicknameEncryptionTag *)self isEqualToTag:v4 error:0];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  id v4 = [(IMNicknameEncryptionTag *)self dataRepresentation];
  unint64_t v5 = v3 ^ [v4 hash] ^ 0x11;

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(IMNicknameEncryptionTag *)self dataRepresentation];
  id v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void)setDataRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end