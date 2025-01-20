@interface VideoMessagingServer
- (void)sendVideoMessageWithData:(NSData *)a3 url:(_TtC20FaceTimeMessageStore18SandboxExtendedURL *)a4 completionHandler:(id)a5;
@end

@implementation VideoMessagingServer

- (void)sendVideoMessageWithData:(NSData *)a3 url:(_TtC20FaceTimeMessageStore18SandboxExtendedURL *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  swift_retain();
  sub_24DEC89DC((uint64_t)&unk_269895B50, (uint64_t)v9);
}

@end