@interface TDLayerMapping
- (id)copyDataFromAttributes;
- (void)setAttributesFromCopyData:(id)a3;
@end

@implementation TDLayerMapping

- (id)copyDataFromAttributes
{
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  uint64_t v4 = [(TDLayerMapping *)self valueForKey:@"photoshopLayerIndex"];
  if (v4) {
    [v3 setObject:v4 forKey:@"photoshopLayerIndex"];
  }
  v5 = (void *)[(TDLayerMapping *)self valueForKey:@"themeDrawingLayer"];
  if (v5) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "identifier")), @"themeDrawingLayer");
  }
  v6 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];

  return (id)[v6 copy];
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AC0], "propertyListWithData:options:format:error:", a3, 0, 0, 0), "objectForKey:", @"photoshopLayerIndex");
  if (v4)
  {
    [(TDLayerMapping *)self setValue:v4 forKey:@"photoshopLayerIndex"];
  }
}

@end