@interface GEOPictureItemContainer
- (BOOL)allowFullScreenPhoto;
- (GEOPictureItemContainer)init;
- (GEOPictureItemContainer)initWithPictureItemContainer:(id)a3;
- (GEOPictureItemContainer)initWithPictureItems:(id)a3 allowFullScreenPhoto:(BOOL)a4;
- (NSArray)pictureItems;
@end

@implementation GEOPictureItemContainer

- (GEOPictureItemContainer)init
{
  result = (GEOPictureItemContainer *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOPictureItemContainer)initWithPictureItems:(id)a3 allowFullScreenPhoto:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOPictureItemContainer;
  v7 = [(GEOPictureItemContainer *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    pictureItems = v7->_pictureItems;
    v7->_pictureItems = (NSArray *)v8;

    v7->_allowFullScreenPhoto = a4;
  }

  return v7;
}

- (GEOPictureItemContainer)initWithPictureItemContainer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  v5 = -[GEOPDPictureItemContainer pictureItems](v4);
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = -[GEOPDPictureItemContainer pictureItems](v4);
    v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = -[GEOPDPictureItemContainer pictureItems](v4);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
          v16 = [GEOPictureItem alloc];
          v17 = -[GEOPictureItem initWithPictureItem:](v16, "initWithPictureItem:", v15, (void)v21);
          if (v17) {
            [v9 addObject:v17];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    if (v4) {
      BOOL v18 = (*((unsigned char *)v4 + 28) & 1) == 0 || *((unsigned char *)v4 + 24) != 0;
    }
    else {
      BOOL v18 = 0;
    }
    self = -[GEOPictureItemContainer initWithPictureItems:allowFullScreenPhoto:](self, "initWithPictureItems:allowFullScreenPhoto:", v9, v18, (void)v21);

    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSArray)pictureItems
{
  return self->_pictureItems;
}

- (BOOL)allowFullScreenPhoto
{
  return self->_allowFullScreenPhoto;
}

- (void).cxx_destruct
{
}

@end