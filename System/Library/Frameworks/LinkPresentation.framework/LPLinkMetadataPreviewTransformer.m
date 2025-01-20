@interface LPLinkMetadataPreviewTransformer
- (LPImage)previewImage;
- (LPLinkMetadata)metadata;
- (LPLinkMetadataPreviewTransformer)initWithMetadata:(id)a3 URL:(id)a4;
- (NSString)previewSummary;
- (NSURL)URL;
@end

@implementation LPLinkMetadataPreviewTransformer

- (LPLinkMetadataPreviewTransformer)initWithMetadata:(id)a3 URL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPLinkMetadataPreviewTransformer;
  v9 = [(LPLinkMetadataPreviewTransformer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)previewSummary
{
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata specialization];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(LPLinkMetadata *)self->_metadata specialization];
    if ([v5 conformsToProtocol:&unk_1EF7246E0])
    {
      v6 = [(LPLinkMetadata *)self->_metadata specialization];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [(LPLinkMetadata *)self->_metadata specialization];
        v9 = [v8 previewSummaryForTransformer:self];
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  v10 = [(LPLinkMetadata *)self->_metadata title];
  id v8 = truncatedStringAtMaximumMetadataLength(v10);

  URL = self->_URL;
  v12 = URL;
  if (!URL)
  {
    v12 = [(LPLinkMetadata *)self->_metadata originalURL];
  }
  objc_super v13 = objc_msgSend(v12, "_lp_simplifiedDisplayString");
  v14 = truncatedStringAtMaximumMetadataLength(v13);

  if (URL)
  {
    if (!v8) {
      goto LABEL_14;
    }
  }
  else
  {

    if (!v8) {
      goto LABEL_14;
    }
  }
  if (v14)
  {
    v15 = NSString;
    v16 = LPLocalizedString(@"Website: %@ (%@)");
    uint64_t v17 = objc_msgSend(v15, "stringWithFormat:", v16, v8, v14);
    goto LABEL_16;
  }
LABEL_14:
  if (!v14)
  {
    v9 = 0;
    goto LABEL_17;
  }
  v18 = NSString;
  v16 = LPLocalizedString(@"Website: %@");
  uint64_t v17 = objc_msgSend(v18, "stringWithFormat:", v16, v14);
LABEL_16:
  v9 = (void *)v17;

LABEL_17:
LABEL_18:

  return (NSString *)v9;
}

- (LPImage)previewImage
{
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata specialization];
  if (!v3) {
    goto LABEL_5;
  }
  v4 = (void *)v3;
  v5 = [(LPLinkMetadata *)self->_metadata specialization];
  if (([v5 conformsToProtocol:&unk_1EF7246E0] & 1) == 0)
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
  id v8 = [v4 previewImageForTransformer:self];
LABEL_7:

LABEL_8:

  return (LPImage *)v8;
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