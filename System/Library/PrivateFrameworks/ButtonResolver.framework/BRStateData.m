@interface BRStateData
- (BOOL)enabled;
- (BRStateData)initWithState:(unint64_t)a3 enabled:(BOOL)a4;
- (BRStateData)initWithStateData:(id)a3;
- (NSMutableDictionary)speedConfigs;
- (NSMutableDictionary)speedSlots;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)propertyList;
- (unint64_t)state;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation BRStateData

- (BRStateData)initWithState:(unint64_t)a3 enabled:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BRStateData;
  v6 = [(BRStateData *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_state = a3;
    v6->_enabled = a4;
    v6->_speedConfigs = (NSMutableDictionary *)objc_opt_new();
    v7->_speedSlots = (NSMutableDictionary *)objc_opt_new();
  }
  return v7;
}

- (BRStateData)initWithStateData:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)BRStateData;
    v4 = [(BRStateData *)&v6 init];
    if (v4)
    {
      v4->_state = [a3 state];
      v4->_enabled = [a3 enabled];
      v4->_speedConfigs = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "speedConfigs"), "copy");
      v4->_speedSlots = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "speedSlots"), "copy");
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
  return (id)[v4 initWithStateData:self];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BRStateData;
  [(BRStateData *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BRStateData;
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[BRStateData description](&v7, sel_description));
  objc_msgSend(v3, "appendFormat:", @"State: %lu;", -[BRStateData state](self, "state"));
  BOOL v4 = [(BRStateData *)self enabled];
  v5 = "N";
  if (v4) {
    v5 = "Y";
  }
  objc_msgSend(v3, "appendFormat:", @"Enabled: %s;", v5);
  objc_msgSend(v3, "appendFormat:", @"ButtonConfigsForSpeeds: %@;",
    [(BRStateData *)self speedConfigs]);
  [v3 appendFormat:@"SlotsForSpeeds: %@;", -[BRStateData speedSlots](self, "speedSlots")];
  return v3;
}

- (id)propertyList
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  BOOL v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v5 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BRStateData state](self, "state")), @"State");
  objc_super v6 = NSString;
  BOOL v7 = [(BRStateData *)self enabled];
  v8 = "N";
  if (v7) {
    v8 = "Y";
  }
  [v3 setObject:objc_msgSend(v6, "stringWithFormat:", @"%s;", v8), @"Enabled" forKey];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_super v9 = [(BRStateData *)self speedConfigs];
  uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v4, "setObject:forKey:", -[NSMutableDictionary objectForKeyedSubscript:](-[BRStateData speedConfigs](self, "speedConfigs"), "objectForKeyedSubscript:", *(void *)(*((void *)&v24 + 1) + 8 * v13)), objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v13), "stringValue"));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }
  [v3 setObject:v4 forKey:@"ButtonConfigsForSpeeds"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = [(BRStateData *)self speedSlots];
  uint64_t v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(v5, "setObject:forKey:", -[NSMutableDictionary objectForKeyedSubscript:](-[BRStateData speedSlots](self, "speedSlots"), "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * v18)), objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "stringValue"));
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }
  [v3 setObject:v5 forKey:@"SlotsForSpeeds"];
  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMutableDictionary)speedConfigs
{
  return self->_speedConfigs;
}

- (NSMutableDictionary)speedSlots
{
  return self->_speedSlots;
}

@end