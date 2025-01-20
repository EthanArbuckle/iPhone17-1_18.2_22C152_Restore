@interface PHMediaFormatConversionJob
- (PHMediaFormatConversionRequest)conversionRequest;
- (id)completionHandler;
- (id)description;
- (void)setCompletionHandler:(id)a3;
- (void)setConversionRequest:(id)a3;
@end

@implementation PHMediaFormatConversionJob

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_conversionRequest, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setConversionRequest:(id)a3
{
}

- (PHMediaFormatConversionRequest)conversionRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PHMediaFormatConversionJob *)self conversionRequest];
  v7 = [v6 identifier];
  v8 = [v3 stringWithFormat:@"<%@ %p request identifier=%@>", v5, self, v7];

  return v8;
}

@end