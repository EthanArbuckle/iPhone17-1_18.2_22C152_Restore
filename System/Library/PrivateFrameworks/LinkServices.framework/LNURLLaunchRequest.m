@interface LNURLLaunchRequest
+ (BOOL)isValidURLForLaunching:(id)a3;
- (LNURLLaunchRequest)init;
- (LNURLLaunchRequest)initWithAction:(id)a3;
- (LNURLLaunchRequest)initWithEntity:(id)a3 metadata:(id)a4;
- (LNURLLaunchRequest)initWithEnumCaseIdentifier:(id)a3 metadata:(id)a4;
- (LNURLLaunchRequest)initWithURL:(id)a3;
- (void)performValidatingURLScheme:(BOOL)a3 completionHandler:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation LNURLLaunchRequest

- (LNURLLaunchRequest)initWithURL:(id)a3
{
  uint64_t v3 = sub_1A44F91D0();
  MEMORY[0x1F4188790](v3 - 8);
  sub_1A44F9190();
  return (LNURLLaunchRequest *)sub_1A4456348();
}

- (LNURLLaunchRequest)initWithEntity:(id)a3 metadata:(id)a4
{
  return (LNURLLaunchRequest *)sub_1A4456470((uint64_t)a3, (uint64_t)a4);
}

- (LNURLLaunchRequest)initWithEnumCaseIdentifier:(id)a3 metadata:(id)a4
{
  uint64_t v5 = sub_1A44F94E0();
  return (LNURLLaunchRequest *)sub_1A4456508(v5, v6, (uint64_t)a4);
}

- (LNURLLaunchRequest)initWithAction:(id)a3
{
  return (LNURLLaunchRequest *)sub_1A44565AC((uint64_t)a3);
}

- (void)performWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  uint64_t v6 = self;
  sub_1A4456B58((uint64_t)&unk_1E9647D00, v5);
}

- (void)performValidatingURLScheme:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = self;
  v8 = self;
  sub_1A4456B58((uint64_t)&unk_1E9647C70, v7);
}

+ (BOOL)isValidURLForLaunching:(id)a3
{
  uint64_t v3 = sub_1A44F91D0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A44F9190();
  char v7 = sub_1A445A440();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (LNURLLaunchRequest)init
{
}

- (void).cxx_destruct
{
}

@end