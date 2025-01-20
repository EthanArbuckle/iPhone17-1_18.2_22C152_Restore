@interface NSData(ISMutableStoreIndex_BlobTable)
+ (id)_ISMutableStoreIndex_mappedDataWithSize:()ISMutableStoreIndex_BlobTable;
- (uint64_t)_ISMutableStoreIndex_addBlobBuffer:()ISMutableStoreIndex_BlobTable size:;
- (uint64_t)_ISMutableStoreIndex_addBlobData:()ISMutableStoreIndex_BlobTable;
- (uint64_t)_ISMutableStoreIndex_availableSpace;
- (uint64_t)_ISMutableStoreIndex_removeBlobForID:()ISMutableStoreIndex_BlobTable;
@end

@implementation NSData(ISMutableStoreIndex_BlobTable)

+ (id)_ISMutableStoreIndex_mappedDataWithSize:()ISMutableStoreIndex_BlobTable
{
  v4 = mmap(0, a3, 3, 4097, 0, 0);
  v5 = 0;
  if (v4 == (unsigned char *)-1) {
    v6 = 0;
  }
  else {
    v6 = v4;
  }
  if (a3 && v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v5 = (void *)[v7 initWithBytesNoCopy:v6 length:a3 deallocator:*MEMORY[0x1E4F28210]];
  }
  uint64_t v8 = objc_msgSend(v5, "_ISStoreIndex_blobTableHeader");
  if (v8)
  {
    *(_DWORD *)uint64_t v8 = 11;
    *(_DWORD *)(v8 + 8) = 0;
    v6[20] = 0;
    *(unsigned char *)(v8 + 4) = 1;
  }
  return v5;
}

- (uint64_t)_ISMutableStoreIndex_availableSpace
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = objc_msgSend(a1, "_ISStoreIndex_blobTableHeader");
  if (v3) {
    uint64_t v4 = v2 - *(unsigned int *)(v3 + 8) - 24;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 & ~(v4 >> 63);
}

- (uint64_t)_ISMutableStoreIndex_addBlobBuffer:()ISMutableStoreIndex_BlobTable size:
{
  uint64_t result = 0;
  if (a3)
  {
    if (a4)
    {
      unint64_t v8 = [a1 length];
      id v9 = a1;
      uint64_t v10 = [v9 bytes];
      uint64_t result = objc_msgSend(v9, "_ISStoreIndex_blobTableHeader");
      if (result)
      {
        uint64_t v11 = *(unsigned int *)(result + 8);
        uint64_t v12 = (a4 + v11 + 12);
        if (v12 + 12 >= v8)
        {
          return 0;
        }
        else
        {
          uint64_t v13 = v10 + v11 + 12;
          if (v12 + 24 < v8) {
            *(unsigned char *)(v13 + 8) = 0;
          }
          *(_DWORD *)(result + 8) = a4 + v11 + 12;
          *(_DWORD *)uint64_t v13 = v11;
          *(_DWORD *)(v13 + 4) = a4;
          memcpy((void *)(v13 + 12), a3, a4);
          *(unsigned char *)(v13 + 8) = 1;
          return *(void *)v13;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_ISMutableStoreIndex_addBlobData:()ISMutableStoreIndex_BlobTable
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return objc_msgSend(a1, "_ISMutableStoreIndex_addBlobBuffer:size:", v5, v6);
}

- (uint64_t)_ISMutableStoreIndex_removeBlobForID:()ISMutableStoreIndex_BlobTable
{
  uint64_t result = objc_msgSend(a1, "_ISStoreIndex_blobForID:");
  *(unsigned char *)(result + 8) = 0;
  return result;
}

@end