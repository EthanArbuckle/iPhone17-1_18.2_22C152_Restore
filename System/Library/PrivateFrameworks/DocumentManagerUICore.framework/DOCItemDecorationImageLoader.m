@interface DOCItemDecorationImageLoader
+ (id)_typeForItemAccessType:(int64_t)a3;
+ (id)itemAccessDecorationForType:(int64_t)a3 size:(CGSize)a4 scale:(double)a5;
+ (id)vendorBadgeDecorationForType:(id)a3 size:(CGSize)a4 scale:(double)a5;
@end

@implementation DOCItemDecorationImageLoader

+ (id)_typeForItemAccessType:(int64_t)a3
{
  if ((unint64_t)a3 < 3) {
    return off_2646749F8[a3];
  }
  v6 = [MEMORY[0x263F08690] currentHandler];
  [v6 handleFailureInMethod:a2 object:a1 file:@"DOCItemDecorationImageLoader.m" lineNumber:25 description:@"Unhandled case"];

  return result;
}

+ (id)itemAccessDecorationForType:(int64_t)a3 size:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  v9 = [a1 _typeForItemAccessType:a3];
  v10 = objc_msgSend(a1, "vendorBadgeDecorationForType:size:scale:", v9, width, height, a5);

  return v10;
}

+ (id)vendorBadgeDecorationForType:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  v17[1] = *MEMORY[0x263EF8340];
  v8 = (objc_class *)MEMORY[0x263F4B558];
  id v9 = a3;
  v10 = objc_msgSend([v8 alloc], "initWithSize:scale:", width, height, a5);
  v11 = (void *)[objc_alloc(MEMORY[0x263F4B548]) initWithType:v9];

  v17[0] = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [v11 prepareImagesForDescriptors:v12];

  v13 = [v11 imageForDescriptor:v10];
  uint64_t v14 = [v13 CGImage];
  v15 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v14];

  return v15;
}

@end