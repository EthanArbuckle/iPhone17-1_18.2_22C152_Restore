@interface DTDaemonShim
- (DTDaemonShim)init;
- (void)activate;
@end

@implementation DTDaemonShim

- (void)activate
{
  v2 = self;
  sub_24CE07510();
}

- (DTDaemonShim)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTDaemonShim__daemon) = 0;
  v3.receiver = self;
  v3.super_class = (Class)DTDaemonShim;
  return [(DTDaemonShim *)&v3 init];
}

- (void).cxx_destruct
{
}

@end