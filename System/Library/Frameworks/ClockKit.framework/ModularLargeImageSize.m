@interface ModularLargeImageSize
@end

@implementation ModularLargeImageSize

double ___ModularLargeImageSize_block_invoke(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = &unk_26CCDB6C8;
  v2 = (void *)MEMORY[0x263F08D40];
  id v3 = a2;
  v4 = objc_msgSend(v2, "valueWithCGSize:", 32.0, 11.0);
  v10[1] = &unk_26CCDB6E0;
  v11[0] = v4;
  v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 42.0, 14.0);
  v11[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  objc_msgSend(v3, "scaledSize:withOverrides:", v6, 37.0, 12.0);
  double v8 = v7;

  return v8;
}

@end