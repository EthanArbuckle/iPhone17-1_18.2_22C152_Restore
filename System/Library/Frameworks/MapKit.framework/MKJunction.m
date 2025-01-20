@interface MKJunction
+ (BOOL)supportsSecureCoding;
- (BOOL)_willSnapToNinetyDegreesForManeuverTypes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)rightOrLeftTurnWillSnapToNinetyDegrees;
- (BOOL)willSnapToRightHandTurn;
- (BOOL)willSnapToSharpRight;
- (MKJunction)initWithCoder:(id)a3;
- (MKJunction)initWithJunction:(id)a3;
- (MKJunction)initWithType:(int)a3 maneuver:(int)a4 drivingSide:(int)a5 elements:(GEOJunctionElement *)a6 count:(unint64_t)a7;
- (id)description;
- (id)roundaboutArrowWithSize:(CGSize)a3 metrics:(id *)a4 outerRadius:(double)a5 endAngle:(double)a6 pivot:(CGPoint *)a7;
- (int)type;
- (unint64_t)hash;
- (void)_addJunctionStemCapToPath:(id)a3 fromStartPoint:(CGPoint)a4 topEndPoint:(CGPoint)a5 cornerRadius:(double)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getArrowPath:(id *)a3 arrowStrokePath:(id *)a4 intersectionBackgroundPath:(id *)a5 strokePath:(id *)a6 withSize:(CGSize)a7 metrics:(id *)a8 drivingSide:(int)a9 visualCenter:(CGPoint *)a10;
- (void)getArrowPath:(id *)a3 arrowStrokePath:(id *)a4 pivot:(CGPoint *)a5 withSize:(CGSize)a6 metrics:(id *)a7 visualCenter:(CGPoint *)a8;
- (void)getRoundaboutArrowPath:(id *)a3 intersectionBackgroundPath:(id *)a4 strokePath:(id *)a5 withSize:(CGSize)a6 metrics:(id *)a7 drivingSide:(int)a8 visualCenter:(CGPoint *)a9;
@end

@implementation MKJunction

- (MKJunction)initWithJunction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 junctionType];
  uint64_t v6 = [v4 maneuverType];
  uint64_t v7 = [v4 drivingSide];
  uint64_t v8 = [v4 elements];
  uint64_t v9 = [v4 numElements];

  return [(MKJunction *)self initWithType:v5 maneuver:v6 drivingSide:v7 elements:v8 count:v9];
}

- (MKJunction)initWithType:(int)a3 maneuver:(int)a4 drivingSide:(int)a5 elements:(GEOJunctionElement *)a6 count:(unint64_t)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)MKJunction;
  v12 = [(MKJunction *)&v34 init];
  v13 = v12;
  if (!v12)
  {
LABEL_43:
    v14 = v13;
    goto LABEL_44;
  }
  v14 = 0;
  if (((a4 - 4) > 0x3E || ((1 << (a4 - 4)) & 0x7000000086400081) == 0) && a4 != 88)
  {
    v14 = 0;
    BOOL v15 = (a4 & 0xFFFFFFFE) != 0x14 || a7 > 2;
    BOOL v16 = v15;
    if (a7 && v16)
    {
      uint64_t v17 = 8;
      unint64_t v18 = a7;
      while (*(int *)((char *)&a6->var0 + v17) != 2)
      {
        v14 = 0;
        v17 += 16;
        if (!--v18) {
          goto LABEL_44;
        }
      }
      v12->_type = a3;
      v12->_maneuver = a4;
      unsigned int v19 = 1;
      v12->_drivingSide = a5;
      if (a4 <= 59)
      {
        switch(a4)
        {
          case 20:
          case 27:
            goto LABEL_23;
          case 21:
          case 28:
            goto LABEL_22;
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
            goto LABEL_45;
          default:
            if (a4 == 1) {
              goto LABEL_23;
            }
            if (a4 == 2) {
              goto LABEL_22;
            }
            goto LABEL_45;
        }
      }
      switch(a4)
      {
        case '<':
        case '>':
          break;
        case '=':
        case '?':
LABEL_22:
          unsigned int v19 = 2;
          break;
        default:
LABEL_45:
          unsigned int v19 = 0;
          break;
      }
LABEL_23:
      v20 = (GEOJunctionElement *)malloc_type_calloc(0x10uLL, a7, 0x39B05E4AuLL);
      v13->_elements = v20;
      memcpy(v20, a6, 16 * a7);
      v13->_count = a7;
      snapped = v13->_snapped;
      MKSnappedRouteFillWithElements((uint64_t)v13->_elements, a7, v13->_snapped, v19);
      if ((a4 - 41) < 0x13)
      {
        uint64_t v22 = (a4 - 40);
        if (v22 > 6) {
          goto LABEL_38;
        }
        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x2020000000;
        uint64_t v42 = 0;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v36 = __MKJunctionManeuverShouldShowNAElementsForManeuverTypeInSnappedJunction_block_invoke;
        v37 = &unk_1E54BF2B0;
        v38 = &v39;
        v23 = v35;
        v44[0] = xmmword_18BD1C570;
        v44[1] = xmmword_18BD1B170;
        v44[2] = xmmword_18BD1C580;
        uint64_t v45 = 5;
        BOOL v24 = a5 == 0;
        uint64_t v25 = a5 ? 6 : 0;
        uint64_t v26 = 7;
        if (v24)
        {
          uint64_t v27 = 1;
        }
        else
        {
          uint64_t v26 = -1;
          uint64_t v27 = -1;
        }
        char v43 = 0;
        uint64_t v28 = v26 - v27;
        do
        {
          v36((uint64_t)v23, *((void *)v44 + v25), (uint64_t)snapped[*((void *)v44 + v25)], &v43);
          if (v43) {
            BOOL v29 = 1;
          }
          else {
            BOOL v29 = v28 == v25;
          }
          v25 += v27;
        }
        while (!v29);

        uint64_t v30 = v40[3];
        _Block_object_dispose(&v39, 8);
        if (v30 != v22)
        {
LABEL_38:
          for (uint64_t i = 0; i != 8; ++i)
          {
            v32 = snapped[i];
            if (v32 && v32->var2 != 2) {
              snapped[i] = 0;
            }
          }
        }
      }
      goto LABEL_43;
    }
  }
LABEL_44:

  return v14;
}

- (void)dealloc
{
  free(self->_elements);
  v3.receiver = self;
  v3.super_class = (Class)MKJunction;
  [(MKJunction *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = 0;
  if (objc_opt_isKindOfClass())
  {
    for (unint64_t i = 0; i != 8; ++i)
    {
      uint64_t v7 = v4[i + 5];
      unint64_t v8 = (unint64_t)self->_snapped[i];
      if (v7) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {
        if (v7 | v8) {
          break;
        }
      }
      else if (*(_DWORD *)(v7 + 4) != *(_DWORD *)(v8 + 4) || *(_DWORD *)(v7 + 8) != *(_DWORD *)(v8 + 8))
      {
        break;
      }
      BOOL v5 = i > 6;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(id)objc_opt_class() hash];
  uint64_t v4 = 0;
  snapped = self->_snapped;
  do
  {
    if (snapped[v4]) {
      v3 ^= PBHashBytes();
    }
    ++v4;
  }
  while (v4 != 8);
  return v3;
}

- (id)description
{
  unint64_t v3 = objc_opt_new();
  if (self->_count)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = &self->_elements[v4];
      uint64_t v7 = [NSString stringWithFormat:@"<GEOJunctionElement angle: %ld (%u), type: %ld (%u), usage: %ld (%u)>", v6->var0, *(unsigned char *)&v6->var3 & 1, v6->var1, (*(unsigned char *)&v6->var3 >> 1) & 1, v6->var2, (*(unsigned char *)&v6->var3 >> 2) & 1];
      [v3 addObject:v7];

      ++v5;
      ++v4;
    }
    while (v5 < self->_count);
  }
  unint64_t v8 = NSString;
  BOOL v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v3 componentsJoinedByString:@", "];
  int type = self->_type;
  if (type)
  {
    if (type == 1)
    {
      v13 = @"JCTTYPE_ROUNDABOUT";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13 = @"JCTTYPE_NORMAL";
  }
  v14 = @"NO_TURN";
  switch(self->_maneuver)
  {
    case 0:
      break;
    case 1:
      v14 = @"LEFT_TURN";
      break;
    case 2:
      v14 = @"RIGHT_TURN";
      break;
    case 3:
      v14 = @"STRAIGHT_AHEAD";
      break;
    case 4:
      v14 = @"U_TURN";
      break;
    case 5:
      v14 = @"FOLLOW_ROAD";
      break;
    case 6:
      v14 = @"ENTER_ROUNDABOUT";
      break;
    case 7:
      v14 = @"EXIT_ROUNDABOUT";
      break;
    case 0xB:
      v14 = @"OFF_RAMP";
      break;
    case 0xC:
      v14 = @"ON_RAMP";
      break;
    case 0x10:
      v14 = @"ARRIVE_END_OF_NAVIGATION";
      break;
    case 0x11:
      v14 = @"START_ROUTE";
      break;
    case 0x12:
      v14 = @"ARRIVE_AT_DESTINATION";
      break;
    case 0x14:
      v14 = @"KEEP_LEFT";
      break;
    case 0x15:
      v14 = @"KEEP_RIGHT";
      break;
    case 0x16:
      v14 = @"ENTER_FERRY";
      break;
    case 0x17:
      v14 = @"EXIT_FERRY";
      break;
    case 0x18:
      v14 = @"CHANGE_FERRY";
      break;
    case 0x19:
      v14 = @"START_ROUTE_WITH_U_TURN";
      break;
    case 0x1A:
      v14 = @"U_TURN_AT_ROUNDABOUT";
      break;
    case 0x1B:
      v14 = @"LEFT_TURN_AT_END";
      break;
    case 0x1C:
      v14 = @"RIGHT_TURN_AT_END";
      break;
    case 0x1D:
      v14 = @"HIGHWAY_OFF_RAMP_LEFT";
      break;
    case 0x1E:
      v14 = @"HIGHWAY_OFF_RAMP_RIGHT";
      break;
    case 0x21:
      v14 = @"ARRIVE_AT_DESTINATION_LEFT";
      break;
    case 0x22:
      v14 = @"ARRIVE_AT_DESTINATION_RIGHT";
      break;
    case 0x23:
      v14 = @"U_TURN_WHEN_POSSIBLE";
      break;
    case 0x27:
      v14 = @"ARRIVE_END_OF_DIRECTIONS";
      break;
    case 0x29:
      v14 = @"ROUNDABOUT_EXIT_1";
      break;
    case 0x2A:
      v14 = @"ROUNDABOUT_EXIT_2";
      break;
    case 0x2B:
      v14 = @"ROUNDABOUT_EXIT_3";
      break;
    case 0x2C:
      v14 = @"ROUNDABOUT_EXIT_4";
      break;
    case 0x2D:
      v14 = @"ROUNDABOUT_EXIT_5";
      break;
    case 0x2E:
      v14 = @"ROUNDABOUT_EXIT_6";
      break;
    case 0x2F:
      v14 = @"ROUNDABOUT_EXIT_7";
      break;
    case 0x30:
      v14 = @"ROUNDABOUT_EXIT_8";
      break;
    case 0x31:
      v14 = @"ROUNDABOUT_EXIT_9";
      break;
    case 0x32:
      v14 = @"ROUNDABOUT_EXIT_10";
      break;
    case 0x33:
      v14 = @"ROUNDABOUT_EXIT_11";
      break;
    case 0x34:
      v14 = @"ROUNDABOUT_EXIT_12";
      break;
    case 0x35:
      v14 = @"ROUNDABOUT_EXIT_13";
      break;
    case 0x36:
      v14 = @"ROUNDABOUT_EXIT_14";
      break;
    case 0x37:
      v14 = @"ROUNDABOUT_EXIT_15";
      break;
    case 0x38:
      v14 = @"ROUNDABOUT_EXIT_16";
      break;
    case 0x39:
      v14 = @"ROUNDABOUT_EXIT_17";
      break;
    case 0x3A:
      v14 = @"ROUNDABOUT_EXIT_18";
      break;
    case 0x3B:
      v14 = @"ROUNDABOUT_EXIT_19";
      break;
    case 0x3C:
      v14 = @"SHARP_LEFT_TURN";
      break;
    case 0x3D:
      v14 = @"SHARP_RIGHT_TURN";
      break;
    case 0x3E:
      v14 = @"SLIGHT_LEFT_TURN";
      break;
    case 0x3F:
      v14 = @"SLIGHT_RIGHT_TURN";
      break;
    case 0x40:
      v14 = @"CHANGE_HIGHWAY";
      break;
    case 0x41:
      v14 = @"CHANGE_HIGHWAY_LEFT";
      break;
    case 0x42:
      v14 = @"CHANGE_HIGHWAY_RIGHT";
      break;
    case 0x50:
      v14 = @"TOLL_STATION";
      break;
    case 0x51:
      v14 = @"ENTER_TUNNEL";
      break;
    case 0x52:
      v14 = @"WAYPOINT_STOP";
      break;
    case 0x53:
      v14 = @"WAYPOINT_STOP_LEFT";
      break;
    case 0x54:
      v14 = @"WAYPOINT_STOP_RIGHT";
      break;
    case 0x55:
      v14 = @"RESUME_ROUTE";
      break;
    case 0x56:
      v14 = @"RESUME_ROUTE_WITH_U_TURN";
      break;
    case 0x57:
      v14 = @"CUSTOM";
      break;
    case 0x58:
      v14 = @"TURN_AROUND";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_maneuver);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  BOOL v15 = [v8 stringWithFormat:@"<%@: %p, elements: %@, type: %@, maneuver: %@>", v10, self, v11, v13, v14];

  return v15;
}

- (BOOL)willSnapToSharpRight
{
  if (self->_maneuver != 2) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = -1;
  do
  {
    uint64_t v4 = self->_snapped[v2];
    if (v4)
    {
      if (v4->var2 == 2) {
        uint64_t v3 = v2;
      }
    }
    ++v2;
  }
  while (v2 != 8);
  return ((v3 - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)willSnapToRightHandTurn
{
  return [(MKJunction *)self _willSnapToNinetyDegreesForManeuverTypes:&unk_1ED97F620];
}

- (BOOL)rightOrLeftTurnWillSnapToNinetyDegrees
{
  return [(MKJunction *)self _willSnapToNinetyDegreesForManeuverTypes:&unk_1ED97F638];
}

- (BOOL)_willSnapToNinetyDegreesForManeuverTypes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [NSNumber numberWithInt:self->_maneuver];
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = -1;
    do
    {
      BOOL v9 = self->_snapped[v7];
      if (v9 && v9->var2 == 2) {
        uint64_t v8 = v7;
      }
      ++v7;
    }
    while (v7 != 8);
    BOOL v10 = ((v8 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)getArrowPath:(id *)a3 arrowStrokePath:(id *)a4 intersectionBackgroundPath:(id *)a5 strokePath:(id *)a6 withSize:(CGSize)a7 metrics:(id *)a8 drivingSide:(int)a9 visualCenter:(CGPoint *)a10
{
  double height = a7.height;
  double width = a7.width;
  if (self->_type == 1)
  {
    uint64_t v17 = *(void *)&a9;
    memcpy(__dst, a8, sizeof(__dst));
    -[MKJunction getRoundaboutArrowPath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:](self, "getRoundaboutArrowPath:intersectionBackgroundPath:strokePath:withSize:metrics:drivingSide:visualCenter:", a3, a5, a6, __dst, v17, a10, width, height);
    return;
  }
  if (a5)
  {
    unsigned int v19 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPath", a3, a4, a5, a6, a8, *(void *)&a9);
  }
  else
  {
    unsigned int v19 = 0;
  }
  v98 = a5;
  if (a6)
  {
    v20 = [MEMORY[0x1E4F427D0] bezierPath];
  }
  else
  {
    v20 = 0;
  }
  double var3 = a8->var3;
  double v108 = 0.0;
  double v109 = 0.0;
  memcpy(__dst, a8, sizeof(__dst));
  -[MKJunction getArrowPath:arrowStrokePath:pivot:withSize:metrics:visualCenter:](self, "getArrowPath:arrowStrokePath:pivot:withSize:metrics:visualCenter:", a3, a4, &v108, __dst, a10, width, height);
  double var6 = a8->var6;
  double v22 = var3 * 0.5;
  double v23 = v108;
  double v24 = v109;
  double v25 = width - v108;
  double v26 = height - v109;
  uint64_t v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  char v28 = 0;
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v30 = self->_snapped[i];
    if (v30 && v30->var2 == 2)
    {
      if ((i & 0x7FFFFFFFFFFFFFF9) != 0) {
        uint64_t v31 = 337;
      }
      else {
        uint64_t v31 = 336;
      }
      char v28 = *(&a8->var0 + v31);
    }
  }
  uint64_t v32 = 0;
  double v100 = fmin(fmin(fmin(v23, v24), v25), v26);
  do
  {
    v33 = self->_snapped[v32];
    if (v33 && (v33->var2 == 0) | v28 & 1)
    {
      double v34 = (double)v32 * 0.785398163 + -1.57079633;
      __double2 v35 = __sincos_stret(v34 + -1.57079633);
      v36 = objc_alloc_init(_MKJunctionElement);
      -[_MKJunctionElement setLeftBasePoint:](v36, "setLeftBasePoint:", v22 * v35.__cosval, v22 * v35.__sinval);
      -[_MKJunctionElement setRightBasePoint:](v36, "setRightBasePoint:", var3 * -0.5 * v35.__cosval, var3 * -0.5 * v35.__sinval);
      [(_MKJunctionElement *)v36 setAngle:v34];
      [v27 addObject:v36];
    }
    ++v32;
  }
  while (v32 != 8);
  if (var6 >= v22) {
    double v37 = var3 * 0.5;
  }
  else {
    double v37 = var6;
  }
  double v38 = v100 - v37;
  if ([v27 count] == 1)
  {
    uint64_t v39 = [v27 lastObject];
    [v39 leftBasePoint];
    double v41 = v40;
    double v43 = v42;
    [v39 rightBasePoint];
    double v103 = v44;
    double v46 = v45;
    [v39 leftEdgePointAtDistanceFromBase:v38];
    double v48 = v47;
    double v50 = v49;
    [v39 rightEdgePointAtDistanceFromBase:v38];
    double v52 = v51;
    double v54 = v53;
    objc_msgSend(v19, "moveToPoint:", v41, v43);
    objc_msgSend(v19, "addLineToPoint:", v48, v50);
    if (fabs(v37) > 2.22044605e-16) {
      -[MKJunction _addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:](self, "_addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:", v19, v48, v50, v52, v54, v37);
    }
    objc_msgSend(v19, "addLineToPoint:", v52, v54);
    objc_msgSend(v19, "addLineToPoint:", v103, v46);
    [v19 closePath];
    objc_msgSend(v20, "moveToPoint:", v41, v43);
    objc_msgSend(v20, "addLineToPoint:", v48, v50);
    objc_msgSend(v20, "moveToPoint:", v103, v46);
    objc_msgSend(v20, "addLineToPoint:", v52, v54);
    goto LABEL_77;
  }
  double v99 = v37;
  if ((unint64_t)[v27 count] >= 2)
  {
    double v104 = v100 - v37;
    if (![v27 count])
    {
LABEL_76:
      uint64_t v39 = [v27 objectAtIndex:0];
      [v39 leftEdgePointAtDistanceFromBase:v104];
      objc_msgSend(v19, "addLineToPoint:");
LABEL_77:

      goto LABEL_78;
    }
    uint64_t v55 = 0;
    double v102 = fabs(v37);
    while (1)
    {
      v56 = [v27 objectAtIndex:v55];
      if (v55 == [v27 count] - 1) {
        uint64_t v57 = 0;
      }
      else {
        uint64_t v57 = v55 + 1;
      }
      v58 = [v27 objectAtIndex:v57];
      [v56 angle];
      long double v60 = v59;
      [v56 rightBasePoint];
      double v62 = v61;
      double v64 = v63;
      double v65 = tan(v60);
      double v66 = -v65;
      if (v65 >= 0.0) {
        double v66 = v65;
      }
      if (v66 <= 10000000.0) {
        double v67 = v64 - v65 * v62;
      }
      else {
        double v67 = v62;
      }
      if (v66 <= 10000000.0) {
        double v68 = v65;
      }
      else {
        double v68 = INFINITY;
      }
      [v58 angle];
      long double v70 = v69;
      [v58 leftBasePoint];
      double v72 = v71;
      double v74 = v73;
      double v75 = tan(v70);
      double v76 = -v75;
      if (v75 >= 0.0) {
        double v76 = v75;
      }
      BOOL v77 = v76 <= 10000000.0;
      if (v76 <= 10000000.0) {
        double v78 = v74 - v75 * v72;
      }
      else {
        double v78 = v72;
      }
      if (!v77) {
        double v75 = INFINITY;
      }
      if (v68 == v75)
      {
        double v79 = NAN;
        double v80 = NAN;
      }
      else
      {
        if (v68 == INFINITY)
        {
          double v80 = v67;
LABEL_57:
          double v81 = v104;
          double v79 = v78 + v75 * v80;
          goto LABEL_58;
        }
        if (v75 == INFINITY)
        {
          double v80 = v78;
          double v75 = v68;
          double v78 = v67;
          goto LABEL_57;
        }
        double v78 = v78 - v67;
        double v80 = v78 / (v68 - v75);
        double v79 = v67 + v68 * v80;
      }
      double v81 = v104;
LABEL_58:
      objc_msgSend(v56, "leftEdgePointAtDistanceFromBase:", v81, v78);
      double v83 = v82;
      double v85 = v84;
      [v56 rightEdgePointAtDistanceFromBase:v81];
      double v87 = v86;
      double v89 = v88;
      [v58 leftEdgePointAtDistanceFromBase:v81];
      double v92 = v90;
      double v93 = v91;
      BOOL v94 = fabs(v80) == INFINITY;
      if (fabs(v79) == INFINITY) {
        BOOL v94 = 1;
      }
      if (v94)
      {
        double v79 = (v89 + v91) * 0.5;
        double v80 = (v87 + v90) * 0.5;
      }
      uint64_t v95 = v55;
      if (v55) {
        objc_msgSend(v19, "addLineToPoint:", v83, v85);
      }
      else {
        objc_msgSend(v19, "moveToPoint:", v83, v85);
      }
      if (v102 > 2.22044605e-16) {
        -[MKJunction _addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:](self, "_addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:", v19, v83, v85, v87, v89, v99);
      }
      objc_msgSend(v19, "addLineToPoint:", v87, v89);
      if (v55 == [v27 count] - 1)
      {
        [v56 rightBasePoint];
        objc_msgSend(v19, "addLineToPoint:");
        v96 = [v27 objectAtIndexedSubscript:0];
        [v96 leftBasePoint];
        objc_msgSend(v19, "addLineToPoint:");
      }
      else
      {
        objc_msgSend(v19, "addLineToPoint:", v80, v79);
      }
      objc_msgSend(v20, "moveToPoint:", v87, v89);
      if (v95 == [v27 count] - 1)
      {
        [v56 rightBasePoint];
        objc_msgSend(v20, "addLineToPoint:");
        v97 = [v27 objectAtIndexedSubscript:0];
        [v97 leftBasePoint];
        objc_msgSend(v20, "moveToPoint:");
      }
      else
      {
        objc_msgSend(v20, "addLineToPoint:", v80, v79);
      }
      objc_msgSend(v20, "addLineToPoint:", v92, v93);

      uint64_t v55 = v95 + 1;
      if (v95 + 1 >= (unint64_t)[v27 count]) {
        goto LABEL_76;
      }
    }
  }
LABEL_78:
  memset(__dst, 0, 48);
  CGAffineTransformMakeTranslation((CGAffineTransform *)__dst, v108, v109);
  long long v105 = *(_OWORD *)__dst;
  long long v106 = *(_OWORD *)&__dst[16];
  long long v107 = *(_OWORD *)&__dst[32];
  [v19 applyTransform:&v105];
  long long v105 = *(_OWORD *)__dst;
  long long v106 = *(_OWORD *)&__dst[16];
  long long v107 = *(_OWORD *)&__dst[32];
  [v20 applyTransform:&v105];
  if (v98) {
    id *v98 = v19;
  }
  if (a6) {
    *a6 = v20;
  }
}

- (void)_addJunctionStemCapToPath:(id)a3 fromStartPoint:(CGPoint)a4 topEndPoint:(CGPoint)a5 cornerRadius:(double)a6
{
  double y = a5.y;
  double x = a5.x;
  double v10 = (a4.x + a5.x) * 0.5;
  double v11 = (a4.y + a5.y) * 0.5;
  float v12 = a4.y - v11;
  float v13 = a4.x - v10;
  double v14 = atan2f(v12, v13);
  float v15 = y - v11;
  float v16 = x - v10;
  double v17 = atan2f(v15, v16);

  objc_msgSend(a3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v10, v11, a6, v14, v17);
}

- (void)getArrowPath:(id *)a3 arrowStrokePath:(id *)a4 pivot:(CGPoint *)a5 withSize:(CGSize)a6 metrics:(id *)a7 visualCenter:(CGPoint *)a8
{
  double height = a6.height;
  unint64_t v11 = 0;
  unint64_t v12 = -1;
  do
  {
    float v13 = self->_snapped[v11];
    if (v13 && v13->var2 == 2) {
      unint64_t v12 = v11;
    }
    ++v11;
  }
  while (v11 != 8);
  double v14 = a6.width * 0.5;
  double v15 = *MEMORY[0x1E4F1DAD8];
  double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v17 = 0.0;
  double var27 = 0.0;
  double var26 = 0.0;
  switch(v12)
  {
    case 0uLL:
      double var17 = a7->var17;
      if (var17 != 0.0)
      {
        double var27 = a7->var5.height;
        double var26 = height - var17 - var27;
        double v16 = height - var26;
        double v17 = (height - var26 - var27) * 0.5;
        goto LABEL_14;
      }
      double var26 = height * 0.400000006;
      double v16 = height - height * 0.400000006;
      double v15 = v14;
      double var27 = v16;
      break;
    case 1uLL:
    case 7uLL:
      double var26 = a7->var26;
      double var27 = a7->var27;
      goto LABEL_13;
    case 2uLL:
    case 6uLL:
      double v20 = fmax(a7->var13 - a7->var2, 0.0);
      double var15 = a7->var15;
      double var16 = a7->var16;
      double var26 = var15 - v20;
      double var27 = var16 - v20;
      double v23 = a6.width - (var16 - v20);
      if (v12 == 2) {
        double v15 = var16 - v20;
      }
      else {
        double v15 = v23;
      }
      double v16 = height - var15;
      double v14 = v15;
      break;
    case 3uLL:
    case 5uLL:
      double var26 = a7->var22;
      double var27 = a7->var23;
LABEL_13:
      double v16 = height - var26 + 2.0;
LABEL_14:
      double v15 = v14;
      break;
    default:
      break;
  }
  double v48 = v15;
  double v49 = v16;
  double v24 = [MEMORY[0x1E4F427D0] bezierPath];
  double v25 = [MEMORY[0x1E4F427D0] bezierPath];
  double var2 = a7->var2;
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeTranslation(&v54, v14 - var2 * 0.5, height - v17);
  char v27 = 0;
  if (v12) {
    double v28 = var2 * 0.5;
  }
  else {
    double v28 = 0.0;
  }
  tCGFloat x = -var2;
  double v51 = var26 + var2 * -0.5;
  double v29 = var27 - v28 - a7->var5.height;
  char v30 = 1;
  do
  {
    char v31 = v30;
    CGAffineTransform v53 = v54;
    if (v30) {
      uint64_t v32 = v24;
    }
    else {
      uint64_t v32 = v25;
    }
    id v33 = v32;
    memcpy(__dst, a7, sizeof(__dst));
    MKArrowAppendInitialSegmentToPathInvertingCorners(v33, (uint64_t)__dst, &v53, 0, v51);
    if (v12 <= 7)
    {
      if (((1 << v12) & 0xAA) != 0)
      {
        v52.a = 0.0;
        v52.b = 0.0;
        long long v34 = *(_OWORD *)&v53.a;
        long long v35 = *(_OWORD *)&v53.c;
        long long v36 = *(_OWORD *)&v53.tx;
        double v37 = anglesToExit[v12];
        memcpy(__dst, a7, sizeof(__dst));
        MKArrowAppendCurveToPathWithOptions(v33, v27, (double *)__dst, &v53, &v52.a, v37);
        if ((v31 & 1) != 0 && v12 != 3 && v12 != 5)
        {
          double v48 = *(double *)&v36 + *(double *)&v35 * v52.b + *(double *)&v34 * v52.a;
          double v49 = *((double *)&v36 + 1) + *((double *)&v35 + 1) * v52.b + *((double *)&v34 + 1) * v52.a;
        }
      }
      else
      {
        if (v12 != 2)
        {
          if (v12 != 6) {
            goto LABEL_32;
          }
          CGAffineTransform v52 = v53;
          CGAffineTransformScale((CGAffineTransform *)__dst, &v52, -1.0, 1.0);
          CGAffineTransform v53 = *(CGAffineTransform *)__dst;
          CGAffineTransform v52 = *(CGAffineTransform *)__dst;
          CGAffineTransformTranslate((CGAffineTransform *)__dst, &v52, tx, 0.0);
          CGAffineTransform v53 = *(CGAffineTransform *)__dst;
        }
        memcpy(__dst, a7, sizeof(__dst));
        MKArrowAppendRightAngleCurveToPath(v33, (double *)__dst, &v53);
      }
    }
LABEL_32:
    memcpy(__dst, a7, sizeof(__dst));
    MKArrowAppendSegmentToPath(v33, (uint64_t)__dst, &v53, v29);
    if (a8 != 0 && (v31 & 1) != 0)
    {
      BoundingBoCGFloat x = CGPathGetBoundingBox((CGPathRef)[v33 CGPath]);
      CGFloat x = BoundingBox.origin.x;
      CGFloat y = BoundingBox.origin.y;
      CGFloat width = BoundingBox.size.width;
      CGFloat v41 = BoundingBox.size.height;
      CGFloat MidX = CGRectGetMidX(BoundingBox);
      v57.origin.CGFloat x = x;
      v57.origin.CGFloat y = y;
      v57.size.CGFloat width = width;
      v57.size.double height = v41;
      CGFloat MidY = CGRectGetMidY(v57);
      a8->CGFloat x = MidX;
      a8->CGFloat y = MidY;
    }
    memcpy(__dst, a7, sizeof(__dst));
    MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v33, (uint64_t)__dst, 0, (long long *)&v53, 0.0);

    char v30 = 0;
    char v27 = 1;
  }
  while ((v31 & 1) != 0);
  if (a5)
  {
    a5->CGFloat x = v48;
    a5->CGFloat y = v49;
  }
  if (a3) {
    *a3 = v24;
  }
  if (a4) {
    *a4 = v25;
  }
}

- (id)roundaboutArrowWithSize:(CGSize)a3 metrics:(id *)a4 outerRadius:(double)a5 endAngle:(double)a6 pivot:(CGPoint *)a7
{
  double var2 = a4->var2;
  BOOL v11 = a6 <= 0.0;
  if (a6 <= -3.14159265) {
    BOOL v11 = 0;
  }
  int v12 = a6 >= 3.14159265 || v11;
  double v138 = floor((a3.height - a5) * 0.5) - a4->var21;
  double v13 = a3.height * 0.5;
  if (a7)
  {
    a7->CGFloat x = a3.width * 0.5;
    a7->CGFloat y = v13;
  }
  CGFloat v14 = a3.height - a4->var20;
  double v140 = (a3.width - var2) * 0.5;
  double v141 = a3.width * 0.5;
  double v15 = var2 + v140;
  double v16 = [MEMORY[0x1E4F427D0] bezierPath];
  objc_msgSend(v16, "moveToPoint:", var2 + v140, v14);
  double v129 = v13 + v141 * -0.0;
  double v17 = v129 + (var2 + v140) * 0.0;
  double v18 = sqrt((v141 - v15) * (v141 - v15) + (v13 - v17) * (v13 - v17));
  double v128 = a5 * a5;
  double v19 = sqrt(a5 * a5 - v18 * v18);
  double v20 = atan(INFINITY);
  __double2 v21 = __sincos_stret(v20);
  double v22 = sqrt((var2 + v140 + v19 * v21.__cosval - v15) * (var2 + v140 + v19 * v21.__cosval - v15)+ (v17 + v19 * v21.__sinval - v14) * (v17 + v19 * v21.__sinval - v14));
  double v132 = var2 + v140;
  double v133 = v14;
  double v23 = sqrt((var2 + v140 - v19 * v21.__cosval - v15) * (var2 + v140 - v19 * v21.__cosval - v15)+ (v17 - v19 * v21.__sinval - v14) * (v17 - v19 * v21.__sinval - v14));
  if (v22 >= v23) {
    double v24 = v17 - v19 * v21.__sinval;
  }
  else {
    double v24 = v17 + v19 * v21.__sinval;
  }
  double v126 = v24;
  if (v22 >= v23) {
    double v25 = var2 + v140 - v19 * v21.__cosval;
  }
  else {
    double v25 = var2 + v140 + v19 * v21.__cosval;
  }
  double v134 = v25;
  [v16 addLineToPoint:0x7FF0000000000000];
  __double2 v26 = __sincos_stret(a6);
  double v27 = v141 + v26.__cosval * a5;
  double v28 = v13 + v26.__sinval * a5;
  __double2 v29 = __sincos_stret(a6 + -1.57079633);
  double v30 = v29.__cosval * var2 * 0.5;
  double v136 = v13;
  double v137 = a5;
  double v31 = v27 + v30;
  double v124 = var2;
  double v32 = v29.__sinval * var2 * 0.5;
  double v33 = v28 + v32;
  double v34 = v27 - v30;
  double v35 = v28 - v32;
  *(float *)&double v32 = v33 - v13;
  *(float *)&double v30 = v31 - v141;
  float v36 = atan2f(*(float *)&v32, *(float *)&v30);
  float v37 = v35 - v13;
  float v38 = v34 - v141;
  float v39 = atan2f(v37, v38);
  double v40 = v39;
  double v41 = -v36;
  if (v36 >= 0.0) {
    double v41 = v36;
  }
  if (v39 >= 0.0) {
    double v42 = v39;
  }
  else {
    double v42 = -v40;
  }
  if ((v12 & (v41 < v42)) != 0) {
    double v43 = v36;
  }
  else {
    double v43 = v40;
  }
  BOOL v44 = v43 == v36;
  if ((v12 & v44) != 0) {
    double v45 = v31;
  }
  else {
    double v45 = v34;
  }
  if ((v12 & v44) != 0) {
    double v46 = v33;
  }
  else {
    double v46 = v35;
  }
  if ((v12 & v44) != 0) {
    double v33 = v35;
  }
  else {
    double v34 = v31;
  }
  float v47 = v126 - v136;
  float v48 = v134 - v141;
  double v125 = atan2f(v47, v48);
  double v127 = v43;
  objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v141, v136, v137);
  double v49 = v138 * 0.600000024;
  double v139 = v45;
  double v50 = v45 + v49 * v26.__cosval;
  double v135 = v46;
  double v51 = v46 + v49 * v26.__sinval;
  double v52 = v33;
  objc_msgSend(v16, "addLineToPoint:", v50, v51);
  double v53 = v34 + v49 * v26.__cosval;
  double v54 = v33 + v49 * v26.__sinval;
  objc_msgSend(v16, "addLineToPoint:", v53, v54);
  objc_msgSend(v16, "addLineToPoint:", v34, v33);
  double v122 = v51;
  double v123 = v50;
  if (v34 == v141)
  {
    double v57 = v34;
    double v55 = v136;
    double v59 = v137;
    double v56 = v121;
    double v58 = 0.0;
  }
  else
  {
    double v55 = v136;
    double v56 = (v33 - v136) / (v34 - v141);
    double v57 = v33 - v56 * v34;
    if (v56 == 0.0)
    {
      double v58 = INFINITY;
    }
    else if (v56 == INFINITY)
    {
      double v56 = INFINITY;
      double v58 = 0.0;
    }
    else
    {
      double v58 = -1.0 / v56;
    }
    double v59 = v137;
  }
  double v60 = v59 - v124;
  double v61 = fabs(v58);
  BOOL v62 = v61 == INFINITY;
  if (v61 == INFINITY) {
    double v63 = v141;
  }
  else {
    double v63 = v55 - v58 * v141;
  }
  if (v62) {
    double v64 = INFINITY;
  }
  else {
    double v64 = v58;
  }
  CGFloat v130 = v54;
  CGFloat v131 = v53;
  if (v56 == v64)
  {
    double v65 = NAN;
    double v66 = NAN;
    goto LABEL_52;
  }
  if (v56 == INFINITY)
  {
    double v66 = v57;
LABEL_51:
    double v65 = v63 + v64 * v66;
    goto LABEL_52;
  }
  if (v64 == INFINITY)
  {
    double v66 = v63;
    double v64 = v56;
    double v63 = v57;
    goto LABEL_51;
  }
  double v66 = (v63 - v57) / (v56 - v64);
  double v65 = v57 + v56 * v66;
LABEL_52:
  double v67 = sqrt((v55 - v65) * (v55 - v65) + (v141 - v66) * (v141 - v66));
  double v68 = v60 * v60;
  double v69 = sqrt(v60 * v60 - v67 * v67);
  double v70 = atan(v56);
  __double2 v71 = __sincos_stret(v70);
  double v72 = sqrt((v66 + v69 * v71.__cosval - v34) * (v66 + v69 * v71.__cosval - v34)+ (v65 + v69 * v71.__sinval - v52) * (v65 + v69 * v71.__sinval - v52));
  double v73 = sqrt((v66 - v69 * v71.__cosval - v34) * (v66 - v69 * v71.__cosval - v34)+ (v65 - v69 * v71.__sinval - v52) * (v65 - v69 * v71.__sinval - v52));
  if (v72 >= v73) {
    double v74 = v65 - v69 * v71.__sinval;
  }
  else {
    double v74 = v65 + v69 * v71.__sinval;
  }
  if (v72 >= v73) {
    double v75 = v66 - v69 * v71.__cosval;
  }
  else {
    double v75 = v66 + v69 * v71.__cosval;
  }
  double v76 = 0.0;
  if (v139 == v141)
  {
    double v77 = INFINITY;
    double v78 = v139;
  }
  else
  {
    double v77 = (v135 - v55) / (v139 - v141);
    double v78 = v135 - v77 * v139;
    if (v77 == 0.0)
    {
      double v76 = INFINITY;
    }
    else if (v77 == INFINITY)
    {
      double v77 = INFINITY;
    }
    else
    {
      double v76 = -1.0 / v77;
    }
  }
  double v79 = fabs(v76);
  BOOL v80 = v79 == INFINITY;
  if (v79 == INFINITY) {
    double v81 = v141;
  }
  else {
    double v81 = v55 - v76 * v141;
  }
  if (v80) {
    double v76 = INFINITY;
  }
  if (v77 == v76)
  {
    double v82 = NAN;
    double v83 = NAN;
    goto LABEL_77;
  }
  if (v77 == INFINITY)
  {
    double v83 = v78;
LABEL_76:
    double v82 = v81 + v76 * v83;
    goto LABEL_77;
  }
  if (v76 == INFINITY)
  {
    double v83 = v81;
    double v76 = v77;
    double v81 = v78;
    goto LABEL_76;
  }
  double v83 = (v81 - v78) / (v77 - v76);
  double v82 = v78 + v77 * v83;
LABEL_77:
  double v84 = sqrt((v55 - v82) * (v55 - v82) + (v141 - v83) * (v141 - v83));
  double v85 = sqrt(v68 - v84 * v84);
  double v86 = atan(v77);
  __double2 v87 = __sincos_stret(v86);
  double v88 = sqrt((v83 + v85 * v87.__cosval - v139) * (v83 + v85 * v87.__cosval - v139)+ (v82 + v85 * v87.__sinval - v135) * (v82 + v85 * v87.__sinval - v135));
  double v89 = sqrt((v83 - v85 * v87.__cosval - v139) * (v83 - v85 * v87.__cosval - v139)+ (v82 - v85 * v87.__sinval - v135) * (v82 - v85 * v87.__sinval - v135));
  BOOL v90 = v88 < v89;
  if (v88 >= v89) {
    double v91 = v82 - v85 * v87.__sinval;
  }
  else {
    double v91 = v82 + v85 * v87.__sinval;
  }
  if (v90) {
    double v92 = v83 + v85 * v87.__cosval;
  }
  else {
    double v92 = v83 - v85 * v87.__cosval;
  }
  objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", v92, v91, v75, v74, v75, v74);
  objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v141, v55, v60, v127, v125);
  double v93 = 0.0;
  double v94 = v129 + v140 * 0.0;
  double v95 = sqrt((v141 - v140) * (v141 - v140) + (v55 - v94) * (v55 - v94));
  double v96 = sqrt(v128 - v95 * v95);
  double v97 = v94 + v96 * v21.__sinval;
  double v98 = v94 - v96 * v21.__sinval;
  BOOL v99 = sqrt((v140 + v96 * v21.__cosval - v132) * (v140 + v96 * v21.__cosval - v132) + (v97 - v133) * (v97 - v133)) < sqrt((v140 - v96 * v21.__cosval - v132) * (v140 - v96 * v21.__cosval - v132) + (v98 - v133) * (v98 - v133));
  if (v99) {
    double v100 = v97;
  }
  else {
    double v100 = v98;
  }
  if (v99) {
    double v101 = v140 + v96 * v21.__cosval;
  }
  else {
    double v101 = v140 - v96 * v21.__cosval;
  }
  if (v101 == v141)
  {
    double v102 = INFINITY;
    double v103 = v101;
  }
  else
  {
    double v102 = (v100 - v55) / (v101 - v141);
    double v103 = v100 - v102 * v101;
    if (v102 == 0.0)
    {
      double v93 = INFINITY;
    }
    else if (v102 == INFINITY)
    {
      double v102 = INFINITY;
    }
    else
    {
      double v93 = -1.0 / v102;
    }
  }
  double v104 = fabs(v93);
  BOOL v105 = v104 == INFINITY;
  if (v104 == INFINITY) {
    double v106 = v141;
  }
  else {
    double v106 = v55 - v93 * v141;
  }
  if (v105) {
    double v93 = INFINITY;
  }
  if (v102 == v93)
  {
    double v107 = NAN;
    double v108 = NAN;
    goto LABEL_108;
  }
  if (v102 == INFINITY)
  {
    double v108 = v103;
LABEL_107:
    double v107 = v106 + v93 * v108;
    goto LABEL_108;
  }
  if (v93 == INFINITY)
  {
    double v108 = v106;
    double v93 = v102;
    double v106 = v103;
    goto LABEL_107;
  }
  double v108 = (v106 - v103) / (v102 - v93);
  double v107 = v103 + v102 * v108;
LABEL_108:
  double v109 = sqrt((v55 - v107) * (v55 - v107) + (v141 - v108) * (v141 - v108));
  double v110 = sqrt(v68 - v109 * v109);
  double v111 = atan(v102);
  __double2 v112 = __sincos_stret(v111);
  double v113 = v108 + v110 * v112.__cosval;
  double v114 = v107 + v110 * v112.__sinval;
  if (sqrt((v113 - v101) * (v113 - v101) + (v114 - v100) * (v114 - v100)) >= sqrt((v108 - v110 * v112.__cosval - v101)* (v108 - v110 * v112.__cosval - v101)+ (v107 - v110 * v112.__sinval - v100)* (v107 - v110 * v112.__sinval - v100)))
  {
    double v114 = v107 - v110 * v112.__sinval;
    double v113 = v108 - v110 * v112.__cosval;
  }
  objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", v101, v100, v113, v114, v113, v114);
  objc_msgSend(v16, "addLineToPoint:", v140, v133);
  double v115 = (v132 - v140) * 0.5;
  if (a4->var43) {
    double v116 = sqrt((v132 - v140) * (v132 - v140) + v115 * v115) * 0.5;
  }
  else {
    double v116 = 0.0;
  }
  objc_msgSend(v16, "addQuadCurveToPoint:controlPoint:", v132, v133, v140 + v115, v133 + v116);
  [v16 closePath];
  memset(&v143, 0, sizeof(v143));
  CGAffineTransformMakeTranslation(&v143, v131, v130);
  float v117 = v122 - v130;
  float v118 = v123 - v131;
  float v119 = atan2f(v117, v118);
  CGAffineTransform v142 = v143;
  CGAffineTransformRotate((CGAffineTransform *)__dst, &v142, v119);
  CGAffineTransform v143 = *(CGAffineTransform *)__dst;
  memcpy(__dst, a4, sizeof(__dst));
  MKArrowAppendArrowheadToPathAndReturnMetricsWithStemAdjustment(v16, (uint64_t)__dst, 0, (long long *)&v143, 0.0);

  return v16;
}

- (void)getRoundaboutArrowPath:(id *)a3 intersectionBackgroundPath:(id *)a4 strokePath:(id *)a5 withSize:(CGSize)a6 metrics:(id *)a7 drivingSide:(int)a8 visualCenter:(CGPoint *)a9
{
  double height = a6.height;
  uint64_t v15 = 0;
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  double var2 = a7->var2;
  double var19 = a7->var19;
  double width = a6.width;
  if (a6.width >= height) {
    double v17 = height;
  }
  else {
    double v17 = a6.width;
  }
  CGPoint v163 = (CGPoint)0;
  double v18 = 0.0;
  do
  {
    double v19 = self->_snapped[v15];
    if (v19 && v19->var2 == 2) {
      double v18 = (double)v15 * 0.785398163 + -1.57079633;
    }
    ++v15;
  }
  while (v15 != 8);
  double v137 = v17 * (var19 / 55.0);
  double v129 = v137 - var2;
  double v20 = fmod(v18, 6.28318531);
  double v21 = v20;
  if (a8 == 1)
  {
    double v22 = v20 + 6.28318531;
    if (v21 >= 0.0) {
      double v22 = v21;
    }
    double v23 = 3.14159265;
    if (v22 > 3.14159265) {
      double v23 = 9.42477796;
    }
    double v21 = v23 - v22;
  }
  double v126 = a3;
  memcpy(__dst, a7, sizeof(__dst));
  -[MKJunction roundaboutArrowWithSize:metrics:outerRadius:endAngle:pivot:](self, "roundaboutArrowWithSize:metrics:outerRadius:endAngle:pivot:", __dst, &v163, width, height, v137, v21);
  id v125 = (id)objc_claimAutoreleasedReturnValue();
  double v24 = [MEMORY[0x1E4F427D0] bezierPath];
  [v24 addArcWithCenter:1 radius:v163 startAngle:v137 endAngle:0.0 clockwise:6.28318531];
  [v24 addArcWithCenter:0 radius:v163 startAngle:v129 endAngle:6.28318531 clockwise:0.0];
  [v24 closePath];
  double var6 = a7->var6;
  if (v163.x - v137 >= v163.y - v137) {
    double v26 = v163.y - v137;
  }
  else {
    double v26 = v163.x - v137;
  }
  if (v26 >= width - (v163.x - v137)) {
    double v27 = width - (v163.x - v137);
  }
  else {
    double v27 = v26;
  }
  double v28 = height - (v163.y - v137);
  __double2 v29 = [MEMORY[0x1E4F427D0] bezierPath];
  double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v150 = *MEMORY[0x1E4F1DAD8];
  CGFloat v131 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v31 = 0;
  int v32 = a8;
  do
  {
    double v33 = self->_snapped[v31];
    if (v33 && !v33->var2)
    {
      double v34 = NSNumber;
      double v35 = fmod((double)v31 * 0.785398163 + -1.57079633, 6.28318531);
      if (a8 == 1)
      {
        if (v35 < 0.0) {
          double v35 = v35 + 6.28318531;
        }
        if (v35 <= 3.14159265) {
          double v35 = 3.14159265 - v35;
        }
        else {
          double v35 = 9.42477796 - v35;
        }
      }
      float v36 = [v34 numberWithDouble:v35];
      [v131 addObject:v36];
    }
    ++v31;
  }
  while (v31 != 8);
  if (v27 < v28) {
    double v28 = v27;
  }
  if (var6 >= var2 * 0.5) {
    double v37 = var2 * 0.5;
  }
  else {
    double v37 = var6;
  }
  double v136 = v37;
  if (a7->var42 || ![v131 count])
  {
    objc_msgSend(v29, "moveToPoint:", v137 + v163.x, v163.y);
    [v29 addArcWithCenter:1 radius:v163 startAngle:v137 endAngle:0.0 clockwise:6.28318531];
    goto LABEL_39;
  }
  [v131 sortUsingSelector:sel_compare_];
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v38 = v131;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v158 objects:v164 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    double v124 = a5;
    char v41 = 0;
    uint64_t v42 = *(void *)v159;
    double v149 = v137 * v137;
    double v138 = fabs(v136);
    double v139 = v137 + v28 - v136;
    double v43 = v30;
    double v44 = v30;
    double v45 = v150;
    double v134 = v30;
    double v135 = v150;
    double v132 = v30;
    double v133 = v150;
    double v46 = v150;
    while (1)
    {
      uint64_t v47 = 0;
      double v48 = v43;
      double v49 = v45;
      double v50 = v44;
      double v51 = v46;
      do
      {
        double v142 = v51;
        double v143 = v48;
        double v145 = v50;
        double v146 = v49;
        if (*(void *)v159 != v42) {
          objc_enumerationMutation(v38);
        }
        [*(id *)(*((void *)&v158 + 1) + 8 * v47) floatValue];
        long double v53 = v52;
        double x = v163.x;
        __double2 v55 = __sincos_stret(v52 + -1.57079633);
        double v56 = var2 * v55.__cosval * 0.5;
        double y = v163.y;
        double v58 = var2 * v55.__sinval * 0.5;
        double v59 = v163.y + v58;
        double v60 = v163.y - v58;
        __double2 v61 = __sincos_stret(v53);
        double v62 = tan(v53);
        double v63 = -v62;
        if (v62 >= 0.0) {
          double v63 = v62;
        }
        if (v63 <= 10000000.0) {
          double v64 = v59 - v62 * (x + v56);
        }
        else {
          double v64 = x + v56;
        }
        double v65 = INFINITY;
        if (v63 <= 10000000.0) {
          double v66 = v62;
        }
        else {
          double v66 = INFINITY;
        }
        double v67 = v60 - v62 * (x - v56);
        if (v63 > 10000000.0) {
          double v67 = x - v56;
        }
        if (v66 != 0.0)
        {
          double v65 = 0.0;
          if (v66 != INFINITY) {
            double v65 = -1.0 / v66;
          }
        }
        double v68 = fabs(v65);
        BOOL v69 = v68 == INFINITY;
        if (v68 == INFINITY) {
          double v70 = x;
        }
        else {
          double v70 = y - v65 * x;
        }
        if (v69) {
          double v65 = INFINITY;
        }
        double v152 = var2 * v55.__cosval * 0.5;
        double v141 = v64;
        if (v66 == v65)
        {
          double v71 = NAN;
          double v72 = NAN;
LABEL_76:
          double sinval = v61.__sinval;
          goto LABEL_82;
        }
        if (v66 == INFINITY)
        {
          double v72 = v67;
        }
        else
        {
          if (v65 != INFINITY)
          {
            double v72 = (v70 - v67) / (v66 - v65);
            double v71 = v67 + v66 * v72;
            goto LABEL_76;
          }
          double v72 = v70;
          double v65 = v66;
          double v70 = v67;
        }
        double sinval = v61.__sinval;
        double v71 = v70 + v65 * v72;
LABEL_82:
        double v74 = x + v61.__cosval * v139;
        double v75 = y + sinval * v139;
        double v76 = sqrt((y - v71) * (y - v71) + (x - v72) * (x - v72));
        double v77 = sqrt(v149 - v76 * v76);
        double v78 = atan(v66);
        __double2 v79 = __sincos_stret(v78);
        double v80 = v72 + v77 * v79.__cosval;
        double v81 = v72 - v77 * v79.__cosval;
        double v82 = sqrt((v80 - v74) * (v80 - v74) + (v71 + v77 * v79.__sinval - v75) * (v71 + v77 * v79.__sinval - v75));
        double v83 = sqrt((v81 - v74) * (v81 - v74) + (v71 - v77 * v79.__sinval - v75) * (v71 - v77 * v79.__sinval - v75));
        if (v82 >= v83) {
          double v44 = v71 - v77 * v79.__sinval;
        }
        else {
          double v44 = v71 + v77 * v79.__sinval;
        }
        if (v82 >= v83) {
          double v80 = v81;
        }
        double v151 = v80;
        if (v66 == 0.0)
        {
          double v84 = INFINITY;
        }
        else
        {
          double v84 = 0.0;
          if (v66 != INFINITY) {
            double v84 = -1.0 / v66;
          }
        }
        double v85 = fabs(v84);
        BOOL v86 = v85 == INFINITY;
        if (v85 == INFINITY) {
          double v87 = x;
        }
        else {
          double v87 = y - v84 * x;
        }
        if (v86) {
          double v88 = INFINITY;
        }
        else {
          double v88 = v84;
        }
        if (v66 == v88)
        {
          double v89 = NAN;
          double v90 = NAN;
          double v91 = var2 * v55.__sinval * 0.5;
          goto LABEL_104;
        }
        double v91 = var2 * v55.__sinval * 0.5;
        if (v66 == INFINITY)
        {
          double v90 = v141;
LABEL_103:
          double v89 = v87 + v88 * v90;
          goto LABEL_104;
        }
        if (v88 == INFINITY)
        {
          double v90 = v87;
          double v88 = v66;
          double v87 = v141;
          goto LABEL_103;
        }
        double v90 = (v87 - v141) / (v66 - v88);
        double v89 = v141 + v66 * v90;
LABEL_104:
        double v92 = v74 + v152;
        double v93 = v75 + v91;
        double v43 = v75 - v91;
        double v94 = y - v89;
        double v46 = v74 - v152;
        double v95 = sqrt(v94 * v94 + (x - v90) * (x - v90));
        double v96 = sqrt(v149 - v95 * v95);
        double v97 = v90 + v96 * v79.__cosval;
        double v98 = v89 + v96 * v79.__sinval;
        double v99 = v90 - v96 * v79.__cosval;
        double v100 = v89 - v96 * v79.__sinval;
        double v101 = sqrt((v97 - v74) * (v97 - v74) + (v98 - v75) * (v98 - v75));
        double v102 = sqrt((v99 - v74) * (v99 - v74) + (v100 - v75) * (v100 - v75));
        if (v101 >= v102) {
          double v103 = v100;
        }
        else {
          double v103 = v98;
        }
        if (v101 >= v102) {
          double v104 = v99;
        }
        else {
          double v104 = v97;
        }
        objc_msgSend(v24, "moveToPoint:", v104, v103);
        double v153 = v93;
        objc_msgSend(v24, "addLineToPoint:", v92, v93);
        if (v138 > 2.22044605e-16) {
          -[MKJunction _addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:](self, "_addJunctionStemCapToPath:fromStartPoint:topEndPoint:cornerRadius:", v24, v92, v93, v46, v43, v136);
        }
        objc_msgSend(v24, "addLineToPoint:", v46, v43);
        double v45 = v151;
        objc_msgSend(v24, "addLineToPoint:", v151, v44);
        objc_msgSend(v24, "addLineToPoint:", v104, v103);
        [v24 closePath];
        if (v41)
        {
          objc_msgSend(v29, "moveToPoint:", v142, v143);
          double v147 = v44;
          objc_msgSend(v29, "addLineToPoint:", v146, v145);
          double v148 = v43;
          double v105 = v163.y;
          double v144 = v46;
          double v106 = v163.x;
          float v107 = v145 - v163.y;
          float v108 = v146 - v163.x;
          double v109 = atan2f(v107, v108);
          float v110 = v103 - v105;
          float v111 = v104 - v106;
          double v112 = atan2f(v110, v111);
          double v113 = v106;
          double v46 = v144;
          double v114 = v105;
          double v115 = v109;
          double v44 = v147;
          double v43 = v148;
          objc_msgSend(v29, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v113, v114, v137, v115, v112);
          objc_msgSend(v29, "addLineToPoint:", v92, v153);
        }
        else
        {
          double v134 = v153;
          double v135 = v92;
          double v132 = v103;
          double v133 = v104;
        }
        ++v47;
        char v41 = 1;
        double v48 = v43;
        double v49 = v151;
        double v50 = v44;
        double v51 = v46;
      }
      while (v40 != v47);
      uint64_t v116 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v158, v164, 16, v151, v44, v43, v46);
      uint64_t v40 = v116;
      if (!v116)
      {

        objc_msgSend(v29, "moveToPoint:", v46, v43);
        objc_msgSend(v29, "addLineToPoint:", v151, v44);
        double v117 = v163.y;
        double v118 = v163.x;
        float v119 = v44 - v163.y;
        float v120 = v151 - v163.x;
        double v121 = atan2f(v119, v120);
        float v122 = v132 - v117;
        float v123 = v133 - v118;
        objc_msgSend(v29, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v118, v117, v137, v121, atan2f(v122, v123));
        objc_msgSend(v29, "addLineToPoint:", v135, v134);
        a5 = v124;
        int v32 = a8;
        goto LABEL_39;
      }
    }
  }

LABEL_39:
  objc_msgSend(v29, "moveToPoint:", v129 + v163.x, v163.y);
  [v29 addArcWithCenter:1 radius:v163 startAngle:v129 endAngle:0.0 clockwise:6.28318531];
  if (v32 == 1)
  {
    memset(__dst, 0, 48);
    CGAffineTransformMakeScale(&v157, -1.0, 1.0);
    CGAffineTransformTranslate((CGAffineTransform *)__dst, &v157, -width, 0.0);
    long long v154 = *(_OWORD *)__dst;
    long long v155 = *(_OWORD *)&__dst[16];
    long long v156 = *(_OWORD *)&__dst[32];
    [v24 applyTransform:&v154];
    long long v154 = *(_OWORD *)__dst;
    long long v155 = *(_OWORD *)&__dst[16];
    long long v156 = *(_OWORD *)&__dst[32];
    [v29 applyTransform:&v154];
    long long v154 = *(_OWORD *)__dst;
    long long v155 = *(_OWORD *)&__dst[16];
    long long v156 = *(_OWORD *)&__dst[32];
    [v125 applyTransform:&v154];
  }
  if (v126) {
    *double v126 = v125;
  }
  if (a4) {
    *a4 = v24;
  }
  if (a5) {
    *a5 = v29;
  }
  if (a9) {
    *a9 = v163;
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v6 = a3;
  [v6 encodeInteger:type forKey:@"kJuctionTypeEncodingKey"];
  unint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_elements length:16 * self->_count];
  [v6 encodeObject:v5 forKey:@"kJunctionElementsEncodingKey"];

  [v6 encodeInt:LODWORD(self->_count) forKey:@"kJunctionElementsCountEncodingKey"];
  [v6 encodeInteger:self->_maneuver forKey:@"kJunctionManeuverEncodingKey"];
  [v6 encodeInteger:self->_drivingSide forKey:@"kJunctionDrivingSideEncodingKey"];
}

- (MKJunction)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeIntForKey:@"kJunctionElementsCountEncodingKey"];
  if (v5 < 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    size_t v6 = v5;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJunctionElementsEncodingKey"];
    if ([v7 length] >= 16 * v6)
    {
      uint64_t v9 = [v4 decodeIntegerForKey:@"kJunctionManeuverEncodingKey"];
      uint64_t v10 = [v4 decodeIntegerForKey:@"kJuctionTypeEncodingKey"];
      uint64_t v11 = [v4 decodeIntegerForKey:@"kJunctionDrivingSideEncodingKey"];
      int v12 = malloc_type_calloc(0x10uLL, v6, 0x5FAC28F0uLL);
      memcpy(v12, (const void *)[v7 bytes], 16 * v6);
      self = [(MKJunction *)self initWithType:v10 maneuver:v9 drivingSide:v11 elements:v12 count:v6];
      free(v12);
      uint64_t v8 = self;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)type
{
  return self->_type;
}

@end