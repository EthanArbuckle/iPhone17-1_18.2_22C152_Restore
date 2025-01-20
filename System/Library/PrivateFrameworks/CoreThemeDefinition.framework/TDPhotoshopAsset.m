@interface TDPhotoshopAsset
- (BOOL)hasCursorProduction;
- (BOOL)hasProduction;
- (id)_activeProductionWithRenditionsInProductions:(id)a3;
- (id)_productionWithRenditionsInProductions:(id)a3;
- (id)copyDataFromAttributes;
- (id)production;
- (void)setAttributesFromCopyData:(id)a3;
@end

@implementation TDPhotoshopAsset

- (id)_activeProductionWithRenditionsInProductions:(id)a3
{
  v4 = objc_msgSend(a3, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"renditions != nil AND isActive == 1"));
  uint64_t v5 = [v4 count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  v7 = (void *)[v4 objectAtIndex:0];
  if (v6 != 1) {
    NSLog(&cfstr_WarningMoreTha.isa, [(TDAsset *)self sourceRelativePath]);
  }
  return v7;
}

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
  int v3 = [(TDPhotoshopAsset *)self hasProduction];
  if (v3)
  {
    [(TDPhotoshopAsset *)self production];
    objc_opt_class();
    LOBYTE(v3) = objc_opt_isKindOfClass();
  }
  return v3 & 1;
}

- (id)production
{
  int v3 = objc_msgSend((id)-[TDPhotoshopAsset productions](self, "productions"), "allObjects");
  uint64_t v4 = [v3 count];
  if (v4 <= 1)
  {
    id result = 0;
  }
  else
  {
    id result = [(TDPhotoshopAsset *)self _activeProductionWithRenditionsInProductions:v3];
    if (result) {
      return result;
    }
    id result = [(TDPhotoshopAsset *)self _productionWithRenditionsInProductions:v3];
  }
  if (v4 >= 1 && !result)
  {
    return (id)[v3 objectAtIndex:0];
  }
  return result;
}

- (BOOL)hasProduction
{
  return [(TDPhotoshopAsset *)self production] != 0;
}

- (id)copyDataFromAttributes
{
  int v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  uint64_t v4 = [(TDPhotoshopAsset *)self valueForKey:@"category"];
  if (v4) {
    [v3 setObject:v4 forKey:@"category"];
  }
  uint64_t v5 = [(TDPhotoshopAsset *)self valueForKey:@"name"];
  if (v5) {
    [v3 setObject:v5 forKey:@"name"];
  }
  uint64_t v6 = (void *)[(TDPhotoshopAsset *)self valueForKey:@"source"];
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
    [(TDPhotoshopAsset *)self setValue:v5 forKey:@"category"];
  }
  uint64_t v6 = [v4 objectForKey:@"name"];
  if (v6)
  {
    [(TDPhotoshopAsset *)self setValue:v6 forKey:@"name"];
  }
}

@end