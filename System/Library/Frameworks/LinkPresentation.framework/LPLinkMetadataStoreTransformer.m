@interface LPLinkMetadataStoreTransformer
- (LPLinkMetadataStoreTransformer)initWithMetadata:(id)a3 URL:(id)a4;
- (id)storeIdentifier;
@end

@implementation LPLinkMetadataStoreTransformer

- (LPLinkMetadataStoreTransformer)initWithMetadata:(id)a3 URL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPLinkMetadataStoreTransformer;
  v9 = [(LPLinkMetadataStoreTransformer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
    v11 = v10;
  }

  return v10;
}

- (id)storeIdentifier
{
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata specialization];
  if (!v3) {
    goto LABEL_5;
  }
  v4 = (void *)v3;
  v5 = [(LPLinkMetadata *)self->_metadata specialization];
  if (([v5 conformsToProtocol:&unk_1EF7247F0] & 1) == 0)
  {

    id v8 = 0;
    goto LABEL_7;
  }
  v6 = [(LPLinkMetadata *)self->_metadata specialization];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
LABEL_5:
    id v8 = 0;
    goto LABEL_8;
  }
  v4 = [(LPLinkMetadata *)self->_metadata specialization];
  id v8 = [v4 storeIdentifierForTransformer:self];
LABEL_7:

LABEL_8:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end