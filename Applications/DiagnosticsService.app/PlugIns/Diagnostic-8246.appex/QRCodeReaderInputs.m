@interface QRCodeReaderInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (NSArray)codeTypes;
- (NSNumber)timeout;
- (NSString)viewfinderInstruction;
- (void)setCodeTypes:(id)a3;
- (void)setTimeout:(id)a3;
- (void)setViewfinderInstruction:(id)a3;
@end

@implementation QRCodeReaderInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v13 = 0;
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [v4 dk_stringFromRequiredKey:@"viewfinderInstruction" maxLength:1000 failed:&v13];
  [(QRCodeReaderInputs *)self setViewfinderInstruction:v5];

  v6 = [v4 dk_numberFromKey:@"timeout" lowerBound:&off_10000C5E8 upperBound:&off_10000C600 defaultValue:&off_10000C5E8 failed:&v13];
  [(QRCodeReaderInputs *)self setTimeout:v6];

  v14[0] = AVMetadataObjectTypeUPCECode;
  v14[1] = AVMetadataObjectTypeCode39Code;
  v14[2] = AVMetadataObjectTypeCode39Mod43Code;
  v14[3] = AVMetadataObjectTypeEAN13Code;
  v14[4] = AVMetadataObjectTypeEAN8Code;
  v14[5] = AVMetadataObjectTypeCode93Code;
  v14[6] = AVMetadataObjectTypeCode128Code;
  v14[7] = AVMetadataObjectTypePDF417Code;
  v14[8] = AVMetadataObjectTypeQRCode;
  v14[9] = AVMetadataObjectTypeAztecCode;
  v14[10] = AVMetadataObjectTypeInterleaved2of5Code;
  v14[11] = AVMetadataObjectTypeITF14Code;
  v14[12] = AVMetadataObjectTypeDataMatrixCode;
  v7 = +[NSArray arrayWithObjects:v14 count:13];
  v8 = +[NSSet setWithArray:v7];
  v9 = [v4 dk_arrayFromRequiredKey:@"codeTypes" inSet:v8 maxLength:13 failed:&v13];

  [(QRCodeReaderInputs *)self setCodeTypes:v9];
  v10 = [(QRCodeReaderInputs *)self codeTypes];
  id v11 = [v10 count];

  if (!v11) {
    char v13 = 1;
  }

  return v13 == 0;
}

- (NSString)viewfinderInstruction
{
  return self->_viewfinderInstruction;
}

- (void)setViewfinderInstruction:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (NSArray)codeTypes
{
  return self->_codeTypes;
}

- (void)setCodeTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeTypes, 0);
  objc_storeStrong((id *)&self->_timeout, 0);

  objc_storeStrong((id *)&self->_viewfinderInstruction, 0);
}

@end