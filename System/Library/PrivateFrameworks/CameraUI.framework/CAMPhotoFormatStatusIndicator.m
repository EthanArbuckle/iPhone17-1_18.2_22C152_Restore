@interface CAMPhotoFormatStatusIndicator
+ (id)localizedTitleForFormat:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)advancedFormat;
- ($0AC6E346AE4835514AAA8AC86D8F4844)essentialFormat;
- ($0AC6E346AE4835514AAA8AC86D8F4844)photoFormat;
- (CAMPhotoFormatStatusIndicator)initWithFrame:(CGRect)a3;
- (NSArray)allowedFormats;
- (int64_t)resolution;
- (unint64_t)_advancedFormatIndex;
- (unint64_t)_essentialFormatIndex;
- (void)_setAdvancedFormatIndex:(unint64_t)a3;
- (void)_setEssentialFormatIndex:(unint64_t)a3;
- (void)setAllowedFormats:(id)a3 essentialFormatIndex:(unint64_t)a4 advancedFormatIndex:(unint64_t)a5;
- (void)setPhotoFormat:(id)a3;
- (void)setPhotoFormat:(id)a3 animated:(BOOL)a4;
@end

@implementation CAMPhotoFormatStatusIndicator

- (CAMPhotoFormatStatusIndicator)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMPhotoFormatStatusIndicator;
  v3 = -[CAMExpandingControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CAMPhotoFormatStatusIndicator *)v3 setAccessibilityIdentifier:@"PhotoFormatStatusIndicator"];
  }
  return v4;
}

+ (id)localizedTitleForFormat:(id)a3
{
  int64_t var1 = a3.var1;
  if (a3.var0 > 2uLL)
  {
    v4 = 0;
  }
  else
  {
    v4 = CAMLocalizedFrameworkString(off_263FA4FF0[a3.var0], 0);
  }
  switch(var1)
  {
    case 0:
      goto LABEL_8;
    case 1:
      int64_t var1 = 12;
      goto LABEL_8;
    case 2:
      int64_t var1 = 24;
LABEL_8:
      objc_super v6 = +[CAMControlStatusIndicator integerFormatter];
      v7 = [NSNumber numberWithInteger:var1];
      v5 = [v6 stringFromNumber:v7];

      break;
    case 3:
      v5 = CAMLocalizedFrameworkString(@"PHOTO_RESOLUTION_MAX", 0);
      break;
    default:
      v5 = 0;
      break;
  }
  v8 = CAMLocalizedFrameworkString(@"PHOTO_ENCODING_PLUS_RESOLUTION_FORMAT", 0);
  v9 = [NSString stringWithValidatedFormat:v8, @"%@%@", 0, v4, v5 validFormatSpecifiers error];

  return v9;
}

- (void)setAllowedFormats:(id)a3 essentialFormatIndex:(unint64_t)a4 advancedFormatIndex:(unint64_t)a5
{
  id v9 = a3;
  if (![v9 isEqualToArray:self->_allowedFormats]
    || self->__essentialFormatIndex != a4
    || self->__advancedFormatIndex != a5)
  {
    objc_storeStrong((id *)&self->_allowedFormats, a3);
    self->__essentialFormatIndex = a4;
    self->__advancedFormatIndex = a5;
    v10 = [v9 objectAtIndexedSubscript:a4];
    $B1CBF1B9C19084F159A2126E2D211268 v24 = ($B1CBF1B9C19084F159A2126E2D211268)0;
    [v10 getValue:&v24 size:16];
    self->_essentialFormat = v24;

    v11 = [v9 objectAtIndexedSubscript:a5];
    $B1CBF1B9C19084F159A2126E2D211268 v24 = ($B1CBF1B9C19084F159A2126E2D211268)0;
    [v11 getValue:&v24 size:16];
    self->_advancedFormat = v24;

    v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v13 = objc_alloc_init(CAMExpandingControlMenuItemConfiguration);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __92__CAMPhotoFormatStatusIndicator_setAllowedFormats_essentialFormatIndex_advancedFormatIndex___block_invoke;
    v19 = &unk_263FA4FD0;
    v20 = self;
    v21 = v13;
    id v22 = v12;
    unint64_t v23 = a4;
    id v14 = v12;
    v15 = v13;
    [v9 enumerateObjectsUsingBlock:&v16];
    -[CAMExpandingControl setMenu:](self, "setMenu:", v14, v16, v17, v18, v19, v20);
  }
}

void __92__CAMPhotoFormatStatusIndicator_setAllowedFormats_essentialFormatIndex_advancedFormatIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = a2;
  v7 = objc_opt_class();
  v8 = v7;
  if (v5 == a3)
  {
    id v9 = objc_msgSend(v7, "localizedTitleForFormat:", *(void *)(*(void *)(a1 + 32) + 648), *(void *)(*(void *)(a1 + 32) + 656));
    [*(id *)(a1 + 40) setHidden:1];
    v10 = *(void **)(a1 + 40);
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    [v6 getValue:&v13 size:16];
    id v9 = objc_msgSend(v8, "localizedTitleForFormat:", v13, v14);
    [*(id *)(a1 + 40) setHidden:0];
    v10 = *(void **)(a1 + 40);
    uint64_t v11 = 0;
  }
  [v10 setSlashesTitle:v11];
  v12 = +[CAMExpandingControlTextMenuItem menuItemWithState:v6 titleText:v9 subtitle:v9 selectedSubtitle:0 configuration:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) addObject:v12];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)photoFormat
{
  v2 = [(CAMExpandingControl *)self selectedState];
  int64_t v7 = 0;
  int64_t v8 = 0;
  [v2 getValue:&v7 size:16];
  int64_t v3 = v7;
  int64_t v4 = v8;

  int64_t v5 = v3;
  int64_t v6 = v4;
  result.int64_t var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)setPhotoFormat:(id)a3
{
}

- (void)setPhotoFormat:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  $0AC6E346AE4835514AAA8AC86D8F4844 v7 = a3;
  int64_t v6 = [MEMORY[0x263F08D40] valueWithBytes:&v7 objCType:"{?=qq}"];
  [(CAMExpandingControl *)self setSelectedState:v6 animated:v4];
}

- (int64_t)resolution
{
  [(CAMPhotoFormatStatusIndicator *)self photoFormat];
  return v2;
}

- (NSArray)allowedFormats
{
  return self->_allowedFormats;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)essentialFormat
{
  p_essentialFormat = &self->_essentialFormat;
  int64_t encoding = self->_essentialFormat.encoding;
  int64_t resolution = p_essentialFormat->resolution;
  result.int64_t var1 = resolution;
  result.var0 = encoding;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)advancedFormat
{
  p_advancedFormat = &self->_advancedFormat;
  int64_t encoding = self->_advancedFormat.encoding;
  int64_t resolution = p_advancedFormat->resolution;
  result.int64_t var1 = resolution;
  result.var0 = encoding;
  return result;
}

- (unint64_t)_advancedFormatIndex
{
  return self->__advancedFormatIndex;
}

- (void)_setAdvancedFormatIndex:(unint64_t)a3
{
  self->__advancedFormatIndex = a3;
}

- (unint64_t)_essentialFormatIndex
{
  return self->__essentialFormatIndex;
}

- (void)_setEssentialFormatIndex:(unint64_t)a3
{
  self->__essentialFormatIndex = a3;
}

- (void).cxx_destruct
{
}

@end