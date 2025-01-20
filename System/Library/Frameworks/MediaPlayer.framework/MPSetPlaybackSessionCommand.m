@interface MPSetPlaybackSessionCommand
- (NSArray)exportableSessionTypes;
- (NSArray)supportedSessionTypes;
- (NSString)currentPlaybackSessionIdentifier;
- (NSString)currentPlaybackSessionRevision;
- (id)_mediaRemoteCommandInfoOptions;
- (void)setCurrentPlaybackSessionIdentifier:(id)a3;
- (void)setCurrentPlaybackSessionRevision:(id)a3;
- (void)setExportableSessionTypes:(id)a3;
- (void)setSupportedSessionTypes:(id)a3;
@end

@implementation MPSetPlaybackSessionCommand

- (id)_mediaRemoteCommandInfoOptions
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSString *)self->_currentPlaybackSessionIdentifier length]) {
    [v3 setObject:self->_currentPlaybackSessionIdentifier forKeyedSubscript:*MEMORY[0x1E4F77288]];
  }
  if ([(NSArray *)self->_exportableSessionTypes count]) {
    [v3 setObject:self->_exportableSessionTypes forKeyedSubscript:*MEMORY[0x1E4F77238]];
  }
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
  objc_storeStrong((id *)&self->_supportedSessionTypes, 0);
  objc_storeStrong((id *)&self->_exportableSessionTypes, 0);
  objc_storeStrong((id *)&self->_currentPlaybackSessionRevision, 0);

  objc_storeStrong((id *)&self->_currentPlaybackSessionIdentifier, 0);
}

- (void)setExportableSessionTypes:(id)a3
{
  id v6 = a3;
  if ((-[NSArray isEqual:](self->_exportableSessionTypes, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)[v6 copy];
    exportableSessionTypes = self->_exportableSessionTypes;
    self->_exportableSessionTypes = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setCurrentPlaybackSessionIdentifier:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_currentPlaybackSessionIdentifier, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    currentPlaybackSessionIdentifier = self->_currentPlaybackSessionIdentifier;
    self->_currentPlaybackSessionIdentifier = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (NSArray)supportedSessionTypes
{
  return self->_supportedSessionTypes;
}

- (NSArray)exportableSessionTypes
{
  return self->_exportableSessionTypes;
}

- (void)setCurrentPlaybackSessionRevision:(id)a3
{
}

- (NSString)currentPlaybackSessionRevision
{
  return self->_currentPlaybackSessionRevision;
}

- (NSString)currentPlaybackSessionIdentifier
{
  return self->_currentPlaybackSessionIdentifier;
}

@end