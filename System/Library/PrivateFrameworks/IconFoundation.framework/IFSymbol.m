@interface IFSymbol
+ (BOOL)supportsSecureCoding;
+ (id)_coreGlyphsBundle;
+ (id)_coreGlyphsPrivateBundle;
- (BOOL)_shouldFlipFromSymbolImage:(id)a3 desiredDirection:(int64_t)a4;
- (CUICatalog)catalog;
- (IFSymbol)initWithCoder:(id)a3;
- (IFSymbol)initWithSymbolName:(id)a3 bundleURL:(id)a4;
- (NSString)name;
- (NSURL)bundleURL;
- (id)_lookupResolvedName:(id)a3;
- (id)description;
- (id)imageForDescriptor:(id)a3;
- (id)imageForGraphicSymbolDescriptor:(id)a3;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (os_unfair_lock_s)lock;
- (void)encodeWithCoder:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation IFSymbol

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);

  objc_storeStrong((id *)&self->_catalog, 0);
}

- (IFSymbol)initWithSymbolName:(id)a3 bundleURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IFSymbol;
  v8 = [(IFSymbol *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_bundleURL, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IFSymbol)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];

  id v7 = [(IFSymbol *)self initWithSymbolName:v6 bundleURL:v5];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_name forKey:@"name"];
  bundleURL = self->_bundleURL;
  if (bundleURL) {
    [v5 encodeObject:bundleURL forKey:@"bundleURL"];
  }
}

- (CUICatalog)catalog
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_catalog)
  {
    id v4 = +[IFBundle bundleWithURL:self->_bundleURL];
    id v5 = [v4 assetCatalogURL];

    id v6 = (CUICatalog *)[objc_alloc(MEMORY[0x1E4F5E048]) initWithURL:v5 error:0];
    catalog = self->_catalog;
    self->_catalog = v6;
  }
  os_unfair_lock_unlock(p_lock);
  v8 = self->_catalog;

  return v8;
}

+ (id)_coreGlyphsBundle
{
  if (_coreGlyphsBundle_onceToken != -1) {
    dispatch_once(&_coreGlyphsBundle_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)_coreGlyphsBundle_bundle;

  return v2;
}

void __29__IFSymbol__coreGlyphsBundle__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  id v3 = [MEMORY[0x1E4F1CB10] coreGlyphsBundleURL];
  uint64_t v1 = [v0 bundleWithURL:v3];
  v2 = (void *)_coreGlyphsBundle_bundle;
  _coreGlyphsBundle_bundle = v1;
}

+ (id)_coreGlyphsPrivateBundle
{
  if (_coreGlyphsPrivateBundle_onceToken != -1) {
    dispatch_once(&_coreGlyphsPrivateBundle_onceToken, &__block_literal_global_10_0);
  }
  v2 = (void *)_coreGlyphsPrivateBundle_bundle;

  return v2;
}

void __36__IFSymbol__coreGlyphsPrivateBundle__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  id v3 = [MEMORY[0x1E4F1CB10] coreGlyphsPrivateBundleURL];
  uint64_t v1 = [v0 bundleWithURL:v3];
  v2 = (void *)_coreGlyphsPrivateBundle_bundle;
  _coreGlyphsPrivateBundle_bundle = v1;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = [(IFSymbol *)self name];

  if (v8)
  {
    uint64_t v9 = objc_alloc_init(IFSymbolImageDescriptor);
    [(IFSymbolImageDescriptor *)v9 setScale:a4];
    v10 = [(IFSymbol *)self imageForDescriptor:v9];
    v11 = v10;
    if (v10
      && ([v10 vectorGlyph], objc_super v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      v13 = [v11 vectorGlyph];
      [v13 alignmentRect];
      memset(&v26, 0, sizeof(v26));
      double v16 = 1.0;
      BOOL v17 = v14 <= width;
      double v18 = width / v14;
      if (v14 < width) {
        double v19 = width / v14;
      }
      else {
        double v19 = 1.0;
      }
      if (v17) {
        double v18 = v19;
      }
      if (v15 > height || v15 < height) {
        double v16 = height / v15;
      }
      if (v16 >= v18) {
        double v16 = v18;
      }
      CGAffineTransformMakeScale(&v26, v16, v16);
      [v13 alignmentRect];
      CGAffineTransform v25 = v26;
      CGRect v29 = CGRectApplyAffineTransform(v28, &v25);
      uint64_t v20 = objc_msgSend(v13, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, v29.size.width, v29.size.height);
      if (v20)
      {
        v21 = (const void *)v20;
        v22 = +[IFGraphicsContext bitmapContextWithSize:scale:preset:](IFGraphicsContext, "bitmapContextWithSize:scale:preset:", 0, width, height, a4);
        if ([(IFSymbol *)self _shouldFlipFromSymbolImage:v11 desiredDirection:[(IFSymbolImageDescriptor *)v9 layoutDirection]])
        {
          CGContextTranslateCTM((CGContextRef)[v22 cgContext], width, 0.0);
          CGContextScaleCTM((CGContextRef)[v22 cgContext], -1.0, 1.0);
        }
        objc_msgSend(v22, "drawCGImage:centeredInRect:", v21, 0.0, 0.0, width, height);
        v23 = [v22 image];
        CFRelease(v21);
      }
      else
      {
        v23 = 0;
      }
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)imageForDescriptor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(IFSymbol *)self name];
    [v4 setName:v5];
  }
  id v6 = [(IFSymbol *)self catalog];
  id v7 = [(IFSymbol *)self name];
  [v4 scale];
  double v9 = v8;
  uint64_t v10 = [v4 layoutDirection];
  uint64_t v11 = [v4 symbolSize];
  uint64_t v12 = [v4 symbolWeight];
  [v4 pointSize];
  double v14 = [v6 namedVectorGlyphWithName:v7 scaleFactor:0 deviceIdiom:v10 layoutDirection:v11 glyphSize:v12 glyphWeight:0 glyphPointSize:v9 appearanceName:v13];

  if (v14) {
    goto LABEL_7;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F5E048]);
  double v16 = +[IFSymbol _coreGlyphsBundle];
  BOOL v17 = (void *)[v15 initWithName:@"Assets" fromBundle:v16 error:0];

  double v18 = [(IFSymbol *)self name];
  [v4 scale];
  double v20 = v19;
  uint64_t v21 = [v4 layoutDirection];
  uint64_t v22 = [v4 symbolSize];
  uint64_t v23 = [v4 symbolWeight];
  [v4 pointSize];
  double v14 = [v17 namedVectorGlyphWithName:v18 scaleFactor:0 deviceIdiom:v21 layoutDirection:v22 glyphSize:v23 glyphWeight:0 glyphPointSize:v20 appearanceName:v24];

  if (v14)
  {
    id v6 = v17;
LABEL_7:
    v34 = [[IFSymbolImage alloc] initWithNamedVectorGlyph:v14];
    goto LABEL_8;
  }
  id v25 = objc_alloc(MEMORY[0x1E4F5E048]);
  CGAffineTransform v26 = +[IFSymbol _coreGlyphsPrivateBundle];
  id v6 = (void *)[v25 initWithName:@"Assets" fromBundle:v26 error:0];

  v27 = [(IFSymbol *)self name];
  [v4 scale];
  double v29 = v28;
  uint64_t v30 = [v4 layoutDirection];
  uint64_t v31 = [v4 symbolSize];
  uint64_t v32 = [v4 symbolWeight];
  [v4 pointSize];
  double v14 = [v6 namedVectorGlyphWithName:v27 scaleFactor:0 deviceIdiom:v30 layoutDirection:v31 glyphSize:v32 glyphWeight:0 glyphPointSize:v29 appearanceName:v33];

  if (v14) {
    goto LABEL_7;
  }
  v34 = 0;
LABEL_8:

  return v34;
}

- (id)_lookupResolvedName:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  if ([v4 rangeOfString:@"svg" options:1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 stringByDeletingPathExtension];
  }
  id v6 = v5;

  return v6;
}

- (id)imageForGraphicSymbolDescriptor:(id)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IFSymbol *)self imageForDescriptor:v4];
  if (v5)
  {
    id v6 = [(IFSymbol *)self name];
    [v4 setName:v6];

    id v7 = [v5 vectorGlyph];
    double v8 = [v7 renditionName];
    double v9 = [(IFSymbol *)self _lookupResolvedName:v8];
    [v4 setResolvedName:v9];

    if (-[IFSymbol _shouldFlipFromSymbolImage:desiredDirection:](self, "_shouldFlipFromSymbolImage:desiredDirection:", v5, [v4 layoutDirection]))
    {
      [v4 setFlipXOffsetOverride:1];
    }
    uint64_t v10 = objc_alloc_init(MEMORY[0x1E4F5E090]);
    -[NSObject setShape:](v10, "setShape:", [v4 resolvedShape]);
    -[NSObject setFill:](v10, "setFill:", [v4 resolvedFill]);
    -[NSObject setContentEffect:](v10, "setContentEffect:", [v4 resolvedSymbolEffect]);
    -[NSObject setShapeEffect:](v10, "setShapeEffect:", [v4 resolvedEnclosureEffect]);
    [v4 symbolOffset];
    -[NSObject setImageOffset:](v10, "setImageOffset:");
    unint64_t v11 = 0x1E4F1C000uLL;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    double v13 = [v4 resolvedEnclosureColors];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v105 objects:v131 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v106 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((void *)&v105 + 1) + 8 * i), "cgColor"));
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v105 objects:v131 count:16];
      }
      while (v15);
    }

    [v10 setFillColors:v12];
    [v4 resolvedBorderWidth];
    -[NSObject setBorderWidth:](v10, "setBorderWidth:");
    double v18 = [v4 resolvedBorderColor];
    -[NSObject setBorderColor:](v10, "setBorderColor:", [v18 cgColor]);

    double v19 = [v5 vectorGlyph];
    uint64_t v20 = objc_msgSend(v4, "resolvedRenderingModeFromSuggestedMode:", objc_msgSend(v19, "preferredRenderingMode"));

    if (v20 == 1)
    {
      uint64_t v21 = [v4 resolvedSymbolColors];
      uint64_t v22 = [v21 objectAtIndexedSubscript:0];
      -[NSObject setMonochromeForegroundColor:](v10, "setMonochromeForegroundColor:", [v22 cgColor]);
    }
    uint64_t v23 = IFDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v96 = [(IFSymbol *)self name];
      cfa = [v10 fillColors];
      uint64_t v91 = [v10 shape];
      uint64_t v77 = [v10 fill];
      uint64_t v90 = [v10 contentEffect];
      v78 = [v10 monochromeForegroundColor];
      v79 = [v4 resolvedName];
      [v10 borderWidth];
      uint64_t v81 = v80;
      uint64_t v82 = [v10 borderColor];
      *(_DWORD *)buf = 138414594;
      v112 = v96;
      __int16 v113 = 2112;
      v114 = v10;
      __int16 v115 = 2112;
      uint64_t v116 = (uint64_t)cfa;
      __int16 v117 = 2048;
      uint64_t v118 = v91;
      __int16 v119 = 2048;
      uint64_t v120 = v77;
      __int16 v121 = 2048;
      uint64_t v122 = v90;
      __int16 v123 = 2112;
      v124 = v78;
      __int16 v125 = 2112;
      v126 = v79;
      __int16 v127 = 2048;
      uint64_t v128 = v81;
      __int16 v129 = 2112;
      uint64_t v130 = v82;
      v83 = (void *)v82;

      unint64_t v11 = 0x1E4F1C000;
    }

    double v24 = [v5 vectorGlyph];
    id v25 = [v24 graphicVariantWithOptions:v10];

    if (!v25)
    {
      double v33 = IFDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        [(IFSymbol *)self imageForGraphicSymbolDescriptor:v33];
      }

      goto LABEL_49;
    }
    if (v20 == 1)
    {
      [v4 scale];
      double v27 = v26;
      [v4 size];
      uint64_t v30 = (const void *)-[NSObject rasterizeImageUsingScaleFactor:forTargetSize:](v25, "rasterizeImageUsingScaleFactor:forTargetSize:", v27, v28, v29);
    }
    else
    {
      switch(v20)
      {
        case 2:
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke_26;
          v101[3] = &unk_1E6C9C3E0;
          id v47 = v4;
          id v102 = v47;
          v48 = (void *)MEMORY[0x1E01A15C0](v101);
          [v47 scale];
          double v50 = v49;
          [v47 size];
          uint64_t v30 = (const void *)-[NSObject rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:](v25, "rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:", v48, v50, v51, v52);

          v46 = v102;
          break;
        case 4:
          v95 = v25;
          id v53 = objc_alloc_init(*(Class *)(v11 + 2632));
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          v54 = [v4 resolvedSymbolColors];
          uint64_t v55 = [v54 countByEnumeratingWithState:&v97 objects:v109 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v98;
            do
            {
              for (uint64_t j = 0; j != v56; ++j)
              {
                if (*(void *)v98 != v57) {
                  objc_enumerationMutation(v54);
                }
                objc_msgSend(v53, "addObject:", objc_msgSend(*(id *)(*((void *)&v97 + 1) + 8 * j), "cgColor"));
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v97 objects:v109 count:16];
            }
            while (v56);
          }

          [v4 scale];
          double v60 = v59;
          [v4 size];
          id v25 = v95;
          uint64_t v30 = (const void *)-[NSObject rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:](v95, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:", v53, v60, v61, v62);

          uint64_t v20 = 4;
          goto LABEL_43;
        case 3:
          v34 = [v4 resolvedSymbolColors];
          v35 = [v34 objectAtIndexedSubscript:0];
          v36 = (CGColor *)[v35 cgColor];

          double Alpha = CGColorGetAlpha(v36);
          CGColorRef cf = CGColorCreateCopyWithAlpha(v36, Alpha * 0.5);
          CopyWithdouble Alpha = CGColorCreateCopyWithAlpha(v36, Alpha * 0.3);
          v110[0] = v36;
          v110[1] = cf;
          CGColorRef v39 = CopyWithAlpha;
          v110[2] = CopyWithAlpha;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:3];
          v103[0] = MEMORY[0x1E4F143A8];
          v103[1] = 3221225472;
          v103[2] = __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke;
          v103[3] = &unk_1E6C9C3B8;
          id v104 = v40;
          id v94 = v40;
          v41 = (void *)MEMORY[0x1E01A15C0](v103);
          [v4 scale];
          double v43 = v42;
          [v4 size];
          uint64_t v30 = (const void *)-[NSObject rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](v25, "rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:", v41, v43, v44, v45);
          if (cf) {
            CFRelease(cf);
          }
          if (v39) {
            CFRelease(v39);
          }

          v46 = v94;
          break;
        default:
          uint64_t v30 = 0;
          goto LABEL_43;
      }
    }
LABEL_43:
    [v10 setFillColors:0];
    [v10 setMonochromeForegroundColor:0];
    if (v30)
    {
      if (-[IFSymbol _shouldFlipFromSymbolImage:desiredDirection:](self, "_shouldFlipFromSymbolImage:desiredDirection:", v5, [v4 layoutDirection]))
      {
        [v4 size];
        double v64 = v63;
        double v66 = v65;
        [v4 scale];
        v68 = +[IFGraphicsContext bitmapContextWithSize:scale:preset:](IFGraphicsContext, "bitmapContextWithSize:scale:preset:", 0, v64, v66, v67);
        v69 = (CGContext *)[v68 cgContext];
        [v4 size];
        CGContextTranslateCTM(v69, v70, 0.0);
        CGContextScaleCTM((CGContextRef)[v68 cgContext], -1.0, 1.0);
        [v4 size];
        double v72 = v71;
        [v4 size];
        objc_msgSend(v68, "drawCGImage:centeredInRect:", v30, 0.0, 0.0, v72, v73);
        uint64_t v32 = [v68 image];
      }
      else
      {
        v75 = [IFImage alloc];
        [v4 scale];
        uint64_t v32 = -[IFImage initWithCGImage:scale:](v75, "initWithCGImage:scale:", v30);
      }
      CFRelease(v30);
      goto LABEL_52;
    }
    v74 = IFDefaultLog();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      v84 = [(IFSymbol *)self name];
      [v4 size];
      uint64_t v86 = v85;
      [v4 size];
      uint64_t v88 = v87;
      [v4 scale];
      *(_DWORD *)buf = 138413570;
      v112 = v84;
      __int16 v113 = 2112;
      v114 = v25;
      __int16 v115 = 2048;
      uint64_t v116 = v20;
      __int16 v117 = 2048;
      uint64_t v118 = v86;
      __int16 v119 = 2048;
      uint64_t v120 = v88;
      __int16 v121 = 2048;
      uint64_t v122 = v89;
    }
LABEL_49:
    uint64_t v32 = 0;
LABEL_52:

    goto LABEL_53;
  }
  uint64_t v10 = IFDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = [(IFSymbol *)self name];
    *(_DWORD *)buf = 138412290;
    v112 = v31;
  }
  uint64_t v32 = 0;
LABEL_53:

  return v32;
}

uint64_t __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    id v6 = IFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke_cold_1(a3, v6);
    }

    return [*(id *)(a1 + 32) lastObject];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  }
  return (uint64_t)v5;
}

uint64_t __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke_26(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = -[IFColor _initWithColorStr:appearance:contrast:vibrancy:]([IFColor alloc], "_initWithColorStr:appearance:contrast:vibrancy:", v5, [*(id *)(a1 + 32) appearance], objc_msgSend(*(id *)(a1 + 32), "contrast"), objc_msgSend(*(id *)(a1 + 32), "vibrancy"));

  if (v6 && [v6 cgColor]) {
    a3 = [v6 cgColor];
  }

  return a3;
}

- (BOOL)_shouldFlipFromSymbolImage:(id)a3 desiredDirection:(int64_t)a4
{
  id v5 = a3;
  if (![v5 isFlippable]) {
    goto LABEL_7;
  }
  if (a4 != 4)
  {
    if (a4 == 5 && [v5 layoutDirection] == 4) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  if ([v5 layoutDirection] != 5) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v6 = 1;
LABEL_8:

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)IFSymbol;
  id v4 = [(IFSymbol *)&v8 description];
  id v5 = [(IFSymbol *)self name];
  BOOL v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return v6;
}

- (NSURL)bundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)imageForGraphicSymbolDescriptor:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 name];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1DC6CA000, a3, OS_LOG_TYPE_ERROR, "Failed to create graphic variant image for %@ with options %@", (uint8_t *)&v6, 0x16u);
}

void __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DC6CA000, a2, OS_LOG_TYPE_DEBUG, "The hierarchy has more levels then supplied colours. Level: %lu", (uint8_t *)&v2, 0xCu);
}

@end