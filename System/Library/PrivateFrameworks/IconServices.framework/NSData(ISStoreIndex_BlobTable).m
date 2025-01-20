@interface NSData(ISStoreIndex_BlobTable)
- (uint64_t)_ISStoreIndex_blobForID:()ISStoreIndex_BlobTable;
- (uint64_t)_ISStoreIndex_blobTableHeader;
- (uint64_t)_ISStoreIndex_isValid;
- (unsigned)_ISStoreIndex_blobDataForID:()ISStoreIndex_BlobTable;
- (void)_ISStoreIndex_enumerateBlobsWithBock:()ISStoreIndex_BlobTable;
@end

@implementation NSData(ISStoreIndex_BlobTable)

- (uint64_t)_ISStoreIndex_isValid
{
  uint64_t result = objc_msgSend(a1, "_ISStoreIndex_blobTableHeader");
  if (result) {
    return *(unsigned char *)(result + 4) && *(_DWORD *)result == 11;
  }
  return result;
}

- (uint64_t)_ISStoreIndex_blobTableHeader
{
  if ((unint64_t)[a1 length] < 0xD) {
    return 0;
  }
  id v2 = a1;
  return [v2 bytes];
}

- (uint64_t)_ISStoreIndex_blobForID:()ISStoreIndex_BlobTable
{
  unint64_t v5 = [a1 length];
  id v6 = a1;
  uint64_t v7 = [v6 bytes];
  uint64_t result = objc_msgSend(v6, "_ISStoreIndex_blobTableHeader");
  if (result)
  {
    if (a3 < v5
      && (v9 = (void *)(a3 + v7 + 12), a3 + v7 != -12)
      && *(unsigned char *)(a3 + v7 + 20)
      && *v9 == a3)
    {
      if ((unint64_t)v9 + HIDWORD(*v9) + 12 >= v5 + v7) {
        return 0;
      }
      else {
        return a3 + v7 + 12;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unsigned)_ISStoreIndex_blobDataForID:()ISStoreIndex_BlobTable
{
  id v2 = (unsigned int *)objc_msgSend(a1, "_ISStoreIndex_blobForID:");
  if (v2)
  {
    v3 = v2;
    id v4 = a1;
    id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v6 = v3[1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__NSData_ISStoreIndex_BlobTable___ISStoreIndex_blobDataForID___block_invoke;
    v8[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v8[4] = v4;
    id v2 = (unsigned int *)[v5 initWithBytesNoCopy:v3 + 3 length:v6 deallocator:v8];
  }
  return v2;
}

- (void)_ISStoreIndex_enumerateBlobsWithBock:()ISStoreIndex_BlobTable
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  id v6 = a1;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = objc_msgSend(v6, "_ISStoreIndex_blobTableHeader");
  if (v8)
  {
    unint64_t v9 = v7 + 12;
    if (v7 != -12)
    {
      uint64_t v10 = v8;
      unint64_t v11 = v5 + v7;
      while (1)
      {
        unint64_t v12 = *(void *)v9;
        if (!*(void *)v9) {
          break;
        }
        BOOL v13 = *(_DWORD *)(v10 + 8) > v12;
        unint64_t v14 = HIDWORD(v12) + v9 + 12;
        if (!v13 || v14 >= v11) {
          break;
        }
        if (*(unsigned char *)(v9 + 8))
        {
          char v16 = 0;
          v4[2](v4, v9, &v16);
          if (v16) {
            break;
          }
          v9 += *(unsigned int *)(v9 + 4) + 12;
          if (!v9) {
            break;
          }
        }
        else
        {
          unint64_t v9 = v14;
          if (!v14) {
            break;
          }
        }
      }
    }
  }
}

@end