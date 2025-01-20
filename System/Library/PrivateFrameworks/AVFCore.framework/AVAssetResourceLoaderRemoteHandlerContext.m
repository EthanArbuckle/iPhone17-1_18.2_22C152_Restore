@interface AVAssetResourceLoaderRemoteHandlerContext
+ (BOOL)supportsSecureCoding;
- (AVAssetResourceLoaderRemoteHandlerContext)initWithCoder:(id)a3;
- (AVAssetResourceLoaderRemoteHandlerContext)initWithEndpoint:(id)a3 customURLHandlerObjectID:(unint64_t)a4 authHandlerObjectID:(unint64_t)a5 contentKeySessionHandlerObjectID:(unint64_t)a6;
- (OS_xpc_object)endpoint;
- (unint64_t)authHandlerObjectID;
- (unint64_t)contentKeySessionHandlerObjectID;
- (unint64_t)customURLHandlerObjectID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVAssetResourceLoaderRemoteHandlerContext

- (AVAssetResourceLoaderRemoteHandlerContext)initWithEndpoint:(id)a3 customURLHandlerObjectID:(unint64_t)a4 authHandlerObjectID:(unint64_t)a5 contentKeySessionHandlerObjectID:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)AVAssetResourceLoaderRemoteHandlerContext;
  v9 = [(AVAssetResourceLoaderRemoteHandlerContext *)&v11 init];
  if (v9)
  {
    v9->_endpoint = (OS_xpc_object *)FigXPCRetain();
    v9->_customURLHandlerObjectID = a4;
    v9->_authHandlerObjectID = a5;
    v9->_contentKeySessionHandlerObjectID = a6;
  }
  return v9;
}

- (AVAssetResourceLoaderRemoteHandlerContext)initWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    objc_super v11 = (objc_class *)objc_opt_class();
    v17 = @"can be decoded only by a NSXPCCoder";
    goto LABEL_8;
  }
  v19.receiver = self;
  v19.super_class = (Class)AVAssetResourceLoaderRemoteHandlerContext;
  v6 = [(AVAssetResourceLoaderRemoteHandlerContext *)&v19 init];
  if (v6)
  {
    uint64_t v7 = [a3 decodeXPCObjectForKey:@"endpoint"];
    if (v7)
    {
      -[AVAssetResourceLoaderRemoteHandlerContext initWithEndpoint:customURLHandlerObjectID:authHandlerObjectID:contentKeySessionHandlerObjectID:](v6, "initWithEndpoint:customURLHandlerObjectID:authHandlerObjectID:contentKeySessionHandlerObjectID:", v7, [a3 decodeInt64ForKey:@"customURLHandlerObjectID"], objc_msgSend(a3, "decodeInt64ForKey:", @"authHandlerObjectID"), objc_msgSend(a3, "decodeInt64ForKey:", @"contentKeySessionHandlerObjectID"));
      return v6;
    }
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    objc_super v11 = (objc_class *)objc_opt_class();
    v17 = @"NSXPCCoder returned NULL endpoint";
LABEL_8:
    v18 = objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithClassAndSelector(v11, a2, (uint64_t)v17, v12, v13, v14, v15, v16, (uint64_t)v19.receiver), 0);
    objc_exception_throw(v18);
  }
  return v6;
}

- (void)dealloc
{
  FigXPCRelease();
  v3.receiver = self;
  v3.super_class = (Class)AVAssetResourceLoaderRemoteHandlerContext;
  [(AVAssetResourceLoaderRemoteHandlerContext *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = (objc_class *)objc_opt_class();
    uint64_t v15 = (void *)[v7 exceptionWithName:v8, AVMethodExceptionReasonWithClassAndSelector(v9, a2, @"can be encoded only by a NSXPCCoder", v10, v11, v12, v13, v14, v16), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  [a3 encodeXPCObject:self->_endpoint forKey:@"endpoint"];
  [a3 encodeInt64:self->_customURLHandlerObjectID forKey:@"customURLHandlerObjectID"];
  [a3 encodeInt64:self->_authHandlerObjectID forKey:@"authHandlerObjectID"];
  unint64_t contentKeySessionHandlerObjectID = self->_contentKeySessionHandlerObjectID;
  [a3 encodeInt64:contentKeySessionHandlerObjectID forKey:@"contentKeySessionHandlerObjectID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (unint64_t)customURLHandlerObjectID
{
  return self->_customURLHandlerObjectID;
}

- (unint64_t)authHandlerObjectID
{
  return self->_authHandlerObjectID;
}

- (unint64_t)contentKeySessionHandlerObjectID
{
  return self->_contentKeySessionHandlerObjectID;
}

@end