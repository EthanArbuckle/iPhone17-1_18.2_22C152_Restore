@interface _SWBaseCollaborationSource
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSFileProviderDomain)domain;
- (NSString)itemIdentifier;
- (NSString)serviceName;
- (_SWBaseCollaborationSource)initWithItemIdentifier:(id)a3 domain:(id)a4 extension:(id)a5;
- (_SWFileProviderCollaborationProviding)extension;
- (id)interface;
- (id)makeListenerEndpointAndReturnError:(id *)a3;
@end

@implementation _SWBaseCollaborationSource

- (NSString)serviceName
{
  v2 = (_SWBaseCollaborationSource *)NSUnimplemented_();
  return (NSString *)[(_SWBaseCollaborationSource *)v2 interface];
}

- (id)interface
{
  v2 = (_SWBaseCollaborationSource *)NSUnimplemented_();
  return [(_SWBaseCollaborationSource *)v2 initWithItemIdentifier:v4 domain:v5 extension:v6];
}

- (_SWBaseCollaborationSource)initWithItemIdentifier:(id)a3 domain:(id)a4 extension:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v11 conformsToProtocol:&unk_1ED9A5528])
  {
    v18.receiver = self;
    v18.super_class = (Class)_SWBaseCollaborationSource;
    v12 = [(_SWBaseCollaborationSource *)&v18 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_itemIdentifier, a3);
      objc_storeStrong((id *)&v13->_domain, a4);
      objc_storeStrong((id *)&v13->_extension, a5);
      uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
      listeners = v13->_listeners;
      v13->_listeners = (NSHashTable *)v14;
    }
    self = v13;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F29290], "anonymousListener", a3);
  [v4 setDelegate:self];
  id v5 = [v4 endpoint];
  [v4 resume];
  id v6 = self;
  objc_sync_enter(v6);
  [(NSHashTable *)v6->_listeners addObject:v4];
  objc_sync_exit(v6);

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_SWBaseCollaborationSource *)self interface];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  id v9 = self;
  objc_sync_enter(v9);
  [(NSHashTable *)v9->_listeners removeObject:v6];
  objc_sync_exit(v9);

  objc_initWeak(&location, v7);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65___SWBaseCollaborationSource_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_1E54D83B0;
  id v10 = v6;
  id v15 = v10;
  [v7 setInvalidationHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65___SWBaseCollaborationSource_listener_shouldAcceptNewConnection___block_invoke_2;
  v12[3] = &unk_1E54D83D8;
  objc_copyWeak(&v13, &location);
  [v7 setInterruptionHandler:v12];
  [v7 resume];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return 1;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (_SWFileProviderCollaborationProviding)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end