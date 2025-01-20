@interface PKDataDetectorQueryItem
- (BOOL)isEqual:(id)a3;
- (CHDataDetectorQueryItem)coreHandwritingDataDetectorQueryItem;
- (DDScannerResult)scannerResult;
- (PKDataDetectorQueryItem)initWithCoreHandwritingDataDetectorQueryItem:(id)a3;
- (id)baselinePath;
- (id)strokeIdentifiers;
- (unint64_t)hash;
- (void)setCoreHandwritingDataDetectorQueryItem:(id)a3;
@end

@implementation PKDataDetectorQueryItem

- (PKDataDetectorQueryItem)initWithCoreHandwritingDataDetectorQueryItem:(id)a3
{
  v4 = (CHDataDetectorQueryItem *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDataDetectorQueryItem;
  v5 = [(PKDataDetectorQueryItem *)&v8 init];
  coreHandwritingDataDetectorQueryItem = v5->_coreHandwritingDataDetectorQueryItem;
  v5->_coreHandwritingDataDetectorQueryItem = v4;

  return v5;
}

- (id)strokeIdentifiers
{
  return (id)[(CHDataDetectorQueryItem *)self->_coreHandwritingDataDetectorQueryItem strokeIdentifiers];
}

- (DDScannerResult)scannerResult
{
  return (DDScannerResult *)[(CHDataDetectorQueryItem *)self->_coreHandwritingDataDetectorQueryItem dataDetectorResult];
}

- (id)baselinePath
{
  v2 = (void *)MEMORY[0x1E4FB14C0];
  uint64_t v3 = [(CHDataDetectorQueryItem *)self->_coreHandwritingDataDetectorQueryItem estimatedBaseline];

  return (id)[v2 bezierPathWithCGPath:v3];
}

- (unint64_t)hash
{
  return [(CHDataDetectorQueryItem *)self->_coreHandwritingDataDetectorQueryItem hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKDataDetectorQueryItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      coreHandwritingDataDetectorQueryItem = self->_coreHandwritingDataDetectorQueryItem;
      v6 = [(PKDataDetectorQueryItem *)v4 coreHandwritingDataDetectorQueryItem];
      char v7 = [(CHDataDetectorQueryItem *)coreHandwritingDataDetectorQueryItem isEqualToDataDetectorQueryItem:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (CHDataDetectorQueryItem)coreHandwritingDataDetectorQueryItem
{
  return self->_coreHandwritingDataDetectorQueryItem;
}

- (void)setCoreHandwritingDataDetectorQueryItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end