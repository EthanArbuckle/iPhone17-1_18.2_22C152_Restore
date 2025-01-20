@interface CSPresentation
+ (CSPresentation)presentationWithCoordinateSpace:(id)a3;
+ (id)presentation;
+ (id)presentationForProvider:(id)a3;
- (BOOL)intersectsCoordinateSpace:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (CSPresentation)init;
- (NSArray)regions;
- (NSString)description;
- (NSString)identifier;
- (UICoordinateSpace)coordinateSpace;
- (UIEdgeInsets)suggestedInsetsForPreferredContentFrame:(CGRect)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)firstRegionIntersectingCoordinateSpace:(id)a3;
- (id)firstRegionIntersectingCoordinateSpace:(id)a3 excludingRegionsWithRole:(int64_t)a4;
- (id)presentationForRole:(int64_t)a3;
- (id)regionsIntersectingCoordinateSpace:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)addRegion:(id)a3;
- (void)addRegions:(id)a3;
- (void)reset;
- (void)setCoordinateSpace:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)unionPresentation:(id)a3;
@end

@implementation CSPresentation

+ (id)presentation
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (CSPresentation)presentationWithCoordinateSpace:(id)a3
{
  id v3 = a3;
  v4 = +[CSPresentation presentation];
  [v4 setCoordinateSpace:v3];

  return (CSPresentation *)v4;
}

+ (id)presentationForProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 presentationCoordinateSpace];
  v6 = [a1 presentationWithCoordinateSpace:v5];

  [v6 unionPresentation:v4];
  v7 = [v4 coverSheetIdentifier];

  [v6 setIdentifier:v7];

  return v6;
}

- (CSPresentation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSPresentation;
  id v2 = [(CSPresentation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    regions = v2->_regions;
    v2->_regions = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addRegion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(CSPresentation *)self coordinateSpace];
    id v7 = [v4 regionForCoordinateSpace:v5];

    objc_super v6 = v7;
    if (v7)
    {
      [(NSMutableArray *)self->_regions addObject:v7];
      objc_super v6 = v7;
    }
  }
}

- (void)addRegions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CSPresentation *)self addRegion:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)unionPresentation:(id)a3
{
  id v4 = [a3 presentationRegions];
  [(CSPresentation *)self addRegions:v4];
}

- (void)reset
{
}

- (id)presentationForRole:(int64_t)a3
{
  uint64_t v5 = [(CSPresentation *)self coordinateSpace];
  uint64_t v6 = +[CSPresentation presentationWithCoordinateSpace:v5];

  uint64_t v7 = [(CSPresentation *)self identifier];
  [v6 setIdentifier:v7];

  if (a3)
  {
    uint64_t v8 = [(CSPresentation *)self regions];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__CSPresentation_presentationForRole___block_invoke;
    v11[3] = &__block_descriptor_40_e18_B16__0__CSRegion_8l;
    v11[4] = a3;
    long long v9 = objc_msgSend(v8, "bs_filter:", v11);
    [v6 addRegions:v9];
  }

  return v6;
}

BOOL __38__CSPresentation_presentationForRole___block_invoke(uint64_t a1, void *a2)
{
  return [a2 role] == *(void *)(a1 + 32);
}

- (BOOL)intersectsCoordinateSpace:(id)a3
{
  uint64_t v3 = [(CSPresentation *)self firstRegionIntersectingCoordinateSpace:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)firstRegionIntersectingCoordinateSpace:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [(CSPresentation *)self regions];
    id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 isHidden] & 1) == 0 && (objc_msgSend(v9, "intersectsCoordinateSpace:", v4))
          {
            id v6 = v9;
            goto LABEL_14;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)firstRegionIntersectingCoordinateSpace:(id)a3 excludingRegionsWithRole:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [(CSPresentation *)self regions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v12 isHidden] & 1) == 0
            && [v12 role] != a4
            && ([v12 intersectsCoordinateSpace:v6] & 1) != 0)
          {
            id v13 = v12;
            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v13 = 0;
LABEL_15:
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)regionsIntersectingCoordinateSpace:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [(CSPresentation *)self regions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v11 isHidden] & 1) == 0
            && [v11 intersectsCoordinateSpace:v4])
          {
            long long v12 = (void *)[v11 copy];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)suggestedInsetsForPreferredContentFrame:(CGRect)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __58__CSPresentation_suggestedInsetsForPreferredContentFrame___block_invoke;
  v57[3] = &__block_descriptor_64_e39_B40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  CGRect v58 = a3;
  id v4 = (unsigned int (**)(void, double, double, double, double))MEMORY[0x1D9487300](v57, a2);
  uint64_t v5 = [(CSPresentation *)self presentationForRole:2];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v10 = [v5 regions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v60 count:16];
  double v45 = height;
  double v46 = width;
  double v47 = y;
  double v44 = x;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        [v15 extent];
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        if (([v15 isHidden] & 1) == 0 && v4[2](v4, v17, v19, v21, v23))
        {
          v62.origin.CGFloat x = x;
          v62.origin.CGFloat y = y;
          v62.size.CGFloat width = width;
          v62.size.CGFloat height = height;
          v73.origin.CGFloat x = v17;
          v73.origin.CGFloat y = v19;
          v73.size.CGFloat width = v21;
          v73.size.CGFloat height = v23;
          CGRect v63 = CGRectUnion(v62, v73);
          CGFloat x = v63.origin.x;
          CGFloat y = v63.origin.y;
          CGFloat width = v63.size.width;
          CGFloat height = v63.size.height;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v12);
  }

  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.CGFloat width = width;
  v64.size.CGFloat height = height;
  double MaxY = 0.0;
  if (!CGRectIsEmpty(v64))
  {
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v65);
  }
  v24 = [(CSPresentation *)self presentationForRole:1];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v25 = [v24 regions];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v50;
    CGFloat v30 = v46;
    CGFloat v29 = v47;
    CGFloat v32 = v44;
    CGFloat v31 = v45;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * j) extent];
        double v34 = v66.origin.x;
        double v35 = v66.origin.y;
        double v36 = v66.size.width;
        double v37 = v66.size.height;
        if (CGRectGetMinY(v66) > MaxY && v4[2](v4, v34, v35, v36, v37))
        {
          v67.origin.CGFloat x = v32;
          v67.origin.CGFloat y = v29;
          v67.size.CGFloat width = v30;
          v67.size.CGFloat height = v31;
          v74.origin.CGFloat x = v34;
          v74.origin.CGFloat y = v35;
          v74.size.CGFloat width = v36;
          v74.size.CGFloat height = v37;
          CGRect v68 = CGRectUnion(v67, v74);
          CGFloat v32 = v68.origin.x;
          CGFloat v29 = v68.origin.y;
          CGFloat v30 = v68.size.width;
          CGFloat v31 = v68.size.height;
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v27);
  }
  else
  {
    CGFloat v30 = v46;
    CGFloat v29 = v47;
    CGFloat v32 = v44;
    CGFloat v31 = v45;
  }

  v69.origin.CGFloat x = v32;
  v69.origin.CGFloat y = v29;
  v69.size.CGFloat width = v30;
  v69.size.CGFloat height = v31;
  double v38 = 0.0;
  if (!CGRectIsEmpty(v69))
  {
    [(CSPresentation *)self bounds];
    double v39 = CGRectGetHeight(v70);
    v71.origin.CGFloat x = v32;
    v71.origin.CGFloat y = v29;
    v71.size.CGFloat width = v30;
    v71.size.CGFloat height = v31;
    double v38 = v39 - CGRectGetMinY(v71);
  }

  double v40 = 0.0;
  double v41 = 0.0;
  double v42 = MaxY;
  double v43 = v38;
  result.right = v41;
  result.bottom = v43;
  result.left = v40;
  result.top = v42;
  return result;
}

BOOL __58__CSPresentation_suggestedInsetsForPreferredContentFrame___block_invoke(CGRect *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a2);
  if (MinX > CGRectGetMaxX(a1[1])) {
    return 0;
  }
  v13.origin.CGFloat x = a2;
  v13.origin.CGFloat y = a3;
  v13.size.CGFloat width = a4;
  v13.size.CGFloat height = a5;
  double MaxX = CGRectGetMaxX(v13);
  return MaxX >= CGRectGetMinX(a1[1]);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CSPresentation *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if ([(CSPresentation *)v4 isMemberOfClass:objc_opt_class()] {
         && (identifier = self->_identifier,
  }
             [(CSPresentation *)v4 identifier],
             id v6 = objc_claimAutoreleasedReturnValue(),
             LODWORD(identifier) = [(NSString *)identifier isEqualToString:v6],
             v6,
             identifier))
  {
    regions = self->_regions;
    uint64_t v8 = [(CSPresentation *)v4 regions];
    char v9 = [(NSMutableArray *)regions isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(CSPresentation *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(CSPresentation *)self coordinateSpace];
  uint64_t v5 = +[CSPresentation presentationWithCoordinateSpace:v4];

  id v6 = [(CSPresentation *)self identifier];
  [v5 setIdentifier:v6];

  [v5 unionPresentation:self];
  return v5;
}

- (id)succinctDescription
{
  id v2 = [(CSPresentation *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_regions, "count"), @"regions");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(CSPresentation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(CSPresentation *)self succinctDescriptionBuilder];
  if ([(NSMutableArray *)self->_regions count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CSPresentation_descriptionBuilderWithMultilinePrefix___block_invoke;
    v7[3] = &unk_1E6AD88C0;
    id v8 = v5;
    char v9 = self;
    [v8 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];
  }

  return v5;
}

void __56__CSPresentation_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) regions];
  [v1 appendArraySection:v2 withName:@"regions" skipIfEmpty:1];
}

- (CGRect)bounds
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  [WeakRetained bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  p_coordinateSpace = &self->_coordinateSpace;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertPoint:toCoordinateSpace:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  p_coordinateSpace = &self->_coordinateSpace;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertPoint:fromCoordinateSpace:", v7, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_coordinateSpace = &self->_coordinateSpace;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertRect:toCoordinateSpace:", v9, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_coordinateSpace = &self->_coordinateSpace;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertRect:fromCoordinateSpace:", v9, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (UICoordinateSpace)coordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);

  return (UICoordinateSpace *)WeakRetained;
}

- (void)setCoordinateSpace:(id)a3
{
}

- (NSArray)regions
{
  return &self->_regions->super;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_coordinateSpace);

  objc_storeStrong((id *)&self->_regions, 0);
}

@end