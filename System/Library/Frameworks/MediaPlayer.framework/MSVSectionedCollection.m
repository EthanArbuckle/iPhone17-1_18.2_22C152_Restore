@interface MSVSectionedCollection
@end

@implementation MSVSectionedCollection

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F28E60] indexSet];
  v5 = [MEMORY[0x1E4F28E60] indexSet];
  v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v81 = 0;
  uint64_t v8 = [*(id *)(a1 + 32) numberOfSections];
  uint64_t v9 = [*(id *)(a1 + 40) numberOfSections];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2;
  v79[3] = &unk_1E57EEB08;
  id v80 = *(id *)(a1 + 48);
  v10 = MPChangeDetailOperationGenerateEx(v8, v9, &v81, (char *)&v54, v79);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3;
  v73[3] = &unk_1E57EEB80;
  id v11 = v5;
  id v74 = v11;
  id v77 = *(id *)(a1 + 48);
  id v12 = v4;
  id v75 = v12;
  id v13 = v3;
  id v76 = v13;
  id v78 = *(id *)(a1 + 56);
  v14 = (void *)MEMORY[0x19971E0F0](v73);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5;
  v67[3] = &unk_1E57EEB80;
  id v15 = v7;
  id v68 = v15;
  id v71 = *(id *)(a1 + 48);
  id v16 = v6;
  id v69 = v16;
  id v72 = *(id *)(a1 + 56);
  id v17 = v13;
  id v70 = v17;
  v18 = (void (**)(void, void))MEMORY[0x19971E0F0](v67);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_7;
  v61[3] = &unk_1E57EEB80;
  id v19 = v12;
  v20 = v10;
  id v45 = v19;
  id v62 = v19;
  id v65 = *(id *)(a1 + 48);
  id v44 = v11;
  id v63 = v44;
  id v21 = v17;
  id v64 = v21;
  id v66 = *(id *)(a1 + 56);
  v49 = (void *)MEMORY[0x19971E0F0](v61);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_9;
  v55[3] = &unk_1E57EEB80;
  id v43 = v16;
  id v56 = v43;
  id v59 = *(id *)(a1 + 48);
  id v42 = v15;
  id v57 = v42;
  id v60 = *(id *)(a1 + 56);
  id v48 = v21;
  id v58 = v48;
  v22 = (void (**)(void, void))MEMORY[0x19971E0F0](v55);
  unint64_t v23 = v81;
  if (v81)
  {
    uint64_t v24 = 0;
    v47 = v14;
    unint64_t v25 = 0x1E4F28000uLL;
    v46 = v20;
    while (1)
    {
      unint64_t v26 = v20[v24];
      unint64_t v27 = v26 >> 62;
      if (v26 >> 62 == 1) {
        break;
      }
      if (v27 == 3)
      {
        id v28 = [*(id *)(v25 + 3416) indexPathWithIndex:v20[v24] & 0x7FFFFFFFLL];
        v29 = (void (*)(void))v14[2];
LABEL_8:
        v29();
LABEL_31:

        unint64_t v23 = v81;
        goto LABEL_32;
      }
      if (v27 == 2)
      {
        id v28 = [*(id *)(v25 + 3416) indexPathWithIndex:(v26 >> 31) & 0x7FFFFFFF];
        v29 = (void (*)(void))v49[2];
        goto LABEL_8;
      }
LABEL_32:
      if (++v24 >= v23) {
        goto LABEL_33;
      }
    }
    v30 = [*(id *)(v25 + 3416) indexPathWithIndex:(v26 >> 31) & 0x7FFFFFFF];
    v31 = [*(id *)(v25 + 3416) indexPathWithIndex:v26 & 0x7FFFFFFF];
    unint64_t v54 = 0;
    uint64_t v32 = [*(id *)(a1 + 32) numberOfItemsInSection:(v26 >> 31) & 0x7FFFFFFF];
    uint64_t v33 = [*(id *)(a1 + 40) numberOfItemsInSection:v26 & 0x7FFFFFFF];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_11;
    v50[3] = &unk_1E57EEBA8;
    id v53 = *(id *)(a1 + 48);
    id v28 = v30;
    id v51 = v28;
    id v34 = v31;
    id v52 = v34;
    v35 = MPChangeDetailOperationGenerateEx(v32, v33, &v54, v82, v50);
    unint64_t v36 = v54;
    if (!v54)
    {
LABEL_26:
      free(v35);
      if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))())
      {
        v20 = v46;
        v14 = v47;
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))()) {
          objc_msgSend(v48, "appendSectionUpdateForPreviousIndex:finalIndex:", objc_msgSend(v28, "section"), objc_msgSend(v34, "section"));
        }
      }
      else
      {
        ((void (*)(void *, id))v49[2])(v49, v28);
        v14 = v47;
        ((void (*)(void *, id))v47[2])(v47, v34);
        v20 = v46;
      }

      unint64_t v25 = 0x1E4F28000;
      goto LABEL_31;
    }
    uint64_t v37 = 0;
    while (1)
    {
      unint64_t v38 = *((void *)v35 + v37);
      unint64_t v39 = v38 >> 62;
      if (v38 >> 62 == 1)
      {
        v40 = [v28 indexPathByAddingIndex:(v38 >> 31) & 0x7FFFFFFF];
        v41 = [v34 indexPathByAddingIndex:v38 & 0x7FFFFFFF];
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
        {
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
          {
            if ([v40 isEqual:v41]) {
              [v48 appendItemUpdateForPreviousIndexPath:v40 finalIndexPath:v41];
            }
            else {
              [v48 appendItemMoveFromIndexPath:v40 toIndexPath:v41 updated:1];
            }
          }
        }
        else
        {
          ((void (**)(void, void *))v22)[2](v22, v40);
          ((void (**)(void, void *))v18)[2](v18, v41);
        }

        goto LABEL_24;
      }
      if (v39 == 3) {
        break;
      }
      if (v39 == 2)
      {
        v40 = [v28 indexPathByAddingIndex:(v38 >> 31) & 0x7FFFFFFF];
        ((void (**)(void, void *))v22)[2](v22, v40);
LABEL_24:

        unint64_t v36 = v54;
      }
      if (++v37 >= v36) {
        goto LABEL_26;
      }
    }
    v40 = [v34 indexPathByAddingIndex:*((void *)v35 + v37) & 0x7FFFFFFFLL];
    ((void (**)(void, void *))v18)[2](v18, v40);
    goto LABEL_24;
  }
LABEL_33:
  free(v20);
  [v48 setInsertedSections:v45];
  [v48 setDeletedSections:v44];
  [v48 setInsertedItemIndexPaths:v43];
  [v48 setDeletedItemIndexPaths:v42];
  if (*(unsigned char *)(a1 + 64)) {
    [v48 applyUIKitWorkarounds];
  }
}

uint64_t __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a2];
  v6 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  return v7;
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4;
  v11[3] = &unk_1E57EEB30;
  id v13 = *(id *)(a1 + 56);
  id v5 = v3;
  id v12 = v5;
  v14 = &v15;
  [v4 enumerateIndexesUsingBlock:v11];
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "section"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    v6 = *(void **)(a1 + 48);
    uint64_t v7 = v16[3];
    uint64_t v8 = [v5 section];
    uint64_t v9 = *(void *)(a1 + 64);
    v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v16[3]];
    objc_msgSend(v6, "appendSectionMoveFromIndex:toIndex:updated:", v7, v8, (*(uint64_t (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v5));
  }
  _Block_object_dispose(&v15, 8);
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5955;
  id v19 = __Block_byref_object_dispose__5956;
  id v20 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_6;
  v10 = &unk_1E57EEB58;
  id v12 = *(id *)(a1 + 56);
  id v5 = v3;
  id v11 = v5;
  id v13 = &v21;
  v14 = &v15;
  [v4 enumerateObjectsUsingBlock:&v7];
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7, v8, v9, v10);
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    if ([(id)v16[5] isEqual:v5])
    {
      if (v6) {
        [*(id *)(a1 + 48) appendItemUpdateForPreviousIndexPath:v16[5] finalIndexPath:v5];
      }
    }
    else
    {
      [*(id *)(a1 + 48) appendItemMoveFromIndexPath:v16[5] toIndexPath:v5 updated:v6];
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_8;
  v11[3] = &unk_1E57EEB30;
  id v13 = *(id *)(a1 + 56);
  id v5 = v3;
  id v12 = v5;
  v14 = &v15;
  [v4 enumerateIndexesUsingBlock:v11];
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "section"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = [v5 section];
    uint64_t v8 = v16[3];
    uint64_t v9 = *(void *)(a1 + 64);
    v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v8];
    objc_msgSend(v6, "appendSectionMoveFromIndex:toIndex:updated:", v7, v8, (*(uint64_t (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10));
  }
  _Block_object_dispose(&v15, 8);
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__5955;
  id v19 = __Block_byref_object_dispose__5956;
  id v20 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_10;
  v10 = &unk_1E57EEB58;
  id v12 = *(id *)(a1 + 56);
  id v5 = v3;
  id v11 = v5;
  id v13 = &v21;
  v14 = &v15;
  [v4 enumerateObjectsUsingBlock:&v7];
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7, v8, v9, v10);
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    if ([v5 isEqual:v16[5]])
    {
      if (v6) {
        [*(id *)(a1 + 48) appendItemUpdateForPreviousIndexPath:v5 finalIndexPath:v16[5]];
      }
    }
    else
    {
      [*(id *)(a1 + 48) appendItemMoveFromIndexPath:v5 toIndexPath:v16[5] updated:v6];
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

uint64_t __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 32) indexPathByAddingIndex:a2];
  uint64_t v7 = [*(id *)(a1 + 40) indexPathByAddingIndex:a3];
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);

  return v8;
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_10(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    *a4 = 1;
  }
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_8(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  id v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a2];
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

  if (v6)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    *a3 = 1;
  }
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_6(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    *a4 = 1;
  }
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = a1[5];
  uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a2];
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, a1[4]);

  if (v6)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    *a3 = 1;
  }
}

@end