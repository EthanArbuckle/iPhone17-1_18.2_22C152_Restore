@interface CURangingMeasurement
+ (BOOL)supportsSecureCoding;
- (CURangingMeasurement)initWithCoder:(id)a3;
- (NSError)error;
- (NSString)identifier;
- (double)distanceError;
- (double)distanceMeters;
- (double)horizontalAngle;
- (double)horizontalError;
- (double)ptsScore;
- (double)verticalAngle;
- (double)verticalError;
- (id)description;
- (unint64_t)timestampTicks;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceError:(double)a3;
- (void)setDistanceMeters:(double)a3;
- (void)setError:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHorizontalAngle:(double)a3;
- (void)setHorizontalError:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setPtsScore:(double)a3;
- (void)setTimestampTicks:(unint64_t)a3;
- (void)setVerticalAngle:(double)a3;
- (void)setVerticalError:(double)a3;
@end

@implementation CURangingMeasurement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setTimestampTicks:(unint64_t)a3
{
  self->_timestampTicks = a3;
}

- (unint64_t)timestampTicks
{
  return self->_timestampTicks;
}

- (void)setPtsScore:(double)a3
{
  self->_ptsScore = a3;
}

- (double)ptsScore
{
  return self->_ptsScore;
}

- (void)setVerticalError:(double)a3
{
  self->_verticalError = a3;
}

- (double)verticalError
{
  return self->_verticalError;
}

- (void)setVerticalAngle:(double)a3
{
  self->_verticalAngle = a3;
}

- (double)verticalAngle
{
  return self->_verticalAngle;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setHorizontalError:(double)a3
{
  self->_horizontalError = a3;
}

- (double)horizontalError
{
  return self->_horizontalError;
}

- (void)setHorizontalAngle:(double)a3
{
  self->_horizontalAngle = a3;
}

- (double)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setDistanceError:(double)a3
{
  self->_distanceError = a3;
}

- (double)distanceError
{
  return self->_distanceError;
}

- (void)setDistanceMeters:(double)a3
{
  self->_distanceMeters = a3;
}

- (double)distanceMeters
{
  return self->_distanceMeters;
}

- (id)description
{
  CFMutableStringRef v34 = 0;
  NSAppendPrintF(&v34, (uint64_t)"ID %@, D %.3f m, H %.3f, V %.3f", v2, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
  v9 = v34;
  v16 = v9;
  uint64_t v17 = *(uint64_t *)&self->_ptsScore;
  if (*(double *)&v17 != 0.0)
  {
    CFMutableStringRef v33 = v9;
    NSAppendPrintF(&v33, (uint64_t)", PTS %.3f", v10, v11, v12, v13, v14, v15, v17);
    v18 = v33;

    v16 = v18;
  }
  uint64_t flags = self->_flags;
  if (flags)
  {
    CFMutableStringRef v32 = v16;
    NSAppendPrintF(&v32, (uint64_t)", %#{flags}", v10, v11, v12, v13, v14, v15, flags);
    v20 = v32;

    v16 = v20;
  }
  error = self->_error;
  if (error)
  {
    CFMutableStringRef v31 = v16;
    v22 = error;
    NSAppendPrintF(&v31, (uint64_t)", %{error}", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    v29 = v31;

    v16 = v29;
  }
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_distanceMeters != 0.0)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"dM");
    id v4 = v9;
  }
  if (self->_distanceError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"dE");
    id v4 = v9;
  }
  error = self->_error;
  if (error)
  {
    [v9 encodeObject:error forKey:@"e"];
    id v4 = v9;
  }
  uint64_t flags = self->_flags;
  if (flags)
  {
    [v9 encodeInt64:flags forKey:@"fl"];
    id v4 = v9;
  }
  if (self->_horizontalAngle != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"hA");
    id v4 = v9;
  }
  if (self->_horizontalError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"hE");
    id v4 = v9;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v9 encodeObject:identifier forKey:@"id"];
    id v4 = v9;
  }
  if (self->_verticalAngle != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"vA");
    id v4 = v9;
  }
  if (self->_verticalError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"vE");
    id v4 = v9;
  }
  if (self->_ptsScore != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"pS");
    id v4 = v9;
  }
  unint64_t timestampTicks = self->_timestampTicks;
  if (timestampTicks)
  {
    [v9 encodeInt64:timestampTicks forKey:@"ts"];
    id v4 = v9;
  }
}

- (CURangingMeasurement)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CURangingMeasurement;
  uint64_t v5 = [(CURangingMeasurement *)&v27 init];
  if (v5)
  {
    id v6 = v4;
    if ([v6 containsValueForKey:@"dM"])
    {
      [v6 decodeDoubleForKey:@"dM"];
      v5->_distanceMeters = v7;
    }

    id v8 = v6;
    if ([v8 containsValueForKey:@"dE"])
    {
      [v8 decodeDoubleForKey:@"dE"];
      v5->_distanceError = v9;
    }

    id v10 = v8;
    uint64_t v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, @"e", v11, (void **)&v5->_error);

    uint64_t v28 = 0;
    if (NSDecodeSInt64RangedIfPresent(v10, @"fl", 0, 0xFFFFFFFFLL, &v28)) {
      v5->_uint64_t flags = v28;
    }
    id v12 = v10;
    if ([v12 containsValueForKey:@"hA"])
    {
      [v12 decodeDoubleForKey:@"hA"];
      v5->_horizontalAngle = v13;
    }

    id v14 = v12;
    if ([v14 containsValueForKey:@"hE"])
    {
      [v14 decodeDoubleForKey:@"hE"];
      v5->_horizontalError = v15;
    }

    id v16 = v14;
    uint64_t v17 = objc_opt_class();
    NSDecodeObjectIfPresent(v16, @"id", v17, (void **)&v5->_identifier);

    id v18 = v16;
    if ([v18 containsValueForKey:@"vA"])
    {
      [v18 decodeDoubleForKey:@"vA"];
      v5->_verticalAngle = v19;
    }

    id v20 = v18;
    if ([v20 containsValueForKey:@"vE"])
    {
      [v20 decodeDoubleForKey:@"vE"];
      v5->_verticalError = v21;
    }

    id v22 = v20;
    if ([v22 containsValueForKey:@"pS"])
    {
      [v22 decodeDoubleForKey:@"pS"];
      v5->_ptsScore = v23;
    }

    id v24 = v22;
    if ([v24 containsValueForKey:@"ts"]) {
      v5->_unint64_t timestampTicks = [v24 decodeInt64ForKey:@"ts"];
    }

    uint64_t v25 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end