@interface WFContentItem(ShareableObjects)
- (void)getShareableObjectOfTypes:()ShareableObjects options:completionHandler:;
@end

@implementation WFContentItem(ShareableObjects)

- (void)getShareableObjectOfTypes:()ShareableObjects options:completionHandler:
{
  id v8 = a5;
  if (a4)
  {
    Class v9 = NSClassFromString(&cfstr_Uiimage.isa);
    if (v9)
    {
      v10 = v9;
      if (([(objc_class *)v9 conformsToProtocol:&unk_26F0C51E8] & 1) == 0) {
        class_addProtocol(v10, (Protocol *)&unk_26F0C51E8);
      }
    }
  }
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __87__WFContentItem_ShareableObjects__getShareableObjectOfTypes_options_completionHandler___block_invoke;
      v17[3] = &unk_264E57068;
      id v18 = v8;
      [a1 getObjectRepresentation:v17 forClass:objc_opt_class()];
      v11 = v18;
LABEL_16:

      goto LABEL_22;
    }
  }
  if (a3 & 2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v12 = [a1 URL];
    (*((void (**)(id, void *, void))v8 + 2))(v8, v12, 0);
  }
  else
  {
    if (a3 & 4) != 0 && (a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([a1 asset],
            v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v13 mediaType],
            v13,
            v14 == 1))
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __87__WFContentItem_ShareableObjects__getShareableObjectOfTypes_options_completionHandler___block_invoke_2;
        v15[3] = &unk_264E5E670;
        id v16 = v8;
        [a1 getObjectRepresentation:v15 forClass:objc_opt_class()];
        v11 = v16;
        goto LABEL_16;
      }
    }
    if ((a3 & 8) != 0) {
      [a1 getFileRepresentation:v8 forType:0];
    }
    else {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
LABEL_22:
}

@end