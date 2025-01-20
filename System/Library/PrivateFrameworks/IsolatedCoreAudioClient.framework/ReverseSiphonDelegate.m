@interface ReverseSiphonDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCInterface)reverseInterface;
- (NSXPCListener)reverseListener;
- (ReverseSiphonDelegate)init;
- (void)AudioAvailabilityCallback:(unint64_t)a3 atSample:(unint64_t)a4 with:(id)a5;
- (void)LapseCallback:(int)a3 with:(id)a4;
- (void)setAvailabilityCallback:(void *)a3 data:(void *)a4;
- (void)setLapseCallback:(void *)a3 data:(void *)a4;
- (void)setReverseInterface:(id)a3;
- (void)setReverseListener:(id)a3;
@end

@implementation ReverseSiphonDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseInterface, 0);
  objc_storeStrong((id *)&self->_reverseListener, 0);
}

- (void)setReverseInterface:(id)a3
{
}

- (NSXPCInterface)reverseInterface
{
  return self->_reverseInterface;
}

- (void)setReverseListener:(id)a3
{
}

- (NSXPCListener)reverseListener
{
  return self->_reverseListener;
}

- (void)LapseCallback:(int)a3 with:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = (void (**)(id, void))a4;
  ((void (*)(uint64_t, void *))self->mLapseCallback)(v4, self->mLapseData);
  v6[2](v6, 0);
}

- (void)AudioAvailabilityCallback:(unint64_t)a3 atSample:(unint64_t)a4 with:(id)a5
{
  v8 = (void (**)(id, void))a5;
  ((void (*)(unint64_t, unint64_t, void *))self->mAvailabilityCallback)(a3, a4, self->mAvailabilityData);
  v8[2](v8, 0);
}

- (void)setLapseCallback:(void *)a3 data:(void *)a4
{
  self->mLapseCallback = a3;
  self->mLapseData = a4;
}

- (void)setAvailabilityCallback:(void *)a3 data:(void *)a4
{
  self->mAvailabilityCallback = a3;
  self->mAvailabilityData = a4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [(ReverseSiphonDelegate *)self reverseInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 activate];

  return 1;
}

- (ReverseSiphonDelegate)init
{
  v9.receiver = self;
  v9.super_class = (Class)ReverseSiphonDelegate;
  v2 = [(ReverseSiphonDelegate *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->mLapseCallback = -[ReverseSiphonDelegate init]::$_0::__invoke;
    uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2703C7350];
    [(ReverseSiphonDelegate *)v3 setReverseInterface:v4];

    id v5 = [MEMORY[0x263F08D88] anonymousListener];
    [(ReverseSiphonDelegate *)v3 setReverseListener:v5];

    v6 = [(ReverseSiphonDelegate *)v3 reverseListener];
    [v6 setDelegate:v3];

    v7 = [(ReverseSiphonDelegate *)v3 reverseListener];
    [v7 activate];
  }
  return v3;
}

@end