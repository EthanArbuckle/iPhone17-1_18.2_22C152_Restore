@interface AKFastLayerSnapshotHelper
+ (CGImage)newFastSnapshotFromLayer:(id)a3 withSourceRect:(CGRect)a4 acutalSnapshotRect:(CGRect *)a5;
@end

@implementation AKFastLayerSnapshotHelper

+ (CGImage)newFastSnapshotFromLayer:(id)a3 withSourceRect:(CGRect)a4 acutalSnapshotRect:(CGRect *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v48 = a3;
  v47 = [v48 context];
  [v47 contextId];
  v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 nativeScale];
  CGFloat v11 = v10;

  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeScale(&v54, v11, v11);
  memset(&v53, 0, sizeof(v53));
  *(_OWORD *)&v52.m11 = *(_OWORD *)&v54.a;
  *(_OWORD *)&v52.m13 = *(_OWORD *)&v54.c;
  *(_OWORD *)&v52.m21 = *(_OWORD *)&v54.tx;
  CGAffineTransformInvert(&v53, (CGAffineTransform *)&v52);
  *(_OWORD *)&v52.m11 = *(_OWORD *)&v54.a;
  *(_OWORD *)&v52.m13 = *(_OWORD *)&v54.c;
  *(_OWORD *)&v52.m21 = *(_OWORD *)&v54.tx;
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.double width = width;
  v55.size.double height = height;
  CGRect v56 = CGRectApplyAffineTransform(v55, (CGAffineTransform *)&v52);
  CGRect v57 = CGRectIntegral(v56);
  CGFloat v12 = v57.origin.x;
  CGFloat v13 = v57.origin.y;
  CGFloat v14 = v57.size.width;
  if (vabdd_f64(width, height) >= 0.0005) {
    double v15 = v57.size.height;
  }
  else {
    double v15 = v57.size.width;
  }
  unint64_t v16 = vcvtad_u64_f64(v57.size.width);
  unint64_t v17 = vcvtad_u64_f64(v15);
  uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v51 = NSDictionary;
  v19 = [NSNumber numberWithLong:v16];
  uint64_t v50 = *MEMORY[0x263F0EF50];
  v20 = [NSNumber numberWithLong:v17];
  uint64_t v21 = *MEMORY[0x263F0EDF8];
  v22 = [NSNumber numberWithLong:AlignedBytesPerRow];
  uint64_t v23 = *MEMORY[0x263F0ED50];
  v24 = [NSNumber numberWithLong:AlignedBytesPerRow * v17];
  uint64_t v25 = *MEMORY[0x263F0ED30];
  v26 = [NSNumber numberWithInt:4];
  uint64_t v27 = *MEMORY[0x263F0ED48];
  v28 = [NSNumber numberWithUnsignedInt:1111970369];
  v29 = objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v19, v50, v20, v21, v22, v23, v24, v25, v26, v27, v28, *MEMORY[0x263F0EE48], 0);

  CFDictionaryRef v30 = v29;
  IOSurfaceRef v31 = IOSurfaceCreate(v30);
  if (v30) {
    CFRelease(v30);
  }

  if (!v31)
  {
    v34 = 0;
    v32 = v48;
    v35 = a5;
    v36 = v47;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  memset(&v52, 0, sizeof(v52));
  CATransform3DMakeScale(&v52, v11, v11, 1.0);
  v32 = v48;
  CARenderServerRenderLayerWithTransform();
  CFTypeID v33 = CFGetTypeID(v31);
  if (v33 == CGImageGetTypeID())
  {
    CGImageRetain(v31);
    v34 = v31;
  }
  else
  {
    CFRetain(v31);
    IOSurfaceIncrementUseCount(v31);
    BaseAddress = IOSurfaceGetBaseAddress(v31);
    size_t BytesPerRow = IOSurfaceGetBytesPerRow(v31);
    size_t v39 = IOSurfaceGetWidth(v31);
    size_t v40 = IOSurfaceGetHeight(v31);
    size_t AllocSize = IOSurfaceGetAllocSize(v31);
    v42 = CGDataProviderCreateWithData(v31, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_23762DF7C);
    CFTypeRef v43 = IOSurfaceCopyValue(v31, (CFStringRef)*MEMORY[0x263F0EDA0]);
    if (!v43 || (v44 = v43, DeviceRGB = CGColorSpaceCreateWithPropertyList(v43), CFRelease(v44), !DeviceRGB)) {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
    }
    v34 = CGImageCreate(v39, v40, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2002u, v42, 0, 1, kCGRenderingIntentDefault);
    CGImageSetProperty();
    CGDataProviderRelease(v42);
    CGColorSpaceRelease(DeviceRGB);
  }
  v35 = a5;
  v36 = v47;
  CFRelease(v31);
  if (a5)
  {
LABEL_16:
    *(_OWORD *)&v52.m11 = *(_OWORD *)&v53.a;
    *(_OWORD *)&v52.m13 = *(_OWORD *)&v53.c;
    *(_OWORD *)&v52.m21 = *(_OWORD *)&v53.tx;
    v58.origin.CGFloat x = v12;
    v58.origin.CGFloat y = v13;
    v58.size.double width = v14;
    v58.size.double height = v15;
    CGRect *v35 = CGRectApplyAffineTransform(v58, (CGAffineTransform *)&v52);
  }
LABEL_17:

  return v34;
}

@end