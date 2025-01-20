@interface SGExtractionScannerWrapper
- (SGExtractionScannerWrapper)init;
- (void)dealloc;
@end

@implementation SGExtractionScannerWrapper

- (void)dealloc
{
  ddScanner = self->_ddScanner;
  if (ddScanner) {
    CFRelease(ddScanner);
  }
  v4.receiver = self;
  v4.super_class = (Class)SGExtractionScannerWrapper;
  [(SGExtractionScannerWrapper *)&v4 dealloc];
}

- (SGExtractionScannerWrapper)init
{
  v4.receiver = self;
  v4.super_class = (Class)SGExtractionScannerWrapper;
  v2 = [(SGExtractionScannerWrapper *)&v4 init];
  if (v2) {
    v2->_ddScanner = (__DDScanner *)SGDataDetectorsCreateScannerOrFail();
  }
  return v2;
}

@end