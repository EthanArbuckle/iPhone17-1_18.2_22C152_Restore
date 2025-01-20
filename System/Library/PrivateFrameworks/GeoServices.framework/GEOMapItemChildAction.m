@interface GEOMapItemChildAction
- (GEOGuideLocation)guideLocation;
- (GEOMapItemChildAction)initWithChildAction:(id)a3;
- (GEOMapItemChildActionSearch)childActionSearch;
- (id)childActionTypeAsString:(int64_t)a3;
- (int64_t)childActionType;
- (void)setChildActionSearch:(id)a3;
- (void)setChildActionType:(int64_t)a3;
@end

@implementation GEOMapItemChildAction

- (GEOMapItemChildAction)initWithChildAction:(id)a3
{
  v4 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapItemChildAction;
  v5 = [(GEOMapItemChildAction *)&v19 init];
  if (v5)
  {
    v6 = 0;
    switch(-[GEOPDChildAction childActionType]((uint64_t)v4))
    {
      case 0u:
        goto LABEL_20;
      case 1u:
        uint64_t v7 = 1;
        goto LABEL_13;
      case 2u:
        uint64_t v7 = 2;
        goto LABEL_13;
      case 3u:
        uint64_t v7 = 3;
        goto LABEL_13;
      case 4u:
        v8 = +[GEOResourceManifestManager modernManager];
        char v9 = [v8 isMuninEnabled];

        if ((v9 & 1) == 0)
        {
          v6 = 0;
          goto LABEL_20;
        }
        uint64_t v7 = 4;
LABEL_13:
        v5->_childActionType = v7;
        v10 = -[GEOPDChildAction childActionSearch](v4);

        if (v10)
        {
          v11 = [GEOMapItemChildActionSearch alloc];
          guideLocation = -[GEOPDChildAction childActionSearch](v4);
          uint64_t v13 = [(GEOMapItemChildActionSearch *)v11 initWithChildActionSearch:guideLocation];
          childActionSearch = v5->_childActionSearch;
          v5->_childActionSearch = (GEOMapItemChildActionSearch *)v13;
        }
        else
        {
          v15 = -[GEOPDChildAction childActionGuides](v4);
          if (v15)
          {
            uint64_t v16 = v15[2];

            if (!v16) {
              break;
            }
            v17 = [[GEOGuideLocation alloc] initWithChildAction:v4];
            guideLocation = v5->_guideLocation;
            v5->_guideLocation = v17;
          }
          else
          {
            guideLocation = 0;
          }
        }

        break;
      case 5u:
        uint64_t v7 = 5;
        goto LABEL_13;
      case 6u:
        uint64_t v7 = 6;
        goto LABEL_13;
      case 7u:
        uint64_t v7 = 7;
        goto LABEL_13;
      case 8u:
        uint64_t v7 = 8;
        goto LABEL_13;
      default:
        uint64_t v7 = 0;
        goto LABEL_13;
    }
  }
  v6 = v5;
LABEL_20:

  return v6;
}

- (id)childActionTypeAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"UNKNOWN";
  }
  else {
    return off_1E53E6590[a3 - 1];
  }
}

- (int64_t)childActionType
{
  return self->_childActionType;
}

- (void)setChildActionType:(int64_t)a3
{
  self->_childActionType = a3;
}

- (GEOMapItemChildActionSearch)childActionSearch
{
  return self->_childActionSearch;
}

- (void)setChildActionSearch:(id)a3
{
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLocation, 0);

  objc_storeStrong((id *)&self->_childActionSearch, 0);
}

@end