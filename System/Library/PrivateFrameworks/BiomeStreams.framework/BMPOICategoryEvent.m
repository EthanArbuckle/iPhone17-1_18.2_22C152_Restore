@interface BMPOICategoryEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMPOICategoryEvent)initWithPOICategory:(id)a3 rank:(unint64_t)a4 timeIntervalSince1970:(double)a5;
- (BMPOICategoryEvent)initWithProto:(id)a3;
- (BMPOICategoryEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)poiCategory;
- (double)timeIntervalSince1970;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)rank;
- (unsigned)dataVersion;
- (void)json;
- (void)setRank:(unint64_t)a3;
- (void)setTimeIntervalSince1970:(double)a3;
@end

@implementation BMPOICategoryEvent

- (BMPOICategoryEvent)initWithPOICategory:(id)a3 rank:(unint64_t)a4 timeIntervalSince1970:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMPOICategoryEvent;
  v10 = [(BMEventBase *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_poiCategory, a3);
    v11->_rank = a4;
    v11->_timeIntervalSince1970 = a5;
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"POI Category Event. POI Category: %@, rank: %lu", self->_poiCategory, self->_rank];
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonDict
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"poiCategory";
  v3 = [(BMPOICategoryEvent *)self poiCategory];
  v10[0] = v3;
  v9[1] = @"rank";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMPOICategoryEvent rank](self, "rank"));
  v10[1] = v4;
  v9[2] = @"timeIntervalSince1970";
  id v5 = NSNumber;
  [(BMPOICategoryEvent *)self timeIntervalSince1970];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMPOICategoryEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMPOICategoryEvent json](v6);
    }
  }

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(BMPOICategoryEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMPOICategoryEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BMPOICategoryEvent initWithProto:]((uint64_t)self, v11);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  v6 = [v5 poiCategory];
  uint64_t v7 = [v5 rank];
  [v5 timeIntervalSince1970];
  double v9 = v8;

  self = [(BMPOICategoryEvent *)self initWithPOICategory:v6 rank:v7 timeIntervalSince1970:v9];
  v10 = self;
LABEL_8:

  return v10;
}

- (BMPOICategoryEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBPOICategoryEvent alloc] initWithData:v4];

    self = [(BMPOICategoryEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMPOICategoryEvent *)self poiCategory];
  [v3 setPoiCategory:v4];

  objc_msgSend(v3, "setRank:", -[BMPOICategoryEvent rank](self, "rank"));
  [(BMPOICategoryEvent *)self timeIntervalSince1970];
  objc_msgSend(v3, "setTimeIntervalSince1970:");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v17 = 0;
    goto LABEL_16;
  }
  id v6 = v5;
  unint64_t v7 = [(BMPOICategoryEvent *)self rank];
  uint64_t v8 = [v6 rank];
  [(BMPOICategoryEvent *)self timeIntervalSince1970];
  double v10 = v9;
  [v6 timeIntervalSince1970];
  double v12 = v11;
  objc_super v13 = [(BMPOICategoryEvent *)self poiCategory];
  if (!v13)
  {
    v3 = [v6 poiCategory];
    if (!v3)
    {
      char v16 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  v14 = [(BMPOICategoryEvent *)self poiCategory];
  v15 = [v6 poiCategory];
  char v16 = [v14 isEqual:v15];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_9:

  if (v7 == v8) {
    char v18 = v16;
  }
  else {
    char v18 = 0;
  }
  if (v10 == v12) {
    BOOL v17 = v18;
  }
  else {
    BOOL v17 = 0;
  }

LABEL_16:
  return v17;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (double)timeIntervalSince1970
{
  return self->_timeIntervalSince1970;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  self->_timeIntervalSince1970 = a3;
}

- (void).cxx_destruct
{
}

- (void)json
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Unable to create json from object", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBPOICategoryEvent proto", (uint8_t *)&v5, 0xCu);
}

@end