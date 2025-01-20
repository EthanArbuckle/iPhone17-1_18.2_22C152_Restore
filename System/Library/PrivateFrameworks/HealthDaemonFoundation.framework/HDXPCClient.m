@interface HDXPCClient
+ (id)clientWithConnection:(id)a3 error:(id *)a4;
- (HDXPCClient)initWithConnection:(id)a3 process:(id)a4;
- (HDXPCClient)initWithProcess:(id)a3;
- (HDXPCProcess)process;
- (NSXPCConnection)connection;
- (id)_initWithConnection:(id)a3 process:(id)a4;
- (id)description;
@end

@implementation HDXPCClient

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (HDXPCProcess)process
{
  return (HDXPCProcess *)objc_getProperty(self, a2, 8, 1);
}

- (HDXPCClient)initWithConnection:(id)a3 process:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDXPCClient.m", 34, @"Invalid parameter not satisfying: %@", @"connection != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDXPCClient.m", 35, @"Invalid parameter not satisfying: %@", @"process != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [(HDXPCClient *)self _initWithConnection:v7 process:v9];

  return v10;
}

- (id)_initWithConnection:(id)a3 process:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDXPCClient;
  v9 = [(HDXPCClient *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_process, 0);
}

+ (id)clientWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HDXPCProcess processWithConnection:v6 error:a4];
  if (v7) {
    id v8 = (void *)[objc_alloc((Class)a1) _initWithConnection:v6 process:v7];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (HDXPCClient)initWithProcess:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDXPCClient.m", 41, @"Invalid parameter not satisfying: %@", @"process != nil" object file lineNumber description];
  }
  id v6 = [(HDXPCClient *)self _initWithConnection:0 process:v5];

  return v6;
}

- (id)description
{
  v2 = [(HDXPCClient *)self process];
  v3 = [v2 name];
  v4 = [v2 applicationIdentifier];
  id v5 = [v2 bundleIdentifier];
  if ([v5 isEqualToString:v3] & 1) != 0 || (objc_msgSend(v5, "isEqualToString:", v4)) {
    id v6 = &stru_26CC1AE10;
  }
  else {
    id v6 = (__CFString *)[[NSString alloc] initWithFormat:@" proc-bid=%@", v5];
  }
  id v7 = [NSString stringWithFormat:@"<%@ %@(%d) app-id=%@%@>", objc_opt_class(), v3, objc_msgSend(v2, "processIdentifier"), v4, v6, 0];

  return v7;
}

@end