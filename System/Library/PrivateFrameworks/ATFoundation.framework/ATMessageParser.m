@interface ATMessageParser
- (ATMessageParser)initWithMessageClass:(Class)a3;
- (BOOL)_parseObjectFromData:(id)a3;
- (BOOL)_parseObjectLength:(const char *)a3 length:(unint64_t)a4 bytesConsumed:(unint64_t *)a5;
- (BOOL)processData:(const char *)a3 length:(int64_t)a4;
- (Class)messageClass;
- (NSError)parserError;
- (id)objectParsedBlock;
- (void)dealloc;
- (void)setObjectParsedBlock:(id)a3;
@end

@implementation ATMessageParser

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectParsedBlock, 0);
  objc_storeStrong((id *)&self->_messageClass, 0);
  objc_storeStrong((id *)&self->_parserError, 0);

  objc_storeStrong((id *)&self->_parserData, 0);
}

- (void)setObjectParsedBlock:(id)a3
{
}

- (id)objectParsedBlock
{
  return self->_objectParsedBlock;
}

- (Class)messageClass
{
  return self->_messageClass;
}

- (NSError)parserError
{
  return self->_parserError;
}

- (BOOL)processData:(const char *)a3 length:(int64_t)a4
{
  if (a4 >= 1)
  {
    size_t v5 = a4;
    unint64_t v7 = 0;
    v8 = 0;
    p_curObjectLength = &self->_curObjectLength;
    while (1)
    {
      size_t v10 = *p_curObjectLength;
      if (*p_curObjectLength)
      {
        int VarIntBuf = 1;
      }
      else
      {
        size_t varIntDataLen = self->_varIntDataLen;
        if (10 - varIntDataLen >= v5 - v7) {
          size_t v13 = v5 - v7;
        }
        else {
          size_t v13 = 10 - varIntDataLen;
        }
        memcpy(&self->_varIntBuf[varIntDataLen], &a3[v7], v13);
        unint64_t v14 = self->_varIntDataLen + v13;
        self->_size_t varIntDataLen = v14;
        if (v14 == 10)
        {
          unint64_t v33 = 0;
          size_t v34 = 0;
          int VarIntBuf = PBReaderReadVarIntBuf();
          if (VarIntBuf)
          {
            unint64_t *p_curObjectLength = v33;
            if (v34 >= varIntDataLen)
            {
              unint64_t v7 = v7 - varIntDataLen + v34;
            }
            else
            {
              if (v7)
              {
                v26 = [MEMORY[0x1E4F28B00] currentHandler];
                objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ATMessageParser.m", 115, @"detected partial varIntBuffer but readOffset=%d (expected 0)", v7);
              }
              v8 = (char *)malloc_type_malloc(varIntDataLen + v5, 0xAA8BCA9uLL);
              memcpy(v8, self->_varIntBuf, varIntDataLen);
              memcpy(&v8[varIntDataLen], a3, v5);
              unint64_t v7 = v34;
              v5 += varIntDataLen;
              a3 = v8;
            }
          }
          else
          {
            v15 = +[ATInternalError errorWithCode:1 format:@"Couldn't read the size of the next object from the server"];
            parserError = self->_parserError;
            self->_parserError = v15;

            v17 = _ATLogCategoryFramework();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D9BC7000, v17, OS_LOG_TYPE_ERROR, "Couldn't read length from input stream", buf, 2u);
            }
          }
          self->_size_t varIntDataLen = 0;
        }
        else
        {
          v7 += v13;
          int VarIntBuf = 1;
        }
        size_t v10 = *p_curObjectLength;
        if (!*p_curObjectLength) {
          goto LABEL_31;
        }
      }
      size_t v18 = v5 - v7;
      objectDataBuffer = (char *)self->_objectDataBuffer;
      if (objectDataBuffer)
      {
        unint64_t objectDataLen = self->_objectDataLen;
        if (v18 >= v10 - objectDataLen) {
          size_t v18 = v10 - objectDataLen;
        }
        memcpy(&objectDataBuffer[objectDataLen], &a3[v7], v18);
        unint64_t v21 = self->_objectDataLen + v18;
        self->_unint64_t objectDataLen = v21;
        if (v21 == self->_curObjectLength)
        {
          v22 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", self->_objectDataBuffer);
          int VarIntBuf = [(ATMessageParser *)self _parseObjectFromData:v22];
          free(self->_objectDataBuffer);
          unint64_t *p_curObjectLength = 0;
          self->_objectDataBuffer = 0;
        }
        v7 += v18;
      }
      else if (v18 >= v10)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", &a3[v7]);
        int VarIntBuf = [(ATMessageParser *)self _parseObjectFromData:v24];
        v7 += self->_curObjectLength;
        self->_curObjectLength = 0;
      }
      else
      {
        v23 = malloc_type_malloc(v10, 0x7C148DAFuLL);
        self->_objectDataBuffer = v23;
        if (!v23)
        {
          LOBYTE(VarIntBuf) = 0;
LABEL_40:
          if (v8) {
            free(v8);
          }
          return VarIntBuf;
        }
        memcpy(v23, &a3[v7], v5 - v7);
        self->_unint64_t objectDataLen = v18;
        unint64_t v7 = v5;
      }
LABEL_31:
      if (VarIntBuf) {
        BOOL v25 = v5 - 1 >= v7;
      }
      else {
        BOOL v25 = 0;
      }
      if (!v25) {
        goto LABEL_40;
      }
    }
  }
  v27 = self->_objectDataBuffer;
  if (!v27)
  {
    LOBYTE(VarIntBuf) = 0;
    return VarIntBuf;
  }
  v28 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v27 length:self->_curObjectLength freeWhenDone:0];
  BOOL v29 = [(ATMessageParser *)self _parseObjectFromData:v28];
  self->_curObjectLength = 0;
  self->_objectDataBuffer = 0;

  return v29;
}

- (BOOL)_parseObjectLength:(const char *)a3 length:(unint64_t)a4 bytesConsumed:(unint64_t *)a5
{
  unint64_t varIntDataLen = self->_varIntDataLen;
  if (10 - varIntDataLen >= a4) {
    size_t v8 = a4;
  }
  else {
    size_t v8 = 10 - varIntDataLen;
  }
  memcpy(&self->_varIntBuf[varIntDataLen], a3, v8);
  unint64_t v9 = self->_varIntDataLen + v8;
  self->_unint64_t varIntDataLen = v9;
  if (v9 == 10)
  {
    int VarIntBuf = PBReaderReadVarIntBuf();
    if (VarIntBuf)
    {
      *a5 = -(uint64_t)varIntDataLen;
      self->_curObjectLength = 0;
    }
    self->_unint64_t varIntDataLen = 0;
  }
  else
  {
    *a5 = v8;
    LOBYTE(VarIntBuf) = 1;
  }
  return VarIntBuf;
}

- (BOOL)_parseObjectFromData:(id)a3
{
  size_t v5 = (objc_class *)MEMORY[0x1E4F94090];
  id v6 = a3;
  unint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

  if (![(ATMessageParser *)self messageClass])
  {
    size_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"ATMessageParser.m", 40, @"You can't use %@ without setting a message class", v15 object file lineNumber description];
  }
  id v8 = objc_alloc_init([(ATMessageParser *)self messageClass]);
  int v9 = [v8 readFrom:v7];
  if (v9)
  {
    objectParsedBlock = (void (**)(id, id))self->_objectParsedBlock;
    if (objectParsedBlock) {
      objectParsedBlock[2](objectParsedBlock, v8);
    }
  }
  else
  {
    v11 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BC7000, v11, OS_LOG_TYPE_ERROR, "Error parsing message", buf, 2u);
    }
  }
  return v9;
}

- (void)dealloc
{
  objectDataBuffer = self->_objectDataBuffer;
  if (objectDataBuffer) {
    free(objectDataBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)ATMessageParser;
  [(ATMessageParser *)&v4 dealloc];
}

- (ATMessageParser)initWithMessageClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ATMessageParser;
  objc_super v4 = [(ATMessageParser *)&v7 init];
  size_t v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_messageClass, a3);
  }
  return v5;
}

@end