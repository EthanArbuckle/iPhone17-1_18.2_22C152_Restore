@interface AXHearingAidMode
+ (BOOL)supportsSecureCoding;
- (AXHearingAidMode)initWithCoder:(id)a3;
- (AXHearingAidMode)initWithRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMixingStream;
- (BOOL)isSelected;
- (BOOL)isStream;
- (BOOL)isStreamOrMixingStream;
- (NSString)name;
- (id)description;
- (id)transportRepresentation;
- (int)ear;
- (int)syncAttempts;
- (int64_t)category;
- (unsigned)index;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setEar:(int)a3;
- (void)setIndex:(unsigned __int8)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSyncAttempts:(int)a3;
@end

@implementation AXHearingAidMode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXHearingAidMode)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXHearingAidMode;
  v5 = [(AXHearingAidMode *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(AXHearingAidMode *)v5 setName:v6];

    v5->_category = [v4 decodeIntegerForKey:@"category"];
    v5->_index = [v4 decodeIntForKey:@"index"];
    v5->_isSelected = [v4 decodeBoolForKey:@"isSelected"];
    v5->_ear = [v4 decodeIntForKey:@"ear"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInteger:self->_category forKey:@"category"];
  [v5 encodeInt:self->_index forKey:@"index"];
  [v5 encodeBool:self->_isSelected forKey:@"isSelected"];
  [v5 encodeInt:self->_ear forKey:@"ear"];
}

- (AXHearingAidMode)initWithRepresentation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXHearingAidMode;
  id v5 = [(AXHearingAidMode *)&v12 init];
  if (v5)
  {
    v6 = [v4 valueForKey:@"name"];
    [(AXHearingAidMode *)v5 setName:v6];

    v7 = [v4 valueForKey:@"category"];
    v5->_category = [v7 integerValue];

    objc_super v8 = [v4 valueForKey:@"index"];
    v5->_index = [v8 intValue];

    v9 = [v4 valueForKey:@"isSelected"];
    v5->_isSelected = [v9 BOOLValue];

    v10 = [v4 valueForKey:@"ear"];
    v5->_ear = [v10 intValue];
  }
  return v5;
}

- (id)transportRepresentation
{
  v3 = NSDictionary;
  name = self->_name;
  id v5 = [NSNumber numberWithInteger:self->_category];
  v6 = [NSNumber numberWithUnsignedChar:self->_index];
  v7 = [NSNumber numberWithBool:self->_isSelected];
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_ear];
  v9 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", name, @"name", v5, @"category", v6, @"index", v7, @"isSelected", v8, @"ear", 0);

  return v9;
}

- (void)dealloc
{
  [(AXHearingAidMode *)self setName:0];
  v3.receiver = self;
  v3.super_class = (Class)AXHearingAidMode;
  [(AXHearingAidMode *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 name];
    v6 = [(AXHearingAidMode *)self name];
    if ([v5 isEqualToString:v6]
      && (uint64_t v7 = [v4 category], v7 == -[AXHearingAidMode category](self, "category")))
    {
      int v8 = [v4 index];
      BOOL v9 = v8 == [(AXHearingAidMode *)self index];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isStreamOrMixingStream
{
  if ([(AXHearingAidMode *)self isStream]) {
    return 1;
  }

  return [(AXHearingAidMode *)self isMixingStream];
}

- (BOOL)isStream
{
  return [(AXHearingAidMode *)self category] > 199;
}

- (BOOL)isMixingStream
{
  return [(AXHearingAidMode *)self category] >= 100 && [(AXHearingAidMode *)self category] < 200;
}

- (id)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AXHearingAidMode;
  id v4 = [(AXHearingAidMode *)&v9 description];
  id v5 = [(AXHearingAidMode *)self name];
  if ([(AXHearingAidMode *)self isSelected]) {
    v6 = @"selected";
  }
  else {
    v6 = @"not selected";
  }
  uint64_t v7 = [v3 stringWithFormat:@"%@ - %@ (%@) - %d: Category: %ld Ear: %d", v4, v5, v6, -[AXHearingAidMode index](self, "index"), -[AXHearingAidMode category](self, "category"), -[AXHearingAidMode ear](self, "ear")];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned __int8)a3
{
  self->_index = a3;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (int)ear
{
  return self->_ear;
}

- (void)setEar:(int)a3
{
  self->_ear = a3;
}

- (int)syncAttempts
{
  return self->syncAttempts;
}

- (void)setSyncAttempts:(int)a3
{
  self->syncAttempts = a3;
}

- (void).cxx_destruct
{
}

@end