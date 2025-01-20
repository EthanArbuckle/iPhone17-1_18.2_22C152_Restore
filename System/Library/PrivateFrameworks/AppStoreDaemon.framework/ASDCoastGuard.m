@interface ASDCoastGuard
- (BOOL)isUnrepairableAppWithItemID:(unint64_t)a3 externalVersionID:(unint64_t)a4;
@end

@implementation ASDCoastGuard

- (BOOL)isUnrepairableAppWithItemID:(unint64_t)a3 externalVersionID:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 > 0x52E12BCD || a4 > 0x31E2A03E) {
    return 0;
  }
  int v6 = a3;
  deadlistItemIDs = self->_deadlistItemIDs;
  if (!deadlistItemIDs)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithPath:", @"/System/Library/PrivateFrameworks/AppStoreDaemon.framework", a4);
    v10 = [v9 resourceURL];
    v11 = [v10 URLByAppendingPathComponent:@"DeadlistItemIDs.bin" isDirectory:0];

    uint64_t v15 = 0;
    v12 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v11 options:10 error:&v15];
    v13 = self->_deadlistItemIDs;
    self->_deadlistItemIDs = v12;

    if (self->_deadlistItemIDs)
    {

      deadlistItemIDs = self->_deadlistItemIDs;
      goto LABEL_10;
    }
    v14 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int __key = 138543362;
      uint64_t v17 = v15;
      _os_log_fault_impl(&dword_19BF6A000, v14, OS_LOG_TYPE_FAULT, "Unable to load deadlist: %{public}@", (uint8_t *)&__key, 0xCu);
    }

    return 0;
  }
LABEL_10:
  int __key = v6;
  return bsearch_b(&__key, [(NSData *)deadlistItemIDs bytes], [(NSData *)self->_deadlistItemIDs length] >> 2, 4uLL, &__block_literal_global_27) != 0;
}

uint64_t __63__ASDCoastGuard_isUnrepairableAppWithItemID_externalVersionID___block_invoke(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  return (*a2 - *a3);
}

- (void).cxx_destruct
{
}

@end