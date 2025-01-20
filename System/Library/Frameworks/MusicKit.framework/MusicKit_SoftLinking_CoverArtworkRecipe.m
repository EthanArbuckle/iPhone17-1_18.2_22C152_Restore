@interface MusicKit_SoftLinking_CoverArtworkRecipe
- (CGColor)backgroundColor;
- (CGColor)primaryColor;
- (CGColor)secondaryColor;
- (CGColor)tertiaryColor;
- (CGColor)textColor;
- (MusicKit_SoftLinking_CoverArtworkRecipe)initWithExpression:(int64_t)a3 version:(id)a4 backgroundColor:(CGColor *)a5 primaryColor:(CGColor *)a6 secondaryColor:(CGColor *)a7 tertiaryColor:(CGColor *)a8 textColor:(CGColor *)a9;
- (NSString)stringRepresentation;
- (NSString)version;
- (id)_stringFromColor:(CGColor *)a3;
- (id)_stringFromExpression:(int64_t)a3;
- (id)createArtworkCatalogWithPlaylistName:(id)a3;
- (id)description;
- (int64_t)expression;
@end

@implementation MusicKit_SoftLinking_CoverArtworkRecipe

- (MusicKit_SoftLinking_CoverArtworkRecipe)initWithExpression:(int64_t)a3 version:(id)a4 backgroundColor:(CGColor *)a5 primaryColor:(CGColor *)a6 secondaryColor:(CGColor *)a7 tertiaryColor:(CGColor *)a8 textColor:(CGColor *)a9
{
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_CoverArtworkRecipe;
  v17 = [(MusicKit_SoftLinking_CoverArtworkRecipe *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_expression = a3;
    objc_storeStrong((id *)&v17->_version, a4);
    objc_storeStrong((id *)&v18->_backgroundColor, a5);
    objc_storeStrong((id *)&v18->_primaryColor, a6);
    objc_storeStrong((id *)&v18->_secondaryColor, a7);
    objc_storeStrong((id *)&v18->_tertiaryColor, a8);
    objc_storeStrong((id *)&v18->_textColor, a9);
  }

  return v18;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  v7 = [(MusicKit_SoftLinking_CoverArtworkRecipe *)self stringRepresentation];
  [v6 appendFormat:@"; %@", v7];

  [v6 appendString:@">"];

  return v6;
}

- (NSString)stringRepresentation
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = [(MusicKit_SoftLinking_CoverArtworkRecipe *)self _stringFromExpression:self->_expression];
  v5 = (void *)[v3 initWithFormat:@"expression = %@ (%ld)", v4, self->_expression];

  [v5 appendFormat:@"; version = %@", self->_version];
  if (self->_backgroundColor)
  {
    v6 = -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    [v5 appendFormat:@"; backgroundColor = %@", v6];
  }
  if (self->_primaryColor)
  {
    v7 = -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    [v5 appendFormat:@"; primaryColor = %@", v7];
  }
  if (self->_secondaryColor)
  {
    v8 = -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    [v5 appendFormat:@"; secondaryColor = %@", v8];
  }
  if (self->_tertiaryColor)
  {
    v9 = -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    [v5 appendFormat:@"; tertiaryColor = %@", v9];
  }
  if (self->_textColor)
  {
    v10 = -[MusicKit_SoftLinking_CoverArtworkRecipe _stringFromColor:](self, "_stringFromColor:");
    [v5 appendFormat:@"; textColor = %@", v10];
  }

  return (NSString *)v5;
}

- (id)createArtworkCatalogWithPlaylistName:(id)a3
{
  id v4 = a3;
  v5 = [[MusicKit_SoftLinking_CoverArtworkToken alloc] initWithCoverArtworkRecipe:self playlistName:v4];

  if (v5)
  {
    v6 = +[MusicKit_SoftLinking artworkCatalogWithCoverArtworkToken:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_stringFromExpression:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 0;
  }
  else {
    return *(&off_26443FC48 + a3 - 1);
  }
}

- (id)_stringFromColor:(CGColor *)a3
{
  size_t NumberOfComponents = CGColorGetNumberOfComponents(a3);
  Components = CGColorGetComponents(a3);
  uint64_t v6 = NumberOfComponents - 2;
  if (NumberOfComponents - 2 >= 2) {
    uint64_t v6 = 2;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", (int)(*Components * 255.0), (int)(Components[NumberOfComponents != 2] * 255.0), (int)(Components[v6] * 255.0));
}

- (int64_t)expression
{
  return self->_expression;
}

- (NSString)version
{
  return self->_version;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGColor)primaryColor
{
  return self->_primaryColor;
}

- (CGColor)secondaryColor
{
  return self->_secondaryColor;
}

- (CGColor)tertiaryColor
{
  return self->_tertiaryColor;
}

- (CGColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_tertiaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end