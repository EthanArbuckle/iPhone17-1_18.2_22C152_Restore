@interface HREPresenceTriggerTemplate
- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4;
- (unint64_t)presenceType;
- (unint64_t)presenceUserType;
- (void)setPresenceType:(unint64_t)a3;
- (void)setPresenceUserType:(unint64_t)a3;
@end

@implementation HREPresenceTriggerTemplate

- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HRERecommendationEmptyTriggerBuilderContext);
  id v7 = objc_alloc(MEMORY[0x263F47B40]);
  v8 = [v5 home];

  v9 = (void *)[v7 initWithHome:v8 context:v6];
  v10 = objc_msgSend(objc_alloc(MEMORY[0x263F0E670]), "initWithPresenceEventType:presenceUserType:", -[HREPresenceTriggerTemplate presenceType](self, "presenceType"), -[HREPresenceTriggerTemplate presenceUserType](self, "presenceUserType"));
  v11 = (void *)[objc_alloc(MEMORY[0x263F47BF0]) initWithEvent:v10];
  v12 = [v9 locationInterface];
  [v12 setLocationEventBuilder:v11];

  return v9;
}

- (unint64_t)presenceType
{
  return self->_presenceType;
}

- (void)setPresenceType:(unint64_t)a3
{
  self->_presenceType = a3;
}

- (unint64_t)presenceUserType
{
  return self->_presenceUserType;
}

- (void)setPresenceUserType:(unint64_t)a3
{
  self->_presenceUserType = a3;
}

@end