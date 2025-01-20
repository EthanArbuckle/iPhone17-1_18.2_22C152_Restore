@interface AppleDoubleParser
- (AppleDoubleParser)initWithFileDescriptor:(int)a3 fileSize:(int64_t)a4 isAllocateXattr:(BOOL)a5;
- (AppleDoubleParser)initWithFileDescriptor:(int)a3 isAllocateXattr:(BOOL)a4;
- (BOOL)createAttrHeaderIfNeeded:(id *)a3;
- (BOOL)emptyFinderInfo;
- (BOOL)fillEmptyAppleDoubleFile:(id *)a3;
- (BOOL)isAllocateXattr;
- (BOOL)isXattrNameValid:(attr_entry *)a3;
- (BOOL)isXattrProtected:(const char *)a3;
- (BOOL)parseAttrHeader:(id *)a3;
- (BOOL)parseFileHeader:(id *)a3;
- (BOOL)parseFinderInfoAndResourceFork:(id *)a3;
- (BOOL)readOnly;
- (BOOL)readRawHeader:(id *)a3;
- (BOOL)shiftDataDownAtOffset:(unsigned int)a3 length:(unsigned int)a4 delta:(unint64_t)a5 error:(id *)a6;
- (BOOL)shiftDataUpAtOffset:(unsigned int)a3 length:(unsigned int)a4 delta:(unint64_t)a5 error:(id *)a6;
- (BOOL)updateFileSize:(id *)a3;
- (BOOL)writeHeaderToDiskUpToLength:(unsigned int)a3 error:(id *)a4;
- (NSMutableData)rawHeader;
- (apple_double_entry)finderinfo;
- (apple_double_entry)rsrcfork;
- (apple_double_header)fileHeader;
- (attr_entry)firstAttrEntry;
- (attr_header)attrHeader;
- (int)fileDescriptor;
- (unint64_t)fileSize;
- (unint64_t)headerSize;
- (void)allocateXattrNamed:(id)a3 sized:(unint64_t)a4 how:(unsigned int)a5 reply:(id)a6;
- (void)initEmptyResourceFork:(rsrcfork_header *)a3;
- (void)listXattrs:(list_xattrs_result *)a3;
- (void)lookupXattrNamed:(id)a3 reply:(id)a4;
- (void)removeXattrNamed:(id)a3 reply:(id)a4;
- (void)setAttrHeader:(attr_header *)a3;
- (void)setEmptyFinderInfo:(BOOL)a3;
- (void)setFileDescriptor:(int)a3;
- (void)setFileHeader:(apple_double_header *)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFinderinfo:(apple_double_entry *)a3;
- (void)setFirstAttrEntry:(attr_entry *)a3;
- (void)setHeaderSize:(unint64_t)a3;
- (void)setIsAllocateXattr:(BOOL)a3;
- (void)setRawHeader:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRsrcfork:(apple_double_entry *)a3;
- (void)swapAttrHeader:(attr_header *)a3;
- (void)swapFileHeader;
- (void)updateFileSizeExplicit:(int64_t)a3;
@end

@implementation AppleDoubleParser

- (BOOL)isXattrProtected:(const char *)a3
{
  return strncmp(a3, "com.apple.system.", 0x11uLL) == 0;
}

- (BOOL)isXattrNameValid:(attr_entry *)a3
{
  int v5 = a3->var4[0];
  var4 = a3->var4;
  if (!v5) {
    return 0;
  }
  unint64_t var3 = a3->var3;
  if (var3 > 0x7E || a3->var4[var3]) {
    return 1;
  }
  v8 = [NSString stringWithUTF8String:var4];
  BOOL v7 = v8 != 0;

  return v7;
}

- (void)lookupXattrNamed:(id)a3 reply:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if ([v15 isEqualToString:@"com.apple.FinderInfo"])
  {
    finderinfo = self->_finderinfo;
    if (finderinfo && !self->_emptyFinderInfo)
    {
      (*((void (**)(id, void, void, uint64_t))v6 + 2))(v6, 0, finderinfo->var1, 32);
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (![v15 isEqualToString:@"com.apple.ResourceFork"])
  {
    attrHeader = self->_attrHeader;
    if (attrHeader)
    {
      firstAttrEntry = self->_firstAttrEntry;
      if (firstAttrEntry)
      {
        if (HIWORD(attrHeader->var6[2]))
        {
          for (unsigned int i = 0; i < HIWORD(self->_attrHeader->var6[2]); ++i)
          {
            if ((unint64_t)&firstAttrEntry->var3 >= [(NSMutableData *)self->_rawHeader bytes]
                                                          + self->_headerSize)
              break;
            unint64_t v12 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
            if (v12 > [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
              break;
            }
            v13 = [NSString stringWithUTF8String:firstAttrEntry->var4];
            if ([v15 isEqualToString:v13])
            {
              (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, firstAttrEntry->var0, firstAttrEntry->var1);

              goto LABEL_18;
            }
            firstAttrEntry = (attr_entry *)((char *)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC));
          }
        }
      }
    }
LABEL_16:
    v14 = (void (*)(id, uint64_t, void, void))*((void *)v6 + 2);
    goto LABEL_17;
  }
  rsrcfork = self->_rsrcfork;
  if (rsrcfork)
  {
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, rsrcfork->var1, rsrcfork->var2);
    goto LABEL_18;
  }
  v14 = (void (*)(id, uint64_t, void, void))*((void *)v6 + 2);
LABEL_17:
  v14(v6, 93, 0, 0);
LABEL_18:
}

- (void)listXattrs:(list_xattrs_result *)a3
{
  var7 = a3->var7;
  finderinfo = self->_finderinfo;
  if (finderinfo && !self->_emptyFinderInfo)
  {
    unint64_t var1 = finderinfo->var1;
    strcpy((char *)a3->var7, "com.apple.FinderInfo");
    a3->var0 = var1;
    var7 = &a3->var7[21];
    unsigned int v7 = 21;
  }
  else
  {
    unsigned int v7 = 0;
  }
  rsrcfork = self->_rsrcfork;
  if (rsrcfork)
  {
    uint64_t v10 = *(void *)&rsrcfork->var1;
    *(void *)&long long v11 = v10;
    *((void *)&v11 + 1) = HIDWORD(v10);
    *(_OWORD *)&a3->unint64_t var1 = v11;
    strcpy((char *)var7, "com.apple.ResourceFork");
    var7 += 23;
    v7 += 23;
  }
  attrHeader = self->_attrHeader;
  if (attrHeader)
  {
    firstAttrEntry = self->_firstAttrEntry;
    if (firstAttrEntry)
    {
      if (HIWORD(attrHeader->var6[2]))
      {
        unsigned int v14 = 0;
        unsigned int v15 = 0;
        do
        {
          p_unint64_t var3 = &firstAttrEntry->var3;
          if ((unint64_t)&firstAttrEntry->var3 >= [(NSMutableData *)self->_rawHeader bytes]
                                                        + self->_headerSize)
            break;
          unint64_t v17 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
          if (v17 > [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
            break;
          }
          if ([(AppleDoubleParser *)self isXattrNameValid:firstAttrEntry]
            && ![(AppleDoubleParser *)self isXattrProtected:firstAttrEntry->var4])
          {
            memcpy(var7, firstAttrEntry->var4, *p_var3);
            uint64_t v18 = *p_var3;
            var7 += v18;
            v7 += v18;
            ++v15;
          }
          else
          {
            LOWORD(v18) = *p_var3;
          }
          firstAttrEntry = (attr_entry *)((char *)firstAttrEntry + (((_WORD)v18 + 14) & 0x1FC));
          ++v14;
        }
        while (v14 < HIWORD(self->_attrHeader->var6[2]));
        BOOL v19 = HIWORD(self->_attrHeader->var6[2]) == 0;
      }
      else
      {
        unsigned int v15 = 0;
        BOOL v19 = 1;
      }
      unint64_t v20 = 8 * v15;
      a3->var5 = v7;
      a3->var6 = v20;
      a3->unint64_t var3 = v15;
      a3->var4 = v20 + v7;
      if (!v19)
      {
        unsigned int v21 = 0;
        v22 = self->_firstAttrEntry;
        do
        {
          if ((unint64_t)&v22->var3 >= [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
            break;
          }
          unint64_t v23 = (unint64_t)v22 + ((v22->var3 + 14) & 0x1FC);
          if (v23 > [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
            break;
          }
          if ([(AppleDoubleParser *)self isXattrNameValid:v22])
          {
            if (![(AppleDoubleParser *)self isXattrProtected:v22->var4])
            {
              *(_DWORD *)var7 = v22->var0;
              *((_DWORD *)var7 + 1) = v22->var1;
              var7 += 8;
            }
          }
          v22 = (attr_entry *)((char *)v22 + ((v22->var3 + 14) & 0x1FC));
          ++v21;
        }
        while (v21 < HIWORD(self->_attrHeader->var6[2]));
      }
    }
  }
}

- (void)allocateXattrNamed:(id)a3 sized:(unint64_t)a4 how:(unsigned int)a5 reply:(id)a6
{
  char v7 = a5;
  id v10 = a3;
  id v11 = a6;
  unint64_t v12 = v11;
  if (self->_readOnly || !self->_isAllocateXattr)
  {
    v13 = (void (*)(void))*((void *)v11 + 2);
LABEL_3:
    v13();
    goto LABEL_4;
  }
  if (a4 >> 31 || (unint64_t)[v10 length] >= 0xFF)
  {
    v13 = (void (*)(void))v12[2];
    goto LABEL_3;
  }
  if ([v10 isEqualToString:@"com.apple.FinderInfo"])
  {
    if (a4 != 32)
    {
      v13 = (void (*)(void))v12[2];
      goto LABEL_3;
    }
    if (self->_finderinfo)
    {
      if (self->_emptyFinderInfo)
      {
        if ((v7 & 4) != 0) {
          goto LABEL_55;
        }
LABEL_39:
        v13 = (void (*)(void))v12[2];
        goto LABEL_3;
      }
      if ((v7 & 2) == 0) {
        goto LABEL_39;
      }
LABEL_40:
      v13 = (void (*)(void))v12[2];
      goto LABEL_3;
    }
LABEL_55:
    v13 = (void (*)(void))v12[2];
    goto LABEL_3;
  }
  if ([v10 isEqualToString:@"com.apple.ResourceFork"])
  {
    rsrcfork = self->_rsrcfork;
    if (!rsrcfork) {
      goto LABEL_55;
    }
    unint64_t var2 = rsrcfork->var2;
    if (var2)
    {
      if ((v7 & 2) != 0) {
        goto LABEL_40;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_55;
    }
    if (var2 >= a4)
    {
      id v27 = 0;
      goto LABEL_48;
    }
    rsrcfork->unint64_t var2 = a4;
    if (ftruncate(self->_fileDescriptor, (rsrcfork->var1 + a4)) == -1)
    {
      v30 = doubleagent_std_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser allocateXattrNamed:sized:how:reply:]();
      }

      v13 = (void (*)(void))v12[2];
      goto LABEL_3;
    }
    id v75 = 0;
    BOOL v23 = [(AppleDoubleParser *)self updateFileSize:&v75];
    id v24 = v75;
    v25 = v24;
    if (v23)
    {
      id v74 = v24;
      BOOL v26 = [(AppleDoubleParser *)self writeHeaderToDiskUpToLength:84 error:&v74];
      id v27 = v74;

      if (!v26)
      {
        v32 = doubleagent_std_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[AppleDoubleParser allocateXattrNamed:sized:how:reply:]();
        }

        ((void (*)(void *, uint64_t, void))v12[2])(v12, [v27 code], 0);
        goto LABEL_49;
      }
      rsrcfork = self->_rsrcfork;
LABEL_48:
      ((void (*)(void *, void, void))v12[2])(v12, 0, rsrcfork->var1);
LABEL_49:

      goto LABEL_4;
    }
    v31 = doubleagent_std_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser allocateXattrNamed:sized:how:reply:]();
    }

    ((void (*)(void *, uint64_t, void))v12[2])(v12, 5, 0);
LABEL_62:

    goto LABEL_4;
  }
  if (!self->_attrHeader || !self->_firstAttrEntry) {
    goto LABEL_55;
  }
  uint64_t v67 = [v10 length];
  attrHeader = self->_attrHeader;
  firstAttrEntry = self->_firstAttrEntry;
  unsigned int var4 = attrHeader->var4;
  unsigned int var3 = attrHeader->var3;
  if (HIWORD(attrHeader->var6[2]))
  {
    char v18 = v7 & 0xFB;
LABEL_25:
    for (unsigned int i = 0; i < HIWORD(self->_attrHeader->var6[2]); ++i)
    {
      if ((unint64_t)&firstAttrEntry->var3 >= [(NSMutableData *)self->_rawHeader bytes]
                                                    + self->_headerSize)
        break;
      unint64_t v20 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
      if (v20 > [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
        break;
      }
      unsigned int v21 = [NSString stringWithUTF8String:firstAttrEntry->var4];
      if ([v10 isEqualToString:v21])
      {

        if ((v7 & 2) != 0) {
          goto LABEL_40;
        }
        if (firstAttrEntry->var1 == a4) {
          goto LABEL_39;
        }
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __56__AppleDoubleParser_allocateXattrNamed_sized_how_reply___block_invoke;
        v72[3] = &unk_2652FB038;
        v73 = v12;
        [(AppleDoubleParser *)self removeXattrNamed:v10 reply:v72];

        firstAttrEntry = self->_firstAttrEntry;
        char v7 = v18;
        if (HIWORD(self->_attrHeader->var6[2])) {
          goto LABEL_25;
        }
        char v7 = v18;
        break;
      }
      firstAttrEntry = (attr_entry *)((char *)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC));
    }
  }
  if ((unint64_t)&firstAttrEntry->var3 >= [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
    goto LABEL_37;
  }
  unint64_t v22 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
  if (v22 > [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
    goto LABEL_37;
  }
  if ((v7 & 4) != 0) {
    goto LABEL_55;
  }
  v28 = self->_attrHeader;
  if (HIWORD(v28->var6[2]) == 256)
  {
    v29 = doubleagent_std_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser allocateXattrNamed:sized:how:reply:].cold.4(v29);
    }

    goto LABEL_37;
  }
  unint64_t v33 = (v67 + 15) & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v34 = v28->var3;
  if (v33 + v34 > 0x10000)
  {
LABEL_37:
    v13 = (void (*)(void))v12[2];
    goto LABEL_3;
  }
  unint64_t v35 = v33 + a4 + var4 + var3;
  unsigned int v36 = v28->var2;
  unint64_t v37 = v36 - (v34 + v28->var4);
  BOOL v38 = v33 + a4 >= v37;
  unint64_t v39 = v33 + a4 - v37;
  if (v39 != 0 && v38)
  {
    unint64_t v40 = (v39 + 4095) & 0xFFFFFFFFFFFFF000;
    unint64_t v41 = 0x10000 - v36;
    if (v40 < v41) {
      unint64_t v41 = v40;
    }
    if (v35 <= 0x10000) {
      unint64_t v42 = v41;
    }
    else {
      unint64_t v42 = v40;
    }
    v43 = self->_rsrcfork;
    if (v43)
    {
      uint64_t v44 = v43->var2;
      if (v44)
      {
        uint64_t var1 = v43->var1;
        id v71 = 0;
        BOOL v46 = [(AppleDoubleParser *)self shiftDataDownAtOffset:var1 length:v44 delta:v42 error:&v71];
        id v47 = v71;
        v25 = v47;
        if (!v46)
        {
          ((void (*)(void *, uint64_t, void))v12[2])(v12, [v47 code], 0);
          goto LABEL_62;
        }
        v43 = self->_rsrcfork;
        v28 = self->_attrHeader;
        unsigned int v36 = v28->var2;
      }
      else
      {
        v25 = 0;
      }
      v43->var1 += v42;
    }
    else
    {
      v25 = 0;
    }
    self->_finderinfo->var2 += v42;
    v28->unint64_t var2 = v36 + v42;
    unint64_t v35 = v33 + a4 + var4 + var3;
  }
  else
  {
    v25 = 0;
  }
  uint64_t v48 = v28->var3;
  unint64_t v68 = v35;
  if (v35 <= 0x10000)
  {
    memmove((char *)v28 + v48 + v33, (char *)v28 + v48, v28->var4);
  }
  else
  {
    uint64_t v49 = v28->var4;
    id v70 = v25;
    BOOL v50 = [(AppleDoubleParser *)self shiftDataDownAtOffset:v48 length:v49 delta:v33 error:&v70];
    id v51 = v70;

    if (!v50)
    {
      ((void (*)(void *, uint64_t, void))v12[2])(v12, [v51 code], 0);

      goto LABEL_4;
    }
    v25 = v51;
  }
  v52 = self->_attrHeader;
  unsigned int v53 = v52->var3 + v33;
  v52->unsigned int var3 = v53;
  if (HIWORD(v52->var6[2]))
  {
    int v54 = 0;
    v55 = self->_firstAttrEntry;
    while ((unint64_t)&v55->var3 < [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize)
    {
      v56 = (char *)v55 + ((v55->var3 + 14) & 0x1FC);
      uint64_t v57 = [(NSMutableData *)self->_rawHeader bytes];
      v52 = self->_attrHeader;
      if ((unint64_t)v56 <= v57 + self->_headerSize)
      {
        v55->var0 += v33;
        v55 = (attr_entry *)((char *)v55 + ((v55->var3 + 14) & 0x1FC));
        if (++v54 < HIWORD(v52->var6[2])) {
          continue;
        }
      }
      goto LABEL_95;
    }
    v52 = self->_attrHeader;
LABEL_95:
    unsigned int v53 = v52->var3;
  }
  firstAttrEntry->var0 = v52->var4 + v53;
  firstAttrEntry->uint64_t var1 = a4;
  firstAttrEntry->unsigned int var3 = [v10 length] + 1;
  firstAttrEntry->unint64_t var2 = 0;
  id v58 = v10;
  memcpy(firstAttrEntry->var4, (const void *)[v58 UTF8String], objc_msgSend(v58, "length") + 1);
  v59 = self->_attrHeader;
  ++HIWORD(v59->var6[2]);
  unsigned int v60 = v59->var3;
  unsigned int v61 = v59->var4 + a4;
  v59->unsigned int var4 = v61;
  if (v68 <= 0x10000) {
    unsigned int v62 = v61;
  }
  else {
    unsigned int v62 = 0;
  }
  id v69 = v25;
  BOOL v63 = [(AppleDoubleParser *)self writeHeaderToDiskUpToLength:v60 + v62 error:&v69];
  id v64 = v69;

  if (v63) {
    ((void (*)(void *, void, void))v12[2])(v12, 0, firstAttrEntry->var0);
  }
  else {
    ((void (*)(void *, uint64_t, void))v12[2])(v12, [v64 code], 0);
  }

LABEL_4:
}

uint64_t __56__AppleDoubleParser_allocateXattrNamed_sized_how_reply___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)removeXattrNamed:(id)a3 reply:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  if (self->_readOnly)
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    goto LABEL_39;
  }
  attrHeader = self->_attrHeader;
  if (attrHeader) {
    LODWORD(attrHeader) = HIWORD(attrHeader->var6[2]);
  }
  if (self->_rsrcfork) {
    int v10 = attrHeader + 1;
  }
  else {
    int v10 = (int)attrHeader;
  }
  if (self->_finderinfo && !self->_emptyFinderInfo) {
    ++v10;
  }
  if ([v6 isEqualToString:@"com.apple.FinderInfo"])
  {
    finderinfo = self->_finderinfo;
    if (finderinfo && !self->_emptyFinderInfo)
    {
      unint64_t v12 = (_OWORD *)((char *)&self->_attrHeader->var0.var0 + finderinfo->var1);
      *unint64_t v12 = 0u;
      v12[1] = 0u;
      id v63 = 0;
      BOOL v13 = [(AppleDoubleParser *)self writeHeaderToDiskUpToLength:84 error:&v63];
      id v14 = v63;
      if (v13)
      {
LABEL_15:
        ((void (**)(void, void, BOOL))v8)[2](v8, 0, v10 == 1);
LABEL_24:

        goto LABEL_39;
      }
LABEL_23:
      v8[2](v8, [v14 code], 0);
      goto LABEL_24;
    }
    goto LABEL_38;
  }
  if (![v6 isEqualToString:@"com.apple.ResourceFork"])
  {
    unint64_t v22 = self->_attrHeader;
    if (v22 && (BOOL v23 = self->_firstAttrEntry) != 0)
    {
      if (HIWORD(v22->var6[2]))
      {
        for (unsigned int i = 0; i < HIWORD(self->_attrHeader->var6[2]); ++i)
        {
          if ((unint64_t)&v23->var3 >= [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
            break;
          }
          unint64_t v25 = (unint64_t)v23 + ((v23->var3 + 14) & 0x1FC);
          if (v25 > [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
            break;
          }
          BOOL v26 = [NSString stringWithUTF8String:v23->var4];
          if ([v6 isEqualToString:v26])
          {
            int v31 = HIWORD(self->_attrHeader->var6[2]) - 1;

            uint64_t var0 = v23->var0;
            uint64_t var1 = v23->var1;
            uint64_t v33 = ([v6 length] + 15) & 0xFFFFFFFC;
            uint64_t v34 = self->_attrHeader;
            uint64_t var3 = v34->var3;
            unsigned int v36 = v34->var4 + var3;
            if (v31 != i) {
              memmove(v23, (char *)v23 + v33, (char *)v34 + var3 - ((char *)v23 + v33));
            }
            unint64_t v37 = self->_attrHeader;
            uint64_t v38 = v37->var3;
            if (v36 <= 0x10000)
            {
              memmove((char *)v37 + v38 - v33, (char *)v37 + v38, (var0 - v38));
              BOOL v43 = v31 == i;
              int v42 = var1;
              if (!v43) {
                memmove((char *)self->_attrHeader + var0 - v33, (char *)self->_attrHeader + var0 + var1, (self->_attrHeader->var3 - (var1 + var0) + self->_attrHeader->var4));
              }
              bzero((char *)self->_attrHeader+ self->_attrHeader->var3+ self->_attrHeader->var4- (v33 + var1), (v33 + var1));
              unint64_t v41 = 0;
              uint64_t v44 = self->_attrHeader;
              unsigned int v46 = v44->var3;
              unsigned int var4 = v44->var4;
              LODWORD(v56) = var4 + v46;
              unsigned int v47 = v46 - v33;
            }
            else
            {
              HIDWORD(v56) = HIDWORD(var0);
              id v60 = 0;
              BOOL v39 = [(AppleDoubleParser *)self shiftDataUpAtOffset:v38 length:(var0 - v38) delta:v33 error:&v60];
              id v40 = v60;
              unint64_t v41 = v40;
              if (!v39)
              {
                v8[2](v8, [v40 code], 0);

                goto LABEL_39;
              }
              if (v31 == i)
              {
                int v42 = var1;
              }
              else
              {
                int v42 = var1;
                id v59 = v40;
                BOOL v48 = -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:](self, "shiftDataUpAtOffset:length:delta:error:");
                id v49 = v59;

                if (!v48)
                {
                  v8[2](v8, [v49 code], 0);

                  goto LABEL_39;
                }
                unint64_t v41 = v49;
              }
              uint64_t v44 = self->_attrHeader;
              unsigned int var4 = v44->var4;
              unsigned int v47 = v44->var3 - v33;
              LODWORD(v56) = v47;
            }
            __int16 v50 = HIWORD(v44->var6[2]) - 1;
            HIWORD(v44->var6[2]) = v50;
            v44->uint64_t var3 = v47;
            v44->unsigned int var4 = var4 - v42;
            if (v50)
            {
              unsigned int v51 = 0;
              firstAttrEntry = self->_firstAttrEntry;
              do
              {
                if ((unint64_t)&firstAttrEntry->var3 >= [(NSMutableData *)self->_rawHeader bytes]
                                                              + self->_headerSize)
                  break;
                unint64_t v53 = (unint64_t)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC);
                if (v53 > [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
                  break;
                }
                int v54 = firstAttrEntry >= v23 ? var1 : 0;
                firstAttrEntry->var0 -= v54 + v33;
                firstAttrEntry = (attr_entry *)((char *)firstAttrEntry + ((firstAttrEntry->var3 + 14) & 0x1FC));
                ++v51;
              }
              while (v51 < HIWORD(self->_attrHeader->var6[2]));
            }
            id v58 = v41;
            BOOL v55 = -[AppleDoubleParser writeHeaderToDiskUpToLength:error:](self, "writeHeaderToDiskUpToLength:error:", v56, &v58, v56);
            id v14 = v58;

            if (v55) {
              goto LABEL_15;
            }
            goto LABEL_23;
          }
          BOOL v23 = (attr_entry *)((char *)v23 + ((v23->var3 + 14) & 0x1FC));
        }
      }
      id v27 = doubleagent_std_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "-[AppleDoubleParser removeXattrNamed:reply:]";
        __int16 v66 = 2080;
        uint64_t v67 = [v6 UTF8String];
        _os_log_impl(&dword_24CF84000, v27, OS_LOG_TYPE_DEFAULT, "%s: Couldn't find xattr = %s.", buf, 0x16u);
      }
    }
    else
    {
      id v27 = doubleagent_std_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser removeXattrNamed:reply:].cold.4(v27);
      }
    }

    goto LABEL_38;
  }
  rsrcfork = self->_rsrcfork;
  if (!rsrcfork || (uint64_t var2 = rsrcfork->var2, !var2))
  {
LABEL_38:
    v8[2](v8, 93, 0);
    goto LABEL_39;
  }
  uint64_t v17 = (rsrcfork->var1 + var2);
  if (self->_fileSize == v17)
  {
    if (ftruncate(self->_fileDescriptor, v17 - var2) == -1)
    {
      v29 = doubleagent_std_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser removeXattrNamed:reply:]();
      }

      v8[2](v8, 5, 0);
    }
    else
    {
      id v62 = 0;
      BOOL v18 = [(AppleDoubleParser *)self updateFileSize:&v62];
      id v19 = v62;
      unint64_t v20 = v19;
      if (v18)
      {
        self->_rsrcfork->uint64_t var2 = 0;
        id v61 = v19;
        BOOL v21 = [(AppleDoubleParser *)self writeHeaderToDiskUpToLength:84 error:&v61];
        id v14 = v61;

        if (v21) {
          goto LABEL_15;
        }
        goto LABEL_23;
      }
      v30 = doubleagent_std_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser removeXattrNamed:reply:]();
      }

      v8[2](v8, 5, 0);
    }
  }
  else
  {
    v28 = doubleagent_std_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser removeXattrNamed:reply:](v28);
    }

    v8[2](v8, 14, 0);
  }
LABEL_39:
}

- (void)swapFileHeader
{
  fileHeader = (int8x8_t *)self->_fileHeader;
  LODWORD(v3) = fileHeader[3].u16[0];
  unsigned int v4 = bswap32(v3) >> 16;
  int8x8_t v5 = vrev32_s8(*fileHeader);
  if (fileHeader->u32[0] != 333319) {
    LOWORD(v3) = v4;
  }
  int8x8_t *fileHeader = v5;
  fileHeader[3].i16[0] = v4;
  if ((_WORD)v3)
  {
    uint64_t v3 = (unsigned __int16)v3;
    id v6 = (unsigned int *)((char *)&fileHeader[4] + 2);
    do
    {
      *((int8x8_t *)v6 - 1) = vrev32_s8(*(int8x8_t *)(v6 - 2));
      *id v6 = bswap32(*v6);
      v6 += 3;
      --v3;
    }
    while (v3);
  }
}

- (void)swapAttrHeader:(attr_header *)a3
{
  int8x16_t v3 = *(int8x16_t *)a3->var0.var6;
  int8x16_t v4 = vrev32q_s8(v3);
  unsigned int v5 = bswap32(HIWORD(a3->var6[2])) >> 16;
  if (v3.i32[0] == 1096045650) {
    unsigned __int16 v6 = HIWORD(a3->var6[2]);
  }
  else {
    unsigned __int16 v6 = v5;
  }
  *(int8x16_t *)a3->var0.var6 = v4;
  a3->unsigned int var4 = bswap32(a3->var4);
  LOWORD(a3->var6[2]) = bswap32(LOWORD(a3->var6[2])) >> 16;
  HIWORD(a3->var6[2]) = v5;
  if (v6)
  {
    int v8 = 0;
    p_var7 = (int8x8_t *)&a3->var7;
    do
    {
      if ((unint64_t)&p_var7[1] + 2 >= [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
        break;
      }
      unint64_t v10 = (unint64_t)p_var7 + ((p_var7[1].u8[2] + 14) & 0x1FC);
      if (v10 > [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize) {
        break;
      }
      int8x8_t *p_var7 = vrev32_s8(*p_var7);
      p_var7[1].i16[0] = bswap32(p_var7[1].u16[0]) >> 16;
      ++v8;
      p_var7 = (int8x8_t *)((char *)p_var7 + ((p_var7[1].u8[2] + 14) & 0x1FC));
    }
    while ((unsigned __int16)v8 < v6);
  }
}

- (BOOL)shiftDataDownAtOffset:(unsigned int)a3 length:(unsigned int)a4 delta:(unint64_t)a5 error:(id *)a6
{
  BOOL v6 = 1;
  if (a4 && a5)
  {
    if (a4 >= 0x1000) {
      uint64_t v12 = 4096;
    }
    else {
      uint64_t v12 = a4;
    }
    BOOL v13 = [MEMORY[0x263EFF990] dataWithLength:v12];
    for (unsigned int i = a4 + a3 - v12; i >= a3; i -= v12)
    {
      int fileDescriptor = self->_fileDescriptor;
      id v16 = v13;
      ssize_t v17 = pread(fileDescriptor, (void *)[v16 mutableBytes], v12, i);
      if (v17 == -1)
      {
        BOOL v18 = doubleagent_std_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:]();
        }
        goto LABEL_22;
      }
      if (pwrite(self->_fileDescriptor, (const void *)[v16 bytes], v17, i + a5) == -1)
      {
        BOOL v18 = doubleagent_std_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:]();
        }
        goto LABEL_22;
      }
      if (v12 >= i - a3) {
        LODWORD(v12) = i - a3;
      }
      if (!v12) {
        break;
      }
    }
    if ([(AppleDoubleParser *)self updateFileSize:a6])
    {
      BOOL v6 = 1;
      goto LABEL_23;
    }
    BOOL v18 = doubleagent_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser shiftDataDownAtOffset:length:delta:error:]();
    }
LABEL_22:

    BOOL v6 = 0;
LABEL_23:
  }
  return v6;
}

- (BOOL)shiftDataUpAtOffset:(unsigned int)a3 length:(unsigned int)a4 delta:(unint64_t)a5 error:(id *)a6
{
  BOOL v6 = 1;
  if (a4 && a5)
  {
    if (a4 >= 0x1000) {
      uint64_t v11 = 4096;
    }
    else {
      uint64_t v11 = a4;
    }
    uint64_t v12 = [MEMORY[0x263EFF990] dataWithLength:v11];
    unsigned int v13 = a4 + a3;
    if (a4 + a3 > a3)
    {
      LODWORD(v14) = v11;
      do
      {
        size_t v14 = v14 >= v13 - a3 ? v13 - a3 : v14;
        if (!v14) {
          break;
        }
        int fileDescriptor = self->_fileDescriptor;
        id v16 = v12;
        ssize_t v17 = pread(fileDescriptor, (void *)[v16 mutableBytes], v14, a3);
        if (v17 == -1)
        {
          BOOL v18 = doubleagent_std_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:]();
          }
          goto LABEL_23;
        }
        if (pwrite(self->_fileDescriptor, (const void *)[v16 bytes], v17, a3 - a5) == -1)
        {
          BOOL v18 = doubleagent_std_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:]();
          }
          goto LABEL_23;
        }
        a3 += v14;
      }
      while (a3 < v13);
    }
    if ([(AppleDoubleParser *)self updateFileSize:a6])
    {
      BOOL v6 = 1;
    }
    else
    {
      BOOL v18 = doubleagent_std_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser shiftDataUpAtOffset:length:delta:error:]();
      }
LABEL_23:

      BOOL v6 = 0;
    }
  }
  return v6;
}

- (BOOL)fillEmptyAppleDoubleFile:(id *)a3
{
  id v4 = [MEMORY[0x263EFF990] dataWithLength:4096];
  uint64_t v5 = [v4 mutableBytes];
  *(void *)uint64_t v5 = 0x20007160500;
  *(_WORD *)(v5 + 24) = 512;
  *(_OWORD *)(v5 + 26) = xmmword_24CF894D0;
  *(void *)(v5 + 42) = 0x1E010000E20E0000;
  *(_OWORD *)(v5 + 8) = *(_OWORD *)"Mac OS X        ";
  *(_OWORD *)(v5 + 84) = xmmword_24CF894E0;
  [(AppleDoubleParser *)self initEmptyResourceFork:v5 + 3810];
  int fileDescriptor = self->_fileDescriptor;
  id v7 = v4;
  ssize_t v8 = pwrite(fileDescriptor, (const void *)[v7 bytes], 0x1000uLL, 0);
  if (v8 == 4096)
  {
    *(int64x2_t *)&self->_fileSize = vdupq_n_s64(0x1000uLL);
  }
  else
  {
    v9 = doubleagent_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser fillEmptyAppleDoubleFile:]();
    }
  }
  return v8 == 4096;
}

- (void)initEmptyResourceFork:(rsrcfork_header *)a3
{
  *(_OWORD *)&a3->var6 = 0u;
  *(_OWORD *)&a3->uint64_t var0 = 0u;
  *(_OWORD *)a3->unsigned int var4 = 0u;
  *(_OWORD *)((char *)&a3->var9 + 2) = 0u;
  *(void *)&a3->uint64_t var0 = 0x1000000010000;
  *(void *)&a3->var6 = 0x1000000010000;
  *(_OWORD *)a3->unsigned int var4 = *(_OWORD *)"This resource fork intentionally left blank   ";
  *(_OWORD *)&a3->var4[16] = 0u;
  a3->uint64_t var3 = 503316480;
  a3->var9 = 503316480;
  *(_DWORD *)&a3->var14 = 503323648;
  a3->var16 = -1;
  *(_OWORD *)&a3->var5[96] = 0u;
  *(_OWORD *)&a3->var5[112] = 0u;
  *(_OWORD *)&a3->var5[64] = 0u;
  *(_OWORD *)&a3->var5[80] = 0u;
  *(_OWORD *)&a3->var5[32] = 0u;
  *(_OWORD *)&a3->var5[48] = 0u;
  *(_OWORD *)a3->var5 = 0u;
  *(_OWORD *)&a3->var5[16] = 0u;
  *(_OWORD *)&a3->var4[80] = 0u;
  *(_OWORD *)&a3->var4[96] = 0u;
  *(_OWORD *)&a3->var4[48] = 0u;
  *(_OWORD *)&a3->var4[64] = 0u;
  *(_OWORD *)&a3->var4[16] = *(_OWORD *)"rk intentionally left blank   ";
  *(_OWORD *)&a3->var4[32] = 0u;
  strcpy((char *)&a3->var4[31], "y left blank   ");
}

- (BOOL)updateFileSize:(id *)a3
{
  memset(&v8, 0, sizeof(v8));
  int v5 = fstat(self->_fileDescriptor, &v8);
  if (v5)
  {
    BOOL v6 = doubleagent_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser updateFileSize:](v6);
    }

    if (a3)
    {
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    }
  }
  else
  {
    [(AppleDoubleParser *)self updateFileSizeExplicit:v8.st_size];
  }
  return v5 == 0;
}

- (void)updateFileSizeExplicit:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x10000) {
    int64_t v3 = 0x10000;
  }
  else {
    int64_t v3 = a3;
  }
  if (self->_isAllocateXattr) {
    unint64_t v4 = 0x10000;
  }
  else {
    unint64_t v4 = v3;
  }
  self->_fileSize = a3;
  self->_headerSize = v4;
}

- (BOOL)readRawHeader:(id *)a3
{
  p_headerSize = &self->_headerSize;
  int v5 = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:self->_headerSize];
  rawHeader = self->_rawHeader;
  self->_rawHeader = v5;

  id v7 = self->_rawHeader;
  if (v7)
  {
    if (pread(self->_fileDescriptor, [(NSMutableData *)v7 mutableBytes], self->_headerSize, 0) != -1) {
      return 1;
    }
    v9 = doubleagent_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser readRawHeader:]();
    }
  }
  else
  {
    v9 = doubleagent_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser readRawHeader:]((uint64_t)p_headerSize, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return 0;
}

- (BOOL)writeHeaderToDiskUpToLength:(unsigned int)a3 error:(id *)a4
{
  unsigned int v4 = a3;
  [(AppleDoubleParser *)self swapFileHeader];
  if (self->_attrHeader) {
    -[AppleDoubleParser swapAttrHeader:](self, "swapAttrHeader:");
  }
  if ([(NSMutableData *)self->_rawHeader length] < v4) {
    unsigned int v4 = [(NSMutableData *)self->_rawHeader length];
  }
  ssize_t v6 = pwrite(self->_fileDescriptor, (const void *)[(NSMutableData *)self->_rawHeader bytes], v4, 0);
  if (v6 == -1)
  {
    v9 = doubleagent_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser writeHeaderToDiskUpToLength:error:]();
    }

    return 0;
  }
  uint64_t v7 = v6;
  if (v6 != v4)
  {
    uint64_t v10 = doubleagent_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser writeHeaderToDiskUpToLength:error:](v4, v7, v10);
    }

    return 0;
  }
  [(AppleDoubleParser *)self swapFileHeader];
  if (self->_attrHeader) {
    -[AppleDoubleParser swapAttrHeader:](self, "swapAttrHeader:");
  }
  return 1;
}

- (BOOL)parseFileHeader:(id *)a3
{
  if (self->_headerSize > 0x77)
  {
    int v5 = (apple_double_header *)[(NSMutableData *)self->_rawHeader bytes];
    unsigned int var0 = v5->var0;
    unsigned int var1 = v5->var1;
    v5->unsigned int var0 = bswap32(v5->var0);
    v5->unsigned int var1 = bswap32(var1);
    unsigned int var3 = v5->var3;
    uint64_t v9 = __rev16(var3);
    v5->unsigned int var3 = v9;
    if (var0 == 118883584)
    {
      BOOL v10 = var1 != 512 || var3 == 0;
      if (!v10 && v9 < 0x10)
      {
        unint64_t v12 = 12 * v9 + 26;
        if (self->_headerSize >= v12)
        {
          uint64_t v15 = 0;
          while (1)
          {
            id v16 = (char *)v5 + 12 * v15;
            *(_DWORD *)(v16 + 26) = bswap32(*(_DWORD *)(v16 + 26));
            unint64_t v17 = bswap32(*(_DWORD *)(v16 + 30));
            *(_DWORD *)(v16 + 30) = v17;
            uint64_t v18 = bswap32(*(_DWORD *)(v16 + 34));
            *(_DWORD *)(v16 + 34) = v18;
            if (v12 > v17) {
              break;
            }
            unint64_t v19 = v18 + v17;
            if (v19 > self->_fileSize) {
              break;
            }
            uint64_t v20 = v15;
            BOOL v21 = (unsigned int *)((char *)&v5->var4[0].var1 + 2);
            if (v15)
            {
              do
              {
                unint64_t v22 = *(v21 - 1);
                if (v19 > v22 && *v21 + (int)v22 > v17) {
                  goto LABEL_11;
                }
                v21 += 3;
              }
              while (--v20);
            }
            if (++v15 == v9)
            {
              self->_fileHeader = v5;
              return 1;
            }
          }
        }
      }
    }
  }
LABEL_11:
  if (!a3) {
    return 0;
  }
  id v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:93 userInfo:0];
  BOOL result = 0;
  *a3 = v13;
  return result;
}

- (BOOL)parseFinderInfoAndResourceFork:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  fileHeader = self->_fileHeader;
  BOOL v4 = 1;
  if (!fileHeader->var3) {
    return v4;
  }
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  while (1)
  {
    int v9 = *(unsigned int *)((char *)&fileHeader->var2[v7 / 4 + 4] + 2);
    if (v9 != 2) {
      break;
    }
    int v19 = *(unsigned int *)((char *)&fileHeader->var4[v7 / 0xC].var1 + 2);
    if (v19 == 286)
    {
      if (self->_isAllocateXattr) {
        goto LABEL_31;
      }
      ssize_t v20 = pread(self->_fileDescriptor, __buf, 0x2FuLL, *(unsigned int *)((char *)&fileHeader->var4[v7 / 0xC].var0 + 2) + 16);
      if (v20 != 47)
      {
        if (v20 == -1)
        {
          BOOL v23 = doubleagent_std_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[AppleDoubleParser parseFinderInfoAndResourceFork:]();
          }

          return 0;
        }
LABEL_30:
        fileHeader = self->_fileHeader;
LABEL_31:
        if (v8 != fileHeader->var3 - 1)
        {
          BOOL v21 = doubleagent_std_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            [(AppleDoubleParser *)v25 parseFinderInfoAndResourceFork:v21];
          }

          self->_readOnly = 1;
          fileHeader = self->_fileHeader;
        }
        self->_rsrcfork = (apple_double_entry *)((char *)&fileHeader->var2[v7 / 4 + 4] + 2);
        goto LABEL_36;
      }
      if (strcmp((const char *)__buf, "This resource fork intentionally left blank   ")) {
        goto LABEL_30;
      }
      fileHeader = self->_fileHeader;
    }
    else if (v19 || self->_isAllocateXattr)
    {
      goto LABEL_31;
    }
LABEL_36:
    ++v8;
    v7 += 12;
    if (v8 >= fileHeader->var3) {
      return 1;
    }
  }
  if (v9 != 9 || *(unsigned int *)((char *)&fileHeader->var4[v7 / 0xC].var1 + 2) < 0x20) {
    goto LABEL_36;
  }
  uint64_t v10 = *(unsigned int *)((char *)&fileHeader->var4[v7 / 0xC].var0 + 2);
  if (v10 <= 0xFFFFFFDF && self->_headerSize >= v10 + 32)
  {
    memset(__buf, 0, 32);
    uint64_t v11 = (uint64_t *)((char *)fileHeader + v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    uint64_t v15 = v11[2];
    uint64_t v14 = v11[3];
    if (v12) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = v13 == 0;
    }
    if (v16 && v15 == 0 && v14 == 0) {
      self->_emptyFinderInfo = 1;
    }
    self->_finderinfo = (apple_double_entry *)((char *)&fileHeader->var2[v7 / 4 + 4] + 2);
    goto LABEL_36;
  }
  if (a3)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:93 userInfo:0];
    BOOL v4 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  return 0;
}

- (BOOL)parseAttrHeader:(id *)a3
{
  finderinfo = (apple_double_header *)self->_finderinfo;
  if (!finderinfo || finderinfo != (apple_double_header *)(&self->_fileHeader->var3 + 1) || finderinfo->var2[0] < 0x24) {
    return 1;
  }
  if (finderinfo->var1 == 50)
  {
    uint64_t v7 = [(NSMutableData *)self->_rawHeader bytes];
    if (v7)
    {
      uint64_t v8 = v7;
      int8x16_t v9 = *(int8x16_t *)(v7 + 84);
      int8x16_t v10 = vrev32q_s8(v9);
      *(int8x16_t *)(v7 + 84) = v10;
      unsigned int v11 = bswap32(*(_DWORD *)(v7 + 100));
      *(_DWORD *)(v7 + 100) = v11;
      *(_WORD *)(v7 + 116) = bswap32(*(unsigned __int16 *)(v7 + 116)) >> 16;
      *(_WORD *)(v7 + 118) = bswap32(*(unsigned __int16 *)(v7 + 118)) >> 16;
      if (v9.i32[0] == 1381258305)
      {
        unint64_t v12 = v10.u32[3] + (unint64_t)v11;
        if (v10.i32[2] == self->_finderinfo->var2 + self->_finderinfo->var1 && v12 <= v10.u32[2] && v10.i32[3] > 0x77u)
        {
          unint64_t v14 = [(NSMutableData *)self->_rawHeader bytes] + *(unsigned int *)(v7 + 96);
          if (v14 <= [(NSMutableData *)self->_rawHeader bytes] + self->_headerSize)
          {
            unsigned int v15 = *(unsigned __int16 *)(v8 + 118);
            if (v15 < 0x101)
            {
              unint64_t v17 = (attr_entry *)(v8 + 120);
              uint64_t v18 = 0;
              if (*(_WORD *)(v8 + 118))
              {
                unint64_t v19 = 120;
                while ((unint64_t)&v17[1] <= v14)
                {
                  uint64_t var3 = v17->var3;
                  if ((unint64_t)&v17->var4[var3] > v14) {
                    break;
                  }
                  if (strnlen((const char *)v17->var4, v17->var3) != var3 - 1) {
                    break;
                  }
                  uint64_t v21 = bswap32(v17->var0);
                  uint64_t v22 = bswap32(v17->var1);
                  v17->unsigned int var0 = v21;
                  v17->unsigned int var1 = v22;
                  v17->uint64_t var2 = bswap32(v17->var2) >> 16;
                  if (v22 + v21 > (unint64_t)*(unsigned int *)(v8 + 92)) {
                    break;
                  }
                  unsigned int v23 = *(_DWORD *)(v8 + 96);
                  if (v21 < v23) {
                    break;
                  }
                  if (v22 + v21 > v12) {
                    break;
                  }
                  uint64_t v24 = ((_WORD)var3 + 14) & 0x1FC;
                  BOOL v25 = __CFADD__(v19, v24);
                  v19 += v24;
                  if (v25) {
                    break;
                  }
                  BOOL v25 = __CFADD__(v18, v22);
                  v18 += v22;
                  if (v25) {
                    break;
                  }
                  unint64_t v17 = (attr_entry *)((char *)v17 + v24);
                  if (!--v15)
                  {
                    unint64_t v17 = (attr_entry *)(v8 + 120);
                    goto LABEL_31;
                  }
                }
              }
              else
              {
                unsigned int v23 = *(_DWORD *)(v8 + 96);
                unint64_t v19 = 120;
LABEL_31:
                if (v19 <= v23 && v18 == *(_DWORD *)(v8 + 100))
                {
                  self->_attrHeader = (attr_header *)v8;
                  self->_firstAttrEntry = v17;
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  if (!a3) {
    return 0;
  }
  id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:93 userInfo:0];
  BOOL result = 0;
  *a3 = v16;
  return result;
}

- (BOOL)createAttrHeaderIfNeeded:(id *)a3
{
  fileHeader = self->_fileHeader;
  if (fileHeader->var3 != 2) {
    return 1;
  }
  finderinfo = self->_finderinfo;
  if (*(_OWORD *)&self->_finderinfo != __PAIR128__((unint64_t)&fileHeader->var4[0].var2 + 2, (unint64_t)(&fileHeader->var3 + 1))|| finderinfo->var1 != 50|| finderinfo->var2 != 32|| !self->_isAllocateXattr)
  {
    return 1;
  }
  size_t v7 = 4064 - *(unsigned int *)((char *)&fileHeader->var4[0].var0 + 2);
  uint64_t v8 = [(NSMutableData *)self->_rawHeader bytes];
  uint64_t v9 = v8;
  rsrcfork = self->_rsrcfork;
  if (rsrcfork && (uint64_t var2 = rsrcfork->var2, var2))
  {
    if (![(AppleDoubleParser *)self shiftDataDownAtOffset:rsrcfork->var1 length:var2 delta:v7 error:a3])
    {
      uint64_t v18 = doubleagent_std_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser createAttrHeaderIfNeeded:]();
      }
      goto LABEL_21;
    }
    unint64_t v12 = self->_rsrcfork;
    uint64_t v13 = self->_fileHeader;
    size_t v14 = 120;
  }
  else
  {
    v7 -= 286;
    bzero((void *)(v8 + 82), v7);
    [(AppleDoubleParser *)self initEmptyResourceFork:(char *)self->_fileHeader + *(unsigned int *)((char *)&self->_fileHeader->var4[1].var0 + 2) + v7];
    uint64_t v13 = self->_fileHeader;
    unint64_t v12 = (apple_double_entry *)((char *)&v13->var4[0].var2 + 2);
    *(unsigned int *)((char *)&v13->var4[1].var1 + 2) = 286;
    self->_rsrcfork = (apple_double_entry *)((char *)&v13->var4[0].var2 + 2);
    size_t v14 = 4096;
  }
  self->_finderinfo->var2 += v7;
  v12->var1 += v7;
  *(void *)(v9 + 84) = 1096045650;
  *(_DWORD *)(v9 + 92) = *(unsigned int *)((char *)&v13->var4[1].var0 + 2);
  *(_DWORD *)(v9 + 96) = 120;
  *(void *)(v9 + 100) = 0;
  *(void *)(v9 + 108) = 0;
  *(_DWORD *)(v9 + 116) = 0;
  [(AppleDoubleParser *)self swapFileHeader];
  [(AppleDoubleParser *)self swapAttrHeader:v9];
  ssize_t v15 = pwrite(self->_fileDescriptor, (const void *)[(NSMutableData *)self->_rawHeader bytes], v14, 0);
  if (v15 == -1)
  {
    uint64_t v18 = doubleagent_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AppleDoubleParser createAttrHeaderIfNeeded:]();
    }
  }
  else
  {
    uint64_t v16 = v15;
    if (v15 == v14)
    {
      [(AppleDoubleParser *)self swapFileHeader];
      return 1;
    }
    uint64_t v18 = doubleagent_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(AppleDoubleParser *)v14 createAttrHeaderIfNeeded:v18];
    }
  }
LABEL_21:

  return 0;
}

- (AppleDoubleParser)initWithFileDescriptor:(int)a3 fileSize:(int64_t)a4 isAllocateXattr:(BOOL)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)AppleDoubleParser;
  uint64_t v8 = [(AppleDoubleParser *)&v33 init];
  uint64_t v9 = v8;
  if (!v8)
  {
    id v11 = 0;
LABEL_5:
    unint64_t v12 = v9;
    goto LABEL_34;
  }
  v8->_int fileDescriptor = a3;
  v8->_isAllocateXattr = a5;
  if (a4 < 0)
  {
    id v32 = 0;
    BOOL v13 = [(AppleDoubleParser *)v8 updateFileSize:&v32];
    id v14 = v32;
    id v11 = v14;
    if (!v13)
    {
      uint64_t v21 = doubleagent_std_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.7();
      }
      goto LABEL_33;
    }
    int8x16_t v10 = v14;
  }
  else
  {
    [(AppleDoubleParser *)v8 updateFileSizeExplicit:a4];
    int8x16_t v10 = 0;
  }
  if (v9->_fileSize)
  {
LABEL_9:
    id v30 = v10;
    BOOL v15 = [(AppleDoubleParser *)v9 readRawHeader:&v30];
    id v11 = v30;

    if (!v15)
    {
      uint64_t v21 = doubleagent_std_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.5();
      }
      goto LABEL_33;
    }
    id v29 = v11;
    BOOL v16 = [(AppleDoubleParser *)v9 parseFileHeader:&v29];
    id v17 = v29;

    if (v16)
    {
      id v28 = v17;
      BOOL v18 = [(AppleDoubleParser *)v9 parseFinderInfoAndResourceFork:&v28];
      id v11 = v28;

      if (!v18)
      {
        uint64_t v21 = doubleagent_std_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]();
        }
        goto LABEL_33;
      }
      id v27 = v11;
      BOOL v19 = [(AppleDoubleParser *)v9 createAttrHeaderIfNeeded:&v27];
      id v17 = v27;

      if (v19)
      {
        id v26 = v17;
        BOOL v20 = [(AppleDoubleParser *)v9 parseAttrHeader:&v26];
        id v11 = v26;

        if (!v20)
        {
          uint64_t v21 = doubleagent_std_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]();
          }
LABEL_33:

          unint64_t v12 = 0;
          goto LABEL_34;
        }
        goto LABEL_5;
      }
      unsigned int v23 = doubleagent_std_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]();
      }
    }
    else
    {
      unsigned int v23 = doubleagent_std_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.4();
      }
    }

    unint64_t v12 = 0;
    id v11 = v17;
    goto LABEL_34;
  }
  if (v9->_isAllocateXattr)
  {
    id v31 = v10;
    BOOL v22 = [(AppleDoubleParser *)v9 fillEmptyAppleDoubleFile:&v31];
    id v11 = v31;

    if (!v22)
    {
      uint64_t v21 = doubleagent_std_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:].cold.6();
      }
      goto LABEL_33;
    }
    int8x16_t v10 = v11;
    goto LABEL_9;
  }
  uint64_t v24 = doubleagent_std_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v35 = "-[AppleDoubleParser initWithFileDescriptor:fileSize:isAllocateXattr:]";
    _os_log_impl(&dword_24CF84000, v24, OS_LOG_TYPE_DEFAULT, "%s: Couldn't parse an empty AD file (isAllocateXattr = false).", buf, 0xCu);
  }

  unint64_t v12 = 0;
  id v11 = v10;
LABEL_34:

  return v12;
}

- (AppleDoubleParser)initWithFileDescriptor:(int)a3 isAllocateXattr:(BOOL)a4
{
  return [(AppleDoubleParser *)self initWithFileDescriptor:*(void *)&a3 fileSize:-1 isAllocateXattr:a4];
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(int)a3
{
  self->_int fileDescriptor = a3;
}

- (NSMutableData)rawHeader
{
  return (NSMutableData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRawHeader:(id)a3
{
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (unint64_t)headerSize
{
  return self->_headerSize;
}

- (void)setHeaderSize:(unint64_t)a3
{
  self->_headerSize = a3;
}

- (BOOL)emptyFinderInfo
{
  return self->_emptyFinderInfo;
}

- (void)setEmptyFinderInfo:(BOOL)a3
{
  self->_emptyFinderInfo = a3;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)isAllocateXattr
{
  return self->_isAllocateXattr;
}

- (void)setIsAllocateXattr:(BOOL)a3
{
  self->_isAllocateXattr = a3;
}

- (apple_double_header)fileHeader
{
  return self->_fileHeader;
}

- (void)setFileHeader:(apple_double_header *)a3
{
  self->_fileHeader = a3;
}

- (apple_double_entry)finderinfo
{
  return self->_finderinfo;
}

- (void)setFinderinfo:(apple_double_entry *)a3
{
  self->_finderinfo = a3;
}

- (apple_double_entry)rsrcfork
{
  return self->_rsrcfork;
}

- (void)setRsrcfork:(apple_double_entry *)a3
{
  self->_rsrcfork = a3;
}

- (attr_header)attrHeader
{
  return self->_attrHeader;
}

- (void)setAttrHeader:(attr_header *)a3
{
  self->_attrHeader = a3;
}

- (attr_entry)firstAttrEntry
{
  return self->_firstAttrEntry;
}

- (void)setFirstAttrEntry:(attr_entry *)a3
{
  self->_firstAttrEntry = a3;
}

- (void).cxx_destruct
{
}

- (void)allocateXattrNamed:sized:how:reply:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: Couldn't truncate the file. error = %s.", v3, v4, v5, v6, 2u);
}

- (void)allocateXattrNamed:sized:how:reply:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't write header to disk. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)allocateXattrNamed:sized:how:reply:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't update file size. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)allocateXattrNamed:(os_log_t)log sized:how:reply:.cold.4(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[AppleDoubleParser allocateXattrNamed:sized:how:reply:]";
  __int16 v3 = 1024;
  int v4 = 256;
  _os_log_error_impl(&dword_24CF84000, log, OS_LOG_TYPE_ERROR, "%s: Can't add any more xattrs, as we've reached the limit (%u).", (uint8_t *)&v1, 0x12u);
}

- (void)removeXattrNamed:reply:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: Couldn't truncate the file. error = %s.", v3, v4, v5, v6, 2u);
}

- (void)removeXattrNamed:reply:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't get file size. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)removeXattrNamed:(os_log_t)log reply:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AppleDoubleParser removeXattrNamed:reply:]";
  _os_log_error_impl(&dword_24CF84000, log, OS_LOG_TYPE_ERROR, "%s: Shouldn't reach here. Resource fork is not at EOF.", (uint8_t *)&v1, 0xCu);
}

- (void)removeXattrNamed:(os_log_t)log reply:.cold.4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AppleDoubleParser removeXattrNamed:reply:]";
  _os_log_error_impl(&dword_24CF84000, log, OS_LOG_TYPE_ERROR, "%s: There's no attribute header.", (uint8_t *)&v1, 0xCu);
}

- (void)shiftDataDownAtOffset:length:delta:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't get file size. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)shiftDataDownAtOffset:length:delta:error:.cold.2()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pread() failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)shiftDataDownAtOffset:length:delta:error:.cold.3()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pwrite() failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)shiftDataUpAtOffset:length:delta:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't get file size. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)shiftDataUpAtOffset:length:delta:error:.cold.2()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pread() failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)shiftDataUpAtOffset:length:delta:error:.cold.3()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pwrite() failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)fillEmptyAppleDoubleFile:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pwrite() failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)updateFileSize:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  int v3 = 136315394;
  uint64_t v4 = "-[AppleDoubleParser updateFileSize:]";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_24CF84000, a1, OS_LOG_TYPE_ERROR, "%s: fstat failed with error = %d", (uint8_t *)&v3, 0x12u);
}

- (void)readRawHeader:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readRawHeader:.cold.2()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pread() failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)writeHeaderToDiskUpToLength:error:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pwrite() failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)writeHeaderToDiskUpToLength:(os_log_t)log error:.cold.2(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[AppleDoubleParser writeHeaderToDiskUpToLength:error:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_24CF84000, log, OS_LOG_TYPE_ERROR, "%s: pwrite() short write expected %u got %zd", (uint8_t *)&v3, 0x1Cu);
}

- (void)parseFinderInfoAndResourceFork:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[AppleDoubleParser parseFinderInfoAndResourceFork:]";
  _os_log_error_impl(&dword_24CF84000, log, OS_LOG_TYPE_ERROR, "%s: The resource fork is not the last entry. Setting the file as 'readOnly'.", buf, 0xCu);
}

- (void)parseFinderInfoAndResourceFork:.cold.2()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pread() of rsrcfork failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)createAttrHeaderIfNeeded:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24CF84000, v1, v2, "%s: pwrite() failed with error = %s.", v3, v4, v5, v6, 2u);
}

- (void)createAttrHeaderIfNeeded:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[AppleDoubleParser createAttrHeaderIfNeeded:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_24CF84000, log, OS_LOG_TYPE_ERROR, "%s: pwrite() short write expected %zu got %zd.", (uint8_t *)&v3, 0x20u);
}

- (void)createAttrHeaderIfNeeded:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't push the resource fork further down the file. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't parse attr header. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't create attr header. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't parse finder info and resource fork. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't parse file header. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't read header. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't fill empty AD file. error = %@.", v2, v3, v4, v5, 2u);
}

- (void)initWithFileDescriptor:fileSize:isAllocateXattr:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24CF84000, v0, v1, "%s: Couldn't get file size. error = %@.", v2, v3, v4, v5, 2u);
}

@end