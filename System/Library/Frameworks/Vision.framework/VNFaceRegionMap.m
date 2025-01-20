@interface VNFaceRegionMap
+ (BOOL)supportsSecureCoding;
- (NSArray)regionLabels;
- (VNFaceRegionMap)initWithCoder:(id)a3;
- (VNFaceRegionMap)initWithRequestRevision:(unint64_t)a3 regionMap:(vImage_Buffer *)a4 deallocateBuffer:(BOOL)a5 userBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 valueToLabelMap:(id)a8;
- (id)getRegionLabels;
- (id)regionNameAtImageCoordinate:(CGPoint)a3 imageSize:(CGSize)a4;
- (id)regionNameAtNormalizedAlignedFaceCoordinate:(CGPoint)a3;
- (id)regionNameAtNormalizedFaceCoordinate:(CGPoint)a3;
- (unint64_t)requestRevision;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setRegionLabels:(id)a3;
@end

@implementation VNFaceRegionMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionLabels, 0);

  objc_storeStrong((id *)&self->_pixelValueToRegionLabelMap, 0);
}

- (void)setRegionLabels:(id)a3
{
}

- (NSArray)regionLabels
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (id)regionNameAtNormalizedFaceCoordinate:(CGPoint)a3
{
  int8x16_t v3 = (int8x16_t)vcvtq_f64_f32((float32x2_t)self->_internalAlignedBBox.size);
  float64x2_t v4 = (float64x2_t)vextq_s8(v3, v3, 8uLL);
  CGFloat y = a3.y;
  return [(VNFaceRegionMap *)self regionNameAtNormalizedAlignedFaceCoordinate:vmlaq_f64(vdivq_f64(vsubq_f64((float64x2_t)self->_userBBox.origin, vcvtq_f64_f32((float32x2_t)self->_internalAlignedBBox.origin)), v4), vdivq_f64((float64x2_t)self->_userBBox.size, v4), (float64x2_t)a3)];
}

- (id)regionNameAtImageCoordinate:(CGPoint)a3 imageSize:(CGSize)a4
{
  return -[VNFaceRegionMap regionNameAtNormalizedAlignedFaceCoordinate:](self, "regionNameAtNormalizedAlignedFaceCoordinate:", (a3.x / a4.width - self->_internalAlignedBBox.origin.x) / self->_internalAlignedBBox.size.width, (a3.y / a4.height - self->_internalAlignedBBox.origin.y) / self->_internalAlignedBBox.size.height);
}

- (id)regionNameAtNormalizedAlignedFaceCoordinate:(CGPoint)a3
{
  vImagePixelCount width = self->_regionMap.width;
  if (width && (vImagePixelCount height = self->_regionMap.height) != 0)
  {
    unint64_t v5 = (unint64_t)(a3.x * (double)width);
    if (a3.x < 0.0) {
      unint64_t v5 = 0;
    }
    unint64_t v6 = (unint64_t)(a3.y * (double)height);
    if (a3.y < 0.0) {
      unint64_t v6 = 0;
    }
    if (v5 >= width) {
      unint64_t v7 = width - 1;
    }
    else {
      unint64_t v7 = v5;
    }
    if (v6 >= height) {
      unint64_t v8 = height - 1;
    }
    else {
      unint64_t v8 = v6;
    }
    pixelValueToRegionLabelMap = self->_pixelValueToRegionLabelMap;
    v10 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)self->_regionMap.data + v7 + self->_regionMap.rowBytes * v8)];
    v11 = [(NSDictionary *)pixelValueToRegionLabelMap objectForKey:v10];
    v12 = (__CFString *)[v11 copy];
  }
  else
  {
    v12 = @"Unknown";
  }

  return v12;
}

- (id)getRegionLabels
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int8x16_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSDictionary count](self->_pixelValueToRegionLabelMap, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  float64x2_t v4 = self->_pixelValueToRegionLabelMap;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        unint64_t v8 = -[NSDictionary objectForKey:](self->_pixelValueToRegionLabelMap, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  float64x2_t v4 = [NSNumber numberWithUnsignedInt:0];
  [v21 encodeObject:v4 forKey:@"VNFaceRegionMapVersion"];

  [v21 encodeInteger:self->_requestRevision forKey:@"requestRevision"];
  uint64_t v5 = [NSNumber numberWithDouble:self->_userBBox.origin.x];
  [v21 encodeObject:v5 forKey:@"userX"];

  uint64_t v6 = [NSNumber numberWithDouble:self->_userBBox.origin.y];
  [v21 encodeObject:v6 forKey:@"userY"];

  unint64_t v7 = [NSNumber numberWithDouble:self->_userBBox.size.width];
  [v21 encodeObject:v7 forKey:@"userW"];

  unint64_t v8 = [NSNumber numberWithDouble:self->_userBBox.size.height];
  [v21 encodeObject:v8 forKey:@"userH"];

  *(float *)&double v9 = self->_internalAlignedBBox.origin.x;
  long long v10 = [NSNumber numberWithFloat:v9];
  [v21 encodeObject:v10 forKey:@"alignX"];

  *(float *)&double v11 = self->_internalAlignedBBox.origin.y;
  long long v12 = [NSNumber numberWithFloat:v11];
  [v21 encodeObject:v12 forKey:@"alignY"];

  *(float *)&double v13 = self->_internalAlignedBBox.size.width;
  v14 = [NSNumber numberWithFloat:v13];
  [v21 encodeObject:v14 forKey:@"alignW"];

  *(float *)&double v15 = self->_internalAlignedBBox.size.height;
  v16 = [NSNumber numberWithFloat:v15];
  [v21 encodeObject:v16 forKey:@"alignH"];

  v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_regionMap.data length:self->_regionMap.height * self->_regionMap.rowBytes freeWhenDone:0];
  [v21 encodeObject:v17 forKey:@"rgnMapData"];
  v18 = [NSNumber numberWithUnsignedLong:self->_regionMap.width];
  [v21 encodeObject:v18 forKey:@"rgnMapW"];

  v19 = [NSNumber numberWithUnsignedLong:self->_regionMap.height];
  [v21 encodeObject:v19 forKey:@"rgnMapH"];

  v20 = [NSNumber numberWithUnsignedLong:self->_regionMap.rowBytes];
  [v21 encodeObject:v20 forKey:@"rgnMapRowBytes"];

  [v21 encodeObject:self->_pixelValueToRegionLabelMap forKey:@"pixelToRgnMap"];
}

- (VNFaceRegionMap)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"VNFaceRegionMapVersion"];
  unint64_t v7 = v6;
  if (v6 && ![v6 unsignedIntValue])
  {
    unint64_t v10 = [v4 decodeIntegerForKey:@"requestRevision"];
    if (v10 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v51 = v11;
    v57 = [v4 decodeObjectOfClass:v5 forKey:@"userW"];
    v55 = [v4 decodeObjectOfClass:v5 forKey:@"userH"];
    v56 = [v4 decodeObjectOfClass:v5 forKey:@"userX"];
    v54 = [v4 decodeObjectOfClass:v5 forKey:@"userY"];
    [v56 doubleValue];
    double v13 = v12;
    [v54 doubleValue];
    double v15 = v14;
    [v57 doubleValue];
    double v17 = v16;
    [v55 doubleValue];
    double v19 = v18;
    v53 = [v4 decodeObjectOfClass:v5 forKey:@"alignW"];
    v52 = [v4 decodeObjectOfClass:v5 forKey:@"alignH"];
    v20 = [v4 decodeObjectOfClass:v5 forKey:@"alignX"];
    id v21 = [v4 decodeObjectOfClass:v5 forKey:@"alignY"];
    [v20 floatValue];
    int v23 = v22;
    [v21 floatValue];
    int v25 = v24;
    [v53 floatValue];
    int v27 = v26;
    [v52 floatValue];
    int v29 = v28;
    v30 = [v4 decodeObjectOfClass:v5 forKey:@"rgnMapW"];
    v58[2] = (void *)[v30 unsignedLongLongValue];

    v31 = [v4 decodeObjectOfClass:v5 forKey:@"rgnMapH"];
    uint64_t v32 = [v31 unsignedLongLongValue];
    v58[1] = (void *)v32;

    v33 = [v4 decodeObjectOfClass:v5 forKey:@"rgnMapRowBytes"];
    uint64_t v34 = [v33 unsignedLongLongValue];
    v58[3] = (void *)v34;

    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rgnMapData"];
    size_t v36 = [v35 length];
    size_t v37 = v36;
    if (v36 == v32 * v34)
    {
      v38 = malloc_type_malloc(v36, 0x2050E9B5uLL);
      v58[0] = v38;
      if (v38)
      {
        memcpy(v38, (const void *)[v35 bytes], v37);
        id v39 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v40 = objc_opt_class();
        v41 = objc_msgSend(v39, "initWithObjects:", v40, v5, objc_opt_class(), 0);
        v42 = [v4 decodeObjectOfClasses:v41 forKey:@"pixelToRgnMap"];
        LODWORD(v43) = v23;
        LODWORD(v44) = v25;
        LODWORD(v45) = v29;
        LODWORD(v46) = v27;
        v47 = -[VNFaceRegionMap initWithRequestRevision:regionMap:deallocateBuffer:userBBox:alignedBBox:valueToLabelMap:](self, "initWithRequestRevision:regionMap:deallocateBuffer:userBBox:alignedBBox:valueToLabelMap:", v51, v58, 1, v42, v13, v15, v17, v19, v43, v44, v45, v46);
        if (!v47) {
          free(v58[0]);
        }
        self = v47;

        double v9 = self;
        goto LABEL_15;
      }
      v48 = +[VNError errorForMemoryAllocationFailure];
      [v4 failWithError:v48];
    }
    else
    {
      v48 = objc_msgSend(NSString, "stringWithFormat:", @"region map data has length of %lu instead of the expected %lu", v36, v32 * v34);
      v49 = +[VNError errorForInternalErrorWithLocalizedDescription:v48];
      [v4 failWithError:v49];
    }
    double v9 = 0;
LABEL_15:

    goto LABEL_16;
  }
  unint64_t v8 = +[VNError errorForInternalErrorWithLocalizedDescription:@"unknown coding version"];
  [v4 failWithError:v8];

  double v9 = 0;
LABEL_16:

  return v9;
}

- (void)dealloc
{
  if (self->_deallocateBuffer) {
    free(self->_regionMap.data);
  }
  v3.receiver = self;
  v3.super_class = (Class)VNFaceRegionMap;
  [(VNFaceRegionMap *)&v3 dealloc];
}

- (VNFaceRegionMap)initWithRequestRevision:(unint64_t)a3 regionMap:(vImage_Buffer *)a4 deallocateBuffer:(BOOL)a5 userBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 valueToLabelMap:(id)a8
{
  float width = a7.size.width;
  float height = a7.size.height;
  float y = a7.origin.y;
  float x = a7.origin.x;
  CGFloat v12 = a6.size.height;
  CGFloat v13 = a6.size.width;
  CGFloat v14 = a6.origin.y;
  CGFloat v15 = a6.origin.x;
  id v20 = a8;
  v27.receiver = self;
  v27.super_class = (Class)VNFaceRegionMap;
  id v21 = [(VNFaceRegionMap *)&v27 init];
  int v22 = v21;
  if (v21)
  {
    v21->_requestRevision = a3;
    if (a4)
    {
      long long v23 = *(_OWORD *)&a4->width;
      *(_OWORD *)&v21->_regionMap.data = *(_OWORD *)&a4->data;
      *(_OWORD *)&v21->_regionMap.float width = v23;
      v21->_deallocateBuffer = a5;
    }
    v21->_userBBox.origin.float x = v15;
    v21->_userBBox.origin.float y = v14;
    v21->_userBBox.size.float width = v13;
    v21->_userBBox.size.float height = v12;
    v21->_internalAlignedBBox.origin.float x = x;
    v21->_internalAlignedBBox.origin.float y = y;
    v21->_internalAlignedBBox.size.float height = height;
    v21->_internalAlignedBBox.size.float width = width;
    uint64_t v24 = [v20 copy];
    pixelValueToRegionLabelMap = v22->_pixelValueToRegionLabelMap;
    v22->_pixelValueToRegionLabelMap = (NSDictionary *)v24;
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end