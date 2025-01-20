@interface SKGEmbedding
- (BOOL)isFileSystemConsistent;
- (NSArray)fsIndexDataContentVersion;
- (NSArray)primaryEmbeddings;
- (NSArray)secondaryEmbeddings;
- (unint64_t)firstChunkLength;
- (unint64_t)format;
- (unint64_t)size;
- (unint64_t)version;
- (void)setFirstChunkLength:(unint64_t)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setFsIndexDataContentVersion:(id)a3;
- (void)setIsFileSystemConsistent:(BOOL)a3;
- (void)setPrimaryEmbeddings:(id)a3;
- (void)setSecondaryEmbeddings:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation SKGEmbedding

- (NSArray)secondaryEmbeddings
{
  return self->_secondaryEmbeddings;
}

- (void)setSecondaryEmbeddings:(id)a3
{
}

- (NSArray)primaryEmbeddings
{
  return self->_primaryEmbeddings;
}

- (void)setPrimaryEmbeddings:(id)a3
{
}

- (unint64_t)firstChunkLength
{
  return self->_firstChunkLength;
}

- (void)setFirstChunkLength:(unint64_t)a3
{
  self->_firstChunkLength = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSArray)fsIndexDataContentVersion
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFsIndexDataContentVersion:(id)a3
{
}

- (BOOL)isFileSystemConsistent
{
  return self->_isFileSystemConsistent;
}

- (void)setIsFileSystemConsistent:(BOOL)a3
{
  self->_isFileSystemConsistent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsIndexDataContentVersion, 0);
  objc_storeStrong((id *)&self->_primaryEmbeddings, 0);

  objc_storeStrong((id *)&self->_secondaryEmbeddings, 0);
}

@end