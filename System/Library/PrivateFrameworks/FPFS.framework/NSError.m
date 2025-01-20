@interface NSError
@end

@implementation NSError

uint64_t __78__NSError_FPFSAdditions__fp_nonEvictableChildrenErrorWithFD_trashIno_busyIno___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 == *(void *)(a1 + 48)) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  uint64_t v4 = a2 + 21;
  if (fstatat(*(_DWORD *)(a1 + 72), (const char *)(a2 + 21), &v12, 32) < 0) {
    goto LABEL_12;
  }
  if ((v12.st_flags & 0x40000000) != 0)
  {
    if (*(void *)a2 != *(void *)(a1 + 56)) {
      return 0;
    }
    uint64_t v6 = 3;
    goto LABEL_13;
  }
  int v5 = v12.st_mode & 0xF000;
  if (v5 == 40960) {
    return 0;
  }
  if (v5 != 0x8000) {
    goto LABEL_11;
  }
  if (v12.st_nlink > 1u)
  {
    uint64_t v6 = 4;
    goto LABEL_13;
  }
  if ((fpfs_is_finder_alias_at() & 0x80000000) != 0) {
LABEL_12:
  }
    uint64_t v6 = 1;
  else {
LABEL_11:
  }
    uint64_t v6 = 5;
LABEL_13:
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(NSString, "fp_pathWithFileSystemRepresentation:", v4);
  v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:*(unsigned __int8 *)(a2 + 20) == 4];

  v10 = [*(id *)(a1 + 64) purgeabilityErrorForReason:v6 atURL:v9];
  if (v10)
  {
    [*(id *)(a1 + 40) addObject:v10];
    if ((unint64_t)[*(id *)(a1 + 40) count] > 0x63)
    {

      return 0xFFFFFFFFLL;
    }
  }

  return 0;
}

@end