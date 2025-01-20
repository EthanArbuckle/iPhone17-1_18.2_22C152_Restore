@interface VNDataDetectorResult
- (BCSDetectedCode)detectedBarcodeSupportCode;
- (DDScannerResult)scannerResult;
- (NSString)shortDescription;
- (NSString)value;
- (VNDataDetectorResult)initWithBCSDetectedCode:(id)a3 description:(id)a4 observation:(id)a5;
- (VNDataDetectorResult)initWithDDScannerResult:(id)a3 observation:(id)a4;
- (VNObservation)originalObservation;
- (id)debugDescription;
- (unint64_t)type;
- (void)setDetectedBarcodeSupportCode:(id)a3;
- (void)setOriginalObservation:(id)a3;
- (void)setScannerResult:(id)a3;
- (void)setShortDescription:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation VNDataDetectorResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedBarcodeSupportCode, 0);
  objc_storeStrong((id *)&self->_originalObservation, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);

  objc_storeStrong((id *)&self->_scannerResult, 0);
}

- (void)setDetectedBarcodeSupportCode:(id)a3
{
}

- (BCSDetectedCode)detectedBarcodeSupportCode
{
  return self->_detectedBarcodeSupportCode;
}

- (void)setOriginalObservation:(id)a3
{
}

- (VNObservation)originalObservation
{
  return self->_originalObservation;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setShortDescription:(id)a3
{
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (void)setScannerResult:(id)a3
{
}

- (DDScannerResult)scannerResult
{
  return self->_scannerResult;
}

- (id)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)VNDataDetectorResult;
  v3 = [(VNDataDetectorResult *)&v7 debugDescription];
  v4 = [(VNDataDetectorResult *)self shortDescription];
  v5 = [v3 stringByAppendingFormat:@" shortDescription=\"%@\", type=%ld", v4, -[VNDataDetectorResult type](self, "type")];

  return v5;
}

- (VNDataDetectorResult)initWithBCSDetectedCode:(id)a3 description:(id)a4 observation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VNDataDetectorResult;
  v12 = [(VNDataDetectorResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_detectedBarcodeSupportCode, a3);
    objc_storeStrong((id *)&v13->_originalObservation, a5);
    objc_storeStrong((id *)&v13->_shortDescription, a4);
  }

  return v13;
}

- (VNDataDetectorResult)initWithDDScannerResult:(id)a3 observation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VNDataDetectorResult;
  id v9 = [(VNDataDetectorResult *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scannerResult, a3);
    objc_storeStrong((id *)&v10->_originalObservation, a4);
    uint64_t v11 = [v7 matchedString];
    shortDescription = v10->_shortDescription;
    v10->_shortDescription = (NSString *)v11;

    uint64_t v13 = [v7 value];
    value = v10->_value;
    v10->_value = (NSString *)v13;

    unsigned int v15 = [v7 category] - 1;
    if (v15 > 3) {
      unint64_t v16 = 0;
    }
    else {
      unint64_t v16 = qword_1A4123C20[v15];
    }
    v10->_type = v16;
  }

  return v10;
}

@end