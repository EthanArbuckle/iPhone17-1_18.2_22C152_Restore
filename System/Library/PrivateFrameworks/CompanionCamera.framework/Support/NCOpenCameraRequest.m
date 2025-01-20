@interface NCOpenCameraRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)supportedCaptureModesAsString:(int)a3;
- (int)StringAsSupportedCaptureModes:(id)a3;
- (int)supportedCaptureModeAtIndex:(unint64_t)a3;
- (int)supportedCaptureModes;
- (unint64_t)hash;
- (unint64_t)supportedCaptureModesCount;
- (void)addSupportedCaptureMode:(int)a3;
- (void)clearSupportedCaptureModes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setSupportedCaptureModes:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation NCOpenCameraRequest

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NCOpenCameraRequest;
  [(NCOpenCameraRequest *)&v3 dealloc];
}

- (unint64_t)supportedCaptureModesCount
{
  return self->_supportedCaptureModes.count;
}

- (int)supportedCaptureModes
{
  return self->_supportedCaptureModes.list;
}

- (void)clearSupportedCaptureModes
{
}

- (void)addSupportedCaptureMode:(int)a3
{
}

- (int)supportedCaptureModeAtIndex:(unint64_t)a3
{
  p_supportedCaptureModes = &self->_supportedCaptureModes;
  unint64_t count = self->_supportedCaptureModes.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_supportedCaptureModes->list[a3];
}

- (void)setSupportedCaptureModes:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedCaptureModesAsString:(int)a3
{
  if a3 < 0xB && ((0x7ABu >> a3))
  {
    objc_super v3 = *(&off_100030EA0 + a3);
  }
  else
  {
    objc_super v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v3;
}

- (int)StringAsSupportedCaptureModes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Photo"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Square"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Timelapse"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Portrait"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Slomo"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Panorama"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Cinematic"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCOpenCameraRequest;
  id v3 = [(NCOpenCameraRequest *)&v7 description];
  int v4 = [(NCOpenCameraRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  p_supportedCaptureModes = &self->_supportedCaptureModes;
  if (self->_supportedCaptureModes.count)
  {
    v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (p_supportedCaptureModes->count)
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = p_supportedCaptureModes->list[v6];
        if v7 < 0xB && ((0x7ABu >> v7))
        {
          v8 = *(&off_100030EA0 + v7);
        }
        else
        {
          v8 = +[NSString stringWithFormat:@"(unknown: %i)", p_supportedCaptureModes->list[v6]];
        }
        [v5 addObject:v8];

        ++v6;
      }
      while (v6 < p_supportedCaptureModes->count);
    }
    [v3 setObject:v5 forKey:@"supportedCaptureMode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100021C94((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  p_supportedCaptureModes = &self->_supportedCaptureModes;
  if (self->_supportedCaptureModes.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_supportedCaptureModes->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(NCOpenCameraRequest *)self supportedCaptureModesCount])
  {
    [v7 clearSupportedCaptureModes];
    unint64_t v4 = [(NCOpenCameraRequest *)self supportedCaptureModesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSupportedCaptureMode:", -[NCOpenCameraRequest supportedCaptureModeAtIndex:](self, "supportedCaptureModeAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  unint64_t v4 = (char *)[v7 supportedCaptureModesCount];
  if (v4)
  {
    unint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[NCOpenCameraRequest addSupportedCaptureMode:](self, "addSupportedCaptureMode:", [v7 supportedCaptureModeAtIndex:i]);
  }
}

@end