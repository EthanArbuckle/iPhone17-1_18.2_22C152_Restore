@interface NSString(HAPTLVHelpers)
+ (id)parsedFromData:()HAPTLVHelpers error:;
- (id)serializeWithError:()HAPTLVHelpers;
@end

@implementation NSString(HAPTLVHelpers)

- (id)serializeWithError:()HAPTLVHelpers
{
  uint64_t v4 = [a1 dataUsingEncoding:4 allowLossyConversion:0];
  v5 = (void *)v4;
  if (a3 && !v4)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:3 reason:@"TLV data cannot be UTF8 encoded" underlyingError:0];
  }

  return v5;
}

+ (id)parsedFromData:()HAPTLVHelpers error:
{
  v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  uint64_t v10 = [v8 length];

  uint64_t v11 = [v7 initWithBytes:v9 length:v10 encoding:4];
  v12 = (void *)v11;
  if (a4 && !v11)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:3 reason:@"TLV data is not UTF8 encoded" underlyingError:0];
  }

  return v12;
}

@end