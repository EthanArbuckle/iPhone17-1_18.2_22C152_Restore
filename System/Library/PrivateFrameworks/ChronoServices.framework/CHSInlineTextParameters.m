@interface CHSInlineTextParameters
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)allowsNonSystemForegroundColors;
- (BOOL)forceUppercase;
- (BOOL)ignoresRTL;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsDateAlongsideText;
- (BSColor)foregroundColor;
- (BSColor)foregroundDateColor;
- (CGSize)graphicMaxSize;
- (CHSFontSpecification)fontSpecification;
- (CHSInlineTextParameters)init;
- (CHSInlineTextParameters)initWithBSXPCCoder:(id)a3;
- (NSString)dateFormat;
- (NSString)description;
- (id)_effectiveDateFormat;
- (id)_initWithInlineTextProperties:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)graphicAlignment;
- (unint64_t)hash;
- (unint64_t)horizontalAlignment;
- (unint64_t)symbolScale;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setAllowsNonSystemForegroundColors:(BOOL)a3;
- (void)setDateFormat:(id)a3;
- (void)setFontSpecification:(id)a3;
- (void)setForceUppercase:(BOOL)a3;
- (void)setForegroundColor:(id)a3;
- (void)setForegroundDateColor:(id)a3;
- (void)setGraphicAlignment:(unint64_t)a3;
- (void)setGraphicMaxSize:(CGSize)a3;
- (void)setHorizontalAlignment:(unint64_t)a3;
- (void)setIgnoresRTL:(BOOL)a3;
- (void)setShowsDateAlongsideText:(BOOL)a3;
- (void)setSymbolScale:(unint64_t)a3;
@end

@implementation CHSInlineTextParameters

- (CHSInlineTextParameters)init
{
  v9.receiver = self;
  v9.super_class = (Class)CHSInlineTextParameters;
  v2 = [(CHSInlineTextParameters *)&v9 init];
  v3 = v2;
  if (v2)
  {
    fontSpecification = v2->_fontSpecification;
    v2->_fontSpecification = 0;

    foregroundColor = v3->_foregroundColor;
    v3->_foregroundColor = 0;

    foregroundDateColor = v3->_foregroundDateColor;
    v3->_foregroundDateColor = 0;

    v3->_allowsNonSystemForegroundColors = 0;
    v3->_showsDateAlongsideText = 0;
    dateFormat = v3->_dateFormat;
    v3->_dateFormat = 0;

    v3->_horizontalAlignment = 0;
    *(_WORD *)&v3->_ignoresRTL = 0;
    v3->_graphicMaxSize = (CGSize)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v3->_graphicAlignment = xmmword_190D49E60;
  }
  return v3;
}

- (id)_initWithInlineTextProperties:(id)a3
{
  v4 = (char *)a3;
  v5 = [(CHSInlineTextParameters *)self init];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 3) copy];
    fontSpecification = v5->_fontSpecification;
    v5->_fontSpecification = (CHSFontSpecification *)v6;

    uint64_t v8 = [*((id *)v4 + 4) copy];
    foregroundColor = v5->_foregroundColor;
    v5->_foregroundColor = (BSColor *)v8;

    uint64_t v10 = [*((id *)v4 + 5) copy];
    foregroundDateColor = v5->_foregroundDateColor;
    v5->_foregroundDateColor = (BSColor *)v10;

    v5->_allowsNonSystemForegroundColors = v4[48];
    v5->_showsDateAlongsideText = v4[8];
    uint64_t v12 = [*((id *)v4 + 2) copy];
    dateFormat = v5->_dateFormat;
    v5->_dateFormat = (NSString *)v12;

    v5->_horizontalAlignment = *((void *)v4 + 7);
    v5->_ignoresRTL = v4[64];
    v5->_graphicAlignment = *((void *)v4 + 9);
    v5->_graphicMaxSize = *(CGSize *)(v4 + 88);
    v5->_symbolScale = *((void *)v4 + 10);
    v5->_forceUppercase = v4[65];
  }

  return v5;
}

- (id)_effectiveDateFormat
{
  if ([(NSString *)self->_dateFormat length]) {
    v3 = self->_dateFormat;
  }
  else {
    v3 = @"EEE d";
  }
  return v3;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __38__CHSInlineTextParameters_description__block_invoke;
  v22 = &unk_1E56C81F0;
  id v4 = v3;
  id v23 = v4;
  v24 = self;
  id v5 = (id)[v4 modifyProem:&v19];
  id v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_fontSpecification, @"font", 1, v19, v20, v21, v22);
  id v7 = (id)[v4 appendObject:self->_foregroundColor withName:@"color" skipIfNil:1];
  id v8 = (id)[v4 appendObject:self->_foregroundDateColor withName:@"dateColor" skipIfNil:1];
  id v9 = (id)[v4 appendBool:self->_allowsNonSystemForegroundColors withName:@"customColors" ifEqualTo:1];
  id v10 = (id)[v4 appendBool:self->_ignoresRTL withName:@"ignoresRTL" ifEqualTo:1];
  unint64_t graphicAlignment = self->_graphicAlignment;
  uint64_t v12 = @"center";
  if (graphicAlignment == 1) {
    uint64_t v12 = @"leading";
  }
  if (graphicAlignment == 2) {
    v13 = @"trailing";
  }
  else {
    v13 = v12;
  }
  [v4 appendString:v13 withName:@"graphicAlignment"];
  id v14 = (id)objc_msgSend(v4, "appendSize:withName:", @"graphicMaxSize", self->_graphicMaxSize.width, self->_graphicMaxSize.height);
  id v15 = (id)[v4 appendUInt64:self->_symbolScale withName:@"symbolScale"];
  id v16 = (id)[v4 appendBool:self->_forceUppercase withName:@"forceUppercase" ifEqualTo:1];
  v17 = [v4 build];

  return (NSString *)v17;
}

uint64_t __38__CHSInlineTextParameters_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"showsDate"];
  uint64_t result = [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 16) withName:@"dateFormat" skipIfEmpty:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 56);
  if (v4)
  {
    id v5 = @"center";
    id v6 = *(void **)(a1 + 32);
    if (v4 == 1) {
      id v5 = @"leading";
    }
    if (v4 == 2) {
      id v7 = @"trailing";
    }
    else {
      id v7 = v5;
    }
    return [v6 appendString:v7 withName:@"hAlign"];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  BOOL showsDateAlongsideText = self->_showsDateAlongsideText;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __35__CHSInlineTextParameters_isEqual___block_invoke;
  v71[3] = &unk_1E56C8468;
  id v11 = v9;
  id v72 = v11;
  id v12 = (id)[v5 appendBool:showsDateAlongsideText counterpart:v71];
  dateFormat = self->_dateFormat;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_2;
  v69[3] = &unk_1E56C8508;
  id v14 = v11;
  id v70 = v14;
  id v15 = (id)[v5 appendString:dateFormat counterpart:v69];
  fontSpecification = self->_fontSpecification;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_3;
  v67[3] = &unk_1E56C81C8;
  id v17 = v14;
  id v68 = v17;
  id v18 = (id)[v5 appendObject:fontSpecification counterpart:v67];
  foregroundColor = self->_foregroundColor;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_4;
  v65[3] = &unk_1E56C81C8;
  id v20 = v17;
  id v66 = v20;
  id v21 = (id)[v5 appendObject:foregroundColor counterpart:v65];
  foregroundDateColor = self->_foregroundDateColor;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_5;
  v63[3] = &unk_1E56C81C8;
  id v23 = v20;
  id v64 = v23;
  id v24 = (id)[v5 appendObject:foregroundDateColor counterpart:v63];
  BOOL allowsNonSystemForegroundColors = self->_allowsNonSystemForegroundColors;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_6;
  v61[3] = &unk_1E56C8468;
  id v26 = v23;
  id v62 = v26;
  id v27 = (id)[v5 appendBool:allowsNonSystemForegroundColors counterpart:v61];
  unint64_t horizontalAlignment = self->_horizontalAlignment;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_7;
  v59[3] = &unk_1E56C84B8;
  id v29 = v26;
  id v60 = v29;
  id v30 = (id)[v5 appendUnsignedInteger:horizontalAlignment counterpart:v59];
  BOOL ignoresRTL = self->_ignoresRTL;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_8;
  v57[3] = &unk_1E56C8468;
  id v32 = v29;
  id v58 = v32;
  id v33 = (id)[v5 appendBool:ignoresRTL counterpart:v57];
  unint64_t graphicAlignment = self->_graphicAlignment;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_9;
  v55[3] = &unk_1E56C84B8;
  id v35 = v32;
  id v56 = v35;
  id v36 = (id)[v5 appendUnsignedInteger:graphicAlignment counterpart:v55];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_10;
  v53[3] = &unk_1E56C84E0;
  id v37 = v35;
  id v54 = v37;
  id v38 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v53, self->_graphicMaxSize.width, self->_graphicMaxSize.height);
  unint64_t symbolScale = self->_symbolScale;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __35__CHSInlineTextParameters_isEqual___block_invoke_11;
  v51[3] = &unk_1E56C84B8;
  id v40 = v37;
  id v52 = v40;
  id v41 = (id)[v5 appendUnsignedInteger:symbolScale counterpart:v51];
  BOOL forceUppercase = self->_forceUppercase;
  uint64_t v46 = MEMORY[0x1E4F143A8];
  uint64_t v47 = 3221225472;
  v48 = __35__CHSInlineTextParameters_isEqual___block_invoke_12;
  v49 = &unk_1E56C8468;
  id v43 = v40;
  id v50 = v43;
  id v44 = (id)[v5 appendBool:forceUppercase counterpart:&v46];
  LOBYTE(v40) = objc_msgSend(v5, "isEqual", v46, v47, v48, v49);

  return (char)v40;
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

id __35__CHSInlineTextParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __35__CHSInlineTextParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __35__CHSInlineTextParameters_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

id __35__CHSInlineTextParameters_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_6(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 48);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_7(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 56);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_8(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 64);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_9(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 72);
}

double __35__CHSInlineTextParameters_isEqual___block_invoke_10(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 88);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_11(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 80);
}

uint64_t __35__CHSInlineTextParameters_isEqual___block_invoke_12(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 65);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendBool:self->_showsDateAlongsideText];
  id v5 = (id)[v3 appendString:self->_dateFormat];
  id v6 = (id)[v3 appendObject:self->_foregroundColor];
  id v7 = (id)[v3 appendObject:self->_foregroundDateColor];
  id v8 = (id)[v3 appendBool:self->_allowsNonSystemForegroundColors];
  id v9 = (id)[v3 appendObject:self->_fontSpecification];
  id v10 = (id)[v3 appendUnsignedInteger:self->_horizontalAlignment];
  id v11 = (id)[v3 appendBool:self->_ignoresRTL];
  id v12 = (id)[v3 appendUnsignedInteger:self->_graphicAlignment];
  id v13 = (id)objc_msgSend(v3, "appendCGSize:", self->_graphicMaxSize.width, self->_graphicMaxSize.height);
  id v14 = (id)[v3 appendUnsignedInteger:self->_symbolScale];
  id v15 = (id)[v3 appendBool:self->_forceUppercase];
  unint64_t v16 = [v3 hash];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHSInlineTextParameters alloc];
  return [(CHSInlineTextParameters *)v4 _initWithInlineTextProperties:self];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeObject:self->_fontSpecification forKey:@"font"];
  [v7 encodeObject:self->_foregroundColor forKey:@"fc"];
  [v7 encodeObject:self->_foregroundDateColor forKey:@"fdc"];
  [v7 encodeBool:self->_allowsNonSystemForegroundColors forKey:@"nsfc"];
  [v7 encodeBool:self->_showsDateAlongsideText forKey:@"sdat"];
  [v7 encodeObject:self->_dateFormat forKey:@"df"];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_horizontalAlignment];
  [v7 encodeObject:v4 forKey:@"ha"];

  [v7 encodeBool:self->_ignoresRTL forKey:@"irtl"];
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_graphicAlignment];
  [v7 encodeObject:v5 forKey:@"gp"];

  objc_msgSend(v7, "encodeCGSize:forKey:", @"gms", self->_graphicMaxSize.width, self->_graphicMaxSize.height);
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_symbolScale];
  [v7 encodeObject:v6 forKey:@"ss"];

  [v7 encodeBool:self->_forceUppercase forKey:@"fu"];
}

- (CHSInlineTextParameters)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSInlineTextParameters *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"font"];
    fontSpecification = v5->_fontSpecification;
    v5->_fontSpecification = (CHSFontSpecification *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fc"];
    foregroundColor = v5->_foregroundColor;
    v5->_foregroundColor = (BSColor *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fdc"];
    foregroundDateColor = v5->_foregroundDateColor;
    v5->_foregroundDateColor = (BSColor *)v10;

    v5->_BOOL allowsNonSystemForegroundColors = [v4 decodeBoolForKey:@"nsfc"];
    v5->_BOOL showsDateAlongsideText = [v4 decodeBoolForKey:@"sdat"];
    uint64_t v12 = [v4 decodeStringForKey:@"df"];
    dateFormat = v5->_dateFormat;
    v5->_dateFormat = (NSString *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ha"];
    v5->_unint64_t horizontalAlignment = [v14 unsignedIntegerValue];

    v5->_BOOL ignoresRTL = [v4 decodeBoolForKey:@"irtl"];
    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gp"];
    v5->_unint64_t graphicAlignment = [v15 unsignedIntegerValue];

    [v4 decodeCGSizeForKey:@"gms"];
    v5->_graphicMaxSize.width = v16;
    v5->_graphicMaxSize.height = v17;
    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ss"];
    v5->_unint64_t symbolScale = [v18 unsignedIntegerValue];

    v5->_BOOL forceUppercase = [v4 decodeBoolForKey:@"fu"];
  }

  return v5;
}

- (CHSFontSpecification)fontSpecification
{
  return self->_fontSpecification;
}

- (void)setFontSpecification:(id)a3
{
}

- (BSColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (BSColor)foregroundDateColor
{
  return self->_foregroundDateColor;
}

- (void)setForegroundDateColor:(id)a3
{
}

- (BOOL)allowsNonSystemForegroundColors
{
  return self->_allowsNonSystemForegroundColors;
}

- (void)setAllowsNonSystemForegroundColors:(BOOL)a3
{
  self->_BOOL allowsNonSystemForegroundColors = a3;
}

- (BOOL)showsDateAlongsideText
{
  return self->_showsDateAlongsideText;
}

- (void)setShowsDateAlongsideText:(BOOL)a3
{
  self->_BOOL showsDateAlongsideText = a3;
}

- (NSString)dateFormat
{
  return self->_dateFormat;
}

- (void)setDateFormat:(id)a3
{
}

- (unint64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (void)setHorizontalAlignment:(unint64_t)a3
{
  self->_unint64_t horizontalAlignment = a3;
}

- (BOOL)ignoresRTL
{
  return self->_ignoresRTL;
}

- (void)setIgnoresRTL:(BOOL)a3
{
  self->_BOOL ignoresRTL = a3;
}

- (unint64_t)graphicAlignment
{
  return self->_graphicAlignment;
}

- (void)setGraphicAlignment:(unint64_t)a3
{
  self->_unint64_t graphicAlignment = a3;
}

- (CGSize)graphicMaxSize
{
  double width = self->_graphicMaxSize.width;
  double height = self->_graphicMaxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setGraphicMaxSize:(CGSize)a3
{
  self->_graphicMaxSize = a3;
}

- (unint64_t)symbolScale
{
  return self->_symbolScale;
}

- (void)setSymbolScale:(unint64_t)a3
{
  self->_unint64_t symbolScale = a3;
}

- (BOOL)forceUppercase
{
  return self->_forceUppercase;
}

- (void)setForceUppercase:(BOOL)a3
{
  self->_BOOL forceUppercase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundDateColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_fontSpecification, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);
}

@end