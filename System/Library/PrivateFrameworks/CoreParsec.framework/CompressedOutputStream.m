@interface CompressedOutputStream
- (BOOL)hasSpaceAvailable;
- (NSError)streamError;
- (NSOutputStream)outputStream;
- (NSString)dataDigestForStream;
- (_TtC7parsecd22CompressedOutputStream)init;
- (_TtC7parsecd22CompressedOutputStream)initWithOutputStream:(id)a3;
- (_TtC7parsecd22CompressedOutputStream)initWithURL:(id)a3 append:(BOOL)a4;
- (id)initToBuffer:(char *)a3 capacity:(int64_t)a4;
- (id)initToMemory;
- (int64_t)compressedBytesWritten;
- (int64_t)uncompressedBytesWritten;
- (int64_t)write:(const char *)a3 maxLength:(int64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
@end

@implementation CompressedOutputStream

- (NSOutputStream)outputStream
{
  id v2 = sub_10004CDD8();

  return (NSOutputStream *)v2;
}

- (int64_t)uncompressedBytesWritten
{
  return sub_10004CE0C();
}

- (int64_t)compressedBytesWritten
{
  return sub_10004CE40();
}

- (_TtC7parsecd22CompressedOutputStream)init
{
  return (_TtC7parsecd22CompressedOutputStream *)sub_10004CE50();
}

- (_TtC7parsecd22CompressedOutputStream)initWithOutputStream:(id)a3
{
  return (_TtC7parsecd22CompressedOutputStream *)sub_10004CF08(a3);
}

- (NSString)dataDigestForStream
{
  id v2 = self;
  sub_10004D18C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)write:(const char *)a3 maxLength:(int64_t)a4
{
  v6 = self;
  int64_t v7 = sub_10004D334((const uint8_t *)a3, a4);

  return v7;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (unint64_t)streamStatus
{
  return sub_10004D658();
}

- (NSError)streamError
{
  id v2 = self;
  id v3 = sub_10004D6EC();

  if (v3)
  {
    v4 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSError *)v4;
}

- (void)open
{
  id v2 = self;
  sub_10004D764();
}

- (void)close
{
  id v2 = self;
  sub_10004D7C4();
}

- (id)initToMemory
{
}

- (id)initToBuffer:(char *)a3 capacity:(int64_t)a4
{
}

- (_TtC7parsecd22CompressedOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  uint64_t v4 = type metadata accessor for URL();
  __chkstk_darwin(v4 - 8);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10004DB3C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7parsecd22CompressedOutputStream_outputStream));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end