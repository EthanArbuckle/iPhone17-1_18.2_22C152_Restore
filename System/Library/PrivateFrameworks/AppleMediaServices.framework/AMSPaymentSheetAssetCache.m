@interface AMSPaymentSheetAssetCache
- (AMSPaymentSheetAssetCache)init;
- (void)dealloc;
- (void)retainAsset:(void *)a3;
@end

@implementation AMSPaymentSheetAssetCache

- (AMSPaymentSheetAssetCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)AMSPaymentSheetAssetCache;
  v2 = [(AMSPaymentSheetAssetCache *)&v4 init];
  if (v2) {
    v2->_imageArrayRef = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  }
  return v2;
}

- (void)dealloc
{
  imageArrayRef = self->_imageArrayRef;
  if (imageArrayRef) {
    CFRelease(imageArrayRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)AMSPaymentSheetAssetCache;
  [(AMSPaymentSheetAssetCache *)&v4 dealloc];
}

- (void)retainAsset:(void *)a3
{
}

@end