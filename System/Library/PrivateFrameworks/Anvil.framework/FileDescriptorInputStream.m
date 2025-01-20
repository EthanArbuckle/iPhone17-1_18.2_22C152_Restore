@interface FileDescriptorInputStream
- (BOOL)getBuffer:(char *)a3 length:(int64_t *)a4;
- (BOOL)hasBytesAvailable;
- (NSError)streamError;
- (NSStreamDelegate)delegate;
- (_TtC5Anvil25FileDescriptorInputStream)initWithData:(id)a3;
- (_TtC5Anvil25FileDescriptorInputStream)initWithURL:(id)a3;
- (int64_t)read:(char *)a3 maxLength:(int64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
- (void)setDelegate:(id)a3;
@end

@implementation FileDescriptorInputStream

- (void)open
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Anvil25FileDescriptorInputStream_status) = (Class)2;
}

- (void)close
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Anvil25FileDescriptorInputStream_status) = (Class)6;
}

- (BOOL)getBuffer:(char *)a3 length:(int64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Anvil25FileDescriptorInputStream_eof) & 1) == 0;
}

- (unint64_t)streamStatus
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC5Anvil25FileDescriptorInputStream_status);
}

- (NSError)streamError
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Anvil25FileDescriptorInputStream_err);
  if (v2)
  {
    id v3 = v2;
    v4 = (void *)sub_247998170();
  }
  else
  {
    v4 = 0;
  }

  return (NSError *)v4;
}

- (int64_t)read:(char *)a3 maxLength:(int64_t)a4
{
  v4 = self;
  int64_t v5 = sub_2478A9374();

  return v5;
}

- (NSStreamDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C564160]((char *)self + OBJC_IVAR____TtC5Anvil25FileDescriptorInputStream__delegate, a2);

  return (NSStreamDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC5Anvil25FileDescriptorInputStream)initWithData:(id)a3
{
  id v3 = a3;
  sub_2479982F0();

  result = (_TtC5Anvil25FileDescriptorInputStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Anvil25FileDescriptorInputStream)initWithURL:(id)a3
{
  uint64_t v3 = sub_247998240();
  MEMORY[0x270FA5388](v3 - 8);
  sub_247998210();
  result = (_TtC5Anvil25FileDescriptorInputStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Anvil25FileDescriptorInputStream_fileHandle));

  uint64_t v3 = (char *)self + OBJC_IVAR____TtC5Anvil25FileDescriptorInputStream__delegate;

  sub_2478A98F4((uint64_t)v3);
}

@end