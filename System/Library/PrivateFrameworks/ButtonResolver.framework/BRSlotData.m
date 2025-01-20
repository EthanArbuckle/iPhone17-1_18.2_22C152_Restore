@interface BRSlotData
- (BOOL)isProgrammed;
- (BRAsset)asset;
- (BRSlotData)initWithSlotData:(id)a3;
- (NSNumber)slot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)propertyList;
- (unint64_t)refCount;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setIsProgrammed:(BOOL)a3;
- (void)setRefCount:(unint64_t)a3;
- (void)setSlot:(id)a3;
@end

@implementation BRSlotData

- (BRSlotData)initWithSlotData:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)BRSlotData;
    v4 = [(BRSlotData *)&v6 init];
    if (v4)
    {
      v4->_slot = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "slot"), "copy");
      v4->_asset = (BRAsset *)(id)[a3 asset];
      v4->_isProgrammed = [a3 isProgrammed];
      v4->_refCount = [a3 refCount];
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithSlotData:self];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BRSlotData;
  [(BRSlotData *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BRSlotData;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[BRSlotData description](&v7, sel_description));
  [v3 appendFormat:@"Slot: %@;", -[BRSlotData slot](self, "slot")];
  [v3 appendFormat:@"Asset: %@;", -[BRSlotData asset](self, "asset")];
  BOOL v4 = [(BRSlotData *)self isProgrammed];
  v5 = "N";
  if (v4) {
    v5 = "Y";
  }
  objc_msgSend(v3, "appendFormat:", @"IsProgammed: %s;", v5);
  objc_msgSend(v3, "appendFormat:", @"RefCount: %lu;", -[BRSlotData refCount](self, "refCount"));
  return v3;
}

- (id)propertyList
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(BRSlotData *)self slot]) {
    BOOL v4 = [(BRSlotData *)self slot];
  }
  else {
    BOOL v4 = (NSNumber *)&unk_26D3CD180;
  }
  [v3 setObject:v4 forKey:@"Slot"];
  if ([(BRAsset *)[(BRSlotData *)self asset] propertyList]) {
    id v5 = [(BRAsset *)[(BRSlotData *)self asset] propertyList];
  }
  else {
    id v5 = (id)[NSDictionary dictionary];
  }
  [v3 setObject:v5 forKey:@"Asset"];
  objc_super v6 = NSString;
  BOOL v7 = [(BRSlotData *)self isProgrammed];
  v8 = "N";
  if (v7) {
    v8 = "Y";
  }
  [v3 setObject:objc_msgSend(v6, "stringWithFormat:", @"%s;", v8), @"IsProgrammed" forKey];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BRSlotData refCount](self, "refCount")), @"RefCount");
  return v3;
}

- (NSNumber)slot
{
  return self->_slot;
}

- (void)setSlot:(id)a3
{
}

- (BRAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (BOOL)isProgrammed
{
  return self->_isProgrammed;
}

- (void)setIsProgrammed:(BOOL)a3
{
  self->_isProgrammed = a3;
}

- (unint64_t)refCount
{
  return self->_refCount;
}

- (void)setRefCount:(unint64_t)a3
{
  self->_refCount = a3;
}

@end