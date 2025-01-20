@interface _CUIThemeGradientRendition
+ (NSArray)_nodesFromNodeList:(uint64_t)a1 count:(_DWORD *)a2 header:(uint64_t)a3;
+ (void)_parseGradientInfoFromCSIHeader:(uint64_t)a3;
- (double)gradientDrawingAngle;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)gradient;
- (void)dealloc;
@end

@implementation _CUIThemeGradientRendition

+ (NSArray)_nodesFromNodeList:(uint64_t)a1 count:(_DWORD *)a2 header:(uint64_t)a3
{
  uint64_t v5 = self;
  if (a3)
  {
    uint64_t v6 = v5;
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3];
    for (i = (double *)(a2 + 8); ; i += 9)
    {
      int v9 = *a2;
      int v10 = *((_DWORD *)i - 8);
      if (*a2 != v10)
      {
        if (v9 == 1129270354 && v10 == 1129270340)
        {
LABEL_23:
          v12 = -[CUIPSDGradientDoubleColorStop initWithLocation:leadInColor:leadOutColor:]([CUIPSDGradientDoubleColorStop alloc], "initWithLocation:leadInColor:leadOutColor:", *((float *)i - 7), *(i - 3), *(i - 2), *(i - 1), *i, *((void *)i + 1), *((void *)i + 2), *((void *)i + 3), *((void *)i + 4));
          goto LABEL_29;
        }
        if (v9 == 1330660180)
        {
          if (v10 == 1330660164) {
            goto LABEL_24;
          }
        }
        else if (v9 == 1330660164)
        {
          if (v10 == 1330660180)
          {
LABEL_28:
            v12 = [[CUIPSDGradientOpacityStop alloc] initWithLocation:*((float *)i - 7) opacity:*i];
            goto LABEL_29;
          }
        }
        else if (v9 == 1129270340 && v10 == 1129270354)
        {
          goto LABEL_22;
        }
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel__nodesFromNodeList_count_header_ object:v6 file:@"_CUIThemeGradientRendition.m" lineNumber:34 description:@"CoreUI: Mixed node types in node list"];
        int v9 = *((_DWORD *)i - 8);
      }
      if (v9 <= 1296647247)
      {
        if (v9 == 1129270340) {
          goto LABEL_23;
        }
        if (v9 == 1129270354)
        {
LABEL_22:
          v12 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:]([CUIPSDGradientColorStop alloc], "initWithLocation:gradientColor:", *((float *)i - 7), *(i - 3), *(i - 2), *(i - 1), *i);
LABEL_29:
          v15 = v12;
          goto LABEL_30;
        }
      }
      else
      {
        switch(v9)
        {
          case 1296647248:
            id v13 = objc_alloc((Class)NSNumber);
            LODWORD(v14) = *((_DWORD *)i - 7);
            v12 = (CUIPSDGradientDoubleColorStop *)[v13 initWithFloat:v14];
            goto LABEL_29;
          case 1330660164:
LABEL_24:
            v12 = [[CUIPSDGradientDoubleOpacityStop alloc] initWithLocation:*((float *)i - 7) leadInOpacity:*i leadOutOpacity:i[4]];
            goto LABEL_29;
          case 1330660180:
            goto LABEL_28;
        }
      }
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel__nodesFromNodeList_count_header_ object:v6 file:@"_CUIThemeGradientRendition.m" lineNumber:73 description:@"CoreUI: Invalid gradient node type in gradient rendition initialization"];
      v15 = 0;
LABEL_30:
      [v7 addObject:v15];

      if (!--a3)
      {
        return (NSArray *)v7;
      }
    }
  }
  return +[NSArray array];
}

+ (void)_parseGradientInfoFromCSIHeader:(uint64_t)a3
{
  self;
  a2[1] = 0.0;
  a2[2] = 0.0;
  *a2 = 0.0;
  uint64_t v35 = a1;
  uint64_t v11 = *(unsigned int *)(a1 + 172);
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v33 = a1 + 176 + 4 * v11 + *(unsigned int *)(a1 + 168) + 4;
    uint64_t v34 = a1 + 176;
    char v13 = 1;
    while ((v13 & 1) != 0)
    {
      uint64_t v14 = v33 + *(unsigned int *)(v34 + 4 * v12);
      int v15 = *(_DWORD *)v14;
      unsigned int v16 = *(_DWORD *)(v14 + 12);
      if (*(_DWORD *)v14 == 1145131591)
      {
        unsigned int v16 = bswap32(v16);
        unsigned int v17 = bswap32(*(_DWORD *)(v14 + 64));
      }
      else
      {
        unsigned int v17 = *(_DWORD *)(v14 + 64);
      }
      *(_DWORD *)a2 = v16;
      if (v17 >= 2)
      {
        a2[1] = *(float *)(v14 + 56);
        unsigned int v18 = *(_DWORD *)(v14 + 68);
        unsigned int v19 = *(_DWORD *)(v14 + 72);
        unsigned int v20 = *(_DWORD *)(v14 + 76);
        unsigned int v21 = bswap32(v18);
        unsigned int v22 = bswap32(v19);
        unsigned int v23 = bswap32(v20);
        uint64_t v24 = v15 == 1145131591 ? v21 : v18;
        uint64_t v25 = v15 == 1145131591 ? v22 : v19;
        uint64_t v26 = v15 == 1145131591 ? v23 : v20;
        v27 = +[_CUIThemeGradientRendition _nodesFromNodeList:count:header:]((uint64_t)_CUIThemeGradientRendition, (_DWORD *)(v14 + 80), v17);
        v28 = (_DWORD *)(v14 + 80 + 72 * v17);
        v29 = +[_CUIThemeGradientRendition _nodesFromNodeList:count:header:]((uint64_t)_CUIThemeGradientRendition, v28, v24);
        v30 = &v28[18 * v24];
        v31 = +[_CUIThemeGradientRendition _nodesFromNodeList:count:header:]((uint64_t)_CUIThemeGradientRendition, v30, v25);
        v32 = -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:]([CUIPSDGradientEvaluator alloc], "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", v27, v29, v31, +[_CUIThemeGradientRendition _nodesFromNodeList:count:header:]((uint64_t)_CUIThemeGradientRendition, &v30[18 * v25], v26), *(_DWORD *)(v14 + 4) & 1, *(float *)(v14 + 60), *(double *)(v14 + 24), *(double *)(v14 + 32), *(double *)(v14 + 40), *(double *)(v14 + 48));
        *((void *)a2 + 2) = v32;
        [(CUIPSDGradientEvaluator *)v32 setBlendMode:*(unsigned int *)(v14 + 20)];
        char v13 = 0;
        uint64_t v12 = 1;
        if (*(_DWORD *)(v35 + 172) > 1u) {
          continue;
        }
      }
      return;
    }
    _CUILog(4, (uint64_t)"Warning: Ignoring extra gradient data found in CSI", v5, v6, v7, v8, v9, v10, a3);
  }
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v15.receiver = self;
  v15.super_class = (Class)_CUIThemeGradientRendition;
  uint64_t v5 = [(CUIThemeRendition *)&v15 _initWithCSIHeader:a3 version:*(void *)&a4];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  +[_CUIThemeGradientRendition _parseGradientInfoFromCSIHeader:v11];
  uint64_t v6 = v14;
  if (v14)
  {
    if ((*((_DWORD *)a3 + 7) & 0xF) == 1) {
      uint64_t SRGB = _CUIColorSpaceGetSRGB();
    }
    else {
      uint64_t SRGB = _CUIColorSpaceGetGenericRGB();
    }
    uint64_t v9 = SRGB;
    objc_msgSend(v5, "setBlendMode:", objc_msgSend(v6, "blendMode"));
    v5[28] = v13;
    [v5 setSubtype:v12];
    v5[27] = [[CUIThemeGradient alloc] _initWithGradientEvaluator:v6 colorSpace:v9];
  }
  else
  {
    uint64_t v8 = v5;
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeGradientRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (double)gradientDrawingAngle
{
  return self->gradientAngle;
}

- (id)gradient
{
  return self->gradient;
}

@end