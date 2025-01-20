@interface ATXCGRectWrapper
+ (BOOL)supportsSecureCoding;
- (ATXCGRectWrapper)initWithCGRect:(CGRect)a3;
- (ATXCGRectWrapper)initWithCoder:(id)a3;
- (ATXCGRectWrapper)initWithProto:(id)a3;
- (ATXCGRectWrapper)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXCGRectWrapper:(id)a3;
- (CGRect)rect;
- (id)description;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation ATXCGRectWrapper

- (ATXCGRectWrapper)initWithCGRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)ATXCGRectWrapper;
  result = [(ATXCGRectWrapper *)&v8 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
  }
  return result;
}

- (ATXCGRectWrapper)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBCGRectWrapper alloc] initWithData:v4];

    self = [(ATXCGRectWrapper *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXCGRectWrapper)initWithProto:(id)a3
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
    v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXCGRectWrapper initWithProto:]((uint64_t)self, v11);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  double v6 = -[ATXPBCGRectWrapper x]((uint64_t)v5);
  double v7 = -[ATXPBCGRectWrapper y]((uint64_t)v5);
  double v8 = -[ATXPBCGRectWrapper width]((uint64_t)v5);
  double v9 = -[ATXPBCGRectWrapper height]((uint64_t)v5);

  self = -[ATXCGRectWrapper initWithCGRect:](self, "initWithCGRect:", v6, v7, v8, v9);
  v10 = self;
LABEL_8:

  return v10;
}

- (id)proto
{
  v3 = objc_opt_new();
  [(ATXCGRectWrapper *)self rect];
  -[ATXPBCGRectWrapper setX:]((uint64_t)v3, v4);
  [(ATXCGRectWrapper *)self rect];
  -[ATXPBCGRectWrapper setY:]((uint64_t)v3, v5);
  [(ATXCGRectWrapper *)self rect];
  -[ATXPBCGRectWrapper setWidth:]((uint64_t)v3, v6);
  [(ATXCGRectWrapper *)self rect];
  -[ATXPBCGRectWrapper setHeight:]((uint64_t)v3, v7);

  return v3;
}

- (id)encodeAsProto
{
  v2 = [(ATXCGRectWrapper *)self proto];
  v3 = [v2 data];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXCGRectWrapper *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXCGRectWrapper)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  double v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"protobufData" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.ATXCGRectWrapper" errorCode:-1 logHandle:0];

  double v7 = [(ATXCGRectWrapper *)self initWithProtoData:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXCGRectWrapper *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXCGRectWrapper *)self isEqualToATXCGRectWrapper:v5];

  return v6;
}

- (BOOL)isEqualToATXCGRectWrapper:(id)a3
{
  [a3 rect];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  CGFloat x = self->_rect.origin.x;
  CGFloat y = self->_rect.origin.y;
  CGFloat width = self->_rect.size.width;
  CGFloat height = self->_rect.size.height;

  return CGRectEqualToRect(*(CGRect *)&x, *(CGRect *)&v5);
}

- (unint64_t)hash
{
  double x = self->_rect.origin.x;
  double v4 = -x;
  if (x >= 0.0) {
    double v4 = self->_rect.origin.x;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  double y = self->_rect.origin.y;
  double v13 = -y;
  if (y >= 0.0) {
    double v13 = self->_rect.origin.y;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  double v16 = fmod(v14, 1.84467441e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  double width = self->_rect.size.width;
  double v22 = -width;
  if (width >= 0.0) {
    double v22 = self->_rect.size.width;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  double v25 = fmod(v23, 1.84467441e19);
  unint64_t v26 = 2654435761u * (unint64_t)v25;
  unint64_t v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0) {
    unint64_t v27 = 2654435761u * (unint64_t)v25;
  }
  unint64_t v28 = v26 - (unint64_t)fabs(v24);
  if (v24 < 0.0) {
    unint64_t v29 = v28;
  }
  else {
    unint64_t v29 = v27;
  }
  double height = self->_rect.size.height;
  double v31 = -height;
  if (height >= 0.0) {
    double v31 = self->_rect.size.height;
  }
  long double v32 = floor(v31 + 0.5);
  double v33 = (v31 - v32) * 1.84467441e19;
  double v34 = fmod(v32, 1.84467441e19);
  unint64_t v35 = 2654435761u * (unint64_t)v34;
  unint64_t v36 = v35 + (unint64_t)v33;
  if (v33 <= 0.0) {
    unint64_t v36 = 2654435761u * (unint64_t)v34;
  }
  unint64_t v37 = v35 - (unint64_t)fabs(v33);
  if (v33 >= 0.0) {
    unint64_t v37 = v36;
  }
  return v37
       - (v29
        - (v20
         - v11
         + 32 * v11)
        + 32 * (v20 - v11 + 32 * v11))
       + 32 * (v29 - (v20 - v11 + 32 * v11) + 32 * (v20 - v11 + 32 * v11));
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"x: %f, y: %f, width: %f, height: %f", *(void *)&self->_rect.origin.x, *(void *)&self->_rect.origin.y, *(void *)&self->_rect.size.width, *(void *)&self->_rect.size.height];
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBCGRectWrapper proto", (uint8_t *)&v5, 0xCu);
}

@end