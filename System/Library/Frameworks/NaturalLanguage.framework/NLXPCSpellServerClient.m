@interface NLXPCSpellServerClient
+ (id)spellServerClient;
+ (void)requestAssetsForLanguage:(id)a3;
- (BOOL)isValid;
- (NLXPCSpellServerClient)initWithServerName:(id)a3;
- (id)connection;
- (id)serverName;
- (void)dealloc;
- (void)sendCommand:(id)a3;
@end

@implementation NLXPCSpellServerClient

- (NLXPCSpellServerClient)initWithServerName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NLXPCSpellServerClient;
  v5 = [(NLXPCSpellServerClient *)&v14 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFB42D68];
    uint64_t v7 = [v4 copy];
    serverName = v5->_serverName;
    v5->_serverName = (NSString *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v5->_serverName options:0];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v9;

    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v6];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__NLXPCSpellServerClient_initWithServerName___block_invoke;
    v12[3] = &unk_1E5C53888;
    v13 = v5;
    [(NSXPCConnection *)v5->_connection setInvalidationHandler:v12];
    [(NSXPCConnection *)v5->_connection resume];
  }
  return v5;
}

void __45__NLXPCSpellServerClient_initWithServerName___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NLXPCSpellServerClient;
  [(NLXPCSpellServerClient *)&v3 dealloc];
}

- (id)serverName
{
  return self->_serverName;
}

- (id)connection
{
  return self->_connection;
}

- (BOOL)isValid
{
  return !self->_invalidated;
}

- (void)sendCommand:(id)a3
{
  id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:100 options:0 error:0];
  id v4 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  v6 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  uint64_t v7 = [@"!!!command!!!" stringByAppendingString:v6];

  objc_msgSend(v5, "_xpc_checkString:offset:types:options:orthography:learnedDictionaries:completionHandler:", v7, 0, 2, &unk_1EFB3AAF8, 0, 0, &__block_literal_global_31_0);
}

void __38__NLXPCSpellServerClient_sendCommand___block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (id)spellServerClient
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NLXPCSpellServerClient_spellServerClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (spellServerClient_onceToken != -1) {
    dispatch_once(&spellServerClient_onceToken, block);
  }
  v2 = (void *)spellServerClient__xpcServer;

  return v2;
}

uint64_t __43__NLXPCSpellServerClient_spellServerClient__block_invoke(uint64_t a1)
{
  spellServerClient__xpcServer = [objc_alloc(*(Class *)(a1 + 32)) initWithServerName:@"mul-xpc (Apple)_OpenStep"];

  return MEMORY[0x1F41817F8]();
}

+ (void)requestAssetsForLanguage:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    v5 = [a1 spellServerClient];
    v7[0] = @"Command";
    v7[1] = @"Language";
    v8[0] = @"RequestAssets";
    v8[1] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

    [v5 sendCommand:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_serverName, 0);
}

@end