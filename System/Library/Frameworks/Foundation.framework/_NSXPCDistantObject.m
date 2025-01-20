@interface _NSXPCDistantObject
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSDictionary)_userInfo;
- (NSXPCConnection)_connection;
- (_NSXPCDistantObject)initWithCoder:(id)a3;
- (id)_initWithConnection:(id)a3 exportedObject:(id)a4 interface:(id)a5;
- (id)_initWithConnection:(id)a3 proxyNumber:(unint64_t)a4 generationCount:(unint64_t)a5 interface:(id)a6 options:(unint64_t)a7 error:(id)a8;
- (id)_unboostingRemoteObjectProxy;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)remoteObjectProxyWithTimeout:(double)a3 errorHandler:(id)a4;
- (id)remoteObjectProxyWithUserInfo:(id)a3 errorHandler:(id)a4;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_forwardStackInvocation:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)set_userInfo:(id)a3;
@end

@implementation _NSXPCDistantObject

- (BOOL)conformsToProtocol:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_NSXPCDistantObject;
  if (-[_NSXPCDistantObject conformsToProtocol:](&v8, sel_conformsToProtocol_)) {
    return 1;
  }
  if (self) {
    id Property = objc_getProperty(self, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  return protocol_conformsToProtocol((Protocol *)[Property protocol], (Protocol *)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id result = -[NSXPCInterface _methodSignatureForRemoteSelector:](self->_remoteInterface, "_methodSignatureForRemoteSelector:");
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)_NSXPCDistantObject;
    return [(_NSXPCDistantObject *)&v6 methodSignatureForSelector:a3];
  }
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ((self->_flags & 1) == 0) {
    -[NSXPCConnection _removeImportedProxy:]((uint64_t)self->_connection, (uint64_t)self);
  }

  id errorBlock = self->_errorBlock;
  if (errorBlock) {
    _Block_release(errorBlock);
  }

  v4.receiver = self;
  v4.super_class = (Class)_NSXPCDistantObject;
  [(_NSXPCDistantObject *)&v4 dealloc];
}

- (NSDictionary)_userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (id)remoteObjectProxyWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v5 = (id)objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 0, a4);
  objc_msgSend(v5, "set_userInfo:", a3);
  return v5;
}

- (void)set_userInfo:(id)a3
{
}

- (id)remoteObjectProxy
{
  v2 = objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 0, 0);

  return v2;
}

- (_NSXPCDistantObject)initWithCoder:(id)a3
{
  id v5 = [(_NSXPCDistantObject *)self init];
  if (!v5) {
    return v5;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: This class may only be decoded by an NSXPCCoder.", _NSMethodExceptionProem((objc_class *)v5, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v5->_proxyNumber = [a3 decodeInt64ForKey:@"pn"];
  char v6 = [a3 decodeBoolForKey:@"ex"];
  id v7 = (id)[a3 connection];
  v5->_connection = (NSXPCConnection *)v7;
  if (v6)
  {
    if (v7)
    {
      v5->_generationCount = *(void *)(*((void *)v7 + 9) + 8);
      if (v5->_proxyNumber != 1) {
        -[_NSXPCConnectionImportInfo addProxy:](*((void *)v7 + 9), (uint64_t)v5);
      }
    }
    else
    {
      v5->_generationCount = 0;
    }
    return v5;
  }
  v5->_flags |= 1uLL;
  uint64_t v8 = [a3 connection];
  if (v8) {
    uint64_t v8 = *(void *)(v8 + 56);
  }
  uint64_t v9 = -[_NSXPCConnectionExportedObjectTable exportedObjectForProxyNumber:]((os_unfair_lock_s *)v8, (const void *)v5->_proxyNumber);
  if (!v9) {
    return v5;
  }
  v12 = v9;

  return (_NSXPCDistantObject *)v12;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@: This class may only be encoded by an NSXPCCoder.", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_8;
  }
  connection = self->_connection;
  if (connection != (NSXPCConnection *)[a3 connection])
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@: This proxy object may only be sent over the connection on which it was received.", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0]);
  }
  [a3 encodeInt64:self->_proxyNumber forKey:@"pn"];
  uint64_t v7 = self->_flags & 1;

  [a3 encodeBool:v7 forKey:@"ex"];
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v3 = objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 4, a3);

  return v3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v3 = objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 0, a3);

  return v3;
}

- (id)_initWithConnection:(id)a3 proxyNumber:(unint64_t)a4 generationCount:(unint64_t)a5 interface:(id)a6 options:(unint64_t)a7 error:(id)a8
{
  v14 = [(_NSXPCDistantObject *)self init];
  if (v14)
  {
    v14->_connection = (NSXPCConnection *)a3;
    v14->_proxyNumber = a4;
    v14->_generationCount = a5;
    v14->_remoteInterface = (NSXPCInterface *)a6;
    v14->_flags = a7;
    if (a8) {
      v14->_id errorBlock = _Block_copy(a8);
    }
    connection = v14->_connection;
    if (connection && v14->_proxyNumber != 1) {
      -[_NSXPCConnectionImportInfo addProxy:]((uint64_t)connection->_importInfo, (uint64_t)v14);
    }
  }
  return v14;
}

- (void)_forwardStackInvocation:(id)a3
{
  connection = self->_connection;
  if (connection)
  {
    uint64_t v6 = objc_msgSend(a3, "methodSignature", self->_proxyNumber);
    uint64_t v7 = [a3 selector];
    [(NSXPCConnection *)connection _sendInvocation:a3 orArguments:0 count:0 methodSignature:v6 selector:v7 withProxy:self];
  }
}

- (id)_initWithConnection:(id)a3 exportedObject:(id)a4 interface:(id)a5
{
  uint64_t v8 = [(_NSXPCDistantObject *)self init];
  if (v8)
  {
    uint64_t v9 = (NSXPCConnection *)a3;
    v8->_connection = v9;
    if (v9) {
      uint64_t v9 = (NSXPCConnection *)v9->_exportInfo;
    }
    v8->_proxyNumber = -[_NSXPCConnectionExportedObjectTable proxyNumberForExportedObject:interface:]((uint64_t)v9, a4, a5);
    v8->_flags = 1;
  }
  return v8;
}

- (id)_unboostingRemoteObjectProxy
{
  v2 = objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 2, 0);

  return v2;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = -[NSXPCInterface _respondsToRemoteSelector:](self->_remoteInterface, "_respondsToRemoteSelector:");
  if (v5 == 2) {
    return 0;
  }
  if (v5 != 1) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)_NSXPCDistantObject;
  return [(_NSXPCDistantObject *)&v7 respondsToSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  connection = self->_connection;
  if (connection)
  {
    uint64_t v6 = objc_msgSend(a3, "methodSignature", self->_proxyNumber);
    uint64_t v7 = [a3 selector];
    [(NSXPCConnection *)connection _sendInvocation:a3 orArguments:0 count:0 methodSignature:v6 selector:v7 withProxy:self];
  }
}

- (id)remoteObjectProxyWithTimeout:(double)a3 errorHandler:(id)a4
{
  id result = (id)objc_msgSend(objc_alloc(-[NSXPCInterface _customSubclass](self->_remoteInterface, "_customSubclass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self->_connection, self->_proxyNumber, self->_generationCount, self->_remoteInterface, 0, a4);
  if (result) {
    *((double *)result + 8) = a3;
  }
  return result;
}

- (NSXPCConnection)_connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

@end