@interface CSRegion
+ (id)regionForCoordinateSpace:(id)a3;
+ (id)regionForCoordinateSpace:(id)a3 withExtent:(CGRect)a4;
- (BOOL)intersectsCoordinateSpace:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isReservedForHorizontalScrolling;
- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (CGRect)extent;
- (CSRegion)initWithCoordinateSpace:(id)a3 withExtent:(CGRect)a4 role:(int64_t)a5;
- (NSString)description;
- (NSString)identifier;
- (UICoordinateSpace)coordinateSpace;
- (UICoordinateSpace)identity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)provider;
- (id)regionForCoordinateSpace:(id)a3;
- (id)role:(int64_t)a3;
- (int64_t)role;
- (unint64_t)hash;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setProvider:(id)a3;
- (void)setReservedForHorizontalScrolling:(BOOL)a3;
- (void)setRole:(int64_t)a3;
@end

@implementation CSRegion

+ (id)regionForCoordinateSpace:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc((Class)a1);
    [v4 bounds];
    v6 = objc_msgSend(v5, "initWithCoordinateSpace:withExtent:role:", v4, 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)regionForCoordinateSpace:(id)a3 withExtent:(CGRect)a4
{
  if (a3)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    id v9 = a3;
    v10 = objc_msgSend(objc_alloc((Class)a1), "initWithCoordinateSpace:withExtent:role:", v9, 0, x, y, width, height);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CSRegion)initWithCoordinateSpace:(id)a3 withExtent:(CGRect)a4 role:(int64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSRegion;
  v12 = [(CSRegion *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_role = a5;
    id v14 = objc_storeWeak((id *)&v12->_identity, v11);
    objc_storeWeak((id *)&v13->_coordinateSpace, v14);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    if (CGRectIsEmpty(v20))
    {
      CGSize v15 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v13->_extent.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v13->_extent.size = v15;
    }
    else
    {
      v13->_extent.origin.CGFloat x = x;
      v13->_extent.origin.CGFloat y = y;
      v13->_extent.size.CGFloat width = width;
      v13->_extent.size.CGFloat height = height;
    }
    uint64_t v16 = [MEMORY[0x1E4F4F718] descriptionForObject:v11];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;
  }
  return v13;
}

- (id)regionForCoordinateSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(CSRegion *)self coordinateSpace];

  if (v5 == v4)
  {
    objc_super v19 = self;
  }
  else
  {
    [(CSRegion *)self extent];
    -[CSRegion convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [(CSRegion *)self identifier];
    CGSize v15 = [(CSRegion *)self identity];
    uint64_t v16 = [(CSRegion *)self provider];
    BOOL v17 = [(CSRegion *)self isReservedForHorizontalScrolling];
    int64_t v18 = [(CSRegion *)self role];
    +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", v4, v7, v9, v11, v13);
    objc_super v19 = (CSRegion *)objc_claimAutoreleasedReturnValue();
    [(CSRegion *)v19 setRole:v18];
    [(CSRegion *)v19 setIdentifier:v14];
    [(CSRegion *)v19 setIdentity:v15];
    [(CSRegion *)v19 setProvider:v16];
    [(CSRegion *)v19 setReservedForHorizontalScrolling:v17];
  }

  return v19;
}

- (id)role:(int64_t)a3
{
  return self;
}

- (BOOL)intersectsCoordinateSpace:(id)a3
{
  id v4 = a3;
  if ([(CSRegion *)self isHidden]
    || ([(CSRegion *)self identity], id v5 = (id)objc_claimAutoreleasedReturnValue(), v5, v5 == v4)
    || CGRectIsNull(self->_extent))
  {
    BOOL v6 = 0;
  }
  else
  {
    double v8 = [MEMORY[0x1E4F42D90] mainScreen];
    double v9 = [v8 fixedCoordinateSpace];

    [v4 bounds];
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v4);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
    objc_msgSend(v9, "convertRect:fromCoordinateSpace:", WeakRetained, self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v27.origin.CGFloat x = v20;
    v27.origin.CGFloat y = v22;
    v27.size.CGFloat width = v24;
    v27.size.CGFloat height = v26;
    v28.origin.CGFloat x = v11;
    v28.origin.CGFloat y = v13;
    v28.size.CGFloat width = v15;
    v28.size.CGFloat height = v17;
    BOOL v6 = CGRectIntersectsRect(v27, v28);
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CSRegion alloc];
  id v5 = [(CSRegion *)self coordinateSpace];
  [(CSRegion *)self extent];
  double v10 = -[CSRegion initWithCoordinateSpace:withExtent:role:](v4, "initWithCoordinateSpace:withExtent:role:", v5, [(CSRegion *)self role], v6, v7, v8, v9);

  CGFloat v11 = [(CSRegion *)self identifier];
  [(CSRegion *)v10 setIdentifier:v11];

  double v12 = [(CSRegion *)self identity];
  [(CSRegion *)v10 setIdentity:v12];

  [(CSRegion *)v10 setReservedForHorizontalScrolling:[(CSRegion *)self isReservedForHorizontalScrolling]];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CSRegion *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    if (![(CSRegion *)v4 isMemberOfClass:objc_opt_class()]) {
      goto LABEL_10;
    }
    int64_t role = self->_role;
    if (role != [(CSRegion *)v4 role]) {
      goto LABEL_10;
    }
    BOOL hidden = self->_hidden;
    if (hidden != [(CSRegion *)v4 isHidden]) {
      goto LABEL_10;
    }
    [(CSRegion *)v4 extent];
    if (!BSRectEqualToRect()) {
      goto LABEL_10;
    }
    BOOL reservedForHorizontalScrolling = self->_reservedForHorizontalScrolling;
    if (reservedForHorizontalScrolling != [(CSRegion *)v4 isReservedForHorizontalScrolling])goto LABEL_10; {
    identifier = self->_identifier;
    }
    double v9 = [(CSRegion *)v4 identifier];
    LODWORD(identifier) = [(NSString *)identifier isEqualToString:v9];

    if (!identifier) {
      goto LABEL_10;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
    CGFloat v11 = [(CSRegion *)v4 coordinateSpace];
    int v12 = [WeakRetained isEqual:v11];

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_identity);
      double v14 = [(CSRegion *)v4 identity];
      char v15 = [v13 isEqual:v14];
    }
    else
    {
LABEL_10:
      char v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  return self->_role;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  unint64_t role = self->_role;
  if (role > 3) {
    double v6 = @"(unknown)";
  }
  else {
    double v6 = off_1E6ADA518[role];
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"role"];
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[CSRegion isHidden](self, "isHidden"), @"hidden", 1);
  if (!CGRectIsEmpty(self->_extent)) {
    id v9 = (id)objc_msgSend(v4, "appendRect:withName:", @"extent", self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height);
  }
  id v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[CSRegion isReservedForHorizontalScrolling](self, "isReservedForHorizontalScrolling"), @"reservedForHorizontalScrolling", 1);
  id v11 = (id)[v4 appendObject:self->_identifier withName:@"identifier" skipIfNil:1];
  int v12 = [v4 build];

  return (NSString *)v12;
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGRect)extent
{
  double x = self->_extent.origin.x;
  double y = self->_extent.origin.y;
  double width = self->_extent.size.width;
  double height = self->_extent.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_unint64_t role = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_BOOL hidden = a3;
}

- (UICoordinateSpace)coordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);

  return (UICoordinateSpace *)WeakRetained;
}

- (UICoordinateSpace)identity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identity);

  return (UICoordinateSpace *)WeakRetained;
}

- (void)setIdentity:(id)a3
{
}

- (id)provider
{
  id WeakRetained = objc_loadWeakRetained(&self->_provider);

  return WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (BOOL)isReservedForHorizontalScrolling
{
  return self->_reservedForHorizontalScrolling;
}

- (void)setReservedForHorizontalScrolling:(BOOL)a3
{
  self->_BOOL reservedForHorizontalScrolling = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_provider);
  objc_destroyWeak((id *)&self->_identity);
  objc_destroyWeak((id *)&self->_coordinateSpace);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end