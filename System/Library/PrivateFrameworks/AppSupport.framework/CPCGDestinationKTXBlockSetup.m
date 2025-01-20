@interface CPCGDestinationKTXBlockSetup
@end

@implementation CPCGDestinationKTXBlockSetup

uint64_t ____CPCGDestinationKTXBlockSetup_block_invoke(void *a1, int a2, CFErrorRef *a3)
{
  CGColorSpaceRelease(*(CGColorSpaceRef *)(*(void *)(a1[4] + 8) + 24));
  v6 = *(const void **)(*(void *)(a1[5] + 8) + 24);
  if (v6) {
    CFRelease(v6);
  }
  v7 = *(const void **)(*(void *)(a1[6] + 8) + 24);
  if (v7) {
    CFRelease(v7);
  }
  v8 = *(CGImageDestination **)(*(void *)(a1[7] + 8) + 24);
  if (!v8)
  {
    int v14 = 0;
    goto LABEL_16;
  }
  if (a2)
  {
    uint64_t v9 = *(void *)(*(void *)(a1[8] + 8) + 24);
    if (v9)
    {
      CFIndex v10 = *(int *)(v9 + 8);
      if (v10)
      {
        CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D160];
        v12 = "Could not write ATX/KTX to disk";
        v13 = a3;
LABEL_14:
        __CPBitmapSetErrorIfNecessary(v13, v11, v10, v12);
        int v14 = 1;
        goto LABEL_15;
      }
    }
    if (!CGImageDestinationFinalize(v8))
    {
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D160];
      v12 = "ImageIO failed to write the image";
      v13 = a3;
      CFIndex v10 = 5;
      goto LABEL_14;
    }
  }
  int v14 = 0;
LABEL_15:
  CFRelease(*(CFTypeRef *)(*(void *)(a1[7] + 8) + 24));
LABEL_16:
  CGDataConsumerRelease(*(CGDataConsumerRef *)(*(void *)(a1[9] + 8) + 24));
  v15 = *(void **)(*(void *)(a1[8] + 8) + 24);
  if (v15) {
    free(v15);
  }
  return v14 ^ 1u;
}

uint64_t ____CPCGDestinationKTXBlockSetup_block_invoke_2(uint64_t a1, int a2, CGImageRef image, CFErrorRef *a4)
{
  if (*(unsigned char *)(a1 + 56) && (CGImageGetColorSpace(image), (CGColorSpaceEqualToColorSpace() & 1) == 0))
  {
    if (a4) {
      __CPBitmapSetErrorIfNecessary(a4, @"CPBitmapErrorDomain", 7, "Mismatched colorSpaces");
    }
    return 0;
  }
  else
  {
    CGImageDestinationAddImage(*(CGImageDestinationRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), image, *(CFDictionaryRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    return 1;
  }
}

@end