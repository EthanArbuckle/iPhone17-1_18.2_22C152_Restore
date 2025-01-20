@interface _AAUIRawImageAndCropRectCacheEntry
+ (id)entryWithRawImage:(id)a3 rawCropRect:(CGRect)a4 serverCacheTag:(id)a5;
- (BOOL)isValid;
- (CGRect)rawCropRect;
- (NSDate)expirationDate;
- (NSString)serverCacheTag;
- (UIImage)rawImage;
@end

@implementation _AAUIRawImageAndCropRectCacheEntry

+ (id)entryWithRawImage:(id)a3 rawCropRect:(CGRect)a4 serverCacheTag:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v10 = (UIImage *)a3;
  id v11 = a5;
  v12 = objc_alloc_init(_AAUIRawImageAndCropRectCacheEntry);
  rawImage = v12->_rawImage;
  v12->_rawImage = v10;
  v14 = v10;

  v12->_rawCropRect.origin.CGFloat x = x;
  v12->_rawCropRect.origin.CGFloat y = y;
  v12->_rawCropRect.size.CGFloat width = width;
  v12->_rawCropRect.size.CGFloat height = height;
  uint64_t v15 = [v11 copy];

  serverCacheTag = v12->_serverCacheTag;
  v12->_serverCacheTag = (NSString *)v15;

  v17 = [MEMORY[0x263EFF910] date];
  uint64_t v18 = [v17 dateByAddingTimeInterval:60.0];
  expirationDate = v12->_expirationDate;
  v12->_expirationDate = (NSDate *)v18;

  return v12;
}

- (BOOL)isValid
{
  v3 = [MEMORY[0x263EFF910] date];
  LOBYTE(self) = [v3 compare:self->_expirationDate] != 1;

  return (char)self;
}

- (UIImage)rawImage
{
  return self->_rawImage;
}

- (CGRect)rawCropRect
{
  double x = self->_rawCropRect.origin.x;
  double y = self->_rawCropRect.origin.y;
  double width = self->_rawCropRect.size.width;
  double height = self->_rawCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_rawImage, 0);
}

@end