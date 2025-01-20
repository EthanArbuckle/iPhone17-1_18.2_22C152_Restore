@interface CallProviderWrapper
- (_TtC20LiveCommunicationKit19CallProviderWrapper)init;
- (void)provider:(id)a3 didActivateAudioSession:(id)a4;
- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performPlayDTMFCallAction:(id)a4;
- (void)provider:(id)a3 performSetGroupCallAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performStartCallAction:(id)a4;
- (void)provider:(id)a3 timedOutPerformingAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
@end

@implementation CallProviderWrapper

- (void)providerDidReset:(id)a3
{
}

- (void)providerDidBegin:(id)a3
{
}

- (void)provider:(id)a3 didActivateAudioSession:(id)a4
{
}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
}

- (void)provider:(id)a3 timedOutPerformingAction:(id)a4
{
}

- (void)provider:(id)a3 performStartCallAction:(id)a4
{
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
}

- (void)provider:(id)a3 performSetGroupCallAction:(id)a4
{
}

- (void)provider:(id)a3 performPlayDTMFCallAction:(id)a4
{
}

- (_TtC20LiveCommunicationKit19CallProviderWrapper)init
{
  return (_TtC20LiveCommunicationKit19CallProviderWrapper *)sub_244562118();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end