@interface NSData
- (id)backupKeyDigests;
- (id)bskb;
- (id)hexString;
- (id)peerIDForKeybagDigest:(id)a3;
- (id)peerIDs;
- (id)peersAndBackupKeyDigests;
- (id)recoveryKey;
- (id)sha1Digest;
- (id)sha256Digest;
- (void)enumeratePeersWithBlock:(id)a3;
@end

@implementation NSData

- (id)bskb
{
  v11 = 0;
  v2 = (void *)SOSBackupSliceKeyBagCreateFromData();
  if (!v2)
  {
    v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000489FC(&v11, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  return v2;
}

- (void)enumeratePeersWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(NSData *)self bskb];
  if (v5)
  {
    uint64_t v6 = SOSBSKBGetPeers();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)hexString
{
  size_t v3 = 2 * [(NSData *)self length];
  uint64_t v4 = malloc_type_malloc(v3, 0x3C65101DuLL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000068BC;
  v7[3] = &unk_100071018;
  v7[4] = v4;
  [(NSData *)self enumerateByteRangesUsingBlock:v7];
  id v5 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v4 length:v3 encoding:4 freeWhenDone:1];

  return v5;
}

- (id)sha256Digest
{
  size_t v3 = (unsigned __int8 *)malloc_type_malloc(0x20uLL, 0xA1A76EFCuLL);
  BytePtr = CFDataGetBytePtr((CFDataRef)self);
  CC_SHA256(BytePtr, (CC_LONG)[(NSData *)self length], v3);
  id v5 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v3 length:32 freeWhenDone:1];

  return v5;
}

- (id)sha1Digest
{
  size_t v3 = (unsigned __int8 *)malloc_type_malloc(0x14uLL, 0x40DFE858uLL);
  BytePtr = CFDataGetBytePtr((CFDataRef)self);
  CC_SHA1(BytePtr, (CC_LONG)[(NSData *)self length], v3);
  id v5 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v3 length:20 freeWhenDone:1];

  return v5;
}

- (id)peerIDs
{
  long long v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  long long v14 = sub_100006B70;
  v15 = &unk_100071040;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v16 = v3;
  [(NSData *)self enumeratePeersWithBlock:&v12];
  uint64_t v4 = [(NSData *)self bskb];
  if (v4 && SOSBSKBHasRecoveryKey())
  {
    id v5 = (void *)SOSBSKBCopyRecoveryKey();
    id v6 = objc_alloc((Class)NSString);
    id v7 = [v5 sha1Digest];
    id v8 = [v7 hexString];
    id v9 = [v6 initWithFormat:@"recovery key (%@)", v8, v12, v13, v14, v15];
    [v3 addObject:v9];
  }
  id v10 = v3;

  return v10;
}

- (id)recoveryKey
{
  v2 = [(NSData *)self bskb];
  if (v2 && SOSBSKBHasRecoveryKey()) {
    id v3 = (void *)SOSBSKBCopyRecoveryKey();
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)peersAndBackupKeyDigests
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006D5C;
  v5[3] = &unk_100071040;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = v3;
  [(NSData *)self enumeratePeersWithBlock:v5];

  return v3;
}

- (id)backupKeyDigests
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006E9C;
  v5[3] = &unk_100071040;
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v6 = v3;
  [(NSData *)self enumeratePeersWithBlock:v5];

  return v3;
}

- (id)peerIDForKeybagDigest:(id)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000070AC;
  v20 = sub_1000070BC;
  id v21 = 0;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  long long v12 = sub_1000070C4;
  uint64_t v13 = &unk_100071068;
  id v4 = a3;
  id v14 = v4;
  v15 = &v16;
  [(NSData *)self enumeratePeersWithBlock:&v10];
  id v5 = (void *)v17[5];
  if (!v5)
  {
    id v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(v4, "hexString", v10, v11, v12, v13);
      sub_100048A78(v7, buf, v6);
    }

    id v5 = (void *)v17[5];
  }
  id v8 = v5;

  _Block_object_dispose(&v16, 8);

  return v8;
}

@end