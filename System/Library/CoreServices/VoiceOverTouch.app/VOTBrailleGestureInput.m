@interface VOTBrailleGestureInput
- (NSArray)seriesOfTouchPoints;
- (NSString)languageCode;
- (id)description;
- (void)setLanguageCode:(id)a3;
- (void)setSeriesOfTouchPoints:(id)a3;
@end

@implementation VOTBrailleGestureInput

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)VOTBrailleGestureInput;
  v3 = [(VOTBrailleGestureInput *)&v8 description];
  v4 = [(VOTBrailleGestureInput *)self seriesOfTouchPoints];
  v5 = [(VOTBrailleGestureInput *)self languageCode];
  v6 = [v3 stringByAppendingFormat:@" - touch points: %@, language code: %@", v4, v5];

  return v6;
}

- (NSArray)seriesOfTouchPoints
{
  return self->_seriesOfTouchPoints;
}

- (void)setSeriesOfTouchPoints:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);

  objc_storeStrong((id *)&self->_seriesOfTouchPoints, 0);
}

@end