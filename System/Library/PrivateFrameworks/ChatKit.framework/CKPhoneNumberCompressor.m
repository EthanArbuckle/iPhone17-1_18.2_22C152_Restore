@interface CKPhoneNumberCompressor
- (NSArray)preferredCompressions;
- (NSString)phoneNumber;
- (UIFont)font;
- (double)desiredWidth;
- (id)_compressPhoneNumberIfFitsInCompressionLevel:(int)a3;
- (id)compress;
- (void)setDesiredWidth:(double)a3;
- (void)setFont:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPreferredCompressions:(id)a3;
@end

@implementation CKPhoneNumberCompressor

- (id)compress
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(CKPhoneNumberCompressor *)self _compressPhoneNumberIfFitsInCompressionLevel:0];
  if (!v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = [(CKPhoneNumberCompressor *)self preferredCompressions];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = -[CKPhoneNumberCompressor _compressPhoneNumberIfFitsInCompressionLevel:](self, "_compressPhoneNumberIfFitsInCompressionLevel:", [*(id *)(*((void *)&v11 + 1) + 8 * i) intValue]);
          if (v9)
          {
            v3 = (void *)v9;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    v3 = 0;
LABEL_12:
  }

  return v3;
}

- (id)_compressPhoneNumberIfFitsInCompressionLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CKPhoneNumberCompressor *)self phoneNumber];
  uint64_t v6 = (void *)MEMORY[0x192FBAB00](v5, 0, v3);

  uint64_t v12 = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = [(CKPhoneNumberCompressor *)self font];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  [v6 sizeWithAttributes:v8];
  id v9 = 0;
  if (v10 < self->_desiredWidth) {
    id v9 = v6;
  }

  return v9;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (double)desiredWidth
{
  return self->_desiredWidth;
}

- (void)setDesiredWidth:(double)a3
{
  self->_desiredWidth = a3;
}

- (NSArray)preferredCompressions
{
  return self->_preferredCompressions;
}

- (void)setPreferredCompressions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredCompressions, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end