@interface MPInsertIntoPlaybackQueueCommand
- (MPInsertIntoPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3;
- (NSArray)supportedInsertionPositions;
- (NSString)lastSectionContentItemID;
- (NSString)tailInsertionContentItemID;
- (id)_mediaRemoteCommandInfoOptions;
- (void)registerSupportedCustomQueueIdentifier:(id)a3;
- (void)registerSupportedQueueType:(int64_t)a3;
- (void)setLastSectionContentItemID:(id)a3;
- (void)setSupportedInsertionPositions:(id)a3;
- (void)setTailInsertionContentItemID:(id)a3;
- (void)unregisterSupportedCustomQueueIdentifier:(id)a3;
- (void)unregisterSupportedQueueType:(int64_t)a3;
@end

@implementation MPInsertIntoPlaybackQueueCommand

- (id)_mediaRemoteCommandInfoOptions
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock(&self->_lock);
  if ([(NSArray *)self->_supportedInsertionPositions count]) {
    [v3 setObject:self->_supportedInsertionPositions forKeyedSubscript:*MEMORY[0x1E4F77310]];
  }
  if ([(NSMutableSet *)self->_registeredQueueTypes count])
  {
    v4 = [(NSMutableSet *)self->_registeredQueueTypes allObjects];
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F77318]];
  }
  if ([(NSMutableSet *)self->_registeredCustomQueueIdentifiers count])
  {
    v5 = [(NSMutableSet *)self->_registeredCustomQueueIdentifiers allObjects];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F77308]];
  }
  if ([(NSString *)self->_lastSectionContentItemID length]) {
    [v3 setObject:self->_lastSectionContentItemID forKeyedSubscript:*MEMORY[0x1E4F77258]];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v3;
}

- (MPInsertIntoPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPInsertIntoPlaybackQueueCommand;
  v3 = [(MPRemoteCommand *)&v9 initWithMediaRemoteCommandType:*(void *)&a3];
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredQueueTypes = v3->_registeredQueueTypes;
    v3->_registeredQueueTypes = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredCustomQueueIdentifiers = v3->_registeredCustomQueueIdentifiers;
    v3->_registeredCustomQueueIdentifiers = v6;

    v3->_lock._os_unfair_lock_opaque = 0;
    [(MPInsertIntoPlaybackQueueCommand *)v3 registerSupportedQueueType:1];
    [(MPInsertIntoPlaybackQueueCommand *)v3 registerSupportedQueueType:2];
    [(MPInsertIntoPlaybackQueueCommand *)v3 registerSupportedQueueType:3];
    [(MPInsertIntoPlaybackQueueCommand *)v3 registerSupportedQueueType:5];
    [(MPInsertIntoPlaybackQueueCommand *)v3 registerSupportedQueueType:6];
  }
  return v3;
}

- (void)registerSupportedQueueType:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  registeredQueueTypes = self->_registeredQueueTypes;
  if ((unint64_t)(a3 - 1) > 7) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = dword_19568C540[a3 - 1];
  }
  v8 = [NSNumber numberWithInt:v7];
  [(NSMutableSet *)registeredQueueTypes addObject:v8];

  os_unfair_lock_unlock(p_lock);

  [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
}

- (void)registerSupportedCustomQueueIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  registeredQueueTypes = self->_registeredQueueTypes;
  uint64_t v7 = [NSNumber numberWithInt:7];
  [(NSMutableSet *)registeredQueueTypes addObject:v7];

  [(NSMutableSet *)self->_registeredCustomQueueIdentifiers addObject:v5];
  os_unfair_lock_unlock(p_lock);

  [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
}

- (void)setSupportedInsertionPositions:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([v6 isEqual:self->_supportedInsertionPositions])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v4 = (NSArray *)[v6 copy];
    supportedInsertionPositions = self->_supportedInsertionPositions;
    self->_supportedInsertionPositions = v4;

    os_unfair_lock_unlock(&self->_lock);
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setLastSectionContentItemID:(id)a3
{
  objc_super v9 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lastSectionContentItemID;
  if (v4 == v9)
  {
  }
  else
  {
    id v5 = v4;
    char v6 = -[NSString isEqual:](v4, "isEqual:");

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (NSString *)[(NSString *)v9 copy];
      lastSectionContentItemID = self->_lastSectionContentItemID;
      self->_lastSectionContentItemID = v7;

      os_unfair_lock_unlock(&self->_lock);
      [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
      goto LABEL_6;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailInsertionContentItemID, 0);
  objc_storeStrong((id *)&self->_lastSectionContentItemID, 0);
  objc_storeStrong((id *)&self->_supportedInsertionPositions, 0);
  objc_storeStrong((id *)&self->_registeredCustomQueueIdentifiers, 0);

  objc_storeStrong((id *)&self->_registeredQueueTypes, 0);
}

- (void)setTailInsertionContentItemID:(id)a3
{
}

- (NSString)tailInsertionContentItemID
{
  return self->_tailInsertionContentItemID;
}

- (NSString)lastSectionContentItemID
{
  return self->_lastSectionContentItemID;
}

- (NSArray)supportedInsertionPositions
{
  return self->_supportedInsertionPositions;
}

- (void)unregisterSupportedCustomQueueIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_registeredCustomQueueIdentifiers removeObject:v5];

  if (![(NSMutableSet *)self->_registeredCustomQueueIdentifiers count]) {
    [(NSMutableSet *)self->_registeredQueueTypes removeObject:&unk_1EE6ED370];
  }
  os_unfair_lock_unlock(p_lock);

  [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
}

- (void)unregisterSupportedQueueType:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  registeredQueueTypes = self->_registeredQueueTypes;
  if ((unint64_t)(a3 - 1) > 7) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = dword_19568C540[a3 - 1];
  }
  v8 = [NSNumber numberWithInt:v7];
  [(NSMutableSet *)registeredQueueTypes removeObject:v8];

  os_unfair_lock_unlock(p_lock);

  [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
}

@end