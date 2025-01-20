@interface IMRemoteIntentFileDownloadObserver
+ (id)sharedObserver;
- (BOOL)isDownloadingTransferGUID:(id)a3;
- (IMRemoteIntentFileDownloadObserver)init;
@end

@implementation IMRemoteIntentFileDownloadObserver

+ (id)sharedObserver
{
  if (qword_1E94F85C8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E94FC108;

  return v2;
}

- (IMRemoteIntentFileDownloadObserver)init
{
  return (IMRemoteIntentFileDownloadObserver *)sub_1A0928B7C();
}

- (BOOL)isDownloadingTransferGUID:(id)a3
{
  sub_1A09F3E18();
  v4 = self;
  sub_1A09F4408();

  swift_bridgeObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
}

@end