@interface TDColorDefinition
- (id)copyDataFromAttributes;
- (id)dataFromAttributes;
- (void)copyAttributesInto:(id)a3;
- (void)setAttributesFromCopyData:(id)a3;
- (void)setAttributesFromData:(id)a3;
@end

@implementation TDColorDefinition

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setValue:forKey:", -[TDColorDefinition valueForKey:](self, "valueForKey:", @"physicalColor"), @"physicalColor");
  uint64_t v5 = [(TDColorDefinition *)self valueForKey:@"name"];

  [a3 setValue:v5 forKey:@"name"];
}

- (id)dataFromAttributes
{
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  v4 = (void *)[(TDColorDefinition *)self valueForKey:@"name"];
  if (v4) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "URIRepresentation"), "absoluteString"), @"name");
  }
  objc_msgSend(v3, "setObject:forKey:", -[TDColorDefinition valueForKey:](self, "valueForKey:", @"physicalColor"), @"physicalColor");
  uint64_t v5 = (void *)MEMORY[0x263F08AC0];

  return (id)[v5 dataWithPropertyList:v3 format:200 options:0 error:0];
}

- (void)setAttributesFromData:(id)a3
{
  v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = (void *)[(TDColorDefinition *)self managedObjectContext];
  uint64_t v6 = [v4 objectForKey:@"name"];
  if (v6) {
    -[TDColorDefinition setValue:forKey:](self, "setValue:forKey:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v6))), @"name");
  }
  uint64_t v7 = [v4 objectForKey:@"physicalColor"];
  if (v7)
  {
    [(TDColorDefinition *)self setValue:v7 forKey:@"physicalColor"];
  }
}

- (id)copyDataFromAttributes
{
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  uint64_t v4 = [(TDColorDefinition *)self valueForKey:@"physicalColor"];
  if (v4) {
    [v3 setObject:v4 forKey:@"physicalColor"];
  }
  uint64_t v5 = (void *)[(TDColorDefinition *)self valueForKey:@"colorStatus"];
  if (v5) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v5, "valueForKey:", @"identifier"), @"colorStatus");
  }
  uint64_t v6 = (void *)[(TDColorDefinition *)self valueForKey:@"name"];
  if (v6) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "valueForKey:", @"selector"), @"selector");
  }
  uint64_t v7 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];

  return (id)[v7 copy];
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AC0], "propertyListWithData:options:format:error:", a3, 0, 0, 0), "objectForKey:", @"physicalColor");
  if (v4)
  {
    [(TDColorDefinition *)self setValue:v4 forKey:@"physicalColor"];
  }
}

@end