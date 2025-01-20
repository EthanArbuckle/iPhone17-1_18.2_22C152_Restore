@interface CPArchive
- (CPArchive)init;
- (id)html;
- (id)plainText;
- (id)webArchiveData;
- (void)addSelection:(CGPDFSelection *)a3;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
@end

@implementation CPArchive

- (id)webArchiveData
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  if (self->webArchiveData) {
    return self->webArchiveData;
  }
  [(CPArchive *)self html];
  id result = self->htmlString;
  if (result)
  {
    id result = (id)[result dataUsingEncoding:4 allowLossyConversion:1];
    if (result)
    {
      id v4 = result;
      id result = (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:@"/"];
      if (result)
      {
        id v5 = result;
        id v6 = (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WebKit"];
        if (v6
          || (id result = (id)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/WebKit.framework"], (v6 = result) != 0))
        {
          id result = (id)[v6 classNamed:@"WebResource"];
          if (result)
          {
            v7 = (objc_class *)result;
            id result = (id)[v6 classNamed:@"WebArchive"];
            if (result)
            {
              v8 = (objc_class *)result;
              uint64_t v9 = [[v7 alloc] initWithData:v4 URL:v5 MIMEType:@"text/html" textEncodingName:@"utf-8" frameName:0];
              if (!v9) {
                return self->webArchiveData;
              }
              v10 = (void *)v9;
              unsigned int Count = CFArrayGetCount(self->imageNodes);
              uint64_t v12 = Count;
              v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
              unsigned int v91 = Count;
              if (!Count) {
                goto LABEL_129;
              }
              CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
              theString = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
              size_t v14 = 8 * Count;
              v15 = (const void **)malloc_type_malloc(v14, 0x2004093837F09uLL);
              v105.location = 0;
              v105.length = Count;
              CFArrayGetValues(self->imageNodes, v105, v15);
              uint64_t v16 = 0;
              v17 = 0;
              int v18 = 0;
              do
              {
                for (i = v15[v16]; i; i = (void *)i[1])
                {
                  if (*(_DWORD *)i == 517) {
                    break;
                  }
                }
                if (i == v17)
                {
                  i = v17;
                }
                else
                {
                  if (v17) {
                    CGPDFNodeLoadPaths((_DWORD **)&v15[v18], v16 - v18);
                  }
                  int v18 = v16;
                }
                ++v16;
                v17 = i;
              }
              while (v16 != v12);
              v93 = v13;
              v94 = v7;
              v89 = v8;
              v90 = v10;
              CGPDFNodeLoadPaths((_DWORD **)&v15[v18], v91 - v18);
              unint64_t v20 = 0;
              while (1)
              {
                uint64_t v21 = (uint64_t)v15[v20 / 8];
                if (v21)
                {
                  int v22 = *(_DWORD *)v21;
                  if (*(_DWORD *)v21 == 513 || v22 == 258)
                  {
                    Image = (unint64_t *)CGPDFNodeCreateImage((uint64_t)v15[v20 / 8]);
                    goto LABEL_91;
                  }
                  if (v22 == 257) {
                    break;
                  }
                }
LABEL_114:
                v20 += 8;
                if (v14 == v20)
                {
                  CGPDFNodePurgePaths((uint64_t *)v15, v91);
                  free(v15);
                  CFRelease(theString);
                  v8 = v89;
                  v10 = v90;
                  v13 = v93;
LABEL_129:
                  v87 = (void *)[[v8 alloc] initWithMainResource:v10 subresources:v13 subframeArchives:0];
                  if (v87)
                  {
                    v88 = v87;
                    self->webArchiveData = (NSData *)(id)[v87 data];
                  }
                  return self->webArchiveData;
                }
              }
              v23 = *(CGPDFStream **)(v21 + 120);
              v24 = CPPDFCreateMaskingImageFromStream(v23);
              v25 = 0;
              double valuePtr = 0.0;
              if (!v24) {
                v25 = (CGFloat *)CPPDFCreateMaskingColorsFromStream((uint64_t)v23, &valuePtr);
              }
              CFDataRef v100 = 0;
              double PageRotation = CGPDFNodeGetPageRotation(v21);
              double x = *(double *)(v21 + 64);
              double width = *(double *)(v21 + 80);
              double y = *(double *)(v21 + 72);
              double height = *(double *)(v21 + 88);
              double v29 = *(double *)(v21 + 136);
              double v30 = *(double *)(v21 + 144);
              double v31 = *(double *)(v21 + 152);
              double v32 = *(double *)(v21 + 160);
              *(_OWORD *)values = *(_OWORD *)(v21 + 168);
              double v33 = v29 * v32 - v30 * v31;
              if (v24) {
                BOOL v34 = 0;
              }
              else {
                BOOL v34 = v25 == 0;
              }
              if (v34
                && PageRotation == 0.0
                && ((double v35 = fabs(v30), v36 = fabs(v31), v33 > 0.0) ? (v37 = v35 > 1.0) : (v37 = 1),
                    !v37 ? (BOOL v38 = v36 > 1.0) : (BOOL v38 = 1),
                    !v38))
              {
                double v39 = vabdd_f64(v32, height);
                BOOL v40 = vabdd_f64(v29, width) > 1.0 || v39 > 1.0;
                if (!v40
                  && *(double *)(v21 + 184) == 1.0
                  && !*(void *)(v21 + 192)
                  && CGPDFNodeHasRectClips(v21))
                {
                  Image = *(unint64_t **)(v21 + 128);
                  if (Image)
                  {
                    CFRetain(*(CFTypeRef *)(v21 + 128));
LABEL_91:
                    CFDataRef v70 = 0;
                    goto LABEL_92;
                  }
                  if (!v23)
                  {
                    Image = 0;
                    goto LABEL_91;
                  }
                  LODWORD(transform.a) = 0;
                  CFDataRef v70 = CGPDFStreamCopyData(v23, (CGPDFDataFormat *)&transform);
                  if (!v70) {
                    goto LABEL_126;
                  }
                  if (LODWORD(transform.a))
                  {
                    if (LODWORD(transform.a) == 2)
                    {
                      CFStringReplaceAll(theString, @"image/jp2");
                      goto LABEL_126;
                    }
                    if (LODWORD(transform.a) == 1)
                    {
                      CFStringReplaceAll(theString, @"image/jpeg");
                      if (CPPDFCreateJPEGImageFromImageStream((uint64_t)v23, v70, 0, &v100))
                      {
                        CFRelease(v70);
                        Image = 0;
                        CFDataRef v70 = v100;
                        goto LABEL_92;
                      }
LABEL_126:
                      Image = 0;
LABEL_92:
                      if (!Image) {
                        goto LABEL_107;
                      }
                      CFMutableDataRef Mutable = CFDataCreateMutable(allocator, 0);
                      if (Mutable)
                      {
                        CFMutableDataRef v72 = Mutable;
                        if (CGPDFNodeCreateImageData_predicate != -1) {
                          dispatch_once(&CGPDFNodeCreateImageData_predicate, &__block_literal_global_22554);
                        }
                        uint64_t ImageData_f = CGPDFNodeCreateImageData_f(v72, @"public.png", 1, 0);
                        if (ImageData_f)
                        {
                          v74 = (const void *)ImageData_f;
                          double v75 = *(double *)(v21 + 80) * *(double *)(v21 + 88);
                          double v76 = (double)Image[5] * (double)Image[6];
                          double v77 = v75 * 256.0;
                          double v78 = v76 / v75;
                          if (v76 >= v77) {
                            double v78 = 256.0;
                          }
                          double valuePtr = sqrt(v78) * 72.0;
                          CFNumberRef v79 = CFNumberCreate(allocator, kCFNumberCGFloatType, &valuePtr);
                          *(_OWORD *)&transform.a = xmmword_1E52CE9A8;
                          values[0] = v79;
                          values[1] = v79;
                          CFDictionaryRef v80 = CFDictionaryCreate(allocator, (const void **)&transform, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                          CFRelease(v79);
                          if (CGPDFNodeCreateImageData_predicate_38 != -1) {
                            dispatch_once(&CGPDFNodeCreateImageData_predicate_38, &__block_literal_global_41_22556);
                          }
                          CGPDFNodeCreateImageData_f_37(v74, Image, v80);
                          CFRelease(v80);
                          if (CGPDFNodeCreateImageData_predicate_44 != -1) {
                            dispatch_once(&CGPDFNodeCreateImageData_predicate_44, &__block_literal_global_47_22557);
                          }
                          CGPDFNodeCreateImageData_f_43(v74);
                          CFRelease(v74);
                          CFStringReplaceAll(theString, @"image/png");
                          goto LABEL_106;
                        }
                        CFRelease(v72);
                      }
                      CFMutableDataRef v72 = v70;
LABEL_106:
                      CFRelease(Image);
                      CFDataRef v70 = v72;
LABEL_107:
                      if (v70)
                      {
                        CFStringRef ImageName = CGPDFNodeCreateImageName(v21);
                        if (ImageName)
                        {
                          CFStringRef v82 = ImageName;
                          v83 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:CFStringGetLength(ImageName) + 1];
                          [v83 appendString:@"/"];
                          [v83 appendString:v82];
                          uint64_t v84 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v83];
                          if (v84)
                          {
                            uint64_t v85 = [[v94 alloc] initWithData:v70 URL:v84 MIMEType:theString textEncodingName:0 frameName:0];
                            if (v85)
                            {
                              v86 = (void *)v85;
                              [v93 addObject:v85];
                            }
                          }

                          CFRelease(v82);
                        }
                        CFRelease(v70);
                      }
                      goto LABEL_114;
                    }
                    Image = 0;
                  }
                  else
                  {
                    Image = (unint64_t *)CPPDFCreateImageFromRawData((uint64_t)v23, v70, 0, 0);
                  }
                  CFRelease(v70);
                  goto LABEL_91;
                }
                Image = (unint64_t *)CGPDFNodeCreateImage(v21);
              }
              else
              {
                v42 = CGPDFNodeCreateImage(v21);
                Image = (unint64_t *)v42;
                if (v25)
                {
                  if (v42)
                  {
                    CGColorSpaceRef ColorSpace = CGImageGetColorSpace(v42);
                    uint64_t v44 = ColorSpace ? *(void *)(*((void *)ColorSpace + 3) + 48) : 0;
                    if (v44 == *(void *)&valuePtr)
                    {
                      CGImageRef v45 = CGImageCreateWithMaskingColors((CGImageRef)Image, v25);
                      CFRelease(Image);
                      Image = (unint64_t *)v45;
                    }
                  }
                  free(v25);
                }
                if (v24)
                {
                  if (Image)
                  {
                    CGImageRef v46 = CPImageCreateWithMask((CGImage *)Image, (uint64_t)v24);
                    CFRelease(Image);
                    Image = (unint64_t *)v46;
                  }
                  CFRelease(v24);
                }
              }
              if (Image)
              {
                double v47 = fabs(v33);
                double v48 = (double)Image[5] * (double)Image[6];
                double v49 = v47 * 256.0;
                double v50 = v48 / v47;
                if (v48 >= v49) {
                  double v51 = 256.0;
                }
                else {
                  double v51 = v50;
                }
                if (PageRotation != 0.0)
                {
                  __double2 v52 = __sincos_stret(PageRotation);
                  v99.a = v52.__cosval;
                  v99.b = v52.__sinval;
                  v99.c = -v52.__sinval;
                  v99.d = v52.__cosval;
                  v99.tdouble x = 0.0;
                  v99.tdouble y = 0.0;
                  v106.origin.double x = x;
                  v106.origin.double y = y;
                  v106.size.double width = width;
                  v106.size.double height = height;
                  CGRect v107 = CGRectApplyAffineTransform(v106, &v99);
                  double x = v107.origin.x;
                  double y = v107.origin.y;
                  double width = v107.size.width;
                  double height = v107.size.height;
                }
                double v53 = sqrt(v51);
                size_t v54 = vcvtpd_u64_f64(v53 * width);
                double v92 = v53;
                size_t v55 = vcvtpd_u64_f64(v53 * height);
                CGColorSpaceRef v56 = CGImageGetColorSpace((CGImageRef)Image);
                if (v56 && ((uint64_t v57 = *((void *)v56 + 3), *(unsigned char *)(v57 + 13)) || *(unsigned char *)(v57 + 14)))
                {
                  v58 = CGColorSpaceCreateWithName(@"kCGColorSpaceExtendedSRGB");
                  v59 = CGBitmapContextCreateWithData(0, v54, v55, 0x10uLL, 0, v58, 0x1101u, 0, 0);
                }
                else
                {
                  v58 = CGColorSpaceCreateWithName(@"kCGColorSpaceSRGB");
                  v59 = CGBitmapContextCreateWithData(0, v54, v55, 8uLL, 4 * v54, v58, 1u, 0, 0);
                }
                uint64_t v60 = (uint64_t)v59;
                if (v59)
                {
                  v108.size.double width = (double)v54;
                  v108.size.double height = (double)v55;
                  v108.origin.double x = 0.0;
                  v108.origin.double y = 0.0;
                  CGContextClearRect(v59, v108);
                  if (*(_DWORD *)(v60 + 16) == 1129601108)
                  {
                    uint64_t v67 = *(void *)(v60 + 96);
                    float64x2_t v68 = vmulq_n_f64(*(float64x2_t *)(v67 + 40), v92);
                    *(float64x2_t *)(v67 + 24) = vmulq_n_f64(*(float64x2_t *)(v67 + 24), v92);
                    *(float64x2_t *)(v67 + 40) = v68;
                  }
                  else
                  {
                    handle_invalid_context((char)"CGContextScaleCTM", v60, v61, v62, v63, v64, v65, v66);
                  }
                  if (*(_DWORD *)(v60 + 16) == 1129601108) {
                    *(float64x2_t *)(*(void *)(v60 + 96) + 56) = vmlsq_lane_f64(vmlsq_lane_f64(*(float64x2_t *)(*(void *)(v60 + 96) + 56), *(float64x2_t *)(*(void *)(v60 + 96) + 24), x, 0), *(float64x2_t *)(*(void *)(v60 + 96) + 40), y, 0);
                  }
                  else {
                    handle_invalid_context((char)"CGContextTranslateCTM", v60, v61, v62, v63, v64, v65, v66);
                  }
                  if (PageRotation != 0.0) {
                    CGContextRotateCTM((CGContextRef)v60, PageRotation);
                  }
                  CGPDFNodeApplyClipToContext(v21, (CGContextRef)v60);
                  transform.a = v29;
                  transform.b = v30;
                  transform.c = v31;
                  transform.d = v32;
                  *(_OWORD *)&transform.tdouble x = *(_OWORD *)values;
                  CGContextConcatCTM((CGContextRef)v60, &transform);
                  CGContextSetAlpha((CGContextRef)v60, *(CGFloat *)(v21 + 184));
                  v69 = *(CGColor **)(v21 + 192);
                  if (v69) {
                    CGContextSetFillColorWithColor((CGContextRef)v60, v69);
                  }
                  v109.origin.double x = 0.0;
                  v109.origin.double y = 0.0;
                  v109.size.double width = 1.0;
                  v109.size.double height = 1.0;
                  CGContextDrawImage((CGContextRef)v60, v109, (CGImageRef)Image);
                  CFRelease(Image);
                  Image = (unint64_t *)CGBitmapContextCreateImage((CGContextRef)v60);
                  CFRelease((CFTypeRef)v60);
                }
                CGColorSpaceRelease(v58);
              }
              goto LABEL_91;
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)html
{
  if (!self->htmlString)
  {
    self->htmlString = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    self->imageNodes = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    unsigned int Count = CFArrayGetCount(self->selections);
    uint64_t v4 = Count;
    if (Count)
    {
      CFIndex v5 = 0;
      uint64_t v44 = Count;
      while (1)
      {
        ValueAtIndedouble x = CFArrayGetValueAtIndex(self->selections, v5);
        uint64_t v7 = (uint64_t)ValueAtIndex;
        htmlString = self->htmlString;
        imageNodes = self->imageNodes;
        if (ValueAtIndex && (uint64_t v10 = ValueAtIndex[21]) != 0)
        {
          CFTypeRef v11 = CGPDFPageCopyLayout(v10);
          uint64_t v12 = (CGPDFString *)CFAutorelease(v11);
          if (!v5) {
            goto LABEL_9;
          }
        }
        else
        {
          uint64_t v12 = 0;
          if (!v5)
          {
LABEL_9:
            value[0] = 0;
            if (v12
              && ((v13 = *((void *)v12 + 2)) == 0 ? (size_t v14 = 0) : (size_t v14 = *(CGPDFDocument **)(v13 + 16)),
                  Info = CGPDFDocumentGetInfo(v14),
                  CGPDFDictionaryGetString(Info, "Title", value)))
            {
              CFStringRef Mutable = CGPDFStringCopyTextString(value[0]);
            }
            else
            {
              CFStringRef Mutable = CFStringCreateMutable(alloc, 0);
            }
            v17 = (__CFString *)Mutable;
            v46[0] = 0;
            CFStringAppend((CFMutableStringRef)htmlString, @"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">");
            startIndent((__CFString *)htmlString, v46);
            startTagWithAttributes((__CFString *)htmlString, @"html", 0, v18, v19, v20, v21, v22, @"xmlns", @"http://www.w3.org/1999/xhtml");
            startIndent((__CFString *)htmlString, v46);
            startTag((__CFString *)htmlString, @"head", 0);
            startIndent((__CFString *)htmlString, v46);
            startTagWithAttributes((__CFString *)htmlString, @"meta", 1, v23, v24, v25, v26, v27, @"http-equiv", @"Content-Type");
            --v46[0];
            startIndent((__CFString *)htmlString, v46);
            startTag((__CFString *)htmlString, @"title", 0);
            if (v17)
            {
              CFStringRef v28 = CGPDFCopyStringEscapingElementMarkup(v17);
              if (v28)
              {
                CFStringRef v29 = v28;
                CFStringAppend((CFMutableStringRef)htmlString, v28);
                CFRelease(v29);
              }
              CFStringAppendFormat((CFMutableStringRef)htmlString, 0, @"</%@>", @"title");
              --v46[0];
              endIndent((__CFString *)htmlString, v46);
              CFStringAppendFormat((CFMutableStringRef)htmlString, 0, @"</%@>", @"head");
              startIndent((__CFString *)htmlString, v46);
              startTag((__CFString *)htmlString, @"body", 0);
              CFRelease(v17);
            }
            else
            {
              CFStringAppendFormat((CFMutableStringRef)htmlString, 0, @"</%@>", @"title");
              --v46[0];
              endIndent((__CFString *)htmlString, v46);
              CFStringAppendFormat((CFMutableStringRef)htmlString, 0, @"</%@>", @"head");
              startIndent((__CFString *)htmlString, v46);
              startTag((__CFString *)htmlString, @"body", 0);
            }
            uint64_t v4 = v44;
          }
        }
        ++v5;
        if (v12)
        {
          double v30 = (CGPDFString *)*((void *)v12 + 13);
          for (i = (CGPDFString *)CGPDFSelectionGetContainingNode(v7); i; i = (CGPDFString *)*((void *)i + 1))
          {
            if (*(_DWORD *)i == 1538) {
              break;
            }
          }
          if (v7)
          {
            uint64_t v32 = *(void *)(v7 + 24);
            if (v32)
            {
              if (*(unsigned char *)(v32 + 40)) {
                CPIndexSetNormalize(v32);
              }
              if (*(uint64_t *)(v32 + 16) >= 1)
              {
                if (!i) {
                  i = v30;
                }
                Range = (CGPDFString *)CPIndexSetGetRange(v32, 0);
                value[0] = v12;
                value[1] = (CGPDFStringRef)v32;
                value[2] = 0;
                value[3] = Range;
                value[5] = 0;
                value[6] = 0;
                value[4] = v34;
                value[7] = (CGPDFStringRef)htmlString;
                value[8] = (CGPDFStringRef)2;
                value[9] = i;
                value[10] = imageNodes;
                if (v30) {
                  int v35 = *(_DWORD *)v30;
                }
                else {
                  int v35 = 0;
                }
                uint64_t v36 = 1;
                while (kCGPDFNodeTypeOrder[v36] != v35)
                {
                  if (++v36 == 12)
                  {
                    LODWORD(v36) = 0;
                    break;
                  }
                }
                ((void (*)(void, CGPDFString *, CGPDFStringRef *))htmlFuncArray[v36])(0, v30, value);
                goto LABEL_43;
              }
            }
          }
          if (v5 == v4) {
            break;
          }
        }
        else
        {
LABEL_43:
          if (v5 == v4)
          {
            LODWORD(value[0]) = 2;
            endIndent((__CFString *)htmlString, (int *)value);
            CFStringAppendFormat((CFMutableStringRef)htmlString, 0, @"</%@>", @"body");
            endIndent((__CFString *)htmlString, (int *)value);
            CFStringAppendFormat((CFMutableStringRef)htmlString, 0, @"</%@>", @"html");
            break;
          }
        }
      }
    }
    self->htmlStringNoImages = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    unint64_t v37 = [(NSMutableString *)self->htmlString length];
    unint64_t v38 = 0;
    do
    {
      uint64_t v39 = [(NSMutableString *)self->htmlString rangeOfString:@"<img", 2, v38, v37 - v38 options range];
      if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v40 = v37;
      }
      else {
        unint64_t v40 = v39;
      }
      -[NSMutableString appendString:](self->htmlStringNoImages, "appendString:", -[NSMutableString substringWithRange:](self->htmlString, "substringWithRange:", v38, v40 - v38));
      uint64_t v41 = [(NSMutableString *)self->htmlString rangeOfString:@">", 2, v40, v37 - v40 options range];
      if (v41 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v38 = v37;
      }
      else {
        unint64_t v38 = v41 + 1;
      }
    }
    while (v38 < v37);
  }
  return self->htmlStringNoImages;
}

- (id)plainText
{
  if (!self->plainText)
  {
    self->plainText = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t Count = CFArrayGetCount(self->selections);
    if (Count)
    {
      CFIndex v4 = 0;
      char v5 = 0;
      do
      {
        ValueAtIndedouble x = (uint64_t *)CFArrayGetValueAtIndex(self->selections, v4);
        String = CGPDFSelectionCreateString(ValueAtIndex);
        if (String)
        {
          CFStringRef v8 = (const __CFString *)String;
          uint64_t Length = CFStringGetLength((CFStringRef)String);
          if (Length)
          {
            if (v5) {
              CFStringAppend((CFMutableStringRef)self->plainText, @"\n");
            }
            for (CFIndex i = 0; i != Length; ++i)
            {
              UniChar chars = 0;
              CharacterAtIndedouble x = CFStringGetCharacterAtIndex(v8, i);
              UniChar chars = CharacterAtIndex;
              if (CharacterAtIndex != 65532) {
                CFStringAppendCharacters((CFMutableStringRef)self->plainText, &chars, 1);
              }
            }
            char v5 = 1;
          }
          CFRelease(v8);
        }
        ++v4;
      }
      while (v4 != Count);
    }
  }
  return self->plainText;
}

- (void)addSelection:(CGPDFSelection *)a3
{
  if (a3)
  {
    CFArrayAppendValue(self->selections, a3);
    htmlString = self->htmlString;
    if (htmlString)
    {
      webArchiveData = self->webArchiveData;
      if (webArchiveData)
      {

        self->webArchiveData = 0;
        htmlString = self->htmlString;
      }

      self->htmlString = 0;
    }
    plainText = self->plainText;
    if (plainText)
    {

      self->plainText = 0;
    }
  }
}

- (void)dealloc
{
  [(CPArchive *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPArchive;
  [(CPArchive *)&v3 dealloc];
}

- (void)finalize
{
  [(CPArchive *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPArchive;
  [(CPArchive *)&v3 finalize];
}

- (void)dispose
{
  selections = self->selections;
  if (selections)
  {
    CFRelease(selections);
    self->selections = 0;
    imageNodes = self->imageNodes;
    if (imageNodes)
    {
      CFRelease(imageNodes);
      self->imageNodes = 0;
    }
  }
}

- (CPArchive)init
{
  v4.receiver = self;
  v4.super_class = (Class)CPArchive;
  v2 = [(CPArchive *)&v4 init];
  if (v2) {
    v2->selections = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  }
  return v2;
}

@end