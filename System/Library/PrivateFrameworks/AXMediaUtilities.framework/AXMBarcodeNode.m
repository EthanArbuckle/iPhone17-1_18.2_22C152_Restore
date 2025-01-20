@interface AXMBarcodeNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AVCaptureMetadataOutput)captureOutput;
- (void)setCaptureOutput:(id)a3;
@end

@implementation AXMBarcodeNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"Barcode";
}

- (AVCaptureMetadataOutput)captureOutput
{
  return self->_captureOutput;
}

- (void)setCaptureOutput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end