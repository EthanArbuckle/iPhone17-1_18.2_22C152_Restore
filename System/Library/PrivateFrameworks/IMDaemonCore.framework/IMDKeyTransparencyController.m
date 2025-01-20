@interface IMDKeyTransparencyController
+ (id)sharedController;
- (BOOL)selfOptedIn;
- (IMDKeyTransparencyController)init;
- (NSDictionary)setupInfo;
- (void)optInStateChanged:(id)a3;
@end

@implementation IMDKeyTransparencyController

- (BOOL)selfOptedIn
{
  v2 = self;
  char v3 = sub_1D967F508();

  return v3 & 1;
}

- (NSDictionary)setupInfo
{
  sub_1D96867CC(&qword_1EBE2AF40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D991D850;
  sub_1D9906DA0();
  v4 = self;
  sub_1D99074F0();
  unsigned __int8 v5 = [(IMDKeyTransparencyController *)v4 selfOptedIn];
  *(void *)(inited + 96) = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 72) = v5;
  sub_1D967E824(inited);

  v6 = (void *)sub_1D9906CB0();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v6;
}

+ (id)sharedController
{
  if (qword_1EBE2AED8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBE2AEC8;

  return v2;
}

- (IMDKeyTransparencyController)init
{
  return (IMDKeyTransparencyController *)sub_1D98F0ED0();
}

- (void)optInStateChanged:(id)a3
{
  uint64_t v4 = sub_1D99062E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D99062B0();
  v8 = self;
  sub_1D98F17EC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_release();
}

@end