@interface TDRenditionSpec
- (BOOL)canBePackedWithDocument:(id)a3;
- (BOOL)updatePackingPropertiesWithDocument:(id)a3;
- (CGPoint)packedPoint;
- (TDRenditionType)renditionType;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (id)propertiesAsDictionary;
- (void)awakeFromInsert;
- (void)resetToBaseKeySpec;
- (void)setPackedPoint:(CGPoint)a3;
- (void)setRenditionType:(id)a3;
@end

@implementation TDRenditionSpec

- (void)awakeFromInsert
{
  if (![(TDRenditionSpec *)self keySpec])
  {
    v3 = -[TDRenditionKeySpec initWithEntity:insertIntoManagedObjectContext:]([TDRenditionKeySpec alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec entity](self, "entity"), "managedObjectModel"), "entitiesByName"), "objectForKey:", @"RenditionKeySpec"), -[TDRenditionSpec managedObjectContext](self, "managedObjectContext"));
    [(TDRenditionSpec *)self setKeySpec:v3];
  }
}

- (void)resetToBaseKeySpec
{
  if ([(TDRenditionSpec *)self production] && [(TDRenditionSpec *)self keySpec])
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec production](self, "production"), "baseKeySpec"), "dictionaryWithValuesForKeys:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec keySpec](self, "keySpec"), "entity"), "propertiesByName"), "allKeys"));
    v4 = (void *)[(TDRenditionSpec *)self keySpec];
    [v4 setValuesForKeysWithDictionary:v3];
  }
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  return 0;
}

- (id)propertiesAsDictionary
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = (void *)[(TDRenditionSpec *)self properties];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) addToDictionary:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (TDRenditionType)renditionType
{
  [(TDRenditionSpec *)self willAccessValueForKey:@"renditionType"];
  uint64_t v3 = (TDRenditionType *)[(TDRenditionSpec *)self primitiveRenditionType];
  [(TDRenditionSpec *)self didAccessValueForKey:@"renditionType"];
  if (v3) {
    return v3;
  }
  uint64_t v5 = (void *)[(TDRenditionSpec *)self production];

  return (TDRenditionType *)[v5 renditionType];
}

- (void)setRenditionType:(id)a3
{
  int v5 = [a3 identifier];
  if (v5 == objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec production](self, "production"), "renditionType"), "identifier")|| v5 == 1010|| v5 == 6)
  {
    [(TDRenditionSpec *)self willChangeValueForKey:@"renditionType"];
    [(TDRenditionSpec *)self setPrimitiveRenditionType:a3];
    [(TDRenditionSpec *)self didChangeValueForKey:@"renditionType"];
  }
  else if ([(TDRenditionSpec *)self production])
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488], @"Incompatible rendition type '%@'.  Must gradient or multisize image set.", objc_msgSend((id)objc_msgSend((id)-[TDRenditionSpec production](self, "production"), "name"), "name") format];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF488];
    [v6 raise:v7 format:@"Missing production."];
  }
}

- (void)setPackedPoint:(CGPoint)a3
{
  double y = a3.y;
  [(TDRenditionSpec *)self setPackedPointX:(int)a3.x];

  [(TDRenditionSpec *)self setPackedPointY:(int)y];
}

- (CGPoint)packedPoint
{
  double v3 = (double)(int)[(TDRenditionSpec *)self packedPointX];
  double v4 = (double)(int)[(TDRenditionSpec *)self packedPointY];
  double v5 = v3;
  result.double y = v4;
  result.x = v5;
  return result;
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  return 1;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  int v4 = [(TDRenditionSpec *)self width];
  int v5 = [(TDRenditionSpec *)self height];
  BOOL result = 0;
  if (v4 && v5)
  {
    unsigned int v7 = objc_msgSend((id)-[TDRenditionSpec keySpec](self, "keySpec"), "scaleFactor");
    if (([(TDRenditionSpec *)self alphaCrop] & 1) == 0
      && v5 * v4 > +[CoreThemeDocument maximumAreaOfPackableImageForScale:v7])
    {
      return 0;
    }
    unsigned int v8 = [(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier];
    char v9 = v8;
    if (v8 > 9) {
      return 0;
    }
    BOOL result = 1;
    if (((1 << v9) & 0x13F) == 0) {
      return 0;
    }
  }
  return result;
}

@end