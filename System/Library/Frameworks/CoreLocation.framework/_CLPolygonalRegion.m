@interface _CLPolygonalRegion
+ (BOOL)supportsSecureCoding;
- (BOOL)allowMonitoringWhileNearby;
- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3;
- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3 withDistanceToBorder:(double *)a4;
- (BOOL)pointInPolygonWithCoordinate:(CLLocationCoordinate2D)a3 withDistanceToBorder:(double *)a4;
- (NSArray)vertices;
- (_CLPolygonalRegion)initWithCoder:(id)a3;
- (_CLPolygonalRegion)initWithVertices:(id)a3 identifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initNearbyAllowedWithVertices:(id)a3 identifier:(id)a4;
- (int)geoReferenceFrame;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setGeoReferenceFrame:(int)a3;
@end

@implementation _CLPolygonalRegion

- (_CLPolygonalRegion)initWithVertices:(id)a3 identifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v7 = [a3 count];
    unint64_t v8 = v7;
    if (v7 >= 0x66)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
      }
      v9 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        unint64_t v28 = v8;
        __int16 v29 = 2050;
        uint64_t v30 = 101;
        _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "#polygon,number of vertices (%{public}lu) mustn't exceed %{public}lu", buf, 0x16u);
      }
      if (!sub_1906CB57C(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
      }
      int v23 = 134349312;
      unint64_t v24 = v8;
      __int16 v25 = 2050;
      uint64_t v26 = 101;
LABEL_43:
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[_CLPolygonalRegion initWithVertices:identifier:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
      return 0;
    }
    if (v7 <= 3)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
      }
      v10 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        unint64_t v28 = v8;
        __int16 v29 = 2050;
        uint64_t v30 = 4;
        _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "#polygon,number of vertices (%{public}lu) must be greater or equal than %{public}lu", buf, 0x16u);
      }
      if (!sub_1906CB57C(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
      }
      int v23 = 134349312;
      unint64_t v24 = v8;
      __int16 v25 = 2050;
      uint64_t v26 = 4;
      goto LABEL_43;
    }
    objc_msgSend((id)objc_msgSend(a3, "lastObject"), "coordinate");
    double v12 = v11;
    objc_msgSend((id)objc_msgSend(a3, "firstObject"), "coordinate");
    if (v12 != v13
      || (objc_msgSend((id)objc_msgSend(a3, "lastObject"), "coordinate"),
          double v15 = v14,
          objc_msgSend((id)objc_msgSend(a3, "firstObject"), "coordinate"),
          v15 != v16))
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
      }
      v17 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_ERROR, "#polygon,monitoring requires a valid connected polygon where first and last coordinates are the same", buf, 2u);
      }
      if (!sub_1906CB57C(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
      }
      LOWORD(v23) = 0;
      goto LABEL_43;
    }
    if (v8 != objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", a3), "count") + 1)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
      }
      v20 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_ERROR, "#polygon,All vertices, except for the first and last equals, have to be unique", buf, 2u);
      }
      if (!sub_1906CB57C(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
      }
      LOWORD(v23) = 0;
      goto LABEL_43;
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)_CLPolygonalRegion;
  v18 = [(CLRegion *)&v22 initWithIdentifier:a4 andRegionType:2];
  if (v18)
  {
    v18->_vertices = (NSArray *)a3;
    v18->_allowMonitoringWhileNearby = 0;
  }
  return v18;
}

- (id)initNearbyAllowedWithVertices:(id)a3 identifier:(id)a4
{
  id result = [(_CLPolygonalRegion *)self initWithVertices:a3 identifier:a4];
  if (result) {
    *((unsigned char *)result + 80) = 1;
  }
  return result;
}

- (void)dealloc
{
  self->_vertices = 0;
  v3.receiver = self;
  v3.super_class = (Class)_CLPolygonalRegion;
  [(CLRegion *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLPolygonalRegion)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLPolygonalRegion.m", 182, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v11.receiver = self;
  v11.super_class = (Class)_CLPolygonalRegion;
  v6 = [(CLRegion *)&v11 initWithCoder:a3];
  if (v6)
  {
    unint64_t v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLPolygonalRegionCodingKeyVertices"];
    if ([a3 containsValueForKey:@"kCLPolygonalRegionCodingKeyReferenceFrame"]) {
      int v8 = [a3 decodeIntForKey:@"kCLPolygonalRegionCodingKeyReferenceFrame"];
    }
    else {
      int v8 = 0;
    }
    if ([a3 containsValueForKey:@"kCLPolygonalRegionCodingKeyMonitoringNearby"]) {
      char v9 = [a3 decodeBoolForKey:@"kCLPolygonalRegionCodingKeyMonitoringNearby"];
    }
    else {
      char v9 = 0;
    }
    [(CLRegion *)v6 setType:2];
    v6->_vertices = (NSArray *)v7;
    v6->_allowMonitoringWhileNearby = v9;
    v6->_geoReferenceFrame = v8;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLPolygonalRegion.m", 212, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  v9.receiver = self;
  v9.super_class = (Class)_CLPolygonalRegion;
  [(CLRegion *)&v9 encodeWithCoder:a3];
  v6 = [(_CLPolygonalRegion *)self vertices];
  uint64_t v7 = [(_CLPolygonalRegion *)self geoReferenceFrame];
  BOOL v8 = [(_CLPolygonalRegion *)self allowMonitoringWhileNearby];
  [a3 encodeObject:v6 forKey:@"kCLPolygonalRegionCodingKeyVertices"];
  [a3 encodeInt:v7 forKey:@"kCLPolygonalRegionCodingKeyReferenceFrame"];
  [a3 encodeBool:v8 forKey:@"kCLPolygonalRegionCodingKeyMonitoringNearby"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_CLPolygonalRegion;
  v4 = [(CLRegion *)&v6 copyWithZone:a3];
  if (v4)
  {
    v4[80] = [(_CLPolygonalRegion *)self allowMonitoringWhileNearby];
    *((_DWORD *)v4 + 21) = [(_CLPolygonalRegion *)self geoReferenceFrame];
    *((void *)v4 + 11) = [(NSArray *)[(_CLPolygonalRegion *)self vertices] copy];
  }
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"_CLPolygonalRegion (identifier:'%@', count:'%lu')", -[CLRegion identifier](self, "identifier"), -[NSArray count](-[_CLPolygonalRegion vertices](self, "vertices"), "count")];
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3
{
  return MEMORY[0x1F4181798](self, sel_pointInPolygonWithCoordinate_withDistanceToBorder_);
}

- (BOOL)containsCoordinate:(CLLocationCoordinate2D)a3 withDistanceToBorder:(double *)a4
{
  return MEMORY[0x1F4181798](self, sel_pointInPolygonWithCoordinate_withDistanceToBorder_);
}

- (BOOL)pointInPolygonWithCoordinate:(CLLocationCoordinate2D)a3 withDistanceToBorder:(double *)a4
{
  double latitude = a3.latitude;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a3.longitude < -180.0
    || (double longitude = a3.longitude, a3.longitude > 180.0)
    || a3.latitude > 90.0
    || a3.latitude < -90.0)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
    }
    uint64_t v31 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_ERROR, "#polygon,#warning invalid coordinate", buf, 2u);
    }
    LOBYTE(v14) = 0;
    if (!sub_1906CB57C(115, 0)) {
      return v14 & 1;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      goto LABEL_78;
    }
    goto LABEL_64;
  }
  vertices = self->_vertices;
  if (!vertices)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
    }
    v32 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v32, OS_LOG_TYPE_ERROR, "#polygon,#warning No points data found for polygon", buf, 2u);
    }
    LOBYTE(v14) = 0;
    if (!sub_1906CB57C(115, 0)) {
      return v14 & 1;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      goto LABEL_78;
    }
LABEL_64:
    v34 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[_CLPolygonalRegion pointInPolygonWithCoordinate:withDistanceToBorder:]", "CoreLocation: %s\n", v34);
    if (v34 != (char *)buf) {
      free(v34);
    }
    LOBYTE(v14) = 0;
    return v14 & 1;
  }
  if (!a4)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
    }
    v33 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v33, OS_LOG_TYPE_ERROR, "#polygon,#warning distanceToBorder is nil", buf, 2u);
    }
    LOBYTE(v14) = 0;
    if (!sub_1906CB57C(115, 0)) {
      return v14 & 1;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 == -1) {
      goto LABEL_64;
    }
LABEL_78:
    dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
    goto LABEL_64;
  }
  id v9 = [(NSArray *)vertices objectAtIndex:0];
  [v9 coordinate];
  double v11 = v10;
  [v9 coordinate];
  double v13 = v12;
  if ([(NSArray *)self->_vertices count] >= 2)
  {
    int v14 = 0;
    unint64_t v15 = 1;
    while (1)
    {
      id v16 = [(NSArray *)self->_vertices objectAtIndexedSubscript:v15];
      [v16 coordinate];
      double v18 = v17;
      [v16 coordinate];
      if (v18 != v11 || v19 != v13) {
        break;
      }
      double v18 = v11;
      double v21 = v13;
LABEL_42:
      ++v15;
      double v13 = v21;
      double v11 = v18;
      if (v15 >= [(NSArray *)self->_vertices count]) {
        goto LABEL_68;
      }
    }
    double v21 = v19;
    if ((latitude >= v11 || latitude <= v18) && (latitude <= v11 || latitude >= v18)
      || (v19 <= longitude ? (BOOL v22 = v13 <= longitude) : (BOOL v22 = 0), v22))
    {
      if (latitude != v11 || (latitude > v18 ? (BOOL v23 = v13 <= longitude) : (BOOL v23 = 1), v23))
      {
        BOOL v24 = latitude == v18;
        if (latitude <= v11) {
          BOOL v24 = 0;
        }
        if (v19 <= longitude) {
          BOOL v24 = 0;
        }
        v14 ^= v24;
        goto LABEL_35;
      }
    }
    else if (v13 + (v19 - v13) * ((latitude - v11) / (v18 - v11)) <= longitude)
    {
      goto LABEL_35;
    }
    v14 ^= 1u;
LABEL_35:
    double v25 = v18 - v11;
    double v26 = v19 - v13;
    double v27 = ((longitude - v13) * (v21 - v13) + (latitude - v11) * (v18 - v11)) / (v26 * v26 + v25 * v25);
    if (v27 <= 0.0)
    {
      double v28 = v11;
      double v29 = v13;
    }
    else
    {
      double v28 = v18;
      double v29 = v21;
      if (v27 < 1.0)
      {
        double v28 = v11 + v27 * v25;
        double v29 = v13 + v27 * v26;
      }
    }
    long double v30 = sub_1906D7AA4(latitude, longitude, v28, v29);
    if (*a4 < 0.0 || v30 < *a4) {
      *a4 = v30;
    }
    goto LABEL_42;
  }
  LOBYTE(v14) = 0;
LABEL_68:
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
  }
  v35 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v36 = *(void *)a4;
    *(_DWORD *)buf = 134218240;
    uint64_t v40 = v36;
    __int16 v41 = 1024;
    int v42 = v14 & 1;
    _os_log_impl(&dword_1906B8000, v35, OS_LOG_TYPE_DEBUG, "#polygon,distanceToBorder,%.3lf,inRegion %d", buf, 0x12u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005E40);
    }
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[_CLPolygonalRegion pointInPolygonWithCoordinate:withDistanceToBorder:]", "CoreLocation: %s\n", v38);
    if (v38 != (char *)buf) {
      free(v38);
    }
  }
  return v14 & 1;
}

- (NSArray)vertices
{
  return self->_vertices;
}

- (int)geoReferenceFrame
{
  return self->_geoReferenceFrame;
}

- (void)setGeoReferenceFrame:(int)a3
{
  self->_geoReferenceFrame = a3;
}

- (BOOL)allowMonitoringWhileNearby
{
  return self->_allowMonitoringWhileNearby;
}

@end