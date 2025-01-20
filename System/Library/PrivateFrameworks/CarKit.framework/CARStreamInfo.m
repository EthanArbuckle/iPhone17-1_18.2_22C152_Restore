@interface CARStreamInfo
- (CARStreamInfo)initWithDictionary:(id)a3;
- (CARStreamInfo)initWithStreamInfoDictionary:(id)a3;
- (CGPoint)origin;
- (NSString)identifier;
- (id)description;
- (int64_t)zIndex;
- (void)setOrigin:(CGPoint)a3;
@end

@implementation CARStreamInfo

- (CARStreamInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CARStreamInfo;
  v5 = [(CARStreamInfo *)&v14 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  if (!CROriginFromAirPlayDictionary(v4, &v5->_origin.x)) {
    goto LABEL_16;
  }
  objc_opt_class();
  id v7 = [v4 objectForKey:@"uuid"];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    v8 = (CARStreamInfo *)v7;
  }
  else {
    v8 = 0;
  }

  if (v8)
  {
    uint64_t v9 = [(CARStreamInfo *)v8 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v9;

    objc_opt_class();
    id v11 = [v4 objectForKey:@"zIndex"];
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if (v12)
    {
      v6->_zIndex = [v12 integerValue];

LABEL_14:
      v8 = v6;
      goto LABEL_17;
    }

LABEL_16:
    v8 = 0;
  }
LABEL_17:

  return v8;
}

- (CARStreamInfo)initWithStreamInfoDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CARStreamInfo;
  v5 = [(CARStreamInfo *)&v12 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"ScreenID"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (!v7)
    {
      v10 = 0;
      goto LABEL_10;
    }
    uint64_t v8 = [v7 copy];
    uint64_t v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    *(_OWORD *)(v5 + 24) = *MEMORY[0x1E4F1DAD8];
    *((void *)v5 + 2) = 0;
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CARStreamInfo;
  id v4 = [(CARStreamInfo *)&v9 description];
  identifier = self->_identifier;
  id v6 = BSStringFromCGPoint();
  id v7 = [v3 stringWithFormat:@"%@ {identifier: %@, physicalSize: %@, pixelSize: %ld}", v4, identifier, v6, self->_zIndex];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (int64_t)zIndex
{
  return self->_zIndex;
}

- (void).cxx_destruct
{
}

@end