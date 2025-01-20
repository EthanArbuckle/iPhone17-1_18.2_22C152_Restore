@interface StoreImporterQueueCoding
- (BOOL)isDataAvailable;
- (BOOL)isDirty;
- (id)initAllowDenseCoding:(BOOL)a3;
- (int)popCommand:(id *)a3;
- (unint64_t)flushWithBlock:(id)a3;
- (unint64_t)pushCommand:(id *)a3 block:(id)a4;
- (unint64_t)rawDecode:(char *)a3 availableLength:(unint64_t)a4 block:(id)a5;
- (void)dealloc;
- (void)popBackToRecordedPushMarker;
- (void)recordPushMarker;
- (void)resetDecode;
- (void)resetEncode;
- (void)resetRawDecode;
@end

@implementation StoreImporterQueueCoding

- (id)initAllowDenseCoding:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)StoreImporterQueueCoding;
  v4 = [(StoreImporterQueueCoding *)&v6 init];
  if (v4)
  {
    v4->_rawQueue = (SQueue *)sub_100007F50(65000);
    v4->_allowDenseCoding = a3;
  }
  return v4;
}

- (void)dealloc
{
  sub_100007FA0((uint64_t)self->_rawQueue);
  v3.receiver = self;
  v3.super_class = (Class)StoreImporterQueueCoding;
  [(StoreImporterQueueCoding *)&v3 dealloc];
}

- (void)recordPushMarker
{
  self->_recordPushMarker = 1;
  self->_pushMarker = 0;
  long long v2 = *(_OWORD *)&self->_encodeState.uidCache[1];
  *(_OWORD *)&self->_pushEncodingState.previousOid = *(_OWORD *)&self->_encodeState.previousOid;
  *(_OWORD *)&self->_pushEncodingState.uidCache[1] = v2;
  *(_OWORD *)&self->_pushEncodingState.gidCache[1] = *(_OWORD *)&self->_encodeState.gidCache[1];
  self->_pushEncodingState.runLengthDirectoryMask = self->_encodeState.runLengthDirectoryMask;
}

- (void)popBackToRecordedPushMarker
{
  pushMarker = self->_pushMarker;
  if (pushMarker)
  {
    sub_100008608(self->_rawQueue, (unint64_t)pushMarker);
    self->_pushMarker = 0;
  }
  long long v4 = *(_OWORD *)&self->_pushEncodingState.uidCache[1];
  *(_OWORD *)&self->_encodeState.previousOid = *(_OWORD *)&self->_pushEncodingState.previousOid;
  *(_OWORD *)&self->_encodeState.uidCache[1] = v4;
  *(_OWORD *)&self->_encodeState.gidCache[1] = *(_OWORD *)&self->_pushEncodingState.gidCache[1];
  self->_encodeState.runLengthDirectoryMask = self->_pushEncodingState.runLengthDirectoryMask;
}

- (unint64_t)pushCommand:(id *)a3 block:(id)a4
{
  unint64_t var8 = a3->var8;
  if (a3->var0) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = var8 == 0;
  }
  if (v5) {
    return -1;
  }
  rawQueue = self->_rawQueue;
  if (var8) {
    unint64_t v10 = var8 + 21;
  }
  else {
    unint64_t v10 = 19;
  }
  v11 = sub_1000082D4((uint64_t)rawQueue, v10);
  v12 = v11;
  if (self->_recordPushMarker)
  {
    self->_pushMarker = v11;
    self->_recordPushMarker = 0;
  }
  if (!a3->var0)
  {
    int runLength = self->_encodeState.runLength;
    if (runLength < 1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      *(unsigned char *)v11 = LODWORD(self->_encodeState.runLengthDirectoryMask) + 16 * runLength - 16;
      self->_encodeState.int runLength = 0;
      self->_encodeState.runLengthDirectoryMask = 0;
      uint64_t v16 = 1;
    }
    v37 = (char *)v11 + v16;
    unint64_t v38 = a3->var8;
    char v39 = v38 - 1;
    unint64_t v40 = (v38 + 4095) & 0xFFF;
    if (v40 > 0x1F)
    {
      LODWORD(v38) = (v40 >> 8) | 0xFFFFFFE0;
      v41 = v37 + 2;
      v37[1] = v39;
    }
    else
    {
      LOBYTE(v38) = v38 - 65;
      v41 = v37 + 1;
    }
    unsigned char *v37 = v38;
    memcpy(v41, a3->var9, v40 + 1);
    unint64_t v42 = a3->var8;
    v23 = &v41[v42];
    if (v42 == 1 && !a3->var9[0])
    {
      self->_encodeState.runLengthDirectoryMask = 0;
      *(_OWORD *)&self->_encodeState.uidCache[1] = 0u;
      *(_OWORD *)&self->_encodeState.gidCache[1] = 0u;
      *(_OWORD *)&self->_encodeState.previousOid = 0u;
    }
    goto LABEL_79;
  }
  BOOL v13 = a3->var2 == self->_encodeState.uidCache[0] && a3->var3 == self->_encodeState.gidCache[0];
  int64_t v17 = a3->var1 - self->_encodeState.previousOid;
  if (self->_allowDenseCoding)
  {
    if (v17 <= 0) {
      BOOL v13 = 0;
    }
    if (v13 && v17 <= 8 && !a3->var8)
    {
      int var4 = a3->var4;
      if (var4 <= 1 && !a3->var5)
      {
        if ((unint64_t)v17 < 2)
        {
          unint64_t v53 = (var4 == 1) | (2 * self->_encodeState.runLengthDirectoryMask);
          self->_encodeState.runLengthDirectoryMask = v53;
          int v54 = self->_encodeState.runLength + 1;
          self->_encodeState.int runLength = v54;
          v23 = (char *)v11;
          if (v54 == 4)
          {
            *(unsigned char *)v11 = v53 + 48;
            v23 = (char *)v11 + 1;
            self->_encodeState.int runLength = 0;
            self->_encodeState.runLengthDirectoryMask = 0;
          }
        }
        else
        {
          int v51 = self->_encodeState.runLength;
          if (v51 < 1)
          {
            uint64_t v52 = 0;
          }
          else
          {
            *(unsigned char *)v11 = LODWORD(self->_encodeState.runLengthDirectoryMask) + 16 * v51 - 16;
            self->_encodeState.int runLength = 0;
            self->_encodeState.runLengthDirectoryMask = 0;
            int var4 = a3->var4;
            uint64_t v52 = 1;
          }
          *((unsigned char *)v11 + v52) = ((var4 == 1) | (2 * v17)) - 2;
          v23 = (char *)v11 + v52 + 1;
        }
        goto LABEL_78;
      }
    }
  }
  int v20 = self->_encodeState.runLength;
  if (v20 < 1)
  {
    uint64_t v21 = 0;
  }
  else
  {
    *(unsigned char *)v11 = LODWORD(self->_encodeState.runLengthDirectoryMask) + 16 * v20 - 16;
    self->_encodeState.int runLength = 0;
    self->_encodeState.runLengthDirectoryMask = 0;
    uint64_t v21 = 1;
  }
  v22 = (char *)v11 + v21;
  v23 = (char *)v11 + v21 + 2;
  unint64_t v24 = a3->var8;
  char v25 = v24 - 1;
  unint64_t v26 = (v24 + 4095) & 0xFFF;
  if (v24)
  {
    if (v26 >= 0x80)
    {
      v23 = v22 + 3;
      v22[2] = BYTE1(v26) | 0x80;
      uint64_t v27 = 4;
    }
    else
    {
      uint64_t v27 = 3;
    }
    char *v23 = v25;
    v23 = &v22[v27];
    int v28 = 128;
  }
  else
  {
    int v28 = 64;
  }
  if ((unint64_t)(v17 + 8) > 0x3F)
  {
    unint64_t v30 = v17 + 512;
    if ((unint64_t)(v17 + 512) > 0xFFF)
    {
      if ((unint64_t)(v17 + 0x4000) >> 16)
      {
        unint64_t var1 = a3->var1;
        int v49 = (16 * a3->var4) | (4 * a3->var5) | v28;
        if (HIDWORD(var1))
        {
          LOBYTE(v32) = v49 | 3;
          *(void *)v23 = var1;
          v23 += 8;
        }
        else
        {
          LOBYTE(v32) = v49 | 2;
          *(_DWORD *)v23 = var1;
          v23 += 4;
        }
        goto LABEL_48;
      }
      int var5 = a3->var5;
      goto LABEL_47;
    }
  }
  else
  {
    int v29 = a3->var4;
    if (v29 <= 1 && !a3->var5)
    {
      char v50 = v28 | (32 * v29);
      if (v17 > 23)
      {
        LOBYTE(v32) = v50 | (v17 - 24);
        char v33 = 64;
      }
      else
      {
        char v33 = 0;
        LOBYTE(v32) = v50 | (v17 + 8);
      }
      goto LABEL_50;
    }
    unint64_t v30 = v17 + 512;
  }
  int var5 = a3->var5;
  if (var5)
  {
    if ((unint64_t)(v17 + 64) <= 0xFF)
    {
      int v32 = (16 * a3->var4) | (4 * var5) | v28;
      *v23++ = v17 + 64;
LABEL_48:
      char v33 = -64;
      goto LABEL_50;
    }
LABEL_47:
    int v32 = (16 * a3->var4) | (4 * var5) | v28 | 1;
    *(_WORD *)v23 = v17 + 0x4000;
    v23 += 2;
    goto LABEL_48;
  }
  int v32 = (v30 >> 8) | (16 * a3->var4) | v28;
  *v23++ = v17;
  char v33 = 0x80;
LABEL_50:
  int v34 = sub_100021F20((uint64_t)self->_encodeState.uidCache, a3->var2);
  if (v34 != -1)
  {
    char v35 = v34;
    goto LABEL_67;
  }
  unsigned int var2 = a3->var2;
  if (var2 == -2) {
    unsigned int var2 = 0;
  }
  if (var2 > 0xFF)
  {
    if (var2 > 0x1FF)
    {
      if (HIWORD(var2))
      {
        *(_DWORD *)v23 = var2;
        char v35 = 7;
        uint64_t v43 = 4;
      }
      else
      {
        *(_WORD *)v23 = var2;
        char v35 = 6;
        uint64_t v43 = 2;
      }
      goto LABEL_66;
    }
    char *v23 = var2;
    char v35 = 5;
  }
  else
  {
    char *v23 = var2;
    char v35 = 4;
  }
  uint64_t v43 = 1;
LABEL_66:
  v23 += v43;
LABEL_67:
  int v44 = sub_100021F20((uint64_t)self->_encodeState.gidCache, a3->var3);
  if (v44 != -1) {
    goto LABEL_76;
  }
  unsigned int var3 = a3->var3;
  if (var3 == -2) {
    unsigned int var3 = 0;
  }
  if (var3 > 0xFF)
  {
    if (var3 > 0x1FF)
    {
      if (HIWORD(var3))
      {
        *(_DWORD *)v23 = var3;
        LOBYTE(v44) = 7;
        uint64_t v46 = 4;
      }
      else
      {
        *(_WORD *)v23 = var3;
        LOBYTE(v44) = 6;
        uint64_t v46 = 2;
      }
      goto LABEL_75;
    }
    char *v23 = var3;
    LOBYTE(v44) = 5;
  }
  else
  {
    char *v23 = var3;
    LOBYTE(v44) = 4;
  }
  uint64_t v46 = 1;
LABEL_75:
  v23 += v46;
LABEL_76:
  unsigned char *v22 = v32;
  v22[1] = v33 + 8 * v35 + v44;
  if (a3->var8)
  {
    memcpy(v23, a3->var9, v26 + 1);
    v23 += a3->var8;
  }
LABEL_78:
  self->_encodeState.previousOid = a3->var1;
LABEL_79:
  unint64_t v14 = v23 - v12;
  if (v23 != v12)
  {
    if (a4) {
      (*((void (**)(id, unsigned char *, int64_t))a4 + 2))(a4, v12, v23 - v12);
    }
    sub_1000083EC(self->_rawQueue, v23 - v12);
  }
  return v14;
}

- (BOOL)isDirty
{
  return self->_encodeState.runLength > 0;
}

- (unint64_t)flushWithBlock:(id)a3
{
  if (self->_encodeState.runLength < 1) {
    return 0;
  }
  BOOL v5 = sub_1000082D4((uint64_t)self->_rawQueue, 1uLL);
  if (self->_recordPushMarker)
  {
    self->_pushMarker = v5;
    self->_recordPushMarker = 0;
  }
  int runLength = self->_encodeState.runLength;
  if (runLength < 1) {
    return 0;
  }
  *(unsigned char *)BOOL v5 = LOBYTE(self->_encodeState.runLengthDirectoryMask) + 16 * runLength - 16;
  self->_encodeState.int runLength = 0;
  self->_encodeState.runLengthDirectoryMask = 0;
  if (a3) {
    (*((void (**)(id, void *, uint64_t))a3 + 2))(a3, v5, 1);
  }
  rawQueue = self->_rawQueue;
  unint64_t v8 = 1;
  sub_1000083EC(rawQueue, 1);
  return v8;
}

- (BOOL)isDataAvailable
{
  if (self->_decodeState.runLength > 0) {
    return 1;
  }
  uint64_t v3 = 0;
  sub_100008014((uint64_t)self->_rawQueue, &v3);
  return v3 != 0;
}

- (int)popCommand:(id *)a3
{
  uint64_t v9 = 0;
  BOOL v5 = (void *)sub_100008014((uint64_t)self->_rawQueue, &v9);
  if (self->_recordPushMarker)
  {
    self->_pushMarker = v5;
    self->_recordPushMarker = 0;
  }
  if (self->_decodeState.runLength <= 0 && v9 == 0) {
    return 0;
  }
  int64_t v7 = sub_100022120((uint64_t)v5, v9, (uint64_t)&self->_decodeState, (uint64_t)a3);
  if (v7 < 1)
  {
    if (v7) {
      return -1;
    }
    else {
      return 1;
    }
  }
  else
  {
    sub_100008044(self->_rawQueue, v7);
    return 1;
  }
}

- (void)resetEncode
{
  self->_encodeState.runLengthDirectoryMask = 0;
  *(_OWORD *)&self->_encodeState.uidCache[1] = 0u;
  *(_OWORD *)&self->_encodeState.gidCache[1] = 0u;
  *(_OWORD *)&self->_encodeState.previousOid = 0u;
}

- (void)resetDecode
{
  self->_decodeState.runLengthDirectoryMask = 0;
  *(_OWORD *)&self->_decodeState.gidCache[1] = 0u;
  *(_OWORD *)&self->_decodeState.uidCache[1] = 0u;
  *(_OWORD *)&self->_decodeState.previousOid = 0u;
}

- (void)resetRawDecode
{
  self->_rawDecodeState.runLengthDirectoryMask = 0;
  *(_OWORD *)&self->_rawDecodeState.uidCache[1] = 0u;
  *(_OWORD *)&self->_rawDecodeState.gidCache[1] = 0u;
  *(_OWORD *)&self->_rawDecodeState.previousOid = 0u;
}

- (unint64_t)rawDecode:(char *)a3 availableLength:(unint64_t)a4 block:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000225F8;
  v6[3] = &unk_100035C98;
  v6[4] = self;
  v6[5] = a5;
  return sub_100022484((uint64_t)a3, a4, (uint64_t)&self->_rawDecodeState, (uint64_t)v6, (uint64_t)a5);
}

@end