@interface CSEvent
+ (id)eventWithType:(int64_t)a3;
- (BOOL)isConsumable;
- (BOOL)isStateless;
- (NSNumber)value;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)setConsumable:(BOOL)a3;
- (void)setStateless:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation CSEvent

+ (id)eventWithType:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setType:a3];
  [v4 setConsumable:(unint64_t)(a3 - 27) < 7];
  [v4 setStateless:((unint64_t)a3 > 0x29) | ((0xC000000000uLL >> a3) & 1)];

  return v4;
}

- (id)description
{
  return [(CSEvent *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CSEvent *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = NSStringFromCoverSheetEventType(self->_type);
  id v5 = (id)[v3 appendObject:v4 withName:@"type"];

  id v6 = (id)[v3 appendObject:self->_value withName:@"value" skipIfNil:1];
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSEvent isConsumable](self, "isConsumable"), @"consumable");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSEvent isStateless](self, "isStateless"), @"stateless");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CSEvent *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isConsumable
{
  return self->_consumable;
}

- (void)setConsumable:(BOOL)a3
{
  self->_consumable = a3;
}

- (BOOL)isStateless
{
  return self->_stateless;
}

- (void)setStateless:(BOOL)a3
{
  self->_stateless = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end