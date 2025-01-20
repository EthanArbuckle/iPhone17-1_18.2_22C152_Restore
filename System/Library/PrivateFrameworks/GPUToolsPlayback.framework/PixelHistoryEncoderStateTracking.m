@interface PixelHistoryEncoderStateTracking
- (NSMutableDictionary)encoderStateFunctionIndexes;
- (NSMutableDictionary)filteredGenerationOptions;
- (unsigned)encoderFunctionIndex;
- (unsigned)lastInterestingFunctionIndex;
- (void)setEncoderFunctionIndex:(unsigned int)a3;
- (void)setEncoderStateFunctionIndexes:(id)a3;
- (void)setFilteredGenerationOptions:(id)a3;
- (void)setLastInterestingFunctionIndex:(unsigned int)a3;
@end

@implementation PixelHistoryEncoderStateTracking

- (unsigned)encoderFunctionIndex
{
  return self->_encoderFunctionIndex;
}

- (void)setEncoderFunctionIndex:(unsigned int)a3
{
  self->_encoderFunctionIndex = a3;
}

- (NSMutableDictionary)filteredGenerationOptions
{
  return self->_filteredGenerationOptions;
}

- (void)setFilteredGenerationOptions:(id)a3
{
}

- (unsigned)lastInterestingFunctionIndex
{
  return self->_lastInterestingFunctionIndex;
}

- (void)setLastInterestingFunctionIndex:(unsigned int)a3
{
  self->_lastInterestingFunctionIndex = a3;
}

- (NSMutableDictionary)encoderStateFunctionIndexes
{
  return self->_encoderStateFunctionIndexes;
}

- (void)setEncoderStateFunctionIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoderStateFunctionIndexes, 0);
  objc_storeStrong((id *)&self->_filteredGenerationOptions, 0);
}

@end