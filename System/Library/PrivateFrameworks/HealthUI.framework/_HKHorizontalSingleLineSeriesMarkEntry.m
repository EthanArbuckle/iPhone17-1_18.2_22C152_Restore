@interface _HKHorizontalSingleLineSeriesMarkEntry
- (_HKHorizontalSingleLineSeriesMarkEntry)initWithXCoord:(double)a3 markStyle:(int64_t)a4;
- (double)xCoord;
- (int64_t)markStyle;
@end

@implementation _HKHorizontalSingleLineSeriesMarkEntry

- (_HKHorizontalSingleLineSeriesMarkEntry)initWithXCoord:(double)a3 markStyle:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_HKHorizontalSingleLineSeriesMarkEntry;
  result = [(_HKHorizontalSingleLineSeriesMarkEntry *)&v7 init];
  if (result)
  {
    result->_xCoord = a3;
    result->_markStyle = a4;
  }
  return result;
}

- (double)xCoord
{
  return self->_xCoord;
}

- (int64_t)markStyle
{
  return self->_markStyle;
}

@end