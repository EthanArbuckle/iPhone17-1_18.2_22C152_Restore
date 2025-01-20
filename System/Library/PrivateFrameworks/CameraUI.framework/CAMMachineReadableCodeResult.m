@interface CAMMachineReadableCodeResult
- (AVMetadataMachineReadableCodeObject)underlyingMachineReadableCodeObject;
- (BOOL)isOfSignificantSize;
- (CAMMachineReadableCodeResult)initWithMachineReadableCodeObject:(id)a3;
- (NSString)metadataType;
- (NSString)symbolString;
- (NSString)uniqueIdentifier;
- (int64_t)mrcType;
@end

@implementation CAMMachineReadableCodeResult

- (CAMMachineReadableCodeResult)initWithMachineReadableCodeObject:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMMachineReadableCodeResult;
  v6 = [(CAMMachineReadableCodeResult *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingMachineReadableCodeObject, a3);
    v8 = NSString;
    v9 = [v5 type];
    v10 = [(CAMMachineReadableCodeResult *)v7 symbolString];
    uint64_t v11 = [v8 stringWithFormat:@"%@ %@", v9, v10];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v11;

    v13 = v7;
  }

  return v7;
}

- (BOOL)isOfSignificantSize
{
  v2 = [(CAMMachineReadableCodeResult *)self underlyingMachineReadableCodeObject];
  v3 = +[CAMCaptureCapabilities capabilities];
  [v2 bounds];
  double v5 = v4;
  [v3 minimumMachineReadableCodeNormalizedHeight];
  BOOL v7 = v5 >= v6;

  return v7;
}

- (int64_t)mrcType
{
  v2 = [(CAMMachineReadableCodeResult *)self underlyingMachineReadableCodeObject];
  v3 = [v2 descriptor];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = 0;
  }
  else
  {
    double v5 = [v2 basicDescriptor];
    double v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 objectForKeyedSubscript:@"BarcodeType"];
      if ([v7 isEqualToString:*MEMORY[0x263EF9E98]]) {
        int64_t v4 = 1;
      }
      else {
        int64_t v4 = 2;
      }
    }
    else
    {
      int64_t v4 = 2;
    }
  }
  return v4;
}

- (NSString)symbolString
{
  v3 = [(CAMMachineReadableCodeResult *)self underlyingMachineReadableCodeObject];
  int64_t v4 = [(CAMMachineReadableCodeResult *)self mrcType];
  if (v4 == 1)
  {
    v8 = [v3 basicDescriptor];
    double v5 = [v8 objectForKeyedSubscript:@"RawData"];

    BOOL v7 = [v5 description];
    goto LABEL_5;
  }
  if (!v4)
  {
    double v5 = [v3 descriptor];
    double v6 = [v5 errorCorrectedPayload];
    BOOL v7 = [v6 description];

LABEL_5:
    goto LABEL_7;
  }
  BOOL v7 = &stru_26BD78BA0;
LABEL_7:

  return (NSString *)v7;
}

- (NSString)metadataType
{
  v2 = [(CAMMachineReadableCodeResult *)self underlyingMachineReadableCodeObject];
  v3 = [v2 type];

  return (NSString *)v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (AVMetadataMachineReadableCodeObject)underlyingMachineReadableCodeObject
{
  return self->_underlyingMachineReadableCodeObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMachineReadableCodeObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end