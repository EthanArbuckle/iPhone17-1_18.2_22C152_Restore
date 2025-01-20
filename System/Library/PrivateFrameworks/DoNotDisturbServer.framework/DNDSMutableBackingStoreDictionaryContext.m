@interface DNDSMutableBackingStoreDictionaryContext
- (void)setApplicationIdentifierMapper:(id)a3;
- (void)setArrayHealingSource:(id)a3;
- (void)setContactProvider:(id)a3;
- (void)setCurrentRecord:(id)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setHealingSource:(id)a3;
- (void)setPartitionType:(unint64_t)a3;
- (void)setRedactSensitiveData:(BOOL)a3;
@end

@implementation DNDSMutableBackingStoreDictionaryContext

- (void)setDestination:(unint64_t)a3
{
  self->super._destination = a3;
}

- (void)setPartitionType:(unint64_t)a3
{
  self->super._partitionType = a3;
}

- (void)setHealingSource:(id)a3
{
}

- (void)setArrayHealingSource:(id)a3
{
}

- (void)setRedactSensitiveData:(BOOL)a3
{
  self->super._redactSensitiveData = a3;
}

- (void)setContactProvider:(id)a3
{
}

- (void)setApplicationIdentifierMapper:(id)a3
{
}

- (void)setCurrentRecord:(id)a3
{
}

@end