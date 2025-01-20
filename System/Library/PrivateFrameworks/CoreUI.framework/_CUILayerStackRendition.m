@interface _CUILayerStackRendition
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)layerReferences;
- (id)metrics;
- (void)dealloc;
@end

@implementation _CUILayerStackRendition

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUILayerStackRendition;
  [(_CUIRawDataRendition *)&v3 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v34.receiver = self;
  v34.super_class = (Class)_CUILayerStackRendition;
  v6 = [(_CUIRawDataRendition *)&v34 _initWithCSIHeader:a3 version:*(void *)&a4];
  if (a3->var6 != 1145132097)
  {
    v30 = +[NSAssertionHandler currentHandler];
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"CUIThemeRendition.m", 2368, @"CoreUI: -[%@ %@] pixel format must be kCSIPixelFormatRawData", v32, NSStringFromSelector(a2));
  }
  LODWORD(v7) = a3->var3;
  LODWORD(v8) = a3->var4;
  double v9 = (double)v7;
  double v10 = (double)v8;

  v6[28] = -[CUIRenditionMetrics initwithImageSize:scale:]((double *)[CUIRenditionMetrics alloc], v9, v10, (double)[v6 internalScale]);
  uint64_t var10 = a3->var10;
  if (var10)
  {
    char v12 = 0;
    v13 = &a3->var11.var1[a3->var11.var0 + 1];
    v14 = (unsigned int *)((char *)v13 + var10);
    v33 = (char *)v13 + var10;
    do
    {
      if (*v13 == 1012)
      {
        v6[29] = [objc_alloc((Class)NSMutableArray) initWithCapacity:v13[2]];
        if (v13[2])
        {
          unsigned int v15 = 0;
          v16 = v13 + 4;
          do
          {
            v17 = objc_alloc_init(CUIRenditionLayerReference);
            LODWORD(v18) = v16[3];
            LODWORD(v19) = v16[4];
            -[CUIRenditionLayerReference setFrame:](v17, "setFrame:", (double)(int)v16[1], (double)(int)v16[2], (double)v18, (double)v19);
            [(CUIRenditionLayerReference *)v17 setOpacity:*((float *)v16 + 6)];
            [(CUIRenditionLayerReference *)v17 setBlendMode:v16[5]];
            [(CUIRenditionLayerReference *)v17 setFixedFrame:*v16 & 1];
            long long v38 = 0u;
            memset(v39, 0, sizeof(v39));
            long long v36 = 0u;
            long long v37 = 0u;
            long long v35 = 0u;
            __memcpy_chk();
            [(CUIRenditionLayerReference *)v17 setReferenceKey:[[CUIRenditionKey alloc] initWithKeyList:&v35]];
            [v6[29] addObject:v17];

            v16 = (unsigned int *)((char *)v16 + v16[7] + 32);
            ++v15;
          }
          while (v15 < v13[2]);
          char v12 = 1;
          v14 = (unsigned int *)v33;
        }
        else
        {
          char v12 = 1;
        }
      }
      v13 = (unsigned int *)((char *)v13 + v13[1] + 8);
    }
    while (v13 < v14);
    if ((v12 & 1) == 0)
    {
      uint64_t v20 = a3->var10;
      if (v20)
      {
        v21 = (char *)v14 - v20;
        do
        {
          if (*(_DWORD *)v21 == 1009)
          {
            v6[29] = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((unsigned int *)v21 + 2)];
            if (*((_DWORD *)v21 + 2))
            {
              unsigned int v22 = 0;
              v23 = (float *)(v21 + 16);
              do
              {
                v24 = objc_alloc_init(CUIRenditionLayerReference);
                *(float *)&unint64_t v25 = *v23;
                *(float *)&unint64_t v26 = v23[1];
                *(float *)&unint64_t v27 = v23[2];
                *(float *)&unint64_t v28 = v23[3];
                -[CUIRenditionLayerReference setFrame:](v24, "setFrame:", (double)v25, (double)v26, (double)v27, (double)v28);
                [(CUIRenditionLayerReference *)v24 setOpacity:v23[5]];
                [(CUIRenditionLayerReference *)v24 setBlendMode:*((unsigned int *)v23 + 4)];
                long long v38 = 0u;
                memset(v39, 0, sizeof(v39));
                long long v36 = 0u;
                long long v37 = 0u;
                long long v35 = 0u;
                __memcpy_chk();
                [(CUIRenditionLayerReference *)v24 setReferenceKey:[[CUIRenditionKey alloc] initWithKeyList:&v35]];
                [v6[29] addObject:v24];

                v23 = (float *)((char *)v23 + *((unsigned int *)v23 + 6) + 28);
                ++v22;
              }
              while (v22 < *((_DWORD *)v21 + 2));
            }
          }
          v21 += *((unsigned int *)v21 + 1) + 8;
        }
        while (v21 < v33);
      }
    }
  }
  return v6;
}

- (id)layerReferences
{
  return self->_layers;
}

- (id)metrics
{
  v2 = self->_renditionMetrics;
  return v2;
}

@end