uint64_t sub_246AF577C()
{
  uint64_t vars8;

  qword_2691D4408 = [MEMORY[0x263F57A00] fontDescriptorForSectName:@"__Extra" fromMachO:&dword_246AF4000];

  return MEMORY[0x270F9A758]();
}

void sub_246AF57CC(uint64_t a1, uint64_t a2)
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_26FB0BF20;
  v5[1] = &unk_26FB0BF38;
  v6[0] = &unk_26FB0C220;
  v6[1] = &unk_26FB0C230;
  v5[2] = &unk_26FB0BF50;
  v5[3] = &unk_26FB0BF68;
  v6[2] = &unk_26FB0C240;
  v6[3] = &unk_26FB0C250;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  [v2 constantValue:v3 withOverrides:279.72];
  qword_2691D4410 = v4;
}

double NTKExtragalacticHeightScaleBetweenSizes(double a1, double a2, double a3, double a4)
{
  return fmin(a2 / a4, a4 / a2);
}

double NTKExtragalacticWidthScaleBetweenSizes(double a1, double a2, double a3)
{
  return fmin(a1 / a3, a3 / a1);
}

id sub_246AF7108(uint64_t a1, double a2, double a3, double a4, double a5)
{
  v10 = [MEMORY[0x263F15880] layer];
  [v10 setActions:*(void *)(a1 + 32)];
  objc_msgSend(v10, "setFrame:", a2, a3, a4, a5);

  return v10;
}

id sub_246AF7190(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void (**)(uint64_t, double, double, double, double))(v10 + 16);
  id v12 = a2;
  v13 = v11(v10, a3, a4, a5, a6);
  v14 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D18]];
  [v13 setCompositingFilter:v14];

  id v15 = v12;
  uint64_t v16 = [v15 CGColor];

  [v13 setFillColor:v16];

  return v13;
}

id sub_246AF7270(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void (**)(uint64_t, double, double, double, double))(v11 + 16);
  id v13 = a2;
  v14 = v12(v11, a3, a4, a5, a6);
  [v14 setLineWidth:*(double *)(*(void *)(a1 + 32) + 408)];
  [v14 setFillColor:0];
  id v15 = v13;
  uint64_t v16 = [v15 CGColor];

  [v14 setStrokeColor:v16];

  return v14;
}

void sub_246AF7A50(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:2.25];
  qword_2691D4430 = v2;
}

void sub_246AF7AAC()
{
  v4[15] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF9D0] null];
  v3[0] = @"instanceTransform";
  v3[1] = @"contentsMultiplyColor";
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = @"transform";
  v3[3] = @"hidden";
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = @"position";
  v3[5] = @"opacity";
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = @"instanceCount";
  v3[7] = @"instanceDelay";
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = @"backgroundColor";
  v3[9] = @"path";
  v4[8] = v0;
  v4[9] = v0;
  v3[10] = @"contents";
  v3[11] = @"sublayers";
  v4[10] = v0;
  v4[11] = v0;
  v3[12] = @"string";
  v3[13] = @"fillColor";
  v4[12] = v0;
  v4[13] = v0;
  v3[14] = @"strokeColor";
  v4[14] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:15];
  uint64_t v2 = (void *)qword_2691D4450;
  qword_2691D4450 = v1;
}

void sub_246AF7BF8()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26FB0BFE0;
  v2[1] = &unk_26FB0BFF8;
  v3[0] = &unk_26FB0BFE0;
  v3[1] = &unk_26FB0BFF8;
  v2[2] = &unk_26FB0C010;
  v2[3] = &unk_26FB0C028;
  v3[2] = &unk_26FB0C010;
  v3[3] = &unk_26FB0C028;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)qword_2691D4460;
  qword_2691D4460 = v0;
}

void sub_246AF7C9C()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26FB0BFE0;
  v2[1] = &unk_26FB0BFF8;
  v3[0] = &unk_26FB0BFE0;
  v3[1] = &unk_26FB0BFF8;
  v2[2] = &unk_26FB0C010;
  v2[3] = &unk_26FB0C028;
  v3[2] = &unk_26FB0C028;
  v3[3] = &unk_26FB0C028;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)qword_2691D4470;
  qword_2691D4470 = v0;
}

void sub_246AF8DB0()
{
  v4[15] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263EFF9D0] null];
  v3[0] = @"instanceTransform";
  v3[1] = @"contentsMultiplyColor";
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = @"transform";
  v3[3] = @"hidden";
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = @"position";
  void v3[5] = @"opacity";
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = @"instanceCount";
  v3[7] = @"instanceDelay";
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = @"backgroundColor";
  v3[9] = @"path";
  v4[8] = v0;
  v4[9] = v0;
  v3[10] = @"contents";
  v3[11] = @"sublayers";
  v4[10] = v0;
  v4[11] = v0;
  v3[12] = @"string";
  v3[13] = @"fillColor";
  v4[12] = v0;
  v4[13] = v0;
  v3[14] = @"strokeColor";
  v4[14] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:15];
  uint64_t v2 = (void *)qword_2691D4480;
  qword_2691D4480 = v1;
}

void sub_246AFA0F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setFilters:0];
  [v3 setFilters:*(void *)(a1 + 32)];
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7008](path, transform);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CLKDegreesToRadians()
{
  return MEMORY[0x270EE3178]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x270EE31B0]();
}

uint64_t CLKPointRoundForDevice()
{
  return MEMORY[0x270EE3220]();
}

uint64_t CLKRoundForDevice()
{
  return MEMORY[0x270EE3250]();
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x270EE9AD0](font, glyph, matrix);
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  MEMORY[0x270EE9BE0](font, *(void *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x270EE9BE8](font);
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x270EE9BF8](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  MEMORY[0x270EE9C00](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x270EE9C10](font);
  return result;
}

CGGlyph CTFontGetGlyphWithName(CTFontRef font, CFStringRef glyphName)
{
  return MEMORY[0x270EE9C20](font, glyphName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return MEMORY[0x270F4D8F8]();
}

uint64_t NTKIdealizedDate()
{
  return MEMORY[0x270F4D9C0]();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return MEMORY[0x270F4DA30]();
}

uint64_t NTKRGBAArrayWithColor()
{
  return MEMORY[0x270F4DA88]();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return MEMORY[0x270F4DA90]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}