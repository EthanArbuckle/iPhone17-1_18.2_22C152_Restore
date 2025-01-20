@interface CXHandle
+ (BOOL)supportsSecureCoding;
+ (id)stringForType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandle:(CXHandle *)handle;
- (CXHandle)init;
- (CXHandle)initWithCoder:(id)a3;
- (CXHandle)initWithType:(CXHandleType)type value:(NSString *)value;
- (CXHandle)initWithType:(int64_t)a3;
- (CXHandle)initWithType:(int64_t)a3 value:(id)a4 siriDisplayName:(id)a5;
- (CXHandleType)type;
- (NSString)siriDisplayName;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSiriDisplayName:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation CXHandle

- (CXHandle)initWithType:(CXHandleType)type value:(NSString *)value
{
  v6 = value;
  v11.receiver = self;
  v11.super_class = (Class)CXHandle;
  v7 = [(CXHandle *)&v11 init];
  if (v7)
  {
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXHandle initWithType:value:]", @"value" format];
    }
    v7->_type = type;
    uint64_t v8 = [(NSString *)v6 copy];
    v9 = v7->_value;
    v7->_value = (NSString *)v8;
  }
  return v7;
}

- (CXHandle)initWithType:(int64_t)a3 value:(id)a4 siriDisplayName:(id)a5
{
  id v8 = a5;
  v9 = [(CXHandle *)self initWithType:a3 value:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    siriDisplayName = v9->_siriDisplayName;
    v9->_siriDisplayName = (NSString *)v10;
  }
  return v9;
}

- (CXHandle)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CXHandle;
  result = [(CXHandle *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (CXHandle)init
{
  return 0;
}

- (id)description
{
  if (description__pred_TULoggableStringForHandleTelephonyUtilities != -1) {
    dispatch_once(&description__pred_TULoggableStringForHandleTelephonyUtilities, &__block_literal_global);
  }
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = objc_msgSend((id)objc_opt_class(), "stringForType:", -[CXHandle type](self, "type"));
  v6 = (void (*)(void))description__TULoggableStringForHandle;
  v7 = [(CXHandle *)self value];
  id v8 = v6();
  v9 = [(CXHandle *)self siriDisplayName];
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p type=%@ value=%@ siriDisplayName=%@>", v4, self, v5, v8, v9];

  return v10;
}

void *__23__CXHandle_description__block_invoke()
{
  result = (void *)CUTWeakLinkSymbol();
  description__TULoggableStringForHandle = result;
  return result;
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5CADC48[a3 - 1];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CXHandle *)self isEqualToHandle:v4];

  return v5;
}

- (BOOL)isEqualToHandle:(CXHandle *)handle
{
  id v4 = handle;
  CXHandleType v5 = [(CXHandle *)self type];
  if (v5 == [(CXHandle *)v4 type])
  {
    uint64_t v6 = [(CXHandle *)self value];
    uint64_t v7 = [(CXHandle *)v4 value];
    char v8 = (v6 | v7) == 0;
    if (v7) {
      char v8 = [(id)v6 isEqualToString:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  CXHandleType v3 = [(CXHandle *)self type];
  id v4 = [(CXHandle *)self value];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:", -[CXHandle type](self, "type"));
  unint64_t v5 = [(CXHandle *)self value];
  [v4 setValue:v5];

  uint64_t v6 = [(CXHandle *)self siriDisplayName];
  [v4 setSiriDisplayName:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_type);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  uint64_t v7 = [(CXHandle *)self initWithType:v6];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    v9 = NSStringFromSelector(sel_value);
    uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
    value = v7->_value;
    v7->_value = (NSString *)v10;

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector(sel_siriDisplayName);
    uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    siriDisplayName = v7->_siriDisplayName;
    v7->_siriDisplayName = (NSString *)v14;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  CXHandleType v5 = [(CXHandle *)self type];
  uint64_t v6 = NSStringFromSelector(sel_type);
  [v4 encodeInteger:v5 forKey:v6];

  uint64_t v7 = [(CXHandle *)self value];
  uint64_t v8 = NSStringFromSelector(sel_value);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(CXHandle *)self siriDisplayName];
  v9 = NSStringFromSelector(sel_siriDisplayName);
  [v4 encodeObject:v10 forKey:v9];
}

- (CXHandleType)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)siriDisplayName
{
  return self->_siriDisplayName;
}

- (void)setSiriDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriDisplayName, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end