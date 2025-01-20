@interface UIImage(CKTransparencyTrimmer)
- (id)__ck_imageWithTrimmedTransparency;
@end

@implementation UIImage(CKTransparencyTrimmer)

- (id)__ck_imageWithTrimmedTransparency
{
  v2 = (void *)MEMORY[0x192FBB780]();
  v3 = objc_alloc_init(CKImageTransparencyTrimmer);
  v4 = [(CKImageTransparencyTrimmer *)v3 trimTransparencyFromImage:a1];

  return v4;
}

@end