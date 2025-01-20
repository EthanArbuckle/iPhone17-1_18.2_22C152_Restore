@interface TDImageStackAsset
- (BOOL)hasCursorProduction;
- (BOOL)hasProduction;
- (id)imageStackDataWithDocument:(id)a3;
@end

@implementation TDImageStackAsset

- (id)imageStackDataWithDocument:(id)a3
{
  uint64_t v3 = objc_msgSend(-[TDAsset fileURLWithDocument:](self, "fileURLWithDocument:", a3), "URLByAppendingPathComponent:isDirectory:", @"Contents.json", 0);
  uint64_t v5 = 0;
  return (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:2 error:&v5];
}

- (BOOL)hasCursorProduction
{
  return 0;
}

- (BOOL)hasProduction
{
  uint64_t v3 = [(TDImageStackAsset *)self renditions];
  if (v3) {
    LOBYTE(v3) = objc_msgSend((id)-[TDImageStackAsset renditions](self, "renditions"), "count") != 0;
  }
  return v3;
}

@end