@interface LPLinkMetadataStatusTransformer
- (BOOL)wantsStatusItem;
- (LPLinkMetadata)metadata;
- (LPLinkMetadataStatusTransformer)initWithMetadata:(id)a3 URL:(id)a4;
- (LPLinkMetadataStatusTransformerDelegate)delegate;
- (NSAttributedString)statusText;
- (NSURL)actionURL;
- (NSURL)canonicalURL;
- (id)originalURL;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation LPLinkMetadataStatusTransformer

- (LPLinkMetadataStatusTransformer)initWithMetadata:(id)a3 URL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)LPLinkMetadataStatusTransformer;
  v9 = [(LPLinkMetadataStatusTransformer *)&v18 init];
  v10 = v9;
  if (v9)
  {
    p_metadata = (id *)&v9->_metadata;
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_URL, a4);
    v12 = [(LPLinkMetadata *)v10->_metadata specialization];
    if (v12)
    {
      v13 = [*p_metadata specialization];
      if (([v13 conformsToProtocol:&unk_1EF7248C0] & 1) == 0)
      {

        goto LABEL_7;
      }
      v14 = [*p_metadata specialization];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        v12 = [*p_metadata specialization];
        [v12 initializeForTransformer:v10];
LABEL_7:
      }
    }
    v16 = v10;
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(LPLinkMetadata *)self->_metadata specialization];
  if (v3)
  {
    v4 = [(LPLinkMetadata *)self->_metadata specialization];
    if (([v4 conformsToProtocol:&unk_1EF7248C0] & 1) == 0)
    {

      goto LABEL_6;
    }
    v5 = [(LPLinkMetadata *)self->_metadata specialization];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v3 = [(LPLinkMetadata *)self->_metadata specialization];
      [v3 destroyForTransformer:self];
LABEL_6:
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)LPLinkMetadataStatusTransformer;
  [(LPLinkMetadataStatusTransformer *)&v7 dealloc];
}

- (void)setMetadata:(id)a3
{
  id v16 = a3;
  p_metadata = &self->_metadata;
  char v6 = [(LPLinkMetadata *)self->_metadata specialization];
  if (v6)
  {
    objc_super v7 = [(LPLinkMetadata *)*p_metadata specialization];
    if ([v7 conformsToProtocol:&unk_1EF7248C0])
    {
      id v8 = [(LPLinkMetadata *)*p_metadata specialization];
      char v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0) {
        goto LABEL_7;
      }
      char v6 = [(LPLinkMetadata *)*p_metadata specialization];
      [v6 destroyForTransformer:self];
    }
    else
    {
    }
  }
LABEL_7:
  objc_storeStrong((id *)&self->_metadata, a3);
  v10 = [(LPLinkMetadata *)*p_metadata specialization];
  if (!v10) {
    goto LABEL_13;
  }
  v11 = [(LPLinkMetadata *)*p_metadata specialization];
  if ([v11 conformsToProtocol:&unk_1EF7248C0])
  {
    v12 = [(LPLinkMetadata *)*p_metadata specialization];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_13;
    }
    v10 = [(LPLinkMetadata *)*p_metadata specialization];
    [v10 initializeForTransformer:self];
  }
  else
  {
  }
LABEL_13:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 statusTransformerDidUpdate:self];
  }
}

- (NSAttributedString)statusText
{
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata specialization];
  if (!v3) {
    goto LABEL_5;
  }
  v4 = (void *)v3;
  v5 = [(LPLinkMetadata *)self->_metadata specialization];
  if (([v5 conformsToProtocol:&unk_1EF7248C0] & 1) == 0)
  {

    id v8 = 0;
    goto LABEL_7;
  }
  char v6 = [(LPLinkMetadata *)self->_metadata specialization];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
LABEL_5:
    id v8 = 0;
    goto LABEL_8;
  }
  v4 = [(LPLinkMetadata *)self->_metadata specialization];
  id v8 = [v4 statusForTransformer:self];
LABEL_7:

LABEL_8:

  return (NSAttributedString *)v8;
}

- (NSURL)actionURL
{
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata specialization];
  if (!v3) {
    goto LABEL_5;
  }
  v4 = (void *)v3;
  v5 = [(LPLinkMetadata *)self->_metadata specialization];
  if (([v5 conformsToProtocol:&unk_1EF7248C0] & 1) == 0)
  {

    id v8 = 0;
    goto LABEL_7;
  }
  char v6 = [(LPLinkMetadata *)self->_metadata specialization];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
LABEL_5:
    id v8 = 0;
    goto LABEL_8;
  }
  v4 = [(LPLinkMetadata *)self->_metadata specialization];
  id v8 = [v4 actionURLForTransformer:self];
LABEL_7:

LABEL_8:

  return (NSURL *)v8;
}

- (id)originalURL
{
  URL = self->_URL;
  if (URL)
  {
    uint64_t v3 = URL;
  }
  else
  {
    uint64_t v3 = [(LPLinkMetadata *)self->_metadata originalURL];
  }

  return v3;
}

- (NSURL)canonicalURL
{
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata URL];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(LPLinkMetadataStatusTransformer *)self originalURL];
  }
  char v6 = v5;

  return (NSURL *)v6;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (LPLinkMetadataStatusTransformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LPLinkMetadataStatusTransformerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wantsStatusItem
{
  return self->_wantsStatusItem;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end