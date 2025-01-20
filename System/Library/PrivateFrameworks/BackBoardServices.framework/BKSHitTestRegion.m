@interface BKSHitTestRegion
+ (BOOL)supportsSecureCoding;
- (BKSHitTestRegion)initWithCoder:(id)a3;
- (BKSHitTestRegion)initWithRect:(CGRect)a3;
- (BKSHitTestRegion)initWithRect:(CGRect)a3 exclusiveTouchSubRect:(CGRect)a4;
- (BOOL)isEqual:(id)a3;
- (CGRect)_exclusiveTouchNormalizedSubRectInReferenceSpace;
- (CGRect)exclusiveTouchNormalizedSubRect;
- (CGRect)rect;
- (NSString)description;
- (id)_initWithRect:(CGRect)a3 exclusiveTouchNormalizedSubRect:(CGRect)a4;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExclusiveTouchNormalizedSubRect:(CGRect)a3;
@end

@implementation BKSHitTestRegion

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendCGRect:", self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  id v5 = (id)objc_msgSend(v3, "appendCGRect:", self->_exclusiveTouchNormalizedSubRect.origin.x, self->_exclusiveTouchNormalizedSubRect.origin.y, self->_exclusiveTouchNormalizedSubRect.size.width, self->_exclusiveTouchNormalizedSubRect.size.height);
  unint64_t v6 = [v3 hash];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29238];
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  id v9 = a3;
  v10 = objc_msgSend(v4, "bs_valueWithCGRect:", x, y, width, height);
  [v9 encodeObject:v10 forKey:@"_rect"];

  objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", self->_exclusiveTouchNormalizedSubRect.origin.x, self->_exclusiveTouchNormalizedSubRect.origin.y, self->_exclusiveTouchNormalizedSubRect.size.width, self->_exclusiveTouchNormalizedSubRect.size.height);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v11 forKey:@"_exclusiveTouchNormalizedSubRect"];
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_exclusiveTouchNormalizedSubRectInReferenceSpace
{
  double x = self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.x;
  double y = self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.y;
  double width = self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.width;
  double height = self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BKSHitTestRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_rect"];
  objc_msgSend(v5, "bs_CGRectValue");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_exclusiveTouchNormalizedSubRect"];

  objc_msgSend(v14, "bs_CGRectValue");
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  return (BKSHitTestRegion *)-[BKSHitTestRegion _initWithRect:exclusiveTouchNormalizedSubRect:](self, "_initWithRect:exclusiveTouchNormalizedSubRect:", v7, v9, v11, v13, v16, v18, v20, v22);
}

- (BKSHitTestRegion)initWithRect:(CGRect)a3 exclusiveTouchSubRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)BKSHitTestRegion;
  double v12 = [(BKSHitTestRegion *)&v15 init];
  double v13 = v12;
  if (v12)
  {
    v12->_rect.origin.double x = v11;
    v12->_rect.origin.double y = v10;
    v12->_rect.size.double width = v9;
    v12->_rect.size.double height = v8;
    -[BKSHitTestRegion setExclusiveTouchNormalizedSubRect:](v12, "setExclusiveTouchNormalizedSubRect:", x / v9, y / v8, width / v9, height / v8);
  }
  return v13;
}

- (id)_initWithRect:(CGRect)a3 exclusiveTouchNormalizedSubRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)BKSHitTestRegion;
  double v12 = [(BKSHitTestRegion *)&v15 init];
  double v13 = v12;
  if (v12)
  {
    v12->_rect.origin.double x = v11;
    v12->_rect.origin.double y = v10;
    v12->_rect.size.double width = v9;
    v12->_rect.size.double height = v8;
    -[BKSHitTestRegion setExclusiveTouchNormalizedSubRect:](v12, "setExclusiveTouchNormalizedSubRect:", x, y, width, height);
  }
  return v13;
}

- (void)setExclusiveTouchNormalizedSubRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!CGRectEqualToRect(a3, self->_exclusiveTouchNormalizedSubRect))
  {
    if (!BSFloatGreaterThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
    {
      double v13 = objc_msgSend(NSString, "stringWithFormat:", @"invalid exclusiveTouchNormalizedSubRect x coordinate: %f - needs to be between 0 and 1", *(void *)&x);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v14 = NSStringFromSelector(a2);
        objc_super v15 = (objc_class *)objc_opt_class();
        double v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138544642;
        v30 = v14;
        __int16 v31 = 2114;
        v32 = v16;
        __int16 v33 = 2048;
        v34 = self;
        __int16 v35 = 2114;
        v36 = @"BKSHitTestRegion.m";
        __int16 v37 = 1024;
        int v38 = 61;
        __int16 v39 = 2114;
        v40 = v13;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA217A8);
    }
    if (!BSFloatGreaterThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
    {
      double v17 = objc_msgSend(NSString, "stringWithFormat:", @"invalid exclusiveTouchNormalizedSubRect y coordinate: %f - needs to be between 0 and 1", *(void *)&y);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        double v18 = NSStringFromSelector(a2);
        double v19 = (objc_class *)objc_opt_class();
        double v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138544642;
        v30 = v18;
        __int16 v31 = 2114;
        v32 = v20;
        __int16 v33 = 2048;
        v34 = self;
        __int16 v35 = 2114;
        v36 = @"BKSHitTestRegion.m";
        __int16 v37 = 1024;
        int v38 = 62;
        __int16 v39 = 2114;
        v40 = v17;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA21898);
    }
    if (!BSFloatGreaterThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
    {
      double v21 = objc_msgSend(NSString, "stringWithFormat:", @"invalid exclusiveTouchNormalizedSubRect width: %f - needs to be between 0 and 1", *(void *)&width);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        double v22 = NSStringFromSelector(a2);
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138544642;
        v30 = v22;
        __int16 v31 = 2114;
        v32 = v24;
        __int16 v33 = 2048;
        v34 = self;
        __int16 v35 = 2114;
        v36 = @"BKSHitTestRegion.m";
        __int16 v37 = 1024;
        int v38 = 63;
        __int16 v39 = 2114;
        v40 = v21;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v21 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA21988);
    }
    if (!BSFloatGreaterThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"invalid exclusiveTouchNormalizedSubRect height: %f - needs to be between 0 and 1", *(void *)&height);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v26 = NSStringFromSelector(a2);
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138544642;
        v30 = v26;
        __int16 v31 = 2114;
        v32 = v28;
        __int16 v33 = 2048;
        v34 = self;
        __int16 v35 = 2114;
        v36 = @"BKSHitTestRegion.m";
        __int16 v37 = 1024;
        int v38 = 64;
        __int16 v39 = 2114;
        v40 = v25;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA21A78);
    }
    double v9 = self->_rect.origin.y;
    double v10 = self->_rect.size.width;
    double v11 = self->_rect.size.height;
    CGFloat v12 = self->_rect.origin.x + x * v10;
    self->_exclusiveTouchNormalizedSubRect.origin.double x = x;
    self->_exclusiveTouchNormalizedSubRect.origin.double y = y;
    self->_exclusiveTouchNormalizedSubRect.size.double width = width;
    self->_exclusiveTouchNormalizedSubRect.size.double height = height;
    self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.double x = v12;
    self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.double y = v9 + y * v11;
    self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.double width = width * v10;
    self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.double height = height * v11;
  }
}

- (CGRect)exclusiveTouchNormalizedSubRect
{
  double x = self->_exclusiveTouchNormalizedSubRect.origin.x;
  double y = self->_exclusiveTouchNormalizedSubRect.origin.y;
  double width = self->_exclusiveTouchNormalizedSubRect.size.width;
  double height = self->_exclusiveTouchNormalizedSubRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = (id)objc_msgSend(v7, "appendRect:withName:", @"hitTestRegion", self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  id v5 = (id)objc_msgSend(v7, "appendRect:withName:", @"exclusiveTouchNormalizedSubRect", self->_exclusiveTouchNormalizedSubRect.origin.x, self->_exclusiveTouchNormalizedSubRect.origin.y, self->_exclusiveTouchNormalizedSubRect.size.width, self->_exclusiveTouchNormalizedSubRect.size.height);
  id v6 = (id)objc_msgSend(v7, "appendRect:withName:", @"exclusiveTouchNormalizedSubRectInReferenceSpace", self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.x, self->_exclusiveTouchNormalizedSubRectInReferenceSpace.origin.y, self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.width, self->_exclusiveTouchNormalizedSubRectInReferenceSpace.size.height);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __28__BKSHitTestRegion_isEqual___block_invoke;
  v20[3] = &unk_1E5441070;
  id v6 = v4;
  id v21 = v6;
  id v7 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v20, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  double v17 = __28__BKSHitTestRegion_isEqual___block_invoke_2;
  double v18 = &unk_1E5441070;
  id v19 = v6;
  double x = self->_exclusiveTouchNormalizedSubRect.origin.x;
  double y = self->_exclusiveTouchNormalizedSubRect.origin.y;
  double width = self->_exclusiveTouchNormalizedSubRect.size.width;
  double height = self->_exclusiveTouchNormalizedSubRect.size.height;
  id v12 = v6;
  id v13 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", &v15, x, y, width, height);
  LOBYTE(v6) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return (char)v6;
}

uint64_t __28__BKSHitTestRegion_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rect];
}

uint64_t __28__BKSHitTestRegion_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) exclusiveTouchNormalizedSubRect];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BKSHitTestRegion)initWithRect:(CGRect)a3
{
  return (BKSHitTestRegion *)-[BKSHitTestRegion _initWithRect:exclusiveTouchNormalizedSubRect:](self, "_initWithRect:exclusiveTouchNormalizedSubRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

@end