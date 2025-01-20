@interface DERewindableReader
- (BOOL)isRewindable;
- (BOOL)rewind;
- (BOOL)rewound;
- (DEReader)reader;
- (DERewindableReader)init;
- (DERewindableReader)initWithReader:(id)a3;
- (NSMutableData)rewindData;
- (id)readData;
- (id)readDataOfLength:(unint64_t)a3;
- (unint64_t)rewindOffset;
- (void)close;
- (void)dealloc;
- (void)disableRewind;
- (void)setReader:(id)a3;
- (void)setRewindData:(id)a3;
- (void)setRewindOffset:(unint64_t)a3;
- (void)setRewound:(BOOL)a3;
@end

@implementation DERewindableReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewindData, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setRewindOffset:(unint64_t)a3
{
  self->_rewindOffset = a3;
}

- (unint64_t)rewindOffset
{
  return self->_rewindOffset;
}

- (void)setRewindData:(id)a3
{
}

- (NSMutableData)rewindData
{
  return self->_rewindData;
}

- (void)setRewound:(BOOL)a3
{
  self->_rewound = a3;
}

- (BOOL)rewound
{
  return self->_rewound;
}

- (void)setReader:(id)a3
{
}

- (DEReader)reader
{
  return self->_reader;
}

- (id)readData
{
  v3 = [(DEReader *)self->_reader readData];
  if (self->_rewound && (unint64_t v4 = self->_rewindOffset, v4 < [(NSMutableData *)self->_rewindData length]))
  {
    NSUInteger v5 = [(NSMutableData *)self->_rewindData length];
    unint64_t rewindOffset = self->_rewindOffset;
    id v7 = (id)objc_opt_new();
    v8 = [(DERewindableReader *)self readDataOfLength:v5 - rewindOffset];
    [v7 appendData:v8];

    [v7 appendData:v3];
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (id)readDataOfLength:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (self->_rewound && self->_rewindData)
  {
    +[DEIO readDataOfLength:offset:from:](DEIO, "readDataOfLength:offset:from:", a3, self->_rewindOffset);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 length];
    rewindData = self->_rewindData;
    self->_rewindOffset += v6;
    if ([(NSMutableData *)rewindData length] == self->_rewindOffset)
    {
      v8 = self->_rewindData;
      self->_rewindData = 0;
    }
    v3 -= [v5 length];
    if (!v3)
    {
      id v5 = v5;
      id v9 = v5;
      goto LABEL_15;
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v10 = [(DEReader *)self->_reader readDataOfLength:v3];
  v11 = (void *)v10;
  if (v5 && v10)
  {
    id v9 = (id)objc_opt_new();
    [v9 appendData:v5];
    [v9 appendData:v11];
  }
  else
  {
    if ([(DERewindableReader *)self isRewindable]) {
      [(NSMutableData *)self->_rewindData appendData:v11];
    }
    id v9 = v11;
  }

LABEL_15:
  return v9;
}

- (void)close
{
  reader = self->_reader;
  if (reader)
  {
    [(DEReader *)reader close];
    unint64_t v4 = self->_reader;
    self->_reader = 0;
  }
}

- (BOOL)rewind
{
  BOOL v3 = [(DERewindableReader *)self isRewindable];
  if (v3) {
    self->_rewound = 1;
  }
  return v3;
}

- (BOOL)isRewindable
{
  return self->_rewindData && !self->_rewound;
}

- (void)disableRewind
{
  self->_rewindData = 0;
  MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  reader = self->_reader;
  if (reader)
  {
    [(DEReader *)reader close];
    unint64_t v4 = self->_reader;
    self->_reader = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DERewindableReader;
  [(DERewindableReader *)&v5 dealloc];
}

- (DERewindableReader)init
{
  return [(DERewindableReader *)self initWithReader:0];
}

- (DERewindableReader)initWithReader:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DERewindableReader;
  uint64_t v6 = [(DERewindableReader *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reader, a3);
    v7->_rewound = 0;
    uint64_t v8 = objc_opt_new();
    rewindData = v7->_rewindData;
    v7->_rewindData = (NSMutableData *)v8;

    v7->_unint64_t rewindOffset = 0;
    uint64_t v10 = v7;
  }

  return v7;
}

@end