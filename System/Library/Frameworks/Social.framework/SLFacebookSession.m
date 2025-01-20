@interface SLFacebookSession
+ (id)_remoteInterface;
+ (id)sharedSession;
- (BOOL)uploadPost:(id)a3;
- (BOOL)uploadPost:(id)a3 forPID:(int)a4;
- (BOOL)uploadProfilePicture:(id)a3 error:(id *)a4;
- (SLFacebookSession)init;
- (id)tokenSecretForEntitledClientWithError:(id *)a3;
- (void)fetchLikeStatusForURL:(id)a3 flags:(unint64_t)a4 completion:(id)a5;
- (void)likeURL:(id)a3 completion:(id)a4;
- (void)unlikeURL:(id)a3 completion:(id)a4;
- (void)uploadPost:(id)a3 suppressAlerts:(BOOL)a4 withPostCompletion:(id)a5;
@end

@implementation SLFacebookSession

+ (id)sharedSession
{
  if (sharedSession_onceToken != -1) {
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedSession___sharedSession;

  return v2;
}

uint64_t __34__SLFacebookSession_sharedSession__block_invoke()
{
  sharedSession___sharedSession = objc_alloc_init(SLFacebookSession);

  return MEMORY[0x1F41817F8]();
}

- (SLFacebookSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)SLFacebookSession;
  return [(SLFacebookSession *)&v3 init];
}

- (id)tokenSecretForEntitledClientWithError:(id *)a3
{
  *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:3 userInfo:0];
  return 0;
}

- (BOOL)uploadPost:(id)a3
{
  return 0;
}

- (BOOL)uploadPost:(id)a3 forPID:(int)a4
{
  return 0;
}

- (void)uploadPost:(id)a3 suppressAlerts:(BOOL)a4 withPostCompletion:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F178F0];
  id v8 = a5;
  id v9 = [v6 errorWithDomain:v7 code:3 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v8, 0, v9);
}

- (BOOL)uploadProfilePicture:(id)a3 error:(id *)a4
{
  *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:3 userInfo:0];
  return 0;
}

- (void)likeURL:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F178F0];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:3 userInfo:0];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (void)unlikeURL:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F178F0];
  id v7 = a4;
  id v8 = [v5 errorWithDomain:v6 code:3 userInfo:0];
  (*((void (**)(id, id))a4 + 2))(v7, v8);
}

- (void)fetchLikeStatusForURL:(id)a3 flags:(unint64_t)a4 completion:(id)a5
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F178F0];
  id v8 = a5;
  id v9 = [v6 errorWithDomain:v7 code:3 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v8, 0, v9);
}

+ (id)_remoteInterface
{
  return 0;
}

@end