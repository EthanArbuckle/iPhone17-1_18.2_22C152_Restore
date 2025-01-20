@interface MKMapConfiguration
+ ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfigurationForMapConfiguration:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_mapConfigurationWithCartographicConfiguration:(id *)a3;
+ (id)_potentiallyLossy_mapConfigurationWithCartographicConfiguration:(id *)a3;
- (BOOL)_showsHiking;
- (BOOL)_showsTopographicFeatures;
- (BOOL)_showsTraffic;
- (BOOL)isEqual:(id)a3;
- (MKMapConfiguration)initWithCoder:(id)a3;
- (MKMapConfiguration)initWithElevationStyle:(int64_t)a3;
- (MKMapElevationStyle)elevationStyle;
- (MKPointOfInterestFilter)_pointOfInterestFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5;
- (void)_removeObserver:(id)a3 context:(void *)a4;
- (void)_setInternalStateFromMapConfiguration:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setElevationStyle:(MKMapElevationStyle)elevationStyle;
- (void)set_pointOfInterestFilter:(id)a3;
- (void)set_showsHiking:(BOOL)a3;
- (void)set_showsTopographicFeatures:(BOOL)a3;
- (void)set_showsTraffic:(BOOL)a3;
@end

@implementation MKMapConfiguration

- (void).cxx_destruct
{
}

- (BOOL)_showsTraffic
{
  return self->_showsTraffic;
}

- (BOOL)_showsHiking
{
  return self->_showsHiking;
}

- (BOOL)_showsTopographicFeatures
{
  return self->_showsTopographicFeatures;
}

- (MKPointOfInterestFilter)_pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

+ ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfigurationForMapConfiguration:(SEL)a3
{
  id v10 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v10;
    uint64_t v6 = [v5 emphasisStyle];
    if (!v6)
    {
LABEL_21:
      _MKCartographicConfigurationForMapType(v6, (uint64_t)retstr);

      goto LABEL_22;
    }
    if ([v5 emphasisStyle] == 1)
    {
      uint64_t v6 = 5;
      goto LABEL_21;
    }
    if ([v5 emphasisStyle] == 101)
    {
      uint64_t v6 = 109;
      goto LABEL_21;
    }
    if ([v5 emphasisStyle] == 102)
    {
      uint64_t v6 = 110;
      goto LABEL_21;
    }

LABEL_27:
    *(_OWORD *)&retstr->var0 = xmmword_18BD1B110;
    retstr->var2 = 0;
    retstr->var3 = 0;
    *(_OWORD *)&retstr->var4 = xmmword_18BD1B170;
    retstr->var6 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 elevationStyle]) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 2;
    }
LABEL_13:
    _MKCartographicConfigurationForMapType(v7, (uint64_t)retstr);
LABEL_22:
    v8 = v10;
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v10 elevationStyle]) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 1;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_27;
  }
  v8 = v10;
  if (v10)
  {
    [v10 cartographicConfiguration];
    goto LABEL_22;
  }
  *(void *)&retstr->var6 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
LABEL_23:

  return result;
}

- (MKMapElevationStyle)elevationStyle
{
  return self->_elevationStyle;
}

- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  [(MKMapConfiguration *)self addObserver:v8 forKeyPath:@"elevationStyle" options:a4 context:a5];
  [(MKMapConfiguration *)self addObserver:v8 forKeyPath:@"_showsTraffic" options:a4 context:a5];
  [(MKMapConfiguration *)self addObserver:v8 forKeyPath:@"_pointOfInterestFilter" options:a4 context:a5];
  [(MKMapConfiguration *)self addObserver:v8 forKeyPath:@"_showsHiking" options:a4 context:a5];
  [(MKMapConfiguration *)self addObserver:v8 forKeyPath:@"_showsTopographicFeatures" options:a4 context:a5];
}

- (void)_removeObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  [(MKMapConfiguration *)self removeObserver:v6 forKeyPath:@"elevationStyle" context:a4];
  [(MKMapConfiguration *)self removeObserver:v6 forKeyPath:@"_showsTraffic" context:a4];
  [(MKMapConfiguration *)self removeObserver:v6 forKeyPath:@"_pointOfInterestFilter" context:a4];
  [(MKMapConfiguration *)self removeObserver:v6 forKeyPath:@"_showsHiking" context:a4];
  [(MKMapConfiguration *)self removeObserver:v6 forKeyPath:@"_showsTopographicFeatures" context:a4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 24) = self->_elevationStyle;
  *(unsigned char *)(v5 + 8) = self->_showsTraffic;
  *(unsigned char *)(v5 + 9) = self->_showsHiking;
  *(unsigned char *)(v5 + 10) = self->_showsTopographicFeatures;
  id v6 = [(MKPointOfInterestFilter *)self->_pointOfInterestFilter copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (void)_setInternalStateFromMapConfiguration:(id)a3
{
  id v4 = a3;
  -[MKMapConfiguration set_showsTraffic:](self, "set_showsTraffic:", [v4 _showsTraffic]);
  -[MKMapConfiguration set_showsHiking:](self, "set_showsHiking:", [v4 _showsHiking]);
  -[MKMapConfiguration set_showsTopographicFeatures:](self, "set_showsTopographicFeatures:", [v4 _showsTopographicFeatures]);
  id v5 = [v4 _pointOfInterestFilter];

  [(MKMapConfiguration *)self set_pointOfInterestFilter:v5];
}

- (void)set_showsTraffic:(BOOL)a3
{
  self->_showsTraffic = a3;
}

- (void)set_showsHiking:(BOOL)a3
{
  self->_showsHiking = a3;
}

- (void)set_showsTopographicFeatures:(BOOL)a3
{
  self->_showsTopographicFeatures = a3;
}

- (void)set_pointOfInterestFilter:(id)a3
{
}

+ (id)_mapConfigurationWithCartographicConfiguration:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var2;
  long long v14 = *(_OWORD *)&a3->var0;
  long long v15 = v5;
  long long v16 = *(_OWORD *)&a3->var4;
  uint64_t v17 = *(void *)&a3->var6;
  id v6 = objc_msgSend(a1, "_potentiallyLossy_mapConfigurationWithCartographicConfiguration:", &v14);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (uint64_t v17 = 0,
        long long v15 = 0u,
        long long v16 = 0u,
        long long v14 = 0u,
        [a1 _cartographicConfigurationForMapConfiguration:v6],
        _MKCartographicConfigurationEquals((uint64_t)&v14, (uint64_t)a3)))
  {
    uint64_t v7 = v6;
  }
  else
  {
    id v8 = [_MKCartographicMapConfiguration alloc];
    long long v9 = *(_OWORD *)&a3->var2;
    v12[0] = *(_OWORD *)&a3->var0;
    v12[1] = v9;
    v12[2] = *(_OWORD *)&a3->var4;
    uint64_t v13 = *(void *)&a3->var6;
    uint64_t v7 = [(_MKCartographicMapConfiguration *)v8 initWithCartographicConfiguration:v12];
  }
  id v10 = v7;

  return v10;
}

+ (id)_potentiallyLossy_mapConfigurationWithCartographicConfiguration:(id *)a3
{
  unint64_t v4 = a3->var3 - 1;
  uint64_t v5 = _MKMapTypeForCartographicConfiguration(&a3->var0);
  switch(v5)
  {
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
LABEL_2:
      id v6 = [_MKCartographicMapConfiguration alloc];
      long long v7 = *(_OWORD *)&a3->var2;
      v17[0] = *(_OWORD *)&a3->var0;
      v17[1] = v7;
      v17[2] = *(_OWORD *)&a3->var4;
      uint64_t v18 = *(void *)&a3->var6;
      id v8 = [(_MKCartographicMapConfiguration *)v6 initWithCartographicConfiguration:v17];
      break;
    case 'm':
      v11 = [MKStandardMapConfiguration alloc];
      BOOL v12 = v4 < 2;
      uint64_t v13 = 101;
      goto LABEL_15;
    case 'n':
      v11 = [MKStandardMapConfiguration alloc];
      BOOL v12 = v4 < 2;
      uint64_t v13 = 102;
LABEL_15:
      id v8 = [(MKStandardMapConfiguration *)v11 initWithElevationStyle:v12 emphasisStyle:v13];
      break;
    default:
      switch(v5)
      {
        case 0:
          long long v9 = [MKStandardMapConfiguration alloc];
          BOOL v10 = v4 < 2;
          goto LABEL_13;
        case 1:
          long long v14 = MKImageryMapConfiguration;
          goto LABEL_9;
        case 2:
          long long v14 = MKHybridMapConfiguration;
LABEL_9:
          long long v9 = (MKStandardMapConfiguration *)[v14 alloc];
          BOOL v10 = 0;
          goto LABEL_13;
        case 3:
          long long v15 = MKImageryMapConfiguration;
          goto LABEL_12;
        case 4:
          long long v15 = MKHybridMapConfiguration;
LABEL_12:
          long long v9 = (MKStandardMapConfiguration *)[v15 alloc];
          BOOL v10 = 1;
LABEL_13:
          id v8 = [(MKStandardMapConfiguration *)v9 initWithElevationStyle:v10];
          break;
        case 5:
          v11 = [MKStandardMapConfiguration alloc];
          BOOL v12 = v4 < 2;
          uint64_t v13 = 1;
          goto LABEL_15;
        default:
          goto LABEL_2;
      }
      break;
  }

  return v8;
}

- (MKMapConfiguration)initWithElevationStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKMapConfiguration;
  result = [(MKMapConfiguration *)&v5 init];
  if (result) {
    result->_elevationStyle = a3;
  }
  return result;
}

- (void)setElevationStyle:(MKMapElevationStyle)elevationStyle
{
  self->_elevationStyle = elevationStyle;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t elevationStyle = self->_elevationStyle;
  id v5 = a3;
  [v5 encodeInteger:elevationStyle forKey:@"MKMapConfigurationElevationStyle"];
  [v5 encodeBool:self->_showsTraffic forKey:@"MKMapConfigurationShowsTraffic"];
  [v5 encodeBool:self->_showsHiking forKey:@"MKMapConfigurationShowsHiking"];
  [v5 encodeBool:self->_showsTopographicFeatures forKey:@"MKMapConfigurationShowsTopographicFeatures"];
  [v5 encodeObject:self->_pointOfInterestFilter forKey:@"MKMapConfigurationPointOfInterestFilter"];
}

- (MKMapConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t elevationStyle = [v4 decodeIntegerForKey:@"MKMapConfigurationElevationStyle"];
  id v5 = @"MKMapConfigurationShowsTraffic";
  if (([v4 containsValueForKey:@"MKMapConfigurationShowsTraffic"] & 1) != 0
    || (id v5 = @"MKHybridMapConfigurationShowsTraffic",
        ([v4 containsValueForKey:@"MKHybridMapConfigurationShowsTraffic"] & 1) != 0)
    || (id v5 = @"MKStandardMapConfigurationShowsTraffic",
        [v4 containsValueForKey:@"MKStandardMapConfigurationShowsTraffic"]))
  {
    self->_showsTraffic = [v4 decodeBoolForKey:v5];
  }
  if ([v4 containsValueForKey:@"MKMapConfigurationPointOfInterestFilter"])
  {
    uint64_t v6 = objc_opt_class();
    long long v7 = @"MKMapConfigurationPointOfInterestFilter";
LABEL_11:
    id v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    pointOfInterestFilter = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = v8;

    goto LABEL_12;
  }
  if ([v4 containsValueForKey:@"MKHybridMapConfigurationPointOfInterestFilter"])
  {
    uint64_t v6 = objc_opt_class();
    long long v7 = @"MKHybridMapConfigurationPointOfInterestFilter";
    goto LABEL_11;
  }
  if ([v4 containsValueForKey:@"MKStandardMapConfigurationPointOfInterestFilter"])
  {
    uint64_t v6 = objc_opt_class();
    long long v7 = @"MKStandardMapConfigurationPointOfInterestFilter";
    goto LABEL_11;
  }
LABEL_12:
  self->_showsHiking = [v4 decodeBoolForKey:@"MKMapConfigurationShowsHiking"];
  self->_showsTopographicFeatures = [v4 decodeBoolForKey:@"MKMapConfigurationShowsTopographicFeatures"];
  BOOL v10 = [(MKMapConfiguration *)self initWithElevationStyle:self->_elevationStyle];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    int64_t elevationStyle = self->_elevationStyle;
    if (elevationStyle == [v5 elevationStyle]
      && (int showsHiking = self->_showsHiking, showsHiking == [v5 _showsHiking]))
    {
      int showsTopographicFeatures = self->_showsTopographicFeatures;
      BOOL v9 = showsTopographicFeatures == [v5 _showsTopographicFeatures];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end