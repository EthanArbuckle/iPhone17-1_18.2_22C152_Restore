@interface MPSetPriorityForPlaybackSessionCommand
- (NSArray)preloadedSessions;
- (id)_mediaRemoteCommandInfoOptions;
- (void)setPreloadedSessions:(id)a3;
@end

@implementation MPSetPriorityForPlaybackSessionCommand

- (void).cxx_destruct
{
}

- (NSArray)preloadedSessions
{
  return self->_preloadedSessions;
}

- (id)_mediaRemoteCommandInfoOptions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_preloadedSessions count])
  {
    v20 = v3;
    v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_preloadedSessions, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obj = self->_preloadedSessions;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      uint64_t v8 = *MEMORY[0x1E4F77298];
      uint64_t v9 = *MEMORY[0x1E4F77290];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v26[0] = v8;
          v12 = [v11 revision];
          v26[1] = v9;
          v27[0] = v12;
          v13 = NSNumber;
          uint64_t v14 = [v11 priority];
          if (v14 == 2) {
            unint64_t v15 = 1024;
          }
          else {
            unint64_t v15 = (unint64_t)(v14 == 1) << 9;
          }
          v16 = [v13 numberWithInteger:v15];
          v27[1] = v16;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
          v18 = [v11 identifier];
          [v4 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v6);
    }

    v3 = v20;
    [v20 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F77328]];
  }

  return v3;
}

- (void)setPreloadedSessions:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_preloadedSessions, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    preloadedSessions = self->_preloadedSessions;
    self->_preloadedSessions = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

@end