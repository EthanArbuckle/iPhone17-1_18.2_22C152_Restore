@interface ATXWidget
+ (BOOL)supportsSecureCoding;
- (ATXWidget)initWithCoder:(id)a3;
- (ATXWidget)initWithIdentifier:(id)a3 chsWidget:(id)a4 suggestedWidget:(BOOL)a5;
- (ATXWidget)initWithIdentifier:(id)a3 chsWidget:(id)a4 suggestedWidget:(BOOL)a5 source:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXWidget:(id)a3;
- (BOOL)isSuggestedWidget;
- (CHSWidget)chsWidget;
- (NSDictionary)dictionaryRepresentation;
- (NSString)identifier;
- (NSString)source;
- (id)copyWithSource:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDictionaryRepresentation:(id)a3;
@end

@implementation ATXWidget

- (ATXWidget)initWithIdentifier:(id)a3 chsWidget:(id)a4 suggestedWidget:(BOOL)a5
{
  return [(ATXWidget *)self initWithIdentifier:a3 chsWidget:a4 suggestedWidget:a5 source:0];
}

- (ATXWidget)initWithIdentifier:(id)a3 chsWidget:(id)a4 suggestedWidget:(BOOL)a5 source:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ATXWidget;
  v13 = [(ATXWidget *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_chsWidget, a4);
    v13->_suggestedWidget = a5;
    uint64_t v16 = [v12 copy];
    source = v13->_source;
    v13->_source = (NSString *)v16;
  }
  return v13;
}

- (ATXWidget)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widget"];
  uint64_t v7 = [v4 decodeBoolForKey:@"suggestedWidget"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];

  v9 = [(ATXWidget *)self initWithIdentifier:v5 chsWidget:v6 suggestedWidget:v7 source:v8];
  return v9;
}

- (id)copyWithSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(ATXWidget *)self identifier];
  uint64_t v7 = [(ATXWidget *)self chsWidget];
  BOOL v8 = [(ATXWidget *)self isSuggestedWidget];
  v9 = (void *)[v4 copy];

  id v10 = (void *)[v5 initWithIdentifier:v6 chsWidget:v7 suggestedWidget:v8 source:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXWidget *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(ATXWidget *)self chsWidget];
  [v4 encodeObject:v6 forKey:@"widget"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ATXWidget isSuggestedWidget](self, "isSuggestedWidget"), @"suggestedWidget");
  id v7 = [(ATXWidget *)self source];
  [v4 encodeObject:v7 forKey:@"source"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXWidget *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXWidget *)self isEqualToATXWidget:v5];

  return v6;
}

- (BOOL)isEqualToATXWidget:(id)a3
{
  id v4 = (id *)a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[2];
  if (identifier == v6)
  {
  }
  else
  {
    id v7 = v6;
    BOOL v8 = identifier;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_12;
    }
  }
  chsWidget = self->_chsWidget;
  id v11 = (CHSWidget *)v4[3];
  if (chsWidget == v11)
  {
  }
  else
  {
    id v12 = v11;
    v13 = chsWidget;
    char v14 = [(CHSWidget *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_12;
    }
  }
  if (self->_suggestedWidget != *((unsigned __int8 *)v4 + 8))
  {
LABEL_12:
    char v17 = 0;
    goto LABEL_15;
  }
  v15 = self->_source;
  uint64_t v16 = v15;
  if (v15 == v4[5]) {
    char v17 = 1;
  }
  else {
    char v17 = -[NSString isEqual:](v15, "isEqual:");
  }

LABEL_15:
  return v17;
}

- (unint64_t)hash
{
  v3 = [(ATXWidget *)self identifier];
  uint64_t v4 = [v3 hash];

  id v5 = [(ATXWidget *)self chsWidget];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  uint64_t v7 = 31 * v6 + [(ATXWidget *)self isSuggestedWidget];
  BOOL v8 = [(ATXWidget *)self source];
  unint64_t v9 = [v8 hash] - v7 + 32 * v7;

  return v9;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(ATXWidget *)self identifier];
  id v5 = [(ATXWidget *)self chsWidget];
  if ([(ATXWidget *)self isSuggestedWidget]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v7 = [(ATXWidget *)self source];
  BOOL v8 = (void *)[v3 initWithFormat:@"<ATXWidget: (identifier: %@, chsWidget: %@, isSuggestedWidget: %@, source: %@)>", v4, v5, v6, v7];

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  v17[5] = *MEMORY[0x263EF8340];
  v16[0] = @"identifier";
  v15 = [(ATXWidget *)self identifier];
  v17[0] = v15;
  v16[1] = @"chsWidget";
  char v14 = [(ATXWidget *)self chsWidget];
  id v3 = [v14 description];
  v17[1] = v3;
  v16[2] = @"intent";
  uint64_t v4 = [(ATXWidget *)self chsWidget];
  id v5 = [v4 intentReference];
  uint64_t v6 = [v5 intent];
  uint64_t v7 = [v6 debugDescription];
  BOOL v8 = v7;
  if (!v7)
  {
    BOOL v8 = [MEMORY[0x263EFF9D0] null];
  }
  v17[2] = v8;
  v16[3] = @"isSuggestedWidget";
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXWidget isSuggestedWidget](self, "isSuggestedWidget"));
  v17[3] = v9;
  v16[4] = @"source";
  id v10 = [(ATXWidget *)self source];
  id v11 = v10;
  if (!v10)
  {
    id v11 = [MEMORY[0x263EFF9D0] null];
  }
  v17[4] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
  if (!v10) {

  }
  if (!v7) {
  return (NSDictionary *)v12;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CHSWidget)chsWidget
{
  return self->_chsWidget;
}

- (BOOL)isSuggestedWidget
{
  return self->_suggestedWidget;
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_chsWidget, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end