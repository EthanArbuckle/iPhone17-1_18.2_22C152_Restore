@interface NTKMargaritaColorPalette
- (BOOL)isEditing;
- (NTKMargaritaColorPalette)init;
- (id)_complication;
- (id)_stripe;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (unint64_t)style;
- (void)configurationDidChange:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKMargaritaColorPalette

- (NTKMargaritaColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKMargaritaColorPalette;
  return [(NTKMargaritaColorPalette *)&v5 initWithFaceClass:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKMargaritaColorPalette;
  id v4 = [(NTKMargaritaColorPalette *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setStyle:", -[NTKMargaritaColorPalette style](self, "style"));
  objc_msgSend(v4, "setEditing:", -[NTKMargaritaColorPalette isEditing](self, "isEditing"));
  return v4;
}

- (id)identifier
{
  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKMargaritaColorPalette;
    id v4 = [(NTKMargaritaColorPalette *)&v8 identifier];
    objc_super v5 = +[NSString stringWithFormat:@"%@-%lu-%lu", v4, [(NTKMargaritaColorPalette *)self isEditing], [(NTKMargaritaColorPalette *)self style]];
    objc_super v6 = self->_cachedIdentifier;
    self->_cachedIdentifier = v5;

    cachedIdentifier = self->_cachedIdentifier;
  }

  return cachedIdentifier;
}

- (void)configurationDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKMargaritaColorPalette;
  [(NTKMargaritaColorPalette *)&v5 configurationDidChange:a3];
  cachedIdentifier = self->_cachedIdentifier;
  self->_cachedIdentifier = 0;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
  self->_cachedIdentifier = 0;
  _objc_release_x1();
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  self->_cachedIdentifier = 0;
  _objc_release_x1();
}

- (id)_stripe
{
  uint64_t v3 = [(NTKMargaritaColorPalette *)self primaryColor];
  BOOL v4 = (char *)[(NTKMargaritaColorPalette *)self style] == (char *)&dword_0 + 2
    || (char *)[(NTKMargaritaColorPalette *)self style] == (char *)&dword_0 + 3;
  if ([(NTKMargaritaColorPalette *)self isBlackColor]
    && (self->_editing ? (int v5 = 1) : (int v5 = v4), v5 == 1))
  {
    id v6 = [(NTKMargaritaColorPalette *)self softBlack];
  }
  else
  {
    id v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)_complication
{
  if ([(NTKMargaritaColorPalette *)self isWhiteColor])
  {
    uint64_t v3 = +[UIColor colorWithWhite:0.9 alpha:1.0];
LABEL_11:
    v12 = (void *)v3;
    goto LABEL_12;
  }
  BOOL v4 = [(NTKMargaritaColorPalette *)self configuration];
  int v5 = [v4 colorOption];
  if ([v5 isEqualToString:@"charcoal"])
  {

LABEL_6:
    uint64_t v3 = [(NTKMargaritaColorPalette *)self darkGray];
    goto LABEL_11;
  }
  unsigned __int8 v6 = [(NTKMargaritaColorPalette *)self isBlackColor];

  if (v6) {
    goto LABEL_6;
  }
  v7 = [(NTKMargaritaColorPalette *)self configuration];
  objc_super v8 = [v7 colorOption];
  if ([v8 isEqualToString:@"brown"])
  {

LABEL_10:
    uint64_t v3 = [(NTKMargaritaColorPalette *)self coffee];
    goto LABEL_11;
  }
  v9 = [(NTKMargaritaColorPalette *)self configuration];
  v10 = [v9 colorOption];
  unsigned int v11 = [v10 isEqualToString:@"darkBrown"];

  if (v11) {
    goto LABEL_10;
  }
  v14 = [(NTKMargaritaColorPalette *)self configuration];
  v15 = [v14 colorOption];
  if ([v15 isEqualToString:@"deepNavy"]) {
    goto LABEL_18;
  }
  v16 = [(NTKMargaritaColorPalette *)self configuration];
  v17 = [v16 colorOption];
  if ([v17 isEqualToString:@"royalBlue"])
  {

LABEL_18:
    goto LABEL_19;
  }
  v19 = [(NTKMargaritaColorPalette *)self configuration];
  v20 = [v19 colorOption];
  unsigned __int8 v21 = [v20 isEqualToString:@"deepPurple"];

  if ((v21 & 1) == 0)
  {
    uint64_t v3 = [(NTKMargaritaColorPalette *)self primaryColor];
    goto LABEL_11;
  }
LABEL_19:
  v18 = [(NTKMargaritaColorPalette *)self primaryColor];
  v12 = NTKColorByBrightening();

LABEL_12:

  return v12;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void).cxx_destruct
{
}

@end