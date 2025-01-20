@interface AudioDrainOperation
- (AVAudioPlayer)audioPlayer;
- (AudioDrainOperation)initWithAudioFileURL:(id)a3 volume:(float)a4 responder:(id)a5;
- (DKResponder)responder;
- (NSURL)audioFileURL;
- (float)originalVolume;
- (float)requestedVolume;
- (void)cancel;
- (void)main;
- (void)setAudioFileURL:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setOriginalVolume:(float)a3;
- (void)setRequestedVolume:(float)a3;
- (void)setResponder:(id)a3;
@end

@implementation AudioDrainOperation

- (AudioDrainOperation)initWithAudioFileURL:(id)a3 volume:(float)a4 responder:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AudioDrainOperation;
  v11 = [(AudioDrainOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_audioFileURL, a3);
    objc_storeWeak((id *)&v12->_responder, v10);
    v12->_requestedVolume = a4;
  }

  return v12;
}

- (void)main
{
  id v3 = objc_alloc((Class)AVAudioPlayer);
  v4 = [(AudioDrainOperation *)self audioFileURL];
  uint64_t v15 = 0;
  id v5 = [v3 initWithContentsOfURL:v4 error:&v15];
  uint64_t v6 = v15;
  [(AudioDrainOperation *)self setAudioPlayer:v5];

  v7 = [(AudioDrainOperation *)self audioPlayer];

  if (v7)
  {
    if (!v6)
    {
      v8 = [(AudioDrainOperation *)self responder];
      [v8 enableVolumeHUD:0];

      id v9 = +[AVAudioSession sharedInstance];
      [v9 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeRaw options:1 error:0];

      id v10 = +[AVSystemController sharedAVSystemController];
      [v10 getActiveCategoryVolume:&self->_originalVolume andName:0];

      v11 = +[AVSystemController sharedAVSystemController];
      [(AudioDrainOperation *)self requestedVolume];
      [v11 setActiveCategoryVolumeTo:];

      v12 = [(AudioDrainOperation *)self audioPlayer];
      [v12 setNumberOfLoops:-1];

      v13 = [(AudioDrainOperation *)self audioPlayer];
      [v13 setDelegate:self];

      objc_super v14 = [(AudioDrainOperation *)self audioPlayer];
      [v14 play];
    }
  }
}

- (void)cancel
{
  id v3 = [(AudioDrainOperation *)self audioPlayer];

  if (v3)
  {
    v4 = +[AVSystemController sharedAVSystemController];
    [(AudioDrainOperation *)self originalVolume];
    [v4 setActiveCategoryVolumeTo:];

    id v5 = [(AudioDrainOperation *)self responder];
    [v5 enableVolumeHUD:1];

    uint64_t v6 = [(AudioDrainOperation *)self audioPlayer];
    [v6 stop];

    [(AudioDrainOperation *)self setAudioPlayer:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)AudioDrainOperation;
  [(DrainOperation *)&v7 cancel];
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
}

- (DKResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);

  return (DKResponder *)WeakRetained;
}

- (void)setResponder:(id)a3
{
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (float)requestedVolume
{
  return self->_requestedVolume;
}

- (void)setRequestedVolume:(float)a3
{
  self->_requestedVolume = a3;
}

- (float)originalVolume
{
  return self->_originalVolume;
}

- (void)setOriginalVolume:(float)a3
{
  self->_originalVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_responder);

  objc_storeStrong((id *)&self->_audioFileURL, 0);
}

@end