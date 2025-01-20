@interface _PFZipFileArchive
- (_PFZipFileArchive)init;
- (uint64_t)contentsForEntryName:(uint64_t)a1;
- (uint64_t)initWithData:(void *)a1 options:(void *)a2 error:(char)a3;
- (uint64_t)initWithEntryNames:(uint64_t)a1 contents:(void *)a2 properties:(void *)a3 options:(void *)a4;
- (uint64_t)initWithPath:(char)a3 options:(uint64_t)a4 error:;
- (uint64_t)writeToFile:(uint64_t)a3 options:(uint64_t)a4 error:;
- (void)dealloc;
@end

@implementation _PFZipFileArchive

- (_PFZipFileArchive)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PFZipFileArchive;
  result = [(_PFZipFileArchive *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_entryNameToCentralDirectoryFileHeader = 0u;
    *(_OWORD *)&result->_centralDirectoryEntries = 0u;
    *(_OWORD *)&result->_entryNameToData = 0u;
  }
  return result;
}

- (uint64_t)initWithPath:(char)a3 options:(uint64_t)a4 error:
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = [a1 init];
  uint64_t v8 = v7;
  if (!a2 || !v7)
  {
    if (!v7) {
      return v8;
    }
    goto LABEL_11;
  }
  if (![a2 length])
  {
LABEL_11:

    return 0;
  }
  uint64_t v9 = a3 & 3;
  *(void *)(v8 + 40) = a2;
  if (v9 != 1)
  {
    if (v9 == 2)
    {
      v13 = (void *)MEMORY[0x1E4F1C9B8];
      v14 = a2;
      uint64_t v15 = 1;
    }
    else
    {
      if (v9 == 3)
      {
        uint64_t v10 = _openFile(a2);
        if ((v10 & 0x8000000000000000) == 0)
        {
          close(v10);
          goto LABEL_20;
        }
        goto LABEL_11;
      }
      v13 = (void *)MEMORY[0x1E4F1C9B8];
      v14 = a2;
      uint64_t v15 = 0;
    }
    v16 = (void *)[v13 dataWithContentsOfFile:v14 options:v15 error:a4];
    if (v16)
    {
      uint64_t v8 = -[_PFZipFileArchive initWithData:options:error:]((void *)v8, v16, a3);
      if (!v8) {
        return v8;
      }
      goto LABEL_20;
    }
    goto LABEL_11;
  }
  uint64_t v12 = _openFile(a2);
  *(void *)(v8 + 32) = v12;
  if (v12 < 0) {
    goto LABEL_11;
  }
  *(_DWORD *)(v8 + 72) |= 0x10u;
LABEL_20:
  if ((a3 & 4) != 0) {
    *(_DWORD *)(v8 + 72) |= 8u;
  }
  return v8;
}

- (uint64_t)initWithData:(void *)a1 options:(void *)a2 error:(char)a3
{
  uint64_t v5 = [a1 init];
  if (!v5) {
    return 0;
  }
  char v59 = a3;
  uint64_t v60 = v5;
  v64 = (void *)[MEMORY[0x1E4F1CA48] array];
  v63 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [a2 bytes];
  v58 = a2;
  unint64_t v7 = [a2 length];
  if (v7 < 0x15) {
    goto LABEL_79;
  }
  unint64_t v8 = v7;
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  uint64_t v11 = -20;
  unint64_t v12 = 20;
  uint64_t v13 = v6;
  do
  {
    int v14 = *(_DWORD *)(v13 + v7 - 20);
    if (v14 == 117853008)
    {
      unint64_t v15 = 0;
      if (v7 >= 0x39)
      {
        unint64_t v16 = *(void *)(v13 + v7 - 12);
        if (v16 <= v7 - 56)
        {
          unint64_t v17 = v6 + v16;
          if (*(_DWORD *)(v6 + v16) == 101075792)
          {
            uint64_t v9 = *(void *)(v17 + 24);
            unint64_t v10 = *(void *)(v17 + 48);
            unint64_t v15 = *(void *)(v13 + v7 - 12);
          }
          else
          {
            unint64_t v15 = 0;
          }
        }
      }
    }
    else if (v14 == 101010256)
    {
      unint64_t v15 = v7 - v12;
      uint64_t v9 = *(unsigned __int16 *)(v13 + v7 - 12);
      unint64_t v10 = *(unsigned int *)(v13 + v7 - 4);
    }
    else
    {
      unint64_t v15 = 0;
      if (v12 >= 0x38 && v14 == 101075792)
      {
        unint64_t v15 = v7 + v11;
        uint64_t v9 = *(void *)(v13 + v7 + 4);
        unint64_t v10 = *(void *)(v13 + v7 + 28);
      }
    }
    if (v12 > 0x101CE) {
      break;
    }
    if (v15) {
      break;
    }
    ++v12;
    --v11;
    --v13;
  }
  while (v12 < v7);
  if (!v9) {
    goto LABEL_79;
  }
  char v65 = 0;
  uint64_t v18 = 0;
  uint64_t v61 = v6 + 16;
  uint64_t v62 = v6 + 8;
  unint64_t v19 = v10;
  uint64_t v72 = v6;
  do
  {
    if (v19 < v10) {
      break;
    }
    if (v19 >= v8) {
      break;
    }
    unint64_t v20 = v19 + 46;
    if (v19 + 46 <= v10) {
      break;
    }
    if (v20 > v8) {
      break;
    }
    unint64_t v21 = v6 + v19;
    if (*(_DWORD *)v21 != 33639248) {
      break;
    }
    uint64_t v23 = *(unsigned int *)(v21 + 20);
    uint64_t v22 = *(unsigned int *)(v21 + 24);
    uint64_t v24 = *(unsigned __int16 *)(v21 + 28);
    unint64_t v25 = *(unsigned int *)(v21 + 42);
    BOOL v26 = v23 == 0xFFFFFFFFLL || v22 == 0xFFFFFFFFLL;
    BOOL v27 = v26 || v25 == 0xFFFFFFFF;
    BOOL v28 = v27;
    unint64_t v29 = v20 + v24;
    if (v20 + v24 <= v10 || v29 > v8) {
      break;
    }
    uint64_t v70 = v18;
    uint64_t v71 = v9;
    id v30 = 0;
    uint64_t v31 = *(unsigned __int16 *)(v21 + 10);
    uint64_t v32 = *(unsigned __int16 *)(v21 + 30);
    uint64_t v68 = *(unsigned int *)(v21 + 16);
    uint64_t v69 = *(unsigned __int16 *)(v21 + 32);
    uint64_t v73 = v32;
    if (*(_WORD *)(v21 + 28))
    {
      if (v10 > v25)
      {
        uint64_t v33 = *(unsigned __int16 *)(v21 + 10);
        unint64_t v34 = v72 + v20;
        id v30 = (id)[[NSString alloc] initWithBytes:v34 length:v24 encoding:4];
        uint64_t v31 = v33;
        uint64_t v32 = v73;
        if (!v30)
        {
          id v30 = (id)[[NSString alloc] initWithBytes:v34 length:v24 encoding:12];
          uint64_t v31 = v33;
          uint64_t v32 = v73;
        }
      }
    }
    BOOL v35 = v32 > 4 && v28;
    BOOL v26 = v35;
    unint64_t v36 = v29 + v32;
    BOOL v37 = !v26 || v29 >= v36;
    BOOL v38 = !v37 && v36 > v10;
    if (!v38 || v36 > v8)
    {
      uint64_t v6 = v72;
    }
    else
    {
      unint64_t v49 = v29;
      uint64_t v6 = v72;
      do
      {
        v50 = (unsigned __int16 *)(v72 + v49);
        uint64_t v51 = *(unsigned __int16 *)(v72 + v49 + 2);
        unint64_t v52 = v49 + 4;
        v49 += 4 + v51;
        if (v49 <= v52 || v49 > v36) {
          break;
        }
        int v54 = *v50;
        if (v51 >= 0x18 && v54 == 1)
        {
          if (v22 == 0xFFFFFFFFLL) {
            uint64_t v22 = *(void *)(v72 + v52);
          }
          if (v23 == 0xFFFFFFFFLL) {
            uint64_t v23 = *(void *)(v62 + v52);
          }
          if (v25 == 0xFFFFFFFF) {
            unint64_t v25 = *(void *)(v61 + v52);
          }
        }
      }
      while (v49 < v36);
    }
    if (v30)
    {
      v66 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v67 = v10;
      id v40 = v30;
      uint64_t v41 = [NSNumber numberWithUnsignedInteger:v31];
      uint64_t v42 = [NSNumber numberWithUnsignedInteger:v25];
      uint64_t v43 = [NSNumber numberWithUnsignedInteger:v68];
      uint64_t v44 = [NSNumber numberWithUnsignedInteger:v23];
      uint64_t v45 = [NSNumber numberWithUnsignedInteger:v22];
      uint64_t v46 = v41;
      uint64_t v6 = v72;
      uint64_t v47 = objc_msgSend(v66, "dictionaryWithObjectsAndKeys:", v46, @"NSZipFileArchiveCompressionType", v42, @"NSZipFileArchiveHeaderOffset", v43, @"NSZipFileArchiveCRC", v44, @"NSZipFileArchiveCompressedLength", v45, @"NSZipFileArchiveUncompressedLength", 0);
      [v64 addObject:v40];
      id v48 = v40;
      unint64_t v10 = v67;
      [v63 setObject:v47 forKey:v48];
      uint64_t v32 = v73;
      char v65 = 1;
    }
    unint64_t v19 = v29 + v32 + v69;
    uint64_t v18 = v70 + 1;
    uint64_t v9 = v71;
  }
  while (v70 + 1 != v71);
  if ((v65 & 1) == 0)
  {
LABEL_79:

    return 0;
  }
  uint64_t v56 = v60;
  *(void *)(v60 + 16) = v58;
  *(void *)(v60 + 48) = v64;
  *(void *)(v60 + 56) = v63;
  if ((v59 & 4) != 0) {
    *(_DWORD *)(v60 + 72) |= 8u;
  }
  return v56;
}

- (uint64_t)initWithEntryNames:(uint64_t)a1 contents:(void *)a2 properties:(void *)a3 options:(void *)a4
{
  uint64_t v4 = a1;
  if (!a1) {
    return v4;
  }
  unint64_t v8 = [a2 count];
  uint64_t v9 = [(id)v4 init];
  uint64_t v4 = v9;
  if (v8)
  {
    unint64_t v10 = 1;
    do
    {
      uint64_t v11 = objc_msgSend(a3, "objectForKey:", objc_msgSend(a2, "objectAtIndex:", v10 - 1));
      BOOL v12 = v11 != 0;
      if (v11) {
        BOOL v13 = v10 >= v8;
      }
      else {
        BOOL v13 = 1;
      }
      ++v10;
    }
    while (!v13);
    if (!v4) {
      goto LABEL_17;
    }
LABEL_12:
    if (a2 && a3 && v12 && v8)
    {
      *(void *)(v4 + 8) = [a3 copy];
      *(void *)(v4 + 48) = [a2 copy];
      *(void *)(v4 + 56) = [a4 copy];
      *(_DWORD *)(v4 + 72) |= 8u;
      return v4;
    }
    goto LABEL_17;
  }
  BOOL v12 = 1;
  if (v9) {
    goto LABEL_12;
  }
LABEL_17:
  if (v4)
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  if (self)
  {
    contents = self->_contents;
    if (contents)
    {

      self->_contents = 0;
    }
    data = self->_data;
    if (data)
    {

      self->_data = 0;
    }
    self->_provider = 0;
    __zFlags zFlags = self->_zFlags;
    self->___zFlags zFlags = (__zFlags)(*(_DWORD *)&zFlags & 0xFFFFFFF8);
    if ((*(unsigned char *)&zFlags & 0x10) != 0)
    {
      close(self->_desc);
      *(_DWORD *)&self->_zFlags &= ~0x10u;
    }
    path = self->_path;
    if (path)
    {

      self->_path = 0;
    }
    names = self->_names;
    if (names)
    {

      self->_names = 0;
    }
    properties = self->_properties;
    if (properties)
    {

      self->_properties = 0;
    }
    cachedContents = self->_cachedContents;
    if (cachedContents)
    {

      self->_cachedContents = 0;
    }

    self->_entryNameToData = 0;
    self->_entryNameToLocalFileHeader = 0;

    self->_entryNameToCentralDirectoryFileHeader = 0;
    self->_localFileHeaders = 0;

    self->_centralDirectoryEntries = 0;
    self->_endRecord = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)_PFZipFileArchive;
  [(_PFZipFileArchive *)&v10 dealloc];
}

- (uint64_t)contentsForEntryName:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    uint64_t v5 = [v4 objectForKey:a2];
LABEL_4:
    uint64_t v6 = v5;
    goto LABEL_5;
  }
  if (*(void *)(a1 + 16))
  {
    unint64_t v8 = (void *)[*(id *)(a1 + 56) objectForKey:a2];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"NSZipFileArchiveHeaderOffset"), "unsignedIntegerValue");
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"NSZipFileArchiveCompressionType"), "unsignedIntegerValue");
      uint64_t v12 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"NSZipFileArchiveCRC"), "unsignedIntegerValue");
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"NSZipFileArchiveCompressedLength"), "unsignedIntegerValue");
      uint64_t v14 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"NSZipFileArchiveUncompressedLength"), "unsignedIntegerValue");
      unint64_t v15 = *(void **)(a1 + 16);
      uint64_t v16 = [v15 bytes];
      unint64_t v17 = [v15 length];
      if (v17 > v10 && v10 <= 0xFFFFFFFFFFFFFFE1)
      {
        uint64_t v6 = 0;
        if (!v14 || !v13 || v10 + 30 >= v17) {
          return v6;
        }
        uint64_t v18 = (unsigned __int16 *)(v16 + v10);
        if (*(_DWORD *)(v16 + v10) == 67324752 && v11 == v18[4])
        {
          unint64_t v19 = v10 + 30 + v18[13] + v18[14];
          if (v19 < v17)
          {
            uint64_t v6 = 0;
            unint64_t v20 = v19 + v13;
            if (v19 + v13 >= v17 || v20 <= v19 || v20 <= v10) {
              return v6;
            }
            if (v11 == 8)
            {
              unint64_t v25 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v14];
              BOOL v26 = (Bytef *)[v25 mutableBytes];
              *(_OWORD *)&v30.avail_in = 0u;
              memset(&v30.total_out, 0, 72);
              v30.next_in = (Bytef *)(v16 + v19);
              v30.avail_in = v13;
              v30.next_out = v26;
              *(void *)&v30.avail_out = v14;
              if (v25
                && (BOOL v27 = v26, !inflateInit2_(&v30, -15, "1.2.12", 112))
                && (int v28 = inflate(&v30, 4), v29 = inflateEnd(&v30), v28 == 1))
              {
                uint64_t v6 = 0;
                if (!v29 && v30.total_out == v14)
                {
                  if (v12 == _crcFromBytes(v27, v14)) {
                    uint64_t v6 = (uint64_t)v25;
                  }
                  else {
                    uint64_t v6 = 0;
                  }
                }
              }
              else
              {
                uint64_t v6 = 0;
              }
LABEL_5:
              if (!v6) {
                return v6;
              }
              goto LABEL_6;
            }
            if (!v11 && v12 == _crcFromBytes((const Bytef *)(v16 + v19), v13))
            {
              uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 + v19 length:v13];
              goto LABEL_4;
            }
          }
        }
      }
    }
    return 0;
  }
  if (![*(id *)(a1 + 48) containsObject:a2]) {
    return 0;
  }
  int v21 = *(_DWORD *)(a1 + 72);
  if ((v21 & 1) == 0)
  {
    if ((v21 & 2) != 0)
    {
      [*(id *)(a1 + 24) archive:a1 streamForEntryName:a2];
    }
    else if ((v21 & 0x10) == 0)
    {
      uint64_t v22 = *(void **)(a1 + 40);
      if (v22)
      {
        uint64_t v23 = _openFile(v22);
        if ((v23 & 0x8000000000000000) == 0) {
          close(v23);
        }
      }
    }
    return 0;
  }
  uint64_t v6 = [*(id *)(a1 + 64) objectForKey:a2];
  if (!v6)
  {
    uint64_t v5 = [*(id *)(a1 + 24) archive:a1 contentsForEntryName:a2];
    goto LABEL_4;
  }
LABEL_6:
  if ((*(unsigned char *)(a1 + 72) & 8) == 0)
  {
    id v7 = *(id *)(a1 + 64);
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *(void *)(a1 + 64) = v7;
    }
    objc_msgSend(v7, "setObject:forKey:", v6, a2, v30.next_in, *(_OWORD *)&v30.avail_in, *(_OWORD *)&v30.next_out);
  }
  return v6;
}

- (uint64_t)writeToFile:(uint64_t)a3 options:(uint64_t)a4 error:
{
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  v66 = (void *)[MEMORY[0x1E4F1CA58] data];
  unint64_t v67 = (void *)[MEMORY[0x1E4F1CA58] data];
  uint64_t v5 = [*(id *)(v4 + 48) count];
  id v6 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v7 = (id)[v6 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  unint64_t v8 = objc_msgSend(v7, "components:fromDate:", 252, objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
  unint64_t v9 = [v8 year];
  __int16 v10 = [v8 month];
  __int16 v11 = [v8 day];
  __int16 v12 = [v8 hour];
  __int16 v13 = [v8 minute];
  unint64_t v14 = [v8 second];
  __int16 v15 = ((_WORD)v9 << 9) - 30720;
  if (v9 < 0x7BC) {
    __int16 v15 = 0;
  }
  if (v5)
  {
    uint64_t v16 = 0;
    __int16 v62 = v11 | (32 * v10) | v15;
    __int16 v63 = (32 * v13) | (v12 << 11) | (v14 >> 1);
    uint64_t v64 = v4;
    uint64_t v65 = v5;
    do
    {
      unint64_t v17 = (void *)[*(id *)(v4 + 48) objectAtIndex:v16];
      uint64_t v18 = (const char *)[v17 UTF8String];
      size_t v19 = strlen(v18);
      unint64_t v20 = (void *)-[_PFZipFileArchive contentsForEntryName:](v4, (uint64_t)v17);
      int v21 = [v20 length];
      if (v19) {
        BOOL v22 = v20 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (!v22)
      {
        int v23 = v21;
        uint64_t v24 = (const Bytef *)[v20 bytes];
        uInt v25 = [v20 length];
        unsigned int v26 = crc32(0, 0, 0);
        LODWORD(v24) = crc32(v26, v24, v25);
        BOOL v27 = (unsigned __int8 *)[v20 bytes];
        uint64_t v28 = [v20 length];
        int v70 = (int)v24;
        if (v28)
        {
          while (1)
          {
            unsigned int v30 = *v27++;
            unsigned int v29 = v30;
            if (v30 <= 0x1F && v29 - 7 >= 7 && v29 - 26 > 1) {
              break;
            }
            if (!--v28) {
              goto LABEL_15;
            }
          }
          __int16 v68 = 0;
        }
        else
        {
LABEL_15:
          __int16 v68 = 1;
        }
        uint64_t v31 = (Bytef *)[v20 bytes];
        uint64_t v32 = [v20 length];
        uint64_t v33 = 0;
        int v71 = v23;
        if (v31)
        {
          uint64_t v34 = v32;
          if (v32)
          {
            BOOL v35 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v32 - 1];
            memset(&strm.avail_in, 0, 104);
            strm.next_in = v31;
            strm.avail_in = v34;
            strm.next_out = (Bytef *)[v35 mutableBytes];
            strm.avail_out = v34 - 1;
            if (v35
              && !deflateInit2_(&strm, 6, 8, -15, 8, 0, "1.2.12", 112)
              && (int v36 = deflate(&strm, 4), v37 = deflateEnd(&strm), v36 == 1))
            {
              uint64_t v33 = 0;
              if (!v37 && v34 == strm.total_in)
              {
                [v35 setLength:strm.total_out];
                uint64_t v33 = v35;
              }
            }
            else
            {
              uint64_t v33 = 0;
            }
          }
        }
        __int16 v38 = 8 * (v33 != 0);
        if (v33) {
          v39 = v33;
        }
        else {
          v39 = v20;
        }
        uint64_t v69 = v39;
        int v40 = [v39 length];
        uint64_t v41 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v19 + 30];
        objc_msgSend(v41, "replaceBytesInRange:withBytes:", 0, 30, &localHeaderTemplate);
        objc_msgSend(v41, "replaceBytesInRange:withBytes:", 30, v19, v18);
        uint64_t v42 = [v41 mutableBytes];
        *(_WORD *)(v42 + 4) = 20;
        *(_WORD *)(v42 + 8) = v38;
        *(_WORD *)(v42 + 10) = v63;
        *(_WORD *)(v42 + 12) = v62;
        *(_DWORD *)(v42 + 14) = v70;
        *(_DWORD *)(v42 + 18) = v40;
        *(_DWORD *)(v42 + 22) = v71;
        *(_WORD *)(v42 + 26) = v19;
        uint64_t v43 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v19 + 46];
        objc_msgSend(v43, "replaceBytesInRange:withBytes:", 0, 46, &directoryHeaderTemplate);
        objc_msgSend(v43, "replaceBytesInRange:withBytes:", 46, v19, v18);
        uint64_t v44 = [v43 mutableBytes];
        *(_WORD *)(v44 + 6) = 20;
        *(_WORD *)(v44 + 10) = v38;
        *(_WORD *)(v44 + 12) = v63;
        *(_WORD *)(v44 + 14) = v62;
        *(_DWORD *)(v44 + 16) = v70;
        *(_DWORD *)(v44 + 20) = v40;
        *(_DWORD *)(v44 + 24) = v71;
        *(_WORD *)(v44 + 28) = v19;
        *(_WORD *)(v44 + 36) = v68;
        *(_DWORD *)(v44 + 42) = [v67 length];
        [v67 appendData:v41];
        [v67 appendData:v69];
        [v66 appendData:v43];
        uint64_t v4 = v64;
        uint64_t v5 = v65;
      }
      ++v16;
    }
    while (v16 != v5);
  }
  uint64_t v45 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:22];
  objc_msgSend(v45, "replaceBytesInRange:withBytes:", 0, 22, &endOfDirectoryTemplate);
  uint64_t v46 = [v45 mutableBytes];
  *(_WORD *)(v46 + 8) = v5;
  *(_WORD *)(v46 + 10) = v5;
  *(_DWORD *)(v46 + 12) = [v66 length];
  *(_DWORD *)(v46 + 16) = [v67 length];
  [v67 appendData:v66];
  [v67 appendData:v45];
  if (!v67) {
    return 0;
  }
  if (a3)
  {
    uint64_t v47 = objc_msgSend((id)objc_msgSend(a2, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(@".", "stringByAppendingString:", objc_msgSend(a2, "lastPathComponent")), "stringByAppendingString:", @".nosync"));
    id v48 = (const std::__fs::filesystem::path *)[a2 fileSystemRepresentation];
    unint64_t v49 = (const std::__fs::filesystem::path *)[v47 fileSystemRepresentation];
    result = [v67 writeToFile:v47 options:a3 & 0xFFFFFFFFFFFFFFFELL error:a4];
    if (!result) {
      return result;
    }
    rename(v49, v48, v50);
    if (!v51) {
      return 1;
    }
    uint64_t v52 = [NSString stringWithFormat:@"CoreData: Ubiquity: Error writing file '%@', rename failed with errno %d", a2, *__error()];
    _NSCoreDataLog(1, @"%@", v53, v54, v55, v56, v57, v58, v52);
    return 0;
  }

  return objc_msgSend(v67, "writeToFile:options:error:", a2);
}

@end