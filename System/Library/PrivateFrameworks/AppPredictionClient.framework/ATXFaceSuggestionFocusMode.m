@interface ATXFaceSuggestionFocusMode
+ (BOOL)supportsSecureCoding;
- (ATXFaceSuggestionFocusMode)initWithCoder:(id)a3;
- (ATXFaceSuggestionFocusMode)initWithType:(int64_t)a3 uuid:(id)a4;
- (NSString)uuid;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXFaceSuggestionFocusMode

- (ATXFaceSuggestionFocusMode)initWithType:(int64_t)a3 uuid:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXFaceSuggestionFocusMode;
  v7 = [(ATXFaceSuggestionFocusMode *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    uuid = v8->_uuid;
    v8->_uuid = (NSString *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFaceSuggestionFocusMode)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];

  v7 = [(ATXFaceSuggestionFocusMode *)self initWithType:v5 uuid:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXFaceSuggestionFocusMode type](self, "type"), @"type");
  id v5 = [(ATXFaceSuggestionFocusMode *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end