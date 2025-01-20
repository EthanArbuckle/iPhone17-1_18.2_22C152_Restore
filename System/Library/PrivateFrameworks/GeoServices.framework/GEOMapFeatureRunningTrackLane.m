@interface GEOMapFeatureRunningTrackLane
- (GEOMapFeatureRunningTrackLane)initWithVMP4Lane:(const void *)a3 coordinates:(id)a4;
- (NSArray)coordinates;
- (id)description;
- (unint64_t)type;
- (unsigned)flowlineOffset;
- (unsigned)width;
@end

@implementation GEOMapFeatureRunningTrackLane

- (GEOMapFeatureRunningTrackLane)initWithVMP4Lane:(const void *)a3 coordinates:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOMapFeatureRunningTrackLane;
  v8 = [(GEOMapFeatureRunningTrackLane *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = *(unsigned __int8 *)a3;
    v8->_width = *((_DWORD *)a3 + 10);
    v8->_flowlineOffset = *((_DWORD *)a3 + 11);
    objc_storeStrong((id *)&v8->_coordinates, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t type = self->_type;
  if (type >= 3)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"<Invalid Track Lane Type (%u)>", self->_type);
  }
  else
  {
    id v7 = (void *)*((void *)&off_1E53E8168 + type);
  }
  v8 = [v3 stringWithFormat:@"<%@ %p: '%@'> width: %umm flowLineOffset: %umm coordinates: [%@]", v5, self, v7, self->_width, self->_flowlineOffset, self->_coordinates];

  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)flowlineOffset
{
  return self->_flowlineOffset;
}

- (NSArray)coordinates
{
  return self->_coordinates;
}

- (void).cxx_destruct
{
}

@end