@interface MRURouteTextFormatter
- (BOOL)text:(id)a3 fitsInWidth:(double)a4;
- (CGSize)sizeForText:(id)a3;
- (MRURouteTextFormatter)init;
- (MRURouteTextFormatter)initWithConfiguration:(id)a3;
- (MRURouteTextFormatterConfiguration)configuration;
- (id)bestStringForRouteNames:(id)a3 designatedGroupLeaderName:(id)a4 thatFitsWidth:(double)a5;
- (id)formattedRouteNameForDesignatedGroupLeaderName:(id)a3 truncatedDesignatedGroupLeaderName:(id)a4 routeNamesText:(id)a5;
- (id)marketingNames;
- (id)plusSeparatedRouteNames:(id)a3;
- (id)routeNamesSortedAlphanumeric:(id)a3;
- (id)routeNamesSortedLength:(id)a3;
- (id)text:(id)a3 displayAsSiriSuggestion:(BOOL)a4;
- (id)textForRoute:(id)a3;
- (id)textForRoute:(id)a3 textBoundingWidth:(double)a4;
- (id)textForRouteNames:(id)a3;
- (id)textForRouteNames:(id)a3 textBoundingWidth:(double)a4;
- (id)truncateText:(id)a3 by:(int64_t)a4;
- (int64_t)compareLength:(id)a3 with:(id)a4;
- (void)setConfiguration:(id)a3;
@end

@implementation MRURouteTextFormatter

- (MRURouteTextFormatter)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRURouteTextFormatter;
  v6 = [(MRURouteTextFormatter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (MRURouteTextFormatter)init
{
  v3 = objc_alloc_init(MRURouteTextFormatterConfiguration);
  v4 = [(MRURouteTextFormatter *)self initWithConfiguration:v3];

  return v4;
}

- (id)textForRoute:(id)a3 textBoundingWidth:(double)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isAppleTVRoute])
  {
    v7 = [v6 designatedGroupLeaderName];
    BOOL v8 = [v7 length] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if (![v6 isDeviceRoute] || v8)
  {
    objc_super v9 = [v6 designatedGroupLeaderName];
  }
  else
  {
    objc_super v9 = [MEMORY[0x1E4F76FC0] localDeviceLocalizedName];
  }
  v10 = v9;
  if (![(__CFString *)v9 length]
    || ![v6 isAirPlayingToDevice]
    || ![v6 isProxyGroupPlayer])
  {
    if ([v6 isDeviceRoute] && objc_msgSend(v6, "numberOfOutputDevices") <= 1)
    {

      v10 = (__CFString *)v6;
      BOOL v15 = [(MRURouteTextFormatterConfiguration *)self->_configuration usesPredictedOutputDevice];
      if (v10 && v15)
      {
        v16 = [(__CFString *)v10 predictedOutputDevice];
        v17 = v16;
        if (v16)
        {
          v18 = [v16 routeName];
          v27[0] = v18;
          v19 = (void **)v27;
        }
        else
        {
          v18 = [(__CFString *)v10 routeName];
          v26 = v18;
          v19 = &v26;
        }
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      }
      else
      {
        v17 = [(__CFString *)v10 routeName];
        v25 = v17;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      }
    }
    else
    {
      int v20 = [v6 isSplitRoute];

      if (!v20)
      {
        v13 = [v6 routeNames];
LABEL_29:
        v10 = &stru_1F06524E0;
        goto LABEL_30;
      }
      +[MRUStringsProvider routeNameHeadphonesCount:](MRUStringsProvider, "routeNameHeadphonesCount:", [v6 numberOfOutputDevices]);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = v10;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    }
LABEL_28:

    goto LABEL_29;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v12 = [v6 routeNames];
  v13 = (void *)[v11 initWithArray:v12];

  uint64_t v14 = [v13 indexOfObject:v10];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
    [v13 removeObjectAtIndex:v14];
  }
  if ([(MRURouteTextFormatterConfiguration *)self->_configuration omitGroupLeaderName]) {
    goto LABEL_28;
  }
LABEL_30:
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
  v22 = [(MRURouteTextFormatter *)self bestStringForRouteNames:v21 designatedGroupLeaderName:v10 thatFitsWidth:a4];

  return v22;
}

- (id)textForRoute:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  [(MRURouteTextFormatterConfiguration *)configuration textBoundingWidth];
  id v6 = -[MRURouteTextFormatter textForRoute:textBoundingWidth:](self, "textForRoute:textBoundingWidth:", v5);

  return v6;
}

- (id)textForRouteNames:(id)a3 textBoundingWidth:(double)a4
{
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  v7 = [(MRURouteTextFormatter *)self bestStringForRouteNames:v6 designatedGroupLeaderName:&stru_1F06524E0 thatFitsWidth:a4];

  return v7;
}

- (id)textForRouteNames:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  [(MRURouteTextFormatterConfiguration *)configuration textBoundingWidth];
  id v6 = -[MRURouteTextFormatter textForRouteNames:textBoundingWidth:](self, "textForRouteNames:textBoundingWidth:", v5);

  return v6;
}

- (id)bestStringForRouteNames:(id)a3 designatedGroupLeaderName:(id)a4 thatFitsWidth:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 allObjects];
  uint64_t v11 = [(MRURouteTextFormatter *)self routeNamesSortedAlphanumeric:v10];

  v12 = [v8 allObjects];
  uint64_t v13 = [(MRURouteTextFormatter *)self routeNamesSortedLength:v12];

  uint64_t v14 = (void *)[v9 copy];
  v57 = (void *)v11;
  BOOL v15 = [(MRURouteTextFormatter *)self plusSeparatedRouteNames:v11];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MRURouteTextFormatter_bestStringForRouteNames_designatedGroupLeaderName_thatFitsWidth___block_invoke;
  aBlock[3] = &unk_1E5F0DAE8;
  aBlock[4] = self;
  id v16 = v9;
  id v79 = v16;
  double v80 = a5;
  v17 = (unsigned int (**)(void *, void *, void *))_Block_copy(aBlock);
  v58 = (void *)v13;
  v59 = v15;
  v60 = v16;
  if (v17[2](v17, v14, v15))
  {
    v18 = [(MRURouteTextFormatter *)self formattedRouteNameForDesignatedGroupLeaderName:v16 truncatedDesignatedGroupLeaderName:v14 routeNamesText:v15];
    v19 = v57;
LABEL_30:
    v41 = [(MRURouteTextFormatter *)self configuration];
    v43 = -[MRURouteTextFormatter text:displayAsSiriSuggestion:](self, "text:displayAsSiriSuggestion:", v18, [v41 displayAsSiriSuggestion]);
    goto LABEL_31;
  }
  uint64_t v20 = [v14 length];
  uint64_t v21 = v20
      - 2
      * [(MRURouteTextFormatterConfiguration *)self->_configuration minimumEndCharacterCount];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy_;
  v72 = __Block_byref_object_dispose_;
  v73 = &stru_1F06524E0;
  if (v21 >= 1)
  {
    while (1)
    {
      uint64_t v22 = [v60 isEqualToString:v14] ? 1 : 2;
      uint64_t v23 = [(MRURouteTextFormatter *)self truncateText:v14 by:v22];

      uint64_t v24 = [(MRURouteTextFormatter *)self plusSeparatedRouteNames:v13];
      uint64_t v14 = (void *)v23;
      v25 = (void *)v69[5];
      v69[5] = v24;

      if (v17[2](v17, (void *)v23, (void *)v69[5])) {
        break;
      }
      if (!--v21) {
        goto LABEL_11;
      }
    }
    *((unsigned char *)v75 + 24) = 1;
    v26 = (__CFString *)(id)v69[5];

    v59 = v26;
  }
LABEL_11:
  v19 = v57;
  if (*((unsigned char *)v75 + 24)) {
    goto LABEL_24;
  }
  if ([(MRURouteTextFormatterConfiguration *)self->_configuration allowsMultitruncation])
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v13];
    id v55 = v8;
    v28 = [v27 firstObject];
    uint64_t v29 = [v28 length];
    int64_t v30 = [(MRURouteTextFormatterConfiguration *)self->_configuration minimumEndCharacterCount];

    *((unsigned char *)v75 + 24) = 0;
    v31 = (void *)v69[5];
    v69[5] = (uint64_t)&stru_1F06524E0;

    if (v29 - 2 * v30 >= 1)
    {
      uint64_t v32 = 2 * v30;
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = ~v32 + v29;
      do
      {
        v61[0] = v33;
        v61[1] = 3221225472;
        v61[2] = __89__MRURouteTextFormatter_bestStringForRouteNames_designatedGroupLeaderName_thatFitsWidth___block_invoke_7;
        v61[3] = &unk_1E5F0DB10;
        id v62 = v27;
        v63 = self;
        v66 = &v68;
        v65 = v17;
        id v64 = v14;
        v67 = &v74;
        [v58 enumerateObjectsUsingBlock:v61];
        int v35 = *((unsigned __int8 *)v75 + 24);
        if (*((unsigned char *)v75 + 24))
        {
          v36 = (__CFString *)(id)v69[5];

          v59 = v36;
        }

        if (v35) {
          BOOL v37 = 1;
        }
        else {
          BOOL v37 = v34 == 0;
        }
        --v34;
      }
      while (!v37);
    }

    id v8 = v55;
    v19 = v57;
  }
  if (*((unsigned char *)v75 + 24))
  {
LABEL_24:
    BOOL v38 = 0;
  }
  else
  {
    v45 = [v19 firstObject];
    if ((unint64_t)[v19 count] < 2)
    {
      id v46 = v45;
    }
    else
    {
      +[MRUStringsProvider routeName:plusCount:](MRUStringsProvider, "routeName:plusCount:", v45, [v19 count] - 1);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
    }
    v56 = v46;
    if (((unsigned int (*)(unsigned int (**)(void *, void *, void *), void *))v17[2])(v17, v14))
    {
      v47 = v56;
      v48 = v56;
      BOOL v38 = 0;
      v49 = v45;
      v50 = v59;
    }
    else
    {
      v49 = [v19 firstObject];

      v50 = &stru_1F06524E0;
      unint64_t v51 = 1;
      while (1)
      {
        unint64_t v52 = [v49 length];
        BOOL v38 = v51 > v52;
        if (v51 > v52) {
          break;
        }
        v53 = [(MRURouteTextFormatter *)self truncateText:v49 by:v51];

        if ((unint64_t)[v57 count] < 2)
        {
          v50 = v53;
        }
        else
        {
          +[MRUStringsProvider routeName:plusCount:](MRUStringsProvider, "routeName:plusCount:", v53, [v57 count] - 1);
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        ++v51;
        if (v17[2](v17, v14, v50))
        {
          v54 = v50;
          v50 = v54;
          goto LABEL_47;
        }
      }
      v54 = [v57 firstObject];
LABEL_47:
      v48 = v54;

      v47 = v56;
    }

    v59 = v48;
    v19 = v57;
  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  v39 = [(MRURouteTextFormatter *)self formattedRouteNameForDesignatedGroupLeaderName:v60 truncatedDesignatedGroupLeaderName:v14 routeNamesText:v59];
  v18 = v39;
  if (!v38 || ![v39 length]) {
    goto LABEL_30;
  }
  unint64_t v40 = 0;
  while (1)
  {
    v41 = [(MRURouteTextFormatter *)self truncateText:v18 by:++v40];
    v42 = [(MRURouteTextFormatter *)self configuration];
    v43 = -[MRURouteTextFormatter text:displayAsSiriSuggestion:](self, "text:displayAsSiriSuggestion:", v41, [v42 displayAsSiriSuggestion]);

    if ([(MRURouteTextFormatter *)self text:v43 fitsInWidth:a5]) {
      break;
    }

    if (v40 >= [v18 length]) {
      goto LABEL_30;
    }
  }
LABEL_31:

  return v43;
}

uint64_t __89__MRURouteTextFormatter_bestStringForRouteNames_designatedGroupLeaderName_thatFitsWidth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = [*(id *)(a1 + 32) formattedRouteNameForDesignatedGroupLeaderName:*(void *)(a1 + 40) truncatedDesignatedGroupLeaderName:a2 routeNamesText:a3];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 configuration];
  v7 = objc_msgSend(v5, "text:displayAsSiriSuggestion:", v4, objc_msgSend(v6, "displayAsSiriSuggestion"));

  uint64_t v8 = [*(id *)(a1 + 32) text:v7 fitsInWidth:*(double *)(a1 + 48)];
  return v8;
}

void __89__MRURouteTextFormatter_bestStringForRouteNames_designatedGroupLeaderName_thatFitsWidth___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  v7 = [*(id *)(a1 + 32) firstObject];
  uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  unint64_t v9 = [v7 length];
  if (v9 <= [v8 length])
  {
    v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    int v11 = [v17 isEqualToString:v10];

    uint64_t v12 = v11 ? 1 : 2;
    uint64_t v13 = [*(id *)(a1 + 40) truncateText:v8 by:v12];
    [*(id *)(a1 + 32) setObject:v13 atIndexedSubscript:a3];

    uint64_t v14 = [*(id *)(a1 + 40) plusSeparatedRouteNames:*(void *)(a1 + 32)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (id)text:(id)a3 displayAsSiriSuggestion:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = +[MRUStringsProvider nowPlayingSiriSuggestion:v5];
  }
  else
  {
    id v7 = v5;
  }
  uint64_t v8 = v7;

  return v8;
}

- (int64_t)compareLength:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 length];
  if (v7 <= [v6 length])
  {
    unint64_t v9 = [v5 length];
    int64_t v8 = v9 < [v6 length];
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (id)routeNamesSortedAlphanumeric:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_12];
}

uint64_t __54__MRURouteTextFormatter_routeNamesSortedAlphanumeric___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (id)routeNamesSortedLength:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRURouteTextFormatter_routeNamesSortedLength___block_invoke;
  v5[3] = &unk_1E5F0DB58;
  v5[4] = self;
  v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

uint64_t __48__MRURouteTextFormatter_routeNamesSortedLength___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) compareLength:a2 with:a3];
}

- (id)plusSeparatedRouteNames:(id)a3
{
  v3 = [(MRURouteTextFormatter *)self routeNamesSortedAlphanumeric:a3];
  v4 = +[MRUStringsProvider routeNamePlusSeparator];
  id v5 = [v3 componentsJoinedByString:v4];

  return v5;
}

- (id)formattedRouteNameForDesignatedGroupLeaderName:(id)a3 truncatedDesignatedGroupLeaderName:(id)a4 routeNamesText:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)[v10 copy];
  uint64_t v12 = [(MRURouteTextFormatter *)self marketingNames];
  int v13 = [v12 containsObject:v8];

  if (v13) {
    uint64_t v14 = v8;
  }
  else {
    uint64_t v14 = v9;
  }
  id v15 = v14;
  if ([v11 length] && objc_msgSend(v15, "length"))
  {
    id v16 = +[MRUStringsProvider routeNameArrowFormat:v15 rightSideText:v11];
  }
  else if ([v15 length])
  {
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = v10;
    }
    id v16 = v17;
  }
  else
  {
    if (![v10 length]) {
      goto LABEL_15;
    }
    id v16 = v10;
  }
  id v18 = v16;

  int v11 = v18;
LABEL_15:
  if ([(MRURouteTextFormatterConfiguration *)self->_configuration forcesUppercaseText])
  {
    id v31 = v10;
    v19 = [v11 localizedUppercaseString];
    uint64_t v20 = (void *)[v19 mutableCopy];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v21 = [(MRURouteTextFormatter *)self marketingNames];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v27 = [v11 rangeOfString:v26];
          if (v27 != 0x7FFFFFFFFFFFFFFFLL) {
            objc_msgSend(v20, "replaceCharactersInRange:withString:", v27, v28, v26);
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v23);
    }

    uint64_t v29 = [v20 copy];
    int v11 = (void *)v29;
    id v10 = v31;
  }

  return v11;
}

- (CGSize)sizeForText:(id)a3
{
  id v4 = a3;
  id v5 = [(MRURouteTextFormatterConfiguration *)self->_configuration font];

  if (v5)
  {
    id v6 = [(MRURouteTextFormatterConfiguration *)self->_configuration font];
    objc_msgSend(v4, "mru_textSizeForFont:boundingSize:", v6, 1.79769313e308, 1.79769313e308);
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)text:(id)a3 fitsInWidth:(double)a4
{
  [(MRURouteTextFormatter *)self sizeForText:a3];
  if (v5 < a4) {
    return 1;
  }
  double v7 = v5 - a4;
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  return v7 < 0.00000011920929;
}

- (id)marketingNames
{
  if (marketingNames_onceToken != -1) {
    dispatch_once(&marketingNames_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)marketingNames_marketingNames;

  return v2;
}

void __39__MRURouteTextFormatter_marketingNames__block_invoke()
{
  v0 = (void *)marketingNames_marketingNames;
  marketingNames_marketingNames = (uint64_t)&unk_1F069F278;
}

- (id)truncateText:(id)a3 by:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(MRURouteTextFormatterConfiguration *)self->_configuration truncationMode];
  if (!v7)
  {
    uint64_t v18 = [v6 length];
    uint64_t v19 = v18 - a4;
    if (v19 < [(MRURouteTextFormatterConfiguration *)self->_configuration minimumEndCharacterCount])
    {
      int64_t v20 = [(MRURouteTextFormatterConfiguration *)self->_configuration minimumEndCharacterCount];
      if (v18 >= v20) {
        uint64_t v19 = v20;
      }
      else {
        uint64_t v19 = v18;
      }
    }
    int v13 = objc_msgSend(v6, "substringWithRange:", 0, v19 & ~(v19 >> 63));
    uint64_t v21 = NSString;
    uint64_t v14 = +[MRUStringsProvider routeNameEllipsisString];
    id v17 = [v21 stringWithFormat:@"%@%@", v13, v14];
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    uint64_t v8 = [v6 length];
    if (v8
       - (a4
        + 2
        * [(MRURouteTextFormatterConfiguration *)self->_configuration minimumEndCharacterCount]) <= 0)
    {
      uint64_t v9 = [v6 length];
      a4 = v9
         - 2
         * [(MRURouteTextFormatterConfiguration *)self->_configuration minimumEndCharacterCount];
    }
    int v10 = vcvtpd_s64_f64((double)(unint64_t)[v6 length] * 0.5);
    double v11 = (double)a4 * 0.5;
    uint64_t v12 = (uint64_t)(v11 + (double)v10);
    int v13 = objc_msgSend(v6, "substringWithRange:", 0, (uint64_t)((double)v10 - v11));
    uint64_t v14 = objc_msgSend(v6, "substringWithRange:", v12, (int)objc_msgSend(v6, "length") - v12);
    id v15 = NSString;
    id v16 = +[MRUStringsProvider routeNameEllipsisString];
    id v17 = [v15 stringWithFormat:@"%@%@%@", v13, v16, v14];

LABEL_11:
    goto LABEL_13;
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

- (MRURouteTextFormatterConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end