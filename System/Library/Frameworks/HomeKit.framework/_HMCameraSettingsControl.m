@interface _HMCameraSettingsControl
- (HMCharacteristic)currentHorizontalTilt;
- (HMCharacteristic)currentVerticalTilt;
- (HMCharacteristic)digitalZoom;
- (HMCharacteristic)imageMirroring;
- (HMCharacteristic)imageRotation;
- (HMCharacteristic)nightVision;
- (HMCharacteristic)opticalZoom;
- (HMCharacteristic)targetHorizontalTilt;
- (HMCharacteristic)targetVerticalTilt;
- (_HMCameraSettingsControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 service:(id)a5;
- (void)setCurrentHorizontalTilt:(id)a3;
- (void)setCurrentVerticalTilt:(id)a3;
- (void)setDigitalZoom:(id)a3;
- (void)setImageMirroring:(id)a3;
- (void)setImageRotation:(id)a3;
- (void)setNightVision:(id)a3;
- (void)setOpticalZoom:(id)a3;
- (void)setTargetHorizontalTilt:(id)a3;
- (void)setTargetVerticalTilt:(id)a3;
@end

@implementation _HMCameraSettingsControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageMirroring, 0);
  objc_storeStrong((id *)&self->_imageRotation, 0);
  objc_storeStrong((id *)&self->_digitalZoom, 0);
  objc_storeStrong((id *)&self->_opticalZoom, 0);
  objc_storeStrong((id *)&self->_targetVerticalTilt, 0);
  objc_storeStrong((id *)&self->_currentVerticalTilt, 0);
  objc_storeStrong((id *)&self->_targetHorizontalTilt, 0);
  objc_storeStrong((id *)&self->_currentHorizontalTilt, 0);

  objc_storeStrong((id *)&self->_nightVision, 0);
}

- (void)setImageMirroring:(id)a3
{
}

- (HMCharacteristic)imageMirroring
{
  return self->_imageMirroring;
}

- (void)setImageRotation:(id)a3
{
}

- (HMCharacteristic)imageRotation
{
  return self->_imageRotation;
}

- (void)setDigitalZoom:(id)a3
{
}

- (HMCharacteristic)digitalZoom
{
  return self->_digitalZoom;
}

- (void)setOpticalZoom:(id)a3
{
}

- (HMCharacteristic)opticalZoom
{
  return self->_opticalZoom;
}

- (void)setTargetVerticalTilt:(id)a3
{
}

- (HMCharacteristic)targetVerticalTilt
{
  return self->_targetVerticalTilt;
}

- (void)setCurrentVerticalTilt:(id)a3
{
}

- (HMCharacteristic)currentVerticalTilt
{
  return self->_currentVerticalTilt;
}

- (void)setTargetHorizontalTilt:(id)a3
{
}

- (HMCharacteristic)targetHorizontalTilt
{
  return self->_targetHorizontalTilt;
}

- (void)setCurrentHorizontalTilt:(id)a3
{
}

- (HMCharacteristic)currentHorizontalTilt
{
  return self->_currentHorizontalTilt;
}

- (void)setNightVision:(id)a3
{
}

- (HMCharacteristic)nightVision
{
  return self->_nightVision;
}

- (_HMCameraSettingsControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 service:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v40.receiver = self;
  v40.super_class = (Class)_HMCameraSettingsControl;
  v9 = [(_HMCameraControl *)&v40 initWithCameraProfile:a3 profileUniqueIdentifier:a4];
  if (v9)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v10 = [v8 characteristics];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v16 = [v15 characteristicType];
          char v17 = [v16 isEqualToString:@"0000011B-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraSettingsControl__nightVision;
          if (v17) {
            goto LABEL_16;
          }
          v19 = [v15 characteristicType];
          char v20 = [v19 isEqualToString:@"0000007B-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraSettingsControl__targetHorizontalTilt;
          if (v20) {
            goto LABEL_16;
          }
          v21 = [v15 characteristicType];
          char v22 = [v21 isEqualToString:@"0000006C-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraSettingsControl__currentHorizontalTilt;
          if (v22) {
            goto LABEL_16;
          }
          v23 = [v15 characteristicType];
          char v24 = [v23 isEqualToString:@"0000007D-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraSettingsControl__targetVerticalTilt;
          if (v24) {
            goto LABEL_16;
          }
          v25 = [v15 characteristicType];
          char v26 = [v25 isEqualToString:@"0000006E-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraSettingsControl__currentVerticalTilt;
          if (v26) {
            goto LABEL_16;
          }
          v27 = [v15 characteristicType];
          char v28 = [v27 isEqualToString:@"0000011C-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraSettingsControl__opticalZoom;
          if (v28) {
            goto LABEL_16;
          }
          v29 = [v15 characteristicType];
          char v30 = [v29 isEqualToString:@"0000011D-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraSettingsControl__digitalZoom;
          if (v30) {
            goto LABEL_16;
          }
          v31 = [v15 characteristicType];
          char v32 = [v31 isEqualToString:@"0000011E-0000-1000-8000-0026BB765291"];

          v18 = &OBJC_IVAR____HMCameraSettingsControl__imageRotation;
          if ((v32 & 1) == 0)
          {
            v33 = [v15 characteristicType];
            int v34 = [v33 isEqualToString:@"0000011F-0000-1000-8000-0026BB765291"];

            v18 = &OBJC_IVAR____HMCameraSettingsControl__imageMirroring;
            if (!v34) {
              continue;
            }
          }
LABEL_16:
          objc_storeStrong((id *)((char *)&v9->super.super.isa + *v18), v15);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v12);
    }
  }
  return v9;
}

@end