@interface DRPrecisionMode
- (BOOL)isEqual:(id)a3;
- (CGPoint)touchOffset;
- (double)yAnchor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)direction;
- (int64_t)orientation;
- (void)setDirection:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
@end

@implementation DRPrecisionMode

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setDirection:", -[DRPrecisionMode direction](self, "direction"));
  objc_msgSend(v4, "setOrientation:", -[DRPrecisionMode orientation](self, "orientation"));
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<DRPrecisionMode %d orientation:%d>", self->_direction, self->_orientation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 direction];
    if (v6 == (id)[(DRPrecisionMode *)self direction])
    {
      id v7 = [v5 orientation];
      BOOL v8 = v7 == (id)[(DRPrecisionMode *)self orientation];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CGPoint)touchOffset
{
  int64_t v3 = [(DRPrecisionMode *)self direction];
  double x = 0.0;
  if (v3 == 2)
  {
    if (qword_100064630 != -1) {
      dispatch_once(&qword_100064630, &stru_100054F50);
    }
    double y = 25.0;
    if (byte_100064638) {
      double y = sub_10001252C();
    }
  }
  else if (v3 == 1)
  {
    if (qword_100064630 != -1) {
      dispatch_once(&qword_100064630, &stru_100054EF0);
    }
    double v6 = 25.0;
    if (byte_100064638) {
      double v6 = sub_100012378();
    }
    double y = -v6;
  }
  else
  {
    double y = 0.0;
    if (!v3)
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
    }
  }
  if ([(DRPrecisionMode *)self orientation])
  {
    int64_t v7 = [(DRPrecisionMode *)self orientation];
    double v8 = 0.0;
    if (v7 != 1)
    {
      if ((id)[(DRPrecisionMode *)self orientation] == (id)4)
      {
        double v8 = -1.57079633;
      }
      else if ((id)[(DRPrecisionMode *)self orientation] == (id)3)
      {
        double v8 = 1.57079633;
      }
      else
      {
        int64_t v15 = [(DRPrecisionMode *)self orientation];
        double v8 = 3.14159265;
        if (v15 != 2) {
          double v8 = 0.0;
        }
      }
    }
    CGAffineTransformMakeRotation(&v18, v8);
    UIIntegralTransform();
    double a = v19;
    double b = v20;
    double c = v21;
    double d = v22;
    tdouble x = v23;
    tdouble y = v24;
  }
  else
  {
    double a = CGAffineTransformIdentity.a;
    double b = CGAffineTransformIdentity.b;
    double c = CGAffineTransformIdentity.c;
    double d = CGAffineTransformIdentity.d;
    tdouble x = CGAffineTransformIdentity.tx;
    tdouble y = CGAffineTransformIdentity.ty;
  }
  double v16 = tx + y * c + a * x;
  double v17 = ty + y * d + b * x;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (double)yAnchor
{
  int64_t v2 = [(DRPrecisionMode *)self direction];
  if (v2 == 2)
  {
    if (qword_100064630 != -1) {
      dispatch_once(&qword_100064630, &stru_100055010);
    }
    if (byte_100064638)
    {
      if (qword_100064688 != -1) {
        dispatch_once(&qword_100064688, &stru_100055030);
      }
      if ((byte_100064690 & 1) == 0)
      {
        v9 = sub_100028320();
        v10 = [v9 objectForKey:@"PrecisionModeDownAnchor"];
        if (v10)
        {
          v11 = v10;
          [v10 doubleValue];
        }
        else
        {
          v11 = 0;
          uint64_t v12 = 0x3FB999999999999ALL;
        }
        qword_100064698 = v12;
        byte_100064690 = 1;
      }
      double v4 = *(double *)&qword_100064698;
    }
    else
    {
      double v4 = 0.1;
    }
    return 1.0 - v4;
  }
  else
  {
    double result = 0.0;
    if (v2 == 1)
    {
      if (qword_100064630 != -1) {
        dispatch_once(&qword_100064630, &stru_100054FB0);
      }
      if (byte_100064638)
      {
        if (qword_100064670 != -1) {
          dispatch_once(&qword_100064670, &stru_100054FD0);
        }
        if ((byte_100064678 & 1) == 0)
        {
          id v5 = sub_100028320();
          double v6 = [v5 objectForKey:@"PrecisionModeUpAnchor"];
          if (v6)
          {
            int64_t v7 = v6;
            [v6 doubleValue];
          }
          else
          {
            int64_t v7 = 0;
            uint64_t v8 = 0x3FB999999999999ALL;
          }
          qword_100064680 = v8;
          byte_100064678 = 1;
        }
        return *(double *)&qword_100064680;
      }
      else
      {
        return 0.1;
      }
    }
  }
  return result;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

@end