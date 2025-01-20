@interface CHSWidgetMargins
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSEdgeInsets)backgroundRemovedContentMargins;
- (CHSEdgeInsets)contentMargins;
- (CHSEdgeInsets)layoutInsets;
- (CHSEdgeInsets)safeAreaInsets;
- (CHSWidgetMargins)initWithCoder:(id)a3;
- (CHSWidgetMargins)initWithXPCDictionary:(id)a3;
- (double)initWithSafeAreaInsets:(double)a3 layoutInsets:(double)a4 contentMargins:(double)a5 backgroundRemovedContentMargins:(double)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation CHSWidgetMargins

- (double)initWithSafeAreaInsets:(double)a3 layoutInsets:(double)a4 contentMargins:(double)a5 backgroundRemovedContentMargins:(double)a6
{
  v33.receiver = a1;
  v33.super_class = (Class)CHSWidgetMargins;
  result = (double *)objc_msgSendSuper2(&v33, sel_init);
  if (result)
  {
    result[1] = a2;
    result[2] = a3;
    result[3] = a4;
    result[4] = a5;
    result[5] = a6;
    result[6] = a7;
    result[7] = a8;
    result[8] = a9;
    *((void *)result + 9) = a17;
    *((void *)result + 10) = a18;
    *((void *)result + 11) = a19;
    *((void *)result + 12) = a20;
    *((void *)result + 13) = a21;
    *((void *)result + 14) = a22;
    *((void *)result + 15) = a23;
    *((void *)result + 16) = a24;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
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

  double v10 = CHSRectFromEdgeInsets(self->_safeAreaInsets.top, self->_safeAreaInsets.leading, self->_safeAreaInsets.bottom, self->_safeAreaInsets.trailing);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __28__CHSWidgetMargins_isEqual___block_invoke;
  v56[3] = &unk_1E56C8978;
  id v17 = v9;
  id v57 = v17;
  id v18 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v56, v10, v12, v14, v16);
  double v19 = CHSRectFromEdgeInsets(self->_layoutInsets.top, self->_layoutInsets.leading, self->_layoutInsets.bottom, self->_layoutInsets.trailing);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __28__CHSWidgetMargins_isEqual___block_invoke_2;
  v54[3] = &unk_1E56C8978;
  id v26 = v17;
  id v55 = v26;
  id v27 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v54, v19, v21, v23, v25);
  double v28 = CHSRectFromEdgeInsets(self->_contentMargins.top, self->_contentMargins.leading, self->_contentMargins.bottom, self->_contentMargins.trailing);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __28__CHSWidgetMargins_isEqual___block_invoke_3;
  v52[3] = &unk_1E56C8978;
  id v35 = v26;
  id v53 = v35;
  id v36 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v52, v28, v30, v32, v34);
  double v37 = CHSRectFromEdgeInsets(self->_backgroundRemovedContentMargins.top, self->_backgroundRemovedContentMargins.leading, self->_backgroundRemovedContentMargins.bottom, self->_backgroundRemovedContentMargins.trailing);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  v49 = __28__CHSWidgetMargins_isEqual___block_invoke_4;
  v50 = &unk_1E56C8978;
  id v44 = v35;
  id v51 = v44;
  id v45 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", &v47, v37, v39, v41, v43);
  LOBYTE(v35) = objc_msgSend(v5, "isEqual", v47, v48, v49, v50);

  return (char)v35;
}

uint64_t __28__CHSWidgetMargins_isEqual___block_invoke(uint64_t a1)
{
  return CHSRectFromEdgeInsets(*(double *)(*(void *)(a1 + 32) + 8), *(double *)(*(void *)(a1 + 32) + 16), *(double *)(*(void *)(a1 + 32) + 24), *(double *)(*(void *)(a1 + 32) + 32));
}

uint64_t __28__CHSWidgetMargins_isEqual___block_invoke_2(uint64_t a1)
{
  return CHSRectFromEdgeInsets(*(double *)(*(void *)(a1 + 32) + 40), *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
}

uint64_t __28__CHSWidgetMargins_isEqual___block_invoke_3(uint64_t a1)
{
  return CHSRectFromEdgeInsets(*(double *)(*(void *)(a1 + 32) + 72), *(double *)(*(void *)(a1 + 32) + 80), *(double *)(*(void *)(a1 + 32) + 88), *(double *)(*(void *)(a1 + 32) + 96));
}

uint64_t __28__CHSWidgetMargins_isEqual___block_invoke_4(uint64_t a1)
{
  return CHSRectFromEdgeInsets(*(double *)(*(void *)(a1 + 32) + 104), *(double *)(*(void *)(a1 + 32) + 112), *(double *)(*(void *)(a1 + 32) + 120), *(double *)(*(void *)(a1 + 32) + 128));
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(self->_safeAreaInsets.top, self->_safeAreaInsets.leading, self->_safeAreaInsets.bottom, self->_safeAreaInsets.trailing));
  id v5 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(self->_layoutInsets.top, self->_layoutInsets.leading, self->_layoutInsets.bottom, self->_layoutInsets.trailing));
  id v6 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(self->_contentMargins.top, self->_contentMargins.leading, self->_contentMargins.bottom, self->_contentMargins.trailing));
  id v7 = (id)objc_msgSend(v3, "appendCGRect:", CHSRectFromEdgeInsets(self->_backgroundRemovedContentMargins.top, self->_backgroundRemovedContentMargins.leading, self->_backgroundRemovedContentMargins.bottom, self->_backgroundRemovedContentMargins.trailing));
  unint64_t v8 = [v3 hash];

  return v8;
}

- (id)succinctDescription
{
  v2 = [(CHSWidgetMargins *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CHSWidgetMargins_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v4 = v3;
  id v8 = v4;
  id v9 = self;
  [v4 appendProem:0 block:v7];
  id v5 = v4;

  return v5;
}

void __46__CHSWidgetMargins_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CHSEdgeInsetsDescription(*(double *)(*(void *)(a1 + 40) + 8), *(double *)(*(void *)(a1 + 40) + 16), *(double *)(*(void *)(a1 + 40) + 24), *(double *)(*(void *)(a1 + 40) + 32));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:");

  v3 = *(void **)(a1 + 32);
  CHSEdgeInsetsDescription(*(double *)(*(void *)(a1 + 40) + 40), *(double *)(*(void *)(a1 + 40) + 48), *(double *)(*(void *)(a1 + 40) + 56), *(double *)(*(void *)(a1 + 40) + 64));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:");

  id v4 = *(void **)(a1 + 32);
  CHSEdgeInsetsDescription(*(double *)(*(void *)(a1 + 40) + 72), *(double *)(*(void *)(a1 + 40) + 80), *(double *)(*(void *)(a1 + 40) + 88), *(double *)(*(void *)(a1 + 40) + 96));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:");

  id v5 = *(void **)(a1 + 32);
  CHSEdgeInsetsDescription(*(double *)(*(void *)(a1 + 40) + 104), *(double *)(*(void *)(a1 + 40) + 112), *(double *)(*(void *)(a1 + 40) + 120), *(double *)(*(void *)(a1 + 40) + 128));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CHSWidgetMargins *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CHSWidgetMargins_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

void __58__CHSWidgetMargins_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CHSEdgeInsetsDescription(*(double *)(*(void *)(a1 + 40) + 8), *(double *)(*(void *)(a1 + 40) + 16), *(double *)(*(void *)(a1 + 40) + 24), *(double *)(*(void *)(a1 + 40) + 32));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:");

  v3 = *(void **)(a1 + 32);
  CHSEdgeInsetsDescription(*(double *)(*(void *)(a1 + 40) + 40), *(double *)(*(void *)(a1 + 40) + 48), *(double *)(*(void *)(a1 + 40) + 56), *(double *)(*(void *)(a1 + 40) + 64));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:");

  id v4 = *(void **)(a1 + 32);
  CHSEdgeInsetsDescription(*(double *)(*(void *)(a1 + 40) + 72), *(double *)(*(void *)(a1 + 40) + 80), *(double *)(*(void *)(a1 + 40) + 88), *(double *)(*(void *)(a1 + 40) + 96));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:");

  id v5 = *(void **)(a1 + 32);
  CHSEdgeInsetsDescription(*(double *)(*(void *)(a1 + 40) + 104), *(double *)(*(void *)(a1 + 40) + 112), *(double *)(*(void *)(a1 + 40) + 120), *(double *)(*(void *)(a1 + 40) + 128));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeRect:forKey:", @"safeAreaInsets", CHSRectFromEdgeInsets(self->_safeAreaInsets.top, self->_safeAreaInsets.leading, self->_safeAreaInsets.bottom, self->_safeAreaInsets.trailing));
  objc_msgSend(v4, "encodeRect:forKey:", @"layoutInsets", CHSRectFromEdgeInsets(self->_layoutInsets.top, self->_layoutInsets.leading, self->_layoutInsets.bottom, self->_layoutInsets.trailing));
  objc_msgSend(v4, "encodeRect:forKey:", @"contentMargins", CHSRectFromEdgeInsets(self->_contentMargins.top, self->_contentMargins.leading, self->_contentMargins.bottom, self->_contentMargins.trailing));
  objc_msgSend(v4, "encodeRect:forKey:", @"backgroundRemovedContentMargins", CHSRectFromEdgeInsets(self->_backgroundRemovedContentMargins.top, self->_backgroundRemovedContentMargins.leading, self->_backgroundRemovedContentMargins.bottom, self->_backgroundRemovedContentMargins.trailing));
}

- (CHSWidgetMargins)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"safeAreaInsets"])
  {
    double v5 = CHSEdgeInsetsFromRect([v4 decodeRectForKey:@"safeAreaInsets"]);
    double v31 = v6;
    double v32 = v5;
    double v29 = v8;
    double v30 = v7;
  }
  else
  {
    double v31 = 0.0;
    double v32 = 0.0;
    double v29 = 0.0;
    double v30 = 0.0;
  }
  if ([v4 containsValueForKey:@"layoutInsets"])
  {
    double v9 = CHSEdgeInsetsFromRect([v4 decodeRectForKey:@"layoutInsets"]);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = 0.0;
    double v11 = 0.0;
    double v13 = 0.0;
    double v15 = 0.0;
  }
  if ([v4 containsValueForKey:@"contentMargins"])
  {
    double v16 = CHSEdgeInsetsFromRect([v4 decodeRectForKey:@"contentMargins"]);
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
  }
  else
  {
    double v16 = 0.0;
    uint64_t v18 = 0;
    uint64_t v20 = 0;
    uint64_t v22 = 0;
  }
  if ([v4 containsValueForKey:@"backgroundRemovedContentMargins"])
  {
    double v23 = CHSEdgeInsetsFromRect([v4 decodeRectForKey:@"backgroundRemovedContentMargins"]);
  }
  else
  {
    double v23 = 0.0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
  }
  id v27 = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:](self, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", v32, v31, v30, v29, v9, v11, v13, v15, *(void *)&v16, v18, v20, v22, *(void *)&v23, v24, v25, v26);

  return v27;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CHSRectFromEdgeInsets(self->_safeAreaInsets.top, self->_safeAreaInsets.leading, self->_safeAreaInsets.bottom, self->_safeAreaInsets.trailing);
    [@"safeAreaInsets" UTF8String];
    BSSerializeCGRectToXPCDictionaryWithKey();
    CHSRectFromEdgeInsets(self->_layoutInsets.top, self->_layoutInsets.leading, self->_layoutInsets.bottom, self->_layoutInsets.trailing);
    [@"layoutInsets" UTF8String];
    BSSerializeCGRectToXPCDictionaryWithKey();
    CHSRectFromEdgeInsets(self->_contentMargins.top, self->_contentMargins.leading, self->_contentMargins.bottom, self->_contentMargins.trailing);
    [@"contentMargins" UTF8String];
    BSSerializeCGRectToXPCDictionaryWithKey();
    CHSRectFromEdgeInsets(self->_backgroundRemovedContentMargins.top, self->_backgroundRemovedContentMargins.leading, self->_backgroundRemovedContentMargins.bottom, self->_backgroundRemovedContentMargins.trailing);
    [@"backgroundRemovedContentMargins" UTF8String];
    BSSerializeCGRectToXPCDictionaryWithKey();
  }
}

- (CHSWidgetMargins)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [@"safeAreaInsets" UTF8String];
    uint64_t v5 = BSDeserializeCGRectFromXPCDictionaryWithKey();
    double v6 = CHSEdgeInsetsFromRect(v5);
    double v35 = v7;
    double v36 = v6;
    double v33 = v9;
    double v34 = v8;
    [@"layoutInsets" UTF8String];
    uint64_t v10 = BSDeserializeCGRectFromXPCDictionaryWithKey();
    double v11 = CHSEdgeInsetsFromRect(v10);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [@"contentMargins" UTF8String];
    uint64_t v18 = BSDeserializeCGRectFromXPCDictionaryWithKey();
    double v19 = CHSEdgeInsetsFromRect(v18);
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    [@"backgroundRemovedContentMargins" UTF8String];
    uint64_t v26 = BSDeserializeCGRectFromXPCDictionaryWithKey();
    double v27 = CHSEdgeInsetsFromRect(v26);
    self = -[CHSWidgetMargins initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:](self, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", v36, v35, v34, v33, v11, v13, v15, v17, *(void *)&v19, v21, v23, v25, *(void *)&v27, v28, v29, v30);
    double v31 = self;
  }
  else
  {
    double v31 = 0;
  }

  return v31;
}

- (int64_t)compare:(id)a3
{
  id v4 = (double *)a3;
  int64_t v5 = CHSEdgeInsetsCompare(self->_safeAreaInsets.top, self->_safeAreaInsets.leading, self->_safeAreaInsets.bottom, self->_safeAreaInsets.trailing, v4[1], v4[2], v4[3], v4[4]);
  if (!v5)
  {
    int64_t v5 = CHSEdgeInsetsCompare(self->_layoutInsets.top, self->_layoutInsets.leading, self->_layoutInsets.bottom, self->_layoutInsets.trailing, v4[5], v4[6], v4[7], v4[8]);
    if (!v5)
    {
      int64_t v5 = CHSEdgeInsetsCompare(self->_contentMargins.top, self->_contentMargins.leading, self->_contentMargins.bottom, self->_contentMargins.trailing, v4[9], v4[10], v4[11], v4[12]);
      if (!v5) {
        int64_t v5 = CHSEdgeInsetsCompare(self->_backgroundRemovedContentMargins.top, self->_backgroundRemovedContentMargins.leading, self->_backgroundRemovedContentMargins.bottom, self->_backgroundRemovedContentMargins.trailing, v4[13], v4[14], v4[15], v4[16]);
      }
    }
  }

  return v5;
}

- (CHSEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double leading = self->_safeAreaInsets.leading;
  double bottom = self->_safeAreaInsets.bottom;
  double trailing = self->_safeAreaInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (CHSEdgeInsets)layoutInsets
{
  double top = self->_layoutInsets.top;
  double leading = self->_layoutInsets.leading;
  double bottom = self->_layoutInsets.bottom;
  double trailing = self->_layoutInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (CHSEdgeInsets)contentMargins
{
  double top = self->_contentMargins.top;
  double leading = self->_contentMargins.leading;
  double bottom = self->_contentMargins.bottom;
  double trailing = self->_contentMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (CHSEdgeInsets)backgroundRemovedContentMargins
{
  double top = self->_backgroundRemovedContentMargins.top;
  double leading = self->_backgroundRemovedContentMargins.leading;
  double bottom = self->_backgroundRemovedContentMargins.bottom;
  double trailing = self->_backgroundRemovedContentMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

@end