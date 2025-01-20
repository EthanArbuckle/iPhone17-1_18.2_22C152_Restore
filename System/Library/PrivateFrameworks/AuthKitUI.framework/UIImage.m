@interface UIImage
@end

@implementation UIImage

uint64_t __42__UIImage_AuthKitUI__ak_copyScaledToSize___block_invoke(double *a1, void *a2)
{
  double v3 = a1[5];
  double v4 = a1[6];
  v5 = (void *)MEMORY[0x1E4F428B8];
  id v6 = a2;
  v7 = [v5 clearColor];
  [v7 setFill];

  objc_msgSend(v6, "fillRect:", 0.0, 0.0, v3, v4);
  v8 = (void *)*((void *)a1 + 4);

  return objc_msgSend(v8, "drawInRect:", 0.0, 0.0, v3, v4);
}

@end