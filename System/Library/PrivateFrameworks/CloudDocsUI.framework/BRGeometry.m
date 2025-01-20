@interface BRGeometry
+ (void)initialize;
- (BOOL)hasAmbiguousLayout;
- (BOOL)isClipped;
- (BOOL)isEqualToTemplate:(id)a3 diagnostic:(id *)a4;
- (BOOL)isValidForGeometryValidation:(unint64_t)a3 offendingGeometry:(id *)a4;
- (BRGeometry)initWithCoder:(id)a3;
- (BRGeometry)initWithView:(id)a3;
- (BRGeometry)initWithView:(id)a3 rootView:(id)a4;
- (CGRect)absoluteFrame;
- (NSArray)subitems;
- (NSString)contentDescription;
- (NSString)name;
- (id)data;
- (id)description;
- (id)gatherSubviews:(id)a3;
- (id)recursiveDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsoluteFrame:(CGRect)a3;
- (void)setContentDescription:(id)a3;
- (void)setHasAmbiguousLayout:(BOOL)a3;
- (void)setIsClipped:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSubitems:(id)a3;
@end

@implementation BRGeometry

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    objc_msgSend((id)objc_opt_class(), "br_setGatherBehaviour:", 2);
    objc_msgSend(MEMORY[0x263F1CB60], "br_setGatherBehaviour:forClassesNamed:", 1, &unk_26E02D6D0);
    objc_msgSend(MEMORY[0x263F1CB60], "br_setGatherBehaviour:forClassesNamed:", 2, &unk_26E02D6E8);
    v4 = (void *)MEMORY[0x263F1CB60];
    objc_msgSend(v4, "br_setGatherBehaviour:forClassesNamed:", 3, &unk_26E02D700);
  }
}

- (BRGeometry)initWithView:(id)a3
{
  id v4 = a3;
  v5 = [(BRGeometry *)self initWithView:v4 rootView:v4];
  if (v5) {
    objc_msgSend(v4, "br_setLayerNames");
  }

  return v5;
}

- (id)gatherSubviews:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "br_gatherBehaviour") == 2)
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v5 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = objc_msgSend(v4, "subviews", 0);
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
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_opt_class(), "br_gatherBehaviour") == 3)
          {
            v12 = [(BRGeometry *)self gatherSubviews:v11];
            [v5 addObjectsFromArray:v12];
          }
          else
          {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

- (BRGeometry)initWithView:(id)a3 rootView:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BRGeometry;
  uint64_t v8 = [(BRGeometry *)&v26 init];
  if (v8)
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(BRGeometry *)v8 setName:v10];

    [v6 bounds];
    objc_msgSend(v7, "convertRect:fromView:", v6);
    -[BRGeometry setAbsoluteFrame:](v8, "setAbsoluteFrame:");
    -[BRGeometry setHasAmbiguousLayout:](v8, "setHasAmbiguousLayout:", [v6 hasAmbiguousLayout]);
    -[BRGeometry setIsClipped:](v8, "setIsClipped:", objc_msgSend(v6, "br_viewIsClipped"));
    uint64_t v11 = objc_msgSend(v6, "br_contentDescription");
    [(BRGeometry *)v8 setContentDescription:v11];

    v12 = [MEMORY[0x263EFF980] array];
    uint64_t v13 = objc_msgSend((id)objc_opt_class(), "br_gatherBehaviour");
    if ((unint64_t)(v13 - 1) >= 3)
    {
      if (v13)
      {
LABEL_16:
        [(BRGeometry *)v8 setSubitems:v12];

        goto LABEL_17;
      }
    }
    else
    {
      NSLog(&cfstr_InitializingGe.isa, v6);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v14 = [(BRGeometry *)v8 gatherSubviews:v6];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (([v19 isHidden] & 1) == 0 && objc_msgSend((id)objc_opt_class(), "br_gatherBehaviour") != 1)
          {
            v20 = [[BRGeometry alloc] initWithView:v19 rootView:v7];
            [v12 addObject:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v16);
    }

    goto LABEL_16;
  }
LABEL_17:

  return v8;
}

- (BRGeometry)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRGeometry;
  v5 = [(BRGeometry *)&v13 init];
  if (v5)
  {
    [v4 decodeCGRectForKey:@"frm"];
    -[BRGeometry setAbsoluteFrame:](v5, "setAbsoluteFrame:");
    -[BRGeometry setHasAmbiguousLayout:](v5, "setHasAmbiguousLayout:", [v4 decodeBoolForKey:@"amb"]);
    -[BRGeometry setIsClipped:](v5, "setIsClipped:", [v4 decodeBoolForKey:@"clp"]);
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sub"];
    [(BRGeometry *)v5 setSubitems:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nam"];
    [(BRGeometry *)v5 setName:v10];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cdn"];
    [(BRGeometry *)v5 setContentDescription:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(BRGeometry *)self absoluteFrame];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"frm");
  objc_msgSend(v4, "encodeBool:forKey:", -[BRGeometry hasAmbiguousLayout](self, "hasAmbiguousLayout"), @"amb");
  objc_msgSend(v4, "encodeBool:forKey:", -[BRGeometry isClipped](self, "isClipped"), @"clp");
  v5 = [(BRGeometry *)self subitems];
  [v4 encodeObject:v5 forKey:@"sub"];

  id v6 = [(BRGeometry *)self name];
  [v4 encodeObject:v6 forKey:@"nam"];

  id v7 = [(BRGeometry *)self contentDescription];
  [v4 encodeObject:v7 forKey:@"cdn"];
}

- (id)recursiveDescription
{
  id v3 = [MEMORY[0x263F089D8] string];
  id v4 = (void *)MEMORY[0x230F720E0]();
  appendDescription(self, v3, 0);

  return v3;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(BRGeometry *)self name];
  [(BRGeometry *)self absoluteFrame];
  uint64_t v6 = v5;
  [(BRGeometry *)self absoluteFrame];
  uint64_t v8 = v7;
  [(BRGeometry *)self absoluteFrame];
  uint64_t v10 = v9;
  [(BRGeometry *)self absoluteFrame];
  uint64_t v12 = v11;
  if ([(BRGeometry *)self hasAmbiguousLayout]) {
    objc_super v13 = @" - AMBIGUOUS";
  }
  else {
    objc_super v13 = &stru_26E0221C0;
  }
  if ([(BRGeometry *)self isClipped]) {
    long long v14 = @" - CLIPPED";
  }
  else {
    long long v14 = &stru_26E0221C0;
  }
  uint64_t v15 = [(BRGeometry *)self contentDescription];
  if (v15)
  {
    uint64_t v16 = [NSString stringWithFormat:@" - \"%@\"", self->_contentDescription];
    uint64_t v17 = [v3 stringWithFormat:@"%@ - {{%g, %g}, {%g, %g}}%@%@%@", v4, v6, v8, v10, v12, v13, v14, v16];
  }
  else
  {
    uint64_t v17 = [v3 stringWithFormat:@"%@ - {{%g, %g}, {%g, %g}}%@%@%@", v4, v6, v8, v10, v12, v13, v14, &stru_26E0221C0];
  }

  return v17;
}

- (BOOL)isEqualToTemplate:(id)a3 diagnostic:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F089D8] string];
  uint64_t v8 = (void *)MEMORY[0x230F720E0]();
  char appended = appendComparison(self, v6, v7, 0);
  if (a4) {
    *a4 = v7;
  }

  return appended ^ 1;
}

- (BOOL)isValidForGeometryValidation:(unint64_t)a3 offendingGeometry:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((a3 & 1) != 0 && [(BRGeometry *)self isClipped])
  {
    if (a4)
    {
LABEL_4:
      BOOL v7 = 0;
      *a4 = self;
      return v7;
    }
    return 0;
  }
  if ((a3 & 2) != 0 && [(BRGeometry *)self hasAmbiguousLayout])
  {
    if (a4) {
      goto LABEL_4;
    }
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [(BRGeometry *)self subitems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * i) isValidForGeometryValidation:a3 offendingGeometry:a4])
        {
          BOOL v7 = 0;
          goto LABEL_19;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_19:

  return v7;
}

- (id)data
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CGRect)absoluteFrame
{
  double x = self->_absoluteFrame.origin.x;
  double y = self->_absoluteFrame.origin.y;
  double width = self->_absoluteFrame.size.width;
  double height = self->_absoluteFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  self->_absoluteFrame = a3;
}

- (BOOL)hasAmbiguousLayout
{
  return self->_hasAmbiguousLayout;
}

- (void)setHasAmbiguousLayout:(BOOL)a3
{
  self->_hasAmbiguousLayout = a3;
}

- (BOOL)isClipped
{
  return self->_isClipped;
}

- (void)setIsClipped:(BOOL)a3
{
  self->_isClipped = a3;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setContentDescription:(id)a3
{
}

- (NSArray)subitems
{
  return self->_subitems;
}

- (void)setSubitems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end