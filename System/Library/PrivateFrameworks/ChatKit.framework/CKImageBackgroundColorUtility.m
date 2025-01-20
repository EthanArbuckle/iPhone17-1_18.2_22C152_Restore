@interface CKImageBackgroundColorUtility
- (CKImageBackgroundColorUtility)initWithImage:(id)a3;
- (UIColor)backgroundColor;
- (UIImage)image;
- (void)analyze;
- (void)setBackgroundColor:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation CKImageBackgroundColorUtility

- (CKImageBackgroundColorUtility)initWithImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKImageBackgroundColorUtility;
  v6 = [(CKImageBackgroundColorUtility *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

- (void)analyze
{
  components[3] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  v64 = self;
  space = CGColorSpaceCreateDeviceRGB();
  CopyWithColorSpace = CGImageCreateCopyWithColorSpace([(UIImage *)self->_image CGImage], space);
  DataProvider = CGImageGetDataProvider(CopyWithColorSpace);
  CFDataRef cf = CGDataProviderCopyData(DataProvider);
  BytePtr = CFDataGetBytePtr(cf);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(CopyWithColorSpace);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(CopyWithColorSpace);
  size_t BytesPerRow = CGImageGetBytesPerRow(CopyWithColorSpace);
  v63 = CopyWithColorSpace;
  size_t Width = CGImageGetWidth(CopyWithColorSpace);
  size_t Height = CGImageGetHeight(CopyWithColorSpace);
  if (Width)
  {
    uint64_t v11 = 0;
    size_t v68 = BitsPerPixel / BitsPerComponent;
    do
    {
      if (Height)
      {
        uint64_t v12 = 0;
        size_t v13 = Height;
        do
        {
          v14 = &BytePtr[v11 * v68 + v12 * BytesPerRow];
          LOBYTE(v10) = *v14;
          double v15 = (double)v10 / 255.0;
          components[0] = v15;
          LOBYTE(v15) = v14[1];
          double v16 = (double)*(unint64_t *)&v15 / 255.0;
          components[1] = v16;
          LOBYTE(v16) = v14[2];
          components[2] = (double)*(unint64_t *)&v16 / 255.0;
          CGColorRef v17 = CGColorCreate(space, components);
          v18 = (void *)[objc_alloc(MEMORY[0x1E4F428B8]) initWithCGColor:v17];
          if (v17) {
            CFRelease(v17);
          }
          if ((objc_msgSend(v18, "ck_isVeryDark") & 1) == 0 && (objc_msgSend(v18, "ck_isVeryLight") & 1) == 0) {
            [v3 addObject:v18];
          }

          ++v12;
          --v13;
        }
        while (v13);
      }
      if ((unint64_t)[v3 count] > 0x20) {
        break;
      }
      ++v11;
    }
    while (v11 != Width);
  }
  id v73 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v19 = v3;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v86 objects:v93 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v87 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v86 + 1) + 8 * i);
        uint64_t v25 = [v19 countForObject:v24];
        v26 = [NSNumber numberWithUnsignedInteger:v25];
        [v73 setObject:v26 forKeyedSubscript:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v86 objects:v93 count:16];
    }
    while (v21);
  }
  v61 = v19;

  v27 = objc_msgSend(v73, "keysSortedByValueUsingSelector:");
  v28 = [v27 reverseObjectEnumerator];
  v29 = [v28 allObjects];

  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = v29;
  uint64_t v31 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v83;
    uint64_t v65 = *(void *)v83;
    do
    {
      uint64_t v34 = 0;
      uint64_t v66 = v32;
      do
      {
        if (*(void *)v83 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void *)(*((void *)&v82 + 1) + 8 * v34);
        if ([v30 count])
        {
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          v36 = [v30 keysSortedByValueUsingSelector:sel_compare_];
          v37 = [v36 reverseObjectEnumerator];
          v38 = [v37 allObjects];

          uint64_t v39 = [v38 countByEnumeratingWithState:&v78 objects:v91 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v71 = v34;
            uint64_t v41 = *(void *)v79;
            do
            {
              for (uint64_t j = 0; j != v40; ++j)
              {
                if (*(void *)v79 != v41) {
                  objc_enumerationMutation(v38);
                }
                if (objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * j), "ck_isCloseToColor:", v35))
                {
                  v43 = NSNumber;
                  v44 = [v30 objectForKeyedSubscript:v35];
                  int v45 = [v44 unsignedIntValue];
                  v46 = [v73 objectForKeyedSubscript:v35];
                  v47 = objc_msgSend(v43, "numberWithUnsignedInt:", objc_msgSend(v46, "unsignedIntValue") + v45);
                  [v30 setObject:v47 forKeyedSubscript:v35];
                }
                else
                {
                  v44 = [v73 objectForKeyedSubscript:v35];
                  [v30 setObject:v44 forKeyedSubscript:v35];
                }
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v78 objects:v91 count:16];
            }
            while (v40);
            uint64_t v33 = v65;
            uint64_t v32 = v66;
            uint64_t v34 = v71;
          }
        }
        else
        {
          v38 = [v73 objectForKeyedSubscript:v35];
          [v30 setObject:v38 forKeyedSubscript:v35];
        }

        ++v34;
      }
      while (v34 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
    }
    while (v32);
  }

  v48 = [v30 allKeys];
  v49 = [v48 firstObject];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v50 = [v30 allKeys];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v74 objects:v90 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(void *)v75 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = *(void **)(*((void *)&v74 + 1) + 8 * k);
        v56 = [v30 objectForKeyedSubscript:v49];
        unsigned int v57 = [v56 unsignedIntValue];

        v58 = [v30 objectForKeyedSubscript:v55];
        unsigned int v59 = [v58 unsignedIntValue];

        if (v57 <= v59)
        {
          id v60 = v55;

          v49 = v60;
        }
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v74 objects:v90 count:16];
    }
    while (v52);
  }

  if (cf) {
    CFRelease(cf);
  }
  if (v63) {
    CFRelease(v63);
  }
  if (space) {
    CFRelease(space);
  }
  [(CKImageBackgroundColorUtility *)v64 setBackgroundColor:v49];
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end