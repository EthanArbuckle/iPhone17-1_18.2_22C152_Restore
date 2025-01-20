@interface VideoReader.Observer
- (_TtCV18CreateMLComponents11VideoReader8Observer)init;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dealloc;
@end

@implementation VideoReader.Observer

- (void)dealloc
{
  v2 = self;
  sub_23954B8A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV18CreateMLComponents11VideoReader8Observer_captureSession));
  sub_23954F15C((uint64_t)self + OBJC_IVAR____TtCV18CreateMLComponents11VideoReader8Observer_state);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV18CreateMLComponents11VideoReader8Observer_queue);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_23954E2BC();
}

- (_TtCV18CreateMLComponents11VideoReader8Observer)init
{
}

@end