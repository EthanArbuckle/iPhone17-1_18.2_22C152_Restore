@interface CUIThemePixelRendition
@end

@implementation CUIThemePixelRendition

NSDictionary *__77___CUIThemePixelRendition_newImageFromCSIDataSlice_ofBitmap_usingColorspace___block_invoke()
{
  uint64_t v3 = kCGImageProviderAlphaIsOne;
  CFBooleanRef v4 = kCFBooleanTrue;
  __opaqueProviderOptions = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  uint64_t v1 = kCGImageProviderAlphaIsPremultiplied;
  CFBooleanRef v2 = kCFBooleanTrue;
  result = +[NSDictionary dictionaryWithObjects:&v2 forKeys:&v1 count:1];
  __nonOpaqueProviderOptions = (uint64_t)result;
  return result;
}

void __46___CUIThemePixelRendition_setSharedBlockData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _CUILog(3, (uint64_t)"CoreUI: dispatch_async to clear caches started", a3, a4, a5, a6, a7, a8, v33);
  uint64_t v10 = *(int *)(a1 + 40);
  if (v10 > 2)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *off_1E5A58AC8[v10];
    uint64_t v13 = *(void *)(v11 + v12);
    *(void *)(v11 + v12) = 0;
    if (*(void *)(*(void *)(a1 + 32) + 352)) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      CGImageGetImageProvider();
      Info = (os_unfair_lock_s *)CGImageProviderGetInfo();
      if (Info)
      {
        v16 = (id *)Info;
        v17 = Info + 10;
        os_unfair_lock_lock(Info + 10);
        id WeakRetained = objc_loadWeakRetained(v16 + 6);
        v19 = WeakRetained;
        if (WeakRetained)
        {
          if (*(unsigned char *)(v13 + 176))
          {
            unsigned int v20 = [WeakRetained bitmapEncoding];
            v21 = +[NSString stringWithFormat:@"%p-%d", *(void *)(*(void *)(a1 + 32) + 352), *(unsigned int *)(a1 + 40)];
            if (v21)
            {
              if (v20 >= 2 && v20 <= 7)
              {
                v23 = v21;
                if (![(id)+[_CSIRenditionBlockData sharedCache]() objectForKey:v21])
                {
                  unint64_t v24 = *(void *)(v13 + 32) * *(unsigned int *)(v13 + 24);
                  if (v24 <= 0x17FEA3)
                  {
                    v25 = v23;
                    [(id)+[_CSIRenditionBlockData sharedCache]() setObject:v13 forKey:v23 cost:v24];
                    int v26 = *(_DWORD *)(a1 + 40);
                    if (v26 == 2)
                    {

                      v16[13] = v23;
                    }
                    else if (v26 == 1)
                    {

                      v16[12] = v23;
                    }
                    else if (v26)
                    {
                    }
                    else
                    {

                      v16[11] = v23;
                    }
                  }
                }
              }
            }
          }
        }

        os_unfair_lock_unlock(v17);
      }
    }
  }

  _CUILog(3, (uint64_t)"CoreUI: dispatch_async to clear caches ended", v27, v28, v29, v30, v31, v32, a9);
}

@end