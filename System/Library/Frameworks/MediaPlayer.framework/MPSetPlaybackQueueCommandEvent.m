@interface MPSetPlaybackQueueCommandEvent
- (MPRemotePlaybackQueue)playbackQueue;
- (MPSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (MPSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 playbackQueue:(id)a4;
- (NSString)sessionIdentifierOverride;
- (id)copyWithDialogOptions:(id)a3;
@end

@implementation MPSetPlaybackQueueCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifierOverride, 0);

  objc_storeStrong((id *)&self->_playbackQueue, 0);
}

- (NSString)sessionIdentifierOverride
{
  return self->_sessionIdentifierOverride;
}

- (MPRemotePlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (id)copyWithDialogOptions:(id)a3
{
  id v4 = a3;
  v5 = [(MPSetPlaybackQueueCommandEvent *)self playbackQueue];
  v6 = [v5 mediaRemoteOptions];
  v7 = (void *)[v6 mutableCopy];

  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F77660]];

  [v7 setObject:v4 forKeyedSubscript:@"kMRMediaRemoteOptionDialogOptions"];
  id v10 = objc_alloc((Class)objc_opt_class());
  v11 = [(MPRemoteCommandEvent *)self command];
  v12 = objc_msgSend(v10, "initWithCommand:mediaRemoteType:options:", v11, -[MPRemoteCommandEvent mediaRemoteCommandType](self, "mediaRemoteCommandType"), v7);

  return v12;
}

- (MPSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 playbackQueue:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 mediaRemoteOptions];
  v12.receiver = self;
  v12.super_class = (Class)MPSetPlaybackQueueCommandEvent;
  id v10 = [(MPRemoteCommandEvent *)&v12 initWithCommand:v8 mediaRemoteType:122 options:v9];

  if (v10) {
    objc_storeStrong((id *)&v10->_playbackQueue, a4);
  }

  return v10;
}

- (MPSetPlaybackQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v8 = (const __CFDictionary *)a5;
  v20.receiver = self;
  v20.super_class = (Class)MPSetPlaybackQueueCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v20 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (!v9) {
    goto LABEL_4;
  }
  if (CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E4F777D0]))
  {
    id v10 = +[MPRemotePlaybackQueue queueWithMediaRemotePlaybackQueue:MRSystemAppPlaybackQueueCreateFromExternalRepresentation() options:v8];
    playbackQueue = v9->_playbackQueue;
    v9->_playbackQueue = v10;
    objc_super v12 = v10;

    v13 = [(MPRemoteCommandEvent *)v9 mediaRemoteOptions];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F77688]];
    sessionIdentifierOverride = v9->_sessionIdentifierOverride;
    v9->_sessionIdentifierOverride = (NSString *)v14;

LABEL_4:
    v16 = v9;
    goto LABEL_8;
  }
  v17 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)MRMediaRemoteCopyCommandDescription();
    *(_DWORD *)buf = 138412546;
    v22 = v18;
    __int16 v23 = 2112;
    CFDictionaryRef v24 = v8;
    _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_ERROR, "MPSetPlaybackQueueCommandEvent: Failed to extract playback queue data from media remote command=%@ options=%@", buf, 0x16u);
  }
  v16 = 0;
LABEL_8:

  return v16;
}

@end