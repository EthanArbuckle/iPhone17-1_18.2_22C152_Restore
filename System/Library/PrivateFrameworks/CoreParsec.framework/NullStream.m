@interface NullStream
- (BOOL)hasSpaceAvailable;
- (NSError)streamError;
- (_TtC7parsecd10NullStream)initWithURL:(id)a3 append:(BOOL)a4;
- (id)initToBuffer:(char *)a3 capacity:(int64_t)a4;
- (id)initToMemory;
- (int64_t)write:(const char *)a3 maxLength:(int64_t)a4;
- (unint64_t)streamStatus;
@end

@implementation NullStream

- (int64_t)write:(const char *)a3 maxLength:(int64_t)a4
{
  return a4;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (unint64_t)streamStatus
{
  return 2;
}

- (NSError)streamError
{
  return (NSError *)0;
}

- (id)initToMemory
{
  return sub_10010A1DC();
}

- (id)initToBuffer:(char *)a3 capacity:(int64_t)a4
{
  return sub_10010A244((uint64_t)a3, a4);
}

- (_TtC7parsecd10NullStream)initWithURL:(id)a3 append:(BOOL)a4
{
  uint64_t v5 = type metadata accessor for URL();
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC7parsecd10NullStream *)sub_10010A2D4((uint64_t)v7, a4);
}

@end