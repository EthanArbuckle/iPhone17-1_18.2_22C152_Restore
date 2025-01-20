@interface GEOStorefrontCamera
- (CGSize)imageSize;
- (GEOLensModel)projection;
- (GEOOrientedPosition)position;
- (GEOStorefrontCamera)init;
- (GEOStorefrontCamera)initWithCameraMetadata:(id)a3;
- (NSArray)textureIds;
- (int)cameraNumber;
- (unsigned)lensType;
@end

@implementation GEOStorefrontCamera

- (GEOStorefrontCamera)init
{
  result = (GEOStorefrontCamera *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOStorefrontCamera)initWithCameraMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)v4;
  if (!v4) {
    goto LABEL_15;
  }
  -[GEOPDCameraMetadata _readPosition]((uint64_t)v4);
  if (!*(void *)(v5 + 48)) {
    goto LABEL_15;
  }
  -[GEOPDCameraMetadata _readLensProjection](v5);
  if (!*(void *)(v5 + 40)) {
    goto LABEL_15;
  }
  v35.receiver = self;
  v35.super_class = (Class)GEOStorefrontCamera;
  v6 = [(GEOStorefrontCamera *)&v35 init];
  v7 = v6;
  if (!v6)
  {
    self = 0;
LABEL_15:
    v28 = 0;
    goto LABEL_19;
  }
  v6->_cameraNumber = *(_DWORD *)(v5 + 68);
  int v8 = *(_DWORD *)(v5 + 72);
  v6->_imageSize.width = (double)*(int *)(v5 + 76);
  v6->_imageSize.height = (double)v8;
  v9 = -[GEOPDCameraMetadata position]((id *)v5);
  char v10 = GEOOrientedPositionFromPDPosition(v9, (uint64_t)&v7->_position);

  if (v10)
  {
    -[GEOPDCameraMetadata lensProjection]((id *)v5);
    v11 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v11) {
      int v12 = v11[20];
    }
    else {
      LOBYTE(v12) = 0;
    }
    v7->_lensType = v12;

    -[GEOPDCameraMetadata lensProjection]((id *)v5);
    v13 = (double *)(id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      float v15 = v13[1];
      float v34 = v15;
      float v16 = v13[2];
      float v17 = v13[3];
      float v18 = v13[4];
      float v19 = v13[5];
      float v20 = v13[6];
      float v21 = v13[7];
      float v22 = v13[8];
      float v23 = v13[9];
    }
    else
    {
      float v22 = 0.0;
      float v20 = 0.0;
      float v18 = 0.0;
      float v16 = 0.0;
      float v34 = 0.0;
      float v17 = 0.0;
      float v19 = 0.0;
      float v21 = 0.0;
      float v23 = 0.0;
    }

    v7->_projection.fovS = v18;
    v7->_projection.fovH = v17;
    v7->_projection.k2 = v19;
    v7->_projection.k3 = v20;
    v7->_projection.k4 = v21;
    v7->_projection.cx = v34;
    v7->_projection.cy = v16;
    v7->_projection.lx = v22;
    v7->_projection.ly = v23;

    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    -[GEOPDCameraMetadata _readTextureIds](v5);
    if (*(void *)(v5 + 24))
    {
      for (unint64_t i = 0; ; ++i)
      {
        -[GEOPDCameraMetadata _readTextureIds](v5);
        if (i >= *(void *)(v5 + 24)) {
          break;
        }
        v26 = NSNumber;
        -[GEOPDCameraMetadata _readTextureIds](v5);
        v27 = [v26 numberWithUnsignedInteger:*(unsigned int *)(*(void *)(v5 + 16) + 4 * i)];
        [v24 addObject:v27];
      }
    }
    else
    {
      v29 = [NSNumber numberWithUnsignedInteger:v7->_cameraNumber];
      [v24 addObject:v29];

      if (v7->_cameraNumber == 4)
      {
        v30 = [NSNumber numberWithUnsignedInteger:5];
        [v24 addObject:v30];
      }
    }
    uint64_t v31 = [v24 copy];
    textureIds = v7->_textureIds;
    v7->_textureIds = (NSArray *)v31;

    self = v7;
    v28 = self;
  }
  else
  {
    v28 = 0;
    self = v7;
  }
LABEL_19:

  return v28;
}

- (int)cameraNumber
{
  return self->_cameraNumber;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (GEOOrientedPosition)position
{
  long long v3 = *(_OWORD *)&self[1].position.y;
  *(_OWORD *)&retstr->position.x = *(_OWORD *)&self->roll;
  *(_OWORD *)&retstr->position.z = v3;
  *(void *)&retstr->roll = *(void *)&self[1].yaw;
  return self;
}

- (unsigned)lensType
{
  return self->_lensType;
}

- (GEOLensModel)projection
{
  long long v3 = *(_OWORD *)&self[2].cx;
  *(_OWORD *)&retstr->fovS = *(_OWORD *)&self[2].fovH;
  *(_OWORD *)&retstr->k4 = v3;
  retstr->ly = self[3].fovS;
  return self;
}

- (NSArray)textureIds
{
  return self->_textureIds;
}

- (void).cxx_destruct
{
}

@end