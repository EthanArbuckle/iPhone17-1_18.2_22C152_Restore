@interface MPPrepareForSetPlaybackQueueCommand
- (MPPrepareForSetPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3;
- (NSDictionary)proactiveCommandOptions;
- (id)_mediaRemoteCommandInfoOptions;
- (void)setProactiveCommandOptions:(id)a3;
@end

@implementation MPPrepareForSetPlaybackQueueCommand

- (MPPrepareForSetPlaybackQueueCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPPrepareForSetPlaybackQueueCommand;
  result = [(MPRemoteCommand *)&v4 initWithMediaRemoteCommandType:*(void *)&a3];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)_mediaRemoteCommandInfoOptions
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  os_unfair_lock_lock(&self->_lock);
  proactiveCommandOptions = self->_proactiveCommandOptions;
  if (proactiveCommandOptions) {
    [v3 setObject:proactiveCommandOptions forKeyedSubscript:*MEMORY[0x1E4F772D0]];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v3;
}

- (void).cxx_destruct
{
}

- (NSDictionary)proactiveCommandOptions
{
  return self->_proactiveCommandOptions;
}

- (void)setProactiveCommandOptions:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([v6 isEqual:self->_proactiveCommandOptions])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_super v4 = (NSDictionary *)[v6 copy];
    proactiveCommandOptions = self->_proactiveCommandOptions;
    self->_proactiveCommandOptions = v4;

    os_unfair_lock_unlock(&self->_lock);
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

@end