@interface TKSEPClientTokenSession
- (BOOL)forceSystemSession;
- (TKSEPClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6;
- (TKTokenID)tokenID;
- (id)createObjectWithAttributes:(id)a3 error:(id *)a4;
- (id)objectForObjectID:(id)a3 error:(id *)a4;
@end

@implementation TKSEPClientTokenSession

- (TKTokenID)tokenID
{
  v3 = [TKTokenID alloc];
  v4 = [(TKClientTokenSession *)self token];
  v5 = [v4 tokenID];
  v6 = [(TKTokenID *)v3 initWithTokenID:v5];

  return v6;
}

- (BOOL)forceSystemSession
{
  v2 = [(TKClientTokenSession *)self parameters];
  v3 = [v2 objectForKeyedSubscript:@"forceSystemSession"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (TKSEPClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)TKSEPClientTokenSession;
  id v7 = -[TKClientTokenSession _initWithToken:LAContext:parameters:error:](&v14, sel__initWithToken_LAContext_parameters_error_, a3, a4, a5);
  if (!v7) {
    goto LABEL_3;
  }
  v8 = +[TKSEPClientToken builtinTokenIDs];
  v9 = [v7 tokenID];
  v10 = [v9 stringRepresentation];
  char v11 = [v8 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
      v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
LABEL_3:
    v12 = (TKSEPClientTokenSession *)v7;
  }

  return v12;
}

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1BED55000, "SEPClientObject: createKey", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v16 = 0;
  v8 = [(TKClientTokenSession *)self processObjectCreationAttributes:v6 authContext:&v16 error:a4];
  id v9 = v16;

  if (v8)
  {
    v10 = [TKSEPKey alloc];
    char v11 = (void *)[v8 mutableCopy];
    v12 = [(TKSEPKey *)v10 initWithAttributes:v11 authContext:v9 forceSystemSession:[(TKSEPClientTokenSession *)self forceSystemSession] error:a4];

    v13 = [(TKClientTokenSession *)self LAContext];
    [(TKSEPKey *)v12 setAuthContext:v13];

    if (v12)
    {
      objc_super v14 = [[TKSEPClientTokenObject alloc] initWithSession:self key:v12 error:a4];
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
  }
  objc_super v14 = 0;
LABEL_6:

  os_activity_scope_leave(&state);

  return v14;
}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1BED55000, "SEPClientObject: getKey", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v7, &v15);
  v8 = [(TKSEPClientTokenSession *)self tokenID];
  id v9 = [v8 decodedKeyID:v6 error:a4];

  if (v9)
  {
    v10 = [TKSEPKey alloc];
    char v11 = [(TKClientTokenSession *)self LAContext];
    v12 = [(TKSEPKey *)v10 initWithObjectID:v9 authContext:v11 forceSystemSession:[(TKSEPClientTokenSession *)self forceSystemSession] error:a4];

    if (v12) {
      v13 = [[TKSEPClientTokenObject alloc] initWithSession:self key:v12 error:a4];
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  os_activity_scope_leave(&v15);

  return v13;
}

@end