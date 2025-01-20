@interface _VOTTextMarkerRange
- (NSData)endMarker;
- (NSData)startMarker;
- (void)setEndMarker:(id)a3;
- (void)setStartMarker:(id)a3;
@end

@implementation _VOTTextMarkerRange

- (NSData)startMarker
{
  return self->_startMarker;
}

- (void)setStartMarker:(id)a3
{
}

- (NSData)endMarker
{
  return self->_endMarker;
}

- (void)setEndMarker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endMarker, 0);

  objc_storeStrong((id *)&self->_startMarker, 0);
}

@end