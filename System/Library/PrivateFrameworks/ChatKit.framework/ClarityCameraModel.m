@interface ClarityCameraModel
- (_TtC7ChatKit18ClarityCameraModel)init;
- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6;
@end

@implementation ClarityCameraModel

- (_TtC7ChatKit18ClarityCameraModel)init
{
  return (_TtC7ChatKit18ClarityCameraModel *)sub_18F6BE1D0();
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  uint64_t v9 = sub_18F7B60A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B6070();
  id v13 = a3;
  v14 = self;
  id v15 = a6;
  sub_18F6BFDC8((uint64_t)v12, a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void).cxx_destruct
{
  sub_18EF27FE8((uint64_t)self + OBJC_IVAR____TtC7ChatKit18ClarityCameraModel_captureSessionRuntimeErrorSubscription, &qword_1E923F4F8);
  sub_18EF6E880(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7ChatKit18ClarityCameraModel_videoRecordCompletionBlock));
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit18ClarityCameraModel__currentVideoURL;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E923F528);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end