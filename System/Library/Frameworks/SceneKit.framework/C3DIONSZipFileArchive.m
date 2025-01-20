@interface C3DIONSZipFileArchive
- (BOOL)isValid;
- (BOOL)writeContentsForEntryName:(id)a3 toFile:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (C3DIONSZipFileArchive)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (C3DIONSZipFileArchive)initWithEntryNames:(id)a3 contents:(id)a4 properties:(id)a5 options:(unint64_t)a6;
- (C3DIONSZipFileArchive)initWithEntryNames:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5;
- (C3DIONSZipFileArchive)initWithPath:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)archiveData;
- (id)archiveStream;
- (id)contentsForEntryName:(id)a3;
- (id)entryNames;
- (id)propertiesForEntryName:(id)a3;
- (id)streamForEntryName:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation C3DIONSZipFileArchive

- (C3DIONSZipFileArchive)initWithPath:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!a3 || ![a3 length]) {
    return 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)C3DIONSZipFileArchive;
  v9 = [(C3DIONSZipFileArchive *)&v20 init];
  uint64_t v10 = (uint64_t)v9;
  if (!v9) {
    return (C3DIONSZipFileArchive *)v10;
  }
  unint64_t v11 = a4 & 3;
  *((void *)v9 + 9) = 0;
  *(_OWORD *)(v9 + 88) = 0u;
  *(_OWORD *)(v9 + 104) = 0u;
  *((void *)v9 + 15) = 0;
  switch(v11)
  {
    case 1uLL:
      uint64_t v14 = _openFile(a3);
      *(void *)(v10 + 32) = v14;
      if ((v14 & 0x8000000000000000) == 0)
      {
        *(_DWORD *)(v10 + 80) |= 0x10u;
        goto LABEL_15;
      }
LABEL_17:

      return 0;
    case 2uLL:
      v15 = (void *)MEMORY[0x263EFF8F8];
      id v16 = a3;
      uint64_t v17 = 1;
      break;
    case 3uLL:
      uint64_t v12 = _openFile(a3);
      if ((v12 & 0x8000000000000000) == 0)
      {
        int v13 = v12;
        *(void *)(v10 + 40) = [a3 copy];
        close(v13);
        goto LABEL_15;
      }
      goto LABEL_17;
    default:
      v15 = (void *)MEMORY[0x263EFF8F8];
      id v16 = a3;
      uint64_t v17 = 0;
      break;
  }
  uint64_t v18 = [v15 dataWithContentsOfFile:v16 options:v17 error:a5];
  if (!v18) {
    goto LABEL_17;
  }
  uint64_t v10 = [(id)v10 initWithData:v18 options:a4 error:a5];
  if (!v10) {
    goto LABEL_17;
  }
LABEL_15:
  if ((a4 & 4) != 0) {
    *(_DWORD *)(v10 + 80) |= 8u;
  }
  return (C3DIONSZipFileArchive *)v10;
}

- (C3DIONSZipFileArchive)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v5 = a4;
  v72[5] = *MEMORY[0x263EF8340];
  v70.receiver = self;
  v70.super_class = (Class)C3DIONSZipFileArchive;
  v7 = [(C3DIONSZipFileArchive *)&v70 init];
  v8 = v7;
  if (!a3) {
    goto LABEL_80;
  }
  if (!v7) {
    goto LABEL_80;
  }
  v63 = (void *)[MEMORY[0x263EFF980] array];
  v62 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [a3 bytes];
  unint64_t v10 = [a3 length];
  if (v10 < 0x15) {
    goto LABEL_80;
  }
  uint64_t v11 = v9;
  unint64_t v12 = v10;
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  uint64_t v15 = -20;
  unint64_t v16 = 20;
  uint64_t v17 = v11;
  do
  {
    int v18 = *(_DWORD *)(v17 + v10 - 20);
    if (v18 == 117853008)
    {
      unint64_t v19 = 0;
      if (v10 >= 0x39)
      {
        unint64_t v20 = *(void *)(v17 + v10 - 12);
        if (v20 <= v10 - 56)
        {
          unint64_t v21 = v11 + v20;
          if (*(_DWORD *)(v11 + v20) == 101075792)
          {
            uint64_t v13 = *(void *)(v21 + 24);
            unint64_t v14 = *(void *)(v21 + 48);
            unint64_t v19 = *(void *)(v17 + v10 - 12);
          }
          else
          {
            unint64_t v19 = 0;
          }
        }
      }
    }
    else if (v18 == 101010256)
    {
      unint64_t v19 = v10 - v16;
      uint64_t v13 = *(unsigned __int16 *)(v17 + v10 - 12);
      unint64_t v14 = *(unsigned int *)(v17 + v10 - 4);
    }
    else
    {
      unint64_t v19 = 0;
      if (v16 >= 0x38 && v18 == 101075792)
      {
        unint64_t v19 = v10 + v15;
        uint64_t v13 = *(void *)(v17 + v10 + 4);
        unint64_t v14 = *(void *)(v17 + v10 + 28);
      }
    }
    if (v16 > 0x101CE) {
      break;
    }
    if (v19) {
      break;
    }
    ++v16;
    --v15;
    --v17;
  }
  while (v16 < v10);
  if (!v13) {
    goto LABEL_80;
  }
  id v55 = a3;
  char v56 = v5;
  v57 = v8;
  char v58 = 0;
  uint64_t v22 = 0;
  uint64_t v59 = v11 + 16;
  uint64_t v60 = v11 + 8;
  unint64_t v23 = v14;
  uint64_t v69 = v11;
  do
  {
    if (v23 < v14) {
      break;
    }
    if (v23 >= v12) {
      break;
    }
    unint64_t v24 = v23 + 46;
    if (v23 + 46 <= v14) {
      break;
    }
    if (v24 > v12) {
      break;
    }
    unint64_t v25 = v11 + v23;
    if (*(_DWORD *)v25 != 33639248) {
      break;
    }
    uint64_t v68 = v13;
    uint64_t v27 = *(unsigned int *)(v25 + 20);
    uint64_t v26 = *(unsigned int *)(v25 + 24);
    uint64_t v28 = *(unsigned __int16 *)(v25 + 28);
    unint64_t v29 = *(unsigned int *)(v25 + 42);
    BOOL v30 = v27 == 0xFFFFFFFFLL || v26 == 0xFFFFFFFFLL;
    BOOL v31 = v30 || v29 == 0xFFFFFFFF;
    BOOL v32 = v31;
    unint64_t v33 = v24 + v28;
    if (v24 + v28 <= v14 || v33 > v12) {
      break;
    }
    id v34 = 0;
    uint64_t v35 = *(unsigned __int16 *)(v25 + 10);
    uint64_t v64 = *(unsigned int *)(v25 + 16);
    uint64_t v65 = v22;
    uint64_t v36 = *(unsigned __int16 *)(v25 + 30);
    uint64_t v67 = *(unsigned __int16 *)(v25 + 32);
    if (*(_WORD *)(v25 + 28))
    {
      if (v14 > v29)
      {
        uint64_t v61 = *(unsigned __int16 *)(v25 + 10);
        unint64_t v37 = v69 + v24;
        id v34 = (id)[[NSString alloc] initWithBytes:v37 length:v28 encoding:4];
        uint64_t v35 = v61;
        if (!v34)
        {
          id v34 = (id)[[NSString alloc] initWithBytes:v37 length:v28 encoding:12];
          uint64_t v35 = v61;
        }
      }
    }
    uint64_t v38 = v36;
    BOOL v39 = v36 > 4 && v32;
    BOOL v30 = v39;
    unint64_t v40 = v33 + v36;
    BOOL v41 = !v30 || v33 >= v40;
    BOOL v42 = !v41 && v40 > v14;
    if (!v42 || v40 > v12)
    {
      uint64_t v11 = v69;
      uint64_t v47 = v65;
    }
    else
    {
      unint64_t v46 = v33;
      uint64_t v11 = v69;
      uint64_t v47 = v65;
      do
      {
        v48 = (unsigned __int16 *)(v69 + v46);
        uint64_t v49 = *(unsigned __int16 *)(v69 + v46 + 2);
        unint64_t v50 = v46 + 4;
        v46 += 4 + v49;
        if (v46 <= v50 || v46 > v40) {
          break;
        }
        int v52 = *v48;
        if (v49 >= 0x18 && v52 == 1)
        {
          if (v26 == 0xFFFFFFFFLL) {
            uint64_t v26 = *(void *)(v69 + v50);
          }
          if (v27 == 0xFFFFFFFFLL) {
            uint64_t v27 = *(void *)(v60 + v50);
          }
          if (v29 == 0xFFFFFFFF) {
            unint64_t v29 = *(void *)(v59 + v50);
          }
        }
      }
      while (v46 < v40);
    }
    if (v34)
    {
      v71[0] = @"C3DIONSZipFileArchiveCompressionType";
      id v44 = v34;
      uint64_t v66 = v38;
      v72[0] = [NSNumber numberWithUnsignedInteger:v35];
      v71[1] = @"C3DIONSZipFileArchiveHeaderOffset";
      v72[1] = [NSNumber numberWithUnsignedLongLong:v29];
      v71[2] = @"C3DIONSZipFileArchiveCRC";
      v72[2] = [NSNumber numberWithUnsignedInteger:v64];
      v71[3] = @"C3DIONSZipFileArchiveCompressedLength";
      v72[3] = [NSNumber numberWithUnsignedLongLong:v27];
      v71[4] = @"C3DIONSZipFileArchiveUncompressedLength";
      v72[4] = [NSNumber numberWithUnsignedLongLong:v26];
      uint64_t v45 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:5];
      [v63 addObject:v44];
      [v62 setObject:v45 forKey:v44];
      uint64_t v38 = v66;
      uint64_t v11 = v69;
      char v58 = 1;
    }
    uint64_t v13 = v68;
    unint64_t v23 = v33 + v38 + v67;
    uint64_t v22 = v47 + 1;
  }
  while (v22 != v68);
  v8 = v57;
  if (v58)
  {
    v57->_data = (NSData *)v55;
    v57->_names = (NSArray *)v63;
    v57->_properties = (NSDictionary *)v62;
    if ((v56 & 4) != 0) {
      *(_DWORD *)&v57->_zFlags |= 8u;
    }
  }
  else
  {
LABEL_80:
    if (v8)
    {

      return 0;
    }
  }
  return v8;
}

- (C3DIONSZipFileArchive)initWithEntryNames:(id)a3 contents:(id)a4 properties:(id)a5 options:(unint64_t)a6
{
  unint64_t v10 = [a3 count];
  v17.receiver = self;
  v17.super_class = (Class)C3DIONSZipFileArchive;
  uint64_t v11 = [(C3DIONSZipFileArchive *)&v17 init];
  if (v10)
  {
    unint64_t v12 = 1;
    do
    {
      uint64_t v13 = objc_msgSend(a4, "objectForKey:", objc_msgSend(a3, "objectAtIndex:", v12 - 1));
      BOOL v14 = v13 != 0;
      if (v13) {
        BOOL v15 = v12 >= v10;
      }
      else {
        BOOL v15 = 1;
      }
      ++v12;
    }
    while (!v15);
    if (!a3) {
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (!a3) {
      goto LABEL_16;
    }
  }
  if (a4 && v14 && v11 && v10)
  {
    v11->_contents = (NSDictionary *)[a4 copy];
    v11->_names = (NSArray *)[a3 copy];
    v11->_properties = (NSDictionary *)[a5 copy];
    *(_DWORD *)&v11->_zFlags |= 8u;
    return v11;
  }
LABEL_16:
  if (v11)
  {

    return 0;
  }
  return v11;
}

- (C3DIONSZipFileArchive)initWithEntryNames:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)C3DIONSZipFileArchive;
  id v8 = [(C3DIONSZipFileArchive *)&v11 init];
  if (objc_opt_respondsToSelector()) {
    *((_DWORD *)v8 + 20) |= 1u;
  }
  if (objc_opt_respondsToSelector()) {
    *((_DWORD *)v8 + 20) |= 2u;
  }
  if (objc_opt_respondsToSelector())
  {
    int v9 = *((_DWORD *)v8 + 20) | 4;
    *((_DWORD *)v8 + 20) = v9;
  }
  else
  {
    if (!v8) {
      return (C3DIONSZipFileArchive *)v8;
    }
    int v9 = *((_DWORD *)v8 + 20);
  }
  if ((v9 & 3) != 0)
  {
    *((void *)v8 + 3) = a4;
    *((void *)v8 + 6) = [a3 copy];
    if ((v5 & 4) != 0) {
      *((_DWORD *)v8 + 20) |= 8u;
    }
  }
  else
  {

    return 0;
  }
  return (C3DIONSZipFileArchive *)v8;
}

- (void)dealloc
{
  [(C3DIONSZipFileArchive *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)C3DIONSZipFileArchive;
  [(C3DIONSZipFileArchive *)&v3 dealloc];
}

- (id)entryNames
{
  return self->_names;
}

- (id)contentsForEntryName:(id)a3
{
  contents = self->_contents;
  if (contents)
  {
    uint64_t v6 = [(NSDictionary *)contents objectForKey:a3];
LABEL_3:
    v7 = (void *)v6;
    goto LABEL_4;
  }
  if (self->_data)
  {
    id v9 = [(NSDictionary *)self->_properties objectForKey:a3];
    if (v9)
    {
      unint64_t v10 = v9;
      unint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"C3DIONSZipFileArchiveHeaderOffset"), "unsignedIntegerValue");
      uint64_t v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"C3DIONSZipFileArchiveCompressionType"), "unsignedIntegerValue");
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"C3DIONSZipFileArchiveCRC"), "unsignedIntegerValue");
      uint64_t v14 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"C3DIONSZipFileArchiveCompressedLength"), "unsignedIntegerValue");
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"C3DIONSZipFileArchiveUncompressedLength"), "unsignedIntegerValue");
      data = self->_data;
      uint64_t v17 = [(NSData *)data bytes];
      unint64_t v18 = [(NSData *)data length];
      if (v18 > v11 && v11 <= 0xFFFFFFFFFFFFFFE1)
      {
        v7 = 0;
        if (!v15 || !v14 || v11 + 30 >= v18) {
          return v7;
        }
        unint64_t v19 = (unsigned __int16 *)(v17 + v11);
        if (*(_DWORD *)(v17 + v11) == 67324752 && v12 == v19[4])
        {
          unint64_t v20 = v11 + 30 + v19[13] + v19[14];
          if (v20 < v18)
          {
            v7 = 0;
            unint64_t v21 = v20 + v14;
            if (v20 + v14 >= v18 || v21 <= v20 || v21 <= v11) {
              return v7;
            }
            if (v12 == 8)
            {
              uint64_t v26 = (void *)[MEMORY[0x263EFF990] dataWithLength:v15];
              uint64_t v27 = (Bytef *)[v26 mutableBytes];
              *(_OWORD *)&v31.avail_in = 0u;
              memset(&v31.total_out, 0, 72);
              v31.next_in = (Bytef *)(v17 + v20);
              v31.avail_in = v14;
              v31.next_out = v27;
              *(void *)&v31.avail_out = v15;
              if (v26
                && (uint64_t v28 = v27, !inflateInit2_(&v31, -15, "1.2.12", 112))
                && (int v29 = inflate(&v31, 4), v30 = inflateEnd(&v31), v29 == 1))
              {
                v7 = 0;
                if (!v30 && v31.total_out == v15)
                {
                  if (v13 == _crcFromBytes(v28, v15)) {
                    v7 = v26;
                  }
                  else {
                    v7 = 0;
                  }
                }
              }
              else
              {
                v7 = 0;
              }
LABEL_4:
              if (!v7) {
                return v7;
              }
              goto LABEL_5;
            }
            if (!v12 && v13 == _crcFromBytes((const Bytef *)(v17 + v20), v14))
            {
              uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v17 + v20 length:v14];
              goto LABEL_3;
            }
          }
        }
      }
    }
    return 0;
  }
  if (![(NSArray *)self->_names containsObject:a3]) {
    return 0;
  }
  __zFlags zFlags = self->_zFlags;
  if ((*(unsigned char *)&zFlags & 1) == 0)
  {
    if ((*(unsigned char *)&zFlags & 2) != 0)
    {
      [self->_provider archive:self streamForEntryName:a3];
    }
    else if ((*(unsigned char *)&zFlags & 0x10) == 0)
    {
      path = self->_path;
      if (path)
      {
        uint64_t v24 = _openFile(path);
        if ((v24 & 0x8000000000000000) == 0) {
          close(v24);
        }
      }
    }
    return 0;
  }
  v7 = (void *)[(NSMutableDictionary *)self->_cachedContents objectForKey:a3];
  if (!v7)
  {
    uint64_t v6 = [self->_provider archive:self contentsForEntryName:a3];
    goto LABEL_3;
  }
LABEL_5:
  if ((*(unsigned char *)&self->_zFlags & 8) == 0)
  {
    cachedContents = self->_cachedContents;
    if (!cachedContents)
    {
      cachedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_cachedContents = cachedContents;
    }
    -[NSMutableDictionary setObject:forKey:](cachedContents, "setObject:forKey:", v7, a3, v31.next_in, *(_OWORD *)&v31.avail_in, *(_OWORD *)&v31.next_out);
  }
  return v7;
}

- (id)streamForEntryName:(id)a3
{
  contents = self->_contents;
  if (contents)
  {
    uint64_t v6 = [(NSDictionary *)contents objectForKey:a3];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = (void *)MEMORY[0x263EFF950];
LABEL_4:
      return (id)[v8 inputStreamWithData:v7];
    }
    return 0;
  }
  if (self->_data || ![(NSArray *)self->_names containsObject:a3]) {
    return 0;
  }
  __zFlags zFlags = self->_zFlags;
  if (*(unsigned char *)&zFlags)
  {
    uint64_t v13 = [(NSMutableDictionary *)self->_cachedContents objectForKey:a3];
    if (!v13)
    {
      uint64_t v15 = [self->_provider archive:self contentsForEntryName:a3];
      if (!v15) {
        return 0;
      }
      uint64_t v13 = v15;
      if ((*(unsigned char *)&self->_zFlags & 8) == 0)
      {
        cachedContents = self->_cachedContents;
        if (!cachedContents)
        {
          cachedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          self->_cachedContents = cachedContents;
        }
        [(NSMutableDictionary *)cachedContents setObject:v13 forKey:a3];
      }
    }
    id v8 = (void *)MEMORY[0x263EFF950];
    uint64_t v7 = v13;
    goto LABEL_4;
  }
  if ((*(unsigned char *)&zFlags & 2) == 0)
  {
    if ((*(unsigned char *)&zFlags & 0x10) == 0)
    {
      path = self->_path;
      if (path)
      {
        uint64_t v12 = _openFile(path);
        if ((v12 & 0x8000000000000000) == 0) {
          close(v12);
        }
      }
    }
    return 0;
  }
  id provider = self->_provider;

  return (id)[provider archive:self streamForEntryName:a3];
}

- (BOOL)writeContentsForEntryName:(id)a3 toFile:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9 = [(C3DIONSZipFileArchive *)self contentsForEntryName:a3];
  if (v9)
  {
    LOBYTE(v9) = [v9 writeToFile:a4 options:a5 error:a6];
  }
  return (char)v9;
}

- (id)propertiesForEntryName:(id)a3
{
  id result = -[NSDictionary objectForKey:](self->_properties, "objectForKey:");
  if (!result)
  {
    if ([(NSArray *)self->_names containsObject:a3])
    {
      if ((*(unsigned char *)&self->_zFlags & 4) == 0
        || (id result = (id)[self->_provider archive:self propertiesForEntryName:a3]) == 0)
      {
        uint64_t v6 = NSDictionary;
        return (id)[v6 dictionary];
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)archiveData
{
  uint64_t v38 = (void *)[MEMORY[0x263EFF990] data];
  BOOL v39 = (void *)[MEMORY[0x263EFF990] data];
  NSUInteger v3 = [(NSArray *)self->_names count];
  NSUInteger v4 = v3;
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v36 = self;
    NSUInteger v37 = v3;
    do
    {
      id v6 = [(NSArray *)self->_names objectAtIndex:v5];
      uint64_t v7 = (const char *)[v6 UTF8String];
      size_t v8 = strlen(v7);
      id v9 = [(C3DIONSZipFileArchive *)self contentsForEntryName:v6];
      int v10 = [v9 length];
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        int v12 = v10;
        uint64_t v13 = (const Bytef *)[v9 bytes];
        uInt v14 = [v9 length];
        uLong v15 = crc32(0, 0, 0);
        LODWORD(v13) = crc32(v15, v13, v14);
        unint64_t v16 = (unsigned __int8 *)[v9 bytes];
        uint64_t v17 = [v9 length];
        int v42 = (int)v13;
        if (v17)
        {
          while (1)
          {
            unsigned int v19 = *v16++;
            unsigned int v18 = v19;
            if (v19 <= 0x1F && v18 - 7 >= 7 && v18 - 26 > 1) {
              break;
            }
            if (!--v17) {
              goto LABEL_12;
            }
          }
          __int16 v40 = 0;
        }
        else
        {
LABEL_12:
          __int16 v40 = 1;
        }
        unint64_t v20 = (Bytef *)[v9 bytes];
        uint64_t v21 = [v9 length];
        uint64_t v22 = 0;
        int v41 = v12;
        if (v20)
        {
          uint64_t v23 = v21;
          if (v21)
          {
            uint64_t v24 = (void *)[MEMORY[0x263EFF990] dataWithLength:v21 - 1];
            memset(&strm.avail_in, 0, 104);
            strm.next_in = v20;
            strm.avail_in = v23;
            strm.next_out = (Bytef *)[v24 mutableBytes];
            strm.avail_out = v23 - 1;
            if (v24
              && !deflateInit2_(&strm, 6, 8, -15, 8, 0, "1.2.12", 112)
              && (int v25 = deflate(&strm, 4), v26 = deflateEnd(&strm), v25 == 1))
            {
              uint64_t v22 = 0;
              if (!v26 && v23 == strm.total_in)
              {
                [v24 setLength:strm.total_out];
                uint64_t v22 = v24;
              }
            }
            else
            {
              uint64_t v22 = 0;
            }
          }
        }
        __int16 v27 = 8 * (v22 != 0);
        if (v22) {
          id v9 = v22;
        }
        int v28 = [v9 length];
        int v29 = (void *)[MEMORY[0x263EFF990] dataWithLength:v8 + 30];
        objc_msgSend(v29, "replaceBytesInRange:withBytes:", 0, 30, &localHeaderTemplate);
        objc_msgSend(v29, "replaceBytesInRange:withBytes:", 30, v8, v7);
        uint64_t v30 = [v29 mutableBytes];
        *(_WORD *)(v30 + 4) = 20;
        *(_WORD *)(v30 + 8) = v27;
        *(_DWORD *)(v30 + 10) = 0;
        *(_DWORD *)(v30 + 14) = v42;
        *(_DWORD *)(v30 + 18) = v28;
        *(_DWORD *)(v30 + 22) = v41;
        *(_WORD *)(v30 + 26) = v8;
        z_stream v31 = (void *)[MEMORY[0x263EFF990] dataWithLength:v8 + 46];
        objc_msgSend(v31, "replaceBytesInRange:withBytes:", 0, 46, &directoryHeaderTemplate);
        objc_msgSend(v31, "replaceBytesInRange:withBytes:", 46, v8, v7);
        uint64_t v32 = [v31 mutableBytes];
        *(_WORD *)(v32 + 6) = 20;
        *(_WORD *)(v32 + 10) = v27;
        *(_DWORD *)(v32 + 12) = 0;
        *(_DWORD *)(v32 + 16) = v42;
        *(_DWORD *)(v32 + 20) = v28;
        *(_DWORD *)(v32 + 24) = v41;
        *(_WORD *)(v32 + 28) = v8;
        *(_WORD *)(v32 + 36) = v40;
        *(_DWORD *)(v32 + 42) = [v39 length];
        [v39 appendData:v29];
        [v39 appendData:v9];
        [v38 appendData:v31];
        self = v36;
        NSUInteger v4 = v37;
      }
      ++v5;
    }
    while (v5 != v4);
  }
  unint64_t v33 = (void *)[MEMORY[0x263EFF990] dataWithLength:22];
  objc_msgSend(v33, "replaceBytesInRange:withBytes:", 0, 22, &endOfDirectoryTemplate);
  uint64_t v34 = [v33 mutableBytes];
  *(_WORD *)(v34 + 8) = v4;
  *(_WORD *)(v34 + 10) = v4;
  *(_DWORD *)(v34 + 12) = [v38 length];
  *(_DWORD *)(v34 + 16) = [v39 length];
  [v39 appendData:v38];
  [v39 appendData:v33];
  return v39;
}

- (id)archiveStream
{
  id result = [(C3DIONSZipFileArchive *)self archiveData];
  if (result)
  {
    id v3 = result;
    NSUInteger v4 = (void *)MEMORY[0x263EFF950];
    return (id)[v4 inputStreamWithData:v3];
  }
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = [(C3DIONSZipFileArchive *)self archiveData];
  if (v8)
  {
    LOBYTE(v8) = [v8 writeToFile:a3 options:a4 error:a5];
  }
  return (char)v8;
}

- (void)invalidate
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
  self->_id provider = 0;
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
}

- (BOOL)isValid
{
  return self->_contents || self->_data || (*(unsigned char *)&self->_zFlags & 0x13) != 0 || self->_path != 0;
}

@end