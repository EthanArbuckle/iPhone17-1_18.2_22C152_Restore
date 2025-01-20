@interface DocumentRegistrationURLSessionDelegate
- (_TtC5Anvil38DocumentRegistrationURLSessionDelegate)init;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
@end

@implementation DocumentRegistrationURLSessionDelegate

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  v8 = _Block_copy(a5);
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_fileDescriptor + 4))
  {
    id v14 = a3;
    id v15 = a4;
    v16 = self;
    _Block_release(v8);
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(unsigned int *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_fileDescriptor);
    id v10 = objc_allocWithZone((Class)type metadata accessor for FileDescriptorInputStream());
    id v11 = a3;
    id v12 = a4;
    v17 = self;
    id v13 = sub_2478A91C4(v9);
    (*((void (**)(void *, id))v8 + 2))(v8, v13);

    _Block_release(v8);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  uint64_t v12 = sub_2479982F0();
  unint64_t v14 = v13;

  swift_beginAccess();
  sub_247998300();
  swift_endAccess();
  sub_2478A0704(v12, v14);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_24796DBD4(v9, (uint64_t)a5);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  unint64_t v14 = self;
  sub_24796DCD0(a5, a6, a7);
}

- (_TtC5Anvil38DocumentRegistrationURLSessionDelegate)init
{
  result = (_TtC5Anvil38DocumentRegistrationURLSessionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_data);
  unint64_t v4 = *(void *)&self->update[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_data];

  sub_2478A0704(v3, v4);
}

@end