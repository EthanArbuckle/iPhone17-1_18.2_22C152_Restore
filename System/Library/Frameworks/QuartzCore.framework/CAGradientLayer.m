@interface CAGradientLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (BOOL)premultiplied;
- (CAGradientLayerType)type;
- (CGColorSpace)colorSpace;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)interpolations;
- (NSArray)locations;
- (double)noiseScale;
- (id)colorMap;
- (id)implicitAnimationForKeyPath:(id)a3;
- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3;
- (void)_colorSpaceDidChange;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)_renderBackgroundInContext:(CGContext *)a3;
- (void)didChangeValueForKey:(id)a3;
- (void)setColorMap:(id)a3;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setColors:(NSArray *)colors;
- (void)setEndPoint:(CGPoint)endPoint;
- (void)setInterpolations:(id)a3;
- (void)setLocations:(NSArray *)locations;
- (void)setNoiseScale:(double)a3;
- (void)setPremultiplied:(BOOL)a3;
- (void)setStartPoint:(CGPoint)startPoint;
- (void)setType:(CAGradientLayerType)type;
@end

@implementation CAGradientLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 0);
  uint64_t v6 = 0;
  while (v5 != (unsigned __int16)-[CAGradientLayer didChangeValueForKey:]::atoms[v6])
  {
    if (++v6 == 9) {
      goto LABEL_6;
    }
  }
  v7 = CA::Transaction::ensure_compat(v5);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
LABEL_6:
  v8.receiver = self;
  v8.super_class = (Class)CAGradientLayer;
  [(CAGradientLayer *)&v8 didChangeValueForKey:a3];
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 <= 444)
  {
    if (v5 == 215)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F29238];
      double v7 = 0.5;
      double v8 = 1.0;
      goto LABEL_12;
    }
    if (v5 == 402) {
      return &unk_1ED057710;
    }
LABEL_15:
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CAGradientLayer;
    return objc_msgSendSuper2(&v10, sel_defaultValueForKey_, a3);
  }
  if (v5 == 445) {
    return (id)*MEMORY[0x1E4F1CFC8];
  }
  if (v5 == 577) {
    return @"axial";
  }
  if (v5 != 536) {
    goto LABEL_15;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F29238];
  double v7 = 0.5;
  double v8 = 0.0;
LABEL_12:

  return (id)objc_msgSend(v6, "valueWithPoint:", v7, v8);
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAGradientLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setColors:(NSArray *)colors
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = colors;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x6E, (const CGAffineTransform *)3, v3);
}

- (void)setLocations:(NSArray *)locations
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = locations;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x16D, (const CGAffineTransform *)3, v3);
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_20;
  }
  if (![a4 isEqualToString:@"colors"])
  {
    if ([a4 isEqualToString:@"locations"]
      || [a4 isEqualToString:@"interpolations"])
    {
      objc_opt_class();
      return CAObject_validateArrayOfClass(a3);
    }
LABEL_20:
    v13.receiver = self;
    v13.super_class = (Class)CAGradientLayer;
    return [(CALayer *)&v13 CA_validateValue:a3 forKey:a4];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(a3);
      }
      CFTypeID v11 = CFGetTypeID(*(CFTypeRef *)(*((void *)&v15 + 1) + 8 * v10));
      if (v11 != CGColorGetTypeID()) {
        return 0;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
        BOOL result = 1;
        if (v8) {
          goto LABEL_6;
        }
        return result;
      }
    }
  }
  return 1;
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3 = 0;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  while ((unsigned __int16)defines_property::atoms[v3] != a3)
  {
    if (++v3 == 9)
    {
      v5.receiver = self;
      v5.super_class = (Class)CAGradientLayer;
      return -[CALayer _renderLayerDefinesProperty:](&v5, sel__renderLayerDefinesProperty_);
    }
  }
  return 1;
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3 = 0;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  while ((unsigned __int16)defines_property::atoms[v3] != a3)
  {
    if (++v3 == 9)
    {
      v5.receiver = self;
      v5.super_class = (Class)CAGradientLayer;
      return -[CALayer _renderLayerPropertyAnimationFlags:](&v5, sel__renderLayerPropertyAnimationFlags_);
    }
  }
  return 32;
}

- (void)_renderBackgroundInContext:(CGContext *)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)CAGradientLayer;
  objc_super v5 = (CA::Transaction *)-[CALayer _renderBackgroundInContext:](&v42, sel__renderBackgroundInContext_);
  uint64_t v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6) {
    uint64_t v6 = (CA::Transaction *)CA::Transaction::create(v5);
  }
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  uint64_t v8 = [(CAGradientLayer *)self colors];
  unint64_t v9 = [(NSArray *)v8 count];
  if (v9 >= 2)
  {
    uint64_t v10 = [(CAGradientLayer *)self locations];
    CFTypeID v11 = v10;
    if (v10)
    {
      uint64_t v12 = [(NSArray *)v10 count];
      if (v12 != v9) {
        goto LABEL_29;
      }
      MEMORY[0x1F4188790](v12);
      v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v14, v13);
      for (uint64_t i = 0; i != v9; ++i)
      {
        objc_msgSend(-[NSArray objectAtIndex:](v11, "objectAtIndex:", i), "doubleValue");
        *(void *)&v14[8 * i] = v16;
      }
    }
    else
    {
      v14 = 0;
    }
    if ([(CAGradientLayer *)self premultiplied])
    {
      uint64_t v43 = *MEMORY[0x1E4F1DD10];
      v44[0] = MEMORY[0x1E4F1CC38];
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
      uint64_t v17 = CGGradientCreateWithColorsAndOptions();
    }
    else
    {
      uint64_t v17 = (uint64_t)CGGradientCreateWithColors(0, (CFArrayRef)v8, (const CGFloat *)v14);
    }
    long long v18 = (CGGradient *)v17;
    if (v17)
    {
      [(CALayer *)self bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      CGContextSaveGState(a3);
      if ([(CALayer *)self _usesCornerRadii])
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        if (self) {
          [(CALayer *)self cornerRadii];
        }
        CA_CGContextAddUnevenRoundRect(a3, (uint64_t)&v38, v20, v22, v24, v26);
        CGContextClip(a3);
      }
      else
      {
        [(CALayer *)self cornerRadius];
        if (v27 <= 0.0)
        {
          v50.origin.x = v20;
          v50.origin.y = v22;
          v50.size.width = v24;
          v50.size.height = v26;
          CGContextClipToRect(a3, v50);
        }
        else
        {
          CA_CGContextAddRoundRect(a3, [(CALayer *)self _continuousCorners], v20, v22, v24, v26, v27);
          CGContextClip(a3);
        }
      }
      [(CAGradientLayer *)self startPoint];
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      [(CAGradientLayer *)self endPoint];
      double v33 = v32;
      double v35 = v34;
      if ([(NSString *)[(CAGradientLayer *)self type] isEqualToString:@"axial"])
      {
        CA::Transaction::unlock(v6);
        CGContextTranslateCTM(a3, v20, v22);
        CGContextScaleCTM(a3, v24, v26);
        v45.x = v29;
        v45.y = v31;
        v48.x = v33;
        v48.y = v35;
        CGContextDrawLinearGradient(a3, v18, v45, v48, 3u);
      }
      else if ([(NSString *)[(CAGradientLayer *)self type] isEqualToString:@"radial"])
      {
        CA::Transaction::unlock(v6);
        CGContextTranslateCTM(a3, v20, v22);
        CGContextScaleCTM(a3, v24, v26);
        CGContextTranslateCTM(a3, v29, v31);
        CGContextScaleCTM(a3, vabdd_f64(v33, v29), vabdd_f64(v35, v31));
        CGPoint v46 = *(CGPoint *)*(void *)&MEMORY[0x1E4F1DAD8];
        v49.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
        v49.y = v46.y;
        CGContextDrawRadialGradient(a3, v18, *MEMORY[0x1E4F1DAD8], 0.0, v49, 1.0, 3u);
      }
      else
      {
        if (![(NSString *)[(CAGradientLayer *)self type] isEqualToString:@"conic"])
        {
LABEL_28:
          CGContextRestoreGState(a3);
          CGGradientRelease(v18);
          goto LABEL_29;
        }
        CA::Transaction::unlock(v6);
        long double v36 = atan2(v35 - v31, v33 - v29);
        CGContextTranslateCTM(a3, v20, v22);
        CGContextScaleCTM(a3, v24, v26);
        v47.x = v29;
        v47.y = v31;
        CGContextDrawConicGradient(a3, v18, v47, v36);
      }
      int v37 = *((_DWORD *)v6 + 25);
      *((_DWORD *)v6 + 25) = v37 + 1;
      if (!v37) {
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
      }
      goto LABEL_28;
    }
  }
LABEL_29:
  CA::Transaction::unlock(v6);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v73.receiver = self;
  v73.super_class = (Class)CAGradientLayer;
  id v8 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v73, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (!v8 || (*((unsigned char *)a5 + 2) & 1) == 0) {
    return v8;
  }
  cf = [(CAGradientLayer *)self colorSpace];
  if (!cf) {
    cf = (CGColorSpace *)CA::Context::current_colorspace((CA::Context *)a3, v9);
  }
  id v10 = [(CAGradientLayer *)self colorMap];
  if (v10)
  {
    CFTypeID v11 = 0;
    uint64_t v12 = 0;
    v72 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    CFTypeID v11 = [(CAGradientLayer *)self colors];
    uint64_t v13 = [(NSArray *)v11 count];
    uint64_t v12 = [(CAGradientLayer *)self locations];
    v72 = [(CAGradientLayer *)self interpolations];
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  long long v15 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x90uLL, 0x743898A5uLL);
  uint64_t v17 = v15;
  if (v15)
  {
    if (v72) {
      int v18 = (2 * (v12 != 0)) | 4;
    }
    else {
      int v18 = 2 * (v12 != 0);
    }
    v15[2] = 1;
    v15[3] = 20;
    ++dword_1EB2ADE18;
    *(void *)long long v15 = &unk_1ED02D9A0;
    CA::Render::InterpolatedFunction::InterpolatedFunction((CA::Render::InterpolatedFunction *)(v15 + 4), v13, 4, v18);
    *((void *)v17 + 2) = &unk_1ED02FF20;
    double v16 = 0.0;
    *(_OWORD *)(v17 + 18) = 0u;
    *(_OWORD *)(v17 + 22) = 0u;
    *((void *)v17 + 13) = 0x3F80000000000000;
    *((_OWORD *)v17 + 7) = 0u;
    *((_OWORD *)v17 + 8) = 0u;
  }
  if (!v10)
  {
    unint64_t v68 = v13;
    if (!v11 || !*((void *)v17 + 6))
    {
LABEL_53:
      if (v12 && *((void *)v17 + 7))
      {
        unint64_t Count = CFArrayGetCount((CFArrayRef)v12);
        unint64_t v37 = *((void *)v17 + 4);
        if (v37 >= Count) {
          unint64_t v38 = Count;
        }
        else {
          unint64_t v38 = *((void *)v17 + 4);
        }
        if (v38)
        {
          uint64_t v39 = 0;
          CFIndex v40 = 0;
          char v41 = 1;
          do
          {
            CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v12, v40);
            CFNumberGetValue(ValueAtIndex, kCFNumberFloatType, (void *)(*((void *)v17 + 7) + v39));
            if (v40)
            {
              uint64_t v43 = (float *)(*((void *)v17 + 7) + 4 * v40);
              *(float *)&double v16 = *v43;
              if (*v43 < *(v43 - 1)) {
                char v41 = 0;
              }
            }
            ++v40;
            v39 += 4;
          }
          while (v38 != v40);
          unint64_t v37 = *((void *)v17 + 4);
        }
        else
        {
          char v41 = 1;
        }
        BOOL v44 = v37 > v38;
        unint64_t v45 = v37 - v38;
        if (v44) {
          memset_pattern16((void *)(*((void *)v17 + 7) + 4 * v38), &unk_1849987D0, 4 * v45);
        }
        if (v41) {
          int v46 = 256;
        }
        else {
          int v46 = 0;
        }
        v17[7] = v17[7] & 0xFFFFFCFF | v46 | 0x200;
      }
      if (!v72 || v68 < 2) {
        goto LABEL_87;
      }
      unint64_t v47 = [(NSArray *)v72 count];
      __asm { FMOV            V0.2D, #1.0 }
      long long v70 = _Q0;
      if (v47 >= v68 - 1)
      {
        uint64_t v54 = *((void *)v17 + 8);
        unint64_t v53 = v68 - 1;
      }
      else
      {
        unint64_t v53 = [(NSArray *)v72 count];
        uint64_t v54 = *((void *)v17 + 8);
        if (!v53) {
          goto LABEL_84;
        }
      }
      uint64_t v55 = 0;
      uint64_t v56 = v54;
      do
      {
        id v57 = -[NSArray objectAtIndexedSubscript:](v72, "objectAtIndexedSubscript:", v55, v67);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v57 _getPoints:v56];
        }
        else
        {
          *(void *)uint64_t v56 = 0;
          *(void *)(v56 + 8) = 0;
          *(_OWORD *)(v56 + 16) = v70;
        }
        ++v55;
        v56 += 32;
      }
      while (v53 != v55);
LABEL_84:
      double v16 = *(double *)&v70;
      if (v53 < v68 - 1)
      {
        unint64_t v58 = ~v53 + v68;
        v59 = (_OWORD *)(v54 + 32 * v53 + 16);
        do
        {
          *((void *)v59 - 2) = 0;
          *((void *)v59 - 1) = 0;
          _OWORD *v59 = v70;
          v59 += 2;
          --v58;
        }
        while (v58);
      }
      goto LABEL_87;
    }
    unint64_t v22 = CFArrayGetCount((CFArrayRef)v11);
    if (*((void *)v17 + 4) >= v22) {
      unint64_t v23 = v22;
    }
    else {
      unint64_t v23 = *((void *)v17 + 4);
    }
    CFTypeID TypeID = CGColorGetTypeID();
    if (v23)
    {
      CFTypeID v25 = TypeID;
      v67 = v12;
      id v69 = v8;
      uint64_t v26 = 0;
      CFIndex v27 = 0;
      LOBYTE(v28) = 1;
      do
      {
        CGFloat v29 = (float32x4_t *)(*((void *)v17 + 6) + v26);
        double v30 = (CGColor *)CFArrayGetValueAtIndex((CFArrayRef)v11, v27);
        if (CFGetTypeID(v30) == v25)
        {
          float64x2_t v74 = 0u;
          float64x2_t v75 = 0u;
          CA_CGColorGetRGBComponents(v30, cf, v74.f64);
          HIDWORD(v16) = HIDWORD(v75.f64[0]);
          *CGFloat v29 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v74), v75);
          LODWORD(v16) = v29->i32[3];
        }
        else
        {
          v29->i64[0] = 0;
          v29->i64[1] = 0;
          double v16 = 0.0;
        }
        int v28 = (*(float *)&v16 >= 1.0) & v28;
        ++v27;
        v26 += 16;
      }
      while (v23 != v27);
      unint64_t v31 = *((void *)v17 + 4);
      id v8 = v69;
      uint64_t v12 = v67;
      if (v23 >= v31)
      {
        if (v28) {
          goto LABEL_51;
        }
LABEL_50:
        unsigned int v35 = v17[7] & 0xFFFFF7FF;
LABEL_52:
        v17[7] = v35;
        goto LABEL_53;
      }
    }
    else
    {
      unint64_t v31 = *((void *)v17 + 4);
      if (!v31)
      {
LABEL_51:
        unsigned int v35 = v17[7] | 0x800;
        goto LABEL_52;
      }
    }
    unint64_t v34 = v31 - v23;
    if ((v34 & 0x3FFFFFFFFFFFFFFFLL) != 0) {
      bzero((void *)(*((void *)v17 + 6) + 16 * v23), 16 * v34);
    }
    goto LABEL_50;
  }
  double v19 = (atomic_uint *)objc_msgSend(v10, "CA_copyRenderValue");
  double v20 = (atomic_uint *)*((void *)v17 + 14);
  if (v20 != v19)
  {
    if (v20 && atomic_fetch_add(v20 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v20 + 16))(v20);
    }
    if (v19)
    {
      double v21 = v19;
      if (!atomic_fetch_add(v19 + 2, 1u))
      {
        double v21 = 0;
        atomic_fetch_add(v19 + 2, 0xFFFFFFFF);
      }
    }
    else
    {
      double v21 = 0;
    }
    *((void *)v17 + 14) = v21;
    uint64_t v32 = (*(uint64_t (**)(atomic_uint *))(*(void *)v19 + 80))(v19);
    if (v32 && (*(unsigned char *)(v32 + 13) & 0x10) != 0) {
      v17[3] |= 0x1000u;
    }
    v17[3] |= 0x800u;
  }
  double v33 = (atomic_uint *)*((void *)v17 + 15);
  if (v33)
  {
    if (atomic_fetch_add(v33 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v33 + 16))(v33);
    }
    *((void *)v17 + 15) = 0;
  }
  if (v19 && atomic_fetch_add(v19 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v19 + 16))(v19);
  }
LABEL_87:
  v17[26] = CAInternAtom((const __CFString *)[(CAGradientLayer *)self type], 0);
  [(CAGradientLayer *)self startPoint];
  *((void *)v17 + 9) = v60;
  *((void *)v17 + 10) = v61;
  [(CAGradientLayer *)self endPoint];
  *((void *)v17 + 11) = v62;
  *((void *)v17 + 12) = v63;
  X::CFRef<__CFDictionary const*>::operator=((const void **)v17 + 16, cf);
  if ([(CAGradientLayer *)self premultiplied]) {
    int v64 = 4096;
  }
  else {
    int v64 = 0;
  }
  v17[7] = v17[7] & 0xFFFFEFFF | v64;
  [(CAGradientLayer *)self noiseScale];
  *(float *)&double v65 = v65;
  v17[27] = LODWORD(v65);
  CA::Render::Layer::set_subclass((uint64_t)v8, (CA::Render::LayerSubclass *)v17);
  if (atomic_fetch_add(v17 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(_DWORD *))(*(void *)v17 + 16))(v17);
  }
  return v8;
}

- (CGPoint)endPoint
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xD7u, (const CGAffineTransform *)0x13, (id *)&v4);
  double v2 = v4;
  double v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CAGradientLayerType)type
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x241u, (const CGAffineTransform *)3, v3);
  return (CAGradientLayerType)v3[0];
}

- (CGPoint)startPoint
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x218u, (const CGAffineTransform *)0x13, (id *)&v4);
  double v2 = v4;
  double v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)premultiplied
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1BDu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (NSArray)locations
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x16Du, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (NSArray)colors
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x6Eu, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (double)noiseScale
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x192u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (id)colorMap
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x66u, (const CGAffineTransform *)2, v3);
  return v3[0];
}

- (NSArray)interpolations
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x14Bu, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (CGColorSpace)colorSpace
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x6Cu, (const CGAffineTransform *)2, v3);
  return (CGColorSpace *)v3[0];
}

- (void)setStartPoint:(CGPoint)startPoint
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGPoint v3 = startPoint;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x218, (const CGAffineTransform *)0x13, &v3.x);
}

- (void)setEndPoint:(CGPoint)endPoint
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGPoint v3 = endPoint;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xD7, (const CGAffineTransform *)0x13, &v3.x);
}

- (void)setType:(CAGradientLayerType)type
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = type;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x241, (const CGAffineTransform *)3, v3);
}

- (void)setInterpolations:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x14B, (const CGAffineTransform *)3, v3);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x6C, (const CGAffineTransform *)2, v3);
}

- (void)setPremultiplied:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1BD, (const CGAffineTransform *)6, (double *)&v3);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)CAGradientLayer;
  id result = -[CALayer implicitAnimationForKeyPath:](&v10, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    uint64_t v6 = [a3 rangeOfString:@"."];
    if (v7)
    {
      int v8 = CAInternAtom((const __CFString *)[a3 substringToIndex:v6], 0);
      signed int v9 = 0;
      id result = 0;
      if (v8 <= 364)
      {
        if (v8 != 110 && v8 != 331) {
          return result;
        }
        return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
      }
      if (v8 == 445 || v8 == 365) {
        return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
      }
    }
    else
    {
      signed int v9 = CAInternAtom((const __CFString *)a3, 0);
      id result = 0;
      if (v9 <= 364)
      {
        if (v9 == 110 || v9 == 215 || v9 == 331) {
          return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
        }
      }
      else if (v9 > 444)
      {
        if (v9 == 445 || v9 == 536) {
          return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
        }
      }
      else if (v9 == 365 || v9 == 402)
      {
        return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
      }
    }
  }
  return result;
}

- (void)_colorSpaceDidChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAGradientLayer;
  BOOL v3 = (CA::Transaction *)[(CALayer *)&v5 _colorSpaceDidChange];
  uint64_t v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    uint64_t v4 = (CA::Transaction *)CA::Transaction::create(v3);
  }
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v4, 0x10000);
}

- (void)setNoiseScale:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x192, (const CGAffineTransform *)0x12, v3);
}

- (void)setColorMap:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x66, (const CGAffineTransform *)2, v3);
}

@end