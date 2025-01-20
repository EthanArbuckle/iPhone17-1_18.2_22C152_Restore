@interface OctaneActionContext
+ (id)contextWithBundleID:(id)a3;
+ (id)contextWithBundleID:(id)a3 transactionID:(unint64_t)a4;
- (NSString)bundleID;
- (NSString)logKey;
- (NSXPCConnection)connection;
- (OctaneActionContext)init;
- (unint64_t)transactionID;
@end

@implementation OctaneActionContext

- (OctaneActionContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)OctaneActionContext;
  v2 = [(OctaneActionContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSXPCConnection currentConnection];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    uint64_t v5 = +[NSUUID lib_shortLogKey];
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v5;

    v2->_transactionID = -1;
  }
  return v2;
}

+ (id)contextWithBundleID:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 copy];

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (id)contextWithBundleID:(id)a3 transactionID:(unint64_t)a4
{
  id result = +[OctaneActionContext contextWithBundleID:a3];
  *((void *)result + 4) = a4;
  return result;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end