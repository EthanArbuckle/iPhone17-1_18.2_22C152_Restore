@interface VCPFaceCrop
+ (id)generateFaceCropsForFace:(id)a3 resourceURL:(id)a4 groupingIdentifier:(id)a5;
- (CGSize)imageDimensions;
- (NSString)localIdentifier;
- (VCPFaceCrop)initWithFaceCropData:(id)a3 originatingFace:(id)a4;
- (VCPFaceCrop)initWithLocalIdentifier:(id)a3 faceCropData:(id)a4;
- (id)description;
- (id)faceCropData;
- (id)originatingFace;
- (signed)state;
- (void)setState:(signed __int16)a3;
@end

@implementation VCPFaceCrop

- (VCPFaceCrop)initWithLocalIdentifier:(id)a3 faceCropData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCPFaceCrop;
  v9 = [(VCPFaceCrop *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localIdentifier, a3);
    uint64_t v11 = [v8 copy];
    faceCropData = v10->_faceCropData;
    v10->_faceCropData = (NSData *)v11;
  }
  return v10;
}

- (VCPFaceCrop)initWithFaceCropData:(id)a3 originatingFace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCPFaceCrop;
  id v8 = [(VCPFaceCrop *)&v14 init];
  v9 = v8;
  if (v8)
  {
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = 0;

    uint64_t v11 = [v6 copy];
    faceCropData = v9->_faceCropData;
    v9->_faceCropData = (NSData *)v11;

    objc_storeStrong((id *)&v9->_originatingFace, a4);
  }

  return v9;
}

+ (id)generateFaceCropsForFace:(id)a3 resourceURL:(id)a4 groupingIdentifier:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  uint64_t v11 = 0;
  if (v7 && v8 && v9)
  {
    [v7 bodyCenterX];
    if (v12 == 0.0 && ([v7 bodyCenterY], v13 == 0.0) && (objc_msgSend(v7, "bodyWidth"), v14 == 0.0))
    {
      [v7 bodyHeight];
      BOOL v15 = v53 != 0.0;
    }
    else
    {
      BOOL v15 = 1;
    }
    if ([v7 detectionType] == 3)
    {
      if (!v15)
      {
LABEL_10:
        [v7 normalizedFaceRect];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        if ((int)MediaAnalysisLogLevel() < 7) {
          goto LABEL_22;
        }
        v24 = VCPLogInstance();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_21;
        }
        [v7 centerX];
        v26 = v25;
        [v7 centerY];
        v28 = v27;
        [v7 size];
        *(_DWORD *)buf = 134219520;
        v56 = v26;
        __int16 v57 = 2048;
        id v58 = v28;
        __int16 v59 = 2048;
        uint64_t v60 = v29;
        __int16 v61 = 2048;
        double v62 = v17;
        __int16 v63 = 2048;
        double v64 = v19;
        __int16 v65 = 2048;
        double v66 = v21;
        __int16 v67 = 2048;
        double v68 = v23;
        v30 = "[FaceCropGeneration] face (centerX:%.2f, centerY:%.2f, size:%.2f) -> normalizedRect: (x:%.2f, y:%.2f, widt"
              "h:%.2f, height:%.2f)";
        v31 = v24;
        uint32_t v32 = 72;
        goto LABEL_20;
      }
    }
    else if ([v7 detectionType] != 4 || !v15)
    {
      goto LABEL_10;
    }
    [v7 normalizedBodyRect];
    double v17 = v34;
    double v19 = v35;
    double v21 = v36;
    double v23 = v37;
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_22;
    }
    v24 = VCPLogInstance();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
LABEL_21:

LABEL_22:
      id v54 = 0;
      id v45 = +[VCPFaceCropUtils newFaceCropFromImageURL:withNormalizedFaceRect:groupingIdentifier:error:](VCPFaceCropUtils, "newFaceCropFromImageURL:withNormalizedFaceRect:groupingIdentifier:error:", v8, v10, &v54, v17, v19, v21, v23);
      id v46 = v54;
      if (v45)
      {
        v47 = [[VCPFaceCrop alloc] initWithFaceCropData:v45 originatingFace:v7];
        p_super = &v47->super;
        if (v47)
        {
          p_super = v47;
          uint64_t v11 = p_super;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v50 = VCPLogInstance();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v51 = [v7 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v56 = v51;
              _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "[VCPFaceCrop][%@] Failed to create VCPFaceCrop instance", buf, 0xCu);
            }
          }
          uint64_t v11 = 0;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          uint64_t v11 = 0;
          goto LABEL_35;
        }
        p_super = VCPLogInstance();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          v49 = [v7 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v56 = v49;
          __int16 v57 = 2112;
          id v58 = v46;
          _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_ERROR, "[VCPFaceCrop][%@] Failed to generate FaceCrop data - %@", buf, 0x16u);
        }
        uint64_t v11 = 0;
      }

LABEL_35:
      goto LABEL_36;
    }
    [v7 bodyCenterX];
    v39 = v38;
    [v7 bodyCenterY];
    v41 = v40;
    [v7 bodyWidth];
    uint64_t v43 = v42;
    [v7 bodyHeight];
    *(_DWORD *)buf = 134219776;
    v56 = v39;
    __int16 v57 = 2048;
    id v58 = v41;
    __int16 v59 = 2048;
    uint64_t v60 = v43;
    __int16 v61 = 2048;
    double v62 = v44;
    __int16 v63 = 2048;
    double v64 = v17;
    __int16 v65 = 2048;
    double v66 = v19;
    __int16 v67 = 2048;
    double v68 = v21;
    __int16 v69 = 2048;
    double v70 = v23;
    v30 = "[FaceCropGeneration] body (bodyCenterX:%.2f, bodyCenterY:%.2f, bodyWidth:%.2f, bodyHeight: %.2f) -> normalized"
          "Rect: (x:%.2f, y:%.2f, width:%.2f, height:%.2f)";
    v31 = v24;
    uint32_t v32 = 82;
LABEL_20:
    _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEBUG, v30, buf, v32);
    goto LABEL_21;
  }
LABEL_36:

  return v11;
}

- (id)faceCropData
{
  return self->_faceCropData;
}

- (id)originatingFace
{
  return self->_originatingFace;
}

- (CGSize)imageDimensions
{
  double width = self->_cachedImageDimensions.width;
  double height = self->_cachedImageDimensions.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    +[VCPFaceCropUtils faceCropDimensionsFromFaceCrop:self->_faceCropData error:0];
    self->_cachedImageDimensions.double width = width;
    self->_cachedImageDimensions.double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)VCPFaceCrop;
  v4 = [(VCPFaceCrop *)&v9 description];
  v5 = [v3 stringWithString:v4];

  objc_msgSend(v5, "appendFormat:", @"  state            : %d\n", -[VCPFaceCrop state](self, "state"));
  originatingFace = self->_originatingFace;
  if (originatingFace)
  {
    id v7 = [(VCPPhotosFace *)originatingFace localIdentifier];
    [v5 appendFormat:@"  originating face : %@\n", v7];
  }
  return v5;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (signed)state
{
  return self->_state;
}

- (void)setState:(signed __int16)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingFace, 0);
  objc_storeStrong((id *)&self->_faceCropData, 0);
}

@end