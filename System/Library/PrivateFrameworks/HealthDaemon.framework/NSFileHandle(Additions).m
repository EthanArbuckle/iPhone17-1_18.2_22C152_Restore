@interface NSFileHandle(Additions)
- (BOOL)hk_readValue:()Additions ofSize:error:;
- (BOOL)hk_writeValue:()Additions size:error:;
@end

@implementation NSFileHandle(Additions)

- (BOOL)hk_readValue:()Additions ofSize:error:
{
  v9 = (void *)MEMORY[0x1C187C0E0]();
  v10 = [a1 readDataOfLength:a4];
  uint64_t v11 = [v10 length];
  BOOL v12 = v11 == a4;
  if (v11 == a4)
  {
    memcpy(a3, (const void *)[v10 bytes], a4);
    v13 = 0;
  }
  else
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 102, @"hk_readValue file size mismatch.");
  }

  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (BOOL)hk_writeValue:()Additions size:error:
{
  v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  uint64_t v9 = [a1 offsetInFile];
  [a1 writeData:v8];
  BOOL v10 = v9 + a4 == [a1 offsetInFile];

  id v11 = 0;
  if (a5 && !v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 102, @"hk_writeValue file size mismatch.");
    id v11 = objc_claimAutoreleasedReturnValue();
    *a5 = v11;
  }

  return v10;
}

@end