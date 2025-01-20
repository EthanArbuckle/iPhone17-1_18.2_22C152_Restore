@interface FigCaptureDeferredPhotoProcessorRequest
- (BOOL)isEqual:(id)a3;
- (BWDeferredProcessingContainer)container;
- (FigCaptureDeferredPhotoProcessorRequest)initWithApplicationID:(id)a3 captureRequstIdentifier:(id)a4 photoIdentifier:(id)a5 clientPID:(int)a6 message:(id)a7 qosClass:(unsigned int)a8 parent:(id)a9;
- (FigCaptureDeferredPhotoProcessorRequest)parent;
- (NSString)applicationID;
- (NSString)captureRequestIdentifier;
- (NSString)photoIdentifier;
- (id)description;
- (int)clientPID;
- (unint64_t)hash;
- (unsigned)qosClass;
- (void)dealloc;
- (void)setContainer:(id)a3;
@end

@implementation FigCaptureDeferredPhotoProcessorRequest

- (FigCaptureDeferredPhotoProcessorRequest)initWithApplicationID:(id)a3 captureRequstIdentifier:(id)a4 photoIdentifier:(id)a5 clientPID:(int)a6 message:(id)a7 qosClass:(unsigned int)a8 parent:(id)a9
{
  v16.receiver = self;
  v16.super_class = (Class)FigCaptureDeferredPhotoProcessorRequest;
  v14 = [(FigCaptureDeferredPhotoProcessorRequest *)&v16 init];
  if (v14)
  {
    v14->_applicationID = (NSString *)[a3 copy];
    v14->_captureRequestIdentifier = (NSString *)[a4 copy];
    v14->_photoIdentifier = (NSString *)[a5 copy];
    v14->_clientPID = a6;
    v14->_parent = (FigCaptureDeferredPhotoProcessorRequest *)a9;
    v14->_message = (OS_xpc_object *)FigXPCRetain();
    v14->_qosClass = a8;
  }
  return v14;
}

- (void)dealloc
{
  FigXPCRelease();
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDeferredPhotoProcessorRequest;
  [(FigCaptureDeferredPhotoProcessorRequest *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  int v5 = -[NSString isEqual:](self->_applicationID, "isEqual:", [a3 applicationID]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSString isEqual:](self->_captureRequestIdentifier, "isEqual:", [a3 captureRequestIdentifier]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSString isEqual:](self->_photoIdentifier, "isEqual:", [a3 photoIdentifier]);
  if (!v5) {
    return v5;
  }
  int clientPID = self->_clientPID;
  if (clientPID != [a3 clientPID])
  {
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  parent = self->_parent;
  if (parent == (FigCaptureDeferredPhotoProcessorRequest *)[a3 parent]
    || (int v5 = -[FigCaptureDeferredPhotoProcessorRequest isEqual:](self->_parent, "isEqual:", [a3 parent])) != 0)
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_applicationID hash];
  NSUInteger v4 = [(NSString *)self->_captureRequestIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_photoIdentifier hash] ^ self->_clientPID;
}

- (id)description
{
  parent = self->_parent;
  if (parent) {
    NSUInteger v4 = (__CFString *)[NSString stringWithFormat:@", parent: %@", -[FigCaptureDeferredPhotoProcessorRequest description](parent, "description")];
  }
  else {
    NSUInteger v4 = &stru_1EFA403E0;
  }
  int v5 = NSString;
  uint64_t v6 = objc_opt_class();
  return (id)[v5 stringWithFormat:@"<%@ %p>: applicationID: %@, captureRequestIdentifier: %@, photoIdentifier: %@ clientPID: %d %@%@", v6, self, self->_applicationID, self->_captureRequestIdentifier, self->_photoIdentifier, self->_clientPID, FigCaptureQOSClassToString(self->_qosClass), v4];
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)captureRequestIdentifier
{
  return self->_captureRequestIdentifier;
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (int)clientPID
{
  return self->_clientPID;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (FigCaptureDeferredPhotoProcessorRequest)parent
{
  return self->_parent;
}

- (BWDeferredProcessingContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

@end