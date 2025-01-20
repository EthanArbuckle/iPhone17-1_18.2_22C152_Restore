@interface GCHapticCapabilityGraphNode
- (BOOL)isExposed;
- (GCHapticCapabilityGraphNode)initWithJSONDictionaryRepresentation:(id)a3;
- (NSMutableArray)actuators;
- (NSMutableArray)children;
- (NSString)label;
- (id)jsonDictionaryRepresentation;
- (void)addActuator:(id)a3;
- (void)addChild:(id)a3;
- (void)setActuators:(id)a3;
- (void)setChildren:(id)a3;
@end

@implementation GCHapticCapabilityGraphNode

- (NSString)label
{
  return self->_label;
}

- (BOOL)isExposed
{
  return self->_exposed;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSMutableArray)actuators
{
  return self->_actuators;
}

- (void)setActuators:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuators, 0);
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (void)addChild:(id)a3
{
}

- (void)addActuator:(id)a3
{
}

- (GCHapticCapabilityGraphNode)initWithJSONDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GCHapticCapabilityGraphNode;
  v5 = [(GCHapticCapabilityGraphNode *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"exposed"];
    v5->_exposed = [v8 BOOLValue];

    uint64_t v9 = +[NSMutableArray array];
    children = v5->_children;
    v5->_children = (NSMutableArray *)v9;

    uint64_t v11 = +[NSMutableArray array];
    actuators = v5->_actuators;
    v5->_actuators = (NSMutableArray *)v11;
  }
  return v5;
}

- (id)jsonDictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = self->_children;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) label];
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  uint64_t v11 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v12 = self->_actuators;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "label", (void)v23);
        [v11 addObject:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

  [v3 setObject:self->_label forKeyedSubscript:@"label"];
  v18 = +[NSNumber numberWithBool:self->_exposed];
  [v3 setObject:v18 forKeyedSubscript:@"exposed"];

  if ([v4 count])
  {
    v19 = @"children";
    v20 = v3;
    v21 = v4;
  }
  else
  {
    if (![v11 count]) {
      goto LABEL_20;
    }
    v19 = @"actuators";
    v20 = v3;
    v21 = v11;
  }
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v19, (void)v23);
LABEL_20:

  return v3;
}

@end