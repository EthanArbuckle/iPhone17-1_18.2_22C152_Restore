@interface DEMultipartReader
+ (id)getEndOfMessageData;
+ (id)getEndOfPartData;
- (BOOL)endOfMessage;
- (BOOL)endOfPart;
- (BOOL)nextPart;
- (DEMultipartReader)init;
- (DEMultipartReader)initWithReader:(id)a3;
- (DERewindableReader)reader;
- (NSData)endOfMessageData;
- (NSData)endOfPartData;
- (NSData)nextPartData;
- (NSMutableData)searchBuffer;
- (id)internalReadDataOfLength:(unint64_t)a3;
- (id)readData;
- (id)readDataOfLength:(unint64_t)a3;
- (unint64_t)getAvailableLength;
- (unint64_t)maxEndSize;
- (void)close;
- (void)dealloc;
- (void)searchForEnd;
- (void)setEndOfMessage:(BOOL)a3;
- (void)setEndOfMessageData:(id)a3;
- (void)setEndOfPart:(BOOL)a3;
- (void)setEndOfPartData:(id)a3;
- (void)setMaxEndSize:(unint64_t)a3;
- (void)setNextPartData:(id)a3;
- (void)setReader:(id)a3;
- (void)setSearchBuffer:(id)a3;
@end

@implementation DEMultipartReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endOfMessageData, 0);
  objc_storeStrong((id *)&self->_endOfPartData, 0);
  objc_storeStrong((id *)&self->_nextPartData, 0);
  objc_storeStrong((id *)&self->_searchBuffer, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setMaxEndSize:(unint64_t)a3
{
  self->_maxEndSize = a3;
}

- (unint64_t)maxEndSize
{
  return self->_maxEndSize;
}

- (void)setEndOfMessageData:(id)a3
{
}

- (NSData)endOfMessageData
{
  return self->_endOfMessageData;
}

- (void)setEndOfPartData:(id)a3
{
}

- (NSData)endOfPartData
{
  return self->_endOfPartData;
}

- (void)setEndOfMessage:(BOOL)a3
{
  self->_endOfMessage = a3;
}

- (BOOL)endOfMessage
{
  return self->_endOfMessage;
}

- (void)setEndOfPart:(BOOL)a3
{
  self->_endOfPart = a3;
}

- (BOOL)endOfPart
{
  return self->_endOfPart;
}

- (void)setNextPartData:(id)a3
{
}

- (NSData)nextPartData
{
  return self->_nextPartData;
}

- (void)setSearchBuffer:(id)a3
{
}

- (NSMutableData)searchBuffer
{
  return self->_searchBuffer;
}

- (void)setReader:(id)a3
{
}

- (DERewindableReader)reader
{
  return self->_reader;
}

- (BOOL)nextPart
{
  if (!self->_endOfPart || self->_endOfMessage) {
    return 0;
  }
  [(NSMutableData *)self->_searchBuffer setData:self->_nextPartData];
  nextPartData = self->_nextPartData;
  self->_nextPartData = 0;

  self->_endOfPart = 0;
  [(DEMultipartReader *)self searchForEnd];
  return 1;
}

- (id)readData
{
  v3 = objc_opt_new();
  uint64_t v4 = getpagesize();
  v5 = [(DEMultipartReader *)self readDataOfLength:v4];
  if (v5)
  {
    while ([v5 length])
    {
      [v3 appendData:v5];
      uint64_t v6 = [(DEMultipartReader *)self readDataOfLength:v4];

      v5 = (void *)v6;
      if (!v6) {
        goto LABEL_4;
      }
    }
    id v7 = v3;
  }
  else
  {
LABEL_4:
    id v7 = 0;
  }

  return v7;
}

- (id)readDataOfLength:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:");
  uint64_t v6 = -[DEMultipartReader internalReadDataOfLength:](self, "internalReadDataOfLength:", a3 - [v5 length]);
  if (v6)
  {
    while ([v6 length] && objc_msgSend(v5, "length") < a3)
    {
      [v5 appendData:v6];
      uint64_t v7 = -[DEMultipartReader internalReadDataOfLength:](self, "internalReadDataOfLength:", a3 - [v5 length]);

      uint64_t v6 = (void *)v7;
      if (!v7) {
        goto LABEL_5;
      }
    }
    id v8 = v5;
  }
  else
  {
LABEL_5:
    id v8 = 0;
  }

  return v8;
}

- (id)internalReadDataOfLength:(unint64_t)a3
{
  for (i = self; ![(DEMultipartReader *)self getAvailableLength] && !i->_endOfPart; self = i)
  {
    v5 = [(DERewindableReader *)i->_reader readDataOfLength:getpagesize() - [(NSMutableData *)i->_searchBuffer length]];
    if (!v5)
    {
      v10 = 0;
LABEL_16:
      +[DELog error:@"Failed to read from multipart file"];
      v9 = 0;
      goto LABEL_11;
    }
    uint64_t v6 = v5;
    if (![v5 length])
    {
      v10 = v6;
      goto LABEL_16;
    }
    [(NSMutableData *)i->_searchBuffer appendData:v6];
    [(DEMultipartReader *)i searchForEnd];
  }
  unint64_t v7 = [(DEMultipartReader *)i getAvailableLength];
  if (v7 >= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7;
  }
  v9 = -[NSMutableData subdataWithRange:](i->_searchBuffer, "subdataWithRange:", 0, v8);
  v10 = -[NSMutableData subdataWithRange:](i->_searchBuffer, "subdataWithRange:", [v9 length], -[NSMutableData length](i->_searchBuffer, "length") - objc_msgSend(v9, "length"));
  [(NSMutableData *)i->_searchBuffer setData:v10];
LABEL_11:

  return v9;
}

- (unint64_t)getAvailableLength
{
  unint64_t result = [(NSMutableData *)self->_searchBuffer length];
  if (!self->_endOfPart)
  {
    unint64_t maxEndSize = self->_maxEndSize;
    BOOL v5 = result >= maxEndSize;
    unint64_t v6 = result - maxEndSize;
    if (v5) {
      return v6;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)searchForEnd
{
  uint64_t v3 = -[NSMutableData rangeOfData:options:range:](self->_searchBuffer, "rangeOfData:options:range:", self->_endOfPartData, 0, 0, [(NSMutableData *)self->_searchBuffer length]);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL || v4 != 0)
  {
    uint64_t v6 = v3;
    self->_endOfPart = 1;
    -[NSMutableData subdataWithRange:](self->_searchBuffer, "subdataWithRange:", v3 + v4, [(NSMutableData *)self->_searchBuffer length] - (v3 + v4));
    unint64_t v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    nextPartData = self->_nextPartData;
    self->_nextPartData = v7;

    -[NSMutableData subdataWithRange:](self->_searchBuffer, "subdataWithRange:", 0, v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableData setData:](self->_searchBuffer, "setData:");
LABEL_11:

    return;
  }
  uint64_t v9 = -[NSMutableData rangeOfData:options:range:](self->_searchBuffer, "rangeOfData:options:range:", self->_endOfMessageData, 0, 0, [(NSMutableData *)self->_searchBuffer length]);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL || v10 != 0)
  {
    *(_WORD *)&self->_endOfPart = 257;
    -[NSMutableData subdataWithRange:](self->_searchBuffer, "subdataWithRange:", 0, v9);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableData setData:](self->_searchBuffer, "setData:");
    goto LABEL_11;
  }
}

- (void)close
{
  reader = self->_reader;
  if (reader)
  {
    [(DERewindableReader *)reader close];
    uint64_t v4 = self->_reader;
    self->_reader = 0;
  }
}

- (void)dealloc
{
  reader = self->_reader;
  if (reader)
  {
    [(DERewindableReader *)reader close];
    uint64_t v4 = self->_reader;
    self->_reader = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DEMultipartReader;
  [(DEMultipartReader *)&v5 dealloc];
}

- (DEMultipartReader)init
{
  return [(DEMultipartReader *)self initWithReader:0];
}

- (DEMultipartReader)initWithReader:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DEMultipartReader;
  uint64_t v6 = [(DEMultipartReader *)&v26 init];
  unint64_t v7 = v6;
  if (v6)
  {
    if (v5 && ([v5 isRewindable] & 1) != 0)
    {
      p_reader = (id *)&v6->_reader;
      objc_storeStrong(p_reader, a3);
      searchBuffer = v7->_searchBuffer;
      v7->_searchBuffer = 0;

      nextPartData = v7->_nextPartData;
      v7->_nextPartData = 0;

      *(_WORD *)&v7->_endOfPart = 0;
      uint64_t v11 = +[DEMultipartReader getEndOfPartData];
      endOfPartData = v7->_endOfPartData;
      v7->_endOfPartData = (NSData *)v11;

      uint64_t v13 = +[DEMultipartReader getEndOfMessageData];
      endOfMessageData = v7->_endOfMessageData;
      v7->_endOfMessageData = (NSData *)v13;

      v7->_unint64_t maxEndSize = 0;
      reader = v7->_reader;
      v16 = +[DEMultipartUtil getBoundaryData];
      v17 = -[DERewindableReader readDataOfLength:](reader, "readDataOfLength:", [v16 length]);

      v18 = +[DEMultipartUtil getBoundaryData];
      char v19 = [v18 isEqualToData:v17];

      id v20 = *p_reader;
      if (v19)
      {
        [v20 disableRewind];
        unint64_t v21 = [(NSData *)v7->_endOfPartData length];
        v7->_unint64_t maxEndSize = v21;
        if (v21 < [(NSData *)v7->_endOfMessageData length]) {
          v7->_unint64_t maxEndSize = [(NSData *)v7->_endOfMessageData length];
        }
        uint64_t v22 = [MEMORY[0x1E4F1CA58] dataWithCapacity:getpagesize()];
        v23 = v7->_searchBuffer;
        v7->_searchBuffer = (NSMutableData *)v22;
      }
      else
      {
        [v20 rewind];
        id v24 = *p_reader;
        id *p_reader = 0;

        v23 = v7;
        unint64_t v7 = 0;
      }
    }
    else
    {
      +[DELog error:@"Unsuitable rewindable reader used in Multipart Reader"];
      v17 = v6;
      unint64_t v7 = 0;
    }
  }
  return v7;
}

+ (id)getEndOfMessageData
{
  v2 = NSString;
  uint64_t v3 = +[DEMultipartUtil getMessageEnd];
  uint64_t v4 = [v2 stringWithFormat:@"%@%@", @"\r\n", v3];
  id v5 = [v4 dataUsingEncoding:4];

  return v5;
}

+ (id)getEndOfPartData
{
  v2 = NSString;
  uint64_t v3 = +[DEMultipartUtil getBoundary];
  uint64_t v4 = [v2 stringWithFormat:@"%@%@", @"\r\n", v3];
  id v5 = [v4 dataUsingEncoding:4];

  return v5;
}

@end