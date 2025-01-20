@interface HULinkedApplicationStoreItem
- (AMSLookupItem)storeItem;
- (HULinkedApplicationStoreItem)init;
- (HULinkedApplicationStoreItem)initWithStoreItem:(id)a3;
- (HULinkedApplicationStoreItem)initWithStoreItem:(id)a3 associatedAccessories:(id)a4;
- (id)_imageForSize:(CGSize)a3 fromArtwork:(id)a4;
- (id)_loadStoreIconWithArtwork:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HULinkedApplicationStoreItem

- (HULinkedApplicationStoreItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithStoreItem_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULinkedApplicationItem.m", 222, @"%s is unavailable; use %@ instead",
    "-[HULinkedApplicationStoreItem init]",
    v5);

  return 0;
}

- (HULinkedApplicationStoreItem)initWithStoreItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HULinkedApplicationStoreItem;
  v6 = [(HULinkedApplicationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeItem, a3);
  }

  return v7;
}

- (HULinkedApplicationStoreItem)initWithStoreItem:(id)a3 associatedAccessories:(id)a4
{
  id v6 = a4;
  v7 = [(HULinkedApplicationStoreItem *)self initWithStoreItem:a3];
  v8 = v7;
  if (v7) {
    [(HULinkedApplicationItem *)v7 setAssociatedAccessories:v6];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HULinkedApplicationStoreItem *)self storeItem];
  id v6 = [(HULinkedApplicationItem *)self associatedAccessories];
  v7 = (void *)[v4 initWithStoreItem:v5 associatedAccessories:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (id)bundleIdentifier
{
  v2 = [(HULinkedApplicationStoreItem *)self storeItem];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HULinkedApplicationStoreItem;
  id v5 = [(HULinkedApplicationItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6385350;
  objc_copyWeak(&v9, &location);
  id v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

id __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v34 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained storeItem];
  id v5 = [v4 itemKind];
  int v6 = [v5 isEqualToString:@"iosSoftware"];

  if (v6)
  {
    v7 = [WeakRetained storeItem];
    uint64_t v32 = [v7 bundleIdentifier];

    v8 = [WeakRetained storeItem];
    id v9 = [v8 displayName];

    objc_super v10 = [WeakRetained storeItem];
    v11 = [v10 artistName];

    v12 = NSNumber;
    v13 = [WeakRetained storeItem];
    [v13 userRating];
    v14 = objc_msgSend(v12, "numberWithFloat:");

    v15 = [WeakRetained storeItem];
    v16 = [v15 offers];

    if ([v16 count])
    {
      v17 = [v16 firstObject];
      v18 = [v17 price];
      [v18 floatValue];
      float v20 = v19;

      if (v20 == 0.0) {
        _HULocalizedStringWithDefaultValue(@"HULinkedApplicationPriceFree", @"HULinkedApplicationPriceFree", 1);
      }
      else {
      v21 = [v17 formattedPrice];
      }
      v25 = v34;
    }
    else
    {
      v21 = 0;
      v25 = v34;
    }
    v26 = objc_msgSend(WeakRetained, "storeItem", v32);
    v22 = [v26 productPageURL];

    v27 = [WeakRetained storeItem];
    v23 = [v27 artwork];

    v24 = v33;
    if (v9 && v11 && v14 && v21 && v22 && v33)
    {
      v28 = [WeakRetained _loadStoreIconWithArtwork:v23];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke_2;
      v36[3] = &unk_1E638E4F8;
      id v37 = v25;
      id v38 = v22;
      id v39 = v9;
      id v40 = v11;
      id v41 = v14;
      id v42 = v21;
      v29 = [v28 flatMap:v36];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke_3;
      v35[3] = &unk_1E6387340;
      v35[4] = WeakRetained;
      v30 = [v29 recover:v35];

      v25 = v34;
      v24 = v33;
      goto LABEL_17;
    }
  }
  else
  {
    id v9 = 0;
    v11 = 0;
    v14 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = v34;
  }
  v30 = [WeakRetained _failedUpdateOutcome];
LABEL_17:

  return v30;
}

id __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke_2(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = (void *)[v3 mutableCopy];
  [v5 setObject:a1[5] forKeyedSubscript:@"HFResultApplicationStoreURL"];
  [v5 setObject:a1[6] forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v5 setObject:a1[7] forKeyedSubscript:@"HFResultApplicationPublisher"];
  [v5 setObject:a1[8] forKeyedSubscript:@"HFResultApplicationAverageRating"];
  [v5 setObject:a1[9] forKeyedSubscript:@"HFResultApplicationPrice"];
  [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"HFResultApplicationIsInstalled"];
  [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F689F8]];

  int v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v6;
}

uint64_t __60__HULinkedApplicationStoreItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _failedUpdateOutcome];
}

- (id)_loadStoreIconWithArtwork:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F42D90];
  id v5 = a3;
  int v6 = [v4 mainScreen];
  [v6 scale];
  double v8 = v7;

  int v9 = [(HULinkedApplicationItem *)self _iconVariantForScale:v8];
  objc_super v10 = -[HULinkedApplicationStoreItem _imageForSize:fromArtwork:](self, "_imageForSize:fromArtwork:", v5, 60.0, 60.0);

  v11 = [v10 URLWithHeight:(uint64_t)(v8 * 60.0) width:(uint64_t)(v8 * 60.0) cropStyle:*MEMORY[0x1E4F4DA78] format:*MEMORY[0x1E4F4DA80]];
  v12 = v11;
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__HULinkedApplicationStoreItem__loadStoreIconWithArtwork___block_invoke;
    aBlock[3] = &unk_1E638E520;
    id v23 = v11;
    double v24 = v8;
    int v25 = v9;
    v13 = _Block_copy(aBlock);
    v14 = (void *)MEMORY[0x1E4F7A0D8];
    v15 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
    v16 = [v14 lazyFutureWithBlock:v13 scheduler:v15];
    v17 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
    v18 = [v16 reschedule:v17];
  }
  else
  {
    float v19 = (void *)MEMORY[0x1E4F7A0D8];
    float v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1008 userInfo:0];
    v18 = [v19 futureWithError:v20];
  }

  return v18;
}

void __58__HULinkedApplicationStoreItem__loadStoreIconWithArtwork___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = 0;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v14];
  id v6 = v14;
  double v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    id v9 = (id) [objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v5 scale:*(double *)(a1 + 40)];
    [v9 CGImage];
    uint64_t v10 = LICreateIconForImage();
    v11 = v9;
    if (v10)
    {
      v12 = (const void *)v10;
      v11 = [MEMORY[0x1E4F42A80] imageWithCGImage:v10 scale:0 orientation:*(double *)(a1 + 40)];

      CFRelease(v12);
    }
    if (v11)
    {
      [v3 finishWithResult:v11];
    }
    else
    {
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1008 userInfo:0];
      [v3 finishWithError:v13];
    }
  }
  else
  {
    [v3 finishWithError:v6];
  }
}

- (id)_imageForSize:(CGSize)a3 fromArtwork:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    double v11 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      uint64_t v13 = 0;
      double v14 = v10;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v6);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        objc_msgSend(v15, "width", (void)v26);
        double v17 = v16;
        [v15 height];
        if (v17 == width && v18 == height)
        {
          id v24 = v15;

          goto LABEL_36;
        }
        double v10 = v18;
        if (!v9) {
          goto LABEL_29;
        }
        if (v14 >= height) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = -1;
        }
        if (v18 <= v14) {
          uint64_t v20 = 0;
        }
        if (v18 < height) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = -1;
        }
        if (v18 < v14) {
          uint64_t v20 = v21;
        }
        if (v17 >= v11) {
          BOOL v22 = v17 > v11 && v11 < width;
        }
        else {
          BOOL v22 = v17 >= width;
        }
        if (v20 == -1 || v22)
        {
LABEL_29:
          id v23 = v15;

          id v9 = v23;
          double v11 = v17;
          double v14 = v10;
        }
        else
        {
          double v10 = v14;
        }
        ++v13;
      }
      while (v8 != v13);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
  }

  id v9 = v9;
  id v24 = v9;
LABEL_36:

  return v24;
}

- (AMSLookupItem)storeItem
{
  return self->_storeItem;
}

- (void).cxx_destruct
{
}

@end