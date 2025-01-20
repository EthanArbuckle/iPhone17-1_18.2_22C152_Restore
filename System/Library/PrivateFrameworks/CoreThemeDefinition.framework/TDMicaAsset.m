@interface TDMicaAsset
- (BOOL)hasCursorProduction;
- (BOOL)hasProduction;
- (id)_productionWithRenditionsInProductions:(id)a3;
- (id)copyDataFromAttributes;
- (id)production;
- (void)setAttributesFromCopyData:(id)a3;
@end

@implementation TDMicaAsset

- (id)_productionWithRenditionsInProductions:(id)a3
{
  v4 = objc_msgSend(a3, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"renditions != nil"));
  uint64_t v5 = [v4 count];
  if (!v5)
  {
    v7 = 0;
    v8 = @"WARNING: No production of %@ has any renditions.";
    goto LABEL_5;
  }
  uint64_t v6 = v5;
  v7 = (void *)[v4 objectAtIndex:0];
  if (v6 != 1)
  {
    v8 = @"WARNING: No active productions for %@, and more than one has renditions";
LABEL_5:
    NSLog(&v8->isa, [(TDAsset *)self sourceRelativePath]);
  }
  return v7;
}

- (BOOL)hasCursorProduction
{
  return 0;
}

- (id)production
{
  v3 = objc_msgSend((id)-[TDMicaAsset productions](self, "productions"), "allObjects");
  uint64_t v4 = [v3 count];
  if (v4 <= 1) {
    id result = 0;
  }
  else {
    id result = [(TDMicaAsset *)self _productionWithRenditionsInProductions:v3];
  }
  if (v4 >= 1 && !result)
  {
    return (id)[v3 objectAtIndex:0];
  }
  return result;
}

- (BOOL)hasProduction
{
  return [(TDMicaAsset *)self production] != 0;
}

- (id)copyDataFromAttributes
{
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  uint64_t v4 = [(TDMicaAsset *)self valueForKey:@"category"];
  if (v4) {
    [v3 setObject:v4 forKey:@"category"];
  }
  uint64_t v5 = [(TDMicaAsset *)self valueForKey:@"name"];
  if (v5) {
    [v3 setObject:v5 forKey:@"name"];
  }
  uint64_t v6 = (void *)[(TDMicaAsset *)self valueForKey:@"source"];
  if (v6) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "valueForKey:", @"path"), @"source");
  }
  v7 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];

  return (id)[v7 copy];
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = [v4 objectForKey:@"category"];
  if (v5) {
    [(TDMicaAsset *)self setValue:v5 forKey:@"category"];
  }
  uint64_t v6 = [v4 objectForKey:@"name"];
  if (v6)
  {
    [(TDMicaAsset *)self setValue:v6 forKey:@"name"];
  }
}

@end