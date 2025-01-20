@interface AVMetadataObject(CameraUI)
- (uint64_t)isCat;
- (uint64_t)isDog;
- (uint64_t)isHuman;
- (uint64_t)isHumanBody;
- (uint64_t)isHumanFace;
- (uint64_t)isHumanHead;
- (uint64_t)isPetBody;
- (uint64_t)isPetHead;
- (uint64_t)isSalientObject;
@end

@implementation AVMetadataObject(CameraUI)

- (uint64_t)isHumanFace
{
  v1 = [a1 type];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263EF9F08]];

  return v2;
}

- (uint64_t)isHumanBody
{
  v1 = [a1 type];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263EF9F10]];

  return v2;
}

- (uint64_t)isHumanHead
{
  v1 = [a1 type];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263EF9F20]];

  return v2;
}

- (uint64_t)isPetHead
{
  uint64_t v2 = [a1 type];
  if ([v2 isEqualToString:*MEMORY[0x263EF9EB0]])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 type];
    uint64_t v3 = [v4 isEqualToString:*MEMORY[0x263EF9EE8]];
  }
  return v3;
}

- (uint64_t)isPetBody
{
  uint64_t v2 = [a1 type];
  if ([v2 isEqualToString:*MEMORY[0x263EF9EA8]])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 type];
    uint64_t v3 = [v4 isEqualToString:*MEMORY[0x263EF9EE0]];
  }
  return v3;
}

- (uint64_t)isSalientObject
{
  v1 = [a1 type];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263EF9F48]];

  return v2;
}

- (uint64_t)isCat
{
  uint64_t v2 = [a1 type];
  if ([v2 isEqualToString:*MEMORY[0x263EF9EB0]])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 type];
    uint64_t v3 = [v4 isEqualToString:*MEMORY[0x263EF9EA8]];
  }
  return v3;
}

- (uint64_t)isDog
{
  uint64_t v2 = [a1 type];
  if ([v2 isEqualToString:*MEMORY[0x263EF9EE8]])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 type];
    uint64_t v3 = [v4 isEqualToString:*MEMORY[0x263EF9EE0]];
  }
  return v3;
}

- (uint64_t)isHuman
{
  if ([a1 isHumanBody] & 1) != 0 || (objc_msgSend(a1, "isHumanFace")) {
    return 1;
  }
  return [a1 isHumanHead];
}

@end