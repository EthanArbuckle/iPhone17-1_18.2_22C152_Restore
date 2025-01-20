@interface _MessageAddressScannerQueue
- (BOOL)_flush;
- (BOOL)addHash:(int64_t)a3;
- (BOOL)handleHashes:(id)a3;
- (BOOL)isEmpty;
- (CRRecentContactsLibrary)recentsLibrary;
- (_MessageAddressScannerQueue)init;
- (void)removeAllObjects;
- (void)setRecentsLibrary:(id)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation _MessageAddressScannerQueue

- (_MessageAddressScannerQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)_MessageAddressScannerQueue;
  v2 = [(_MessageAddressScannerQueue *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(_MessageAddressScannerQueue *)v2 setMaximumSize:100];
    [(_MessageAddressScannerQueue *)v3 setMaximumLatency:2.0];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobilemail.MessageAddressScannerPendingRemovalsQueue", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)setTargetQueue:(id)a3
{
}

- (BOOL)isEmpty
{
  return [(EFMutableInt64Set *)self->_hashes count] == 0;
}

- (BOOL)addHash:(int64_t)a3
{
  hashes = self->_hashes;
  if (!hashes)
  {
    v6 = (EFMutableInt64Set *)objc_alloc_init((Class)EFMutableInt64Set);
    v7 = self->_hashes;
    self->_hashes = v6;

    hashes = self->_hashes;
  }
  if ([(EFMutableInt64Set *)hashes containsIndex:a3]) {
    return 0;
  }
  ++*(_DWORD *)&self->MFBufferedQueue_opaque[OBJC_IVAR___MFBufferedQueue__currentSize];
  [(EFMutableInt64Set *)self->_hashes addIndex:a3];

  return [(_MessageAddressScannerQueue *)self flushIfNecessary];
}

- (void)removeAllObjects
{
  hashes = self->_hashes;
  self->_hashes = 0;

  v4.receiver = self;
  v4.super_class = (Class)_MessageAddressScannerQueue;
  [(_MessageAddressScannerQueue *)&v4 removeAllObjects];
}

- (BOOL)_flush
{
  if ([(EFMutableInt64Set *)self->_hashes count]) {
    id v3 = [(EFMutableInt64Set *)self->_hashes copy];
  }
  else {
    id v3 = 0;
  }
  [(_MessageAddressScannerQueue *)self removeAllObjects];
  if (v3) {
    BOOL v4 = [(_MessageAddressScannerQueue *)self handleHashes:v3];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)handleHashes:(id)a3
{
  id v4 = a3;
  v5 = [(_MessageAddressScannerQueue *)self recentsLibrary];
  id v6 = objc_alloc_init((Class)off_100169CA8[0]());
  v7 = off_100169CB0[0]();
  v16 = v7;
  objc_super v8 = +[NSArray arrayWithObjects:&v16 count:1];
  [v6 setDomains:v8];

  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003FF20;
  v13[3] = &unk_10013B028;
  id v10 = v4;
  id v14 = v10;
  id v11 = v5;
  id v15 = v11;
  [v11 performRecentsSearch:v6 queue:dispatchQueue completion:v13];

  return 1;
}

- (CRRecentContactsLibrary)recentsLibrary
{
  return self->_recentsLibrary;
}

- (void)setRecentsLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsLibrary, 0);
  objc_storeStrong((id *)&self->_hashes, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end