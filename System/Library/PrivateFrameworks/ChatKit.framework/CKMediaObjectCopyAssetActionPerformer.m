@interface CKMediaObjectCopyAssetActionPerformer
+ (BOOL)canPerformOnImplicitSelection;
+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (void)performUserInteractionTask;
@end

@implementation CKMediaObjectCopyAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3 selectionSnapshot:(id)a4
{
  return 1;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 1;
}

- (void)performUserInteractionTask
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CKMediaObjectAssetActionPerformer *)self chatItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(CKMediaObjectAssetActionPerformer *)self chatItem];
    v6 = [v5 mediaObject];

    if (v6)
    {
      v7 = [MEMORY[0x1E4F42C50] generalPasteboard];
      v8 = [v5 mediaObject];
      v9 = [v8 pasteboardItemProvider];
      v11[0] = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v7 setItemProviders:v10];
    }
  }
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  v4 = CKFrameworkBundle();
  v5 = [v4 localizedStringForKey:@"COPY" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v5;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return @"doc.on.doc";
}

@end