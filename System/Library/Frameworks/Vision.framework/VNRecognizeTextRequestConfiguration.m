@interface VNRecognizeTextRequestConfiguration
- (BOOL)automaticallyDetectsLanguage;
- (BOOL)keepResourcesLoaded;
- (BOOL)usesLanguageCorrection;
- (NSArray)customWords;
- (NSArray)recognitionLanguages;
- (VNRecognizeTextRequestConfiguration)initWithRequestClass:(Class)a3;
- (float)minimumTextHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)recognitionLevel;
- (void)setAutomaticallyDetectsLanguage:(BOOL)a3;
- (void)setCustomWords:(id)a3;
- (void)setKeepResourcesLoaded:(BOOL)a3;
- (void)setMinimumTextHeight:(float)a3;
- (void)setRecognitionLanguages:(id)a3;
- (void)setRecognitionLevel:(int64_t)a3;
- (void)setUsesLanguageCorrection:(BOOL)a3;
@end

@implementation VNRecognizeTextRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customWords, 0);

  objc_storeStrong((id *)&self->_recognitionLanguages, 0);
}

- (void)setKeepResourcesLoaded:(BOOL)a3
{
  self->_keepResourcesLoaded = a3;
}

- (BOOL)keepResourcesLoaded
{
  return self->_keepResourcesLoaded;
}

- (void)setMinimumTextHeight:(float)a3
{
  self->_minimumTextHeight = a3;
}

- (float)minimumTextHeight
{
  return self->_minimumTextHeight;
}

- (void)setAutomaticallyDetectsLanguage:(BOOL)a3
{
  self->_automaticallyDetectsLanguage = a3;
}

- (BOOL)automaticallyDetectsLanguage
{
  return self->_automaticallyDetectsLanguage;
}

- (void)setUsesLanguageCorrection:(BOOL)a3
{
  self->_usesLanguageCorrection = a3;
}

- (BOOL)usesLanguageCorrection
{
  return self->_usesLanguageCorrection;
}

- (void)setRecognitionLevel:(int64_t)a3
{
  self->_recognitionLevel = a3;
}

- (int64_t)recognitionLevel
{
  return self->_recognitionLevel;
}

- (void)setCustomWords:(id)a3
{
}

- (NSArray)customWords
{
  return self->_customWords;
}

- (void)setRecognitionLanguages:(id)a3
{
}

- (NSArray)recognitionLanguages
{
  return self->_recognitionLanguages;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizeTextRequestConfiguration;
  id v4 = [(VNStatefulRequestConfiguration *)&v8 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setRecognitionLanguages:self->_recognitionLanguages];
    [v5 setRecognitionLevel:self->_recognitionLevel];
    [v5 setUsesLanguageCorrection:self->_usesLanguageCorrection];
    [v5 setAutomaticallyDetectsLanguage:self->_automaticallyDetectsLanguage];
    *(float *)&double v6 = self->_minimumTextHeight;
    [v5 setMinimumTextHeight:v6];
    [v5 setKeepResourcesLoaded:self->_keepResourcesLoaded];
  }
  return v5;
}

- (VNRecognizeTextRequestConfiguration)initWithRequestClass:(Class)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VNRecognizeTextRequestConfiguration;
  v3 = [(VNStatefulRequestConfiguration *)&v7 initWithRequestClass:a3];
  if (v3)
  {
    v8[0] = @"en_US";
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    recognitionLanguages = v3->_recognitionLanguages;
    v3->_recognitionLanguages = (NSArray *)v4;

    v3->_recognitionLevel = 0;
    v3->_usesLanguageCorrection = 1;
    v3->_automaticallyDetectsLanguage = 0;
    v3->_minimumTextHeight = 0.0;
    v3->_keepResourcesLoaded = 0;
  }
  return v3;
}

@end