@interface TDCursorFacetDefinition
- (id)copyDataFromAttributes;
- (void)copyAttributesInto:(id)a3;
- (void)setAttributesFromCopyData:(id)a3;
@end

@implementation TDCursorFacetDefinition

- (void)copyAttributesInto:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TDCursorFacetDefinition;
  -[TDFacetDefinition copyAttributesInto:](&v5, sel_copyAttributesInto_);
  objc_msgSend(a3, "setValue:forKey:", -[TDCursorFacetDefinition valueForKey:](self, "valueForKey:", @"hotSpotX"), @"hotSpotX");
  objc_msgSend(a3, "setValue:forKey:", -[TDCursorFacetDefinition valueForKey:](self, "valueForKey:", @"hotSpotY"), @"hotSpotY");
}

- (id)copyDataFromAttributes
{
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  uint64_t v4 = [(TDCursorFacetDefinition *)self valueForKey:@"hotSpotX"];
  if (v4) {
    [v3 setObject:v4 forKey:@"hotSpotX"];
  }
  uint64_t v5 = [(TDCursorFacetDefinition *)self valueForKey:@"hotSpotY"];
  if (v5) {
    [v3 setObject:v5 forKey:@"hotSpotY"];
  }
  uint64_t v6 = [(TDCursorFacetDefinition *)self valueForKey:@"facetName"];
  if (v6) {
    [v3 setObject:v6 forKey:@"facetName"];
  }
  id v7 = [(TDFacetDefinition *)self keySpec];
  if (v7) {
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v7, "copyDataFromAttributes"), @"keySpec");
  }
  v8 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];

  return (id)[v8 copy];
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = [v4 objectForKey:@"hotSpotX"];
  if (v5) {
    [(TDCursorFacetDefinition *)self setValue:v5 forKey:@"hotSpotX"];
  }
  uint64_t v6 = [v4 objectForKey:@"hotSpotY"];
  if (v6) {
    [(TDCursorFacetDefinition *)self setValue:v6 forKey:@"hotSpotY"];
  }
  uint64_t v7 = [v4 objectForKey:@"facetName"];
  if (v7)
  {
    [(TDCursorFacetDefinition *)self setValue:v7 forKey:@"facetName"];
  }
}

@end