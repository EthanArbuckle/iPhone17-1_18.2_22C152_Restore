@interface VNCIContext
- (uint64_t)renderCIImage:(void *)a3 buffer:(int)a4 format:(void *)a5 error:;
@end

@implementation VNCIContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);

  objc_storeStrong((id *)&self->_ciContext, 0);
}

- (uint64_t)renderCIImage:(void *)a3 buffer:(int)a4 format:(void *)a5 error:
{
  id v9 = a2;
  if (!a1) {
    goto LABEL_19;
  }
  if (a4 <= 1278226533)
  {
    if (a4 == 1111970369)
    {
      v10 = (unsigned int *)MEMORY[0x1E4F1E280];
      goto LABEL_14;
    }
    if (a4 != 1278226488) {
      goto LABEL_17;
    }
    v11 = (unsigned int *)MEMORY[0x1E4F1E298];
  }
  else
  {
    switch(a4)
    {
      case 1278226534:
        v11 = (unsigned int *)MEMORY[0x1E4F1E2A8];
        break;
      case 1278226536:
        v11 = (unsigned int *)MEMORY[0x1E4F1E2B0];
        break;
      case 1380401729:
        v10 = (unsigned int *)MEMORY[0x1E4F1E2F0];
LABEL_14:
        uint64_t v12 = *v10;
        CGColorSpaceRef v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
        goto LABEL_15;
      default:
LABEL_17:
        if (a5)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:@"unsupported pixel format"];
          uint64_t v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
LABEL_19:
        uint64_t v15 = 0;
        goto LABEL_16;
    }
  }
  uint64_t v12 = *v11;
  CGColorSpaceRef v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
LABEL_15:
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 8), "render:toBitmap:rowBytes:bounds:format:colorSpace:", v9, *a3, a3[3], v12, v13, 0.0, 0.0, (double)(unint64_t)a3[2], (double)(unint64_t)a3[1]);
  CGColorSpaceRelease(v14);
  uint64_t v15 = 1;
LABEL_16:

  return v15;
}

@end