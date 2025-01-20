@interface HKClinicalBulletedListLayoutManager
@end

@implementation HKClinicalBulletedListLayoutManager

void __72___HKClinicalBulletedListLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, uint64_t a10, uint64_t a11)
{
  uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "characterIndexForGlyphAtIndex:");
  v22 = [*(id *)(a1 + 40) attribute:@"_IsBulletedAttributeName" atIndex:v21 effectiveRange:0];
  objc_opt_class();
  HKSafeObject();
  id v31 = (id)objc_claimAutoreleasedReturnValue();

  if ([v31 BOOLValue])
  {
    if (!a11) {
      goto LABEL_4;
    }
    uint64_t v23 = v21 - 1;
    v24 = [*(id *)(a1 + 40) string];
    v25 = objc_msgSend(v24, "substringWithRange:", v23, 1);
    int v26 = [v25 isEqualToString:@"\n"];

    if (v26)
    {
LABEL_4:
      v33.origin.x = a6;
      v33.origin.y = a7;
      v33.size.width = a8;
      v33.size.height = a9;
      double v27 = CGRectGetMidY(v33) + *(double *)(*(void *)(a1 + 32) + 272) * -0.5;
      if (*(void *)(a1 + 48) == 1)
      {
        v34.origin.x = a2;
        v34.origin.y = a3;
        v34.size.width = a4;
        v34.size.height = a5;
        double v28 = CGRectGetMaxX(v34) - *(double *)(*(void *)(a1 + 32) + 264);
      }
      else
      {
        double v28 = *MEMORY[0x1E4F1DAD8];
      }
      v29 = [MEMORY[0x1E4FB1618] labelColor];
      [v29 set];

      v30 = [*(id *)(a1 + 32) bullet];
      objc_msgSend(v30, "drawAtPoint:", v28, v27);
    }
  }
}

@end