@interface LPLinkSnapshotGeneratorService
- (void)snapshotForMetadata:(id)a3 configurations:(id)a4 completionHandler:(id)a5;
@end

@implementation LPLinkSnapshotGeneratorService

- (void)snapshotForMetadata:(id)a3 configurations:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__LPLinkSnapshotGeneratorService_snapshotForMetadata_configurations_completionHandler___block_invoke;
  block[3] = &unk_1E5B05308;
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__LPLinkSnapshotGeneratorService_snapshotForMetadata_configurations_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1A624BAC0]();
  uint64_t v35 = a1;
  v2 = [[LPLinkView alloc] initWithMetadata:*(void *)(a1 + 32)];
  [(LPLinkView *)v2 _setUseLowMemoryImageFilters:1];
  [(LPLinkView *)v2 _setDisableAutoPlay:1];
  [(LPLinkView *)v2 _setAllowsAsynchronousImageDecoding:0];
  [(LPLinkView *)v2 _setUseCPURenderingForMaterials:1];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(v35 + 40), "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = *(id *)(v35 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v37;
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
        id v11 = objc_alloc_init(MEMORY[0x1E4FB1F48]);
        id v12 = objc_msgSend(v10, "traitCollection", context);
        objc_msgSend(v11, "setOverrideUserInterfaceStyle:", objc_msgSend(v12, "userInterfaceStyle"));

        [v11 addSubview:v2];
        -[LPLinkView _setPreferredSizeClass:](v2, "_setPreferredSizeClass:", [v10 preferredSizeClass]);
        v13 = [v10 sizeClassParameters];
        [(LPLinkView *)v2 _setSizeClassParameters:v13];

        [v10 size];
        if (v15 == v7 && v14 == v8)
        {
          [v10 maximumSize];
          double v17 = v16;
          [v10 maximumSize];
          -[LPLinkView sizeThatFits:](v2, "sizeThatFits:");
        }
        else
        {
          [v10 size];
          double v17 = v19;
          [v10 size];
        }
        -[LPLinkView setFrame:](v2, "setFrame:", 0.0, 0.0, v17, v18);
        [(LPLinkView *)v2 _effectiveCornerRadius];
        double v21 = v20;
        v22 = [(LPLinkView *)v2 layer];
        [v22 setCornerRadius:v21];

        [(LPLinkView *)v2 layoutIfNeeded];
        [(LPLinkView *)v2 bounds];
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        [v10 scale];
        CGFloat v28 = v27;
        v42.width = v24;
        v42.height = v26;
        UIGraphicsBeginImageContextWithOptions(v42, 0, v28);
        v29 = [(LPLinkView *)v2 layer];
        [v29 renderInContext:UIGraphicsGetCurrentContext()];

        if ([v10 showDebugIndicators])
        {
          CurrentContext = UIGraphicsGetCurrentContext();
          CGContextSetRGBFillColor(CurrentContext, 0.0, 0.0, 1.0, 0.2);
          v31 = UIGraphicsGetCurrentContext();
          [(LPLinkView *)v2 bounds];
          CGContextFillRect(v31, v43);
        }
        UIGraphicsGetImageFromCurrentImageContext();
        v32 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v33 = UIImagePNGRepresentation(v32);
        [v3 addObject:v33];

        UIGraphicsEndImageContext();
        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(v35 + 48) + 16))();
}

@end