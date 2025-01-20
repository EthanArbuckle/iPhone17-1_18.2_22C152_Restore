@interface CLRacingRouteParameters
+ (BOOL)supportsSecureCoding;
- (CLRacingRouteParameters)initWithCoder:(id)a3;
- (CLRacingRouteParameters)initWithRouteMatrixIndexVec:(id)a3 racingRouteVariables:(id)a4 startPointOnCurrentRoute:(id)a5 startPointOnReferenceRoute:(id)a6 lastOnRouteDataPoint:(id)a7 lastProjectedDataPoint:(id)a8 routeBoundingBox:(id)a9;
- (CLRacingRouteState)lastOnRouteDataPoint;
- (CLRacingRouteState)lastProjectedDataPoint;
- (CLRacingRouteState)startPointOnCurrentRoute;
- (CLRacingRouteState)startPointOnReferenceRoute;
- (CLRacingRouteVariables)racingRouteVariables;
- (CLRouteBoundingBox)routeBoundingBox;
- (NSArray)routeMatrixIndexVec;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLRacingRouteParameters

- (CLRacingRouteParameters)initWithRouteMatrixIndexVec:(id)a3 racingRouteVariables:(id)a4 startPointOnCurrentRoute:(id)a5 startPointOnReferenceRoute:(id)a6 lastOnRouteDataPoint:(id)a7 lastProjectedDataPoint:(id)a8 routeBoundingBox:(id)a9
{
  v17.receiver = self;
  v17.super_class = (Class)CLRacingRouteParameters;
  v15 = [(CLRacingRouteParameters *)&v17 init];
  if (v15)
  {
    v15->_routeMatrixIndexVec = (NSArray *)[a3 copy];
    v15->_racingRouteVariables = (CLRacingRouteVariables *)[a4 copy];
    v15->_startPointOnCurrentRoute = (CLRacingRouteState *)[a5 copy];
    v15->_startPointOnReferenceRoute = (CLRacingRouteState *)[a6 copy];
    v15->_lastOnRouteDataPoint = (CLRacingRouteState *)[a7 copy];
    v15->_lastProjectedDataPoint = (CLRacingRouteState *)[a8 copy];
    v15->_routeBoundingBox = (CLRouteBoundingBox *)[a9 copy];
  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[CLRacingRouteParameters alloc] initWithRouteMatrixIndexVec:self->_routeMatrixIndexVec racingRouteVariables:self->_racingRouteVariables startPointOnCurrentRoute:self->_startPointOnCurrentRoute startPointOnReferenceRoute:self->_startPointOnReferenceRoute lastOnRouteDataPoint:self->_lastOnRouteDataPoint lastProjectedDataPoint:self->_lastProjectedDataPoint routeBoundingBox:self->_routeBoundingBox];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CLRacingRouteParameters routeMatrixIndexVec](self, "routeMatrixIndexVec"), @"routeMatrixIndexVec");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLRacingRouteParameters racingRouteVariables](self, "racingRouteVariables"), @"racingRouteVariables");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLRacingRouteParameters startPointOnCurrentRoute](self, "startPointOnCurrentRoute"), @"startPointOnCurrentRoute");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLRacingRouteParameters startPointOnReferenceRoute](self, "startPointOnReferenceRoute"), @"startPointOnReferenceRoute");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLRacingRouteParameters lastOnRouteDataPoint](self, "lastOnRouteDataPoint"), @"lastOnRouteDataPoint");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLRacingRouteParameters lastProjectedDataPoint](self, "lastProjectedDataPoint"), @"lastProjectedDataPoint");
  v5 = [(CLRacingRouteParameters *)self routeBoundingBox];

  [a3 encodeObject:v5 forKey:@"routeBoundingBox"];
}

- (CLRacingRouteParameters)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = [CLRacingRouteParameters alloc];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  uint64_t v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 2)), @"routeMatrixIndexVec");
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"racingRouteVariables"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"startPointOnCurrentRoute"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"startPointOnReferenceRoute"];
  uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"lastOnRouteDataPoint"];
  uint64_t v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"lastProjectedDataPoint"];
  uint64_t v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"routeBoundingBox"];
  return -[CLRacingRouteParameters initWithRouteMatrixIndexVec:racingRouteVariables:startPointOnCurrentRoute:startPointOnReferenceRoute:lastOnRouteDataPoint:lastProjectedDataPoint:routeBoundingBox:](v4, "initWithRouteMatrixIndexVec:racingRouteVariables:startPointOnCurrentRoute:startPointOnReferenceRoute:lastOnRouteDataPoint:lastProjectedDataPoint:routeBoundingBox:", v6, v7, v8, v9, v10, v11, v12, v14[0]);
}

- (NSArray)routeMatrixIndexVec
{
  return self->_routeMatrixIndexVec;
}

- (CLRacingRouteVariables)racingRouteVariables
{
  return self->_racingRouteVariables;
}

- (CLRacingRouteState)startPointOnCurrentRoute
{
  return self->_startPointOnCurrentRoute;
}

- (CLRacingRouteState)startPointOnReferenceRoute
{
  return self->_startPointOnReferenceRoute;
}

- (CLRacingRouteState)lastOnRouteDataPoint
{
  return self->_lastOnRouteDataPoint;
}

- (CLRacingRouteState)lastProjectedDataPoint
{
  return self->_lastProjectedDataPoint;
}

- (CLRouteBoundingBox)routeBoundingBox
{
  return self->_routeBoundingBox;
}

@end