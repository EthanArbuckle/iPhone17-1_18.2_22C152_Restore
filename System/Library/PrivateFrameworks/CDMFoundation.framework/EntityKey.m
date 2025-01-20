@interface EntityKey
+ (id)calendarEventName;
+ (id)currencyName;
+ (id)personEntity;
+ (id)userEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEntityKey:(id)a3;
- (EntityKey)initWithElementId:(int)a3 edgeElementId:(int)a4 parentElementId:(int)a5;
- (int)edgeElementId;
- (int)elementId;
- (int)parentElementId;
- (unint64_t)hash;
- (void)setEdgeElementId:(int)a3;
- (void)setElementId:(int)a3;
- (void)setParentElementId:(int)a3;
@end

@implementation EntityKey

- (void)setParentElementId:(int)a3
{
  self->_parentElementId = a3;
}

- (int)parentElementId
{
  return self->_parentElementId;
}

- (void)setEdgeElementId:(int)a3
{
  self->_edgeElementId = a3;
}

- (int)edgeElementId
{
  return self->_edgeElementId;
}

- (void)setElementId:(int)a3
{
  self->_elementId = a3;
}

- (int)elementId
{
  return self->_elementId;
}

- (unint64_t)hash
{
  int v3 = [(EntityKey *)self elementId];
  uint64_t v4 = 31 * ([(EntityKey *)self edgeElementId] + 961 * v3);
  return v4 + [(EntityKey *)self parentElementId];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EntityKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(EntityKey *)self isEqualToEntityKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToEntityKey:(id)a3
{
  id v4 = a3;
  int v5 = [(EntityKey *)self elementId];
  if (v5 == [v4 elementId]
    && (int v6 = -[EntityKey edgeElementId](self, "edgeElementId"), v6 == [v4 edgeElementId]))
  {
    int v7 = [(EntityKey *)self parentElementId];
    BOOL v8 = v7 == [v4 parentElementId];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (EntityKey)initWithElementId:(int)a3 edgeElementId:(int)a4 parentElementId:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)EntityKey;
  result = [(EntityKey *)&v9 init];
  if (result)
  {
    result->_elementId = a3;
    result->_edgeElementId = a4;
    result->_parentElementId = a5;
  }
  return result;
}

+ (id)personEntity
{
  if (personEntity_onceToken != -1) {
    dispatch_once(&personEntity_onceToken, &__block_literal_global_582);
  }
  v2 = (void *)personEntity_value;
  return v2;
}

uint64_t __25__EntityKey_personEntity__block_invoke()
{
  personEntity_value = [[EntityKey alloc] initWithElementId:1206 edgeElementId:541 parentElementId:1332];
  return MEMORY[0x270F9A758]();
}

+ (id)currencyName
{
  if (currencyName_onceToken != -1) {
    dispatch_once(&currencyName_onceToken, &__block_literal_global_580);
  }
  v2 = (void *)currencyName_value;
  return v2;
}

uint64_t __25__EntityKey_currencyName__block_invoke()
{
  currencyName_value = [[EntityKey alloc] initWithElementId:1206 edgeElementId:541 parentElementId:1806];
  return MEMORY[0x270F9A758]();
}

+ (id)calendarEventName
{
  if (calendarEventName_onceToken != -1) {
    dispatch_once(&calendarEventName_onceToken, &__block_literal_global_578);
  }
  v2 = (void *)calendarEventName_value;
  return v2;
}

uint64_t __30__EntityKey_calendarEventName__block_invoke()
{
  calendarEventName_value = [[EntityKey alloc] initWithElementId:1206 edgeElementId:541 parentElementId:1629];
  return MEMORY[0x270F9A758]();
}

+ (id)userEntity
{
  if (userEntity_onceToken != -1) {
    dispatch_once(&userEntity_onceToken, &__block_literal_global_5290);
  }
  v2 = (void *)userEntity_value;
  return v2;
}

uint64_t __23__EntityKey_userEntity__block_invoke()
{
  userEntity_value = [[EntityKey alloc] initWithElementId:1206 edgeElementId:2611 parentElementId:2532];
  return MEMORY[0x270F9A758]();
}

@end