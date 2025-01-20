@interface BCSDataDetectorsScannerResultData
+ (BOOL)supportsSecureCoding;
- (BCSDataDetectorsScannerResultData)initWithCoder:(id)a3;
- (BCSDataDetectorsScannerResultData)initWithScannerResult:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5;
- (DDScannerResult)scannerResult;
- (NSString)extraPreviewText;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSDataDetectorsScannerResultData

- (BCSDataDetectorsScannerResultData)initWithScannerResult:(id)a3 type:(int64_t)a4 extraPreviewText:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BCSDataDetectorsScannerResultData;
  v11 = [(BCSDataDetectorsScannerResultData *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scannerResult, a3);
    v12->_type = a4;
    uint64_t v13 = [v10 copy];
    extraPreviewText = v12->_extraPreviewText;
    v12->_extraPreviewText = (NSString *)v13;

    v15 = v12;
  }

  return v12;
}

- (BCSDataDetectorsScannerResultData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", getDDScannerResultClass(), @"scannerResult");
  v6 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"type");
  v7 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"extraPreviewText");

  v8 = -[BCSDataDetectorsScannerResultData initWithScannerResult:type:extraPreviewText:](self, "initWithScannerResult:type:extraPreviewText:", v5, [v6 integerValue], v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  scannerResult = self->_scannerResult;
  id v5 = a3;
  [v5 encodeObject:scannerResult forKey:@"scannerResult"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_extraPreviewText forKey:@"extraPreviewText"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)extraPreviewText
{
  return self->_extraPreviewText;
}

- (DDScannerResult)scannerResult
{
  return self->_scannerResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerResult, 0);
  objc_storeStrong((id *)&self->_extraPreviewText, 0);
}

@end