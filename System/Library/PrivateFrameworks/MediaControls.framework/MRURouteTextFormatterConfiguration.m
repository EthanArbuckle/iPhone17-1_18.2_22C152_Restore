@interface MRURouteTextFormatterConfiguration
- (BOOL)allowsMultitruncation;
- (BOOL)displayAsSiriSuggestion;
- (BOOL)forcesUppercaseText;
- (BOOL)omitGroupLeaderName;
- (BOOL)usesPredictedOutputDevice;
- (MRURouteTextFormatterConfiguration)init;
- (UIFont)font;
- (double)textBoundingWidth;
- (int64_t)minimumEndCharacterCount;
- (int64_t)truncationMode;
- (void)setAllowsMultitruncation:(BOOL)a3;
- (void)setDisplayAsSiriSuggestion:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setForcesUppercaseText:(BOOL)a3;
- (void)setMinimumEndCharacterCount:(int64_t)a3;
- (void)setOmitGroupLeaderName:(BOOL)a3;
- (void)setTextBoundingWidth:(double)a3;
- (void)setTruncationMode:(int64_t)a3;
- (void)setUsesPredictedOutputDevice:(BOOL)a3;
@end

@implementation MRURouteTextFormatterConfiguration

- (MRURouteTextFormatterConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)MRURouteTextFormatterConfiguration;
  result = [(MRURouteTextFormatterConfiguration *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_truncationMode = xmmword_1AE963D90;
    result->_textBoundingWidth = 1.79769313e308;
    *(_DWORD *)&result->_forcesUppercaseText = 0x1000000;
    result->_usesPredictedOutputDevice = 0;
  }
  return result;
}

- (int64_t)truncationMode
{
  return self->_truncationMode;
}

- (void)setTruncationMode:(int64_t)a3
{
  self->_truncationMode = a3;
}

- (int64_t)minimumEndCharacterCount
{
  return self->_minimumEndCharacterCount;
}

- (void)setMinimumEndCharacterCount:(int64_t)a3
{
  self->_minimumEndCharacterCount = a3;
}

- (BOOL)forcesUppercaseText
{
  return self->_forcesUppercaseText;
}

- (void)setForcesUppercaseText:(BOOL)a3
{
  self->_forcesUppercaseText = a3;
}

- (BOOL)displayAsSiriSuggestion
{
  return self->_displayAsSiriSuggestion;
}

- (void)setDisplayAsSiriSuggestion:(BOOL)a3
{
  self->_displayAsSiriSuggestion = a3;
}

- (BOOL)omitGroupLeaderName
{
  return self->_omitGroupLeaderName;
}

- (void)setOmitGroupLeaderName:(BOOL)a3
{
  self->_omitGroupLeaderName = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (double)textBoundingWidth
{
  return self->_textBoundingWidth;
}

- (void)setTextBoundingWidth:(double)a3
{
  self->_textBoundingWidth = a3;
}

- (BOOL)allowsMultitruncation
{
  return self->_allowsMultitruncation;
}

- (void)setAllowsMultitruncation:(BOOL)a3
{
  self->_allowsMultitruncation = a3;
}

- (BOOL)usesPredictedOutputDevice
{
  return self->_usesPredictedOutputDevice;
}

- (void)setUsesPredictedOutputDevice:(BOOL)a3
{
  self->_usesPredictedOutputDevice = a3;
}

- (void).cxx_destruct
{
}

@end