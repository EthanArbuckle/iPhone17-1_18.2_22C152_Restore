void sub_235132B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_235133518(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __ValidateGlyphNode(uint64_t a1, uint64_t a2, void *a3)
{
  if (CGSVGNodeGetType() != 1) {
    goto LABEL_20;
  }
  uint64_t ChildCount = CGSVGNodeGetChildCount();
  if (!ChildCount)
  {
    char v8 = 1;
    return v8 & 1;
  }
  uint64_t v6 = ChildCount;
  uint64_t v7 = 0;
  uint64_t v23 = *MEMORY[0x263F08320];
  char v8 = 1;
  unint64_t v9 = 0x263F08000uLL;
  v10 = @"Symbol image file %@ contains a text node.";
  while (1)
  {
    uint64_t ChildAtIndex = CGSVGNodeGetChildAtIndex();
    int Type = CGSVGNodeGetType();
    if (Type == 1)
    {
      if ((__ValidateGlyphNode(ChildAtIndex, a2, a3) & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
    if (Type == 2)
    {
      if (CGSVGShapeNodeGetPrimitive() == 10001)
      {
        uint64_t v13 = objc_msgSend(*(id *)(v9 + 2880), "stringWithFormat:", v10, a2);
        if (a3)
        {
          id v14 = objc_alloc(MEMORY[0x263F087E8]);
          v15 = v10;
          unint64_t v16 = v9;
          v17 = CoreThemeDefinitionErrorDomain[0];
          uint64_t v18 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v13, v23, 0);
          v19 = v17;
          unint64_t v9 = v16;
          v10 = v15;
          *a3 = [v14 initWithDomain:v19 code:1010 userInfo:v18];
        }
        NSLog(&stru_26E866BF0.isa, v13);
        char v8 = 0;
      }
      goto LABEL_14;
    }
    if (Type == 3) {
      break;
    }
LABEL_14:
    if (v6 == ++v7) {
      return v8 & 1;
    }
  }
  uint64_t v20 = [*(id *)(v9 + 2880) stringWithFormat:@"Symbol image file %@ has a custom node.", a2];
  if (a3)
  {
    id v21 = objc_alloc(MEMORY[0x263F087E8]);
    *a3 = objc_msgSend(v21, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v20, v23, 0));
  }
  NSLog(&stru_26E866BF0.isa, v20);
LABEL_20:
  char v8 = 0;
  return v8 & 1;
}

uint64_t __nodesAreInterpolationCompatible(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ChildCount = CGSVGNodeGetChildCount();
  if (CGSVGNodeGetChildCount() != ChildCount || CGSVGNodeGetChildCount() != ChildCount) {
    return 1;
  }
  if (ChildCount)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 1;
    while (1)
    {
      uint64_t ChildAtIndex = CGSVGNodeGetChildAtIndex();
      uint64_t v10 = CGSVGNodeGetChildAtIndex();
      uint64_t v11 = CGSVGNodeGetChildAtIndex();
      if (CGSVGNodeGetType() == 2)
      {
        unsigned int v27 = v8;
        uint64_t v12 = v7;
        uint64_t v13 = ChildCount;
        uint64_t v14 = a1;
        uint64_t v15 = a2;
        uint64_t v16 = a3;
        unsigned int Primitive = CGSVGShapeNodeGetPrimitive();
        int v18 = CGSVGShapeNodeGetPrimitive();
        int v19 = CGSVGShapeNodeGetPrimitive();
        LOBYTE(v20) = 0;
        if (Primitive != v18 || v19 != v18) {
          return v20 & 1;
        }
        a3 = v16;
        a2 = v15;
        a1 = v14;
        uint64_t ChildCount = v13;
        uint64_t v7 = v12;
        if (Primitive <= 0x2D && ((1 << Primitive) & 0x340000000000) != 0)
        {
          CGSVGShapeNodeGetPath();
          CGSVGShapeNodeGetPath();
          CGSVGShapeNodeGetPath();
          CGPath = (const CGPath *)CGSVGPathCreateCGPath();
          v22 = (const CGPath *)CGSVGPathCreateCGPath();
          uint64_t v23 = (const CGPath *)CGSVGPathCreateCGPath();
          uint64_t v58 = 0;
          v59 = &v58;
          uint64_t v60 = 0x2020000000;
          uint64_t v61 = 0;
          uint64_t v54 = 0;
          v55 = &v54;
          uint64_t v56 = 0x2020000000;
          uint64_t v57 = 0;
          uint64_t v50 = 0;
          v51 = &v50;
          uint64_t v52 = 0x2020000000;
          uint64_t v53 = 0;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = ____nodesAreInterpolationCompatible_block_invoke;
          block[3] = &unk_264C44740;
          block[4] = &v58;
          CGPathApplyWithBlock(CGPath, block);
          v48[0] = MEMORY[0x263EF8330];
          v48[1] = 3221225472;
          v48[2] = ____nodesAreInterpolationCompatible_block_invoke_2;
          v48[3] = &unk_264C44740;
          v48[4] = &v54;
          CGPathApplyWithBlock(v22, v48);
          v47[0] = MEMORY[0x263EF8330];
          v47[1] = 3221225472;
          v47[2] = ____nodesAreInterpolationCompatible_block_invoke_3;
          v47[3] = &unk_264C44740;
          v47[4] = &v50;
          CGPathApplyWithBlock(v23, v47);
          uint64_t v24 = v55[3];
          if (v24 && v59[3] == v24 && v51[3] == v24)
          {
            uint64_t v20 = v27;
            if (v27)
            {
              uint64_t v43 = 0;
              v44 = &v43;
              uint64_t v45 = 0x2020000000;
              v46 = 0;
              v46 = malloc_type_calloc(v55[3], 4uLL, 0x100004052888210uLL);
              uint64_t v39 = 0;
              v40 = &v39;
              uint64_t v41 = 0x2020000000;
              uint64_t v42 = 0;
              v38[0] = MEMORY[0x263EF8330];
              v38[1] = 3221225472;
              v38[2] = ____nodesAreInterpolationCompatible_block_invoke_4;
              v38[3] = &unk_264C44768;
              v38[4] = &v43;
              v38[5] = &v39;
              CGPathApplyWithBlock(v22, v38);
              uint64_t v34 = 0;
              v35 = &v34;
              uint64_t v36 = 0x2020000000;
              char v37 = 1;
              v40[3] = 0;
              v33[0] = MEMORY[0x263EF8330];
              v33[1] = 3221225472;
              v33[2] = ____nodesAreInterpolationCompatible_block_invoke_5;
              v33[3] = &unk_264C44790;
              v33[4] = &v43;
              v33[5] = &v39;
              v33[6] = &v34;
              CGPathApplyWithBlock(CGPath, v33);
              uint64_t v29 = 0;
              v30 = &v29;
              uint64_t v31 = 0x2020000000;
              char v32 = 1;
              v40[3] = 0;
              v28[0] = MEMORY[0x263EF8330];
              v28[1] = 3221225472;
              v28[2] = ____nodesAreInterpolationCompatible_block_invoke_6;
              v28[3] = &unk_264C44790;
              v28[4] = &v43;
              v28[5] = &v39;
              v28[6] = &v29;
              CGPathApplyWithBlock(v23, v28);
              if (!*((unsigned char *)v35 + 24) || !*((unsigned char *)v30 + 24)) {
                unsigned int v27 = 0;
              }
              free((void *)v44[3]);
              _Block_object_dispose(&v29, 8);
              _Block_object_dispose(&v34, 8);
              _Block_object_dispose(&v39, 8);
              _Block_object_dispose(&v43, 8);
              uint64_t v20 = v27;
            }
          }
          else
          {
            uint64_t v20 = 0;
          }
          CGPathRelease(CGPath);
          CGPathRelease(v22);
          CGPathRelease(v23);
          _Block_object_dispose(&v50, 8);
          _Block_object_dispose(&v54, 8);
          _Block_object_dispose(&v58, 8);
          if ((v20 & 1) == 0) {
            return v20 & 1;
          }
        }
        else
        {
          uint64_t v20 = v27;
        }
      }
      else if (CGSVGNodeGetChildCount())
      {
        int v25 = __nodesAreInterpolationCompatible(ChildAtIndex, v10, v11);
        uint64_t v20 = v8;
        if (!v25)
        {
          LOBYTE(v20) = 0;
          return v20 & 1;
        }
      }
      else
      {
        uint64_t v20 = v8;
      }
      ++v7;
      uint64_t v8 = v20;
      if (ChildCount == v7) {
        return v20 & 1;
      }
    }
  }
  LOBYTE(v20) = 1;
  return v20 & 1;
}

void sub_235135C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 200), 8);
  _Block_object_dispose((const void *)(v51 - 168), 8);
  _Block_object_dispose((const void *)(v51 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __interpolateChildShapes(double a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t ChildCount = CGSVGNodeGetChildCount();
  uint64_t result = CGSVGNodeGetChildCount();
  uint64_t v33 = ChildCount;
  if (result == ChildCount)
  {
    uint64_t result = CGSVGNodeGetChildCount();
    if (result == ChildCount)
    {
      uint64_t result = CGSVGNodeGetChildCount();
      if (result == ChildCount)
      {
        if (ChildCount)
        {
          for (uint64_t i = 0; v33 != i; ++i)
          {
            uint64_t ChildAtIndex = CGSVGNodeGetChildAtIndex();
            uint64_t v20 = CGSVGNodeGetChildAtIndex();
            uint64_t v21 = CGSVGNodeGetChildAtIndex();
            uint64_t v22 = CGSVGNodeGetChildAtIndex();
            int Type = CGSVGNodeGetType();
            uint64_t result = CGSVGNodeGetChildCount();
            if (result) {
              uint64_t result = __interpolateChildShapes(ChildAtIndex, v20, v21, v22, a1, a2, a3, a4, a5);
            }
            if (Type != 2) {
              continue;
            }
            int Primitive = CGSVGShapeNodeGetPrimitive();
            if (Primitive > 31)
            {
              if (Primitive == 32)
              {
                CGSVGShapeNodeGetLineGeometry();
                CGSVGShapeNodeGetLineGeometry();
                CGSVGShapeNodeGetLineGeometry();
                CGSVGShapeNodeSetLineGeometry();
              }
              else
              {
                if (Primitive != 49)
                {
LABEL_18:
                  char v32 = (void *)CUICreatePathFromSVGShapeNode();
                  int v25 = (void *)CUICreatePathFromSVGShapeNode();
                  v26 = (void *)CUICreatePathFromSVGShapeNode();
                  uint64_t v27 = a8;
                  uint64_t v28 = a9;
                  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F38400]) initWithPointSize:v25 regular:v32 ultralight:v26 black:a5];
                  objc_msgSend(v29, "pathForScalars:andTransform:", a1, a2, a3, a4);
                  CUIAddPathToSVGShapeNode();

                  a9 = v28;
                  a8 = v27;

                  goto LABEL_19;
                }
                CGSVGShapeNodeGetRectGeometry();
                CGSVGShapeNodeGetRectGeometry();
                CGSVGShapeNodeGetRectGeometry();
                CGSVGShapeNodeSetRectGeometry();
              }
            }
            else if (Primitive == 3)
            {
              CGSVGShapeNodeGetCircleGeometry();
              CGSVGShapeNodeGetCircleGeometry();
              CGSVGShapeNodeGetCircleGeometry();
              CGSVGShapeNodeSetCircleGeometry();
            }
            else
            {
              if (Primitive != 16) {
                goto LABEL_18;
              }
              CGSVGShapeNodeGetEllipseGeometry();
              CGSVGShapeNodeGetEllipseGeometry();
              CGSVGShapeNodeGetEllipseGeometry();
              CGSVGShapeNodeSetEllipseGeometry();
            }
LABEL_19:
            CGSVGNodeGetAttributeMap();
            CGSVGNodeGetAttributeMap();
            CGSVGNodeGetAttributeMap();
            uint64_t Attribute = CGSVGAttributeMapGetAttribute();
            uint64_t v31 = CGSVGAttributeMapGetAttribute();
            uint64_t result = CGSVGAttributeMapGetAttribute();
            if (Attribute)
            {
              if (v31)
              {
                if (result)
                {
                  uint64_t result = CGSVGAttributeGetFloat();
                  if (result)
                  {
                    uint64_t result = CGSVGAttributeGetFloat();
                    if (result)
                    {
                      uint64_t result = CGSVGAttributeGetFloat();
                      if (result)
                      {
                        CGSVGAttributeCreateWithFloat();
                        CGSVGNodeSetAttribute();
                        uint64_t result = CGSVGAttributeRelease();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

id __CUIVectorGlyphGuideIDs_block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (__CUIVectorGlyphNodeIDs_onceToken != -1) {
    dispatch_once(&__CUIVectorGlyphNodeIDs_onceToken, &__block_literal_global_392);
  }
  v0 = (void *)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs;
  uint64_t v1 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs, "count"));
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v0 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v0);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        [v1 addObject:objc_msgSend(@"left-margin", "stringByAppendingFormat:", @"-%@", v6)];
        [v1 addObject:objc_msgSend(@"right-margin", "stringByAppendingFormat:", @"-%@", v6)];
      }
      uint64_t v3 = [v0 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v3);
  }
  v12[0] = @"Baseline-S";
  v12[1] = @"Capline-S";
  v12[2] = @"Baseline-M";
  v12[3] = @"Capline-M";
  v12[4] = @"Baseline-L";
  v12[5] = @"Capline-L";
  v12[6] = @"left-margin";
  v12[7] = @"right-margin";
  id result = (id)objc_msgSend(v1, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v12, 8));
  CUIVectorGlyphGuideIDs__CUIVectorGlyphGuideIDs = (uint64_t)result;
  return result;
}

uint64_t ____nodesAreInterpolationCompatible_block_invoke(uint64_t result)
{
  return result;
}

uint64_t ____nodesAreInterpolationCompatible_block_invoke_2(uint64_t result)
{
  return result;
}

uint64_t ____nodesAreInterpolationCompatible_block_invoke_3(uint64_t result)
{
  return result;
}

uint64_t ____nodesAreInterpolationCompatible_block_invoke_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  uint64_t v4 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  *(void *)(v4 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5 + 1;
  *(_DWORD *)(v3 + 4 * v5) = v2;
  return result;
}

void *____nodesAreInterpolationCompatible_block_invoke_5(void *result, _DWORD *a2)
{
  uint64_t v2 = *(void *)(*(void *)(result[4] + 8) + 24);
  uint64_t v3 = *(void *)(result[5] + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4 + 1;
  uint64_t v5 = *(void *)(result[6] + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    if (*a2 != *(_DWORD *)(v2 + 4 * v4)) {
      *(unsigned char *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    }
  }
  return result;
}

void *____nodesAreInterpolationCompatible_block_invoke_6(void *result, _DWORD *a2)
{
  uint64_t v2 = *(void *)(*(void *)(result[4] + 8) + 24);
  uint64_t v3 = *(void *)(result[5] + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4 + 1;
  uint64_t v5 = *(void *)(result[6] + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    if (*a2 != *(_DWORD *)(v2 + 4 * v4)) {
      *(unsigned char *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    }
  }
  return result;
}

uint64_t indexOfFirstUncommonItemInArrays(void *a1, void *a2)
{
  uint64_t v4 = [a1 count];
  uint64_t v5 = [a2 count];
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __indexOfFirstUncommonItemInArrays_block_invoke;
  v8[3] = &unk_264C44D78;
  v8[5] = &v9;
  v8[6] = v5;
  v8[4] = a2;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_235149C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __valueForAttributeNamed(void *a1, unsigned int a2)
{
  uint64_t v3 = (void *)[a1 keySpec];
  switch(a2)
  {
    case 1u:
      uint64_t v4 = (void *)[v3 element];
      goto LABEL_28;
    case 2u:
      uint64_t v4 = (void *)[v3 part];
      goto LABEL_28;
    case 3u:
      uint64_t v4 = (void *)[v3 size];
      goto LABEL_28;
    case 4u:
      uint64_t v4 = (void *)[v3 direction];
      goto LABEL_28;
    case 6u:
      uint64_t v4 = (void *)[v3 value];
      goto LABEL_28;
    case 7u:
      uint64_t v4 = (void *)[v3 appearance];
      goto LABEL_28;
    case 8u:
      LODWORD(result) = [v3 dimension1];
      goto LABEL_29;
    case 9u:
      LODWORD(result) = [v3 dimension2];
      goto LABEL_29;
    case 0xAu:
    case 0xEu:
      uint64_t v4 = (void *)[v3 state];
      goto LABEL_28;
    case 0xBu:
      uint64_t v4 = (void *)[v3 layer];
      goto LABEL_28;
    case 0xCu:
      LODWORD(result) = [v3 scaleFactor];
      goto LABEL_29;
    case 0xDu:
      uint64_t v4 = (void *)[v3 localization];
      goto LABEL_28;
    case 0xFu:
      uint64_t v4 = (void *)[v3 idiom];
      goto LABEL_28;
    case 0x10u:
      LODWORD(result) = [v3 subtype];
      goto LABEL_29;
    case 0x11u:
      LODWORD(result) = [v3 nameIdentifier];
      goto LABEL_29;
    case 0x12u:
      uint64_t v4 = (void *)[v3 previousValue];
      goto LABEL_28;
    case 0x13u:
      uint64_t v4 = (void *)[v3 previousState];
      goto LABEL_28;
    case 0x14u:
      uint64_t v4 = (void *)[v3 sizeClassHorizontal];
      goto LABEL_28;
    case 0x15u:
      uint64_t v4 = (void *)[v3 sizeClassVertical];
      goto LABEL_28;
    case 0x16u:
      LODWORD(result) = [v3 memoryClass];
      goto LABEL_29;
    case 0x17u:
      uint64_t v4 = (void *)[v3 graphicsFeatureSetClass];
      goto LABEL_28;
    case 0x18u:
      uint64_t v4 = (void *)[v3 gamut];
      goto LABEL_28;
    case 0x19u:
      uint64_t v4 = (void *)[v3 target];
      goto LABEL_28;
    case 0x1Au:
      uint64_t v4 = (void *)[v3 glyphWeight];
      goto LABEL_28;
    case 0x1Bu:
      uint64_t v4 = (void *)[v3 glyphSize];
LABEL_28:
      LODWORD(result) = [v4 identifier];
LABEL_29:
      uint64_t result = result;
      break;
    default:
      NSLog(&cfstr_SCalledWithAtt.isa, "__valueForAttributeNamed", a2);
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_235158D14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_235159C54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    if (*(void *)(v13 + 144))
    {
      objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.CoreThemeDefinition", 2, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Exception Raised during asset import"));
      NSLog(&cfstr_AssetImportDid.isa);
      (*(void (**)(void))(*(void *)(v13 + 144) + 16))();
    }
    objc_end_catch();
    JUMPOUT(0x2351598F8);
  }
  _Unwind_Resume(exception_object);
}

void sub_23515A150(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    if (*(void *)(v13 + 136))
    {
      objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.CoreThemeDefinition", 2, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Exception Raised during asset import (2)"));
      NSLog(&cfstr_AssetImportDid.isa);
      (*(void (**)(void))(*(void *)(v13 + 136) + 16))();
    }
    objc_end_catch();
    JUMPOUT(0x23515A0F0);
  }
  _Unwind_Resume(exception_object);
}

void sub_23515D7F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    NSLog(&cfstr_GotException.isa);
    objc_end_catch();
    JUMPOUT(0x23515D7D0);
  }
  _Unwind_Resume(exception_object);
}

void sub_235160088(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2351637CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_235163F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __indexOfFirstUncommonItemInArrays_block_invoke(uint64_t result, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v6 = result;
  if (*(void *)(result + 48) <= a3
    || (uint64_t result = objc_msgSend(a2, "isEqual:", objc_msgSend(*(id *)(result + 32), "objectAtIndex:", a3)),
        (result & 1) == 0))
  {
    *(void *)(*(void *)(*(void *)(v6 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

double ____indexAreaOverMax_block_invoke(uint64_t a1, void *a2)
{
  double v3 = (double)(int)([a2 width] + 2);
  [a2 height];
  return v3;
}

uint64_t TDColorSpaceGetExtendedRangeSRGB()
{
  if (TDColorSpaceGetExtendedRangeSRGB___once != -1) {
    dispatch_once(&TDColorSpaceGetExtendedRangeSRGB___once, &__block_literal_global_4);
  }
  return TDColorSpaceGetExtendedRangeSRGB_sExtendedRangeSRGBColorSpace;
}

CGColorSpaceRef __TDColorSpaceGetExtendedRangeSRGB_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
  TDColorSpaceGetExtendedRangeSRGB_sExtendedRangeSRGBColorSpace = (uint64_t)result;
  return result;
}

void TDSchemaLog(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  long long v10 = getenv("CoreThemeLoggingEnabled");
  if (v10)
  {
    if (*v10 == 49) {
      NSLogv(a1, &a9);
    }
  }
}

void sub_23516E908(_Unwind_Exception *a1)
{
}

void sub_23516E928(void *a1)
{
}

_WORD *__CUITransmutePathSlashes(_WORD *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a2 >= 2 && *result == 92) {
    uint64_t v3 = 2 * (result[1] == 92);
  }
  else {
    uint64_t v3 = 0;
  }
  if (v3 >= v2)
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = v3;
    while (1)
    {
      int v5 = (unsigned __int16)result[v3];
      if (v5 == 47) {
        break;
      }
      uint64_t v8 = v3 + 1;
      result[v4] = v5;
LABEL_16:
      ++v4;
      uint64_t v3 = v8;
      if (v8 >= v2) {
        goto LABEL_20;
      }
    }
    result[v4] = 47;
    if (v2 <= v3 + 1) {
      uint64_t v6 = v3 + 1;
    }
    else {
      uint64_t v6 = v2;
    }
    uint64_t v7 = v6 - 1;
    while (v7 != v3)
    {
      uint64_t v8 = v3 + 1;
      int v9 = (unsigned __int16)result[++v3];
      if (v9 != 47) {
        goto LABEL_16;
      }
    }
    ++v4;
  }
LABEL_20:
  *a2 = v4;
  return result;
}

uint64_t _pathHasDotDot(unsigned __int16 *a1, uint64_t a2, int a3)
{
  uint64_t v3 = 0;
  int v4 = *a1;
  BOOL v6 = v4 != 126 && v4 != 47;
  if (a2 >= 2 && !v6)
  {
    if (a3)
    {
      uint64_t v7 = 3;
      if ((unint64_t)a2 >= 4)
      {
        while (a1[v7] != 47)
        {
          if (a2 == ++v7)
          {
            uint64_t v7 = a2;
            break;
          }
        }
      }
      uint64_t v8 = v7 + 1;
      if (a2 <= v7 + 1) {
        uint64_t v9 = v7 + 1;
      }
      else {
        uint64_t v9 = a2;
      }
      uint64_t v10 = v9 - 1;
      while (v8 < a2)
      {
        int v11 = a1[v8++];
        if (v11 == 47)
        {
          uint64_t v10 = v8 - 2;
          break;
        }
      }
      uint64_t v12 = v10 + 2;
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v12 < a2 - 1)
    {
      do
      {
        uint64_t v3 = v12 + 1;
        if (a1[v12] == 46 && a1[v3] == 46)
        {
          if (a2 < 3 || v12)
          {
            if (v12 >= 1 && a1[v12 - 1] == 47)
            {
              uint64_t v13 = v12 + 2;
              BOOL v14 = v13 == a2;
              if (v13 < a2) {
                BOOL v14 = a1[v13] == 47;
              }
              if (v14) {
                return 1;
              }
            }
          }
          else
          {
            uint64_t v3 = 1;
            if (a1[2] == 47) {
              return v3;
            }
          }
        }
        uint64_t v12 = v3;
      }
      while (v3 != a2 - 1);
    }
    return 0;
  }
  return v3;
}

void sub_235177BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 248), 8);
  _Block_object_dispose((const void *)(v44 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_23517C3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23517CF78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

__CFString *__arrayToString(void *a1)
{
  uint64_t v2 = [a1 count];
  if (!v2) {
    return @"*";
  }
  uint64_t v3 = v2;
  int v4 = (void *)[MEMORY[0x263F089D8] string];
  for (uint64_t i = 0; i != v3; ++i)
  {
    BOOL v6 = (void *)[a1 objectAtIndex:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v7 = [v6 count];
      objc_msgSend(v4, "appendString:", @"(");
      if (v7)
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          objc_msgSend(v4, "appendString:", objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", j), "stringValue"));
          if (v7 - 1 != j) {
            [v4 appendString:@","];
          }
        }
      }
      uint64_t v9 = v4;
      uint64_t v10 = @"");
    }
    else
    {
      uint64_t v10 = (__CFString *)[v6 stringValue];
      uint64_t v9 = v4;
    }
    [v9 appendString:v10];
    if (i != v3 - 1) {
      [v4 appendString:@","];
    }
  }
  return (__CFString *)v4;
}

void __midpointQuickPermuteInRange(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v6 = a2 + (a3 >> 1);
  if (a3 < 2)
  {
    if (a3 == 1)
    {
      uint64_t v11 = [a1 objectAtIndex:a2];
      [a4 addObject:v11];
    }
  }
  else
  {
    unint64_t v8 = a3 >> 1;
    unint64_t v9 = a3 + a2 - 1;
    uint64_t v10 = (void *)MEMORY[0x237DD6000](objc_msgSend(a4, "addObject:", objc_msgSend(a1, "objectAtIndex:", a2 + (a3 >> 1))));
    __midpointQuickPermuteInRange(a1, a2, v8, a4);
    if (v9 > v6) {
      __midpointQuickPermuteInRange(a1, v6 + 1, v9 - v6, a4);
    }
  }
}

uint64_t CAEncodeLayerTree()
{
  return MEMORY[0x270EFB798]();
}

uint64_t CAEncodeLayerTreeToFile()
{
  return MEMORY[0x270EFB7A0]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x270EE51E8](string);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x270EE5A28](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x270EE5A30](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5A40](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x270EE5A60]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x270EE5BD8](colorName);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x270EE5CC0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

uint64_t CGContextDrawSVGDocument()
{
  return MEMORY[0x270F23368]();
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x270EE60F0]();
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x270EE6298](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

uint64_t CGGetImageIOVersion()
{
  return MEMORY[0x270EF4EA8]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x270EF4F10](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x270EF4FF0](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

size_t CGPDFArrayGetCount(CGPDFArrayRef array)
{
  return MEMORY[0x270EE69D8](array);
}

BOOL CGPDFArrayGetString(CGPDFArrayRef array, size_t index, CGPDFStringRef *value)
{
  return MEMORY[0x270EE6A10](array, index, value);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A80](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return MEMORY[0x270EE6B30](dict, key, value);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x270EE6B98](url);
}

uint64_t CGPDFDocumentEnableTaggedStructureSerialization()
{
  return MEMORY[0x270EE6BA8]();
}

CGPDFArrayRef CGPDFDocumentGetID(CGPDFDocumentRef document)
{
  return (CGPDFArrayRef)MEMORY[0x270EE6BE8](document);
}

CGPDFDictionaryRef CGPDFDocumentGetInfo(CGPDFDocumentRef document)
{
  return (CGPDFDictionaryRef)MEMORY[0x270EE6BF0](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x270EE6C00](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

uint64_t CGPDFPageContainsWideGamutContent()
{
  return MEMORY[0x270EE6D38]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDateRef CGPDFStringCopyDate(CGPDFStringRef string)
{
  return (CFDateRef)MEMORY[0x270EE6EC8](string);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return (CFStringRef)MEMORY[0x270EE6ED0](string);
}

const unsigned __int8 *__cdecl CGPDFStringGetBytePtr(CGPDFStringRef string)
{
  return (const unsigned __int8 *)MEMORY[0x270EE6ED8](string);
}

size_t CGPDFStringGetLength(CGPDFStringRef string)
{
  return MEMORY[0x270EE6EE0](string);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGSVGAtomCopyString()
{
  return MEMORY[0x270F23370]();
}

uint64_t CGSVGAtomFromString()
{
  return MEMORY[0x270F23378]();
}

uint64_t CGSVGAttributeCopyString()
{
  return MEMORY[0x270F23380]();
}

uint64_t CGSVGAttributeCreateWithFloat()
{
  return MEMORY[0x270F23388]();
}

uint64_t CGSVGAttributeCreateWithString()
{
  return MEMORY[0x270F23390]();
}

uint64_t CGSVGAttributeCreateWithTransform()
{
  return MEMORY[0x270F23398]();
}

uint64_t CGSVGAttributeGetFloat()
{
  return MEMORY[0x270F233A8]();
}

uint64_t CGSVGAttributeGetTransform()
{
  return MEMORY[0x270F233B8]();
}

uint64_t CGSVGAttributeMapCopy()
{
  return MEMORY[0x270F233C0]();
}

uint64_t CGSVGAttributeMapEnumerate()
{
  return MEMORY[0x270F233C8]();
}

uint64_t CGSVGAttributeMapGetAttribute()
{
  return MEMORY[0x270F233D0]();
}

uint64_t CGSVGAttributeMapRelease()
{
  return MEMORY[0x270F233D8]();
}

uint64_t CGSVGAttributeMapSetAttribute()
{
  return MEMORY[0x270F233E8]();
}

uint64_t CGSVGAttributeRelease()
{
  return MEMORY[0x270F233F0]();
}

uint64_t CGSVGDocumentAddNamedStyle()
{
  return MEMORY[0x270F23400]();
}

uint64_t CGSVGDocumentContainsWideGamutContent()
{
  return MEMORY[0x270F23408]();
}

uint64_t CGSVGDocumentCreate()
{
  return MEMORY[0x270F23410]();
}

uint64_t CGSVGDocumentCreateFromData()
{
  return MEMORY[0x270F23418]();
}

uint64_t CGSVGDocumentCreateFromURL()
{
  return MEMORY[0x270F23420]();
}

uint64_t CGSVGDocumentGetCanvasSize()
{
  return MEMORY[0x270F23428]();
}

uint64_t CGSVGDocumentGetNamedStyle()
{
  return MEMORY[0x270F23438]();
}

uint64_t CGSVGDocumentGetRootNode()
{
  return MEMORY[0x270F23440]();
}

uint64_t CGSVGDocumentRelease()
{
  return MEMORY[0x270F23450]();
}

uint64_t CGSVGDocumentRetain()
{
  return MEMORY[0x270F23458]();
}

uint64_t CGSVGDocumentWriteToData()
{
  return MEMORY[0x270F23460]();
}

uint64_t CGSVGNodeAddChild()
{
  return MEMORY[0x270F23468]();
}

uint64_t CGSVGNodeCopy()
{
  return MEMORY[0x270F23470]();
}

uint64_t CGSVGNodeCreate()
{
  return MEMORY[0x270F23478]();
}

uint64_t CGSVGNodeEnumerate()
{
  return MEMORY[0x270F23480]();
}

uint64_t CGSVGNodeFindAttribute()
{
  return MEMORY[0x270F23490]();
}

uint64_t CGSVGNodeFindChildWithCStringIdentifier()
{
  return MEMORY[0x270F234A0]();
}

uint64_t CGSVGNodeFindChildWithStringIdentifier()
{
  return MEMORY[0x270F234A8]();
}

uint64_t CGSVGNodeGetAttributeMap()
{
  return MEMORY[0x270F234B0]();
}

uint64_t CGSVGNodeGetBoundingBox()
{
  return MEMORY[0x270F234B8]();
}

uint64_t CGSVGNodeGetBoundingBoxWithOptions()
{
  return MEMORY[0x270F234C0]();
}

uint64_t CGSVGNodeGetChildAtIndex()
{
  return MEMORY[0x270F234C8]();
}

uint64_t CGSVGNodeGetChildCount()
{
  return MEMORY[0x270F234D0]();
}

uint64_t CGSVGNodeGetParent()
{
  return MEMORY[0x270F234D8]();
}

uint64_t CGSVGNodeGetType()
{
  return MEMORY[0x270F234E0]();
}

uint64_t CGSVGNodeRelease()
{
  return MEMORY[0x270F234F0]();
}

uint64_t CGSVGNodeRetain()
{
  return MEMORY[0x270F234F8]();
}

uint64_t CGSVGNodeSetAttribute()
{
  return MEMORY[0x270F23500]();
}

uint64_t CGSVGNodeSetStringIdentifier()
{
  return MEMORY[0x270F23508]();
}

uint64_t CGSVGPathCreateCGPath()
{
  return MEMORY[0x270F23528]();
}

uint64_t CGSVGShapeNodeCopyText()
{
  return MEMORY[0x270F23530]();
}

uint64_t CGSVGShapeNodeGetCircleGeometry()
{
  return MEMORY[0x270F23538]();
}

uint64_t CGSVGShapeNodeGetEllipseGeometry()
{
  return MEMORY[0x270F23548]();
}

uint64_t CGSVGShapeNodeGetLineGeometry()
{
  return MEMORY[0x270F23560]();
}

uint64_t CGSVGShapeNodeGetPath()
{
  return MEMORY[0x270F23568]();
}

uint64_t CGSVGShapeNodeGetPrimitive()
{
  return MEMORY[0x270F23578]();
}

uint64_t CGSVGShapeNodeGetRectGeometry()
{
  return MEMORY[0x270F23588]();
}

uint64_t CGSVGShapeNodeSetCircleGeometry()
{
  return MEMORY[0x270F23598]();
}

uint64_t CGSVGShapeNodeSetEllipseGeometry()
{
  return MEMORY[0x270F235A0]();
}

uint64_t CGSVGShapeNodeSetLineGeometry()
{
  return MEMORY[0x270F235A8]();
}

uint64_t CGSVGShapeNodeSetRectGeometry()
{
  return MEMORY[0x270F235B0]();
}

uint64_t CSIEqualMetrics()
{
  return MEMORY[0x270F23A00]();
}

uint64_t CUIAddPathToSVGShapeNode()
{
  return MEMORY[0x270F23A08]();
}

uint64_t CUICGImageGetAlphaInfo()
{
  return MEMORY[0x270F23A10]();
}

uint64_t CUICalcNonAlphaAreaOfImage()
{
  return MEMORY[0x270F23A18]();
}

uint64_t CUICalculateExtrusionMaskOfImage()
{
  return MEMORY[0x270F23A20]();
}

uint64_t CUIColorHistogramARGBIsMonochrome()
{
  return MEMORY[0x270F23A30]();
}

uint64_t CUIComputeImageColorHistogramARGB()
{
  return MEMORY[0x270F23A40]();
}

uint64_t CUIConvertCGImageFormat()
{
  return MEMORY[0x270F23A48]();
}

uint64_t CUIConvertDeepImageTo8()
{
  return MEMORY[0x270F23A50]();
}

uint64_t CUIConvertFromTXRPixelFormat()
{
  return MEMORY[0x270F23A58]();
}

uint64_t CUICreatePathFromSVGNode()
{
  return MEMORY[0x270F23A60]();
}

uint64_t CUICreatePathFromSVGShapeNode()
{
  return MEMORY[0x270F23A68]();
}

uint64_t CUICreateSDFEdgeTextureFromImage()
{
  return MEMORY[0x270F23A70]();
}

uint64_t CUICreateSDFEdgeTexturePixelFormat()
{
  return MEMORY[0x270F23A78]();
}

uint64_t CUICreateSDFGradientTextureFromImage()
{
  return MEMORY[0x270F23A80]();
}

uint64_t CUICreateSDFGradientTexturePixelFormat()
{
  return MEMORY[0x270F23A88]();
}

uint64_t CUICreateSubpathsFromSVGNode()
{
  return MEMORY[0x270F23A90]();
}

uint64_t CUICurrentPlatform()
{
  return MEMORY[0x270F23A98]();
}

uint64_t CUIDeallocateRGBAImageBuffer()
{
  return MEMORY[0x270F23AA0]();
}

uint64_t CUIDrawExtrudedImageInContext()
{
  return MEMORY[0x270F23AB0]();
}

uint64_t CUIEdgeInsetsMake()
{
  return MEMORY[0x270F23AB8]();
}

uint64_t CUIEdgeInsetsValid()
{
  return MEMORY[0x270F23AC0]();
}

uint64_t CUIEqualRenditionKeys()
{
  return MEMORY[0x270F23AC8]();
}

uint64_t CUIFillCARKeyArrayForRenditionKey()
{
  return MEMORY[0x270F23AD0]();
}

uint64_t CUIGetFormatForFeatureSetAndPixelFormat()
{
  return MEMORY[0x270F23AD8]();
}

uint64_t CUIGetRGBAImageBuffer()
{
  return MEMORY[0x270F23AE0]();
}

uint64_t CUIImageIsMonochrome()
{
  return MEMORY[0x270F23AE8]();
}

uint64_t CUIImageIsWideGamut()
{
  return MEMORY[0x270F23AF0]();
}

uint64_t CUILogLogToStderr()
{
  return MEMORY[0x270F23AF8]();
}

uint64_t CUIMaxDimensionForVectorGlyph()
{
  return MEMORY[0x270F23B00]();
}

uint64_t CUIMaxScaleForTargetPlatform()
{
  return MEMORY[0x270F23B08]();
}

uint64_t CUIMinDimensionForVectorGlyph()
{
  return MEMORY[0x270F23B10]();
}

uint64_t CUIMinScaleForTargetPlatform()
{
  return MEMORY[0x270F23B18]();
}

uint64_t CUIParseDeploymentTarget()
{
  return MEMORY[0x270F23B20]();
}

uint64_t CUIPlatformNameForPlatform()
{
  return MEMORY[0x270F23B30]();
}

uint64_t CUIPointSizeForDimensionForVectorGlyph()
{
  return MEMORY[0x270F23B38]();
}

uint64_t CUIPreferredVectorGlyphConfigurationsForPlatform()
{
  return MEMORY[0x270F23B40]();
}

uint64_t CUIRenditionKeyCopy()
{
  return MEMORY[0x270F23B48]();
}

uint64_t CUIRenditionKeyFormatRemoveAttribute()
{
  return MEMORY[0x270F23B50]();
}

uint64_t CUIRenditionKeyHasIdentifier()
{
  return MEMORY[0x270F23B58]();
}

uint64_t CUIRenditionKeySetValueForAttribute()
{
  return MEMORY[0x270F23B60]();
}

uint64_t CUIRenditionKeyStandardize()
{
  return MEMORY[0x270F23B68]();
}

uint64_t CUIRenditionKeyTokenCount()
{
  return MEMORY[0x270F23B70]();
}

uint64_t CUIRenditionKeyValueForAttribute()
{
  return MEMORY[0x270F23B78]();
}

uint64_t CUISDFTexturesSupported()
{
  return MEMORY[0x270F23B80]();
}

uint64_t CUISVGNodeCanBeRepresentedAsPath()
{
  return MEMORY[0x270F23B88]();
}

uint64_t CUISystemThemeRenditionKeyFormat()
{
  return MEMORY[0x270F23B90]();
}

uint64_t CUIThemeInfoVersion()
{
  return MEMORY[0x270F23B98]();
}

uint64_t CUIWatchSubTypeFallbackOrder()
{
  return MEMORY[0x270F23BA0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x270EF2A90]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

void NSLog(NSString *format, ...)
{
}

void NSLogv(NSString *format, va_list args)
{
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x270EF2BB0](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSSize NSSizeFromString(NSString *aString)
{
  MEMORY[0x270EF2BF0](aString);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x270EF2C40]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

NSRect NSUnionRect(NSRect aRect, NSRect bRect)
{
  MEMORY[0x270EF2C68]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x270EE8580](inTagClass, inTag, inConformingToUTI);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x270ED7EC8]();
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x270ED9100](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x270ED9108]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x270ED9110](a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

lldiv_t div(uint64_t __x, uint64_t __y)
{
  uint64_t v2 = MEMORY[0x270ED9608](__x, __y);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x270EDA570](a1, *(void *)&a2);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x270EDA580](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB588](__dst, __src, __n);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x270EDB688](__stringp, __delim);
}

CGImageRef vImageCreateCGImageFromBuffer(const vImage_Buffer *buf, const vImage_CGImageFormat *format, void (__cdecl *callback)(void *, void *), void *userData, vImage_Flags flags, vImage_Error *error)
{
  return (CGImageRef)MEMORY[0x270EDF1B0](buf, format, callback, userData, *(void *)&flags, error);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF328](src, dest, tempBuffer, *(void *)&flags);
}