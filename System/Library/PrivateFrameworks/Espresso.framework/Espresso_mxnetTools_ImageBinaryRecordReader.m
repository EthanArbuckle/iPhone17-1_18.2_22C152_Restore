@interface Espresso_mxnetTools_ImageBinaryRecordReader
- (BOOL)nextRecordAndError:(id *)a3;
- (BOOL)seekRecordWithID:(_mxnetTools_imageID_t_ *)a3 error:(id *)a4;
- (Espresso_mxnetTools_ImageBinaryRecordReader)initWithRecFile:(id)a3 error:(id *)a4;
- (NSFileHandle)recFileHandle;
- (NSMutableArray)labelsPrivate;
- (_mxnetTools_imageHeader_t_)imageHeader;
- (_mxnetTools_imageID_t_)imageID;
- (_mxnetTools_recordHeader_t_)recordHeader;
- (id)imageData;
- (id)labels;
- (unint64_t)currentOffset;
- (void)setCurrentOffset:(unint64_t)a3;
- (void)setImageHeader:(_mxnetTools_imageHeader_t_ *)a3;
- (void)setLabelsPrivate:(id)a3;
- (void)setRecFileHandle:(id)a3;
- (void)setRecordHeader:(_mxnetTools_recordHeader_t_)a3;
@end

@implementation Espresso_mxnetTools_ImageBinaryRecordReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsPrivate, 0);

  objc_storeStrong((id *)&self->_recFileHandle, 0);
}

- (void)setLabelsPrivate:(id)a3
{
}

- (NSMutableArray)labelsPrivate
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentOffset:(unint64_t)a3
{
  self->_currentOffset = a3;
}

- (unint64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setImageHeader:(_mxnetTools_imageHeader_t_ *)a3
{
}

- (_mxnetTools_imageHeader_t_)imageHeader
{
  objc_copyStruct(retstr, &self->_imageHeader, 24, 1, 0);
  return result;
}

- (void)setRecordHeader:(_mxnetTools_recordHeader_t_)a3
{
  _mxnetTools_recordHeader_t_ src = a3;
  objc_copyStruct(&self->_recordHeader, &src, 8, 1, 0);
}

- (_mxnetTools_recordHeader_t_)recordHeader
{
  objc_copyStruct(&dest, &self->_recordHeader, 8, 1, 0);
  return dest;
}

- (void)setRecFileHandle:(id)a3
{
}

- (NSFileHandle)recFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (_mxnetTools_imageID_t_)imageID
{
  [(Espresso_mxnetTools_ImageBinaryRecordReader *)self imageHeader];
  unint64_t v3 = v7;
  [(Espresso_mxnetTools_ImageBinaryRecordReader *)self imageHeader];
  unint64_t v4 = v6;
  unint64_t v5 = v3;
  result.ID[1] = v4;
  result.ID[0] = v5;
  return result;
}

- (id)labels
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [(Espresso_mxnetTools_ImageBinaryRecordReader *)self imageHeader];
  if (v9)
  {
    unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_labelsPrivate];
  }
  else
  {
    unint64_t v4 = NSNumber;
    [(Espresso_mxnetTools_ImageBinaryRecordReader *)self imageHeader];
    LODWORD(v5) = v8;
    unint64_t v6 = [v4 numberWithFloat:v5];
    v10[0] = v6;
    unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }

  return v3;
}

- (id)imageData
{
  unint64_t v3 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
  uint64_t v4 = [v3 offsetInFile];

  [(Espresso_mxnetTools_ImageBinaryRecordReader *)self imageHeader];
  if (v13)
  {
    [(Espresso_mxnetTools_ImageBinaryRecordReader *)self imageHeader];
    uint64_t v5 = 4 * v12 + 32;
  }
  else
  {
    uint64_t v5 = 32;
  }
  unint64_t v6 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
  objc_msgSend(v6, "seekToFileOffset:", v5 + -[Espresso_mxnetTools_ImageBinaryRecordReader currentOffset](self, "currentOffset"));

  unint64_t v7 = ((unint64_t)[(Espresso_mxnetTools_ImageBinaryRecordReader *)self recordHeader] >> 32) & 0xFFFFFFFF9FFFFFFFLL;
  int v8 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
  int v9 = [v8 readDataOfLength:v7];

  v10 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
  [v10 seekToFileOffset:v4];

  return v9;
}

- (BOOL)nextRecordAndError:(id *)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  unint64_t v32 = 0;
  _mxnetTools_recordHeader_t_ v33 = 0;
  long long v31 = 0uLL;
  do
  {
    uint64_t v5 = (void *)MEMORY[0x192FF2020](self, a2);
    unint64_t v6 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
    unint64_t v7 = [v6 readDataOfLength:8];

    if (![v7 length]) {
      goto LABEL_12;
    }
    [v7 getBytes:&v33 length:8];
  }
  while (v33.magic != -824761590);
  int v8 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
  -[Espresso_mxnetTools_ImageBinaryRecordReader setCurrentOffset:](self, "setCurrentOffset:", [v8 offsetInFile] - 8);

  uint64_t v5 = (void *)MEMORY[0x192FF2020]();
  int v9 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
  unint64_t v7 = [v9 readDataOfLength:24];

  if (![v7 length])
  {
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  [v7 getBytes:&v31 length:24];
  *(_OWORD *)&self->_imageHeader.uint64_t flag = v31;
  self->_imageHeader.imageID.ID[1] = v32;
  self->_recordHeader = v33;
  uint64_t flag = self->_imageHeader.flag;
  if (flag)
  {
    v11 = (int *)malloc_type_malloc(4 * flag, 0x3225ABAFuLL);
    BOOL v12 = v11 != 0;
    if (!v11)
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28798];
      uint64_t v28 = *__error();
      uint64_t v34 = *MEMORY[0x1E4F28568];
      int v13 = objc_msgSend(NSString, "stringWithFormat:", @"cannot allocate memory for labels (%ld bytes)", 4 * flag);
      v35[0] = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      *a3 = [v30 errorWithDomain:v29 code:v28 userInfo:v14];
    }
    if (!*a3)
    {
      v15 = (void *)MEMORY[0x192FF2020]();
      v16 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
      v17 = [v16 readDataOfLength:4 * flag];

      [v17 getBytes:v11 length:4 * flag];
      v18 = [MEMORY[0x1E4F1CA48] array];
      labelsPrivate = self->_labelsPrivate;
      self->_labelsPrivate = v18;

      v21 = v11;
      do
      {
        v22 = self->_labelsPrivate;
        int v23 = *v21++;
        LODWORD(v20) = v23;
        v24 = [NSNumber numberWithFloat:v20];
        [(NSMutableArray *)v22 addObject:v24];

        --flag;
      }
      while (flag);
    }
    free(v11);
  }
  else
  {
    BOOL v12 = 1;
  }
LABEL_13:

  uint64_t v25 = (v33.lrecord + 3) & 0xFFFFFFFC;
  v26 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
  objc_msgSend(v26, "seekToFileOffset:", v25 + -[Espresso_mxnetTools_ImageBinaryRecordReader currentOffset](self, "currentOffset") + 8);

  return v12;
}

- (BOOL)seekRecordWithID:(_mxnetTools_imageID_t_ *)a3 error:(id *)a4
{
  *a4 = 0;
  [(Espresso_mxnetTools_ImageBinaryRecordReader *)self setCurrentOffset:0];
  unint64_t v7 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self recFileHandle];
  objc_msgSend(v7, "seekToFileOffset:", -[Espresso_mxnetTools_ImageBinaryRecordReader currentOffset](self, "currentOffset"));

  BOOL v8 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)self nextRecordAndError:a4];
  if (v8)
  {
    while (1)
    {
      if (!*a4)
      {
        [(Espresso_mxnetTools_ImageBinaryRecordReader *)self imageHeader];
        if (v11 == a3->ID[0])
        {
          [(Espresso_mxnetTools_ImageBinaryRecordReader *)self imageHeader];
          if (v10 == a3->ID[1]) {
            break;
          }
        }
      }
      if (![(Espresso_mxnetTools_ImageBinaryRecordReader *)self nextRecordAndError:a4])
      {
        LOBYTE(v8) = 0;
        return v8;
      }
    }
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (Espresso_mxnetTools_ImageBinaryRecordReader)initWithRecFile:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)Espresso_mxnetTools_ImageBinaryRecordReader;
  unint64_t v7 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)&v20 init];
  if (v7)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([(id)v8 fileExistsAtPath:v6])
    {
      uint64_t v9 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:v6];
      recFileHandle = v7->_recFileHandle;
      v7->_recFileHandle = (NSFileHandle *)v9;

      v7->_recordHeader = 0;
      v7->_currentOffset = 0;
      *(void *)&v7->_imageHeader.uint64_t flag = 0x7FC00000FFFFFFFFLL;
      v7->_imageHeader.imageID.ID[0] = -1;
      v7->_imageHeader.imageID.ID[1] = -1;
      labelsPrivate = v7->_labelsPrivate;
      v7->_labelsPrivate = 0;

      BOOL v12 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)v7 nextRecordAndError:a4];
      if (a4 || v12) {
        goto LABEL_9;
      }
      unint64_t v7 = (Espresso_mxnetTools_ImageBinaryRecordReader *)MEMORY[0x1E4F28C58];
      a4 = (id *)*MEMORY[0x1E4F28798];
      uint64_t v8 = *__error();
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v22 = [NSString stringWithFormat:@"cannot initialize rec file %@", v6];
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v13 = [(Espresso_mxnetTools_ImageBinaryRecordReader *)v7 errorWithDomain:a4 code:v8 userInfo:objc_claimAutoreleasedReturnValue()];
      __break(1u);
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    uint64_t v16 = *__error();
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v17 = [NSString stringWithFormat:@"rec file %@ does not exist", v6];
    v24[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a4 = [v14 errorWithDomain:v15 code:v16 userInfo:v18];

LABEL_9:
  }

  return v7;
}

@end