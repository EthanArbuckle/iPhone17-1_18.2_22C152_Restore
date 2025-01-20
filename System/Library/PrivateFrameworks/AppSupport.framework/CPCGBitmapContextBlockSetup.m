@interface CPCGBitmapContextBlockSetup
@end

@implementation CPCGBitmapContextBlockSetup

uint64_t ____CPCGBitmapContextBlockSetup_block_invoke(void *a1)
{
  v2 = *(const void **)(*(void *)(a1[4] + 8) + 24);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(void **)(*(void *)(a1[5] + 8) + 24);
  if (v3) {
    free(v3);
  }
  v4 = *(CGColorSpaceRef **)(*(void *)(a1[6] + 8) + 24);
  if (v4)
  {
    CGColorSpaceRelease(*v4);
    CGColorSpaceRelease(*(CGColorSpaceRef *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 8));
    free(*(void **)(*(void *)(a1[6] + 8) + 24));
  }
  return 1;
}

uint64_t ____CPCGBitmapContextBlockSetup_block_invoke_2(uint64_t a1, uint64_t a2, CGImageRef image, CFErrorRef *a4)
{
  if (*(unsigned char *)(a1 + 88) && (CGImageGetColorSpace(image), (CGColorSpaceEqualToColorSpace() & 1) == 0))
  {
    if (a4)
    {
      CFStringRef v20 = @"CPBitmapErrorDomain";
      v21 = "Mismatched colorSpaces";
      v22 = a4;
      CFIndex v23 = 7;
LABEL_15:
      __CPBitmapSetErrorIfNecessary(v22, v20, v23, v21);
    }
  }
  else
  {
    unint64_t v8 = *(void *)(a1 + 56);
    if (!v8) {
      return 1;
    }
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    unint64_t v11 = *(void *)(a1 + 64);
    while (1)
    {
      unint64_t v12 = v8 - v9;
      unint64_t v13 = v12 >= v11 ? v11 : v12;
      v25.origin.y = (double)v9;
      CGFloat v14 = (double)*(unint64_t *)(a1 + 72);
      CGFloat v15 = (double)(v11 - v13);
      v25.origin.x = 0.0;
      v25.size.width = v14;
      v25.size.height = (double)v13;
      v16 = CGImageCreateWithImageInRect(image, v25);
      bzero(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(void *)(a1 + 80));
      v26.origin.x = 0.0;
      v26.origin.y = v15;
      v26.size.width = v14;
      v26.size.height = (double)v13;
      CGContextDrawImage(*(CGContextRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v26, v16);
      CGImageRelease(v16);
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      size_t v18 = *(void *)(v17 + 32) * v13;
      if (pwrite(*(_DWORD *)(a2 + 24), *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), v18, v10 + *(void *)(v17 + 40) * *(void *)(a2 + 88)) == -1)break; {
      v10 += v18;
      }
      unint64_t v8 = *(void *)(a1 + 56);
      unint64_t v11 = *(void *)(a1 + 64);
      v9 += v11;
      if (v9 >= v8) {
        return 1;
      }
    }
    if (a4)
    {
      CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F1D160];
      CFIndex v23 = *__error();
      v21 = "Could not write bitmap to disk";
      v22 = a4;
      CFStringRef v20 = v24;
      goto LABEL_15;
    }
  }
  return 0;
}

@end