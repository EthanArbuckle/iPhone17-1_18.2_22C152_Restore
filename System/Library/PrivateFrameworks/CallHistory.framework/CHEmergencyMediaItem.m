@interface CHEmergencyMediaItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (CHEmergencyMediaItem)initWithAssetId:(id)a3;
- (CHEmergencyMediaItem)initWithAssetId:(id)a3 mediaType:(int64_t)a4;
- (CHEmergencyMediaItem)initWithCoder:(id)a3;
- (CHEmergencyMediaItem)initWithDictionary:(id)a3;
- (CHEmergencyMediaItem)initWithMediaItem:(id)a3;
- (NSString)assetId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getDictionary;
- (int64_t)emergencyMediaType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEmergencyMediaType:(int64_t)a3;
@end

@implementation CHEmergencyMediaItem

- (CHEmergencyMediaItem)initWithMediaItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 assetId];
  uint64_t v6 = [v4 emergencyMediaType];

  v7 = [(CHEmergencyMediaItem *)self initWithAssetId:v5 mediaType:v6];
  return v7;
}

- (CHEmergencyMediaItem)initWithAssetId:(id)a3
{
  return [(CHEmergencyMediaItem *)self initWithAssetId:a3 mediaType:0];
}

- (CHEmergencyMediaItem)initWithAssetId:(id)a3 mediaType:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHEmergencyMediaItem;
  v7 = [(CHEmergencyMediaItem *)&v11 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CHEmergencyMediaItem initWithAssetId:mediaType:]", @"assetId" format];
    }
    uint64_t v8 = [v6 copy];
    assetId = v7->_assetId;
    v7->_assetId = (NSString *)v8;

    v7->_emergencyMediaType = a4;
  }

  return v7;
}

- (CHEmergencyMediaItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_assetId);
  id v6 = [v4 objectForKey:v5];

  v7 = NSStringFromSelector(sel_emergencyMediaType);
  uint64_t v8 = [v4 valueForKey:v7];

  uint64_t v9 = [v8 integerValue];
  v10 = [(CHEmergencyMediaItem *)self initWithAssetId:v6 mediaType:v9];

  return v10;
}

- (id)getDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(CHEmergencyMediaItem *)self assetId];
  v5 = NSStringFromSelector(sel_assetId);
  [v3 setObject:v4 forKey:v5];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CHEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType"));
  v7 = NSStringFromSelector(sel_emergencyMediaType);
  [v3 setValue:v6 forKey:v7];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CHEmergencyMediaItem allocWithZone:a3];
  return [(CHEmergencyMediaItem *)v4 initWithMediaItem:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  assetId = self->_assetId;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_assetId);
  [v5 encodeObject:assetId forKey:v6];

  int64_t emergencyMediaType = self->_emergencyMediaType;
  NSStringFromSelector(sel_emergencyMediaType);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:emergencyMediaType forKey:v8];
}

- (CHEmergencyMediaItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CHEmergencyMediaItem;
  id v5 = [(CHEmergencyMediaItem *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_assetId);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v8;

    v10 = NSStringFromSelector(sel_emergencyMediaType);
    v5->_int64_t emergencyMediaType = [v4 decodeIntegerForKey:v10];
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_assetId);
  id v5 = [(CHEmergencyMediaItem *)self assetId];
  [v3 appendFormat:@"%@=%@", v4, v5];

  uint64_t v6 = NSStringFromSelector(sel_emergencyMediaType);
  [v3 appendFormat:@"%@=%ld", v6, -[CHEmergencyMediaItem emergencyMediaType](self, "emergencyMediaType")];

  [v3 appendFormat:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [(CHEmergencyMediaItem *)self assetId];
  unint64_t v4 = [v3 hash];
  uint64_t v5 = [(CHEmergencyMediaItem *)self emergencyMediaType];
  unint64_t v13 = CHHash(2uLL, v6, v7, v8, v9, v10, v11, v12, v4, v5);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CHEmergencyMediaItem *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CHEmergencyMediaItem *)self isEqualToMediaItem:v4];
  }

  return v5;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CHEmergencyMediaItem *)self assetId];
  uint64_t v6 = [v4 assetId];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  uint64_t v9 = (void *)v8;
  if (!(v7 | v8)) {
    goto LABEL_4;
  }
  if (!v8)
  {

    goto LABEL_6;
  }
  int v10 = [(id)v7 isEqual:v8];

  if (!v10)
  {
LABEL_6:
    BOOL v12 = 0;
    goto LABEL_7;
  }
LABEL_4:
  int64_t v11 = [(CHEmergencyMediaItem *)self emergencyMediaType];
  BOOL v12 = v11 == [v4 emergencyMediaType];
LABEL_7:

  return v12;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (int64_t)emergencyMediaType
{
  return self->_emergencyMediaType;
}

- (void)setEmergencyMediaType:(int64_t)a3
{
  self->_int64_t emergencyMediaType = a3;
}

- (void).cxx_destruct
{
}

@end