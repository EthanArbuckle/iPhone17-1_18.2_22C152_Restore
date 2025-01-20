@interface CSSceneClassification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)boundingBox;
- (CSSceneClassification)initWithCoder:(id)a3;
- (CSSceneClassification)initWithLabel:(id)a3 synonyms:(id)a4 confidence:(double)a5 sceneIdentifier:(unint64_t)a6;
- (float)sceneArea;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mediaType;
- (int64_t)sceneType;
- (unint64_t)hash;
- (unint64_t)sceneIdentifier;
- (void)encodeWithCSCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundingBox:(CGRect)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setSceneArea:(float)a3;
- (void)setSceneIdentifier:(unint64_t)a3;
- (void)setSceneType:(int64_t)a3;
@end

@implementation CSSceneClassification

- (CSSceneClassification)initWithLabel:(id)a3 synonyms:(id)a4 confidence:(double)a5 sceneIdentifier:(unint64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)CSSceneClassification;
  result = [(CSExternalAnalysisTag *)&v8 initWithLabel:a3 synonyms:a4 confidence:a5];
  if (result)
  {
    result->_sceneIdentifier = a6;
    result->_sceneType = 1;
    result->_mediaType = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSSceneClassification;
  id v4 = a3;
  [(CSExternalAnalysisTag *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_sceneIdentifier, @"sceneIdentifier", v6.receiver, v6.super_class);
  [v4 encodeInteger:self->_sceneType forKey:@"sceneType"];
  *(float *)&double v5 = self->_sceneArea;
  [v4 encodeFloat:@"sceneArea" forKey:v5];
}

- (CSSceneClassification)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSSceneClassification;
  double v5 = [(CSExternalAnalysisTag *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_sceneIdentifier = [v4 decodeInt64ForKey:@"sceneIdentifier"];
    if ([v4 containsValueForKey:@"sceneType"]) {
      v5->_sceneType = [v4 decodeIntegerForKey:@"sceneType"];
    }
    if ([v4 containsValueForKey:@"sceneArea"]) {
      v5->_sceneArea = (float)[v4 decodeIntegerForKey:@"sceneArea"];
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:self->super._label synonyms:self->super._synonyms confidence:self->_sceneIdentifier sceneIdentifier:self->super._confidence];
  objc_msgSend(v4, "setBoundingBox:", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  [v4 setSceneType:self->_sceneType];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)CSSceneClassification;
    if ([(CSExternalAnalysisTag *)&v11 isEqual:v5]
      && (unint64_t sceneIdentifier = self->_sceneIdentifier, sceneIdentifier == [v5 sceneIdentifier])
      && (int64_t sceneType = self->_sceneType, sceneType == [v5 sceneType]))
    {
      int64_t mediaType = self->_mediaType;
      BOOL v9 = mediaType == [v5 mediaType];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)CSSceneClassification;
  unint64_t v3 = [(CSExternalAnalysisTag *)&v6 hash];
  unint64_t v4 = MDUHash64(self->_sceneIdentifier);
  return v4 ^ v3 ^ MDUHash64(self->_sceneType);
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p %@", objc_opt_class(), self, self->super._label];
  unint64_t v4 = v3;
  if (self->super._confidence != 0.0) {
    objc_msgSend(v3, "appendFormat:", @" confidence: %f", *(void *)&self->super._confidence);
  }
  if (self->_sceneIdentifier) {
    objc_msgSend(v4, "appendFormat:", @" id: %llu", self->_sceneIdentifier);
  }
  if (self->_sceneType) {
    objc_msgSend(v4, "appendFormat:", @" sceneType: %u", self->_sceneType);
  }
  if (self->_mediaType) {
    objc_msgSend(v4, "appendFormat:", @" mediaType: %u", self->_mediaType);
  }
  float sceneArea = self->_sceneArea;
  if (sceneArea != 0.0) {
    objc_msgSend(v4, "appendFormat:", @" sceneArea: %u", sceneArea);
  }
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  if (x != 0.0 || y != 0.0 || self->_boundingBox.size.width != 0.0 || self->_boundingBox.size.height != 0.0) {
    [v4 appendFormat:@" bounding: (x: %f, y: %f, w: %f, h: %f)", *(void *)&x, *(void *)&y, *(void *)&self->_boundingBox.size.width, *(void *)&self->_boundingBox.size.height];
  }
  [v4 appendFormat:@" label: %@", self->super._label];
  if ([(NSArray *)self->super._synonyms count])
  {
    objc_super v8 = [(NSArray *)self->super._synonyms componentsJoinedByString:@", "];
    [v4 appendFormat:@" synonyms: <%@>", v8];
  }
  [v4 appendString:@">"];

  return v4;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(unint64_t)a3
{
  self->_unint64_t sceneIdentifier = a3;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_boundingBox, &v3, 32, 1, 0);
}

- (float)sceneArea
{
  return self->_sceneArea;
}

- (void)setSceneArea:(float)a3
{
  self->_float sceneArea = a3;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(int64_t)a3
{
  self->_int64_t sceneType = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_int64_t mediaType = a3;
}

- (void)encodeWithCSCoder:(id)a3
{
  id v15 = a3;
  [v15 beginType:"CSSceneClassification"];
  id v4 = [(CSExternalAnalysisTag *)self label];
  objc_msgSend(v15, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  uint64_t v5 = [(CSExternalAnalysisTag *)self synonyms];
  objc_super v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  [v15 encodeObject:v7];

  [(CSExternalAnalysisTag *)self confidence];
  objc_msgSend(v15, "encodeDouble:");
  objc_msgSend(v15, "encodeInt32:", -[CSSceneClassification sceneIdentifier](self, "sceneIdentifier"));
  [(CSSceneClassification *)self boundingBox];
  double v11 = v8;
  double v12 = v9;
  double v13 = v10;
  if (v14 != 0.0 || v8 != 0.0 || v9 != 0.0 || v10 != 0.0)
  {
    objc_msgSend(v15, "encodeDouble:");
    [v15 encodeDouble:v11];
    [v15 encodeDouble:v12];
    [v15 encodeDouble:v13];
  }
  objc_msgSend(v15, "encodeInt32:", -[CSSceneClassification sceneType](self, "sceneType"));
  objc_msgSend(v15, "encodeInt32:", -[CSSceneClassification mediaType](self, "mediaType"));
  [v15 endType];
}

@end