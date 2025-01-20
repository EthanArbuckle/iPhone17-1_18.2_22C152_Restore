@interface _MFQLItemDataProvider
- (QLItem)item;
- (_MFQLItemDataProvider)initWithData:(id)a3 contentType:(id)a4 previewTitle:(id)a5;
- (id)provideDataForItem:(id)a3;
@end

@implementation _MFQLItemDataProvider

- (_MFQLItemDataProvider)initWithData:(id)a3 contentType:(id)a4 previewTitle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_MFQLItemDataProvider;
  v11 = [(_MFQLItemDataProvider *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(getQLItemClass()) initWithDataProvider:v11 contentType:v9 previewTitle:v10];
    item = v11->_item;
    v11->_item = (QLItem *)v12;

    uint64_t v14 = [v8 copy];
    data = v11->_data;
    v11->_data = (NSData *)v14;
  }
  return v11;
}

- (id)provideDataForItem:(id)a3
{
  return self->_data;
}

- (QLItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end