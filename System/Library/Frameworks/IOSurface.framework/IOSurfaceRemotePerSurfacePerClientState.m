@interface IOSurfaceRemotePerSurfacePerClientState
- (BOOL)removeClientReferenceToSurface;
- (IOSurfaceRemotePerSurfaceGlobalState)globalState;
- (IOSurfaceRemotePerSurfacePerClientState)initWithSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6;
- (__IOSurfaceClient)surface;
- (id)mergeExtraData:(id)a3;
- (unsigned)debugRefCount;
- (void)addClientReferenceToSurfaceWithExtraData:(id)a3;
- (void)dealloc;
- (void)setGlobalState:(id)a3;
@end

@implementation IOSurfaceRemotePerSurfacePerClientState

- (IOSurfaceRemotePerSurfacePerClientState)initWithSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)IOSurfaceRemotePerSurfacePerClientState;
  id v9 = a6;
  v10 = [(IOSurfaceRemotePerSurfacePerClientState *)&v13 init];
  v10->_surface = a3;
  v10->_refcount = 1;
  v11 = +[IOSurfaceRemotePerSurfaceGlobalState globalStateForSurface:a3 mappedAddress:a4 mappedSize:a5 extraData:v9];

  [(IOSurfaceRemotePerSurfacePerClientState *)v10 setGlobalState:v11];
  return v10;
}

- (__IOSurfaceClient)surface
{
  return self->_surface;
}

- (unsigned)debugRefCount
{
  return self->_refcount;
}

- (void)addClientReferenceToSurfaceWithExtraData:(id)a3
{
  id v6 = a3;
  ++self->_refcount;
  v4 = [(IOSurfaceRemotePerSurfacePerClientState *)self globalState];
  id v5 = (id)[v4 mergeExtraData:v6];
}

- (BOOL)removeClientReferenceToSurface
{
  unsigned int refcount = self->_refcount;
  if (!refcount)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[IOSurfaceRemotePerSurfacePerClientState removeClientReferenceToSurface]"];
    [v5 handleFailureInFunction:v6 file:@"IOSurfaceRemoteServer.m" lineNumber:279 description:@"BUG: refcount is already zero"];

    unsigned int refcount = self->_refcount;
  }
  self->_unsigned int refcount = refcount - 1;
  IOSurfaceClientRelease(self->_surface);
  return self->_refcount == 0;
}

- (id)mergeExtraData:(id)a3
{
  id v4 = a3;
  id v5 = [(IOSurfaceRemotePerSurfacePerClientState *)self globalState];
  id v6 = [v5 mergeExtraData:v4];

  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  while (self->_refcount)
    [(IOSurfaceRemotePerSurfacePerClientState *)self removeClientReferenceToSurface];
  v3.receiver = self;
  v3.super_class = (Class)IOSurfaceRemotePerSurfacePerClientState;
  [(IOSurfaceRemotePerSurfacePerClientState *)&v3 dealloc];
}

- (IOSurfaceRemotePerSurfaceGlobalState)globalState
{
  return self->_globalState;
}

- (void)setGlobalState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end