@interface FigCaptureSourceCompanionFormat
- ($2825F4736939C4A6D3AD43837233062D)fesDimensions;
- ($2825F4736939C4A6D3AD43837233062D)fesInputCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectedNativeDimensions;
- ($2825F4736939C4A6D3AD43837233062D)highQualitySensorDimensions;
- ($2825F4736939C4A6D3AD43837233062D)outputCropDimensionsWhenFesIsEnabled;
- ($2825F4736939C4A6D3AD43837233062D)postGDCCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)sensorCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions;
- (BOOL)sifrEnabled;
- (CGPoint)sensorCenterOffset;
- (FigCaptureSourceCompanionFormat)initWithCompanionFormatDictionary:(id)a3;
- (float)stereoVideoAEMaxGain;
- (id)description;
- (int)formatIndex;
- (void)dealloc;
@end

@implementation FigCaptureSourceCompanionFormat

- (FigCaptureSourceCompanionFormat)initWithCompanionFormatDictionary:(id)a3
{
  if (a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)FigCaptureSourceCompanionFormat;
    v4 = [(FigCaptureSourceCompanionFormat *)&v25 init];
    if (v4)
    {
      v4->_formatIndex = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Index"), "intValue");
      int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Width"), "intValue");
      int v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"Height"), "intValue");
      v4->_fesDimensions.width = v5;
      v4->_fesDimensions.height = v6;
      int v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"FESInputCropWidth"), "intValue");
      int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"FESInputCropHeight"), "intValue");
      v4->_fesInputCropDimensions.width = v7;
      v4->_fesInputCropDimensions.height = v8;
      int v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"CropWidthForFES"), "intValue");
      int v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"CropHeightForFES"), "intValue");
      v4->_outputCropDimensionsWhenFesIsEnabled.width = v9;
      v4->_outputCropDimensionsWhenFesIsEnabled.height = v10;
      int v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F55300]), "intValue");
      int v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F552F8]), "intValue");
      v4->_sensorDimensions.width = v11;
      v4->_sensorDimensions.height = v12;
      int v13 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SensorCropWidth"), "intValue");
      int v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SensorCropHeight"), "intValue");
      v4->_sensorCropDimensions.width = v13;
      v4->_sensorCropDimensions.height = v14;
      CGFloat v15 = (double)(int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SensorCenterOffsetX"), "intValue");
      int v16 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SensorCenterOffsetY"), "intValue");
      v4->_sensorCenterOffset.x = v15;
      v4->_sensorCenterOffset.y = (double)v16;
      int v17 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"PostGDCCropWidth"), "intValue");
      int v18 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"PostGDCCropHeight"), "intValue");
      v4->_postGDCCropDimensions.width = v17;
      v4->_postGDCCropDimensions.height = v18;
      v4->_sifrEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SIFREnabled"), "BOOLValue");
      int v19 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"HighQualitySensorWidth"), "intValue");
      int v20 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"HighQualitySensorHeight"), "intValue");
      v4->_highQualitySensorDimensions.width = v19;
      v4->_highQualitySensorDimensions.height = v20;
      int v21 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"GeometricDistortionCorrectedNativeWidth"), "intValue");
      int v22 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"GeometricDistortionCorrectedNativeHeight"), "intValue");
      v4->_geometricDistortionCorrectedNativeDimensions.width = v21;
      v4->_geometricDistortionCorrectedNativeDimensions.height = v22;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StereoVideoAEMaxGain"), "floatValue");
      v4->_stereoVideoAEMaxGain = v23;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)FigCaptureSourceCompanionFormat;
  [(FigCaptureSourceCompanionFormat *)&v2 dealloc];
}

- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectedNativeDimensions
{
  objc_copyStruct(&dest, &self->_geometricDistortionCorrectedNativeDimensions, 8, 1, 0);
  return dest;
}

- (BOOL)sifrEnabled
{
  return self->_sifrEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorCropDimensions
{
  objc_copyStruct(&dest, &self->_sensorCropDimensions, 8, 1, 0);
  return dest;
}

- (CGPoint)sensorCenterOffset
{
  objc_copyStruct(v4, &self->_sensorCenterOffset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)postGDCCropDimensions
{
  objc_copyStruct(&dest, &self->_postGDCCropDimensions, 8, 1, 0);
  return dest;
}

- ($2825F4736939C4A6D3AD43837233062D)outputCropDimensionsWhenFesIsEnabled
{
  objc_copyStruct(&dest, &self->_outputCropDimensionsWhenFesIsEnabled, 8, 1, 0);
  return dest;
}

- (int)formatIndex
{
  return self->_formatIndex;
}

- ($2825F4736939C4A6D3AD43837233062D)fesInputCropDimensions
{
  objc_copyStruct(&dest, &self->_fesInputCropDimensions, 8, 1, 0);
  return dest;
}

- ($2825F4736939C4A6D3AD43837233062D)fesDimensions
{
  objc_copyStruct(&dest, &self->_fesDimensions, 8, 1, 0);
  return dest;
}

- (id)description
{
  double v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p> [%d]:%dx%d SIFR:%d FESInputCropDim:%dx%d outputCropDimForFES:%dx%d sensorCropDim:%dx%d HighQualitySensorDim:%dx%d", NSStringFromClass(v4), self, self->_formatIndex, self->_fesDimensions.width, self->_fesDimensions.height, self->_sifrEnabled, self->_fesInputCropDimensions.width, self->_fesInputCropDimensions.height, self->_outputCropDimensionsWhenFesIsEnabled.width, self->_outputCropDimensionsWhenFesIsEnabled.height, self->_sensorCropDimensions.width, self->_sensorCropDimensions.height, self->_highQualitySensorDimensions.width, self->_highQualitySensorDimensions.height];
}

- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions
{
  objc_copyStruct(&dest, &self->_sensorDimensions, 8, 1, 0);
  return dest;
}

- ($2825F4736939C4A6D3AD43837233062D)highQualitySensorDimensions
{
  objc_copyStruct(&dest, &self->_highQualitySensorDimensions, 8, 1, 0);
  return dest;
}

- (float)stereoVideoAEMaxGain
{
  return self->_stereoVideoAEMaxGain;
}

@end