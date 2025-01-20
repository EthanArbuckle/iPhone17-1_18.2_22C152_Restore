@interface UTType(ITK)
- (uint64_t)itk_isGIF;
- (uint64_t)itk_isHEIC;
- (uint64_t)itk_isHEICS;
- (uint64_t)itk_isJPEG;
- (uint64_t)itk_isPNG;
- (uint64_t)itk_isWebP;
@end

@implementation UTType(ITK)

- (uint64_t)itk_isPNG
{
  return [a1 conformsToType:*MEMORY[0x263F1DC08]];
}

- (uint64_t)itk_isHEIC
{
  return [a1 conformsToType:*MEMORY[0x263F1DAE8]];
}

- (uint64_t)itk_isJPEG
{
  return [a1 conformsToType:*MEMORY[0x263F1DB40]];
}

- (uint64_t)itk_isHEICS
{
  v2 = [MEMORY[0x263F1D920] typeWithIdentifier:@"public.heics"];
  uint64_t v3 = [a1 conformsToType:v2];

  return v3;
}

- (uint64_t)itk_isWebP
{
  return [a1 conformsToType:*MEMORY[0x263F1DD78]];
}

- (uint64_t)itk_isGIF
{
  return [a1 conformsToType:*MEMORY[0x263F1DAD0]];
}

@end