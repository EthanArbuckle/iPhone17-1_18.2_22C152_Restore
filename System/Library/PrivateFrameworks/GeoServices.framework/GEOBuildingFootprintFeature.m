@interface GEOBuildingFootprintFeature
- (BOOL)hasLandmark;
- (BOOL)isForTransit;
- (id)feature;
- (id)init:(void *)a3 withVectorTile:(id)a4;
- (unint64_t)baseOffset;
- (unint64_t)extrusionOffset;
- (void)get;
@end

@implementation GEOBuildingFootprintFeature

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOBuildingFootprintFeature;
    v7 = [(GEOBuildingFootprintFeature *)&v12 init];
    v8 = v7;
    if (v7)
    {
      v7->_buildingFootprintFeature = a3;
      v9 = [[GEOMultiSectionFeature alloc] init:a3 withVectorTile:v6];
      multiSectionFeature = v8->_multiSectionFeature;
      v8->_multiSectionFeature = v9;
    }
    self = v8;
    a3 = self;
  }

  return a3;
}

- (void)get
{
  return self->_buildingFootprintFeature;
}

- (id)feature
{
  return self->_multiSectionFeature;
}

- (unint64_t)extrusionOffset
{
  if (self->_multiSectionFeature) {
    return *((void *)self->_buildingFootprintFeature + 14);
  }
  else {
    return 0;
  }
}

- (unint64_t)baseOffset
{
  if (self->_multiSectionFeature) {
    return *((void *)self->_buildingFootprintFeature + 15);
  }
  else {
    return 0;
  }
}

- (BOOL)hasLandmark
{
  return self->_multiSectionFeature && *((unsigned char *)self->_buildingFootprintFeature + 128) != 0;
}

- (BOOL)isForTransit
{
  return self->_multiSectionFeature && *((unsigned char *)self->_buildingFootprintFeature + 129) != 0;
}

- (void).cxx_destruct
{
}

@end