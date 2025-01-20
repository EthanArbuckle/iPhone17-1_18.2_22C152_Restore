@interface MPSetPlaybackQueueCommand
- (MPSetPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3;
- (id)_mediaRemoteCommandInfoOptions;
- (int64_t)upNextItemCount;
- (void)registerSpecializedQueueIdentifier:(id)a3 localizedName:(id)a4 queueType:(int64_t)a5 queueParameters:(id)a6;
- (void)registerSupportedCustomQueueIdentifier:(id)a3;
- (void)registerSupportedQueueType:(int64_t)a3;
- (void)setUpNextItemCount:(int64_t)a3;
- (void)unregisterSpecializedQueueIdentifier:(id)a3;
- (void)unregisterSupportedCustomQueueIdentifier:(id)a3;
- (void)unregisterSupportedQueueType:(int64_t)a3;
@end

@implementation MPSetPlaybackQueueCommand

- (id)_mediaRemoteCommandInfoOptions
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableDictionary *)self->_registeredSpecializedQueues count]) {
    [v3 setObject:self->_registeredSpecializedQueues forKeyedSubscript:*MEMORY[0x1E4F77300]];
  }
  if ([(NSMutableSet *)self->_registeredQueueTypes count])
  {
    v5 = [(NSMutableSet *)self->_registeredQueueTypes allObjects];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F77318]];
  }
  if ([(NSMutableSet *)self->_registeredCustomQueueIdentifiers count])
  {
    v6 = [(NSMutableSet *)self->_registeredCustomQueueIdentifiers allObjects];
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F77308]];
  }
  if (self->_upNextItemCount >= 1)
  {
    v7 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F77358]];
  }
  os_unfair_lock_unlock(p_lock);

  return v3;
}

- (void)registerSupportedCustomQueueIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  registeredQueueTypes = self->_registeredQueueTypes;
  v7 = [NSNumber numberWithInt:7];
  [(NSMutableSet *)registeredQueueTypes addObject:v7];

  [(NSMutableSet *)self->_registeredCustomQueueIdentifiers addObject:v5];
  os_unfair_lock_unlock(p_lock);

  [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
}

- (MPSetPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MPSetPlaybackQueueCommand;
  v3 = [(MPRemoteCommand *)&v11 initWithMediaRemoteCommandType:*(void *)&a3];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registeredSpecializedQueues = v3->_registeredSpecializedQueues;
    v3->_registeredSpecializedQueues = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredQueueTypes = v3->_registeredQueueTypes;
    v3->_registeredQueueTypes = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredCustomQueueIdentifiers = v3->_registeredCustomQueueIdentifiers;
    v3->_registeredCustomQueueIdentifiers = v8;

    v3->_lock._os_unfair_lock_opaque = 0;
    [(MPSetPlaybackQueueCommand *)v3 registerSupportedQueueType:1];
    [(MPSetPlaybackQueueCommand *)v3 registerSupportedQueueType:2];
    [(MPSetPlaybackQueueCommand *)v3 registerSupportedQueueType:3];
    [(MPSetPlaybackQueueCommand *)v3 registerSupportedQueueType:5];
    [(MPSetPlaybackQueueCommand *)v3 registerSupportedQueueType:6];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredCustomQueueIdentifiers, 0);
  objc_storeStrong((id *)&self->_registeredQueueTypes, 0);

  objc_storeStrong((id *)&self->_registeredSpecializedQueues, 0);
}

- (int64_t)upNextItemCount
{
  return self->_upNextItemCount;
}

- (void)unregisterSupportedCustomQueueIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_registeredCustomQueueIdentifiers removeObject:v5];

  if (![(NSMutableSet *)self->_registeredCustomQueueIdentifiers count])
  {
    registeredQueueTypes = self->_registeredQueueTypes;
    uint64_t v7 = [NSNumber numberWithInt:7];
    [(NSMutableSet *)registeredQueueTypes removeObject:v7];
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

- (void)unregisterSpecializedQueueIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_registeredSpecializedQueues removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);

  [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
}

- (void)registerSpecializedQueueIdentifier:(id)a3 localizedName:(id)a4 queueType:(int64_t)a5 queueParameters:(id)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[a6 mutableCopy];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v16 = v14;

  [v16 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F77268]];
  v15 = [NSNumber numberWithInteger:a5];
  [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F77280]];

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_registeredSpecializedQueues setObject:v16 forKeyedSubscript:v11];

  os_unfair_lock_unlock(&self->_lock);
  [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
}

- (void)setUpNextItemCount:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_upNextItemCount == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_upNextItemCount = a3;
    os_unfair_lock_unlock(p_lock);
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

@end