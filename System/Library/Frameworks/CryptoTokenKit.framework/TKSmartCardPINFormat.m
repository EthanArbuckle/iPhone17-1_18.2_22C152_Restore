@interface TKSmartCardPINFormat
+ (BOOL)supportsSecureCoding;
+ (void)_writeNumber:(unint64_t)a3 into:(id)a4 bitOffset:(int64_t)a5 bitLength:(int64_t)a6;
- (BOOL)fillPIN:(id)a3 intoAPDUTemplate:(id)a4 PINByteOffset:(int64_t)a5 error:(id *)a6;
- (NSInteger)PINBitOffset;
- (NSInteger)PINBlockByteLength;
- (NSInteger)PINLengthBitOffset;
- (NSInteger)PINLengthBitSize;
- (NSInteger)maxPINLength;
- (NSInteger)minPINLength;
- (TKSmartCardPINCharset)charset;
- (TKSmartCardPINEncoding)encoding;
- (TKSmartCardPINFormat)init;
- (TKSmartCardPINFormat)initWithCoder:(id)a3;
- (TKSmartCardPINJustification)PINJustification;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)PINBlockString;
- (unsigned)PINFormatStringWithError:(id *)a3;
- (unsigned)PINLengthFormatWithError:(id *)a3;
- (unsigned)PINMaxExtraDigit;
- (void)encodeWithCoder:(id)a3;
- (void)setCharset:(TKSmartCardPINCharset)charset;
- (void)setEncoding:(TKSmartCardPINEncoding)encoding;
- (void)setMaxPINLength:(NSInteger)maxPINLength;
- (void)setMinPINLength:(NSInteger)minPINLength;
- (void)setPINBitOffset:(NSInteger)PINBitOffset;
- (void)setPINBlockByteLength:(NSInteger)PINBlockByteLength;
- (void)setPINJustification:(TKSmartCardPINJustification)PINJustification;
- (void)setPINLengthBitOffset:(NSInteger)PINLengthBitOffset;
- (void)setPINLengthBitSize:(NSInteger)PINLengthBitSize;
@end

@implementation TKSmartCardPINFormat

- (TKSmartCardPINFormat)init
{
  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardPINFormat;
  result = [(TKSmartCardPINFormat *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_charset = xmmword_1BED9CB90;
    *(_OWORD *)&result->_minPINLength = xmmword_1BED9CBA0;
    result->_PINBlockByteLength = 8;
    *(_OWORD *)&result->_PINJustification = 0u;
    *(_OWORD *)&result->_PINLengthBitOffset = 0u;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardPINFormat)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TKSmartCardPINFormat;
  v5 = [(TKSmartCardPINFormat *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"charset"];
    v5->_charset = [v6 integerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encoding"];
    v5->_encoding = [v7 integerValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minPINLength"];
    v5->_minPINLength = [v8 integerValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxPINLength"];
    v5->_maxPINLength = [v9 integerValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINBlockByteLength"];
    v5->_PINBlockByteLength = [v10 integerValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINJustification"];
    v5->_PINJustification = [v11 integerValue];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINBitOffset"];
    v5->_PINBitOffset = [v12 integerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINLengthBitOffset"];
    v5->_PINLengthBitOffset = [v13 integerValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINLengthBitSize"];
    v5->_PINLengthBitSize = [v14 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t charset = self->_charset;
  id v6 = a3;
  v7 = [v4 numberWithInteger:charset];
  [v6 encodeObject:v7 forKey:@"charset"];

  v8 = [NSNumber numberWithInteger:self->_encoding];
  [v6 encodeObject:v8 forKey:@"encoding"];

  v9 = [NSNumber numberWithInteger:self->_minPINLength];
  [v6 encodeObject:v9 forKey:@"minPINLength"];

  v10 = [NSNumber numberWithInteger:self->_maxPINLength];
  [v6 encodeObject:v10 forKey:@"maxPINLength"];

  v11 = [NSNumber numberWithInteger:self->_PINBlockByteLength];
  [v6 encodeObject:v11 forKey:@"PINBlockByteLength"];

  v12 = [NSNumber numberWithInteger:self->_PINJustification];
  [v6 encodeObject:v12 forKey:@"PINJustification"];

  v13 = [NSNumber numberWithInteger:self->_PINBitOffset];
  [v6 encodeObject:v13 forKey:@"PINBitOffset"];

  v14 = [NSNumber numberWithInteger:self->_PINLengthBitOffset];
  [v6 encodeObject:v14 forKey:@"PINLengthBitOffset"];

  id v15 = [NSNumber numberWithInteger:self->_PINLengthBitSize];
  [v6 encodeObject:v15 forKey:@"PINLengthBitSize"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TKSmartCardPINFormat);
  [(TKSmartCardPINFormat *)v4 setCharset:[(TKSmartCardPINFormat *)self charset]];
  [(TKSmartCardPINFormat *)v4 setEncoding:[(TKSmartCardPINFormat *)self encoding]];
  [(TKSmartCardPINFormat *)v4 setMinPINLength:[(TKSmartCardPINFormat *)self minPINLength]];
  [(TKSmartCardPINFormat *)v4 setMaxPINLength:[(TKSmartCardPINFormat *)self maxPINLength]];
  [(TKSmartCardPINFormat *)v4 setPINBlockByteLength:[(TKSmartCardPINFormat *)self PINBlockByteLength]];
  [(TKSmartCardPINFormat *)v4 setPINJustification:[(TKSmartCardPINFormat *)self PINJustification]];
  [(TKSmartCardPINFormat *)v4 setPINBitOffset:[(TKSmartCardPINFormat *)self PINBitOffset]];
  [(TKSmartCardPINFormat *)v4 setPINLengthBitOffset:[(TKSmartCardPINFormat *)self PINLengthBitOffset]];
  [(TKSmartCardPINFormat *)v4 setPINLengthBitSize:[(TKSmartCardPINFormat *)self PINLengthBitSize]];
  return v4;
}

+ (void)_writeNumber:(unint64_t)a3 into:(id)a4 bitOffset:(int64_t)a5 bitLength:(int64_t)a6
{
  if (a6 >= 1)
  {
    int64_t v9 = a6 + a5;
    uint64_t v10 = -1;
    do
    {
      uint64_t v11 = [a4 mutableBytes];
      uint64_t v12 = v9 + v10 + 7;
      if (v9 + v10 >= 0) {
        uint64_t v12 = v9 + v10;
      }
      uint64_t v13 = v12 >> 3;
      char v14 = v9 + v10 - 8 * v13;
      int v15 = *(unsigned __int8 *)(v11 + v13);
      int v16 = v15 & (-129 >> v14);
      unsigned int v17 = v15 | (0x80u >> v14);
      if ((a3 & 1) == 0) {
        LOBYTE(v17) = v16;
      }
      *(unsigned char *)(v11 + v13) = v17;
      a3 >>= 1;
      --v10;
    }
    while (a6 + v10 + 2 > 1);
  }
}

- (BOOL)fillPIN:(id)a3 intoAPDUTemplate:(id)a4 PINByteOffset:(int64_t)a5 error:(id *)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (*(unsigned char *)([v11 bytes] + 4))
  {
    uint64_t v12 = 40;
  }
  else if ((unint64_t)[v11 length] <= 6)
  {
    uint64_t v12 = 40;
  }
  else
  {
    uint64_t v12 = 56;
  }
  id v13 = v10;
  char v14 = (const char *)[v13 UTF8String];
  int64_t v15 = strlen(v14);
  if (v15 < [(TKSmartCardPINFormat *)self minPINLength]
    || v15 > [(TKSmartCardPINFormat *)self maxPINLength])
  {
    if (a6)
    {
      int v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      unsigned int v17 = +[TKSmartCard _localizedString:@"INVALID_PIN"];
      v38[0] = v17;
      v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = (void **)v38;
      v20 = &v37;
      goto LABEL_10;
    }
    goto LABEL_37;
  }
  uint64_t v22 = v12 + 8 * a5;
  objc_msgSend((id)objc_opt_class(), "_writeNumber:into:bitOffset:bitLength:", v15, v11, -[TKSmartCardPINFormat PINLengthBitOffset](self, "PINLengthBitOffset") + v22, -[TKSmartCardPINFormat PINLengthBitSize](self, "PINLengthBitSize"));
  NSInteger v23 = [(TKSmartCardPINFormat *)self PINBitOffset] + v22;
  TKSmartCardPINEncoding v24 = [(TKSmartCardPINFormat *)self encoding];
  if (v24 == TKSmartCardPINEncodingBCD) {
    uint64_t v25 = 4;
  }
  else {
    uint64_t v25 = 8;
  }
  if ([(TKSmartCardPINFormat *)self PINJustification] == TKSmartCardPINJustificationRight)
  {
    char v26 = 2;
    if (v24 != TKSmartCardPINEncodingBCD) {
      char v26 = 3;
    }
    NSInteger v23 = v23 - (v15 << v26) + 8 * [(TKSmartCardPINFormat *)self PINBlockByteLength];
  }
  if (v15 < 1)
  {
LABEL_36:
    LOBYTE(a6) = 1;
    goto LABEL_37;
  }
  while (1)
  {
    int v28 = *(unsigned __int8 *)v14++;
    int v27 = v28;
    TKSmartCardPINCharset v29 = [(TKSmartCardPINFormat *)self charset];
    if (v29 == TKSmartCardPINCharsetUpperAlphanumeric)
    {
      char v30 = v27 - 48;
      BOOL v31 = (v27 - 48) >= 0xA;
      unsigned int v32 = (v27 - 65);
      goto LABEL_29;
    }
    if (v29 == TKSmartCardPINCharsetAlphanumeric) {
      break;
    }
    if (v29) {
      goto LABEL_38;
    }
    char v30 = v27 - 48;
    if ((v27 - 48) >= 0xA) {
      goto LABEL_38;
    }
LABEL_33:
    if ([(TKSmartCardPINFormat *)self encoding] != TKSmartCardPINEncodingASCII) {
      LOBYTE(v27) = v30;
    }
    [(id)objc_opt_class() _writeNumber:v27 into:v11 bitOffset:v23 bitLength:v25];
    v23 += v25;
    if (!--v15) {
      goto LABEL_36;
    }
  }
  char v30 = v27 - 48;
  BOOL v31 = (v27 - 48) >= 0xA && (v27 - 65) >= 0x1Au;
  unsigned int v32 = (v27 - 97);
LABEL_29:
  if (!v31 || v32 < 0x1A) {
    goto LABEL_33;
  }
LABEL_38:
  if (a6)
  {
    int v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    unsigned int v17 = +[TKSmartCard _localizedString:@"INVALID_PIN"];
    v36 = v17;
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    v19 = &v36;
    v20 = &v35;
LABEL_10:
    v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    *a6 = [v16 errorWithDomain:@"CryptoTokenKit" code:-5 userInfo:v21];

    LOBYTE(a6) = 0;
  }
LABEL_37:

  return (char)a6;
}

- (unsigned)PINFormatStringWithError:(id *)a3
{
  TKSmartCardPINEncoding v5 = [(TKSmartCardPINFormat *)self encoding];
  TKSmartCardPINEncoding v6 = [(TKSmartCardPINFormat *)self encoding];
  TKSmartCardPINJustification v7 = [(TKSmartCardPINFormat *)self PINJustification];
  char v8 = [(TKSmartCardPINFormat *)self PINBitOffset];
  NSInteger v9 = [(TKSmartCardPINFormat *)self PINBitOffset];
  uint64_t v10 = 8;
  if ((v8 & 7) != 0) {
    uint64_t v10 = 1;
  }
  unint64_t v11 = v9 / v10;
  if (v11 < 0x10) {
    return (v5 == TKSmartCardPINEncodingBCD) | (2 * (v6 == TKSmartCardPINEncodingASCII)) & 0x87 | (4
  }
                                                                                                 * (v7 == TKSmartCardPINJustificationRight)) & 0x87 | (8 * (v11 & 0xF)) | (((v8 & 7) == 0) << 7);
  uint64_t v12 = TK_LOG_smartcard();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardPINFormat PINFormatStringWithError:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  if (!a3) {
    return 0;
  }
  id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
  unsigned __int8 result = 0;
  *a3 = v20;
  return result;
}

- (unsigned)PINBlockString
{
  char v3 = [(TKSmartCardPINFormat *)self PINBlockByteLength];
  return v3 & 0xF | (16 * [(TKSmartCardPINFormat *)self PINLengthBitSize]);
}

- (unsigned)PINLengthFormatWithError:(id *)a3
{
  char v5 = [(TKSmartCardPINFormat *)self PINLengthBitOffset];
  NSInteger v6 = [(TKSmartCardPINFormat *)self PINLengthBitOffset];
  uint64_t v7 = 8;
  if ((v5 & 7) != 0) {
    uint64_t v7 = 1;
  }
  unint64_t v8 = v6 / v7;
  if (v8 < 0x10) {
    return v8 | (16 * ((v5 & 7) == 0));
  }
  NSInteger v9 = TK_LOG_smartcard();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardPINFormat PINLengthFormatWithError:](v9, v10, v11, v12, v13, v14, v15, v16);
  }

  if (!a3) {
    return 0;
  }
  id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
  unsigned __int8 v18 = 0;
  *a3 = v17;
  return v18;
}

- (unsigned)PINMaxExtraDigit
{
  __int16 v3 = [(TKSmartCardPINFormat *)self minPINLength];
  return [(TKSmartCardPINFormat *)self maxPINLength] | (unsigned __int16)(v3 << 8);
}

- (TKSmartCardPINCharset)charset
{
  return self->_charset;
}

- (void)setCharset:(TKSmartCardPINCharset)charset
{
  self->_int64_t charset = charset;
}

- (TKSmartCardPINEncoding)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(TKSmartCardPINEncoding)encoding
{
  self->_encoding = encoding;
}

- (NSInteger)minPINLength
{
  return self->_minPINLength;
}

- (void)setMinPINLength:(NSInteger)minPINLength
{
  self->_minPINLength = minPINLength;
}

- (NSInteger)maxPINLength
{
  return self->_maxPINLength;
}

- (void)setMaxPINLength:(NSInteger)maxPINLength
{
  self->_maxPINLength = maxPINLength;
}

- (NSInteger)PINBlockByteLength
{
  return self->_PINBlockByteLength;
}

- (void)setPINBlockByteLength:(NSInteger)PINBlockByteLength
{
  self->_PINBlockByteLength = PINBlockByteLength;
}

- (TKSmartCardPINJustification)PINJustification
{
  return self->_PINJustification;
}

- (void)setPINJustification:(TKSmartCardPINJustification)PINJustification
{
  self->_PINJustification = PINJustification;
}

- (NSInteger)PINBitOffset
{
  return self->_PINBitOffset;
}

- (void)setPINBitOffset:(NSInteger)PINBitOffset
{
  self->_PINBitOffset = PINBitOffset;
}

- (NSInteger)PINLengthBitOffset
{
  return self->_PINLengthBitOffset;
}

- (void)setPINLengthBitOffset:(NSInteger)PINLengthBitOffset
{
  self->_PINLengthBitOffset = PINLengthBitOffset;
}

- (NSInteger)PINLengthBitSize
{
  return self->_PINLengthBitSize;
}

- (void)setPINLengthBitSize:(NSInteger)PINLengthBitSize
{
  self->_PINLengthBitSize = PINLengthBitSize;
}

- (void)PINFormatStringWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)PINLengthFormatWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end