@interface FBSDisplayLayout
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (CGRect)referenceBounds;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSDisplayLayout)init;
- (FBSDisplayLayout)initWithXPCDictionary:(id)a3;
- (NSArray)elements;
- (NSDate)timestamp;
- (NSString)description;
- (id)_initWithElements:(id)a3;
- (id)addElement:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)backlightState;
- (int64_t)displayBacklightLevel;
- (int64_t)displayType;
- (int64_t)interfaceOrientation;
- (void)_sortElements;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)finalizeLayout;
- (void)removeElement:(id)a3;
- (void)setBacklightState:(int64_t)a3;
- (void)setDisplayBacklightLevel:(int64_t)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
@end

@implementation FBSDisplayLayout

- (NSArray)elements
{
  return &self->_elements->super;
}

- (int64_t)displayBacklightLevel
{
  return self->_backlightLevel;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_elements, 0);
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

- (FBSDisplayLayout)initWithXPCDictionary:(id)a3
{
  id v3 = a3;
  BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
}

- (id)_initWithElements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSDisplayLayout;
  v5 = [(FBSDisplayLayout *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
    }
    else
    {
      uint64_t v6 = objc_opt_new();
    }
    elements = v5->_elements;
    v5->_elements = (NSMutableArray *)v6;

    *(_OWORD *)&v5->_interfaceOrientation = xmmword_19C722BC0;
    v5->_backlightState = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

uint64_t __33__FBSDisplayLayout__sortElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [v4 numberWithInteger:[a2 level]];
  v7 = NSNumber;
  uint64_t v8 = [v5 level];

  objc_super v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) elements];
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) interfaceOrientation];
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) backlightState];
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayBacklightLevel];
}

- (NSString)description
{
  return (NSString *)[(FBSDisplayLayout *)self descriptionWithMultilinePrefix:0];
}

- (int64_t)displayType
{
  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration) {
    return [(FBSDisplayConfiguration *)displayConfiguration type];
  }
  else {
    return -1;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [off_1E58F4500 builderWithObject:self ofExpectedClass:objc_opt_class()];
  int64_t backlightLevel = self->_backlightLevel;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __28__FBSDisplayLayout_isEqual___block_invoke;
  v30[3] = &unk_1E58F5600;
  id v7 = v4;
  id v31 = v7;
  id v8 = (id)[v5 appendInteger:backlightLevel counterpart:v30];
  int64_t backlightState = self->_backlightState;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __28__FBSDisplayLayout_isEqual___block_invoke_2;
  v28[3] = &unk_1E58F5600;
  id v10 = v7;
  id v29 = v10;
  id v11 = (id)[v5 appendInteger:backlightState counterpart:v28];
  int64_t interfaceOrientation = self->_interfaceOrientation;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __28__FBSDisplayLayout_isEqual___block_invoke_3;
  v26[3] = &unk_1E58F5600;
  id v13 = v10;
  id v27 = v13;
  id v14 = (id)[v5 appendInteger:interfaceOrientation counterpart:v26];
  elements = self->_elements;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __28__FBSDisplayLayout_isEqual___block_invoke_4;
  v24[3] = &unk_1E58F5F78;
  id v16 = v13;
  id v25 = v16;
  id v17 = (id)[v5 appendObject:elements counterpart:v24];
  displayConfiguration = self->_displayConfiguration;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __28__FBSDisplayLayout_isEqual___block_invoke_5;
  v22[3] = &unk_1E58F5650;
  id v23 = v16;
  id v19 = v16;
  id v20 = (id)[v5 appendObject:displayConfiguration counterpart:v22];
  LOBYTE(displayConfiguration) = [v5 isEqual];

  return (char)displayConfiguration;
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (id)succinctDescriptionBuilder
{
  id v3 = [off_1E58F44F0 builderWithObject:self];
  uint64_t v4 = [(FBSDisplayConfiguration *)self->_displayConfiguration identity];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = @"<nil>";
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"displayIdentity"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSDisplayLayout *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSDisplayLayout *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__FBSDisplayLayout_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E58F4AB0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (void)finalizeLayout
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  timestamp = self->_timestamp;
  self->_timestamp = v3;

  [(FBSDisplayConfiguration *)self->_displayConfiguration bounds];
  double v6 = v5;
  double rect_16 = v7;
  double v9 = v8;
  double v11 = v10;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v12 = self->_elements;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v44;
    double v16 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double rect_24 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v37 = *MEMORY[0x1E4F1DB28];
    CGFloat rect = v6;
    double rect_8 = v17;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        id v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v19 fillsDisplayBounds]) {
          [v19 setReferenceFrame:v6 rect:rect_16 view:v9 completion:v11];
        }
        [v19 referenceFrame];
        BOOL IsEmpty = CGRectIsEmpty(v49);
        double v21 = v16;
        double MinX = v17;
        double v24 = rect_24;
        double v23 = v42;
        if (!IsEmpty)
        {
          [v19 referenceFrame];
          double v21 = v25;
          double MinX = v26;
          double v24 = v27;
          CGFloat v29 = v28;
          int64_t interfaceOrientation = self->_interfaceOrientation;
          if (interfaceOrientation != 2)
          {
            if (interfaceOrientation == 3)
            {
              double MinY = CGRectGetMinY(*(CGRect *)&v25);
              v53.origin.x = v6;
              v53.origin.y = rect_16;
              v53.size.width = v9;
              v53.size.height = v11;
              double Width = CGRectGetWidth(v53);
              v54.origin.x = v21;
              v54.origin.y = MinX;
              v54.size.width = v24;
              v54.size.height = v29;
              double MinX = Width - CGRectGetMaxX(v54);
              double v6 = rect;
LABEL_14:
              double v21 = MinY;
              double v16 = v37;
              double v23 = v29;
            }
            else
            {
              if (interfaceOrientation == 4)
              {
                v50.origin.x = v6;
                v50.origin.y = rect_16;
                v50.size.width = v9;
                v50.size.height = v11;
                double Height = CGRectGetHeight(v50);
                v51.origin.x = v21;
                v51.origin.y = MinX;
                v51.size.width = v24;
                v51.size.height = v29;
                double MinY = Height - CGRectGetMaxY(v51);
                v52.origin.x = v21;
                v52.origin.y = MinX;
                v52.size.width = v24;
                v52.size.height = v29;
                double MinX = CGRectGetMinX(v52);
                goto LABEL_14;
              }
LABEL_16:
              double v23 = v24;
              double v24 = v29;
            }
            double v17 = rect_8;
            goto LABEL_18;
          }
          v55.origin.x = v6;
          v55.origin.y = rect_16;
          v55.size.width = v9;
          v55.size.height = v11;
          double v34 = CGRectGetWidth(v55);
          v56.origin.x = v21;
          v56.origin.y = MinX;
          v56.size.width = v24;
          v56.size.height = v29;
          double v36 = v34 - CGRectGetMaxX(v56);
          v57.origin.x = rect;
          v57.origin.y = rect_16;
          v57.size.width = v9;
          v57.size.height = v11;
          double v35 = CGRectGetHeight(v57);
          v58.origin.x = v21;
          v58.origin.y = MinX;
          v58.size.width = v24;
          v58.size.height = v29;
          double MinX = v35 - CGRectGetMaxY(v58);
          double v21 = v36;
          double v16 = v37;
          double v6 = rect;
          goto LABEL_16;
        }
LABEL_18:
        [v19 setFrame:CGRectMake(MinX, v23, v24, v21)];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v14);
  }
}

void __58__FBSDisplayLayout_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  if (!CGRectIsEmpty(v23))
  {
    v2 = *(void **)(a1 + 40);
    [*(id *)(a1 + 32) bounds];
    id v3 = [v2 appendRect:@"bounds"];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 32)) {
    BSInterfaceOrientationDescription();
  }
  [*(id *)(v4 + 24) bounds];
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  if (!CGRectIsEmpty(v24))
  {
    [*(id *)(a1 + 32) bounds];
    v26.origin.double x = v9;
    v26.origin.double y = v10;
    v26.size.double width = v11;
    v26.size.double height = v12;
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    if (!CGRectEqualToRect(v25, v26)) {
      id v13 = [*(id *)(a1 + 40) appendRect:x y:y width:width height:height withName:@"referenceBounds"];
    }
  }
  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = v14[5];
  if (v15 != -1)
  {
    id v16 = (id)[*(id *)(a1 + 40) appendInteger:v15 withName:@"backlightLevel"];
    uint64_t v14 = *(void **)(a1 + 32);
  }
  uint64_t v17 = v14[6];
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = (id)[*(id *)(a1 + 40) appendInteger:v17 withName:@"backlightState"];
    uint64_t v14 = *(void **)(a1 + 32);
  }
  [*(id *)(a1 + 40) appendArraySection:v14[1] withName:@"elements" skipIfEmpty:1];
  id v19 = *(void **)(a1 + 40);
  id v21 = [MEMORY[0x1E4F28C10] localizedStringFromDate:*(void *)(*(void *)(a1 + 32) + 16) dateStyle:3 timeStyle:3];
  id v20 = (id)[v19 appendObject:v21 withName:@"timestamp" skipIfNil:1];
}

- (CGRect)bounds
{
}

- (void)removeElement:(id)a3
{
}

- (id)addElement:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  if (v4)
  {
    [(NSMutableArray *)self->_elements addObject:v4];
    [(FBSDisplayLayout *)self _sortElements];
  }

  return v4;
}

- (void)_sortElements
{
}

- (FBSDisplayLayout)init
{
  return (FBSDisplayLayout *)[(FBSDisplayLayout *)self _initWithElements:0];
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayConfiguration];
}

- (id)succinctDescription
{
  v2 = [(FBSDisplayLayout *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (CGRect)referenceBounds
{
  [(FBSDisplayConfiguration *)self->_displayConfiguration bounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_int64_t interfaceOrientation = a3;
}

- (void)setDisplayBacklightLevel:(int64_t)a3
{
  self->_int64_t backlightLevel = a3;
}

- (void)setBacklightState:(int64_t)a3
{
  self->_int64_t backlightState = a3;
}

@end