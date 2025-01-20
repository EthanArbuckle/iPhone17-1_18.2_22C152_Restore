@interface CHSWidgetMetrics
+ (BOOL)supportsSecureCoding;
+ (id)sha256DataFromData:(id)a3;
+ (void)_removeSafeAreaInsetsIn:(id)a3;
+ (void)_replaceFontStyleIn:(id)a3 withTextSizeAdjustment:(int64_t)a4;
- (BOOL)_hasZeroLayoutInsets;
- (BOOL)_isUnitScale;
- (BOOL)isEqual:(id)a3;
- (CGSize)_effectiveSizePixelAlignedForDisplayScale:(double)a3;
- (CGSize)_rawEffectiveSize;
- (CGSize)_rawLayoutInsetAdjustedSizePixelAlignedForDisplayScale:(double)a3;
- (CGSize)_rawSizePixelAlignedForDisplayScale:(double)a3;
- (CGSize)scale;
- (CGSize)size;
- (CHSEdgeInsets)contentMargins;
- (CHSEdgeInsets)layoutInsets;
- (CHSEdgeInsets)safeAreaInsets;
- (CHSEdgeInsets)widgetGroupContentMargins;
- (CHSEdgeInsets)widgetGroupLayoutInsets;
- (CHSEdgeInsets)widgetGroupSafeAreaInsets;
- (CHSWidgetMargins)groupMargins;
- (CHSWidgetMargins)margins;
- (CHSWidgetMetrics)init;
- (CHSWidgetMetrics)initWithCoder:(id)a3;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8 widgetGroupMargins:(id)a9 nestedContentMetrics:(id)a10;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7 supportsDynamicText:(unint64_t)a8;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7 widgetGroupMargins:(id)a8 nestedContentMetrics:(id)a9;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 textSizeAdjustment:(int64_t)a6;
- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 textSizeAdjustment:(int64_t)a5;
- (CHSWidgetMetrics)initWithXPCDictionary:(id)a3;
- (NSDictionary)nestedContentMetrics;
- (double)_effectiveCornerRadius;
- (double)_roundToNearestOrUp:(double)a3 withScale:(double)a4;
- (double)cornerRadius;
- (double)scaleFactor;
- (id)_dawnStringKeyRepresentation;
- (id)_stringKeyRepresentation;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)filenameSafeSHAFrom:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)widgetGroupMargins;
- (int64_t)compare:(id)a3;
- (int64_t)fontStyle;
- (int64_t)textSizeAdjustment;
- (uint64_t)initWithSize:(double)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(double)a6 safeAreaInsets:(double)a7 layoutInsets:(double)a8 contentMargins:(double)a9 supportsDynamicText:(uint64_t)a10;
- (unint64_t)dynamicTextSupport;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation CHSWidgetMetrics

- (CHSWidgetMetrics)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSWidgetMetrics.m" lineNumber:51 description:@"Use initWithSize:cornerRadius:"];

  return -[CHSWidgetMetrics initWithSize:cornerRadius:](self, "initWithSize:cornerRadius:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 0.0);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:", 0, a3.width, a3.height, a4, 1.0);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 textSizeAdjustment:(int64_t)a5
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:textSizeAdjustment:](self, "initWithSize:cornerRadius:scaleFactor:textSizeAdjustment:", a5, a3.width, a3.height, a4, 1.0);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 textSizeAdjustment:(int64_t)a6
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:", CHSWidgetFontStyleFromTextSizeAdjustment(a6), a3.width, a3.height, a4, a5);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:", a6, a3.width, a3.height, a4, a5, 0.0, 0.0, 0.0, 0.0);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:supportsDynamicText:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:supportsDynamicText:", a6, 0, a3.width, a3.height, a4, a5, a7.top, a7.leading, a7.bottom, a7.trailing);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7 widgetGroupMargins:(id)a8 nestedContentMetrics:(id)a9
{
  double trailing = a7.trailing;
  double bottom = a7.bottom;
  double leading = a7.leading;
  double top = a7.top;
  double height = a3.height;
  double width = a3.width;
  id v20 = a8;
  id v21 = a9;
  v22 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:]([CHSWidgetMargins alloc], "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", top, leading, bottom, trailing, 0, 0, 0, 0, 0, 0, 0, 0);
  v23 = -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:", a6, v22, 0, v20, v21, width, height, a4, a5);

  return v23;
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 safeAreaInsets:(CHSEdgeInsets)a7 supportsDynamicText:(unint64_t)a8
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:", a6, a8, a3.width, a3.height, a4, a5, a7.top, a7.leading, a7.bottom, a7.trailing, 0, 0, 0, 0, 0, 0, 0,
           0);
}

- (uint64_t)initWithSize:(double)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(double)a6 safeAreaInsets:(double)a7 layoutInsets:(double)a8 contentMargins:(double)a9 supportsDynamicText:(uint64_t)a10
{
  v31 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:]([CHSWidgetMargins alloc], "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", a6, a7, a8, a9, a17, a18, a19, a20, a21, a22, a23, a24, a21, a22, a23, a24);
  uint64_t v32 = objc_msgSend(a1, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:", a11, v31, a12, a2, a3, a4, a5);

  return v32;
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8
{
  return -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:", a6, a7, a8, 0, 0, a3.width, a3.height, a4, a5);
}

- (CHSWidgetMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8 widgetGroupMargins:(id)a9 nestedContentMetrics:(id)a10
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  v31.receiver = self;
  v31.super_class = (Class)CHSWidgetMetrics;
  v22 = [(CHSWidgetMetrics *)&v31 init];
  v23 = v22;
  if (v22)
  {
    v22->_size.CGFloat width = width;
    v22->_size.CGFloat height = height;
    v22->_cornerRadius = a4;
    v22->_scaleFactor = a5;
    v22->_fontStyle = a6;
    uint64_t v24 = [v19 copy];
    margins = v23->_margins;
    v23->_margins = (CHSWidgetMargins *)v24;

    v23->_dynamicTextSupport = a8;
    uint64_t v26 = [v20 copy];
    groupMargins = v23->_groupMargins;
    v23->_groupMargins = (CHSWidgetMargins *)v26;

    uint64_t v28 = [v21 copy];
    nestedContentMetrics = v23->_nestedContentMetrics;
    v23->_nestedContentMetrics = (NSDictionary *)v28;
  }
  return v23;
}

- (CHSEdgeInsets)safeAreaInsets
{
  [(CHSWidgetMargins *)self->_margins safeAreaInsets];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (CHSEdgeInsets)layoutInsets
{
  [(CHSWidgetMargins *)self->_margins layoutInsets];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (CHSEdgeInsets)contentMargins
{
  [(CHSWidgetMargins *)self->_margins contentMargins];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (CHSEdgeInsets)widgetGroupSafeAreaInsets
{
  [(CHSWidgetMargins *)self->_groupMargins safeAreaInsets];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (CHSEdgeInsets)widgetGroupLayoutInsets
{
  [(CHSWidgetMargins *)self->_groupMargins layoutInsets];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (CHSEdgeInsets)widgetGroupContentMargins
{
  [(CHSWidgetMargins *)self->_groupMargins contentMargins];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (id)widgetGroupMargins
{
  return self->_groupMargins;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __28__CHSWidgetMetrics_isEqual___block_invoke;
  v51[3] = &unk_1E56C84E0;
  id v10 = v9;
  id v52 = v10;
  id v11 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v51, self->_size.width, self->_size.height);
  double cornerRadius = self->_cornerRadius;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_2;
  v49[3] = &unk_1E56C8440;
  id v13 = v10;
  id v50 = v13;
  id v14 = (id)[v5 appendCGFloat:v49 counterpart:cornerRadius];
  double scaleFactor = self->_scaleFactor;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_3;
  v47[3] = &unk_1E56C8440;
  id v16 = v13;
  id v48 = v16;
  id v17 = (id)[v5 appendCGFloat:v47 counterpart:scaleFactor];
  int64_t fontStyle = self->_fontStyle;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_4;
  v45[3] = &unk_1E56C8530;
  id v19 = v16;
  id v46 = v19;
  id v20 = (id)[v5 appendInteger:fontStyle counterpart:v45];
  unint64_t dynamicTextSupport = self->_dynamicTextSupport;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_5;
  v43[3] = &unk_1E56C8530;
  id v22 = v19;
  id v44 = v22;
  id v23 = (id)[v5 appendInteger:dynamicTextSupport counterpart:v43];
  margins = self->_margins;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_6;
  v41[3] = &unk_1E56C96C0;
  id v25 = v22;
  id v42 = v25;
  id v26 = (id)[v5 appendObject:margins counterpart:v41];
  groupMargins = self->_groupMargins;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __28__CHSWidgetMetrics_isEqual___block_invoke_7;
  v39[3] = &unk_1E56C96C0;
  id v28 = v25;
  id v40 = v28;
  id v29 = (id)[v5 appendObject:groupMargins counterpart:v39];
  v30 = [(CHSWidgetMetrics *)self nestedContentMetrics];
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __28__CHSWidgetMetrics_isEqual___block_invoke_8;
  v37 = &unk_1E56C96E8;
  id v31 = v28;
  id v38 = v31;
  id v32 = (id)[v5 appendObject:v30 counterpart:&v34];

  LOBYTE(v30) = objc_msgSend(v5, "isEqual", v34, v35, v36, v37);
  return (char)v30;
}

double __28__CHSWidgetMetrics_isEqual___block_invoke(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 64);
}

double __28__CHSWidgetMetrics_isEqual___block_invoke_2(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 8);
}

double __28__CHSWidgetMetrics_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 16);
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_4(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 32);
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_5(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

id __28__CHSWidgetMetrics_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

id __28__CHSWidgetMetrics_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

uint64_t __28__CHSWidgetMetrics_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) nestedContentMetrics];
}

- (unint64_t)hash
{
  double v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  id v5 = (id)[v3 appendCGFloat:self->_cornerRadius];
  id v6 = (id)[v3 appendCGFloat:self->_scaleFactor];
  id v7 = (id)[v3 appendInteger:self->_fontStyle];
  id v8 = (id)[v3 appendInteger:self->_dynamicTextSupport];
  id v9 = (id)[v3 appendObject:self->_margins];
  id v10 = (id)[v3 appendObject:self->_groupMargins];
  id v11 = (id)[v3 appendObject:self->_nestedContentMetrics];
  unint64_t v12 = [v3 hash];

  return v12;
}

+ (id)sha256DataFromData:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), md))
  {
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
    id v5 = [v4 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)succinctDescription
{
  double v2 = [(CHSWidgetMetrics *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(CHSWidgetMetrics *)self size];
  id v4 = (id)objc_msgSend(v3, "appendSize:withName:", @"size");
  [(CHSWidgetMetrics *)self cornerRadius];
  id v5 = (id)objc_msgSend(v3, "appendFloat:withName:", @"cornerRadius");
  [(CHSWidgetMetrics *)self scaleFactor];
  id v6 = (id)objc_msgSend(v3, "appendFloat:withName:", @"scaleFactor");
  unint64_t v7 = [(CHSWidgetMetrics *)self dynamicTextSupport];
  uint64_t v8 = @"Unspecified";
  if (v7 == 2) {
    uint64_t v8 = @"No";
  }
  if (v7 == 1) {
    id v9 = @"Yes";
  }
  else {
    id v9 = v8;
  }
  [v3 appendString:v9 withName:@"supportsDynamicText"];
  id v10 = CHSWidgetFontStyleDescription([(CHSWidgetMetrics *)self fontStyle]);
  [v3 appendString:v10 withName:@"fontStyle"];

  id v11 = (id)[v3 appendObject:self->_margins withName:@"margins"];
  id v12 = (id)[v3 appendObject:self->_groupMargins withName:@"groupMargins"];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = self->_nestedContentMetrics;
  uint64_t v15 = [(NSDictionary *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = CHSWidgetFamilyDescription(objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "integerValue", (void)v21));
        [v13 addObject:v18];
      }
      uint64_t v15 = [(NSDictionary *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  id v19 = [v13 componentsJoinedByString:@", "];
  [v3 appendString:v19 withName:@"nestedContentMetrics" skipIfEmpty:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(CHSWidgetMetrics *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CHSWidgetMetrics_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

uint64_t __58__CHSWidgetMetrics_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", @"size", *(double *)(*(void *)(a1 + 40) + 64), *(double *)(*(void *)(a1 + 40) + 72));
  id v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _rawEffectiveSize];
  id v4 = (id)objc_msgSend(v3, "appendSize:withName:", @"rawEffectiveSize");
  id v5 = (id)[*(id *)(a1 + 32) appendFloat:@"cornerRadius" withName:*(double *)(*(void *)(a1 + 40) + 8)];
  id v6 = (id)[*(id *)(a1 + 32) appendFloat:@"scaleFactor" withName:*(double *)(*(void *)(a1 + 40) + 16)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 24);
  uint64_t v8 = @"Unspecified";
  if (v7 == 2) {
    uint64_t v8 = @"No";
  }
  if (v7 == 1) {
    id v9 = @"Yes";
  }
  else {
    id v9 = v8;
  }
  [*(id *)(a1 + 32) appendString:v9 withName:@"supportsDynamicText"];
  id v10 = *(void **)(a1 + 32);
  id v11 = CHSWidgetFontStyleDescription(*(void *)(*(void *)(a1 + 40) + 32));
  [v10 appendString:v11 withName:@"fontStyle"];

  id v12 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"margins" skipIfNil:1];
  id v13 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"groupMargins" skipIfNil:1];
  id v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 56);
  return [v14 appendDictionarySection:v15 withName:@"nestedContentMetrics" multilinePrefix:@"   " skipIfEmpty:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeSize:forKey:", @"size", self->_size.width, self->_size.height);
  [v6 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  [v6 encodeDouble:@"scaleFactor" forKey:self->_scaleFactor];
  [v6 encodeInteger:self->_fontStyle forKey:@"fontStyle"];
  [v6 encodeObject:self->_margins forKey:@"margins"];
  [v6 encodeInteger:self->_dynamicTextSupport forKey:@"dynamicText"];
  groupMargins = self->_groupMargins;
  if (groupMargins) {
    [v6 encodeObject:groupMargins forKey:@"widgetGroupMargins"];
  }
  nestedContentMetrics = self->_nestedContentMetrics;
  if (nestedContentMetrics) {
    [v6 encodeObject:nestedContentMetrics forKey:@"nestedContentMetrics"];
  }
}

- (CHSWidgetMetrics)initWithCoder:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 decodeSizeForKey:@"size"];
  double v6 = v5;
  double v8 = v7;
  [v4 decodeDoubleForKey:@"cornerRadius"];
  double v10 = v9;
  [v4 decodeDoubleForKey:@"scaleFactor"];
  double v12 = v11;
  if ([v4 containsValueForKey:@"scaleFactors"])
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"No longer valid due to deprecated scale factor.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v15 = [v13 errorWithDomain:@"com.apple.chronoservices.metrics" code:1 userInfo:v14];
    [v4 failWithError:v15];

    uint64_t v16 = 0;
  }
  else
  {
    if ([v4 containsValueForKey:@"textSizeAdjustment"]) {
      uint64_t v17 = CHSWidgetFontStyleFromTextSizeAdjustment([v4 decodeIntegerForKey:@"textSizeAdjustment"]);
    }
    else {
      uint64_t v17 = [v4 decodeIntegerForKey:@"fontStyle"];
    }
    uint64_t v18 = v17;
    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"margins"];
    if (!v19) {
      id v19 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:]([CHSWidgetMargins alloc], "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
    if ([v4 containsValueForKey:@"dynamicText"]) {
      uint64_t v20 = [v4 decodeIntegerForKey:@"dynamicText"];
    }
    else {
      uint64_t v20 = 0;
    }
    long long v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widgetGroupMargins"];
    uint64_t v22 = objc_opt_class();
    long long v23 = [v4 decodeDictionaryWithKeysOfClass:v22 objectsOfClass:objc_opt_class() forKey:@"nestedContentMetrics"];
    self = -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:", v18, v19, v20, v21, v23, v6, v8, v10, v12);

    uint64_t v16 = self;
  }

  return v16;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  if (xdict)
  {
    [@"size" UTF8String];
    BSSerializeCGSizeToXPCDictionaryWithKey();
    MEMORY[0x192FD6A40](xdict, [@"cornerRadius" UTF8String], self->_cornerRadius);
    MEMORY[0x192FD6A40](xdict, [@"scaleFactor" UTF8String], self->_scaleFactor);
    xpc_dictionary_set_int64(xdict, (const char *)[@"fontStyle" UTF8String], -[CHSWidgetMetrics fontStyle](self, "fontStyle"));
    [@"margins" UTF8String];
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    xpc_dictionary_set_uint64(xdict, (const char *)[@"dynamicText" UTF8String], -[CHSWidgetMetrics dynamicTextSupport](self, "dynamicTextSupport"));
    if (self->_groupMargins)
    {
      [@"widgetGroupMargins" UTF8String];
      BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    }
    nestedContentMetrics = self->_nestedContentMetrics;
    if (nestedContentMetrics)
    {
      double v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:nestedContentMetrics requiringSecureCoding:1 error:0];
      [@"nestedContentMetrics" UTF8String];
      BSSerializeDataToXPCDictionaryWithKey();
    }
  }
}

- (CHSWidgetMetrics)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_5:
    double v12 = 0;
    goto LABEL_12;
  }
  [@"size" UTF8String];
  BSDeserializeCGSizeFromXPCDictionaryWithKey();
  double v6 = v5;
  double v8 = v7;
  double v9 = MEMORY[0x192FD6930](v4, [@"cornerRadius" UTF8String]);
  double v10 = MEMORY[0x192FD6930](v4, [@"scaleFactor" UTF8String]);
  double v11 = xpc_dictionary_get_value(v4, (const char *)[@"scaleFactors" UTF8String]);

  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190C6F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Metrics no longer valid due to deprecated scale factor.", buf, 2u);
    }
    goto LABEL_5;
  }
  id v13 = xpc_dictionary_get_value(v4, (const char *)[@"textSizeAdjustment" UTF8String]);

  if (v13)
  {
    int64_t int64 = xpc_dictionary_get_int64(v4, (const char *)[@"textSizeAdjustment" UTF8String]);
    int64_t v15 = CHSWidgetFontStyleFromTextSizeAdjustment(int64);
  }
  else
  {
    int64_t v15 = xpc_dictionary_get_int64(v4, (const char *)[@"fontStyle" UTF8String]);
  }
  int64_t v16 = v15;
  [@"margins" UTF8String];
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  uint64_t v17 = (CHSWidgetMargins *)objc_claimAutoreleasedReturnValue();
  if (!v17) {
    uint64_t v17 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:]([CHSWidgetMargins alloc], "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  uint64_t int64 = xpc_dictionary_get_uint64(v4, (const char *)[@"dynamicText" UTF8String]);
  [@"widgetGroupMargins" UTF8String];
  id v19 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  [@"nestedContentMetrics" UTF8String];
  uint64_t v20 = BSDeserializeDataFromXPCDictionaryWithKey();
  long long v21 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v22 = objc_opt_class();
  long long v23 = [v21 unarchivedDictionaryWithKeysOfClass:v22 objectsOfClass:objc_opt_class() fromData:v20 error:0];
  self = -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](self, "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:", v16, v17, uint64, v19, v23, v6, v8, v9, v10);

  double v12 = self;
LABEL_12:

  return v12;
}

+ (void)_replaceFontStyleIn:(id)a3 withTextSizeAdjustment:(int64_t)a4
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_value(xdict, (const char *)[@"fontStyle" UTF8String], 0);
  xpc_dictionary_set_int64(xdict, (const char *)[@"textSizeAdjustment" UTF8String], a4);
}

+ (void)_removeSafeAreaInsetsIn:(id)a3
{
  id v49 = a3;
  [@"margins" UTF8String];
  id v3 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  if (v3)
  {
    id v4 = [CHSWidgetMargins alloc];
    [v3 layoutInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [v3 contentMargins];
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    [v3 backgroundRemovedContentMargins];
    uint64_t v25 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:](v4, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", 0.0, 0.0, 0.0, 0.0, v6, v8, v10, v12, v14, v16, v18, v20, v21, v22, v23, v24);
    [@"margins" UTF8String];
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  [@"widgetGroupMargins" UTF8String];
  uint64_t v26 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  if (v26)
  {
    v27 = [CHSWidgetMargins alloc];
    [v26 layoutInsets];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    [v26 contentMargins];
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    [v26 backgroundRemovedContentMargins];
    id v48 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:](v27, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", 0.0, 0.0, 0.0, 0.0, v29, v31, v33, v35, v37, v39, v41, v43, v44, v45, v46, v47);
    [@"widgetGroupMargins" UTF8String];
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
}

- (BOOL)_isUnitScale
{
  return BSFloatEqualToFloat();
}

- (BOOL)_hasZeroLayoutInsets
{
  [(CHSWidgetMargins *)self->_margins layoutInsets];
  return CHSEdgeInsetsEqualToEdgeInsets();
}

- (CGSize)_rawEffectiveSize
{
  [(CHSWidgetMetrics *)self size];
  double v4 = v3;
  double v6 = v5;
  [(CHSWidgetMetrics *)self scaleFactor];
  double v8 = v7;
  if (BSFloatEqualToFloat()) {
    double v9 = 1.0;
  }
  else {
    double v9 = v8;
  }
  double v10 = v6 * v9;
  double v11 = v4 * v9;
  result.CGFloat height = v10;
  result.CGFloat width = v11;
  return result;
}

- (CGSize)_effectiveSizePixelAlignedForDisplayScale:(double)a3
{
  [(CHSWidgetMetrics *)self _rawEffectiveSize];
  double v6 = v5;
  double v8 = v7;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    [(CHSWidgetMetrics *)self _roundToNearestOrUp:v6 withScale:a3];
    double v6 = v9;
    [(CHSWidgetMetrics *)self _roundToNearestOrUp:v8 withScale:a3];
    double v8 = v10;
  }
  double v11 = v6;
  double v12 = v8;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (CGSize)_rawSizePixelAlignedForDisplayScale:(double)a3
{
  [(CHSWidgetMetrics *)self _roundToNearestOrUp:self->_size.width withScale:a3];
  double v6 = v5;
  [(CHSWidgetMetrics *)self _roundToNearestOrUp:self->_size.height withScale:a3];
  double v8 = v7;
  double v9 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v9;
  return result;
}

- (CGSize)_rawLayoutInsetAdjustedSizePixelAlignedForDisplayScale:(double)a3
{
  [(CHSWidgetMargins *)self->_margins layoutInsets];
  double v6 = v5;
  double v8 = v7;
  [(CHSWidgetMetrics *)self _roundToNearestOrUp:fmax(self->_size.width - v9 - v10, 0.0) withScale:a3];
  double v12 = v11;
  [(CHSWidgetMetrics *)self _roundToNearestOrUp:fmax(self->_size.height - v6 - v8, 0.0) withScale:a3];
  double v14 = v13;
  double v15 = v12;
  result.CGFloat height = v14;
  result.CGFloat width = v15;
  return result;
}

- (double)_effectiveCornerRadius
{
  double cornerRadius = self->_cornerRadius;
  double scaleFactor = self->_scaleFactor;
  if (BSFloatEqualToFloat()) {
    double v4 = 1.0;
  }
  else {
    double v4 = scaleFactor;
  }
  return cornerRadius * v4;
}

- (double)_roundToNearestOrUp:(double)a3 withScale:(double)a4
{
  if (a4 != 0.0) {
    return 1.0 / a4 * floor((1.0 / a4 * 0.5 + a3) / (1.0 / a4));
  }
  double v4 = CHSLogChronoServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CHSWidgetMetrics _roundToNearestOrUp:withScale:](v4);
  }

  return 0.0;
}

- (id)filenameSafeSHAFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if ([v16 count])
  {
    context = (void *)MEMORY[0x192FD70A0]();
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = v16;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      double v7 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v17 = 0;
          double v10 = objc_msgSend(MEMORY[0x1E4F960F8], "encodeObject:error:", v9, &v17, context);
          id v11 = v17;
          if (v11)
          {
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v23 = v11;
              _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "Failed to encode widget metrics %{public}@.", buf, 0xCu);
            }
          }
          else
          {
            [v3 appendData:v10];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v5);
    }

    double v12 = +[CHSWidgetMetrics sha256DataFromData:v3];
    double v13 = [v12 stringByReplacingOccurrencesOfString:@"/" withString:@"#"];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)_stringKeyRepresentation
{
  [(CHSWidgetMetrics *)self _rawEffectiveSize];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v8 = v7;
  if (self->_nestedContentMetrics) {
    objc_msgSend(v7, "addObject:");
  }
  if (self->_groupMargins) {
    objc_msgSend(v8, "addObject:");
  }
  uint64_t v9 = [(CHSWidgetMetrics *)self filenameSafeSHAFrom:v8];
  if (v9)
  {
    double v10 = NSString;
    [(CHSWidgetMetrics *)self _effectiveCornerRadius];
    [v10 stringWithFormat:@"%.2fw-%.2fh-%.2fr-%@", v4, v6, v11, v9];
  }
  else
  {
    [(CHSWidgetMetrics *)self _dawnStringKeyRepresentation];
  double v12 = };

  return v12;
}

- (id)_dawnStringKeyRepresentation
{
  [(CHSWidgetMetrics *)self _rawEffectiveSize];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  [(CHSWidgetMargins *)self->_margins safeAreaInsets];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  double v15 = NSString;
  [(CHSWidgetMetrics *)self _effectiveCornerRadius];
  return (id)[v15 stringWithFormat:@"%.2fw--%.2fh--%.2fr--%ldf--%.2ft-%.2fl-%.2fb%.2ft", v4, v6, v16, self->_fontStyle, v8, v10, v12, v14];
}

- (int64_t)compare:(id)a3
{
  uint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  double width = self->_size.width;
  double v7 = v4[8];
  if (width < v7) {
    goto LABEL_2;
  }
  if (width > v7)
  {
LABEL_4:
    int64_t v8 = 1;
    goto LABEL_5;
  }
  double height = self->_size.height;
  double v11 = v4[9];
  if (height >= v11)
  {
    if (height > v11) {
      goto LABEL_4;
    }
    double cornerRadius = self->_cornerRadius;
    double v13 = v4[1];
    if (cornerRadius >= v13)
    {
      if (cornerRadius > v13) {
        goto LABEL_4;
      }
      double scaleFactor = self->_scaleFactor;
      double v15 = v4[2];
      if (scaleFactor >= v15)
      {
        if (scaleFactor > v15) {
          goto LABEL_4;
        }
        int64_t fontStyle = self->_fontStyle;
        int64_t v17 = *((void *)v4 + 4);
        if (fontStyle >= v17)
        {
          if (fontStyle > v17) {
            goto LABEL_4;
          }
          unint64_t dynamicTextSupport = self->_dynamicTextSupport;
          unint64_t v19 = *((void *)v4 + 3);
          if (dynamicTextSupport >= v19)
          {
            if (dynamicTextSupport <= v19)
            {
              margins = self->_margins;
              uint64_t v21 = *((void *)v4 + 5);
              uint64_t v22 = margins;
              int64_t v8 = [(CHSWidgetMargins *)v22 compare:v21];

              goto LABEL_5;
            }
            goto LABEL_4;
          }
        }
      }
    }
  }
LABEL_2:
  int64_t v8 = -1;
LABEL_5:

  return v8;
}

- (CGSize)scale
{
  double scaleFactor = self->_scaleFactor;
  double v3 = scaleFactor;
  result.double height = v3;
  result.double width = scaleFactor;
  return result;
}

- (int64_t)textSizeAdjustment
{
  return CHSWidgetTextSizeAdjustmentFromFontStyle(self->_fontStyle);
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (unint64_t)dynamicTextSupport
{
  return self->_dynamicTextSupport;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (CHSWidgetMargins)margins
{
  return self->_margins;
}

- (CHSWidgetMargins)groupMargins
{
  return self->_groupMargins;
}

- (NSDictionary)nestedContentMetrics
{
  return self->_nestedContentMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedContentMetrics, 0);
  objc_storeStrong((id *)&self->_groupMargins, 0);
  objc_storeStrong((id *)&self->_margins, 0);
}

- (void)_roundToNearestOrUp:(os_log_t)log withScale:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190C6F000, log, OS_LOG_TYPE_ERROR, "Invalid display scale of 0", v1, 2u);
}

@end