@interface LPLinkMetadataDownloadProgressTransformer
- (LPLinkMetadata)metadata;
- (LPLinkMetadataDownloadProgressTransformer)initWithBytesLoaded:(unint64_t)a3 downloadState:(int64_t)a4 metadata:(id)a5;
- (id)downloadProgressForTransformer:(id)a3;
- (unint64_t)bytesLoaded;
- (void)setBytesLoaded:(unint64_t)a3;
- (void)setMetadata:(id)a3;
@end

@implementation LPLinkMetadataDownloadProgressTransformer

- (LPLinkMetadataDownloadProgressTransformer)initWithBytesLoaded:(unint64_t)a3 downloadState:(int64_t)a4 metadata:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)LPLinkMetadataDownloadProgressTransformer;
  v9 = [(LPLinkMetadataDownloadProgressTransformer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_bytesLoaded = a3;
    objc_storeStrong((id *)&v9->_metadata, a5);
    v11 = v10;
  }

  return v10;
}

- (id)downloadProgressForTransformer:(id)a3
{
  v4 = [(LPLinkMetadata *)self->_metadata specialization];
  int v5 = [v4 conformsToProtocol:&unk_1EF7266D0];

  if (v5)
  {
    v6 = [(LPLinkMetadata *)self->_metadata specialization];
    v7 = [v6 downloadProgressForTransformer:self];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)bytesLoaded
{
  return self->_bytesLoaded;
}

- (void)setBytesLoaded:(unint64_t)a3
{
  self->_bytesLoaded = a3;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end