@interface BLSBacklightChangeSourceEventDisplayTapMetadata
+ (BOOL)supportsSecureCoding;
- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithCoder:(id)a3;
- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithPosition:(CGPoint)a3;
- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGPoint)position;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSBacklightChangeSourceEventDisplayTapMetadata

- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)BLSBacklightChangeSourceEventDisplayTapMetadata;
  result = [(BLSBacklightChangeSourceEventDisplayTapMetadata *)&v6 init];
  if (result)
  {
    result->_position.CGFloat x = x;
    result->_position.CGFloat y = y;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendPoint:withName:", @"position", self->_position.x, self->_position.y);
  v5 = [v3 build];

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendCGPoint:", self->_position.x, self->_position.y);
  unint64_t v5 = [v3 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSBacklightChangeSourceEventDisplayTapMetadata *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      p_position = &self->_position;
      [(BLSBacklightChangeSourceEventDisplayTapMetadata *)v4 position];
      BOOL v8 = p_position->y == v7 && p_position->x == v6;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  [@"position" UTF8String];
  BSDeserializeCGPointFromXPCDictionaryWithKey();
  double v6 = v5;
  double v8 = v7;

  return -[BLSBacklightChangeSourceEventDisplayTapMetadata initWithPosition:](self, "initWithPosition:", v6, v8);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3 = a3;
  [@"position" UTF8String];
  BSSerializeCGPointToXPCDictionaryWithKey();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeSourceEventDisplayTapMetadata)initWithCoder:(id)a3
{
  [a3 decodePointForKey:@"position"];

  return -[BLSBacklightChangeSourceEventDisplayTapMetadata initWithPosition:](self, "initWithPosition:");
}

- (void)encodeWithCoder:(id)a3
{
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end