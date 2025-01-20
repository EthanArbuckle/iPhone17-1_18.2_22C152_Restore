@interface LPLinkMetadataSharedWithYouTransformer
- (BOOL)shouldDonateToSharedWithYou;
- (LPLinkMetadata)metadata;
- (LPLinkMetadataSharedWithYouTransformer)initWithMetadata:(id)a3 URL:(id)a4;
- (NSURL)URL;
@end

@implementation LPLinkMetadataSharedWithYouTransformer

- (LPLinkMetadataSharedWithYouTransformer)initWithMetadata:(id)a3 URL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPLinkMetadataSharedWithYouTransformer;
  v9 = [(LPLinkMetadataSharedWithYouTransformer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)shouldDonateToSharedWithYou
{
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata specialization];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(LPLinkMetadata *)self->_metadata specialization];
    if (([v5 conformsToProtocol:&unk_1EF7264C8] & 1) == 0)
    {

      char v8 = 1;
      goto LABEL_7;
    }
    v6 = [(LPLinkMetadata *)self->_metadata specialization];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v4 = [(LPLinkMetadata *)self->_metadata specialization];
      char v8 = [v4 shouldDonateToSharedWithYouForTransformer:self];
LABEL_7:

      return v8;
    }
  }
  return 1;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end