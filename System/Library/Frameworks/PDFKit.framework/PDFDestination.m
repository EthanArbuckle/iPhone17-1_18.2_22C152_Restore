@interface PDFDestination
- (CGFloat)zoom;
- (CGPoint)point;
- (NSComparisonResult)compare:(PDFDestination *)destination;
- (PDFDestination)init;
- (PDFDestination)initWithDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4;
- (PDFDestination)initWithPage:(PDFPage *)page atPoint:(CGPoint)point;
- (PDFPage)page;
- (__CFArray)createArrayRef;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)document;
- (id)pageIfExists;
- (int)type;
- (void)commonInit;
- (void)dealloc;
- (void)setZoom:(CGFloat)zoom;
@end

@implementation PDFDestination

- (PDFDestination)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDFDestination;
  v2 = [(PDFDestination *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(PDFDestination *)v2 commonInit];
    v4 = v3;
  }

  return v3;
}

- (PDFDestination)initWithPage:(PDFPage *)page atPoint:(CGPoint)point
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  v7 = page;
  if (v7)
  {
    v8 = [(PDFDestination *)self init];
    if (!v8)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v9 = v8;
    v10 = [(PDFPage *)v7 document];
    objc_storeWeak((id *)&v9->_private->document, v10);

    objc_storeWeak((id *)&v9->_private->page, v7);
    v9->_private->type = 0;
    v9->_private->left = x;
    v9->_private->top = y;
    self = v9;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

LABEL_7:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v4[1] + 32) = self->_private->type;
  *(double *)(v4[1] + 40) = self->_private->left;
  *(double *)(v4[1] + 48) = self->_private->top;
  *(double *)(v4[1] + 56) = self->_private->right;
  *(double *)(v4[1] + 64) = self->_private->bottom;
  *(double *)(v4[1] + 72) = self->_private->zoom;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_storeWeak((id *)(v4[1] + 16), WeakRetained);

  return v4;
}

- (void)dealloc
{
  v3 = self->_private;
  if (v3 && v3->array) {
    CGPDFArrayRelease();
  }
  v4.receiver = self;
  v4.super_class = (Class)PDFDestination;
  [(PDFDestination *)&v4 dealloc];
}

- (id)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);

  return WeakRetained;
}

- (PDFPage)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  if (!WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)&self->_private->document);
    if (v4 && (arraCGFloat y = self->_private->array, v4, array))
    {
      objc_super v6 = [(PDFDestination *)self document];
      CGPDFDictionaryRef value = 0;
      if (CGPDFArrayGetDictionary(self->_private->array, 0, &value))
      {
        v7 = [(PDFDestination *)self document];
        id WeakRetained = [v7 findPageWithCGPDFDictionaryPageRef:value];
      }
      else
      {
        unint64_t v10 = 0;
        id WeakRetained = 0;
        if (CGPDFArrayGetInteger(self->_private->array, 0, (CGPDFInteger *)&v10))
        {
          unint64_t v8 = v10;
          if (v8 >= [v6 pageCount])
          {
            id WeakRetained = 0;
          }
          else
          {
            id WeakRetained = [v6 pageAtIndex:v10];
          }
        }
      }
      objc_storeWeak((id *)&self->_private->page, WeakRetained);
    }
    else
    {
      id WeakRetained = 0;
    }
  }

  return (PDFPage *)WeakRetained;
}

- (id)pageIfExists
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);

  return WeakRetained;
}

- (CGPoint)point
{
  if ([(PDFDestination *)self type])
  {
    double top = 3.40282347e38;
    double left = 3.40282347e38;
  }
  else
  {
    v5 = self->_private;
    double left = v5->left;
    double top = v5->top;
  }
  result.CGFloat y = top;
  result.CGFloat x = left;
  return result;
}

- (CGFloat)zoom
{
  if ([(PDFDestination *)self type]) {
    return 3.40282347e38;
  }
  else {
    return self->_private->zoom;
  }
}

- (void)setZoom:(CGFloat)zoom
{
  if (![(PDFDestination *)self type]) {
    self->_private->zoom = zoom;
  }
}

- (NSComparisonResult)compare:(PDFDestination *)destination
{
  id v4 = destination;
  v5 = [(PDFDestination *)self page];
  objc_super v6 = [(PDFDestination *)v4 page];
  v7 = 0;
  NSComparisonResult v8 = NSOrderedAscending;
  v9 = 0;
  if (v6)
  {
    if (v5)
    {
      v9 = [v5 document];
      v7 = [v6 document];
      if (v7 == v9)
      {
        unint64_t v10 = [v9 indexForPage:v5];
        unint64_t v11 = [v9 indexForPage:v6];
        if (v10 <= v11)
        {
          if (v10 >= v11)
          {
            [(PDFDestination *)self point];
            double MaxY = v12;
            [(PDFDestination *)v4 point];
            double v15 = v14;
            if (MaxY == 3.40282347e38)
            {
              [v5 boundsForBox:0];
              double MaxY = PDFRectGetMaxY(v16, v17, v18, v19);
            }
            if (v15 == 3.40282347e38)
            {
              [v6 boundsForBox:0];
              double v15 = PDFRectGetMaxY(v20, v21, v22, v23);
            }
            if (MaxY > v15) {
              NSComparisonResult v8 = NSOrderedAscending;
            }
            else {
              NSComparisonResult v8 = (unint64_t)(MaxY < v15);
            }
          }
          else
          {
            NSComparisonResult v8 = NSOrderedAscending;
          }
        }
        else
        {
          NSComparisonResult v8 = NSOrderedDescending;
        }
        v7 = v9;
      }
    }
  }

  return v8;
}

- (id)description
{
  v3 = [(PDFDestination *)self page];
  if (v3)
  {
    id v4 = [(PDFDestination *)self document];
    uint64_t v5 = [v4 indexForPage:v3];

    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  v7 = 0;
  switch([(PDFDestination *)self type])
  {
    case 0xFFFFFFFF:
      goto LABEL_15;
    case 0u:
      if (self->_private->left == 3.40282347e38)
      {
        NSComparisonResult v8 = @"N/A";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%.1f", *(void *)&self->_private->left);
        NSComparisonResult v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (self->_private->top == 3.40282347e38)
      {
        unint64_t v10 = @"N/A";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%.1f", *(void *)&self->_private->top);
        unint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (self->_private->zoom == 3.40282347e38)
      {
        unint64_t v11 = @"N/A";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%.1f", *(void *)&self->_private->zoom);
        unint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v7 = [NSString stringWithFormat:@"XYZ, page = %d, left = %@, double top = %@, zoom = %@\n", v6, v8, v10, v11];

      goto LABEL_15;
    case 1u:
      [NSString stringWithFormat:@"Fit, page = %d\n", v6, v12, v13, v14, v15];
      goto LABEL_14;
    case 2u:
      [NSString stringWithFormat:@"FitH, page = %d, t = %.1f\n", v6, *(void *)&self->_private->top, v13, v14, v15];
      goto LABEL_14;
    case 3u:
      [NSString stringWithFormat:@"FitV, page = %d, l = %.1f\n", v6, *(void *)&self->_private->left, v13, v14, v15];
      goto LABEL_14;
    case 4u:
      [NSString stringWithFormat:@"FitR, page = %d, l = %.1f, b = %.1f, r = %.1f, t = %.1f\n", v6, *(void *)&self->_private->left, *(void *)&self->_private->bottom, *(void *)&self->_private->right, *(void *)&self->_private->top];
      goto LABEL_14;
    case 5u:
      [NSString stringWithFormat:@"FitB, page = %d\n", v6, v12, v13, v14, v15];
      goto LABEL_14;
    case 6u:
      [NSString stringWithFormat:@"FitBH, page = %d, t = %.1f\n", v6, *(void *)&self->_private->top, v13, v14, v15];
      goto LABEL_14;
    default:
      [NSString stringWithFormat:@"FitBV, page = %d, l = %.1f\n", v6, *(void *)&self->_private->left, v13, v14, v15];
      v7 = LABEL_14:;
LABEL_15:

      return v7;
  }
}

- (PDFDestination)initWithDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4
{
  id v6 = a4;
  arraCGFloat y = 0;
  CGPDFObjectRef value = 0;
  __s1 = 0;
  v7 = [(PDFDestination *)self init];
  NSComparisonResult v8 = v7;
  if (!v7) {
    goto LABEL_20;
  }
  objc_storeWeak((id *)&v7->_private->document, v6);
  if (!CGPDFDictionaryGetObject(a3, "Dest", &value) && !CGPDFDictionaryGetObject(a3, "D", &value)) {
    goto LABEL_20;
  }
  if (CGPDFObjectGetValue(value, kCGPDFObjectTypeString, 0) || CGPDFObjectGetValue(value, kCGPDFObjectTypeName, 0))
  {
    CGPDFDictionaryRef dict = 0;
    [v6 documentRef];
    Destination = (CGPDFObject *)CGPDFDocumentGetDestination();
    CGPDFObjectRef value = Destination;
    if (!Destination)
    {
LABEL_34:
      unint64_t v11 = v8;
      goto LABEL_35;
    }
    if (CGPDFObjectGetValue(Destination, kCGPDFObjectTypeDictionary, &dict)
      && !CGPDFDictionaryGetObject(dict, "D", &value))
    {
      goto LABEL_20;
    }
  }
  if (!CGPDFObjectGetValue(value, kCGPDFObjectTypeArray, &array)) {
    goto LABEL_20;
  }
  v8->_private->arraCGFloat y = (CGPDFArray *)CGPDFArrayRetain();
  if (!CGPDFArrayGetName(array, 1uLL, (const char **)&__s1)) {
    goto LABEL_20;
  }
  unint64_t v10 = __s1;
  if (!strcmp(__s1, "XYZ"))
  {
    v8->_private->type = 0;
    if (get_number(array, 2uLL, &v8->_private->left))
    {
      if (get_number(array, 3uLL, &v8->_private->top))
      {
        if (get_number(array, 4uLL, &v8->_private->zoom))
        {
          uint64_t v12 = v8->_private;
          if (v12->zoom == 0.0) {
            v12->zoom = 3.40282347e38;
          }
        }
      }
    }
    goto LABEL_34;
  }
  if (!strcmp(v10, "Fit"))
  {
    uint64_t v13 = v8->_private;
    int v14 = 1;
LABEL_27:
    v13->type = v14;
    goto LABEL_34;
  }
  if (!strcmp(v10, "FitH"))
  {
    v8->_private->type = 2;
LABEL_29:
    uint64_t v15 = array;
    p_double top = &v8->_private->top;
LABEL_32:
    size_t v19 = 2;
LABEL_33:
    get_number(v15, v19, p_top);
    goto LABEL_34;
  }
  if (!strcmp(v10, "FitV"))
  {
    double v17 = v8->_private;
    int v18 = 3;
LABEL_31:
    v17->type = v18;
    uint64_t v15 = array;
    p_double top = &v8->_private->left;
    goto LABEL_32;
  }
  if (!strcmp(v10, "FitR"))
  {
    v8->_private->type = 4;
    if (!get_number(array, 2uLL, &v8->_private->left)
      || !get_number(array, 3uLL, &v8->_private->bottom)
      || !get_number(array, 4uLL, &v8->_private->right))
    {
      goto LABEL_34;
    }
    uint64_t v15 = array;
    p_double top = &v8->_private->top;
    size_t v19 = 5;
    goto LABEL_33;
  }
  if (!strcmp(v10, "FitB"))
  {
    uint64_t v13 = v8->_private;
    int v14 = 5;
    goto LABEL_27;
  }
  if (!strcmp(v10, "FitBH"))
  {
    v8->_private->type = 6;
    goto LABEL_29;
  }
  if (!strcmp(v10, "FitBV"))
  {
    double v17 = v8->_private;
    int v18 = 7;
    goto LABEL_31;
  }
  NSLog(&cfstr_UnknownPdfDest.isa, v10);
LABEL_20:
  unint64_t v11 = 0;
LABEL_35:

  return v11;
}

- (void)commonInit
{
  v3 = objc_alloc_init(PDFDestinationPrivate);
  id v4 = self->_private;
  self->_private = v3;

  objc_storeWeak((id *)&self->_private->document, 0);
  objc_storeWeak((id *)&self->_private->page, 0);
  self->_private->type = -1;
  self->_private->double left = 3.40282347e38;
  self->_private->double top = 3.40282347e38;
  self->_private->right = 3.40282347e38;
  self->_private->bottom = 3.40282347e38;
  self->_private->zoom = 3.40282347e38;
}

- (int)type
{
  return self->_private->type;
}

- (__CFArray)createArrayRef
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  CFTypeRef v51 = 0;
  *(_OWORD *)cf = 0u;
  *(_OWORD *)v50 = 0u;
  v3 = [(PDFDestination *)self page];
  id v4 = NSString;
  uint64_t v5 = [v3 document];
  values = objc_msgSend(v4, "stringWithFormat:", @"/#%ld", objc_msgSend(v5, "indexForPage:", v3) + 1);

  if (values)
  {
    id v6 = self->_private;
    v7 = @"/Fit";
    switch(v6->type)
    {
      case 0:
        cf[0] = @"/XYZ";
        double left = v6->left;
        p_double left = &v6->left;
        if (left == 3.40282347e38) {
          CFNumberRef v10 = (CFNumberRef)*MEMORY[0x263EFFD08];
        }
        else {
          CFNumberRef v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, p_left);
        }
        cf[1] = v10;
        if (!v10) {
          goto LABEL_47;
        }
        double v23 = self->_private;
        double top = v23->top;
        p_double top = &v23->top;
        CFNumberRef v26 = top == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x263EFFD08]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, p_top);
        v50[0] = v26;
        if (!v26) {
          goto LABEL_47;
        }
        v31 = self->_private;
        double zoom = v31->zoom;
        p_double zoom = &v31->zoom;
        CFNumberRef v34 = zoom == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x263EFFD08]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, p_zoom);
        v50[1] = v34;
        if (!v34) {
          goto LABEL_47;
        }
        CFIndex v16 = 5;
        goto LABEL_20;
      case 1:
        goto LABEL_10;
      case 2:
        unint64_t v11 = @"/FitH";
        goto LABEL_12;
      case 3:
        uint64_t v12 = @"/FitV";
        goto LABEL_14;
      case 4:
        cf[0] = @"/FitR";
        double v14 = v6->left;
        uint64_t v13 = &v6->left;
        if (v14 == 3.40282347e38) {
          CFNumberRef v15 = (CFNumberRef)*MEMORY[0x263EFFD08];
        }
        else {
          CFNumberRef v15 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, v13);
        }
        cf[1] = v15;
        if (!v15) {
          goto LABEL_47;
        }
        v27 = self->_private;
        double bottom = v27->bottom;
        p_double bottom = &v27->bottom;
        CFNumberRef v30 = bottom == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x263EFFD08]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, p_bottom);
        v50[0] = v30;
        if (!v30) {
          goto LABEL_47;
        }
        v35 = self->_private;
        double right = v35->right;
        p_double right = &v35->right;
        CFNumberRef v38 = right == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x263EFFD08]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, p_right);
        v50[1] = v38;
        if (!v38) {
          goto LABEL_47;
        }
        v39 = self->_private;
        double v41 = v39->top;
        v40 = &v39->top;
        CFNumberRef v42 = v41 == 3.40282347e38
            ? (CFNumberRef)*MEMORY[0x263EFFD08]
            : CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, v40);
        CFTypeRef v51 = v42;
        if (!v42) {
          goto LABEL_47;
        }
        CFIndex v16 = 6;
        goto LABEL_20;
      case 5:
        v7 = @"/FitB";
LABEL_10:
        cf[0] = v7;
        CFIndex v16 = 2;
        goto LABEL_20;
      case 6:
        unint64_t v11 = @"/FitBH";
LABEL_12:
        cf[0] = v11;
        double v18 = v6->top;
        double v17 = &v6->top;
        double v19 = v18;
        goto LABEL_15;
      case 7:
        uint64_t v12 = @"/FitBV";
LABEL_14:
        cf[0] = v12;
        double v20 = v6->left;
        double v17 = &v6->left;
        double v19 = v20;
LABEL_15:
        if (v19 == 3.40282347e38) {
          CFNumberRef v21 = (CFNumberRef)*MEMORY[0x263EFFD08];
        }
        else {
          CFNumberRef v21 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberCGFloatType, v17);
        }
        cf[1] = v21;
        if (!v21) {
          goto LABEL_47;
        }
        CFIndex v16 = 3;
LABEL_20:
        double v22 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&values, v16, MEMORY[0x263EFFF70]);
        break;
      default:
        goto LABEL_47;
    }
  }
  else
  {
LABEL_47:
    double v22 = 0;
  }
  if (cf[1])
  {
    CFTypeID v43 = CFGetTypeID(cf[1]);
    if (v43 != CFNullGetTypeID()) {
      CFRelease(cf[1]);
    }
  }
  if (v50[0])
  {
    CFTypeID v44 = CFGetTypeID(v50[0]);
    if (v44 != CFNullGetTypeID()) {
      CFRelease(v50[0]);
    }
  }
  if (v50[1])
  {
    CFTypeID v45 = CFGetTypeID(v50[1]);
    if (v45 != CFNullGetTypeID()) {
      CFRelease(v50[1]);
    }
  }
  if (v51)
  {
    CFTypeID v46 = CFGetTypeID(v51);
    if (v46 != CFNullGetTypeID()) {
      CFRelease(v51);
    }
  }

  return v22;
}

- (void).cxx_destruct
{
}

@end