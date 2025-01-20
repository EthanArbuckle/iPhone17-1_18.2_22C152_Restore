@interface SGSelfIdentificationDetection
- (NSString)context;
- (NSString)name;
- (SGExtractionInfo)extractionInfo;
- (_NSRange)contextRange;
- (void)setContext:(id)a3;
- (void)setContextRange:(_NSRange)a3;
- (void)setExtractionInfo:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SGSelfIdentificationDetection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setExtractionInfo:(id)a3
{
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (void)setContextRange:(_NSRange)a3
{
  self->_contextRange = a3;
}

- (_NSRange)contextRange
{
  NSUInteger length = self->_contextRange.length;
  NSUInteger location = self->_contextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end