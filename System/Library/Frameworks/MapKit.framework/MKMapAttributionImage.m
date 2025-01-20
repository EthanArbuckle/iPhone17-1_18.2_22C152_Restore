@interface MKMapAttributionImage
+ (id)badgeImageForView:(id)a3;
- (MKMapAttributionImage)initWithAttributions:(id)a3 type:(int64_t)a4;
- (id)imageNameForScale:(double)a3;
@end

@implementation MKMapAttributionImage

- (void).cxx_destruct
{
}

+ (id)badgeImageForView:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F64918] modernManager];
  v5 = [v4 activeTileGroup];
  v6 = (void *)[v5 attributionsCount];

  if (v6)
  {
    v7 = [MKMapAttributionImage alloc];
    v8 = [MEMORY[0x1E4F64918] modernManager];
    v9 = [v8 activeTileGroup];
    v10 = [v9 attributions];
    v11 = [(MKMapAttributionImage *)v7 initWithAttributions:v10 type:1];

    [v3 _currentScreenScale];
    double v13 = v12;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__MKMapAttributionImage_badgeImageForView___block_invoke;
    v19[3] = &unk_1E54BBBB8;
    v14 = v11;
    v20 = v14;
    v15 = (void (**)(void, double))MEMORY[0x18C139AE0](v19);
    unint64_t v16 = vcvtpd_u64_f64(v13);
    if (v16)
    {
      while (1)
      {
        uint64_t v17 = v15[2](v15, (double)v16);
        if (v17) {
          break;
        }
        if (!--v16) {
          goto LABEL_5;
        }
      }
      v6 = (void *)v17;
    }
    else
    {
LABEL_5:
      v6 = 0;
    }
  }

  return v6;
}

id __43__MKMapAttributionImage_badgeImageForView___block_invoke(uint64_t a1, double a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + 32), "imageNameForScale:");
  if (v3)
  {
    v4 = [MEMORY[0x1E4F64908] sharedManager];
    v5 = [v4 dataForResourceWithName:v3 fallbackBundle:0];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) _initWithData:v5 scale:a2];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MKMapAttributionImage)initWithAttributions:(id)a3 type:(int64_t)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)MKMapAttributionImage;
  v6 = [(MKMapAttributionImage *)&v65 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v5 count])
    {
      v46 = [v5 objectAtIndex:0];
      v8 = _attributionImagesForType(v46, a4);
      if ([v8 count])
      {
        v43 = v6;
        v45 = v8;
        v56 = [v8 firstObject];
        v9 = [v56 stringByDeletingPathExtension];
        char v10 = 0;
        uint64_t v11 = 3;
        do
        {
          uint64_t v12 = v11;
          double v13 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v11);
          uint64_t v14 = [v9 rangeOfString:v13];

          if (v10) {
            break;
          }
          char v10 = 1;
          uint64_t v11 = 2;
        }
        while (v14 == 0x7FFFFFFFFFFFFFFFLL);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v12;
        }

        unint64_t v16 = [NSNumber numberWithUnsignedLong:v15];
        v51 = v7;
        [v7 setObject:v56 forKeyedSubscript:v16];

        v47 = (void *)[v45 mutableCopy];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v44 = v5;
        id obj = v5;
        uint64_t v17 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
        v18 = v46;
        if (v17)
        {
          uint64_t v19 = v17;
          id v54 = *(id *)v62;
          do
          {
            uint64_t v20 = 0;
            uint64_t v48 = v19;
            do
            {
              if (*(id *)v62 != v54) {
                objc_enumerationMutation(obj);
              }
              v21 = *(void **)(*((void *)&v61 + 1) + 8 * v20);
              if (v21 != v18)
              {
                v22 = [*(id *)(*((void *)&v61 + 1) + 8 * v20) name];
                if (v22)
                {
                  double v13 = [v21 name];
                  unint64_t v16 = [v18 name];
                  if (([v13 isEqualToString:v16] & 1) == 0)
                  {

LABEL_27:
                    goto LABEL_28;
                  }
                }
                uint64_t v23 = [v21 url];
                if (!v23)
                {
                  if (v22)
                  {
                  }
LABEL_26:
                  v22 = _attributionImagesForType(v21, a4);
                  [v47 addObjectsFromArray:v22];
                  goto LABEL_27;
                }
                v24 = (void *)v23;
                v25 = [v21 url];
                v26 = [v18 url];
                int v27 = [v25 isEqualToString:v26];

                if (!v22)
                {
                  v18 = v46;
                  uint64_t v19 = v48;
                  if (!v27) {
                    goto LABEL_28;
                  }
                  goto LABEL_26;
                }

                v18 = v46;
                uint64_t v19 = v48;
                if (v27) {
                  goto LABEL_26;
                }
              }
LABEL_28:
              ++v20;
            }
            while (v19 != v20);
            uint64_t v19 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
          }
          while (v19);
        }

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v55 = v47;
        uint64_t v28 = [v55 countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v58;
          uint64_t v50 = *(void *)v58;
          do
          {
            uint64_t v31 = 0;
            id obja = (id)v29;
            do
            {
              if (*(void *)v58 != v30) {
                objc_enumerationMutation(v55);
              }
              v32 = *(void **)(*((void *)&v57 + 1) + 8 * v31);
              if (([v32 isEqualToString:v56] & 1) == 0)
              {
                v33 = [v32 stringByDeletingPathExtension];
                char v34 = 0;
                uint64_t v35 = 3;
                do
                {
                  uint64_t v36 = v35;
                  v37 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v35);
                  uint64_t v38 = [v33 rangeOfString:v37];

                  if (v34) {
                    break;
                  }
                  char v34 = 1;
                  uint64_t v35 = 2;
                }
                while (v38 == 0x7FFFFFFFFFFFFFFFLL);
                if (v38 == 0x7FFFFFFFFFFFFFFFLL) {
                  uint64_t v39 = 1;
                }
                else {
                  uint64_t v39 = v36;
                }

                v40 = [NSNumber numberWithUnsignedLong:v39];
                [v51 setObject:v32 forKeyedSubscript:v40];

                uint64_t v30 = v50;
                uint64_t v29 = (uint64_t)obja;
              }
              ++v31;
            }
            while (v31 != v29);
            uint64_t v29 = [v55 countByEnumeratingWithState:&v57 objects:v66 count:16];
          }
          while (v29);
        }

        v6 = v43;
        id v5 = v44;
        v7 = v51;
        v8 = v45;
      }
    }
    if ([v7 count])
    {
      objc_storeStrong((id *)&v6->_imageNameForScale, v7);
      v41 = v6;
    }
    else
    {
      v41 = 0;
    }
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)imageNameForScale:(double)a3
{
  imageNameForScale = self->_imageNameForScale;
  v4 = [NSNumber numberWithUnsignedLong:vcvtpd_u64_f64(a3)];
  id v5 = [(NSDictionary *)imageNameForScale objectForKeyedSubscript:v4];

  return v5;
}

@end