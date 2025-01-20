@interface IVRConversationAssistant
- (IVRConversationAssistant)init;
- (Transcriber)transcriberHandle;
- (void)getOptionStreamWithReply:(id)a3;
- (void)setTranscriberHandle:(id)a3;
- (void)startOptionStreamWithReply:(id)a3;
- (void)stopOptionStreamWithReply:(id)a3;
- (void)userSelectedDTMFOption:(id)a3 withReply:(id)a4;
@end

@implementation IVRConversationAssistant

- (IVRConversationAssistant)init
{
  v6.receiver = self;
  v6.super_class = (Class)IVRConversationAssistant;
  v2 = [(IVRConversationAssistant *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[Transcriber sharedInstance];
    transcriberHandle = v2->_transcriberHandle;
    v2->_transcriberHandle = (Transcriber *)v3;
  }
  return v2;
}

- (void)startOptionStreamWithReply:(id)a3
{
  objc_super v6 = (void (**)(id, id))a3;
  v4 = [(IVRConversationAssistant *)self transcriberHandle];
  id v5 = [v4 startTranscribing];

  v6[2](v6, v5);
}

- (void)getOptionStreamWithReply:(id)a3
{
  id v5 = a3;
  id v7 = [(IVRConversationAssistant *)self transcriberHandle];
  objc_super v6 = [v7 transcription];
  (*((void (**)(id, uint64_t, void *, void))a3 + 2))(v5, 1, v6, 0);
}

- (void)stopOptionStreamWithReply:(id)a3
{
  objc_super v6 = (void (**)(id, id))a3;
  v4 = [(IVRConversationAssistant *)self transcriberHandle];
  id v5 = [v4 stopTranscribing];

  v6[2](v6, v5);
}

- (void)userSelectedDTMFOption:(id)a3 withReply:(id)a4
{
}

- (Transcriber)transcriberHandle
{
  return self->_transcriberHandle;
}

- (void)setTranscriberHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end