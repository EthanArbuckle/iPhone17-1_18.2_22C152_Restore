@interface GEOAnnotatedItemList
- (GEOAnnotatedItemList)init;
- (GEOAnnotatedItemList)initWithAnnotatedItemList:(id)a3 attribution:(id)a4;
- (GEOAnnotatedItemList)initWithPictureItemContainer:(id)a3 textItemContainer:(id)a4 title:(id)a5 annotatedItemStyle:(int)a6 attribution:(id)a7;
- (GEOMapItemAttribution)attribution;
- (GEOPictureItemContainer)pictureItemContainer;
- (GEOTextItemContainer)textItemContainer;
- (NSString)title;
- (int)annotatedItemStyle;
@end

@implementation GEOAnnotatedItemList

- (GEOAnnotatedItemList)init
{
  result = (GEOAnnotatedItemList *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOAnnotatedItemList)initWithPictureItemContainer:(id)a3 textItemContainer:(id)a4 title:(id)a5 annotatedItemStyle:(int)a6 attribution:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)GEOAnnotatedItemList;
  v17 = [(GEOAnnotatedItemList *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pictureItemContainer, a3);
    objc_storeStrong((id *)&v18->_textItemContainer, a4);
    uint64_t v19 = [v15 copy];
    title = v18->_title;
    v18->_title = (NSString *)v19;

    v18->_annotatedItemStyle = a6;
    objc_storeStrong((id *)&v18->_attribution, a7);
  }

  return v18;
}

- (GEOAnnotatedItemList)initWithAnnotatedItemList:(id)a3 attribution:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  -[GEOPDAnnotatedItemList textItemContainer](v6);
  v8 = (GEOAnnotatedItemList *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    int v9 = -[GEOPDAnnotatedItemList annotatedItemStyle]((uint64_t)v6);

    if (v9)
    {
      -[GEOPDAnnotatedItemList picItemContainer](v6);
      v10 = (GEOPictureItemContainer *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [GEOPictureItemContainer alloc];
        v12 = -[GEOPDAnnotatedItemList picItemContainer](v6);
        v10 = [(GEOPictureItemContainer *)v11 initWithPictureItemContainer:v12];
      }
      id v13 = [GEOTextItemContainer alloc];
      id v14 = -[GEOPDAnnotatedItemList textItemContainer](v6);
      id v15 = [(GEOTextItemContainer *)v13 initWithTextItemContainer:v14];
      id v16 = -[GEOPDAnnotatedItemList title](v6);
      self = -[GEOAnnotatedItemList initWithPictureItemContainer:textItemContainer:title:annotatedItemStyle:attribution:](self, "initWithPictureItemContainer:textItemContainer:title:annotatedItemStyle:attribution:", v10, v15, v16, -[GEOPDAnnotatedItemList annotatedItemStyle]((uint64_t)v6) != 0, v7);

      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (GEOPictureItemContainer)pictureItemContainer
{
  return self->_pictureItemContainer;
}

- (GEOTextItemContainer)textItemContainer
{
  return self->_textItemContainer;
}

- (NSString)title
{
  return self->_title;
}

- (int)annotatedItemStyle
{
  return self->_annotatedItemStyle;
}

- (GEOMapItemAttribution)attribution
{
  return self->_attribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textItemContainer, 0);

  objc_storeStrong((id *)&self->_pictureItemContainer, 0);
}

@end