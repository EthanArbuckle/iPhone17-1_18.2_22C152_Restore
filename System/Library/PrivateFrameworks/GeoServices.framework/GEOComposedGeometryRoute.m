@interface GEOComposedGeometryRoute
+ (BOOL)supportsSecureCoding;
- (BOOL)isNavigable;
- (GEOComposedGeometryRoute)initWithCoder:(id)a3;
- (id)initSingleLegRouteWithCoordinates:(id *)a3 count:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedGeometryRoute

- (BOOL)isNavigable
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(GEOComposedRoute *)self persistentData];
  [v5 encodeObject:v4 forKey:@"persistentData"];
}

- (GEOComposedGeometryRoute)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentData"];
  v6 = [[GEORouteBuilder_PersistentData alloc] initWithPersistentData:v5];
  v7 = [(GEORouteBuilderBase *)v6 buildRoute];

  return v7;
}

- (id)initSingleLegRouteWithCoordinates:(id *)a3 count:(unint64_t)a4
{
  v31 = self;
  v37[1] = *MEMORY[0x1E4F143B8];
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v32, 0);
  if (a4)
  {
    uint64_t v6 = 0;
    p_var2 = &a3->var2;
    while (1)
    {
      double v9 = *(p_var2 - 2);
      double v8 = *(p_var2 - 1);
      double v10 = *p_var2;
      v11 = v36;
      if (!v36) {
        break;
      }
      int v12 = v34;
      int v13 = *v36;
      if (v34 >= *v36)
      {
        if (v13 == v35)
        {
LABEL_8:
          if (v12 <= v13)
          {
            google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)&v33, v13 - v12 + 1);
            v11 = v36;
          }
          int v13 = *v11;
        }
        int *v11 = v13 + 1;
        v14 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::RoutingPathPoint>(v33);
        uint64_t v15 = v34++;
        *(void *)&v36[2 * v15 + 2] = v14;
        goto LABEL_12;
      }
      ++v34;
      v14 = *(char **)&v36[2 * v12 + 2];
LABEL_12:
      *((_DWORD *)v14 + 4) |= 2u;
      v16 = (char *)*((void *)v14 + 4);
      if (!v16)
      {
        uint64_t v17 = *((void *)v14 + 1);
        v18 = (google::protobuf::internal::ArenaImpl *)(v17 & 0xFFFFFFFFFFFFFFFELL);
        if (v17) {
          v18 = *(google::protobuf::internal::ArenaImpl **)v18;
        }
        v16 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::LatLngE7>(v18);
        *((void *)v14 + 4) = v16;
      }
      int v19 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", v9, v31);
      *((_DWORD *)v16 + 4) |= 1u;
      *((_DWORD *)v16 + 6) = v19;
      int v20 = +[GEOLatLngE7 toE7Coordinate:v8];
      *((_DWORD *)v16 + 4) |= 2u;
      *((_DWORD *)v16 + 7) = v20;
      int v21 = *((_DWORD *)v14 + 4);
      *((_DWORD *)v14 + 14) = (int)(v10 * 100.0);
      if (a4 - 1 == v6 || v6 == 0) {
        int v23 = 1;
      }
      else {
        int v23 = 2;
      }
      *((_DWORD *)v14 + 4) = v21 | 0x810;
      *((_DWORD *)v14 + 21) = v23;
      ++v6;
      p_var2 += 3;
      if (a4 == v6) {
        goto LABEL_23;
      }
    }
    int v12 = v34;
    int v13 = v35;
    goto LABEL_8;
  }
LABEL_23:
  v24 = +[PathCodec dataForRoutingPathLeg:]((uint64_t)PathCodec, (google::protobuf::MessageLite *)v32);
  v25 = objc_opt_new();
  [v25 setTransportType:0];
  v26 = [GEORawRouteGeometry alloc];
  v37[0] = v24;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v28 = [(GEORawRouteGeometry *)v26 initWithRawData:v27];
  [v25 setRawRouteGeometry:v28];

  v29 = [v25 buildRoute];

  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v32);
  return v29;
}

@end