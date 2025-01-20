@interface _MPCMediaRemotePublisher_Swift
- (_MPCMediaRemotePublisher_Swift)init;
- (_MPCMediaRemotePublisher_Swift)initWithPublisher:(id)a3;
- (id)getSwiftQOSDialogForError:(id)a3 withItem:(id)a4;
- (id)processStatus:(id)a3 withCommandEvent:(id)a4;
- (void)findContentItemIDWithIncomingContentItemID:(NSString *)a3 trackID:(int64_t)a4 completion:(id)a5;
- (void)performDialogActionForCommandEvent:(MPRemoteCommandEvent *)a3 completion:(id)a4;
- (void)performSetQueueWithEvent:(MPSetPlaybackQueueCommandEvent *)a3 completion:(id)a4;
- (void)performSetSessionWithEvent:(MPSetPlaybackSessionCommandEvent *)a3 completion:(id)a4;
@end

@implementation _MPCMediaRemotePublisher_Swift

- (_MPCMediaRemotePublisher_Swift)initWithPublisher:(id)a3
{
  return (_MPCMediaRemotePublisher_Swift *)_MediaRemotePublisher.init(_:)();
}

- (void)performSetQueueWithEvent:(MPSetPlaybackQueueCommandEvent *)a3 completion:(id)a4
{
}

- (void)performSetSessionWithEvent:(MPSetPlaybackSessionCommandEvent *)a3 completion:(id)a4
{
}

- (void)findContentItemIDWithIncomingContentItemID:(NSString *)a3 trackID:(int64_t)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C635A0, (uint64_t)v9);
}

- (id)processStatus:(id)a3 withCommandEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_21BC374D4((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (void)performDialogActionForCommandEvent:(MPRemoteCommandEvent *)a3 completion:(id)a4
{
}

- (id)getSwiftQOSDialogForError:(id)a3 withItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21BC37B50();

  v9 = (void *)sub_21BEAA088();
  swift_bridgeObjectRelease();

  return v9;
}

- (_MPCMediaRemotePublisher_Swift)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____MPCMediaRemotePublisher_Swift_dialogHandler;

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
}

@end