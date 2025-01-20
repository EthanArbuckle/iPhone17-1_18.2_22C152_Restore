@interface MSImageScalingSpecification
+ (MSImageScalingSpecification)specificationWithSharedAlbumSpecificationString:(id)a3;
+ (id)assetsToGenerateFromImageWithInputSize:(CGSize)a3 toConformToSpecifications:(id)a4;
- (double)maximumLongSideLength;
- (double)minimumLongSideLength;
- (double)nominalShortSideLength;
- (double)scaleFactorForInputSize:(CGSize)a3;
- (id)description;
- (int)assetTypeFlags;
- (void)setAssetTypeFlags:(int)a3;
- (void)setMaximumLongSideLength:(double)a3;
- (void)setMinimumLongSideLength:(double)a3;
- (void)setNominalShortSideLength:(double)a3;
@end

@implementation MSImageScalingSpecification

- (void)setAssetTypeFlags:(int)a3
{
  self->_assetTypeFlags = a3;
}

- (int)assetTypeFlags
{
  return self->_assetTypeFlags;
}

- (void)setMaximumLongSideLength:(double)a3
{
  self->_maximumLongSideLength = a3;
}

- (double)maximumLongSideLength
{
  return self->_maximumLongSideLength;
}

- (void)setMinimumLongSideLength:(double)a3
{
  self->_minimumLongSideLength = a3;
}

- (double)minimumLongSideLength
{
  return self->_minimumLongSideLength;
}

- (void)setNominalShortSideLength:(double)a3
{
  self->_nominalShortSideLength = a3;
}

- (double)nominalShortSideLength
{
  return self->_nominalShortSideLength;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)MSImageScalingSpecification;
  v4 = [(MSImageScalingSpecification *)&v12 description];
  [(MSImageScalingSpecification *)self nominalShortSideLength];
  uint64_t v6 = v5;
  [(MSImageScalingSpecification *)self minimumLongSideLength];
  uint64_t v8 = v7;
  [(MSImageScalingSpecification *)self maximumLongSideLength];
  v10 = [v3 stringWithFormat:@"%@ Short side: %0.0f min long side: %0.0f max long side: %0.0f", v4, v6, v8, v9];

  return v10;
}

- (double)scaleFactorForInputSize:(CGSize)a3
{
  if (a3.width >= a3.height) {
    double height = a3.height;
  }
  else {
    double height = a3.width;
  }
  if (a3.width >= a3.height) {
    double width = a3.width;
  }
  else {
    double width = a3.height;
  }
  [(MSImageScalingSpecification *)self nominalShortSideLength];
  double v7 = v6 / height;
  double v8 = floor(width * v7);
  [(MSImageScalingSpecification *)self minimumLongSideLength];
  if (v8 >= v9)
  {
    [(MSImageScalingSpecification *)self maximumLongSideLength];
    if (v8 <= v11) {
      goto LABEL_12;
    }
    [(MSImageScalingSpecification *)self maximumLongSideLength];
  }
  else
  {
    [(MSImageScalingSpecification *)self minimumLongSideLength];
  }
  double v7 = v10 / width;
LABEL_12:
  double result = 1.0;
  if (v7 <= 1.0) {
    return v7;
  }
  return result;
}

+ (id)assetsToGenerateFromImageWithInputSize:(CGSize)a3 toConformToSpecifications:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v43;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v10 assetTypeFlags])
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  if (v7)
  {
    objc_msgSend(v7, "scaleFactorForInputSize:", width, height);
    double v13 = v12;
    *(float *)&double v12 = v12;
    __96__MSImageScalingSpecification_assetsToGenerateFromImageWithInputSize_toConformToSpecifications___block_invoke(@"thumbnail", 1, *(float *)&v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [v11 addObject:v14];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v33 = v6;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(id *)(*((void *)&v34 + 1) + 8 * j);
          if (v20 != v7)
          {
            objc_msgSend(v20, "scaleFactorForInputSize:", width, height);
            if (v21 <= v13)
            {
              v24 = [v14 objectForKey:@"MSAssetMetadataAssetTypeFlags"];
              int v25 = [v24 intValue];

              [v14 setObject:@"derivative" forKey:@"MSAssetMetadataAssetType"];
              v23 = [NSNumber numberWithInt:v25 | 2u];
              [v14 setObject:v23 forKey:@"MSAssetMetadataAssetTypeFlags"];
            }
            else
            {
              float v22 = v21;
              v23 = __96__MSImageScalingSpecification_assetsToGenerateFromImageWithInputSize_toConformToSpecifications___block_invoke(@"derivative", 2, v22);
              [v11 addObject:v23];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v17);
    }

    id v6 = v33;
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v14 = v6;
    uint64_t v26 = [v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * k), "scaleFactorForInputSize:", width, height);
          *(float *)&double v30 = v30;
          v31 = __96__MSImageScalingSpecification_assetsToGenerateFromImageWithInputSize_toConformToSpecifications___block_invoke(@"derivative", 2, *(float *)&v30);
          [v11 addObject:v31];
        }
        uint64_t v27 = [v14 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v27);
    }
  }

  return v11;
}

id __96__MSImageScalingSpecification_assetsToGenerateFromImageWithInputSize_toConformToSpecifications___block_invoke(void *a1, uint64_t a2, float a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a1;
  id v7 = [v5 dictionary];
  *(float *)&double v8 = a3;
  double v9 = [NSNumber numberWithFloat:v8];
  [v7 setObject:v9 forKeyedSubscript:@"scaleFactor"];

  [v7 setObject:v6 forKeyedSubscript:@"MSAssetMetadataAssetType"];
  double v10 = [NSNumber numberWithInt:a2];
  [v7 setObject:v10 forKeyedSubscript:@"MSAssetMetadataAssetTypeFlags"];

  return v7;
}

+ (MSImageScalingSpecification)specificationWithSharedAlbumSpecificationString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MSImageScalingSpecification);
  uint64_t v5 = [v3 componentsSeparatedByString:@":"];

  if ([v5 count] == 3)
  {
    id v6 = [v5 objectAtIndex:0];
    -[MSImageScalingSpecification setNominalShortSideLength:](v4, "setNominalShortSideLength:", (double)[v6 integerValue]);

    id v7 = [v5 objectAtIndex:1];
    -[MSImageScalingSpecification setMinimumLongSideLength:](v4, "setMinimumLongSideLength:", (double)[v7 integerValue]);

    double v8 = [v5 objectAtIndex:2];
    -[MSImageScalingSpecification setMaximumLongSideLength:](v4, "setMaximumLongSideLength:", (double)[v8 integerValue]);
  }
  else
  {
    double v8 = v4;
    v4 = 0;
  }

  return v4;
}

@end