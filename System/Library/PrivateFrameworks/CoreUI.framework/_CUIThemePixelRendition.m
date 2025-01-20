@interface _CUIThemePixelRendition
- (BOOL)edgesOnly;
- (BOOL)isScaled;
- (BOOL)isTiled;
- (CGImage)unslicedImage;
- (CGSize)unslicedSize;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)copySharedBlockDataWithPixelFormat:(int)a3;
- (id)imageForSliceIndex:(int64_t)a3;
- (id)layerReferences;
- (id)maskForSliceIndex:(int64_t)a3;
- (id)metrics;
- (id)sliceInformation;
- (int)pixelFormat;
- (uint64_t)newImageFromCSIDataSlice:(unint64_t)a3 ofBitmap:(uint64_t)a4 usingColorspace:(CGColorSpace *)a5;
- (unint64_t)sourceRowbytes;
- (void)dealloc;
- (void)setSharedBlockData:(id)a3;
@end

@implementation _CUIThemePixelRendition

- (CGImage)unslicedImage
{
  result = self->_unslicedImage;
  if (result)
  {
    CFRetain(result);
    CFAutorelease(self->_unslicedImage);
    return self->_unslicedImage;
  }
  return result;
}

- (id)metrics
{
  v2 = self->_renditionMetrics;
  return v2;
}

- (void)dealloc
{
  CGImageRelease(self->_unslicedImage);
  self->_unslicedImage = 0;
  if (self->_nimages)
  {
    unint64_t v3 = 0;
    image = self->_image;
    do
    {
      CGImageRelease(image[v3]);
      image[v3++] = 0;
    }
    while (v3 < self->_nimages);
  }

  self->_cachedBlockDataBGRX = 0;
  self->_cachedBlockDataRGBX = 0;

  self->_cachedBlockDataGray = 0;
  self->_renditionMetrics = 0;

  self->_sliceInformation = 0;
  v5.receiver = self;
  v5.super_class = (Class)_CUIThemePixelRendition;
  [(CUIThemeRendition *)&v5 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v4 = a3;
  v169.receiver = self;
  v169.super_class = (Class)_CUIThemePixelRendition;
  id v5 = [(CUIThemeRendition *)&v169 _initWithCSIHeader:a3 version:*(void *)&a4];
  uint64_t var0 = v4->var11.var0;
  if (!var0) {
    return v5;
  }
  uint64_t v7 = 0;
  var1 = v4->var11.var1;
  uint64_t v8 = (uint64_t)&v4->var11.var1[var0 + 1] + v4->var10;
  CGFloat height = NSZeroSize.height;
  char v10 = 1;
  p_info = CUINamedExternalLink.info;
  p_uint64_t var0 = &v4->var0;
  unint64_t v156 = v8;
  do
  {
    v12 = (_DWORD *)(v8 + var1[v7]);
    if (*v12 != 1128614989 && *v12 != 1296844099)
    {
      id v149 = [v5 name];
      _CUILog(4, (uint64_t)"CoreUI: Expecting a kCSIElementSignature but didn't find it: '%@'", v140, v141, v142, v143, v144, v145, (uint64_t)v149);
      goto LABEL_128;
    }
    unsigned int v14 = v12[1];
    v15 = (unsigned int *)[v5 renditionFlags];
    unsigned int *v15 = *v15 & 0xFFFFFFFD | (2 * ((v14 >> 1) & 1));
    if ((v10 & 1) == 0)
    {
      _CUILog(4, (uint64_t)"Warning: Ignoring extra images found in CSI", v16, v17, v18, v19, v20, v21, v148);
      return v5;
    }
    uint64_t var10 = v4->var10;
    if (!var10) {
      goto LABEL_128;
    }
    uint64_t v152 = (uint64_t)v12;
    v157 = 0;
    CGColorSpaceRef space = 0;
    v23 = 0;
    unint64_t v24 = v8;
    v25 = (_DWORD *)(v8 - var10);
    do
    {
      switch(*v25)
      {
        case 0x3E9:
          unsigned int v26 = v25[2];
          v157 = v25 + 2;
          *((_DWORD *)v5 + 54) = v26;
          if (v26 >= 0x11) {
            [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v5 file:@"CUIThemeRendition.m" lineNumber:3659 description:@"CoreUI: have more slices than image slots: _CUIThemePixelRendition"];
          }
          break;
        case 0x3EB:
          CGColorSpaceRef space = (CGColorSpaceRef)(v25 + 2);
          break;
        case 0x3EE:
          [v5 setExifOrientation:v25[2]];
          break;
        case 0x3EF:
          *((void *)v5 + 50) = v25[2];
          break;
        case 0x3F4:
          v23 = v25 + 2;
          *((void *)v5 + 51) = [objc_alloc((Class)NSMutableArray) initWithCapacity:v25[2]];
          if (v25[2])
          {
            unsigned int v27 = 0;
            v28 = (float *)(v25 + 4);
            do
            {
              id v29 = objc_alloc_init((Class)(p_info + 196));
              *(float *)&unint64_t v30 = v28[3];
              *(float *)&unint64_t v31 = v28[4];
              objc_msgSend(v29, "setFrame:", (double)*((int *)v28 + 1), (double)*((int *)v28 + 2), (double)v30, (double)v31);
              [v29 setOpacity:v28[6]];
              [v29 setBlendMode:*((unsigned int *)v28 + 5)];
              [v29 setFixedFrame:*(_DWORD *)v28 & 1];
              CGSize v173 = (CGSize)0;
              memset(v174, 0, 28);
              CGSize v171 = (CGSize)0;
              CGPoint v172 = (CGPoint)0;
              CGPoint v170 = (CGPoint)0;
              __memcpy_chk();
              objc_msgSend(v29, "setReferenceKey:", -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", &v170));
              [*((id *)v5 + 51) addObject:v29];

              p_info = CUINamedExternalLink.info;
              v28 = (float *)((char *)v28 + *((unsigned int *)v28 + 7) + 32);
              ++v27;
            }
            while (v27 < *v23);
            unint64_t v24 = v156;
          }
          break;
        default:
          break;
      }
      v25 = (_DWORD *)((char *)v25 + v25[1] + 8);
    }
    while ((unint64_t)v25 < v24);
    if (!v23)
    {
      uint64_t v32 = p_var0[42];
      if (v32)
      {
        v33 = (_DWORD *)(v24 - v32);
        do
        {
          if (*v33 == 1009)
          {
            *((void *)v5 + 51) = [objc_alloc((Class)NSMutableArray) initWithCapacity:v33[2]];
            if (v33[2])
            {
              unsigned int v34 = 0;
              v35 = (float *)(v33 + 4);
              do
              {
                id v36 = objc_alloc_init((Class)(p_info + 196));
                *(float *)&unint64_t v37 = *v35;
                *(float *)&unint64_t v38 = v35[1];
                *(float *)&unint64_t v39 = v35[2];
                *(float *)&unint64_t v40 = v35[3];
                objc_msgSend(v36, "setFrame:", (double)v37, (double)v38, (double)v39, (double)v40);
                [v36 setOpacity:v35[5]];
                [v36 setBlendMode:*((unsigned int *)v35 + 4)];
                CGSize v173 = (CGSize)0;
                memset(v174, 0, 28);
                CGSize v171 = (CGSize)0;
                CGPoint v172 = (CGPoint)0;
                CGPoint v170 = (CGPoint)0;
                __memcpy_chk();
                objc_msgSend(v36, "setReferenceKey:", -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", &v170));
                [*((id *)v5 + 51) addObject:v36];

                p_info = (__objc2_class_ro **)(CUINamedExternalLink + 32);
                v35 = (float *)((char *)v35 + *((unsigned int *)v35 + 6) + 28);
                ++v34;
              }
              while (v34 < v33[2]);
            }
          }
          v33 = (_DWORD *)((char *)v33 + v33[1] + 8);
        }
        while ((unint64_t)v33 < v156);
      }
    }
    if (!v157) {
      goto LABEL_128;
    }
    double v167 = 0.0;
    double v168 = 0.0;
    double Width = (double)CGImageGetWidth(*((CGImageRef *)v5 + 44));
    double v42 = (double)CGImageGetHeight(*((CGImageRef *)v5 + 44));
    double v167 = Width;
    double v168 = v42;
    NSSize v165 = NSZeroSize;
    NSSize v166 = v165;
    NSSize v163 = v165;
    NSSize v164 = v165;
    unint64_t v162 = 0xBFF0000000000000;
    NSSize v160 = v165;
    NSSize v161 = v165;
    NSSize v158 = v165;
    NSSize v159 = v165;
    if (space)
    {
      _extractMetrics((uint64_t)space, (uint64_t)&v167, &v166.width, &v165.width, &v164.width, (int8x16_t *)&v163, &v162, &v161.width, (int8x16_t *)&v160, &v159.width, (int8x16_t *)&v158);
      double Width = v167;
      double v42 = v168;
    }
    int v43 = p_var0[6];
    if (v43 <= 1195456543)
    {
      if (v43 == 1095911234)
      {
        v71 = (CFStringRef *)&kCGColorSpaceSRGB;
        if ((p_var0[7] & 0xF) <= 3) {
          v71 = (CFStringRef *)qword_1E5A58AA8[p_var0[7] & 0xF];
        }
        v52 = CGColorSpaceCreateWithName(*v71);
        if (v52) {
          goto LABEL_65;
        }
        _CUILog(1, (uint64_t)"Defaulting to sRGB colorspace", v72, v73, v74, v75, v76, v77, v148);
LABEL_62:
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
        goto LABEL_63;
      }
      if (v43 != 1195454774)
      {
LABEL_64:
        v78 = +[NSAssertionHandler currentHandler];
        v79 = (objc_class *)objc_opt_class();
        v80 = NSStringFromClass(v79);
        NSStringFromSelector(a2);
        uint64_t v148 = (uint64_t)v80;
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, @"CUIThemeRendition.m", 3879, @"CoreUI: -[%@ %@] unknown pixel format %d");
        v52 = 0;
        goto LABEL_65;
      }
      CFStringRef v53 = kCGColorSpaceGenericGrayGamma2_2;
      if ((p_var0[7] & 0xF) == 6) {
        CFStringRef v53 = kCGColorSpaceExtendedGray;
      }
      if (*(_DWORD *)(v152 + 8) == 5) {
        CFStringRef v54 = kCGColorSpaceDisplayP3;
      }
      else {
        CFStringRef v54 = v53;
      }
      v52 = CGColorSpaceCreateWithName(v54);
      if (v52) {
        goto LABEL_65;
      }
      _CUILog(1, (uint64_t)"Can't find %@ colorspace Defaulting to Device Gray colorspace", v55, v56, v57, v58, v59, v60, (uint64_t)v54);
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
    }
    else
    {
      switch(v43)
      {
        case 1195456544:
          CFStringRef v62 = kCGColorSpaceGenericGrayGamma2_2;
          break;
        case 1380401717:
          v63 = &kCGColorSpaceSRGB;
          if ((p_var0[7] & 0xF) <= 3) {
            v63 = (const CFStringRef *)qword_1E5A58AA8[p_var0[7] & 0xF];
          }
          CFStringRef v64 = *v63;
          v52 = CGColorSpaceCreateWithName(*v63);
          if (v52) {
            goto LABEL_65;
          }
          _CUILog(1, (uint64_t)"Can't find %@ colorspace Defaulting to sRGB colorspace", v65, v66, v67, v68, v69, v70, (uint64_t)v64);
          CFStringRef v62 = kCGColorSpaceSRGB;
          break;
        case 1380401751:
          v44 = &kCGColorSpaceSRGB;
          if ((p_var0[7] & 0xF) - 3 <= 2) {
            v44 = (const CFStringRef *)qword_1E5A58A90[(p_var0[7] & 0xF) - 3];
          }
          if (*(_DWORD *)(v152 + 8) == 5) {
            v44 = &kCGColorSpaceDisplayP3;
          }
          CFStringRef v45 = *v44;
          v52 = CGColorSpaceCreateWithName(*v44);
          if (v52) {
            goto LABEL_65;
          }
          _CUILog(1, (uint64_t)"Can't find %@ colorspace Defaulting to sRGB colorspace", v46, v47, v48, v49, v50, v51, (uint64_t)v45);
          goto LABEL_62;
        default:
          goto LABEL_64;
      }
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateWithName(v62);
    }
LABEL_63:
    v52 = DeviceRGB;
LABEL_65:
    uint64_t v81 = p_var0[3];
    uint64_t v82 = p_var0[4];
    *((double *)v5 + 52) = (double)v81;
    *((double *)v5 + 53) = (double)v82;
    uint64_t v83 = [(_CUIThemePixelRendition *)v5 newImageFromCSIDataSlice:v81 | (v82 << 32) ofBitmap:v152 usingColorspace:v52];
    *((void *)v5 + 44) = v83;
    if (!v83)
    {
      CGColorSpaceRelease(v52);
      +[CUIRenditionKey renditionKeyWithKeyList:](CUIRenditionKey, "renditionKeyWithKeyList:", [v5 key]);
      CGImageSetProperty();
      unsigned int v132 = p_var0[6];
      if (v132 == 1195454774
        || v132 == 1380401751
        || (*(_DWORD *)[v5 renditionFlags] & 0x3C) == 0x1C
        || (*(_DWORD *)[v5 renditionFlags] & 0x3C) == 0x30)
      {
        return v5;
      }
      v139 = "Unable to create unsliced image from csi bitmap data.";
LABEL_127:
      _CUILog(4, (uint64_t)v139, v133, v134, v135, v136, v137, v138, v148);
LABEL_128:

      return 0;
    }
    spacea = v52;
    CGPoint origin = CGRectZero.origin;
    CGSize size = CGRectZero.size;
    CGPoint v170 = origin;
    CGSize v171 = size;
    CGPoint v172 = origin;
    CGSize v173 = size;
    *(CGPoint *)v174 = origin;
    *(CGSize *)&v174[16] = size;
    CGPoint v175 = origin;
    CGSize v176 = size;
    CGPoint v177 = origin;
    CGSize v178 = size;
    CGPoint v179 = origin;
    CGSize v180 = size;
    CGPoint v181 = origin;
    CGSize v182 = size;
    CGPoint v183 = origin;
    CGSize v184 = size;
    CGPoint v185 = origin;
    CGSize v186 = size;
    CGPoint v187 = origin;
    CGSize v188 = size;
    CGPoint v189 = origin;
    CGSize v190 = size;
    CGPoint v191 = origin;
    CGSize v192 = size;
    CGPoint v193 = origin;
    CGSize v194 = size;
    CGPoint v195 = origin;
    CGSize v196 = size;
    CGPoint v197 = origin;
    CGSize v198 = size;
    CGPoint v199 = origin;
    CGSize v200 = size;
    unint64_t v86 = *v157;
    if (!v86) {
      goto LABEL_83;
    }
    unint64_t v87 = 0;
    v88 = v157 + 4;
    v89 = (double *)&v171;
    while (1)
    {
      unsigned int v91 = *(v88 - 1);
      unsigned int v90 = *v88;
      if (v91) {
        BOOL v92 = v90 == 0;
      }
      else {
        BOOL v92 = 1;
      }
      if (v92)
      {
        *((void *)v5 + v87 + 28) = 0;
        goto LABEL_76;
      }
      LODWORD(origin.x) = *(v88 - 3);
      v203.origin.x = (double)*(unint64_t *)&origin.x;
      v203.origin.y = (double)(v82 - (v90 + *(v88 - 2)));
      v203.size.width = (double)v91;
      v203.size.CGFloat height = (double)v90;
      *(v89 - 2) = v203.origin.x;
      *(v89 - 1) = v203.origin.y;
      double *v89 = (double)v91;
      v89[1] = (double)v90;
      CGImageRef v93 = CGImageCreateWithImageInRect(*((CGImageRef *)v5 + 44), v203);
      *((void *)v5 + v87 + 28) = v93;
      if (!v93) {
        break;
      }
      unint64_t v86 = *v157;
LABEL_76:
      if (v87 <= 0xE)
      {
        v88 += 4;
        ++v87;
        v89 += 4;
        if (v87 < v86) {
          continue;
        }
      }
      goto LABEL_83;
    }
    if (*((void *)v5 + 44) && [v5 type] == (id)3)
    {
      _CUILog(4, (uint64_t)"CoreUI: CUIThemeRendition invalid slicing information assuming its a OnePart image", v94, v95, v96, v97, v98, v99, v148);
      [v5 setType:0];
      [v5 setSubtype:12];
      goto LABEL_83;
    }
    if ([v5 type])
    {
      CGColorSpaceRelease(spacea);
      uint64_t v146 = *((void *)v5 + 44);
      [v5 type];
      uint64_t v148 = v146;
      v139 = "Unable to create sliced image from csi bitmap data %@ type is %d slices count %d rect is {%d,%d}.";
      goto LABEL_127;
    }
LABEL_83:
    CGColorSpaceRelease(spacea);
    if ([v5 type] == (id)3)
    {
      double v100 = (double)CGImageGetWidth(*((CGImageRef *)v5 + 28));
      double v101 = (double)CGImageGetWidth(*((CGImageRef *)v5 + 30));
      double v102 = (double)CGImageGetHeight(*((CGImageRef *)v5 + 28));
      double v103 = (double)CGImageGetHeight(*((CGImageRef *)v5 + 34));
      [v5 scale];
      double Width = v100 + v101 + v104;
      [v5 scale];
      double v42 = v105 + v102 + v103;
      v4 = (const _csiheader *)p_var0;
    }
    else
    {
      if ([v5 type] == (id)2)
      {
        double v106 = (double)CGImageGetHeight(*((CGImageRef *)v5 + 28));
        double v107 = v106 + (double)CGImageGetHeight(*((CGImageRef *)v5 + 30));
        [v5 scale];
        double v42 = v108 + v107;
      }
      else if ([v5 type] == (id)1)
      {
        double v109 = (double)CGImageGetWidth(*((CGImageRef *)v5 + 28));
        double v110 = v109 + (double)CGImageGetWidth(*((CGImageRef *)v5 + 30));
        [v5 scale];
        double Width = v111 + v110;
      }
      v4 = (const _csiheader *)p_var0;
    }
    v201.width = NSZeroSize.width;
    v201.CGFloat height = height;
    v202.width = Width;
    v202.CGFloat height = v42;
    uint64_t v8 = v156;
    if (!NSEqualSizes(v201, v202))
    {
      v112 = [CUIRenditionMetrics alloc];
      uint64_t v113 = v162;
      __int16 v114 = [v5 type] == (id)2 || objc_msgSend(v5, "type") == (id)3;
      int v115 = [v5 type] == (id)1 || objc_msgSend(v5, "type") == (id)3;
      [v5 scale];
      *((void *)v5 + 45) = -[CUIRenditionMetrics initWithImageSize:defaultImageSize:edgeBottomLeft:edgeTopRight:contentBottomLeft:contentTopRight:baseline:auxiliary1BottomLeft:auxiliary1TopRight:auxiliary2BottomLeft:auxiliary2TopRight:scalesVertically:scalesHorizontally:scale:](v112, v114, v115, Width, v42, v167, v168, v166.width, v166.height, v165.width, v165.height, v116, v117, v118, v119, v120, *(uint64_t *)&v164.width, *(uint64_t *)&v164.height, *(uint64_t *)&v163.width,
                               *(uint64_t *)&v163.height,
                               v113,
                               *(uint64_t *)&v161.width,
                               *(uint64_t *)&v161.height,
                               *(uint64_t *)&v160.width,
                               *(uint64_t *)&v160.height,
                               *(uint64_t *)&v159.width,
                               *(uint64_t *)&v159.height,
                               *(uint64_t *)&v158.width,
                               *(uint64_t *)&v158.height,
                               v121);
      v4 = (const _csiheader *)p_var0;
    }
    id v122 = [v5 type];
    uint64_t v123 = 64;
    if (v122 == (id)3) {
      uint64_t v123 = 256;
    }
    double v125 = v171.height;
    double v124 = v171.width;
    v126 = (double *)((char *)&v170.x + v123);
    double v127 = v126[2];
    double v128 = v126[3];
    if ([v5 type] == (id)3)
    {
      double v129 = v176.width;
      if (v176.width <= v182.width) {
        double v129 = v182.width;
      }
      if (v124 == 0.0) {
        double v124 = v129;
      }
      double v130 = v173.height;
      if (v173.height <= *(double *)&v174[24]) {
        double v130 = *(double *)&v174[24];
      }
      if (v125 == 0.0) {
        double v125 = v130;
      }
      if (*(double *)&v174[16] <= v180.width) {
        double v131 = v180.width;
      }
      else {
        double v131 = *(double *)&v174[16];
      }
      if (v127 == 0.0) {
        double v127 = v131;
      }
      if (v128 == 0.0)
      {
        if (v182.height <= v184.height) {
          double v128 = v184.height;
        }
        else {
          double v128 = v182.height;
        }
      }
    }
    char v10 = 0;
    *((void *)v5 + 46) = -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:]([CUIRenditionSliceInformation alloc], "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", [v5 type], 0.0, 0.0, Width, v42, v124, v125, v127, v128);
    uint64_t v7 = 1;
    p_info = (__objc2_class_ro **)(CUINamedExternalLink + 32);
  }
  while (v4->var11.var0 > 1);
  return v5;
}

- (uint64_t)newImageFromCSIDataSlice:(unint64_t)a3 ofBitmap:(uint64_t)a4 usingColorspace:(CGColorSpace *)a5
{
  if (!a1) {
    return 0;
  }
  char v10 = objc_msgSend(objc_msgSend(a1, "srcData"), "bytes");
  uint64_t v17 = v10;
  int v19 = v10[3];
  int v18 = v10[4];
  int v76 = 4;
  LODWORD(bitsPerComponent) = 8;
  size_t v20 = HIDWORD(a3);
  int v75 = 1;
  int v21 = v10[6];
  CGColorSpaceRef space = a5;
  if (v21 <= 1195456543)
  {
    if (v21 == 1095911234)
    {
LABEL_11:
      unsigned int v24 = 4;
      int v76 = 4;
      LODWORD(bitsPerComponent) = 8;
      if ((*(unsigned char *)(a4 + 4) & 2) != 0) {
        int v25 = 8198;
      }
      else {
        int v25 = 8194;
      }
      if (!HIDWORD(a3)) {
        goto LABEL_41;
      }
      goto LABEL_33;
    }
    int v22 = 1195454774;
  }
  else
  {
    if (v21 == 1195456544)
    {
      unsigned int v24 = 2;
      int v76 = 2;
      LODWORD(bitsPerComponent) = 8;
      int v25 = 12291;
      if (!HIDWORD(a3)) {
        goto LABEL_41;
      }
      goto LABEL_33;
    }
    if (v21 == 1380401717)
    {
      LODWORD(bitsPerComponent) = 5;
      int v75 = 0;
      int v25 = 4102;
      unsigned int v24 = 2;
      if (!HIDWORD(a3)) {
        goto LABEL_41;
      }
      goto LABEL_33;
    }
    int v22 = 1380401751;
  }
  if (v21 != v22) {
    goto LABEL_31;
  }
  unsigned int v23 = *(_DWORD *)(a4 + 8);
  if (v23 <= 0xC && ((1 << v23) & 0x10A0) != 0) {
    goto LABEL_11;
  }
  if (v21 > 1380401716)
  {
    if (v21 == 1380401751)
    {
      int v76 = 4;
      LODWORD(bitsPerComponent) = 16;
      int v75 = 2;
      if ((*(unsigned char *)(a4 + 4) & 2) != 0) {
        int v25 = 4101;
      }
      else {
        int v25 = 4097;
      }
      if ((v10[7] & 0xE) == 4)
      {
        v25 |= 0x100u;
        int v75 = 5;
      }
      unsigned int v24 = 8;
      if (!HIDWORD(a3)) {
        goto LABEL_41;
      }
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  if (v21 != 1195454774)
  {
LABEL_31:
    bitmapInfoa = +[NSAssertionHandler currentHandler];
    unsigned int v26 = (objc_class *)objc_opt_class();
    unint64_t v27 = a3;
    uint64_t v28 = a4;
    uint64_t v29 = a2;
    size_t v30 = v20;
    int v31 = v18;
    int v32 = v19;
    v33 = NSStringFromClass(v26);
    NSStringFromSelector(sel_newImageFromCSIDataSlice_ofBitmap_usingColorspace_);
    decode = (CGFloat *)v33;
    int v19 = v32;
    int v18 = v31;
    size_t v20 = v30;
    a2 = v29;
    a4 = v28;
    a3 = v27;
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](bitmapInfoa, "handleFailureInMethod:object:file:lineNumber:description:", sel_newImageFromCSIDataSlice_ofBitmap_usingColorspace_, a1, @"CUIThemeRendition.m", 3452, @"CoreUI: -[%@ %@] unknown pixel format %d");
    int v25 = 0;
    goto LABEL_32;
  }
  int v76 = 2;
  LODWORD(bitsPerComponent) = 16;
  int v75 = 2;
  if ((*(unsigned char *)(a4 + 4) & 2) != 0) {
    int v25 = 4101;
  }
  else {
    int v25 = 4097;
  }
  if ((v10[7] & 0xF) == 6)
  {
    v25 |= 0x100u;
    int v75 = 5;
  }
LABEL_32:
  unsigned int v24 = 4;
  if (!v20)
  {
LABEL_41:
    _CUILog(4, (uint64_t)"CoreUI: degenerate slice geometry", v11, v12, v13, v14, v15, v16, (uint64_t)decode);
    return 0;
  }
LABEL_33:
  if (!a3) {
    goto LABEL_41;
  }
  CGBitmapInfo bitmapInfo = v25;
  int v34 = v19;
  int v35 = *(_DWORD *)(a4 + 8);
  id v36 = (unsigned int *)[a1 renditionFlags];
  *id v36 = *v36 & 0xFFFFFFC3 | (4 * (v35 & 0xF));
  unsigned int v43 = *(_DWORD *)(a4 + 8);
  if (v43 > 0xC)
  {
    _CUILog(4, (uint64_t)"-[CUIThemeRendition newImageFromCSIDataSlice:ofBitmap: usingColorspace:] Unsupported pixel format in CSI got %d", v37, v38, v39, v40, v41, v42, *(unsigned int *)(a4 + 8));
    CFStringRef v54 = 0;
    goto LABEL_54;
  }
  unsigned int v44 = v18 - (HIDWORD(a2) + v20);
  int v45 = 1 << v43;
  if ((v45 & 0xF7E) != 0) {
    goto LABEL_36;
  }
  if ((v45 & 0x1080) != 0)
  {
    CUIUpdateImageProviderForATECompressedData(v17[6], &bitsPerComponent, &v76, &v75, v39, v40, v41, v42);
    unsigned int v24 = (v76 * bitsPerComponent) >> 3;
LABEL_36:
    uint64_t v46 = objc_alloc_init(CSIHelper);
    *(void *)&v46->slice.x = a2;
    *(void *)&v46->slice.width = a3;
    v46->slice.y = v44;
    v46->csiData = (NSData *)[a1 srcData];
    v46->bmp = (_csibitmap *)a4;
    v46->renditionLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v46->rendition, a1);
    v46->blockDataCacheKeyRGBX = 0;
    v46->blockDataCacheKeyGray = 0;
    v46->blockDataCacheKeyBGRX = 0;
    objc_storeWeak((id *)&v46->sharedBlockDataBGRX, 0);
    objc_storeWeak((id *)&v46->sharedBlockDataRGBX, 0);
    objc_storeWeak((id *)&v46->sharedBlockDataGray, 0);
    v46->sourceRowbytes = (unint64_t)[a1 sourceRowbytes];
    *((unsigned char *)v46 + 120) = *((unsigned char *)v46 + 120) & 0xFE | (*(_DWORD *)(a4 + 8) != 1);
    if (v75)
    {
      if (__providerOptionsOnce != -1) {
        dispatch_once(&__providerOptionsOnce, &__block_literal_global_419);
      }
      if (CGImageProviderCreate())
      {
        uint64_t ImageAtIndex = CGImageCreateWithImageProvider();
        CFStringRef v54 = 0;
        goto LABEL_55;
      }
      _CUILog(4, (uint64_t)"CoreUI: failed to create image provider for %d %d componentType %d colorSpace %@ options %@", v47, v48, v49, v50, v51, v52, a3);
      CFStringRef v54 = 0;
      goto LABEL_54;
    }
    size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    *((unsigned char *)v46 + 120) |= 2u;
    Direct = CGDataProviderCreateDirect(v46, AlignedBytesPerRow * v20, &csiCompressDataProviderCallbacks);
    goto LABEL_44;
  }
  uint64_t v68 = a4 + v24 * (a2 + v34 * v44) + 16;
  if ([a1 sourceRowbytes])
  {
    id v69 = [a1 sourceRowbytes];
LABEL_67:
    size_t AlignedBytesPerRow = (size_t)v69;
    goto LABEL_68;
  }
  size_t AlignedBytesPerRow = v24 * v34;
  if (v17[6] == 1195456544)
  {
    id v69 = (id)CGBitmapGetAlignedBytesPerRow();
    goto LABEL_67;
  }
LABEL_68:
  id v70 = [objc_alloc((Class)NSData) initWithBytes:v68 length:AlignedBytesPerRow * v20];
  __CFSetLastAllocationEventName();
  Direct = CGDataProviderCreateWithData(v70, [v70 bytes], (size_t)objc_msgSend(v70, "length"), (CGDataProviderReleaseDataCallback)__releaseData);
LABEL_44:
  CFStringRef v54 = Direct;
  if (Direct)
  {
    int v57 = *(_DWORD *)(a4 + 8);
    if (v57 != 12 && v57 != 7)
    {
      uint64_t ImageAtIndex = (uint64_t)CGImageCreate(a3, v20, bitsPerComponent, 8 * v24, AlignedBytesPerRow, space, bitmapInfo, Direct, 0, 1, kCGRenderingIntentDefault);
      goto LABEL_55;
    }
    uint64_t v58 = CGImageSourceCreateWithDataProvider(Direct, 0);
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t ImageAtIndex = (uint64_t)CGImageSourceCreateImageAtIndex(v58, 0, 0);
      CFRelease(v59);
      goto LABEL_55;
    }
  }
LABEL_54:
  uint64_t ImageAtIndex = 0;
LABEL_55:
  CGDataProviderRelease(v54);
  CGImageProviderRelease();
  if (!ImageAtIndex)
  {
    uint64_t v60 = CUIConvertCompressionTypeToString(*(_DWORD *)(a4 + 8));
    _CUILog(4, (uint64_t)"CoreUI: failed to create an image because of a bad pixel format or failure to create an appropriate image provider for encoding '%s'", v61, v62, v63, v64, v65, v66, (uint64_t)v60);
  }
  return ImageAtIndex;
}

- (unint64_t)sourceRowbytes
{
  return self->_sourceRowbytes;
}

- (id)copySharedBlockDataWithPixelFormat:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(id *)((char *)&self->super.super.isa + *off_1E5A58AC8[a3]);
  }
}

- (void)setSharedBlockData:(id)a3
{
  if (!a3) {
    goto LABEL_5;
  }
  int v4 = *((_DWORD *)a3 + 3);
  switch(v4)
  {
    case 2:
      cachedBlockDataGray = self->_cachedBlockDataGray;
      if (cachedBlockDataGray == a3) {
        return;
      }
      self->_cachedBlockDataGray = (_CSIRenditionBlockData *)a3;
      int v4 = 2;
      break;
    case 1:
      cachedBlockDataGray = self->_cachedBlockDataRGBX;
      if (cachedBlockDataGray == a3) {
        return;
      }
      self->_cachedBlockDataRGBX = (_CSIRenditionBlockData *)a3;
      int v4 = 1;
      break;
    case 0:
LABEL_5:
      cachedBlockDataGray = self->_cachedBlockDataBGRX;
      if (cachedBlockDataGray == a3) {
        return;
      }
      int v4 = 0;
      self->_cachedBlockDataBGRX = (_CSIRenditionBlockData *)a3;
      break;
    default:
      cachedBlockDataGray = 0;
      break;
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __46___CUIThemePixelRendition_setSharedBlockData___block_invoke;
  v6[3] = &unk_1E5A58A70;
  int v7 = v4;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (int)pixelFormat
{
  return *((_DWORD *)[(NSData *)[(CUIThemeRendition *)self srcData] bytes] + 6);
}

- (CGSize)unslicedSize
{
  [(CUIThemeRendition *)self originalUncroppedSize];
  if (width == 0.0 || height == 0.0)
  {
    double width = self->_unslicedSize.width;
    double height = self->_unslicedSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  if (a3 < 0 || self->_nimages <= a3)
  {
    _CUILog(4, (uint64_t)"Invalid slice index %ld for rendition", a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  else
  {
    uint64_t v8 = self->_image[a3];
    return +[CUIImage imageWithCGImage:v8];
  }
}

- (id)maskForSliceIndex:(int64_t)a3
{
  if (a3 < 0 || self->_nimages <= a3)
  {
    _CUILog(4, (uint64_t)"Invalid slice index %ld for rendition", a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  else
  {
    uint64_t v8 = self->_image[a3];
    *(_OWORD *)decode = xmmword_1A139EA00;
    size_t Width = CGImageGetWidth(v8);
    size_t Height = CGImageGetHeight(v8);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v8);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(v8);
    size_t BytesPerRow = CGImageGetBytesPerRow(v8);
    DataProvider = CGImageGetDataProvider(v8);
    BOOL ShouldInterpolate = CGImageGetShouldInterpolate(v8);
    uint64_t v16 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, decode, ShouldInterpolate);
    uint64_t v17 = +[CUIImage imageWithCGImage:v16];
    CGImageRelease(v16);
  }
  return v17;
}

- (id)layerReferences
{
  return self->_layers;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

- (BOOL)isTiled
{
  if ((id)[(CUIThemeRendition *)self type] == (id)3
    || ![(CUIThemeRendition *)self type]
    || (id)[(CUIThemeRendition *)self type] == (id)5
    || (id)[(CUIThemeRendition *)self type] == (id)8)
  {
    return [(CUIThemeRendition *)self subtype] == 30 || [(CUIThemeRendition *)self subtype] == 11;
  }
  id v4 = [(CUIThemeRendition *)self name];
  _CUILog(1, (uint64_t)"WARNING: -isTiled called on rendition named: %@, which is not a one-part or nine-part image, but the method is only meaningful for one-part and nine-part images. Returning NO.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  return 0;
}

- (BOOL)isScaled
{
  return [(CUIThemeRendition *)self subtype] == 31
      || [(CUIThemeRendition *)self subtype] == 12
      || (id)[(CUIThemeRendition *)self type] == (id)2
      || (id)[(CUIThemeRendition *)self type] == (id)1;
}

- (BOOL)edgesOnly
{
  return [(CUIThemeRendition *)self subtype] == 34
      && CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIThemeRendition *)self key], 11) != 2;
}

@end