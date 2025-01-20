@interface NSData(CertInfoAdditions)
- (id)CertUIHexString;
@end

@implementation NSData(CertInfoAdditions)

- (id)CertUIHexString
{
  v2 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__NSData_CertInfoAdditions__CertUIHexString__block_invoke;
  v6[3] = &unk_26432C2F8;
  id v7 = v2;
  id v3 = v2;
  [a1 enumerateByteRangesUsingBlock:v6];
  v4 = (void *)[v3 copy];

  return v4;
}

@end