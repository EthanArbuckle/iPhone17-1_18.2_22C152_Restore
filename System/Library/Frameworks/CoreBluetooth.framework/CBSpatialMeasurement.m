@interface CBSpatialMeasurement
- (CBSpatialMeasurement)initWithXPCObject:(id)a3 error:(id *)a4;
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
- (void)encodeWithXPCObject:(id)a3;
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

@implementation CBSpatialMeasurement

- (CBSpatialMeasurement)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = [(CBSpatialMeasurement *)self init];
  if (!v13)
  {
    if (a4)
    {
      v20 = "init failed";
LABEL_25:
      CBErrorF(-6756, (uint64_t)v20, v7, v8, v9, v10, v11, v12, v21);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_26:
    v18 = 0;
    goto LABEL_19;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      v20 = "XPC non-dict";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!CUXPCDecodeDouble() || !CUXPCDecodeDouble()) {
    goto LABEL_26;
  }
  int v14 = CUXPCDecodeNSError();
  id v15 = 0;
  if (!v14) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v13->_error, 0);
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v13->_flags = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_20;
  }
  if (!CUXPCDecodeDouble()
    || !CUXPCDecodeDouble()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeDouble()
    || !CUXPCDecodeDouble())
  {
    goto LABEL_20;
  }
  int v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 != 6)
  {
    if (v17 != 5) {
      goto LABEL_17;
    }
LABEL_20:
    v18 = 0;
    goto LABEL_18;
  }
  v13->_timestampTicks = 0;
LABEL_17:
  v18 = v13;
LABEL_18:

LABEL_19:
  return v18;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double distanceMeters = self->_distanceMeters;
  if (distanceMeters != 0.0) {
    xpc_dictionary_set_double(v4, "dM", distanceMeters);
  }
  double distanceError = self->_distanceError;
  if (distanceError != 0.0) {
    xpc_dictionary_set_double(v5, "dE", distanceError);
  }
  if (self->_error) {
    CUXPCEncodeNSError();
  }
  uint64_t flags = self->_flags;
  if (flags) {
    xpc_dictionary_set_uint64(v5, "flgs", flags);
  }
  double horizontalAngle = self->_horizontalAngle;
  if (horizontalAngle != 0.0) {
    xpc_dictionary_set_double(v5, "hA", horizontalAngle);
  }
  double horizontalError = self->_horizontalError;
  if (horizontalError != 0.0) {
    xpc_dictionary_set_double(v5, "hE", horizontalError);
  }
  identifier = self->_identifier;
  xpc_object_t xdict = v5;
  uint64_t v12 = [(NSString *)identifier UTF8String];
  if (v12) {
    xpc_dictionary_set_string(xdict, "id", v12);
  }

  double verticalAngle = self->_verticalAngle;
  if (verticalAngle != 0.0) {
    xpc_dictionary_set_double(xdict, "vA", verticalAngle);
  }
  double verticalError = self->_verticalError;
  if (verticalError != 0.0) {
    xpc_dictionary_set_double(xdict, "vE", verticalError);
  }
  uint64_t timestampTicks = self->_timestampTicks;
  int v16 = xdict;
  if (timestampTicks)
  {
    xpc_dictionary_set_uint64(xdict, "ts", timestampTicks);
    int v16 = xdict;
  }
}

- (id)description
{
  NSAppendPrintF_safe();
  id v3 = 0;
  if (self->_flags)
  {
    uint64_t v9 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v4 = v3;

    id v3 = v4;
  }
  error = self->_error;
  if (error)
  {
    id v6 = error;
    uint64_t v10 = CUPrintNSError();
    NSAppendPrintF_safe();
    id v7 = v3;

    id v3 = v7;
  }

  return v3;
}

- (double)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(double)a3
{
  self->_double distanceMeters = a3;
}

- (double)distanceError
{
  return self->_distanceError;
}

- (void)setDistanceError:(double)a3
{
  self->_double distanceError = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (double)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(double)a3
{
  self->_double horizontalAngle = a3;
}

- (double)horizontalError
{
  return self->_horizontalError;
}

- (void)setHorizontalError:(double)a3
{
  self->_double horizontalError = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)verticalAngle
{
  return self->_verticalAngle;
}

- (void)setVerticalAngle:(double)a3
{
  self->_double verticalAngle = a3;
}

- (double)verticalError
{
  return self->_verticalError;
}

- (void)setVerticalError:(double)a3
{
  self->_double verticalError = a3;
}

- (unint64_t)timestampTicks
{
  return self->_timestampTicks;
}

- (void)setTimestampTicks:(unint64_t)a3
{
  self->_uint64_t timestampTicks = a3;
}

- (double)ptsScore
{
  return self->_ptsScore;
}

- (void)setPtsScore:(double)a3
{
  self->_ptsScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end