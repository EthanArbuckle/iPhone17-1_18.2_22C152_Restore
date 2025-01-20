@interface _HUQuickControlContentCharacteristicWriteQueuedUpdate
- (NACancelable)cancellationToken;
- (NSMutableSet)affectedCharacteristics;
- (_HUQuickControlContentCharacteristicWriteQueuedUpdate)initWithCancellationToken:(id)a3;
@end

@implementation _HUQuickControlContentCharacteristicWriteQueuedUpdate

- (_HUQuickControlContentCharacteristicWriteQueuedUpdate)initWithCancellationToken:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HUQuickControlContentCharacteristicWriteQueuedUpdate;
  v6 = [(_HUQuickControlContentCharacteristicWriteQueuedUpdate *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cancellationToken, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    affectedCharacteristics = v7->_affectedCharacteristics;
    v7->_affectedCharacteristics = (NSMutableSet *)v8;
  }
  return v7;
}

- (NACancelable)cancellationToken
{
  return self->_cancellationToken;
}

- (NSMutableSet)affectedCharacteristics
{
  return self->_affectedCharacteristics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affectedCharacteristics, 0);

  objc_storeStrong((id *)&self->_cancellationToken, 0);
}

@end