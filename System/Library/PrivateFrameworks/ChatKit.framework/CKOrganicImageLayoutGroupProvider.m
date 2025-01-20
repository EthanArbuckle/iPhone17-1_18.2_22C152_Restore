@interface CKOrganicImageLayoutGroupProvider
- (CGSize)_targetSizeForChatItem:(id)a3 totalItemCount:(unint64_t)a4;
- (double)_rotationForChatItem:(id)a3 leftRotated:(BOOL)a4;
- (double)_setLayoutRecipesForChatItems:(id)a3;
- (double)scalarForSize:(CGSize)a3 count:(unint64_t)a4;
- (id)_intersectSpecForIndex:(unint64_t)a3 count:(unint64_t)a4;
- (id)_startOffsetSpecForCount:(unint64_t)a3;
- (id)_startRotationSpec;
- (id)layoutGroupForDatasourceItems:(id)a3 environment:(id)a4 layoutItems:(id)a5;
- (unint64_t)_orientationForChatItemSize:(CGSize)a3;
@end

@implementation CKOrganicImageLayoutGroupProvider

void __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 layoutRecipe];
  [v4 targetSize];
  double v6 = v5;
  double v8 = v7;

  v9 = [v3 layoutRecipe];
  [v9 overlap];
  double v11 = v10;

  double v12 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - v11;
  double v13 = *(double *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, v12, v13, v8);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v19];
  v14 = [v3 layoutRecipe];

  [v14 offset];
  double v16 = v15;

  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  double v18 = *(double *)(v17 + 24);
  if (v18 < v6 + v16) {
    double v18 = v6 + v16;
  }
  *(double *)(v17 + 24) = v18;
  v21.origin.x = 0.0;
  v21.origin.y = v12;
  v21.size.width = v13;
  v21.size.height = v8;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v21);
}

- (id)layoutGroupForDatasourceItems:(id)a3 environment:(id)a4 layoutItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v60 = a5;
  v61 = v9;
  double v10 = [v9 collectionLayoutEnvironment];
  double v11 = [v10 container];
  [v11 contentSize];
  uint64_t v13 = v12;

  v14 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  double v15 = +[CKUIBehavior sharedBehaviors];
  [v15 smallTranscriptSpace];
  double v17 = v16;

  [(CKOrganicImageLayoutGroupProvider *)self _setLayoutRecipesForChatItems:v8];
  double v19 = v18;
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  *(double *)&v74[3] = v17;
  uint64_t v70 = 0;
  v71 = (double *)&v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke;
  v65[3] = &unk_1E562C350;
  v67 = v74;
  uint64_t v69 = v13;
  id v21 = v20;
  id v66 = v21;
  v68 = &v70;
  [v8 enumerateObjectsUsingBlock:v65];
  unint64_t v22 = 0;
  char v23 = 0;
  double v24 = v17 + v19;
  double v25 = (v17 + v19) * 0.5;
  while ([v21 count] > v22)
  {
    v26 = [v8 objectAtIndex:v22];
    v27 = v26;
    if (v22)
    {
      BOOL v28 = 0;
    }
    else
    {
      v29 = [v26 tapbacksChatItem];
      BOOL v28 = v29 != 0;
    }
    v30 = [v21 objectAtIndex:v22];
    [v30 CGRectValue];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v76.origin.x = v32;
    v76.origin.y = v34;
    v76.size.width = v36;
    v76.size.height = v38;
    v39 = [NSNumber numberWithDouble:v25 - CGRectGetMinY(v76)];
    v40 = [v27 layoutRecipe];
    [v40 setRelativeGroupCenter:v39];

    v41 = [NSNumber numberWithDouble:v71[3]];
    v42 = [v27 layoutRecipe];
    [v42 setGroupMaxX:v41];

    v43 = [v8 lastObject];
    v44 = [v27 layoutRecipe];
    [v44 setIsLastItem:v27 == v43];
    v23 |= v28;

    ++v22;
  }
  v45 = [MEMORY[0x1E4F42608] absoluteDimension:v24];
  v46 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v14 heightDimension:v45];
  v47 = (void *)MEMORY[0x1E4F42618];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke_2;
  v62[3] = &unk_1E562C3A0;
  id v48 = v8;
  id v63 = v48;
  id v49 = v21;
  id v64 = v49;
  v50 = [v47 customGroupWithLayoutSize:v46 itemProvider:v62];
  v51 = (void *)MEMORY[0x1E4F42640];
  v52 = +[CKUIBehavior sharedBehaviors];
  [v52 mediumTranscriptSpace];
  v53 = objc_msgSend(v51, "fixedSpacing:");

  v54 = (void *)MEMORY[0x1E4F42640];
  v55 = +[CKUIBehavior sharedBehaviors];
  [v55 largeTranscriptSpace];
  v56 = objc_msgSend(v54, "fixedSpacing:");

  if (v23) {
    v57 = v56;
  }
  else {
    v57 = v53;
  }
  v58 = [MEMORY[0x1E4F42610] spacingForLeading:0 top:v57 trailing:0 bottom:v53];
  [v50 setEdgeSpacing:v58];

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(v74, 8);

  return v50;
}

id __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke_3;
  v6[3] = &unk_1E562C378;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __91__CKOrganicImageLayoutGroupProvider_layoutGroupForDatasourceItems_environment_layoutItems___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 CGRectValue];
  objc_msgSend(MEMORY[0x1E4F42620], "customItemWithFrame:zIndex:", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v5];
}

- (double)_setLayoutRecipesForChatItems:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2 && (unint64_t)objc_msgSend(v4, "count") < 4)
  {
    uint64_t v7 = [v4 count];
    id v63 = [(CKOrganicImageLayoutGroupProvider *)self _startOffsetSpecForCount:v7];
    uint64_t v62 = [NSString stringGUID];
    v67 = [v4 firstObject];
    id v66 = [v4 objectAtIndex:1];
    if ([v4 count] == 3)
    {
      v65 = [v4 objectAtIndex:2];
    }
    else
    {
      v65 = 0;
    }
    [(CKOrganicImageLayoutGroupProvider *)self _targetSizeForChatItem:v67 totalItemCount:v7];
    double v9 = v8;
    double v61 = v10;
    unint64_t v11 = -[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:");
    [(CKOrganicImageLayoutGroupProvider *)self _targetSizeForChatItem:v66 totalItemCount:v7];
    double v13 = v12;
    double v15 = v14;
    unint64_t v16 = -[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:");
    id v64 = [(CKOrganicImageLayoutGroupProvider *)self _startRotationSpec];
    double v17 = [v64 objectAtIndexedSubscript:v11];
    double v18 = [v17 objectAtIndexedSubscript:v16];
    int v19 = [v18 BOOLValue];

    v20 = [v4 firstObject];
    LODWORD(v18) = [v20 isFromMe];

    uint64_t v21 = v19 ^ v18;
    [(CKOrganicImageLayoutGroupProvider *)self _rotationForChatItem:v67 leftRotated:v21];
    double v23 = v22;
    [(CKOrganicImageLayoutGroupProvider *)self _rotationForChatItem:v66 leftRotated:v21 ^ 1];
    double v25 = v24;
    v26 = [(CKOrganicImageLayoutGroupProvider *)self _intersectSpecForIndex:0 count:v7];
    v27 = [v26 objectAtIndexedSubscript:v11];
    BOOL v28 = [v27 objectAtIndexedSubscript:v16];
    [v28 CGSizeValue];
    double v60 = v29;
    double v31 = v30;

    CGFloat v32 = [v63 objectAtIndexedSubscript:v11];
    double v33 = [v32 objectAtIndexedSubscript:v16];
    int v34 = [v33 BOOLValue];

    if (v34)
    {
      double v35 = v13 - v13 * v60;
      double v36 = 0.0;
    }
    else
    {
      double v36 = v61 - v61 * v60;
      double v35 = 0.0;
      if (v65)
      {
        if (!v11)
        {
          [v65 size];
          if (-[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:") == 1) {
            double v35 = v36 + v36 * -0.949999988;
          }
        }
      }
    }
    double v37 = v9 * v31;
    CGFloat v38 = -[CKOrganicImageLayoutRecipe initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:]([CKOrganicImageLayoutRecipe alloc], "initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:", 1, v62, v23, v35, v61, v9, 0.0);
    [v67 setLayoutRecipe:v38];
    v39 = -[CKOrganicImageLayoutRecipe initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:]([CKOrganicImageLayoutRecipe alloc], "initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:", 1, v62, v25, v36, v13, v15, v37);
    [v66 setLayoutRecipe:v39];
    double v5 = v9 + v15 - v37;
    v40 = v65;
    if (v65)
    {
      [(CKOrganicImageLayoutGroupProvider *)self _targetSizeForChatItem:v65 totalItemCount:v7];
      double v42 = v41;
      double v44 = v43;
      [(CKOrganicImageLayoutGroupProvider *)self _rotationForChatItem:v65 leftRotated:v21];
      double v46 = v45;
      unint64_t v47 = -[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:", v42, v44);
      id v48 = [(CKOrganicImageLayoutGroupProvider *)self _intersectSpecForIndex:1 count:v7];

      id v49 = [v48 objectAtIndexedSubscript:v16];
      v50 = [v49 objectAtIndexedSubscript:v47];
      [v50 CGSizeValue];
      double v52 = v51;
      double v54 = v53;

      if (v34)
      {
        double v55 = v13 - v13 * v52;
        v56 = (void *)v62;
      }
      else
      {
        double v55 = 0.0;
        v56 = (void *)v62;
        if (!v47) {
          double v55 = v42 - v42 * v52 - (v61 - v61 * v60);
        }
      }
      double v57 = v15 * v54;
      v58 = -[CKOrganicImageLayoutRecipe initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:]([CKOrganicImageLayoutRecipe alloc], "initWithRotation:offset:targetSize:overlap:wantsShadow:groupIdentifier:", 1, v56, v46, v55, v42, v44, v57);
      v40 = v65;
      [v65 setLayoutRecipe:v58];
      double v5 = v5 + v44 - v57;
    }
    else
    {
      id v48 = v26;
      v56 = (void *)v62;
    }
  }
  else
  {
    double v5 = 0.0;
    if (IMOSLoggingEnabled())
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v69 = "-[CKOrganicImageLayoutGroupProvider _setLayoutRecipesForChatItems:]";
        __int16 v70 = 2048;
        uint64_t v71 = [v4 count];
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%s asked to generate layout with %lu items, unsupported!", buf, 0x16u);
      }
    }
  }

  return v5;
}

- (id)_startRotationSpec
{
  return &unk_1EDF15E00;
}

- (id)_startOffsetSpecForCount:(unint64_t)a3
{
  id v3 = &unk_1EDF15E90;
  if (a3 != 3) {
    id v3 = 0;
  }
  if (a3 == 2) {
    return &unk_1EDF15E48;
  }
  else {
    return v3;
  }
}

- (id)_intersectSpecForIndex:(unint64_t)a3 count:(unint64_t)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  if (a4 == 3)
  {
    if (a3 == 1)
    {
      long long v16 = xmmword_18F81DC60;
      id v4 = [MEMORY[0x1E4F29238] valueWithBytes:&v16 objCType:"{CGSize=dd}"];
      v26[0] = v4;
      long long v15 = xmmword_18F81DC70;
      double v5 = [MEMORY[0x1E4F29238] valueWithBytes:&v15 objCType:"{CGSize=dd}"];
      v26[1] = v5;
      double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      v27[0] = v6;
      long long v14 = xmmword_18F81DC80;
      uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v14 objCType:"{CGSize=dd}"];
      v25[0] = v7;
      long long v13 = xmmword_18F81DC90;
      double v8 = [MEMORY[0x1E4F29238] valueWithBytes:&v13 objCType:"{CGSize=dd}"];
      v25[1] = v8;
      double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      v27[1] = v9;
      double v10 = v27;
      goto LABEL_9;
    }
    if (!a3)
    {
      long long v20 = xmmword_18F81DC60;
      id v4 = [MEMORY[0x1E4F29238] valueWithBytes:&v20 objCType:"{CGSize=dd}"];
      v29[0] = v4;
      long long v19 = xmmword_18F81DCA0;
      double v5 = [MEMORY[0x1E4F29238] valueWithBytes:&v19 objCType:"{CGSize=dd}"];
      v29[1] = v5;
      double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      v30[0] = v6;
      long long v18 = xmmword_18F81DC80;
      uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v18 objCType:"{CGSize=dd}"];
      v28[0] = v7;
      long long v17 = xmmword_18F81DCB0;
      double v8 = [MEMORY[0x1E4F29238] valueWithBytes:&v17 objCType:"{CGSize=dd}"];
      v28[1] = v8;
      double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      v30[1] = v9;
      double v10 = v30;
      goto LABEL_9;
    }
LABEL_7:
    unint64_t v11 = 0;
    goto LABEL_10;
  }
  if (a4 != 2) {
    goto LABEL_7;
  }
  long long v24 = xmmword_18F81DCC0;
  id v4 = [MEMORY[0x1E4F29238] valueWithBytes:&v24 objCType:"{CGSize=dd}"];
  v32[0] = v4;
  long long v23 = xmmword_18F81DCA0;
  double v5 = [MEMORY[0x1E4F29238] valueWithBytes:&v23 objCType:"{CGSize=dd}"];
  v32[1] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v33[0] = v6;
  long long v22 = xmmword_18F81DC80;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v22 objCType:"{CGSize=dd}"];
  v31[0] = v7;
  long long v21 = xmmword_18F81DCB0;
  double v8 = [MEMORY[0x1E4F29238] valueWithBytes:&v21 objCType:"{CGSize=dd}"];
  v31[1] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v33[1] = v9;
  double v10 = v33;
LABEL_9:
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

LABEL_10:

  return v11;
}

- (CGSize)_targetSizeForChatItem:(id)a3 totalItemCount:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 size];
  double v9 = v8;
  double v10 = v7;
  if (v8 <= 0.0
    || v7 <= 0.0
    || (+[CKUIBehavior sharedBehaviors],
        unint64_t v11 = objc_claimAutoreleasedReturnValue(),
        [v11 previewMaxWidth],
        double v13 = v12,
        v11,
        v9 > v13))
  {
    if (IMOSLoggingEnabled())
    {
      long long v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        [v6 size];
        long long v15 = NSStringFromCGSize(v31);
        int v24 = 136315650;
        double v25 = "-[CKOrganicImageLayoutGroupProvider _targetSizeForChatItem:totalItemCount:]";
        __int16 v26 = 2112;
        v27 = v15;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "CKOrganicImageLayoutGroupProvider - %s - Got invalid chatItem size %@ for chatItem %@", (uint8_t *)&v24, 0x20u);
      }
    }
    long long v16 = +[CKUIBehavior sharedBehaviors];
    long long v17 = +[CKUIBehavior sharedBehaviors];
    [v17 previewMaxWidth];
    objc_msgSend(v16, "thumbnailFillSizeForWidth:imageSize:");
    double v9 = v18;
    double v10 = v19;
  }
  unint64_t v20 = -[CKOrganicImageLayoutGroupProvider _orientationForChatItemSize:](self, "_orientationForChatItemSize:", v9, v10);
  if (a4 == 3 || (double v21 = 1.0, a4 == 2))
  {
    if (v20) {
      double v21 = 0.75;
    }
    else {
      double v21 = 0.6;
    }
  }

  double v22 = v9 * v21;
  double v23 = v10 * v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (double)_rotationForChatItem:(id)a3 leftRotated:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = [a3 IMChatItem];
  id v6 = [v5 guid];

  char v7 = [v6 hash];
  double v8 = 1.0;
  if (v4) {
    double v8 = -1.0;
  }
  if (v7) {
    double v9 = v8 * 0.5;
  }
  else {
    double v9 = v8;
  }

  return v9;
}

- (unint64_t)_orientationForChatItemSize:(CGSize)a3
{
  return a3.width > a3.height;
}

- (double)scalarForSize:(CGSize)a3 count:(unint64_t)a4
{
  if (a4 == 2 || (double v4 = 0.0, a4 == 3))
  {
    if (a3.width <= a3.height) {
      return 0.6;
    }
    else {
      return 0.75;
    }
  }
  return v4;
}

@end