@interface IDSConnection
+ (id)_connectionWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5;
- (BOOL)isActive;
- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7;
- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (IDSAccount)account;
- (IDSConnection)initWithAccount:(id)a3;
- (IDSConnection)initWithAccount:(id)a3 commands:(id)a4;
- (_IDSConnection)_internal;
- (id)_initWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
@end

@implementation IDSConnection

+ (id)_connectionWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) _initWithAccount:v9 commands:v8 indirectDelegateCallouts:v5];

  return v10;
}

- (id)_initWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (_IDSRunningInDaemon())
  {
    v10 = +[IDSLogging IDSConnection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v10);
    }

    v11 = 0;
  }
  else
  {
    v12 = +[IDSInternalQueueController sharedInstance];
    int v13 = [v12 assertQueueIsCurrent];

    if (v13)
    {
      v14 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_191A2E378();
      }
    }
    v19.receiver = self;
    v19.super_class = (Class)IDSConnection;
    v15 = [(IDSConnection *)&v19 init];
    if (v15)
    {
      v16 = [[_IDSConnection alloc] initWithAccount:v8 commands:v9 indirectDelegateCallouts:v5 delegateContext:v15];
      internal = v15->_internal;
      v15->_internal = v16;
    }
    self = v15;
    v11 = self;
  }

  return v11;
}

- (IDSConnection)initWithAccount:(id)a3 commands:(id)a4
{
  return (IDSConnection *)[(IDSConnection *)self _initWithAccount:a3 commands:a4 indirectDelegateCallouts:0];
}

- (IDSConnection)initWithAccount:(id)a3
{
  return (IDSConnection *)[(IDSConnection *)self _initWithAccount:a3 commands:0 indirectDelegateCallouts:0];
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1919186C0;
  v6[4] = sub_191918580;
  v7 = (_IDSConnection *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191956C0C;
  v5[3] = &unk_1E5728DD0;
  v5[4] = v6;
  [v3 performBlock:v5 waitUntilDone:0];

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSConnection;
  [(IDSConnection *)&v4 dealloc];
}

- (_IDSConnection)_internal
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2E410();
    }
  }
  internal = self->_internal;

  return internal;
}

- (IDSAccount)account
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1919186C0;
  v11 = sub_191918580;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191956DF0;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (IDSAccount *)v4;
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191956F28;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191957040;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11 waitUntilDone:1];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191957100;
  v6[3] = &unk_1E5729BB0;
  v6[4] = self;
  void v6[5] = v4;
  [v5 performBlock:v6 waitUntilDone:1];
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = -86;
  v17 = +[IDSInternalQueueController sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_191957290;
  v22[3] = &unk_1E572A878;
  v26 = &v30;
  v22[4] = self;
  id v18 = v14;
  id v23 = v18;
  id v19 = v15;
  id v24 = v19;
  int64_t v27 = a5;
  id v20 = v16;
  id v25 = v20;
  v28 = a7;
  v29 = a8;
  [v17 performBlock:v22 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v31 + 24);
  _Block_object_dispose(&v30, 8);

  return (char)a8;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = -86;
  v17 = +[IDSInternalQueueController sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_191957458;
  v22[3] = &unk_1E572A878;
  v26 = &v30;
  v22[4] = self;
  id v18 = v14;
  id v23 = v18;
  id v19 = v15;
  id v24 = v19;
  int64_t v27 = a5;
  id v20 = v16;
  id v25 = v20;
  v28 = a7;
  v29 = a8;
  [v17 performBlock:v22 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v31 + 24);
  _Block_object_dispose(&v30, 8);

  return (char)a8;
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = -86;
  v17 = +[IDSInternalQueueController sharedInstance];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_191957620;
  v22[3] = &unk_1E572A878;
  v26 = &v30;
  v22[4] = self;
  id v18 = v14;
  id v23 = v18;
  id v19 = v15;
  id v24 = v19;
  int64_t v27 = a5;
  id v20 = v16;
  id v25 = v20;
  v28 = a7;
  v29 = a8;
  [v17 performBlock:v22 waitUntilDone:1];

  LOBYTE(a8) = *((unsigned char *)v31 + 24);
  _Block_object_dispose(&v30, 8);

  return (char)a8;
}

- (void).cxx_destruct
{
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  return [(IDSConnection *)self sendMessage:a3 toDestinations:a4 priority:200 options:a5 identifier:a6 error:a7];
}

@end