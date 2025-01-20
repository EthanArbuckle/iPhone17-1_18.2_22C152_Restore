@interface MRUTransportControls
- (BOOL)isEqual:(id)a3;
- (MRUTransportControlItem)centerItem;
- (MRUTransportControlItem)leadingItem;
- (MRUTransportControlItem)leftItem;
- (MRUTransportControlItem)rightItem;
- (MRUTransportControls)init;
- (MRUTransportControls)initWithMPCResponse:(id)a3;
- (id)centerItemFromResponse:(id)a3;
- (id)description;
- (id)leadingItemFromResponse:(id)a3;
- (id)leftItemFromResponse:(id)a3;
- (id)rightItemFromResponse:(id)a3;
@end

@implementation MRUTransportControls

- (MRUTransportControls)initWithMPCResponse:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRUTransportControls;
  v5 = [(MRUTransportControls *)&v16 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(MRUTransportControls *)v5 leadingItemFromResponse:v4];
    leadingItem = v6->_leadingItem;
    v6->_leadingItem = (MRUTransportControlItem *)v7;

    uint64_t v9 = [(MRUTransportControls *)v6 leftItemFromResponse:v4];
    leftItem = v6->_leftItem;
    v6->_leftItem = (MRUTransportControlItem *)v9;

    uint64_t v11 = [(MRUTransportControls *)v6 centerItemFromResponse:v4];
    centerItem = v6->_centerItem;
    v6->_centerItem = (MRUTransportControlItem *)v11;

    uint64_t v13 = [(MRUTransportControls *)v6 rightItemFromResponse:v4];
    rightItem = v6->_rightItem;
    v6->_rightItem = (MRUTransportControlItem *)v13;
  }
  return v6;
}

- (MRUTransportControls)init
{
  return [(MRUTransportControls *)self initWithMPCResponse:0];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"leading %@ | %@ left: %@ | center: %@ | right: %@", objc_opt_class(), self->_leadingItem, self->_leftItem, self->_centerItem, self->_rightItem];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRUTransportControls *)a3;
  if (self == v4)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MRUTransportControls *)v5 leftItem];
      int v7 = [v6 isEqual:self->_leftItem];

      v8 = [(MRUTransportControls *)v5 centerItem];
      int v9 = v7 & [v8 isEqual:self->_centerItem];

      v10 = [(MRUTransportControls *)v5 rightItem];
      int v11 = [v10 isEqual:self->_rightItem];

      v12 = [(MRUTransportControls *)v5 leadingItem];

      int v13 = v9 & v11 & [v12 isEqual:self->_leadingItem];
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (id)leadingItemFromResponse:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = [v3 tracklist];
    v5 = [v4 playingItem];

    v6 = [v5 likeCommand];
    if (v6)
    {
      int v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      int v9 = [v6 value];
      v10 = +[MRUAssetsProvider favoritePackageName];
      if (v9) {
        int v11 = @"On";
      }
      else {
        int v11 = @"Off";
      }
      if (v9) {
        v12 = @".On";
      }
      else {
        v12 = @".Off";
      }
      int v13 = +[MRUCAPackageAsset packageNamed:v10 glyphState:v11];

      v14 = +[MRUAssetsProvider favoriteSymbol];
      v15 = +[MRUAsset packageAsset:v13 symbolName:v14 image:0];

      [v15 setAccessibilityIdentifier:@"favorite"];
      objc_super v16 = [v6 changeValue:v9 ^ 1u];
      v17 = [@"favorite" stringByAppendingString:v12];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__MRUTransportControls_leadingItemFromResponse___block_invoke;
      aBlock[3] = &unk_1E5F0DC48;
      id v25 = v16;
      id v26 = v8;
      id v27 = v17;
      id v18 = v17;
      id v19 = v8;
      id v20 = v16;
      v21 = _Block_copy(aBlock);
      v22 = [[MRUTransportControlItem alloc] initWithIdentifier:v18 asset:v15 mainAction:v21 holdBeganAction:0 holdEndAction:0];
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __48__MRUTransportControls_leadingItemFromResponse___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F76E88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MRUTransportControls_leadingItemFromResponse___block_invoke_2;
  v4[3] = &unk_1E5F0E338;
  id v3 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v2 performRequest:v3 completion:v4];
}

void __48__MRUTransportControls_leadingItemFromResponse___block_invoke_2(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

- (id)leftItemFromResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 tracklist];
  uint64_t v5 = [v4 playingItem];

  uint64_t v6 = [v3 tracklist];

  uint64_t v7 = [v6 changeItemCommand];
  int v8 = [v7 previousItem];

  uint64_t v9 = (objc_class *)objc_opt_class();
  v51 = NSStringFromClass(v9);
  __int16 v10 = +[MRUAssetsProvider forwardBackwardPackageName];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v64.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v64.m33 = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v64.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v64.m43 = v12;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v64.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v64.m13 = v13;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v64.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v64.m23 = v14;
  CATransform3DRotate(&v65, &v64, 3.14159265, 0.0, 0.0, 1.0);
  uint64_t v15 = +[MRUCAPackageAsset packageNamed:v10 glyphState:0 permanentTransform:&v65];

  uint64_t v16 = +[MRUAssetsProvider backwardSymbol];
  v17 = +[MRUAsset packageAsset:v15 symbolName:v16 image:0];

  [v17 setAccessibilityIdentifier:@"backward"];
  id v18 = [v5 seekCommand];
  id v19 = [v18 preferredBackwardJumpIntervals];
  uint64_t v20 = [v19 count];

  v49 = (void *)v15;
  v50 = v5;
  if (!v20)
  {
    if (!v8)
    {
      id v33 = 0;
      v34 = 0;
      v35 = 0;
      id v26 = @"backward";
      v37 = v51;
      goto LABEL_10;
    }
    v38 = [v5 seekCommand];
    v39 = [v38 beginSeekWithDirection:-1];

    v40 = [v5 seekCommand];
    v41 = [v40 endSeek];

    v32 = 0;
    v31 = 0;
    if (v39 && v41)
    {
      v42 = [@"backward" stringByAppendingString:@".seek.began"];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke;
      aBlock[3] = &unk_1E5F0DC48;
      id v61 = v39;
      id v43 = v51;
      id v62 = v43;
      id v63 = v42;
      id v44 = v42;
      v31 = _Block_copy(aBlock);
      v45 = [@"backward" stringByAppendingString:@".seek.end"];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_38;
      v56[3] = &unk_1E5F0DC48;
      id v57 = v41;
      id v58 = v43;
      id v59 = v45;
      id v46 = v45;
      v32 = _Block_copy(v56);
    }
    id v26 = @"backward";
    v37 = v51;
    v36 = v8;
LABEL_9:
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_40;
    v52[3] = &unk_1E5F0DC48;
    id v33 = v36;
    id v53 = v33;
    id v54 = v37;
    id v26 = v26;
    v55 = v26;
    int v8 = _Block_copy(v52);

    v34 = v31;
    v35 = v32;
    goto LABEL_10;
  }
  v21 = [v5 seekCommand];
  v22 = [v21 preferredBackwardJumpIntervals];
  v23 = [v22 firstObject];
  [v23 doubleValue];
  double v25 = v24;

  objc_msgSend(@"backward", "stringByAppendingFormat:", @".jump: %f", *(void *)&v25);
  id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v27 = [v5 seekCommand];
  uint64_t v28 = [v27 jumpByInterval:v25];

  v29 = +[MRUAssetsProvider goBackwardSymbolForTimeInterval:v25];
  uint64_t v30 = +[MRUAsset symbolNamed:v29];

  v31 = 0;
  v32 = 0;
  id v33 = 0;
  v34 = 0;
  v35 = 0;
  int v8 = 0;
  v36 = (void *)v28;
  v17 = (void *)v30;
  v37 = v51;
  if (v28) {
    goto LABEL_9;
  }
LABEL_10:
  v47 = [[MRUTransportControlItem alloc] initWithIdentifier:v26 asset:v17 mainAction:v8 holdBeganAction:v34 holdEndAction:v35];

  return v47;
}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F76E88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_2;
  v4[3] = &unk_1E5F0E338;
  id v3 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v2 performRequest:v3 completion:v4];
}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_2(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_38(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F76E88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_2_39;
  v4[3] = &unk_1E5F0E338;
  id v3 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v2 performRequest:v3 completion:v4];
}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_2_39(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_40(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F76E88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MRUTransportControls_leftItemFromResponse___block_invoke_2_41;
  v4[3] = &unk_1E5F0E338;
  id v3 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v2 performRequest:v3 options:0x10000 completion:v4];
}

void __45__MRUTransportControls_leftItemFromResponse___block_invoke_2_41(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

- (id)centerItemFromResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 tracklist];
  uint64_t v5 = [v4 playingItem];

  uint64_t v6 = [v3 play];
  uint64_t v7 = [v3 pause];
  int v8 = [v3 stop];

  uint64_t v9 = (objc_class *)objc_opt_class();
  __int16 v10 = NSStringFromClass(v9);
  uint64_t v11 = +[MRUAssetsProvider playSymbol];
  if (v8)
  {
    if (v5)
    {
      [v5 duration];
      if ((_BYTE)v29)
      {
        uint64_t v12 = +[MRUAssetsProvider stopSymbol];
        uint64_t v13 = @"stop";
        __int16 v14 = v8;
LABEL_8:

        id v15 = v14;
        uint64_t v11 = (void *)v12;
        uint64_t v6 = v15;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v29 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
    }
  }
  if (v7)
  {
    uint64_t v12 = +[MRUAssetsProvider pauseSymbol];
    uint64_t v13 = @"pause";
    __int16 v14 = v7;
    goto LABEL_8;
  }
  uint64_t v13 = @"play";
LABEL_10:
  uint64_t v16 = +[MRUAssetsProvider playPauseStopPackageName];
  v17 = +[MRUCAPackageAsset packageNamed:v16 glyphState:v13];

  id v18 = +[MRUAsset packageAsset:v17 symbolName:v11 image:0];
  [v18 setAccessibilityIdentifier:v13];
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__MRUTransportControls_centerItemFromResponse___block_invoke;
    aBlock[3] = &unk_1E5F0DC48;
    id v23 = v6;
    id v24 = v10;
    double v25 = v13;
    id v19 = _Block_copy(aBlock);
  }
  else
  {
    id v19 = 0;
  }
  uint64_t v20 = [[MRUTransportControlItem alloc] initWithIdentifier:v13 asset:v18 mainAction:v19];

  return v20;
}

void __47__MRUTransportControls_centerItemFromResponse___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F76E88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__MRUTransportControls_centerItemFromResponse___block_invoke_2;
  v4[3] = &unk_1E5F0E338;
  id v3 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v2 performRequest:v3 options:0x10000 completion:v4];
}

void __47__MRUTransportControls_centerItemFromResponse___block_invoke_2(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

- (id)rightItemFromResponse:(id)a3
{
  id v3 = [a3 tracklist];
  id v4 = [v3 playingItem];
  uint64_t v5 = [v3 changeItemCommand];
  id v6 = [v5 nextItem];

  uint64_t v7 = (objc_class *)objc_opt_class();
  v47 = NSStringFromClass(v7);
  int v8 = +[MRUAssetsProvider forwardBackwardPackageName];
  uint64_t v9 = +[MRUCAPackageAsset packageNamed:v8 glyphState:0];

  __int16 v10 = +[MRUAssetsProvider forwardSymbol];
  uint64_t v11 = +[MRUAsset packageAsset:v9 symbolName:v10 image:0];

  [v11 setAccessibilityIdentifier:@"forward"];
  __int16 v12 = [v4 seekCommand];
  uint64_t v13 = [v12 preferredForwardJumpIntervals];
  uint64_t v14 = [v13 count];

  v45 = v4;
  id v46 = v3;
  id v44 = (void *)v9;
  if (!v14)
  {
    if (!v6)
    {
      long long v27 = 0;
      long long v28 = 0;
      uint64_t v29 = 0;
      uint64_t v20 = @"forward";
      v31 = v47;
      goto LABEL_10;
    }
    id v32 = v6;
    id v33 = [v4 seekCommand];
    v34 = [v33 beginSeekWithDirection:1];

    v35 = [v4 seekCommand];
    v36 = [v35 endSeek];

    long long v26 = 0;
    double v25 = 0;
    if (v34 && v36)
    {
      v37 = [@"forward" stringByAppendingString:@".seek.began"];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke;
      aBlock[3] = &unk_1E5F0DC48;
      id v57 = v34;
      id v38 = v47;
      id v58 = v38;
      id v59 = v37;
      id v39 = v37;
      double v25 = _Block_copy(aBlock);
      v40 = [@"forward" stringByAppendingString:@".seek.end"];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_54;
      v52[3] = &unk_1E5F0DC48;
      id v53 = v36;
      id v54 = v38;
      id v55 = v40;
      id v41 = v40;
      long long v26 = _Block_copy(v52);
    }
    uint64_t v20 = @"forward";
    v31 = v47;
    uint64_t v30 = v32;
LABEL_9:
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_56;
    v48[3] = &unk_1E5F0DC48;
    id v6 = v30;
    id v49 = v6;
    id v50 = v31;
    uint64_t v20 = v20;
    v51 = v20;
    uint64_t v29 = _Block_copy(v48);

    long long v27 = v25;
    long long v28 = v26;
    goto LABEL_10;
  }
  id v15 = [v4 seekCommand];
  uint64_t v16 = [v15 preferredForwardJumpIntervals];
  v17 = [v16 firstObject];
  [v17 doubleValue];
  double v19 = v18;

  objc_msgSend(@"forward", "stringByAppendingFormat:", @".jump: %f", *(void *)&v19);
  uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = [v4 seekCommand];
  uint64_t v22 = [v21 jumpByInterval:v19];

  id v23 = +[MRUAssetsProvider goForwardSymbolForTimeInterval:v19];
  uint64_t v24 = +[MRUAsset symbolNamed:v23];

  double v25 = 0;
  long long v26 = 0;
  id v6 = 0;
  long long v27 = 0;
  long long v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = (void *)v22;
  uint64_t v11 = (void *)v24;
  v31 = v47;
  if (v22) {
    goto LABEL_9;
  }
LABEL_10:
  v42 = [[MRUTransportControlItem alloc] initWithIdentifier:v20 asset:v11 mainAction:v29 holdBeganAction:v27 holdEndAction:v28];

  return v42;
}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F76E88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_2;
  v4[3] = &unk_1E5F0E338;
  id v3 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v2 performRequest:v3 completion:v4];
}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_2(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_54(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F76E88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_2_55;
  v4[3] = &unk_1E5F0E338;
  id v3 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v2 performRequest:v3 completion:v4];
}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_2_55(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_56(id *a1)
{
  v2 = (void *)MEMORY[0x1E4F76E88];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MRUTransportControls_rightItemFromResponse___block_invoke_2_57;
  v4[3] = &unk_1E5F0E338;
  id v3 = a1[4];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  [v2 performRequest:v3 options:0x10000 completion:v4];
}

void __46__MRUTransportControls_rightItemFromResponse___block_invoke_2_57(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MCLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    int v8 = 138544130;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ perform request: %{public}@ | %{public}@ | error %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

- (MRUTransportControlItem)leadingItem
{
  return self->_leadingItem;
}

- (MRUTransportControlItem)leftItem
{
  return self->_leftItem;
}

- (MRUTransportControlItem)centerItem
{
  return self->_centerItem;
}

- (MRUTransportControlItem)rightItem
{
  return self->_rightItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightItem, 0);
  objc_storeStrong((id *)&self->_centerItem, 0);
  objc_storeStrong((id *)&self->_leftItem, 0);

  objc_storeStrong((id *)&self->_leadingItem, 0);
}

@end