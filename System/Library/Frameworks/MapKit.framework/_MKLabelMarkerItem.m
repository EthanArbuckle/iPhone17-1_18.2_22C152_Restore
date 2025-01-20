@interface _MKLabelMarkerItem
+ (id)labelMarkerItemWithLabelMarker:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_hasMUID;
- (BOOL)_hasResolvablePartialInformation;
- (BOOL)_hasVenueFeatureType;
- (BOOL)_isTransitDisplayFeature;
- (BOOL)isValid;
- (_MKLabelMarkerItem)initWithLabelMarker:(id)a3;
- (id)_identifier;
- (id)_labelMarker;
- (id)_place;
- (id)_styleAttributes;
- (id)_venueInfo;
- (id)name;
- (int)_venueFeatureType;
- (int)referenceFrame;
- (unint64_t)_muid;
@end

@implementation _MKLabelMarkerItem

+ (id)labelMarkerItemWithLabelMarker:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabelMarker:v3];

  return v4;
}

- (_MKLabelMarkerItem)initWithLabelMarker:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKLabelMarkerItem;
  v6 = [(_MKLabelMarkerItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_labelMarker, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isValid
{
  return 1;
}

- (id)name
{
  return (id)[(VKLabelMarker *)self->_labelMarker text];
}

- (int)referenceFrame
{
  v2 = (void *)MEMORY[0x1E4F64670];
  [(_MKLabelMarkerItem *)self coordinate];
  if (objc_msgSend(v2, "isLocationShiftRequiredForCoordinate:")) {
    return 2;
  }
  else {
    return 1;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  labelMarker = self->_labelMarker;
  if (labelMarker)
  {
    [(VKLabelMarker *)labelMarker coordinate];
  }
  else
  {
    double v3 = -180.0;
    double v4 = -180.0;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 1;
}

- (id)_labelMarker
{
  return self->_labelMarker;
}

- (BOOL)_hasMUID
{
  return [(VKLabelMarker *)self->_labelMarker _mapkit_hasMUID];
}

- (unint64_t)_muid
{
  return [(VKLabelMarker *)self->_labelMarker _mapkit_muid];
}

- (id)_identifier
{
  if ([(VKLabelMarker *)self->_labelMarker _mapkit_hasMUID])
  {
    labelMarker = self->_labelMarker;
    if (labelMarker)
    {
      [(VKLabelMarker *)labelMarker coordinate];
      double v5 = v4;
      double v7 = v6;
    }
    else
    {
      double v5 = -180.0;
      double v7 = -180.0;
    }
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F646B8]), "initWithMUID:resultProviderID:coordinate:", -[VKLabelMarker _mapkit_muid](self->_labelMarker, "_mapkit_muid"), 0, v5, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isTransitDisplayFeature
{
  if ([(VKLabelMarker *)self->_labelMarker isTransit]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_MKLabelMarkerItem;
  return [(GEOBaseMapItem *)&v4 _isTransitDisplayFeature];
}

- (id)_styleAttributes
{
  return (id)[(VKLabelMarker *)self->_labelMarker styleAttributes];
}

- (id)_venueInfo
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if ([(VKLabelMarker *)self->_labelMarker venueID])
  {
    if ([(VKLabelMarker *)self->_labelMarker venueBuildingID])
    {
      if ([(VKLabelMarker *)self->_labelMarker venueLevelID])
      {
        double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64BC8]), "initWithOrdinal:levelID:", -[VKLabelMarker venueFloorOrdinal](self->_labelMarker, "venueFloorOrdinal"), -[VKLabelMarker venueLevelID](self->_labelMarker, "venueLevelID"));
        uint64_t v4 = [(VKLabelMarker *)self->_labelMarker venueComponentID];
        id v5 = objc_alloc(MEMORY[0x1E4F64BC0]);
        uint64_t v6 = [(VKLabelMarker *)self->_labelMarker venueBuildingID];
        if (v4)
        {
          double v7 = objc_msgSend(v5, "initWithBuildingID:floorInfo:unitID:", v6, v3, -[VKLabelMarker venueComponentID](self->_labelMarker, "venueComponentID"));
          v17[0] = v7;
          uint64_t v8 = 4;
          v9 = (void **)v17;
        }
        else
        {
          double v7 = (void *)[v5 initWithBuildingID:v6 floorInfo:v3];
          v16 = v7;
          uint64_t v8 = 3;
          v9 = &v16;
        }
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      }
      else
      {
        double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64BC0]), "initWithBuildingID:", -[VKLabelMarker venueBuildingID](self->_labelMarker, "venueBuildingID"));
        v15 = v3;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        uint64_t v8 = 2;
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F1CBF0];
      uint64_t v8 = 1;
    }
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64BD0]), "initWithVenueID:componentIdentifiers:", -[VKLabelMarker venueID](self->_labelMarker, "venueID"), v11);
    id v13 = objc_alloc(MEMORY[0x1E4F646F8]);
    objc_super v10 = (void *)[v13 initWithIdentifier:v12 featureType:v8 filters:MEMORY[0x1E4F1CBF0] parent:0 contents:0];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (BOOL)_hasVenueFeatureType
{
  v2 = [(_MKLabelMarkerItem *)self _venueInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)_venueFeatureType
{
  BOOL v3 = [(_MKLabelMarkerItem *)self _venueInfo];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(_MKLabelMarkerItem *)self _venueInfo];
  int v5 = [v4 venueFeatureType];

  return v5;
}

- (id)_place
{
  [(_MKLabelMarkerItem *)self coordinate];
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F64828]) initWithLatitude:v3 longitude:v4];
  uint64_t v6 = [(_MKLabelMarkerItem *)self name];
  [v5 setName:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F64420]);
  uint64_t v8 = [(_MKLabelMarkerItem *)self name];
  [v7 setName:v8];

  objc_msgSend(v7, "setUID:", -[_MKLabelMarkerItem _muid](self, "_muid"));
  [v5 addBusiness:v7];

  return v5;
}

- (void).cxx_destruct
{
}

@end