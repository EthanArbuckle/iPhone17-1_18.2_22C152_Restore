@interface SecureStorageMock
- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5;
- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 completionHandler:(id)a7;
- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 connection:(id)a7 completionHandler:(id)a8;
@end

@implementation SecureStorageMock

- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[NSXPCConnection currentConnection];
  [(SecureStorageMock *)self setObject:v15 acl:v14 forKey:a5 contextUUID:v13 connection:v16 completionHandler:v12];
}

- (void)setObject:(id)a3 acl:(id)a4 forKey:(int64_t)a5 contextUUID:(id)a6 connection:(id)a7 completionHandler:(id)a8
{
  id v9 = a8;
  id v10 = +[LAErrorHelper errorNotSupported];
  (*((void (**)(id, void, id))a8 + 2))(v9, 0, v10);
}

- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSXPCConnection currentConnection];
  [(SecureStorageMock *)self objectForKey:a3 contextUUID:v9 connection:v10 completionHandler:v8];
}

- (void)objectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  id v8 = +[LAErrorHelper errorNotSupported];
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSXPCConnection currentConnection];
  [(SecureStorageMock *)self removeObjectForKey:a3 contextUUID:v9 connection:v10 completionHandler:v8];
}

- (void)removeObjectForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  id v8 = +[LAErrorHelper errorNotSupported];
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSXPCConnection currentConnection];
  [(SecureStorageMock *)self aclForKey:a3 contextUUID:v9 connection:v10 completionHandler:v8];
}

- (void)aclForKey:(int64_t)a3 contextUUID:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  id v8 = +[LAErrorHelper errorNotSupported];
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

@end