@interface ATXWatchFace
+ (BOOL)supportsSecureCoding;
- (ATXWatchFace)initWithCoder:(id)a3;
- (ATXWatchFace)initWithStyle:(int64_t)a3 complications:(id)a4 selected:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXWatchFace:(id)a3;
- (BOOL)isSelected;
- (NSArray)complications;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXWatchFace

- (ATXWatchFace)initWithStyle:(int64_t)a3 complications:(id)a4 selected:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXWatchFace;
  v10 = [(ATXWatchFace *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_style = a3;
    objc_storeStrong((id *)&v10->_complications, a4);
    v11->_selected = a5;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(ATXWatchFace *)self style];
  v5 = [(ATXWatchFace *)self complications];
  BOOL v6 = [(ATXWatchFace *)self isSelected];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  v8 = [v3 stringWithFormat:@"ATXWatchFace: style: %ld, complications: %@, selected: %@", v4, v5, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXWatchFace)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"style"];
  BOOL v6 = (void *)MEMORY[0x1AD0D3C30]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"complications"];
  v12 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", &__block_literal_global_58);

  uint64_t v13 = [v4 decodeBoolForKey:@"selected"];
  if (v12) {
    v14 = v12;
  }
  else {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v15 = [(ATXWatchFace *)self initWithStyle:v5 complications:v14 selected:v13];

  return v15;
}

uint64_t __30__ATXWatchFace_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[ATXWatchFace style](self, "style"), @"style");
  id v4 = [(ATXWatchFace *)self complications];
  [v5 encodeObject:v4 forKey:@"complications"];

  objc_msgSend(v5, "encodeBool:forKey:", -[ATXWatchFace isSelected](self, "isSelected"), @"selected");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(ATXWatchFace *)self style];
  BOOL v6 = [(ATXWatchFace *)self complications];
  id v7 = objc_msgSend(v4, "initWithStyle:complications:selected:", v5, v6, -[ATXWatchFace isSelected](self, "isSelected"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXWatchFace *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXWatchFace *)self isEqualToATXWatchFace:v5];

  return v6;
}

- (BOOL)isEqualToATXWatchFace:(id)a3
{
  id v4 = a3;
  int64_t v5 = (unsigned __int8 *)v4;
  if (self->_style != *((void *)v4 + 2)) {
    goto LABEL_4;
  }
  complications = self->_complications;
  id v7 = (NSArray *)*((id *)v4 + 3);
  if (complications == v7)
  {

    goto LABEL_6;
  }
  uint64_t v8 = v7;
  uint64_t v9 = complications;
  char v10 = [(NSArray *)v9 isEqual:v8];

  if (v10)
  {
LABEL_6:
    BOOL v11 = self->_selected == v5[8];
    goto LABEL_7;
  }
LABEL_4:
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (unint64_t)hash
{
  int64_t style = self->_style;
  uint64_t v4 = [(NSArray *)self->_complications hash];
  return self->_selected - (v4 - style + 32 * style) + 32 * (v4 - style + 32 * style);
}

- (int64_t)style
{
  return self->_style;
}

- (NSArray)complications
{
  return self->_complications;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end