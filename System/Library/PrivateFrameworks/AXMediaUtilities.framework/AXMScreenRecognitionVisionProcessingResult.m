@interface AXMScreenRecognitionVisionProcessingResult
- (BOOL)sameScreenCapResult;
- (NSArray)sortedFeatures;
- (NSData)screenEquivalenceToken;
- (void)setSameScreenCapResult:(BOOL)a3;
- (void)setScreenEquivalenceToken:(id)a3;
- (void)setSortedFeatures:(id)a3;
@end

@implementation AXMScreenRecognitionVisionProcessingResult

- (BOOL)sameScreenCapResult
{
  return self->_sameScreenCapResult;
}

- (void)setSameScreenCapResult:(BOOL)a3
{
  self->_sameScreenCapResult = a3;
}

- (NSData)screenEquivalenceToken
{
  return self->_screenEquivalenceToken;
}

- (void)setScreenEquivalenceToken:(id)a3
{
}

- (NSArray)sortedFeatures
{
  return self->_sortedFeatures;
}

- (void)setSortedFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedFeatures, 0);

  objc_storeStrong((id *)&self->_screenEquivalenceToken, 0);
}

@end