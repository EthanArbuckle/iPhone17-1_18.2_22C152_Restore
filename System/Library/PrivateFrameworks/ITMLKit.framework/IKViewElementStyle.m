@interface IKViewElementStyle
+ (BOOL)isHiddenStyleRegistered;
+ (IKViewElementStyle)elementStyleWithParentStyle:(id)a3 elementStyle:(id)a4 elementStyleOverrides:(id)a5;
+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 aggregatingStyles:(id)a4;
+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 cssRule:(id)a4 filterBlockedStyles:(BOOL)a5;
+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 inlineStyleString:(id)a4 filterBlockedStyles:(BOOL)a5;
+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 inlineStyleString:(id)a4 filterBlockedStyles:(BOOL)a5 inlineStyleRangeCorrect:(BOOL)a6;
+ (id)normalizeClassSelectorString:(id)a3;
+ (id)propertiesForStyleName:(id)a3;
+ (id)registeredAliases;
+ (id)registeredStyles;
+ (unint64_t)alignmentFromString:(id)a3;
+ (unint64_t)imageTreatmentFromString:(id)a3;
+ (unint64_t)positionFromString:(id)a3;
+ (unint64_t)transitionFromString:(id)a3;
+ (void)addBlockedStyle:(id)a3;
+ (void)clearBlockedStyles;
+ (void)initialize;
+ (void)registerEdgeInsetStyle:(id)a3 aliasName:(id)a4 withPositionStyleNames:(id)a5 inherited:(BOOL)a6;
+ (void)registerHiddenStyle:(id)a3;
+ (void)registerStyle:(id)a3 aliasName:(id)a4 withType:(unint64_t)a5 inherited:(BOOL)a6;
+ (void)registerStyle:(id)a3 withType:(unint64_t)a4 inherited:(BOOL)a5;
+ (void)unregisterStyles;
- (BOOL)hidden;
- (BOOL)requiresDynamicEvaluation;
- (CGAffineTransform)transform;
- (IKCSSRule)cssRule;
- (IKColor)ikBackgroundColor;
- (IKColor)ikBorderColor;
- (IKColor)ikColor;
- (IKColor)ikHighlightColor;
- (IKColor)imageMaskColor;
- (IKColor)imagePlaceholderBackgroundColor;
- (IKFourTuple)borderRadius;
- (IKViewElementStyle)initWithCSSRule:(id)a3 filterBlockedStyles:(BOOL)a4 selStr:(id)a5;
- (IKViewElementStyle)initWithClassSelector:(id)a3;
- (IKViewElementStyle)initWithStyle:(id)a3 classSelector:(id)a4;
- (NSArray)mediaQueryList;
- (NSMutableDictionary)overridingValuesByStyle;
- (NSMutableDictionary)styleDict;
- (NSNumber)letterSpacing;
- (NSNumber)lineHeight;
- (NSNumber)transitionInterval;
- (NSShadow)textShadow;
- (NSString)badgeTreatment;
- (NSString)cardType;
- (NSString)classDescriptorString;
- (NSString)columnItemType;
- (NSString)columnType;
- (NSString)dividerType;
- (NSString)fontWeight;
- (NSString)imageTreatment;
- (NSString)itemHeight;
- (NSString)itemWidth;
- (NSString)labelsState;
- (NSString)lockupType;
- (NSString)maxHeight;
- (NSString)maxWidth;
- (NSString)rowHeight;
- (NSString)textScale;
- (NSString)textStyle;
- (NSString)transition;
- (NSString)visibility;
- (NSURL)imagePlaceholderURL;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (UIColor)color;
- (UIEdgeInsets)_edgeInsetsForStyleName:(id)a3;
- (UIEdgeInsets)borderMargins;
- (UIEdgeInsets)borderWidths;
- (UIEdgeInsets)elementMargin;
- (UIEdgeInsets)elementPadding;
- (double)fontSize;
- (id)_declarationForStyleName:(id)a3 expectedClass:(Class)a4;
- (id)_gradientFromString:(id)a3;
- (id)_newColorFromString:(id)a3;
- (id)_styleNameForAlias:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cssValueForStyle:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)prototype;
- (id)valueForStyle:(id)a3;
- (int64_t)columnCount;
- (int64_t)fillImage;
- (int64_t)maxTextLines;
- (int64_t)reflectImage;
- (unint64_t)edgeFlagForStyle:(id)a3;
- (unint64_t)elementAlignment;
- (unint64_t)elementPosition;
- (unint64_t)imagePosition;
- (unint64_t)ordinalMaxLength;
- (unint64_t)textAlignment;
- (unint64_t)typeForStyle:(id)a3;
- (void)_addDeclaration:(id)a3;
- (void)_addElementStyle:(id)a3;
- (void)_addParentStyle:(id)a3;
- (void)setMediaQueryList:(id)a3;
- (void)setOverridingValuesByStyle:(id)a3;
- (void)setStyleDict:(id)a3;
@end

@implementation IKViewElementStyle

+ (void)initialize
{
  v22[4] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3 = (void *)sTypeMap;
    sTypeMap = (uint64_t)v2;

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = (void *)sTypeAliasMap;
    sTypeAliasMap = (uint64_t)v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = (void *)sInheritMap;
    sInheritMap = (uint64_t)v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = (void *)sEdgeInsetsStylePositionMap;
    sEdgeInsetsStylePositionMap = (uint64_t)v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v11 = (void *)sBlockedStyles;
    sBlockedStyles = (uint64_t)v10;

    v12 = (void *)sHiddenStyleName;
    sHiddenStyleName = 0;

    +[IKViewElementStyle registerStyle:@"-itml-prototype" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"color" withType:4 inherited:1];
    +[IKViewElementStyle registerStyle:@"highlight-color" withType:4 inherited:0];
    +[IKViewElementStyle registerStyle:@"background-color" withType:4 inherited:0];
    +[IKViewElementStyle registerStyle:@"border-color" withType:4 inherited:0];
    +[IKViewElementStyle registerStyle:@"font-size" withType:2 inherited:1];
    +[IKViewElementStyle registerStyle:@"font-weight" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"text-align" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"itml-text-max-lines" withType:0 inherited:0];
    +[IKViewElementStyle registerStyle:@"column-count" withType:0 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-column-type" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-column-item-type" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-row-height" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"max-width" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-item-width" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-item-height" withType:2 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-align" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"itml-img-placeholder" withType:5 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-img-reflect" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-img-fill" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-img-position" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-img-mask-color" withType:4 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-transition" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-transition-interval" withType:1 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-labels-state" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-ordinal-max-length" withType:0 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-img-placeholder-background-color" withType:4 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-img-treatment" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"transform" withType:6 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-position" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-lockup-type" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"visibility" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"itml-divider-type" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"itml-card-type" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"itml-badge-treatment" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"itml-text-scale" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"itml-text-style" withType:3 inherited:1];
    +[IKViewElementStyle registerStyle:@"border-radius" withType:8 inherited:0];
    +[IKViewElementStyle registerStyle:@"text-shadow" withType:9 inherited:1];
    +[IKViewElementStyle registerStyle:@"max-height" withType:3 inherited:0];
    +[IKViewElementStyle registerStyle:@"letter-spacing" withType:1 inherited:0];
    +[IKViewElementStyle registerStyle:@"line-height" withType:2 inherited:1];
    v22[0] = @"border-top-width";
    v22[1] = @"border-left-width";
    v22[2] = @"border-bottom-width";
    v22[3] = @"border-right-width";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    +[IKViewElementStyle registerEdgeInsetStyle:@"border-width" aliasName:0 withPositionStyleNames:v13 inherited:0];

    v21[0] = @"itml-item-border-top-margin";
    v21[1] = @"itml-item-border-left-margin";
    v21[2] = @"itml-item-border-bottom-margin";
    v21[3] = @"itml-item-border-right-margin";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
    +[IKViewElementStyle registerEdgeInsetStyle:@"itml-item-border-margin" aliasName:0 withPositionStyleNames:v14 inherited:0];

    v20[0] = @"margin-top";
    v20[1] = @"margin-left";
    v20[2] = @"margin-bottom";
    v20[3] = @"margin-right";
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
    +[IKViewElementStyle registerEdgeInsetStyle:@"margin" aliasName:0 withPositionStyleNames:v15 inherited:0];

    v19[0] = @"padding-top";
    v19[1] = @"padding-left";
    v19[2] = @"padding-bottom";
    v19[3] = @"padding-right";
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    +[IKViewElementStyle registerEdgeInsetStyle:@"padding" aliasName:0 withPositionStyleNames:v16 inherited:0];

    v18[0] = @"itml-top-padding";
    v18[1] = @"itml-left-padding";
    v18[2] = @"itml-bottom-padding";
    v18[3] = @"itml-right-padding";
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
    +[IKViewElementStyle registerEdgeInsetStyle:@"itml-padding" aliasName:0 withPositionStyleNames:v17 inherited:0];
  }
}

+ (id)propertiesForStyleName:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)sTypeMap objectForKeyedSubscript:v3];
  v5 = [(id)sTypeAliasMap objectForKeyedSubscript:v3];
  id v6 = [(id)sInheritMap objectForKeyedSubscript:v3];
  if (v4)
  {
    v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    [v7 setObject:v3 forKey:@"IKViewElementStyleNameKey"];
    v26 = v6;
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
    [v7 setObject:v8 forKey:@"IKViewElementStyleInheritedKey"];

    v28 = v4;
    [v7 setObject:v4 forKey:@"IKViewElementStyleTypeKey"];
    if (v5)
    {
      v35[0] = v5;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      [v7 setObject:v9 forKey:@"IKViewElementStyleAliasesKey"];
    }
    v25 = v7;
    v27 = v5;
    v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = (id)sEdgeInsetsStylePositionMap;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v16 = [(id)sEdgeInsetsStylePositionMap objectForKeyedSubscript:v15];
          v17 = [v16 objectForKey:@"_IKEdgeInsetStyleParentKey"];
          id v18 = v3;
          int v19 = [v17 isEqualToString:v3];

          if (v19) {
            [v29 addObject:v15];
          }

          id v3 = v18;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }

    v20 = v25;
    if ([v29 count])
    {
      id v21 = v3;
      v22 = (void *)[v29 copy];
      [v25 setObject:v22 forKey:@"IKViewElementStyleLonghandKey"];

      id v3 = v21;
    }

    v5 = v27;
    id v4 = v28;
    id v6 = v26;
  }
  else
  {
    v20 = 0;
  }
  v23 = (void *)[v20 copy];

  return v23;
}

+ (void)registerStyle:(id)a3 withType:(unint64_t)a4 inherited:(BOOL)a5
{
}

+ (void)registerStyle:(id)a3 aliasName:(id)a4 withType:(unint64_t)a5 inherited:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = objc_msgSend(a3, "ik_sharedInstance");
  uint64_t v11 = [(id)sTypeMap objectForKeyedSubscript:v10];
  uint64_t v12 = v11;
  if (v11)
  {
    if ([v11 unsignedIntegerValue] != a5)
    {
      uint64_t v13 = ITMLKitGetLogObject(4);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v12 unsignedIntegerValue];
        *(_WORD *)&buf[22] = 2048;
        unint64_t v26 = a5;
        _os_log_error_impl(&dword_1E2ACE000, v13, OS_LOG_TYPE_ERROR, "Registering a style (%@) that already has an existing type (%lu) that doesn't match the new type (%lu).", buf, 0x20u);
      }
    }
  }
  else
  {
    [(id)sTypeMap removeObjectForKey:v10];
    [(id)sInheritMap removeObjectForKey:v10];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    unint64_t v26 = (unint64_t)__Block_byref_object_copy__15;
    v27 = __Block_byref_object_dispose__15;
    id v28 = 0;
    v14 = (void *)sTypeAliasMap;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __65__IKViewElementStyle_registerStyle_aliasName_withType_inherited___block_invoke;
    v22 = &unk_1E6DE5880;
    id v23 = v10;
    v24 = buf;
    [v14 enumerateKeysAndObjectsUsingBlock:&v19];
    if (*(void *)(*(void *)&buf[8] + 40)) {
      objc_msgSend((id)sTypeAliasMap, "removeObjectForKey:", v19, v20, v21, v22);
    }

    _Block_object_dispose(buf, 8);
  }
  uint64_t v15 = (void *)sTypeMap;
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a5, v19, v20, v21, v22);
  [v15 setObject:v16 forKey:v10];

  if (v9) {
    [(id)sTypeAliasMap setObject:v10 forKey:v9];
  }
  if (v6)
  {
    v17 = (void *)sInheritMap;
    id v18 = [NSNumber numberWithBool:1];
    [v17 setObject:v18 forKey:v10];
  }
  +[IKCSSTypeInfo registerStyle:v10 type:a5];
}

void __65__IKViewElementStyle_registerStyle_aliasName_withType_inherited___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if ([a3 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [v8 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

+ (void)registerEdgeInsetStyle:(id)a3 aliasName:(id)a4 withPositionStyleNames:(id)a5 inherited:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = objc_msgSend(a3, "ik_sharedInstance");
  [a1 registerStyle:v12 aliasName:v11 withType:7 inherited:v6];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__IKViewElementStyle_registerEdgeInsetStyle_aliasName_withPositionStyleNames_inherited___block_invoke;
  v14[3] = &unk_1E6DE58A8;
  BOOL v17 = v6;
  id v15 = v12;
  id v16 = a1;
  id v13 = v12;
  [v10 enumerateObjectsUsingBlock:v14];
}

void __88__IKViewElementStyle_registerEdgeInsetStyle_aliasName_withPositionStyleNames_inherited___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "ik_sharedInstance");
  [*(id *)(a1 + 40) registerStyle:v5 withType:1 inherited:*(unsigned __int8 *)(a1 + 48)];
  BOOL v6 = (void *)sEdgeInsetsStylePositionMap;
  uint64_t v7 = *(void *)(a1 + 32);
  v10[0] = @"_IKEdgeInsetStyleParentKey";
  v10[1] = @"_IKEdgeInsetStylePositionKey";
  v11[0] = v7;
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v6 setObject:v9 forKey:v5];
}

+ (id)registeredStyles
{
  return (id)sTypeMap;
}

+ (id)registeredAliases
{
  return (id)sTypeAliasMap;
}

+ (void)unregisterStyles
{
  [(id)sTypeMap removeAllObjects];
  [(id)sTypeAliasMap removeAllObjects];
  [(id)sInheritMap removeAllObjects];
  [(id)sEdgeInsetsStylePositionMap removeAllObjects];
  id v2 = (void *)sHiddenStyleName;
  sHiddenStyleName = 0;

  +[IKCSSTypeInfo unregisterStyles];
  +[IKViewElementStyle registerStyle:@"-itml-prototype" withType:3 inherited:0];
}

+ (void)addBlockedStyle:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    [(id)sBlockedStyles addObject:v3];
  }
}

+ (void)clearBlockedStyles
{
}

+ (void)registerHiddenStyle:(id)a3
{
  id v4 = objc_msgSend(a3, "ik_sharedInstance");
  uint64_t v5 = (void *)sHiddenStyleName;
  sHiddenStyleName = (uint64_t)v4;
  id v6 = v4;

  [a1 registerStyle:v6 aliasName:0 withType:3 inherited:0];
}

+ (BOOL)isHiddenStyleRegistered
{
  return sHiddenStyleName != 0;
}

+ (unint64_t)transitionFromString:(id)a3
{
  uint64_t v3 = transitionFromString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&transitionFromString__onceToken, &__block_literal_global_14);
  }
  uint64_t v5 = [(id)transitionFromString__sTransitionKeysMap objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

uint64_t __43__IKViewElementStyle_transitionFromString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)transitionFromString__sTransitionKeysMap;
  transitionFromString__sTransitionKeysMap = (uint64_t)v0;

  [(id)transitionFromString__sTransitionKeysMap setObject:&unk_1F3E3DBF0 forKeyedSubscript:@"none"];
  [(id)transitionFromString__sTransitionKeysMap setObject:&unk_1F3E3DC08 forKeyedSubscript:@"dissolve"];
  [(id)transitionFromString__sTransitionKeysMap setObject:&unk_1F3E3DC20 forKeyedSubscript:@"push"];
  [(id)transitionFromString__sTransitionKeysMap setObject:&unk_1F3E3DC38 forKeyedSubscript:@"wipe"];
  id v2 = (void *)transitionFromString__sTransitionKeysMap;
  return [v2 setObject:&unk_1F3E3DC50 forKeyedSubscript:@"magicMove"];
}

+ (unint64_t)positionFromString:(id)a3
{
  uint64_t v3 = positionFromString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&positionFromString__onceToken, &__block_literal_global_246);
  }
  uint64_t v5 = [(id)positionFromString__sPositionKeysMap objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

uint64_t __41__IKViewElementStyle_positionFromString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)positionFromString__sPositionKeysMap;
  positionFromString__sPositionKeysMap = (uint64_t)v0;

  [(id)positionFromString__sPositionKeysMap setObject:&unk_1F3E3DBF0 forKeyedSubscript:@"center"];
  [(id)positionFromString__sPositionKeysMap setObject:&unk_1F3E3DC08 forKeyedSubscript:@"top"];
  [(id)positionFromString__sPositionKeysMap setObject:&unk_1F3E3DC20 forKeyedSubscript:@"bottom"];
  [(id)positionFromString__sPositionKeysMap setObject:&unk_1F3E3DC38 forKeyedSubscript:@"left"];
  [(id)positionFromString__sPositionKeysMap setObject:&unk_1F3E3DC50 forKeyedSubscript:@"right"];
  [(id)positionFromString__sPositionKeysMap setObject:&unk_1F3E3DC68 forKeyedSubscript:@"top-left"];
  [(id)positionFromString__sPositionKeysMap setObject:&unk_1F3E3DC80 forKeyedSubscript:@"top-right"];
  [(id)positionFromString__sPositionKeysMap setObject:&unk_1F3E3DC98 forKeyedSubscript:@"bottom-left"];
  id v2 = (void *)positionFromString__sPositionKeysMap;
  return [v2 setObject:&unk_1F3E3DCB0 forKeyedSubscript:@"bottom-right"];
}

+ (unint64_t)alignmentFromString:(id)a3
{
  uint64_t v3 = alignmentFromString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&alignmentFromString__onceToken, &__block_literal_global_283);
  }
  uint64_t v5 = [(id)alignmentFromString__sAlignmentKeysMap objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

uint64_t __42__IKViewElementStyle_alignmentFromString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)alignmentFromString__sAlignmentKeysMap;
  alignmentFromString__sAlignmentKeysMap = (uint64_t)v0;

  [(id)alignmentFromString__sAlignmentKeysMap setObject:&unk_1F3E3DBF0 forKeyedSubscript:@"left"];
  [(id)alignmentFromString__sAlignmentKeysMap setObject:&unk_1F3E3DC08 forKeyedSubscript:@"center"];
  [(id)alignmentFromString__sAlignmentKeysMap setObject:&unk_1F3E3DC20 forKeyedSubscript:@"right"];
  [(id)alignmentFromString__sAlignmentKeysMap setObject:&unk_1F3E3DC38 forKeyedSubscript:@"justified"];
  id v2 = (void *)alignmentFromString__sAlignmentKeysMap;
  return [v2 setObject:&unk_1F3E3DC50 forKeyedSubscript:@"natural"];
}

+ (unint64_t)imageTreatmentFromString:(id)a3
{
  uint64_t v3 = imageTreatmentFromString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&imageTreatmentFromString__onceToken, &__block_literal_global_291);
  }
  uint64_t v5 = [(id)imageTreatmentFromString__sImageTreatmentKeysMap objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

uint64_t __47__IKViewElementStyle_imageTreatmentFromString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)imageTreatmentFromString__sImageTreatmentKeysMap;
  imageTreatmentFromString__sImageTreatmentKeysMap = (uint64_t)v0;

  [(id)imageTreatmentFromString__sImageTreatmentKeysMap setObject:&unk_1F3E3DC08 forKeyedSubscript:@"corner-small"];
  [(id)imageTreatmentFromString__sImageTreatmentKeysMap setObject:&unk_1F3E3DC20 forKeyedSubscript:@"corner-medium"];
  [(id)imageTreatmentFromString__sImageTreatmentKeysMap setObject:&unk_1F3E3DC38 forKeyedSubscript:@"corner-large"];
  id v2 = (void *)imageTreatmentFromString__sImageTreatmentKeysMap;
  return [v2 setObject:&unk_1F3E3DBF0 forKeyedSubscript:@"circle"];
}

- (NSString)classDescriptorString
{
  classDescriptorString = self->_classDescriptorString;
  if (classDescriptorString) {
    uint64_t v3 = classDescriptorString;
  }
  else {
    uint64_t v3 = &stru_1F3E09950;
  }
  return (NSString *)v3;
}

+ (id)normalizeClassSelectorString:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    unint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v7 = [v4 componentsSeparatedByCharactersInSet:v6];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqualToString:", &stru_1F3E09950, (void)v18) & 1) == 0) {
            [v5 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    if ([v5 count])
    {
      v14 = [v5 allObjects];
      id v15 = [v14 sortedArrayUsingSelector:sel_compare_];

      uint64_t v16 = [v15 componentsJoinedByString:@" "];

      id v4 = (void *)v16;
    }
  }
  return v4;
}

+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 inlineStyleString:(id)a4 filterBlockedStyles:(BOOL)a5
{
  return (IKViewElementStyle *)[a1 elementStyleWithSelector:a3 inlineStyleString:a4 filterBlockedStyles:a5 inlineStyleRangeCorrect:0];
}

+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 inlineStyleString:(id)a4 filterBlockedStyles:(BOOL)a5 inlineStyleRangeCorrect:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  uint64_t v10 = (__CFString *)a3;
  id v11 = a4;
  if (-[__CFString length](v10, "length") || [v11 length])
  {
    uint64_t v12 = +[IKViewElementStyle normalizeClassSelectorString:v10];

    if (![v11 length]) {
      goto LABEL_31;
    }
    BOOL v54 = v6;
    if ([(__CFString *)v12 length])
    {
      id v56 = a1;
      id v13 = [MEMORY[0x1E4F28E78] string];
      v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v15 = [(__CFString *)v12 componentsSeparatedByCharactersInSet:v14];

      if ([v15 count])
      {
        unint64_t v16 = 0;
        do
        {
          BOOL v17 = [v15 objectAtIndex:v16];
          if (([v17 isEqualToString:&stru_1F3E09950] & 1) == 0)
          {
            if ([v13 length]) {
              long long v18 = @", .%@";
            }
            else {
              long long v18 = @".%@";
            }
            objc_msgSend(v13, "appendFormat:", v18, v17);
          }

          ++v16;
        }
        while (v16 < [v15 count]);
      }

      a1 = v56;
    }
    else
    {

      uint64_t v12 = @"*";
      id v13 = [MEMORY[0x1E4F28E78] stringWithString:@"*"];
    }
    long long v19 = [NSString stringWithFormat:@"%@{%@}", v13, v11];
    uint64_t v20 = [v19 rangeOfString:v11];
    long long v21 = +[IKCSSParser parse:v19];
    v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 ruleList];
      if ([v23 count])
      {
        v24 = [v23 ruleAtIndex:0];
        v25 = v24;
        if (v54)
        {
          v53 = v23;
          id v57 = a1;
          unsigned int v55 = v7;
          unint64_t v26 = [v24 selectorList];
          uint64_t v27 = [v26 count];

          if (v27)
          {
            unint64_t v28 = 0;
            do
            {
              uint64_t v29 = [v25 selectorList];
              long long v30 = [v29 selectorAtIndex:v28];
              objc_msgSend(v30, "setRange:", 0, 0);

              ++v28;
              long long v31 = [v25 selectorList];
              unint64_t v32 = [v31 count];
            }
            while (v32 > v28);
          }
          long long v33 = [v25 declarationList];
          uint64_t v34 = [v33 count];

          if (v34)
          {
            unint64_t v35 = 0;
            do
            {
              v36 = [v25 declarationList];
              v37 = [v36 declarationAtIndex:v35];

              uint64_t v38 = [v37 range];
              objc_msgSend(v37, "setRange:", v38 - v20, v39);
              uint64_t v40 = [v37 nameRange];
              objc_msgSend(v37, "setNameRange:", v40 - v20, v41);
              uint64_t v42 = [v37 valueRange];
              objc_msgSend(v37, "setValueRange:", v42 - v20, v43);

              ++v35;
              v44 = [v25 declarationList];
              unint64_t v45 = [v44 count];
            }
            while (v45 > v35);
          }
          v46 = [v25 declarationList];
          uint64_t v47 = [v46 range];
          uint64_t v49 = v48;

          v50 = [v25 declarationList];
          objc_msgSend(v50, "setRange:", v47 - v20, v49);

          uint64_t v7 = v55;
          a1 = v57;
          uint64_t v23 = v53;
        }
        v51 = (void *)[objc_alloc((Class)a1) initWithCSSRule:v25 filterBlockedStyles:v7 selStr:v12];
      }
      else
      {
        v51 = 0;
      }
    }
    else
    {
      v51 = 0;
    }

    if (!v51) {
LABEL_31:
    }
      v51 = (void *)[objc_alloc((Class)a1) initWithCSSRule:0 filterBlockedStyles:v7 selStr:v12];
  }
  else
  {
    v51 = 0;
    uint64_t v12 = v10;
  }

  return (IKViewElementStyle *)v51;
}

+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 cssRule:(id)a4 filterBlockedStyles:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithCSSRule:v8 filterBlockedStyles:v5 selStr:v9];

  return (IKViewElementStyle *)v10;
}

+ (IKViewElementStyle)elementStyleWithSelector:(id)a3 aggregatingStyles:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] == 1)
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  }
  else if ((unint64_t)[v6 count] < 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [[IKViewElementStyle alloc] initWithClassSelector:v5];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          -[IKViewElementStyle _addElementStyle:](v7, "_addElementStyle:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

+ (IKViewElementStyle)elementStyleWithParentStyle:(id)a3 elementStyle:(id)a4 elementStyleOverrides:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 styleDict];
  uint64_t v11 = [v10 count];

  if (v7)
  {
    uint64_t v12 = [[IKViewElementStyle alloc] initWithClassSelector:0];
    [(IKViewElementStyle *)v12 _addParentStyle:v7];
    if (v8 && v11)
    {
      if (v12)
      {
LABEL_9:
        [(IKViewElementStyle *)v12 _addElementStyle:v8];
LABEL_10:
        id v13 = v12;
        id v14 = v9;
LABEL_11:
        [(IKViewElementStyle *)v13 _addElementStyle:v14];
        goto LABEL_23;
      }
LABEL_8:
      uint64_t v12 = [[IKViewElementStyle alloc] initWithClassSelector:0];
      goto LABEL_9;
    }
    if (v8)
    {
      if (v12)
      {
        id v13 = v12;
        id v14 = v8;
        goto LABEL_11;
      }
LABEL_16:
      long long v15 = (IKViewElementStyle *)v8;
LABEL_22:
      uint64_t v12 = v15;
      goto LABEL_23;
    }
    if (!v11) {
      goto LABEL_23;
    }
    if (v12) {
      goto LABEL_10;
    }
LABEL_21:
    long long v15 = (IKViewElementStyle *)v9;
    goto LABEL_22;
  }
  if (v8 && v11) {
    goto LABEL_8;
  }
  if (v8) {
    goto LABEL_16;
  }
  if (v11) {
    goto LABEL_21;
  }
  uint64_t v12 = 0;
LABEL_23:

  return v12;
}

- (IKViewElementStyle)initWithStyle:(id)a3 classSelector:(id)a4
{
  id v6 = a4;
  id v7 = [a3 cssRule];
  id v8 = [(IKViewElementStyle *)self initWithCSSRule:v7 filterBlockedStyles:0 selStr:v6];

  return v8;
}

- (IKViewElementStyle)initWithCSSRule:(id)a3 filterBlockedStyles:(BOOL)a4 selStr:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(IKViewElementStyle *)self initWithClassSelector:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_filterBlockedStyles = a4;
    uint64_t v11 = [v8 copy];
    cssRule = v10->_cssRule;
    v10->_cssRule = (IKCSSRule *)v11;

    id v13 = v10->_cssRule;
    if (v13)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v14 = [(IKCSSRule *)v13 declarationList];
      long long v15 = [v14 declarations];
      long long v16 = (void *)[v15 copy];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v16);
            }
            [(IKViewElementStyle *)v10 _addDeclaration:*(void *)(*((void *)&v22 + 1) + 8 * v20++)];
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v18);
      }
    }
  }

  return v10;
}

- (IKViewElementStyle)initWithClassSelector:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IKViewElementStyle;
  id v5 = [(IKViewElementStyle *)&v20 init];
  if (v5)
  {
    id v6 = objc_alloc_init(IKCSSRule);
    cssRule = v5->_cssRule;
    v5->_cssRule = v6;

    id v8 = v5->_cssRule;
    id v9 = objc_opt_new();
    [(IKCSSRule *)v8 setDeclarationList:v9];

    uint64_t v10 = v5->_cssRule;
    uint64_t v11 = objc_opt_new();
    [(IKCSSRule *)v10 setSelectorList:v11];

    uint64_t v12 = +[IKViewElementStyle normalizeClassSelectorString:v4];
    uint64_t v13 = objc_msgSend(v12, "ik_sharedInstance");
    classDescriptorString = v5->_classDescriptorString;
    v5->_classDescriptorString = (NSString *)v13;

    long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    styleDict = v5->_styleDict;
    v5->_styleDict = v15;

    uint64_t v17 = objc_opt_new();
    overridingValuesByStyle = v5->_overridingValuesByStyle;
    v5->_overridingValuesByStyle = (NSMutableDictionary *)v17;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(IKCSSRule *)self->_cssRule copy];
  id v6 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v5;

  objc_storeStrong((id *)(v4 + 16), self->_classDescriptorString);
  uint64_t v7 = [(NSMutableDictionary *)self->_styleDict mutableCopy];
  id v8 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v7;

  *(unsigned char *)(v4 + 8) = self->_filterBlockedStyles;
  objc_storeStrong((id *)(v4 + 32), self->_mediaQueryList);
  return (id)v4;
}

- (id)description
{
  id v3 = [(IKViewElementStyle *)self styleDict];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v6 = [(IKViewElementStyle *)self styleDict];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__IKViewElementStyle_description__block_invoke;
    v9[3] = &unk_1E6DE58D0;
    id v7 = v5;
    id v10 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

uint64_t __33__IKViewElementStyle_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@:%@;", a2, a3];
}

- (id)debugDescription
{
  id v3 = [(IKViewElementStyle *)self styleDict];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v6 = [(IKViewElementStyle *)self styleDict];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__IKViewElementStyle_debugDescription__block_invoke;
    v9[3] = &unk_1E6DE58D0;
    id v7 = v5;
    id v10 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

void __38__IKViewElementStyle_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 stringValue];
  [v4 appendFormat:@"%@:%@;", v5, v6];
}

- (id)valueForStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(IKViewElementStyle *)self _styleNameForAlias:v4];
  id v6 = [(IKViewElementStyle *)self overridingValuesByStyle];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [(IKViewElementStyle *)self cssValueForStyle:v5];
  }
  id v9 = v8;

  return v9;
}

- (id)cssValueForStyle:(id)a3
{
  id v4 = [(IKViewElementStyle *)self _styleNameForAlias:a3];
  id v5 = [(IKViewElementStyle *)self styleDict];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    switch([v6 type])
    {
      case 0:
        id v9 = objc_alloc(NSNumber);
        double v10 = (double)[v6 value];
        goto LABEL_7;
      case 1:
        id v9 = objc_alloc(NSNumber);
        [v6 value];
LABEL_7:
        uint64_t v7 = [v9 initWithDouble:v10];
        break;
      case 2:
        uint64_t v7 = [v6 number];
        break;
      case 3:
      case 5:
      case 9:
        uint64_t v7 = [v6 value];
        break;
      case 4:
        uint64_t v7 = [v6 color];
        break;
      case 6:
        uint64_t v11 = (void *)MEMORY[0x1E4F29238];
        [v6 transform];
        uint64_t v7 = [v11 valueWithCGAffineTransform:&v14];
        break;
      case 7:
        uint64_t v12 = (void *)MEMORY[0x1E4F29238];
        [v6 insets];
        uint64_t v7 = objc_msgSend(v12, "valueWithUIEdgeInsets:");
        break;
      case 8:
        uint64_t v7 = [v6 fourTuple];
        break;
      default:
        goto LABEL_4;
    }
    id v8 = (void *)v7;
  }
  else
  {
LABEL_4:
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)edgeFlagForStyle:(id)a3
{
  id v4 = [(IKViewElementStyle *)self _styleNameForAlias:a3];
  id v5 = [(IKViewElementStyle *)self styleDict];
  id v6 = [v5 objectForKey:v4];

  if (v6 && [v6 type] == 7) {
    unint64_t v7 = [v6 edgeFlag];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (UIColor)color
{
  id v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"color" expectedClass:objc_opt_class()];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 color];
    id v5 = [v4 color];
  }
  else
  {
    id v5 = 0;
  }

  return (UIColor *)v5;
}

- (UIColor)borderColor
{
  id v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"border-color" expectedClass:objc_opt_class()];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 color];
    id v5 = [v4 color];
  }
  else
  {
    id v5 = 0;
  }

  return (UIColor *)v5;
}

- (UIColor)backgroundColor
{
  id v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"background-color" expectedClass:objc_opt_class()];
  id v3 = [v2 color];
  id v4 = [v3 color];

  return (UIColor *)v4;
}

- (IKColor)ikColor
{
  id v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"color" expectedClass:objc_opt_class()];
  id v3 = [v2 color];

  return (IKColor *)v3;
}

- (IKColor)ikHighlightColor
{
  id v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"highlight-color" expectedClass:objc_opt_class()];
  id v3 = [v2 color];

  return (IKColor *)v3;
}

- (IKColor)ikBackgroundColor
{
  id v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"background-color" expectedClass:objc_opt_class()];
  id v3 = [v2 color];

  return (IKColor *)v3;
}

- (IKColor)ikBorderColor
{
  id v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"border-color" expectedClass:objc_opt_class()];
  id v3 = [v2 color];

  return (IKColor *)v3;
}

- (UIEdgeInsets)borderMargins
{
  [(IKViewElementStyle *)self _edgeInsetsForStyleName:@"itml-item-border-margin"];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)borderWidths
{
  [(IKViewElementStyle *)self _edgeInsetsForStyleName:@"border-width"];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)fontSize
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"font-size" expectedClass:objc_opt_class()];
  [v2 value];
  double v4 = v3;

  return v4;
}

- (NSString)fontWeight
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"font-weight" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    double v4 = [v2 stringValue];
  }
  else
  {
    double v4 = 0;
  }

  return (NSString *)v4;
}

- (unint64_t)textAlignment
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"text-align" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    double v4 = [v2 stringValue];
    unint64_t v5 = [(id)objc_opt_class() alignmentFromString:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)elementAlignment
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-align" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    double v4 = [v2 stringValue];
    unint64_t v5 = [(id)objc_opt_class() alignmentFromString:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)elementPadding
{
  double v3 = [(IKViewElementStyle *)self _declarationForStyleName:@"padding" expectedClass:objc_opt_class()];
  if (v3) {
    double v4 = @"padding";
  }
  else {
    double v4 = @"itml-padding";
  }
  [(IKViewElementStyle *)self _edgeInsetsForStyleName:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)elementMargin
{
  [(IKViewElementStyle *)self _edgeInsetsForStyleName:@"margin"];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)elementPosition
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-position" expectedClass:objc_opt_class()];
  if (v2)
  {
    double v3 = objc_opt_class();
    double v4 = [v2 value];
    unint64_t v5 = [v3 positionFromString:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (int64_t)maxTextLines
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-text-max-lines" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2) {
    int64_t v4 = [v2 value];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (int64_t)columnCount
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"column-count" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2) {
    int64_t v4 = [v2 value];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (NSString)columnType
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-column-type" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 stringValue];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)columnItemType
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-column-item-type" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 stringValue];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)rowHeight
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-row-height" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 stringValue];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)maxWidth
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"max-width" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 stringValue];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)itemWidth
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-item-width" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 stringValue];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)itemHeight
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-item-height" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = NSNumber;
    [v2 value];
    unint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
    double v6 = [v5 stringValue];
  }
  else
  {
    double v6 = 0;
  }

  return (NSString *)v6;
}

- (NSURL)imagePlaceholderURL
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-img-placeholder" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 value];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSURL *)v4;
}

- (IKColor)imagePlaceholderBackgroundColor
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-img-placeholder-background-color" expectedClass:objc_opt_class()];
  double v3 = [v2 color];

  return (IKColor *)v3;
}

- (IKColor)imageMaskColor
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-img-mask-color" expectedClass:objc_opt_class()];
  double v3 = [v2 color];

  return (IKColor *)v3;
}

- (NSString)lockupType
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-lockup-type" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 value];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (int64_t)reflectImage
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-img-reflect" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 value];
    int64_t v5 = [v4 BOOLValue];
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

- (int64_t)fillImage
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-img-fill" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 value];
    int64_t v5 = [v4 BOOLValue];
  }
  else
  {
    int64_t v5 = -1;
  }

  return v5;
}

- (unint64_t)imagePosition
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-img-position" expectedClass:objc_opt_class()];
  if (v2)
  {
    double v3 = objc_opt_class();
    int64_t v4 = [v2 value];
    unint64_t v5 = [v3 positionFromString:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSString)imageTreatment
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-img-treatment" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 value];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (CGAffineTransform)transform
{
  int64_t v4 = [(IKViewElementStyle *)self _declarationForStyleName:@"transform" expectedClass:objc_opt_class()];
  if (v4)
  {
    double v8 = v4;
    [v4 transform];
    int64_t v4 = v8;
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  }

  return result;
}

- (NSString)transition
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-transition" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 value];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSNumber)transitionInterval
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-transition-interval" expectedClass:objc_opt_class()];
  double v3 = v2;
  int64_t v4 = NSNumber;
  if (v2) {
    [v2 value];
  }
  else {
    double v5 = 0.0;
  }
  long long v6 = [v4 numberWithDouble:v5];

  return (NSNumber *)v6;
}

- (NSString)labelsState
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-labels-state" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 value];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (unint64_t)ordinalMaxLength
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-ordinal-max-length" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 value];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (NSString)visibility
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"visibility" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 value];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)dividerType
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-divider-type" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 value];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)cardType
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-card-type" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 value];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)badgeTreatment
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-badge-treatment" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 value];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)textScale
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-text-scale" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 value];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)textStyle
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"itml-text-style" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 value];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (IKFourTuple)borderRadius
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"border-radius" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 fourTuple];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (IKFourTuple *)v4;
}

- (NSShadow)textShadow
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"text-shadow" expectedClass:objc_opt_class()];
  double v3 = [v2 value];

  return (NSShadow *)v3;
}

- (NSString)maxHeight
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"max-height" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 value];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSNumber)letterSpacing
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"letter-spacing" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = NSNumber;
    [v2 value];
    double v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    double v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSNumber)lineHeight
{
  double v2 = [(IKViewElementStyle *)self _declarationForStyleName:@"line-height" expectedClass:objc_opt_class()];
  double v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 number];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return (NSNumber *)v4;
}

- (BOOL)hidden
{
  if (!sHiddenStyleName) {
    return 0;
  }
  double v2 = [(IKViewElementStyle *)self styleDict];
  double v3 = [v2 objectForKey:sHiddenStyleName];

  if (v3)
  {
    unint64_t v4 = [v3 stringValue];
    char v5 = [v4 isEqualToString:@"true"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)requiresDynamicEvaluation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = [(IKViewElementStyle *)self styleDict];
  double v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v8 = [v7 color];
          double v9 = [v8 colorMapKey];

          if (v9)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)prototype
{
  return [(IKViewElementStyle *)self valueForStyle:@"-itml-prototype"];
}

- (unint64_t)typeForStyle:(id)a3
{
  double v3 = [(IKViewElementStyle *)self _styleNameForAlias:a3];
  uint64_t v4 = [(id)sTypeMap objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 3;
  }

  return v6;
}

- (id)_gradientFromString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v6 = objc_alloc_init(IKColor);
  [(IKColor *)v6 setColorType:3];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v4];
  double v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v24 = 0;
  objc_msgSend(v7, "scanUpToString:intoString:", @"("), &v24;
  id v9 = v24;
  double v10 = [v9 stringByTrimmingCharactersInSet:v8];

  long long v11 = 0;
  long long v12 = 0;
  if ([v7 isAtEnd]) {
    goto LABEL_12;
  }
  if (![v10 length] || !objc_msgSend(@"linear-gradient", "isEqualToString:", v10))
  {
    long long v11 = 0;
LABEL_11:
    long long v12 = 0;
    goto LABEL_12;
  }
  [(IKColor *)v6 setGradientType:1];
  objc_msgSend(v7, "scanString:intoString:", @"("), 0;
  id v23 = 0;
  [v7 scanUpToString:@"," intoString:&v23];
  id v13 = v23;
  long long v11 = [v13 stringByTrimmingCharactersInSet:v8];

  if (([v7 isAtEnd] & 1) != 0
    || ![v11 length]
    || ([v7 isAtEnd] & 1) != 0
    || ![v11 length])
  {
    goto LABEL_11;
  }
  if ([@"top" isEqualToString:v11])
  {
    uint64_t v14 = 1;
LABEL_17:
    [(IKColor *)v6 setGradientDirectionType:v14];
    goto LABEL_18;
  }
  if ([@"left" isEqualToString:v11])
  {
    uint64_t v14 = 2;
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v7, "scanString:intoString:", @",", 0, self);
  id v22 = 0;
  objc_msgSend(v7, "scanUpToString:intoString:", @""), &v22);
  id v16 = v22;
  if (([v7 isAtEnd] & 1) == 0)
  {
    while ([v16 length])
    {
      objc_super v20 = (void *)[v19 _newColorFromString:v16];
      uint64_t v18 = [v20 color];
      if (v18) {
        [v5 addObject:v18];
      }
      objc_msgSend(v7, "scanString:intoString:", @""), 0);
      [v7 scanString:@"," intoString:0];
      id v21 = v16;
      objc_msgSend(v7, "scanUpToString:intoString:", @""), &v21);
      id v17 = v21;

      id v16 = v17;
      if ([v7 isAtEnd]) {
        goto LABEL_24;
      }
    }
  }
  id v17 = v16;
LABEL_24:
  if ([v5 count]) {
    [(IKColor *)v6 setGradientColors:v5];
  }
  long long v12 = v6;

LABEL_12:
  return v12;
}

- (id)_newColorFromString:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if (![v4 length]) {
    goto LABEL_29;
  }
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v4];
  id v21 = 0;
  objc_msgSend(v6, "scanUpToString:intoString:", @"("), &v21;
  id v7 = v21;
  double v8 = [v7 stringByTrimmingCharactersInSet:v5];

  if (([v6 isAtEnd] & 1) != 0 || !objc_msgSend(v8, "length")) {
    goto LABEL_28;
  }
  if (([v8 isEqualToString:@"rgb"] & 1) != 0
    || [v8 isEqualToString:@"rgba"])
  {
    uint64_t v19 = -1;
    uint64_t v20 = -1;
    uint64_t v18 = -1;
    float v17 = 1.0;
    objc_msgSend(v6, "scanString:intoString:", @"("), 0;
    [v6 scanInteger:&v20];
    [v6 scanString:@"," intoString:0];
    [v6 scanInteger:&v19];
    [v6 scanString:@"," intoString:0];
    [v6 scanInteger:&v18];
    if ([v8 isEqualToString:@"rgba"])
    {
      [v6 scanString:@"," intoString:0];
      [v6 scanFloat:&v17];
    }
    id v9 = 0;
    if ((v20 & 0x8000000000000000) == 0 && (v19 & 0x8000000000000000) == 0 && (v18 & 0x8000000000000000) == 0)
    {
      if (v17 > 1.0 || v17 < 0.0) {
        float v11 = 1.0;
      }
      else {
        float v11 = v17;
      }
      float v17 = v11;
      uint64_t v12 = [MEMORY[0x1E4F428B8] colorWithRed:(float)((float)v20 / 255.0) green:(float)((float)v19 / 255.0) blue:(float)((float)v18 / 255.0) alpha:v11];
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (![v8 isEqualToString:@"hsb"])
  {
    if ([v8 isEqualToString:@"linear-gradient"])
    {
      id v13 = [(IKViewElementStyle *)self _gradientFromString:v4];

      goto LABEL_36;
    }
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v19 = -1;
  uint64_t v20 = -1;
  uint64_t v18 = -1;
  objc_msgSend(v6, "scanString:intoString:", @"("), 0;
  [v6 scanInteger:&v20];
  [v6 scanString:@"," intoString:0];
  [v6 scanInteger:&v19];
  [v6 scanString:@"," intoString:0];
  [v6 scanInteger:&v18];
  id v9 = 0;
  if ((v20 & 0x8000000000000000) == 0 && (v19 & 0x8000000000000000) == 0 && (v18 & 0x8000000000000000) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F428B8] colorWithHue:(double)v20 / 360.0 saturation:(double)v19 / 100.0 brightness:(double)v18 / 100.0 alpha:1.0];
LABEL_18:
    id v9 = (void *)v12;
  }
LABEL_19:

  if (v9)
  {
    id v13 = [[IKColor alloc] initWithColor:v9];
    [(IKColor *)v13 setColorType:0];
    unint64_t v6 = v9;
    goto LABEL_36;
  }
LABEL_29:
  unint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
  if ([v6 isEqualToString:@"blurred"])
  {
    uint64_t v14 = objc_alloc_init(IKColor);
    id v13 = v14;
    uint64_t v15 = 2;
  }
  else if ([v6 isEqualToString:@"tint-color"])
  {
    uint64_t v14 = objc_alloc_init(IKColor);
    id v13 = v14;
    uint64_t v15 = 1;
  }
  else
  {
    if (![v6 isEqualToString:@"none"])
    {
      id v13 = 0;
      goto LABEL_36;
    }
    uint64_t v14 = objc_alloc_init(IKColor);
    id v13 = v14;
    uint64_t v15 = 4;
  }
  [(IKColor *)v14 setColorType:v15];
LABEL_36:

  return v13;
}

- (UIEdgeInsets)_edgeInsetsForStyleName:(id)a3
{
  id v4 = a3;
  id v5 = [(IKViewElementStyle *)self _declarationForStyleName:v4 expectedClass:objc_opt_class()];

  if (v5)
  {
    [v5 insets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F437F8];
    double v9 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)_addParentStyle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = objc_msgSend(a3, "cssRule", 0);
  id v5 = [v4 declarationList];
  double v6 = [v5 declarations];
  double v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v13 = [v12 name];
        double v14 = [(id)sInheritMap objectForKeyedSubscript:v13];
        int v15 = [v14 BOOLValue];

        if (v15) {
          [(IKViewElementStyle *)self _addDeclaration:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)_addElementStyle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(a3, "cssRule", 0);
  id v5 = [v4 declarationList];
  double v6 = [v5 declarations];
  double v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(IKViewElementStyle *)self _addDeclaration:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_addDeclaration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  double v6 = [(IKViewElementStyle *)self cssRule];
  double v7 = [v6 declarationList];
  uint64_t v8 = [v7 declarations];

  uint64_t v9 = [(IKViewElementStyle *)self styleDict];
  uint64_t v10 = [v9 objectForKey:v5];

  unint64_t v11 = [(IKViewElementStyle *)self typeForStyle:v5];
  long long v12 = [(id)sEdgeInsetsStylePositionMap objectForKey:v5];
  long long v13 = v12;
  BOOL v14 = v11 != 7 && v12 == 0;
  char v15 = !v14;
  if (!v14)
  {
    unint64_t v45 = v10;
    char v47 = v15;
    if (v11 == 7)
    {
      id v16 = v5;
    }
    else
    {
      objc_msgSend(v12, "objectForKey:", @"_IKEdgeInsetStyleParentKey", v10);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = v16;
    uint64_t v17 = [(IKViewElementStyle *)self styleDict];
    long long v18 = [v17 objectForKey:v10];

    if (!v18)
    {
      long long v18 = objc_alloc_init(IKCSSDeclarationEdgeInsets);
      -[IKCSSDeclarationEdgeInsets setInsets:](v18, "setInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
      [(IKCSSDeclarationEdgeInsets *)v18 setInsetsFound:1];
      [(IKCSSDeclaration *)v18 setType:7];
      [(IKCSSDeclaration *)v18 setName:v10];
    }
    if (v11 == 7)
    {
      [v4 insets];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      uint64_t v27 = 15;
    }
    else
    {
      uint64_t v28 = [v13 objectForKey:@"_IKEdgeInsetStylePositionKey"];
      if (!v28) {
        goto LABEL_20;
      }
      uint64_t v29 = (void *)v28;
      long long v30 = [v13 objectForKey:@"_IKEdgeInsetStylePositionKey"];
      uint64_t v31 = [v30 unsignedIntegerValue];

      if (v31 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_20;
      }
      [(IKCSSDeclarationEdgeInsets *)v18 insets];
      double v20 = v37;
      double v22 = v38;
      double v24 = v39;
      double v26 = v40;
      uint64_t v27 = [(IKCSSDeclarationEdgeInsets *)v18 edgeFlag];
      switch(v31)
      {
        case 0:
          [v4 value];
          double v20 = v41;
          v27 |= 1uLL;
          break;
        case 1:
          [v4 value];
          double v22 = v42;
          v27 |= 2uLL;
          break;
        case 2:
          [v4 value];
          double v24 = v43;
          v27 |= 4uLL;
          break;
        case 3:
          [v4 value];
          double v26 = v44;
          v27 |= 8uLL;
          break;
        default:
          break;
      }
    }
    -[IKCSSDeclarationEdgeInsets setInsets:](v18, "setInsets:", v20, v22, v24, v26);
    [(IKCSSDeclarationEdgeInsets *)v18 setEdgeFlag:v27];
LABEL_20:
    if (v18)
    {
      unint64_t v32 = [(IKViewElementStyle *)self styleDict];
      [v32 removeObjectForKey:v10];

      long long v33 = [(IKViewElementStyle *)self styleDict];
      [v33 setObject:v18 forKey:v10];
    }
    uint64_t v34 = [MEMORY[0x1E4F28E60] indexSet];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __38__IKViewElementStyle__addDeclaration___block_invoke;
    v48[3] = &unk_1E6DE4850;
    id v49 = v5;
    id v50 = v34;
    id v35 = v34;
    [v8 enumerateObjectsUsingBlock:v48];
    [v8 removeObjectsAtIndexes:v35];

    char v15 = v47;
    goto LABEL_23;
  }
  if (!v10) {
    goto LABEL_24;
  }
  [v8 removeObject:v10];
LABEL_23:

LABEL_24:
  if ([v8 indexOfObject:v4] == 0x7FFFFFFFFFFFFFFFLL) {
    [v8 addObject:v4];
  }
  if ((v15 & 1) == 0)
  {
    v36 = [(IKViewElementStyle *)self styleDict];
    [v36 setObject:v4 forKey:v5];
  }
}

void __38__IKViewElementStyle__addDeclaration___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 name];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    double v7 = *(void **)(a1 + 40);
    [v7 addIndex:a3];
  }
}

- (id)_styleNameForAlias:(id)a3
{
  double v3 = (void *)sTypeAliasMap;
  id v4 = a3;
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  int v6 = (void *)v5;
  if (v5) {
    double v7 = (void *)v5;
  }
  else {
    double v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (id)_declarationForStyleName:(id)a3 expectedClass:(Class)a4
{
  id v5 = a3;
  int v6 = [(IKViewElementStyle *)self _styleNameForAlias:v5];
  double v7 = [(IKViewElementStyle *)self styleDict];
  id v8 = [v7 objectForKey:v6];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = ITMLKitGetLogObject(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[IKViewElementStyle _declarationForStyleName:expectedClass:]((uint64_t)v5, v10);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (IKCSSRule)cssRule
{
  return self->_cssRule;
}

- (NSArray)mediaQueryList
{
  return self->_mediaQueryList;
}

- (void)setMediaQueryList:(id)a3
{
}

- (NSMutableDictionary)styleDict
{
  return self->_styleDict;
}

- (void)setStyleDict:(id)a3
{
}

- (NSMutableDictionary)overridingValuesByStyle
{
  return self->_overridingValuesByStyle;
}

- (void)setOverridingValuesByStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingValuesByStyle, 0);
  objc_storeStrong((id *)&self->_styleDict, 0);
  objc_storeStrong((id *)&self->_mediaQueryList, 0);
  objc_storeStrong((id *)&self->_cssRule, 0);
  objc_storeStrong((id *)&self->_classDescriptorString, 0);
}

- (void)_declarationForStyleName:(uint64_t)a1 expectedClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Unexpected declartion type for style \"%@\"", (uint8_t *)&v2, 0xCu);
}

@end