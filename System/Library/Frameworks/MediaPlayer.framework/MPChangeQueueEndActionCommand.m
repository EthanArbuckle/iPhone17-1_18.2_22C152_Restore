@interface MPChangeQueueEndActionCommand
- (NSArray)supportedQueueEndActions;
- (id)_mediaRemoteCommandInfoOptions;
- (int64_t)currentQueueEndAction;
- (void)setCurrentQueueEndAction:(int64_t)a3;
- (void)setSupportedQueueEndActions:(id)a3;
@end

@implementation MPChangeQueueEndActionCommand

- (id)_mediaRemoteCommandInfoOptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v8 = *MEMORY[0x1E4F77240];
  v4 = [NSNumber numberWithInteger:self->_currentQueueEndAction];
  v9[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 dictionaryWithDictionary:v5];

  if ([(NSArray *)self->_supportedQueueEndActions count]) {
    [v6 setObject:self->_supportedQueueEndActions forKeyedSubscript:*MEMORY[0x1E4F77338]];
  }

  return v6;
}

- (void)setCurrentQueueEndAction:(int64_t)a3
{
  if (self->_currentQueueEndAction != a3)
  {
    self->_currentQueueEndAction = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setSupportedQueueEndActions:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_supportedQueueEndActions, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    supportedQueueEndActions = self->_supportedQueueEndActions;
    self->_supportedQueueEndActions = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void).cxx_destruct
{
}

- (NSArray)supportedQueueEndActions
{
  return self->_supportedQueueEndActions;
}

- (int64_t)currentQueueEndAction
{
  return self->_currentQueueEndAction;
}

@end