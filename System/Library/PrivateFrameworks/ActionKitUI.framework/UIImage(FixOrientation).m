@interface UIImage(FixOrientation)
- (__n128)wf_affineTransformForImageMirroringOrientation:()FixOrientation;
- (__n128)wf_affineTransformForImageOrientation:()FixOrientation;
- (id)wf_imageInIntrinsicOrientation;
- (uint64_t)wf_majorAxisOrientedSize;
@end

@implementation UIImage(FixOrientation)

- (__n128)wf_affineTransformForImageMirroringOrientation:()FixOrientation
{
  if (([a1 imageOrientation] & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    objc_msgSend(a1, "wf_majorAxisOrientedSize");
    __n128 v6 = a2[1];
    *(__n128 *)&v13.a = *a2;
    *(__n128 *)&v13.c = v6;
    *(__n128 *)&v13.tx = a2[2];
    CGAffineTransformTranslate(&v14, &v13, v7, 0.0);
    __n128 v8 = *(__n128 *)&v14.c;
    *a2 = *(__n128 *)&v14.a;
    a2[1] = v8;
    a2[2] = *(__n128 *)&v14.tx;
    __n128 v9 = a2[1];
    *(__n128 *)&v13.a = *a2;
    *(__n128 *)&v13.c = v9;
    *(__n128 *)&v13.tx = a2[2];
    CGAffineTransformScale(&v14, &v13, -1.0, 1.0);
    __n128 v10 = *(__n128 *)&v14.c;
    *a2 = *(__n128 *)&v14.a;
    a2[1] = v10;
    a2[2] = *(__n128 *)&v14.tx;
  }
  __n128 v11 = a2[1];
  *a3 = *a2;
  a3[1] = v11;
  __n128 result = a2[2];
  a3[2] = result;
  return result;
}

- (__n128)wf_affineTransformForImageOrientation:()FixOrientation
{
  unint64_t v6 = [a1 imageOrientation];
  if (v6 <= 7)
  {
    if (((1 << v6) & 0x22) != 0)
    {
      [a1 size];
      CGFloat v13 = v12;
      [a1 size];
      __n128 v14 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v14;
      *(__n128 *)&v25.tx = a2[2];
      CGAffineTransformTranslate(&v26, &v25, v13, v15);
      __n128 v16 = *(__n128 *)&v26.c;
      *a2 = *(__n128 *)&v26.a;
      a2[1] = v16;
      a2[2] = *(__n128 *)&v26.tx;
      __n128 v17 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v17;
      *(__n128 *)&v25.tx = a2[2];
      CGFloat v11 = 3.14159265;
      goto LABEL_8;
    }
    if (((1 << v6) & 0x44) != 0)
    {
      [a1 size];
      __n128 v18 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v18;
      *(__n128 *)&v25.tx = a2[2];
      CGAffineTransformTranslate(&v26, &v25, v19, 0.0);
      __n128 v20 = *(__n128 *)&v26.c;
      *a2 = *(__n128 *)&v26.a;
      a2[1] = v20;
      a2[2] = *(__n128 *)&v26.tx;
      __n128 v21 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v21;
      *(__n128 *)&v25.tx = a2[2];
      CGFloat v11 = 1.57079633;
      goto LABEL_8;
    }
    if (((1 << v6) & 0x88) != 0)
    {
      [a1 size];
      __n128 v7 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v7;
      *(__n128 *)&v25.tx = a2[2];
      CGAffineTransformTranslate(&v26, &v25, 0.0, v8);
      __n128 v9 = *(__n128 *)&v26.c;
      *a2 = *(__n128 *)&v26.a;
      a2[1] = v9;
      a2[2] = *(__n128 *)&v26.tx;
      __n128 v10 = a2[1];
      *(__n128 *)&v25.a = *a2;
      *(__n128 *)&v25.c = v10;
      *(__n128 *)&v25.tx = a2[2];
      CGFloat v11 = -1.57079633;
LABEL_8:
      CGAffineTransformRotate(&v26, &v25, v11);
      __n128 v22 = *(__n128 *)&v26.c;
      *a2 = *(__n128 *)&v26.a;
      a2[1] = v22;
      a2[2] = *(__n128 *)&v26.tx;
    }
  }
  __n128 v23 = a2[1];
  *a3 = *a2;
  a3[1] = v23;
  __n128 result = a2[2];
  a3[2] = result;
  return result;
}

- (uint64_t)wf_majorAxisOrientedSize
{
  unint64_t v2 = [a1 imageOrientation];
  if (v2 <= 7 && ((1 << v2) & 0xCC) != 0)
  {
    [a1 size];
    return [a1 size];
  }
  else
  {
    return [a1 size];
  }
}

- (id)wf_imageInIntrinsicOrientation
{
  if ([a1 imageOrientation])
  {
    long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v24.c = v2;
    *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&transform.a = *(_OWORD *)&v24.a;
    *(_OWORD *)&transform.c = v2;
    *(_OWORD *)&transform.tx = *(_OWORD *)&v24.tx;
    objc_msgSend(a1, "wf_affineTransformForImageOrientation:", &transform);
    CGAffineTransform v22 = v24;
    objc_msgSend(a1, "wf_affineTransformForImageMirroringOrientation:", &v22);
    CGAffineTransform v24 = transform;
    [a1 size];
    size_t v4 = (unint64_t)v3;
    [a1 size];
    size_t v6 = (unint64_t)v5;
    id v7 = a1;
    size_t BitsPerComponent = CGImageGetBitsPerComponent((CGImageRef)[v7 CGImage]);
    id v9 = v7;
    ColorSpace = CGImageGetColorSpace((CGImageRef)[v9 CGImage]);
    id v11 = v9;
    uint32_t BitmapInfo = CGImageGetBitmapInfo((CGImageRef)[v11 CGImage]);
    CGFloat v13 = CGBitmapContextCreate(0, v4, v6, BitsPerComponent, 0, ColorSpace, BitmapInfo);
    CGAffineTransform transform = v24;
    CGContextConcatCTM(v13, &transform);
    objc_msgSend(v11, "wf_majorAxisOrientedSize");
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    __n128 v18 = (CGImage *)[v11 CGImage];
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    v26.size.width = v15;
    v26.size.height = v17;
    CGContextDrawImage(v13, v26, v18);
    Image = CGBitmapContextCreateImage(v13);
    id v20 = [MEMORY[0x263F827E8] imageWithCGImage:Image];
    CGContextRelease(v13);
    CGImageRelease(Image);
  }
  else
  {
    id v20 = a1;
  }
  return v20;
}

@end