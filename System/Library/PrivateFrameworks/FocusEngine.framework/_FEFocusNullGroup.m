@interface _FEFocusNullGroup
- (CGRect)boundingBox;
- (id)primaryItem;
@end

@implementation _FEFocusNullGroup

- (CGRect)boundingBox
{
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)primaryItem
{
  return 0;
}

@end