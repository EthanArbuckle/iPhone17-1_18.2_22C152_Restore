@interface ICDFileEnumerator
- (ICDFileEnumerator)initWithFileObjectID:(id)a3 itemIdentifier:(id)a4 recursive:(BOOL)a5 request:(id)a6;
- (void)invalidate;
- (void)invalidateChangeToken;
- (void)watchItemWithUpdateSender:(id)a3 options:(unsigned __int16)a4 errorHandler:(id)a5 gatherReply:(id)a6;
@end

@implementation ICDFileEnumerator

- (ICDFileEnumerator)initWithFileObjectID:(id)a3 itemIdentifier:(id)a4 recursive:(BOOL)a5 request:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICDFileEnumerator;
  v12 = [(BRBaseFileEnumerator *)&v19 initWithFileObjectID:a3 itemIdentifier:v10 recursive:v7];
  v13 = (ICDFileEnumerator *)v12;
  if (v12)
  {
    v12[113] = 0;
    objc_storeStrong((id *)(v12 + 121), a6);
    if (objc_msgSend(v10, "br_isBoostableItemIdentifier"))
    {
      queue = v13->super._queue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10001E86C;
      v16[3] = &unk_1000448D0;
      v17 = v13;
      id v18 = v10;
      dispatch_async(queue, v16);
    }
  }

  return v13;
}

- (void)watchItemWithUpdateSender:(id)a3 options:(unsigned __int16)a4 errorHandler:(id)a5 gatherReply:(id)a6
{
  uint64_t v7 = a4;
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    v12 = [a3 remoteObjectProxyWithErrorHandler:v11];

    [v12 watchItemWithFileObjectID:self->super._fileObjectID options:v7 request:*(void *)(&self->_hasBoostedItemIdentifier + 1) gatherReply:v10];
  }
  else
  {
    v13 = (void (**)(id, void *))((char *)a5 + 16);
    id v14 = a5;
    v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10002C030((uint64_t)v15, v16);
    }

    v17 = +[NSError br_errorWithDomain:BRInternalErrorDomain code:15 description:@"unreachable: Can't watch an item without a sender"];
    (*v13)(v14, v17);
  }
}

- (void)invalidateChangeToken
{
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002C0A8((uint64_t)v3, v4);
  }

  v5 = self;
  objc_sync_enter(v5);
  *(&v5->super._completedGather + 1) = 0;
  v6.receiver = v5;
  v6.super_class = (Class)ICDFileEnumerator;
  [(BRBaseFileEnumerator *)&v6 invalidateChangeToken];
  objc_sync_exit(v5);
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = *((unsigned __int8 *)&v2->super._completedGather + 1);
  *(&v2->super._completedGather + 1) = 0;
  objc_sync_exit(v2);

  if (v3)
  {
    queue = v2->super._queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001ED90;
    block[3] = &unk_1000446B0;
    block[4] = v2;
    dispatch_async(queue, block);
  }
  v5.receiver = v2;
  v5.super_class = (Class)ICDFileEnumerator;
  [(BRBaseFileEnumerator *)&v5 invalidate];
}

- (void).cxx_destruct
{
}

@end