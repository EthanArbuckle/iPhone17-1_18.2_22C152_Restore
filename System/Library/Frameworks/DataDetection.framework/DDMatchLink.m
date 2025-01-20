@interface DDMatchLink
- (DDMatchLink)initWithDDScannerResult:(id)a3;
- (NSURL)URL;
@end

@implementation DDMatchLink

- (DDMatchLink)initWithDDScannerResult:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDMatchLink;
  v5 = [(DDMatch *)&v9 initWithDDScannerResult:v4];
  if (v5)
  {
    uint64_t v6 = [v4 url];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;
  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end