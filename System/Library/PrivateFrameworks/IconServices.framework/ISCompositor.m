@interface ISCompositor
- (BOOL)canUseCoreImage;
- (BOOL)canUseCoreImageForEffects;
- (CIContext)sharedCIContext;
- (ISCompositor)init;
- (ISCompositor)initWithRecipe:(id)a3;
- (ISCompositorRecipe)recipe;
- (NSMutableArray)elements;
- (id)filterForLayer:(id)a3 scale:(double)a4 resourceProvider:(id)a5;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (id)maskImageForLayer:(id)a3 size:(CGSize)a4 scale:(double)a5 resourceProvider:(id)a6;
- (id)scaledImageFromContent:(id)a3 size:(CGSize)a4 scale:(double)a5 needsScaled:(BOOL *)a6;
- (unint64_t)renderingMode;
- (void)addElement:(id)a3;
- (void)addElementWithRecipe:(id)a3 resources:(id)a4;
- (void)addResourcesFromDictionary:(id)a3;
- (void)clearResources;
- (void)dealloc;
- (void)drawElement:(id)a3 inContext:(id)a4;
- (void)drawInContext:(id)a3;
- (void)drawLayer:(id)a3 resourceProvider:(id)a4 inContext:(id)a5;
- (void)reset;
- (void)setElements:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setRenderingMode:(unint64_t)a3;
- (void)setResource:(id)a3 named:(id)a4;
@end

@implementation ISCompositor

- (ISCompositor)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISCompositor;
  v2 = [(ISCompositor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    elements = v2->_elements;
    v2->_elements = (NSMutableArray *)v3;

    v2->_renderingMode = 1;
  }
  return v2;
}

- (void)dealloc
{
  sharedCIContext = self->_sharedCIContext;
  if (sharedCIContext) {
    [sharedCIContext clearCaches];
  }
  v4.receiver = self;
  v4.super_class = (Class)ISCompositor;
  [(ISCompositor *)&v4 dealloc];
}

- (CIContext)sharedCIContext
{
  sharedCIContext = self->_sharedCIContext;
  if (!sharedCIContext)
  {
    objc_msgSend(MEMORY[0x1E4F1E018], "_IS_sharedIconCompositorContext");
    objc_super v4 = (CIContext *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sharedCIContext;
    self->_sharedCIContext = v4;

    sharedCIContext = self->_sharedCIContext;
  }
  return sharedCIContext;
}

- (void)addElementWithRecipe:(id)a3 resources:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_ISCompositorElement alloc] initWithRecipe:v7 resources:v6];

  [(ISCompositor *)self addElement:v8];
}

- (void)addElement:(id)a3
{
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F6F1D8], "bitmapContextWithSize:scale:preset:", 0, a3.width, a3.height, a4);
  [(ISCompositor *)self drawInContext:v5];
  id v6 = [v5 image];
  id v7 = objc_alloc(MEMORY[0x1E4F6F1E8]);
  uint64_t v8 = [v6 CGImage];
  [v6 scale];
  v9 = objc_msgSend(v7, "initWithCGImage:scale:", v8);

  return v9;
}

- (void)reset
{
  self->_elements = [MEMORY[0x1E4F1CA48] array];
  MEMORY[0x1F41817F8]();
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(unint64_t)a3
{
  self->_renderingMode = a3;
}

- (NSMutableArray)elements
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_sharedCIContext, 0);
}

- (ISCompositor)initWithRecipe:(id)a3
{
  id v4 = a3;
  v5 = [(ISCompositor *)self init];
  if (v5)
  {
    id v6 = [_ISCompositorElement alloc];
    id v7 = [(_ISCompositorElement *)v6 initWithRecipe:v4 resources:MEMORY[0x1E4F1CC08]];
    uint64_t v8 = [(ISCompositor *)v5 elements];
    [v8 addObject:v7];
  }
  return v5;
}

- (void)setRecipe:(id)a3
{
  id v4 = a3;
  v5 = [(ISCompositor *)self elements];
  id v6 = [v5 firstObject];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 setRecipe:v4];
    }
    else
    {
      v10 = _ISDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ISCompositor(Convenience) setRecipe:](v10);
      }
    }
  }
  else
  {
    id v7 = [_ISCompositorElement alloc];
    uint64_t v8 = [(_ISCompositorElement *)v7 initWithRecipe:v4 resources:MEMORY[0x1E4F1CC08]];
    v9 = [(ISCompositor *)self elements];
    [v9 addObject:v8];
  }
}

- (ISCompositorRecipe)recipe
{
  v2 = [(ISCompositor *)self elements];
  uint64_t v3 = [v2 firstObject];
  id v4 = [v3 recipe];

  return (ISCompositorRecipe *)v4;
}

- (void)setResource:(id)a3 named:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ISCompositor *)self elements];
  v9 = [v8 firstObject];

  if (!v9)
  {
    v10 = objc_alloc_init(ISGenericRecipe);
    [(ISCompositor *)self setRecipe:v10];

    v11 = [(ISCompositor *)self elements];
    v9 = [v11 firstObject];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 setResource:v6 forName:v7];
  }
  else
  {
    v12 = _ISDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ISCompositor(Convenience) setResource:named:]((uint64_t)v7, v12);
    }
  }
}

- (void)addResourcesFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(ISCompositor *)self elements];
  id v6 = [v5 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 addResourcesFromDictionary:v4];
  }
  else
  {
    id v7 = _ISDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ISCompositor(Convenience) addResourcesFromDictionary:](v4, v7);
    }
  }
}

- (void)clearResources
{
  v2 = [(ISCompositor *)self elements];
  uint64_t v3 = [v2 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 clearResources];
  }
  else
  {
    id v4 = _ISDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ISCompositor(Convenience) clearResources](v4);
    }
  }
}

- (void)drawInContext:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(ISCompositor *)self renderingMode]
    || [(ISCompositor *)self renderingMode] == 1
    || [(ISCompositor *)self renderingMode] == 2)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v5 = [(ISCompositor *)self elements];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v53 != v8) {
            objc_enumerationMutation(v5);
          }
          [(ISCompositor *)self drawElement:*(void *)(*((void *)&v52 + 1) + 8 * i) inContext:v4];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v7);
    }
    goto LABEL_31;
  }
  [v4 bounds];
  double v11 = v10;
  double v13 = v12;
  v41 = v4;
  [v4 scale];
  double v15 = v14;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = [(ISCompositor *)self elements];
  uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (!v16)
  {
    v5 = 0;
    goto LABEL_28;
  }
  uint64_t v17 = v16;
  v5 = 0;
  uint64_t v18 = *(void *)v49;
  uint64_t v42 = *MEMORY[0x1E4F1E418];
  uint64_t v43 = *MEMORY[0x1E4F1E480];
  do
  {
    for (uint64_t j = 0; j != v17; ++j)
    {
      if (*(void *)v49 != v18) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v48 + 1) + 8 * j);
      v21 = [v20 recipe];
      v22 = objc_msgSend(v21, "layerTreeForSize:scale:", v11, v13, v15);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [v22 effect];
        v24 = [v20 resourceProvider];
        id v25 = [(ISCompositor *)self filterForLayer:v22 scale:v24 resourceProvider:v15];

        if (v23)
        {
          v26 = [v5 outputImage];
          [v25 outputImage];
          v27 = self;
          uint64_t v28 = v17;
          v30 = uint64_t v29 = v18;
          uint64_t v45 = [v23 filterWithBackgroundImage:v26 inputImage:v30];

          uint64_t v18 = v29;
          uint64_t v17 = v28;
          self = v27;

          v5 = (void *)v45;
          goto LABEL_24;
        }
      }
      else
      {
        id v25 = 0;
      }
      if (v5)
      {
        v31 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
        v32 = [v25 outputImage];
        [v31 setValue:v32 forKey:v43];

        v33 = [v5 outputImage];
        [v31 setValue:v33 forKey:v42];

        v5 = v31;
      }
      else
      {
        id v25 = v25;
        v5 = v25;
      }
LABEL_24:
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  }
  while (v17);
LABEL_28:

  v34 = [v5 outputImage];
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, v15, v15);
  CGAffineTransform v46 = v47;
  v59.origin.double x = 0.0;
  v59.origin.double y = 0.0;
  v59.size.double width = v11;
  v59.size.double height = v13;
  CGRect v60 = CGRectApplyAffineTransform(v59, &v46);
  double x = v60.origin.x;
  double y = v60.origin.y;
  double width = v60.size.width;
  double height = v60.size.height;
  v39 = [(ISCompositor *)self sharedCIContext];
  v40 = (const void *)objc_msgSend(v39, "createCGImage:fromRect:", v34, x, y, width, height);

  id v4 = v41;
  if (v40)
  {
    objc_msgSend(v41, "drawCGImage:inRect:", v40, 0.0, 0.0, v11, v13);
    CFRelease(v40);
  }

LABEL_31:
}

- (id)filterForLayer:(id)a3 scale:(double)a4 resourceProvider:(id)a5
{
  v120[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v104 = a5;
  objc_opt_class();
  v96 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 content], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    v92 = 0;
    goto LABEL_38;
  }
  id v9 = v7;
  double v10 = [v9 content];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v12 = [v9 content];
  if (isKindOfClass)
  {
    uint64_t v13 = [v104 resourceNamed:v12];
    double v14 = v12;
    double v12 = (void *)v13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v88 = v12;
    if ([v12 conformsToProtocol:&unk_1F064C9C0])
    {
      v120[0] = v12;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:1];
    }
    else
    {
      if (![v12 conformsToProtocol:&unk_1F0658A18])
      {
        v19 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_14;
      }
      uint64_t v18 = [v12 resourceStack];
    }
    v19 = (void *)v18;
LABEL_14:
    v20 = objc_msgSend(v9, "backgroundColor", v88);

    if (v20)
    {
      id v15 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
      v21 = [v9 backgroundColor];
      v22 = [v21 ciColor];
      [v15 setValue:v22 forKey:*MEMORY[0x1E4F1E448]];
    }
    else
    {
      id v15 = 0;
    }
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    obuint64_t j = v19;
    id v97 = (id)[obj countByEnumeratingWithState:&v114 objects:v119 count:16];
    if (v97)
    {
      uint64_t v23 = *(void *)v115;
      uint64_t v24 = *MEMORY[0x1E4F1E480];
      uint64_t v93 = *MEMORY[0x1E4F1E508];
      uint64_t v94 = *MEMORY[0x1E4F1E4F0];
      unint64_t v25 = 0x1E4F1E000uLL;
      uint64_t v90 = *MEMORY[0x1E4F1E418];
      uint64_t v101 = *MEMORY[0x1E4F1E480];
      do
      {
        for (uint64_t i = 0; i != v97; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v115 != v23) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          [v9 size];
          uint64_t v28 = objc_msgSend(v27, "imageForSize:scale:");
          if (v28)
          {
            uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E050]), "initWithCGImage:", objc_msgSend(v28, "CGImage"));
            v105 = [*(id *)(v25 + 64) filterWithName:@"CILanczosScaleTransform"];
            v99 = (void *)v29;
            [v105 setValue:v29 forKey:v24];
            [v9 size];
            double v31 = v30 * a4;
            [v9 size];
            double v33 = v32 * a4;
            [v28 pixelSize];
            double v36 = 1.0;
            if (v34 != v31 || v35 != v33)
            {
              double v38 = v31 / v34;
              double v39 = v33 / v35;
              if (v38 >= v39) {
                double v36 = v39;
              }
              else {
                double v36 = v38;
              }
            }
            v40 = [NSNumber numberWithDouble:v36];
            [v105 setValue:v40 forKey:v94];

            [v28 pixelSize];
            double v42 = v41;
            double v44 = v43;
            CGAffineTransformMakeScale(&v113, v36, v36);
            double v45 = (v31 - (v44 * v113.c + v113.a * v42)) * 0.5;
            double v46 = (v33 - (v44 * v113.d + v113.b * v42)) * 0.5;
            CGAffineTransform v47 = [*(id *)(v25 + 64) filterWithName:@"CIAffineTransform"];
            memset(&v112, 0, sizeof(v112));
            [v9 position];
            CGFloat v49 = v45 + v48 * a4;
            [v9 position];
            CGAffineTransformMakeTranslation(&v112, v49, v46 + v50 * a4);
            long long v51 = [MEMORY[0x1E4F29238] valueWithBytes:&v112 objCType:"{CGAffineTransform=dddddd}"];
            [v47 setValue:v51 forKey:v93];
            long long v52 = [v105 outputImage];
            [v47 setValue:v52 forKey:v101];

            if (v15)
            {
              long long v53 = [*(id *)(v25 + 64) filterWithName:@"CISourceOverCompositing"];
              [v47 outputImage];
              id v54 = v9;
              v56 = uint64_t v55 = v23;
              [v53 setValue:v56 forKey:v101];

              v57 = [v15 outputImage];
              [v53 setValue:v57 forKey:v90];

              uint64_t v23 = v55;
              id v9 = v54;

              id v15 = v53;
            }
            else
            {
              id v15 = v47;
            }

            uint64_t v24 = v101;
            unint64_t v25 = 0x1E4F1E000;
          }
        }
        id v97 = (id)[obj countByEnumeratingWithState:&v114 objects:v119 count:16];
      }
      while (v97);
    }

    id v7 = v96;
    uint64_t v16 = v89;
    goto LABEL_37;
  }
  id v15 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
  [v12 ciColor];
  v17 = uint64_t v16 = v12;
  [v15 setValue:v17 forKey:*MEMORY[0x1E4F1E448]];

LABEL_37:
  v92 = v15;

LABEL_38:
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  uint64_t v58 = [v7 sublayers];
  uint64_t v106 = [v58 countByEnumeratingWithState:&v108 objects:v118 count:16];
  if (!v106)
  {

    id v59 = 0;
LABEL_54:
    v75 = v92;
    goto LABEL_55;
  }
  id v59 = 0;
  uint64_t v102 = *(void *)v109;
  uint64_t v60 = *MEMORY[0x1E4F1E480];
  uint64_t v100 = *MEMORY[0x1E4F1E508];
  uint64_t v95 = *MEMORY[0x1E4F1E418];
  id v98 = v58;
  do
  {
    for (uint64_t j = 0; j != v106; ++j)
    {
      if (*(void *)v109 != v102) {
        objc_enumerationMutation(v98);
      }
      v62 = [(ISCompositor *)self filterForLayer:*(void *)(*((void *)&v108 + 1) + 8 * j) scale:v104 resourceProvider:a4];
      if (v62)
      {
        v63 = [MEMORY[0x1E4F1E040] filterWithName:@"CICrop"];
        memset(&v112, 0, sizeof(v112));
        CGAffineTransformMakeScale(&v112, a4, a4);
        [v7 frame];
        CGAffineTransform v107 = v112;
        CGRect v123 = CGRectApplyAffineTransform(v122, &v107);
        v64 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", v123.origin.x, v123.origin.y, v123.size.width, v123.size.height);
        [v63 setValue:v64 forKey:@"inputRectangle"];

        v65 = [v62 outputImage];
        [v63 setValue:v65 forKey:v60];

        v66 = [MEMORY[0x1E4F1E040] filterWithName:@"CIAffineTransform"];
        memset(&v107, 0, sizeof(v107));
        [v7 position];
        CGFloat v68 = v67 * a4;
        [v7 position];
        CGAffineTransformMakeTranslation(&v107, v68, v69 * a4);
        v70 = [MEMORY[0x1E4F29238] valueWithBytes:&v107 objCType:"{CGAffineTransform=dddddd}"];
        [v66 setValue:v70 forKey:v100];
        v71 = [v63 outputImage];
        [v66 setValue:v71 forKey:v60];

        if (v59)
        {
          v72 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
          v73 = [v66 outputImage];
          [v72 setValue:v73 forKey:v60];

          v74 = [v59 outputImage];
          [v72 setValue:v74 forKey:v95];

          id v7 = v96;
          id v59 = v72;
        }
        else
        {
          id v59 = v66;
        }
      }
    }
    uint64_t v106 = [v98 countByEnumeratingWithState:&v108 objects:v118 count:16];
  }
  while (v106);

  if (!v59) {
    goto LABEL_54;
  }
  v75 = v92;
  if (v92)
  {
    v76 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
    v77 = [v59 outputImage];
    [v76 setValue:v77 forKey:v60];

    v78 = [v92 outputImage];
    [v76 setValue:v78 forKey:v95];

    goto LABEL_57;
  }
LABEL_55:
  v79 = [v59 outputImage];

  if (!v79) {
    goto LABEL_58;
  }
  id v59 = v59;
  v76 = v59;
LABEL_57:

  v75 = v76;
LABEL_58:
  v80 = v96;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v81 = v96;
    v82 = [v81 mask];
    v83 = [(ISCompositor *)self filterForLayer:v82 scale:v104 resourceProvider:a4];

    if (v83 && v75)
    {
      v84 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceInCompositing"];
      v85 = [v75 outputImage];
      [v84 setValue:v85 forKey:*MEMORY[0x1E4F1E480]];

      v86 = [v83 outputImage];
      [v84 setValue:v86 forKey:*MEMORY[0x1E4F1E418]];

      v75 = v84;
    }

    v80 = v96;
  }

  return v75;
}

- (BOOL)canUseCoreImage
{
  return [(ISCompositor *)self renderingMode] == 2
      || [(ISCompositor *)self renderingMode] == 3;
}

- (BOOL)canUseCoreImageForEffects
{
  unint64_t v3 = [(ISCompositor *)self renderingMode];
  if (v3 != 1) {
    LOBYTE(v3) = [(ISCompositor *)self renderingMode] == 2
  }
              || [(ISCompositor *)self renderingMode] == 3;
  return v3;
}

- (void)drawElement:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  [v7 scale];
  double v13 = v12;
  double v14 = [v6 recipe];
  id v15 = objc_msgSend(v14, "layerTreeForSize:scale:", v9, v11, v13);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v16 = 0;
LABEL_8:
    v37 = [v6 resourceProvider];
    [(ISCompositor *)self drawLayer:v15 resourceProvider:v37 inContext:v7];
    goto LABEL_9;
  }
  uint64_t v16 = [v15 effect];
  if (!v16 || ![(ISCompositor *)self canUseCoreImageForEffects]) {
    goto LABEL_8;
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F6F1D8], "bitmapContextWithSize:scale:preset:", 0, v9, v11, v13);
  uint64_t v18 = [v6 resourceProvider];
  [(ISCompositor *)self drawLayer:v15 resourceProvider:v18 inContext:v17];

  id v19 = objc_alloc(MEMORY[0x1E4F1E050]);
  v20 = [v17 image];
  uint64_t v21 = objc_msgSend(v19, "initWithCGImage:", objc_msgSend(v20, "CGImage"));

  id v22 = objc_alloc(MEMORY[0x1E4F1E050]);
  uint64_t v23 = [v7 image];
  uint64_t v24 = objc_msgSend(v22, "initWithCGImage:", objc_msgSend(v23, "CGImage"));

  unint64_t v25 = [v16 filterWithBackgroundImage:v24 inputImage:v21];
  v26 = [v25 outputImage];
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, v13, v13);
  CGAffineTransform v46 = v47;
  v48.origin.double x = 0.0;
  v48.origin.double y = 0.0;
  v48.size.double width = v9;
  v48.size.double height = v11;
  CGRect v49 = CGRectApplyAffineTransform(v48, &v46);
  if (v26)
  {
    double x = v49.origin.x;
    double y = v49.origin.y;
    double width = v49.size.width;
    double height = v49.size.height;
    [(ISCompositor *)self sharedCIContext];
    double v45 = v25;
    double v31 = (void *)v24;
    double v32 = v17;
    v34 = double v33 = (void *)v21;
    double v35 = (const void *)objc_msgSend(v34, "createCGImage:fromRect:", v26, x, y, width, height);

    double v36 = v33;
    v37 = v32;
    double v38 = v31;
    double v39 = v45;
    if (v35)
    {
      objc_msgSend(v7, "drawCGImage:inRect:", v35, 0.0, 0.0, v9, v11);
      CFRelease(v35);
    }
  }
  else
  {
    objc_msgSend(v6, "resourceProvider", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
    v40 = v25;
    double v41 = (void *)v24;
    double v42 = v17;
    v44 = double v43 = (void *)v21;
    [(ISCompositor *)self drawLayer:v15 resourceProvider:v44 inContext:v7];

    double v36 = v43;
    v37 = v42;
    double v38 = v41;
    double v39 = v40;
    v26 = 0;
  }

LABEL_9:
}

- (id)scaledImageFromContent:(id)a3 size:(CGSize)a4 scale:(double)a5 needsScaled:(BOOL *)a6
{
  double height = a4.height;
  double width = a4.width;
  double v11 = objc_msgSend(a3, "imageForSize:scale:");
  BOOL v12 = [(ISCompositor *)self canUseCoreImage];
  if (v12)
  {
    double v13 = width * a5;
    double v14 = height * a5;
    [v11 pixelSize];
    if (v15 != v13 || v16 != v14)
    {
      double v18 = v13 / v15;
      double v19 = v14 / v16;
      double v20 = v18 >= v19 ? v19 : v18;
      if (v20 != 1.0)
      {
        uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E050]), "initWithCGImage:", objc_msgSend(v11, "CGImage"));
        [v11 pixelSize];
        double v23 = v20 * v22;
        [v11 pixelSize];
        double v25 = v20 * v24;
        v26 = [MEMORY[0x1E4F1E040] filterWithName:@"CIAffineClamp"];
        uint64_t v27 = *MEMORY[0x1E4F1E480];
        [v26 setValue:v21 forKey:*MEMORY[0x1E4F1E480]];
        long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v53[0] = *MEMORY[0x1E4F1DAB8];
        v53[1] = v28;
        v53[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        uint64_t v29 = [MEMORY[0x1E4F29238] valueWithBytes:v53 objCType:"{CGAffineTransform=dddddd}"];
        [v26 setValue:v29 forKey:*MEMORY[0x1E4F1E508]];

        if (_os_feature_enabled_simple_impl())
        {
          double v30 = _ISDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            -[ISCompositor(Rendering) scaledImageFromContent:size:scale:needsScaled:](v30);
          }

          double v31 = [v26 outputImage];
          CGAffineTransformMakeScale(&v52, v20, v20);
          uint64_t v32 = [v31 imageByApplyingTransform:&v52 highQualityDownsample:1];
        }
        else
        {
          double v31 = [MEMORY[0x1E4F1E040] filterWithName:@"CILanczosScaleTransform"];
          double v33 = [v26 outputImage];
          [v31 setValue:v33 forKey:v27];

          double v34 = [NSNumber numberWithDouble:v20];
          [v31 setValue:v34 forKey:*MEMORY[0x1E4F1E4F0]];

          uint64_t v32 = [v31 outputImage];
        }
        double v35 = (void *)v32;

        double v36 = [MEMORY[0x1E4F1E040] filterWithName:@"CICrop"];
        v37 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", 0.0, 0.0, v23, v25);
        [v36 setValue:v37 forKey:@"inputRectangle"];

        [v36 setValue:v35 forKey:v27];
        double v38 = [v36 outputImage];
        double v39 = v38;
        if (v38)
        {
          [v38 extent];
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;
          CGRect v48 = [(ISCompositor *)self sharedCIContext];
          CGRect v49 = (const void *)objc_msgSend(v48, "createCGImage:fromRect:", v39, v41, v43, v45, v47);

          if (v49)
          {
            [v11 CGImage];
            if (CGImageGetProperty() == *MEMORY[0x1E4F1CFD0]) {
              CGImageSetProperty();
            }
            uint64_t v50 = [objc_alloc(MEMORY[0x1E4F6F1E8]) initWithCGImage:v49 scale:a5];

            CFRelease(v49);
            double v11 = (void *)v50;
          }
        }
      }
    }
  }
  if (a6) {
    *a6 = !v12;
  }
  return v11;
}

- (id)maskImageForLayer:(id)a3 size:(CGSize)a4 scale:(double)a5 resourceProvider:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  BOOL v12 = [a3 mask];
  if (v12)
  {
    double v13 = objc_msgSend(MEMORY[0x1E4F6F1D8], "bitmapContextWithSize:scale:preset:", 0, width, height, a5);
    [(ISCompositor *)self drawLayer:v12 resourceProvider:v11 inContext:v13];
    double v14 = [v13 image];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (void)drawLayer:(id)a3 resourceProvider:(id)a4 inContext:(id)a5
{
  v165[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 pushState];
  [v10 scale];
  double v12 = v11;
  [v8 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  long long v124 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)obuint64_t j = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v162.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v162.c = v124;
  long long v122 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v162.tdouble x = v122;
  [v10 scale];
  double v22 = v21;
  if (v10)
  {
    [v10 transform];
    double v23 = *(double *)&v161;
    [v10 transform];
    double v24 = *((double *)&v158 + 1);
  }
  else
  {
    long long v161 = 0u;
    long long v160 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    double v24 = 0.0;
    double v23 = 0.0;
  }
  double v25 = v23 / v22;
  double v26 = v24 / v22;
  if ([v8 flipped] == 3)
  {
    *(_OWORD *)&t2.a = *(_OWORD *)obj;
    *(_OWORD *)&t2.c = v124;
    *(_OWORD *)&t2.tdouble x = v122;
    CGAffineTransformTranslate(&v162, &t2, v22 * v25, v22 * v26);
    CGAffineTransform v154 = v162;
    CGAffineTransformScale(&t2, &v154, -1.0, -1.0);
    CGAffineTransform v162 = t2;
    CGAffineTransform v154 = t2;
    CGAffineTransformTranslate(&t2, &v154, -((v18 + v25) * v22), -((v20 + v26) * v22));
    CGAffineTransform v162 = t2;
    if (v10) {
      [v10 transform];
    }
    else {
      memset(&v152, 0, sizeof(v152));
    }
    CGAffineTransformTranslate(&v153, &v152, -v14, -v16);
    CGAffineTransform v151 = v153;
    uint64_t v27 = &v151;
  }
  else if ([v8 flipped] == 1)
  {
    CGAffineTransform v154 = v162;
    CGAffineTransformTranslate(&t2, &v154, 0.0, v22 * v26);
    CGAffineTransform v162 = t2;
    CGAffineTransform v154 = t2;
    CGAffineTransformScale(&t2, &v154, 1.0, -1.0);
    CGAffineTransform v162 = t2;
    CGAffineTransform v154 = t2;
    CGAffineTransformTranslate(&t2, &v154, 0.0, -((v20 + v26) * v22));
    CGAffineTransform v162 = t2;
    if (v10) {
      [v10 transform];
    }
    else {
      memset(&v149, 0, sizeof(v149));
    }
    CGAffineTransformTranslate(&v150, &v149, v14, -v16);
    CGAffineTransform v148 = v150;
    uint64_t v27 = &v148;
  }
  else if ([v8 flipped] == 2)
  {
    CGAffineTransform v154 = v162;
    CGAffineTransformTranslate(&t2, &v154, v22 * v25, 0.0);
    CGAffineTransform v162 = t2;
    CGAffineTransform v154 = t2;
    CGAffineTransformScale(&t2, &v154, -1.0, 1.0);
    CGAffineTransform v162 = t2;
    CGAffineTransform v154 = t2;
    CGAffineTransformTranslate(&t2, &v154, -((v18 + v25) * v22), 0.0);
    CGAffineTransform v162 = t2;
    if (v10) {
      [v10 transform];
    }
    else {
      memset(&v146, 0, sizeof(v146));
    }
    CGAffineTransformTranslate(&v147, &v146, -v14, v16);
    CGAffineTransform v145 = v147;
    uint64_t v27 = &v145;
  }
  else
  {
    if (v10) {
      [v10 transform];
    }
    else {
      memset(&v143, 0, sizeof(v143));
    }
    CGAffineTransformTranslate(&v144, &v143, v14, v16);
    CGAffineTransform v142 = v144;
    uint64_t v27 = &v142;
  }
  [v10 setTransform:v27];
  if (v10) {
    [v10 transform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGAffineTransform t2 = v162;
  CGAffineTransformConcat(&v141, &t1, &t2);
  CGAffineTransform v139 = v141;
  [v10 setTransform:&v139];
  [v8 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v36 = -[ISCompositor maskImageForLayer:size:scale:resourceProvider:](self, "maskImageForLayer:size:scale:resourceProvider:", v8, v9, v32, v34, v12);
  objc_msgSend(v10, "clipToMaskCGImage:inRect:", objc_msgSend(v36, "CGImage"), v29, v31, v33, v35);
  id v37 = v10;
  v121 = v36;
  if (v36
    || ([v8 effect], double v38 = objc_claimAutoreleasedReturnValue(), v38, v39 = v37, v38))
  {
    double v40 = (void *)MEMORY[0x1E4F6F1D8];
    [v37 scale];
    double v39 = objc_msgSend(v40, "bitmapContextWithSize:scale:preset:", objc_msgSend(v37, "preset"), v33, v35, v41);
  }
  objc_opt_class();
  CGRect v123 = v37;
  if (objc_opt_isKindOfClass())
  {
    double v42 = [v8 content];

    if (v42)
    {
      id v43 = v8;
      double v44 = [v43 content];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      double v46 = [v43 content];
      if (isKindOfClass)
      {
        uint64_t v47 = [v9 resourceNamed:v46];
      }
      else
      {
        objc_opt_class();
        char v59 = objc_opt_isKindOfClass();

        double v46 = [v43 content];
        if ((v59 & 1) == 0)
        {
LABEL_51:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v39 setFillColor:v46];
            objc_msgSend(v39, "fillRect:", v29, v31, v33, v35);
            goto LABEL_81;
          }
          if (objc_opt_respondsToSelector())
          {
            v165[0] = v46;
            uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:1];
          }
          else
          {
            if (![v46 conformsToProtocol:&unk_1F0658A18])
            {
              v64 = (void *)MEMORY[0x1E4F1CBF0];
              goto LABEL_64;
            }
            uint64_t v60 = [v46 resourceStack];
          }
          v64 = (void *)v60;
LABEL_64:
          long long v116 = v46;
          id v120 = v8;
          id v66 = v43;
          double v67 = objc_msgSend(v43, "backgroundColor", v116, v10);

          if (v67)
          {
            CGFloat v68 = [v43 backgroundColor];
            [v39 setFillColor:v68];

            objc_msgSend(v39, "fillRect:", v29, v31, v33, v35);
          }
          char v69 = [v43 acceptSymbol];
          long long v135 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id obja = v64;
          uint64_t v70 = [obja countByEnumeratingWithState:&v135 objects:v164 count:16];
          if (v70)
          {
            uint64_t v71 = v70;
            v72 = v66;
            uint64_t v73 = *(void *)v136;
            unint64_t v74 = 0x1E4F6F000uLL;
            do
            {
              uint64_t v75 = 0;
              uint64_t v125 = v71;
              do
              {
                if (*(void *)v136 != v73) {
                  objc_enumerationMutation(obja);
                }
                uint64_t v76 = *(void *)(*((void *)&v135 + 1) + 8 * v75);
                objc_opt_class();
                if (v69 & 1 | ((objc_opt_isKindOfClass() & 1) == 0))
                {
                  LOBYTE(t2.a) = 0;
                  [v72 size];
                  v77 = -[ISCompositor scaledImageFromContent:size:scale:needsScaled:](self, "scaledImageFromContent:size:scale:needsScaled:", v76, &t2);
                  v78 = v77;
                  if (v77)
                  {
                    uint64_t v79 = v73;
                    v80 = self;
                    id v81 = v9;
                    unint64_t v82 = v74;
                    v83 = v72;
                    int a_low = LOBYTE(t2.a);
                    uint64_t v85 = [v77 CGImage];
                    if (a_low) {
                      objc_msgSend(v39, "drawCGImage:inRect:", v85, v29, v31, v33, v35);
                    }
                    else {
                      objc_msgSend(v39, "drawCGImage:centeredInRect:", v85, v29, v31, v33, v35);
                    }
                    v72 = v83;
                    unint64_t v74 = v82;
                    id v9 = v81;
                    self = v80;
                    uint64_t v73 = v79;
                    uint64_t v71 = v125;
                  }
                }
                ++v75;
              }
              while (v71 != v75);
              uint64_t v71 = [obja countByEnumeratingWithState:&v135 objects:v164 count:16];
            }
            while (v71);
          }

          id v10 = v118;
          id v8 = v120;
          double v46 = v117;
          goto LABEL_81;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v65 = [v46 name];
          uint64_t v48 = [v9 resourceNamed:v65];

          goto LABEL_34;
        }
        uint64_t v47 = [v9 resourceForKey:v46];
      }
      uint64_t v48 = v47;
LABEL_34:

      double v46 = (void *)v48;
      goto LABEL_51;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v49 = v8;
    double v46 = [v49 text];
    uint64_t v50 = [v9 resourceNamed:v46];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v51 = v50;

      double v46 = v51;
    }
    if (ISIsResourceKey(v46))
    {

      double v46 = 0;
    }
    else if (v46)
    {
      [v39 pushState];
      v57 = [v49 color];
      [v39 setStrokeColor:v57];

      uint64_t v58 = [v49 fontName];
      [v49 fontSize];
      objc_msgSend(v39, "drawText:fontName:fontSize:inRect:", v46, v58);

      [v39 popState];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_82;
    }
    id v119 = v8;
    id v52 = v8;
    long long v53 = [v52 symbol];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v54 = [v9 resourceNamed:v53];

      long long v53 = (void *)v54;
    }
    objc_opt_class();
    id v55 = v10;
    if (objc_opt_isKindOfClass()) {
      id v56 = v53;
    }
    else {
      id v56 = 0;
    }
    id v61 = objc_alloc_init(MEMORY[0x1E4F6F220]);
    [v52 fontSize];
    objc_msgSend(v61, "setPointSize:");
    [v61 setScale:v12];
    objc_msgSend(v61, "setSymbolSize:", objc_msgSend(v52, "symbolSize"));
    objc_msgSend(v61, "setSymbolWeight:", objc_msgSend(v52, "symbolWeight"));
    double v46 = v56;
    v62 = [v56 imageForDescriptor:v61];
    if (v62)
    {
      [v39 pushState];
      v63 = [v52 color];
      [v39 setStrokeColor:v63];

      objc_msgSend(v39, "drawSymbolImage:centeredInRect:", v62, v29, v31, v33, v35);
      [v39 popState];
    }

    id v8 = v119;
    id v10 = v55;
  }
LABEL_81:

LABEL_82:
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v86 = [v8 sublayers];
  uint64_t v87 = [v86 countByEnumeratingWithState:&v131 objects:v163 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v132;
    do
    {
      for (uint64_t i = 0; i != v88; ++i)
      {
        if (*(void *)v132 != v89) {
          objc_enumerationMutation(v86);
        }
        v91 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        [v39 pushState];
        objc_msgSend(v39, "setBlendMode:", objc_msgSend(v91, "blendMode"));
        [(ISCompositor *)self drawLayer:v91 resourceProvider:v9 inContext:v39];
        [v39 popState];
      }
      uint64_t v88 = [v86 countByEnumeratingWithState:&v131 objects:v163 count:16];
    }
    while (v88);
  }

  v92 = v123;
  if (v39 != v123)
  {
    uint64_t v93 = [v8 effect];
    if (v93)
    {
      uint64_t v94 = (void *)v93;
      uint64_t v95 = [v8 superlayer];
      if (v95)
      {
        v96 = (void *)v95;
        BOOL v97 = [(ISCompositor *)self canUseCoreImageForEffects];

        if (v97)
        {
          id v98 = objc_alloc(MEMORY[0x1E4F1E050]);
          v99 = [v39 image];
          uint64_t v100 = objc_msgSend(v98, "initWithCGImage:", objc_msgSend(v99, "CGImage"));

          [v123 pushState];
          [v123 bounds];
          double v102 = v101;
          [v123 scale];
          double v104 = v103 * v102;
          if (v10) {
            [v123 transform];
          }
          else {
            memset(&v129, 0, sizeof(v129));
          }
          t2.c = 0.0;
          t2.a = 1.0;
          t2.b = 0.0;
          *(_OWORD *)&t2.d = xmmword_1AE7C0DF0;
          t2.tdouble y = v104;
          CGAffineTransformConcat(&v130, &v129, &t2);
          CGAffineTransform v128 = v130;
          [v123 setTransform:&v128];
          v105 = objc_msgSend(v123, "imageFromRect:", v29, v31, v33, v35);
          [v123 popState];
          uint64_t v106 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E050]), "initWithCGImage:", objc_msgSend(v105, "CGImage"));
          CGAffineTransform v107 = [v8 effect];
          long long v108 = [v107 filterWithBackgroundImage:v106 inputImage:v100];

          if (v108)
          {
            uint64_t v109 = [v108 outputImage];

            memset(&t2, 0, sizeof(t2));
            CGAffineTransformMakeScale(&t2, v12, v12);
            CGAffineTransform v154 = t2;
            v166.origin.double x = 0.0;
            v166.origin.double y = 0.0;
            v166.size.double width = v33;
            v166.size.double height = v35;
            CGRect v167 = CGRectApplyAffineTransform(v166, &v154);
            double x = v167.origin.x;
            double y = v167.origin.y;
            double width = v167.size.width;
            double height = v167.size.height;
            long long v114 = [(ISCompositor *)self sharedCIContext];
            long long v115 = (const void *)objc_msgSend(v114, "createCGImage:fromRect:", v109, x, y, width, height);

            v92 = v123;
            if (v115)
            {
              objc_msgSend(v123, "drawCGImage:centeredInRect:", v115, v29, v31, v33, v35);
              CFRelease(v115);
            }
            uint64_t v100 = (void *)v109;
            goto LABEL_105;
          }
        }
        else
        {
          uint64_t v100 = 0;
        }
        v92 = v123;
LABEL_104:
        long long v108 = [v39 image];
        objc_msgSend(v92, "drawCGImage:centeredInRect:", objc_msgSend(v108, "CGImage"), v29, v31, v33, v35);
LABEL_105:

        goto LABEL_106;
      }
    }
    uint64_t v100 = 0;
    goto LABEL_104;
  }
LABEL_106:
  [v92 popState];
}

@end