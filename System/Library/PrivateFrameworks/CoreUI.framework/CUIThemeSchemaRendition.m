@interface CUIThemeSchemaRendition
- ($01BB1521EC52D44A8E7628F5261DCEC8)contentInsets;
- (CGPoint)renditionCoordinatesForPartFeatures:(int64_t)a3;
- (CGRect)alignmentRectangle;
- (CGRect)edgeInsets:(BOOL)a3;
- (CGRect)sliceRects;
- (CUIPSDGradient)gradient;
- (CUIThemeSchemaRendition)initWithCoreUIOptions:(id)a3 forKey:(const _renditionkeytoken *)a4;
- (double)scale;
- (id)coreUIOptions;
- (id)defaultTemplateName;
- (id)description;
- (id)dimension1LocalizedString;
- (id)dimension2LocalizedString;
- (id)directionLocalizedString;
- (id)drawingLayerLocalizedString;
- (id)presentationStateLocalizedString;
- (id)previousStateLocalizedString;
- (id)previousValueLocalizedString;
- (id)referenceImage;
- (id)scaleLocalizedString;
- (id)sizeLocalizedString;
- (id)slices;
- (id)stateLocalizedString;
- (id)stringForState:(unsigned __int16)a3;
- (id)stringForValue:(unsigned __int16)a3;
- (id)typeLocalizedString;
- (id)valueLocalizedString;
- (int64_t)columnSlices;
- (int64_t)rowSlices;
- (unint64_t)numberOfSlices;
- (unsigned)appearance;
- (unsigned)dimension1;
- (unsigned)dimension2;
- (unsigned)direction;
- (unsigned)drawingLayer;
- (unsigned)identifier;
- (unsigned)keyScale;
- (unsigned)layer;
- (unsigned)localization;
- (unsigned)presentationState;
- (unsigned)previousState;
- (unsigned)previousValue;
- (unsigned)size;
- (unsigned)state;
- (unsigned)value;
- (void)dealloc;
@end

@implementation CUIThemeSchemaRendition

- (unint64_t)numberOfSlices
{
  return self->_nimages;
}

- (CGRect)sliceRects
{
  return self->_layoutRects;
}

- (CUIPSDGradient)gradient
{
  return self->_gradient;
}

- (CUIThemeSchemaRendition)initWithCoreUIOptions:(id)a3 forKey:(const _renditionkeytoken *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CUIThemeSchemaRendition;
  v6 = [(CUIThemeSchemaRendition *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_intrinsicSize = CGSizeZero;
    [(CUIThemeRendition *)v6 _initializeRenditionKey:a4];
    [(CUIThemeRendition *)v7 setOpacity:1.0];
    [(CUIThemeRendition *)v7 setBlendMode:0];
    if (+[NSBundle bundleWithIdentifier:@"com.apple.systemappearance"])
    {
      [(CUIThemeSchemaRendition *)v7 _initializeCoreUIOptions:a3];
    }
  }
  return v7;
}

- (void)dealloc
{
  if (self->_nimages)
  {
    unint64_t v3 = 0;
    image = self->_image;
    do
    {
      CGImageRelease(image[v3]);
      image[v3++] = 0;
    }
    while (v3 < self->_nimages);
  }

  v5.receiver = self;
  v5.super_class = (Class)CUIThemeSchemaRendition;
  [(CUIThemeRendition *)&v5 dealloc];
}

- (double)scale
{
  unsigned int v2 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIThemeRendition *)self key], 12);
  if (v2 <= 1) {
    return (double)1;
  }
  else {
    return (double)v2;
  }
}

- (id)slices
{
  unint64_t v3 = +[NSMutableArray arrayWithCapacity:self->_nimages];
  if (self->_nimages)
  {
    unint64_t v4 = 0;
    p_size = &self->_layoutRects[0].size;
    do
    {
      double width = p_size[-1].width;
      double height = p_size[-1].height;
      double v8 = p_size->width;
      double v9 = p_size->height;
      p_size += 2;
      [(NSMutableArray *)v3 addObject:+[NSValue valueWithRect:](NSValue, "valueWithRect:", width, height, v8, v9)];
      ++v4;
    }
    while (v4 < self->_nimages);
  }
  return +[NSArray arrayWithArray:v3];
}

- (CGRect)alignmentRectangle
{
  double x = self->_elementRect.origin.x;
  double y = self->_elementRect.origin.y;
  double width = self->_elementRect.size.width;
  double height = self->_elementRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)edgeInsets:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CUIThemeSchemaRendition *)self referenceImage];
  v6 = v5;
  p_elementRect = &self->_elementRect;
  double y = p_elementRect->origin.y;
  if (v3) {
    double height = p_elementRect->size.height + 1.0;
  }
  else {
    double height = p_elementRect->size.height;
  }
  [v5 size];
  if (height > v10)
  {
    [v6 size];
    double height = v11;
  }
  double v12 = y + -1.0;
  if (!v3) {
    double v12 = y;
  }
  if (v12 >= 0.0) {
    double v13 = v12;
  }
  else {
    double v13 = 0.0;
  }
  double x = p_elementRect->origin.x;
  [v6 size];
  double v16 = v15 - p_elementRect->size.width - p_elementRect->origin.x;
  [v6 size];
  double v18 = v17 - height - v13;
  double v19 = x;
  double v20 = v13;
  double v21 = v16;
  result.size.double height = v18;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (id)coreUIOptions
{
  return self->cuiInfo;
}

- (id)referenceImage
{
  return 0;
}

- (id)defaultTemplateName
{
  unsigned int v2 = [(CUIThemeRendition *)self key];
  BOOL v3 = CUISystemThemeRenditionKeyFormat();
  CUICopyKeySignature(v5, 0x100uLL, (int *)v2, (uint64_t)v3, 0);
  return +[NSString stringWithUTF8String:v5];
}

- (int64_t)columnSlices
{
  int64_t result = self->_columnSlices;
  if (result <= 0)
  {
    int64_t v4 = [(CUIThemeRendition *)self type];
    int64_t result = 1;
    switch(v4)
    {
      case 0:
      case 2:
        break;
      case 1:
        int64_t result = 4;
        break;
      case 3:
        int64_t result = 3;
        break;
      default:
        if (v4 != 1004) {
          int64_t result = -1;
        }
        break;
    }
    self->_columnSlices = result;
  }
  return result;
}

- (int64_t)rowSlices
{
  int64_t result = self->_rowSlices;
  if (result <= 0)
  {
    uint64_t v4 = [(CUIThemeRendition *)self type];
    int64_t result = 1;
    if (v4 > 2)
    {
      if (v4 == 3)
      {
        int64_t result = 3;
        goto LABEL_10;
      }
      if (v4 != 1004) {
        goto LABEL_8;
      }
    }
    else if ((unint64_t)v4 >= 2)
    {
      if (v4 == 2)
      {
        int64_t result = 4;
        goto LABEL_10;
      }
LABEL_8:
      int64_t result = -1;
    }
LABEL_10:
    self->_rowSlices = result;
  }
  return result;
}

- (CGPoint)renditionCoordinatesForPartFeatures:(int64_t)a3
{
  int v3 = a3;
  if (a3)
  {
    unsigned int v6 = [(CUIThemeSchemaRendition *)self value];
LABEL_6:
    unsigned int v5 = v6;
    goto LABEL_7;
  }
  if ((a3 & 0x4000) != 0)
  {
    unsigned int v6 = [(CUIThemeSchemaRendition *)self dimension1];
    goto LABEL_6;
  }
  unsigned int v5 = 0;
LABEL_7:
  if ((*(void *)&v3 & 0x20004) == 0 || (v3 & 0x10000) != 0)
  {
    if ((v3 & 0x8000) != 0) {
      unsigned int v9 = [(CUIThemeSchemaRendition *)self dimension2];
    }
    else {
      unsigned int v9 = 0;
    }
  }
  else
  {
    unsigned int v7 = [(CUIThemeSchemaRendition *)self presentationState];
    int v8 = v7 == 1;
    if (!v7) {
      int v8 = 2;
    }
    if ((*(void *)&v3 & 0x20004) == 0x20004) {
      unsigned int v9 = v8;
    }
    else {
      unsigned int v9 = v7 == 0;
    }
  }
  double v10 = (double)v5;
  double v11 = (double)v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (unsigned)state
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:10];
}

- (unsigned)previousState
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:19];
}

- (unsigned)presentationState
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:14];
}

- (unsigned)direction
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:4];
}

- (unsigned)value
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:6];
}

- (unsigned)previousValue
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:18];
}

- (unsigned)size
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:3];
}

- (unsigned)dimension1
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:8];
}

- (unsigned)dimension2
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:9];
}

- (unsigned)drawingLayer
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:11];
}

- (unsigned)keyScale
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:12];
}

- (unsigned)identifier
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:17];
}

- (unsigned)layer
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:11];
}

- (unsigned)appearance
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:7];
}

- (unsigned)localization
{
  return [(CUIThemeRendition *)self valueForTokenIdentifier:13];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaRendition;
  return +[NSString stringWithFormat:@"%@ -- st:%u p.st:%u val:%u dim1:%u lay:%u scl:%u id:%u sz:%u dir:%u", [(CUIThemeRendition *)&v3 description], [(CUIThemeSchemaRendition *)self state], [(CUIThemeSchemaRendition *)self presentationState], [(CUIThemeSchemaRendition *)self value], [(CUIThemeSchemaRendition *)self dimension1], [(CUIThemeSchemaRendition *)self drawingLayer], [(CUIThemeSchemaRendition *)self keyScale], [(CUIThemeSchemaRendition *)self identifier], [(CUIThemeSchemaRendition *)self size], [(CUIThemeSchemaRendition *)self direction]];
}

- (id)typeLocalizedString
{
  objc_super v3 = objc_opt_class();
  int64_t v4 = [(CUIThemeRendition *)self type];
  return [v3 displayNameForRenditionType:v4];
}

- (id)stringForState:(unsigned __int16)a3
{
  if (a3 > 5u) {
    objc_super v3 = @"Unknown";
  }
  else {
    objc_super v3 = off_1E5A51C48[(__int16)a3];
  }
  int64_t v4 = +[NSBundle mainBundle];
  return [(NSBundle *)v4 localizedStringForKey:v3 value:&stru_1EF488038 table:0];
}

- (id)stateLocalizedString
{
  uint64_t v3 = [(CUIThemeSchemaRendition *)self state];
  return [(CUIThemeSchemaRendition *)self stringForState:v3];
}

- (id)previousStateLocalizedString
{
  uint64_t v3 = [(CUIThemeSchemaRendition *)self previousState];
  return [(CUIThemeSchemaRendition *)self stringForState:v3];
}

- (id)directionLocalizedString
{
  unsigned int v2 = [(CUIThemeSchemaRendition *)self direction];
  if (v2 > 5) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = off_1E5A51C78[(__int16)v2];
  }
  int64_t v4 = +[NSBundle mainBundle];
  return [(NSBundle *)v4 localizedStringForKey:v3 value:&stru_1EF488038 table:0];
}

- (id)stringForValue:(unsigned __int16)a3
{
  if (a3 > 2u) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = off_1E5A51CA8[(__int16)a3];
  }
  int64_t v4 = +[NSBundle mainBundle];
  return [(NSBundle *)v4 localizedStringForKey:v3 value:&stru_1EF488038 table:0];
}

- (id)valueLocalizedString
{
  uint64_t v3 = [(CUIThemeSchemaRendition *)self value];
  return [(CUIThemeSchemaRendition *)self stringForValue:v3];
}

- (id)previousValueLocalizedString
{
  uint64_t v3 = [(CUIThemeSchemaRendition *)self previousValue];
  return [(CUIThemeSchemaRendition *)self stringForValue:v3];
}

- (id)sizeLocalizedString
{
  unsigned int v2 = [(CUIThemeSchemaRendition *)self size];
  if (v2 > 3) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = off_1E5A51CC0[(__int16)v2];
  }
  int64_t v4 = +[NSBundle mainBundle];
  return [(NSBundle *)v4 localizedStringForKey:v3 value:&stru_1EF488038 table:0];
}

- (id)presentationStateLocalizedString
{
  unsigned int v2 = [(CUIThemeSchemaRendition *)self presentationState];
  if (v2 > 2) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = off_1E5A51CE0[(__int16)v2];
  }
  int64_t v4 = +[NSBundle mainBundle];
  return [(NSBundle *)v4 localizedStringForKey:v3 value:&stru_1EF488038 table:0];
}

- (id)dimension1LocalizedString
{
  unsigned int v2 = +[NSNumber numberWithUnsignedInteger:[(CUIThemeSchemaRendition *)self dimension1]];
  return +[NSNumberFormatter localizedStringFromNumber:v2 numberStyle:1];
}

- (id)dimension2LocalizedString
{
  unsigned int v2 = +[NSNumber numberWithUnsignedInteger:[(CUIThemeSchemaRendition *)self dimension2]];
  return +[NSNumberFormatter localizedStringFromNumber:v2 numberStyle:1];
}

- (id)drawingLayerLocalizedString
{
  unsigned int v2 = [(CUIThemeSchemaRendition *)self drawingLayer];
  if (v2 > 7) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = off_1E5A51CF8[(__int16)v2];
  }
  int64_t v4 = +[NSBundle mainBundle];
  return [(NSBundle *)v4 localizedStringForKey:v3 value:&stru_1EF488038 table:0];
}

- (id)scaleLocalizedString
{
  unsigned int v2 = +[NSNumber numberWithUnsignedInteger:[(CUIThemeSchemaRendition *)self keyScale]];
  return +[NSNumberFormatter localizedStringFromNumber:v2 numberStyle:1];
}

@end