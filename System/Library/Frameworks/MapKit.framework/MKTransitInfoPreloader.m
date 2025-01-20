@interface MKTransitInfoPreloader
+ (id)attributedTextFromPreload:(id)a3 view:(id)a4;
+ (id)separatorImageWithLineHeight:(double)a3;
- (MKTransitInfoPreloader)initWithTransitLabels:(id)a3;
- (void)preloadWithCompletion:(id)a3;
@end

@implementation MKTransitInfoPreloader

- (MKTransitInfoPreloader)initWithTransitLabels:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKTransitInfoPreloader;
  v5 = [(MKTransitInfoPreloader *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    transitLabels = v5->_transitLabels;
    v5->_transitLabels = (NSArray *)v6;
  }
  return v5;
}

+ (id)attributedTextFromPreload:(id)a3 view:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 attributedString];
  v7 = (void *)[v6 copy];

  v8 = [v5 font];
  [v8 capHeight];
  uint64_t v10 = v9;

  uint64_t v11 = *MEMORY[0x1E4F424C0];
  uint64_t v12 = [v7 length];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__MKTransitInfoPreloader_attributedTextFromPreload_view___block_invoke;
  v15[3] = &unk_1E54B8E70;
  uint64_t v17 = v10;
  id v16 = v5;
  id v13 = v5;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v15);

  return v7;
}

void __57__MKTransitInfoPreloader_attributedTextFromPreload_view___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v6;
      v3 = [v2 image];
      [v3 size];
      UIRoundToViewScale();
      double v5 = v4;

      [v2 setVerticalOffset:v5];
    }
  }
}

- (void)preloadWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(NSArray *)self->_transitLabels count])
    {
      double v5 = +[MKFontManager sharedManager];
      id v6 = [v5 smallAttributionFont];

      v7 = [MEMORY[0x1E4F42D90] mainScreen];
      [v7 scale];
      uint64_t v9 = v8;

      uint64_t v10 = +[MKTransitInfoLabelView stringAttributesForFont:v6 lineBreakMode:4];
      int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
      uint64_t v12 = [MEMORY[0x1E4F42738] sharedApplication];
      id v13 = [v12 preferredContentSizeCategory];

      int64_t v14 = +[MKTransitInfoLabelView shieldSizeForContentSizeCategory:v13];
      int64_t v15 = +[MKTransitInfoLabelView iconSizeForContentSizeCategory:v13];
      id v16 = +[MKArtworkDataSourceCache sharedInstance];
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = __Block_byref_object_copy__3;
      v34[4] = __Block_byref_object_dispose__3;
      id v17 = objc_alloc(MEMORY[0x1E4F28E48]);
      if (IsRightToLeft) {
        v18 = @"\u200F";
      }
      else {
        v18 = @"\u200E";
      }
      id v35 = (id)[v17 initWithString:v18 attributes:v10];
      v19 = dispatch_get_global_queue(2, 0);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __48__MKTransitInfoPreloader_preloadWithCompletion___block_invoke;
      v23[3] = &unk_1E54B8EC0;
      id v24 = v10;
      v25 = self;
      int64_t v30 = v15;
      int64_t v31 = v14;
      uint64_t v32 = v9;
      id v26 = v16;
      id v27 = v6;
      long long v33 = xmmword_18BD1AE10;
      v29 = v34;
      id v28 = v4;
      id v20 = v6;
      id v21 = v16;
      id v22 = v10;
      dispatch_async(v19, v23);

      _Block_object_dispose(v34, 8);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __48__MKTransitInfoPreloader_preloadWithCompletion___block_invoke(uint64_t a1)
{
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  id v2 = [MEMORY[0x1E4F1CA80] set];
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v5 = objc_msgSend(NSString, "_mapkit_commaListDelimiter");
  id v6 = (void *)[v4 initWithString:v5 attributes:*(void *)(a1 + 32)];

  v7 = *(void **)(*(void *)(a1 + 40) + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__MKTransitInfoPreloader_preloadWithCompletion___block_invoke_2;
  v15[3] = &unk_1E54B8E98;
  long long v26 = *(_OWORD *)(a1 + 80);
  id v16 = *(id *)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 96);
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 40);
  id v17 = v8;
  uint64_t v18 = v9;
  id v10 = v2;
  id v19 = v10;
  v23 = v29;
  long long v28 = *(_OWORD *)(a1 + 104);
  id v24 = v31;
  id v11 = v3;
  uint64_t v12 = *(void *)(a1 + 72);
  id v20 = v11;
  uint64_t v25 = v12;
  id v13 = v6;
  id v21 = v13;
  id v22 = *(id *)(a1 + 32);
  [v7 enumerateObjectsWithOptions:0 usingBlock:v15];
  int64_t v14 = [[MKTransitInfoPreload alloc] initWithAttributedString:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __48__MKTransitInfoPreloader_preloadWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v28 = a2;
  uint64_t v5 = [v28 type];
  if (v5 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_mapkit_lineHeight");
    id v10 = [(id)objc_opt_class() separatorImageWithLineHeight:v11];
    BOOL v8 = 1;
    if (v10) {
      goto LABEL_9;
    }
LABEL_14:
    id v13 = 0;
    goto LABEL_15;
  }
  if (v5 == 2)
  {
    id v13 = [v28 labelString];
    id v10 = 0;
LABEL_15:
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  if (v5 != 1)
  {
    id v10 = 0;
    goto LABEL_14;
  }
  id v6 = [v28 labelArtwork];
  int v7 = [v6 artworkSourceType];
  BOOL v8 = v7 == 2;
  uint64_t v9 = 120;
  if (v7 == 2) {
    uint64_t v9 = 112;
  }
  id v10 = [*(id *)(a1 + 32) imageForArtwork:v6 size:*(void *)(a1 + v9) featureType:2 scale:0 nightMode:*(double *)(a1 + 128)];

  if (!v10) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v12 = UIImagePNGRepresentation(v10);
  if (v12 && ([*(id *)(a1 + 56) containsObject:v12] & 1) == 0)
  {
    [*(id *)(a1 + 56) addObject:v12];
    uint64_t v15 = 136;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
      uint64_t v16 = 136;
    }
    else {
      uint64_t v16 = 144;
    }
    double v17 = 0.0;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
      double v18 = *(double *)(a1 + v16);
    }
    else {
      double v18 = 0.0;
    }
    if (!v8) {
      uint64_t v15 = 144;
    }
    double v19 = *(double *)(a1 + v15);
    if (a3 + 1 != [*(id *)(*(void *)(a1 + 48) + 8) count]) {
      double v17 = v19;
    }
    uint64_t v27 = [[MKEmptyTextAttachment alloc] initWithWidth:v18];
    uint64_t v25 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v27];
    long long v26 = [[MKEmptyTextAttachment alloc] initWithWidth:v17];
    id v20 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v26];
    id v21 = [[MKImageTextAttachment alloc] initWithImage:v10 verticalOffset:0.0];
    id v22 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v21];
    id v14 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    [v14 appendAttributedString:v25];
    [v14 appendAttributedString:v22];
    [v14 appendAttributedString:v20];
    uint64_t v23 = *MEMORY[0x1E4F42510];
    id v24 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v14, "addAttribute:value:range:", v23, v24, 0, objc_msgSend(v14, "length"));

    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v8;

    id v13 = 0;
    if (v14) {
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  id v13 = 0;
LABEL_16:
  if ([v13 length] && (objc_msgSend(*(id *)(a1 + 64), "containsObject:", v13) & 1) == 0)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
      [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) appendAttributedString:*(void *)(a1 + 72)];
    }
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:*(void *)(a1 + 80)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    [*(id *)(a1 + 64) addObject:v13];
    if (v14)
    {
LABEL_21:
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), "appendAttributedString:", v14, v25);
    }
  }
LABEL_22:
}

+ (id)separatorImageWithLineHeight:(double)a3
{
  id v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 nativeScale];
  double v5 = 1.0;
  if (v6 > 1.0)
  {
    int v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 nativeScale];
    double v5 = v8;
  }
  CGFloat v9 = 1.0 / v5;
  id v10 = [MEMORY[0x1E4F42D90] mainScreen];
  [v10 scale];
  CGFloat v12 = v11;
  v18.width = v9;
  v18.height = a3;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v12);

  id v13 = [MEMORY[0x1E4F428B8] lightGrayColor];
  [v13 setFill];

  CurrentContext = UIGraphicsGetCurrentContext();
  v19.origin.y = a3 * 0.125;
  v19.size.height = a3 * 0.75;
  v19.origin.x = 0.0;
  v19.size.width = v9;
  CGContextFillRect(CurrentContext, v19);
  uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (void).cxx_destruct
{
}

@end