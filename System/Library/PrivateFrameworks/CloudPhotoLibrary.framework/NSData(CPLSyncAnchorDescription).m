@interface NSData(CPLSyncAnchorDescription)
- (id)cplQueryCursorDescription;
- (id)cplQueryCursorSimpleDescription;
- (id)cplSyncAnchorDescription;
- (id)cplSyncAnchorSimpleDescription;
@end

@implementation NSData(CPLSyncAnchorDescription)

- (id)cplQueryCursorDescription
{
  v2 = NSString;
  v3 = [a1 cplQueryCursorSimpleDescription];
  v4 = [a1 base64EncodedStringWithOptions:0];
  v5 = [v2 stringWithFormat:@"<%@ [%@]>", v3, v4];

  return v5;
}

- (id)cplQueryCursorSimpleDescription
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__17026;
  v13 = __Block_byref_object_dispose__17027;
  id v14 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v5 = __67__NSData_CPLSyncAnchorDescription__cplQueryCursorSimpleDescription__block_invoke;
  v6 = &unk_1E60A5CE8;
  uint64_t v7 = a1;
  v8 = &v9;
  v1 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&anchorLock);
  v5((uint64_t)v1);
  os_unfair_lock_unlock((os_unfair_lock_t)&anchorLock);

  id v2 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v2;
}

- (id)cplSyncAnchorDescription
{
  id v2 = NSString;
  v3 = [a1 cplSyncAnchorSimpleDescription];
  v4 = [a1 base64EncodedStringWithOptions:0];
  v5 = [v2 stringWithFormat:@"<%@ [%@]>", v3, v4];

  return v5;
}

- (id)cplSyncAnchorSimpleDescription
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__17026;
  v13 = __Block_byref_object_dispose__17027;
  id v14 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v5 = __66__NSData_CPLSyncAnchorDescription__cplSyncAnchorSimpleDescription__block_invoke;
  v6 = &unk_1E60A5CE8;
  uint64_t v7 = a1;
  v8 = &v9;
  v1 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&anchorLock);
  v5((uint64_t)v1);
  os_unfair_lock_unlock((os_unfair_lock_t)&anchorLock);

  id v2 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v2;
}

@end