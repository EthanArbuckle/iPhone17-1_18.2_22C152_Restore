@interface UIImage(IMPNGImageWriting)
- (id)__ck_heicsImageData;
- (id)__ck_pngImageData;
- (uint64_t)__ck_writePNGToFilePath:()IMPNGImageWriting error:;
- (uint64_t)__ck_writePNGToURL:()IMPNGImageWriting error:;
@end

@implementation UIImage(IMPNGImageWriting)

- (uint64_t)__ck_writePNGToFilePath:()IMPNGImageWriting error:
{
  v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  uint64_t v7 = objc_msgSend(a1, "__ck_writePNGToURL:error:", v6, a4);

  return v7;
}

- (uint64_t)__ck_writePNGToURL:()IMPNGImageWriting error:
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(a1, "__ck_pngImageData");
  id v12 = 0;
  uint64_t v8 = [v7 writeToURL:v6 options:1 error:&v12];

  id v9 = v12;
  v10 = v9;
  if (a4 && (v8 & 1) == 0) {
    *a4 = v9;
  }

  return v8;
}

- (id)__ck_pngImageData
{
  [a1 CGImage];
  v1 = (void *)IMCreatePNGImageDataFromCGImageRef();

  return v1;
}

- (id)__ck_heicsImageData
{
  [a1 CGImage];
  v1 = (void *)IMCreateHEICSImageDataFromCGImageRef();

  return v1;
}

@end