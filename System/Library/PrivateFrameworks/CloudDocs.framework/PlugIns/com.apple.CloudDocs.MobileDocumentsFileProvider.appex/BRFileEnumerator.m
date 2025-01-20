@interface BRFileEnumerator
- (BRFileEnumerator)initWithFileObjectID:(id)a3 url:(id)a4 itemIdentifier:(id)a5 recursive:(BOOL)a6;
- (void)watchItemWithUpdateSender:(id)a3 options:(unsigned __int16)a4 errorHandler:(id)a5 gatherReply:(id)a6;
@end

@implementation BRFileEnumerator

- (BRFileEnumerator)initWithFileObjectID:(id)a3 url:(id)a4 itemIdentifier:(id)a5 recursive:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a4;
  if (v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)BRFileEnumerator;
    v12 = [(BRBaseFileEnumerator *)&v18 initWithFileObjectID:a3 itemIdentifier:a5 recursive:v6];
    v13 = v12;
    if (v12) {
      objc_storeStrong((id *)(v12 + 113), a4);
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
      sub_100023BDC((uint64_t)v15, v16);
    }

    v14 = 0;
  }

  return v14;
}

- (void)watchItemWithUpdateSender:(id)a3 options:(unsigned __int16)a4 errorHandler:(id)a5 gatherReply:(id)a6
{
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = [a3 remoteObjectProxyWithErrorHandler:a5];
  [v11 watchItemAtURL:*(void *)(&self->super._completedGather + 1) options:v7 gatherReply:v10];
}

- (void).cxx_destruct
{
}

@end