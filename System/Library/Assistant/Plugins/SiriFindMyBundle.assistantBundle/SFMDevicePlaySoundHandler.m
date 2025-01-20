@interface SFMDevicePlaySoundHandler
- (SFMDevicePlaySoundHandler)init;
- (SFMDevicePlaySoundHandler)initWithCoder:(id)a3;
- (SFMDevicePlaySoundHandler)initWithDictionary:(id)a3;
- (SFMDevicePlaySoundHandler)initWithDictionary:(id)a3 context:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation SFMDevicePlaySoundHandler

- (void)performWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_69C4;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_59BC((void (*)(id))v7, v6);
  sub_697C((uint64_t)v7);
}

- (SFMDevicePlaySoundHandler)init
{
  return (SFMDevicePlaySoundHandler *)sub_63F4();
}

- (SFMDevicePlaySoundHandler)initWithDictionary:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_9DE0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SFMDevicePlaySoundHandler *)sub_644C(v3);
}

- (SFMDevicePlaySoundHandler)initWithDictionary:(id)a3 context:(id)a4
{
  if (a3) {
    uint64_t v5 = sub_9DE0();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_unknownObjectRetain();
  return (SFMDevicePlaySoundHandler *)sub_6544(v5, (uint64_t)a4);
}

- (SFMDevicePlaySoundHandler)initWithCoder:(id)a3
{
  return (SFMDevicePlaySoundHandler *)sub_666C(a3);
}

@end