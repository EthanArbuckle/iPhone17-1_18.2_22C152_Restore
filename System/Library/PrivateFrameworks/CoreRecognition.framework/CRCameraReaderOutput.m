@interface CRCameraReaderOutput
- (CRCameraReaderOutput)init;
- (CRCameraReaderOutput)initWithImageReaderOutput:(id)a3;
- (CRCameraReaderOutputInternal)objectInternal;
- (NSString)formattedStringValue;
- (NSString)stringValue;
- (NSString)type;
- (void)dealloc;
- (void)setObjectInternal:(id)a3;
@end

@implementation CRCameraReaderOutput

- (CRCameraReaderOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRCameraReaderOutput;
  v2 = [(CRCameraReaderOutput *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRCameraReaderOutputInternal);
    [(CRCameraReaderOutput *)v2 setObjectInternal:v3];
  }
  return v2;
}

- (CRCameraReaderOutput)initWithImageReaderOutput:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRCameraReaderOutput;
  objc_super v5 = [(CRCameraReaderOutput *)&v22 init];
  if (v5)
  {
    v6 = objc_alloc_init(CRCameraReaderOutputInternal);
    [(CRCameraReaderOutput *)v5 setObjectInternal:v6];

    v7 = [v4 stringValue];
    v8 = [(CRCameraReaderOutput *)v5 objectInternal];
    [v8 setStringValue:v7];

    [v4 boundingBox];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(CRCameraReaderOutput *)v5 objectInternal];
    objc_msgSend(v17, "setBoundingBox:", v10, v12, v14, v16);

    [v4 baselineAngle];
    LODWORD(v10) = v18;
    v19 = [(CRCameraReaderOutput *)v5 objectInternal];
    LODWORD(v20) = LODWORD(v10);
    [v19 setRotation:v20];
  }
  return v5;
}

- (void)dealloc
{
  [(CRCameraReaderOutput *)self setObjectInternal:0];
  v3.receiver = self;
  v3.super_class = (Class)CRCameraReaderOutput;
  [(CRCameraReaderOutput *)&v3 dealloc];
}

- (NSString)type
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  objc_super v3 = [v2 type];

  return (NSString *)v3;
}

- (NSString)stringValue
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  objc_super v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (NSString)formattedStringValue
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  objc_super v3 = [v2 formattedStringValue];

  return (NSString *)v3;
}

- (CRCameraReaderOutputInternal)objectInternal
{
  return (CRCameraReaderOutputInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObjectInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end