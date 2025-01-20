@interface ChunkedDigest
- (NSArray)chunkDigests;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)chunkType;
- (unsigned)chunkSize;
- (void)setChunkDigests:(id)a3;
- (void)setChunkSize:(unsigned int)a3;
- (void)setChunkType:(int64_t)a3;
@end

@implementation ChunkedDigest

- (void)setChunkDigests:(id)a3
{
  objc_msgSend(a3, "lib_mapAndFilterUsingBlock:", &stru_10035A4B8);
  self->_chunkDigests = (NSArray *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ChunkedDigest allocWithZone:](ChunkedDigest, "allocWithZone:") init];
  v6 = (NSArray *)[(NSArray *)self->_chunkDigests copyWithZone:a3];
  chunkDigests = v5->_chunkDigests;
  v5->_chunkDigests = v6;

  v5->_chunkSize = self->_chunkSize;
  v5->_chunkType = self->_chunkType;
  return v5;
}

- (NSArray)chunkDigests
{
  return self->_chunkDigests;
}

- (unsigned)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(unsigned int)a3
{
  self->_chunkSize = a3;
}

- (int64_t)chunkType
{
  return self->_chunkType;
}

- (void)setChunkType:(int64_t)a3
{
  self->_chunkType = a3;
}

- (void).cxx_destruct
{
}

@end