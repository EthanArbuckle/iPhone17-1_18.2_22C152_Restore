@interface GEOExploreGuides
- (BOOL)isEqual:(id)a3;
- (GEOExploreGuides)initWithExploreGuides:(id)a3;
- (GEOGuideLocation)guideLocation;
- (id)imageDownloadUrlFromTemplateUrl:(id)a3 size:(CGSize)a4;
- (id)imageURLForSize:(CGSize)a3;
@end

@implementation GEOExploreGuides

- (id)imageURLForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = -[GEOPDExploreGuides exploreImageUrlTemplate]((id *)&self->_pdExploreGuides->super.super.isa);
  v7 = -[GEOExploreGuides imageDownloadUrlFromTemplateUrl:size:](self, "imageDownloadUrlFromTemplateUrl:size:", v6, width, height);

  return v7;
}

- (GEOExploreGuides)initWithExploreGuides:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOExploreGuides;
  v6 = [(GEOExploreGuides *)&v17 init];
  if (!v6) {
    goto LABEL_16;
  }
  if (v5)
  {
    -[GEOPDExploreGuides _readGuidesLocationEntry]((uint64_t)v5);
    uint64_t v7 = v5[4];
    BOOL v8 = v7 != 0;
    -[GEOPDExploreGuides _readExploreImageUrlTemplate]((uint64_t)v5);
    uint64_t v9 = v5[3];
    BOOL v10 = v9 != 0;
    if (v7) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      objc_storeStrong((id *)&v6->_pdExploreGuides, a3);
LABEL_16:
      v15 = v6;
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v10 = 0;
    BOOL v8 = 0;
  }
  v12 = GEOGetCuratedCollectionsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = "NO";
    if (v8) {
      v14 = "YES";
    }
    else {
      v14 = "NO";
    }
    if (v10) {
      v13 = "YES";
    }
    *(_DWORD *)buf = 136315394;
    v19 = v14;
    __int16 v20 = 2080;
    v21 = v13;
    _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Explore Guides could not be initialized because some data is missing.\n hasGuidesLocation: %s, hasTemplateUrl : %s", buf, 0x16u);
  }

  v15 = 0;
LABEL_17:

  return v15;
}

- (id)imageDownloadUrlFromTemplateUrl:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(GEOPDPhotoContent);
  BOOL v8 = v7;
  if (v7)
  {
    *(unsigned char *)&v7->_flags |= 2u;
    v7->_urlType = 1;
    -[GEOPDPhotoContent setUrl:]((uint64_t)v7, v6);

    *(unsigned char *)&v8->_flags |= 4u;
    v8->_double width = width;
    *(unsigned char *)&v8->_flags |= 1u;
    v8->_double height = height;
  }
  else
  {
    -[GEOPDPhotoContent setUrl:](0, v6);
  }
  uint64_t v9 = [GEOPhotoInfoSource alloc];
  v21[0] = v8;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  BOOL v11 = [(GEOPhotoInfoSource *)v9 initWithPhotoContent:v10];

  v12 = [[GEOMapItemPhotoOptions alloc] initWithAllowSmaller:0 cropStyle:5 format:2];
  v13 = -[GEOPhotoInfoSource bestPhotoForSize:options:](v11, "bestPhotoForSize:options:", v12, width, height);
  v14 = GEOGetCuratedCollectionsLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [v13 url];
    v16 = [v15 absoluteString];
    int v19 = 138412290;
    __int16 v20 = v16;
    _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Explore Guides download URL: %@", (uint8_t *)&v19, 0xCu);
  }
  objc_super v17 = [v13 url];

  return v17;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GEOExploreGuides *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    uint64_t v7 = [(GEOExploreGuides *)self guideLocation];
    BOOL v8 = [(GEOExploreGuides *)v6 guideLocation];

    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (GEOGuideLocation)guideLocation
{
  v3 = [GEOGuideLocation alloc];
  v4 = -[GEOPDExploreGuides guidesLocationEntry]((id *)&self->_pdExploreGuides->super.super.isa);
  v5 = [(GEOGuideLocation *)v3 initWithGuideLocation:v4];

  return v5;
}

@end