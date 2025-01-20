@interface BRAsset
+ (id)nullAsset;
+ (id)withType:(int64_t)a3 andParameters:(id)a4;
- (BOOL)hasAudio;
- (BOOL)hasHaptic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNull;
- (BRAsset)init;
- (BRAsset)initWithType:(int64_t)a3 andParameters:(id)a4 null:(BOOL)a5;
- (NSDictionary)parameters;
- (id)description;
- (id)propertyList;
- (int64_t)type;
- (void)dealloc;
- (void)setHasAudio:(BOOL)a3;
- (void)setHasHaptic:(BOOL)a3;
@end

@implementation BRAsset

+ (id)withType:(int64_t)a3 andParameters:(id)a4
{
  v4 = [[BRAsset alloc] initWithType:a3 andParameters:a4 null:0];
  return v4;
}

+ (id)nullAsset
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__BRAsset_nullAsset__block_invoke;
  block[3] = &unk_2645C7E98;
  block[4] = a1;
  if (nullAsset_once != -1) {
    dispatch_once(&nullAsset_once, block);
  }
  return (id)nullAsset_null;
}

uint64_t __20__BRAsset_nullAsset__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) initWithType:0 andParameters:0 null:1];
  nullAsset_null = result;
  return result;
}

- (BRAsset)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use -initWithID:andParameters:"];
  return 0;
}

- (BRAsset)initWithType:(int64_t)a3 andParameters:(id)a4 null:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BRAsset;
  v8 = [(BRAsset *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    *(_WORD *)&v8->_hasAudio = 0;
    v8->_parameters = (NSDictionary *)[a4 copy];
    v9->_isNull = a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BRAsset;
  [(BRAsset *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v15 = v6;
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    uint64_t v18 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (int64_t v11 = -[BRAsset type](self, "type"), v11 == [a3 type]))
    {
      if (!-[BRAsset parameters](self, "parameters") && ![a3 parameters]
        || (int v12 = -[NSDictionary isEqual:](-[BRAsset parameters](self, "parameters", v6, v16, v17, v18, v7, v8), "isEqual:", [a3 parameters])) != 0)
      {
        BOOL v13 = [(BRAsset *)self isNull];
        LOBYTE(v12) = v13 ^ [a3 isNull] ^ 1;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)BRAsset;
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[BRAsset description](&v8, sel_description));
  objc_msgSend(v3, "appendFormat:", @"Type: %ld", -[BRAsset type](self, "type"));
  if ([(BRAsset *)self hasAudio]) {
    uint64_t v4 = "Y";
  }
  else {
    uint64_t v4 = "N";
  }
  objc_msgSend(v3, "appendFormat:", @"HasAudio: %s", v4);
  if ([(BRAsset *)self hasHaptic]) {
    uint64_t v5 = "Y";
  }
  else {
    uint64_t v5 = "N";
  }
  objc_msgSend(v3, "appendFormat:", @"HasHaptic: %s", v5);
  [v3 appendFormat:@"Params: %@;", -[BRAsset parameters](self, "parameters")];
  if ([(BRAsset *)self isNull]) {
    uint64_t v6 = "Y";
  }
  else {
    uint64_t v6 = "N";
  }
  objc_msgSend(v3, "appendFormat:", @"IsNull: %s;", v6);
  return v3;
}

- (id)propertyList
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[BRAsset type](self, "type")), @"Type");
  uint64_t v4 = NSString;
  if ([(BRAsset *)self hasAudio]) {
    uint64_t v5 = "Y";
  }
  else {
    uint64_t v5 = "N";
  }
  [v3 setObject:objc_msgSend(v4, "stringWithFormat:", @"%s;", v5), @"HasAudio" forKey];
  uint64_t v6 = NSString;
  if ([(BRAsset *)self hasHaptic]) {
    uint64_t v7 = "Y";
  }
  else {
    uint64_t v7 = "N";
  }
  [v3 setObject:objc_msgSend(v6, "stringWithFormat:", @"%s;", v7), @"HasHaptic" forKey];
  if ([(BRAsset *)self parameters]) {
    objc_super v8 = [(BRAsset *)self parameters];
  }
  else {
    objc_super v8 = (NSDictionary *)[NSDictionary dictionary];
  }
  [v3 setObject:v8 forKey:@"Params"];
  v9 = NSString;
  if ([(BRAsset *)self isNull]) {
    v10 = "Y";
  }
  else {
    v10 = "N";
  }
  [v3 setObject:objc_msgSend(v9, "stringWithFormat:", @"%s;", v10), @"IsNull" forKey];
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (BOOL)hasHaptic
{
  return self->_hasHaptic;
}

- (void)setHasHaptic:(BOOL)a3
{
  self->_hasHaptic = a3;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (BOOL)isNull
{
  return self->_isNull;
}

@end