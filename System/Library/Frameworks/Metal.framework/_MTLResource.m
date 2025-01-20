@interface _MTLResource
- (_MTLResource)init;
- (int64_t)compressionType;
- (unint64_t)allocationID;
- (unint64_t)colorSpaceConversionMatrix;
- (unint64_t)compressionFootprint;
@end

@implementation _MTLResource

- (int64_t)compressionType
{
  return [(_MTLResource *)self compressionFootprint] != 0;
}

- (_MTLResource)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLResource;
  return [(_MTLAllocation *)&v3 initWithAllocationType:1];
}

- (unint64_t)allocationID
{
  return 0;
}

- (unint64_t)compressionFootprint
{
  return 0;
}

- (unint64_t)colorSpaceConversionMatrix
{
  return 0;
}

@end