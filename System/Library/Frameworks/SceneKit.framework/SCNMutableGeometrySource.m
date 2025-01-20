@interface SCNMutableGeometrySource
- (NSMutableData)mutableData;
@end

@implementation SCNMutableGeometrySource

- (NSMutableData)mutableData
{
  return (NSMutableData *)self->super._data;
}

@end