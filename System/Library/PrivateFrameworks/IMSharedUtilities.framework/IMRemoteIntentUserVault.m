@interface IMRemoteIntentUserVault
+ (id)sharedUserVault;
- (IMRemoteIntentUserVault)init;
- (NSURL)baseDirectory;
- (id)convertedCommonPathForDirectory:(id)a3;
- (id)convertedPathForRemoteFile:(id)a3;
@end

@implementation IMRemoteIntentUserVault

+ (id)sharedUserVault
{
  if (qword_1E94F85D8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E94FC160;

  return v2;
}

- (NSURL)baseDirectory
{
  return (NSURL *)0;
}

- (IMRemoteIntentUserVault)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRemoteIntentUserVault_commonPathsMap) = (Class)MEMORY[0x1E4FBC868];
  v3.receiver = self;
  v3.super_class = (Class)IMRemoteIntentUserVault;
  return [(IMRemoteIntentUserVault *)&v3 init];
}

- (id)convertedCommonPathForDirectory:(id)a3
{
  uint64_t v4 = sub_1A09F33A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v15 - v9;
  sub_1A09F3358();
  v11 = self;
  IMRemoteIntentUserVault.convertedCommonPath(forDirectory:)((uint64_t)v10, (uint64_t)v8);

  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v10, v4);
  v13 = (void *)sub_1A09F3308();
  v12(v8, v4);

  return v13;
}

- (id)convertedPathForRemoteFile:(id)a3
{
  uint64_t v4 = sub_1A07856F8((uint64_t *)&unk_1EB4A5630);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A09F33A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A09F3358();
  v11 = self;
  IMRemoteIntentUserVault.convertedPath(forRemoteFile:)((uint64_t)v10, (uint64_t)v6);

  v12 = *(void (**)(char *, uint64_t))(v8 + 8);
  v12(v10, v7);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v13 = (void *)sub_1A09F3308();
    v12(v6, v7);
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end