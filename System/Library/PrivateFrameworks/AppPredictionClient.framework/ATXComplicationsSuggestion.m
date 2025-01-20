@interface ATXComplicationsSuggestion
+ (BOOL)supportsSecureCoding;
- (ATXComplication)subtitleComplication;
- (ATXComplicationsSuggestion)initWithCoder:(id)a3;
- (ATXComplicationsSuggestion)initWithSubtitleComplication:(id)a3 layoutType:(int64_t)a4 complications:(id)a5;
- (NSArray)complications;
- (int64_t)layoutType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXComplicationsSuggestion

- (ATXComplicationsSuggestion)initWithSubtitleComplication:(id)a3 layoutType:(int64_t)a4 complications:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXComplicationsSuggestion;
  v10 = [(ATXComplicationsSuggestion *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    subtitleComplication = v10->_subtitleComplication;
    v10->_subtitleComplication = (ATXComplication *)v11;

    v10->_layoutType = a4;
    uint64_t v13 = [v9 copy];
    complications = v10->_complications;
    v10->_complications = (NSArray *)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXComplicationsSuggestion)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitleComplication"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"layoutType"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"complications"];

  uint64_t v11 = [(ATXComplicationsSuggestion *)self initWithSubtitleComplication:v5 layoutType:v6 complications:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXComplicationsSuggestion *)self subtitleComplication];
  [v4 encodeObject:v5 forKey:@"subtitleComplication"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXComplicationsSuggestion layoutType](self, "layoutType"), @"layoutType");
  id v6 = [(ATXComplicationsSuggestion *)self complications];
  [v4 encodeObject:v6 forKey:@"complications"];
}

- (ATXComplication)subtitleComplication
{
  return self->_subtitleComplication;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (NSArray)complications
{
  return self->_complications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complications, 0);

  objc_storeStrong((id *)&self->_subtitleComplication, 0);
}

@end