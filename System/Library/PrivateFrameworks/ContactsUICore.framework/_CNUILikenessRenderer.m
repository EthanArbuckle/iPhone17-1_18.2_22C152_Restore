@interface _CNUILikenessRenderer
+ (CGImage)cgImageForLikenessProvider:(id)a3 pointSize:(CGSize)a4 scale:(double)a5 style:(unint64_t)a6 alwaysUsePointSize:(BOOL)a7;
+ (id)descriptorForRequiredKeys;
+ (id)renderedLikenessesForProviders:(id)a3 likenessBadgeProviders:(id)a4 scope:(id)a5;
- (CNSchedulerProvider)schedulerProvider;
- (CNUIPRLikenessResolver)likenessResolver;
- (_CNUILikenessRenderer)initWithLikenessResolver:(id)a3 schedulerProvider:(id)a4;
- (id)likenessProvidersForBadges:(id)a3;
- (id)likenessProvidersForBadges:(id)a3 workScheduler:(id)a4;
- (id)likenessProvidersForContacts:(id)a3 likenessResolverOptions:(id)a4 workScheduler:(id)a5;
- (id)loadingPlaceholderForContactCount:(unint64_t)a3 scope:(id)a4;
- (id)renderedBasicMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6;
- (id)renderedBasicMonogramFromString:(id)a3 scope:(id)a4;
- (id)renderedLikenessForBadge:(id)a3 scope:(id)a4 workScheduler:(id)a5;
- (id)renderedLikenessForBadgeProvider:(id)a3 scope:(id)a4;
- (id)renderedLikenessesForContacts:(id)a3 scope:(id)a4 workScheduler:(id)a5;
- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6;
- (id)renderedLikenessesForLikenessProviders:(id)a3 badges:(id)a4 scope:(id)a5 likenessFingerprint:(id)a6;
- (id)renderedLoadingPlaceholderForContactCount:(unint64_t)a3 provider:(id)a4 scope:(id)a5;
- (unint64_t)lookupOptions;
- (void)setLookupOptions:(unint64_t)a3;
@end

@implementation _CNUILikenessRenderer

- (id)renderedLoadingPlaceholderForContactCount:(unint64_t)a3 provider:(id)a4 scope:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 <= 1) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = a3;
  }
  if (a3 >= 2 && +[CNUISnowglobeUtilities enableGroupPhoto]) {
    unint64_t v9 = 1;
  }
  v10 = objc_msgSend(MEMORY[0x263EFF8C0], "_cn_arrayWithObject:count:", v7, v9);
  v11 = [(id)objc_opt_class() renderedLikenessesForProviders:v10 likenessBadgeProviders:MEMORY[0x263EFFA68] scope:v8];

  return v11;
}

- (id)likenessProvidersForBadges:(id)a3
{
  id v3 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_3);
  }

  return v4;
}

- (CNUIPRLikenessResolver)likenessResolver
{
  return self->_likenessResolver;
}

+ (id)renderedLikenessesForProviders:(id)a3 likenessBadgeProviders:(id)a4 scope:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v62 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 count];
  MEMORY[0x270FA5388]();
  v13 = (CGImageRef *)((char *)&v57 - v12);
  if (v11 >= 0x200) {
    size_t v14 = 512;
  }
  else {
    size_t v14 = v11;
  }
  bzero((char *)&v57 - v12, v14);
  v63.origin = (CGPoint)*MEMORY[0x263F001A8];
  [v9 pointSize];
  double v16 = v15;
  double v18 = v17;
  v63.size.width = v15;
  v63.size.height = v17;
  if (v10)
  {
    if (v10 == 1 && (*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
    {
      v19 = [v8 objectAtIndexedSubscript:0];
      [v9 scale];
      CGImageRef *v13 = (CGImageRef)objc_msgSend(a1, "cgImageForLikenessProvider:pointSize:scale:style:alwaysUsePointSize:", v19, objc_msgSend(v9, "style"), 1, v16, v18, v20);

      id v21 = v9;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      [v21 scale];
      CGFloat v24 = v23;
      [v21 pointSize];
      double v26 = v25;
      double v28 = v27;
      CGAffineTransformMakeScale(&v64, v24, v24);
      v29 = CNUIBitmapContextCreate(llround(v28 * v64.c + v64.a * v26), llround(v28 * v64.d + v64.b * v26), DeviceRGB);
      uint64_t v30 = [v21 style];
      if (v30)
      {
        if (v30 == 1)
        {
          [v21 strokeWidth];
          CNUIDrawRoundedRectImagesInRects(v29, (CGColor *)[v21 strokeColor], 1, v13, &v63, v24, v31);
        }
      }
      else
      {
        [v21 strokeWidth];
        CNUIDrawCircularImagesInRects(v29, (CGColor *)[v21 strokeColor], 1, v13, &v63, v24, v56);
      }
      Image = CGBitmapContextCreateImage(v29);
      CGColorSpaceRelease(DeviceRGB);
      CGContextRelease(v29);
      if (Image) {
        Image = (CGImage *)CFAutorelease(Image);
      }

      goto LABEL_27;
    }
    v59 = &v57;
    +[CNUISnowglobeUtilities sizeForImageAtIndex:inRect:forItemCount:scope:](CNUISnowglobeUtilities, "sizeForImageAtIndex:inRect:forItemCount:scope:", 0, 2, v9, *(_OWORD *)&v63.origin, v16, v18);
    double v33 = v32;
    double v35 = v34;
    for (uint64_t i = 0; i != v10; ++i)
    {
      v37 = [v8 objectAtIndexedSubscript:i];
      [v9 scale];
      v13[i] = (CGImageRef)objc_msgSend(a1, "cgImageForLikenessProvider:pointSize:scale:style:alwaysUsePointSize:", v37, objc_msgSend(v9, "style"), 1, v33, v35, v38);
    }
    uint64_t v57 = v10;
    v58 = v13;
    id v60 = v8;
  }
  else
  {
    uint64_t v57 = 0;
    v58 = v13;
    v59 = &v57;
    id v60 = v8;
    double v33 = *MEMORY[0x263F001B0];
    double v35 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  uint64_t v39 = objc_msgSend(v62, "count", v57, v58, v59);
  v61 = &v57;
  MEMORY[0x270FA5388]();
  v42 = (char *)&v57 - v41;
  if (v40 >= 0x200) {
    size_t v43 = 512;
  }
  else {
    size_t v43 = v40;
  }
  bzero((char *)&v57 - v41, v43);
  v44 = [MEMORY[0x263EFF980] arrayWithCapacity:v39];
  if (v39)
  {
    for (uint64_t j = 0; j != v39; ++j)
    {
      v46 = [v62 objectAtIndexedSubscript:j];
      [v9 scale];
      *(void *)&v42[8 * j] = objc_msgSend(a1, "cgImageForLikenessProvider:pointSize:scale:style:alwaysUsePointSize:", v46, objc_msgSend(v9, "style"), 1, v33, v35, v47);
      id v48 = v46;
      if ([v48 conformsToProtocol:&unk_26BFDEFA0]) {
        v49 = v48;
      }
      else {
        v49 = 0;
      }
      id v50 = v49;

      if (v50)
      {
        v51 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v50, "badgeType"));
        [v44 addObject:v51];
      }
      else
      {
        [v44 addObject:&unk_26BFD9A48];
      }
    }
  }
  Image = +[CNUISnowglobeUtilities imageForAvatarImages:badgeImages:badgeTypes:rect:itemCount:scope:](CNUISnowglobeUtilities, "imageForAvatarImages:badgeImages:badgeTypes:rect:itemCount:scope:", v58, v42, v44, v57, v9, *(_OWORD *)&v63.origin, v16, v18);

  id v8 = v60;
LABEL_27:
  CGImageGetWidth(Image);
  CGImageGetHeight(Image);
  [v9 scale];
  id v54 = (id)[NSClassFromString(&cfstr_Uiimage.isa) imageWithCGImage:Image scale:0 orientation:v53];

  return v54;
}

+ (CGImage)cgImageForLikenessProvider:(id)a3 pointSize:(CGSize)a4 scale:(double)a5 style:(unint64_t)a6 alwaysUsePointSize:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v13 = objc_msgSend(v12, "_cnui_imageForSize:scale:", width, height, a5);
LABEL_6:
    size_t v14 = (CGImage *)v13;
    goto LABEL_20;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = objc_msgSend(v12, "_cnui_image");
    goto LABEL_6;
  }
  if (a6 == 1)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = objc_msgSend(v12, "_cnui_roundedRectImageForSize:scale:", width, height, a5);
      goto LABEL_6;
    }
  }
  else if (!a6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v13 = objc_msgSend(v12, "_cnui_circularImageForSize:scale:", width, height, a5);
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v12, "_cnui_likenessForSize:scale:", width, height, a5);
  }
  else {
  CGFloat v15 = objc_msgSend(v12, "_cnui_likeness");
  }
  objc_msgSend(v15, "snapshotWithSize:scale:options:", 0, width, height, a5);
  id v16 = objc_claimAutoreleasedReturnValue();
  CGImageRef v17 = CGImageRetain((CGImageRef)[v16 CGImage]);
  if (v17) {
    size_t v14 = (CGImage *)CFAutorelease(v17);
  }
  else {
    size_t v14 = 0;
  }

LABEL_20:
  return v14;
}

- (id)loadingPlaceholderForContactCount:(unint64_t)a3 scope:(id)a4
{
  id v6 = a4;
  unint64_t v7 = +[CNUIPRLikenessResolver maxContacts];
  if (v7 >= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7;
  }
  id v9 = v6;
  [v9 pointSize];
  if (v8 <= 1)
  {
    double v11 = 27.0;
    if (v10 >= 40.0) {
      double v11 = dbl_20B7DB3B0[v10 < 60.0];
    }
  }
  else
  {
    double v11 = 45.0;
  }
  [v9 pointSize];
  if (v11 == v12)
  {
    id v13 = v9;
  }
  else
  {
    [v9 scale];
    double v15 = v14;
    [v9 strokeWidth];
    double v17 = v16;
    uint64_t v18 = [v9 strokeColor];
    uint64_t v19 = [v9 rightToLeft];
    uint64_t v20 = [v9 style];
    uint64_t v21 = [v9 backgroundStyle];
    v22 = [v9 color];
    double v23 = [v9 maskedAvatarIndices];
    +[CNUILikenessRenderingScope renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:](CNUILikenessRenderingScope, "renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", v18, v19, v20, v21, v22, v23, v11, v11, v15, v17);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGFloat v24 = NSString;
  id v25 = v13;
  if ([v25 style] == 1) {
    double v26 = @"RR_";
  }
  else {
    double v26 = &stru_26BFC7668;
  }
  [v25 pointSize];
  uint64_t v28 = v27;
  if (v8 < 2)
  {

    [v24 stringWithFormat:@"LoadingPlaceholder_%@%.2f%@", v26, v28, &stru_26BFC7668, v35];
  }
  else
  {
    int v29 = [v25 rightToLeft];

    uint64_t v30 = @"_RTL";
    if (!v29) {
      uint64_t v30 = &stru_26BFC7668;
    }
    [v24 stringWithFormat:@"LoadingPlaceholderGroup_%@%.2f%@%@", v26, v28, v30, &stru_26BFC7668];
  CGFloat v31 = };
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __65___CNUILikenessRenderer_loadingPlaceholderForContactCount_scope___block_invoke;
  v36[3] = &unk_2640174D8;
  id v37 = v9;
  unint64_t v38 = v8;
  v36[4] = self;
  id v32 = v9;
  double v33 = +[CNUIImageProvider imageForResource:v31 template:0 onCacheMiss:v36];

  return v33;
}

- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 workScheduler:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  double v14 = [v10 color];
  if (v14)
  {
    double v15 = [CNUIPRLikenessResolverOptions alloc];
    double v16 = [v10 color];
    double v17 = [(CNUIPRLikenessResolverOptions *)v15 initWithMonogramColor:v16];
  }
  else
  {
    double v17 = 0;
  }

  uint64_t v18 = +[CNUILikenessFingerprint publicFingerprintForContacts:v13 scope:v10];
  uint64_t v19 = [(_CNUILikenessRenderer *)self likenessProvidersForContacts:v13 likenessResolverOptions:v17 workScheduler:v11];

  uint64_t v20 = [(_CNUILikenessRenderer *)self renderedLikenessesForLikenessProviders:v19 badges:v12 scope:v10 likenessFingerprint:v18];

  unint64_t v21 = [v13 count];
  v22 = +[CNUICoreLogProvider likenesses_os_log];
  double v23 = v22;
  if (v21 < 2)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      [v10 pointSize];
      uint64_t v25 = v24;
      [v10 pointSize];
      int v28 = 134218498;
      uint64_t v29 = v25;
      __int16 v30 = 2048;
      uint64_t v31 = v26;
      __int16 v32 = 2114;
      double v33 = v18;
      _os_log_impl(&dword_20B704000, v23, OS_LOG_TYPE_INFO, "[LikenessRenderer] New request for  rendered likeness {%.2f, %.2f} for: %{public}@", (uint8_t *)&v28, 0x20u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    -[_CNUILikenessRenderer renderedLikenessesForContacts:withBadges:scope:workScheduler:]((uint64_t)v18, v23);
  }

  return v20;
}

- (id)renderedLikenessesForLikenessProviders:(id)a3 badges:(id)a4 scope:(id)a5 likenessFingerprint:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = objc_opt_class();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __97___CNUILikenessRenderer_renderedLikenessesForLikenessProviders_badges_scope_likenessFingerprint___block_invoke;
  v20[3] = &unk_264017488;
  id v24 = v11;
  uint64_t v25 = v14;
  id v21 = v12;
  v22 = self;
  id v23 = v10;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  uint64_t v18 = [v13 map:v20];

  return v18;
}

- (id)likenessProvidersForContacts:(id)a3 likenessResolverOptions:(id)a4 workScheduler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_msgSend(v10, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __92___CNUILikenessRenderer_likenessProvidersForContacts_likenessResolverOptions_workScheduler___block_invoke;
  v19[3] = &unk_264017418;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = objc_msgSend(v11, "_cn_map:", v19);

  id v15 = (void *)MEMORY[0x263F33608];
  id v16 = [(_CNUILikenessRenderer *)self schedulerProvider];
  id v17 = [v15 combineLatest:v14 resultScheduler:v12 schedulerProvider:v16];

  return v17;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

+ (id)descriptorForRequiredKeys
{
  return +[CNUIPRLikenessResolver descriptorForRequiredKeys];
}

- (id)renderedLikenessesForContacts:(id)a3 scope:(id)a4 workScheduler:(id)a5
{
  return [(_CNUILikenessRenderer *)self renderedLikenessesForContacts:a3 withBadges:0 scope:a4 workScheduler:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_likenessResolver, 0);
}

- (_CNUILikenessRenderer)initWithLikenessResolver:(id)a3 schedulerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNUILikenessRenderer;
  id v9 = [(_CNUILikenessRenderer *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_likenessResolver, a3);
    objc_storeStrong((id *)&v10->_schedulerProvider, a4);
    id v11 = v10;
  }

  return v10;
}

- (void)setLookupOptions:(unint64_t)a3
{
}

- (id)renderedLikenessForBadge:(id)a3 scope:(id)a4 workScheduler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v16 count:1];

  objc_super v13 = -[_CNUILikenessRenderer likenessProvidersForBadges:workScheduler:](self, "likenessProvidersForBadges:workScheduler:", v12, v9, v16, v17);

  uint64_t v14 = [(_CNUILikenessRenderer *)self renderedLikenessForBadgeProvider:v13 scope:v10];

  return v14;
}

- (id)likenessProvidersForBadges:(id)a3 workScheduler:(id)a4
{
  id v6 = a4;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __66___CNUILikenessRenderer_likenessProvidersForBadges_workScheduler___block_invoke;
  uint64_t v18 = &unk_264017440;
  uint64_t v19 = self;
  id v20 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a3, "_cn_map:", &v15);
  id v9 = (void *)MEMORY[0x263F33608];
  id v10 = [(_CNUILikenessRenderer *)self schedulerProvider];
  id v11 = [v9 combineLatest:v8 resultScheduler:v7 schedulerProvider:v10];
  id v12 = [MEMORY[0x263F33608] observableWithResult:MEMORY[0x263EFFA68]];
  objc_super v13 = [v11 onEmpty:v12];

  return v13;
}

- (id)renderedLikenessForBadgeProvider:(id)a3 scope:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64___CNUILikenessRenderer_renderedLikenessForBadgeProvider_scope___block_invoke;
  v11[3] = &unk_2640174B0;
  id v12 = v5;
  uint64_t v13 = v7;
  id v8 = v5;
  id v9 = [v6 map:v11];

  return v9;
}

- (id)renderedBasicMonogramFromString:(id)a3 scope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = [(_CNUILikenessRenderer *)self likenessResolver];
  id v10 = [v6 color];
  id v11 = [v9 basicMonogramObservableFromString:v7 color:v10];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63___CNUILikenessRenderer_renderedBasicMonogramFromString_scope___block_invoke;
  v15[3] = &unk_264017500;
  id v16 = v6;
  uint64_t v17 = v8;
  id v12 = v6;
  uint64_t v13 = [v11 map:v15];

  return v13;
}

- (id)renderedBasicMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6
{
  char v6 = a6;
  v25[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((*(uint64_t (**)(void))(*MEMORY[0x263F334E0] + 16))()) {
    goto LABEL_5;
  }
  uint64_t v13 = [(objc_class *)getPRMonogramClass() monogram];
  [v13 setText:v10];
  if (v11) {
    [v13 setMonogramColor:v11];
  }
  Class PRLikenessClass = getPRLikenessClass();
  uint64_t v15 = [v13 dataRepresentation];
  id v16 = [(objc_class *)PRLikenessClass monogramWithRecipe:v15 staticRepresentation:0];

  uint64_t v17 = [[CNUIPRLikenessProvider alloc] initWithPRLikeness:v16];
  uint64_t v18 = objc_opt_class();
  v25[0] = v17;
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  id v20 = [v18 renderedLikenessesForProviders:v19 likenessBadgeProviders:MEMORY[0x263EFFA68] scope:v12];

  if (!v20)
  {
LABEL_5:
    if ((v6 & 4) != 0)
    {
      id v20 = 0;
    }
    else
    {
      id v21 = [(_CNUILikenessRenderer *)self likenessResolver];
      v22 = [v21 placeholderProviderFactory];
      id v23 = [v22 placeholderProvider];

      id v20 = [(_CNUILikenessRenderer *)self renderedLoadingPlaceholderForContactCount:1 provider:v23 scope:v12];
    }
  }

  return v20;
}

- (unint64_t)lookupOptions
{
  return self->_lookupOptions;
}

- (void)renderedLikenessesForContacts:(uint64_t)a1 withBadges:(NSObject *)a2 scope:workScheduler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "[LikenessRenderer] New request for group rendered likeness for: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end