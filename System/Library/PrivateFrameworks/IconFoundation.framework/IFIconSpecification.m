@interface IFIconSpecification
+ (id)defaultIconSpecification;
+ (id)iosAppIconSpecification;
+ (id)iosDocumentGlyphSpecification;
+ (id)iosDocumentIconSpecification;
+ (id)iosMessagesAppIconSpecification;
+ (id)macosDocumentIconSpecification;
+ (id)macosIconSpecification;
+ (id)macosTemplateIconSpecification;
+ (id)rOSAppIconSpecification;
+ (id)tvAppIconSpecification;
+ (id)watchAppIconSpecification;
- (CGSize)maxSize;
- (CGSize)minSize;
- (IFIconSpecification)init;
- (NSArray)allImageSpecifications;
- (NSArray)allVariants;
- (NSArray)imageSpecifications;
- (NSArray)variants;
- (NSString)name;
- (double)maxScale;
- (double)minScale;
- (id)_initWithName:(id)a3 imageSpecifiactions:(id)a4 variants:(id)a5;
- (id)description;
- (id)imageSpecificationForSize:(CGSize)a3 scale:(double)a4;
- (id)imageSpecificationsMatchingPredicate:(id)a3;
- (id)imageSpecificationsWithTags:(id)a3 withoutTags:(id)a4;
@end

@implementation IFIconSpecification

+ (id)defaultIconSpecification
{
  return +[IFIconSpecification iosAppIconSpecification];
}

- (double)maxScale
{
  return self->_maxScale;
}

- (CGSize)maxSize
{
  objc_copyStruct(v4, &self->_maxSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)iosAppIconSpecification
{
  if (iosAppIconSpecification_onceToken != -1) {
    dispatch_once(&iosAppIconSpecification_onceToken, &__block_literal_global_81);
  }
  double v2 = (void *)iosAppIconSpecification_iconSpecification;

  return v2;
}

void __60__IFIconSpecification_Constructors__iosAppIconSpecification__block_invoke()
{
  v116[24] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  v115 = @"IFImageSpecificationTagOptional";
  v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
  v86 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v87, 20.0, 20.0, 1.0);
  v116[0] = v86;
  v1 = [IFImageSpecification alloc];
  v114 = @"IFImageSpecificationTagOptional";
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
  v84 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v85, 29.0, 29.0, 1.0);
  v116[1] = v84;
  double v2 = [IFImageSpecification alloc];
  v113 = @"IFImageSpecificationTagOptional";
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
  v82 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v83, 40.0, 40.0, 1.0);
  v116[2] = v82;
  double v3 = [IFImageSpecification alloc];
  v112[0] = @"IFImageSpecificationTagHomeScreen";
  v112[1] = @"IFImageSpecificationTagOptional";
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:2];
  v80 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v81, 60.0, 60.0, 1.0);
  v116[3] = v80;
  v4 = [IFImageSpecification alloc];
  v111[0] = @"IFImageSpecificationTagHomeScreen";
  v111[1] = @"IFImageSpecificationTagOptional";
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:2];
  v78 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v79, 76.0, 76.0, 1.0);
  v116[4] = v78;
  v5 = [IFImageSpecification alloc];
  v110[0] = @"IFImageSpecificationTagAppStore";
  v110[1] = @"IFImageSpecificationTagRequired";
  v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
  v76 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v77, 1024.0, 1024.0, 1.0);
  v116[5] = v76;
  v6 = [IFImageSpecification alloc];
  v109 = @"IFImageSpecificationTagRecomended";
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
  v74 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v75, 20.0, 20.0, 2.0);
  v116[6] = v74;
  v7 = [IFImageSpecification alloc];
  v108 = @"IFImageSpecificationTagOptional";
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
  v72 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v73, 29.0, 29.0, 2.0);
  v116[7] = v72;
  v8 = [IFImageSpecification alloc];
  v107 = @"IFImageSpecificationTagOptional";
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  v70 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v71, 38.0, 38.0, 2.0);
  v116[8] = v70;
  v9 = [IFImageSpecification alloc];
  v106 = @"IFImageSpecificationTagRecomended";
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
  v68 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v69, 40.0, 40.0, 2.0);
  v116[9] = v68;
  v10 = [IFImageSpecification alloc];
  v105[0] = @"IFImageSpecificationTagHomeScreen";
  v105[1] = @"IFImageSpecificationTagRecomended";
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
  v66 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v67, 60.0, 60.0, 2.0);
  v116[10] = v66;
  v11 = [IFImageSpecification alloc];
  v104[0] = @"IFImageSpecificationTagHomeScreen";
  v104[1] = @"IFImageSpecificationTagRecomended";
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
  v64 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v65, 64.0, 64.0, 2.0);
  v116[11] = v64;
  v12 = [IFImageSpecification alloc];
  v103 = @"IFImageSpecificationTagHomeScreen";
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
  v62 = -[IFImageSpecification initWithSize:scale:tags:](v12, "initWithSize:scale:tags:", v63, 68.0, 68.0, 2.0);
  v116[12] = v62;
  v13 = [IFImageSpecification alloc];
  v102[0] = @"IFImageSpecificationTagHomeScreen";
  v102[1] = @"IFImageSpecificationTagRecomended";
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
  v60 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v61, 76.0, 76.0, 2.0);
  v116[13] = v60;
  v14 = [IFImageSpecification alloc];
  v101[0] = @"IFImageSpecificationTagHomeScreen";
  v101[1] = @"IFImageSpecificationTagRecomended";
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
  v57 = -[IFImageSpecification initWithSize:scale:tags:](v14, "initWithSize:scale:tags:", v58, 83.5, 83.5, 2.0);
  v116[14] = v57;
  v15 = [IFImageSpecification alloc];
  v100 = @"IFImageSpecificationTagOptional";
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
  v55 = -[IFImageSpecification initWithSize:scale:tags:](v15, "initWithSize:scale:tags:", v56, 176.0, 176.0, 2.0);
  v116[15] = v55;
  v16 = [IFImageSpecification alloc];
  v99 = @"IFImageSpecificationTagRecomended";
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
  v53 = -[IFImageSpecification initWithSize:scale:tags:](v16, "initWithSize:scale:tags:", v54, 20.0, 20.0, 3.0);
  v116[16] = v53;
  v17 = [IFImageSpecification alloc];
  v98 = @"IFImageSpecificationTagOptional";
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
  v51 = -[IFImageSpecification initWithSize:scale:tags:](v17, "initWithSize:scale:tags:", v52, 29.0, 29.0, 3.0);
  v116[17] = v51;
  v18 = [IFImageSpecification alloc];
  v97 = @"IFImageSpecificationTagOptional";
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
  v49 = -[IFImageSpecification initWithSize:scale:tags:](v18, "initWithSize:scale:tags:", v50, 38.0, 38.0, 3.0);
  v116[18] = v49;
  v19 = [IFImageSpecification alloc];
  v96 = @"IFImageSpecificationTagRecomended";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  v21 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v20, 40.0, 40.0, 3.0);
  v116[19] = v21;
  v22 = [IFImageSpecification alloc];
  v95[0] = @"IFImageSpecificationTagHomeScreen";
  v95[1] = @"IFImageSpecificationTagRecomended";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
  v24 = -[IFImageSpecification initWithSize:scale:tags:](v22, "initWithSize:scale:tags:", v23, 60.0, 60.0, 3.0);
  v116[20] = v24;
  v25 = [IFImageSpecification alloc];
  v94[0] = @"IFImageSpecificationTagHomeScreen";
  v94[1] = @"IFImageSpecificationTagRecomended";
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
  v27 = -[IFImageSpecification initWithSize:scale:tags:](v25, "initWithSize:scale:tags:", v26, 64.0, 64.0, 3.0);
  v116[21] = v27;
  v28 = [IFImageSpecification alloc];
  v29 = -[IFImageSpecification initWithSize:scale:tags:](v28, "initWithSize:scale:tags:", MEMORY[0x1E4F1CBF0], 76.0, 76.0, 3.0);
  v116[22] = v29;
  v30 = [IFImageSpecification alloc];
  v93 = @"IFImageSpecificationTagOptional";
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
  v32 = -[IFImageSpecification initWithSize:scale:tags:](v30, "initWithSize:scale:tags:", v31, 176.0, 176.0, 3.0);
  v116[23] = v32;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:24];

  v33 = [IFImageSpecification alloc];
  v91 = @"IFImageSpecificationTagOptional";
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  v35 = -[IFImageSpecification initWithSize:scale:tags:](v33, "initWithSize:scale:tags:", v34, 60.0, 60.0, 1.0);
  v92[0] = v35;
  v36 = [IFImageSpecification alloc];
  v90 = @"IFImageSpecificationTagRecomended";
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
  v38 = -[IFImageSpecification initWithSize:scale:tags:](v36, "initWithSize:scale:tags:", v37, 60.0, 60.0, 2.0);
  v92[1] = v38;
  v39 = [IFImageSpecification alloc];
  v89 = @"IFImageSpecificationTagRequired";
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v41 = -[IFImageSpecification initWithSize:scale:tags:](v39, "initWithSize:scale:tags:", v40, 60.0, 60.0, 3.0);
  v92[2] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:3];

  v43 = [ISVariantIconSpecification alloc];
  id v44 = [(IFIconSpecification *)v43 _initWithName:@"Template Icon" imageSpecifiactions:v42 variants:MEMORY[0x1E4F1CBF0]];

  v45 = [IFIconSpecification alloc];
  id v88 = v44;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  uint64_t v47 = [(IFIconSpecification *)v45 _initWithName:@"Application Icon" imageSpecifiactions:v59 variants:v46];
  v48 = (void *)iosAppIconSpecification_iconSpecification;
  iosAppIconSpecification_iconSpecification = v47;
}

uint64_t __66__IFIconSpecification__initWithName_imageSpecifiactions_variants___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 scale];
  double v7 = v6;
  [v5 scale];
  if (v7 < v8)
  {
LABEL_5:
    uint64_t v12 = -1;
    goto LABEL_6;
  }
  [v4 scale];
  double v10 = v9;
  [v5 scale];
  if (v10 <= v11)
  {
    [v4 dimension];
    double v14 = v13;
    [v5 dimension];
    if (v14 >= v15)
    {
      [v4 dimension];
      double v18 = v17;
      [v5 dimension];
      uint64_t v12 = v18 > v19;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v12 = 1;
LABEL_6:

  return v12;
}

- (id)_initWithName:(id)a3 imageSpecifiactions:(id)a4 variants:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v82.receiver = self;
  v82.super_class = (Class)IFIconSpecification;
  double v11 = [(IFIconSpecification *)&v82 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 sortedArrayUsingComparator:&__block_literal_global_1];
    imageSpecifications = v11->_imageSpecifications;
    v11->_imageSpecifications = (NSArray *)v14;

    v16 = objc_opt_new();
    if ([(NSArray *)v11->_imageSpecifications count])
    {
      unint64_t v17 = 0;
      do
      {
        double v18 = [(NSArray *)v11->_imageSpecifications objectAtIndexedSubscript:v17];
        if (v17)
        {
          double v19 = [(NSArray *)v11->_imageSpecifications objectAtIndexedSubscript:v17 - 1];
        }
        else
        {
          double v19 = 0;
        }
        if (++v17 >= [(NSArray *)v11->_imageSpecifications count])
        {
          v20 = 0;
        }
        else
        {
          v20 = [(NSArray *)v11->_imageSpecifications objectAtIndexedSubscript:v17];
        }
        [v18 setSmallerSpecification:v19];
        [v19 setLargerSpecification:v18];
        [v18 setLargerSpecification:v20];
        [v20 setSmallerSpecification:v18];
        [v18 scale];
        double v22 = v21;
        [v19 scale];
        if (v22 != v23 || ([v18 scale], double v25 = v24, objc_msgSend(v20, "scale"), v25 != v26)) {
          [v16 addObject:v18];
        }
      }
      while (v17 < [(NSArray *)v11->_imageSpecifications count]);
    }
    id v76 = v9;
    id v77 = v8;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v27 = v16;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v78 objects:v83 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v79 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          v33 = objc_msgSend(v32, "smallerSpecification", v76, v77, (void)v78);
          v34 = [v32 largerSpecification];
          [v32 scale];
          double v36 = v35;
          [v33 scale];
          if (v36 != v37)
          {
            if (v33)
            {
              do
              {
                [v33 scale];
                double v39 = v38;
                [v32 scale];
                if (v39 == v40) {
                  break;
                }
                [v33 dimension];
                double v42 = v41;
                [v33 scale];
                double v44 = v42 * v43;
                [v32 dimension];
                double v46 = v45;
                [v32 scale];
                if (v44 < v46 * v47) {
                  break;
                }
                uint64_t v48 = [v33 smallerSpecification];

                v33 = (void *)v48;
              }
              while (v48);
            }
            [v32 setSmallerSpecification:v33];
          }
          [v32 scale];
          double v50 = v49;
          [v34 scale];
          if (v50 != v51)
          {
            if (v34)
            {
              do
              {
                [v34 scale];
                double v53 = v52;
                [v32 scale];
                if (v53 == v54) {
                  break;
                }
                [v34 dimension];
                double v56 = v55;
                [v34 scale];
                double v58 = v56 * v57;
                [v32 dimension];
                double v60 = v59;
                [v32 scale];
                if (v58 > v60 * v61) {
                  break;
                }
                uint64_t v62 = [v34 largerSpecification];

                v34 = (void *)v62;
              }
              while (v62);
            }
            [v32 setLargerSpecification:v34];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v78 objects:v83 count:16];
      }
      while (v29);
    }

    v63 = [(NSArray *)v11->_imageSpecifications lastObject];
    [v63 size];
    v11->_maxSize.width = v64;
    v11->_maxSize.height = v65;

    v66 = [(NSArray *)v11->_imageSpecifications firstObject];
    [v66 size];
    v11->_minSize.width = v67;
    v11->_minSize.height = v68;

    v69 = [(NSArray *)v11->_imageSpecifications lastObject];
    [v69 scale];
    v11->_maxScale = v70;

    v71 = [(NSArray *)v11->_imageSpecifications firstObject];
    [v71 scale];
    v11->_minScale = v72;

    uint64_t v73 = [v10 copy];
    variants = v11->_variants;
    v11->_variants = (NSArray *)v73;

    id v9 = v76;
    id v8 = v77;
  }

  return v11;
}

- (IFIconSpecification)init
{
  v11.receiver = self;
  v11.super_class = (Class)IFIconSpecification;
  double v2 = [(IFIconSpecification *)&v11 init];
  double v3 = v2;
  if (v2)
  {
    imageSpecifications = v2->_imageSpecifications;
    v2->_imageSpecifications = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_maxSize = 0u;
    v3->_minSize = 0u;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v3->_maxScale = _Q0;
  }
  return v3;
}

- (id)imageSpecificationForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = [(NSArray *)self->_imageSpecifications lastObject];
  [v8 scale];
  double v10 = v9;

  if (v10 >= a4) {
    double v10 = a4;
  }
  if (width <= height) {
    double width = height;
  }
  objc_super v11 = [(NSArray *)self->_imageSpecifications firstObject];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = self->_imageSpecifications;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
LABEL_7:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(v12);
      }
      unint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
      objc_msgSend(v17, "scale", (void)v28);
      if (v18 >= v10)
      {
        [v17 size];
        double v20 = v19;
        [v17 size];
        double v22 = v21;
        [v17 size];
        double v25 = v20 <= v22 ? v24 : v23;
        id v26 = v17;

        objc_super v11 = v26;
        if (v25 >= width) {
          break;
        }
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        id v26 = v11;
        if (v14) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
  else
  {
    id v26 = v11;
  }

  return v26;
}

- (NSArray)allImageSpecifications
{
  double v2 = (void *)[(NSArray *)self->_imageSpecifications copy];

  return (NSArray *)v2;
}

- (NSArray)allVariants
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(IFIconSpecification *)self variants];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v3 addObject:v9];
        double v10 = [v9 allVariants];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  objc_super v11 = (void *)[v3 copy];

  return (NSArray *)v11;
}

- (id)imageSpecificationsMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IFIconSpecification *)self allImageSpecifications];
  uint64_t v6 = [v5 filteredArrayUsingPredicate:v4];

  return v6;
}

- (id)imageSpecificationsWithTags:(id)a3 withoutTags:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 containsObject:@"IFImageSpecificationTagAll"];
  double v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];

  [v9 addObject:@"IFImageSpecificationTagInternal"];
  if (v8)
  {
    char v10 = [v7 containsObject:@"IFImageSpecificationTagPrivate"];

    if ((v10 & 1) == 0) {
      [v9 addObject:@"IFImageSpecificationTagPrivate"];
    }
    objc_super v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(tags, $tag, $tag IN %@).@count == 0", v9];
  }
  else
  {
    objc_super v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(tags, $tag, $tag IN %@).@count > 0 && SUBQUERY(tags, $tag, $tag IN %@).@count == 0", v7, v9];
  }
  uint64_t v12 = [(IFIconSpecification *)self imageSpecificationsMatchingPredicate:v11];

  return v12;
}

- (id)description
{
  return [(NSArray *)self->_imageSpecifications description];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (CGSize)minSize
{
  objc_copyStruct(v4, &self->_minSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)minScale
{
  return self->_minScale;
}

- (NSArray)variants
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)imageSpecifications
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSpecifications, 0);
  objc_storeStrong((id *)&self->_variants, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)macosIconSpecification
{
  if (macosIconSpecification_onceToken != -1) {
    dispatch_once(&macosIconSpecification_onceToken, &__block_literal_global_62);
  }
  double v2 = (void *)macosIconSpecification_iconSpecification;

  return v2;
}

void __59__IFIconSpecification_Constructors__macosIconSpecification__block_invoke()
{
  v98[14] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  v97 = @"IFImageSpecificationTagRequired";
  double v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
  double v70 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v72, 16.0, 16.0, 1.0);
  v98[0] = v70;
  v1 = [IFImageSpecification alloc];
  v96[0] = @"IFImageSpecificationTagOptional";
  v96[1] = @"IFImageSpecificationTagInternal";
  CGFloat v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
  v66 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v68, 18.0, 18.0, 1.0);
  v98[1] = v66;
  double v2 = [IFImageSpecification alloc];
  v95[0] = @"IFImageSpecificationTagOptional";
  v95[1] = @"IFImageSpecificationTagInternal";
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
  double v61 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v63, 24.0, 24.0, 1.0);
  v98[2] = v61;
  double v3 = [IFImageSpecification alloc];
  v94 = @"IFImageSpecificationTagRequired";
  double v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
  double v57 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v59, 32.0, 32.0, 1.0);
  v98[3] = v57;
  id v4 = [IFImageSpecification alloc];
  v93 = @"IFImageSpecificationTagRecomended";
  double v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
  double v55 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v56, 128.0, 128.0, 1.0);
  v98[4] = v55;
  uint64_t v5 = [IFImageSpecification alloc];
  v92 = @"IFImageSpecificationTagOptional";
  double v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
  double v53 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v54, 256.0, 256.0, 1.0);
  v98[5] = v53;
  id v6 = [IFImageSpecification alloc];
  v91 = @"IFImageSpecificationTagRequired";
  double v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  double v51 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v52, 512.0, 512.0, 1.0);
  v98[6] = v51;
  id v7 = [IFImageSpecification alloc];
  v90 = @"IFImageSpecificationTagRequired";
  double v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
  double v49 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v50, 16.0, 16.0, 2.0);
  v98[7] = v49;
  int v8 = [IFImageSpecification alloc];
  v89[0] = @"IFImageSpecificationTagOptional";
  v89[1] = @"IFImageSpecificationTagInternal";
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
  double v47 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v48, 18.0, 18.0, 2.0);
  v98[8] = v47;
  double v9 = [IFImageSpecification alloc];
  v88[0] = @"IFImageSpecificationTagOptional";
  v88[1] = @"IFImageSpecificationTagInternal";
  double v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
  double v45 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v46, 24.0, 24.0, 2.0);
  v98[9] = v45;
  char v10 = [IFImageSpecification alloc];
  v87 = @"IFImageSpecificationTagRequired";
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  uint64_t v12 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v11, 32.0, 32.0, 2.0);
  v98[10] = v12;
  long long v13 = [IFImageSpecification alloc];
  v86 = @"IFImageSpecificationTagRecomended";
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  long long v15 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v14, 128.0, 128.0, 2.0);
  v98[11] = v15;
  long long v16 = [IFImageSpecification alloc];
  v85 = @"IFImageSpecificationTagOptional";
  unint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  uint64_t v18 = -[IFImageSpecification initWithSize:scale:tags:](v16, "initWithSize:scale:tags:", v17, 256.0, 256.0, 2.0);
  v98[12] = v18;
  double v19 = [IFImageSpecification alloc];
  v84[0] = @"IFImageSpecificationTagRequired";
  v84[1] = @"IFImageSpecificationTagAppStore";
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  double v21 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v20, 512.0, 512.0, 2.0);
  v98[13] = v21;
  CGFloat v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:14];

  double v22 = [IFImageSpecification alloc];
  objc_super v82 = @"IFImageSpecificationTagRequired";
  uint64_t v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  v71 = -[IFImageSpecification initWithSize:scale:tags:](v22, "initWithSize:scale:tags:", v73, 16.0, 16.0, 1.0);
  v83[0] = v71;
  double v23 = [IFImageSpecification alloc];
  long long v81 = @"IFImageSpecificationTagRequired";
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  CGFloat v67 = -[IFImageSpecification initWithSize:scale:tags:](v23, "initWithSize:scale:tags:", v69, 18.0, 18.0, 1.0);
  v83[1] = v67;
  double v24 = [IFImageSpecification alloc];
  long long v80 = @"IFImageSpecificationTagRequired";
  CGFloat v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  uint64_t v62 = -[IFImageSpecification initWithSize:scale:tags:](v24, "initWithSize:scale:tags:", v64, 24.0, 24.0, 1.0);
  v83[2] = v62;
  double v25 = [IFImageSpecification alloc];
  long long v79 = @"IFImageSpecificationTagOptional";
  double v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  double v58 = -[IFImageSpecification initWithSize:scale:tags:](v25, "initWithSize:scale:tags:", v60, 32.0, 32.0, 1.0);
  v83[3] = v58;
  id v26 = [IFImageSpecification alloc];
  long long v78 = @"IFImageSpecificationTagRequired";
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
  long long v28 = -[IFImageSpecification initWithSize:scale:tags:](v26, "initWithSize:scale:tags:", v27, 16.0, 16.0, 2.0);
  v83[4] = v28;
  long long v29 = [IFImageSpecification alloc];
  id v77 = @"IFImageSpecificationTagRequired";
  long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
  long long v31 = -[IFImageSpecification initWithSize:scale:tags:](v29, "initWithSize:scale:tags:", v30, 18.0, 18.0, 2.0);
  v83[5] = v31;
  v32 = [IFImageSpecification alloc];
  id v76 = @"IFImageSpecificationTagRequired";
  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  v34 = -[IFImageSpecification initWithSize:scale:tags:](v32, "initWithSize:scale:tags:", v33, 24.0, 24.0, 2.0);
  v83[6] = v34;
  double v35 = [IFImageSpecification alloc];
  v75 = @"IFImageSpecificationTagOptional";
  double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  double v37 = -[IFImageSpecification initWithSize:scale:tags:](v35, "initWithSize:scale:tags:", v36, 32.0, 32.0, 2.0);
  v83[7] = v37;
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:8];

  double v39 = [ISVariantIconSpecification alloc];
  id v40 = [(IFIconSpecification *)v39 _initWithName:@"Template Icon" imageSpecifiactions:v38 variants:MEMORY[0x1E4F1CBF0]];

  double v41 = [IFIconSpecification alloc];
  id v74 = v40;
  double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  uint64_t v43 = [(IFIconSpecification *)v41 _initWithName:@"Application Icon" imageSpecifiactions:v65 variants:v42];
  double v44 = (void *)macosIconSpecification_iconSpecification;
  macosIconSpecification_iconSpecification = v43;
}

+ (id)macosDocumentIconSpecification
{
  if (macosDocumentIconSpecification_onceToken != -1) {
    dispatch_once(&macosDocumentIconSpecification_onceToken, &__block_literal_global_74);
  }
  double v2 = (void *)macosDocumentIconSpecification_iconSpecification;

  return v2;
}

void __67__IFIconSpecification_Constructors__macosDocumentIconSpecification__block_invoke()
{
  v82[10] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  long long v81 = @"IFImageSpecificationTagRequired";
  double v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  double v57 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v59, 16.0, 16.0, 1.0);
  v82[0] = v57;
  v1 = [IFImageSpecification alloc];
  long long v80 = @"IFImageSpecificationTagRequired";
  double v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  double v53 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v55, 32.0, 32.0, 1.0);
  v82[1] = v53;
  double v2 = [IFImageSpecification alloc];
  long long v79 = @"IFImageSpecificationTagOptional";
  double v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  double v49 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v51, 128.0, 128.0, 1.0);
  v82[2] = v49;
  double v3 = [IFImageSpecification alloc];
  long long v78 = @"IFImageSpecificationTagOptional";
  double v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
  double v45 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v47, 256.0, 256.0, 1.0);
  v82[3] = v45;
  id v4 = [IFImageSpecification alloc];
  id v77 = @"IFImageSpecificationTagOptional";
  double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
  uint64_t v43 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v44, 512.0, 512.0, 1.0);
  v82[4] = v43;
  uint64_t v5 = [IFImageSpecification alloc];
  id v76 = @"IFImageSpecificationTagRequired";
  double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  double v41 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v42, 16.0, 16.0, 2.0);
  v82[5] = v41;
  id v6 = [IFImageSpecification alloc];
  v75 = @"IFImageSpecificationTagRequired";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  int v8 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v7, 32.0, 32.0, 2.0);
  v82[6] = v8;
  double v9 = [IFImageSpecification alloc];
  id v74 = @"IFImageSpecificationTagRecomended";
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  objc_super v11 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v10, 128.0, 128.0, 2.0);
  v82[7] = v11;
  uint64_t v12 = [IFImageSpecification alloc];
  uint64_t v73 = @"IFImageSpecificationTagOptional";
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
  long long v14 = -[IFImageSpecification initWithSize:scale:tags:](v12, "initWithSize:scale:tags:", v13, 256.0, 256.0, 2.0);
  v82[8] = v14;
  long long v15 = [IFImageSpecification alloc];
  double v72 = @"IFImageSpecificationTagRequired";
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  unint64_t v17 = -[IFImageSpecification initWithSize:scale:tags:](v15, "initWithSize:scale:tags:", v16, 512.0, 512.0, 2.0);
  v82[9] = v17;
  double v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:10];

  uint64_t v18 = [IFImageSpecification alloc];
  double v70 = @"IFImageSpecificationTagRequired";
  double v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  double v58 = -[IFImageSpecification initWithSize:scale:tags:](v18, "initWithSize:scale:tags:", v60, 16.0, 16.0, 1.0);
  v71[0] = v58;
  double v19 = [IFImageSpecification alloc];
  v69 = @"IFImageSpecificationTagRequired";
  double v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  double v54 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v56, 18.0, 18.0, 1.0);
  v71[1] = v54;
  double v20 = [IFImageSpecification alloc];
  CGFloat v68 = @"IFImageSpecificationTagRequired";
  double v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  double v50 = -[IFImageSpecification initWithSize:scale:tags:](v20, "initWithSize:scale:tags:", v52, 24.0, 24.0, 1.0);
  v71[2] = v50;
  double v21 = [IFImageSpecification alloc];
  CGFloat v67 = @"IFImageSpecificationTagOptional";
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  double v46 = -[IFImageSpecification initWithSize:scale:tags:](v21, "initWithSize:scale:tags:", v48, 32.0, 32.0, 1.0);
  v71[3] = v46;
  double v22 = [IFImageSpecification alloc];
  v66 = @"IFImageSpecificationTagRequired";
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  double v24 = -[IFImageSpecification initWithSize:scale:tags:](v22, "initWithSize:scale:tags:", v23, 16.0, 16.0, 2.0);
  v71[4] = v24;
  double v25 = [IFImageSpecification alloc];
  CGFloat v65 = @"IFImageSpecificationTagRequired";
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  id v27 = -[IFImageSpecification initWithSize:scale:tags:](v25, "initWithSize:scale:tags:", v26, 18.0, 18.0, 2.0);
  v71[5] = v27;
  long long v28 = [IFImageSpecification alloc];
  CGFloat v64 = @"IFImageSpecificationTagRequired";
  long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  long long v30 = -[IFImageSpecification initWithSize:scale:tags:](v28, "initWithSize:scale:tags:", v29, 24.0, 24.0, 2.0);
  v71[6] = v30;
  long long v31 = [IFImageSpecification alloc];
  v63 = @"IFImageSpecificationTagOptional";
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  uint64_t v33 = -[IFImageSpecification initWithSize:scale:tags:](v31, "initWithSize:scale:tags:", v32, 32.0, 32.0, 2.0);
  v71[7] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:8];

  double v35 = [ISVariantIconSpecification alloc];
  id v36 = [(IFIconSpecification *)v35 _initWithName:@"Template Icon" imageSpecifiactions:v34 variants:MEMORY[0x1E4F1CBF0]];

  double v37 = [IFIconSpecification alloc];
  id v62 = v36;
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  uint64_t v39 = [(IFIconSpecification *)v37 _initWithName:@"Document Icon" imageSpecifiactions:v61 variants:v38];
  id v40 = (void *)macosDocumentIconSpecification_iconSpecification;
  macosDocumentIconSpecification_iconSpecification = v39;
}

+ (id)macosTemplateIconSpecification
{
  if (macosTemplateIconSpecification_onceToken != -1) {
    dispatch_once(&macosTemplateIconSpecification_onceToken, &__block_literal_global_79);
  }
  double v2 = (void *)macosTemplateIconSpecification_iconSpecification;

  return v2;
}

void __67__IFIconSpecification_Constructors__macosTemplateIconSpecification__block_invoke()
{
  v36[8] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  double v35 = @"IFImageSpecificationTagRequired";
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  id v26 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v27, 16.0, 16.0, 1.0);
  v36[0] = v26;
  v1 = [IFImageSpecification alloc];
  v34 = @"IFImageSpecificationTagRequired";
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  double v24 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v25, 18.0, 18.0, 1.0);
  v36[1] = v24;
  double v2 = [IFImageSpecification alloc];
  uint64_t v33 = @"IFImageSpecificationTagRequired";
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  double v22 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v23, 24.0, 24.0, 1.0);
  v36[2] = v22;
  double v3 = [IFImageSpecification alloc];
  v32 = @"IFImageSpecificationTagOptional";
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  double v20 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v21, 32.0, 32.0, 1.0);
  v36[3] = v20;
  id v4 = [IFImageSpecification alloc];
  long long v31 = @"IFImageSpecificationTagRequired";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  id v6 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v5, 16.0, 16.0, 2.0);
  v36[4] = v6;
  id v7 = [IFImageSpecification alloc];
  long long v30 = @"IFImageSpecificationTagRequired";
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  double v9 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v8, 18.0, 18.0, 2.0);
  v36[5] = v9;
  char v10 = [IFImageSpecification alloc];
  long long v29 = @"IFImageSpecificationTagRequired";
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  uint64_t v12 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v11, 24.0, 24.0, 2.0);
  v36[6] = v12;
  long long v13 = [IFImageSpecification alloc];
  long long v28 = @"IFImageSpecificationTagOptional";
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  long long v15 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v14, 32.0, 32.0, 2.0);
  v36[7] = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:8];

  unint64_t v17 = [IFIconSpecification alloc];
  uint64_t v18 = [(IFIconSpecification *)v17 _initWithName:@"Template Icon" imageSpecifiactions:v16 variants:MEMORY[0x1E4F1CBF0]];
  double v19 = (void *)macosTemplateIconSpecification_iconSpecification;
  macosTemplateIconSpecification_iconSpecification = v18;
}

+ (id)iosDocumentGlyphSpecification
{
  if (iosDocumentGlyphSpecification_onceToken != -1) {
    dispatch_once(&iosDocumentGlyphSpecification_onceToken, &__block_literal_global_83);
  }
  double v2 = (void *)iosDocumentGlyphSpecification_iconSpecification;

  return v2;
}

void __66__IFIconSpecification_Constructors__iosDocumentGlyphSpecification__block_invoke()
{
  v28[6] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  id v27 = @"IFImageSpecificationTagRequired";
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  double v20 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v21, 20.0, 20.0, 1.0);
  v28[0] = v20;
  v1 = [IFImageSpecification alloc];
  id v26 = @"IFImageSpecificationTagRequired";
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  uint64_t v18 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v19, 144.0, 144.0, 1.0);
  v28[1] = v18;
  double v2 = [IFImageSpecification alloc];
  double v25 = @"IFImageSpecificationTagRequired";
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  id v4 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v3, 20.0, 20.0, 2.0);
  v28[2] = v4;
  uint64_t v5 = [IFImageSpecification alloc];
  double v24 = @"IFImageSpecificationTagRequired";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v7 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v6, 144.0, 144.0, 2.0);
  v28[3] = v7;
  int v8 = [IFImageSpecification alloc];
  double v23 = @"IFImageSpecificationTagRequired";
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  char v10 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v9, 20.0, 20.0, 3.0);
  v28[4] = v10;
  objc_super v11 = [IFImageSpecification alloc];
  double v22 = @"IFImageSpecificationTagRequired";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  long long v13 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v12, 144.0, 144.0, 3.0);
  v28[5] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];

  long long v15 = [IFIconSpecification alloc];
  uint64_t v16 = [(IFIconSpecification *)v15 _initWithName:@"Document Glyph" imageSpecifiactions:v14 variants:MEMORY[0x1E4F1CBF0]];
  unint64_t v17 = (void *)iosDocumentGlyphSpecification_iconSpecification;
  iosDocumentGlyphSpecification_iconSpecification = v16;
}

+ (id)iosDocumentIconSpecification
{
  if (iosDocumentIconSpecification_onceToken != -1) {
    dispatch_once(&iosDocumentIconSpecification_onceToken, &__block_literal_global_88);
  }
  double v2 = (void *)iosDocumentIconSpecification_iconSpecification;

  return v2;
}

void __65__IFIconSpecification_Constructors__iosDocumentIconSpecification__block_invoke()
{
  v64[15] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  v63[0] = @"IFImageSpecificationTagRequired";
  v63[1] = @"IFImageSpecificationTagPrivate";
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  double v47 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v48, 34.0);
  v64[0] = v47;
  v1 = [IFImageSpecification alloc];
  v62[0] = @"IFImageSpecificationTagRequired";
  v62[1] = @"IFImageSpecificationTagPrivate";
  double v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  double v45 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v46, 37.0);
  v64[1] = v45;
  double v2 = [IFImageSpecification alloc];
  v61[0] = @"IFImageSpecificationTagRequired";
  v61[1] = @"IFImageSpecificationTagPrivate";
  double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  uint64_t v43 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v44, 64.0, 84.0, 1.0);
  v64[2] = v43;
  double v3 = [IFImageSpecification alloc];
  v60[0] = @"IFImageSpecificationTagRequired";
  v60[1] = @"IFImageSpecificationTagPrivate";
  double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  double v41 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v42, 96.0, 128.0, 1.0);
  v64[3] = v41;
  id v4 = [IFImageSpecification alloc];
  v59[0] = @"IFImageSpecificationTagRequired";
  v59[1] = @"IFImageSpecificationTagPrivate";
  id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  uint64_t v39 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v40, 240.0, 320.0, 1.0);
  v64[4] = v39;
  uint64_t v5 = [IFImageSpecification alloc];
  v58[0] = @"IFImageSpecificationTagRequired";
  v58[1] = @"IFImageSpecificationTagPrivate";
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  double v37 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v38, 34.0, 44.0, 2.0);
  v64[5] = v37;
  id v6 = [IFImageSpecification alloc];
  v57[0] = @"IFImageSpecificationTagRequired";
  v57[1] = @"IFImageSpecificationTagPrivate";
  id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  double v35 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v36, 37.0, 48.0, 2.0);
  v64[6] = v35;
  id v7 = [IFImageSpecification alloc];
  v56[0] = @"IFImageSpecificationTagRequired";
  v56[1] = @"IFImageSpecificationTagPrivate";
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  uint64_t v33 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v34, 64.0, 84.0, 2.0);
  v64[7] = v33;
  int v8 = [IFImageSpecification alloc];
  v55[0] = @"IFImageSpecificationTagRequired";
  v55[1] = @"IFImageSpecificationTagPrivate";
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  long long v31 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v32, 96.0, 128.0, 2.0);
  v64[8] = v31;
  double v9 = [IFImageSpecification alloc];
  v54[0] = @"IFImageSpecificationTagRequired";
  v54[1] = @"IFImageSpecificationTagPrivate";
  long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  long long v29 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v30, 240.0, 320.0, 2.0);
  v64[9] = v29;
  char v10 = [IFImageSpecification alloc];
  v53[0] = @"IFImageSpecificationTagRequired";
  v53[1] = @"IFImageSpecificationTagPrivate";
  long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  id v27 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v28, 34.0, 44.0, 3.0);
  v64[10] = v27;
  objc_super v11 = [IFImageSpecification alloc];
  v52[0] = @"IFImageSpecificationTagRequired";
  v52[1] = @"IFImageSpecificationTagPrivate";
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  uint64_t v12 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v26, 37.0, 48.0, 3.0);
  v64[11] = v12;
  long long v13 = [IFImageSpecification alloc];
  v51[0] = @"IFImageSpecificationTagRequired";
  v51[1] = @"IFImageSpecificationTagPrivate";
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  long long v15 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v14, 64.0, 84.0, 3.0);
  v64[12] = v15;
  uint64_t v16 = [IFImageSpecification alloc];
  v50[0] = @"IFImageSpecificationTagRequired";
  v50[1] = @"IFImageSpecificationTagPrivate";
  unint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  uint64_t v18 = -[IFImageSpecification initWithSize:scale:tags:](v16, "initWithSize:scale:tags:", v17, 96.0, 128.0, 3.0);
  v64[13] = v18;
  double v19 = [IFImageSpecification alloc];
  v49[0] = @"IFImageSpecificationTagRequired";
  v49[1] = @"IFImageSpecificationTagPrivate";
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  double v21 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v20, 240.0, 320.0, 3.0);
  v64[14] = v21;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:15];

  double v23 = [IFIconSpecification alloc];
  uint64_t v24 = [(IFIconSpecification *)v23 _initWithName:@"Document Icon" imageSpecifiactions:v22 variants:MEMORY[0x1E4F1CBF0]];
  double v25 = (void *)iosDocumentIconSpecification_iconSpecification;
  iosDocumentIconSpecification_iconSpecification = v24;
}

+ (id)iosMessagesAppIconSpecification
{
  if (iosMessagesAppIconSpecification_onceToken != -1) {
    dispatch_once(&iosMessagesAppIconSpecification_onceToken, &__block_literal_global_90);
  }
  double v2 = (void *)iosMessagesAppIconSpecification_iconSpecification;

  return v2;
}

void __68__IFIconSpecification_Constructors__iosMessagesAppIconSpecification__block_invoke()
{
  v44[10] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  uint64_t v43 = @"IFImageSpecificationTagRequired";
  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v32 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v33, 27.0, 20.0, 2.0);
  v44[0] = v32;
  v1 = [IFImageSpecification alloc];
  double v42 = @"IFImageSpecificationTagRequired";
  long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  long long v30 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v31, 32.0, 24.0, 2.0);
  v44[1] = v30;
  double v2 = [IFImageSpecification alloc];
  double v41 = @"IFImageSpecificationTagRequired";
  long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  long long v28 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v29, 60.0, 45.0, 2.0);
  v44[2] = v28;
  double v3 = [IFImageSpecification alloc];
  id v40 = @"IFImageSpecificationTagRequired";
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  id v26 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v27, 67.0, 50.0, 2.0);
  v44[3] = v26;
  id v4 = [IFImageSpecification alloc];
  uint64_t v39 = @"IFImageSpecificationTagRequired";
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  uint64_t v24 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v25, 74.0, 55.0, 2.0);
  v44[4] = v24;
  uint64_t v5 = [IFImageSpecification alloc];
  double v38 = @"IFImageSpecificationTagRequired";
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  double v22 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v23, 27.0, 20.0, 3.0);
  v44[5] = v22;
  id v6 = [IFImageSpecification alloc];
  double v37 = @"IFImageSpecificationTagRequired";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  int v8 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v7, 32.0, 24.0, 3.0);
  v44[6] = v8;
  double v9 = [IFImageSpecification alloc];
  id v36 = @"IFImageSpecificationTagRequired";
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  objc_super v11 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v10, 60.0, 45.0, 3.0);
  v44[7] = v11;
  uint64_t v12 = [IFImageSpecification alloc];
  double v35 = @"IFImageSpecificationTagRequired";
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  long long v14 = -[IFImageSpecification initWithSize:scale:tags:](v12, "initWithSize:scale:tags:", v13, 67.0, 50.0, 3.0);
  v44[8] = v14;
  long long v15 = [IFImageSpecification alloc];
  v34 = @"IFImageSpecificationTagRequired";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  unint64_t v17 = -[IFImageSpecification initWithSize:scale:tags:](v15, "initWithSize:scale:tags:", v16, 74.0, 55.0, 3.0);
  v44[9] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:10];

  double v19 = [IFIconSpecification alloc];
  uint64_t v20 = [(IFIconSpecification *)v19 _initWithName:@"Messages Application Icon" imageSpecifiactions:v18 variants:MEMORY[0x1E4F1CBF0]];
  double v21 = (void *)iosMessagesAppIconSpecification_iconSpecification;
  iosMessagesAppIconSpecification_iconSpecification = v20;
}

+ (id)watchAppIconSpecification
{
  if (watchAppIconSpecification_onceToken != -1) {
    dispatch_once(&watchAppIconSpecification_onceToken, &__block_literal_global_95);
  }
  double v2 = (void *)watchAppIconSpecification_iconSpecification;

  return v2;
}

void __62__IFIconSpecification_Constructors__watchAppIconSpecification__block_invoke()
{
  v72[17] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  v71[0] = @"IFImageSpecificationTagAppStore";
  v71[1] = @"IFImageSpecificationTagRequired";
  double v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  double v53 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v54, 1024.0, 1024.0, 1.0);
  v72[0] = v53;
  v1 = [IFImageSpecification alloc];
  double v70 = @"IFImageSpecificationTagRequired";
  double v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  double v51 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v52, 24.0, 24.0, 2.0);
  v72[1] = v51;
  double v2 = [IFImageSpecification alloc];
  v69 = @"IFImageSpecificationTagRequired";
  double v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  double v49 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v50, 27.5, 27.5, 2.0);
  v72[2] = v49;
  double v3 = [IFImageSpecification alloc];
  CGFloat v68 = @"IFImageSpecificationTagRequired";
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  double v47 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v48, 29.0, 29.0, 2.0);
  v72[3] = v47;
  id v4 = [IFImageSpecification alloc];
  CGFloat v67 = @"IFImageSpecificationTagRequired";
  double v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  double v45 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v46, 33.0, 33.0, 2.0);
  v72[4] = v45;
  uint64_t v5 = [IFImageSpecification alloc];
  v66[0] = @"IFImageSpecificationTagHomeScreen";
  v66[1] = @"IFImageSpecificationTagRequired";
  double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  uint64_t v43 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v44, 40.0, 40.0, 2.0);
  v72[5] = v43;
  id v6 = [IFImageSpecification alloc];
  v65[0] = @"IFImageSpecificationTagHomeScreen";
  v65[1] = @"IFImageSpecificationTagRequired";
  double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  double v41 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v42, 44.0, 44.0, 2.0);
  v72[6] = v41;
  id v7 = [IFImageSpecification alloc];
  v64[0] = @"IFImageSpecificationTagHomeScreen";
  v64[1] = @"IFImageSpecificationTagRequired";
  id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  uint64_t v39 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v40, 46.0, 46.0, 2.0);
  v72[7] = v39;
  int v8 = [IFImageSpecification alloc];
  v63[0] = @"IFImageSpecificationTagHomeScreen";
  v63[1] = @"IFImageSpecificationTagRequired";
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  double v37 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v38, 50.0, 50.0, 2.0);
  v72[8] = v37;
  double v9 = [IFImageSpecification alloc];
  v62[0] = @"IFImageSpecificationTagHomeScreen";
  v62[1] = @"IFImageSpecificationTagRequired";
  id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  double v35 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v36, 51.0, 51.0, 2.0);
  v72[9] = v35;
  char v10 = [IFImageSpecification alloc];
  v61[0] = @"IFImageSpecificationTagHomeScreen";
  v61[1] = @"IFImageSpecificationTagRequired";
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  uint64_t v33 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v34, 54.0, 54.0, 2.0);
  v72[10] = v33;
  objc_super v11 = [IFImageSpecification alloc];
  double v60 = @"IFImageSpecificationTagRequired";
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  long long v31 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v32, 86.0, 86.0, 2.0);
  v72[11] = v31;
  uint64_t v12 = [IFImageSpecification alloc];
  double v59 = @"IFImageSpecificationTagRequired";
  long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  long long v29 = -[IFImageSpecification initWithSize:scale:tags:](v12, "initWithSize:scale:tags:", v30, 98.0, 98.0, 2.0);
  v72[12] = v29;
  long long v13 = [IFImageSpecification alloc];
  double v58 = @"IFImageSpecificationTagRequired";
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  long long v15 = -[IFImageSpecification initWithSize:scale:tags:](v13, "initWithSize:scale:tags:", v14, 108.0, 108.0, 2.0);
  v72[13] = v15;
  uint64_t v16 = [IFImageSpecification alloc];
  double v57 = @"IFImageSpecificationTagRequired";
  unint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
  uint64_t v18 = -[IFImageSpecification initWithSize:scale:tags:](v16, "initWithSize:scale:tags:", v17, 117.0, 117.0, 2.0);
  v72[14] = v18;
  double v19 = [IFImageSpecification alloc];
  double v56 = @"IFImageSpecificationTagRequired";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  double v21 = -[IFImageSpecification initWithSize:scale:tags:](v19, "initWithSize:scale:tags:", v20, 129.0, 129.0, 2.0);
  v72[15] = v21;
  double v22 = [IFImageSpecification alloc];
  double v55 = @"IFImageSpecificationTagRequired";
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  uint64_t v24 = -[IFImageSpecification initWithSize:scale:tags:](v22, "initWithSize:scale:tags:", v23, 29.0, 29.0, 3.0);
  v72[16] = v24;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:17];

  id v26 = [IFIconSpecification alloc];
  uint64_t v27 = [(IFIconSpecification *)v26 _initWithName:@"Application Icon" imageSpecifiactions:v25 variants:MEMORY[0x1E4F1CBF0]];
  long long v28 = (void *)watchAppIconSpecification_iconSpecification;
  watchAppIconSpecification_iconSpecification = v27;
}

+ (id)tvAppIconSpecification
{
  if (tvAppIconSpecification_onceToken != -1) {
    dispatch_once(&tvAppIconSpecification_onceToken, &__block_literal_global_97);
  }
  double v2 = (void *)tvAppIconSpecification_iconSpecification;

  return v2;
}

void __59__IFIconSpecification_Constructors__tvAppIconSpecification__block_invoke()
{
  v32[7] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  v31[0] = @"IFImageSpecificationTagHomeScreen";
  v31[1] = @"IFImageSpecificationTagRequired";
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  double v23 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v24, 250.0, 150.0, 1.0);
  v32[0] = v23;
  v1 = [IFImageSpecification alloc];
  v30[0] = @"IFImageSpecificationTagHomeScreen";
  v30[1] = @"IFImageSpecificationTagRequired";
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  double v21 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v22, 300.0, 180.0, 1.0);
  v32[1] = v21;
  double v2 = [IFImageSpecification alloc];
  v29[0] = @"IFImageSpecificationTagHomeScreen";
  v29[1] = @"IFImageSpecificationTagRequired";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  double v19 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v20, 400.0, 240.0, 1.0);
  v32[2] = v19;
  double v3 = [IFImageSpecification alloc];
  v28[0] = @"IFImageSpecificationTagAppStore";
  v28[1] = @"IFImageSpecificationTagRequired";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v4 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v18, 1280.0, 768.0, 1.0);
  v32[3] = v4;
  uint64_t v5 = [IFImageSpecification alloc];
  v27[0] = @"IFImageSpecificationTagHomeScreen";
  v27[1] = @"IFImageSpecificationTagRequired";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v7 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v6, 250.0, 150.0, 2.0);
  v32[4] = v7;
  int v8 = [IFImageSpecification alloc];
  v26[0] = @"IFImageSpecificationTagHomeScreen";
  v26[1] = @"IFImageSpecificationTagRequired";
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  char v10 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v9, 300.0, 180.0, 2.0);
  v32[5] = v10;
  objc_super v11 = [IFImageSpecification alloc];
  v25[0] = @"IFImageSpecificationTagHomeScreen";
  v25[1] = @"IFImageSpecificationTagRequired";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  long long v13 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v12, 400.0, 240.0, 2.0);
  v32[6] = v13;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:7];

  long long v15 = [IFIconSpecification alloc];
  uint64_t v16 = [(IFIconSpecification *)v15 _initWithName:@"Application Icon" imageSpecifiactions:v14 variants:MEMORY[0x1E4F1CBF0]];
  unint64_t v17 = (void *)tvAppIconSpecification_iconSpecification;
  tvAppIconSpecification_iconSpecification = v16;
}

+ (id)rOSAppIconSpecification
{
  if (rOSAppIconSpecification_onceToken != -1) {
    dispatch_once(&rOSAppIconSpecification_onceToken, &__block_literal_global_99);
  }
  double v2 = (void *)rOSAppIconSpecification_iconSpecification;

  return v2;
}

void __60__IFIconSpecification_Constructors__rOSAppIconSpecification__block_invoke()
{
  v64[15] = *MEMORY[0x1E4F143B8];
  v0 = [IFImageSpecification alloc];
  v63[0] = @"IFImageSpecificationTagAppStore";
  v63[1] = @"IFImageSpecificationTagRequired";
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  double v47 = -[IFImageSpecification initWithSize:scale:tags:](v0, "initWithSize:scale:tags:", v48, 1024.0, 1024.0, 1.0);
  v64[0] = v47;
  v1 = [IFImageSpecification alloc];
  id v62 = @"IFImageSpecificationTagRequired";
  double v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  double v45 = -[IFImageSpecification initWithSize:scale:tags:](v1, "initWithSize:scale:tags:", v46, 32.0, 32.0, 2.0);
  v64[1] = v45;
  double v2 = [IFImageSpecification alloc];
  double v61 = @"IFImageSpecificationTagRequired";
  double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  uint64_t v43 = -[IFImageSpecification initWithSize:scale:tags:](v2, "initWithSize:scale:tags:", v44, 44.0, 44.0, 2.0);
  void v64[2] = v43;
  double v3 = [IFImageSpecification alloc];
  double v60 = @"IFImageSpecificationTagRequired";
  double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  double v41 = -[IFImageSpecification initWithSize:scale:tags:](v3, "initWithSize:scale:tags:", v42, 52.0, 52.0, 2.0);
  v64[3] = v41;
  id v4 = [IFImageSpecification alloc];
  double v59 = @"IFImageSpecificationTagRequired";
  id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  uint64_t v39 = -[IFImageSpecification initWithSize:scale:tags:](v4, "initWithSize:scale:tags:", v40, 88.0, 88.0, 2.0);
  v64[4] = v39;
  uint64_t v5 = [IFImageSpecification alloc];
  double v58 = @"IFImageSpecificationTagRequired";
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  double v37 = -[IFImageSpecification initWithSize:scale:tags:](v5, "initWithSize:scale:tags:", v38, 128.0, 128.0, 2.0);
  v64[5] = v37;
  id v6 = [IFImageSpecification alloc];
  double v57 = @"IFImageSpecificationTagRequired";
  id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
  double v35 = -[IFImageSpecification initWithSize:scale:tags:](v6, "initWithSize:scale:tags:", v36, 512.0, 512.0, 2.0);
  v64[6] = v35;
  id v7 = [IFImageSpecification alloc];
  double v56 = @"IFImageSpecificationTagRequired";
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  uint64_t v33 = -[IFImageSpecification initWithSize:scale:tags:](v7, "initWithSize:scale:tags:", v34, 32.0, 32.0, 3.0);
  v64[7] = v33;
  int v8 = [IFImageSpecification alloc];
  double v55 = @"IFImageSpecificationTagRequired";
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  long long v31 = -[IFImageSpecification initWithSize:scale:tags:](v8, "initWithSize:scale:tags:", v32, 44.0, 44.0, 3.0);
  v64[8] = v31;
  double v9 = [IFImageSpecification alloc];
  double v54 = @"IFImageSpecificationTagRequired";
  long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  long long v29 = -[IFImageSpecification initWithSize:scale:tags:](v9, "initWithSize:scale:tags:", v30, 20.0, 20.0, 2.0);
  v64[9] = v29;
  char v10 = [IFImageSpecification alloc];
  double v53 = @"IFImageSpecificationTagRequired";
  long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  uint64_t v27 = -[IFImageSpecification initWithSize:scale:tags:](v10, "initWithSize:scale:tags:", v28, 24.0, 24.0, 2.0);
  v64[10] = v27;
  objc_super v11 = [IFImageSpecification alloc];
  double v52 = @"IFImageSpecificationTagRequired";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  long long v13 = -[IFImageSpecification initWithSize:scale:tags:](v11, "initWithSize:scale:tags:", v12, 40.0, 40.0, 2.0);
  v64[11] = v13;
  long long v14 = [IFImageSpecification alloc];
  double v51 = @"IFImageSpecificationTagRequired";
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  uint64_t v16 = -[IFImageSpecification initWithSize:scale:tags:](v14, "initWithSize:scale:tags:", v15, 64.0, 64.0, 2.0);
  v64[12] = v16;
  unint64_t v17 = [IFImageSpecification alloc];
  double v50 = @"IFImageSpecificationTagRequired";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  double v19 = -[IFImageSpecification initWithSize:scale:tags:](v17, "initWithSize:scale:tags:", v18, 96.0, 96.0, 2.0);
  v64[13] = v19;
  uint64_t v20 = [IFImageSpecification alloc];
  double v49 = @"IFImageSpecificationTagRequired";
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  double v22 = -[IFImageSpecification initWithSize:scale:tags:](v20, "initWithSize:scale:tags:", v21, 24.0, 24.0, 3.0);
  v64[14] = v22;
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:15];

  uint64_t v24 = [IFIconSpecification alloc];
  uint64_t v25 = [(IFIconSpecification *)v24 _initWithName:@"Application Icon" imageSpecifiactions:v23 variants:MEMORY[0x1E4F1CBF0]];
  id v26 = (void *)rOSAppIconSpecification_iconSpecification;
  rOSAppIconSpecification_iconSpecification = v25;
}

@end