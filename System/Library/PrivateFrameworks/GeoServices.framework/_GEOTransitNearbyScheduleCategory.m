@interface _GEOTransitNearbyScheduleCategory
- (GEOTransitArtworkDataSource)artwork;
- (NSArray)groups;
- (NSString)displayName;
- (_GEOTransitNearbyScheduleCategory)initWithTransitScheduleCategory:(id)a3 nearbyScheduleGroups:(id)a4 categoryArtwork:(id)a5;
@end

@implementation _GEOTransitNearbyScheduleCategory

- (_GEOTransitNearbyScheduleCategory)initWithTransitScheduleCategory:(id)a3 nearbyScheduleGroups:(id)a4 categoryArtwork:(id)a5
{
  v8 = (id *)a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_GEOTransitNearbyScheduleCategory;
  v11 = [(_GEOTransitNearbyScheduleCategory *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    groups = v11->_groups;
    v11->_groups = (NSArray *)v12;

    v14 = -[GEOPDTransitScheduleCategory displayName](v8);
    uint64_t v15 = [v14 copy];
    displayName = v11->_displayName;
    v11->_displayName = (NSString *)v15;

    objc_storeStrong((id *)&v11->_artwork, a5);
  }

  return v11;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)groups
{
  return self->_groups;
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end