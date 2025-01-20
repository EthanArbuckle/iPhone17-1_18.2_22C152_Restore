@interface MPPreloadPlaybackSessionCommand
- (NSArray)supportedSessionTypes;
- (id)_mediaRemoteCommandInfoOptions;
- (void)setSupportedSessionTypes:(id)a3;
@end

@implementation MPPreloadPlaybackSessionCommand

- (id)_mediaRemoteCommandInfoOptions
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_supportedSessionTypes count]) {
    [v3 setObject:self->_supportedSessionTypes forKeyedSubscript:*MEMORY[0x1E4F77330]];
  }

  return v3;
}

- (void)setSupportedSessionTypes:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_supportedSessionTypes, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    supportedSessionTypes = self->_supportedSessionTypes;
    self->_supportedSessionTypes = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void).cxx_destruct
{
}

- (NSArray)supportedSessionTypes
{
  return self->_supportedSessionTypes;
}

@end