@interface AVApplePortraitMetadata
+ (BOOL)supportsSecureCoding;
- (AVApplePortraitMetadata)initWithCoder:(id)a3;
- (AVApplePortraitMetadata)initWithInternal:(id)a3;
- (AVApplePortraitMetadata)initWithPortraitMetadataDictionary:(id)a3;
- (CGRect)focusRectangle;
- (NSData)faceObservationsData;
- (NSIndexSet)indexesOfShallowDepthOfFieldObservations;
- (float)apertureFocalRatio;
- (float)luminanceNoiseAmplitude;
- (float)maximumApertureFocalRatio;
- (float)minimumApertureFocalRatio;
- (float)portraitLightingEffectStrength;
- (int)faceOrientation;
- (unsigned)SDOFRenderingVersion;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVApplePortraitMetadata

- (AVApplePortraitMetadata)initWithPortraitMetadataDictionary:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)AVApplePortraitMetadata;
  v4 = [(AVApplePortraitMetadata *)&v21 init];
  if (!v4 || ![a3 count])
  {

    return 0;
  }
  v5 = objc_alloc_init(AVApplePortraitMetadataInternal);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51190]), "intValue");
  if ((int)v6 < 1) {
    goto LABEL_12;
  }
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51140]), "floatValue");
  -[AVApplePortraitMetadataInternal setApertureFocalRatio:](v5, "setApertureFocalRatio:");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51160]), "floatValue");
  -[AVApplePortraitMetadataInternal setLuminanceNoiseAmplitude:](v5, "setLuminanceNoiseAmplitude:");
  -[AVApplePortraitMetadataInternal setFaceOrientation:](v5, "setFaceOrientation:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51150]), "intValue"));
  -[AVApplePortraitMetadataInternal setFaceObservationsData:](v5, "setFaceObservationsData:", [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51148]]);
  v7 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51180]];
  uint64_t v8 = [v7 count] == 2
     ? objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue"), objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "unsignedIntegerValue")): 0;
  [(AVApplePortraitMetadataInternal *)v5 setIndexesOfShallowDepthOfFieldObservations:v8];
  CFDictionaryRef v10 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51158]];
  __asm { FMOV            V0.2D, #0.5 }
  v20.origin = _Q0;
  v20.size.width = 0.0;
  v20.size.height = 0.0;
  CGRectMakeWithDictionaryRepresentation(v10, &v20);
  -[AVApplePortraitMetadataInternal setFocusRectangle:](v5, "setFocusRectangle:", *(_OWORD *)&v20.origin, v20.size.width, v20.size.height);
  if (v6 <= 3)
  {
LABEL_12:
    [(AVApplePortraitMetadataInternal *)v5 setMinimumApertureFocalRatio:0.0];
    [(AVApplePortraitMetadataInternal *)v5 setMaximumApertureFocalRatio:0.0];
    goto LABEL_13;
  }
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51170]), "floatValue");
  -[AVApplePortraitMetadataInternal setMinimumApertureFocalRatio:](v5, "setMinimumApertureFocalRatio:");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51168]), "floatValue");
  -[AVApplePortraitMetadataInternal setMaximumApertureFocalRatio:](v5, "setMaximumApertureFocalRatio:");
  if (v6 == 4)
  {
LABEL_13:
    LODWORD(v16) = 2143289344;
    [(AVApplePortraitMetadataInternal *)v5 setPortraitLightingEffectStrength:v16];
    goto LABEL_14;
  }
  v17 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51178]];
  if (v17) {
    [v17 floatValue];
  }
  else {
    LODWORD(v18) = 2143289344;
  }
  [(AVApplePortraitMetadataInternal *)v5 setPortraitLightingEffectStrength:v18];
  if (v6 >= 6)
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51188]), "intValue");
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v19 = 0;
LABEL_15:
  [(AVApplePortraitMetadataInternal *)v5 setSDOFRenderingVersion:v19];
  [(AVApplePortraitMetadataInternal *)v5 setVersion:v6];
  return [(AVApplePortraitMetadata *)v4 initWithInternal:v5];
}

- (AVApplePortraitMetadata)initWithInternal:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVApplePortraitMetadata;
  v4 = [(AVApplePortraitMetadata *)&v6 init];
  if (v4) {
    v4->_internal = (AVApplePortraitMetadataInternal *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVApplePortraitMetadata;
  [(AVApplePortraitMetadata *)&v3 dealloc];
}

- (AVApplePortraitMetadata)initWithCoder:(id)a3
{
  v5 = objc_alloc_init(AVApplePortraitMetadataInternal);
  uint64_t v6 = [a3 decodeIntForKey:*MEMORY[0x1E4F51190]];
  if ((int)v6 >= 1)
  {
    [a3 decodeFloatForKey:*MEMORY[0x1E4F51140]];
    -[AVApplePortraitMetadataInternal setApertureFocalRatio:](v5, "setApertureFocalRatio:");
    uint64_t v7 = *MEMORY[0x1E4F51170];
    int v8 = [a3 containsValueForKey:*MEMORY[0x1E4F51170]];
    int v9 = 0;
    double v10 = 0.0;
    if (v8) {
      objc_msgSend(a3, "decodeFloatForKey:", v7, 0.0);
    }
    [(AVApplePortraitMetadataInternal *)v5 setMinimumApertureFocalRatio:v10];
    uint64_t v11 = *MEMORY[0x1E4F51168];
    if ([a3 containsValueForKey:*MEMORY[0x1E4F51168]])
    {
      [a3 decodeFloatForKey:v11];
      int v9 = LODWORD(v12);
    }
    LODWORD(v12) = v9;
    [(AVApplePortraitMetadataInternal *)v5 setMaximumApertureFocalRatio:v12];
    uint64_t v13 = *MEMORY[0x1E4F51178];
    if ([a3 containsValueForKey:*MEMORY[0x1E4F51178]]) {
      [a3 decodeFloatForKey:v13];
    }
    else {
      LODWORD(v14) = 2143289344;
    }
    [(AVApplePortraitMetadataInternal *)v5 setPortraitLightingEffectStrength:v14];
    [a3 decodeFloatForKey:*MEMORY[0x1E4F51160]];
    -[AVApplePortraitMetadataInternal setLuminanceNoiseAmplitude:](v5, "setLuminanceNoiseAmplitude:");
    -[AVApplePortraitMetadataInternal setFaceOrientation:](v5, "setFaceOrientation:", [a3 decodeIntForKey:*MEMORY[0x1E4F51150]]);
    -[AVApplePortraitMetadataInternal setFaceObservationsData:](v5, "setFaceObservationsData:", [a3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F51148]]);
    -[AVApplePortraitMetadataInternal setIndexesOfShallowDepthOfFieldObservations:](v5, "setIndexesOfShallowDepthOfFieldObservations:", [a3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F51180]]);
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    CFDictionaryRef v18 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0), *MEMORY[0x1E4F51158]);
    __asm { FMOV            V0.2D, #0.5 }
    rect.origin = _Q0;
    rect.size.width = 0.0;
    rect.size.height = 0.0;
    CGRectMakeWithDictionaryRepresentation(v18, &rect);
    -[AVApplePortraitMetadataInternal setFocusRectangle:](v5, "setFocusRectangle:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    if (v6 < 6) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = [a3 decodeIntForKey:*MEMORY[0x1E4F51188]];
    }
    [(AVApplePortraitMetadataInternal *)v5 setSDOFRenderingVersion:v24];
  }
  [(AVApplePortraitMetadataInternal *)v5 setVersion:v6];
  return [(AVApplePortraitMetadata *)self initWithInternal:v5];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = [(AVApplePortraitMetadataInternal *)self->_internal version];
  [a3 encodeInt:v5 forKey:*MEMORY[0x1E4F51190]];
  [(AVApplePortraitMetadataInternal *)self->_internal apertureFocalRatio];
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E4F51140]);
  [(AVApplePortraitMetadataInternal *)self->_internal minimumApertureFocalRatio];
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E4F51170]);
  [(AVApplePortraitMetadataInternal *)self->_internal maximumApertureFocalRatio];
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E4F51168]);
  [(AVApplePortraitMetadataInternal *)self->_internal portraitLightingEffectStrength];
  [(AVApplePortraitMetadataInternal *)self->_internal portraitLightingEffectStrength];
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E4F51178]);
  [(AVApplePortraitMetadataInternal *)self->_internal luminanceNoiseAmplitude];
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E4F51160]);
  uint64_t v6 = [(AVApplePortraitMetadataInternal *)self->_internal faceOrientation];
  [a3 encodeInt:v6 forKey:*MEMORY[0x1E4F51150]];
  uint64_t v7 = [(AVApplePortraitMetadataInternal *)self->_internal faceObservationsData];
  [a3 encodeObject:v7 forKey:*MEMORY[0x1E4F51148]];
  int v8 = [(AVApplePortraitMetadataInternal *)self->_internal indexesOfShallowDepthOfFieldObservations];
  [a3 encodeObject:v8 forKey:*MEMORY[0x1E4F51180]];
  [(AVApplePortraitMetadataInternal *)self->_internal focusRectangle];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v13);
  [a3 encodeObject:DictionaryRepresentation forKey:*MEMORY[0x1E4F51158]];

  uint64_t v10 = [(AVApplePortraitMetadataInternal *)self->_internal SDOFRenderingVersion];
  uint64_t v11 = *MEMORY[0x1E4F51188];

  [a3 encodeInt:v10 forKey:v11];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)apertureFocalRatio
{
  [(AVApplePortraitMetadataInternal *)self->_internal apertureFocalRatio];
  return result;
}

- (float)minimumApertureFocalRatio
{
  [(AVApplePortraitMetadataInternal *)self->_internal minimumApertureFocalRatio];
  return result;
}

- (float)maximumApertureFocalRatio
{
  [(AVApplePortraitMetadataInternal *)self->_internal maximumApertureFocalRatio];
  return result;
}

- (float)portraitLightingEffectStrength
{
  [(AVApplePortraitMetadataInternal *)self->_internal portraitLightingEffectStrength];
  return result;
}

- (float)luminanceNoiseAmplitude
{
  [(AVApplePortraitMetadataInternal *)self->_internal luminanceNoiseAmplitude];
  return result;
}

- (int)faceOrientation
{
  return [(AVApplePortraitMetadataInternal *)self->_internal faceOrientation];
}

- (NSData)faceObservationsData
{
  return [(AVApplePortraitMetadataInternal *)self->_internal faceObservationsData];
}

- (NSIndexSet)indexesOfShallowDepthOfFieldObservations
{
  return [(AVApplePortraitMetadataInternal *)self->_internal indexesOfShallowDepthOfFieldObservations];
}

- (CGRect)focusRectangle
{
  [(AVApplePortraitMetadataInternal *)self->_internal focusRectangle];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unsigned)SDOFRenderingVersion
{
  return [(AVApplePortraitMetadataInternal *)self->_internal SDOFRenderingVersion];
}

@end