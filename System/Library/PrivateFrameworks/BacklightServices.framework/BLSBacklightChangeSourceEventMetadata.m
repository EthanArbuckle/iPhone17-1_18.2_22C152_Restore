@interface BLSBacklightChangeSourceEventMetadata
+ (BOOL)supportsSecureCoding;
- (BLSBacklightChangeSourceEventMetadata)initWithCoder:(id)a3;
- (BLSBacklightChangeSourceEventMetadata)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSBacklightChangeSourceEventMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"BLSBacklightChangeSourceEventMetadata is an abstract class"];

  return self;
}

- (BLSBacklightChangeSourceEventMetadata)initWithXPCDictionary:(id)a3
{
  return 0;
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeSourceEventMetadata)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

@end